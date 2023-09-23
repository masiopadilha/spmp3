unit UnTelaGerenciador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, JvToolEdit, Vcl.Mask, JvExMask,
  Vcl.Buttons, System.IniFiles, System.Win.Registry, System.ZLib, Winapi.ShellAPI;

type
  TFrmTelaGerenciador = class(TFrmTelaPaiOKCancel)
    Panel1: TPanel;
    BtnBackup: TBitBtn;
    BtnBanco: TBitBtn;
    BtnExtrair: TBitBtn;
    BtnGravar: TBitBtn;
    CBBackup: TComboBox;
    CBFrequencia: TComboBox;
    EdtBackupMySQL: TJvDirectoryEdit;
    edtDatabaseName: TEdit;
    EdtHorario: TLabeledEdit;
    EdtHostName: TEdit;
    EdtInicio: TJvDateEdit;
    EdtPorta: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnBancoClick(Sender: TObject);
    procedure BtnBackupClick(Sender: TObject);

    function Procurar(diretorio, pesquisa: string):String;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaGerenciador: TFrmTelaGerenciador;

implementation

{$R *.dfm}

uses UnDM;

function TFrmTelaGerenciador.Procurar(diretorio, pesquisa: string):String;
var
 f: TSearchRec;
 i: integer;
begin
Result := '';
 if diretorio[length(diretorio)] <> '\' then
    diretorio := diretorio+'\';

 if not DirectoryExists(diretorio) then
   exit;

 i := FindFirst(diretorio+pesquisa,faAnyFile,f);
 while (i = 0) do
   begin
     i := FindNext(f);

     if (f.Name = '.') or (f.Name='..') then
       Continue;

     if f.Attr = fadirectory then
        procurar(diretorio+f.Name, pesquisa)
     else
       begin
         Result := diretorio+f.Name;
         Exit;
       end;
   end;
end;

procedure TFrmTelaGerenciador.BtnBackupClick(Sender: TObject);
var
  LData, LHora: TDateTime;
  Ini: TIniFile;
  LSenha, BackupFile, ArqBackup: String;
  LInput, LOutput: TFileStream;
  LZip: TZCompressionStream;
begin
  Ini    :=  TIniFile.Create(EdtBackupMySQL.Text + 'spmp.ini');
  LSenha := Ini.ReadString( 'Conexao', 'Password', '');
  Ini.Free;

  if EdtBackupMySQL.Text = '' then EdtBackupMySQL.Text := ExtractFilePath(Application.ExeName) + '\Backup';

  if DirectoryExists(EdtBackupMySQL.Text) = False then
    begin
      forceDirectories(EdtBackupMySQL.Text);
    end;

  ArqBackup := Procurar(EdtBackupMySQL.Text,'*.sql');

  while ArqBackup <> '' do
    begin
      Try
        { Create the Input, Output, and Compressed streams. }
        LInput := TFileStream.Create(ArqBackup, fmOpenRead);
        LOutput := TFileStream.Create(ArqBackup + '.zip', fmCreate);

        LZip := TZCompressionStream.Create(LOutput);

        { Compress data. }
        LZip.CopyFrom(LInput, LInput.Size);

        { Free the streams. }
        LZip.Free;
        LInput.Free;
        LOutput.Free;
      Except
        Exit;
      End;
      System.SysUtils.DeleteFile(ArqBackup);
      ArqBackup := Procurar(EdtBackupMySQL.Text,'*.sql');
   end;

  Try
   LData := Date;
   LHora := Time;
   BackupFile := EdtBackupMySQL.Text+'\'+FormatDateTime('dd_mm_yyyy', LData)+'_'+FormatDateTime('hh_mm_ss', LHora)+'.sql';
   ShellExecute(0, nil, 'cmd.exe', Pchar('/c "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" -u spmpma_spmp -p spmpma_spmp --password=luca1052 --single-transaction --quick --lock-tables=false > '+BackupFile), nil, SW_MINIMIZE);
   Application.MessageBox('Backup realizado com sucesso!!!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
  Except
   Application.MessageBox('Não foi possível realizar o backup do banco de dados!', 'SPMP', MB_OK + MB_ICONERROR);
   Exit;
  End;
end;

procedure TFrmTelaGerenciador.BtnBancoClick(Sender: TObject);
var
 Mensagem: PChar;
begin
  if edtDatabaseName.Text = '' then
    begin
      edtDatabaseName.SetFocus;
      Exit;
    end;
  if EdtHostName.Text = '' then
    begin
      EdtHostName.SetFocus;
      Exit;
    end;
  if EdtPorta.Text = '' then
    begin
      EdtPorta.SetFocus;
      Exit;
    end;
  if EdtSenha.Text = '' then
    begin
      EdtSenha.SetFocus;
      Exit;
    end;

  Try
    DM.FDConnSPMP3.Params.Values['Database'] := edtDatabaseName.Text;
    DM.FDConnSPMP3.Params.Values['Server']   := EdtHostName.Text;
    DM.FDConnSPMP3.Params.Values['Port']     := EdtPorta.Text;
    DM.FDConnSPMP3.Params.Values['Password'] := EdtSenha.Text;
    DM.FDConnSPMP3.Connected := True;
    Application.MessageBox('Banco de dados conectado com suceso!!!!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
    DM.FDConnSPMP3.Connected := False;
  Except on E: Exception do
    begin
      Mensagem := PChar('Não foi possível a conexão com o banco de dados!' + #13 + 'Erro: ' + E.Message);
      Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  End;
end;

procedure TFrmTelaGerenciador.BtnGravarClick(Sender: TObject);
var
  Ini: TIniFile;
  Registro:TRegistry;
begin
  if edtDatabaseName.Text = '' then
    begin
      edtDatabaseName.SetFocus;
      Exit;
    end;
  if EdtHostName.Text = '' then
    begin
      EdtHostName.SetFocus;
      Exit;
    end;
  if EdtPorta.Text = '' then
    begin
      EdtPorta.SetFocus;
      Exit;
    end;
  if EdtSenha.Text = '' then
    begin
      EdtSenha.SetFocus;
      Exit;
    end;
  if CBBackup.ItemIndex = 1 then
    begin
      if EdtInicio.Date = 0 then
        begin
          EdtInicio.SetFocus;
          Exit;
        end;
      if EdtHorario.Text = '' then
        begin
          EdtHorario.SetFocus;
          Exit;
        end;

      Try
        StrToTime(EdtHorario.Text)
      Except
        Application.MessageBox('Horário para backup inválido!', 'SPMP', MB_OK + MB_ICONERROR);
        Exit;
      End;
    end;

  DeleteFile('C:\SPMP3\Gerenciador.exe');
  DeleteFile('C:\SPMP3\checkupdate.exe');
  DeleteFile(ExtractFilePath(Application.ExeName) + 'spmp.ini');
  Ini :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'spmp.ini');

  Ini.WriteString('Conexao', 'Database', edtDatabaseName.Text);
  Ini.WriteString('Conexao', 'Port', EdtPorta.Text);
  Ini.WriteString('Conexao', 'HostName', EdtHostName.Text);
  Ini.WriteString('Conexao', 'User_Name', 'spmpma_spmp');
  Ini.WriteString('Conexao', 'Password', DM.Crypt('C', EdtSenha.Text));
  if CBBackup.ItemIndex = 0 then
    Ini.WriteString('Backup', 'Automatico', '')
  else
  if CBBackup.ItemIndex = 1 then
    Ini.WriteString('Backup', 'Automatico', 'S')
  else
    Ini.WriteString('Backup', 'Automatico', 'N');
  Ini.WriteString('Backup', 'Inicio', EdtInicio.Text);
  Ini.WriteString('Backup', 'Hora', EdtHorario.Text);
  Ini.WriteString('Backup', 'Local', EdtBackupMySQL.Text);
  case CBFrequencia.ItemIndex of
    1: Ini.WriteInteger('Backup', 'Frequencia', 1);
    2: Ini.WriteInteger('Backup', 'Frequencia', 7);
    3: Ini.WriteInteger('Backup', 'Frequencia', 30);
  end;
  Ini.WriteString('ARQUIVOS', 'exeLocal', 'C:\SPMP3\SPMP3.exe');
  Ini.WriteString('ARQUIVOS', 'exeRemoto', '\\'+EdtHostName.Text+'\SPMP3\update\SPMP3.exe');

  Registro         := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;
  if registro.OpenKey('Software\SPMP3', true) then
    begin
      Registro.WriteString('Database', edtDatabaseName.Text);
      Registro.WriteString('Port', EdtPorta.Text);
      Registro.WriteString('HostName', EdtHostName.Text);
      Registro.WriteString('User_Name', 'spmpma_spmp');
      Registro.WriteString('Password', DM.Crypt('C', EdtSenha.Text));
      if CBBackup.ItemIndex = 0 then
        Registro.WriteString('Automatico', '')
      else
      if CBBackup.ItemIndex = 1 then
        Registro.WriteString('Automatico', 'S')
      else
        Registro.WriteString('Automatico', 'N');
      Registro.WriteString('Início', EdtInicio.Text);
      Registro.WriteString('Hora', EdtHorario.Text);
      Registro.WriteString('Local', EdtBackupMySQL.Text);
      case CBFrequencia.ItemIndex of
        1: Registro.WriteInteger('Frequencia', 1);
        2: Registro.WriteInteger('Frequencia', 7);
        3: Registro.WriteInteger('Frequencia', 30);
      end;
      Registro.WriteString('exeLocal', 'C:\SPMP3\SPMP3.exe');
      Registro.WriteString('exeRemoto', '\\'+EdtHostName.Text+'\SPMP3\update\SPMP3.exe');
    end;
  Registro.CloseKey;

  Registro         := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;
  if registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', true) then
    begin
      Registro.WriteString('SPMP3srv','C:\SPMP3\SPMP3srv.exe');
    end;
  Registro.CloseKey;

  Registro.Free;

  DM.FDatabase := Ini.ReadString( 'Conexao', 'DataBase', '');
  DM.FHost     := Ini.ReadString( 'Conexao', 'HostName', '');
  DM.FUserName := Ini.ReadString( 'Conexao', 'User_Name', '');
  DM.FPort     := Ini.ReadString('Conexao', 'Port', '');
  DM.FPassword := EdtSenha.Text;

  DM.FDConnSPMP3.Params.Values['Database']  := DM.FDatabase;
  DM.FDConnSPMP3.Params.Values['User_Name'] := DM.FUserName;
  DM.FDConnSPMP3.Params.Values['Password']  := DM.FPassword;
  DM.FDConnSPMP3.Params.Values['Server']    := DM.FHost;
  DM.FDConnSPMP3.Params.Values['Port']      := DM.FPort;

  Application.MessageBox('Dados gravados com sucesso!!', 'SPMP',MB_OK + MB_ICONINFORMATION);
end;

procedure TFrmTelaGerenciador.FormShow(Sender: TObject);
var
  Ini:  TIniFile;
begin
if FileExists(ExtractFilePath(Application.ExeName) + 'spmp.ini') then
  begin
    Ini :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'spmp.ini');
    if FileExists(Ini.FileName) = True then
      begin
        Try
          //Lê  os valores
          edtDatabaseName.Text := Ini.ReadString('Conexao', 'Database', '');

          EdtHostName.Text := Ini.ReadString('Conexao', 'HostName', '');

          EdtPorta.Text := Ini.ReadString('Conexao', 'Port', '');

          if Ini.ReadString('Backup', 'Automatico', '') = 'S' then CBBackup.ItemIndex := 1
          else
          if Ini.ReadString('Backup', 'Automatico', '') = 'N' then CBBackup.ItemIndex := 2
          else CBBackup.ItemIndex := 0;

          EdtInicio.Text := Ini.ReadString('Backup', 'Inicio', '');

          EdtHorario.Text := Ini.ReadString('Backup', 'Hora', '');

          if Ini.ReadString('Backup', 'Frequencia', '') = '1' then CBFrequencia.ItemIndex := 1
          else
          if Ini.ReadString('Backup', 'Frequencia', '') = '7' then CBFrequencia.ItemIndex := 2
          else
          if Ini.ReadString('Backup', 'Frequencia', '') = '30' then CBFrequencia.ItemIndex := 3
          else CBFrequencia.ItemIndex := 0;

          EdtBackupMySQL.Text := Ini.ReadString('Backup', 'Local', '');
        Finally
          Ini.Free;
        end;
      end;
  end;
end;

end.

unit UnTelaSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.DateUtils, Vcl.ComCtrls, FireDAC.Stan.Param, IdURI,
  IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, System.Zip, Winapi.ShellAPI;

type
  TFrmTelaSplash = class(TForm)
    Image1: TImage;
    LblRegistro: TLabel;
    LblVersao: TLabel;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

    function ResourceExists(const ResourceName: string): Boolean;

    procedure CopySingleFile(AFileName: String);
    procedure ExtractFile(AFile, APath: String);
    procedure ResourceExtract(AResourceName, APath, AFileName: String);

  public
    { Public declarations }
  end;

var
  FrmTelaSplash: TFrmTelaSplash;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaSplash.ResourceExtract(AResourceName, APath, AFileName: String);
var
  LResouce: TResourceStream;
begin
  LResouce := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
  LResouce.SaveToFile(APath+AFileName);
  FreeAndNil(LResouce);
end;

function TFrmTelaSplash.ResourceExists(const ResourceName: string): Boolean;
var
  HInstance: HMODULE;
begin
  Result := False;
  HInstance := GetModuleHandle(nil);
  if HInstance <> 0 then
  begin
    if FindResource(HInstance, PChar(ResourceName), RT_RCDATA) <> 0 then
      Result := True;
  end;
end;

procedure TFrmTelaSplash.CopySingleFile(AFileName: String);
var
  LSourceFolder: String;
  LTargetFolder: String;
begin
  LSourceFolder := ExtractFilePath(ParamStr(0))+'SPMP3';
  LTargetFolder := ExtractFilePath(ParamStr(0));
  CopyFile(PChar(LSourceFolder+'\'+AFileName), PChar(LTargetFolder+'\'+AFileName), False);
end;

procedure TFrmTelaSplash.ExtractFile(AFile, APath: String);
var
  LZipFile: TZipFile;
begin
  LZipFile := TZipFile.Create;
  LZipFile.Open(AFile, zmRead);
  LZipFile.ExtractAll(APath);
  LZipFile.Close;
  FreeAndNil(LZipFile);
end;

procedure TFrmTelaSplash.FormCreate(Sender: TObject);
var
LDiasRestantes : SmallInt;
begin
  if DM.FLicenca = 'TRIAL' then
  begin
    LDiasRestantes      := 7 - DaysBetween(DM.FDataHoraServidor, DM.FInstalacao);
    LblRegistro.Caption := IntToStr(LDiasRestantes) + ' Dias Restantes';
  end else
  begin
    LblRegistro.Caption := 'Registrado';
  end;

  //LblVersao.Caption := DM.GetVersion(Application.ExeName);
  //LblVersao.Caption := DM.FVersaoMacro + ' beta';
  LblVersao.Caption := DM.FVersaoMacro;
end;

procedure TFrmTelaSplash.Timer1Timer(Sender: TObject);
begin
AlphaBlendValue := AlphaBlendValue + 5;
if AlphaBlendValue = 255 then
  begin
    Timer1.Enabled := False;
    ProgressBar1.Visible := True;

    DM.qryFormatoCodigo.Open;

    if DM.FNomeUsuario <> 'sam_spmp' then
      begin
        DM.qryUsuarioPAcesso.Params[0].AsString := DM.FCodAcesso;
        DM.qryUsuarioPAcesso.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;

        DM.qryUsuarioPAlteracao.Params[0].AsString := DM.FCodAlteracao;
        DM.qryUsuarioPAlteracao.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;

        DM.qryUsuarioPInclusao.Params[0].AsString := DM.FCodInclusao;
        DM.qryUsuarioPInclusao.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;

        DM.qryUsuarioPExclusao.Params[0].AsString := DM.FCodExclusao;
        DM.qryUsuarioPExclusao.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;


        if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
          begin
            ProgressBar1.Position := ProgressBar1.Position + 1;
          end
        else
          ProgressBar1.Position := ProgressBar1.Position + 4;
      end;
    Close;
  end;
end;

end.

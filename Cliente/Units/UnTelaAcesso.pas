unit UnTelaAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.DateUtils, Winapi.Winsock, FireDAC.Stan.Param, Data.DB, System.UItypes,
  Vcl.Buttons;

type
  TFrmTelaAcesso = class(TForm)
    PTop: TPanel;
    Image1: TImage;
    PCentro: TPanel;
    BtnSair: TButton;
    BtnEntrar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    BtnConsultar: TButton;
    btnLicenca: TButton;
    LblVersao: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnEntrarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure btnLicencaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaAcesso: TFrmTelaAcesso;

implementation

{$R *.dfm}

uses UnTelaPrincipal, UnTelaAcessoUnidade, UnDM, UnTelaGerenciador, UnDmAlertas;

procedure TFrmTelaAcesso.BtnConsultarClick(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaGerenciador, FrmTelaGerenciador);
    FrmTelaGerenciador.ShowModal;
  Finally
    FreeAndNil(FrmTelaGerenciador);
  End;
end;

procedure TFrmTelaAcesso.BtnEntrarClick(Sender: TObject);
var
  wVersionRequested : WORD;
  wsaData : TWSAData;
  p : PHostEnt;
  s : array[0..128] of char;
  LMensagem : PChar;
  E: Exception;
  qLogin, I, LTentativa: SmallInt;
  LSenhaAtual, LNovaSenha, LNovaSenhaConfirmacao: String;
  Mensagem: PChar;
begin
if DM.FDatabase  = '' then
  begin
    Mensagem := PChar('N�o foi poss�vel a conex�o com o banco de dados!');
    Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONERROR);
    Exit;
  end;

if EdtLogin.Text = EmptyStr then
  begin
    EdtLogin.SetFocus;
    DM.MSGAguarde('', False);
    Exit;
  end;

if EdtSenha.Text = EmptyStr then
  begin
    EdtSenha.SetFocus;
    DM.MSGAguarde('', False);
    Exit;
  end;

DM.RetornaDataHoraServidor;

//Tratar chave j� expirada
if DM.LicencaExpirada =  True then
  begin
    Application.Terminate;
    Exit;
  end;

DM.MSGAguarde();

DM.qryUsuariosAtivos.Close;
DM.qryUsuariosAtivos.Open;                                         //Depois, tirar os acessos a mais da Farmace
if (DM.FNumUsuarios > 0) and (DM.qryUsuariosAtivos.RecordCount >= (DM.FNumUsuarios + 1)) then
  begin
    Application.MessageBox('Limite de conex�es simult�neas alcan�ado.', 'SPMP3', MB_OK + MB_ICONASTERISK);
    DM.MSGAguarde('', False);
    DM.qryUsuariosAtivos.Close;
    Exit;
  end;

DM.FAcessoLiberado := False;

DM.FNomeUsuario := EdtLogin.Text;
DM.FPassword := EdtSenha.Text;

//Usu�rio Adm da SAM
if DM.FNomeUsuario = 'sam_spmp' then
  begin
    if DM.FPassword <> EdtSenha.Text then //Senha de administrador SAM (mesma do banco)
      begin
        Application.MessageBox('Senha incorreta.', 'SPMP3', MB_ICONASTERISK + MB_OK);
        EdtSenha.SetFocus;
        DM.MSGAguarde('', False);
        Exit;
      end;

    DM.FCodUsuario  := 'PDR-0000';
    DM.FCodAcesso   := '0';
    DM.FCodAlteracao:= '0';
    DM.FCodExclusao := '0';
    DM.FCodInclusao := '0';
    DM.FNivelAcesso := 'ADU-00001';
    DM.FAcessoLiberado := True;

    //Descobrir IPLocal
    wVersionRequested := MAKEWORD(1, 1); WSAStartup(wVersionRequested, wsaData); GetHostName(@s, 128); p := GetHostByName(@s); WSACleanup;
    DM.FEstacao     := String(p^.h_Name);


//    DM.FCodEmpresa  := DM.qryUsuarioCODEMPRESA.AsString;
  end
else
//Usu�rio normal
  begin

    Try
      DM.qryLogin.Close;
      DM.qryLogin.Params[0].AsString := DM.FNomeUsuario;
      DM.qryLogin.Open;

      //qLogin := 0;

      //Usu�rio informado localizado
      if DM.qryLogin.IsEmpty = False then
        begin
          if (DM.Crypt('D', DM.qryLoginSENHA.AsString)) = DM.FPassword then
            begin
              if Dm.SenhaExpirada = False then
                begin

                  DM.qryLogin.Edit;
                  DM.qryLoginBLOQUEIO.AsInteger := 0;
                  DM.qryLogin.Post;

                  qLogin := DM.qryLoginBLOQUEIO.AsInteger;
                end
              else
                qLogin := -6;
            end
          else
          //usu�rio n�o identificado
          if DM.qryLoginNOME.AsString = '' then
            begin
              qLogin := -5;
            end
          else
          //Bloqueia login ap�s 5 tentativas incorretas
            begin
              DM.qryLogin.Edit;
              DM.qryLoginBLOQUEIO.AsInteger := DM.qryLoginBLOQUEIO.AsInteger + 1;
              DM.qryLogin.Post;

              qLogin := DM.qryLoginBLOQUEIO.AsInteger;
            end;
        end else
        begin
          qLogin := -5;
        end;


      DM.qryLogin.Close;

      //Usu�rio informado n�o localizado
      if (qLogin = -5) then
        begin
          Application.MessageBox('Usu�rio n�o identificado', 'SPMP3', MB_ICONASTERISK + MB_OK);
          DM.MSGAguarde('', False);
          Exit;
        end;
      //Senha Expirada
      if (qLogin = -6) then
        begin
          Application.MessageBox('Senha precisa ser alterada', 'SPMP3', MB_ICONASTERISK + MB_OK);
          DM.MSGAguarde('', False);
          Exit;
        end;

      DM.qryUsuario.Close;
      DM.qryUsuario.Params[0].AsString := DM.FNomeUsuario;
      DM.qryUsuario.Open;

      if (qLogin > 0) and (qLogin <= DM.FQtdeLoginTent) then
        begin
          MessageDlg('Login e/ou senha incorreto(s)!'+#13+IntToStr(qLogin)+'� tentativa de 5.'+#13+'Ap�s a 5� tentativa incorreta o usu�rio ser� bloqueado.', mtWarning, [mbOK], 0);
          //Application.MessageBox('Login e/ou senha incorretos!', 'SPMP3', MB_OK+MB_ICONSTOP);
          EdtLogin.SetFocus;
          DM.MSGAguarde('', False);
          Exit;
        end
      else
      if (qLogin > DM.FQtdeLoginTent) then
        begin
          MessageDlg('Login bloqueado!'+#13+'Contacte o administrador do sistema para liberar o acesso.', mtError, [mbOK], 0);
          DM.MSGAguarde('', False);
          Exit;
        end;
    Except on E: Exception do
      begin
        DM.GravaLog('Falha ao  realizar o login! ', E.ClassName, E.Message);
        Application.MessageBox('Falha ao  realizar o login!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
        DM.MSGAguarde('', False);
      end;
    End;

    //ExtractFilePath(Application.ExeName) + 'ajuda.chm'
    //HelpFile := DM.LocalExe+'Ajuda\Ajuda.chm';

    try
      //Descobrir IPLocal
      wVersionRequested := MAKEWORD(1, 1); WSAStartup(wVersionRequested, wsaData); GetHostName(@s, 128); p := GetHostByName(@s); WSACleanup;

      DM.qryAcesso.Close;
      DM.qryAcesso.Params[0].AsString := EdtLogin.Text;
      DM.qryAcesso.Open;
      if (DM.qryAcessoATIVO.AsString = 'S') and (DM.qryAcessoESTACAO.AsString <> string(p^.h_name)) then
        begin
          if MinutesBetween(DM.FDataHoraServidor, DM.qryAcessoDATAACESSO.AsDateTime) < 720 then
            begin
              LMensagem := PChar('LOGIN EM USO!!' + #13 + #13 + 'Um acesso ativo desse usu�rio foi detectado na esta��o: ' + DM.qryAcessoESTACAO.AsString);
              Application.MessageBox(LMensagem, 'SPMP3' ,MB_OK+MB_ICONERROR);
              DM.MSGAguarde('', False);
              Exit;
            end;
        end;

      if LowerCase(DM.FNomeUsuario) <> 'sam_spmp' then
        begin
//          DM.qryUsuario.Close;
//          DM.qryUsuario.Params[0].AsString := DM.FNomeUsuario;
//          DM.qryUsuario.Open;

    //      if (DateOf(DM.qryUsuarioDATAFIM.AsDateTime) > DateOf(DM.FDataHoraServidor)) and (DM.qryUsuarioTEMPORARIO.AsString = 'S') then
          if (DateOf(DM.qryUsuarioDATAFIM.AsDateTime) > 0) and (DateOf(DM.qryUsuarioDATAFIM.AsDateTime) < DateOf(DM.FDataHoraServidor)) then
            begin
              Application.MessageBox('Per�odo de acesso interrompido para esse usu�rio', 'SPMP3', MB_OK+MB_ICONSTOP);
              EdtLogin.SetFocus;
              DM.MSGAguarde('', False);
              Exit;
            end;

          if DM.VerificaPrimeiroAcesso = False then
            begin
              //Application.Terminate;
              DM.MSGAguarde('', False);
              Exit;
            end;

          DM.FAcessoLiberado := True;

          DM.qryUsuario.Edit;
          DM.qryUsuarioLOGADO.AsString       := 'S';
          DM.qryUsuarioQUEDAENERGIA.AsString := 'S';
          DM.qryUsuario.Post;


          DM.FCodUsuario  := DM.qryUsuarioCODIGO.AsString;
          DM.FNomeUsuario := DM.qryUsuarioNOME.AsString;
          DM.FCodAcesso   := DM.qryUsuarioCODPERMISSAOACESSO.AsString;
          DM.FCodAlteracao:= DM.qryUsuarioCODPERMISSAOALTERACAO.AsString;
          DM.FCodExclusao := DM.qryUsuarioCODPERMISSAOEXCLUSAO.AsString;
          DM.FCodInclusao := DM.qryUsuarioCODPERMISSAOINCLUSAO.AsString;
          DM.FNivelAcesso := DM.qryUsuarioNIVELACESSO.AsString;
          DM.FEstacao     := String(p^.h_Name);

          DM.qryUsuarioUnidades.Close;
          DM.qryUsuarioUnidades.Params[0].AsString := DM.qryUsuarioCODEMPRESAS.AsString;
          DM.qryUsuarioUnidades.Open;

          DM.qryUnidadesCorp.Close;
          DM.qryUnidadesCorp.Params[0].AsString := DM.qryUsuarioCODEMPRESAS.AsString;
          DM.qryUnidadesCorp.Open;

          if DM.qryUsuarioUnidades.RecordCount > 1 then
            begin
              try
                Application.CreateForm(TFrmTelaAcessoUnidade, FrmTelaAcessoUnidade);
                FrmTelaAcessoUnidade.ShowModal;
              finally
                FreeAndNil(FrmTelaAcessoUnidade);
                DM.FCodEmpresa  := DM.qryUnidadesCorpCODEMPRESA.AsString;
                DM.FNomeEmpresa := DM.qryUnidadesCorpEMPRESA.AsString;
                DM.FCodGrupo    := DM.qryUnidadesCorpCODGRUPO.AsString;
                DM.FNomeGrupo   := DM.qryUnidadesCorpGRUPO.AsString;
              end;
            end
           else
             begin
               DM.FCodEmpresa  := DM.qryUsuarioCODEMPRESA.AsString;
               DM.FNomeEmpresa := DM.qryUsuarioEMPRESA.AsString;
               DM.FCodGrupo    := DM.qryUsuarioCODGRUPO.AsString;
               DM.FNomeGrupo   := DM.qryUsuarioGRUPO.AsString;
             end;
          DM.qryUnidadesCorp.Close;

    //      DM.qryMovimentacaoUsuarios.Close;
    //      DM.qryMovimentacaoUsuarios.Params[0].AsString := DM.FCodEmpresa;
    //      DM.qryMovimentacaoUsuarios.Params[1].AsString := DM.FCodUsuario;
    //      DM.qryMovimentacaoUsuarios.Open;

          DM.qryAcesso.Append;
          DM.qryAcessoCODEMPRESA.AsString    := DM.FCodEmpresa;
          DM.qryAcessoUSUARIO.AsString       := DM.FNomeUsuario;
          DM.qryAcessoDATAACESSO.AsDateTime  := DM.FDataHoraServidor;
          DM.qryAcessoHORAENTRADA.AsDateTime := DM.FDataHoraServidor;
          DM.qryAcessoESTACAO.AsString       := DM.FEstacao;
          DM.qryAcessoATIVO.AsString         := 'S';
          DM.qryAcessoPERIODO.AsInteger      := 0;
          DM.qryAcesso.Post;

          if DM.qryUsuarioUnidadesTRANSFORMACAO.AsString = 'S' then DM.FEmpTransf := True
          else DM.FEmpTransf := False;

          DM.qryUsuarioUnidades.Close;


          if (DM.FNivelAcesso <> 'Administrador Corporativo') and (DM.FNivelAcesso <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
            begin
              DMAlertas.GerencOrdemServico.Enabled := False;
              DMAlertas.FechamInsp.Enabled := False;
              DMAlertas.MaodeObraServ.Enabled := False;
              DMAlertas.Auditoria.Enabled := False;
              DMAlertas.Opcoes.Enabled := False;
            end;

        end
      else
        DM.FEmpTransf := True;
    except
      on E: Exception do
      begin
        DM.GravaLog('Falha ao realizar o login. FrmTelaAcesso Linha: 361', E.ClassName, E.Message);
        Application.MessageBox('Falha ao realizar po login!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
        DM.MSGAguarde('', False);
      end;
    end;
  End;

DM.MSGAguarde('', False);
Close;
end;

procedure TFrmTelaAcesso.btnLicencaClick(Sender: TObject);
var
  LChave, LNomeEmpresa, LUsuarios, c, LChaveInformada : String;
  I : Integer;
begin
  DM.qrySAM.Open;
  DM.FNomeEmpresa := DM.qrySAMEMPRESA.AsString;

  LChave := DM.CampoInputBox('SPMP', 'Informe a chave fornecida pela SAM:');
  if LChave = EmptyStr then
    begin
      Exit;
    end
  else
    begin
      //UnFuncoesSPMP.FSenhaSystem := LChave;
      if DM.qrySAM.Locate('CHAVE', LChave, []) = True then
        begin
          Application.MessageBox('Chave j� cadastrada, informe outra chave para continuar com a ativa��o!', 'SPMP3', MB_OK + MB_ICONEXCLAMATION);
          Exit;
        end;

      LChaveInformada := LChave;
      LChave          := DM.Crypt('D', LChave);

      I := 1;
      c := Copy(LChave, 1, 1);
      while c <> '|' do
        begin
          LNomeEmpresa := LNomeEmpresa + c;
          I := I + 1;
          c := Copy(LChave, I, 1);
        end;
      c := Copy(LChave, I + 1, 1);
      //I := 1;
      while c <> '|' do
        begin
          LUsuarios := LUsuarios + c;
          I := I + 1;
          c := Copy(LChave, I + 1, 1);
        end;

      DM.FLicenca     := Copy(LChave, I + 2, Length(LChave));
      DM.FNumUsuarios := StrToInt(LUsuarios);

      DM.FInstalacao := DM.FDataHoraServidor;

      if (DM.FLicenca <> 'TRIAL') and (DM.FLicenca <> '3 MESES') and (DM.FLicenca <> '6 MESES') and (DM.FLicenca <> '1 ANO')
        and (DM.FLicenca <> '2 ANOS') and (DM.FLicenca <> '3 ANOS') and (DM.FLicenca <> '4 ANOS')
          and (DM.FLicenca <> '5 ANOS') and (DM.FLicenca <> 'ILIMITADA') then
            begin
              Application.MessageBox('Chave Inv�lida!!!', 'SPMP3', MB_OK + MB_ICONERROR);
              Application.Terminate;
            end;

      DM.RetornaDataHoraServidor;

      DM.qrySAM.Append;
      DM.qrySAMCODIGO.AsInteger    := DM.qrySAM.RecordCount + 1;
      DM.qrySAMCHAVE.AsString      := LChaveInformada;
      DM.qrySAMINSTALACAO.AsDateTime := DM.FDataHoraServidor;
      DM.qrySAMEMPRESA.AsString    := LNomeEmpresa;
      DM.qrySAMUSUARIOS.AsString   := LUsuarios;
      DM.qrySAM.Post;

      if DM.FLicenca = 'TRIAL'     then DM.FDiasRestantes := 7    - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = '3 MESES'   then DM.FDiasRestantes := 90   - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = '6 MESES'   then DM.FDiasRestantes := 180  - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = '1 ANO'     then DM.FDiasRestantes := 365  - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = '2 ANOS'    then DM.FDiasRestantes := 730  - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = '3 ANOS'    then DM.FDiasRestantes := 1095 - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = '4 ANOS'    then DM.FDiasRestantes := 7    - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = '5 ANOS'    then DM.FDiasRestantes := 1460 - DaysBetween(DM.FDataHoraServidor, DM.qrySAMINSTALACAO.AsDateTime) else
      if DM.FLicenca = 'ILIMITADA' then DM.FDiasRestantes := 36500;

      DM.FInstalacao  := DM.qrySAMINSTALACAO.AsDateTime;
    end;
end;

procedure TFrmTelaAcesso.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmTelaAcesso.FormCreate(Sender: TObject);
var
LDiasRestantes : SmallInt;
begin
if (Screen.Width < 1024) or (Screen.Height < 600) then
  begin
    Application.MessageBox('A resolu��o m�nima para execu��o do SPMP � 1024 x 600!', 'SPMP3', MB_OK + MB_ICONSTOP);
    Application.Terminate;
  end;

DM.GetVersion(Application.ExeName);
LblVersao.Caption := DM.FVersaoMacro;
end;

procedure TFrmTelaAcesso.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;


end.

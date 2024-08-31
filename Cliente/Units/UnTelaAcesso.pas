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
    Image2: TImage;
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
  LSenhaAtual, LNovaSenha, LNovaSenhaConfirmacao, Pasta: String;
  Mensagem: PChar;

begin
  if DM.FDatabase  = '' then
  begin
    Mensagem := PChar('Não foi possível a conexão com o banco de dados!');
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

  //Consultar data/hora do servidor
  DM.RetornaDataHoraServidor;

  //Consultar licença do sistema
  if DM.LicencaExpirada =  True then
  begin
    Application.Terminate;
    Exit;
  end;

  DM.MSGAguarde();

  //Consultando usuários logados no sistema
  DM.qryUsuariosAtivos.Close;
  DM.qryUsuariosAtivos.Open;
  if (DM.FNumUsuarios > 0) and (DM.qryUsuariosAtivos.RecordCount >= (DM.FNumUsuarios + 1)) then
  begin
    Application.MessageBox('Limite de conexões simultâneas alcançado.', 'SPMP3', MB_OK + MB_ICONASTERISK);
    DM.MSGAguarde('', False);
    DM.qryUsuariosAtivos.Close;
    Exit;
  end;

  DM.FAcessoLiberado := False;

  DM.FNomeUsuario := EdtLogin.Text;
  DM.FPassword := EdtSenha.Text;

  //Usuário Adm da SAM (sam_spmp)
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
    DM.FMatricula   := '';
    DM.FCodAcesso   := '0';
    DM.FCodAlteracao:= '0';
    DM.FCodExclusao := '0';
    DM.FCodInclusao := '0';
    DM.FNivelAcesso := 'ADU-00001';
    DM.FAcessoLiberado := True;

    //Descobrir IPLocal
    wVersionRequested := MAKEWORD(1, 1); WSAStartup(wVersionRequested, wsaData); GetHostName(@s, 128); p := GetHostByName(@s); WSACleanup;
    DM.FEstacao     := String(p^.h_Name);
  end else
  //Usuário normal
  begin
    Try
      //Consultando dados do usuário
      DM.qryLogin.Close;
      DM.qryLogin.Params[0].AsString := DM.FNomeUsuario;
      DM.qryLogin.Open;

      if DM.qryLoginCODIGO.IsNull = False then
      begin
        //Usuário informado localizado
        qLogin := DM.qryLoginBLOQUEIO.AsInteger;

        //Consultando a qtde de tentativas de login do usuário
        if (qLogin > DM.FQtdeLoginTent) then
        begin
          MessageDlg('Login bloqueado!'+#13+'Contacte o administrador do sistema para liberar o acesso.', mtError, [mbOK], 0);
          DM.MSGAguarde('', False);
          Exit;
        end;

        //Consultando a senha informada
        if (DM.Crypt('D', DM.qryLoginSENHA.AsString)) = DM.FPassword then
        begin
          //Usuário e senha corretos
          DM.qryLogin.Edit;
          DM.qryLoginBLOQUEIO.AsInteger := 0;
          DM.qryLogin.Post;

          qLogin := 0;

          if Dm.SenhaExpirada = True then
            qLogin := -6; //Senha expirada
        end else
        begin
          //Contabiliza as tentantivas de login incorretas, bloqueia login após 5 tentativas incorretas
          DM.qryLogin.Edit;
          DM.qryLoginBLOQUEIO.AsInteger := DM.qryLoginBLOQUEIO.AsInteger + 1;
          DM.qryLogin.Post;

          qLogin := DM.qryLoginBLOQUEIO.AsInteger;
        end;
      end else
        //Usuário informado não localizado
        qLogin := -5;


      //Validando os valores informados na variável de controle de login: 'qLogin'

      //Usuário informado não localizado
      if (qLogin = -5) then
      begin
        DM.qryLogin.Close;
        Application.MessageBox('Usuário não identificado', 'SPMP3', MB_ICONASTERISK + MB_OK);
        DM.MSGAguarde('', False);
        Exit;
      end;
      //Senha Expirada
      if (qLogin = -6) then
      begin
        DM.qryLogin.Close;
        Application.MessageBox('Senha precisa ser alterada', 'SPMP3', MB_ICONASTERISK + MB_OK);
        DM.MSGAguarde('', False);
        Exit;
      end;
      //Tentativa de login incorreta, ainda permitidas mais tentativas
      if (qLogin > 0) and (qLogin <= DM.FQtdeLoginTent) then
      begin
        DM.qryLogin.Close;
        MessageDlg('Login e/ou senha incorreto(s)!'+#13+IntToStr(qLogin)+'º tentativa de 5.'+#13+'Após a 5º tentativa incorreta o usuário será bloqueado.', mtWarning, [mbOK], 0);
        EdtLogin.SetFocus;
        DM.MSGAguarde('', False);
        Exit;
      end;
      //Tentativa de login incorreta, acesso bloqueado
      if (qLogin > DM.FQtdeLoginTent) then
      begin
        DM.qryLogin.Close;
        MessageDlg('Login bloqueado!'+#13+'Contacte o administrador do sistema para liberar o acesso.', mtError, [mbOK], 0);
        DM.MSGAguarde('', False);
        Exit;
      end;

    Except on E: Exception do
      begin
        DM.qryLogin.Close;
        DM.GravaLog('Falha ao  realizar o login! ', E.ClassName, E.Message);
        Application.MessageBox('Falha ao  realizar o login!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
        DM.MSGAguarde('', False);
        Exit;
      end;
    End;


    try
      //Descobrir IPLocal
      wVersionRequested := MAKEWORD(1, 1); WSAStartup(wVersionRequested, wsaData); GetHostName(@s, 128); p := GetHostByName(@s); WSACleanup;

      //Consultando dados do acesso do usuário, se existe acesso ativo em outra máquina
      DM.qryAcesso.Close;
      DM.qryAcesso.Params[0].AsString := EdtLogin.Text;
      DM.qryAcesso.Open;
      if (DM.qryAcessoATIVO.AsString = 'S') and (DM.qryAcessoESTACAO.AsString <> string(p^.h_name)) then
      begin
        //Se existir um acesso ativo em outra máquina com MENOS de 12 horas da data/hora de acesso, o login é bloqueado
        if MinutesBetween(DM.FDataHoraServidor, DM.qryAcessoDATAACESSO.AsDateTime) < 720 then
        begin
          LMensagem := PChar('LOGIN EM USO!!' + #13 + #13 + 'Um acesso ativo desse usuário foi detectado na estação: ' + DM.qryAcessoESTACAO.AsString);
          Application.MessageBox(LMensagem, 'SPMP3' ,MB_OK+MB_ICONERROR);
          DM.MSGAguarde('', False);
          Exit;
        end;
      end;

      if LowerCase(DM.FNomeUsuario) <> 'sam_spmp' then
      begin
        //Se for um usuário temporário e expirar o período permitido para acesso, o login é interrompido
        if (DateOf(DM.qryLoginDATAFIM.AsDateTime) > 0) and (DateOf(DM.qryLoginDATAFIM.AsDateTime) < DateOf(DM.FDataHoraServidor)) then
        begin
          Application.MessageBox('Período de acesso interrompido para esse usuário', 'SPMP3', MB_OK+MB_ICONSTOP);
          EdtLogin.SetFocus;
          DM.MSGAguarde('', False);
          Exit;
        end;

        //Se for o primeiro acesso e a senha temporária não for alterada, o login é interrompido
        if DM.VerificaPrimeiroAcesso = False then
        begin
          //Application.Terminate;
          DM.MSGAguarde('', False);
          Exit;
        end;

        DM.qryLogin.Close;

        DM.FAcessoLiberado := True;

        //Consultando todos os dados do usuário logado
        DM.qryUsuario.Close;
        DM.qryUsuario.Params[0].AsString := DM.FNomeUsuario;
        DM.qryUsuario.Open;

        DM.qryUsuario.Edit;
        DM.qryUsuarioLOGADO.AsString       := 'S';
        DM.qryUsuarioQUEDAENERGIA.AsString := 'S';
        DM.qryUsuario.Post;

        DM.FCodUsuario  := DM.qryUsuarioCODIGO.AsString;
        DM.FMatricula   := DM.qryUsuarioMATRICULA.AsString;
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

        //Se o usuário tiver acesso a mais de uma unidade
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
        end else
        begin
          DM.FCodEmpresa  := DM.qryUsuarioCODEMPRESA.AsString;
          DM.FNomeEmpresa := DM.qryUsuarioEMPRESA.AsString;
          DM.FCodGrupo    := DM.qryUsuarioCODGRUPO.AsString;
          DM.FNomeGrupo   := DM.qryUsuarioGRUPO.AsString;
        end;
        DM.qryUnidadesCorp.Close;


        //Validar se a unidade logada é uma empresa de transformação
        if DM.qryUsuarioUnidadesTRANSFORMACAO.AsString = 'S' then DM.FEmpTransf := True
        else DM.FEmpTransf := False;

        DM.qryUsuarioUnidades.Close;

        //Cadastrar um novo acesso
        DM.qryAcesso.Append;
        DM.qryAcessoCODEMPRESA.AsString    := DM.FCodEmpresa;
        DM.qryAcessoUSUARIO.AsString       := DM.FNomeUsuario;
        DM.qryAcessoESTACAO.AsString       := DM.FEstacao;
        DM.qryAcessoATIVO.AsString         := 'S';
        DM.qryAcessoPERIODO.AsInteger      := 0;
        DM.qryAcesso.Post;

        if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (DM.qryUsuarioNIVELACESSO.AsString <> 'Controlador de Manutenção')  and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
          DM.FMinutosInativo := DM.qryConfigstempomaxociosoB.AsInteger
        else
          DM.FMinutosInativo := DM.qryConfigstempomaxocioso.AsInteger;

        if (DM.FNivelAcesso <> 'Administrador Corporativo') and (DM.FNivelAcesso <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
        begin
          DMAlertas.GerencOrdemServico.Enabled := False;
          DMAlertas.FechamInsp.Enabled := False;
          DMAlertas.MaodeObraServ.Enabled := False;
          DMAlertas.Auditoria.Enabled := False;
          DMAlertas.Opcoes.Enabled := False;
        end;
      end else
        DM.FEmpTransf := True;

      //Valida se existe a pasta C:\SPMP3\Relatórios, se não, cria
      Pasta := ExtractFilePath(Application.ExeName)+'Relatórios';
      if not DirectoryExists(Pasta) then
        ForceDirectories(Pasta);

    except
      on E: Exception do
      begin
        DM.GravaLog('Falha ao realizar o login. FrmTelaAcesso Linha: 361', E.ClassName, E.Message);
        Application.MessageBox('Falha ao realizar po login!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
        DM.MSGAguarde('', False);
      end;
    end;
  end;

  try
    //Extrair o recurso .bat para atualização do sistema
    if DM.ResourceExists('updaterbat') then
      DM.ResourceExtract('updaterbat', ExtractFilePath(ParamStr(0)), '\Updater.bat');
    //Check atualização disponível
    DM.CheckApplicationVersion;
  except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao checar atualização. FrmTelaAcesso Linha: 381', E.ClassName, E.Message);
    end;
  end;

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
          Application.MessageBox('Chave já cadastrada, informe outra chave para continuar com a ativação!', 'SPMP3', MB_OK + MB_ICONEXCLAMATION);
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
              Application.MessageBox('Chave Inválida!!!', 'SPMP3', MB_OK + MB_ICONERROR);
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
begin
  if (Screen.Width < 1024) or (Screen.Height < 600) then
  begin
    Application.MessageBox('A resolução mínima para execução do SPMP é 1024 x 600!', 'SPMP3', MB_OK + MB_ICONSTOP);
    Application.Terminate;
  end;

//  LblVersao.Caption := DM.FVersaoMacro + ' beta';
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

unit UnTelaCadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, JvExMask, JvToolEdit,
  JvDBControls, Vcl.Mask, Data.DB, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param,
  Vcl.Buttons;

type
  TFrmTelaCadUsuarios = class(TFrmTelaPaiParametros)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtCodigo: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdtFuncionario: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    EdtDataFim: TJvDBDateEdit;
    Label4: TLabel;
    EdtLogin: TDBEdit;
    EdtSenha: TEdit;
    EdtConfSenha: TEdit;
    BtnFuncionario: TButton;
    EdtNivelAcesso: TDBEdit;
    BtnNivel: TButton;
    EdtMatricula: TDBEdit;
    Label12: TLabel;
    Label5: TLabel;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnFuncionarioClick(Sender: TObject);
    procedure BtnNivelClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadUsuarios: TFrmTelaCadUsuarios;

implementation

{$R *.dfm}

uses UnTelaCadFuncionarios, UnDmRelatorios, UnDM;

procedure TFrmTelaCadUsuarios.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadUsuarios.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 29;
  inherited;

end;

procedure TFrmTelaCadUsuarios.BtnFuncionarioClick(Sender: TObject);
begin
  inherited;
if DM.qryUsuarios.Active = False then Exit;
if DM.qryUsuarios.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.qryUsuarios.Edit;
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryUsuariosMATRICULA.AsString := DM.FCodCombo;
        DM.qryUsuariosFUNCIONARIO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
DM.FDataSetParam    := DM.qryUsuarios;
DM.FDataSourceParam := DM.dsUsuarios;
DM.FTela            := 'CADUSUARIOS';
DM.FTabela_auxiliar := 29;
end;

procedure TFrmTelaCadUsuarios.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 29;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBUsuarios;
end;

procedure TFrmTelaCadUsuarios.BtnNivelClick(Sender: TObject);
begin
  inherited;
if DM.qryUsuarios.Active = False then Exit;
if DM.qryUsuarios.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 28;
    DM.FNomeConsulta := 'Níveis de Acesso';
    DM.qryUsuarios.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryUsuariosCODNIVELACESSO.AsString := DM.FCodCombo;
        DM.qryUsuariosNIVELACESSO.AsString    := DM.FValorCombo;
      end;
  end;
DM.FDataSetParam    := DM.qryUsuarios;
DM.FDataSourceParam := DM.dsUsuarios;
DM.FTela            := 'CADUSUARIOS';
DM.FTabela_auxiliar := 29;
end;

procedure TFrmTelaCadUsuarios.BtnNovoClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    Application.MessageBox('Apenas Administrador de Unidade pode criar usuários.', 'SPMP3', MB_OK + MB_ICONSTOP);
    Exit;
  end;

DM.qryUsuariosTEMPORARIO.AsString    := 'N';
DM.qryUsuariosLOGADO.AsString        := 'N';
DM.qryUsuariosQUEDAENERGIA.AsString  := 'N';
DM.qryUsuariosSENHAALTERADA.AsString := 'N';
DM.qryUsuariosCODEMPRESA.AsString    := DM.FCodEmpresa;
DM.qryUsuariosCODGRUPO.AsString      := DM.FCodGrupo;

EdtCodigo.ReadOnly := False;
EdtFuncionario.SetFocus;
end;

procedure TFrmTelaCadUsuarios.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    Application.MessageBox('Apenas Administrador de Unidade pode alterar registros.', 'SPMP3', MB_OK + MB_ICONSTOP);
    Exit;
  end;

if DM.qryUsuariosCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO USUÁRIO!';
    EdtCodigo.SetFocus;
    Exit;
  end;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryUsuariosNOME.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O LOGIN DO USUÁRIO!';
    EdtLogin.SetFocus;
    Exit;
  end;

if (DM.FAlterando = False) then
  begin
    if EdtSenha.Text = EmptyStr then
      begin
        EdtSenha.SetFocus;
        PAuxiliares.Font.Color := clBlack;
        PAuxiliares.Caption := 'INFORME A SENHA DO USUÁRIO!!!';
        Exit;
      end;
    if EdtConfSenha.Text = EmptyStr then
      begin
        EdtSenha.SetFocus;
        PAuxiliares.Font.Color := clBlack;
        PAuxiliares.Caption := 'CONFIRME A SENHA DO USUÁRIO!!!';
        Exit;
      end;
    if (EdtSenha.Text <> EdtConfSenha.Text) then
      begin
        EdtSenha.SetFocus;
        PAuxiliares.Font.Color := clBlack;
        PAuxiliares.Caption := 'SENHAS NÃO CONFEREM!!!';
        Exit;
      end;

    DM.qryUsuariosSENHA.AsString := DM.Crypt('C', EdtSenha.Text);
    DM.qryUsuariosSENHAALTERADADATA.AsDateTime := DM.FDataHoraServidor;
  end
else
  begin
    if (EdtSenha.Text <> EmptyStr) and (EdtConfSenha.Text <> EmptyStr)then
      begin
        if (EdtSenha.Text <> EdtConfSenha.Text) then
          begin
            EdtSenha.SetFocus;
            PAuxiliares.Font.Color := clBlack;
            PAuxiliares.Caption := 'SENHAS NÃO CONFEREM!!!';
            Exit;
          end;

//        LSenhaAtual := DM.CampoInputBox('SPMP', 'Informe a senha atual');
//
//        if LSenhaAtual = EmptyStr then Exit;
//
//        if LSenhaAtual <> DM.Crypt('D', DM.qryUsuariosSENHA.AsString) then
//          begin
//            EdtSenha.SetFocus;
//            PAuxiliares.Font.Color := clBlack;
//            PAuxiliares.Caption := 'SENHA INCORRENTA!!!';
//            Exit;
//          end;

        DM.qryUsuariosSENHA.AsString := DM.Crypt('C', EdtSenha.Text);
        DM.qryUsuariosSENHAALTERADA.AsString := 'N';
        DM.qryUsuariosBLOQUEIO.AsInteger := 0;
      end;
  end;

DM.FTabela_auxiliar := 29;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
DM.FTabela_auxiliar := 2900;
if (DM.VerificaDuplo(EdtLogin.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtLogin.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;

if DM.qryUsuariosCODNIVELACESSO.AsString = 'CTM-00001' then
  begin
    DM.qryUsuariosCODPERMISSAOACESSO.AsInteger    := 3;
    DM.qryUsuariosCODPERMISSAOINCLUSAO.AsInteger  := 3;
    DM.qryUsuariosCODPERMISSAOALTERACAO.AsInteger := 3;
    DM.qryUsuariosCODPERMISSAOEXCLUSAO.AsInteger  := 3;
  end;
if DM.qryUsuariosCODNIVELACESSO.AsString = 'ECT-00001' then
  begin
    DM.qryUsuariosCODPERMISSAOACESSO.AsInteger    := 4;
    DM.qryUsuariosCODPERMISSAOINCLUSAO.AsInteger  := 4;
    DM.qryUsuariosCODPERMISSAOALTERACAO.AsInteger := 4;
    DM.qryUsuariosCODPERMISSAOEXCLUSAO.AsInteger  := 4;
  end;
if DM.qryUsuariosCODNIVELACESSO.AsString = 'ECT-00002' then
  begin
    DM.qryUsuariosCODPERMISSAOACESSO.AsInteger    := 5;
    DM.qryUsuariosCODPERMISSAOINCLUSAO.AsInteger  := 5;
    DM.qryUsuariosCODPERMISSAOALTERACAO.AsInteger := 5;
    DM.qryUsuariosCODPERMISSAOEXCLUSAO.AsInteger  := 5;
  end;
if DM.qryUsuariosCODNIVELACESSO.AsString = 'STB-00001' then
  begin
    DM.qryUsuariosCODPERMISSAOACESSO.AsInteger    := 6;
    DM.qryUsuariosCODPERMISSAOINCLUSAO.AsInteger  := 6;
    DM.qryUsuariosCODPERMISSAOALTERACAO.AsInteger := 6;
    DM.qryUsuariosCODPERMISSAOEXCLUSAO.AsInteger  := 6;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;
  inherited;

if (DM.qryUsuariosCODEMPRESAS.IsNull = True) or (DM.qryUsuarioUnidades.RecordCount = 0) then
  begin
   DM.qryAuxiliar.Close;
   DM.qryAuxiliar.SQL.Clear;
   DM.qryAuxiliar.SQL.Add('select codigo, nome from empresa where codigo = '+QuotedStr(DM.qryUsuariosCODEMPRESA.AsString) + ' order by nome');
   DM.qryAuxiliar.Open;

   DM.qryUsuarioUnidades.Open; DM.qryUsuarioUnidades.First;
   while not DM.qryAuxiliar.Eof = True do
     begin
       DM.qryUsuarioUnidades.Append;
       //DM.qryUsuariosEmpresasCODIGO.AsInteger        := DM.SMWebClient.GerarSequencia('USUARIOEMPRESASCAD_S');;
       DM.qryUsuarioUnidadesCODEMPRESAS.AsInteger   := DM.qryUsuariosCODEMPRESAS.AsInteger;
       DM.qryUsuarioUnidadesCODEMPRESA.AsString     := DM.qryAuxiliar.FieldByName('CODIGO').AsString;
       DM.qryUsuarioUnidadesCODNIVELACESSO.AsString := DM.qryUsuariosCODNIVELACESSO.AsString;
       DM.qryUsuarioUnidades.Post;

       DM.qryAuxiliar.Next;
     end;
  end;

EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadUsuarios.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 29;
  inherited;

end;

procedure TFrmTelaCadUsuarios.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBUsuarios;
end;

procedure TFrmTelaCadUsuarios.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
DM.FTabela_auxiliar := 29;
end;

procedure TFrmTelaCadUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryUsuarios.Close;
end;

procedure TFrmTelaCadUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryUsuarios;
DM.FDataSourceParam := DM.dsUsuarios;
DM.FTela := 'CADUSUARIOS';
end;

end.

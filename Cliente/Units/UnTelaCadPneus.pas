unit UnTelaCadPneus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvDBControls, Data.DB, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param,
  Vcl.Buttons;

type
  TFrmTelaCadPneus = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodPneu: TDBEdit;
    EdtDescricao: TDBEdit;
    Label17: TLabel;
    Label6: TLabel;
    EdtCodFabricante: TDBEdit;
    EdtDescFabricante: TDBEdit;
    BtnFabricante: TButton;
    Label19: TLabel;
    Label5: TLabel;
    EdtCodFamiliaPneu: TDBEdit;
    EdtDescFamiliaPneu: TDBEdit;
    BtnFamilia: TButton;
    Label18: TLabel;
    Label7: TLabel;
    EdtCodFornecedor: TDBEdit;
    EdtDescFornecedor: TDBEdit;
    BtnFornecedor: TButton;
    Label20: TLabel;
    PCDadosTecnicos: TPageControl;
    TSDadosTecnicos: TTabSheet;
    TSMaisInfo: TTabSheet;
    MInformacoes: TDBMemo;
    Label8: TLabel;
    EdtAquisicao: TJvDBDateEdit;
    Label9: TLabel;
    EdtPreco: TDBEdit;
    Label11: TLabel;
    CBTipo: TDBComboBox;
    Label10: TLabel;
    EdtGarantia: TJvDBDateEdit;
    Label16: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtQuantidade: TDBEdit;
    Label15: TLabel;
    CBStatus: TDBComboBox;
    Label21: TLabel;
    Campo1: TDBText;
    EdtCampo1: TDBEdit;
    Campo5: TDBText;
    EdtCampo5: TDBEdit;
    Campo9: TDBText;
    EdtCampo9: TDBEdit;
    Campo2: TDBText;
    EdtCampo2: TDBEdit;
    Campo6: TDBText;
    EdtCampo6: TDBEdit;
    Campo10: TDBText;
    EdtCampo10: TDBEdit;
    Campo3: TDBText;
    EdtCampo3: TDBEdit;
    Campo7: TDBText;
    EdtCampo7: TDBEdit;
    Campo11: TDBText;
    EdtCampo11: TDBEdit;
    Campo4: TDBText;
    EdtCampo4: TDBEdit;
    Campo8: TDBText;
    EdtCampo8: TDBEdit;
    Campo12: TDBText;
    EdtCampo12: TDBEdit;
    PFundoDadosTecnicos: TPanel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodPneuExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnFabricanteClick(Sender: TObject);
    procedure BtnFornecedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneus: TFrmTelaCadPneus;

implementation

{$R *.dfm}

uses UnTelaCadFamiliaPneus, UnTelaCadFabricantes,
  UnTelaCadFornecedores, UnTelaCadPneusIDs, UnDmRelatorios, UnDM;

procedure TFrmTelaCadPneus.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodPneu.ReadOnly := True;
DM.qryPneusDados.Cancel;
end;

procedure TFrmTelaCadPneus.BtnConsultarClick(Sender: TObject);
begin
DM.FParamAuxiliar[1] := 'DESCRICAO';
  inherited;
if DM.qryPneusCODFAMILIAPNEU.AsString <> EmptyStr then
  begin
    DM.qryFamPneus.Close;
    DM.qryFamPneus.Params[0].AsString := DM.qryPneusCODFAMILIAPNEU.AsString;
    DM.qryFamPneus.Open;

    DM.qryPneusDados.Close;
    DM.qryPneusDados.Params[0].AsString := DM.FCodEmpresa;
    DM.qryPneusDados.Params[1].AsString := DM.qryPneusCODFAMILIAPNEU.AsString;
    DM.qryPneusDados.Params[2].AsString := DM.qryPneusCODIGO.AsString;
    DM.qryPneusDados.Open;
    DM.qryPneusDados.Edit;

    if DM.qryFamPneusCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
    if DM.qryFamPneusCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
    if DM.qryFamPneusCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
    if DM.qryFamPneusCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
    if DM.qryFamPneusCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
    if DM.qryFamPneusCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
    if DM.qryFamPneusCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
    if DM.qryFamPneusCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
    if DM.qryFamPneusCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
    if DM.qryFamPneusCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
    if DM.qryFamPneusCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
    if DM.qryFamPneusCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
  end;
end;

procedure TFrmTelaCadPneus.BtnFabricanteClick(Sender: TObject);
begin
  inherited;
if DM.qryPneus.Active = False then Exit;
if DM.qryPneus.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 220;
    DM.FNomeConsulta := 'Fabricantes';
    DM.qryPneus.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPneusCODFABRICANTE.AsString := DM.FCodCombo;
        DM.qryPneusFABRICANTE.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFABRICANTES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryFabricantesCODIGO, DM.qryFormatoCodigoFABRICANTE, FrmTelaCadFabricantes) = False then exit;
      Application.CreateForm(TFrmTelaCadFabricantes, FrmTelaCadFabricantes);
      FrmTelaCadFabricantes.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFabricantes);
    End;
  end;
DM.FDataSetParam    := DM.qryPneus;
DM.FDataSourceParam := DM.dsPneus;
DM.FTabela_auxiliar := 83;
DM.FTela            := 'CADCONTROLEPNEUS';
end;

procedure TFrmTelaCadPneus.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.qryPneus.Active = False then Exit;
if DM.qryPneus.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 8000;
    DM.FNomeConsulta := 'Famílias de Pneus';
    DM.qryPneus.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPneusCODFAMILIAPNEU.AsString := DM.FCodCombo;
        DM.qryPneusFAMILIAPNEU.AsString    := DM.FValorCombo;

        DM.qryFamPneus.Close;
        DM.qryFamPneus.Params[0].AsString := DM.qryPneusCODFAMILIAPNEU.AsString;
        DM.qryFamPneus.Open;

        DM.qryPneusDados.Close;
//        DM.qryPneusDados.Params[0].AsString := DM.FCodEmpresa;
//        DM.qryPneusDados.Params[1].AsString := DM.qryPneusCODFAMILIAPNEU.AsString;
//        DM.qryPneusDados.Params[2].AsString := DM.qryPneusCODIGO.AsString;
        DM.qryPneusDados.Open;
        DM.qryPneusDados.Edit;

        if DM.qryFamPneusCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
        if DM.qryFamPneusCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
        if DM.qryFamPneusCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
        if DM.qryFamPneusCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
        if DM.qryFamPneusCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
        if DM.qryFamPneusCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
        if DM.qryFamPneusCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
        if DM.qryFamPneusCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
        if DM.qryFamPneusCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
        if DM.qryFamPneusCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
        if DM.qryFamPneusCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
        if DM.qryFamPneusCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryFamPneusCODIGO, DM.qryFormatoCodigoFAMILIAPNEUS, FrmTelaCadFamiliaPneus) = False then exit;
      Application.CreateForm(TFrmTelaCadFamiliaPneus, FrmTelaCadFamiliaPneus);
      FrmTelaCadFamiliaPneus.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFamiliaPneus);
      DM.FAlterando := False;
    End;
  end;
DM.FDataSetParam    := DM.qryPneus;
DM.FDataSourceParam := DM.dsPneus;
DM.FTabela_auxiliar := 83;
DM.FTela            := 'CADCONTROLEPNEUS';
end;

procedure TFrmTelaCadPneus.BtnFornecedorClick(Sender: TObject);
begin
  inherited;
if DM.qryPneus.Active = False then Exit;
if DM.qryPneus.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 210;
    DM.FNomeConsulta := 'Fornecedores';
    DM.qryPneus.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPneusCODFORNECEDOR.AsString := DM.FCodCombo;
        DM.qryPneusFORNECEDOR.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
     if (DM.qryUsuarioPAcessoCADFORNECEDORES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
     if DM.AplicarMascara(DM.qryFornecedoresCODIGO, DM.qryFormatoCodigoFORNECEDOR, FrmTelaCadFornecedores) = False then exit;
     Application.CreateForm(TFrmTelaCadFornecedores, FrmTelaCadFornecedores);
     FrmTelaCadFornecedores.ShowModal;
   Finally
     FreeAndNil(FrmTelaCadFornecedores);
   End;
  end;
DM.FDataSetParam    := DM.qryPneus;
DM.FDataSourceParam := DM.dsPneus;
DM.FTabela_auxiliar := 83;
DM.FTela            := 'CADCONTROLEPNEUS';
end;

procedure TFrmTelaCadPneus.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryPneusSTATUS.AsString         := 'NOVO';
DM.qryPneusCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryPneusDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryPneusDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryPneusCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryPneusCODUSUARIOALT.AsString  := DM.FCodUsuario;

EdtCodPneu.ReadOnly := False;
EdtCodPneu.SetFocus;
end;

procedure TFrmTelaCadPneus.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryPneusCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodPneu.SetFocus; Exit;
  end;
DM.FTabela_auxiliar  := 83;
DM.FParamAuxiliar[1] := 'CODIGO';
if (DM.VerificaDuplo(EdtCodPneu.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodPneu.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryPneusDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryPneusCODFAMILIAPNEU.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!'; EdtDescFamiliaPneu.SetFocus; Exit;
  end;
if DM.qryPneusCODFABRICANTE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FABRICANTE DO REGISTRO!'; EdtDescFabricante.SetFocus; Exit;
  end;
if DM.qryPneusCODFORNECEDOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FORNCEDOR DO REGISTRO!'; EdtDescFornecedor.SetFocus; Exit;
  end;
if DM.qryPneusPRECO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PREÇO DO REGISTRO!'; EdtPreco.SetFocus;
    Exit;
  end;
if DM.qryPneusQUANTIDADE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A QUANTIDADE DO REGISTRO!'; EdtQuantidade.SetFocus;
    Exit;
  end;
if DM.qryPneusTIPO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A APLICAÇÃO DO REGISTRO!'; CBTipo.SetFocus;
    Exit;
  end;
if DM.qryPneusSTATUS.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO PNEU!'; CBStatus.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodPneu.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;

DM.MSGAguarde('');

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodPneu.ReadOnly := True;

DM.qryPneusDados.Edit;
if DM.qryPneusDadosCODIGO.IsNull = True then
  begin
    DM.qryPneusDadosCODEMPRESA.AsString := DM.FCodEmpresa;
    DM.qryPneusDadosCODPNEU.AsString := DM.qryPneusCODIGO.AsString;
  end;
DM.qryPneusDadosCODFAMILIAPNEUS.AsString := DM.qryPneusCODFAMILIAPNEU.AsString;
DM.qryPneusDados.Post;
DM.qryPneusDados.Edit;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadPneus.Button1Click(Sender: TObject);
begin
  inherited;
if DM.qryPneus.IsEmpty = True then Exit;
try
  Application.CreateForm(TFrmTelaCadPneusIDs, FrmTelaCadPneusIDs);
  FrmTelaCadPneusIDs.ShowModal;
finally
  FreeAndNil(FrmTelaCadPneusIDs);
end;
end;

procedure TFrmTelaCadPneus.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBPneusGeral;
DM.FTabela_auxiliar := 83;
  inherited;

end;

procedure TFrmTelaCadPneus.EdtCodPneuExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadPneus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryPneus.Close;
DM.qryFamPneus.Close;
DM.qryPneusDados.Close;
end;

procedure TFrmTelaCadPneus.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryPneus;
DM.FDataSourceParam := DM.dsPneus;
DM.FTabela_auxiliar  := 83;
DM.FTela := 'CADCONTROLEPNEUS';
DM.qryPneusDados.Open;
DM.qryPneusDados.Edit;
end;

procedure TFrmTelaCadPneus.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBPneusIndividual;
DM.FTabela_auxiliar := 831;
  inherited;

end;

end.

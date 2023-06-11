unit UnTelaCadEquipamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, JvExMask, JvToolEdit,
  JvDBControls, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param,
  Vcl.Buttons;

type
  TFrmTelaCadEquipamentos = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodEquip: TDBEdit;
    EdtDescricao: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtCodFamiliaEquip: TDBEdit;
    EdtDescFamiliaEquip: TDBEdit;
    EdtCodFabricante: TDBEdit;
    EdtDescFabricante: TDBEdit;
    EdtCodFornecedor: TDBEdit;
    EdtDescFornecedor: TDBEdit;
    PCDadosTecnicos: TPageControl;
    TSDadosTecnicos: TTabSheet;
    Campo1: TDBText;
    Campo2: TDBText;
    Campo3: TDBText;
    Campo4: TDBText;
    Campo8: TDBText;
    Campo7: TDBText;
    Campo6: TDBText;
    Campo5: TDBText;
    Campo9: TDBText;
    Campo10: TDBText;
    Campo11: TDBText;
    EdtCampo1: TDBEdit;
    EdtCampo2: TDBEdit;
    EdtCampo3: TDBEdit;
    EdtCampo4: TDBEdit;
    EdtCampo8: TDBEdit;
    EdtCampo7: TDBEdit;
    EdtCampo6: TDBEdit;
    EdtCampo5: TDBEdit;
    EdtCampo9: TDBEdit;
    EdtCampo10: TDBEdit;
    EdtCampo11: TDBEdit;
    TSMaisInfo: TTabSheet;
    MInformacoes: TDBMemo;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdtNotaFiscal: TDBEdit;
    Label14: TLabel;
    EdtGarantia: TJvDBDateEdit;
    ChbOperando: TDBCheckBox;
    ChbReserva: TDBCheckBox;
    ChbSecundario: TDBCheckBox;
    Label15: TLabel;
    Label16: TLabel;
    BtnFamilia: TButton;
    BtnFabricante: TButton;
    BtnFornecedor: TButton;
    BtnCalendario: TButton;
    BtnClasse: TButton;
    BtnCentroCusto: TButton;
    BtnPrimario: TButton;
    BtnArea: TButton;
    BtnCelula: TButton;
    EdtCalendario: TDBEdit;
    EdtClasse: TDBEdit;
    EdtCentroCusto: TDBEdit;
    EdtPrimario: TDBEdit;
    EdtArea: TDBEdit;
    EdtCelula: TDBEdit;
    PopupMenuInspecoes: TPopupMenu;
    Manutencoes1: TMenuItem;
    Lubrificacoes1: TMenuItem;
    PontosInspecao1: TMenuItem;
    Contadores1: TMenuItem;
    Confiabilidade1: TMenuItem;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    EdtPreco: TDBEdit;
    NBLocalizacao: TNotebook;
    LblLinha: TLabel;
    Label27: TLabel;
    LblSequencia: TLabel;
    Label28: TLabel;
    EdtLinha: TDBEdit;
    BtnLinha: TButton;
    EdtSequenciaPrim: TDBEdit;
    EdtSequenciaSec: TDBEdit;
    Label29: TLabel;
    LblPrimario: TDBText;
    Label31: TLabel;
    EdtAquisicao: TJvDBDateEdit;
    EdtFuncionamento: TJvDBDateEdit;
    Campo12: TDBText;
    EdtCampo12: TDBEdit;
    PopupMenuCons: TPopupMenu;
    Codigo1: TMenuItem;
    Descricao1: TMenuItem;
    Area1: TMenuItem;
    Famlia1: TMenuItem;
    PFundoDadosTecnicos: TPanel;
    Label32: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChbSecundarioClick(Sender: TObject);
    procedure EdtCampo1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo3KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo4KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo5KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo6KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo7KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo8KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo9KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo10KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCampo11KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Manutencoes1Click(Sender: TObject);
    procedure Lubrificacoes1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure PontosInspecao1Click(Sender: TObject);
    procedure Contadores1Click(Sender: TObject);
    procedure Confiabilidade1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure EdtPosicaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodEquipExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtAreaDblClick(Sender: TObject);
    procedure EdtCelulaDblClick(Sender: TObject);
    procedure EdtLinhaDblClick(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnFabricanteClick(Sender: TObject);
    procedure BtnFornecedorClick(Sender: TObject);
    procedure BtnCalendarioClick(Sender: TObject);
    procedure BtnClasseClick(Sender: TObject);
    procedure BtnCentroCustoClick(Sender: TObject);
    procedure BtnAreaClick(Sender: TObject);
    procedure BtnCelulaClick(Sender: TObject);
    procedure BtnLinhaClick(Sender: TObject);
    procedure BtnPrimarioClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
    procedure BtnImagemClick(Sender: TObject);
    procedure Area1Click(Sender: TObject);
    procedure Famlia1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentos: TFrmTelaCadEquipamentos;
  LSequenciaAtual, LSequenciaNova: SmallInt;

implementation

{$R *.dfm}

uses UnTelaCadManutProgEquip, UnTelaCadLubrifictProgEquip,
  UnTelaCadEquipamentosPecas, UnTelaCadEquipamentosEsp,
  UnTelaCadEquipamentosArqTec, UnTelaCadNavegacaoGrafica,
  UnTelaCadEquipamentosHist, UnTelaCadEquipamentosContadores,
  UnTelaCadEquipamentosPontosInsp, UnTelaCadEquipamentosConf,
  UnTelaCadFamiliaEquipamento, UnTelaCadFabricantes, UnTelaCadFornecedores,
  UnTelaCadCalendEquip, UnTelaCadClasses, UnTelaCadCentroCusto, UnTelaCadAreas,
  UnDmRelatorios, UnTelaCadEquipamentosImagens, UnDM;

procedure TFrmTelaCadEquipamentos.Area1Click(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 150;
    DM.FNomeConsulta := 'Áreas';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        DM.FParamAuxiliar[2] := 'CODLOCALIZACAO';
        DM.FCodArea          :=  DM.FCodCombo;
        BtnConsultar.OnClick(Sender);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.BtnAreaClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 150;
    DM.FNomeConsulta := 'Áreas';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODLOCALIZACAO.AsString := DM.FCodCombo;
        DM.qryEquipamentosAREA.AsString           := DM.FValorCombo;
        DM.qryEquipamentosCELULA.Clear;
        DM.qryEquipamentosLINHA.Clear;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADAREAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryAreasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.AplicarMascara(DM.qryCelulasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.FEmpTransf = True then
        begin
          if DM.AplicarMascara(DM.qryLinhasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
        end;
      Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
      FrmTelaCadAreas.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadAreas);
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnCalendarioClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 240;
    DM.FNomeConsulta := 'Calendários de Equipamentos';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODCALENDARIO.AsString   := DM.FCodCombo;
        DM.qryEquipamentosCALENDARIOEQUIP.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCALENDEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryCalendEquipCODIGO, DM.qryFormatoCodigoCALENDARIOEQUIP, FrmTelaCadCalendEquip) = False then exit;
      Application.CreateForm(TFrmTelaCadCalendEquip, FrmTelaCadCalendEquip);
      FrmTelaCadCalendEquip.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCalendEquip);
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodEquip.ReadOnly := True;
if DM.qryEquipamentosDados.Active = True then
  DM.qryEquipamentosDados.Cancel;

if DM.qryEquipamentosCODFAMILIAEQUIP.AsString = EmptyStr then
  begin
    DM.qryFamEquipamento.Close;
    DM.qryEquipamentosDados.Close;
    DM.qryEquipamentosDadosR.Close;
    Exit;
  end;

DM.qryFamEquipamento.Close;
DM.qryFamEquipamento.Params[0].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
DM.qryFamEquipamento.Open;

DM.qryEquipamentosDados.Edit;

if DM.qryFamEquipamentoCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
if DM.qryFamEquipamentoCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
if DM.qryFamEquipamentoCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
if DM.qryFamEquipamentoCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
if DM.qryFamEquipamentoCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
if DM.qryFamEquipamentoCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
if DM.qryFamEquipamentoCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
if DM.qryFamEquipamentoCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
if DM.qryFamEquipamentoCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
if DM.qryFamEquipamentoCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
if DM.qryFamEquipamentoCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
end;

procedure TFrmTelaCadEquipamentos.BtnCelulaClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    if DM.qryEquipamentosCODLOCALIZACAO.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clBlack;
        PAuxiliares.Caption := 'NENHUMA ÁREA SELECIONADA!!!';
        Exit;
      end;
    DM.FParamAuxiliar[1] := DM.qryEquipamentosCODLOCALIZACAO.AsString;
    DM.FTabela_auxiliar := 160;
    DM.FNomeConsulta := 'Células';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODCELULA.AsString := DM.FCodCombo;
        DM.qryEquipamentosCELULA.AsString    := DM.FValorCombo;
        DM.qryEquipamentosCODLINHA.AsString  := EmptyStr;
        DM.qryEquipamentosLINHA.AsString     := EmptyStr;
        DM.qryEquipamentosSEQUENCIA.AsString := EmptyStr;
        DM.qryEquipamentosSEQUENCIA.AsString := EmptyStr;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADAREAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryAreasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.AplicarMascara(DM.qryCelulasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.FEmpTransf = True then
        begin
          if DM.AplicarMascara(DM.qryLinhasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
        end;
      Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
      FrmTelaCadAreas.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadAreas);
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnCentroCustoClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 400;
    DM.FNomeConsulta := 'Centros de Custos';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODCENTROCUSTO.AsString := DM.FCodCombo;
        DM.qryEquipamentosCENTROCUSTO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCENTROCUSTO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoCENTROCUSTO, FrmTelaCadCentroCusto) = False then exit;
      Application.CreateForm(TFrmTelaCadCentroCusto, FrmTelaCadCentroCusto);
      FrmTelaCadCentroCusto.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCentroCusto);
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnClasseClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 500;
    DM.FNomeConsulta := 'Classes de Equipamentos';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODCLASSE.AsString := DM.FCodCombo;
        DM.qryEquipamentosCLASSE.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCLASSES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryClassesCODIGO, DM.qryFormatoCodigoCLASSES, FrmTelaCadClasses) = False then exit;
      Application.CreateForm(TFrmTelaCadClasses, FrmTelaCadClasses);
      FrmTelaCadClasses.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadClasses);
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnConsultarClick(Sender: TObject);
begin
if DM.FParamAuxiliar[1] = '' then
  begin
    PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
    Exit;
  end
else
DM.FTabela_auxiliar := 25;
  inherited;
if DM.qryEquipamentosCODFAMILIAEQUIP.AsString <> EmptyStr then
  begin
    if DM.qryEquipamentosCODEQUIPAMENTOPAI.AsString <> EmptyStr then
      begin
        EdtPrimario.Visible := True;
        BtnPrimario.Visible := True;
      end
    else
      begin
        EdtPrimario.Visible := False;
        BtnPrimario.Visible := False;
      end;

    DM.qryFamEquipamento.Close;
    DM.qryFamEquipamento.Params[0].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
    DM.qryFamEquipamento.Open;

    if DM.qryFamEquipamentoCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
    if DM.qryFamEquipamentoCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
    if DM.qryFamEquipamentoCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
    if DM.qryFamEquipamentoCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
    if DM.qryFamEquipamentoCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
    if DM.qryFamEquipamentoCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
    if DM.qryFamEquipamentoCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
    if DM.qryFamEquipamentoCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
    if DM.qryFamEquipamentoCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
    if DM.qryFamEquipamentoCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
    if DM.qryFamEquipamentoCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
    if DM.qryFamEquipamentoCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;

    LSequenciaAtual := DM.qryEquipamentosSEQUENCIA.AsInteger;

    DM.qryEquipamentosDados.Close;
    DM.qryEquipamentosDados.Params[0].AsString := DM.FCodEmpresa;
    DM.qryEquipamentosDados.Params[1].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
    DM.qryEquipamentosDados.Params[2].AsString := DM.qryEquipamentosCODIGO.AsString;
    DM.qryEquipamentosDados.Open;
    DM.qryEquipamentosDados.Edit;

    DM.qryEquipamentosDadosR.Close;
    DM.qryEquipamentosDadosR.Params[0].AsString := DM.FCodEmpresa;
    DM.qryEquipamentosDadosR.Params[1].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
    DM.qryEquipamentosDadosR.Params[2].AsString := DM.qryEquipamentosCODIGO.AsString;
    DM.qryEquipamentosDadosR.Open;
    DM.qryEquipamentosDadosR.Edit;
  end;

if DM.FEmpTransf = True then
  begin
    if DM.qryEquipamentosSECUNDARIO.AsString = 'N' then
      begin
        NBLocalizacao.PageIndex := 0;
        //LblPrimario.Visible := False;
      end
    else
    if DM.qryEquipamentosSECUNDARIO.AsString = 'S' then
      begin
        NBLocalizacao.PageIndex := 1;
        //LblPrimario.Visible := True;
      end;
  end;
DM.FParamAuxiliar[1] := '';
end;

procedure TFrmTelaCadEquipamentos.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryFamEquipamento.Close;
DM.qryFamEquipamento.Open;
DM.qryEquipamentosDados.Close;
DM.qryEquipamentosDadosR.Close;
DM.qryEquipamentosDados.Open;
DM.qryEquipamentosDadosR.Open;
end;

procedure TFrmTelaCadEquipamentos.BtnFabricanteClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 220;
    DM.FNomeConsulta := 'Fabricantes';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODFABRICANTE.AsString := DM.FCodCombo;
        DM.qryEquipamentosFABRICANTE.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFABRICANTES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryFabricantesCODIGO, DM.qryFormatoCodigoFABRICANTE, FrmTelaCadFabricantes) = False then exit;
      Application.CreateForm(TFrmTelaCadFabricantes, FrmTelaCadFabricantes);
      FrmTelaCadFabricantes.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFabricantes);
      DM.FDataSetParam    := DM.qryEquipamentos;
      DM.FDataSourceParam := DM.dsEquipamentos;
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.FAlterando = True then Exit;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODFAMILIAEQUIP.AsString := DM.FCodCombo;
        DM.qryEquipamentosFAMILIAEQUIP.AsString    := DM.FValorCombo;

        DM.qryFamEquipamento.Close;
        DM.qryFamEquipamento.Params[0].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
        DM.qryFamEquipamento.Open;

        DM.qryEquipamentosDados.Close;
        DM.qryEquipamentosDados.Params[0].AsString := DM.FCodEmpresa;
        DM.qryEquipamentosDados.Params[1].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
        DM.qryEquipamentosDados.Params[2].AsString := DM.qryEquipamentosCODIGO.AsString;
        DM.qryEquipamentosDados.Open;
        DM.qryEquipamentosDados.Edit;

        DM.qryEquipamentosDadosR.Close;
        DM.qryEquipamentosDadosR.Params[0].AsString := DM.FCodEmpresa;
        DM.qryEquipamentosDadosR.Params[1].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
        DM.qryEquipamentosDadosR.Params[2].AsString := DM.qryEquipamentosCODIGO.AsString;
        DM.qryEquipamentosDadosR.Open;
        DM.qryEquipamentosDadosR.Edit;

        if DM.qryFamEquipamentoCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
        if DM.qryFamEquipamentoCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
        if DM.qryFamEquipamentoCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
        if DM.qryFamEquipamentoCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
        if DM.qryFamEquipamentoCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
        if DM.qryFamEquipamentoCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
        if DM.qryFamEquipamentoCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
        if DM.qryFamEquipamentoCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
        if DM.qryFamEquipamentoCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
        if DM.qryFamEquipamentoCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
        if DM.qryFamEquipamentoCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
        if DM.qryFamEquipamentoCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFAMILIAEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryFamEquipamentoCODIGO, DM.qryFormatoCodigoFAMILIAEQUIPAMENTO, FrmTelaCadFamiliaEquipamento) = False then exit;
      Application.CreateForm(TFrmTelaCadFamiliaEquipamento, FrmTelaCadFamiliaEquipamento);
      FrmTelaCadFamiliaEquipamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFamiliaEquipamento);
      DM.FAlterando := False;
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnFornecedorClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    if DM.qryEquipamentos.Active = False then Exit;
    if DM.qryEquipamentos.IsEmpty = True then Exit;
    DM.FTabela_auxiliar := 210;
    DM.FNomeConsulta := 'Fornecedores';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODFORNECEDOR.AsString := DM.FCodCombo;
        DM.qryEquipamentosFORNECEDOR.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFORNECEDORES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryFornecedoresCODIGO, DM.qryFormatoCodigoFORNECEDOR, FrmTelaCadFornecedores) = False then exit;
      Application.CreateForm(TFrmTelaCadFornecedores, FrmTelaCadFornecedores);
      FrmTelaCadFornecedores.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFornecedores);
      DM.FDataSetParam    := DM.qryEquipamentos;
      DM.FDataSourceParam := DM.dsEquipamentos;
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnImagemClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.IsEmpty = True then Exit;

  Try
    Application.CreateForm(TFrmTelaCadEquipamentosImagens, FrmTelaCadEquipamentosImagens);
    FrmTelaCadEquipamentosImagens.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosImagens);
  End;
end;

procedure TFrmTelaCadEquipamentos.BtnLinhaClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    if DM.qryEquipamentosCODLOCALIZACAO.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clBlack;
        PAuxiliares.Caption := 'NENHUMA ÁREA SELECIONADA!!!';
        Exit;
      end;
    if DM.qryEquipamentosCODCELULA.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clBlack;
        PAuxiliares.Caption := 'NENHUMA CÉLULA SELECIONADA!!!';
        Exit;
      end;
    DM.FParamAuxiliar[1] := DM.qryEquipamentosCODLOCALIZACAO.AsString;
    DM.FParamAuxiliar[2] := DM.qryEquipamentosCODCELULA.AsString;
    DM.FTabela_auxiliar := 170;
    DM.FNomeConsulta := 'Linhas';
    DM.qryEquipamentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryEquipamentosCODLINHA.AsString     := DM.FCodCombo;
        DM.qryEquipamentosLINHA.AsString        := DM.FValorCombo;
        DM.qryEquipamentosSEQUENCIA.AsString    := EmptyStr;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADAREAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryAreasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.AplicarMascara(DM.qryCelulasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.FEmpTransf = True then
        begin
          if DM.AplicarMascara(DM.qryLinhasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
        end;
      Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
      FrmTelaCadAreas.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadAreas);
    End;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryEquipamentosCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryEquipamentosOPERANDO.AsString        := 'S';
DM.qryEquipamentosRESERVA.AsString         := 'N';
DM.qryEquipamentosSECUNDARIO.AsString      := 'N';
DM.qryEquipamentosCALCULARCONF.AsString    := 'N';
DM.qryEquipamentosCALCULADACONF.AsString   := 'N';

EdtCodEquip.ReadOnly := False;
EdtCodEquip.SetFocus;

LSequenciaAtual := 0;

DM.qryEquipamentosDados.Close;
DM.qryEquipamentosDadosR.Close;
end;

procedure TFrmTelaCadEquipamentos.BtnPrimarioClick(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentos.Active = False then Exit;
if DM.qryEquipamentos.IsEmpty = True then Exit;
if EdtArea.Text = EmptyStr then
  begin
    EdtArea.SetFocus;
    Exit;
  end;
if EdtCelula.Text = EmptyStr then
  begin
    EdtCelula.SetFocus;
    Exit;
  end;

DM.FTabela_auxiliar := 31;
DM.FNomeConsulta := 'Equipamento Primário';
DM.qryEquipamentos.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryEquipamentosCODEQUIPAMENTOPAI.AsString := DM.FCodCombo;
  end;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.BtnSalvarClick(Sender: TObject);
var
 randomNum: Integer;
begin
//inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryEquipamentosCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodEquip.SetFocus; Exit;
  end;
DM.FTabela_auxiliar := 25;
if (DM.VerificaDuplo(EdtCodEquip.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodEquip.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryEquipamentosDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryEquipamentosCODFAMILIAEQUIP.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!'; EdtDescFamiliaEquip.SetFocus; Exit;
  end;
if DM.qryEquipamentosCODFABRICANTE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FABRICANTE DO REGISTRO!'; EdtDescFabricante.SetFocus; Exit;
  end;
if DM.qryEquipamentosCODFORNECEDOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FORNCEDOR DO REGISTRO!'; EdtDescFornecedor.SetFocus; Exit;
  end;
if DM.qryEquipamentosCODCALENDARIO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CALENDÁRIO DO REGISTRO!'; EdtCalendario.SetFocus; Exit;
  end;
if DM.qryEquipamentosCODCLASSE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CLASSE DO REGISTRO!'; EdtClasse.SetFocus; Exit;
  end;
if DM.qryEquipamentosCODCENTROCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CENTRO DE CUSTO DO REGISTRO!'; EdtCentroCusto.SetFocus;
    Exit;
  end;
if DM.qryEquipamentosDATAINIFUNC.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DATA DE FUNCIONAMENTO DO REGISTRO!'; EdtFuncionamento.SetFocus; Exit;
  end;

LSequenciaNova  := DM.qryEquipamentosSEQUENCIA.AsInteger;

if DM.FEmpTransf = True then //Se for empresa de transformação
  begin
    if DM.qryEquipamentosOPERANDO.AsString = 'S' then //Se estiver operando
      begin
        if DM.qryEquipamentosSECUNDARIO.AsString = 'N' then //Se for primário
          begin
            if DM.qryEquipamentosCODLOCALIZACAO.IsNull = True then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A ÁREA DO REGISTRO!'; EdtArea.SetFocus; Exit;
              end;
            if DM.qryEquipamentosCODCELULA.AsString = EmptyStr then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CÉLULA DO REGISTRO!'; EdtCelula.SetFocus; Exit;
              end;
            if (DM.qryEquipamentosCODLINHA.AsString = EmptyStr) then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A LINHA DO REGISTRO!'; EdtLinha.SetFocus; Exit;
              end;
            if (DM.qryEquipamentosSEQUENCIA.AsString = EmptyStr) then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A SEQUÊNCIA DO REGISTRO!'; EdtSequenciaPrim.SetFocus; Exit;
              end;

            if LSequenciaNova <> LSequenciaAtual then
              begin
                DM.qryEquipamentosChecaLocal.Close;
                DM.qryEquipamentosChecaLocal.Params[0].AsString := DM.qryEquipamentosCODLOCALIZACAO.AsString;
                DM.qryEquipamentosChecaLocal.Params[1].AsString := DM.qryEquipamentosCODCELULA.AsString;
                DM.qryEquipamentosChecaLocal.Params[2].AsString := DM.qryEquipamentosCODLINHA.AsString;
                DM.qryEquipamentosChecaLocal.Params[3].AsString := DM.qryEquipamentosSEQUENCIA.AsString;
                DM.qryEquipamentosChecaLocal.Open;
                if DM.qryEquipamentosChecaLocalCODIGO.AsString <> EmptyStr then
                  begin
                    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'JÁ EXISTE UM EQUIPAMENTO NESSA POSIÇÃO: '+ QuotedStr(DM.qryEquipamentosChecaLocalCODIGO.AsString); EdtSequenciaPrim.SetFocus; Exit;
                  end;
                DM.qryEquipamentosChecaLocal.Close;
              end;
            LSequenciaAtual := DM.qryEquipamentosSEQUENCIA.AsInteger;
          end
        else //Se for secundário
          begin
            if DM.qryEquipamentosCODLOCALIZACAO.IsNull = True then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A ÁREA DO REGISTRO!'; EdtArea.SetFocus; Exit;
              end;
            if DM.qryEquipamentosCODCELULA.AsString = EmptyStr then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CÉLULA DO REGISTRO!'; EdtCelula.SetFocus; Exit;
              end;
            if (DM.qryEquipamentosSEQUENCIA.AsString = EmptyStr) then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A SEQUÊNCIA DO REGISTRO!'; EdtSequenciaSec.SetFocus; Exit;
              end;

            if LSequenciaNova <> LSequenciaAtual then
              begin
                DM.qryEquipamentosChecaLocal.Close;
                DM.qryEquipamentosChecaLocal.Params[0].AsString := DM.qryEquipamentosCODLOCALIZACAO.AsString;
                DM.qryEquipamentosChecaLocal.Params[1].AsString := DM.qryEquipamentosCODCELULA.AsString;
                DM.qryEquipamentosChecaLocal.Params[2].AsString := EmptyStr;
                DM.qryEquipamentosChecaLocal.Params[3].AsString := DM.qryEquipamentosSEQUENCIA.AsString;
                DM.qryEquipamentosChecaLocal.Open;
                if DM.qryEquipamentosChecaLocalCODIGO.AsString <> EmptyStr then
                  begin
                    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'JÁ EXISTE UM EQUIPAMENTO NESSA POSIÇÃO: '+ QuotedStr(DM.qryEquipamentosChecaLocalCODIGO.AsString); EdtSequenciaSec.SetFocus; Exit;
                  end;
                DM.qryEquipamentosChecaLocal.Close;
              end;

            DM.qryEquipamentosCODLINHA.Clear;
            LSequenciaAtual := DM.qryEquipamentosSEQUENCIA.AsInteger;
          end;
      end
    else
      begin
        DM.qryEquipamentosCODLOCALIZACAO.Clear;
        DM.qryEquipamentosCODCELULA.Clear;
        DM.qryEquipamentosCODLINHA.Clear;
        DM.qryEquipamentosSEQUENCIA.Clear;

        DM.qryEquipamentosAREA.Clear;
        DM.qryEquipamentosCELULA.Clear;
        DM.qryEquipamentosLINHA.Clear;
      end;
  end
else
  begin
    if DM.qryEquipamentosOPERANDO.AsString = 'S' then //Se estiver operando
      begin
        if DM.qryEquipamentosSECUNDARIO.AsString = 'N' then //Se for primário
          begin
            if DM.qryEquipamentosCODLOCALIZACAO.IsNull = True then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A ÁREA DO REGISTRO!'; EdtArea.SetFocus; Exit;
              end;
            if DM.qryEquipamentosCODCELULA.AsString = EmptyStr then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CÉLULA DO REGISTRO!'; EdtCelula.SetFocus; Exit;
              end;
          end
        else //Se for secundário
          begin
            if DM.qryEquipamentosCODLOCALIZACAO.IsNull = True then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A ÁREA DO REGISTRO!'; EdtArea.SetFocus; Exit;
              end;
            if DM.qryEquipamentosCODCELULA.AsString = EmptyStr then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CÉLULA DO REGISTRO!'; EdtCelula.SetFocus; Exit;
              end;
            if (DM.qryEquipamentosSEQUENCIA.AsString = EmptyStr) then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A SEQUÊNCIA DO REGISTRO!'; EdtSequenciaSec.SetFocus; Exit;
              end;

            if LSequenciaNova <> LSequenciaAtual then
              begin
                DM.qryEquipamentosChecaLocal.Close;
                DM.qryEquipamentosChecaLocal.Params[0].AsString := DM.qryEquipamentosCODLOCALIZACAO.AsString;
                DM.qryEquipamentosChecaLocal.Params[1].AsString := DM.qryEquipamentosCODCELULA.AsString;
                DM.qryEquipamentosChecaLocal.Params[2].AsString := EmptyStr;
                DM.qryEquipamentosChecaLocal.Params[3].AsString := DM.qryEquipamentosSEQUENCIA.AsString;
                DM.qryEquipamentosChecaLocal.Open;
                if DM.qryEquipamentosChecaLocalCODIGO.AsString <> EmptyStr then
                  begin
                    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'JÁ EXISTE UM EQUIPAMENTO NESSA POSIÇÃO: '+ QuotedStr(DM.qryEquipamentosChecaLocalCODIGO.AsString); EdtSequenciaSec.SetFocus; Exit;
                  end;
                DM.qryEquipamentosChecaLocal.Close;
              end;

            DM.qryEquipamentosCODLINHA.Clear;
            LSequenciaAtual := DM.qryEquipamentosSEQUENCIA.AsInteger;
          end;
      end
    else
      begin
        DM.qryEquipamentosCODLOCALIZACAO.Clear;
        DM.qryEquipamentosCODCELULA.Clear;
        DM.qryEquipamentosCODLINHA.Clear;
        DM.qryEquipamentosSEQUENCIA.Clear;

        DM.qryEquipamentosAREA.Clear;
        DM.qryEquipamentosCELULA.Clear;
        DM.qryEquipamentosLINHA.Clear;
      end;
  end;

DM.MSGAguarde('');

DM.FDataSetParam.Params[0].AsString := EdtCodEquip.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;

// Clonar inspeções dos equipamentos de mesma família
if DM.FAlterando = False then
begin
  DM.qryClonarManut.Close;
  DM.qryClonarManut.Params[0].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
  DM.qryClonarManut.Params[1].AsString := DM.FCodEmpresa;
  DM.qryClonarManut.Open; DM.qryClonarManut.First;

  if DM.qryClonarManut.RecordCount > 0 then
    DM.qryEquipamentos.Post;

  DM.qryAuxiliar2.Close;
  DM.qryAuxiliar2.SQL.Clear;
  DM.qryAuxiliar2.SQL.Text := 'SELECT * FROM manutprogequipamento WHERE codigo = -1';
  DM.qryAuxiliar2.Open;

  while not DM.qryClonarManut.Eof = True do
  begin
    DM.qryAuxiliar2.Append;
    Randomize;
    randomNum := Random(9000) + 1000;

    DM.FTabela_auxiliar  := 32;
    while DM.VerificaDuplo('MPC.' + IntToStr(randomNum)) = True do
      begin
        Randomize;
        randomNum := Random(9000) + 1000;
      end;

    DM.qryAuxiliar2.FieldByName('CODIGO').AsString               := 'MPC.' + IntToStr(randomNum);
    DM.qryAuxiliar2.FieldByName('CODEMPRESA').AsString           := DM.FCodEmpresa;
    DM.qryAuxiliar2.FieldByName('CODEQUIPAMENTO').AsString       := DM.qryEquipamentosCODIGO.AsString;
    DM.qryAuxiliar2.FieldByName('CODMANUTPROGFAMEQUIP').AsString := DM.qryClonarManutCODMANUTPROGFAMEQUIP.AsString;
    DM.qryAuxiliar2.FieldByName('DESCRICAO').AsString            := DM.qryClonarManutDESCRICAO.AsString;
    DM.qryAuxiliar2.FieldByName('CRITICIDADE').AsString          := DM.qryClonarManutCRITICIDADE.AsString;
    DM.qryAuxiliar2.FieldByName('FREQUENCIA1').AsString          := DM.qryClonarManutFREQUENCIA1.AsString;
    DM.qryAuxiliar2.FieldByName('REPROGRAMAR1').AsString         := DM.qryClonarManutREPROGRAMAR1.AsString;
    DM.qryAuxiliar2.FieldByName('RELATORIO').AsString            := 'N';
    DM.qryAuxiliar2.FieldByName('GRUPOINSP').AsString            := DM.qryClonarManutGRUPOINSP.AsString;
    DM.qryAuxiliar2.FieldByName('DATACADASTRO').AsDateTime       := DM.FDataHoraServidor;
    DM.qryAuxiliar2.FieldByName('CODUSUARIOCAD').AsString        := DM.FCodEmpresa;
    DM.qryAuxiliar2.Post;

    DM.qryClonarManut.Next;
  end;

  DM.qryAuxiliar2.Close;

  DM.qryClonarLubrific.Close;
  DM.qryClonarLubrific.Params[0].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
  DM.qryClonarLubrific.Params[1].AsString := DM.FCodEmpresa;
  DM.qryClonarLubrific.Open; DM.qryClonarLubrific.First;

  DM.qryAuxiliar2.Close;
  DM.qryAuxiliar2.SQL.Clear;
  DM.qryAuxiliar2.SQL.Text := 'SELECT * FROM lubrificprogequipamento WHERE codigo = -1';
  DM.qryAuxiliar2.Open;

  while not DM.qryClonarLubrific.Eof = True do
  begin
    DM.qryAuxiliar2.Append;
    Randomize;
    randomNum := Random(9000) + 1000;

    DM.FTabela_auxiliar  := 32;
    while DM.VerificaDuplo('MPC.' + IntToStr(randomNum)) = True do
      begin
        Randomize;
        randomNum := Random(9000) + 1000;
      end;

    DM.qryAuxiliar2.FieldByName('CODIGO').AsString               := 'MPC.' + IntToStr(randomNum);
    DM.qryAuxiliar2.FieldByName('CODEMPRESA').AsString           := DM.FCodEmpresa;
    DM.qryAuxiliar2.FieldByName('CODEQUIPAMENTO').AsString       := DM.qryEquipamentosCODIGO.AsString;
    DM.qryAuxiliar2.FieldByName('CODLUBRIFICPROGFAMEQUIP').AsString := DM.qryClonarLubrificCODLUBRIFICPROGFAMEQUIP.AsString;
    DM.qryAuxiliar2.FieldByName('DESCRICAO').AsString            := DM.qryClonarLubrificDESCRICAO.AsString;
    DM.qryAuxiliar2.FieldByName('CRITICIDADE').AsString          := DM.qryClonarLubrificCRITICIDADE.AsString;
    DM.qryAuxiliar2.FieldByName('FREQUENCIA1').AsString          := DM.qryClonarLubrificFREQUENCIA1.AsString;
    DM.qryAuxiliar2.FieldByName('REPROGRAMAR1').AsString         := DM.qryClonarLubrificREPROGRAMAR1.AsString;
    DM.qryAuxiliar2.FieldByName('RELATORIO').AsString            := 'N';
    DM.qryAuxiliar2.FieldByName('GRUPOINSP').AsString            := DM.qryClonarLubrificGRUPOINSP.AsString;
    DM.qryAuxiliar2.FieldByName('DATACADASTRO').AsDateTime       := DM.FDataHoraServidor;
    DM.qryAuxiliar2.FieldByName('CODUSUARIOCAD').AsString        := DM.FCodEmpresa;
    DM.qryAuxiliar2.Post;

    DM.qryClonarLubrific.Next;
  end;

  DM.qryAuxiliar2.Close;

  DM.qryEquipamentos.Edit;
end;
  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodEquip.ReadOnly := True;

if DM.qryEquipamentosDados.Active = True then
  begin
    DM.qryEquipamentosDados.Edit;
    if DM.qryEquipamentosDadosCODIGO.IsNull = True then
      begin
        DM.qryEquipamentosDadosCODEMPRESA.AsString      := DM.FCodEmpresa;
        DM.qryEquipamentosDadosCODEQUIPAMENTO.AsString  := DM.qryEquipamentosCODIGO.AsString;
        DM.qryEquipamentosDadosCODFAMILIAEQUIP.AsString  := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
      end;
    DM.qryEquipamentosDados.Post;
    DM.qryEquipamentosDados.Edit;

    DM.qryEquipamentosDadosR.Edit;
    if DM.qryEquipamentosDadosRCODIGO.IsNull = True then
      begin
        DM.qryEquipamentosDadosRCODIGO.AsInteger         := DM.qryEquipamentosDadosCODIGO.AsInteger;
        DM.qryEquipamentosDadosRCODEMPRESA.AsString      := DM.FCodEmpresa;
        DM.qryEquipamentosDadosRCODEQUIPAMENTO.AsString  := DM.qryEquipamentosCODIGO.AsString;
      end;
    DM.qryEquipamentosDadosRCODFAMILIAEQUIP.AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
    if DM.qryFamEquipamentoN1.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO1.IsNull then
        DM.qryEquipamentosDadosRREGISTRO1.AsFloat := DM.qryEquipamentosDadosREGISTRO1.AsFloat;
    if DM.qryFamEquipamentoN2.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO2.IsNull then
        DM.qryEquipamentosDadosRREGISTRO2.AsFloat := DM.qryEquipamentosDadosREGISTRO2.AsFloat;
    if DM.qryFamEquipamentoN3.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO3.IsNull then
        DM.qryEquipamentosDadosRREGISTRO3.AsFloat := DM.qryEquipamentosDadosREGISTRO3.AsFloat;
    if DM.qryFamEquipamentoN4.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO4.IsNull then
        DM.qryEquipamentosDadosRREGISTRO4.AsFloat := DM.qryEquipamentosDadosREGISTRO4.AsFloat;
    if DM.qryFamEquipamentoN5.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO5.IsNull then
        DM.qryEquipamentosDadosRREGISTRO5.AsFloat := DM.qryEquipamentosDadosREGISTRO5.AsFloat;
    if DM.qryFamEquipamentoN6.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO6.IsNull then
        DM.qryEquipamentosDadosRREGISTRO6.AsFloat := DM.qryEquipamentosDadosREGISTRO6.AsFloat;
    if DM.qryFamEquipamentoN7.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO7.IsNull then
        DM.qryEquipamentosDadosRREGISTRO7.AsFloat := DM.qryEquipamentosDadosREGISTRO7.AsFloat;
    if DM.qryFamEquipamentoN8.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO8.IsNull then
        DM.qryEquipamentosDadosRREGISTRO8.AsFloat := DM.qryEquipamentosDadosREGISTRO8.AsFloat;
    if DM.qryFamEquipamentoN9.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO9.IsNull then
        DM.qryEquipamentosDadosRREGISTRO9.AsFloat := DM.qryEquipamentosDadosREGISTRO9.AsFloat;
    if DM.qryFamEquipamentoN10.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO10.IsNull then
        DM.qryEquipamentosDadosRREGISTRO10.AsFloat := DM.qryEquipamentosDadosREGISTRO10.AsFloat;
    if DM.qryFamEquipamentoN11.AsString = 'S' then
      if not DM.qryEquipamentosDadosREGISTRO11.IsNull then
        DM.qryEquipamentosDadosRREGISTRO11.AsFloat := DM.qryEquipamentosDadosREGISTRO11.AsFloat;
    DM.qryEquipamentosDadosR.Post;
    //DM.qryEquipamentosDadosR.Refresh;
    DM.qryEquipamentosDadosR.Edit;
  end;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadEquipamentos.Button1Click(Sender: TObject);
begin
  inherited;
if DM.qryEquipamentosCODIGO.IsNull = True then
  begin
    BtnSalvar.OnClick(Sender);
    Exit;
  end;
PopupMenuInspecoes.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela            := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;
end;

procedure TFrmTelaCadEquipamentos.Button2Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryEquipamentosCODIGO.IsNull = True then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADPECASREPOSICAOEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadEquipamentosPecas, FrmTelaCadEquipamentosPecas);
    //FrmTelaCadEquipamentosPecas.Caption := 'Peças do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadEquipamentosPecas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosPecas);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTela            := 'CADEQUIPAMENTOS';
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.Button3Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryEquipamentosCODIGO.IsNull = True then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMAODEOBRAESP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadEquipamentosEsp, FrmTelaCadEquipamentosEsp);
    //FrmTelaCadEquipamentosEsp.Caption := 'Especialistas do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadEquipamentosEsp.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosEsp);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTela            := 'CADEQUIPAMENTOS';
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.Button4Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryEquipamentosCODIGO.IsNull = True then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMAODEOBRAESP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadEquipamentosArqTec, FrmTelaCadEquipamentosArqTec);
    //FrmTelaCadEquipamentosArqTec.Caption := 'Literaturas Técnicas do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadEquipamentosArqTec.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosArqTec);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTela            := 'CADEQUIPAMENTOS';
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.Button5Click(Sender: TObject);
begin
  inherited;
  Try
//    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
//    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);

    Application.CreateForm(TFrmTelaCadNavegacaoGrafica, FrmTelaCadNavegacaoGrafica);
    FrmTelaCadNavegacaoGrafica.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadNavegacaoGrafica);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTela            := 'CADEQUIPAMENTOS';
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.Button6Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    Application.CreateForm(TFrmTelaCadEquipamentosHist, FrmTelaCadEquipamentosHist);
    FrmTelaCadEquipamentosHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosHist);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTela            := 'CADEQUIPAMENTOS';
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.ChbSecundarioClick(Sender: TObject);
begin
  inherited;
if  (DM.qryEquipamentos.Active = False) then Exit;

if (ChbSecundario.Checked = True) then
  begin
    LblPrimario.Visible := True; EdtPrimario.Visible := True; BtnPrimario.Visible := True;

    NBLocalizacao.PageIndex := 1
  end
else
  begin
    LblPrimario.Visible := False; EdtPrimario.Visible := False; BtnPrimario.Visible := False;

    if DM.FEmpTransf = True then
      NBLocalizacao.PageIndex := 0
    else
      NBLocalizacao.PageIndex := 2;
  end
end;

procedure TFrmTelaCadEquipamentos.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
DM.FParamAuxiliar[2] := '';
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadEquipamentos.Completo1Click(Sender: TObject);
begin
DM.FParamAuxiliar[1] := 'DESCRICAO';
DM.FDataSetRelat    := DmRelatorios.frxDBEquipGeral;
DM.FTabela_auxiliar := 25;
  inherited;
end;

procedure TFrmTelaCadEquipamentos.Confiabilidade1Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryEquipamentosCODIGO.IsNull = True then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROGEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadEquipamentosConf, FrmTelaCadEquipamentosConf);
    //FrmTelaCadEquipamentosConf.Caption := 'Confiabilidade do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadEquipamentosConf.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosConf);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.Contadores1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadEquipamentosContadores, FrmTelaCadEquipamentosContadores);
    //FrmTelaCadEquipamentosContadores.Caption := 'Medidores do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadEquipamentosContadores.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosContadores);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
DM.FParamAuxiliar[2] := '';
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadEquipamentos.EdtAreaDblClick(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosCODLOCALIZACAO.AsString := EmptyStr;
DM.qryEquipamentosCODCELULA.AsString      := EmptyStr;
DM.qryEquipamentosCODLINHA.AsString       := EmptyStr;
DM.qryEquipamentosSEQUENCIA.AsString   := EmptyStr;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo10KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN10.AsString) = 'S' then
  begin
    EdtCampo10.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo10.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo11KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN11.AsString) = 'S' then
  begin
    EdtCampo11.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo11.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN1.AsString) = 'S' then
  begin
    EdtCampo1.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo1.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN2.AsString) = 'S' then
  begin
    EdtCampo2.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo2.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN3.AsString) = 'S' then
  begin
    EdtCampo3.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo3.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo4KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN4.AsString) = 'S' then
  begin
    EdtCampo4.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo4.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo5KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN5.AsString) = 'S' then
  begin
    EdtCampo5.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo5.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo6KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN6.AsString) = 'S' then
  begin
    EdtCampo6.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo6.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo7KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN7.AsString) = 'S' then
  begin
    EdtCampo7.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo7.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo8KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN8.AsString) = 'S' then
  begin
    EdtCampo8.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo8.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCampo9KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Trim(DM.qryFamEquipamentoN9.AsString) = 'S' then
  begin
    EdtCampo9.MaxLength := 15;
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;
  end
else
  begin
    EdtCampo9.MaxLength := 0;
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.EdtCelulaDblClick(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosCODCELULA.AsString      := EmptyStr;
DM.qryEquipamentosCODLINHA.AsString       := EmptyStr;
DM.qryEquipamentosSEQUENCIA.AsString   := EmptyStr;
end;

procedure TFrmTelaCadEquipamentos.EdtCodEquipExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadEquipamentos.EdtLinhaDblClick(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosCODLINHA.AsString       := EmptyStr;
DM.qryEquipamentosSEQUENCIA.AsString   := EmptyStr;
end;

procedure TFrmTelaCadEquipamentos.EdtPosicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not (CharInSet(Key,['0'..'9',#8])) then
//if (key in [#13,#8,#9,#8,'0','1','2','3','4','5','6','7','8','9']) then
  begin
     if Key = #13 then
       begin
         Key := #0;
         SelectNext(ActiveControl,True,True);
       end;
  end
else Key := #0;
end;

procedure TFrmTelaCadEquipamentos.Famlia1Click(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        DM.FParamAuxiliar[2] := 'CODFAMILIAEQUIP';
        DM.FCodFamilia       :=  DM.FCodCombo;
        BtnConsultar.OnClick(Sender);
      end;
  end;
end;

procedure TFrmTelaCadEquipamentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryEquipamentos.Close;
DM.qryFamEquipamento.Close;
DM.qryEquipamentosDados.Close;
DM.qryEquipamentosDadosR.Close;
end;

procedure TFrmTelaCadEquipamentos.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryEquipamentos;
DM.FDataSourceParam := DM.dsEquipamentos;
DM.FTela := 'CADEQUIPAMENTOS';
DM.FTabela_auxiliar := 25;

if DM.FEmpTransf = True then
  NBLocalizacao.PageIndex := 0
else
  NBLocalizacao.PageIndex := 2;

LSequenciaAtual := 0;
LSequenciaNova  := 0;
end;

procedure TFrmTelaCadEquipamentos.Individual1Click(Sender: TObject);
begin
DM.FParamAuxiliar[1] := 'DESCRICAO';
DM.FDataSetRelat    := DmRelatorios.frxDBEquipIndividual;
DM.FTabela_auxiliar := 251;
  inherited;

end;

procedure TFrmTelaCadEquipamentos.Lubrificacoes1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryLubrificProgEquipCODIGO, DM.qryFormatoCodigoLUBRIFICPROGEQUIPAMENTO, FrmTelaCadLubrificProgEquip) = False then exit;
    Application.CreateForm(TFrmTelaCadLubrificProgEquip, FrmTelaCadLubrificProgEquip);
    //FrmTelaCadLubrificProgEquip.Caption := 'Lubrificação Programada do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadLubrificProgEquip.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgEquip);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.Manutencoes1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROGEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryManutProgEquipCODIGO, DM.qryFormatoCodigoMANUTPROGEQUIPAMENTO, FrmTelaCadManutProgEquip) = False then exit;
    Application.CreateForm(TFrmTelaCadManutProgEquip, FrmTelaCadManutProgEquip);
    //FrmTelaCadManutProgEquip.Caption := 'Manutenção Programada do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadManutProgEquip.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgEquip);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTabela_auxiliar := 25;
  End;
end;

procedure TFrmTelaCadEquipamentos.PontosInspecao1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadEquipamentosPontosInsp, FrmTelaCadEquipamentosPontosInsp);
    //FrmTelaCadEquipamentosPontosInsp.Caption := 'Pontos de Inspeção do Equipamento: '+ DM.qryEquipamentosDESCRICAO.AsString;
    FrmTelaCadEquipamentosPontosInsp.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosPontosInsp);
    DM.FDataSetParam    := DM.qryEquipamentos;
    DM.FDataSourceParam := DM.dsEquipamentos;
    DM.FTabela_auxiliar := 25;
  End;
end;

end.


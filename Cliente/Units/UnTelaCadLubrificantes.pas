unit UnTelaCadLubrificantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExComCtrls,
  JvComCtrls, Data.DB, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TFrmTelaCadLubrificantes = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodLubrificante: TDBEdit;
    EdtDescricao: TDBEdit;
    Label17: TLabel;
    Label6: TLabel;
    EdtCodFabricante: TDBEdit;
    EdtDescFabricante: TDBEdit;
    BtnFabricante: TButton;
    Label19: TLabel;
    Label7: TLabel;
    EdtCodFornecedor: TDBEdit;
    EdtDescFornecedor: TDBEdit;
    BtnFornecedor: TButton;
    Label20: TLabel;
    ChbOleo: TDBCheckBox;
    PCLubrificante: TJvPageControl;
    TSOleo: TTabSheet;
    POleo: TPanel;
    Label5: TLabel;
    Label16: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    Label9: TLabel;
    Label24: TLabel;
    EdtViscosidade: TDBEdit;
    EdtACMA: TDBEdit;
    EdtFulgor: TDBEdit;
    EdtDensidade: TDBEdit;
    EdtISO: TDBEdit;
    EdtFluidezOleo: TDBEdit;
    TSGraxa: TTabSheet;
    PGraxa: TPanel;
    Label37: TLabel;
    Label39: TLabel;
    Label42: TLabel;
    Label40: TLabel;
    EdtNLGI: TDBEdit;
    EdtPenetracao: TDBEdit;
    EdtGota: TDBEdit;
    EdtFluidezGraxa: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    ChbEstocado: TDBCheckBox;
    EdtQtde: TDBEdit;
    Label11: TLabel;
    EdtConsMedio: TDBEdit;
    Label12: TLabel;
    EdtRessup: TDBEdit;
    Label13: TLabel;
    EdtPreco: TDBEdit;
    Label14: TLabel;
    EdtCatalogo: TDBEdit;
    Label15: TLabel;
    CBCriticidade: TDBComboBox;
    Label18: TLabel;
    EdtCodUnidade: TDBEdit;
    ChbAtivo: TDBCheckBox;
    ChbVisivel: TDBCheckBox;
    Label22: TLabel;
    EdtArea: TDBEdit;
    BtnArea: TButton;
    Label10: TLabel;
    procedure ChbOleoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PCLubrificanteDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodLubrificanteExit(Sender: TObject);
    procedure BtnFabricanteClick(Sender: TObject);
    procedure BtnFornecedorClick(Sender: TObject);
    procedure BtnAreaClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadLubrificantes: TFrmTelaCadLubrificantes;

implementation

{$R *.dfm}

uses UnTelaCadFabricantes, UnTelaCadFornecedores, UnTelaCadAreas,
  UnDmRelatorios, UnDM;

procedure TFrmTelaCadLubrificantes.BtnAreaClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificantes.Active = False then Exit;
if DM.qryLubrificantes.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 150;
    DM.FNomeConsulta := 'Áreas';
    DM.qryLubrificantes.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificantesCODLOCALIZACAO.AsString := DM.FCodCombo;
        DM.qryLubrificantesAREA.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADAREAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryAreasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
      FrmTelaCadAreas.ShowModal;
    Finally
      DM.FTabela_auxiliar := 64;
      DM.FDataSetParam    := DM.qryLubrificantes;
      DM.FDataSourceParam := DM.dsLubrificantes;
      FreeAndNil(FrmTelaCadAreas);
    End;
  end;
end;

procedure TFrmTelaCadLubrificantes.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodLubrificante.ReadOnly := True;
end;

procedure TFrmTelaCadLubrificantes.BtnFabricanteClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificantes.Active = False then Exit;
if DM.qryLubrificantes.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 220;
    DM.FNomeConsulta := 'Fabricantes';
    DM.qryLubrificantes.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificantesCODFABRICANTE.AsString := DM.FCodCombo;
        DM.qryLubrificantesFABRICANTE.AsString := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qryLubrificantes;
DM.FDataSourceParam := DM.dsLubrificantes;
DM.FTela            := 'CADLUBRIFICANTES';
DM.FTabela_auxiliar := 64;
end;

procedure TFrmTelaCadLubrificantes.BtnFornecedorClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificantes.Active = False then Exit;
if DM.qryLubrificantes.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 210;
    DM.FNomeConsulta := 'Fornecedores';
    DM.qryLubrificantes.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificantesCODFORNECEDOR.AsString := DM.FCodCombo;
        DM.qryLubrificantesFORNECEDOR.AsString := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qryLubrificantes;
DM.FDataSourceParam := DM.dsLubrificantes;
DM.FTela            := 'CADLUBRIFICANTES';
DM.FTabela_auxiliar := 64;
end;

procedure TFrmTelaCadLubrificantes.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryLubrificantesCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryLubrificantesDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryLubrificantesDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryLubrificantesCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryLubrificantesCODUSUARIOALT.AsString  := DM.FCodUsuario;
DM.qryLubrificantesOLEO.AsString           := 'S'; DM.qryLubrificantesANTIDESGASTE.AsString   := 'N';
DM.qryLubrificantesANTICORROZIVO.AsString  := 'N'; DM.qryLubrificantesANTIOXIDANTE.AsString   := 'N';
DM.qryLubrificantesANTIESPUMANTE.AsString  := 'N'; DM.qryLubrificantesEXTREMAPRESSAO.AsString := 'N';
DM.qryLubrificantesDETERGENTE.AsString     := 'N'; DM.qryLubrificantesDISPERSANTE.AsString    := 'N';
DM.qryLubrificantesSINTETICO.AsString      := 'N'; DM.qryLubrificantesANTIFERRUGEM.AsString   := 'N';
DM.qryLubrificantesEXTREMAPRESSAO.AsString := 'N'; DM.qryLubrificantesSINTETICO.AsString      := 'N';
DM.qryLubrificantesESTOCADO.AsString       := 'S'; DM.qryLubrificantesATIVO.AsString          := 'S';
DM.qryLubrificantesVISIVEL.AsString        := 'S';

EdtCodLubrificante.ReadOnly := False;
EdtCodLubrificante.SetFocus;
end;

procedure TFrmTelaCadLubrificantes.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryLubrificantesCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodLubrificante.SetFocus; Exit;
  end;
DM.FTabela_auxiliar  := 64;
if (DM.VerificaDuplo(EdtCodLubrificante.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodLubrificante.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryLubrificantesDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryLubrificantesCODFABRICANTE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FABRICANTE DO REGISTRO!'; EdtDescFabricante.SetFocus; Exit;
  end;
if DM.qryLubrificantesCODFORNECEDOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FORNCEDOR DO REGISTRO!'; EdtDescFornecedor.SetFocus; Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodLubrificante.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;

DM.MSGAguarde('');

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodLubrificante.ReadOnly := True;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadLubrificantes.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar  := 64;
  inherited;

end;

procedure TFrmTelaCadLubrificantes.ChbOleoClick(Sender: TObject);
begin
  inherited;
PCLubrificante.Pages[0].TabVisible := True;
PCLubrificante.Pages[1].TabVisible := True;
if ChbOleo.Checked = True then
  begin
    PCLubrificante.Pages[0].TabVisible := False;
    PCLubrificante.ActivePageIndex     := 0;
  end
else
  begin
    PCLubrificante.Pages[1].TabVisible := False;
    PCLubrificante.ActivePageIndex     := 1;
  end;
end;

procedure TFrmTelaCadLubrificantes.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBLubrificantesGeral;
DM.FTabela_auxiliar := 64;
  inherited;

end;

procedure TFrmTelaCadLubrificantes.EdtCodLubrificanteExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadLubrificantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryLubrificantes.Close;
end;

procedure TFrmTelaCadLubrificantes.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryLubrificantes;
DM.FDataSourceParam := DM.dsLubrificantes;
DM.FTela := 'CADLUBRIFICANTES';
if ChbOleo.Checked = True then
  begin
    PCLubrificante.Pages[0].TabVisible := False;
    PCLubrificante.ActivePageIndex     := 0;
  end
else
  begin
    PCLubrificante.Pages[1].TabVisible := False;
    PCLubrificante.ActivePageIndex     := 1;
  end;
end;

procedure TFrmTelaCadLubrificantes.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBLubrificantesIndividual;
DM.FTabela_auxiliar := 641;
  inherited;

end;

procedure TFrmTelaCadLubrificantes.PCLubrificanteDrawTab(
  Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect;
  Active: Boolean);
begin
  inherited;
case TabIndex of
  0:
    begin
      Control.Canvas.Font.Color := clBlack;
      Label10.Caption := 'Qtde. (l):';
    end;
  1:
    begin
      Control.Canvas.Font.Color := clBlack;
      Label10.Caption := 'Qtde. (kg):';
    end;
end;
Control.Canvas.FillRect( Rect );
Control.Canvas.TextOut(Rect.left + 5, Rect.top + 4, PCLubrificante.ActivePage.Caption);
PCLubrificante.Pages[TabIndex].Font.Color := Control.Canvas.Font.Color;
end;

end.

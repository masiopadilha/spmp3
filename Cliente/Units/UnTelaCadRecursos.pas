unit UnTelaCadRecursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, JvExMask,
  JvToolEdit, JvDBControls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, Vcl.Imaging.Jpeg, JvDialogs, FireDAC.Stan.Param,
  Vcl.Buttons;

type
  TFrmTelaCadRecursos = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodRecurso: TDBEdit;
    EdtDescricao: TDBEdit;
    Label17: TLabel;
    Label5: TLabel;
    EdtCodFamiliaRecurso: TDBEdit;
    EdtDescFamiliaRecurso: TDBEdit;
    BtnFamilia: TButton;
    Label18: TLabel;
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
    Label15: TLabel;
    EdtArea: TDBEdit;
    BtnArea: TButton;
    Label9: TLabel;
    EdtClasse: TDBEdit;
    BtnClasse: TButton;
    Label22: TLabel;
    Label10: TLabel;
    EdtCentroCusto: TDBEdit;
    BtnCentroCusto: TButton;
    Label23: TLabel;
    Label11: TLabel;
    EdtAquisicao: TJvDBDateEdit;
    Label12: TLabel;
    EdtFabricacao: TJvDBDateEdit;
    Label14: TLabel;
    EdtGarantia: TJvDBDateEdit;
    Label8: TLabel;
    EdtPreco: TDBEdit;
    Label13: TLabel;
    Label16: TLabel;
    EdtQtde: TDBEdit;
    Label21: TLabel;
    Label24: TLabel;
    EdtVidaUtil: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    LblCustoHora: TDBText;
    Label28: TLabel;
    CBEstado: TDBComboBox;
    PopupMenuFerramentas: TPopupMenu;
    KitdeRecursos1: TMenuItem;
    Ferramentaria1: TMenuItem;
    Label25: TLabel;
    Campo12: TDBText;
    EdtCampo12: TDBEdit;
    OPDFoto: TJvOpenDialog;
    PImagem: TPanel;
    ImgFotoRecurso: TImage;
    BtnAnexar: TButton;
    BtnLimpar: TButton;
    PFuncoDadosTecnicos: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure KitdeRecursos1Click(Sender: TObject);
    procedure Ferramentaria1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodRecursoExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnFabricanteClick(Sender: TObject);
    procedure BtnFornecedorClick(Sender: TObject);
    procedure BtnAreaClick(Sender: TObject);
    procedure BtnClasseClick(Sender: TObject);
    procedure BtnCentroCustoClick(Sender: TObject);
    procedure BtnAnexarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadRecursos: TFrmTelaCadRecursos;

implementation

{$R *.dfm}

uses UnTelaCadRecursosFerram, UnTelaCadRecursosKit,
  UnTelaCadPecasReposicao, UnTelaCadFabricantes, UnTelaCadFamiliaRecursos,
  UnTelaCadFornecedores, UnTelaCadAreas, UnTelaCadClasses, UnTelaCadCentroCusto,
  UnDmRelatorios, UnDM;

procedure TFrmTelaCadRecursos.BtnAnexarClick(Sender: TObject);
var
 jpg: TJPEGImage;
 imgfile: String;
begin
PAuxiliares.Caption := EmptyStr;
if OPDFoto.Execute then
  begin
    if OPDFoto.FileName <> EmptyStr then
      begin
        imgfile := ExtractFilePath(Application.ExeName) + 'img_red_temp.jpg';
        DM.SetJPGCompression(40, OPDFoto.FileName, imgfile);

        jpg := TJpegImage.Create;
        jpg.LoadFromFile(OPDFoto.FileName);
        DM.qryRecursosIMAGEM.Assign(jpg);
        DM.ExibeFoto(DM.qryRecursos, 'IMAGEM', FrmTelaCadRecursos.ImgFotoRecurso);
        jpg.Free;
      end
    else
      begin
        DM.qryRecursosIMAGEM.Clear;
      end;
  end;
end;

procedure TFrmTelaCadRecursos.BtnAreaClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursos.Active = False then Exit;
if DM.qryRecursos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 150;
    DM.FNomeConsulta := 'Áreas';
    DM.qryRecursos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRecursosCODLOCALIZACAO.AsString := DM.FCodCombo;
        DM.qryRecursosAREA.AsString           := DM.FValorCombo;
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
      if DM.AplicarMascara(DM.qryCelulasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.AplicarMascara(DM.qryLinhasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
      FrmTelaCadAreas.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadAreas);
    End;
  end;
DM.FDataSetParam    := DM.qryRecursos;
DM.FDataSourceParam := DM.dsRecursos;
DM.FTela            := 'CADRECURSOS';
DM.FTabela_auxiliar := 46;
end;

procedure TFrmTelaCadRecursos.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodRecurso.ReadOnly := True;
if DM.qryRecursosDados.Active = True then
   DM.qryRecursosDados.Cancel;

if DM.qryRecursosCODFAMILIARECURSO.AsString <> EmptyStr then
  begin
    DM.qryFamRecursos.Close;
    DM.qryFamRecursos.Params[0].AsString := DM.qryRecursosCODFAMILIARECURSO.AsString;
    DM.qryFamRecursos.Open;
    DM.qryRecursosDados.Open;
    DM.qryRecursosDados.Edit;

    if DM.qryFamRecursosCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
    if DM.qryFamRecursosCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
    if DM.qryFamRecursosCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
    if DM.qryFamRecursosCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
    if DM.qryFamRecursosCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
    if DM.qryFamRecursosCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
    if DM.qryFamRecursosCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
    if DM.qryFamRecursosCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
    if DM.qryFamRecursosCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
    if DM.qryFamRecursosCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
    if DM.qryFamRecursosCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
  end;

end;

procedure TFrmTelaCadRecursos.BtnCentroCustoClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursos.Active = False then Exit;
if DM.qryRecursos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 400;
    DM.FNomeConsulta := 'Centros de Custos';
    DM.qryRecursos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRecursosCODCENTROCUSTO.AsString := DM.FCodCombo;
        DM.qryRecursosCENTROCUSTO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCENTROCUSTO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoCENTROCUSTO, FrmTelaCadCentroCusto) = False then exit;
      Application.CreateForm(TFrmTelaCadCentroCusto, FrmTelaCadCentroCusto);
      FrmTelaCadCentroCusto.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCentroCusto);
    End;
  end;
DM.FDataSetParam    := DM.qryRecursos;
DM.FDataSourceParam := DM.dsRecursos;
DM.FTela            := 'CADRECURSOS';
DM.FTabela_auxiliar := 46;
end;

procedure TFrmTelaCadRecursos.BtnClasseClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursos.Active = False then Exit;
if DM.qryRecursos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 500;
    DM.FNomeConsulta := 'Classes de Equipamentos';
    DM.qryRecursos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRecursosCODCLASSE.AsString := DM.FCodCombo;
        DM.qryRecursosCLASSE.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCLASSES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryClassesCODIGO, DM.qryFormatoCodigoCLASSES, FrmTelaCadClasses) = False then exit;
      Application.CreateForm(TFrmTelaCadClasses, FrmTelaCadClasses);
      FrmTelaCadClasses.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadClasses);
    End;
  end;
DM.FDataSetParam    := DM.qryRecursos;
DM.FDataSourceParam := DM.dsRecursos;
DM.FTela            := 'CADRECURSOS';
DM.FTabela_auxiliar := 46;
end;

procedure TFrmTelaCadRecursos.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursosCODFAMILIARECURSO.AsString <> EmptyStr then
  begin
    DM.qryFamRecursos.Close;
    DM.qryFamRecursos.Params[0].AsString := DM.qryRecursosCODFAMILIARECURSO.AsString;
    DM.qryFamRecursos.Open;

    DM.qryRecursosDados.Close;
    DM.qryRecursosDados.Params[0].AsString := DM.FCodEmpresa;
    DM.qryRecursosDados.Params[1].AsString := DM.qryRecursosCODFAMILIARECURSO.AsString;
    DM.qryRecursosDados.Params[2].AsString := DM.qryRecursosCODIGO.AsString;
    DM.qryRecursosDados.Open;
    DM.qryRecursosDados.Edit;

    if DM.qryFamRecursosCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
    if DM.qryFamRecursosCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
    if DM.qryFamRecursosCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
    if DM.qryFamRecursosCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
    if DM.qryFamRecursosCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
    if DM.qryFamRecursosCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
    if DM.qryFamRecursosCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
    if DM.qryFamRecursosCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
    if DM.qryFamRecursosCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
    if DM.qryFamRecursosCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
    if DM.qryFamRecursosCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
    if DM.qryFamRecursosCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
  end;

DM.ExibeFoto(DM.qryRecursos, 'IMAGEM', FrmTelaCadRecursos.ImgFotoRecurso);
end;

procedure TFrmTelaCadRecursos.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryRecursosDados.Close;
DM.qryRecursosDados.Open;
end;

procedure TFrmTelaCadRecursos.BtnFabricanteClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursos.Active = False then Exit;
if DM.qryRecursos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 220;
    DM.FNomeConsulta := 'Fabricantes';
    DM.qryRecursos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRecursosCODFABRICANTE.AsString := DM.FCodCombo;
        DM.qryRecursosFABRICANTE.AsString := DM.FValorCombo;
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
      DM.FTabela_auxiliar := 46;
      DM.FDataSetParam    := DM.qryRecursos;
      DM.FDataSourceParam := DM.dsRecursos;
      FreeAndNil(FrmTelaCadFabricantes);
    End;
  end;
end;

procedure TFrmTelaCadRecursos.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.FAlterando = True then Exit;
if DM.qryRecursos.Active = False then Exit;
if DM.qryRecursos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 800;
    DM.FNomeConsulta := 'Famílias de Recursos';
    DM.qryRecursos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRecursosCODFAMILIARECURSO.AsString := DM.FCodCombo;
        DM.qryRecursosFAMILIARECURSO.AsString := DM.FValorCombo;

        if DM.qryRecursosCODFAMILIARECURSO.AsString <> EmptyStr then
          begin
            DM.qryFamRecursos.Close;
            DM.qryFamRecursos.Params[0].AsString := DM.qryRecursosCODFAMILIARECURSO.AsString;
            DM.qryFamRecursos.Open;

            DM.qryRecursosDados.Close;
            DM.qryRecursosDados.Params[0].AsString := DM.FCodEmpresa;
            DM.qryRecursosDados.Params[1].AsString := DM.qryRecursosCODFAMILIARECURSO.AsString;
            DM.qryRecursosDados.Params[2].AsString := DM.qryRecursosCODIGO.AsString;
            DM.qryRecursosDados.Open;
            DM.qryRecursosDados.Edit;

            if DM.qryFamRecursosCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
            if DM.qryFamRecursosCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
            if DM.qryFamRecursosCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
            if DM.qryFamRecursosCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
            if DM.qryFamRecursosCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
            if DM.qryFamRecursosCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
            if DM.qryFamRecursosCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
            if DM.qryFamRecursosCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
            if DM.qryFamRecursosCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
            if DM.qryFamRecursosCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
            if DM.qryFamRecursosCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
            if DM.qryFamRecursosCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
          end;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFAMILIARECURSOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryFamRecursosCODIGO, DM.qryFormatoCodigoFAMILIARECURSOS, FrmTelaCadFamiliaRecursos) = False then exit;
      Application.CreateForm(TFrmTelaCadFamiliaRecursos, FrmTelaCadFamiliaRecursos);
      FrmTelaCadFamiliaRecursos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFamiliaRecursos);
      DM.FAlterando := False;
    End;
  end;
DM.FDataSetParam    := DM.qryRecursos;
DM.FDataSourceParam := DM.dsRecursos;
DM.FTabela_auxiliar := 46;
end;

procedure TFrmTelaCadRecursos.BtnFornecedorClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursos.Active = False then Exit;
if DM.qryRecursos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 210;
    DM.FNomeConsulta := 'Fornecedores';
    DM.qryRecursos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRecursosCODFORNECEDOR.AsString := DM.FCodCombo;
        DM.qryRecursosFORNECEDOR.AsString := DM.FValorCombo;
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
      DM.FTabela_auxiliar := 46;
      DM.FDataSetParam    := DM.qryRecursos;
      DM.FDataSourceParam := DM.dsRecursos;
      FreeAndNil(FrmTelaCadFornecedores);
    End;
  end;
end;

procedure TFrmTelaCadRecursos.BtnLimparClick(Sender: TObject);
begin
  inherited;
ImgFotoRecurso.Picture.Assign(nil);
DM.qryRecursosIMAGEM.Clear;
end;

procedure TFrmTelaCadRecursos.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryRecursosCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryRecursosDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryRecursosDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryRecursosCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryRecursosCODUSUARIOALT.AsString   := DM.FCodUsuario;
DM.qryRecursosESTADO.AsString          := 'Bom';
DM.qryRecursosKIT.AsString             := 'N';

EdtCodRecurso.ReadOnly := False;
EdtCodRecurso.SetFocus;
end;

procedure TFrmTelaCadRecursos.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryRecursosCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodRecurso.SetFocus; Exit;
  end;
DM.FTabela_auxiliar := 46;
if (DM.VerificaDuplo(EdtCodRecurso.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodRecurso.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryRecursosDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryRecursosCODFAMILIARECURSO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!'; EdtDescFamiliaRecurso.SetFocus; Exit;
  end;
if DM.qryRecursosCODFABRICANTE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FABRICANTE DO REGISTRO!'; EdtDescFabricante.SetFocus; Exit;
  end;
if DM.qryRecursosCODFORNECEDOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FORNCEDOR DO REGISTRO!'; EdtDescFornecedor.SetFocus; Exit;
  end;
if DM.qryRecursosCODLOCALIZACAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A ÁREA DO REGISTRO!'; EdtArea.SetFocus; Exit;
  end;
if DM.qryRecursosCODCLASSE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CLASSE DO REGISTRO!'; EdtClasse.SetFocus; Exit;
  end;
if DM.qryRecursosCODCENTROCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CENTRO DE CUSTO DO REGISTRO!'; EdtCentroCusto.SetFocus;
    Exit;
  end;
if DM.qryRecursosPRECO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PREÇO DO REGISTRO!'; EdtPreco.SetFocus;
    Exit;
  end;
if DM.qryRecursosAMORTIZACAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A VIDA ÚTIL DO REGISTRO!'; EdtPreco.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodRecurso.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;

DM.MSGAguarde('');

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodRecurso.ReadOnly := True;

DM.qryRecursosDados.Edit;
if DM.qryRecursosDadosCODIGO.IsNull = True then
  begin
    DM.qryRecursosDadosCODEMPRESA.AsString := DM.FCodEmpresa;
    DM.qryRecursosDadosCODRECURSO.AsString := DM.qryRecursosCODIGO.AsString;
  end;
DM.qryRecursosDadosCODFAMILIARECURSOS.AsString := DM.qryRecursosCODFAMILIARECURSO.AsString;
DM.qryRecursosDados.Post;
DM.qryRecursosDados.Edit;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadRecursos.Button1Click(Sender: TObject);
begin
  inherited;
PopupMenuFerramentas.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
DM.FDataSetParam    := DM.qryRecursos;
DM.FDataSourceParam := DM.dsRecursos;
DM.FTela := 'CADRECURSOS';
DM.FTabela_auxiliar := 46;
end;

procedure TFrmTelaCadRecursos.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBRecursosGeral;
DM.FTabela_auxiliar := 46;
  inherited;
end;

procedure TFrmTelaCadRecursos.EdtCodRecursoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadRecursos.Ferramentaria1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[0] := DM.qryRecursosCODIGO.AsString;
if DM.FParamAuxiliar[0] = EmptyStr then Exit;
  Try
    if (DM.qryUsuarioPAcessoCADFERRAMENTARIA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFerramentariaCODIGO, DM.qryFormatoCodigoRECURSOS, FrmTelaCadRecursosFerram) = False then exit;
    Application.CreateForm(TFrmTelaCadRecursosFerram, FrmTelaCadRecursosFerram);
    FrmTelaCadRecursosFerram.Caption := 'Ferramentaria';
    FrmTelaCadRecursosFerram.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadRecursosFerram);
  End;
end;

procedure TFrmTelaCadRecursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryRecursos.Close;
DM.qryFamRecursos.Close;
DM.qryRecursosDados.Close;
end;

procedure TFrmTelaCadRecursos.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryRecursos;
DM.FDataSourceParam := DM.dsRecursos;
DM.FTela := 'CADRECURSOS';
DM.FTabela_auxiliar := 46;
end;

procedure TFrmTelaCadRecursos.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBRecursosIndividual;
DM.FTabela_auxiliar := 461;
  inherited;
end;

procedure TFrmTelaCadRecursos.KitdeRecursos1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[0] := DM.qryRecursosCODIGO.AsString;
//if DM.FParamAuxiliar[0] = EmptyStr then Exit;
  Try
    if (DM.qryUsuarioPAcessoCADRECURSOSKIT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryRecursoKitCODIGO, DM.qryFormatoCodigoRECURSOSKIT, FrmTelaCadRecursosKit) = False then exit;
    Application.CreateForm(TFrmTelaCadRecursosKit, FrmTelaCadRecursosKit);
    FrmTelaCadRecursosKit.Caption := 'Kit de Recursos';
    FrmTelaCadRecursosKit.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadRecursosKit);
  End;
end;

end.

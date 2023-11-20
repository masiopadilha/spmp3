unit UnTelaCadPecasReposicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, JvDialogs, Vcl.Imaging.Jpeg, FireDAC.Stan.Param,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TFrmTelaCadPecasReposicao = class(TFrmTelaPaiCadastros)
    BtnFabricante: TButton;
    BtnFamilia: TButton;
    BtnFornecedor: TButton;
    EdtCodFabricante: TDBEdit;
    EdtCodFamiliaPeca: TDBEdit;
    EdtCodFornecedor: TDBEdit;
    EdtCodPeca: TDBEdit;
    EdtDescFabricante: TDBEdit;
    EdtDescFamiliaPeca: TDBEdit;
    EdtDescFornecedor: TDBEdit;
    EdtDescricao: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
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
    Label13: TLabel;
    EdtCatalogo: TDBEdit;
    Label8: TLabel;
    EdtReferencia: TDBEdit;
    Label9: TLabel;
    EdtCodUnid: TDBEdit;
    Label10: TLabel;
    EdtPreco: TDBEdit;
    Label11: TLabel;
    EdtQuantidade: TDBEdit;
    Label12: TLabel;
    EdtUnidMed: TDBEdit;
    Label14: TLabel;
    EdtLocalEst: TDBEdit;
    Label15: TLabel;
    EdtPeso: TDBEdit;
    ChbEstocavel: TDBCheckBox;
    ChbFabUnid: TDBCheckBox;
    Label16: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Campo12: TDBText;
    EdtCampo12: TDBEdit;
    OPDFoto: TJvOpenDialog;
    PImagem: TPanel;
    ImgFotoPeca: TImage;
    BtnAnexar: TButton;
    BtnLimpar: TButton;
    PFundoDadosTecnicos: TPanel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodPecaExit(Sender: TObject);
    procedure EdtDescricaoExit(Sender: TObject);
    procedure EdtReferenciaExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnFabricanteClick(Sender: TObject);
    procedure BtnFornecedorClick(Sender: TObject);
    procedure BtnAnexarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPecasReposicao: TFrmTelaCadPecasReposicao;

implementation

{$R *.dfm}

uses UnTelaCadPecasReposicaoKit, UnTelaConsulta,
  UnTelaCadPecasReposicaoHist, UnTelaCadFamiliaPecasRep, UnTelaCadFabricantes,
  UnTelaCadFornecedores, UnDmRelatorios, UnDM;

procedure TFrmTelaCadPecasReposicao.BtnAnexarClick(Sender: TObject);
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
        DM.qryPecasReposicaoIMAGEM.Assign(jpg);
        DM.ExibeFoto(DM.qryPecasReposicao, 'IMAGEM', FrmTelaCadPecasReposicao.ImgFotoPeca);
        jpg.Free;
      end
    else
      begin
        DM.qryPecasReposicaoIMAGEM.Clear;
      end;
  end;
end;

procedure TFrmTelaCadPecasReposicao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodPeca.ReadOnly := True;
if DM.qryPecasReposicaoDados.Active = True then
  DM.qryPecasReposicaoDados.Cancel;

if DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString = EmptyStr then
  begin
    DM.qryFamPecasRep.Close;
    DM.qryPecasReposicaoDados.Close;
    Exit;
  end;

DM.qryFamPecasRep.Close;
DM.qryFamPecasRep.Params[0].AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
DM.qryFamPecasRep.Open;

DM.qryPecasReposicaoDados.Edit;

if DM.qryFamPecasRepCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
if DM.qryFamPecasRepCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
if DM.qryFamPecasRepCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
if DM.qryFamPecasRepCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
if DM.qryFamPecasRepCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
if DM.qryFamPecasRepCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
if DM.qryFamPecasRepCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
if DM.qryFamPecasRepCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
if DM.qryFamPecasRepCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
if DM.qryFamPecasRepCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
if DM.qryFamPecasRepCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
end;

procedure TFrmTelaCadPecasReposicao.BtnConsultarClick(Sender: TObject);
begin
DM.FParamAuxiliar[1] := 'DESCRICAO';
  inherited;
if DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString <> EmptyStr then
  begin
    DM.qryFamPecasRep.Close;
    DM.qryFamPecasRep.Params[0].AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
    DM.qryFamPecasRep.Open;

    DM.qryPecasReposicaoDados.Close;
    DM.qryPecasReposicaoDados.Params[0].AsString := DM.FCodEmpresa;
    DM.qryPecasReposicaoDados.Params[1].AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
    DM.qryPecasReposicaoDados.Params[2].AsString := DM.qryPecasReposicaoCODIGO.AsString;
    DM.qryPecasReposicaoDados.Open;
    DM.qryPecasReposicaoDados.Edit;

    if DM.qryFamPecasRepCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
    if DM.qryFamPecasRepCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
    if DM.qryFamPecasRepCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
    if DM.qryFamPecasRepCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
    if DM.qryFamPecasRepCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
    if DM.qryFamPecasRepCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
    if DM.qryFamPecasRepCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
    if DM.qryFamPecasRepCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
    if DM.qryFamPecasRepCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
    if DM.qryFamPecasRepCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
    if DM.qryFamPecasRepCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
    if DM.qryFamPecasRepCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
  end;

DM.ExibeFoto(DM.qryPecasReposicao, 'IMAGEM', FrmTelaCadPecasReposicao.ImgFotoPeca);
end;

procedure TFrmTelaCadPecasReposicao.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryPecasReposicaoDados.Close;
DM.qryPecasReposicaoDados.Open;
end;

procedure TFrmTelaCadPecasReposicao.BtnFabricanteClick(Sender: TObject);
begin
  inherited;
if DM.qryPecasReposicao.Active = False then Exit;
if DM.qryPecasReposicao.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 220;
    DM.FNomeConsulta := 'Fabricantes';
    DM.qryPecasReposicao.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPecasReposicaoCODFABRICANTE.AsString := DM.FCodCombo;
        DM.qryPecasReposicaoFABRICANTE.AsString := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qryPecasReposicao;
DM.FDataSourceParam := DM.dsPecasReposicao;
DM.FTela            := 'CADPECASREP';
DM.FTabela_auxiliar := 36;
end;

procedure TFrmTelaCadPecasReposicao.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.FAlterando = True then Exit;
if DM.qryPecasReposicao.Active = False then Exit;
if DM.qryPecasReposicao.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 700;
    DM.FNomeConsulta := 'Famílias de Peças de Reposição';
    DM.qryPecasReposicao.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString := DM.FCodCombo;
        DM.qryPecasReposicaoFAMILIAPECA.AsString := DM.FValorCombo;

        if DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString <> EmptyStr then
          begin
            DM.qryFamPecasRep.Close;
            DM.qryFamPecasRep.Params[0].AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
            DM.qryFamPecasRep.Open;

            DM.qryPecasReposicaoDados.Close;
            DM.qryPecasReposicaoDados.Params[0].AsString := DM.FCodEmpresa;
            DM.qryPecasReposicaoDados.Params[1].AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
            DM.qryPecasReposicaoDados.Params[2].AsString := DM.qryPecasReposicaoCODIGO.AsString;
            DM.qryPecasReposicaoDados.Open;
            DM.qryPecasReposicaoDados.Edit;

            if DM.qryFamPecasRepCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
            if DM.qryFamPecasRepCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
            if DM.qryFamPecasRepCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
            if DM.qryFamPecasRepCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
            if DM.qryFamPecasRepCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
            if DM.qryFamPecasRepCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
            if DM.qryFamPecasRepCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
            if DM.qryFamPecasRepCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
            if DM.qryFamPecasRepCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
            if DM.qryFamPecasRepCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
            if DM.qryFamPecasRepCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
            if DM.qryFamPecasRepCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
          end;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFAMILIAPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryFamPecasRepCODIGO, DM.qryFormatoCodigoFAMILIAPECASREPOSICAO, FrmTelaCadFamiliaPecasRep) = False then exit;
      Application.CreateForm(TFrmTelaCadFamiliaPecasRep, FrmTelaCadFamiliaPecasRep);
      FrmTelaCadFamiliaPecasRep.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFamiliaPecasRep);
      DM.FAlterando := False;
    End;
  end;
DM.FDataSetParam    := DM.qryPecasReposicao;
DM.FDataSourceParam := DM.dsPecasReposicao;
DM.FTela            := 'CADPECASREP';
DM.FTabela_auxiliar := 36;
end;

procedure TFrmTelaCadPecasReposicao.BtnFornecedorClick(Sender: TObject);
begin
  inherited;
if DM.qryPecasReposicao.Active = False then Exit;
if DM.qryPecasReposicao.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 210;
    DM.FNomeConsulta := 'Fornecedores';
    DM.qryPecasReposicao.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPecasReposicaoCODFORNECEDOR.AsString := DM.FCodCombo;
        DM.qryPecasReposicaoFORNECEDOR.AsString := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qryPecasReposicao;
DM.FDataSourceParam := DM.dsPecasReposicao;
DM.FTela            := 'CADPECASREP';
DM.FTabela_auxiliar := 36;
end;

procedure TFrmTelaCadPecasReposicao.BtnLimparClick(Sender: TObject);
begin
  inherited;
ImgFotoPeca.Picture.Assign(nil);
DM.qryPecasReposicaoIMAGEM.Clear;
end;

procedure TFrmTelaCadPecasReposicao.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryPecasReposicaoCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryPecasReposicaoDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryPecasReposicaoDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryPecasReposicaoCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryPecasReposicaoCODUSUARIOALT.AsString  := DM.FCodUsuario;
DM.qryPecasReposicaoESTOCAVEL.AsString      := 'S';
DM.qryPecasReposicaoKIT.AsString            := 'N';
DM.qryPecasReposicaoFABRICADA.AsString      := 'N';

EdtCodPeca.ReadOnly := False;
EdtCodPeca.SetFocus;
end;

procedure TFrmTelaCadPecasReposicao.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryPecasReposicaoCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodPeca.SetFocus; Exit;
  end;
DM.FTabela_auxiliar  := 36;
DM.FParamAuxiliar[1] := 'CODIGO';
if (DM.VerificaDuplo(EdtCodPeca.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodPeca.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryPecasReposicaoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryPecasReposicaoCODFAMILIAPECAREP.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!'; EdtDescFamiliaPeca.SetFocus; Exit;
  end;
if DM.qryPecasReposicaoCODFABRICANTE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FABRICANTE DO REGISTRO!'; EdtDescFabricante.SetFocus; Exit;
  end;
if DM.qryPecasReposicaoCODFORNECEDOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FORNCEDOR DO REGISTRO!'; EdtDescFornecedor.SetFocus; Exit;
  end;
if DM.qryPecasReposicaoREFERENCIA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A REFERÊNCIA DO REGISTRO!'; EdtReferencia.SetFocus; Exit;
  end;
if DM.qryPecasReposicaoPRECO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PREÇO DO REGISTRO!'; EdtPreco.SetFocus;
    Exit;
  end;
if DM.qryPecasReposicaoQUANTIDADE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A QUANTIDADE DO REGISTRO!'; EdtQuantidade.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodPeca.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;

DM.MSGAguarde('');

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodPeca.ReadOnly := True;

DM.qryPecasReposicaoDados.Edit;
if DM.qryPecasReposicaoDadosCODIGO.IsNull = True then
  begin
    DM.qryPecasReposicaoDadosCODEMPRESA.AsString := DM.FCodEmpresa;
    DM.qryPecasReposicaoDadosCODPECAREPOSICAO.AsString := DM.qryPecasReposicaoCODIGO.AsString;
  end;
DM.qryPecasReposicaoDadosCODFAMILIAPECASREP.AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
DM.qryPecasReposicaoDados.Post;
DM.qryPecasReposicaoDados.Edit;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadPecasReposicao.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar  := 36;
DM.FParamAuxiliar[1] := 'DESCRICAO';
  inherited;
if DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString <> EmptyStr then
  begin
    DM.qryFamPecasRep.Close;
    DM.qryFamPecasRep.Params[0].AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
    DM.qryFamPecasRep.Open;

    DM.qryPecasReposicaoDados.Close;
    DM.qryPecasReposicaoDados.Params[0].AsString := DM.FCodEmpresa;
    DM.qryPecasReposicaoDados.Params[1].AsString := DM.qryPecasReposicaoCODFAMILIAPECAREP.AsString;
    DM.qryPecasReposicaoDados.Params[2].AsString := DM.qryPecasReposicaoCODIGO.AsString;
    DM.qryPecasReposicaoDados.Open;
    DM.qryPecasReposicaoDados.Edit;

    if DM.qryFamPecasRepCAMPO1.AsString = EmptyStr then EdtCampo1.Visible := False else EdtCampo1.Visible := True;
    if DM.qryFamPecasRepCAMPO2.AsString = EmptyStr then EdtCampo2.Visible := False else EdtCampo2.Visible := True;
    if DM.qryFamPecasRepCAMPO3.AsString = EmptyStr then EdtCampo3.Visible := False else EdtCampo3.Visible := True;
    if DM.qryFamPecasRepCAMPO4.AsString = EmptyStr then EdtCampo4.Visible := False else EdtCampo4.Visible := True;
    if DM.qryFamPecasRepCAMPO5.AsString = EmptyStr then EdtCampo5.Visible := False else EdtCampo5.Visible := True;
    if DM.qryFamPecasRepCAMPO6.AsString = EmptyStr then EdtCampo6.Visible := False else EdtCampo6.Visible := True;
    if DM.qryFamPecasRepCAMPO7.AsString = EmptyStr then EdtCampo7.Visible := False else EdtCampo7.Visible := True;
    if DM.qryFamPecasRepCAMPO8.AsString = EmptyStr then EdtCampo8.Visible := False else EdtCampo8.Visible := True;
    if DM.qryFamPecasRepCAMPO9.AsString = EmptyStr then EdtCampo9.Visible := False else EdtCampo9.Visible := True;
    if DM.qryFamPecasRepCAMPO10.AsString = EmptyStr then EdtCampo10.Visible := False else EdtCampo10.Visible := True;
    if DM.qryFamPecasRepCAMPO11.AsString = EmptyStr then EdtCampo11.Visible := False else EdtCampo11.Visible := True;
    if DM.qryFamPecasRepCAMPO12.AsString = EmptyStr then EdtCampo12.Visible := False else EdtCampo12.Visible := True;
  end;

DM.ExibeFoto(DM.qryPecasReposicao, 'IMAGEM', FrmTelaCadPecasReposicao.ImgFotoPeca);
end;

procedure TFrmTelaCadPecasReposicao.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    if (DM.qryUsuarioPAcessoCADPECASREPKIT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryPecaReposicaoKitCODIGO, DM.qryFormatoCodigoPECASREPOSICAOKIT, FrmTelaCadPecasReposicaoKit) = False then exit;
    Application.CreateForm(TFrmTelaCadPecasReposicaoKit, FrmTelaCadPecasReposicaoKit);
    FrmTelaCadPecasReposicaoKit.Caption := 'Kit de Peças de Reposição';
    FrmTelaCadPecasReposicaoKit.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPecasReposicaoKit);
    DM.FDataSetParam    := DM.qryPecasReposicao;
    DM.FDataSourceParam := DM.dsPecasReposicao;
    DM.FTela := 'CADPECASREP';
    DM.FTabela_auxiliar  := 36;
  End;

end;

procedure TFrmTelaCadPecasReposicao.Button2Click(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.qryPecasReposicao.IsEmpty = True then Exit;

DM.qryPecasReposicaoInstPecas.Close;
DM.qryPecasReposicaoInstPecas.Params[0].AsString := DM.qryPecasReposicaoCODIGO.AsString;
DM.qryPecasReposicaoInstPecas.Params[1].AsString := DM.FCodEmpresa;
DM.qryPecasReposicaoInstPecas.Open;
if DM.qryPecasReposicaoInstPecas.IsEmpty = False then
  begin
    DmRelatorios.frxDBPecasRepInstPeca.DataSource := DM.dsPecasReposicaoInstPecas;
    DmRelatorios.frxRPecasRepInstPeca.ShowReport();
  end;
DM.qryPecasReposicaoInstPecas.Close;

DM.FDataSetParam    := DM.qryPecasReposicao;
DM.FDataSourceParam := DM.dsPecasReposicao;
DM.FTela := 'CADPECASREP';
DM.FTabela_auxiliar  := 36;
end;

procedure TFrmTelaCadPecasReposicao.Button3Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryPecasReposicaoCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        DM.FTabela_auxiliar  := 360;
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;

    DM.qryPecasReposicaoHistPecas.Close;
    DM.qryPecasReposicaoHistPecas.Params[0].AsString := DM.FCodEmpresa;
    DM.qryPecasReposicaoHistPecas.Params[1].AsString := DM.FParamAuxiliar[0];
    DM.qryPecasReposicaoHistPecas.Open;

    Application.CreateForm(TFrmTelaCadPecasReposicaoHist, FrmTelaCadPecasReposicaoHist);
    FrmTelaCadPecasReposicaoHist.GrdOS.DataSource := DM.dsPecasReposicaoHistPecas;
    //FrmTelaCadPecasReposicaoHist.Caption := 'Histórico da Peça: '+ DM.FValorCombo;
    FrmTelaCadPecasReposicaoHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPecasReposicaoHist);
    DM.FDataSetParam    := DM.qryPecasReposicao;
    DM.FDataSourceParam := DM.dsPecasReposicao;
    DM.FTela := 'CADPECASREP';
    DM.FTabela_auxiliar  := 36;
  End;
end;

procedure TFrmTelaCadPecasReposicao.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBPecasRepGeral;
DM.FTabela_auxiliar := 36;
  inherited;

end;

procedure TFrmTelaCadPecasReposicao.EdtCodPecaExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadPecasReposicao.EdtDescricaoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
DM.FParamAuxiliar[1] := 'DESCRICAO';
if (DM.VerificaDuplo(EdtDescricao.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtDescricao.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Abort;
  end;
end;

procedure TFrmTelaCadPecasReposicao.EdtReferenciaExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
DM.FParamAuxiliar[1] := 'REFERENCIA';
if (DM.VerificaDuplo(EdtReferencia.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtReferencia.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Abort;
  end;
end;

procedure TFrmTelaCadPecasReposicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryPecasReposicao.Close;
DM.qryFamPecasRep.Close;
DM.qryPecasReposicaoDados.Close;
end;

procedure TFrmTelaCadPecasReposicao.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryPecasReposicao;
DM.FDataSourceParam := DM.dsPecasReposicao;
DM.FTela := 'CADPECASREP';
end;

procedure TFrmTelaCadPecasReposicao.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBPecasRepIndividual;
DM.FTabela_auxiliar := 361;
  inherited;
end;

end.

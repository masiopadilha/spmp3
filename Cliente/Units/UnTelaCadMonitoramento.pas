unit UnTelaCadMonitoramento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param,
  Vcl.Buttons;

type
  TFrmTelaCadMonitoramento = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    Label17: TLabel;
    Label11: TLabel;
    CBTipo: TDBComboBox;
    Label25: TLabel;
    Label6: TLabel;
    EdtDescPonto: TDBEdit;
    BtnPonto: TButton;
    Label19: TLabel;
    Label5: TLabel;
    EdtDescLocal: TDBEdit;
    BtnPontoLocal: TButton;
    GrafMonit: TDBChart;
    Label7: TLabel;
    BtnEquipamento: TButton;
    GrdCadastro: TDBGrid;
    Label9: TLabel;
    Label14: TLabel;
    BtnContador: TButton;
    EdtDescContador: TDBEdit;
    Label15: TLabel;
    Series1: TBarSeries;
    Label16: TLabel;
    LblProgramacao: TDBText;
    PopupMenuCons: TPopupMenu;
    Codigo1: TMenuItem;
    Descricao1: TMenuItem;
    Label18: TLabel;
    edtPlanoTrab: TDBEdit;
    BtnPlanoTrab: TButton;
    edtCodEquip: TEdit;
    edtDescEquip: TEdit;
    EdtLimInfMax: TEdit;
    EdtLimInf: TEdit;
    EdtLimSup: TEdit;
    EdtLimSupMax: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GrdCadastroTitleClick(Column: TColumn);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure CBTipoChange(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnPontoClick(Sender: TObject);
    procedure BtnPontoLocalClick(Sender: TObject);
    procedure BtnContadorClick(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
    procedure BtnPlanoTrabClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure edtPlanoTrabDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadMonitoramento: TFrmTelaCadMonitoramento;

Const
  INDICE_DEFAULT = 'DEFAULT_ORDER';
  GRID_COR_INDICE_TITULO = clCream;

implementation

{$R *.dfm}

uses UnTelaCadMonitMedicoes, UnTelaConsulta, UnTelaCadOrdemServico,
  UnTelaCadPontoInspecao, UnTelaCadContadores, UnTelaCadPlanoTrabalho,
  UnDmRelatorios, UnDM;

procedure TFrmTelaCadMonitoramento.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryMonitoramento.Active = False then Exit;
if DM.qryMonitMedicoesPtosInsp.Active = True then
  DM.qryMonitMedicoesPtosInsp.Cancel;
if DM.qryMonitMedicoesCont.Active = True then
  DM.qryMonitMedicoesCont.Cancel;
DM.qryMonitoramento.Cancel;
if DM.qryMonitoramento.IsEmpty = True then
  begin
    GrafMonit.Series[0].Clear;
    edtCodEquip.Text  := '';
    edtDescEquip.Text := '';
    EdtLimInfMax.Text := '';
    EdtLimInf.Text    := '';
    EdtLimSup.Text    := '';
    EdtLimSupMax.Text := '';

    EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
    EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
    EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
    EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;
  end;
end;

procedure TFrmTelaCadMonitoramento.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar  := 86;
  inherited;
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspeção' then
  begin
    GrdCadastro.DataSource        := DM.dsMonitMedicoesPtosInsp;

    BtnPonto.Enabled := True;
    BtnPontoLocal.Enabled := True;
    BtnContador.Enabled := False;
    GrafMonit.Series[0].Clear;

    edtCodEquip.Text  := '';
    edtDescEquip.Text := '';
    EdtLimInfMax.Text := '';
    EdtLimInf.Text    := '';
    EdtLimSup.Text    := '';
    EdtLimSupMax.Text := '';

    EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
    EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
    EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
    EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;
  end
else
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
  begin
    GrdCadastro.DataSource        := DM.dsMonitMedicoesCont;

    BtnPonto.Enabled := False;
    BtnPontoLocal.Enabled := False;
    BtnContador.Enabled := True;
    GrafMonit.Series[0].Clear;

    edtCodEquip.Text  := '';
    edtDescEquip.Text := '';
    EdtLimInfMax.Text := '';
    EdtLimInf.Text    := '';
    EdtLimSup.Text    := '';
    EdtLimSupMax.Text := '';

    EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
    EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
    EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
    EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;
  end;

end;

procedure TFrmTelaCadMonitoramento.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryMonitoramentoCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryMonitoramentoDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryMonitoramentoDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryMonitoramentoCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryMonitoramentoCODUSUARIOALT.AsString  := DM.FCodUsuario;

DM.qryMonitMedicoesPtosInsp.Close;
DM.qryMonitMedicoesCont.Close;
GrafMonit.Series[0].Clear;

edtCodEquip.Text  := '';
edtDescEquip.Text := '';

CBTipo.SetFocus;
end;

procedure TFrmTelaCadMonitoramento.BtnPlanoTrabClick(Sender: TObject);
begin
  inherited;
if DM.qryMonitoramento.Active = False then Exit;
if DM.qryMonitoramento.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 410;
    DM.FNomeConsulta := 'Planos de Trabalho';
    DM.qryMonitoramento.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryMonitoramentoCODPLANOTRABALHO.AsString := DM.FCodCombo;
        DM.qryMonitoramentoPLANOTRABALHO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
     if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
     if DM.AplicarMascara(DM.qryPlanoTrabalhoCODIGO, DM.qryFormatoCodigoPLANOTRABALHO, FrmTelaCadPlanoTrabalho) = False then exit;
     Application.CreateForm(TFrmTelaCadPlanoTrabalho, FrmTelaCadPlanoTrabalho);
     FrmTelaCadPlanoTrabalho.ShowModal;
   Finally
     FreeAndNil(FrmTelaCadPlanoTrabalho);
   End;
  end;

DM.FDataSetParam    := DM.qryMonitoramento;
DM.FDataSourceParam := DM.dsMonitoramento;
DM.FTabela_auxiliar := 86;
DM.FTela            := 'CADMONITORAMENTO';
end;

procedure TFrmTelaCadMonitoramento.BtnPontoClick(Sender: TObject);
begin
  inherited;
if DM.qryMonitoramento.Active = False then Exit;
if DM.qryMonitoramento.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 380;
    DM.FNomeConsulta := 'Pontos de Inspeção';
    DM.qryMonitoramento.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryMonitoramentoCODPONTOINSPECAO.AsString := DM.FCodCombo;
        DM.qryMonitoramentoPONTOINSPECAO.AsString := DM.FValorCombo;
        DM.qryMonitoramentoCODCONTADOR.AsString      := EmptyStr;
        DM.qryMonitoramentoCONTADOR.Clear;
      end;
  end
else
  begin
    Try
     if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
     if DM.AplicarMascara(DM.qryPontosInspecaoCODIGO, DM.qryFormatoCodigoPONTOSINSPECAO, FrmTelaCadPontoInspecao) = False then exit;
     Application.CreateForm(TFrmTelaCadPontoInspecao, FrmTelaCadPontoInspecao);
     FrmTelaCadPontoInspecao.ShowModal;
   Finally
     FreeAndNil(FrmTelaCadPontoInspecao);
   End;
  end;

DM.FDataSetParam    := DM.qryMonitoramento;
DM.FDataSourceParam := DM.dsMonitoramento;
DM.FTabela_auxiliar := 86;
DM.FTela            := 'CADMONITORAMENTO';
end;

procedure TFrmTelaCadMonitoramento.BtnPontoLocalClick(Sender: TObject);
begin
  inherited;
if DM.qryMonitoramento.Active = False then Exit;
if DM.qryMonitoramento.IsEmpty = True then Exit;
if DM.qryMonitoramentoCODPONTOINSPECAO.AsString = EmptyStr then
  begin
    EdtDescPonto.SetFocus;
    Exit;
  end;
DM.FTabela_auxiliar := 87;
DM.FNomeConsulta := 'Locais de Medição';
DM.FParamAuxiliar[1] := DM.qryMonitoramentoCODPONTOINSPECAO.AsString;
DM.qryMonitoramento.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryMonitoramentoCODPONTOINSPLOC.AsString := DM.FCodCombo;
    DM.qryMonitoramentoPONTOINSPLOC.AsString := DM.FValorCombo;
  end;

DM.FTabela_auxiliar := 86;
DM.FDataSetParam    := DM.qryMonitoramento;
DM.FDataSourceParam := DM.dsMonitoramento;
end;

procedure TFrmTelaCadMonitoramento.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryMonitoramentoTIPOPONTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO REGISTRO!'; CBTipo.SetFocus; Exit;
  end;
if DM.qryMonitoramentoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspeção' then
  if DM.qryMonitoramentoCODPONTOINSPECAO.IsNull = True then
    begin
      PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PONTO DE INSPEÇÃO DO REGISTRO!'; EdtDescPonto.SetFocus; Exit;
    end;
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspeção' then
  if DM.qryMonitoramentoCODPONTOINSPLOC.IsNull = True then
    begin
      PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O LOCAL DO PONTO DE INSPEÇÃO DO REGISTRO!'; EdtDescLocal.SetFocus; Exit;
    end;
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
  if DM.qryMonitoramentoCODCONTADOR.IsNull = True then
    begin
      PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PONTO DE INSPEÇÃO DO REGISTRO!'; EdtDescContador.SetFocus; Exit;
    end;

if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
  begin
    DM.FTabela_auxiliar := 86;
    if (DM.VerificaDuplo(DM.qryMonitoramentoCODCONTADOR.AsString) = True) and (DM.FAlterando = False) then
      begin
        EdtDescContador.SetFocus; PAuxiliares.Font.Color := clBlack; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
      end;
  end;

DM.MSGAguarde('');

  inherited;
DM.qryMonitoramento.Params[0].AsInteger := DM.qryMonitoramentoCODIGO.AsInteger;
DM.qryMonitoramento.Params[1].AsString := DM.FCodEmpresa;

DM.qryMonitoramento.Refresh;

if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadMonitoramento.Button1Click(Sender: TObject);
var
I: SmallInt;
begin
  inherited;
if (DM.FAlterando = False) or (DM.qryMonitoramentoCODIGO.AsInteger <= 0) then
  begin
    if Application.MessageBox('Para consultar o equipamento, o registro deverá ser gravado, deseja continuar?', 'SPMP3', MB_ICONQUESTION + MB_YESNO) = IDYes then
      begin
        BtnSalvar.OnClick(Sender);
        BtnEquipamento.SetFocus;
      end
    else
      Exit;
  end;

DM.FParamAuxiliar[0] := DM.qryMonitoramentoCODIGO.AsString;
if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);

if DM.FParamAuxiliar[1] = EmptyStr then //Ponto de Inspeção ou Contador
  begin
    if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspeção' then
      begin
        DM.FParamAuxiliar[1] := DM.qryMonitoramentoCODPONTOINSPECAO.AsString;
        DM.FTabela_auxiliar := 88;
      end
    else
      begin
        DM.FParamAuxiliar[1] := DM.qryMonitoramentoCODCONTADOR.AsString;
        DM.FTabela_auxiliar := 89;
      end;
  end;
DM.FParamAuxiliar[2] := EdtCodEquip.Text;

//DM.FParamAuxiliar[8] := 'DESCRICAO';
//DM.FNomeConsulta := 'Equipamentos';
//Try
//  Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
//  FrmTelaAuxiliar.Caption := DM.FNomeConsulta;
//  FrmTelaAuxiliar.ShowModal;
//Finally
//  FreeAndNil(FrmTelaAuxiliar);
//End;

if DM.FParamAuxiliar[2] = EmptyStr then
  begin
    EdtCodEquip.SetFocus;
    Exit;
  end;

Try
  Application.CreateForm(TFrmTelaCadMonitMedicoes, FrmTelaCadMonitMedicoes);
  FrmTelaCadMonitMedicoes.ShowModal;
Finally
  FreeAndNil(FrmTelaCadMonitMedicoes);
  GrafMonit.Series[0].Clear;
  GrdCadastro.DataSource.DataSet.Last;
  for I := 0 to 49 do
    begin
      if GrdCadastro.DataSource.DataSet.RecordCount - 1 >= I then
        GrafMonit.Series[0].Add(GrdCadastro.DataSource.DataSet.FieldByName('MEDICAO').AsFloat, IntToStr(I + 1))
      else
        GrafMonit.Series[0].Add(0, IntToStr(I + 1));

      GrdCadastro.DataSource.DataSet.Prior;
    end;
  GrdCadastro.DataSource.DataSet.Close;
  GrdCadastro.DataSource.DataSet.Open;
End;

DM.FParamAuxiliar[8] := '';

DM.FTabela_auxiliar := 86;
DM.FDataSetParam    := DM.qryMonitoramento;
DM.FDataSourceParam := DM.dsMonitoramento;
end;

procedure TFrmTelaCadMonitoramento.CBTipoChange(Sender: TObject);
begin
  inherited;
if CBTipo.Text = 'Ponto de Inspeção' then
  begin
    GrdCadastro.DataSource        := DM.dsMonitMedicoesPtosInsp;
    BtnPonto.Enabled      := True;
    BtnPontoLocal.Enabled := True;
    BtnContador.Enabled   := False;
  end
else
if CBTipo.Text = 'Contador' then
  begin
    GrdCadastro.DataSource := DM.dsMonitMedicoesCont;
    BtnContador.Enabled   := True;
    BtnPonto.Enabled      := False;
    BtnPontoLocal.Enabled := False;
  end;
end;

procedure TFrmTelaCadMonitoramento.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[8] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadMonitoramento.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[8] := 'DESCRICAO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadMonitoramento.edtPlanoTrabDblClick(Sender: TObject);
begin
  inherited;
if DM.qryMonitoramento.IsEmpty = True then Exit;

DM.qryMonitoramentoCODPLANOTRABALHO.AsString := '';
DM.qryMonitoramentoPLANOTRABALHO.AsString := '';
end;

procedure TFrmTelaCadMonitoramento.BtnContadorClick(Sender: TObject);
begin
  inherited;
if DM.qryMonitoramento.Active = False then Exit;
if DM.qryMonitoramento.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 390;
    DM.FNomeConsulta := 'Contadores';
    DM.qryMonitoramento.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryMonitoramentoCODCONTADOR.AsString      := DM.FCodCombo;
        DM.qryMonitoramentoCONTADOR.AsString         := DM.FValorCombo;
        DM.qryMonitoramentoPROGRAMACAO.AsString      := DM.FParamAuxiliar[3];
        DM.qryMonitoramentoCODPONTOINSPECAO.AsString := EmptyStr;
        DM.qryMonitoramentoPONTOINSPECAO.AsString    := EmptyStr;
        DM.qryMonitoramentoCODPONTOINSPLOC.AsString  := EmptyStr;
        DM.qryMonitoramentoPONTOINSPLOC.AsString     := EmptyStr;
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
     if DM.AplicarMascara(DM.qryContadoresCODIGO, DM.qryFormatoCodigoPONTOSINSPECAO, FrmTelaCadContadores) = False then exit;
     Application.CreateForm(TFrmTelaCadContadores, FrmTelaCadContadores);
     FrmTelaCadContadores.ShowModal;
   Finally
     FreeAndNil(FrmTelaCadContadores);
   End;
  end;

DM.FDataSetParam    := DM.qryMonitoramento;
DM.FDataSourceParam := DM.dsMonitoramento;
DM.FTabela_auxiliar := 86;
DM.FTela            := 'CADMONITORAMENTO';
end;

procedure TFrmTelaCadMonitoramento.BtnEquipamentoClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
if DM.qryMonitoramento.Active = False then Exit;
if DM.qryMonitoramento.IsEmpty = True then Exit;
if DM.qryMonitoramentoTIPOPONTO.AsString = EmptyStr then Exit;

if (DM.FAlterando = False) or (DM.qryMonitoramentoCODIGO.AsInteger <= 0) then
  begin
    if Application.MessageBox('Para consultar o equipamento, o registro deverá ser gravado, deseja continuar?', 'SPMP3', MB_ICONQUESTION + MB_YESNO) = IDYes then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end
    else
      Exit;
  end;

if DM.FParamAuxiliar[8] = '' then
  begin
    PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
    Exit;
  end
else
  begin
    if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspeção' then
      begin
        DM.FParamAuxiliar[1] := DM.qryMonitoramentoCODPONTOINSPECAO.AsString;
        DM.FTabela_auxiliar := 88;
        DM.FNomeConsulta := 'Pontos de Inspeção';
      end
    else
    if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
      begin
        DM.FParamAuxiliar[1] := DM.qryMonitoramentoCODCONTADOR.AsString;
        DM.FTabela_auxiliar := 89;
        DM.FNomeConsulta := 'Contadores';
      end;
  end;

if DM.ConsultarCombo <> EmptyStr then
  begin
    GrafMonit.Series[0].Clear;

    if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspeção' then
      begin
        DM.qryMonitMedicoesPtosInsp.Close;
        DM.qryMonitMedicoesPtosInsp.Params[0].AsString := DM.FCodEmpresa;
        DM.qryMonitMedicoesPtosInsp.Params[1].AsString := DM.FCodCombo;
        DM.qryMonitMedicoesPtosInsp.Params[2].AsString := DM.qryMonitoramentoCODIGO.AsString;
        DM.qryMonitMedicoesPtosInsp.Open;

        DM.FParamAuxiliar[2] := DM.FCodCombo;
      end
    else
    if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
      begin
        DM.qryMonitMedicoesCont.Close;
        DM.qryMonitMedicoesCont.Params[0].AsString := DM.FCodEmpresa;
        DM.qryMonitMedicoesCont.Params[1].AsString := DM.FCodCombo;
        DM.qryMonitMedicoesCont.Params[2].AsString := DM.qryMonitoramentoCODIGO.AsString;
        DM.qryMonitMedicoesCont.Open;

        edtCodEquip.Text  := '';
        edtDescEquip.Text := '';
        EdtLimInfMax.Text := '';
        EdtLimInf.Text    := '';
        EdtLimSup.Text    := '';
        EdtLimSupMax.Text := '';

        EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
        EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
        EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
        EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;

        DM.FParamAuxiliar[2] := DM.FCodCombo;
      end;

    edtCodEquip.Text  := DM.FParamAuxiliar[2];
    edtDescEquip.Text := DM.FParamAuxiliar[3];
    EdtLimInfMax.Text := DM.FParamAuxiliar[4];
    EdtLimInf.Text    := DM.FParamAuxiliar[5];
    EdtLimSup.Text    := DM.FParamAuxiliar[6];
    EdtLimSupMax.Text := DM.FParamAuxiliar[7];


    GrdCadastro.DataSource.DataSet.Last;
    for I := 0 to 49 do
      begin
        if GrdCadastro.DataSource.DataSet.RecordCount - 1 >= I then
          GrafMonit.Series[0].Add(GrdCadastro.DataSource.DataSet.FieldByName('MEDICAO').AsFloat, IntToStr(I + 1))
        else
          GrafMonit.Series[0].Add(0, IntToStr(I + 1));

        GrdCadastro.DataSource.DataSet.Prior;
      end;
  end;

DM.FParamAuxiliar[8] := '';
DM.FTabela_auxiliar  := 86;
DM.FDataSetParam     := DM.qryMonitoramento;
DM.FDataSourceParam  := DM.dsMonitoramento;
end;

procedure TFrmTelaCadMonitoramento.BtnExcluirClick(Sender: TObject);
begin
  inherited;
GrafMonit.Series[0].Clear;
DM.qryMonitMedicoesPtosInsp.Close;
DM.qryMonitMedicoesCont.Close;
edtCodEquip.Text  := '';
edtDescEquip.Text := '';
EdtLimInfMax.Text := '';
EdtLimInf.Text    := '';
EdtLimSup.Text    := '';
EdtLimSupMax.Text := '';

EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;

end;

procedure TFrmTelaCadMonitoramento.BtnImprimirClick(Sender: TObject);
begin
//  inherited;
if DM.FDataSetParam.IsEmpty = True then Exit;
DM.qryMonitoramentoPlanoTrab.Open;
DmRelatorios.frxRMonitoramento.ShowReport();
DM.qryMonitoramentoPlanoTrab.Close;
DM.qryMonitoramento.Edit;
end;

procedure TFrmTelaCadMonitoramento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryMonitMedicoesPtosInsp.Close;
DM.qryMonitMedicoesCont.Close;
DM.qryMonitoramento.Close;
end;

procedure TFrmTelaCadMonitoramento.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryMonitoramento;
DM.FDataSourceParam := DM.dsMonitoramento;
DM.FTela            := 'CADMONITORAMENTO';
end;

procedure TFrmTelaCadMonitoramento.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
if (GrdCadastro.SelectedIndex = 2) and (GrdCadastro.DataSource.DataSet.FieldByName('OSGERADA').AsString <> EmptyStr) then
  begin
    with DM.qryOrdemServico do
      begin
        Close;
        Params[0].AsString  := DM.FCodEmpresa;
        Params[1].AsInteger := GrdCadastro.DataSource.DataSet.FieldByName('OSGERADA').AsInteger;
        Open;
        Edit;
      end;

    Try
      if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadOrdemServico, FrmTelaCadOrdemServico);
      FrmTelaCadOrdemServico.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadOrdemServico);
    End;
  end;
end;

procedure TFrmTelaCadMonitoramento.GrdCadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadMonitoramento.GrdCadastroTitleClick(Column: TColumn);
begin
  inherited;
//if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspeção' then
//  DM.CliqueNoTitulo(Column, DM.qryMonitMedicoesPtosInsp)
//else
//if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
//  DM.CliqueNoTitulo(Column, DM.qryMonitMedicoesCont);
end;

end.


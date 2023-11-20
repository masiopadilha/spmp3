unit UnTelaCadOrdemServicoTercUnid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  VclTee.TeeGDIPlus, Data.DB, Datasnap.DBClient, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.GanttCh, VCLTee.TeeProcs, VCLTee.Chart, JvExMask, JvToolEdit,
  JvDBControls, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, System.DateUtils, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadOrdemServicoTercUnid = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    Label19: TLabel;
    Label5: TLabel;
    EdtCodCentroCusto: TDBEdit;
    EdtDescCentroCusto: TDBEdit;
    BtnCentroCusto: TButton;
    Label20: TLabel;
    Label16: TLabel;
    PSituacao: TPanel;
    EdtContrato: TDBEdit;
    Label11: TLabel;
    Chart1: TChart;
    Series1: TGanttSeries;
    Label6: TLabel;
    EdtDataContratoIni: TJvDBDateEdit;
    Label7: TLabel;
    EdtDataContratoFin: TJvDBDateEdit;
    Label10: TLabel;
    EdtResponsavel: TDBEdit;
    BtnResponsavel: TButton;
    Label24: TLabel;
    Label8: TLabel;
    EdtValorInicial: TDBEdit;
    Label13: TLabel;
    Label9: TLabel;
    EdtValorFinal: TDBEdit;
    Label12: TLabel;
    EdtParcelas: TDBEdit;
    Label14: TLabel;
    ChbParado: TDBCheckBox;
    ChbAutonomo: TDBCheckBox;
    EdtMatricula: TDBEdit;
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure MontarGrafico;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BtnCentroCustoClick(Sender: TObject);
    procedure BtnResponsavelClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercUnid: TFrmTelaCadOrdemServicoTercUnid;

implementation

{$R *.dfm}

uses UnTelaCadOrdemServicoTercUnidTarefas,
  UnTelaCadOrdemServicoTercUnidAditivos, UnTelaCadOrdemServicoTercUnidMateriais,
  UnTelaCadOrdemServicoTercUnidRecursos, UnTelaCadOrdemServicoTercUnidPecas,
  UnTelaCadCentroCusto, UnTelaCadFuncionarios,
  UnTelaCadOrdemServicoTercUnidMedicoes, UnDM;

procedure TFrmTelaCadOrdemServicoTercUnid.BtnCentroCustoClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnid.Active = False then Exit;
if DM.qryOrdemServicoTercUnid.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 400;
    DM.FNomeConsulta := 'Centros de Custos';
    DM.qryOrdemServicoTercUnid.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoTercUnidCODCENTROCUSTO.AsString := DM.FCodCombo;
        DM.qryOrdemServicoTercUnidCENTROCUSTO.AsString := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qryOrdemServicoTercUnid;
DM.FDataSourceParam := DM.dsOrdemServicoTercUnid;
DM.FTela            := 'CADTERCEIRIZADAS';
DM.FTabela_auxiliar := 66;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 66;
  inherited;
if DM.qryOrdemServicoTercUnidCODIGO.AsString <> EmptyStr then
  begin
    if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'ABERTA'  then
      begin
        PSituacao.Caption := 'ABERTA';
        PSituacao.Color := clYellow;
        PSituacao.Font.Color := clRed;

        PIdentificacao.Enabled := True;
        PDiversos.Enabled := True;
      end;
    if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then
      begin
        PSituacao.Caption := 'FECHADA';
        PSituacao.Color := clGray;
        PSituacao.Font.Color := clBlack;

        PIdentificacao.Enabled := False;
        PDiversos.Enabled := False;
      end;

    MontarGrafico;
  end;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.btnFecharClick(Sender: TObject);
begin
  inherited;
  if DM.qryOrdemServicoTercUnid.IsEmpty = True then Exit;
  if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then Exit;

  if Application.MessageBox('Os dados da ordem de serviço não poderão ser alterados, deseja realmente confirmar o fechamento?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
    begin
      DM.qryDataHoraServidor.Refresh;
      DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

      DM.qryOrdemServicoTercUnid.Edit;
      DM.qryOrdemServicoTercUnidSITUACAO.AsString := 'FECHADA';
      DM.qryOrdemServicoTercUnidDATAFECHAMENTO.AsDateTime := DateOf(DM.FDataHoraServidor);
      DM.qryOrdemServicoTercUnid.Post;
      PSituacao.Caption := 'FECHADA'; PSituacao.Color := clGray;   PSituacao.Font.Color := clBlack;
    end;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

//DM.qryOrdemServicoTercUnidCODIGO.AsInteger        := DM.RetornaProximoIndice('ordemservicotercunid');
DM.qryOrdemServicoTercUnidCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryOrdemServicoTercUnidRECURSOS.AsString       := 'N';
DM.qryOrdemServicoTercUnidMATERIAL.AsString       := 'N';
DM.qryOrdemServicoTercUnidVALORCONTRATO.AsFloat   := 0;
DM.qryOrdemServicoTercUnidVALORFINAL.AsFloat      := 0;
DM.qryOrdemServicoTercUnidNUMPARCELAS.AsFloat     := 0;
DM.qryOrdemServicoTercUnidSITUACAO.AsString       := 'ABERTA';

PSituacao.Caption    := 'ABERTA';
PSituacao.Color      := clYellow;
PSituacao.Font.Color := clRed;

EdtDescricao.ReadOnly := False;
EdtDescricao.SetFocus;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.BtnResponsavelClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnid.Active = False then Exit;
if DM.qryOrdemServicoTercUnid.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.qryOrdemServicoTercUnid.Edit;
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoTercUnidMATRICULA.AsString := DM.FCodCombo;
        DM.qryOrdemServicoTercUnidFUNCIONARIO.AsString := DM.FValorCombo;
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
end;

procedure TFrmTelaCadOrdemServicoTercUnid.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

if DM.qryOrdemServicoTercUnidDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DA O.S.!'; EdtDescricao.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidCODCENTROCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CENTRO DE CUSTO DA O.S.!'; EdtDescCentroCusto.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidCONTRATO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONTRATO DA O.S.!'; EdtContrato.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidDATACONTRATOINI.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O INÍCIO DO CONTRATO!'; EdtDataContratoIni.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidDATACONTRATOFIN.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FIM DO CONTRATO!'; EdtDataContratoFin.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidVALORCONTRATO.AsFloat <= 0 then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O VALOR DO CONTRATO!'; EdtValorInicial.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidMATRICULA.AsString = '' then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A MATRÍCULA DO RESPONSÁVEL!'; EdtResponsavel.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidNUMPARCELAS.AsInteger <= 0  then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O NÚMERO DE PARCELAS DO CONTRATO!'; EdtParcelas.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercUnidVALORFINAL.AsFloat = 0 then
  begin
    DM.qryOrdemServicoTercUnid.Edit;
    DM.qryOrdemServicoTercUnidVALORFINAL.AsFloat := DM.qryOrdemServicoTercUnidVALORCONTRATO.AsFloat;
    DM.qryOrdemServicoTercUnid.Post;
  end;

  inherited;
DM.qryOrdemServicoTercUnid.Params[0].AsString := DM.qryOrdemServicoTercUnidCODIGO.AsString;

if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

DM.qryOrdemServicoTercUnidMedicoes.Edit;
DM.qryOrdemServicoTercUnidMedicoes.Post;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoTercUnidCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    Application.CreateForm(TFrmTelaCadOrdemServicoTercUnidTarefas, FrmTelaCadOrdemServicoTercUnidTarefas);
    FrmTelaCadOrdemServicoTercUnidTarefas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercUnidTarefas);
    MontarGrafico;
  End;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.Button2Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoTercUnidCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    Application.CreateForm(TFrmTelaCadOrdemServicoTercUnidAditivos, FrmTelaCadOrdemServicoTercUnidAditivos);
    if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then
      begin
        FrmTelaCadOrdemServicoTercUnidAditivos.GrdAditivos.ReadOnly := True;
        FrmTelaCadOrdemServicoTercUnidAditivos.MMotivo.ReadOnly := True;
      end;
    FrmTelaCadOrdemServicoTercUnidAditivos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercUnidAditivos);
  End;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.Button3Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoTercUnidCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    Application.CreateForm(TFrmTelaCadOrdemServicoTercUnidMateriais, FrmTelaCadOrdemServicoTercUnidMateriais);
    if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then
      begin
        FrmTelaCadOrdemServicoTercUnidMateriais.GrdMateriais.ReadOnly := True;
      end;
    FrmTelaCadOrdemServicoTercUnidMateriais.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercUnidMateriais);
  End;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.Button4Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoTercUnidCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    Application.CreateForm(TFrmTelaCadOrdemServicoTercUnidPecas, FrmTelaCadOrdemServicoTercUnidPecas);
    if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then
      begin
        FrmTelaCadOrdemServicoTercUnidPecas.GrdCadastro.ReadOnly := True;
      end;
    FrmTelaCadOrdemServicoTercUnidPecas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercUnidPecas);
  End;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.Button5Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoTercUnidCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    Application.CreateForm(TFrmTelaCadOrdemServicoTercUnidRecursos, FrmTelaCadOrdemServicoTercUnidRecursos);
    if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then
      begin
        FrmTelaCadOrdemServicoTercUnidRecursos.GrdRecursos.ReadOnly := True;
      end;
    FrmTelaCadOrdemServicoTercUnidRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercUnidRecursos);
  End;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.Button6Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoTercUnidCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    Application.CreateForm(TFrmTelaCadOrdemServicoTercUnidMedicoes, FrmTelaCadOrdemServicoTercUnidMedicoes);
    if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then
      begin
        FrmTelaCadOrdemServicoTercUnidMedicoes.GrdMedicoes.ReadOnly := True;
      end;

    FrmTelaCadOrdemServicoTercUnidMedicoes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercUnidMedicoes);
    MontarGrafico;
  End;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryOrdemServicoTercUnid.Close;
DM.qryOrdemServicoTercUnidMedicoes.Close;
DM.qryOrdemServicoTercUnidGrafTarefas.Close;
DM.qryOrdemServicoTercUnidTarefasPred.Close;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryOrdemServicoTercUnid;
DM.FDataSourceParam := DM.dsOrdemServicoTercUnid;
DM.FTela := 'CADTERCEIRIZADAS';

DM.qryOrdemServicoTercUnidMedicoes.Open;

if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'ABERTA'  then begin PSituacao.Caption := 'ABERTA';  PSituacao.Color := clYellow; PSituacao.Font.Color := clRed;    end;
if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then begin PSituacao.Caption := 'FECHADA'; PSituacao.Color := clGray;   PSituacao.Font.Color := clBlack;  end;
end;

procedure TFrmTelaCadOrdemServicoTercUnid.MontarGrafico;
var
S, A:Integer;
begin
S := 0;
A := 0;
Series1.Clear;

DM.qryOrdemServicoTercUnidGrafTarefas.Close;
DM.qryOrdemServicoTercUnidGrafTarefas.Params[0].AsString := DM.qryOrdemServicoTercUnidCODIGO.AsString;
DM.qryOrdemServicoTercUnidGrafTarefas.Open;
DM.qryOrdemServicoTercUnidGrafTarefas.First;
while not DM.qryOrdemServicoTercUnidGrafTarefas.Eof = True do
  begin
    Series1.AddGantt(DM.qryOrdemServicoTercUnidGrafTarefasDATAPROGINI.AsDateTime, DM.qryOrdemServicoTercUnidGrafTarefasDATAPROGFIN.AsDateTime, DM.qryOrdemServicoTercUnidGrafTarefas.RecNo, DM.qryOrdemServicoTercUnidGrafTarefasDESCRICAO.AsString);

    DM.qryOrdemServicoTercUnidGrafTarefas.Next;
  end;
{
DM.qryOrdemServicoTercUnidGrafTarefas.First;
For I:= 0 to DM.qryOrdemServicoTercUnidGrafTarefas.RecordCount - 1 do
  begin
    DM.qryOrdemServicoTercUnidGrafTarefas.Edit;
    DM.qryOrdemServicoTercUnidGrafTarefasCODIGO.AsInteger := (DM.qryOrdemServicoTercUnidGrafTarefas.RecordCount - 1) - I;
    DM.qryOrdemServicoTercUnidGrafTarefas.Post;

    DM.qryOrdemServicoTercUnidGrafTarefas.Next;
  end;
}
DM.qryOrdemServicoTercUnidTarefasPred.Close;
DM.qryOrdemServicoTercUnidTarefasPred.Params[0].AsString := DM.qryOrdemServicoTercUnidCODIGO.AsString;
DM.qryOrdemServicoTercUnidTarefasPred.Open;
while not DM.qryOrdemServicoTercUnidTarefasPred.Eof = True do
  begin
    if DM.qryOrdemServicoTercUnidGrafTarefas.Locate('CODIGO', DM.qryOrdemServicoTercUnidTarefasPredCODANTECESSORA.AsInteger, []) = True then
      A := DM.qryOrdemServicoTercUnidGrafTarefasCODIGO.AsInteger;

    if DM.qryOrdemServicoTercUnidGrafTarefas.Locate('CODIGO', DM.qryOrdemServicoTercUnidTarefasPredCODTAREFA.AsInteger, []) = True then
      S := DM.qryOrdemServicoTercUnidGrafTarefasCODIGO.AsInteger;

    Series1.NextTask[S] := A;

    DM.qryOrdemServicoTercUnidGrafTarefas.First;

    DM.qryOrdemServicoTercUnidTarefasPred.Next;
  end;
end;

end.

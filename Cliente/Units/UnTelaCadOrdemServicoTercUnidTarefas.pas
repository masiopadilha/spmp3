unit UnTelaCadOrdemServicoTercUnidTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, JvExMask,
  JvToolEdit, JvMaskEdit, JvDBControls, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoTercUnidTarefas = class(TFrmTelaPaiParametros)
    Label16: TLabel;
    EdtCalendario: TDBEdit;
    BtnCalendario: TButton;
    Label19: TLabel;
    Label2: TLabel;
    EdtDescricao: TDBEdit;
    Label4: TLabel;
    EdtTempo: TDBEdit;
    EdtInicio: TJvDBMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    EdtPredecessora: TDBEdit;
    BtnPredecessora: TButton;
    lblDataFim: TDBText;
    procedure BtnCalendarioClick(Sender: TObject);
    procedure BtnPredecessoraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure EdtTempoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercUnidTarefas: TFrmTelaCadOrdemServicoTercUnidTarefas;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.BtnCalendarioClick(Sender: TObject);
begin
  inherited;
DM.FTabela_auxiliar := 230;
DM.FNomeConsulta := 'Calendários de Mão de Obra';
DM.qryOrdemServicoTercUnidTarefas.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryOrdemServicoTercUnidTarefasCODCALENDARIO.AsString := DM.FCodCombo;
    DM.qryOrdemServicoTercUnidTarefasCALENDARIO.AsString    := DM.FValorCombo;
  end;
DM.FDataSetParam := DM.qryOrdemServicoTercUnidTarefas;
DM.FTela := 'CADTERCEIRIZADAS';

end;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.BtnConsultarClick(
  Sender: TObject);
begin
DM.FTabela_auxiliar := 67;
  inherited;
DM.qryOrdemServicoTercUnidTarefasPred.Close;
DM.qryOrdemServicoTercUnidTarefasPred.Params[0].AsString := DM.FParamAuxiliar[0];
DM.qryOrdemServicoTercUnidTarefasPred.Open;

if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then
  begin
    PCentro.Enabled := False;
  end;

end;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.BtnNovoClick(Sender: TObject);
begin
if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

DM.FDataSetParam.Close;
DM.FDataSetParam.Open();
DM.FDataSetParam.Append();

DM.qryOrdemServicoTercUnidTarefasCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryOrdemServicoTercUnidTarefasCODORDEMSERVICO.AsString := DM.qryOrdemServicoTercUnidCODIGO.AsString;
DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.AsDateTime   := DM.FDataHoraServidor;
DM.qryOrdemServicoTercUnidTarefasDATAPROGFIN.AsDateTime   := DM.FDataHoraServidor;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageIndex := 2;

EdtCalendario.SetFocus;
end;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.BtnPredecessoraClick(Sender: TObject);
begin
  inherited;
DM.FTabela_auxiliar  := 6700;
DM.FNomeConsulta     := 'Tarefas Predecessoras';
DM.FParamAuxiliar[1] := DM.qryOrdemServicoTercUnidTarefasCODIGO.AsString;
DM.qryOrdemServicoTercUnidTarefas.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.FParamAuxiliar[1] := DM.qryOrdemServicoTercUnidTarefasCODIGO.AsString;

    DM.qryOrdemServicoTercUnidTarefasPREDECESSORA.AsString := DM.FValorCombo;
    DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.AsString  := DM.FParamAuxiliar[4];
  end;
DM.FDataSetParam := DM.qryOrdemServicoTercUnidTarefas;
DM.FTela := 'CADTERCEIRIZADAS';
end;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.BtnSalvarClick(
  Sender: TObject);
begin
if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then Exit;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';
PControle.SetFocus;

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    Exit;
  end;

if DM.qryOrdemServicoTercUnidTarefasCODCALENDARIO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CALENDÁRIO DA O.S.!';
    EdtCalendario.SetFocus;
    Exit;
  end;

if DM.qryOrdemServicoTercUnidTarefasDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DA O.S.!';
    EdtDescricao.SetFocus;
    Exit;
  end;

if DM.qryOrdemServicoTercUnidTarefasTEMPOPREVISTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O TEMPO DA O.S.!';
    EdtTempo.SetFocus;
    Exit;
  end;

if DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O INÍCIO DA O.S.!';
    EdtInicio.SetFocus;
    Exit;
  end;

//if DM.qryOrdemServicoTercUnidTarefasDATAPROGFIN.IsNull = True then
//  begin
//    PAuxiliares.Font.Color := clRed;
//    PAuxiliares.Caption := 'INFORME O FIM DA O.S.!';
//    EdtFim.SetFocus;
//    Exit;
//  end;

if DM.qryOrdemServicoTercUnidTarefasPREDECESSORA.AsString <> EmptyStr then
  begin
    if DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.AsDateTime < DM.qryOrdemServicoTercUnidTarefasPredDATAPROGFIN.AsDateTime then
      DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.AsDateTime := DM.qryOrdemServicoTercUnidTarefasPredDATAPROGFIN.AsDateTime;
  end;

DM.qryOrdemServicoTercUnidTarefas.Edit;
DM.qryOrdemServicoTercUnidTarefasCODORDEMSERVICO.AsString := DM.FParamAuxiliar[0];
DM.qryOrdemServicoTercUnidTarefasCODEMPRESA.AsString      := DM.FCodEmpresa;

if (DM.qryOrdemServicoTercUnidTarefasDATAPROGFIN.AsDateTime) < (IncHour(DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.AsDateTime, DM.qryOrdemServicoTercUnidTarefasTEMPOPREVISTO.AsInteger)) then
  DM.qryOrdemServicoTercUnidTarefasDATAPROGFIN.AsDateTime   := IncHour(DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.AsDateTime, DM.qryOrdemServicoTercUnidTarefasTEMPOPREVISTO.AsInteger);

with DM.FDataSetParam do
  begin
    if DM.FDataSetParam.IsEmpty = True then Exit;
    DM.FDataSetParam.Edit;
    DM.FDataSetParam.Post;
  end;

if DM.qryOrdemServicoTercUnidTarefasCODIGO.AsInteger <= 0 then
  begin
    DM.qryOrdemServicoTercUnidTarefas.Params[0].AsInteger := DM.qryOrdemServicoTercUnidTarefasCODIGO.AsInteger;
    DM.qryOrdemServicoTercUnidTarefas.Params[1].AsString := DM.FParamAuxiliar[0];
  end;

if DM.qryOrdemServicoTercUnidTarefasPREDECESSORA.AsString <> EmptyStr then
  begin
    if DM.qryOrdemServicoTercUnidTarefasPred.Locate('TAREFA;CODTAREFA', VarArrayOf([DM.qryOrdemServicoTercUnidTarefasPREDECESSORA.AsString, DM.qryOrdemServicoTercUnidTarefascodigo.AsString]), []) = False then
      begin
        DM.qryOrdemServicoTercUnidTarefasPred.Append;
        //DM.qryOrdemServicoTercUnidTarefasPredCODIGO.AsInteger         := DM.SMWebClient.GerarSequencia('ORDEMSERVICOTERCTAREFAS_S');
        DM.qryOrdemServicoTercUnidTarefasPredCODEMPRESA.AsString      := DM.FCodEmpresa;
        DM.qryOrdemServicoTercUnidTarefasPredCODORDEMSERVICO.AsString := DM.FParamAuxiliar[0];
        DM.qryOrdemServicoTercUnidTarefasPredCODANTECESSORA.AsString  := DM.FParamAuxiliar[2];
        DM.qryOrdemServicoTercUnidTarefasPredCODTAREFA.AsString       := DM.qryOrdemServicoTercUnidTarefasCODIGO.AsString;
        DM.qryOrdemServicoTercUnidTarefasPredTAREFA.AsString          := DM.qryOrdemServicoTercUnidTarefasPREDECESSORA.AsString;
        DM.qryOrdemServicoTercUnidTarefasPredDATAPROGINI.AsString     := DM.FParamAuxiliar[3];
        DM.qryOrdemServicoTercUnidTarefasPredDATAPROGFIN.AsString     := DM.FParamAuxiliar[4];
        DM.qryOrdemServicoTercUnidTarefasPred.Post;
      end;
  end;

EdtCalendario.ReadOnly := True;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageIndex := 2;

//  inherited;
end;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.EdtTempoExit(Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoTercUnidTarefas.Edit;
DM.qryOrdemServicoTercUnidTarefasDATAPROGFIN.AsDateTime := IncHour(DM.qryOrdemServicoTercUnidTarefasDATAPROGINI.AsDateTime, DM.qryOrdemServicoTercUnidTarefasTEMPOPREVISTO.AsInteger);
end;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryOrdemServicoTercUnidTarefas.Close;
DM.qryOrdemServicoTercUnidTarefasPred.Close;
end;

procedure TFrmTelaCadOrdemServicoTercUnidTarefas.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryOrdemServicoTercUnidTarefas;
DM.FTela := 'CADTERCEIRIZADAS';
end;

end.

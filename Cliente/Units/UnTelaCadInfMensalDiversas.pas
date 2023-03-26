unit UnTelaCadInfMensalDiversas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadInfMensalDiversas = class(TFrmTelaPaiParametros)
    Label44: TLabel;
    EdtCustoTotal: TDBEdit;
    Label36: TLabel;
    EdtCoefGrav: TDBEdit;
    Label43: TLabel;
    EdtCoefFreq: TDBEdit;
    Label41: TLabel;
    EdtHorasNormais: TDBEdit;
    Label42: TLabel;
    EdtCotDolar: TDBEdit;
    Label1: TLabel;
    CBMes: TDBComboBox;
    Label2: TLabel;
    CBAno: TDBComboBox;
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadInfMensalDiversas: TFrmTelaCadInfMensalDiversas;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadInfMensalDiversas.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 74;
  inherited;

end;

procedure TFrmTelaCadInfMensalDiversas.BtnNovoClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

DM.FDataSetParam.Close;
DM.FDataSetParam.Open;
DM.FDataSetParam.EmptyDataSet;
DM.FDataSetParam.Append;
DM.qryDespMensalDiversasMES.AsString             := FormatFloat('00', MonthOf(DM.FDataHoraServidor));
DM.qryDespMensalDiversasANO.AsFloat              := YearOf(DM.FDataHoraServidor);
DM.qryDespMensalDiversasCUSTOTOTALEST.AsFloat    := 0;
DM.qryDespMensalDiversasCOEFGRAVACID.AsFloat     := 0;
DM.qryDespMensalDiversasCOEFFREQACID.AsFloat     := 0;
DM.qryDespMensalDiversasHORASNORMAISTRAB.AsFloat := 0;
DM.qryDespMensalDiversasCOTACAODOLAR.AsFloat     := 0;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageIndex := 2;

EdtCustoTotal.SetFocus;
end;

procedure TFrmTelaCadInfMensalDiversas.BtnSalvarClick(Sender: TObject);
begin
//  inherited;
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';
PControle.SetFocus;

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

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if DM.FDataSetParam.IsEmpty = True then Exit;

DM.MSGAguarde('');

if DM.qryDespMensalDiversasCUSTOTOTALEST.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CUSTO TOTAL!';
    EdtCustoTotal.SetFocus;
    Exit;
  end;
if DM.qryDespMensalDiversasCOEFGRAVACID.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O COEFICIENTE DE GRAVIDADE!';
    EdtCoefGrav.SetFocus;
    Exit;
  end;
if DM.qryDespMensalDiversasCOEFFREQACID.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O COEFICIENTE DE FREQUENCIA!';
    EdtCoefFreq.SetFocus;
    Exit;
  end;
if DM.qryDespMensalDiversasHORASNORMAISTRAB.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME AS HORAS EXTRAS!';
    EdtHorasNormais.SetFocus;
    Exit;
  end;
if DM.qryDespMensalDiversasCOTACAODOLAR.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A COTACAO DO DOLAR!';
    EdtCotDolar.SetFocus;
    Exit;
  end;

DM.qryDespMensalDiversas.Edit;
DM.qryDespMensalDiversasCODEMPRESA.AsString := DM.FCodEmpresa;

if DM.FAlterando = False then
  begin
    DM.FDataSetParam.Params[0].AsInteger := DM.FDataSetParam.FieldByName('CODIGO').AsInteger;
  end;

with DM.FDataSetParam do
  begin
    if DM.FDataSetParam.IsEmpty = True then Exit;
    DM.FDataSetParam.Edit;
    DM.FDataSetParam.Post;
    DM.FDataSetParam.Edit;
  end;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadInfMensalDiversas.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalDiversasGeral;
DM.FTabela_auxiliar := 74;
  inherited;

end;

procedure TFrmTelaCadInfMensalDiversas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryDespMensalDiversas.Close;
end;

procedure TFrmTelaCadInfMensalDiversas.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryDespMensalDiversas;
DM.FDataSourceParam := DM.dsDespMensalDiversas;
DM.FTela := 'CADINFMENSAIS';
end;

procedure TFrmTelaCadInfMensalDiversas.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalDiversasIndividual;
DM.FTabela_auxiliar := 741;
  inherited;

end;

end.

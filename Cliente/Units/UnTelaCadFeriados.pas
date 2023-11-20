unit UnTelaCadFeriados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvDBControls, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadFeriados = class(TFrmTelaPaiParametros)
    Label1: TLabel;
    EdtData: TJvDBMaskEdit;
    EdtCodigo: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFeriados: TFrmTelaCadFeriados;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadFeriados.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFeriados.btnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 19;
  inherited;

end;

procedure TFrmTelaCadFeriados.BtnImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFeriados;
end;

procedure TFrmTelaCadFeriados.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryFeriadosCODEMPRESA.AsString      := DM.FCodEmpresa;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadFeriados.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFeriadosCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
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
if DM.qryFeriadosDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryFeriadosDATAFERIADO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DATA DO REGISTRO!';
    EdtData.SetFocus;
    Exit;
  end;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;

Try
  StrToDate(EdtData.Text);
Except
  Application.MessageBox('Data Inválida!', 'SPMP3', MB_OK + MB_ICONERROR);
  EdtData.SetFocus;
  Exit;
End;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;
  inherited;

EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFeriados.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 19;
  inherited;

end;

procedure TFrmTelaCadFeriados.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFeriados;
end;

procedure TFrmTelaCadFeriados.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then btnSalvar.ImageName := 'Operacional\naosalvo'
else btnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadFeriados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFeriados.Close;
end;

procedure TFrmTelaCadFeriados.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryFeriados;
DM.FDataSourceParam := DM.dsFeriados;
DM.FTela := 'CADFERIADOS';
DM.FTabela_auxiliar := 19;
end;

end.

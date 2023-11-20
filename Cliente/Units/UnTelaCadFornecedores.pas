unit UnTelaCadFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvDBControls, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadFornecedores = class(TFrmTelaPaiParametros)
    Label3: TLabel;
    EdtCNPJ: TDBEdit;
    Label4: TLabel;
    EdtEndereco: TDBEdit;
    Label5: TLabel;
    EdtEmail: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdtContato: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    EdtFone: TJvDBMaskEdit;
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label1: TLabel;
    EdtDescricao: TDBEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFornecedores: TFrmTelaCadFornecedores;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadFornecedores.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFornecedores.btnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 21;
  inherited;

end;

procedure TFrmTelaCadFornecedores.BtnImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFornecedores;
end;

procedure TFrmTelaCadFornecedores.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryFornecedoresATIVO.AsString           := 'S';
DM.qryFornecedoresVISIVEL.AsString         := 'S';
DM.qryFornecedoresCODEMPRESA.AsString      := DM.FCodEmpresa;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadFornecedores.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFornecedoresCODIGO.AsString = EmptyStr then
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
if DM.qryFornecedoresDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;
  inherited;

  EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFornecedores.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 21;
  inherited;

end;

procedure TFrmTelaCadFornecedores.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFornecedores;
end;

procedure TFrmTelaCadFornecedores.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then btnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFornecedores.Close;
end;

procedure TFrmTelaCadFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryFornecedores;
DM.FDataSourceParam := DM.dsFornecedores;
DM.FTela := 'CADFORNECEDORES';
end;

end.

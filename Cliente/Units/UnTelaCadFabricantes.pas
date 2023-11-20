unit UnTelaCadFabricantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, JvExMask, JvToolEdit,
  JvMaskEdit, JvDBControls, Vcl.Mask, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadFabricantes = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label1: TLabel;
    EdtDescricao: TDBEdit;
    Label3: TLabel;
    EdtCNPJ: TDBEdit;
    Label6: TLabel;
    EdtFone: TJvDBMaskEdit;
    Label4: TLabel;
    EdtEndereco: TDBEdit;
    Label5: TLabel;
    EdtEmail: TDBEdit;
    Label7: TLabel;
    EdtContato: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
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
  FrmTelaCadFabricantes: TFrmTelaCadFabricantes;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadFabricantes.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFabricantes.btnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 22;
  inherited;

end;

procedure TFrmTelaCadFabricantes.BtnImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFabricantes;
end;

procedure TFrmTelaCadFabricantes.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryFabricantesATIVO.AsString           := 'S';
DM.qryFabricantesVISIVEL.AsString         := 'S';
DM.qryFabricantesCODEMPRESA.AsString      := DM.FCodEmpresa;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadFabricantes.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFabricantesCODIGO.AsString = EmptyStr then
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
if DM.qryFabricantesDESCRICAO.IsNull = True then
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

procedure TFrmTelaCadFabricantes.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 22;
  inherited;

end;

procedure TFrmTelaCadFabricantes.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFabricantes;
end;

procedure TFrmTelaCadFabricantes.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then btnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadFabricantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFabricantes.Close;
end;

procedure TFrmTelaCadFabricantes.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryFabricantes;
DM.FDataSourceParam := DM.dsFabricantes;
DM.FTela := 'CADFABRICANTES';
end;

end.

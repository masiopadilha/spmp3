unit UnTelaCadClasses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadClasses = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadClasses: TFrmTelaCadClasses;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadClasses.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadClasses.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 5;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBClasses;
end;

procedure TFrmTelaCadClasses.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryClassesATIVO.AsString           := 'S';
DM.qryClassesVISIVEL.AsString         := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadClasses.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryClassesCODIGO.AsString = EmptyStr then
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
if DM.qryClassesDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
  inherited;

EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadClasses.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 5;
  inherited;

end;

procedure TFrmTelaCadClasses.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBClasses;
end;

procedure TFrmTelaCadClasses.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then btnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadClasses.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryClasses.Close;
end;

procedure TFrmTelaCadClasses.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryClasses;
DM.FDataSourceParam := DM.dsClasses;
DM.FTela := 'CADCLASSES';
end;

end.

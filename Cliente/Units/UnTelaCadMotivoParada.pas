unit UnTelaCadMotivoParada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadMotivoParada = class(TFrmTelaPaiParametros)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadMotivoParada: TFrmTelaCadMotivoParada;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadMotivoParada.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadMotivoParada.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 11;
  inherited;

end;

procedure TFrmTelaCadMotivoParada.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryMotivoParadaATIVO.AsString           := 'S';
DM.qryMotivoParadaVISIVEL.AsString         := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadMotivoParada.BtnSalvarClick(Sender: TObject);
begin
PControle.Setfocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryMotivoParadaCODIGO.AsString = EmptyStr then
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
if DM.qryMotivoParadaDESCRICAO.IsNull = True then
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

procedure TFrmTelaCadMotivoParada.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadMotivoParada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryMotivoParada.Close;
end;

procedure TFrmTelaCadMotivoParada.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryMotivoParada;
DM.FDataSourceParam := DM.dsMotivoParada;
DM.FDataSetRelat    := DmRelatorios.frxDBMotivoParada;
DM.FTela := 'CADMOTIVOPARADA';
DM.FTabela_auxiliar := 11;
end;

end.

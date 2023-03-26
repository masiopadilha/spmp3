unit UnTelaCadTipoProgramacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadTipoProgramacao = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    Label1: TLabel;
    CBTipo: TDBComboBox;
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
  FrmTelaCadTipoProgramacao: TFrmTelaCadTipoProgramacao;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadTipoProgramacao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadTipoProgramacao.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 12;
  inherited;

end;

procedure TFrmTelaCadTipoProgramacao.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryTipoProgramacaoATIVO.AsString           := 'S';
DM.qryTipoProgramacaoVISIVEL.AsString         := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadTipoProgramacao.BtnSalvarClick(Sender: TObject);
begin
PControle.Setfocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryTipoProgramacaoCODIGO.AsString = EmptyStr then
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
if DM.qryTipoProgramacaoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryTipoProgramacaoTIPO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O TIPO DO REGISTRO!';
    CBTipo.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;

  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadTipoProgramacao.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadTipoProgramacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryTipoProgramacao.Close;
end;

procedure TFrmTelaCadTipoProgramacao.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryTipoProgramacao;
DM.FDataSourceParam := DM.dsTipoProgramacao;
DM.FDataSetRelat    := DmRelatorios.frxDBTipoProgramacao;
DM.FTela := 'CADTIPOPROGRAMACAO';
DM.FTabela_auxiliar := 12;
end;

end.

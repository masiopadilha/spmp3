unit UnTelaCadTipoManutencao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadTipoManutencao = class(TFrmTelaPaiParametros)
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    CBTipo: TDBComboBox;
    ChbConf: TDBCheckBox;
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
  FrmTelaCadTipoManutencao: TFrmTelaCadTipoManutencao;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadTipoManutencao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadTipoManutencao.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 10;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBTipoManutencao;
end;

procedure TFrmTelaCadTipoManutencao.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryTipoManutencaoCONFIABILIDADE.AsString  := 'N';
DM.qryTipoManutencaoATIVO.AsString           := 'S';
DM.qryTipoManutencaoVISIVEL.AsString         := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadTipoManutencao.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryTipoManutencaoCODIGO.AsString = EmptyStr then
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
if DM.qryTipoManutencaoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryTipoManutencaoTIPOMANUTENCAO.IsNull = True then
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

procedure TFrmTelaCadTipoManutencao.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadTipoManutencao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryTipoManutencao.Close;
end;

procedure TFrmTelaCadTipoManutencao.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryTipoManutencao;
DM.FDataSourceParam := DM.dsTipoManutencao;
DM.FTela := 'CADMANUTENCAO';
DM.FTabela_auxiliar := 10;
end;

end.

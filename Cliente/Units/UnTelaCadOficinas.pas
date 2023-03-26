unit UnTelaCadOficinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadOficinas = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    Label1: TLabel;
    EdtCentroCusto: TDBEdit;
    BtnCentroCusto: TButton;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnCentroCustoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOficinas: TFrmTelaCadOficinas;

implementation

{$R *.dfm}

uses UnTelaCadCentroCusto, UnDmRelatorios, UnDM;

procedure TFrmTelaCadOficinas.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadOficinas.BtnCentroCustoClick(Sender: TObject);
begin
  inherited;
if DM.qryOficinas.Active = False then Exit;
if DM.qryOficinas.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 400;
    DM.FNomeConsulta := 'Centros de Custos';
    DM.qryOficinas.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOficinasCODCENTROCUSTO.AsString := DM.FCodCombo;
        DM.qryOficinasCENTROCUSTO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCENTROCUSTO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoCENTROCUSTO, FrmTelaCadCentroCusto) = False then exit;
      Application.CreateForm(TFrmTelaCadCentroCusto, FrmTelaCadCentroCusto);
      FrmTelaCadCentroCusto.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCentroCusto);
    End;
  end;
DM.FDataSetParam    := DM.qryOficinas;
DM.FDataSourceParam := DM.dsOficinas;
DM.FDataSetRelat    := DmRelatorios.frxDBOficina;
DM.FTela            := 'CADOFICINAS';
DM.FTabela_auxiliar := 20;
end;

procedure TFrmTelaCadOficinas.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 20;
  inherited;

end;

procedure TFrmTelaCadOficinas.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryOficinasCODEMPRESA.AsString := DM.FCodEmpresa;
DM.qryOficinasATIVO.AsString      := 'S';
DM.qryOficinasVISIVEL.AsString    := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadOficinas.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryOficinasCODIGO.AsString = EmptyStr then
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
if DM.qryOficinasDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryOficinasCODCENTROCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CENTRO DE CUSTO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;
  inherited;

EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadOficinas.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadOficinas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryOficinas.Close;
end;

procedure TFrmTelaCadOficinas.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryOficinas;
DM.FDataSourceParam := DM.dsOficinas;
DM.FDataSetRelat    := DmRelatorios.frxDBOficina;
DM.FTela := 'CADOFICINAS';
DM.FTabela_auxiliar := 20;
end;

end.

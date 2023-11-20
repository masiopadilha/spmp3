unit UnTelaCadAlmoxarifados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Datasnap.DBClient, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, JvExControls,
  JvGradientHeaderPanel, JvButton, JvNavigationPane, FireDAC.Stan.Param;

type
  TFrmTelaCadAlmoxarifados = class(TFrmTelaPaiParametros)
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    Label2: TLabel;
    EdtDescricao: TDBEdit;
    Label3: TLabel;
    EdtMateriais: TDBEdit;
    Label4: TLabel;
    EdtQtdeItens: TDBEdit;
    Label5: TLabel;
    EdtArea: TDBEdit;
    Label6: TLabel;
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
  FrmTelaCadAlmoxarifados: TFrmTelaCadAlmoxarifados;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadCentroCusto, UnDmRelatorios,
  UnDM;

procedure TFrmTelaCadAlmoxarifados.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadAlmoxarifados.BtnCentroCustoClick(Sender: TObject);
begin
  inherited;
if DM.qryAlmoxarifado.Active = False then Exit;
if DM.qryAlmoxarifado.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 400;
    DM.FNomeConsulta := 'Centro de Custo';
    DM.qryAlmoxarifado.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryAlmoxarifadoCODCENTROCUSTO.AsString := DM.FCodCombo;
        DM.qryAlmoxarifadoCENTROCUSTO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if DM.qryPermissoesAcessoCADCENTROCUSTO.AsString <> 'S' then Exit;
      if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoCENTROCUSTO, FrmTelaCadCentroCusto) = False then exit;
      Application.CreateForm(TFrmTelaCadCentroCusto, FrmTelaCadCentroCusto);
      FrmTelaCadCentroCusto.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCentroCusto);
    End;
  end;
DM.FDataSetParam    := DM.qryAlmoxarifado;
DM.FDataSourceParam := DM.dsAlmoxarifado;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FDataSetRelat    := DmRelatorios.frxDBAlmoxarifado;
DM.FTela            := 'CADALMOXARIFADO';
DM.FTabela_auxiliar := 14;
end;

procedure TFrmTelaCadAlmoxarifados.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 14;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBAlmoxarifado;

end;

procedure TFrmTelaCadAlmoxarifados.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryAlmoxarifadoATIVO.AsString           := 'S';
DM.qryAlmoxarifadoVISIVEL.AsString         := 'S';
DM.qryAlmoxarifadoCODEMPRESA.AsString      := DM.FCodEmpresa;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadAlmoxarifados.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryAlmoxarifadoCODIGO.AsString = EmptyStr then
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
if DM.qryAlmoxarifadoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryAlmoxarifadoCODCENTROCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CENTRO DE CUSTO DO REGISTRO!';
    EdtCentroCusto.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;
  inherited;

EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadAlmoxarifados.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadAlmoxarifados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryAlmoxarifado.Close;
end;

procedure TFrmTelaCadAlmoxarifados.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryAlmoxarifado;
DM.FDataSourceParam := DM.dsAlmoxarifado;
DM.FTela := 'CADALMOXARIFADO';
DM.FTabela_auxiliar := 14;
end;

end.

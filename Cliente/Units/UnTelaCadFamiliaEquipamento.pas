unit UnTelaCadFamiliaEquipamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.WinXCtrls;

type
  TFrmTelaCadFamiliaEquipamento = class(TFrmTelaPaiParametros)
    ChbAtivoNF: TDBCheckBox;
    ChbCampo1: TDBCheckBox;
    ChbCampo10: TDBCheckBox;
    ChbCampo11: TDBCheckBox;
    ChbCampo12: TDBCheckBox;
    ChbCampo2: TDBCheckBox;
    ChbCampo3: TDBCheckBox;
    ChbCampo4: TDBCheckBox;
    ChbCampo5: TDBCheckBox;
    ChbCampo6: TDBCheckBox;
    ChbCampo7: TDBCheckBox;
    ChbCampo8: TDBCheckBox;
    ChbCampo9: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    EdtCampo1: TDBEdit;
    EdtCampo10: TDBEdit;
    EdtCampo11: TDBEdit;
    EdtCampo12: TDBEdit;
    EdtCampo2: TDBEdit;
    EdtCampo3: TDBEdit;
    EdtCampo4: TDBEdit;
    EdtCampo5: TDBEdit;
    EdtCampo6: TDBEdit;
    EdtCampo7: TDBEdit;
    EdtCampo8: TDBEdit;
    EdtCampo9: TDBEdit;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label35: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFamiliaEquipamento: TFrmTelaCadFamiliaEquipamento;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadFamiliaEquipamento.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFamiliaEquipamento.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 6;
  inherited;
if DM.qryFamEquipamento.IsEmpty = False then
  begin
    DM.qryTotalFamilias.Close;
    DM.qryTotalFamilias.Params.ParamByName('codigo').AsString := DM.FCodGrupo;
    DM.qryTotalFamilias.Params.ParamByName('codfamilia').AsString := DM.qryFamEquipamentoCODIGO.AsString;
    DM.qryTotalFamilias.Open;

    if DM.qryTotalFamiliasTOTAL1.AsInteger > 0 then
      begin
        EdtDescricao.Enabled := False;
        EdtCampo1.Enabled    := False;
        EdtCampo2.Enabled    := False;
        EdtCampo3.Enabled    := False;
        EdtCampo4.Enabled    := False;
        EdtCampo5.Enabled    := False;
        EdtCampo6.Enabled    := False;
        EdtCampo7.Enabled    := False;
        EdtCampo8.Enabled    := False;
        EdtCampo9.Enabled    := False;
        EdtCampo10.Enabled   := False;
        EdtCampo11.Enabled   := False;
        EdtCampo12.Enabled   := False;
      end
    else
      begin
        EdtDescricao.Enabled := True;
        EdtCampo1.Enabled    := True;
        EdtCampo2.Enabled    := True;
        EdtCampo3.Enabled    := True;
        EdtCampo4.Enabled    := True;
        EdtCampo5.Enabled    := True;
        EdtCampo6.Enabled    := True;
        EdtCampo7.Enabled    := True;
        EdtCampo8.Enabled    := True;
        EdtCampo9.Enabled    := True;
        EdtCampo10.Enabled   := True;
        EdtCampo11.Enabled   := True;
        EdtCampo12.Enabled   := True;
      end;
  end;
end;

procedure TFrmTelaCadFamiliaEquipamento.BtnImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFamEquipamento;
end;

procedure TFrmTelaCadFamiliaEquipamento.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

EdtDescricao.Enabled := True;
EdtCampo1.Enabled    := True;
EdtCampo2.Enabled    := True;
EdtCampo3.Enabled    := True;
EdtCampo4.Enabled    := True;
EdtCampo5.Enabled    := True;
EdtCampo6.Enabled    := True;
EdtCampo7.Enabled    := True;
EdtCampo8.Enabled    := True;
EdtCampo9.Enabled    := True;
EdtCampo10.Enabled   := True;
EdtCampo11.Enabled   := True;
EdtCampo12.Enabled   := True;

DM.qryFamEquipamentoN1.AsString              := 'N';
DM.qryFamEquipamentoN2.AsString              := 'N';
DM.qryFamEquipamentoN3.AsString              := 'N';
DM.qryFamEquipamentoN4.AsString              := 'N';
DM.qryFamEquipamentoN5.AsString              := 'N';
DM.qryFamEquipamentoN6.AsString              := 'N';
DM.qryFamEquipamentoN7.AsString              := 'N';
DM.qryFamEquipamentoN8.AsString              := 'N';
DM.qryFamEquipamentoN9.AsString              := 'N';
DM.qryFamEquipamentoN10.AsString             := 'N';
DM.qryFamEquipamentoN11.AsString             := 'N';
DM.qryFamEquipamentoN12.AsString             := 'N';
DM.qryFamEquipamentoATIVO.AsString           := 'S';
DM.qryFamEquipamentoVISIVEL.AsString         := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadFamiliaEquipamento.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFamEquipamentoCODIGO.AsString = EmptyStr then
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
if DM.qryFamEquipamentoDESCRICAO.IsNull = True then
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

procedure TFrmTelaCadFamiliaEquipamento.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 6;
  inherited;

end;

procedure TFrmTelaCadFamiliaEquipamento.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFamEquipamento;
end;

procedure TFrmTelaCadFamiliaEquipamento.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then btnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadFamiliaEquipamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFamEquipamento.Close;
DM.qryTotalFamilias.Close;
end;

procedure TFrmTelaCadFamiliaEquipamento.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryFamEquipamento;
DM.FDataSourceParam := DM.dsFamEquipamento;
DM.FTela := 'CADFAMILIAEQUIP';
end;

end.

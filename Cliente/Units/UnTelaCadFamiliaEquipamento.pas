unit UnTelaCadFamiliaEquipamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadFamiliaEquipamento = class(TFrmTelaPaiParametros)
    ChbCampo1: TDBCheckBox;
    ChbCampo3: TDBCheckBox;
    ChbCampo5: TDBCheckBox;
    ChbCampo7: TDBCheckBox;
    ChbCampo9: TDBCheckBox;
    ChbCampo11: TDBCheckBox;
    ChbCampo2: TDBCheckBox;
    ChbCampo4: TDBCheckBox;
    ChbCampo6: TDBCheckBox;
    ChbCampo8: TDBCheckBox;
    ChbCampo10: TDBCheckBox;
    ChbCampo12: TDBCheckBox;
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    Label35: TLabel;
    EdtCampo1: TDBEdit;
    Label8: TLabel;
    EdtCampo2: TDBEdit;
    Label1: TLabel;
    EdtCampo3: TDBEdit;
    Label9: TLabel;
    EdtCampo4: TDBEdit;
    Label3: TLabel;
    EdtCampo5: TDBEdit;
    Label10: TLabel;
    EdtCampo6: TDBEdit;
    Label5: TLabel;
    EdtCampo7: TDBEdit;
    Label11: TLabel;
    EdtCampo8: TDBEdit;
    Label6: TLabel;
    EdtCampo9: TDBEdit;
    Label12: TLabel;
    EdtCampo10: TDBEdit;
    Label7: TLabel;
    EdtCampo11: TDBEdit;
    Label13: TLabel;
    EdtCampo12: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
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

procedure TFrmTelaCadFamiliaEquipamento.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
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
DM.FTabela_auxiliar := 6;
end;

end.

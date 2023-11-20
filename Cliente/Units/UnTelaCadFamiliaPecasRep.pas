unit UnTelaCadFamiliaPecasRep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadFamiliaPecasRep = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
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
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFamiliaPecasRep: TFrmTelaCadFamiliaPecasRep;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadFamiliaPecasRep.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFamiliaPecasRep.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 7;
  inherited;
if DM.qryFamPecasRep.IsEmpty = False then
  begin
    DM.qryTotalFamilias.Close;
    DM.qryTotalFamilias.Params.ParamByName('codigo').AsString := DM.FCodGrupo;
    DM.qryTotalFamilias.Params.ParamByName('codfamilia').AsString := DM.qryFamPecasRepCODIGO.AsString;
    DM.qryTotalFamilias.Open;

    if DM.qryTotalFamiliasTOTAL2.AsInteger > 0 then
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

procedure TFrmTelaCadFamiliaPecasRep.BtnImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFamPecasRep;
end;

procedure TFrmTelaCadFamiliaPecasRep.BtnNovoClick(Sender: TObject);
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

DM.qryFamPecasRepATIVO.AsString           := 'S';
DM.qryFamPecasRepVISIVEL.AsString         := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadFamiliaPecasRep.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFamPecasRepCODIGO.AsString = EmptyStr then
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
if DM.qryFamPecasRepDESCRICAO.IsNull = True then
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

procedure TFrmTelaCadFamiliaPecasRep.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 7;
  inherited;

end;

procedure TFrmTelaCadFamiliaPecasRep.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBFamPecasRep;
end;

procedure TFrmTelaCadFamiliaPecasRep.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then btnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadFamiliaPecasRep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFamPecasRep.Close;
DM.qryTotalFamilias.Close;
end;

procedure TFrmTelaCadFamiliaPecasRep.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryFamPecasRep;
DM.FDataSourceParam := DM.dsFamPecasRep;
DM.FTela := 'CADFAMILIAPECASREP';
end;

end.

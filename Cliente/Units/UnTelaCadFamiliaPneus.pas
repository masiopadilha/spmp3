unit UnTelaCadFamiliaPneus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadFamiliaPneus = class(TFrmTelaPaiParametros)
    ChbAtivoNF: TDBCheckBox;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFamiliaPneus: TFrmTelaCadFamiliaPneus;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadFamiliaPneus.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadFamiliaPneus.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if DM.qryFamPneus.IsEmpty = False then
  begin
    DM.qryTotalFamilias.Close;
    DM.qryTotalFamilias.Params.ParamByName('codigo').AsString := DM.FCodGrupo;
    DM.qryTotalFamilias.Params.ParamByName('codfamilia').AsString := DM.qryFamPneusCODIGO.AsString;
    DM.qryTotalFamilias.Open;
     Exit;
    if DM.qryTotalFamiliasTOTAL4.AsInteger > 0 then
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

procedure TFrmTelaCadFamiliaPneus.BtnNovoClick(Sender: TObject);
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

DM.qryFamPneusATIVO.AsString           := 'S';
DM.qryFamPneusVISIVEL.AsString         := 'S';
DM.qryFamPneusDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryFamPneusDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryFamPneusCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryFamPneusCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadFamiliaPneus.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFamPneusCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
    EdtCodigo.SetFocus;
    Exit;
  end;
DM.FTabela_auxiliar := 80;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryFamPneusDESCRICAO.IsNull = True then
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

procedure TFrmTelaCadFamiliaPneus.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadFamiliaPneus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFamPneus.Close;
DM.qryTotalFamilias.Close;
end;

procedure TFrmTelaCadFamiliaPneus.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryFamPneus;
DM.FDataSourceParam := DM.dsFamPneus;
DM.FDataSetRelat    := DmRelatorios.frxDBFamPneus;
DM.FTela := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 80;
end;

end.

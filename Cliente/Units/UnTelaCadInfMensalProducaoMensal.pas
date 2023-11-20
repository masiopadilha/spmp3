unit UnTelaCadInfMensalProducaoMensal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadInfMensalProducaoMensal = class(TFrmTelaPaiParametros)
    Label32: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label5: TLabel;
    CBTipo: TDBComboBox;
    EdtProduto: TDBEdit;
    EdtQtde: TDBEdit;
    EdtArea: TDBEdit;
    BtnArea: TButton;
    Label1: TLabel;
    CBMes: TDBComboBox;
    Label2: TLabel;
    CBAno: TDBComboBox;
    procedure BtnAreaClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadInfMensalProducaoMensal: TFrmTelaCadInfMensalProducaoMensal;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadInfMensalProducaoMensal.BtnAreaClick(Sender: TObject);
begin
  inherited;
if DM.qryDespMensalProdMensal.Active = False then Exit;
if DM.qryDespMensalProdMensal.IsEmpty = True then Exit;
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';
DM.qryDespMensalProdMensal.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryDespMensalProdMensalCODAREA.AsString := DM.FCodCombo;
    DM.qryDespMensalProdMensalAREA.AsString    := DM.FValorCombo;
  end;
end;

procedure TFrmTelaCadInfMensalProducaoMensal.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 73;
  inherited;
end;

procedure TFrmTelaCadInfMensalProducaoMensal.BtnNovoClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

DM.FDataSetParam.Close;
DM.FDataSetParam.Open();
DM.FDataSetParam.Append();

DM.qryDespMensalProdMensalCODEMPRESA.AsString := DM.FCodEmpresa;
DM.qryDespMensalProdMensalMES.AsString        := FormatFloat('00', MonthOf(DM.FDataHoraServidor));
DM.qryDespMensalProdMensalANO.AsFloat         := YearOf(DM.FDataHoraServidor);
DM.qryDespMensalProdMensalTOTAL.AsFloat       := 0;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageName := 'Operacional\salvar';

CBTipo.SetFocus;
end;

procedure TFrmTelaCadInfMensalProducaoMensal.BtnSalvarClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';
PControle.SetFocus;
if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    Exit;
  end;

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if DM.FDataSetParam.IsEmpty = True then Exit;

DM.MSGAguarde('');

if DM.qryDespMensalProdMensalTIPO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O TIPO DO REGISTRO!';
    CBTipo.SetFocus;
    Exit;
  end;
if DM.qryDespMensalProdMensalPRODFABRICADO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O PRODUTO!';
    EdtProduto.SetFocus;
    Exit;
  end;
if DM.qryDespMensalProdMensalTOTAL.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A QUANTIDADE!';
    EdtQtde.SetFocus;
    Exit;
  end;

if CBTipo.Text = 'Área' then
  begin
    if DM.qryDespMensalProdMensalAREA.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'INFORME A ÁREA!';
        EdtArea.SetFocus;
        Exit;
      end;
  end
else
  begin
    DM.qryDespMensalProdMensal.Edit;
    DM.qryDespMensalProdMensalCODAREA.AsString := EmptyStr;
    DM.qryDespMensalProdMensalAREA.AsString := EmptyStr;
  end;

DM.qryDespMensalProdMensal.Edit;
DM.qryDespMensalProdMensalCODEMPRESA.AsString := DM.FCodEmpresa;

with DM.FDataSetParam do
  begin
    if DM.FDataSetParam.IsEmpty = True then Exit;

    DM.FDataSetParam.Edit;
    DM.FDataSetParam.Post;
    DM.FDataSetParam.Edit;


    if DM.FAlterando = False then
      begin
        DM.FDataSetParam.Params[0].AsInteger := DM.FDataSetParam.FieldByName('CODIGO').AsInteger;
      end;
  end;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadInfMensalProducaoMensal.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 73;
  inherited;

end;

procedure TFrmTelaCadInfMensalProducaoMensal.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalProdGeral;
DM.FTabela_auxiliar := 73;
  inherited;

end;

procedure TFrmTelaCadInfMensalProducaoMensal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryDespMensalProdMensal.Close;
end;

procedure TFrmTelaCadInfMensalProducaoMensal.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryDespMensalProdMensal;
DM.FDataSourceParam := DM.dsDespMensalProdMensal;
DM.FTela := 'CADINFMENSAIS';
end;

procedure TFrmTelaCadInfMensalProducaoMensal.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalProdIndividual;
DM.FTabela_auxiliar := 731;
  inherited;

end;

end.


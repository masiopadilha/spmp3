unit UnTelaCadInfMensalTaxas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadInfMensalTaxas = class(TFrmTelaPaiParametros)
    GBFuncionario: TGroupBox;
    Label1: TLabel;
    CBMes: TDBComboBox;
    Label2: TLabel;
    CBAno: TDBComboBox;
    GrdTaxas: TDBGrid;
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure GrdFuncionariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadInfMensalTaxas: TFrmTelaCadInfMensalTaxas;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadInfMensalTaxas.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 91;
  inherited;
if DM.qryDespMensalTaxasPer.IsEmpty = False then
  begin
    DM.qryDespMensalTaxas.Close;
    DM.qryDespMensalTaxas.Params[0].AsInteger := DM.qryDespMensalTaxasPerCODIGO.AsInteger;
    DM.qryDespMensalTaxas.Open;
    DM.qryDespMensalTaxas.Edit;
  end;
end;

procedure TFrmTelaCadInfMensalTaxas.BtnNovoClick(Sender: TObject);
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

DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

DM.qryDespMensalTaxasPer.Open;
DM.qryDespMensalTaxasPer.Append;
DM.qryDespMensalTaxasPerMES.AsString        := FormatFloat('00', MonthOf(DM.FDataHoraServidor));
DM.qryDespMensalTaxasPerANO.AsFloat         := YearOf(DM.FDataHoraServidor);
DM.qryDespMensalTaxasPerCODEMPRESA.AsString := DM.FCodEmpresa;
DM.qryDespMensalTaxasPer.Post;

DM.qryDespMensalTaxas.Close;
DM.qryDespMensalTaxas.Params[0].AsInteger := DM.qryDespMensalTaxasPerCODIGO.AsInteger;
DM.qryDespMensalTaxas.Open;
DM.qryDespMensalTaxas.Edit;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadInfMensalTaxas.BtnSalvarClick(Sender: TObject);
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

DM.MSGAguarde('');

DM.qryDespMensalTaxasPer.Params[0].AsInteger := DM.qryDespMensalTaxasPerCODIGO.AsInteger;

DM.qryDespMensalTaxasPer.Edit;
DM.qryDespMensalTaxasPer.Post;

DM.qryDespMensalTaxas.First;
while not DM.qryDespMensalTaxas.Eof = True do
  begin
    DM.qryDespMensalTaxas.Edit;
    DM.qryDespMensalTaxasCODDESPTAXAPER.AsInteger := DM.qryDespMensalTaxasPerCODIGO.AsInteger;
    DM.qryDespMensalTaxas.Post;

    DM.qryDespMensalTaxas.Next;
  end;

DM.qryDespMensalTaxas.Edit;
DM.qryDespMensalTaxas.Post;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadInfMensalTaxas.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 91;
  inherited;
if DM.qryDespMensalTaxasPer.IsEmpty = False then
  begin
    DM.qryDespMensalTaxas.Close;
    DM.qryDespMensalTaxas.Params[0].AsInteger := DM.qryDespMensalTaxasPerCODIGO.AsInteger;
    DM.qryDespMensalTaxas.Open;
    DM.qryDespMensalTaxas.Edit;
  end;
end;

procedure TFrmTelaCadInfMensalTaxas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryDespMensalTaxasPer.Close;
DM.qryDespMensalTaxas.Close;
end;

procedure TFrmTelaCadInfMensalTaxas.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryDespMensalTaxasPer;
DM.FDataSourceParam := DM.dsDespMensalTaxasPer;
DM.FTela := 'CADINFMENSAIS';
end;

procedure TFrmTelaCadInfMensalTaxas.GrdFuncionariosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

end.

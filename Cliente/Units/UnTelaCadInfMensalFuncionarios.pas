unit UnTelaCadInfMensalFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadInfMensalFuncionarios = class(TFrmTelaPaiParametros)
    GBFuncionario: TGroupBox;
    GrdFuncionarios: TDBGrid;
    Label1: TLabel;
    CBMes: TDBComboBox;
    Label2: TLabel;
    CBAno: TDBComboBox;
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdFuncionariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadInfMensalFuncionarios: TFrmTelaCadInfMensalFuncionarios;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadInfMensalFuncionarios.BtnCancelarClick(Sender: TObject);
begin
  inherited;
DM.qryDespMensalFunc.Cancel;
end;

procedure TFrmTelaCadInfMensalFuncionarios.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 71;
  inherited;
DM.qryDespMensalFunc.Open;
end;

procedure TFrmTelaCadInfMensalFuncionarios.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryDespMensalFunc.Close;
end;

procedure TFrmTelaCadInfMensalFuncionarios.BtnNovoClick(Sender: TObject);
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

DM.qryDespMensalFuncPer.Open;
DM.qryDespMensalFuncPer.Append;
DM.qryDespMensalFuncPerMES.AsString        := FormatFloat('00', MonthOf(DM.FDataHoraServidor));
DM.qryDespMensalFuncPerANO.AsFloat         := YearOf(DM.FDataHoraServidor);
DM.qryDespMensalFuncPerCODEMPRESA.AsString := DM.FCodEmpresa;
DM.qryDespMensalFuncPer.Post;

DM.qryDespMensalFunc.Open;

DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME` FROM funcionarios WHERE mobra = ''OPERACIONAL'' and `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by `funcionarios`.nome');
DM.qryAuxiliar.Open;
while not DM.qryAuxiliar.Eof = True do
  begin
    DM.qryDespMensalFunc.Append;
    DM.qryDespMensalFuncCODEMPRESA.AsString          := DM.FCodEmpresa;
    DM.qryDespMensalFuncCODDESPINFOFUNCPER.AsInteger := DM.qryDespMensalFuncPerCODIGO.AsInteger;
    DM.qryDespMensalFuncMES.AsString                 := DM.qryDespMensalFuncPerMES.AsString;
    DM.qryDespMensalFuncANO.AsString                 := DM.qryDespMensalFuncPerANO.AsString;
    DM.qryDespMensalFuncMATRICULA.AsString           := DM.qryAuxiliar.Fields[0].AsString;
    DM.qryDespMensalFuncNOME.AsString                := DM.qryAuxiliar.Fields[1].AsString;
    DM.qryDespMensalFuncHENOREXEC.AsFloat            := 0;
    DM.qryDespMensalFuncHENOREXEC.AsFloat            := 0;
    DM.qryDespMensalFuncHEFEREXEC.AsFloat            := 0;
    DM.qryDespMensalFuncHENORPAGAS.AsFloat           := 0;
    DM.qryDespMensalFuncHEFERPAGAS.AsFloat           := 0;
    DM.qryDespMensalFuncHORASFOLGAS.AsFloat          := 0;
    DM.qryDespMensalFuncACIDSEMPT.AsFloat            := 0;
    DM.qryDespMensalFuncACIDCOMPT.AsFloat            := 0;
    DM.qryDespMensalFuncDIASPERDTOT.AsFloat          := 0;
    DM.qryDespMensalFuncCUSTOTREIN.AsFloat           := 0;
    DM.qryDespMensalFunc.Post;

    DM.qryAuxiliar.Next;
  end;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadInfMensalFuncionarios.BtnSalvarClick(Sender: TObject);
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


DM.qryDespMensalFuncPer.Edit;
DM.qryDespMensalFuncPer.Post;

DM.qryDespMensalFuncPer.Params[0].AsInteger := DM.qryDespMensalFuncPerCODIGO.AsInteger;

DM.qryDespMensalFunc.Edit;
DM.qryDespMensalFunc.Post;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadInfMensalFuncionarios.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 71;
  inherited;
DM.qryDespMensalFunc.Open;
end;

procedure TFrmTelaCadInfMensalFuncionarios.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalFuncPerGeral;
DM.FTabela_auxiliar := 71;
  inherited;
end;

procedure TFrmTelaCadInfMensalFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryAuxiliar.Close;
DM.qryDespMensalFunc.Close;
DM.qryDespMensalFuncPer.Close;
end;

procedure TFrmTelaCadInfMensalFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryDespMensalFuncPer;
DM.FDataSourceParam := DM.dsDespMensalFuncPer;
DM.FTela := 'CADINFMENSAIS';
end;

procedure TFrmTelaCadInfMensalFuncionarios.GrdFuncionariosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadInfMensalFuncionarios.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalFuncPerIndividual;
DM.FTabela_auxiliar := 671;
  inherited;
end;

end.



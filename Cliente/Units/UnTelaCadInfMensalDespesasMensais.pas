unit UnTelaCadInfMensalDespesasMensais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadInfMensalDespesasMensais = class(TFrmTelaPaiParametros)
    EdtRecEquip: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label9: TLabel;
    LblCustoHoraExtra: TDBText;
    LblCustoTreinam: TDBText;
    LblDespMatDiv: TDBText;
    LblDespMObra: TDBText;
    LblDespTotal: TDBText;
    LblDespUtilRec: TDBText;
    Label1: TLabel;
    CBMes: TDBComboBox;
    Label2: TLabel;
    CBAno: TDBComboBox;
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
  FrmTelaCadInfMensalDespesasMensais: TFrmTelaCadInfMensalDespesasMensais;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadInfMensalDespesasMensais.BtnConsultarClick(
  Sender: TObject);
begin
DM.FTabela_auxiliar := 72;
  inherited;
end;

procedure TFrmTelaCadInfMensalDespesasMensais.BtnNovoClick(Sender: TObject);
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

DM.qryDespMensalManutencao.Open;
DM.qryDespMensalManutencao.Append;
DM.qryDespMensalManutencaoMES.AsString             := FormatFloat('00', MonthOf(DM.FDataHoraServidor));
DM.qryDespMensalManutencaoANO.AsFloat              := YearOf(DM.FDataHoraServidor);
DM.qryDespMensalManutencaoDESPRECEQUIP.AsFloat     := 0;
DM.qryDespMensalManutencaoDESPMATDIVERSOS.AsFloat  := 0;
DM.qryDespMensalManutencaoDESPUTILRECURSOS.AsFloat := 0;
DM.qryDespMensalManutencaoDESPMOBRAADM.AsFloat     := 0;
DM.qryDespMensalManutencaoDESPCUSTOTREIN.AsFloat   := 0;
DM.qryDespMensalManutencaoDESPCUSTOHE.AsFloat      := 0;
DM.qryDespMensalManutencaoDESPTOTAL.AsFloat        := 0;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadInfMensalDespesasMensais.BtnSalvarClick(Sender: TObject);
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

with DM.FDataSetParam do
  begin
    DM.qryDespMensalManutencao.Edit;
    DM.qryDespMensalManutencaoCODEMPRESA.AsString := DM.FCodEmpresa;

    DM.qryDespMensalManutencaoCustos.Close;
    DM.qryDespMensalManutencaoCustos.Params[0].AsString := DM.qryDespMensalManutencaoMES.AsString;
    DM.qryDespMensalManutencaoCustos.Params[1].AsString := DM.qryDespMensalManutencaoANO.AsString;
    DM.qryDespMensalManutencaoCustos.Params[2].AsString := DM.FCodEmpresa;
    DM.qryDespMensalManutencaoCustos.Open;

    DM.qryDespMensalManutencaoDESPMOBRAADM.AsFloat     := DM.qryDespMensalManutencaoCustosMOBRAADM.AsFloat;
    DM.qryDespMensalManutencaoDESPMATDIVERSOS.AsFloat  := DM.qryDespMensalManutencaoCustosMATREQ.AsFloat;
    DM.qryDespMensalManutencaoDESPUTILRECURSOS.AsFloat := DM.qryDespMensalManutencaoCustosRECURSOS.AsFloat;
    DM.qryDespMensalManutencaoDESPCUSTOTREIN.AsFloat   := DM.qryDespMensalManutencaoCustosCUSTOTREINAM.AsFloat;
    DM.qryDespMensalManutencaoDESPCUSTOHE.AsFloat      := DM.qryDespMensalManutencaoCustosHORASEXTRAS.AsFloat;
    DM.qryDespMensalManutencaoDESPTOTAL.AsFloat        := DM.qryDespMensalManutencaoCustosMOBRAADM.AsFloat + DM.qryDespMensalManutencaoCustosMATREQ.AsFloat + DM.qryDespMensalManutencaoCustosRECURSOS.AsFloat + DM.qryDespMensalManutencaoCustosCUSTOTREINAM.AsFloat + DM.qryDespMensalManutencaoCustosHORASEXTRAS.AsFloat;
end;

DM.FDataSetParam.Edit;
DM.FDataSetParam.Post;
DM.FDataSetParam.Edit;

DM.FDataSetParam.Params[0].AsInteger := DM.FDataSetParam.FieldByName('CODIGO').AsInteger;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadInfMensalDespesasMensais.ButConsultarClick(
  Sender: TObject);
begin
DM.FTabela_auxiliar := 72;
  inherited;

end;

procedure TFrmTelaCadInfMensalDespesasMensais.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalManutGeral;
DM.FTabela_auxiliar := 72;
  inherited;

end;

procedure TFrmTelaCadInfMensalDespesasMensais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryDespMensalManutencaoCustos.Close;
DM.qryDespMensalManutencao.Close;
end;

procedure TFrmTelaCadInfMensalDespesasMensais.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryDespMensalManutencao;
DM.FDataSourceParam := DM.dsDespMensalManutencao;
DM.FTela := 'CADINFMENSAIS';
end;

procedure TFrmTelaCadInfMensalDespesasMensais.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDespMensalManutIndividual;
DM.FTabela_auxiliar := 721;
  inherited;

end;

end.

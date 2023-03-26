unit UnTelaCadEquipamentoReserva;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadEquipamentoReserva = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    BtnEquipamento: TButton;
    GBEquipCompativeis: TGroupBox;
    GrdEquipCompat: TDBGrid;
    BtnEquipCompat: TButton;
    GBDadosEquip: TGroupBox;
    SGrdDadosEquip: TStringGrid;
    GBParametros: TGroupBox;
    SGrdDadosSubs: TStringGrid;
    Label16: TLabel;
    Label15: TLabel;
    LblCelula: TDBText;
    Label14: TLabel;
    LblLinha: TDBText;
    Label13: TLabel;
    LblSequencia: TDBText;
    LblArea: TDBText;
    LblEquipamento: TDBText;
    Label2: TLabel;
    LblFamiliaEquip: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SGrdDadosEquipDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrdDadosEquipDblClick(Sender: TObject);
    procedure SGrdDadosSubsKeyPress(Sender: TObject; var Key: Char);
    procedure BtnEquipCompatClick(Sender: TObject);
    procedure SGrdDadosSubsDblClick(Sender: TObject);
    procedure GrdEquipCompatDblClick(Sender: TObject);
    procedure SGrdDadosSubsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GrdEquipCompatDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentoReserva: TFrmTelaCadEquipamentoReserva;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadEquipamentoReserva.BtnEquipamentoClick(Sender: TObject);
var
I, J: SmallInt;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

for I := 0 to SGrdDadosEquip.ColCount - 1 do
  for J := 0 to SGrdDadosEquip.RowCount - 1 do
    SGrdDadosEquip.Cells[I, J] := EmptyStr;

for I := 0 to SGrdDadosSubs.ColCount - 1 do
  for J := 0 to SGrdDadosSubs.RowCount - 1 do
    SGrdDadosSubs.Cells[I, J] := EmptyStr;

DM.qryEquipamentosReservas.Close;

DM.FTabela_auxiliar := 76;
DM.FNomeConsulta := 'Equipamentos';
if DM.ConsultarCombo <> EmptyStr then
  begin
    BtnEquipCompat.Enabled := False;

    DM.qryEquipamentos.Close;
    DM.qryEquipamentos.Params[0].AsString := DM.FCodCombo;
    DM.qryEquipamentos.Params[1].AsString := DM.FCodEmpresa;
    DM.qryEquipamentos.Open;

    if DM.qryEquipamentos.IsEmpty = False then
      begin
        DM.qryFamEquipamento.Close;
        DM.qryFamEquipamento.Params[0].AsString := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
        DM.qryFamEquipamento.Open;

        DM.qryEquipamentosDados.Close;
        DM.qryEquipamentosDados.Params[0].Value := DM.FCodEmpresa;
        DM.qryEquipamentosDados.Params[1].Value := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
        DM.qryEquipamentosDados.Params[2].Value := DM.qryEquipamentosCODIGO.AsString;
        DM.qryEquipamentosDados.Open;

        I := 0;
        SGrdDadosEquip.ColWidths[0] := 220;
        SGrdDadosEquip.ColWidths[1] := 65;
        SGrdDadosEquip.ColWidths[2] := 0;
        SGrdDadosSubs.ColWidths[3]  := 0;

        if DM.qryFamEquipamentoN1.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I] := DM.qryFamEquipamentoCAMPO1.AsString;
            SGrdDadosEquip.Cells[1, I] := DM.qryEquipamentosDadosREGISTRO1.AsString;
            SGrdDadosEquip.Cells[2, I] := DM.qryFamEquipamentoCAMPO1.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO1.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN2.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I] := DM.qryFamEquipamentoCAMPO2.AsString;
            SGrdDadosEquip.Cells[1, I] := DM.qryEquipamentosDadosREGISTRO2.AsString;
            SGrdDadosEquip.Cells[2, I] := DM.qryFamEquipamentoCAMPO2.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO2.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN3.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I] := DM.qryFamEquipamentoCAMPO3.AsString;
            SGrdDadosEquip.Cells[1, I] := DM.qryEquipamentosDadosREGISTRO3.AsString;
            SGrdDadosEquip.Cells[2, I] := DM.qryFamEquipamentoCAMPO3.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO3.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN4.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO4.AsString;
            SGrdDadosEquip.Cells[1, I]  := DM.qryEquipamentosDadosREGISTRO4.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO4.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO4.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN5.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO5.AsString;
            SGrdDadosEquip.Cells[1, I]  := DM.qryEquipamentosDadosREGISTRO5.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO5.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO5.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN6.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO6.AsString;
            SGrdDadosEquip.Cells[1, I]  := DM.qryEquipamentosDadosREGISTRO6.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO6.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO6.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN7.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO7.AsString;
            SGrdDadosEquip.Cells[1, I]  := DM.qryEquipamentosDadosREGISTRO7.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO7.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO7.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN8.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO8.AsString;
            SGrdDadosEquip.Cells[1, I]  := DM.qryEquipamentosDadosREGISTRO8.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO8.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO8.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN9.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO9.AsString;
            SGrdDadosEquip.Cells[1, I]  := DM.qryEquipamentosDadosREGISTRO9.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO9.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO9.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN10.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO10.AsString;
            SGrdDadosEquip.Cells[1, I] := DM.qryEquipamentosDadosREGISTRO10.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO10.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO10.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN11.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO11.AsString;
            SGrdDadosEquip.Cells[1, I] := DM.qryEquipamentosDadosREGISTRO11.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO11.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO11.FieldName;
            I := I + 1;
          end;
        if DM.qryFamEquipamentoN12.AsString = 'S' then
          begin
            SGrdDadosEquip.Cells[0, I]  := DM.qryFamEquipamentoCAMPO12.AsString;
            SGrdDadosEquip.Cells[1, I] := DM.qryEquipamentosDadosREGISTRO12.AsString;
            SGrdDadosEquip.Cells[2, I]  := DM.qryFamEquipamentoCAMPO12.FieldName;
            SGrdDadosSubs.Cells[3, I]  := DM.qryEquipamentosDadosREGISTRO12.FieldName;
          end;
      end;

      if DM.qryEquipamentos.IsEmpty = False then
        if DM.qryEquipamentosRESERVA.AsString = 'N' then
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'O EQUIPAMENTO NÃO POSSUI RESERVAS!';
            Exit;
          end;
  end;
end;

procedure TFrmTelaCadEquipamentoReserva.BtnEquipCompatClick(Sender: TObject);
var
I: SmallInt;
LSQL: String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if DM.qryEquipamentos.IsEmpty = False then
  if DM.qryEquipamentosRESERVA.AsString = 'N' then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption := 'O EQUIPAMENTO NÃO POSSUI RESERVAS!';
      Exit;
    end;

for I := 0 to 11 do
  begin
    if SGrdDadosSubs.Cells[0, I] <> EmptyStr then
      begin
        if SGrdDadosSubs.Cells[1, I] = EmptyStr then
          begin
            SGrdDadosSubs.Row := I;
            SGrdDadosSubs.Col := 1;
            SGrdDadosSubs.SetFocus;
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption    := 'PARÂMETRO INVÁLIDO!';
            Exit;
          end;
        if SGrdDadosSubs.Cells[2, I] = EmptyStr then
          begin
            SGrdDadosSubs.Row := I;
            SGrdDadosSubs.Col := 2;
            SGrdDadosSubs.SetFocus;
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption    := 'PARÂMETRO INVÁLIDO!';
            Exit;
          end;
        if StrToFloat(SGrdDadosSubs.Cells[1, I]) > StrToFloat(SGrdDadosSubs.Cells[2, I]) then
          begin
            SGrdDadosSubs.Row := 0;
            SGrdDadosSubs.Col := 2;
            SGrdDadosSubs.SetFocus;
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption    := 'PARÂMETRO INVÁLIDO!';
            Exit;
          end;
      end;
  end;

  if DM.FEmpTransf = True then
    begin
      LSQL := 'SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `equipamentos`.`OPERANDO`';
      LSQL := LSQL + ' , `areas`.`DESCRICAO` AS `AREA`, `celulas`.`DESCRICAO` AS `CELULA`, `linhas`.`DESCRICAO` AS `LINHA`, `equipamentos`.`SEQUENCIA`,';
    end
  else
    begin
      LSQL := 'SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `equipamentos`.`OPERANDO`';
      LSQL := LSQL + ' , `areas`.`DESCRICAO` AS `AREA`, `celulas`.`DESCRICAO` AS `CELULA`, `equipamentos`.`SEQUENCIA`,';
    end;

  for I := 0 to 11 do
    begin
      if SGrdDadosSubs.Cells[0, I] <> EmptyStr then
        begin
          if (I > 0) and (I < 11) then
            LSQL := LSQL + ',';
          LSQL := LSQL + ' `familiaequipamento`.`' + SGrdDadosEquip.Cells[2, I] + '`, `familiaequipamentodadosr`.`' + SGrdDadosSubs.Cells[3,I]+'`';
//          LSQL := LSQL + ' `familiaequipamento`.`' + DM.qryFamEquipamento.Fields[I + 4].FieldName + '`, `familiaequipamentodadosr`.`' + DM.qryEquipamentosDadosR.Fields[I + 4].FieldName+'`';

          if SGrdDadosSubs.Cells[1, I] = EmptyStr then
            begin
              PAuxiliares.Font.Color := clRed;
              PAuxiliares.Caption := SGrdDadosSubs.Cells[0, I]+' NENHUM VALOR INFORMADO!';
              Exit;
            end;
        end;
    end;

  LSQL := LSQL + ' FROM `equipamentos`';
  LSQL := LSQL + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)';
  LSQL := LSQL + ' INNER JOIN `familiaequipamentodadosr` ON (`familiaequipamentodadosr`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`familiaequipamentodadosr`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)';
  LSQL := LSQL + ' INNER JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)';
  LSQL := LSQL + ' INNER JOIN `celulas` ON (`celulas`.`CODIGO` = `equipamentos`.`CODCELULA`) AND (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`)';
  LSQL := LSQL + ' LEFT JOIN `linhas` ON (`linhas`.`CODIGO` = `equipamentos`.`CODLINHA`) AND (`linhas`.`CODEMPRESA` = `celulas`.`CODEMPRESA`) AND (`linhas`.`CODAREA` = `celulas`.`CODAREA`) AND (`linhas`.`CODCELULA` = `celulas`.`CODIGO`)';
  LSQL := LSQL + ' WHERE `equipamentos`.`CODIGO` <> '+ QuotedStr(DM.qryEquipamentosCODIGO.AsString) + ' AND `equipamentos`.`CODEMPRESA` = '+ QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`RESERVA` = ''S'' AND `equipamentos`.`CODFAMILIAEQUIP` = '+ QuotedStr(DM.qryEquipamentosCODFAMILIAEQUIP.AsString) + EmptyStr;

  for I := 0 to 11 do
    begin
      if SGrdDadosSubs.Cells[0, I] <> EmptyStr then
        LSQL := LSQL + ' AND `familiaequipamentodadosr`.`'+SGrdDadosSubs.Cells[3, I]+'` >= ' + QuotedStr(SGrdDadosSubs.Cells[1, I])
                     + ' AND `familiaequipamentodadosr`.`'+SGrdDadosSubs.Cells[3, I]+'` <= ' + QuotedStr(SGrdDadosSubs.Cells[2, I]) + EmptyStr;
    end;


LSQL := LSQL + ' ORDER BY `equipamentos`.`DESCRICAO` DESC';

DM.qryEquipamentosReservas.Filtered := False;
DM.qryEquipamentosReservas.Close;
DM.qryEquipamentosReservas.SQL.Clear;
DM.qryEquipamentosReservas.SQL.Add(LSQL);
DM.qryEquipamentosReservas.Open;

LSQL := EmptyStr;
end;

procedure TFrmTelaCadEquipamentoReserva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryEquipamentos.Close;
DM.qryEquipamentosDados.Close;
DM.qryEquipamentosReservas.Close;
DM.qryFamEquipamento.Close;
  inherited;
end;

procedure TFrmTelaCadEquipamentoReserva.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosDados.Open;
SGrdDadosEquip.ColWidths[0] := 150;
SGrdDadosEquip.ColWidths[1] := 75;
SGrdDadosSubs.ColWidths[0]  := 150;
SGrdDadosSubs.ColWidths[1]  := 75;
SGrdDadosEquip.ColWidths[2] := 0;
SGrdDadosSubs.ColWidths[3]  := 0;
end;

procedure TFrmTelaCadEquipamentoReserva.GrdEquipCompatDblClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if DM.qryEquipamentosReservas.IsEmpty = False then
  begin
    if Application.MessageBox('Deseja realmente substituir o equipamento?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
      begin
        DM.qryEquipamentosSubstHist.Close;
        DM.qryEquipamentosSubstHist.Params[0].AsString := DM.FCodEmpresa;
        DM.qryEquipamentosSubstHist.Open;

        //Histórico Equipamento Entrando
        DM.qryEquipamentosSubstHist.Append;
        DM.qryEquipamentosSubstHistCODEMPRESA.AsString         := DM.FCodEmpresa;
        DM.qryEquipamentosSubstHistCODEQUIPAMENTO.AsString     := DM.qryEquipamentosReservas.FieldByName('CODIGO').AsString;
        DM.qryEquipamentosSubstHistCODEQUIPAMENTOSUBS.AsString := DM.qryEquipamentosCODIGO.AsString;
        DM.qryEquipamentosSubstHistCODEQUIPAMENTOPAI.AsString  := DM.qryEquipamentosCODEQUIPAMENTOPAI.AsString;
        DM.qryEquipamentosSubstHistCODAREA.AsString            := DM.qryEquipamentosCODLOCALIZACAO.AsString;
        DM.qryEquipamentosSubstHistCODCELULA.AsString          := DM.qryEquipamentosCODCELULA.AsString;
        DM.qryEquipamentosSubstHistCODLINHA.AsString           := DM.qryEquipamentosCODLINHA.AsString;
        DM.qryEquipamentosSubstHistCODCELULA.AsString          := DM.qryEquipamentosCODCELULA.AsString;
        DM.qryEquipamentosSubstHistSEQUENCIA.AsString          := DM.qryEquipamentosSEQUENCIA.AsString;
        DM.qryEquipamentosSubstHistDATAINSTALACAO.AsDateTime   := DM.FDataHoraServidor;
        DM.qryEquipamentosSubstHistCODUSUARIOALT.AsString      := DM.FCodUsuario;
        //DM.qryEquipamentosSubstHistMOTIVOTROCA.AsString        := LMotivo;
        DM.qryEquipamentosSubstHist.Post;

        //Histórico Equipamento Saindo
        DM.qryEquipamentosSubstHist.Append;
        DM.qryEquipamentosSubstHistCODEMPRESA.AsString         := DM.FCodEmpresa;
        DM.qryEquipamentosSubstHistCODEQUIPAMENTO.AsString     := DM.qryEquipamentosCODIGO.AsString;
        DM.qryEquipamentosSubstHistCODEQUIPAMENTOSUBS.AsString := DM.qryEquipamentosReservas.FieldByName('CODIGO').AsString;
        DM.qryEquipamentosSubstHistCODEQUIPAMENTOPAI.AsString  := DM.qryEquipamentosCODEQUIPAMENTOPAI.AsString;
        DM.qryEquipamentosSubstHistDATARETIRADA.AsDateTime     := DM.FDataHoraServidor;
        DM.qryEquipamentosSubstHistCODUSUARIOALT.AsString      := DM.FCodUsuario;
        //DM.qryEquipamentosSubstHistMOTIVOTROCA.AsString        := LMotivo;
        DM.qryEquipamentosSubstHist.Post;

        //Equipamento a ser instalado
        DM.qryEquipamentosSubst.Close;
        DM.qryEquipamentosSubst.Params[0].AsString := DM.qryEquipamentosCODLOCALIZACAO.AsString;
        DM.qryEquipamentosSubst.Params[1].AsString := DM.qryEquipamentosCODCELULA.AsString;
        DM.qryEquipamentosSubst.Params[2].AsString := DM.qryEquipamentosCODLINHA.AsString;
        DM.qryEquipamentosSubst.Params[3].AsString := DM.qryEquipamentosSEQUENCIA.AsString;
        DM.qryEquipamentosSubst.Params[5].AsString := 'S';
        DM.qryEquipamentosSubst.Params[6].AsString := DM.qryEquipamentosCODEQUIPAMENTOPAI.AsString;
        DM.qryEquipamentosSubst.Params[7].AsString := 'S';
        DM.qryEquipamentosSubst.Params[8].AsString := DM.qryEquipamentosReservas.FieldByName('CODIGO').AsString;
        DM.qryEquipamentosSubst.Params[9].AsString := DM.FCodEmpresa;
        DM.qryEquipamentosSubst.Execute;

        DM.qryEquipamentos.Edit;
        DM.qryEquipamentosOPERANDO.AsString          := 'N';
        DM.qryEquipamentosSECUNDARIO.AsString        := 'N';
        DM.qryEquipamentosCODLOCALIZACAO.AsString    := EmptyStr;
        DM.qryEquipamentosCODCELULA.AsString         := EmptyStr;
        DM.qryEquipamentosCODLINHA.AsString          := EmptyStr;
        DM.qryEquipamentosSEQUENCIA.AsString      := EmptyStr;
        DM.qryEquipamentosCODEQUIPAMENTOPAI.AsString := EmptyStr;
        DM.qryEquipamentos.Post;

        DM.qryEquipamentosReservas.Post;

        PAuxiliares.Font.Color := clGreen;
        PAuxiliares.Caption    := 'O EQUIPAMENTO FOI SUBSTITUÍDO!';

        DM.qryEquipamentosSubstHist.Close;
        DM.qryEquipamentosSubst.Close;
        DM.qryEquipamentos.Close;
        DM.qryEquipamentosReservas.Close;

        Close;

        //for linha:= 1 to SGrdDadosEquip.RowCount -1 do
          //begin
            //SGrdDadosEquip.Rows[linha].Clear;
          //end;
      end;
  end;
end;

procedure TFrmTelaCadEquipamentoReserva.GrdEquipCompatDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
GrdEquipCompat.Columns[0].Title.Alignment          := taCenter;
DM.qryEquipamentosReservas.Fields[0].DisplayLabel  := 'Código';
DM.qryEquipamentosReservas.Fields[0].DisplayWidth  := 15;
DM.qryEquipamentosReservas.Fields[0].Alignment     := taCenter;

DM.qryEquipamentosReservas.Fields[1].DisplayLabel  := 'Descrição';
DM.qryEquipamentosReservas.Fields[1].DisplayWidth  := 40;

GrdEquipCompat.Columns[2].Title.Alignment          := taCenter;
DM.qryEquipamentosReservas.Fields[2].Alignment     := taCenter;
DM.qryEquipamentosReservas.Fields[2].DisplayLabel  := 'Operando';
DM.qryEquipamentosReservas.Fields[2].DisplayWidth  := 10;

DM.qryEquipamentosReservas.Fields[3].DisplayLabel  := 'Área';
DM.qryEquipamentosReservas.Fields[3].DisplayWidth  := 25;

DM.qryEquipamentosReservas.Fields[4].DisplayLabel  := 'Célula';
DM.qryEquipamentosReservas.Fields[4].DisplayWidth  := 25;

if DM.FEmpTransf = True then
  begin
    DM.qryEquipamentosReservas.Fields[5].DisplayLabel  := 'Linha';
    DM.qryEquipamentosReservas.Fields[5].DisplayWidth  := 20;

    GrdEquipCompat.Columns[6].Title.Alignment          := taCenter;
    DM.qryEquipamentosReservas.Fields[6].Alignment     := taCenter;
    DM.qryEquipamentosReservas.Fields[6].DisplayLabel  := 'Sequência';
    DM.qryEquipamentosReservas.Fields[6].DisplayWidth  := 5;


    if DM.qryEquipamentosReservas.FieldCount >= 9 then
      begin
        GrdEquipCompat.Columns[7].Title.Alignment          := taCenter;
        DM.qryEquipamentosReservas.Fields[7].Alignment     := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[7].DisplayLabel  := SGrdDadosSubs.Cells[0, 0];
        DM.qryEquipamentosReservas.Fields[7].DisplayWidth  := 5;

        GrdEquipCompat.Columns[8].Title.Alignment          := taCenter;
        DM.qryEquipamentosReservas.Fields[8].DisplayLabel  := 'Valor';
        DM.qryEquipamentosReservas.Fields[8].DisplayWidth  := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[8]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 11 then
      begin
        GrdEquipCompat.Columns[9].Title.Alignment          := taCenter;
        DM.qryEquipamentosReservas.Fields[9].Alignment     := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[9].DisplayLabel  := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[9].DisplayWidth  := 5;

        GrdEquipCompat.Columns[10].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[10].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[10].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[10]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 13 then
      begin
        GrdEquipCompat.Columns[11].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[11].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[11].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[11].DisplayWidth := 5;

        GrdEquipCompat.Columns[10].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[12].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[12].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[12]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 15 then
      begin
        GrdEquipCompat.Columns[13].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[13].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[13].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[13].DisplayWidth := 5;

        GrdEquipCompat.Columns[14].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[14].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[14].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[14]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 17 then
      begin
        GrdEquipCompat.Columns[15].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[15].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[15].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[15].DisplayWidth := 5;

        GrdEquipCompat.Columns[16].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[16].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[16].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[16]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 19 then
      begin
        GrdEquipCompat.Columns[17].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[17].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[17].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[17].DisplayWidth := 5;

        GrdEquipCompat.Columns[18].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[18].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[18].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[18]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 21 then
      begin
        GrdEquipCompat.Columns[19].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[19].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[19].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[19].DisplayWidth := 5;

        GrdEquipCompat.Columns[20].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[20].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[20].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[20]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 23 then
      begin
        GrdEquipCompat.Columns[21].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[21].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[21].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[21].DisplayWidth := 5;

        GrdEquipCompat.Columns[22].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[22].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[22].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[22]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 25 then
      begin
        GrdEquipCompat.Columns[23].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[23].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[23].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[23].DisplayWidth := 5;

        GrdEquipCompat.Columns[24].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[24].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[24].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[24]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 27 then
      begin
        GrdEquipCompat.Columns[25].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[25].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[25].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[25].DisplayWidth := 5;

        GrdEquipCompat.Columns[26].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[26].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[26].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[26]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 29 then
      begin
        GrdEquipCompat.Columns[27].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[27].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[27].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[27].DisplayWidth := 5;

        GrdEquipCompat.Columns[28].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[28].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[28].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[28]).DisplayFormat := '0.00';
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 31 then
      begin
        GrdEquipCompat.Columns[29].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[29].Alignment    := taLeftJustify;
        DM.qryEquipamentosReservas.Fields[29].DisplayLabel := SGrdDadosSubs.Cells[0, 1];
        DM.qryEquipamentosReservas.Fields[29].DisplayWidth := 5;

        GrdEquipCompat.Columns[30].Title.Alignment         := taCenter;
        DM.qryEquipamentosReservas.Fields[30].DisplayLabel := 'Valor';
        DM.qryEquipamentosReservas.Fields[30].DisplayWidth := 8;
        TFloatField(DM.qryEquipamentosReservas.Fields[30]).DisplayFormat := '0.00';
      end;

    GrdEquipCompat.Columns[0].Title.Font.Size := 9;
    GrdEquipCompat.Columns[1].Title.Font.Size := 9;
    GrdEquipCompat.Columns[2].Title.Font.Size := 9;
    GrdEquipCompat.Columns[3].Title.Font.Size := 9;
    GrdEquipCompat.Columns[4].Title.Font.Size := 9;
    GrdEquipCompat.Columns[5].Title.Font.Size := 9;
    GrdEquipCompat.Columns[6].Title.Font.Size := 9;
    GrdEquipCompat.Columns[7].Title.Font.Size := 9;
    GrdEquipCompat.Columns[8].Title.Font.Size := 9;
  end
else
  begin
    DM.qryEquipamentosReservas.Fields[0].DisplayLabel := 'Código';
    DM.qryEquipamentosReservas.Fields[0].DisplayWidth := 10;
    DM.qryEquipamentosReservas.Fields[0].Alignment    := taCenter;
    DM.qryEquipamentosReservas.Fields[1].DisplayLabel := 'Descrição';  DM.qryEquipamentosReservas.Fields[1].DisplayWidth := 30;
    DM.qryEquipamentosReservas.Fields[2].DisplayLabel := 'Operando';   DM.qryEquipamentosReservas.Fields[2].DisplayWidth := 10;
    DM.qryEquipamentosReservas.Fields[3].Visible      := False;
    DM.qryEquipamentosReservas.Fields[4].Visible      := False;
    DM.qryEquipamentosReservas.Fields[5].DisplayLabel := 'Área';       DM.qryEquipamentosReservas.Fields[5].DisplayWidth := 20;
    DM.qryEquipamentosReservas.Fields[6].DisplayLabel := 'Célula';     DM.qryEquipamentosReservas.Fields[6].DisplayWidth := 20;
    DM.qryEquipamentosReservas.Fields[7].DisplayLabel := 'Posicao';    DM.qryEquipamentosReservas.Fields[7].DisplayWidth := 5;
    DM.qryEquipamentosReservas.Fields[8].Visible      := False;
    DM.qryEquipamentosReservas.Fields[9].DisplayLabel := SGrdDadosSubs.Cells[0, 0];
    DM.qryEquipamentosReservas.Fields[10].DisplayLabel := 'Valor';

    if DM.qryEquipamentosReservas.FieldCount >= 13 then
      begin
        DM.qryEquipamentosReservas.Fields[11].DisplayLabel := SGrdDadosSubs.Cells[0, 1]; DM.qryEquipamentosReservas.Fields[11].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[12].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[12].DisplayWidth := 5;
        GrdEquipCompat.Columns[8].Title.Font.Size := 9;
        GrdEquipCompat.Columns[9].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 15 then
      begin
        DM.qryEquipamentosReservas.Fields[13].DisplayLabel := SGrdDadosSubs.Cells[0, 2]; DM.qryEquipamentosReservas.Fields[13].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[14].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[14].DisplayWidth := 5;
        GrdEquipCompat.Columns[10].Title.Font.Size := 9;
        GrdEquipCompat.Columns[11].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 17 then
      begin
        DM.qryEquipamentosReservas.Fields[15].DisplayLabel := SGrdDadosSubs.Cells[0, 3]; DM.qryEquipamentosReservas.Fields[15].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[16].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[16].DisplayWidth := 5;
        GrdEquipCompat.Columns[12].Title.Font.Size := 9;
        GrdEquipCompat.Columns[13].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 19 then
      begin
        DM.qryEquipamentosReservas.Fields[17].DisplayLabel := SGrdDadosSubs.Cells[0, 4]; DM.qryEquipamentosReservas.Fields[17].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[18].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[18].DisplayWidth := 5;
        GrdEquipCompat.Columns[14].Title.Font.Size := 9;
        GrdEquipCompat.Columns[15].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 21 then
      begin
        DM.qryEquipamentosReservas.Fields[19].DisplayLabel := SGrdDadosSubs.Cells[0, 5]; DM.qryEquipamentosReservas.Fields[19].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[20].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[20].DisplayWidth := 5;
        GrdEquipCompat.Columns[16].Title.Font.Size := 9;
        GrdEquipCompat.Columns[17].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 23 then
      begin
        DM.qryEquipamentosReservas.Fields[21].DisplayLabel := SGrdDadosSubs.Cells[0, 6]; DM.qryEquipamentosReservas.Fields[21].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[22].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[22].DisplayWidth := 5;
        GrdEquipCompat.Columns[18].Title.Font.Size := 9;
        GrdEquipCompat.Columns[19].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 25 then
      begin
        DM.qryEquipamentosReservas.Fields[23].DisplayLabel := SGrdDadosSubs.Cells[0, 7]; DM.qryEquipamentosReservas.Fields[23].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[24].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[24].DisplayWidth := 5;
        GrdEquipCompat.Columns[20].Title.Font.Size := 9;
        GrdEquipCompat.Columns[21].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 27 then
      begin
        DM.qryEquipamentosReservas.Fields[25].DisplayLabel := SGrdDadosSubs.Cells[0, 8]; DM.qryEquipamentosReservas.Fields[25].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[26].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[26].DisplayWidth := 5;
        GrdEquipCompat.Columns[22].Title.Font.Size := 9;
        GrdEquipCompat.Columns[23].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 29 then
      begin
        DM.qryEquipamentosReservas.Fields[27].DisplayLabel := SGrdDadosSubs.Cells[0, 9]; DM.qryEquipamentosReservas.Fields[27].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[28].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[28].DisplayWidth := 5;
        GrdEquipCompat.Columns[24].Title.Font.Size := 9;
        GrdEquipCompat.Columns[25].Title.Font.Size := 9;
      end;
    if DM.qryEquipamentosReservas.FieldCount >= 31 then
      begin
        DM.qryEquipamentosReservas.Fields[29].DisplayLabel := SGrdDadosSubs.Cells[0, 10];DM.qryEquipamentosReservas.Fields[29].DisplayWidth := 5;
        DM.qryEquipamentosReservas.Fields[30].DisplayLabel := 'Valor';                   DM.qryEquipamentosReservas.Fields[30].DisplayWidth := 5;
        GrdEquipCompat.Columns[26].Title.Font.Size := 9;
        GrdEquipCompat.Columns[27].Title.Font.Size := 9;
      end;


    GrdEquipCompat.Columns[0].Title.Font.Size := 9;
    GrdEquipCompat.Columns[1].Title.Font.Size := 9;
    GrdEquipCompat.Columns[2].Title.Font.Size := 9;
    GrdEquipCompat.Columns[3].Title.Font.Size := 9;
    GrdEquipCompat.Columns[4].Title.Font.Size := 9;
    GrdEquipCompat.Columns[5].Title.Font.Size := 9;
    GrdEquipCompat.Columns[6].Title.Font.Size := 9;
    GrdEquipCompat.Columns[7].Title.Font.Size := 9;
  end;
end;

procedure TFrmTelaCadEquipamentoReserva.SGrdDadosEquipDblClick(Sender: TObject);
begin
  inherited;
case SGrdDadosEquip.Col of
  0,1:
    begin
      SGrdDadosSubs.ColWidths[0] := 170;
      SGrdDadosSubs.ColWidths[1] := 65;
      SGrdDadosSubs.ColWidths[2] := 65;

      BtnEquipCompat.Enabled     := True;

      case SGrdDadosEquip.Row of
        0:
          begin
            SGrdDadosSubs.Cells[0, 0]  := SGrdDadosEquip.Cells[0, 0];
            SGrdDadosSubs.Cells[1, 0]  := '0';
            SGrdDadosSubs.Cells[2, 0]  := '0';
          end;
        1:
          begin
            SGrdDadosSubs.Cells[0, 1]  := SGrdDadosEquip.Cells[0, 1];
            SGrdDadosSubs.Cells[1, 1]  := '0';
            SGrdDadosSubs.Cells[2, 1]  := '0';
          end;
        2:
          begin
            SGrdDadosSubs.Cells[0, 2]  := SGrdDadosEquip.Cells[0, 2];
            SGrdDadosSubs.Cells[1, 2]  := '0';
            SGrdDadosSubs.Cells[2, 2]  := '0';
          end;
        3:
          begin
            SGrdDadosSubs.Cells[0, 3]  := SGrdDadosEquip.Cells[0, 3];
            SGrdDadosSubs.Cells[1, 3]  := '0';
            SGrdDadosSubs.Cells[2, 3]  := '0';
          end;
        4:
          begin
            SGrdDadosSubs.Cells[0, 4]  := SGrdDadosEquip.Cells[0, 4];
            SGrdDadosSubs.Cells[1, 4]  := '0';
            SGrdDadosSubs.Cells[2, 4]  := '0';
          end;
        5:
          begin
            SGrdDadosSubs.Cells[0, 5]  := SGrdDadosEquip.Cells[0, 5];
            SGrdDadosSubs.Cells[1, 5]  := '0';
            SGrdDadosSubs.Cells[2, 5]  := '0';
          end;
        6:
          begin
            SGrdDadosSubs.Cells[0, 6]  := SGrdDadosEquip.Cells[0, 6];
            SGrdDadosSubs.Cells[1, 6]  := '0';
            SGrdDadosSubs.Cells[2, 6]  := '0';
          end;
        7:
          begin
            SGrdDadosSubs.Cells[0, 7]  := SGrdDadosEquip.Cells[0, 7];
            SGrdDadosSubs.Cells[1, 7]  := '0';
            SGrdDadosSubs.Cells[2, 7]  := '0';
          end;
        8:
          begin
            SGrdDadosSubs.Cells[0, 8]  := SGrdDadosEquip.Cells[0, 8];
            SGrdDadosSubs.Cells[1, 8]  := '0';
            SGrdDadosSubs.Cells[2, 8]  := '0';
          end;
        9:
          begin
            SGrdDadosSubs.Cells[0, 9]  := SGrdDadosEquip.Cells[0, 9];
            SGrdDadosSubs.Cells[1, 9]  := '0';
            SGrdDadosSubs.Cells[2, 9]  := '0';
          end;
       10:
          begin
            SGrdDadosSubs.Cells[0, 10] := SGrdDadosEquip.Cells[0, 10];
            SGrdDadosSubs.Cells[1, 10]  := '0';
            SGrdDadosSubs.Cells[2, 10]  := '0';
          end;
      end;
    end;
end;
end;

procedure TFrmTelaCadEquipamentoReserva.SGrdDadosEquipDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  conteudo: String;
  alinhamento_anterior: Word;
begin
if ACol = 0 then
  begin
    // vamos obter o conteúdo da célula
    conteudo := (Sender as TStringGrid).Cells[ACol, ARow];

    // vamos obter o alinhamento atual
    alinhamento_anterior := SetTextAlign((Sender as TStringGrid).Canvas.Handle, TA_RIGHT);

    // vamos colocar o conteúdo de volta na célula
    (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left) - 1, Rect.Top + 2, conteudo);

    // vamos voltar o alinhamento anterior para as demais células
    SetTextAlign((Sender as TStringGrid).Canvas.Handle, alinhamento_anterior);
  end;
end;

procedure TFrmTelaCadEquipamentoReserva.SGrdDadosSubsDblClick(Sender: TObject);
begin
  inherited;
case SGrdDadosSubs.Col of
  0,1,2:
    begin
      case SGrdDadosSubs.Row of
        0:
          begin
            SGrdDadosSubs.Cells[0, 0] := EmptyStr;
            SGrdDadosSubs.Cells[1, 0] := EmptyStr;
            SGrdDadosSubs.Cells[2, 0] := EmptyStr;
            BtnEquipCompat.Enabled    := False;
          end;
        1:
          begin
            SGrdDadosSubs.Cells[0, 1] := EmptyStr;
            SGrdDadosSubs.Cells[1, 1] := EmptyStr;
            SGrdDadosSubs.Cells[2, 1] := EmptyStr;
          end;
        2:
          begin
            SGrdDadosSubs.Cells[0, 2] := EmptyStr;
            SGrdDadosSubs.Cells[1, 2] := EmptyStr;
            SGrdDadosSubs.Cells[2, 2] := EmptyStr;
          end;
        3:
          begin
            SGrdDadosSubs.Cells[0, 3] := EmptyStr;
            SGrdDadosSubs.Cells[1, 3] := EmptyStr;
            SGrdDadosSubs.Cells[2, 3] := EmptyStr;
          end;
        4:
          begin
            SGrdDadosSubs.Cells[0, 4] := EmptyStr;
            SGrdDadosSubs.Cells[1, 4] := EmptyStr;
            SGrdDadosSubs.Cells[2, 4] := EmptyStr;
          end;
        5:
          begin
            SGrdDadosSubs.Cells[0, 5] := EmptyStr;
            SGrdDadosSubs.Cells[1, 5] := EmptyStr;
            SGrdDadosSubs.Cells[2, 5] := EmptyStr;
          end;
        6:
          begin
            SGrdDadosSubs.Cells[0, 6] := EmptyStr;
            SGrdDadosSubs.Cells[1, 6] := EmptyStr;
            SGrdDadosSubs.Cells[2, 6] := EmptyStr;
          end;
        7:
          begin
            SGrdDadosSubs.Cells[0, 7] := EmptyStr;
            SGrdDadosSubs.Cells[1, 7] := EmptyStr;
            SGrdDadosSubs.Cells[2, 7] := EmptyStr;
          end;
        8:
          begin
            SGrdDadosSubs.Cells[0, 8] := EmptyStr;
            SGrdDadosSubs.Cells[1, 8] := EmptyStr;
            SGrdDadosSubs.Cells[2, 8] := EmptyStr;
          end;
        9:
          begin
            SGrdDadosSubs.Cells[0, 9] := EmptyStr;
            SGrdDadosSubs.Cells[1, 9] := EmptyStr;
            SGrdDadosSubs.Cells[2, 9] := EmptyStr;
          end;
       10:
          begin
            SGrdDadosSubs.Cells[0, 10] := EmptyStr;
            SGrdDadosSubs.Cells[1, 10] := EmptyStr;
            SGrdDadosSubs.Cells[2, 10] := EmptyStr;
          end;
      end;
    end;
end;

end;

procedure TFrmTelaCadEquipamentoReserva.SGrdDadosSubsDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  conteudo: String;
  alinhamento_anterior: Word;
begin
if ACol = 0 then
  begin
    // vamos obter o conteúdo da célula
    conteudo := (Sender as TStringGrid).Cells[ACol, ARow];

    // vamos obter o alinhamento atual
    alinhamento_anterior := SetTextAlign((Sender as TStringGrid).Canvas.Handle, TA_RIGHT);

    // vamos colocar o conteúdo de volta na célula
    (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left) - 1, Rect.Top + 2, conteudo);

    // vamos voltar o alinhamento anterior para as demais células
    SetTextAlign((Sender as TStringGrid).Canvas.Handle, alinhamento_anterior);
  end;
end;

procedure TFrmTelaCadEquipamentoReserva.SGrdDadosSubsKeyPress(Sender: TObject;
  var Key: Char);
var
ARow: SmallInt;
begin
  inherited;
if (SGrdDadosSubs.Col = 0) then
  Key := #0;

if (SGrdDadosSubs.Col = 1) or (SGrdDadosSubs.Col = 2) then
  if (SGrdDadosSubs.Cells[0, SGrdDadosSubs.Row] = EmptyStr) then
    Key := #0;

if (SGrdDadosSubs.Col = 1) or (SGrdDadosSubs.Col = 2) then
  begin
    if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9',',']) then
      begin
        if Key = #13 then
          begin
            Key := #0;
            SelectNext(ActiveControl,True,True);
          end;
      end
    else
      begin
        Key := #0;
      end;

    ARow := SGrdDadosSubs.Row;

    if SGrdDadosSubs.Cells[0, ARow] = EmptyStr then
      Key := #0;
  end;
end;

end.

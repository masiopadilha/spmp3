unit UnTelaCadOrdemServicoLocalizaMObra;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param,
  Vcl.WinXCtrls, Vcl.Menus;
type
  TFrmTelaCadOrdemServicoLocalizaMObra = class(TFrmTelaPaiOkCancel)
    GrdMObra: TDBGrid;
    BtnImprimir: TButton;
    PopupMenuRelat: TPopupMenu;
    Individual1: TMenuItem;
    Completo1: TMenuItem;
    POS: TPanel;
    GrdMObraOSProg: TDBGrid;
    GrdMObraOSExec: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdMObraKeyPress(Sender: TObject; var Key: Char);
    procedure GrdMObraOSProgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnImprimirClick(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure GrdMObraOSExecDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadOrdemServicoLocalizaMObra: TFrmTelaCadOrdemServicoLocalizaMObra;
implementation
{$R *.dfm}
uses UnDM, UnDmRelatorios, UnTelaCadOrdemServicoGerencia;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.BtnImprimirClick(
  Sender: TObject);
begin
  inherited;
PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.Completo1Click(Sender: TObject);
begin
  inherited;
DmRelatorios.frxROrdemServicoLocalizaMObra.ShowReport();
end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryOrdemServicoLocalizaMObra.Close;
DM.qryOrdemServicoLocalizaMObraOSProg.Close;
DM.qryOrdemServicoLocalizaMObraOSExec.Close;
end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADORDEMSERVICO';
end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.FormShow(Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoLocalizaMObra.Close;
DM.qryOrdemServicoLocalizaMObra.Params[0].AsString := DM.FCodEmpresa;
DM.qryOrdemServicoLocalizaMObra.Open;
DM.qryOrdemServicoLocalizaMObraOSProg.Close;
DM.qryOrdemServicoLocalizaMObraOSProg.Params[0].AsString := DM.FCodEmpresa;
DM.qryOrdemServicoLocalizaMObraOSProg.Params[1].AsString := FormatDateTime('yyyy/mm/dd', FrmTelaCadOrdemServicoGerencia.EdtData1.Date) + ' 00:00:00';
DM.qryOrdemServicoLocalizaMObraOSProg.Params[2].AsString := FormatDateTime('yyyy/mm/dd', FrmTelaCadOrdemServicoGerencia.EdtData2.Date) + ' 23:59:59';
DM.qryOrdemServicoLocalizaMObraOSProg.Open;
DM.qryOrdemServicoLocalizaMObraOSExec.Close;
DM.qryOrdemServicoLocalizaMObraOSExec.Params[0].AsString := DM.FCodEmpresa;
DM.qryOrdemServicoLocalizaMObraOSExec.Params[1].AsString := FormatDateTime('yyyy/mm/dd', FrmTelaCadOrdemServicoGerencia.EdtData1.Date) + ' 00:00:00';
DM.qryOrdemServicoLocalizaMObraOSExec.Params[2].AsString := FormatDateTime('yyyy/mm/dd', FrmTelaCadOrdemServicoGerencia.EdtData2.Date) + ' 23:59:59';
DM.qryOrdemServicoLocalizaMObraOSExec.Open;
end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.GrdMObraKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (Key = #13) and ((GrdMObra.SelectedIndex = 0) or (GrdMObra.SelectedIndex = 1)) then
  begin
    DM.FTabela_auxiliar  := 300;
    DM.FNomeConsulta     := 'Funcionários';
    if GrdMObra.SelectedIndex = 0 then
      DM.FParamAuxiliar[1] := 'MATRICULA';
    if GrdMObra.SelectedIndex = 1 then
      DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        if DM.FCodCombo <> '' then
          begin
            GrdMObra.DataSource.DataSet.Filter := '';
            GrdMObra.DataSource.DataSet.Filter := 'MATRICULA = ' + QuotedStr(DM.FCodCombo);
            GrdMObra.DataSource.DataSet.Filtered := True;
          end
        else
          begin
            GrdMObra.DataSource.DataSet.Filter := '';
            GrdMObra.DataSource.DataSet.Filtered := False;
          end
      end
    else
      begin
        GrdMObra.DataSource.DataSet.Filter := '';
        GrdMObra.DataSource.DataSet.Filtered := False;
      end
  end;
end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.GrdMObraOSExecDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdMObraOSExec.Columns[0].Title.Font.Size := 9;
GrdMObraOSExec.Columns[1].Title.Font.Size := 9;
GrdMObraOSExec.Columns[2].Title.Font.Size := 9;
GrdMObraOSExec.Columns[3].Title.Font.Size := 9;
GrdMObraOSExec.Columns[4].Title.Font.Size := 9;
GrdMObraOSExec.Columns[5].Title.Font.Size := 9;
GrdMObraOSExec.Columns[6].Title.Font.Size := 9;
GrdMObraOSExec.Columns[7].Title.Font.Size := 9;
GrdMObraOSExec.Columns[0].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecCODIGO.Alignment             := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecCODIGO.DisplayLabel          := 'O.S.';
DM.qryOrdemServicoLocalizaMObraOSExecCODIGO.DisplayWidth          := 8;
DM.qryOrdemServicoLocalizaMObraOSExecDESCRICAO.DisplayLabel       := 'Descrição';
DM.qryOrdemServicoLocalizaMObraOSExecDESCRICAO.DisplayWidth       := 30;
GrdMObraOSExec.Columns[2].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecSITUACAO.Alignment           := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecSITUACAO.DisplayLabel        := 'Situação';
DM.qryOrdemServicoLocalizaMObraOSExecSITUACAO.DisplayWidth        := 15;
GrdMObraOSExec.Columns[3].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATACADASTRO.Alignment       := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATACADASTRO.DisplayLabel    := 'Cadastro';
DM.qryOrdemServicoLocalizaMObraOSExecDATACADASTRO.DisplayWidth    := 15;
GrdMObraOSExec.Columns[4].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATAINICIOREAL.Alignment     := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATAINICIOREAL.DisplayLabel  := 'Início Real';
DM.qryOrdemServicoLocalizaMObraOSExecDATAINICIOREAL.DisplayWidth  := 15;
GrdMObraOSExec.Columns[5].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATAFIMREAL.Alignment        := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATAFIMREAL.DisplayLabel     := 'Fim Real';
DM.qryOrdemServicoLocalizaMObraOSExecDATAFIMREAL.DisplayWidth     := 15;
GrdMObraOSExec.Columns[6].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATAFECHAMENTO.Alignment     := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecDATAFECHAMENTO.DisplayLabel  := 'Fechamento';
DM.qryOrdemServicoLocalizaMObraOSExecDATAFECHAMENTO.DisplayWidth  := 15;
GrdMObraOSExec.Columns[7].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecCODEQUIPAMENTO.Alignment     := taCenter;
DM.qryOrdemServicoLocalizaMObraOSExecCODEQUIPAMENTO.DisplayLabel  := 'Cód. Equipamento';
DM.qryOrdemServicoLocalizaMObraOSExecCODEQUIPAMENTO.DisplayWidth  := 15;
DM.qryOrdemServicoLocalizaMObraOSExecDESCEQUIPAMENTO.DisplayLabel := 'Equipamento';
DM.qryOrdemServicoLocalizaMObraOSExecDESCEQUIPAMENTO.DisplayWidth := 35;
DM.qryOrdemServicoLocalizaMObraOSExecCENTROCUSTO.DisplayLabel     := 'Centro de Custo';
DM.qryOrdemServicoLocalizaMObraOSExecCENTROCUSTO.DisplayWidth     := 35;
if (Column.Field.FieldName = 'SITUACAO') then
  begin
    if (GrdMObraOSExec.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO')then
      begin
        GrdMObraOSExec.Canvas.Brush.Color := clInfoBk; GrdMObraOSExec.Canvas.Font.Color := clGreen;
      end;
    if (GrdMObraOSExec.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')then
      begin
        GrdMObraOSExec.Canvas.Brush.Color := clGreen; GrdMObraOSExec.Canvas.Font.Color := clWhite;
      end;
    if (GrdMObraOSExec.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PROGRAMADA')then
      begin
        GrdMObraOSExec.Canvas.Brush.Color := clBlue; GrdMObraOSExec.Canvas.Font.Color := clWhite;
      end;
  end;
if not odd(GrdMObraOSExec.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'SITUACAO') then
      if not (gdSelected in State) then
        begin
        GrdMObraOSExec.Canvas.Brush.Color := $00F7F8F9;
//          GrdOrdemServico.Canvas.FillRect(Rect);
//          GrdOrdemServico.DefaultDrawDataCell(rect,Column.Field,state);
      end;
GrdMObraOSExec.Canvas.FillRect(Rect);
GrdMObraOSExec.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.GrdMObraOSProgDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdMObraOSProg.Columns[0].Title.Font.Size := 9;
GrdMObraOSProg.Columns[1].Title.Font.Size := 9;
GrdMObraOSProg.Columns[2].Title.Font.Size := 9;
GrdMObraOSProg.Columns[3].Title.Font.Size := 9;
GrdMObraOSProg.Columns[4].Title.Font.Size := 9;
GrdMObraOSProg.Columns[5].Title.Font.Size := 9;
GrdMObraOSProg.Columns[6].Title.Font.Size := 9;
GrdMObraOSProg.Columns[7].Title.Font.Size := 9;
GrdMObraOSProg.Columns[0].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgCODIGO.Alignment             := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgCODIGO.DisplayLabel          := 'O.S.';
DM.qryOrdemServicoLocalizaMObraOSProgCODIGO.DisplayWidth          := 8;
DM.qryOrdemServicoLocalizaMObraOSProgDESCRICAO.DisplayLabel       := 'Descrição';
DM.qryOrdemServicoLocalizaMObraOSProgDESCRICAO.DisplayWidth       := 30;
GrdMObraOSProg.Columns[2].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgSITUACAO.Alignment           := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgSITUACAO.DisplayLabel        := 'Situação';
DM.qryOrdemServicoLocalizaMObraOSProgSITUACAO.DisplayWidth        := 15;
GrdMObraOSProg.Columns[3].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATACADASTRO.Alignment       := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATACADASTRO.DisplayLabel    := 'Cadastro';
DM.qryOrdemServicoLocalizaMObraOSProgDATACADASTRO.DisplayWidth    := 15;
GrdMObraOSProg.Columns[4].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATAINICIOREAL.Alignment     := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATAINICIOREAL.DisplayLabel  := 'Início Real';
DM.qryOrdemServicoLocalizaMObraOSProgDATAINICIOREAL.DisplayWidth  := 15;
GrdMObraOSProg.Columns[5].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATAFIMREAL.Alignment        := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATAFIMREAL.DisplayLabel     := 'Fim Real';
DM.qryOrdemServicoLocalizaMObraOSProgDATAFIMREAL.DisplayWidth     := 15;
GrdMObraOSProg.Columns[6].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATAFECHAMENTO.Alignment     := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgDATAFECHAMENTO.DisplayLabel  := 'Fechamento';
DM.qryOrdemServicoLocalizaMObraOSProgDATAFECHAMENTO.DisplayWidth  := 15;
GrdMObraOSProg.Columns[7].Title.Alignment                         := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgCODEQUIPAMENTO.Alignment     := taCenter;
DM.qryOrdemServicoLocalizaMObraOSProgCODEQUIPAMENTO.DisplayLabel  := 'Cód. Equipamento';
DM.qryOrdemServicoLocalizaMObraOSProgCODEQUIPAMENTO.DisplayWidth  := 15;
DM.qryOrdemServicoLocalizaMObraOSProgDESCEQUIPAMENTO.DisplayLabel := 'Equipamento';
DM.qryOrdemServicoLocalizaMObraOSProgDESCEQUIPAMENTO.DisplayWidth := 35;
DM.qryOrdemServicoLocalizaMObraOSProgCENTROCUSTO.DisplayLabel     := 'Centro de Custo';
DM.qryOrdemServicoLocalizaMObraOSProgCENTROCUSTO.DisplayWidth     := 35;
if (Column.Field.FieldName = 'SITUACAO') then
  begin
    if (GrdMObraOSProg.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO')then
      begin
        GrdMObraOSProg.Canvas.Brush.Color := clInfoBk; GrdMObraOSProg.Canvas.Font.Color := clGreen;
      end;
    if (GrdMObraOSProg.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')then
      begin
        GrdMObraOSProg.Canvas.Brush.Color := clGreen; GrdMObraOSProg.Canvas.Font.Color := clWhite;
      end;
    if (GrdMObraOSProg.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PROGRAMADA')then
      begin
        GrdMObraOSProg.Canvas.Brush.Color := clBlue; GrdMObraOSProg.Canvas.Font.Color := clWhite;
      end;
  end;
if not odd(GrdMObraOSProg.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'SITUACAO') then
      if not (gdSelected in State) then
        begin
        GrdMObraOSProg.Canvas.Brush.Color := $00F7F8F9;
//          GrdOrdemServico.Canvas.FillRect(Rect);
//          GrdOrdemServico.DefaultDrawDataCell(rect,Column.Field,state);
      end;
GrdMObraOSProg.Canvas.FillRect(Rect);
GrdMObraOSProg.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;
procedure TFrmTelaCadOrdemServicoLocalizaMObra.Individual1Click(
  Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoLocalizaMObra.Filter := 'MATRICULA = ' + QuotedStr(DM.qryOrdemServicoLocalizaMObraMATRICULA.AsString);
DM.qryOrdemServicoLocalizaMObra.Filtered := True;
DmRelatorios.frxROrdemServicoLocalizaMObra.ShowReport();
DM.qryOrdemServicoLocalizaMObra.Filter := '';
DM.qryOrdemServicoLocalizaMObra.Filtered := False;
end;
end.

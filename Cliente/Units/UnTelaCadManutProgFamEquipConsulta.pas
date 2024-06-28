unit UnTelaCadManutProgFamEquipConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.IOUtils, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker,
  JvComponentBase, JvDBGridExport, JvBaseDlg, JvProgressDialog,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExGrids, JvStringGrid;

type
  TFrmTelaCadManutProgFamEquipConsulta = class(TFrmTelaPaiOKCancel)
    DBGrid: TJvDBGrid;
    PFiltros2: TPanel;
    Label6: TLabel;
    BtnTipoManutencao: TButton;
    EdtTipoManutencao: TEdit;
    chkProgramada: TCheckBox;
    chkAtivas: TCheckBox;
    BtnConsultar: TButton;
    JvProgressDialog1: TJvProgressDialog;
    SaveDialog1: TSaveDialog;
    FDMemTManutencaoExcel: TFDMemTable;
    DSManutencaoExcel: TDataSource;
    grid: TJvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkProgramadaClick(Sender: TObject);
    procedure chkAtivasClick(Sender: TObject);
    procedure BtnTipoManutencaoClick(Sender: TObject);
    procedure EdtTipoManutencaoDblClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    LEquipamento, LTipoManutencao, LProgramadas,  LAtivas: String;

    procedure LimpaGrid(Grid: TStringGrid);
    procedure CopyDataSetToGrid(Query: TFDMemTable; StringGrid: TStringGrid);
    procedure SaveDoc(AExportClass: TJvCustomDBGridExportClass; const Filename: string);
    procedure DoExportProgress(Sender: TObject; Min, Max,
      Position: Cardinal; const AText: string; var AContinue: Boolean);
    procedure ConfigurarFiltros;
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgFamEquipConsulta: TFrmTelaCadManutProgFamEquipConsulta;

implementation

{$R *.dfm}

uses UnDM, UnTelaConsulta;


procedure TFrmTelaCadManutProgFamEquipConsulta.LimpaGrid(Grid: TStringGrid);
var lin, col: integer;
begin
     for lin := 1 to Grid.RowCount - 1 do
       for col := 0 to Grid.ColCount - 1 do
         Grid.Cells[col, lin] := '';
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.CopyDataSetToGrid(Query: TFDMemTable; StringGrid: TStringGrid);
var
  I, J: Integer;
begin
  // Limpe o TStringGrid, se necessário
  LimpaGrid(StringGrid);

  // Defina o número de colunas do TStringGrid
  StringGrid.ColCount := Query.FieldCount;
  StringGrid.RowCount := Query.RecordCount + 1;

  // Preencha os cabeçalhos das colunas com os nomes dos campos do ClientDataSet
  for I := 0 to Query.FieldCount - 1 do
  begin
    if Query.Fields[I].Visible = True then
      StringGrid.Cells[I, 0] := Query.Fields[I].DisplayLabel;
  end;

  // Preencha as células do TStringGrid com os valores da Query
  Query.First;
  J := 1; // Comece a partir da segunda linha
  while not Query.Eof do
  begin
    for I := 0 to Query.FieldCount - 1 do
    begin
      if Query.Fields[I].Visible = True then
        StringGrid.Cells[I, J] := Query.Fields[I].AsString;
    end;

    Query.Next;
    Inc(J);
  end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.DBGridKeyPress(Sender: TObject;
  var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (DBGrid.SelectedIndex = 1) then
  begin
    LEquipamento := EmptyStr;
    DM.FTabela_auxiliar := 250;
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.FParamAuxiliar[0] := DM.FCodCombo;
      LEquipamento         := DM.FValorCombo;
      FreeAndNil(FrmTelaAuxiliar);
      ConfigurarFiltros;
    End;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.DoExportProgress(Sender: TObject; Min, Max,
  Position: Cardinal; const AText: string; var AContinue: Boolean);
begin
  JvProgressDialog1.Min := Min;
  JvProgressDialog1.Max := Max;
  JvProgressDialog1.Position := Position;
  JvProgressDialog1.Caption := AText;
  if Max > 0 then
    JvProgressDialog1.Text := Format('Exportando (%d%% finalizado)', [round(Position / Max * 100)]);
  AContinue := not JvProgressDialog1.Cancelled;
  if not AContinue or (Position >= Max) then
    JvProgressDialog1.Hide;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.SaveDoc(AExportClass: TJvCustomDBGridExportClass; const Filename: string);
var
  AExporter: TJvCustomDBGridExport;
begin
  AExporter := AExportClass.Create(self);
  try
    AExporter.Grid := DBGrid;
    if AExporter is TJvDBGridCSVExport then
      TJvDBGridCSVExport(AExporter).ExportSeparator := esComma; // this to be compatible with JvCsvData
    AExporter.Filename := Filename;
    AExporter.OnProgress := DoExportProgress;
    JvProgressDialog1.Caption := AExporter.Caption;
    JvProgressDialog1.Show;
    AExporter.ExportGrid;
  finally
    AExporter.Free;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.ConfigurarFiltros;
begin
  DBGrid.DataSource.DataSet.Filtered := False;
  DBGrid.DataSource.DataSet.Filter := EmptyStr;
  DM.qryManutProgFamEquipCons.IndexDefs.Clear;

  LProgramadas := ''; LAtivas := '';

  if EdtTipoManutencao.Text <> '' then
    begin
      if DBGrid.DataSource.DataSet.Filter = EmptyStr then
        DBGrid.DataSource.DataSet.Filter := 'CODTIPOMANUTENCAO = ' + QuotedStr(LTipoManutencao)
      else
        DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND CODTIPOMANUTENCAO = '+QuotedStr(LTipoManutencao);
    end;

  if (chkProgramada.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LProgramadas   := ' (PLANEJADA IS NULL)'
    else
      LProgramadas   := ' AND (PLANEJADA IS NULL)';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LProgramadas;


  if (chkAtivas.Checked = True) then
  begin
    if DBGrid.DataSource.DataSet.Filter = '' then
      LAtivas   := ' (ATIVO = ''S'')'
    else
      LAtivas   := ' AND (ATIVO = ''S'')';
  end else
  begin
    if DBGrid.DataSource.DataSet.Filter = '' then
      LAtivas   := ' (ATIVO <> ''S'')'
    else
      LAtivas   := ' AND (ATIVO <> ''S'')';
  end;
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LAtivas;

  if LEquipamento <> EmptyStr then
  begin
    if DBGrid.DataSource.DataSet.Filter = EmptyStr then
      DBGrid.DataSource.DataSet.Filter := 'CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0])
    else
      DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0]);
  end;

  if DBGrid.DataSource.DataSet.Filter <> EmptyStr then
    DBGrid.DataSource.DataSet.Filtered := True;

  DM.qryManutProgFamEquipCons.First;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.BtnConsultarClick(
  Sender: TObject);
var
  caminho: string;
begin
  inherited;
//  SaveDialog1.Filename := 'Consulta de Manutenções.'+FormatDateTime('dd.mm.yyyy.hh.sss', now)+'.csv';
//  if SaveDialog1.Execute then
//    SaveDoc(TJvDBGridCSVExport, SaveDialog1.Filename);

  caminho := 'C:\SPMP3\Planilhas';

  // Verifica se a pasta existe
  if not TDirectory.Exists(caminho) then
  begin
    // Cria a pasta se não existir
    try
      TDirectory.CreateDirectory(caminho);
    except
      on E: Exception do
        ShowMessage('Erro ao criar a pasta: C:\SPMP3\Planilhas' + E.Message);
    end;
  end
  else
    begin;

      FDMemTManutencaoExcel.Close;
      FDMemTManutencaoExcel.CopyDataSet(DM.qryManutProgFamEquipCons, [coStructure, coRestart, coAppend, coCalcFields]);

      FDMemTManutencaoExcel.FieldByName('CODEQUIPAMENTO').DisplayLabel   := 'Cód. Equipamento';
      FDMemTManutencaoExcel.FieldByName('CODEQUIPAMENTO').Index          := 0;
      FDMemTManutencaoExcel.FieldByName('EQUIPAMENTO').DisplayLabel      := 'Equipamento';
      FDMemTManutencaoExcel.FieldByName('EQUIPAMENTO').Index             := 1;
      FDMemTManutencaoExcel.FieldByName('CENTROCUSTO').DisplayLabel      := 'Centro de Custo';
      FDMemTManutencaoExcel.FieldByName('CENTROCUSTO').Index             := 2;
      FDMemTManutencaoExcel.FieldByName('TIPOMANUTENCAO').DisplayLabel   := 'Tipo de Manutenção';
      FDMemTManutencaoExcel.FieldByName('TIPOMANUTENCAO').Index          := 3;
      FDMemTManutencaoExcel.FieldByName('MANUTENCAO').DisplayLabel       := 'Manutenção';
      FDMemTManutencaoExcel.FieldByName('MANUTENCAO').Index              := 4;
      FDMemTManutencaoExcel.FieldByName('DIAS').DisplayLabel             := 'Dias (d)';
      FDMemTManutencaoExcel.FieldByName('DIAS').Index                    := 5;
      FDMemTManutencaoExcel.FieldByName('ATIVO').DisplayLabel            := 'Ativo';
      FDMemTManutencaoExcel.FieldByName('ATIVO').Index                   := 6;
      FDMemTManutencaoExcel.FieldByName('PLANEJADA').DisplayLabel        := 'Programada';
      FDMemTManutencaoExcel.FieldByName('PLANEJADA').Index               := 7;
      FDMemTManutencaoExcel.FieldByName('CODMANUTFAMILIA').DisplayLabel  := 'Cód. Manut. Família';
      FDMemTManutencaoExcel.FieldByName('CODMANUTFAMILIA').Index         := 8;
      FDMemTManutencaoExcel.FieldByName('DESCMANUTFAMILIA').DisplayLabel := 'Manutenção de Família';
      FDMemTManutencaoExcel.FieldByName('DESCMANUTFAMILIA').Index        := 9;

      CopyDataSetToGrid(FDMemTManutencaoExcel, Grid);
      //caminho := caminho+'\Lista Simples das Ordens de Serviço.'+FormatDateTime('dd.mm.yyyy.hh.sss', now) + '.csv';
      caminho := caminho+'\Consulta de Manutenções.'+FormatDateTime('dd.mm.yyyy.hh.sss', now)+'.csv';
      Grid.SaveToCSV(caminho);

      Application.MessageBox(PChar( 'Exportação do arquivo "' + caminho + '" concluída com sucesso!'), 'SPMP3', MB_OK + MB_ICONINFORMATION);
//      PAuxiliares.Caption := 'Exportação concluída!';
//      Sleep(3);
      PAuxiliares.Caption := '';
    end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.BtnTipoManutencaoClick(
  Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 100;
    DM.FNomeConsulta := 'Tipos de Manutenção';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LTipoManutencao        := DM.FCodCombo;
        EdtTipoManutencao.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.chkAtivasClick(Sender: TObject);
begin
  inherited;
  ConfigurarFiltros;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.chkProgramadaClick(
  Sender: TObject);
begin
  inherited;
  ConfigurarFiltros;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.EdtTipoManutencaoDblClick(
  Sender: TObject);
begin
  inherited;
  LTipoManutencao := '';
  EdtTipoManutencao.Text := '';
  ConfigurarFiltros;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryManutProgFamEquipCons.Close;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryManutProgFamEquipCons.Close;
  DM.qryManutProgFamEquipCons.Params[0].AsString := DM.FCodEmpresa;
  DM.qryManutProgFamEquipCons.Open;
  ConfigurarFiltros;
end;

end.

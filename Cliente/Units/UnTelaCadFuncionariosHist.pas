unit UnTelaCadFuncionariosHist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, System.DateUtils,
  Vcl.ComCtrls, Data.DB, FireDAC.Stan.Param, JvExComCtrls, JvDateTimePicker,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, JvExGrids, JvStringGrid, System.IOUtils;

type
  TFrmTelaCadFuncionariosHist = class(TFrmTelaPaiOkCancel)
    PFundo: TPanel;
    GrdManutencoes: TDBGrid;
    GrdInspecoes: TDBGrid;
    BtnConsultar: TButton;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label4: TLabel;
    EdtData2: TJvDateTimePicker;
    Label2: TLabel;
    CBConsSimples: TComboBox;
    GrdFuncionarios: TDBGrid;
    BtnImprimir: TButton;
    PopupMenuRelat: TPopupMenu;
    Completa1: TMenuItem;
    Exportar1: TMenuItem;
    FDMemTFuncSimplesExcel: TFDMemTable;
    DSFuncSimplesExcel: TDataSource;
    grid: TJvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultarClick(Sender: TObject);
    procedure GrdInspecoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBConsSimplesChange(Sender: TObject);
    procedure GrdFuncionariosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtData1Change(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure Completa1Click(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure CopyDataSetToGrid(Query: TFDMemTable; StringGrid: TStringGrid);
    procedure LimpaGrid(Grid: TStringGrid);

  public
    { Public declarations }
  end;

var
  FrmTelaCadFuncionariosHist: TFrmTelaCadFuncionariosHist;

implementation

{$R *.dfm}

uses UnDM, UnTelaConsulta, UnDmRelatorios;

procedure TFrmTelaCadFuncionariosHist.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  if EdtData1.Date > EdtData2.Date then Exit;

  DM.FDataConsulta1 := EdtData1.Date;
  DM.FDataConsulta2 := EdtData2.Date;

  DM.MSGAguarde('');

  case FrmTelaCadFuncionariosHist.CBConsSimples.ItemIndex of
    0:
      begin
        DM.qryFuncionariosHist.Filter   := '';
        DM.qryFuncionariosHist.Filtered := False;
      end;
    1:
      begin
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Mecânica');
        DM.qryFuncionariosHist.Filtered := True;
      end;
    2:
      begin
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Elétrica');
        DM.qryFuncionariosHist.Filtered := True;
      end;
    3:
      begin
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Civil');
        DM.qryFuncionariosHist.Filtered := True;
      end;
    4:
      begin
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Apoio Técnico');
        DM.qryFuncionariosHist.Filtered := True;
      end;
    5:
      begin
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Produtiva');
        DM.qryFuncionariosHist.Filtered := True;
      end;
    6:
      begin
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Administrativa');
        DM.qryFuncionariosHist.Filtered := True;
      end;
  end;

  if DM.FParamAuxiliar[0] <> '' then
    DM.qryFuncionariosHist.Locate('MATRICULA', DM.FParamAuxiliar[0], [])
  else
    DM.qryFuncionariosHist.First;

  DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadFuncionariosHist.BtnImprimirClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadFuncionariosHist.CBConsSimplesChange(Sender: TObject);
begin
  inherited;
  case CBConsSimples.ItemIndex of
//    0:
//      begin
//        DM.qryFuncionariosHist.Filter   := 'MATRICULA = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString);
//        DM.qryFuncionariosHist.Filtered := True;
//        DM.qryFuncionariosHist.First;
//        GrdFuncionarios.Enabled := True;
//      end;
    0:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := '';
        DM.qryFuncionariosHist.Filtered := False;
        DM.qryFuncionariosHist.First;
      end;
    1:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Mecânica');
        DM.qryFuncionariosHist.Filtered := True;
        DM.qryFuncionariosHist.First;
      end;
    2:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Elétrica');
        DM.qryFuncionariosHist.Filtered := True;
        DM.qryFuncionariosHist.First;
      end;
    3:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Civil');
        DM.qryFuncionariosHist.Filtered := True;
        DM.qryFuncionariosHist.First;
      end;
    4:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Apoio Técnico');
        DM.qryFuncionariosHist.Filtered := True;
        DM.qryFuncionariosHist.First;
      end;
    5:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Produtiva');
        DM.qryFuncionariosHist.Filtered := True;
        DM.qryFuncionariosHist.First;
      end;
    6:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Administrativa');
        DM.qryFuncionariosHist.Filtered := True;
        DM.qryFuncionariosHist.First;
      end;
    7:
      begin
        DM.FParamAuxiliar[0] := '';
        DM.qryFuncionariosHist.Filter   := 'TIPOCELULA = ' + QuotedStr('Utilidades');
        DM.qryFuncionariosHist.Filtered := True;
        DM.qryFuncionariosHist.First;
      end;
  end;
  BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadFuncionariosHist.EdtData1Change(Sender: TObject);
begin
  inherited;
  DM.FDataConsulta1 := EdtData1.Date;
  DM.FDataConsulta2 := EdtData2.Date;
end;

procedure TFrmTelaCadFuncionariosHist.LimpaGrid(Grid: TStringGrid);
var lin, col: integer;
begin
     for lin := 1 to Grid.RowCount - 1 do
       for col := 0 to Grid.ColCount - 1 do
         Grid.Cells[col, lin] := '';
end;

procedure TFrmTelaCadFuncionariosHist.Completa1Click(Sender: TObject);
begin
  inherited;
  if not Assigned(DmRelatorios) then
    Application.CreateForm(TDmRelatorios, DmRelatorios);

  DmRelatorios.frxRFuncionariosHist.ShowReport();

  if DM.FParamAuxiliar[0] <> '' then
    DM.qryFuncionariosHist.Locate('MATRICULA', DM.FParamAuxiliar[0], [])
  else
    DM.qryFuncionariosHist.First;
end;

procedure TFrmTelaCadFuncionariosHist.CopyDataSetToGrid(Query: TFDMemTable; StringGrid: TStringGrid);
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

procedure TFrmTelaCadFuncionariosHist.Exportar1Click(Sender: TObject);
var
  caminho: string;
begin
  inherited;
  DM.qryFuncionarioHistSimples.Close;
  DM.qryFuncionarioHistSimples.Params[0].AsString := DM.FCodEmpresa;
  DM.qryFuncionarioHistSimples.Open;

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
      FDMemTFuncSimplesExcel.Close;
      FDMemTFuncSimplesExcel.CopyDataSet(DM.qryFuncionarioHistSimples, [coStructure, coRestart, coAppend, coCalcFields]);
      FDMemTFuncSimplesExcel.FieldByName('CODORDEMSERVICO').DisplayLabel  := 'O.S';
      FDMemTFuncSimplesExcel.FieldByName('CODORDEMSERVICO').Index         := 0;
      FDMemTFuncSimplesExcel.FieldByName('MATRICULA').DisplayLabel        := 'Matrícula';
      FDMemTFuncSimplesExcel.FieldByName('MATRICULA').Index               := 1;
      FDMemTFuncSimplesExcel.FieldByName('NOME').DisplayLabel             := 'Nome';
      FDMemTFuncSimplesExcel.FieldByName('NOME').Index                    := 2;
      FDMemTFuncSimplesExcel.FieldByName('TOTALHOMEMHORA').DisplayLabel   := 'HH';
      FDMemTFuncSimplesExcel.FieldByName('TOTALHOMEMHORA').Index          := 3;
      FDMemTFuncSimplesExcel.FieldByName('DATAPROGINI').DisplayLabel      := 'Prog.';
      FDMemTFuncSimplesExcel.FieldByName('DATAPROGINI').Index             := 4;
      FDMemTFuncSimplesExcel.FieldByName('DATAFECHAMENTO').DisplayLabel   := 'Fecham.';
      FDMemTFuncSimplesExcel.FieldByName('DATAFECHAMENTO').Index          := 5;
      FDMemTFuncSimplesExcel.FieldByName('AREA').DisplayLabel             := 'Área.';
      FDMemTFuncSimplesExcel.FieldByName('AREA').Index                    := 6;
      FDMemTFuncSimplesExcel.FieldByName('CELULA').DisplayLabel           := 'Célula';
      FDMemTFuncSimplesExcel.FieldByName('CELULA').Index                  := 7;

      CopyDataSetToGrid(FDMemTFuncSimplesExcel, grid);
      caminho := caminho+'\Lista Simples do Histórico dos Funcionários.'+FormatDateTime('dd.mm.yyyy.hh.sss', now) + '.csv';
      grid.SaveToCSV(caminho);

      Application.MessageBox(PChar( 'Exportação do arquivo "' + caminho + '" concluída com sucesso!'), 'SPMP3', MB_OK + MB_ICONINFORMATION);

      DM.qryFuncionarioHistSimples.Close;
    end;
end;

procedure TFrmTelaCadFuncionariosHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.FParamAuxiliar[0] := '';
DM.FParamAuxiliar[1] := '';
DM.FParamAuxiliar[2] := '';
DM.qryFuncionariosHist.Close;
end;

procedure TFrmTelaCadFuncionariosHist.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADFUNCIONARIOS';

EdtData1.Date := IncDay(DateOf(DM.FDataHoraServidor), -30);
EdtData2.Date := DateOf(DM.FDataHoraServidor);

DM.FDataConsulta1 := EdtData1.Date;
DM.FDataConsulta2 := EdtData2.Date;

DM.qryFuncionariosHist.Close;
DM.qryFuncionariosHist.Params[0].AsString := DM.FCodEmpresa;
// DM.qryFuncionariosHist.Params[1].AsString := DM.FParamAuxiliar[0];
DM.qryFuncionariosHist.Open;

BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadFuncionariosHist.GrdFuncionariosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (Key = #13) and ((GrdFuncionarios.SelectedIndex = 0) or (GrdFuncionarios.SelectedIndex = 1)) then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FParamAuxiliar[1] := 'NOME';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.FParamAuxiliar[0] := DM.FCodCombo;
      DM.FParamAuxiliar[2] := DM.FValorCombo;

      DM.FDataConsulta1 := EdtData1.Date;
      DM.FDataConsulta2 := EdtData2.Date;

//      DM.qryFuncionariosHist.Filter   := 'MATRICULA = ' + QuotedStr(DM.FParamAuxiliar[0]);
//      DM.qryFuncionariosHist.Filtered := True;
//      DM.qryFuncionariosHist.First;
//      GrdFuncionarios.Enabled := True;

      if DM.FCodCombo <> '' then
        DM.qryFuncionariosHist.Locate('MATRICULA', DM.FCodCombo, []);

      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

procedure TFrmTelaCadFuncionariosHist.GrdInspecoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not odd(GrdInspecoes.DataSource.DataSet.RecNo) then
        if not (gdSelected in State) then
          begin
          GrdInspecoes.Canvas.Brush.Color := $00F7F8F9;
        end;

  GrdInspecoes.Canvas.FillRect(Rect);
  GrdInspecoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

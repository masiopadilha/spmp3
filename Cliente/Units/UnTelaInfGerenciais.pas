unit UnTelaInfGerenciais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, VclTee.TeeGDIPlus, Vcl.Menus,
  Vcl.ComCtrls, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, System.DateUtils, System.Math,
  Data.DB, frxClass, frxDBSet, frxPreview, Datasnap.DBClient, Vcl.imaging.Jpeg, FireDAC.Stan.Param;

type
  TFrmTelaInfGerenciais = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    Chart1: TChart;
    Series1: TBarSeries;
    Label8: TLabel;
    CBPeriodo: TComboBox;
    ProgressBar1: TProgressBar;
    MainMenu1: TMainMenu;
    ParadasManut: TMenuItem;
    ManutPrev: TMenuItem;
    MPNumParadas: TMenuItem;
    MPHorasParadas: TMenuItem;
    MPPercParadas: TMenuItem;
    ManutCorret: TMenuItem;
    MCNumParadas: TMenuItem;
    MCHorasParadas: TMenuItem;
    MCPercParadas: TMenuItem;
    ManutPred: TMenuItem;
    MDNumParadas: TMenuItem;
    MDHorasParadas: TMenuItem;
    MDPercParadas: TMenuItem;
    OutrosServicos: TMenuItem;
    OUNumParadas: TMenuItem;
    OUHorasParadas: TMenuItem;
    OUPercParadas: TMenuItem;
    PercHEManut: TMenuItem;
    DispEquip: TMenuItem;
    ProdMObra: TMenuItem;
    CustoManut: TMenuItem;
    CMEquipamento: TMenuItem;
    CMPosicao: TMenuItem;
    CMArea: TMenuItem;
    CMTipoManut: TMenuItem;
    CMPrioridade: TMenuItem;
    CMMaodeObra: TMenuItem;
    CMComPecas: TMenuItem;
    CMComRecursos: TMenuItem;
    CMCustoPrevisto: TMenuItem;
    CMTotalManut: TMenuItem;
    OrdemServico: TMenuItem;
    OSEquipamento: TMenuItem;
    OSPosicao: TMenuItem;
    OSArea: TMenuItem;
    OSMotivosParadas: TMenuItem;
    OSTiposFalhas: TMenuItem;
    OSPrioridadeParadas: TMenuItem;
    OSOficina: TMenuItem;
    OSSolicitante: TMenuItem;
    BtnImprimir: TButton;
    frxDBInfGerenciais: TfrxDBDataset;
    frxRInfGerenciais: TfrxReport;
    DSInfGerenciais: TDataSource;
    CDInfGerenciais: TClientDataSet;
    CDInfGerenciaisPERIODO: TStringField;
    CDInfGerenciaisRELATORIO: TStringField;
    CDInfGerenciaisVALOR: TFloatField;
    CDInfGerenciaisDATA1: TDateField;
    CDInfGerenciaisDATA2: TDateTimeField;
    CDInfGerenciaisIMAGEM: TBlobField;
    procedure MPNumParadasClick(Sender: TObject);
    procedure MPHorasParadasClick(Sender: TObject);
    procedure MPPercParadasClick(Sender: TObject);
    procedure MCNumParadasClick(Sender: TObject);
    procedure MCHorasParadasClick(Sender: TObject);
    procedure MCPercParadasClick(Sender: TObject);
    procedure MDNumParadasClick(Sender: TObject);
    procedure MDHorasParadasClick(Sender: TObject);
    procedure MDPercParadasClick(Sender: TObject);
    procedure OUNumParadasClick(Sender: TObject);
    procedure OUHorasParadasClick(Sender: TObject);
    procedure OUPercParadasClick(Sender: TObject);
    procedure PercHEManutClick(Sender: TObject);
    procedure DispEquipClick(Sender: TObject);
    procedure ProdMObraClick(Sender: TObject);
    procedure CMEquipamentoClick(Sender: TObject);
    procedure CMPosicaoClick(Sender: TObject);
    procedure CMAreaClick(Sender: TObject);
    procedure CMTipoManutClick(Sender: TObject);
    procedure CMPrioridadeClick(Sender: TObject);
    procedure CMMaodeObraClick(Sender: TObject);
    procedure CMComPecasClick(Sender: TObject);
    procedure CMComRecursosClick(Sender: TObject);
    procedure CMCustoPrevistoClick(Sender: TObject);
    procedure CMTotalManutClick(Sender: TObject);
    procedure OSEquipamentoClick(Sender: TObject);
    procedure OSPosicaoClick(Sender: TObject);
    procedure OSAreaClick(Sender: TObject);
    procedure OSMotivosParadasClick(Sender: TObject);
    procedure OSTiposFalhasClick(Sender: TObject);
    procedure OSPrioridadeParadasClick(Sender: TObject);
    procedure OSOficinaClick(Sender: TObject);
    procedure OSSolicitanteClick(Sender: TObject);
    procedure CBPeriodoChange(Sender: TObject);

    function PrioridadeInputBox(const ACaption, APrompt:string): string;
    function CalcularRelatorio(Relatorio: String): Real;
    procedure NovoPeriodoOutrasConsultas;
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    LCodItem, LValorItem, LRelatorio: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaInfGerenciais: TFrmTelaInfGerenciais;

implementation

{$R *.dfm}

uses UnDM, UnDmRelatorios;

procedure TFrmTelaInfGerenciais.CBPeriodoChange(Sender: TObject);
var
I, P, M : SmallInt;
LDataGrid : String;
begin
  inherited;
PAuxiliares.Caption := EmptyStr;

if LRelatorio = EmptyStr Then Exit;

DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

Chart1.Series[0].Clear;

//Chart1.Legend.Visible := False;

Chart1.Title.Text.Clear;
if LCodItem = EmptyStr then
  Chart1.Title.Caption := LRelatorio
else
  Chart1.Title.Caption := LRelatorio + ': '+LValorItem;


Chart1.LeftAxis.Minimum := 0;

P := 0;
M := 0;
ProgressBar1.Visible := True;
case CBPeriodo.ItemIndex of
  0:
    begin
      ProgressBar1.Max := 1;
      DM.FDataConsulta1 := DateOf(DM.FDataHoraServidor);
      DM.FDataConsulta2 := DM.FDataHoraServidor;
      P := 1;
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', DM.FDataConsulta2);
    end;
  1:
    begin
      ProgressBar1.Max := 7;
      DM.FDataConsulta1 := DateOf(IncDay(DM.FDataHoraServidor, -6));
      DM.FDataConsulta2 := IncMinute(DM.FDataConsulta1, 1439);
      P := 7;
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataConsulta2, 6));
    end;
  2:
    begin
      ProgressBar1.Max := 15;
      DM.FDataConsulta1 := DateOf(IncDay(DM.FDataHoraServidor, -14));
      DM.FDataConsulta2 := IncMinute(DM.FDataConsulta1, 1439);
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataConsulta2, 14));
      P := 15;
    end;
  3:
    begin
      ProgressBar1.Max := 30;
      DM.FDataConsulta1 := DateOf(IncDay(DateOf(DM.FDataHoraServidor), -30));
      DM.FDataConsulta2 := IncMinute(DM.FDataConsulta1, 1439);
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataConsulta1, 30));
      P := 29;
    end;
  4:
    begin
      ProgressBar1.Max := 2;
      DM.FDataConsulta1 := IncMonth(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1), -2);
      DM.FDataConsulta2 := IncMinute(EncodeDate(YearOf(DM.FDataConsulta1), MonthOf(DM.FDataConsulta1), DaysInMonth(DM.FDataConsulta1)), 1439);
      P := 2;
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', EncodeDate(YearOf(IncMonth(DM.FDataConsulta1, 1)), MonthOf(IncMonth(DM.FDataConsulta1, 1)), DaysInMonth(IncMonth(DM.FDataConsulta1, 1))));
    end;
  5:
    begin
      ProgressBar1.Max := 3;
      DM.FDataConsulta1 := IncMonth(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1), -3);
      DM.FDataConsulta2 := IncMinute(EncodeDate(YearOf(DM.FDataConsulta1), MonthOf(DM.FDataConsulta1), DaysInMonth(DM.FDataConsulta1)), 1439);
      P := 3;
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', EncodeDate(YearOf(IncMonth(DM.FDataConsulta1, 2)), MonthOf(IncMonth(DM.FDataConsulta1, 2)), DaysInMonth(IncMonth(DM.FDataConsulta1, 2))));
    end;
  6:
    begin
      ProgressBar1.Max := 6;
      DM.FDataConsulta1 := IncMonth(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1), -6);
      DM.FDataConsulta2 := IncMinute(EncodeDate(YearOf(DM.FDataConsulta1), MonthOf(DM.FDataConsulta1), DaysInMonth(DM.FDataConsulta1)), 1439);
      P := 6;
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', EncodeDate(YearOf(IncMonth(DM.FDataConsulta1, 5)), MonthOf(IncMonth(DM.FDataConsulta1, 5)), DaysInMonth(IncMonth(DM.FDataConsulta1, 5))));
    end;
  7:
    begin
      ProgressBar1.Max := 9;
      DM.FDataConsulta1 := IncMonth(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1), -9);
      DM.FDataConsulta2 := IncMinute(EncodeDate(YearOf(DM.FDataConsulta1), MonthOf(DM.FDataConsulta1), DaysInMonth(DM.FDataConsulta1)), 1439);
      P := 9;
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', EncodeDate(YearOf(IncMonth(DM.FDataConsulta1, 8)), MonthOf(IncMonth(DM.FDataConsulta1, 8)), DaysInMonth(IncMonth(DM.FDataConsulta1, 8))));
    end;
  8:
    begin
      ProgressBar1.Max := 12;
      DM.FDataConsulta1 := IncYear(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1), -1);
      DM.FDataConsulta2 := IncMinute(EncodeDate(YearOf(DM.FDataConsulta1), MonthOf(DM.FDataConsulta1), DaysInMonth(DM.FDataConsulta1)), 1439);
      P := 12;
      Chart1.Title.Caption := Chart1.Title.Caption + ' de ' + FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1) + ' � '+ FormatDateTime('dd/mm/yyyy', EncodeDate(YearOf(IncMonth(DM.FDataConsulta1, 11)), MonthOf(IncMonth(DM.FDataConsulta1, 11)), DaysInMonth(IncMonth(DM.FDataConsulta1, 11))));
    end;
end;

case CBPeriodo.ItemIndex of
  //�ltimos 1, 7, 15, 30 dias
  0, 1, 2, 3:
    begin
      for I := 1 to P do
        begin
          ProgressBar1.Position := I;

          Chart1.Series[0].Add(CalcularRelatorio(LRelatorio),  FormatFloat('00', DayOf(DM.FDataConsulta1))+'/'+FormatFloat('00', MonthOf(DM.FDataConsulta1)));

          DM.FDataConsulta1 := IncDay(DM.FDataConsulta1, 1);
          DM.FDataConsulta2 := IncDay(DM.FDataConsulta2, 1);
        end;
    end;
  //�ltimos 2,3,6,9,12 meses
  4, 5, 6, 7, 8:
    begin
      LDataGrid := FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor);
      case CBPeriodo.ItemIndex of
        4: M := 2;
        5: M := 3;
        6: M := 6;
        7: M := 9;
        8: M := 12
      end;

     for I := 1 to M do
        begin
          ProgressBar1.Position := I;

          DM.FDataConsulta1 := IncMonth(DM.FDataConsulta1, 1);
          DM.FDataConsulta2 := IncMonth(DM.FDataConsulta2, 1);

          Chart1.Series[0].Add(CalcularRelatorio(LRelatorio), FormatFloat('00', MonthOf(DM.FDataConsulta1))+'/'+FormatDateTime('yy', DM.FDataConsulta1));
        end;
    end;
end;
ProgressBar1.Visible := False;
end;

procedure TFrmTelaInfGerenciais.CMAreaClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o por �rea';
LCodItem := EmptyStr;
LValorItem := EmptyStr;

DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := '�reas';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMComPecasClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o com Pe�as';
LCodItem := EmptyStr;
LValorItem := EmptyStr;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMComRecursosClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o com Recursos';
LCodItem := EmptyStr;
LValorItem := EmptyStr;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMCustoPrevistoClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custo Previsto/Custo Realizado';
LCodItem := EmptyStr;
LValorItem := EmptyStr;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMEquipamentoClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o por Equipamento';
LCodItem := EmptyStr;
LValorItem := EmptyStr;

DM.FTabela_auxiliar := 250;
DM.FNomeConsulta := 'Equipamentos';
DM.FParamAuxiliar[1] := 'DESCRICAO';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMMaodeObraClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o com M�o de Obra';
LCodItem := EmptyStr;
LValorItem := EmptyStr;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMPosicaoClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o por Posi��o';
LCodItem := EmptyStr;
LValorItem := EmptyStr;

DM.FTabela_auxiliar := 76;
DM.FNomeConsulta := 'Posi��es de Equipamentos';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMPrioridadeClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o por Prioridade';
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LCodItem := PrioridadeInputBox( 'SPMPWeb', 'Escolha a prioridade:');

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMTipoManutClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custos da Manuten��o por Tipo de Manuten��o';
LCodItem := EmptyStr;
LValorItem := EmptyStr;

DM.FTabela_auxiliar := 100;
DM.FNomeConsulta := 'Tipos de Manuten��es';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.CMTotalManutClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Custo Total da Manuten��o';
LCodItem := EmptyStr;
LValorItem := EmptyStr;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.DispEquipClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'Disponibilidade dos Equipamentos(%)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
end;

procedure TFrmTelaInfGerenciais.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADRELATORIOS';
end;

procedure TFrmTelaInfGerenciais.MCHorasParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'Horas Paradas (Manuten��o Corretiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MCNumParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'N�mero de Paradas (Manuten��o Corretiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MCPercParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := '% de Horas Paradas (Manuten��o Corretiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MDHorasParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'Horas Paradas (Manuten��o Preditiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MDNumParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'N�mero de Paradas (Manuten��o Preditiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MDPercParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := '% de Horas Paradas (Manuten��o Preditiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MPHorasParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'Horas Paradas (Manuten��o Preventiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MPNumParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'N�mero de Paradas (Manuten��o Preventiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.MPPercParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := '% de Horas Paradas (Manuten��o Preventiva)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSAreaClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por �rea';
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := '�reas';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSEquipamentoClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por Equipamento';
LCodItem := EmptyStr;
LValorItem := EmptyStr;

DM.FTabela_auxiliar := 250;
DM.FNomeConsulta := 'Equipamentos';
DM.FParamAuxiliar[1] := 'DESCRICAO';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSMotivosParadasClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por Motivos de Paradas';
DM.FTabela_auxiliar := 110;
DM.FNomeConsulta := 'Motivos de Paradas';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSOficinaClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por Oficina';
DM.FTabela_auxiliar := 200;
DM.FNomeConsulta := 'Oficinas';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSPosicaoClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por Posi��o';
DM.FTabela_auxiliar := 76;
DM.FNomeConsulta := 'Posi��es de Equipamentos';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSPrioridadeParadasClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por Prioridade de Parada';
LCodItem := PrioridadeInputBox( 'SPMPWeb', 'Escolha a prioridade:');

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSSolicitanteClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por Solicitante';
DM.FTabela_auxiliar := 300;
DM.FParamAuxiliar[1] := 'NOME';
DM.FNomeConsulta := 'Funcion�rios';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OSTiposFalhasClick(Sender: TObject);
begin
  inherited;
LRelatorio := 'Ordens de Servi�o por Tipos de Falhas';
DM.FTabela_auxiliar := 900;
DM.FNomeConsulta := 'Tipos de Falhas';
if DM.ConsultarCombo <> EmptyStr then
  begin
    LCodItem   := DM.FCodCombo;
    LValorItem := DM.FValorCombo;
  end;

if LCodItem = EmptyStr then Exit;
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OUHorasParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'Horas Paradas (Outros Servi�os)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OUNumParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'N�mero de Paradas (Outros Servi�os)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.OUPercParadasClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := '% de Horas Paradas (Outros Servi�os)';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.PercHEManutClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := '% de Horas Extras da Manuten��o';
CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInfGerenciais.ProdMObraClick(Sender: TObject);
begin
  inherited;
LCodItem := EmptyStr;
LValorItem := EmptyStr;
LRelatorio := 'Produtividade da M�o de Obra';
CBPeriodo.OnChange(Sender);
end;

function TFrmTelaInfGerenciais.PrioridadeInputBox(const ACaption, APrompt:string): string;
var
Form: TForm; Prompt: TLabel; ComboBox: TComboBox; DialogUnits: TPoint;
I, ButtonTop, ButtonWidth, ButtonHeight: Integer;
Value: string; Buffer: array[0..51] of Char;
begin
  Result := EmptyStr;
  Form := TForm.Create(Application);
  with Form do
    Try
      Canvas.Font := Font;
      For I := 0 to 25 do Buffer[I] := Chr(I + Ord('A')); For I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
      DialogUnits.X := DialogUnits.X div 52; BorderStyle := bsDialog; Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4); ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter; Prompt := TLabel.Create(Form);
      with Prompt do
        begin
         Parent := Form; AutoSize := True; Left := MulDiv(8, DialogUnits.X, 4); Top := MulDiv(8, DialogUnits.Y, 8); Caption := APrompt;
        end;
      ComboBox := TComboBox.Create(Form);
      with ComboBox do
        begin
         Parent := Form; Left := Prompt.Left; Top := MulDiv(19, DialogUnits.Y, 8); Width := MulDiv(164, DialogUnits.X, 4);
         ComboBox.Style := csDropDownList;
         ComboBox.Items.Add('Emerg�ncia');   ComboBox.Items.Add('At� 12 hs'); ComboBox.Items.Add('At� 72 hs');
         ComboBox.Items.Add('At� 1 Semana'); ComboBox.Items.Add('At� 1 M�s'); ComboBox.Items.Add('Acima de um m�s');
         //SelectAll;
        end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8); ButtonWidth := MulDiv(50, DialogUnits.X, 4); ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do begin
         Parent := Form;
         Caption := 'OK';
         ModalResult := mrOk;
         Default := True;
         SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      with TButton.Create(Form) do
        begin
         Parent := Form;
         Caption := 'Cancel';
         ModalResult := mrCancel;
         Cancel := True;
         SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      if ShowModal = mrOk then
        begin
         if ComboBox.Text <> Null then
           begin
            Value := ComboBox.Text;
            Result := Value;
           end;
        end;
    Finally
      FreeAndNil(Form);
    End;
end;

procedure TFrmTelaInfGerenciais.BtnImprimirClick(Sender: TObject);
var
 bmp: TBitmap;
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.FDataConsulta1 <= 0 then Exit;

DeleteFile('C:\SPMP3\Temp.bmp');
Chart1.SaveToBitmapFile('C:\SPMP3\Temp.bmp');
bmp := TBitmap.Create;
bmp.LoadFromFile('C:\SPMP3\Temp.bmp');
CDInfGerenciais.Close; CDInfGerenciais.CreateDataSet; CDInfGerenciais.Append;
CDInfGerenciaisDATA1.AsDateTime   := DM.FDataConsulta1;
CDInfGerenciaisDATA2.AsDateTime   := DM.FDataConsulta2;
CDInfGerenciaisRELATORIO.AsString := LRelatorio;
CDInfGerenciaisIMAGEM.Assign(bmp);
CDInfGerenciais.Post;
bmp.free;
//DeleteFile('C:\SPMP3\Temp.bmp');
frxRInfGerenciais.ShowReport();
end;

function TFrmTelaInfGerenciais.CalcularRelatorio(Relatorio: String): Real;
var
LTotal, LCustoTotalPrev, LCustoTotalExec, LTotalHorasTrab, LTotalHorasParadas: Real;
begin
Result := 0;
LTotal := 0;
LCustoTotalPrev := 0;
LCustoTotalExec := 0;

  if (Relatorio = 'N�mero de Paradas (Manuten��o Preventiva)') or (Relatorio = 'N�mero de Paradas (Manuten��o Corretiva)')
    or (Relatorio = 'N�mero de Paradas (Manuten��o Preditiva)') or (Relatorio = 'N�mero de Paradas (Outros Servi�os)') or (Relatorio = 'N�mero de Paradas') then
      begin
        DM.qryRelatGerencNumParadas.Close;
        DM.qryRelatGerencNumParadas.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        DM.qryRelatGerencNumParadas.Params.ParamByName('data1').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta1) + ' 00:00:00';
        DM.qryRelatGerencNumParadas.Params.ParamByName('data2').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta2) + ' 23:59:59';
        DM.qryRelatGerencNumParadas.Open;
        DM.qryRelatGerencNumParadas.Filtered := False;
        if (Relatorio = 'N�mero de Paradas (Manuten��o Preventiva)') then
          DM.qryRelatGerencNumParadas.Filter := 'TIPOMANUTENCAO = ''Manuten��o Preventiva''';
        if (Relatorio = 'N�mero de Paradas (Manuten��o Corretiva)') then
          DM.qryRelatGerencNumParadas.Filter := 'TIPOMANUTENCAO = ''Manuten��o Corretiva''';
        if (Relatorio = 'N�mero de Paradas (Manuten��o Preditiva)') then
          DM.qryRelatGerencNumParadas.Filter := 'TIPOMANUTENCAO = ''Manuten��o Preditiva''';
        if (Relatorio = 'N�mero de Paradas (Outros Servi�os)') then
          DM.qryRelatGerencNumParadas.Filter := 'TIPOMANUTENCAO = ''Outros Servi�os''';
        DM.qryRelatGerencNumParadas.Filtered := True;
        Result := DM.qryRelatGerencNumParadasTOTALOS.AsFloat
      end
  else
  if (Relatorio = 'Horas Paradas (Manuten��o Preventiva)') or (Relatorio = 'Horas Paradas (Manuten��o Corretiva)')
    or (Relatorio = 'Horas Paradas (Manuten��o Preditiva)') or (Relatorio = 'Horas Paradas (Outros Servi�os)') then
      begin
        //Se for dia consultado for hoje, ent�o dataconsulta ser� a data do servidor
        //Sen�o ser� a data consultada + '23:59'
        if DateOf(DM.FDataConsulta2) = DateOf(DM.FDataHoraServidor) then
          DM.FDataConsulta2 := DM.FDataHoraServidor;

        DM.qryRelatGerencHorasParadas.Close;
        DM.qryRelatGerencHorasParadas.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        DM.qryRelatGerencHorasParadas.Params.ParamByName('data1').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta1);
        DM.qryRelatGerencHorasParadas.Params.ParamByName('data2').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta2) + ' 23:59:59';
        DM.qryRelatGerencHorasParadas.Open;
        DM.qryRelatGerencHorasParadas.Filtered := False;
        if (Relatorio = 'Horas Paradas (Manuten��o Preventiva)') then
          DM.qryRelatGerencHorasParadas.Filter := 'TIPOMANUTENCAO = ''Manuten��o Preventiva''';
        if (Relatorio = 'Horas Paradas (Manuten��o Corretiva)') then
          DM.qryRelatGerencHorasParadas.Filter := 'TIPOMANUTENCAO = ''Manuten��o Corretiva''';
        if (Relatorio = 'Horas Paradas (Manuten��o Preditiva)') then
          DM.qryRelatGerencHorasParadas.Filter := 'TIPOMANUTENCAO = ''Manuten��o Preditiva''';
        if (Relatorio = 'Horas Paradas (Outros Servi�os)') then
          DM.qryRelatGerencHorasParadas.Filter := 'TIPOMANUTENCAO = ''Outros Servi�os''';
        DM.qryRelatGerencHorasParadas.Filtered := True;
        while not DM.qryRelatGerencHorasParadas.Eof = True do
          begin
            //Se j� terminou
            if (DM.qryRelatGerencHorasParadasHORASPARADAS.IsNull = False) and (DM.qryRelatGerencHorasParadasDATAINICIOREAL.AsDateTime >= DM.FDataConsulta1) then
                LTotal := LTotal + DM.qryRelatGerencHorasParadasHORASPARADAS.AsFloat;
            //Se n�o terminou
            if (DM.qryRelatGerencHorasParadasHORASPARADAS.IsNull = True) then
              begin
                //Se iniciou antes da data inicial da consulta
                if DM.qryRelatGerencHorasParadasDATAINICIOREAL.AsDateTime < DateOf(DM.FDataConsulta1) then
                  LTotal := LTotal + MinutesBetween(DM.FDataConsulta1, DM.FDataConsulta2)/60
                else
                  LTotal := LTotal + MinutesBetween(DM.qryRelatGerencHorasParadasDATAINICIOREAL.AsDateTime, DM.FDataConsulta2)/60;
              end;

            DM.qryRelatGerencHorasParadas.Next;
          end;
        Result := RoundTo(LTotal, -2);
      end
  else
  if (LRelatorio = '% de Horas Paradas (Manuten��o Preventiva)') or (LRelatorio = '% de Horas Paradas (Manuten��o Corretiva)')
    or (LRelatorio = '% de Horas Paradas (Manuten��o Preditiva)') or (LRelatorio = '% de Horas Paradas (Outros Servi�os)') then
      begin
        DM.qryRelatGerencPercParadas.Close;
        DM.qryRelatGerencPercParadas.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        DM.qryRelatGerencPercParadas.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta1) + ' 00:00:00';
        DM.qryRelatGerencPercParadas.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta2) + ' 23:59:59';
        DM.qryRelatGerencPercParadas.Open;
        if (LRelatorio = '% de Horas Paradas (Manuten��o Preventiva)') then
          Result := RoundTo(DM.qryRelatGerencPercParadasPERCENTPREV.AsFloat, -2);
        if (LRelatorio = '% de Horas Paradas (Manuten��o Corretiva)') then
          Result := RoundTo(DM.qryRelatGerencPercParadasPERCENTCORRET.AsFloat, -2);
        if (LRelatorio = '% de Horas Paradas (Manuten��o Preditiva)') then
          Result := RoundTo(DM.qryRelatGerencPercParadasPERCENTPRED.AsFloat, -2);
        if (LRelatorio = '% de Horas Paradas (Outros Servi�os)') then
          Result := RoundTo(DM.qryRelatGerencPercParadasPERCENTOUTROS.AsFloat, -2);
      end
  else
  if LRelatorio = '% de Horas Extras da Manuten��o' then
    begin
      LTotalHorasTrab := RoundTo(DM.HorasCalendario(0, EmptyStr, EmptyStr), -2);
      DM.qryRelatGerencHE.Close;
      DM.qryRelatGerencHE.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
      DM.qryRelatGerencHE.Params.ParamByName('data1').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta1) + ' 00:00:00';
      DM.qryRelatGerencHE.Params.ParamByName('data2').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta2) + ' 23:59:59';
      DM.qryRelatGerencHE.Open;
      if (LTotalHorasTrab <= 0) and (DM.qryRelatGerencHETOTALHE.AsFloat > 0) then Result := 100
      else
      if (LTotalHorasTrab <= 0) and (DM.qryRelatGerencHETOTALHE.AsFloat <= 0) then Result := 0
      else
      Result := RoundTo(100 * (DM.qryRelatGerencHETOTALHE.AsFloat/LTotalHorasTrab),-2);
    end;
  //---------------------------------------------------------------------------------------------------------------------
   if LRelatorio = 'Disponibilidade dos Equipamentos(%)' then
     begin
       LTotalHorasParadas := DM.HorasParadasEquipamento(EmptyStr, EmptyStr, EmptyStr, EmptyStr);
       LTotalHorasTrab    := DM.HorasCalendario(1, EmptyStr, EmptyStr);
      if (LTotalHorasTrab <= 0) and (LTotalHorasParadas > 0) then Result := 100
      else
      if (LTotalHorasTrab <= 0) and (LTotalHorasParadas <= 0) then Result := 0
      else
      Result := RoundTo((100 * (LTotalHorasTrab - LTotalHorasParadas)/LTotalHorasTrab), -2);
     end;
   //---------------------------------------------------------------------------------------------------------------------
   if LRelatorio = 'Produtividade da M�o de Obra' then
     begin
       DM.qryRelatGerencProdMObra.Close;
       DM.qryRelatGerencProdMObra.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
       DM.qryRelatGerencProdMObra.Params.ParamByName('data1').AsString    := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
       DM.qryRelatGerencProdMObra.Params.ParamByName('data2').AsString    := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
       DM.qryRelatGerencProdMObra.Open;
       Result := Round(DM.qryRelatGerencProdMObraPROD.AsFloat);
     end;

//CUSTOS
  if (LRelatorio = 'Custos da Manuten��o por Equipamento') or (LRelatorio = 'Custos da Manuten��o por Posi��o')
    or (LRelatorio = 'Custos da Manuten��o por Linha') or (LRelatorio = 'Custos da Manuten��o por C�lula')
      or (LRelatorio = 'Custos da Manuten��o por �rea') or (LRelatorio = 'Custos da Manuten��o por Tipo de Manuten��o')
        or (LRelatorio = 'Custos da Manuten��o por Prioridade') or (LRelatorio = 'Custos da Manuten��o por Oficina')
          or (LRelatorio = 'Custos da Manuten��o por Centro de Custo') or (LRelatorio = 'Custos da Manuten��o com M�o de Obra')
            or (LRelatorio = 'Custos da Manuten��o com Pe�as') or (LRelatorio = 'Custos da Manuten��o com Recursos')
              or (LRelatorio = 'Custo Total da Manuten��o') then
                begin
                  DM.qryRelatGerencCustos.Close;
                  DM.qryRelatGerencCustos.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
                  DM.qryRelatGerencCustos.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
                  DM.qryRelatGerencCustos.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
                  DM.qryRelatGerencCustos.Open;
                  DM.qryRelatGerencCustos.Filtered := False;
                  if (LRelatorio = 'Custos da Manuten��o por Equipamento') then
                    begin
                      DM.qryRelatGerencCustos.Filter   := 'CODEQUIPAMENTO = '+ QuotedStr(LCodItem);
                      DM.qryRelatGerencCustos.Filtered := True;
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  //if (LRelatorio = 'Custos da Manuten��o por Posi��o') then
                    //begin
                      //DM.qryRelatGerencCustos.Filter   := 'CODPOSICAO = '+ QuotedStr(LCodItem);
                      //DM.qryRelatGerencCustos.Filtered := True;
                      //while not DM.qryRelatGerencCustos.Eof = True do
                       // begin
                       //   Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                       //   DM.qryRelatGerencCustos.Next;
                       // end;
                    //end;
                  if (LRelatorio = 'Custos da Manuten��o por �rea') then
                    begin
                      DM.qryRelatGerencCustos.Filter   := 'CODAREA = '+ QuotedStr(LCodItem);
                      DM.qryRelatGerencCustos.Filtered := True;
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custos da Manuten��o por Tipo de Manuten��o') then
                    begin
                      DM.qryRelatGerencCustos.Filter   := 'CODMANUTENCAO = '+ QuotedStr(LCodItem);
                      DM.qryRelatGerencCustos.Filtered := True;
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custos da Manuten��o por Prioridade') then
                    begin
                      DM.qryRelatGerencCustos.Filter   := 'PRIORIDADEPARADA = '+ QuotedStr(LCodItem);
                      DM.qryRelatGerencCustos.Filtered := True;
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custos da Manuten��o por Oficina') then
                    begin
                      DM.qryRelatGerencCustos.Filter   := 'CODOFICINA = '+ QuotedStr(LCodItem);
                      DM.qryRelatGerencCustos.Filtered := True;
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custos da Manuten��o por Centro de Custo') then
                    begin
                      DM.qryRelatGerencCustos.Filter   := 'CODCENTROCUSTO = '+ QuotedStr(LCodItem);
                      DM.qryRelatGerencCustos.Filtered := True;
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custos da Manuten��o com M�o de Obra') then
                    begin
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custos da Manuten��o com Pe�as') then
                    begin
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custos da Manuten��o com Recursos') then
                    begin
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                  if (LRelatorio = 'Custo Total da Manuten��o') then
                    begin
                      while not DM.qryRelatGerencCustos.Eof = True do
                        begin
                          Result := Result + DM.qryRelatGerencCustosCUSTOMOBRA.AsFloat + DM.qryRelatGerencCustosCUSTORECURSOS.AsFloat + DM.qryRelatGerencCustosCUSTOPECAS.AsFloat + DM.qryRelatGerencCustosCUSTOEXTRA.AsFloat;
                          DM.qryRelatGerencCustos.Next;
                        end;
                    end;
                end;

   //---------------------------------------------------------------------------------------------------------------------
  if LRelatorio = 'Custo Previsto/Custo Realizado' then
    begin
      DM.qryRelatGerencCustoPrev.Close;
      DM.qryRelatGerencCustoPrev.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
      DM.qryRelatGerencCustoPrev.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
      DM.qryRelatGerencCustoPrev.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
      DM.qryRelatGerencCustoPrev.Open;
      while not DM.qryRelatGerencCustoPrev.Eof = True do
        begin
          LCustoTotalPrev := LCustoTotalPrev + DM.qryRelatGerencCustoPrevCUSTOTOTALEXEC.AsFloat;
          LCustoTotalExec := LCustoTotalExec + DM.qryRelatGerencCustoPrevMOBRAPREV.AsFloat + DM.qryRelatGerencCustoPrevPECASPREV.AsFloat + DM.qryRelatGerencCustoPrevRECUPREV.AsFloat;
          DM.qryRelatGerencCustoPrev.Next;
        end;
      if LCustoTotalExec < 1 then LCustoTotalExec := 1;

      Result := 100 * (LCustoTotalPrev/LCustoTotalExec);
    end;
   //---------------------------------------------------------------------------------------------------------------------

//ORDENS DE SERVI�OS
    if (Relatorio = 'Ordens de Servi�o por Equipamento') or (Relatorio = 'Ordens de Servi�o por Posi��o')
      or (Relatorio = 'Ordens de Servi�o por Linha') or (Relatorio = 'Ordens de Servi�o por C�lula')
        or (Relatorio = 'Ordens de Servi�o por �rea') or (Relatorio = 'Ordens de Servi�o por Motivos de Paradas')
          or (Relatorio = 'Ordens de Servi�o por Tipos de Falhas') or (Relatorio = 'Ordens de Servi�o por Prioridade de Parada')
            or (Relatorio = 'Ordens de Servi�o por Oficina') or (Relatorio = 'Ordens de Servi�o por Solicitante')
              or (Relatorio = 'Ordens de Servi�o Cadastradas') or (Relatorio = 'Ordens de Servi�o Programadas')
                or (Relatorio = 'Ordens de Servi�o Executadas') or (Relatorio = 'Ordens de Servi�o Reprogramadas')
                 or (Relatorio = 'Ordens de Servi�o Canceladas') then
                   begin
                     DM.qryRelatGerencOS.Close;
                     DM.qryRelatGerencOS.Params.ParamByName('CODEMPRESA').AsString := DM.FCodEmpresa;
                     DM.qryRelatGerencOS.Params.ParamByName('DATA1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
                     DM.qryRelatGerencOS.Params.ParamByName('DATA2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
                     DM.qryRelatGerencOS.Open;
                     DM.qryRelatGerencOS.Filtered := False;

                     if (Relatorio = 'Ordens de Servi�o por Equipamento') then
                       DM.qryRelatGerencOS.Filter := 'CODEQUIPAMENTO = '+ QuotedStr(LCodItem);
                     //if (Relatorio = 'Ordens de Servi�o por Posi��o') then
                       //DM.qryRelatGerencOS.Filter := 'CODPOSICAO = '+ QuotedStr(LCodItem);
                     if (Relatorio = 'Ordens de Servi�o por �rea') then
                       DM.qryRelatGerencOS.Filter := 'AREA = '+ QuotedStr(LValorItem);
                     if (Relatorio = 'Ordens de Servi�o por Motivos de Paradas') then
                       DM.qryRelatGerencOS.Filter := 'MOTIVOPARADA = '+ QuotedStr(LValorItem);
                     if (Relatorio = 'Ordens de Servi�o por Tipos de Falhas') then
                       DM.qryRelatGerencOS.Filter := 'CAUSAFALHA = '+ QuotedStr(LValorItem);
                     if (Relatorio = 'Ordens de Servi�o por Prioridade de Parada') then
                       DM.qryRelatGerencOS.Filter := 'PRIORIDADEPARADA = '+ QuotedStr(LValorItem);
                     if (Relatorio = 'Ordens de Servi�o por Oficina') then
                       DM.qryRelatGerencOS.Filter := 'OFICINA = '+ QuotedStr(LValorItem);
                     if (Relatorio = 'Ordens de Servi�o por Solicitante') then
                       DM.qryRelatGerencOS.Filter := 'MATRICULA = '+ QuotedStr(LCodItem);
                     DM.qryRelatGerencOS.Filtered := True;

                     Result := DM.qryRelatGerencOS.RecordCount;
                   end;
end;

procedure TFrmTelaInfGerenciais.NovoPeriodoOutrasConsultas;
begin
LCodItem := EmptyStr;
LValorItem := EmptyStr;

Chart1.Series[0].Clear;
Chart1.Title.Text.Clear;

  case CBPeriodo.ItemIndex of
    0:
      begin
        DM.FDataConsulta1 := DateOf(DM.FDataHoraServidor);
        DM.FDataConsulta2 := DM.FDataHoraServidor;
      end;
    1:
      begin
        DM.FDataConsulta1 := DateOf(IncWeek(DM.FDataHoraServidor, -1));
        DM.FDataConsulta2 := DM.FDataHoraServidor;
      end;
    2:
      begin
        DM.FDataConsulta1 := IncWeek(DM.FDataHoraServidor, -2);
        DM.FDataConsulta2 := DM.FDataHoraServidor;
      end;
    3:
      begin
        DM.FDataConsulta1 := IncMonth(DateOf(DM.FDataHoraServidor), -1);
        DM.FDataConsulta2 := DM.FDataHoraServidor;
      end;
    4:
      begin
        DM.FDataConsulta1 := IncMonth(DateOf(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1)), -2);
        DM.FDataConsulta2 := IncMonth(DM.FDataConsulta1, 2);
      end;
    5:
      begin
        DM.FDataConsulta1 := IncMonth(DateOf(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1)), -3);
        DM.FDataConsulta2 := IncMonth(DM.FDataConsulta1, 3);
      end;
    6:
      begin
        DM.FDataConsulta1 := IncMonth(DateOf(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1)), -6);
        DM.FDataConsulta2 := IncMonth(DM.FDataConsulta1, 6);
      end;
    7:
      begin
        DM.FDataConsulta1 := IncMonth(DateOf(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1)), -9);
        DM.FDataConsulta2 := IncMonth(DM.FDataConsulta1, 9);
      end;
    8:
      begin
        DM.FDataConsulta1 := IncYear(DateOf(EncodeDate(YearOf(DM.FDataHoraServidor), MonthOf(DM.FDataHoraServidor), 1)), -1);
        DM.FDataConsulta2 := IncYear(DM.FDataConsulta1, 1);
      end;
  end;
end;

end.

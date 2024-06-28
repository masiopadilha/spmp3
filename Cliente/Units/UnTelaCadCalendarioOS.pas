unit UnTelaCadCalendarioOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, Vcl.DBGrids, System.DateUtils, FireDAC.Stan.Param, Data.DB,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFrmTelaCadCalendarioOS = class(TFrmTelaPaiOkCancel)
    LblDataConsulta: TLabel;
    GBTotalHomemHora: TGroupBox;
    CalendarGrid: TStringGrid;
    PPeriodo: TPanel;
    BtnAntMes: TButton;
    BtnProxMes: TButton;
    CBConsSimples: TComboBox;
    Label1: TLabel;
    BtnImprimir: TButton;
    Chart1: TChart;
    BarSeries1: TBarSeries;
    Series1: TBarSeries;
    procedure DesenharCalendario;
    procedure FormCreate(Sender: TObject);
    procedure CalendarGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

    function MontarGrafico(Data: TDateTime; Chart: TChart): Boolean;
    procedure CalendarGridDblClick(Sender: TObject);
    procedure CalendarGridClick(Sender: TObject);
    procedure BtnAntMesClick(Sender: TObject);
    procedure BtnProxMesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBConsSimplesChange(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  //  procedure ConsultarHorasDia(Data:TDateTime);
  private
    LPrimeiroDataMes, LUltimaDataMes, LDataConsulta: TDateTime;
    DatFer : array[0..50] of String;
    HntFer : array[0..50] of String;
    LProgramadas: array[1..31] of Real;
    LExecucao: array[1..31] of Real;
    LTotalHH, LNovoTotalHH: Real;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadCalendarioOS: TFrmTelaCadCalendarioOS;

implementation

{$R *.dfm}

uses UnTelaCadCalendarioOSServicos, UnDM, UnDmRelatorios;

procedure TFrmTelaCadCalendarioOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryCalendarioOSProgramadas.Close;
DM.qryCalendarioOSProgramadasMObra.Close;
DM.qryCalendarioOSExecucao.Close;
DM.qryCalendarioOSExecucaoMObra.Close;
//DM.qryTotalHomemHora.Close;
//DM.qryTotalHomemHoraSeqHora.Close;
end;

procedure TFrmTelaCadCalendarioOS.FormCreate(Sender: TObject);
var
  I : SmallInt;
  ShortDayNames: array[1..7] of string;
begin
  inherited;
  DM.qryDataHoraServidor.Refresh;
  DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

  DM.qryTotalHomemHora.Close;
  DM.qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
  DM.qryTotalHomemHora.Open;
  DM.qryTotalHomemHoraSeqHora.Open;

  //Feriados
  DM.FTela := 'CADCALENDARIOOS';
  DM.qryAuxiliar.Close;
  DM.qryAuxiliar.SQL.Clear;
  DM.qryAuxiliar.SQL.Add('select dataferiado, descricao from feriados where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
  DM.qryAuxiliar.Open;
  DM.qryAuxiliar.First;
  For I := 0 to DM.qryAuxiliar.RecordCount do
   begin
     DatFer[I] := DM.qryAuxiliar.FieldByName('DATAFERIADO').AsString;
     HntFer[I] := DM.qryAuxiliar.FieldByName('DESCRICAO').AsString;
     DM.qryAuxiliar.Next;
   end;
  DM.qryAuxiliar.Close;

  //Monstando o Cabeçalho da Semana ( Seg / Terc / Quart...)
  ShortDayNames[1] := 'dom'; ShortDayNames[2] := 'seg';
  ShortDayNames[3] := 'ter'; ShortDayNames[4] := 'qua';
  ShortDayNames[5] := 'qui'; ShortDayNames[6] := 'sex';
  ShortDayNames[7] := 'sab';
  with CalendarGrid do
    begin
      for i := 1 to 7 do
        begin
          Cells[i - 1, 0] := ShortDayNames[i];
        end;
     end;

  LPrimeiroDataMes := DateOf(StartOfTheMonth(DM.FDataHoraServidor));
  LUltimaDataMes   := DateOf(EndOfTheMonth(LPrimeiroDataMes));

  LTotalHH         := 0;
  LNovoTotalHH     := 0;

  LDataConsulta := LPrimeiroDataMes;

  while LDataConsulta < LUltimaDataMes do
    begin
      LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, EmptyStr);

      if LNovoTotalHH > LTotalHH then
        LTotalHH := LNovoTotalHH;

      LDataConsulta := IncDay(LDataConsulta, 1);
    end;

  DesenharCalendario;

  MontarGrafico(LPrimeiroDataMes, Chart1);

  LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));

  GBTotalHomemHora.Caption := 'Total Homem/Hora Programada e em Execução para ' + UpperCase(FormatDateTime('mmmm/yyyy', DM.FDataHoraServidor));
end;

procedure TFrmTelaCadCalendarioOS.BtnAntMesClick(Sender: TObject);
begin
  inherited;
  LPrimeiroDataMes := DateOf(IncMonth(LPrimeiroDataMes, -1));
  LUltimaDataMes   := DateOf(EndOfTheMonth(LPrimeiroDataMes));

  LTotalHH         := 0;
  LNovoTotalHH     := 0;

  LDataConsulta := LPrimeiroDataMes;

  while LDataConsulta < LUltimaDataMes do
    begin
      case CBConsSimples.ItemIndex of
        0: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, EmptyStr);
        1: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Mecânica');
        2: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Elétrica');
        3: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Civil');
        4: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Apoio Técnico');
        5: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Produtiva');
        6: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Administrativa');
      end;

      if LNovoTotalHH > LTotalHH then
        LTotalHH := LNovoTotalHH;

      LDataConsulta := IncDay(LDataConsulta, 1);
    end;

  DesenharCalendario;

  MontarGrafico(LPrimeiroDataMes, Chart1);

  LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));

  GBTotalHomemHora.Caption := 'Total Homem/Hora Programada e em Execução para ' + UpperCase(FormatDateTime('mmmm/yyyy', LPrimeiroDataMes));
end;

procedure TFrmTelaCadCalendarioOS.BtnImprimirClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

  case CBConsSimples.ItemIndex of
    0:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := '%%';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
    1:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := 'Mecânica';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
    2:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := 'Elétrica';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
    3:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := 'Civil';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
    4:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := 'Apoio Técnico';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
    5:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := 'Produtiva';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
    6:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := 'Administrativa';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
    7:
      begin
        DM.qryProgramadasExecucao.Close;
        DM.qryProgramadasExecucao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryProgramadasExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LPrimeiroDataMes );
        DM.qryProgramadasExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LUltimaDataMes);
        DM.qryProgramadasExecucao.Params[3].AsString := 'Utilidades';
        DM.qryProgramadasExecucao.Open;
        DM.qryProgramadasExecucaoMObra.Open;
      end;
  end;

  DmRelatorios.frxRPrevistoRealizado.ShowReport();
end;

procedure TFrmTelaCadCalendarioOS.BtnProxMesClick(Sender: TObject);
begin
  inherited;
  LPrimeiroDataMes := DateOf(IncMonth(LPrimeiroDataMes, 1));
  LUltimaDataMes   := DateOf(EndOfTheMonth(LPrimeiroDataMes));

  LTotalHH         := 0;
  LNovoTotalHH     := 0;

  LDataConsulta := LPrimeiroDataMes;

  while LDataConsulta < LUltimaDataMes do
    begin
      case CBConsSimples.ItemIndex of
        0: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, EmptyStr);
        1: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Mecânica');
        2: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Elétrica');
        3: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Civil');
        4: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Apoio Técnico');
        5: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Produtiva');
        6: LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, 'Administrativa');
      end;

      if LNovoTotalHH > LTotalHH then
        LTotalHH := LNovoTotalHH;

      LDataConsulta := IncDay(LDataConsulta, 1);
    end;

  DesenharCalendario;

  MontarGrafico(LPrimeiroDataMes, Chart1);

  LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));

  GBTotalHomemHora.Caption := 'Total Homem/Hora Programada e em Execução para ' + UpperCase(FormatDateTime('mmmm/yyyy', LPrimeiroDataMes));
end;

procedure TFrmTelaCadCalendarioOS.CalendarGridClick(Sender: TObject);
begin
  inherited;
DM.qryCalendarioOSProgramadas.Filter   := EmptyStr;
DM.qryCalendarioOSProgramadas.Filtered := False;
DM.qryCalendarioOSExecucao.Filter      := EmptyStr;
DM.qryCalendarioOSExecucao.Filtered    := False;
end;

procedure TFrmTelaCadCalendarioOS.CalendarGridDblClick(Sender: TObject);
var
LData1, LData2 : String;
begin
  inherited;
  LData1 := Copy(CalendarGrid.Cells[CalendarGrid.Col, CalendarGrid.Row], 1, 2)+ '/'+ FormatFloat('00', MonthOf(LPrimeiroDataMes)) + '/' + FormatFloat('0000', YearOf(LPrimeiroDataMes)) +' 00:00';
  LData2 := Copy(CalendarGrid.Cells[CalendarGrid.Col, CalendarGrid.Row], 1, 2)+ '/'+ FormatFloat('00', MonthOf(LPrimeiroDataMes)) + '/' + FormatFloat('0000', YearOf(LPrimeiroDataMes)) +' 23:59';

  DM.qryCalendarioOSProgramadas.Filtered := False;
  DM.qryCalendarioOSProgramadas.Filter   := EmptyStr;
  DM.qryCalendarioOSProgramadas.Filter   := 'DATAPROGINI >= '+QuotedStr(LData1)+' AND DATAPROGINI <= '+QuotedStr(LData2) + EmptyStr;
  DM.qryCalendarioOSProgramadas.Filtered := True;

  DM.qryCalendarioOSExecucao.Filtered := False;
  DM.qryCalendarioOSExecucao.Filter   := EmptyStr;
  DM.qryCalendarioOSExecucao.Filter   := 'DATAINICIOREAL >= '+QuotedStr(LData1)+' AND DATAINICIOREAL <= '+QuotedStr(LData2) + EmptyStr;
  DM.qryCalendarioOSExecucao.Filtered := True;

  Try
    Application.CreateForm(TFrmTelaCadCalendarioOSServicos, FrmTelaCadCalendarioOSServicos);
    FrmTelaCadCalendarioOSServicos.GBProgramadas.Caption := 'Ordens de Serviço Programadas: ' + CalendarGrid.Cells[CalendarGrid.Col, CalendarGrid.Row];
    FrmTelaCadCalendarioOSServicos.GBExecução.Caption    := 'Ordens de Serviço em Execução: ' + CalendarGrid.Cells[CalendarGrid.Col, CalendarGrid.Row];
    FrmTelaCadCalendarioOSServicos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCalendarioOSServicos);
  End;
end;

procedure TFrmTelaCadCalendarioOS.CalendarGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DiaGrid : string;
  AlturaGrid, LarguraGrid, TopGrid, LeftGrid, I : Integer;
  Data : TDateTime;
begin
  with CalendarGrid do
    begin
      //Limpando o Calendário Para Recria-lo
      Canvas.Brush.Color := clWhite;
      Canvas.Pen.Color   := clWhite;
      Canvas.Font.Style  := [];
      Canvas.Font.Size   := 10;
      Canvas.Font.Color  := clBlack;
      Canvas.FillRect(Rect);
      DiaGrid := Cells[aCol, aRow];

      if (ACol = 0) or (ACol = 6) then
        Canvas.Brush.Color := $00D6D6D6;

      //Senão for Cabeçalho dos Dias da Semana
      if aRow > 0 then
        begin
          Data := StrToDate(DiaGrid);
          DiaGrid := IntToStr(DayOf(Data));
          //Checa se os Dias São do Mês Selecionado
          if MonthOf(Data) = MonthOf(LPrimeiroDataMes) then
            begin
              //Pintando a Data Atual
              if Data = DM.FDataHoraServidor then
                begin
                  Canvas.Brush.Color := $00DFFFDF;
                  Canvas.Font.Style  := [fsBold];
                  Canvas.Font.Size   := 10;
                  Canvas.Rectangle(Rect);
                end;

              //Pintando Data Selecionada
              if gdSelected in State then
                begin
                  Canvas.Brush.Color := $00FFC794;
                  Canvas.Font.Color  := clBlack;
                  Canvas.Font.Size   := 10;
                  Canvas.Font.Style  := [fsBold];
                  Canvas.Rectangle(Rect);
                end;

              //Verificar se dia é feriado
              for I := 0 to High(DatFer) do
                if FormatDateTime('dd/mm', Data) = DatFer[I] then
                  begin
                    if gdSelected in State then
                      begin
                        Canvas.Brush.Color :=$000BAED7; //Cor de Fundo
                        Canvas.Font.Color  :=clRed;     //Cor da Fonte
                      end
                    else
                      begin
                        Canvas.Brush.Color :=$006BDEFF; //Cor de Fundo
                        Canvas.Font.Color  :=clRed;     //Cor da Fonte
                      end;
                  end;
            end
          else
            begin
              //Deixando Cinza as Dia Que Não São do Mês Selecionado
              Canvas.Brush.Color := clWhite;
              Canvas.Font.Color  := clGray;
            end;
        end
      //Se for Cabeçalho dos Dias da Semana
      else
        begin
          //Data := 0;
          Canvas.Brush.Color := clTeal;
          Canvas.Font.Color := clWhite;
          Canvas.Font.Style :=[fsBold];
          Canvas.Font.Size   := 14;
        end;

    //Desenhando o Calendario e Colocando os Dias, Altura, Largura e Posição
      AlturaGrid  := Canvas.TextHeight(DiaGrid);
      LarguraGrid := Canvas.TextWidth(DiaGrid);
      LeftGrid    := Rect.Left + (ColWidths[ACol]  - LarguraGrid) div 2;
      TopGrid     := Rect.Top  + (RowHeights[ARow] - AlturaGrid) div 2;

      Canvas.Rectangle(System.Classes.Rect(Rect.Left + 2, Rect.Top + 2, Rect.Right - 2, Rect.Bottom - 2));
      if (CalendarGrid.Canvas.Font.Color <> 16777215) and (CalendarGrid.Canvas.Font.Color <> 8421504) then
        begin
          DiaGrid := DiaGrid + '|' + FormatFloat(',0.00', LProgramadas[StrToInt(DiaGrid)])+'|'+ FormatFloat(',0.00', LExecucao[StrToInt(DiaGrid)]);
          Canvas.TextOut(LeftGrid - 40, TopGrid, DiaGrid)
        end
      else
        Canvas.TextOut(LeftGrid, TopGrid, DiaGrid);
    end;
end;

procedure TFrmTelaCadCalendarioOS.CBConsSimplesChange(Sender: TObject);
begin
  inherited;
  case CBConsSimples.ItemIndex of
    0:
      begin
        DM.qryTotalHomemHora.Filter   := '';
        DM.qryTotalHomemHora.Filtered := False;
      end;
    1:
      begin
        DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr('Mecânica');
        DM.qryTotalHomemHora.Filtered := True;
      end;
    2:
      begin
        DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr('Elétrica');
        DM.qryTotalHomemHora.Filtered := True;
      end;
    3:
      begin
        DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr('Civil');
        DM.qryTotalHomemHora.Filtered := True;
      end;
    4:
      begin
        DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr('Apoio Técnico');
        DM.qryTotalHomemHora.Filtered := True;
      end;
    5:
      begin
        DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr('Produtiva');
        DM.qryTotalHomemHora.Filtered := True;
      end;
    6:
      begin
        DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr('Administrativa');
        DM.qryTotalHomemHora.Filtered := True;
      end;
    7:
      begin
        DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr('Utilidades');
        DM.qryTotalHomemHora.Filtered := True;
      end;
  end;


  LDataConsulta := LPrimeiroDataMes;

  while LDataConsulta < LUltimaDataMes do
    begin
      LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, EmptyStr);

      if LNovoTotalHH > LTotalHH then
        LTotalHH := LNovoTotalHH;

      LDataConsulta := IncDay(LDataConsulta, 1);
    end;

  DesenharCalendario;

  MontarGrafico(LPrimeiroDataMes, Chart1);

  LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));

  GBTotalHomemHora.Caption := 'Total Homem/Hora Programada e em Execução para ' + UpperCase(FormatDateTime('mmmm/yyyy', DM.FDataHoraServidor));
end;

procedure TFrmTelaCadCalendarioOS.DesenharCalendario;
var
  Linha, Coluna: Integer;
  DataPrimeiroMes: TDateTime;
  i : Integer;
  RecCalendar: TGridRect;
begin
  PPeriodo.Caption := FormatDateTime('mmmm "de" yyyy', LPrimeiroDataMes);
  DataPrimeiroMes := LPrimeiroDataMes - 1;
  if DayOfWeek(DataPrimeiroMes) = 1 then DataPrimeiroMes := DataPrimeiroMes + 1;
  while DayOfWeek(DataPrimeiroMes) <> 1 do
    begin
      DataPrimeiroMes := DataPrimeiroMes - 1;
      i := 0;
      with CalendarGrid do
        begin
          for Linha := 1 to Pred(RowCount) do
            begin
              for Coluna := 0 to Pred(ColCount) do
                begin
                  Cells[Coluna, Linha]  := DateToStr(DataPrimeiroMes + i);
                  if DataPrimeiroMes + i = Date then
                    begin
                      RecCalendar.Left    := Coluna;
                      RecCalendar.Right   := Coluna;
                      RecCalendar.Top     := Linha;
                      RecCalendar.Bottom  := Linha;
                      // Seleciona o dia corrente
                      Selection := RecCalendar;
                    end;
                  Inc(i);
                end;
            end;
        end;
    end;
end;

function TFrmTelaCadCalendarioOS.MontarGrafico(Data: TDateTime; Chart: TChart): Boolean;
var
I : SmallInt;
LData : TDateTime;
begin
Result := False;

Chart.Series[0].Clear;
Chart.Series[1].Clear;

DM.FTotalHHDisp := Round(DM.TotalHomemHoraDisp(Data, EmptyStr, EmptyStr));

Chart.LeftAxis.Maximum := DM.FTotalHHDisp;

LData := StrToDateTime('01/' + FormatFloat('00', MonthOf(Data)) + '/' + IntToStr(YearOf(Data)));

For I := 1 to 31 Do
  LProgramadas[I]:= 0;

For I := 1 to 31 Do
  LExecucao[I]:= 0;

DM.qryCalendarioOSProgramadas.Close;
DM.qryCalendarioOSProgramadas.Params[0].AsString := DM.FCodEmpresa;
DM.qryCalendarioOSProgramadas.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LData);
DM.qryCalendarioOSProgramadas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncDay(LData, DaysInMonth(LData)));
DM.qryCalendarioOSProgramadas.Open;

case CBConsSimples.ItemIndex of
  0:
    begin
      DM.qryCalendarioOSProgramadas.Filter   := '';
      DM.qryCalendarioOSProgramadas.Filtered := False;
    end;
  1:
    begin
      DM.qryCalendarioOSProgramadas.Filter   := 'TIPOCELULA = ' + QuotedStr('Mecânica');
      DM.qryCalendarioOSProgramadas.Filtered := True;
    end;
  2:
    begin
      DM.qryCalendarioOSProgramadas.Filter   := 'TIPOCELULA = ' + QuotedStr('Elétrica');
      DM.qryCalendarioOSProgramadas.Filtered := True;
    end;
  3:
    begin
      DM.qryCalendarioOSProgramadas.Filter   := 'TIPOCELULA = ' + QuotedStr('Civil');
      DM.qryCalendarioOSProgramadas.Filtered := True;
    end;
  4:
    begin
      DM.qryCalendarioOSProgramadas.Filter   := 'TIPOCELULA = ' + QuotedStr('Apoio Técnico');
      DM.qryCalendarioOSProgramadas.Filtered := True;
    end;
  5:
    begin
      DM.qryCalendarioOSProgramadas.Filter   := 'TIPOCELULA = ' + QuotedStr('Produtiva');
      DM.qryCalendarioOSProgramadas.Filtered := True;
    end;
  6:
    begin
      DM.qryCalendarioOSProgramadas.Filter   := 'TIPOCELULA = ' + QuotedStr('Administrativa');
      DM.qryCalendarioOSProgramadas.Filtered := True;
    end;
end;

For I := 1 to 31 Do
  LProgramadas[I]:= 0;

For I := 1 to 31 Do
  LExecucao[I]:= 0;

while not DM.qryCalendarioOSProgramadas.Eof = True do
  begin
    LProgramadas[DayOf(DM.qryCalendarioOSProgramadasDATAPROGINI.AsDateTime)] := LProgramadas[DayOf(DM.qryCalendarioOSProgramadasDATAPROGINI.AsDateTime)] + DM.qryCalendarioOSProgramadasTEMPOPREVISTO.AsFloat;
    DM.qryCalendarioOSProgramadas.Next;
  end;

for I := 0 to DaysInMonth(DM.qryCalendarioOSProgramadasDATAPROGINI.AsDateTime) do
  begin
    Chart.Series[0].Add(LProgramadas[I]);
  end;

DM.qryCalendarioOSExecucao.Close;
DM.qryCalendarioOSExecucao.Params[0].AsString := DM.FCodEmpresa;
DM.qryCalendarioOSExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LData);
DM.qryCalendarioOSExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncDay(LData, DaysInMonth(LData)));
DM.qryCalendarioOSExecucao.Open;

case CBConsSimples.ItemIndex of
  0:
    begin
      DM.qryCalendarioOSExecucao.Filter   := '';
      DM.qryCalendarioOSExecucao.Filtered := False;
    end;
  1:
    begin
      DM.qryCalendarioOSExecucao.Filter   := 'TIPOCELULA = ' + QuotedStr('Mecânica');
      DM.qryCalendarioOSExecucao.Filtered := True;
    end;
  2:
    begin
      DM.qryCalendarioOSExecucao.Filter   := 'TIPOCELULA = ' + QuotedStr('Elétrica');
      DM.qryCalendarioOSExecucao.Filtered := True;
    end;
  3:
    begin
      DM.qryCalendarioOSExecucao.Filter   := 'TIPOCELULA = ' + QuotedStr('Civil');
      DM.qryCalendarioOSExecucao.Filtered := True;
    end;
  4:
    begin
      DM.qryCalendarioOSExecucao.Filter   := 'TIPOCELULA = ' + QuotedStr('Apoio Técnico');
      DM.qryCalendarioOSExecucao.Filtered := True;
    end;
  5:
    begin
      DM.qryCalendarioOSExecucao.Filter   := 'TIPOCELULA = ' + QuotedStr('Produtiva');
      DM.qryCalendarioOSExecucao.Filtered := True;
    end;
  6:
    begin
      DM.qryCalendarioOSExecucao.Filter   := 'TIPOCELULA = ' + QuotedStr('Administrativa');
      DM.qryCalendarioOSExecucao.Filtered := True;
    end;
end;


while not DM.qryCalendarioOSExecucao.Eof = True do
  begin
    LExecucao[DayOf(DM.qryCalendarioOSExecucaoDATAINICIOREAL.AsDateTime)] := LExecucao[DayOf(DM.qryCalendarioOSExecucaoDATAINICIOREAL.AsDateTime)] + DM.qryCalendarioOSExecucaoTEMPOPREVISTO.AsFloat;
    DM.qryCalendarioOSExecucao.Next;
  end;

for I := 0 to DaysInMonth(DM.qryCalendarioOSExecucaoDATAINICIOREAL.AsDateTime) do
  begin
    Chart.Series[1].Add(LExecucao[I]);
  end;
end;

end.

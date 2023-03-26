unit UnTelaCadFuncionariosAusencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, System.DateUtils, Data.DB,
  JvExMask, JvToolEdit, JvDBControls, Vcl.Mask, System.Actions, Vcl.ActnList,
  Vcl.ExtActns;

type
  TFrmTelaCadFuncionariosAusencias = class(TFrmTelaPaiParametros)
    PPeriodo: TPanel;
    BtnAntMes: TButton;
    BtnProxMes: TButton;
    LblDataConsulta: TLabel;
    CalendarGrid: TStringGrid;
    Label2: TLabel;
    EdtDescricao: TDBEdit;
    Label1: TLabel;
    EdtInicio: TJvDBDateEdit;
    EdtFim: TJvDBDateEdit;
    Label3: TLabel;
    procedure DesenharCalendario;
    procedure FormCreate(Sender: TObject);
    procedure CalendarGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure CalendarGridClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnAntMesClick(Sender: TObject);
    procedure BtnProxMesClick(Sender: TObject);
  private
    LPrimeiroDiaMes: TDateTime;
    DatFer : array[0..50] of String;
    HntFer : array[0..50] of String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFuncionariosAusencias: TFrmTelaCadFuncionariosAusencias;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadFuncionariosAusencias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryFuncionariosAusencias.Close;
end;

procedure TFrmTelaCadFuncionariosAusencias.FormCreate(Sender: TObject);
var
I : SmallInt;
ShortDayNames: array[1..7] of string;
begin
  inherited;
DM.FDataSetParam    := DM.qryFuncionariosAusencias;
DM.FDataSourceParam := DM.dsFuncionariosAusencias;
DM.FDataSetRelat    := DmRelatorios.frxDBFuncionariosAusencias;
DM.FTela := 'CADFUNCIONARIOS';
DM.FTabela_auxiliar := 60;

//Feriados
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select dataferiado, descricao from feriados where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DM.qryAuxiliar.First;
For I:=0 to DM.qryAuxiliar.RecordCount do
 begin
   DatFer[I] := DM.qryAuxiliar.FieldByName('DATAFERIADO').AsString;
   HntFer[I] := DM.qryAuxiliar.FieldByName('DESCRICAO').AsString;
   DM.qryAuxiliar.Next;
 end;
DM.qryAuxiliar.Close;

//Monstando o Cabeçalho da Semana ( Seg / Terc / Quart...)
ShortDayNames[1] := 'dom'; ShortDayNames[5] := 'seg';
ShortDayNames[2] := 'ter'; ShortDayNames[6] := 'qua';
ShortDayNames[3] := 'qui'; ShortDayNames[7] := 'sex';
ShortDayNames[4] := 'sab';
with CalendarGrid do
  begin
    for i := 1 to 7 do
      begin
        Cells[i - 1, 0] := ShortDayNames[i];
      end;
   end;

//Pega o Primeiro dia do Mes do Date (Pega a Data se estiver 20/01/2009 ai Fica 01/01/2009) entao a variavel PrimeiroDiaMes :=1
LPrimeiroDiaMes := RecodeDay(DM.FDataHoraServidor, 1);
DesenharCalendario;

LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));
end;

procedure TFrmTelaCadFuncionariosAusencias.BtnAntMesClick(Sender: TObject);
begin
  inherited;
LPrimeiroDiaMes := IncMonth(LPrimeiroDiaMes, -1);
DesenharCalendario;
end;

procedure TFrmTelaCadFuncionariosAusencias.BtnConsultarClick(Sender: TObject);
var
I: integer;
begin
//DM.FTabela_auxiliar := 60;
//  inherited;
DM.qryFuncionariosAusencias.Close;
DM.qryFuncionariosAusencias.Open;
DesenharCalendario;
Exit;
with CalendarGrid do
  for I := 0 to RowCount -1 do
    Rows[I].Clear;
end;

procedure TFrmTelaCadFuncionariosAusencias.BtnNovoClick(Sender: TObject);
begin
  inherited;
EdtDescricao.SetFocus;
end;

procedure TFrmTelaCadFuncionariosAusencias.BtnProxMesClick(Sender: TObject);
begin
  inherited;
LPrimeiroDiaMes := IncMonth(LPrimeiroDiaMes, 1);
DesenharCalendario;
end;

procedure TFrmTelaCadFuncionariosAusencias.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFuncionariosAusenciasMOTIVO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O MOTIVO DA AUSÊNCIA!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryFuncionariosAusenciasINICIO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O INÍCIO DA AUSÊNCIA!';
    EdtInicio.SetFocus;
    Exit;
  end;
if DM.qryFuncionariosAusenciasFIM.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O FIM DA AUSÊNCIA!';
    EdtFim.SetFocus;
    Exit;
  end;

  inherited;
  DesenharCalendario;
end;

procedure TFrmTelaCadFuncionariosAusencias.CalendarGridClick(Sender: TObject);
begin
  inherited;
LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));
end;

procedure TFrmTelaCadFuncionariosAusencias.CalendarGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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
      Canvas.Font.Size   := 7;
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
          if MonthOf(Data) = MonthOf(LPrimeiroDiaMes) then
            begin
              //Pintando a Data Atual
              if Data = DM.FDataHoraServidor then
                begin
                  Canvas.Brush.Color := $00DFFFDF;
                  Canvas.Font.Style  := [fsBold];
                  Canvas.Font.Size   := 7;
                  Canvas.Rectangle(Rect);
                end;

              //Pintando Data Selecionada
              if gdSelected in State then begin
                Canvas.Brush.Color := $00FFC794;
                Canvas.Font.Color  := clBlack;
                Canvas.Font.Size   := 7;
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

          //Se a data for ausência
          if (Data >= DM.qryFuncionariosAusenciasINICIO.AsDateTime)
            and (Data <= DM.qryFuncionariosAusenciasFIM.AsDateTime) then
              begin
                Canvas.Brush.Color := clRed;
                Canvas.Font.Color  := clWhite;
                Canvas.Font.Style  := [fsBold];
                Canvas.Font.Size   := 7;
                Canvas.Rectangle(Rect);
              end;
            end;
        end
      //Se for Cabeçalho dos Dias da Semana
      else
        begin
          //Data := 0;
          Canvas.Brush.Color := clTeal;
          Canvas.Font.Color := clWhite;
          Canvas.Font.Style :=[fsBold];
          Canvas.Font.Size   := 7;
        end;

    //Desenhando o Calendario e Colocando os Dias, Altura, Largura e Posição
      AlturaGrid  := Canvas.TextHeight(DiaGrid);
      LarguraGrid := Canvas.TextWidth(DiaGrid);
      LeftGrid    := Rect.Left + (ColWidths[ACol]  - LarguraGrid) div 2;
      TopGrid     := Rect.Top  + (RowHeights[ARow] - AlturaGrid) div 2;

      Canvas.Rectangle(System.Classes.Rect(Rect.Left + 2, Rect.Top + 2, Rect.Right - 2, Rect.Bottom - 2));
      Canvas.TextOut(LeftGrid, TopGrid, DiaGrid);
    end;
end;

procedure TFrmTelaCadFuncionariosAusencias.DesenharCalendario;
var
  Linha, Coluna: Integer;
  DiaPrimeiroMes: TDateTime;
  i : Integer;
  RecCalendar: TGridRect;
begin
  PPeriodo.Caption := FormatDateTime('mmmm "de" yyyy', LPrimeiroDiaMes);
  DiaPrimeiroMes := LPrimeiroDiaMes - 1;
  if DayOfWeek(DiaPrimeiroMes) = 1 then DiaPrimeiroMes := DiaPrimeiroMes + 1;
  while DayOfWeek(DiaPrimeiroMes) <> 1 do
    begin
      DiaPrimeiroMes := DiaPrimeiroMes - 1;
      i := 0;
      with CalendarGrid do
        begin
          for Linha := 1 to Pred(RowCount) do
            begin
              for Coluna := 0 to Pred(ColCount) do
                begin
                  //Cells[Coluna, Linha] := IntToStr(DayOf(DiaPrimeiroMes + i));
                  Cells[Coluna, Linha] := DateToStr(DiaPrimeiroMes + i);
                  if DiaPrimeiroMes + i = Date then
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

end.

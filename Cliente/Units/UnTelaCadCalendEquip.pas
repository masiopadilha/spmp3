unit UnTelaCadCalendEquip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, JvExMask,
  JvToolEdit, JvMaskEdit, JvDBControls, Vcl.Mask, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadCalendEquip = class(TFrmTelaPaiParametros)
    EdtHOficiais: TDBEdit;
    Label1: TLabel;
    LblHorasReais: TDBText;
    CalendarGrid: TStringGrid;
    PPeriodo: TPanel;
    BtnAntMes: TButton;
    BtnProxMes: TButton;
    GBHorario: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtHoraIni1: TJvDBMaskEdit;
    EdtHoraFin1: TJvDBMaskEdit;
    EdtHoraIni2: TJvDBMaskEdit;
    EdtHoraFin2: TJvDBMaskEdit;
    EdtHoraIni3: TJvDBMaskEdit;
    EdtHoraFin3: TJvDBMaskEdit;
    EdtHoraIni4: TJvDBMaskEdit;
    EdtHoraFin4: TJvDBMaskEdit;
    LblDataConsulta: TLabel;
    BtnNovoHorario: TButton;
    BtnSalvarHorario: TButton;
    BtnCancelarHorario: TButton;
    BtnExcluirHorario: TButton;
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    Label3: TLabel;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    procedure BtnAntMesClick(Sender: TObject);
    procedure DesenharCalendario;
    procedure TotalHorasMes;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnCancelarHorarioClick(Sender: TObject);
    procedure BtnExcluirHorarioClick(Sender: TObject);
    procedure BtnNovoHorarioClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnProxMesClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnSalvarHorarioClick(Sender: TObject);
    procedure CalendarGridClick(Sender: TObject);
    procedure CalendarGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadCalendEquip: TFrmTelaCadCalendEquip;
  LDataClicada : String;
  LPrimeiroDiaMes: TDateTime;
  DatFer : array[0..50] of String;
  HntFer : array[0..50] of String;
  Col, Row : Integer;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadCalendEquip.BtnAntMesClick(Sender: TObject);
begin
  inherited;
LPrimeiroDiaMes := IncMonth(LPrimeiroDiaMes, -1);
DesenharCalendario;
TotalHorasMes;
end;

procedure TFrmTelaCadCalendEquip.BtnCancelarClick(Sender: TObject);
begin
DM.qryCalendEquipSeqHora.Cancel;
  inherited;
EdtCodigo.ReadOnly := True;
CalendarGrid.Enabled := True;
if DM.qryCalendEquipCODIGO.IsNull = True then
  begin
    BtnNovoHorario.Enabled := False;
    BtnSalvarHorario.Enabled := False;
    BtnCancelarHorario.Enabled := False;
    BtnExcluirHorario.Enabled := False;
  end;
end;

procedure TFrmTelaCadCalendEquip.BtnCancelarHorarioClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clBlack;
PAuxiliares.Caption := EmptyStr;

if DM.qryCalendEquip.IsEmpty then Exit;
if DM.qryCalendEquipCODIGO.AsString = EmptyStr then Exit;

DM.qryCalendEquipSeqHora.Cancel;
BtnNovoHorario.Enabled := True;
BtnSalvarHorario.Enabled := False;
BtnCancelarHorario.Enabled := False;
BtnExcluirHorario.Enabled := True;
end;

procedure TFrmTelaCadCalendEquip.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if DM.qryCalendEquip.IsEmpty = False then
  begin
    BtnNovoHorario.Enabled := False;
    BtnSalvarHorario.Enabled := True;
    BtnCancelarHorario.Enabled := False;
    BtnExcluirHorario.Enabled := True;

    DM.qryCalendEquipSeqHora.Open;
    DM.qryCalendEquip.Edit;
  end;
end;

procedure TFrmTelaCadCalendEquip.BtnExcluirClick(Sender: TObject);
begin
  inherited;
if DM.qryCalendEquip.IsEmpty = True then
  begin
    BtnNovoHorario.Enabled := False;
    BtnSalvarHorario.Enabled := False;
    BtnCancelarHorario.Enabled := False;
    BtnExcluirHorario.Enabled := False;
  end;

end;

procedure TFrmTelaCadCalendEquip.BtnExcluirHorarioClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clBlack;
PAuxiliares.Caption := EmptyStr;

if DM.qryCalendEquip.IsEmpty then Exit;
if DM.qryCalendEquipCODIGO.AsString = EmptyStr then Exit;

DM.qryCalendEquipSeqHora.Delete;
end;

procedure TFrmTelaCadCalendEquip.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 24;
  inherited;

end;

procedure TFrmTelaCadCalendEquip.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryCalendEquipATIVO.AsString           := 'S';
DM.qryCalendEquipVISIVEL.AsString         := 'S';
DM.qryCalendEquipCODEMPRESA.AsString      := DM.FCodEmpresa;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
BtnNovoHorario.Enabled := True;
BtnSalvarHorario.Enabled := False;
BtnCancelarHorario.Enabled := False;
BtnExcluirHorario.Enabled := True;
end;

procedure TFrmTelaCadCalendEquip.BtnNovoHorarioClick(Sender: TObject);
var
LData : TDateTime;
I, J, LSeqBase : SmallInt;
LSeq : Integer;
begin
  inherited;
PAuxiliares.Font.Color := clBlack;
PAuxiliares.Caption := EmptyStr;

if DM.qryCalendEquip.IsEmpty then Exit;
if DM.qryCalendEquipCODIGO.AsString = EmptyStr then Exit;

if DM.FAlterando = False then
  begin
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'GRAVE O REGISTRO PARA INCLUIR UM HORÁRIO!';
    Exit;
  end;

if DM.qryCalendEquipSeqHora.Active = False then DM.qryCalendEquipSeqHora.Open;

DM.qryCalendEquipSeqHora.Last;

LData := StrToDate('01/'+Copy(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor),4,7));
//LData := StrToDate(Copy(UnFuncoesSPMP.FDataHoraServidor,1,10));

if DM.qryCalendEquipSeqHoraSEQUENCIA.AsString <> '' then
  LSeq := StrToInt(DM.qryCalendEquipSeqHoraSEQUENCIA.AsString)
else
  LSeq := 1;

LSeqBase := LSeq;

//Pega a dia atual e adiciona um dia até chegar no domingo
while DayOfWeek(LData) <> 1 do
  LData := IncDay(LData);

//Se a sequencia for maior que 7, subtrair de 7 até chegar numa sequencia válida (menor ou igual a 7)
if LSeq > 7 then
  begin
    LData := IncDay(LData, LSeq - 1);
    while LSeq > 7 do
      LSeq := LSeq - 7;
  end;

//Verifica a última sequência cadastrada e adiciona um dia a partir do domingo
//até chegar na próxima sequência a ser cadastrada
while DayOfWeek(LData) < LSeq do
  LData := IncDay(LData);

if DM.qryCalendEquipSeqHora.RecordCount > 0 then
  LData := IncDay(LData, 1);

//Localiza a data no grid
for I := 0 to 6 do
  begin
    for J := 1 to 6 do
      begin
        if CalendarGrid.Cells[I,J] = DateTimeToStr(LData) then
          begin
            CalendarGrid.Col := I;
            CalendarGrid.Row := J;
          end;
      end;
  end;


DM.qryCalendEquipSeqHora.Append;
if DM.qryCalendEquipSeqHora.RecordCount = 0 then
  begin
//    DM.qryCalendEquipSeqHoraCODIGO.AsInteger := 1;
    DM.qryCalendEquipSeqHoraSEQUENCIA.AsInteger := 1;
  end
else
  begin
//    DM.qryCalendEquipSeqHoraCODIGO.AsInteger := LSeqBase + 1;
    DM.qryCalendEquipSeqHoraSEQUENCIA.AsInteger := LSeqBase + 1;
  end;
DM.qryCalendEquipSeqHora.Post;

GBHorario.SetFocus;
EdtHoraIni1.SetFocus;

CalendarGrid.Enabled := False;
BtnNovoHorario.Enabled := False;
BtnSalvarHorario.Enabled := True;
BtnCancelarHorario.Enabled := True;
BtnExcluirHorario.Enabled := False;
end;

procedure TFrmTelaCadCalendEquip.BtnProxMesClick(Sender: TObject);
begin
  inherited;
LPrimeiroDiaMes := IncMonth(LPrimeiroDiaMes, 1);
DesenharCalendario;
TotalHorasMes;
end;

procedure TFrmTelaCadCalendEquip.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryCalendEquipCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
    EdtCodigo.SetFocus;
    Exit;
  end;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryCalendEquipDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

if DM.qryCalendEquipSeqHora.Active = True then
  if DM.qryCalendEquipSeqHora.IsEmpty = False then
    begin
      DM.qryCalendEquipSeqHora.Last;
      if DM.qryCalendEquipSeqHoraSEQUENCIA.AsInteger mod 7 <> 0 then
        begin
          BtnNovoHorario.OnClick(Sender);
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME O HORÁRIO PARA O RESTANTE DA SEMANA!';
          Exit;
        end;
    end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;
  inherited;
EdtCodigo.ReadOnly := True;
if DM.qryCalendEquipSeqHora.Active = True then
  begin
    DM.qryCalendEquipSeqHora.Edit;
    DM.qryCalendEquipSeqHora.Post;
  end;
end;

procedure TFrmTelaCadCalendEquip.BtnSalvarHorarioClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clBlack;
PAuxiliares.Caption := EmptyStr;

if DM.qryCalendEquip.IsEmpty then Exit;
if DM.qryCalendEquipCODIGO.AsString = EmptyStr then begin BtnSalvar.SetFocus; Exit; end;

if EdtHoraIni1.Text <> '  :  ' then DM.qryCalendEquipSeqHoraHORAINI1.AsString := EdtHoraIni1.Text;
if EdtHoraIni2.Text <> '  :  ' then DM.qryCalendEquipSeqHoraHORAINI2.AsString := EdtHoraIni2.Text;
if EdtHoraIni3.Text <> '  :  ' then DM.qryCalendEquipSeqHoraHORAINI3.AsString := EdtHoraIni3.Text;
if EdtHoraIni4.Text <> '  :  ' then DM.qryCalendEquipSeqHoraHORAINI4.AsString := EdtHoraIni4.Text;

if EdtHoraIni1.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAINI1.AsString := '00:00:01';
if EdtHoraIni2.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAINI2.AsString := '00:00:01';
if EdtHoraIni3.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAINI3.AsString := '00:00:01';
if EdtHoraIni4.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAINI4.AsString := '00:00:01';

if EdtHoraFin1.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAFIN1.AsString := '23:59:59';
if EdtHoraFin2.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAFIN2.AsString := '23:59:59';
if EdtHoraFin3.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAFIN3.AsString := '23:59:59';
if EdtHoraFin4.Text = '00:00' then DM.qryCalendEquipSeqHoraHORAFIN4.AsString := '23:59:59';

if (EdtHoraIni1.Text <>  '  :  ') and (EdtHoraFin1.Text =  '  :  ') then begin EdtHoraFin1.SetFocus; Exit; end;
if (EdtHoraIni2.Text <>  '  :  ') and (EdtHoraFin2.Text =  '  :  ') then begin EdtHoraFin2.SetFocus; Exit; end;
if (EdtHoraIni3.Text <>  '  :  ') and (EdtHoraFin3.Text =  '  :  ') then begin EdtHoraFin3.SetFocus; Exit; end;
if (EdtHoraIni4.Text <>  '  :  ') and (EdtHoraFin4.Text =  '  :  ') then begin EdtHoraFin4.SetFocus; Exit; end;

DM.qryCalendEquipSeqHora.Edit;
//if DM.FAlterando = False then
//  DM.qryCalendEquipSeqHoraCODCALENDARIOEQUIP.AsInteger := DM.qryCalendEquipCODIGO.AsInteger;

//if DM.qryCalendEquipSeqHoraCODIGO.IsNull then
   //DM.qryCalendEquipSeqHoraCODIGO.AsInteger := DM.SMWebClient.GerarSequencia('CALENDARIOEQUIPSEQHORA_S');
//DM.qryCalendEquipSeqHoraCODEMPRESA.AsString := DM.FCodEmpresa;
DM.qryCalendEquipSeqHora.Post;

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'DATA GRAVADA COM SUCESSO!';
CalendarGrid.Enabled := True;
BtnNovoHorario.Enabled := True;
BtnSalvarHorario.Enabled := False;
BtnCancelarHorario.Enabled := False;
BtnExcluirHorario.Enabled := True;
end;

procedure TFrmTelaCadCalendEquip.CalendarGridClick(Sender: TObject);
var
LDataClicada : TDateTime;
LSequencia, LQtdDias : Integer;
begin
  inherited;
LDataClicada := StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]);

LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));

if DM.qryCalendEquipSeqHora.IsEmpty then exit;

if DM.DataFeriado(FormatDateTime('dd/mm', LDataClicada)) then
  begin
    EdtHoraIni1.Clear; EdtHoraFin1.Clear;
    EdtHoraIni2.Clear; EdtHoraFin2.Clear;
    EdtHoraIni3.Clear; EdtHoraFin3.Clear;
    EdtHoraIni4.Clear; EdtHoraFin4.Clear;
    Exit;
  end;

LQtdDias := 0;

with DM do
  Begin
    LSequencia   := 0;

    if LDataClicada > 0 then
       begin
         qryCalendEquipSeqHora.First;
         while not qryCalendEquipSeqHora.Eof do
           begin
             LSequencia := LSequencia + 1;
             qryCalendEquipSeqHora.Next;
           end;
         LQtdDias   := DaysBetween(0, LDataClicada);
         if LSequencia > 0 then
            begin
             LQtdDias := LQtdDias mod LSequencia;
             if (LQtdDias = 0) then LQtdDias := StrToInt(qryCalendEquipSeqHoraSEQUENCIA.AsString);
            end;
         qryCalendEquipSeqHora.First;
       end;

    qryCalendEquipSeqHora.Locate('SEQUENCIA', LQtdDias,[LopartiALKey,LocaseInsensitive]);
  End;
end;

procedure TFrmTelaCadCalendEquip.CalendarGridDrawCell(Sender: TObject; ACol,
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
              if Data = DateOf(DM.FDataHoraServidor) then
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

procedure TFrmTelaCadCalendEquip.DesenharCalendario;
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
                  Cells[Coluna, Linha]  := DateToStr(DiaPrimeiroMes + i);
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

procedure TFrmTelaCadCalendEquip.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadCalendEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryCalendEquipSeqHora.Close;
DM.qryCalendEquip.Close;
end;

procedure TFrmTelaCadCalendEquip.FormCreate(Sender: TObject);
var
I : SmallInt;
ShortDayNames: array[1..7] of string;
begin
  inherited;
DM.FDataSetParam    := DM.qryCalendEquip;
DM.FDataSourceParam := DM.dsCalendEquip;
DM.FDataSetRelat    := DmRelatorios.frxDBCalendEquip;
DM.FTela := 'CADCALENDEQUIP';
DM.FTabela_auxiliar := 24;

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

//Pega o Primeiro dia do Mes do Date (Pega a Data se estiver 20/01/2009 ai Fica 01/01/2009) entao a variavel PrimeiroDiaMes :=1
LPrimeiroDiaMes := RecodeDay(DM.FDataHoraServidor, 1);
DesenharCalendario;

TotalHorasMes;
LblDataConsulta.Caption := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', StrToDateTime(CalendarGrid.Cells[CalendarGrid.Col,CalendarGrid.Row]));
BtnNovoHorario.Enabled := False;
BtnSalvarHorario.Enabled := False;
BtnCancelarHorario.Enabled := False;
BtnExcluirHorario.Enabled := False;
end;

procedure TFrmTelaCadCalendEquip.TotalHorasMes;
var
I, J: SmallInt;
LTotalHorasMes : Real;
Sender: TObject;
begin
LTotalHorasMes := 0;
if DM.qryCalendEquip.IsEmpty then Exit;
Sender := CalendarGrid;
for I := 0 to 6 do
  begin
    for J := 1 to 6 do
      begin
        if MonthOf(StrToDateTime(CalendarGrid.Cells[I,J])) = MonthOf(DM.FDataHoraServidor) then
          begin
            CalendarGrid.Col := I;
            CalendarGrid.Row := J;
            CalendarGrid.OnClick(Sender);
            if (DM.qryCalendEquipSeqHoraHORAINI1.IsNull = False) and (DM.qryCalendEquipSeqHoraHORAFIN1.IsNull = False) then
              LTotalHorasMes := MinutesBetween(DM.qryCalendEquipSeqHoraHORAINI1.AsDateTime, DM.qryCalendEquipSeqHoraHORAFIN1.AsDateTime) + LTotalHorasMes;
            if (DM.qryCalendEquipSeqHoraHORAINI2.IsNull = False) and (DM.qryCalendEquipSeqHoraHORAFIN2.IsNull = False) then
              LTotalHorasMes := MinutesBetween(DM.qryCalendEquipSeqHoraHORAINI2.AsDateTime, DM.qryCalendEquipSeqHoraHORAFIN2.AsDateTime) + LTotalHorasMes;
            if (DM.qryCalendEquipSeqHoraHORAINI3.IsNull = False) and (DM.qryCalendEquipSeqHoraHORAFIN3.IsNull = False) then
              LTotalHorasMes := MinutesBetween(DM.qryCalendEquipSeqHoraHORAINI3.AsDateTime, DM.qryCalendEquipSeqHoraHORAFIN3.AsDateTime) + LTotalHorasMes;
            if (DM.qryCalendEquipSeqHoraHORAINI4.IsNull = False) and (DM.qryCalendEquipSeqHoraHORAFIN4.IsNull = False) then
              LTotalHorasMes := MinutesBetween(DM.qryCalendEquipSeqHoraHORAINI4.AsDateTime, DM.qryCalendEquipSeqHoraHORAFIN4.AsDateTime) + LTotalHorasMes;

          end;
      end;
  end;
LblHorasReais.Caption := FormatFloat('#00', Round(LTotalHorasMes/60));
CalendarGrid.Hint := 'Clique na data para visualizar o horário de trabalho.';
end;

end.

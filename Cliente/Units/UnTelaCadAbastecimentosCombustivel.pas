unit UnTelaCadAbastecimentosCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.DBCtrls, Data.DB, System.DateUtils, Datasnap.DBClient, FireDAC.Stan.Param,
  JvExComCtrls, JvDateTimePicker;

type
  TFrmTelaCadAbastecimentosCombustivel = class(TFrmTelaPaiOkCancel)
    EdtMatriculaCombust: TEdit;
    EdtDataCombust: TDateTimePicker;
    EdtLeitorCombust: TEdit;
    EdtQtdeCombust: TEdit;
    EdtPrecoCombust: TEdit;
    BtnCombust: TButton;
    BtnConsultar: TButton;
    LblCustoTotal: TDBText;
    EdtRotaCombust: TEdit;
    PEsquerda: TPanel;
    GrdCombustivel: TDBGrid;
    PDireita: TPanel;
    GrdAbastCombust: TDBGrid;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label1: TLabel;
    EdtData2: TJvDateTimePicker;
    procedure EdtMatriculaCombustKeyPress(Sender: TObject; var Key: Char);
    procedure GrdAbastCombustDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnCombustClick(Sender: TObject);
    procedure GrdCombustivelKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCombustivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtPrecoCombustKeyPress(Sender: TObject; var Key: Char);
    procedure EdtRotaCombustKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtRotaCombustChange(Sender: TObject);
    procedure EdtMatriculaCombustChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadAbastecimentosCombustivel: TFrmTelaCadAbastecimentosCombustivel;
  LRotaCombust, LMatriculaCombust: String;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadAbastecimentos, UnDM;

procedure TFrmTelaCadAbastecimentosCombustivel.BtnCombustClick(Sender: TObject);
var
LHorasEntreDatas: SmallInt;
LContadorAnt: Real;
begin
  inherited;
  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

  if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

  //if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
  if DM.FDataSetParam.IsEmpty = True then Exit;

  PAuxiliares.Font.Color := clGreen;
  PAuxiliares.Caption := EmptyStr;
  GrdAbastCombust.SetFocus;

  if DM.qryAbastecimentosCombustTIPOCOMBUSTIVEL.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO COMBUSTÍVEL!'; GrdCombustivel.SelectedIndex := 0; GrdCombustivel.SetFocus; Exit;
  end;
  if DM.qryAbastecimentosCombustCONSPOTENCIAL.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONSUMO POTENCIAL!'; GrdCombustivel.SelectedIndex := 1; GrdCombustivel.SetFocus; Exit;
  end;

  if DM.qryAbastecimentosCombustCODIGO.IsNull = False then
  begin
    DM.qryAbastecimentosCombust.Edit;
    DM.qryAbastecimentosCombust.Post;
  end;

  if LRotaCombust = EmptyStr          then begin EdtRotaCombust.SetFocus;      Exit; end;
  if LMatriculaCombust = EmptyStr     then begin EdtMatriculaCombust.SetFocus; Exit; end;
  if EdtDataCombust.Date = 0          then begin EdtDataCombust.SetFocus;      Exit; end;
  if EdtQtdeCombust.Text = EmptyStr   then begin EdtQtdeCombust.SetFocus;      Exit; end;
  if EdtLeitorCombust.Text = EmptyStr then begin EdtLeitorCombust.SetFocus;    Exit; end;
  if EdtPrecoCombust.Text = EmptyStr  then begin EdtPrecoCombust.SetFocus;     Exit; end;

  if Application.MessageBox('A inclusão desses dados não poderá ser desfeita, deseja continuar?','SPMP3', MB_ICONEXCLAMATION + MB_YESNO) = mrNo then Exit;

  if DM.qryAbastecimentosCombustAbastCODIGO.IsNull = False then
  begin
    if (DM.qryAbastecimentosCombustAbastMAX_DATA.AsString <> '') then
      if (EdtDataCombust.Date < DateOf(StrToDateTime(DM.qryAbastecimentosCombustAbastMAX_DATA.AsString))) then
        begin
          PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'DATA INFORMADA MENOR QUE DATA JÁ CADASTRADA!'; EdtDataCombust.SetFocus; Exit;
        end;
    //--------------------------------------------------------------------------------------------------------------------------------------------
    if StrToFloat(EdtLeitorCombust.Text) <= StrToFloat(DM.qryAbastecimentosCombustAbastMAX_ODOM.AsString) then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'VALOR SUPERIOR JÁ INFORMADO!'; EdtLeitorCombust.SetFocus; Exit;
      end;
  end;
  PAuxiliares.Caption := '';
  //--------------------------------------------------------------------------------------------------------------------------------------------
  if (DM.qryAbastecimentosCombustAbastCODIGO.IsNull = False) and (DM.qryAbastecimentosCombustAbastLEITOR.AsString <> 'INATIVO') and (DM.qryAbastecimentosTIPO.AsString = 'Equipamento') then
  begin
    DM.qryDataHoraServidor.Refresh;
    DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;
    // Colentando horas com base na diferença de dias
    LHorasEntreDatas := HoursBetween(EdtDataCombust.Date, DateOf(StrToDateTime(DM.qryAbastecimentosCombustAbastMAX_DATA.AsString)));
    if LHorasEntreDatas = 0 then
      begin
        if EdtDataCombust.Date <> DateOf(DM.FDataHoraServidor) then
          LHorasEntreDatas := 24
        else
          LHorasEntreDatas := HourOf(DM.FDataHoraServidor);
      end;

    if ((StrToFloat(EdtLeitorCombust.Text)) - (StrToFloat(DM.qryAbastecimentosCombustAbastMAX_ODOM.AsString))) > LHorasEntreDatas then
      begin
        Application.MessageBox('Intervalo superior a quantidade de horas disponíveis no período!','SPMP', MB_OK + MB_ICONERROR);
        EdtLeitorCombust.SetFocus;
        Exit;
      end;
  end;
  //--------------------------------------------------------------------------------------------------------------------------------------------
  DM.qryAbastecimentosCombustAbast.First;
  LContadorAnt :=DM.qryAbastecimentosCombustAbastODOMETROCOMBUST.AsFloat;

  if DM.qryAbastecimentosCombustCODIGO.AsInteger <= 0 then
  begin
    DM.qryAbastecimentosCombust.Edit;
    DM.qryAbastecimentosCombustCODEMPRESA.AsString     := DM.FCodEmpresa;
    DM.qryAbastecimentosCombustCODCONTCOMBUSTIVEL.AsInteger := DM.qryAbastecimentosCODIGO.AsInteger;
    DM.qryAbastecimentosCombustCODEQUIPAMENTO.AsString :=DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
    DM.qryAbastecimentosCombust.Post;
    DM.qryAbastecimentosCombust.Edit;
  end;

  DM.qryAbastecimentosCombustAbast.Append;
  DM.qryAbastecimentosCombustAbastCODCOMBUSTIVEL.AsInteger :=DM.qryAbastecimentosCombustCODIGO.AsInteger;
  DM.qryAbastecimentosCombustAbastCODEMPRESA.AsString      := DM.FCodEmpresa;
  DM.qryAbastecimentosCombustAbastCODEQUIPAMENTO.AsString  :=DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
  DM.qryAbastecimentosCombustAbastCODROTA.AsString         := LRotaCombust;
  DM.qryAbastecimentosCombustAbastDATACOMBUST.AsDateTime   := EdtDataCombust.Date;
  DM.qryAbastecimentosCombustAbastODOMETROCOMBUST.AsString := EdtLeitorCombust.Text;
  DM.qryAbastecimentosCombustAbastQTDECOMBUST.AsString     := EdtQtdeCombust.Text;
  DM.qryAbastecimentosCombustAbastPRECOCOMBUST.AsString    := EdtPrecoCombust.Text;
  DM.qryAbastecimentosCombustAbastMATRICULA.AsString       := LMatriculaCombust;
  DM.qryAbastecimentosCombustAbastROTA.AsString            := EdtRotaCombust.Text;
  DM.qryAbastecimentosCombustAbastNOME.AsString            := EdtMatriculaCombust.Text;
  DM.qryAbastecimentosCombustAbastVALORCOMBUST.AsFloat     :=DM.qryAbastecimentosCombustAbastQTDECOMBUST.AsFloat *DM.qryAbastecimentosCombustAbastPRECOCOMBUST.AsFloat;
  DM.qryAbastecimentosCombustAbastLEITOR.AsString          := 'ATIVO';
  DM.qryAbastecimentosCombustAbastTIPOCOMBUSTIVEL.AsString :=DM.qryAbastecimentosCombustTIPOCOMBUSTIVEL.AsString;
  DM.qryAbastecimentosCombustAbastCONSPOTENCIAL.AsFloat    :=DM.qryAbastecimentosCombustCONSPOTENCIAL.AsFloat;
  if DM.qryAbastecimentosCombustAbast.RecordCount > 0 then
   DM.qryAbastecimentosCombustAbastCONSUMO.AsFloat        := (DM.qryAbastecimentosCombustAbastODOMETROCOMBUST.AsInteger - LContadorAnt)/(DM.qryAbastecimentosCombustAbastQTDECOMBUST.AsFloat);

  DM.qryAbastecimentosCombustAbast.Post;

  EdtMatriculaCombust.SetFocus;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.BtnConsultarClick(
  Sender: TObject);
begin
  inherited;
  DM.qryAbastecimentosCombustAbast.Filtered := False;
  DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData1.Date)) + ' AND DATACOMBUST <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData2.Date));
  DM.qryAbastecimentosCombustAbast.Filtered := True;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.EdtMatriculaCombustChange(
  Sender: TObject);
begin
  inherited;
if EdtMatriculaCombust.Text = 'Funcionário' then
  EdtMatriculaCombust.Font.Color := clWindowFrame
else
  EdtMatriculaCombust.Font.Color := clWindowText;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.EdtMatriculaCombustKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if ((Key <> #13) and (Key <> #9)) and (GrdCombustivel.SelectedIndex = 0) then
  Key := #0;

if (Key = #13) then
  begin
    if DM.qryAbastecimentosCombustTIPOCOMBUSTIVEL.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO COMBUSTÍVEL!'; GrdCombustivel.SelectedIndex := 0; GrdCombustivel.SetFocus; Exit;
      end;
    if DM.qryAbastecimentosCombustCONSPOTENCIAL.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONSUMO POTENCIAL!'; GrdCombustivel.SelectedIndex := 1; GrdCombustivel.SetFocus; Exit;
      end;

    PAuxiliares.Caption := '';
    DM.FTabela_auxiliar := 300;
    DM.FParamAuxiliar[1] := 'NOME';
    DM.FNomeConsulta := 'Funcionários';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      LMatriculaCombust        := DM.FCodCombo;
      EdtMatriculaCombust.Text := DM.FValorCombo;
      FreeAndNil(FrmTelaAuxiliar);
    End;
    DM.FDataSetParam    :=DM.qryAbastecimentos;
    DM.FDataSourceParam := DM.dsAbastecimentos;
    DM.FTela            := 'CADCONTROLEPNEUS';
    DM.FTabela_auxiliar := 78;
  end;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.EdtPrecoCombustKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', ',', #8 , #9, #13]) then
    Key := #0

end;

procedure TFrmTelaCadAbastecimentosCombustivel.EdtRotaCombustChange(
  Sender: TObject);
begin
  inherited;
if EdtRotaCombust.Text = 'Rota' then
  EdtRotaCombust.Font.Color := clWindowFrame
else
  EdtRotaCombust.Font.Color := clBlack;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.EdtRotaCombustKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if ((Key <> #13) and (Key <> #9)) and (GrdCombustivel.SelectedIndex = 0) then
  Key := #0;

if (Key = #13) then
  begin
    if DM.qryAbastecimentosCombustTIPOCOMBUSTIVEL.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO COMBUSTÍVEL!'; GrdCombustivel.SelectedIndex := 0; GrdCombustivel.SetFocus; Exit;
      end;
    if DM.qryAbastecimentosCombustCONSPOTENCIAL.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONSUMO POTENCIAL!'; GrdCombustivel.SelectedIndex := 1; GrdCombustivel.SetFocus; Exit;
      end;

    PAuxiliares.Caption := '';
    DM.FTabela_auxiliar := 7900;
    DM.FNomeConsulta := 'Rotas';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.Caption := DM.FNomeConsulta;
      FrmTelaAuxiliar.ShowModal;
    Finally
      LRotaCombust        := DM.FCodCombo;
      EdtRotaCombust.Text := DM.FValorCombo;
      FreeAndNil(FrmTelaAuxiliar);
    End;
    DM.FDataSetParam    := DM.qryAbastecimentos;
    DM.FDataSourceParam := DM.dsAbastecimentos;
    DM.FTela            := 'CADCONTROLEPNEUS';
    DM.FTabela_auxiliar := 78;
  end;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.FormCreate(Sender: TObject);
begin
  inherited;
if DM.qryAbastecimentosCombust.Active = False then DM.qryAbastecimentosCombust.Open;
if DM.qryAbastecimentosCombustAbast.Active = False then DM.qryAbastecimentosCombustAbast.Open;

EdtData1.Date := IncMonth(DM.FDataHoraServidor, -1);
EdtData2.Date := DM.FDataHoraServidor;
EdtDataCombust.Date := DM.FDataHoraServidor;
if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
  begin
    GrdCombustivel.Columns[1].Title.Caption := 'l/hs';
    EdtLeitorCombust.TextHint := 'Horímetro';
  end
else
if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
  begin
    GrdCombustivel.Columns[1].Title.Caption := 'km/l';
    EdtLeitorCombust.TextHint := 'Odômetro';
  end;

if EdtMatriculaCombust.Text = 'Funcionário' then
  EdtMatriculaCombust.Font.Color := clWindowFrame
else
  EdtMatriculaCombust.Font.Color := clBlack;

if EdtRotaCombust.Text = 'Rota' then
  EdtRotaCombust.Font.Color := clWindowFrame
else
  EdtRotaCombust.Font.Color := clWindowText;

  DM.qryAbastecimentosCombustAbast.Filtered := False;
  DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData1.Date)) + ' AND DATACOMBUST <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData2.Date));
  DM.qryAbastecimentosCombustAbast.Filtered := True;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.GrdAbastCombustDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
with GrdAbastCombust do
  begin
    GrdAbastCombust.Columns[0].Visible          := False;
    GrdAbastCombust.Columns[1].Visible          := False;
    GrdAbastCombust.Columns[2].Visible          := False;
    GrdAbastCombust.Columns[3].Visible          := False;
    GrdAbastCombust.Columns[4].Visible          := False;
    GrdAbastCombust.Columns[12].Visible         := False;
    GrdAbastCombust.Columns[13].Visible         := False;
    GrdAbastCombust.Columns[14].Visible         := False;
    GrdAbastCombust.Columns[16].Visible         := False;
    GrdAbastCombust.Columns[17].Visible         := False;

    GrdAbastCombust.Columns[5].Title.Caption   := 'Rota';
    GrdAbastCombust.Columns[6].Title.Caption   := 'Funcionário';
    GrdAbastCombust.Columns[7].Title.Alignment  := taCenter;
    GrdAbastCombust.Columns[7].Title.Caption    := 'Data';
    GrdAbastCombust.Columns[8].Title.Alignment  := taCenter;
    GrdAbastCombust.Columns[8].Title.Caption    := 'Qtde.';
    GrdAbastCombust.Columns[9].Title.Alignment := taCenter;
    if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
       GrdAbastCombust.Columns[9].Title.Caption := 'Horímetro'
    else
    if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
       GrdAbastCombust.Columns[9].Title.Caption := 'Odômetro';
    GrdAbastCombust.Columns[10].Title.Alignment  := taCenter;
    GrdAbastCombust.Columns[10].Title.Caption    := 'Preço';
    GrdAbastCombust.Columns[11].Title.Alignment  := taCenter;
    GrdAbastCombust.Columns[11].Title.Caption    := 'Total';
    GrdAbastCombust.Columns[15].Title.Alignment := taCenter;
    GrdAbastCombust.Columns[15].Title.Caption   := 'Consumo';

    if (Column.Field.FieldName = 'CONSUMO') then
      begin
        if DM.qryAbastecimentosCombustAbastCONSUMO.AsFloat >DM.qryAbastecimentosCombustCONSPOTENCIAL.AsFloat then
          begin
             GrdAbastCombust.Canvas.Brush.Color := clRed; GrdAbastCombust.Canvas.Font.Color:= clWhite;
             GrdAbastCombust.Canvas.FillRect(Rect);
             GrdAbastCombust.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;
        if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
          begin
//            GrdAbastCombust.Columns[5].Title.Caption := 'Horímetro';
//            GrdAbastCombust.Columns[8].Title.Caption := 'l/h';
          end
        else
        if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
          begin
//            GrdAbastCombust.Columns[5].Title.Caption := 'Odômetro';
//            GrdAbastCombust.Columns[8].Title.Caption := 'km/l';
          end;
      end;
  end;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.GrdCombustivelKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadAbastecimentosCombustivel.GrdCombustivelKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (GrdCombustivel.SelectedIndex = 0) and ((Key <> #13) and (Key <> #9)) then
  begin
    Key := #0;
  end;
end;

end.

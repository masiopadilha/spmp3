unit UnTelaCadAbastecimentosLubrificante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, System.DateUtils, FireDAC.Stan.Param, JvExComCtrls,
  JvDateTimePicker;

type
  TFrmTelaCadAbastecimentosLubrificante = class(TFrmTelaPaiOkCancel)
    BtnLubrific: TButton;
    EdtDataLubrific: TDateTimePicker;
    EdtLeitorLubrific: TEdit;
    EdtMatriculaLubrific: TEdit;
    EdtPrecoLubrific: TEdit;
    EdtQtdeLubrific: TEdit;
    BtnConsultar: TButton;
    EdtRotaLubrific: TEdit;
    LblCustoTotal: TDBText;
    PEsquerda: TPanel;
    PDireita: TPanel;
    GrdLubrificante: TDBGrid;
    GrdAbastLubrific: TDBGrid;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label1: TLabel;
    EdtData2: TJvDateTimePicker;
    procedure BtnLubrificClick(Sender: TObject);
    procedure EdtMatriculaLubrificKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure GrdAbastLubrificDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdLubrificanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdLubrificanteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoLubrificKeyPress(Sender: TObject; var Key: Char);
    procedure EdtRotaLubrificKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtRotaLubrificChange(Sender: TObject);
    procedure EdtMatriculaLubrificChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadAbastecimentosLubrificante: TFrmTelaCadAbastecimentosLubrificante;
  LRotaLubrific, LMatriculaLubrific: String;
  LHorasEntreDatas: Real;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadAbastecimentos, UnDM;

procedure TFrmTelaCadAbastecimentosLubrificante.BtnConsultarClick(
  Sender: TObject);
begin
  inherited;
  DM.qryAbastecimentosLubrificAbast.Filtered := False;
  DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData1.Date)) + ' AND DATALUBRIFIC <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData2.Date));
  DM.qryAbastecimentosLubrificAbast.Filtered := True;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.BtnLubrificClick(Sender: TObject);
var
LHorasEntreDatas: SmallInt;
LContadorAnt: Real;
begin
  inherited;
//if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
GrdAbastLubrific.SetFocus;

if DM.qryAbastecimentosLubrificLUBRIFICANTE.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO LUBRIFICANTE!'; GrdLubrificante.SelectedIndex := 0; GrdLubrificante.SetFocus; Exit;
  end;
if DM.qryAbastecimentosLubrificCONSPOTENCIAL.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONSUMO POTENCIAL!'; GrdLubrificante.SelectedIndex := 1; GrdLubrificante.SetFocus; Exit;
  end;

if DM.qryAbastecimentosLubrificCODIGO.IsNull = False then
  begin
    DM.qryAbastecimentosLubrific.Edit;
    DM.qryAbastecimentosLubrific.Post;
  end;

if LRotaLubrific = EmptyStr          then begin EdtRotaLubrific.SetFocus;      Exit; end;
if LMatriculaLubrific = EmptyStr     then begin EdtMatriculaLubrific.SetFocus; Exit; end;
if EdtDataLubrific.Date = 0          then begin EdtDataLubrific.SetFocus;      Exit; end;
if EdtQtdeLubrific.Text = EmptyStr   then begin EdtQtdeLubrific.SetFocus;      Exit; end;
if EdtLeitorLubrific.Text = EmptyStr then begin EdtLeitorLubrific.SetFocus;    Exit; end;
if EdtPrecoLubrific.Text = EmptyStr  then begin EdtPrecoLubrific.SetFocus;     Exit; end;

if Application.MessageBox('A inclusão desses dados não poderá ser desfeita, deseja continuar?','SPMP3', MB_ICONEXCLAMATION + MB_YESNO) = mrNo then Exit;

if DM.qryAbastecimentosLubrificAbastCODIGO.IsNull = False then
  begin
    if (DM.qryAbastecimentosLubrificAbastMAX_DATA.AsString <> '') then
      if (EdtDataLubrific.Date < DateOf(StrToDateTime(DM.qryAbastecimentosLubrificAbastMAX_DATA.AsString))) then
        begin
          PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'DATA INFORMADA MENOR QUE DATA JÁ CADASTRADA!'; EdtDataLubrific.SetFocus; Exit;
        end;
    //--------------------------------------------------------------------------------------------------------------------------------------------
    if StrToFloat(EdtLeitorLubrific.Text) <= StrToFloat(DM.qryAbastecimentosLubrificAbastMAX_ODOM.AsString) then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'VALOR SUPERIOR JÁ INFORMADO!'; EdtLeitorLubrific.SetFocus; Exit;
      end;
  end;
PAuxiliares.Caption := '';
//--------------------------------------------------------------------------------------------------------------------------------------------
if (DM.qryAbastecimentosLubrificAbastCODIGO.IsNull = False) and (DM.qryAbastecimentosLubrificAbastLEITOR.AsString <> 'INATIVO') and (DM.qryAbastecimentosTIPO.AsString = 'Equipamento') then
  begin
    DM.qryDataHoraServidor.Refresh;
    DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;
    // Colentando horas com base na diferença de dias
    LHorasEntreDatas := HoursBetween(EdtDataLubrific.Date, DateOf(StrToDateTime(DM.qryAbastecimentosLubrificAbastMAX_DATA.AsString)));
    if LHorasEntreDatas = 0 then
      begin
        if EdtDataLubrific.Date <> DateOf(DM.FDataHoraServidor) then
          LHorasEntreDatas := 24
        else
          LHorasEntreDatas := HourOf(DM.FDataHoraServidor);
      end;

    if ((StrToFloat(EdtLeitorLubrific.Text)) - (StrToFloat(DM.qryAbastecimentosLubrificAbastMAX_ODOM.AsString))) > LHorasEntreDatas then
      begin
        Application.MessageBox('Intervalo superior a quantidade de horas disponíveis no período!','SPMP', MB_OK + MB_ICONERROR);
        EdtLeitorLubrific.SetFocus;
        Exit;
      end;
  end;
//--------------------------------------------------------------------------------------------------------------------------------------------
DM.qryAbastecimentosLubrificAbast.First;
LContadorAnt := DM.qryAbastecimentosLubrificAbastODOMETROLUBRIFIC.AsFloat;

if DM.qryAbastecimentosLubrificCODIGO.AsInteger <= 0 then
  begin
    DM.qryAbastecimentosLubrific.Edit;
    DM.qryAbastecimentosLubrificCODEMPRESA.AsString     := DM.FCodEmpresa;
    DM.qryAbastecimentosLubrificCODEQUIPAMENTO.AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
    DM.qryAbastecimentosLubrific.Post;
    DM.qryAbastecimentosLubrific.Edit;
  end;

DM.qryAbastecimentosLubrificAbast.Append;
//DM.qryAbastecimentosLubrificAbastCODIGO.AsInteger          := DM.qryAbastecimentosLubrific.RecordCount + 1;
DM.qryAbastecimentosLubrificAbastCODLUBRIFICANTE.AsInteger :=  DM.qryAbastecimentosLubrificCODIGO.AsInteger;
DM.qryAbastecimentosLubrificAbastCODEMPRESA.AsString       := DM.FCodEmpresa;
DM.qryAbastecimentosLubrificAbastCODEQUIPAMENTO.AsString   := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
DM.qryAbastecimentosLubrificAbastCODROTA.AsString          := LRotaLubrific;
DM.qryAbastecimentosLubrificAbastDATALUBRIFIC.AsDateTime   := EdtDataLubrific.Date;
DM.qryAbastecimentosLubrificAbastODOMETROLUBRIFIC.AsString := EdtLeitorLubrific.Text;
DM.qryAbastecimentosLubrificAbastQTDELUBRIFIC.AsString     := EdtQtdeLubrific.Text;
DM.qryAbastecimentosLubrificAbastPRECOLUBRIFIC.AsString    := EdtPrecoLubrific.Text;
DM.qryAbastecimentosLubrificAbastMATRICULA.AsString        := LMatriculaLubrific;
DM.qryAbastecimentosLubrificAbastROTA.AsString             := EdtRotaLubrific.Text;
DM.qryAbastecimentosLubrificAbastNOME.AsString             := EdtMatriculaLubrific.Text;
DM.qryAbastecimentosLubrificAbastVALORLUBRIFIC.AsFloat     := DM.qryAbastecimentosLubrificAbastQTDELUBRIFIC.AsFloat * DM.qryAbastecimentosLubrificAbastPRECOLUBRIFIC.AsFloat;
DM.qryAbastecimentosLubrificAbastLEITOR.AsString           := 'ATIVO';
DM.qryAbastecimentosLubrificAbastLUBRIFICANTE.AsString     := DM.qryAbastecimentosLubrificLUBRIFICANTE.AsString;
DM.qryAbastecimentosLubrificAbastCONSPOTENCIAL.AsFloat     := DM.qryAbastecimentosLubrificCONSPOTENCIAL.AsFloat;
if DM.qryAbastecimentosLubrificAbast.RecordCount > 0 then
  DM.qryAbastecimentosLubrificAbastCONSUMO.AsFloat         := DM.qryAbastecimentosLubrificAbastQTDELUBRIFIC.AsFloat/(DM.qryAbastecimentosLubrificAbastODOMETROLUBRIFIC.AsInteger - LContadorAnt);

DM.qryAbastecimentosLubrificAbast.Post;

EdtMatriculaLubrific.SetFocus;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.EdtMatriculaLubrificChange(
  Sender: TObject);
begin
  inherited;
if EdtRotaLubrific.Text = 'Rota' then
  EdtRotaLubrific.Font.Color := clWindowFrame
else
  EdtRotaLubrific.Font.Color := clBlack;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.EdtMatriculaLubrificKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if ((Key <> #13) and (Key <> #9)) and (GrdLubrificante.SelectedIndex = 0) then
  Key := #0;

if (Key = #13) then
  begin
    if DM.qryAbastecimentosLubrificLUBRIFICANTE.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO LUBRIFICANTE!'; GrdLubrificante.SelectedIndex := 0; GrdLubrificante.SetFocus; Exit;
      end;
    if DM.qryAbastecimentosLubrificCONSPOTENCIAL.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONSUMO POTENCIAL!'; GrdLubrificante.SelectedIndex := 1; GrdLubrificante.SetFocus; Exit;
      end;

    PAuxiliares.Caption := '';
    DM.FTabela_auxiliar := 300;
    DM.FParamAuxiliar[1] := 'NOME';
    DM.FNomeConsulta := 'Funcionários';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      LMatriculaLubrific        := DM.FCodCombo;
      EdtMatriculaLubrific.Text := DM.FValorCombo;
      FreeAndNil(FrmTelaAuxiliar);
    End;

    DM.FDataSetParam    := DM.qryAbastecimentos;
    DM.FDataSourceParam := DM.dsAbastecimentos;
    DM.FTela            := 'CADCONTROLEPNEUS';
    DM.FTabela_auxiliar := 78;
  end;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.EdtPrecoLubrificKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', ',', #8 , #9, #13]) then
    Key := #0

end;

procedure TFrmTelaCadAbastecimentosLubrificante.EdtRotaLubrificChange(
  Sender: TObject);
begin
  inherited;
if EdtMatriculaLubrific.Text = 'Funcionário' then
  EdtMatriculaLubrific.Font.Color := clWindowFrame
else
  EdtMatriculaLubrific.Font.Color := clWindowText;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.EdtRotaLubrificKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if ((Key <> #13) and (Key <> #9)) and (GrdLubrificante.SelectedIndex = 0) then
  Key := #0;

if (Key = #13) then
  begin
    if DM.qryAbastecimentosLubrificCODLUBRIFICANTE.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O LUBRIFICANTE!'; GrdLubrificante.SelectedIndex := 0; GrdLubrificante.SetFocus; Exit;
      end;
    if DM.qryAbastecimentosLubrificCONSPOTENCIAL.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONSUMO POTENCIAL!'; GrdLubrificante.SelectedIndex := 1; GrdLubrificante.SetFocus; Exit;
      end;

    PAuxiliares.Caption := '';
    DM.FTabela_auxiliar := 7900;
    DM.FNomeConsulta := 'Rotas';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.Caption := DM.FNomeConsulta;
      FrmTelaAuxiliar.ShowModal;
    Finally
      LRotaLubrific        := DM.FCodCombo;
      EdtRotaLubrific.Text := DM.FValorCombo;
      FreeAndNil(FrmTelaAuxiliar);
    End;
    DM.FDataSetParam    := DM.qryAbastecimentos;
    DM.FDataSourceParam := DM.dsAbastecimentos;
    DM.FTela            := 'CADCONTROLEPNEUS';
    DM.FTabela_auxiliar := 78;
  end;

end;

procedure TFrmTelaCadAbastecimentosLubrificante.FormCreate(Sender: TObject);
begin
  inherited;
if DM.qryAbastecimentosLubrific.Active = False then DM.qryAbastecimentosLubrific.Open;
if DM.qryAbastecimentosLubrificAbast.Active = False then DM.qryAbastecimentosLubrificAbast.Open;

EdtData1.Date := IncMonth(DM.FDataHoraServidor, -1);
EdtData2.Date := DM.FDataHoraServidor;
EdtDataLubrific.Date := DM.FDataHoraServidor;
if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
  begin
    GrdLubrificante.Columns[1].Title.Caption := 'l/hs';
    EdtLeitorLubrific.TextHint := 'Horímetro';
  end
else
if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
  begin
    GrdLubrificante.Columns[1].Title.Caption := 'l/km';
    EdtLeitorLubrific.TextHint := 'Odômetro';
  end;

if EdtMatriculaLubrific.Text = 'Funcionário' then
  EdtMatriculaLubrific.Font.Color := clWindowFrame
else
  EdtMatriculaLubrific.Font.Color := clBlack;

if EdtRotaLubrific.Text = 'Rota' then
  EdtRotaLubrific.Font.Color := clWindowFrame
else
  EdtRotaLubrific.Font.Color := clWindowText;

  DM.qryAbastecimentosLubrificAbast.Filtered := False;
  DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData1.Date)) + ' AND DATALUBRIFIC <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', EdtData2.Date));
  DM.qryAbastecimentosLubrificAbast.Filtered := True;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.GrdAbastLubrificDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
with GrdAbastLubrific do
  begin
    GrdAbastLubrific.Columns[0].Visible          := False;
    GrdAbastLubrific.Columns[1].Visible          := False;
    GrdAbastLubrific.Columns[2].Visible          := False;
    GrdAbastLubrific.Columns[3].Visible          := False;
    GrdAbastLubrific.Columns[4].Visible          := False;
    GrdAbastLubrific.Columns[12].Visible         := False;
    GrdAbastLubrific.Columns[13].Visible         := False;
    GrdAbastLubrific.Columns[14].Visible         := False;
    GrdAbastLubrific.Columns[16].Visible         := False;
    GrdAbastLubrific.Columns[17].Visible         := False;

    GrdAbastLubrific.Columns[5].Title.Caption   := 'Rota';
    GrdAbastLubrific.Columns[6].Title.Caption   := 'Funcionário';
    GrdAbastLubrific.Columns[7].Title.Alignment  := taCenter;
    GrdAbastLubrific.Columns[7].Title.Caption    := 'Data';
    GrdAbastLubrific.Columns[8].Title.Alignment  := taCenter;
    GrdAbastLubrific.Columns[8].Title.Caption    := 'Qtde.';
    GrdAbastLubrific.Columns[9].Title.Alignment := taCenter;
    if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
       GrdAbastLubrific.Columns[9].Title.Caption := 'Horímetro'
    else
    if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
       GrdAbastLubrific.Columns[9].Title.Caption := 'Odômetro';
    GrdAbastLubrific.Columns[10].Title.Alignment  := taCenter;
    GrdAbastLubrific.Columns[10].Title.Caption    := 'Preço';
    GrdAbastLubrific.Columns[11].Title.Alignment  := taCenter;
    GrdAbastLubrific.Columns[11].Title.Caption    := 'Total';
    GrdAbastLubrific.Columns[15].Title.Alignment := taCenter;
    GrdAbastLubrific.Columns[15].Title.Caption   := 'Consumo';

    if (Column.Field.FieldName = 'CONSUMO') then
      begin
        if DM.qryAbastecimentosLubrificAbastCONSUMO.AsFloat > DM.qryAbastecimentosLubrificCONSPOTENCIAL.AsFloat then
          begin
             GrdAbastLubrific.Canvas.Brush.Color := clRed; GrdAbastLubrific.Canvas.Font.Color:= clWhite;
             GrdAbastLubrific.Canvas.FillRect(Rect);
             GrdAbastLubrific.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;
        if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
          begin
            GrdAbastLubrific.Columns[5].Title.Caption := 'Horímetro';
            GrdAbastLubrific.Columns[8].Title.Caption := 'l/h';
          end
        else
        if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
          begin
            GrdAbastLubrific.Columns[5].Title.Caption := 'Odômetro';
            GrdAbastLubrific.Columns[8].Title.Caption := 'l/km';
          end;
      end;
  end;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.GrdLubrificanteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadAbastecimentosLubrificante.GrdLubrificanteKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (GrdLubrificante.SelectedIndex = 0) and ((Key <> #13) and (Key <> #9)) then
  begin
    Key := #0;
  end;

if (GrdLubrificante.SelectedIndex = 0) and (Key = #13) then
  begin
    DM.FTabela_auxiliar := 6400;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryAbastecimentosLubrific.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryAbastecimentosLubrificCODLUBRIFICANTE.AsString <> '' then
            begin
              if DM.qryAbastecimentosLubrific.Locate('CODLUBRIFICANTE', DM.FCodCombo, []) = False then
                begin
                  DM.qryAbastecimentosLubrific.Append;
                  DM.qryAbastecimentosLubrificCODLUBRIFICANTE.AsString := DM.FCodCombo;
                  DM.qryAbastecimentosLubrificLUBRIFICANTE.AsString := DM.FValorCombo;
                  DM.qryAbastecimentosLubrific.Post;
                  DM.qryAbastecimentosLubrific.Edit;
                end;
            end
          else
            begin
              DM.qryAbastecimentosLubrific.Edit;
              DM.qryAbastecimentosLubrificCODLUBRIFICANTE.AsString := DM.FCodCombo;
              DM.qryAbastecimentosLubrificLUBRIFICANTE.AsString := DM.FValorCombo;
              DM.qryAbastecimentosLubrific.Post;
              DM.qryAbastecimentosLubrific.Edit;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;

end;

end.

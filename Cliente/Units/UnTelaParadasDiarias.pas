unit UnTelaParadasDiarias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, System.DateUtils, Vcl.DBGrids,
  JvComponentBase, JvDBGridExport, Data.DB, Datasnap.DBClient, System.Win.ComObj, FireDAC.Stan.Param;

type
  TFrmTelaParadasDiarias = class(TFrmTelaPaiOkCancel)
    PAguarde: TPanel;
    BtnConsultar: TButton;
    JvDBGridExcelExport1: TJvDBGridExcelExport;
    GrdParadas: TDBGrid;
    CDDados: TClientDataSet;
    CDDadosCODIGO: TStringField;
    CDDadosDESCRICAO: TStringField;
    CDDadosField01: TStringField;
    CDDadosField02: TStringField;
    CDDadosField03: TStringField;
    CDDadosField04: TStringField;
    CDDadosField05: TStringField;
    CDDadosField06: TStringField;
    CDDadosField07: TStringField;
    CDDadosField08: TStringField;
    CDDadosField09: TStringField;
    CDDadosField10: TStringField;
    CDDadosField11: TStringField;
    CDDadosField12: TStringField;
    CDDadosField13: TStringField;
    CDDadosField14: TStringField;
    CDDadosField15: TStringField;
    CDDadosField16: TStringField;
    CDDadosField17: TStringField;
    CDDadosField18: TStringField;
    CDDadosField19: TStringField;
    CDDadosField20: TStringField;
    CDDadosField21: TStringField;
    CDDadosField22: TStringField;
    CDDadosField23: TStringField;
    CDDadosField24: TStringField;
    CDDadosField25: TStringField;
    CDDadosField26: TStringField;
    CDDadosField27: TStringField;
    CDDadosField28: TStringField;
    CDDadosField29: TStringField;
    CDDadosField30: TStringField;
    DSDados: TDataSource;
    CDDadosField31: TStringField;
    JvDBGridXMLExport1: TJvDBGridXMLExport;
    JvDBGridCSVExport1: TJvDBGridCSVExport;
    procedure FormCreate(Sender: TObject);
    procedure GrdParadasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdParadasDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaParadasDiarias: TFrmTelaParadasDiarias;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaParadasDiarias.BtnConsultarClick(Sender: TObject);
begin
  inherited;
//JvDBGridCSVExport1.ExportGrid;
//JvDBGridXMLExport1.ExportGrid;
DM.MSGAguarde();
JvDBGridExcelExport1.ExportGrid;
DM.MSGAguarde('', False);
end;

procedure TFrmTelaParadasDiarias.FormCreate(Sender: TObject);
var
LDataCelula: TDateTime;
begin
  inherited;
DM.MSGAguarde('');

DM.qryParadasDiariasEquip.Close;
DM.qryParadasDiariasEquip.Params[0].AsString := DM.FCodEmpresa;
DM.qryParadasDiariasEquip.Open;

DM.qryParadasDiariasEquipParadas.Close;
DM.qryParadasDiariasEquipParadas.Params[0].AsString := DM.FCodEmpresa;
DM.qryParadasDiariasEquipParadas.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
DM.qryParadasDiariasEquipParadas.Open;

CDDados.Close; CDDados.CreateDataSet;
while not DM.qryParadasDiariasEquip.Eof = True do
  begin
    CDDados.Append;
    CDDadosCODIGO.AsString    := DM.qryParadasDiariasEquipCODIGO.AsString;
    CDDadosDESCRICAO.AsString := DM.qryParadasDiariasEquipDESCRICAO.AsString;
    if DayOf(DM.FDataHoraServidor)>= 1 then
      begin
        LDataCelula := StrToDateTime('01/'+FormatFloat('00', MonthOf(DM.FDataHoraServidor))+'/'+FormatFloat('0000', YearOf(DM.FDataHoraServidor)));
        CDDadosField01.AsString := 'N';
        DM.qryParadasDiariasEquipParadas.First;
        while not DM.qryParadasDiariasEquipParadas.Eof do
          begin
            if (DM.qryParadasDiariasEquipParadasDATAINICIOREAL.AsDateTime > 0) and (DM.qryParadasDiariasEquipParadasDATAFIMREAL.AsDateTime > 0) then
              begin
                if (DateOf(LDataCelula) >= DateOf(DM.qryParadasDiariasEquipParadasDATAINICIOREAL.AsDateTime))
                  and (DateOf(LDataCelula) <= DateOf(DM.qryParadasDiariasEquipParadasDATAFIMREAL.AsDateTime)) then
                    begin
                      if DM.qryParadasDiariasEquipParadasTIPOMANUTENCAO.AsString = 'Manutenção Preventiva' then
                        CDDadosField01.AsString := 'P'
                      else
                      if DM.qryParadasDiariasEquipParadasTIPOMANUTENCAO.AsString = 'Manutenção Corretiva' then
                        CDDadosField01.AsString := 'X';
                    end;
              end;
            if (DM.qryParadasDiariasEquipParadasDATAINICIOREAL.AsDateTime > 0) and (DM.qryParadasDiariasEquipParadasDATAFIMREAL.IsNull = True) then
              begin
                if DateOf(LDataCelula) >= DateOf(DM.qryParadasDiariasEquipParadasDATAINICIOREAL.AsDateTime) then
                  begin
                    if DM.qryParadasDiariasEquipParadasTIPOMANUTENCAO.AsString = 'Manutenção Preventiva' then
                      CDDadosField01.AsString := 'P'
                    else
                    if DM.qryParadasDiariasEquipParadasTIPOMANUTENCAO.AsString = 'Manutenção Corretiva' then
                      CDDadosField01.AsString := 'X';
                  end;
              end;

            DM.qryParadasDiariasEquipParadas.Next;
          end;
      end;
    if DayOf(DM.FDataHoraServidor)>= 2 then CDDadosField02.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 3 then CDDadosField03.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 4 then CDDadosField04.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 5 then CDDadosField05.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 6 then CDDadosField06.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 7 then CDDadosField07.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 8 then CDDadosField08.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 9 then CDDadosField09.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 10 then CDDadosField10.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 11 then CDDadosField11.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 12 then CDDadosField12.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 13 then CDDadosField13.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 14 then CDDadosField14.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 15 then CDDadosField15.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 16 then CDDadosField16.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 17 then CDDadosField17.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 18 then CDDadosField18.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 19 then CDDadosField19.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 20 then CDDadosField20.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 21 then CDDadosField21.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 22 then CDDadosField22.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 23 then CDDadosField23.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 24 then CDDadosField24.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 25 then CDDadosField25.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 26 then CDDadosField26.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 27 then CDDadosField27.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 28 then CDDadosField28.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 29 then CDDadosField29.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 30 then CDDadosField30.AsString := 'N';
    if DayOf(DM.FDataHoraServidor)>= 31 then CDDadosField31.AsString := 'N';
    CDDados.Post;

    DM.qryParadasDiariasEquip.Next;
  end;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaParadasDiarias.GrdParadasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
LDataMaxima:  TDateTime;
begin
  inherited;
LDataMaxima := StrToDateTime(FormatFloat('00', DaysInMonth(DM.FDataHoraServidor)) + FormatDateTime('/mm/yyyy', DM.FDataHoraServidor));

GrdParadas.Columns[0].Title.Alignment := taCenter;
GrdParadas.Columns[2].Title.Alignment := taCenter;  GrdParadas.Columns[3].Title.Alignment := taCenter;
GrdParadas.Columns[4].Title.Alignment := taCenter;  GrdParadas.Columns[5].Title.Alignment := taCenter;
GrdParadas.Columns[6].Title.Alignment := taCenter;  GrdParadas.Columns[7].Title.Alignment := taCenter;
GrdParadas.Columns[8].Title.Alignment := taCenter;  GrdParadas.Columns[10].Title.Alignment := taCenter;
GrdParadas.Columns[11].Title.Alignment := taCenter; GrdParadas.Columns[12].Title.Alignment := taCenter;
GrdParadas.Columns[13].Title.Alignment := taCenter; GrdParadas.Columns[14].Title.Alignment := taCenter;
GrdParadas.Columns[15].Title.Alignment := taCenter; GrdParadas.Columns[16].Title.Alignment := taCenter;
GrdParadas.Columns[17].Title.Alignment := taCenter; GrdParadas.Columns[18].Title.Alignment := taCenter;
GrdParadas.Columns[19].Title.Alignment := taCenter; GrdParadas.Columns[20].Title.Alignment := taCenter;
GrdParadas.Columns[21].Title.Alignment := taCenter; GrdParadas.Columns[22].Title.Alignment := taCenter;
GrdParadas.Columns[23].Title.Alignment := taCenter; GrdParadas.Columns[24].Title.Alignment := taCenter;
GrdParadas.Columns[25].Title.Alignment := taCenter; GrdParadas.Columns[26].Title.Alignment := taCenter;
GrdParadas.Columns[27].Title.Alignment := taCenter; GrdParadas.Columns[28].Title.Alignment := taCenter;
GrdParadas.Columns[29].Title.Alignment := taCenter;

GrdParadas.Columns[0].Title.Font.Size := 9;  GrdParadas.Columns[1].Title.Font.Size := 9;
GrdParadas.Columns[2].Title.Font.Size := 9;  GrdParadas.Columns[3].Title.Font.Size := 9;
GrdParadas.Columns[4].Title.Font.Size := 9;  GrdParadas.Columns[5].Title.Font.Size := 9;
GrdParadas.Columns[6].Title.Font.Size := 9;  GrdParadas.Columns[7].Title.Font.Size := 9;
GrdParadas.Columns[8].Title.Font.Size := 9;  GrdParadas.Columns[9].Title.Font.Size := 9;
GrdParadas.Columns[10].Title.Font.Size := 9; GrdParadas.Columns[11].Title.Font.Size := 9;
GrdParadas.Columns[12].Title.Font.Size := 9; GrdParadas.Columns[13].Title.Font.Size := 9;
GrdParadas.Columns[14].Title.Font.Size := 9; GrdParadas.Columns[15].Title.Font.Size := 9;
GrdParadas.Columns[16].Title.Font.Size := 9; GrdParadas.Columns[17].Title.Font.Size := 9;
GrdParadas.Columns[18].Title.Font.Size := 9; GrdParadas.Columns[19].Title.Font.Size := 9;
GrdParadas.Columns[20].Title.Font.Size := 9; GrdParadas.Columns[21].Title.Font.Size := 9;
GrdParadas.Columns[22].Title.Font.Size := 9; GrdParadas.Columns[23].Title.Font.Size := 9;
GrdParadas.Columns[24].Title.Font.Size := 9; GrdParadas.Columns[25].Title.Font.Size := 9;
GrdParadas.Columns[26].Title.Font.Size := 9; GrdParadas.Columns[27].Title.Font.Size := 9;
GrdParadas.Columns[28].Title.Font.Size := 9; GrdParadas.Columns[29].Title.Font.Size := 9;

if DateOf(DM.qryParadasDiariasEquipDateField29.AsDateTime) > LDataMaxima then
  begin
    GrdParadas.Columns[30].Visible := False;
  end
else
  begin
    GrdParadas.Columns[30].Title.Font.Size := 9;
    GrdParadas.Columns[30].Visible := True;
  end;

if DateOf(DM.qryParadasDiariasEquipDateField30.AsDateTime) > LDataMaxima then
  begin
    GrdParadas.Columns[31].Visible := False;
  end
else
  begin
    GrdParadas.Columns[31].Title.Font.Size := 9;
    GrdParadas.Columns[31].Visible := True;
  end;

if DateOf(DM.qryParadasDiariasEquipDateField31.AsDateTime) > LDataMaxima then
  begin
    GrdParadas.Columns[32].Visible := False;
  end
else
  begin
    GrdParadas.Columns[32].Title.Font.Size := 9;
    GrdParadas.Columns[32].Visible := True;
  end;
end;

procedure TFrmTelaParadasDiarias.GrdParadasDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if ((Field.FieldName = '01') or (Field.FieldName = '02') or (Field.FieldName = '03') or (Field.FieldName = '04') or (Field.FieldName = '05')
   or (Field.FieldName = '06') or (Field.FieldName = '07') or (Field.FieldName = '08') or (Field.FieldName = '09') or (Field.FieldName = '10')
      or (Field.FieldName = '11') or (Field.FieldName = '12') or (Field.FieldName = '13') or (Field.FieldName = '14') or (Field.FieldName = '15')
         or (Field.FieldName = '16') or (Field.FieldName = '17') or (Field.FieldName = '18') or (Field.FieldName = '19') or (Field.FieldName = '20')
            or (Field.FieldName = '21') or (Field.FieldName = '22') or (Field.FieldName = '23') or (Field.FieldName = '24') or (Field.FieldName = '25')
               or (Field.FieldName = '26') or (Field.FieldName = '27') or (Field.FieldName = '28') or (Field.FieldName = '29') or (Field.FieldName = '30')
                  or (Field.FieldName = '31')) and (Trim(Field.AsString) = 'N') then
                    begin
                      GrdParadas.Canvas.Brush.Color := clGreen;
                      GrdParadas.Canvas.FillRect(Rect);
                    end;
if ((Field.FieldName = '01') or (Field.FieldName = '02') or (Field.FieldName = '03') or (Field.FieldName = '04') or (Field.FieldName = '05')
   or (Field.FieldName = '06') or (Field.FieldName = '07') or (Field.FieldName = '08') or (Field.FieldName = '09') or (Field.FieldName = '10')
      or (Field.FieldName = '11') or (Field.FieldName = '12') or (Field.FieldName = '13') or (Field.FieldName = '14') or (Field.FieldName = '15')
         or (Field.FieldName = '16') or (Field.FieldName = '17') or (Field.FieldName = '18') or (Field.FieldName = '19') or (Field.FieldName = '20')
            or (Field.FieldName = '21') or (Field.FieldName = '22') or (Field.FieldName = '23') or (Field.FieldName = '24') or (Field.FieldName = '25')
               or (Field.FieldName = '26') or (Field.FieldName = '27') or (Field.FieldName = '28') or (Field.FieldName = '29') or (Field.FieldName = '30')
                  or (Field.FieldName = '31')) and (Trim(Field.AsString) = 'X') then
                    begin
                      GrdParadas.Canvas.Brush.Color := clRed;
                      GrdParadas.Canvas.FillRect(Rect);
                    end;
if ((Field.FieldName = '01') or (Field.FieldName = '02') or (Field.FieldName = '03') or (Field.FieldName = '04') or (Field.FieldName = '05')
   or (Field.FieldName = '06') or (Field.FieldName = '07') or (Field.FieldName = '08') or (Field.FieldName = '09') or (Field.FieldName = '10')
      or (Field.FieldName = '11') or (Field.FieldName = '12') or (Field.FieldName = '13') or (Field.FieldName = '14') or (Field.FieldName = '15')
         or (Field.FieldName = '16') or (Field.FieldName = '17') or (Field.FieldName = '18') or (Field.FieldName = '19') or (Field.FieldName = '20')
            or (Field.FieldName = '21') or (Field.FieldName = '22') or (Field.FieldName = '23') or (Field.FieldName = '24') or (Field.FieldName = '25')
               or (Field.FieldName = '26') or (Field.FieldName = '27') or (Field.FieldName = '28') or (Field.FieldName = '29') or (Field.FieldName = '30')
                  or (Field.FieldName = '31')) and (Trim(Field.AsString) = 'P') then
                    begin
                      GrdParadas.Canvas.Brush.Color := clYellow;
                      GrdParadas.Canvas.FillRect(Rect);
                    end;
if ((Field.FieldName = '01') or (Field.FieldName = '02') or (Field.FieldName = '03') or (Field.FieldName = '04') or (Field.FieldName = '05')
   or (Field.FieldName = '06') or (Field.FieldName = '07') or (Field.FieldName = '08') or (Field.FieldName = '09') or (Field.FieldName = '10')
      or (Field.FieldName = '11') or (Field.FieldName = '12') or (Field.FieldName = '13') or (Field.FieldName = '14') or (Field.FieldName = '15')
         or (Field.FieldName = '16') or (Field.FieldName = '17') or (Field.FieldName = '18') or (Field.FieldName = '19') or (Field.FieldName = '20')
            or (Field.FieldName = '21') or (Field.FieldName = '22') or (Field.FieldName = '23') or (Field.FieldName = '24') or (Field.FieldName = '25')
               or (Field.FieldName = '26') or (Field.FieldName = '27') or (Field.FieldName = '28') or (Field.FieldName = '29') or (Field.FieldName = '30')
                  or (Field.FieldName = '31')) and (Trim(Field.AsString) = 'X') then
                    begin
                      GrdParadas.Canvas.Brush.Color := clRed;
                      GrdParadas.Canvas.FillRect(Rect);
                    end;
end;


end.

unit UnTelaInspecoesVencidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnBaseCrud, Data.DB, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, Vcl.Menus, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.WinXCtrls, Vcl.ExtCtrls, System.DateUtils;

type
  TfrmTelaInspecoesVencidas = class(TfrmBaseCrud)
    procedure JvDBGridListaDblClick(Sender: TObject);
    procedure JvDBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaInspecoesVencidas: TfrmTelaInspecoesVencidas;

implementation

{$R *.dfm}

uses UnDM;

procedure TfrmTelaInspecoesVencidas.JvDBGridListaDblClick(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmTelaInspecoesVencidas.JvDBGridListaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'DTAINICIO1') then
    begin
      if Column.Field.IsNull = False then
        if JvDBGridLista.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime < DateOf(DM.FDataHoraServidor) then
          begin
            if DM.qryAuxiliar.FieldByName('Atraso').AsInteger < 5 then
              begin
                JvDBGridLista.Canvas.Brush.Color := clYellow;
                JvDBGridLista.Canvas.Font.Color  := clRed;
              end
            else
              begin
                JvDBGridLista.Canvas.Brush.Color := clRed;
                JvDBGridLista.Canvas.Font.Color  := clWhite;
              end;
          end;
    end else
  if (Column.Field.FieldName = 'DATAINICIO') then
    begin
      if Column.Field.IsNull = False then
        if JvDBGridLista.DataSource.DataSet.FieldByName('DATAINICIO').AsDateTime < DateOf(DM.FDataHoraServidor) then
          begin
            if DM.qryAuxiliar.FieldByName('Atraso').AsInteger < 5 then
              begin
                JvDBGridLista.Canvas.Brush.Color := clYellow;
                JvDBGridLista.Canvas.Font.Color  := clRed;
              end
            else
              begin
                JvDBGridLista.Canvas.Brush.Color := clRed;
                JvDBGridLista.Canvas.Font.Color  := clWhite;
              end;
          end;
    end;

//  if not odd(JvDBGridLista.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'DTAINICIO1') then
//        if not (gdSelected in State) then
//          begin
//            JvDBGridLista.Canvas.Brush.Color := $00F7F8F9;
////          JvDBGridLista.Canvas.FillRect(Rect);
////          JvDBGridLista.DefaultDrawDataCell(rect,Column.Field,state);
//        end;
  JvDBGridLista.Canvas.FillRect(Rect);
  JvDBGridLista.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

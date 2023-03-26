unit UnTelaUsuariosAtivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, System.DateUtils, FireDAC.Stan.Param;

type
  TFrmTelaUsuariosAtivos = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    Timer1: TTimer;
    lblHoraServidor: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaUsuariosAtivos: TFrmTelaUsuariosAtivos;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaUsuariosAtivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryUsuariosAtivos.Close;
end;

procedure TFrmTelaUsuariosAtivos.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;
lblHoraServidor.Caption := FormatDateTime('dd/mm/yyyy hh:mm', DM.FDataHoraServidor);
Timer1.Enabled := True;

DM.qryUsuariosAtivos.Close;
//DM.qryUsuariosAtivos.Params[0].AsString := DM.FCodEmpresa;
DM.qryUsuariosAtivos.Open;

//DM.qryAuxiliar.Close;
//DM.qryAuxiliar.SQL.Clear;
//DM.qryAuxiliar.Filtered := False;
//DM.qryAuxiliar.SQL.Add('SELECT `usuario`.`CODIGO`, `usuario`.`LOGADO`, `usuario`.`QUEDAENERGIA` FROM `usuario`'
//                       + ' WHERE (`usuario`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') AND `usuario`.`LOGADO` = ''S'' ORDER BY `usuario`.`NOME`');
//DM.qryAuxiliar.Open;
//
//while not DM.qryUsuariosAtivos.Eof = True do
//  begin
//    if (DM.qryUsuariosAtivosDATAACESSO.AsDateTime) < (IncHour(DM.FDataHoraServidor, -12)) then
//      begin
//        if DM.qryAuxiliar.Locate('CODIGO', DM.qryUsuariosAtivosCODIGO.AsString, []) = True then
//          begin
//            DM.qryAuxiliar.Edit;
//            DM.qryAuxiliar.FieldByName('LOGADO').AsString := 'N';
//            DM.qryAuxiliar.FieldByName('QUEDAENERGIA').AsString := 'N';
//            DM.qryAuxiliar.Post;
//            DM.qryAuxiliar.Edit;
//          end;
//      end;
//    DM.qryUsuariosAtivos.Next;
//  end;
//if not (DM.qryAuxiliar.State in [dsBrowse]) then
//  begin
//    DM.qryAuxiliar.Post;
//
//    DM.qryUsuariosAtivos.Close;
//    DM.qryUsuariosAtivos.Params[0].AsString := DM.FCodEmpresa;
//    DM.qryUsuariosAtivos.Open;
//  end;
//
//
//DM.qryAuxiliar.Close;
end;

procedure TFrmTelaUsuariosAtivos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
if Key = 116 then
  begin
    DM.qryUsuariosAtivos.Close;
//    DM.qryUsuariosAtivos.Params[0].AsString := DM.FCodEmpresa;
    DM.qryUsuariosAtivos.Open;

//    DM.qryAuxiliar.Close;
//    DM.qryAuxiliar.SQL.Clear;
//    DM.qryAuxiliar.Filtered := False;
//    DM.qryAuxiliar.SQL.Add('SELECT `usuario`.`CODIGO`, `usuario`.`LOGADO`, `usuario`.`QUEDAENERGIA` FROM `usuario`'
//                           + ' WHERE (`usuario`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') AND `usuario`.`LOGADO` = ''S'' ORDER BY `usuario`.`NOME`');
//    DM.qryAuxiliar.Open;
//
//    while not DM.qryUsuariosAtivos.Eof = True do
//      begin
//        if (DM.qryUsuariosAtivosDATAACESSO.AsDateTime) < (IncHour(DM.FDataHoraServidor, -12)) then
//          begin
//            if DM.qryAuxiliar.Locate('CODIGO', DM.qryUsuariosAtivosCODIGO.AsString, []) = True then
//              begin
//                DM.qryAuxiliar.Edit;
//                DM.qryAuxiliar.FieldByName('LOGADO').AsString := 'N';
//                DM.qryAuxiliar.FieldByName('QUEDAENERGIA').AsString := 'N';
//                DM.qryAuxiliar.Post;
//                DM.qryAuxiliar.Edit;
//              end;
//          end;
//        DM.qryUsuariosAtivos.Next;
//      end;
//    if not (DM.qryAuxiliar.State in [dsBrowse]) then
//      begin
//        DM.qryAuxiliar.Post;
//
//        DM.qryUsuariosAtivos.Close;
//        DM.qryUsuariosAtivos.Params[0].AsString := DM.FCodEmpresa;
//        DM.qryUsuariosAtivos.Open;
//      end;
//
//    DM.qryAuxiliar.Close;
  end;
end;

procedure TFrmTelaUsuariosAtivos.Timer1Timer(Sender: TObject);
begin
  inherited;
lblHoraServidor.Caption := FormatDateTime('dd/mm/yyyy hh:mm:ss', IncSecond(StrToDateTime(lblHoraServidor.Caption), 1));
end;

end.

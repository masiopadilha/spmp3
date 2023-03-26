unit UnTelaCadOrdemServicoMObraProgHHDisp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Data.DB;

type
  TFrmTelaCadOrdemServicoMObraProgHHDisp = class(TFrmTelaPaiOkCancel)
    GrdHHDisp: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoMObraProgHHDisp: TFrmTelaCadOrdemServicoMObraProgHHDisp;

implementation

{$R *.dfm}


end.

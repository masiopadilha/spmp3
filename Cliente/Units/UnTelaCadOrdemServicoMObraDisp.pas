unit UnTelaCadOrdemServicoMObraDisp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TFrmTelaCadOrdemServicoMObraDisp = class(TFrmTelaPaiOkCancel)
    GrdMObra: TDBGrid;
    procedure GrdMObraDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoMObraDisp: TFrmTelaCadOrdemServicoMObraDisp;

implementation

{$R *.dfm}

uses UnCMWeb;

procedure TFrmTelaCadOrdemServicoMObraDisp.GrdMObraDblClick(Sender: TObject);
begin
  inherited;
BtnOK.OnClick(Sender);
end;

end.

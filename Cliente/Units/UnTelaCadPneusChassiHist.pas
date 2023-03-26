unit UnTelaCadPneusChassiHist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFrmTelaCadPneusChassiHist = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassiHist: TFrmTelaCadPneusChassiHist;

implementation

{$R *.dfm}

uses UnCMWeb;

procedure TFrmTelaCadPneusChassiHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
CMWeb.CDCadPneusChassiPneusHist.Close;
end;

procedure TFrmTelaCadPneusChassiHist.FormCreate(Sender: TObject);
begin
  inherited;
CMWeb.FDataSetParam    := CMWeb.CDCadPneusChassiPneusHist;
CMWeb.FDataSourceParam := CMWeb.DSCadPneusChassiPneusHist;
CMWeb.CDCadPneusChassiPneusHist.Open;
end;

end.

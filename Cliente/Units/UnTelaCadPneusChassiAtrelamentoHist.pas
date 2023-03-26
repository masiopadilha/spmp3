unit UnTelaCadPneusChassiAtrelamentoHist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadPneusChassiAtrelamentoHist = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassiAtrelamentoHist: TFrmTelaCadPneusChassiAtrelamentoHist;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadPneusChassiAtrelamentoHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryPneusChassiAtrelamentoHist.Close;
end;

procedure TFrmTelaCadPneusChassiAtrelamentoHist.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryPneusChassiAtrelamentoHist;
DM.FDataSourceParam := DM.dsPneusChassiAtrelamentoHist;
DM.qryPneusChassiAtrelamentoHist.Open;
end;

end.

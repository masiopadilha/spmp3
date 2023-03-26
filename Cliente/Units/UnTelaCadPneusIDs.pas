unit UnTelaCadPneusIDs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadPneusIDs = class(TFrmTelaPaiOkCancel)
    GrdPneus: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusIDs: TFrmTelaCadPneusIDs;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadPneusIDs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryPneusIDs.Close;
end;

procedure TFrmTelaCadPneusIDs.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryPneusIDs.Close;
DM.qryPneusIDs.Params[0].AsString := DM.FCodEmpresa;
DM.qryPneusIDs.Params[1].AsString := DM.qryPneusCODIGO.AsString;
DM.qryPneusIDs.Open;
end;

end.

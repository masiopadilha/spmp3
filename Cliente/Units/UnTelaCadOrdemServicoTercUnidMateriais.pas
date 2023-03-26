unit UnTelaCadOrdemServicoTercUnidMateriais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadOrdemServicoTercUnidMateriais = class(TFrmTelaPaiOkCancel)
    GrdMateriais: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercUnidMateriais: TFrmTelaCadOrdemServicoTercUnidMateriais;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadOrdemServicoTercUnidMateriais.BtnFecharClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnidMateriais.IsEmpty then Exit;

DM.qryOrdemServicoTercUnidMateriais.Edit;
DM.qryOrdemServicoTercUnidMateriais.Post;
end;

procedure TFrmTelaCadOrdemServicoTercUnidMateriais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryOrdemServicoTercUnidMateriais.Close;
end;

procedure TFrmTelaCadOrdemServicoTercUnidMateriais.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryOrdemServicoTercUnidMateriais;
DM.FDataSourceParam := DM.dsOrdemServicoTercUnidMateriais;
DM.FTela := 'CADTERCEIRIZADAS';

DM.qryOrdemServicoTercUnidMateriais.Open;
DM.qryOrdemServicoTercUnidMateriais.Edit;
end;

end.

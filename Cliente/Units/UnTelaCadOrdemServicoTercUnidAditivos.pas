unit UnTelaCadOrdemServicoTercUnidAditivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB;

type
  TFrmTelaCadOrdemServicoTercUnidAditivos = class(TFrmTelaPaiOkCancel)
    GrdAditivos: TDBGrid;
    MMotivo: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercUnidAditivos: TFrmTelaCadOrdemServicoTercUnidAditivos;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadOrdemServicoTercUnidAditivos.BtnFecharClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnidAditivos.IsEmpty then Exit;

DM.qryOrdemServicoTercUnidAditivos.Edit;
DM.qryOrdemServicoTercUnidAditivos.Post;

DM.qryOrdemServicoTercUnid.Edit;
DM.qryOrdemServicoTercUnidVALORFINAL.AsFloat := DM.qryOrdemServicoTercUnidAditivosTOTAL.Value + DM.qryOrdemServicoTercUnidVALORFINAL.AsFloat;
DM.qryOrdemServicoTercUnid.Post;
end;

procedure TFrmTelaCadOrdemServicoTercUnidAditivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryOrdemServicoTercUnidAditivos.Close;
end;

procedure TFrmTelaCadOrdemServicoTercUnidAditivos.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryOrdemServicoTercUnidAditivos;
DM.FDataSourceParam := DM.dsOrdemServicoTercUnidAditivos;
DM.FTela := 'CADTERCEIRIZADAS';

DM.qryOrdemServicoTercUnidAditivos.Open;
DM.qryOrdemServicoTercUnidAditivos.Edit;
end;

end.

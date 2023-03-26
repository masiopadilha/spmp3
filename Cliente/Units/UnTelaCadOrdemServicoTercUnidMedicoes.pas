unit UnTelaCadOrdemServicoTercUnidMedicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadOrdemServicoTercUnidMedicoes = class(TFrmTelaPaiOkCancel)
    GrdMedicoes: TDBGrid;
    procedure GrdMedicoesKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure GrdMedicoesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercUnidMedicoes: TFrmTelaCadOrdemServicoTercUnidMedicoes;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadOrdemServicoTercUnidMedicoes.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoTercUnidMedicoes.Open;
end;

procedure TFrmTelaCadOrdemServicoTercUnidMedicoes.GrdMedicoesDblClick(
  Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoTercUnidMedicoes.Delete;
end;

procedure TFrmTelaCadOrdemServicoTercUnidMedicoes.GrdMedicoesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (GrdMedicoes.SelectedIndex = 1) and (Key <> #13 ) then
  Key := #0;
end;

end.

unit UnTelaCadPecasReposicaoHist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB;

type
  TFrmTelaCadPecasReposicaoHist = class(TFrmTelaPaiOkCancel)
    GrdOS: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPecasReposicaoHist: TFrmTelaCadPecasReposicaoHist;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadPecasReposicaoHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryPecasReposicaoHistPecas.Close;
DM.qryPecasReposicaoHistEquip.Close;
DM.FParamAuxiliar[0] := EmptyStr;
DM.FParamAuxiliar[1] := EmptyStr;
end;

procedure TFrmTelaCadPecasReposicaoHist.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADPECASREP';
end;

end.

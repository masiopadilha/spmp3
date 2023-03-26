unit UnTelaCadEquipamentosImagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls;

type
  TFrmTelaCadEquipamentosImagens = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    ImgFotoEquip: TImage;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    lblDescricao: TDBText;
    Label2: TLabel;
    lblPontoInsp: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentosImagens: TFrmTelaCadEquipamentosImagens;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadEquipamentosImagens.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  DM.ExibeFoto(DM.qryEquipamentosImagens, 'FOTO', ImgFotoEquip);
end;

procedure TFrmTelaCadEquipamentosImagens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryEquipamentosImagens.Close;
end;

procedure TFrmTelaCadEquipamentosImagens.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryEquipamentosImagens.Open;

  DM.ExibeFoto(DM.qryEquipamentosImagens, 'FOTO', ImgFotoEquip);
end;

end.

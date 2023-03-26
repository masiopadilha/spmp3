unit UnTelaAcessoUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids,
  Data.DB;

type
  TFrmTelaAcessoUnidade = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaAcessoUnidade: TFrmTelaAcessoUnidade;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaAcessoUnidade.BtnOKClick(Sender: TObject);
begin
//  inherited;

end;

procedure TFrmTelaAcessoUnidade.FormActivate(Sender: TObject);
begin
//  inherited;
//DM.qryUsuarioUnidades.Filter := 'GROUP BY CODEMPRESA';
//DM.qryUsuarioUnidades.Filtered := True;
end;

procedure TFrmTelaAcessoUnidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
DM.qryUsuarioUnidades.Filtered := False;
end;

procedure TFrmTelaAcessoUnidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;

end;

procedure TFrmTelaAcessoUnidade.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
BtnOK.OnClick(Sender);
end;

end.

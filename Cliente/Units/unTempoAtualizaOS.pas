unit UnTempoAtualizaOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmTempoAtualizaOS = class(TForm)
    lblTempoRegressivo: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTempoAtualizaOS: TfrmTempoAtualizaOS;

implementation

{$R *.dfm}

uses UnDM;

procedure TfrmTempoAtualizaOS.FormCreate(Sender: TObject);
begin
Brush.Style := bsClear;
end;

procedure TfrmTempoAtualizaOS.FormShow(Sender: TObject);
begin
  lblTempoRegressivo.Caption := 'O sistema será desligado em 30 segundos.';
//  frmTempoAtualizaOS.TransparentColor := True;
end;

end.

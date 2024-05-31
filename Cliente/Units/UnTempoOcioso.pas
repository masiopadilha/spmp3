unit UnTempoOcioso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSistemaOcioso = class(TForm)
    lblTempoRegressivo: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSistemaOcioso: TfrmSistemaOcioso;

implementation

{$R *.dfm}

uses UnDM;

procedure TfrmSistemaOcioso.FormShow(Sender: TObject);
begin
lblTempoRegressivo.Caption := 'O sistema será desligado em 30 segundos.'
end;

end.

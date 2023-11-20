unit UnBaseHeranca;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  JvComponentBase,
  JvEnterTab,
  JvDBGrid,
  Vcl.StdCtrls,
  UnDM;

type
  TfrmBaseHeranca = class(TForm)
    PanelFundo: TPanel;
    procedure ImageCloseClick(Sender: TObject);
    procedure ImageMaximizeClick(Sender: TObject);
    procedure ImageMinimizeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AjustaLarguraMinTituloGrid(var aGrid: TJvDBGrid);

  end;

var
  frmBaseHeranca: TfrmBaseHeranca;

implementation

{$R *.dfm}


procedure TfrmBaseHeranca.AjustaLarguraMinTituloGrid(var aGrid: TJvDBGrid);
var
  I: Integer;
begin
  for I := 0 to aGrid.Columns.Count - 1 do
    begin
      if (Length(aGrid.Columns[i].Title.Caption) > 0) and (((aGrid.Columns[i].Width) - 10) / (Length(aGrid.Columns[i].Title.Caption)) < 10) then
        aGrid.Columns[i].Width := (length(aGrid.Columns[i].Title.Caption) * 10) + 15;
    end;
  aGrid.Refresh;
end;

procedure TfrmBaseHeranca.ImageCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmBaseHeranca.ImageMaximizeClick(Sender: TObject);
begin
  if self.WindowState = wsNormal then
    self.WindowState := wsMaximized
  else
    self.WindowState := wsNormal;
end;

procedure TfrmBaseHeranca.ImageMinimizeClick(Sender: TObject);
begin
  self.WindowState := wsMinimized;
end;
end.

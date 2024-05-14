unit unTelaInspVencRelatManut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unRelatorioPadrao, Data.DB, RLReport,
  Vcl.Imaging.pngimage;

type
  TFrmTelaInspVencRelatManut = class(TfrmRelatorioPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaInspVencRelatManut: TFrmTelaInspVencRelatManut;

implementation

{$R *.dfm}

end.

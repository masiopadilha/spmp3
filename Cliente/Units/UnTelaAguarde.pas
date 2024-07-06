unit UnTelaAguarde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExControls,
  JvWaitingProgress, JvWaitingGradient, Vcl.StdCtrls;

type
  TFrmTelaAguarde = class(TForm)
    PTexto: TPanel;
    LblTexto: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaAguarde: TFrmTelaAguarde;

implementation

{$R *.dfm}

end.

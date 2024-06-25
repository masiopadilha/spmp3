unit unTelaOutrosIndicadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart;

type
  TFrmTelaOutrosIndicadores = class(TFrmTelaPaiOKCancel)
    imgBackground: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ChartSolicTrabalho: TChart;
    Series2: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaOutrosIndicadores: TFrmTelaOutrosIndicadores;

implementation

{$R *.dfm}

end.

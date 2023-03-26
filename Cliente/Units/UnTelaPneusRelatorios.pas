unit UnTelaPneusRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TFrmTelaPneusRelatorios = class(TFrmTelaPaiOkCancel)
    PCPneus: TPageControl;
    TSID: TTabSheet;
    TSEquipamento: TTabSheet;
    TSPosicao: TTabSheet;
    TSFabricante: TTabSheet;
    TSFornecedor: TTabSheet;
    PID: TPanel;
    PEquipamento: TPanel;
    PPosicao: TPanel;
    PFabricante: TPanel;
    PFornecedor: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaPneusRelatorios: TFrmTelaPneusRelatorios;

implementation

{$R *.dfm}

end.

unit UnTelaCadControleTaxas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFrmTelaCadControleTaxas = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    Label6: TLabel;
    EdtDescEquipamento: TDBEdit;
    Label13: TLabel;
    EdtRenavam: TDBEdit;
    Label14: TLabel;
    Label5: TLabel;
    EdtChassi: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdtAnoFab: TDBEdit;
    EdtAnoModelo: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdtCategoria: TDBEdit;
    EdtPlaca: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadControleTaxas: TFrmTelaCadControleTaxas;

implementation

{$R *.dfm}

end.

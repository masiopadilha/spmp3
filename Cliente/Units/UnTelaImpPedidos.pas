unit UnTelaImpPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Datasnap.DBClient;

type
  TFrmTelaImpPedidos = class(TFrmTelaPaiOkCancel)
    PBase: TPanel;
    DBGrid1: TDBGrid;
    CDPecas: TClientDataSet;
    DSPecas: TDataSource;
    CDPecasCODIGO: TStringField;
    CDPecasDESCRICAO: TStringField;
    CDPecasCODFAMILIAPECA: TStringField;
    CDPecasDESCFAMILIAPECA: TStringField;
    CDPecasPRECO: TFloatField;
    CDPecasQUANTIDADE: TIntegerField;
    BtnArquivo: TButton;
    OpenDialog1: TOpenDialog;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaImpPedidos: TFrmTelaImpPedidos;
  LDataImport: TDatetime;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaImpPedidos.BtnArquivoClick(Sender: TObject);
var
Linha: Integer;
begin
  inherited;
Try

  if OpenDialog1.Execute then
    DM.XlsToStringGrid(StringGrid1,OpenDialog1.FileName);

  if OpenDialog1.FileName = EmptyStr then Exit;

  DM.MSGAguarde('');

  for Linha := 1 to StringGrid1.RowCount - 1 do
    begin
      CDPecas.Append;
      CDPecasCODFAMILIAPECA.AsString  := StringGrid1.Cells[1, Linha];
      CDPecasDESCFAMILIAPECA.AsString := StringGrid1.Cells[2, Linha];
      CDPecasCODIGO.AsString          := StringGrid1.Cells[3, Linha];
      CDPecasDESCRICAO.AsString       := StringGrid1.Cells[4, Linha];
      CDPecasPRECO.AsString           := StringGrid1.Cells[6, Linha];
      CDPecasQUANTIDADE.AsString      := '0';
      CDPecas.Post;
    end;

Except
  Application.MessageBox('Não foi possível realizar a importação', 'SPMP3', MB_ICONWARNING + MB_OK);
  DM.MSGAguarde('', False);
End;
DM.MSGAguarde('', False);
end;

procedure TFrmTelaImpPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
CDPecas.Close;
end;

procedure TFrmTelaImpPedidos.FormCreate(Sender: TObject);
begin
  inherited;
CDPecas.Close; CDPecas.CreateDataSet; CDPecas.Open;
end;

end.

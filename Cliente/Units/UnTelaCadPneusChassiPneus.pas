unit UnTelaCadPneusChassiPneus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadPneusChassiPneus = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    EdtConsulta: TEdit;
    Button6: TButton;
    BtnImprimir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassiPneus: TFrmTelaCadPneusChassiPneus;

implementation

{$R *.dfm}

uses UnTelaCadPneusChassi, UnTelaCadPneusChassiPneusHist,
  UnDmRelatorios, UnDM;

procedure TFrmTelaCadPneusChassiPneus.BtnImprimirClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxRPneusChassiPneus.ShowReport();
end;

procedure TFrmTelaCadPneusChassiPneus.BtnOKClick(Sender: TObject);
begin
  inherited;
if DM.qryPneusChassiPneus.IsEmpty = False then
  FrmTelaCadPneusChassi.FIDPneu := DM.qryPneusChassiPneusID.AsInteger
else
  FrmTelaCadPneusChassi.FIDPneu := StrToInt(EdtConsulta.Text)
end;

procedure TFrmTelaCadPneusChassiPneus.Button6Click(Sender: TObject);
begin
  inherited;
  Try
    Application.CreateForm(TFrmTelaCadPneusChassiPneusHist, FrmTelaCadPneusChassiPneusHist);
    DM.qryPneusChassiPneusHist.Filtered := False;
    DM.qryPneusChassiPneusHist.Filter   := 'ID = ' + QuotedStr(DM.qryPneusChassiPneusID.AsString);
    DM.qryPneusChassiPneusHist.Filtered := True;
    FrmTelaCadPneusChassiPneusHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPneusChassiPneusHist);
    DM.qryPneusChassiPneusHist.Filtered := False;
  End;
end;

procedure TFrmTelaCadPneusChassiPneus.EdtConsultaChange(Sender: TObject);
begin
  inherited;
if EdtConsulta.Text <> EmptyStr then
  begin
    DM.qryPneusChassiPneus.Filter   := EmptyStr;
    DM.qryPneusChassiPneus.Filtered := False;
    //DM.qryPneusChassiPneus.Filter   := 'ID = '+QuotedStr(EdtConsulta.Text);
    DM.qryPneusChassiPneus.Filter   := 'CODPNEU = '+QuotedStr(DM.qryPneusChassiPosicoesCODPNEU.AsString) + ' AND POSICAO = NULL AND ID = '+QuotedStr(EdtConsulta.Text);
    DM.qryPneusChassiPneus.Filtered := True;
  end
else
  begin
    DM.qryPneusChassiPneus.Filter   := EmptyStr;
    DM.qryPneusChassiPneus.Filtered := False;
  end;
end;

procedure TFrmTelaCadPneusChassiPneus.EdtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if CharInSet(key, [#13,#8,#9,'0','1','2','3','4','5','6','7','8','9']) then
  begin
    if Key = #13 then
      begin
        Key := #0;
        SelectNext(ActiveControl,True,True);
      end;
  end
else
  begin
    Key := #0;
  end;
end;

procedure TFrmTelaCadPneusChassiPneus.FormCreate(Sender: TObject);
begin
  inherited;
//DM.qryPneusChassiPneus.Filtered := False;
end;

end.


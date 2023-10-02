unit UnTelaCadPneusChassiPneusHist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadPneusChassiPneusHist = class(TFrmTelaPaiOkCancel)
    GrdHistorico: TDBGrid;
    Button6: TButton;
    procedure Button6Click(Sender: TObject);
    procedure GrdHistoricoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassiPneusHist: TFrmTelaCadPneusChassiPneusHist;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnTelaConsulta, UnDM;

procedure TFrmTelaCadPneusChassiPneusHist.Button6Click(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.qryPneusChassiPneusHist.IsEmpty = False then
  DmRelatorios.frxRPneusChassiPneusHist.ShowReport();
end;

procedure TFrmTelaCadPneusChassiPneusHist.GrdHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (Key = #13) then
  begin
    if (GrdHistorico.SelectedIndex = 1) then
      begin
        DM.FTabela_auxiliar  := 8201;
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          FreeAndNil(FrmTelaAuxiliar);
          if DM.FCodCombo <> EmptyStr then
            begin
              DM.qryPneusChassiPneusHist.Filtered := False;
              DM.qryPneusChassiPneusHist.Filter   := 'EQUIPAMENTO = ' + QuotedStr(DM.FValorCombo);
              DM.qryPneusChassiPneusHist.Filtered := True;
            end
          else
            begin
              DM.qryPneusChassiPneusHist.Filter   := '';
              DM.qryPneusChassiPneusHist.Filtered := False;
            end;
        End;
      end;
    if (GrdHistorico.SelectedIndex = 2) then
      begin
        if DM.qryPneusChassiPneusHist.IsEmpty = True then Exit;

        DM.FParamAuxiliar[1] := DM.qryPneusChassiPneusHistCODCHASSI.AsString;
        DM.FTabela_auxiliar  := 94;
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          FreeAndNil(FrmTelaAuxiliar);
          if DM.FCodCombo <> EmptyStr then
            begin
              DM.qryPneusChassiPneusHist.Filtered := False;
              DM.qryPneusChassiPneusHist.Filter   := 'POSICAO = ' + QuotedStr(DM.FParamAuxiliar[2]);
              DM.qryPneusChassiPneusHist.Filtered := True;
            end
          else
            begin
              DM.qryPneusChassiPneusHist.Filter   := '';
              DM.qryPneusChassiPneusHist.Filtered := False;
            end;
        End;
      end;
  end;
end;

end.

unit UnTelaCadOrdemServicoMObraExecDisp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls;

type
  TFrmTelaCadOrdemServicoMObraDisp = class(TFrmTelaPaiOkCancel)
    GrdMaodeObraDisp: TDBGrid;
    PImagem: TPanel;
    ImgFotoFunc: TImage;
    LblApelido: TDBText;
    procedure GrdMaodeObraDispKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdMaodeObraDispDblClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GrdMaodeObraDispKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoMObraDisp: TFrmTelaCadOrdemServicoMObraDisp;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadOrdemServicoMObraDisp.BtnOKClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TFrmTelaCadOrdemServicoMObraDisp.FormCreate(Sender: TObject);
begin
  inherited;
  DM.ExibeFoto(DM.qryOrdemServicoMObraDisp, 'IMAGEM', FrmTelaCadOrdemServicoMObraDisp.ImgFotoFunc);
end;

procedure TFrmTelaCadOrdemServicoMObraDisp.GrdMaodeObraDispDblClick(Sender: TObject);
begin
  inherited;
BtnOK.OnClick(Sender);
end;

procedure TFrmTelaCadOrdemServicoMObraDisp.GrdMaodeObraDispKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadOrdemServicoMObraDisp.GrdMaodeObraDispKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (Key = #13) and ((GrdMaodeObraDisp.SelectedIndex = 0) or (GrdMaodeObraDisp.SelectedIndex = 1)) then
  begin
    DM.FTabela_auxiliar  := 300;
    DM.FNomeConsulta     := 'Funcionários';

    if GrdMaodeObraDisp.SelectedIndex = 0 then
      DM.FParamAuxiliar[1] := 'MATRICULA';
    if GrdMaodeObraDisp.SelectedIndex = 1 then
      DM.FParamAuxiliar[1] := 'NOME';

    if DM.ConsultarCombo <> EmptyStr then
      begin
        if DM.FCodCombo <> '' then
          begin
            GrdMaodeObraDisp.DataSource.DataSet.Filter := '';
            GrdMaodeObraDisp.DataSource.DataSet.Filter := 'MATRICULA = ' + QuotedStr(DM.FCodCombo);
            GrdMaodeObraDisp.DataSource.DataSet.Filtered := True;
          end
        else
          begin
            GrdMaodeObraDisp.DataSource.DataSet.Filter := '';
            GrdMaodeObraDisp.DataSource.DataSet.Filtered := False;
          end
      end
    else
      begin
        GrdMaodeObraDisp.DataSource.DataSet.Filter := '';
        GrdMaodeObraDisp.DataSource.DataSet.Filtered := False;
      end
  end;

end;

end.

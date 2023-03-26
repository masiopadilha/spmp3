unit UnTelaCadManutProgEquipPartesItensEsp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadManutProgEquipPartesItensEsp = class(TFrmTelaPaiOKCancel)
    GrdCadastro: TDBGrid;
    GrdItens: TDBGrid;
    procedure GrdItensDblClick(Sender: TObject);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdItensKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgEquipPartesItensEsp: TFrmTelaCadManutProgEquipPartesItensEsp;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadManutProgEquipPartesItensEsp.BtnFecharClick(
  Sender: TObject);
begin
 inherited;
 DM.qryManutProgEquipPartes.First;
while not DM.qryManutProgEquipPartes.Eof = True do
  begin
    DM.qryManutProgEquipItensEsp.First;
    while not DM.qryManutProgEquipItensEsp.Eof = True do
      begin
        if (DM.qryManutProgEquipItensEspITEM.AsString = '') or (DM.qryManutProgEquipItensEspDESCINSPECAO.AsString = '') then
          begin
            DM.qryManutProgEquipItensEsp.Delete;
          end;
        DM.qryManutProgEquipItensEsp.Next;
      end;
    DM.qryManutProgEquipPartes.Next;
  end;
DM.qryManutProgEquipItensEsp.Close;
DM.qryManutProgEquipItensEsp.Open;
end;

procedure TFrmTelaCadManutProgEquipPartesItensEsp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryManutProgEquipItensEsp.Filtered := False;
  DM.qryManutProgEquipItensEsp.Close;
  DM.qryManutProgEquipItensEsp.Open;

end;

procedure TFrmTelaCadManutProgEquipPartesItensEsp.GrdCadastroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadManutProgEquipPartesItensEsp.GrdItensDblClick(
  Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

if DM.qryManutProgEquipItensEsp.IsEmpty = False then
  if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = mrYes then
    DM.qryManutProgEquipItensEsp.Delete;
end;

procedure TFrmTelaCadManutProgEquipPartesItensEsp.GrdItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadManutProgEquipPartesItensEsp.GrdItensKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (GrdItens.SelectedIndex = 2) or (GrdItens.SelectedIndex = 4) then
  if (Key <> #0) and (Key <> #9) then
    Key := #0;
end;

end.

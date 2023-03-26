unit UnTelaCadLubrificProgEquipPartesItensEsp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadLubrificProgEquipPartesItensEsp = class(TFrmTelaPaiOKCancel)
    GrdCadastro: TDBGrid;
    GrdItens: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdItensDblClick(Sender: TObject);
    procedure GrdItensKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadLubrificProgEquipPartesItensEsp: TFrmTelaCadLubrificProgEquipPartesItensEsp;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadLubrificProgEquipPartesItensEsp.BtnFecharClick(
  Sender: TObject);
begin
  inherited;

DM.qryLubrificProgEquipPartes.First;
while not DM.qryLubrificProgEquipPartes.Eof = True do
  begin
    DM.qryLubrificProgEquipItensEsp.First;
    while not DM.qryLubrificProgEquipItensEsp.Eof = True do
      begin
        if (DM.qryLubrificProgEquipItensEspITEM.AsString = '') or (DM.qryLubrificProgEquipItensEspDESCINSPECAO.AsString = '') then
          begin
            DM.qryLubrificProgEquipItensEsp.Delete;
          end;
        DM.qryLubrificProgEquipItensEsp.Next;
      end;
    DM.qryLubrificProgEquipPartes.Next;
  end;
DM.qryLubrificProgEquipItensEsp.Close;
DM.qryLubrificProgEquipItensEsp.Open;
end;

procedure TFrmTelaCadLubrificProgEquipPartesItensEsp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryLubrificProgEquipItensEsp.Filtered := False;
  DM.qryLubrificProgEquipItensEsp.Close;
  DM.qryLubrificProgEquipItensEsp.Open;
end;

procedure TFrmTelaCadLubrificProgEquipPartesItensEsp.GrdCadastroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadLubrificProgEquipPartesItensEsp.GrdItensDblClick(
  Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

if DM.qryLubrificProgEquipItensEsp.IsEmpty = False then
  if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = mrYes then
    DM.qryLubrificProgEquipItensEsp.Delete;
end;

procedure TFrmTelaCadLubrificProgEquipPartesItensEsp.GrdItensKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (GrdItens.SelectedIndex = 2) or (GrdItens.SelectedIndex = 4) then
  if (Key <> #0) and (Key <> #9) then
    Key := #0;
end;

end.

unit UnTelaCadLubrificProgFamEquipPartesItens;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;
type
  TFrmTelaCadLubrificProgFamEquipPartesItens = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    GrdItens: TDBGrid;
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdCadastroTitleClick(Column: TColumn);
    procedure GrdItensTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
    procedure GrdItensDblClick(Sender: TObject);
    procedure GrdItensKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadLubrificProgFamEquipPartesItens: TFrmTelaCadLubrificProgFamEquipPartesItens;
implementation
{$R *.dfm}
uses UnDM;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.BtnFecharClick(
  Sender: TObject);
begin
  inherited;
DM.qryLubrificProgFamEquipPartes.First;
while not DM.qryLubrificProgFamEquipPartes.Eof = True do
  begin
    DM.qryLubrificProgFamEquipItens.First;
    while not DM.qryLubrificProgFamEquipItens.Eof = True do
      begin
        if DM.qryLubrificProgFamEquipItensITEM.AsString = '' then
          begin
            DM.qryLubrificProgFamEquipItens.Delete;
          end;
        DM.qryLubrificProgFamEquipItens.Next;
      end;
    DM.qryLubrificProgFamEquipPartes.Next;
  end;
DM.qryLubrificProgFamEquipItensTodos.Close;
DM.qryLubrificProgFamEquipItensTodos.Open;
end;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryLubrificProgFamEquipItens.Close;
DM.qryLubrificProgFamEquipPartes.Close;
end;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.FormCreate(
  Sender: TObject);
begin
  inherited;
  DM.qryLubrificProgFamEquipPartes.Close;
  //DM.qryLubrificProgFamEquipPartes.Params[0].AsString := DM.FCodEmpresa;
  //DM.qryLubrificProgFamEquipPartes.Params[1].AsString := DM.qryLubrificProgFamEquipCODIGO.AsString;
  DM.qryLubrificProgFamEquipPartes.Open;
  DM.qryLubrificProgFamEquipItens.Close;
  DM.qryLubrificProgFamEquipItens.Open;
  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    GrdItens.ReadOnly := True;
    Exit;
  end;

  if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    GrdItens.ReadOnly := True;
    DM.MSGAguarde('', False);
    Exit;
  end;
end;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.GrdCadastroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.GrdCadastroTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryLubrificProgFamEquipPartes);
end;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.GrdItensDblClick(
  Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;
if DM.qryManutProgFamEquipItens.IsEmpty = False then
  if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = mrYes then
    DM.qryLubrificProgFamEquipItens.Delete;
end;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.GrdItensKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (GrdItens.SelectedIndex = 2) or (GrdItens.SelectedIndex = 4) then
  if (Key <> #0) and (Key <> #9) then
    Key := #0;
end;
procedure TFrmTelaCadLubrificProgFamEquipPartesItens.GrdItensTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryLubrificProgFamEquipItens);
end;
end.

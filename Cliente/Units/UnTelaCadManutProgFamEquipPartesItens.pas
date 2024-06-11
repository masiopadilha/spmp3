unit UnTelaCadManutProgFamEquipPartesItens;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;
type
  TFrmTelaCadManutProgFamEquipPartesItens = class(TFrmTelaPaiOKCancel)
    GrdCadastro: TDBGrid;
    GrdItens: TDBGrid;
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdItensTitleClick(Column: TColumn);
    procedure GrdCadastroTitleClick(Column: TColumn);
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
  FrmTelaCadManutProgFamEquipPartesItens: TFrmTelaCadManutProgFamEquipPartesItens;
implementation
{$R *.dfm}
uses UnDM;
procedure TFrmTelaCadManutProgFamEquipPartesItens.BtnFecharClick(
  Sender: TObject);
begin
  inherited;
DM.qryManutProgFamEquipPartes.First;
while not DM.qryManutProgFamEquipPartes.Eof = True do
  begin
    DM.qryManutProgFamEquipItens.First;
    while not DM.qryManutProgFamEquipItens.Eof = True do
      begin
        if (DM.qryManutProgFamEquipItensITEM.AsString = '') or (DM.qryManutProgFamEquipItensDESCINSPECAO.AsString = '') then
          begin
            DM.qryManutProgFamEquipItens.Delete;
          end;
        DM.qryManutProgFamEquipItens.Next;
      end;
    DM.qryManutProgFamEquipPartes.Next;
  end;
DM.qryManutProgFamEquipItensTodos.Close;
DM.qryManutProgFamEquipItensTodos.Open;
end;
procedure TFrmTelaCadManutProgFamEquipPartesItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryManutProgFamEquipItens.Close;
DM.qryManutProgFamEquipPartes.Close;
end;
procedure TFrmTelaCadManutProgFamEquipPartesItens.FormCreate(Sender: TObject);
begin
  inherited;
  DM.FTela := 'CADMANUTPROG';
  DM.FDataSetParam    := DM.qryManutProgFamEquipItens;
  DM.FDataSourceParam := DM.dsManutProgFamEquipItens;
  DM.qryManutProgFamEquipPartes.Close;
  //DM.qryManutProgFamEquipPartes.Params[0].AsString := DM.FCodEmpresa;
  //DM.qryManutProgFamEquipPartes.Params[1].AsString := DM.qryManutProgFamEquipCODIGO.AsString;
  DM.qryManutProgFamEquipPartes.Open;
  DM.qryManutProgFamEquipItens.Close;
  DM.qryManutProgFamEquipItens.Open;
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
procedure TFrmTelaCadManutProgFamEquipPartesItens.GrdCadastroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;
procedure TFrmTelaCadManutProgFamEquipPartesItens.GrdCadastroTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryManutProgFamEquipPartes);
end;
procedure TFrmTelaCadManutProgFamEquipPartesItens.GrdItensDblClick(
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
    DM.qryManutProgFamEquipItens.Delete;
end;
procedure TFrmTelaCadManutProgFamEquipPartesItens.GrdItensKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (GrdItens.SelectedIndex = 2) or (GrdItens.SelectedIndex = 4) then
  if (Key <> #0) and (Key <> #9) then
    Key := #0;
end;
procedure TFrmTelaCadManutProgFamEquipPartesItens.GrdItensTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryManutProgFamEquipItens);
end;
end.

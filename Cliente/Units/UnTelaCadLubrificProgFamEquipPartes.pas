unit UnTelaCadLubrificProgFamEquipPartes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadLubrificProgFamEquipPartes = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdCadastroTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadLubrificProgFamEquipPartes: TFrmTelaCadLubrificProgFamEquipPartes;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadLubrificProgFamEquipPartes.BtnFecharClick(Sender: TObject);
begin
  inherited;
DM.qryLubrificProgFamEquipPartes.First;
while not DM.qryLubrificProgFamEquipPartes.Eof = True do
  begin
    if DM.qryLubrificProgFamEquipPartesDESCRICAO.AsString = '' then
      DM.qryLubrificProgFamEquipPartes.Delete;
    DM.qryLubrificProgFamEquipPartes.Next;
  end;
end;

procedure TFrmTelaCadLubrificProgFamEquipPartes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryLubrificProgFamEquipPartes.Close;
end;

procedure TFrmTelaCadLubrificProgFamEquipPartes.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryLubrificProgFamEquipPartes.Params[0].AsString := DM.FCodEmpresa;
  DM.qryLubrificProgFamEquipPartes.Params[1].AsString := DM.qryLubrificProgFamEquipCODIGO.AsString;
  DM.qryLubrificProgFamEquipPartes.Open;

  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    GrdCadastro.ReadOnly := True;
    Exit;
  end;

  if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    GrdCadastro.ReadOnly := True;
    DM.MSGAguarde('', False);
    Exit;
  end;

end;

procedure TFrmTelaCadLubrificProgFamEquipPartes.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

if DM.qryLubrificProgFamEquipPartes.IsEmpty = False then
if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = mrYes then
    DM.qryLubrificProgFamEquipPartes.Delete;
end;

procedure TFrmTelaCadLubrificProgFamEquipPartes.GrdCadastroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadLubrificProgFamEquipPartes.GrdCadastroTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryLubrificProgFamEquipPartes);
end;

end.

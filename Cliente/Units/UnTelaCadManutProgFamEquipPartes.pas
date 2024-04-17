unit UnTelaCadManutProgFamEquipPartes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, FireDAC.Stan.Param,
  Vcl.DBCtrls;

type
  TFrmTelaCadManutProgFamEquipPartes = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdCadastroTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgFamEquipPartes: TFrmTelaCadManutProgFamEquipPartes;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadManutProgFamEquipPartes.BtnFecharClick(Sender: TObject);
begin
  inherited;
DM.qryManutProgFamEquipPartes.First;
while not DM.qryManutProgFamEquipPartes.Eof = True do
  begin
    if DM.qryManutProgFamEquipPartesDESCRICAO.AsString = '' then
      DM.qryManutProgFamEquipPartes.Delete;
    DM.qryManutProgFamEquipPartes.Next;
  end;
DM.qryManutProgFamEquipItens.Close;
DM.qryManutProgFamEquipPartes.Close;
end;

procedure TFrmTelaCadManutProgFamEquipPartes.FormCreate(Sender: TObject);
begin
  inherited;
  DM.FTela := 'CADMANUTPROG';
  DM.FDataSetParam    := DM.qryManutProgFamEquipPartes;
  DM.FDataSourceParam := DM.dsManutProgFamEquipPartes;
  DM.qryManutProgFamEquipPartes.Close;
  //DM.qryManutProgFamEquipPartes.Params[0].AsString := DM.FCodEmpresa;
  //DM.qryManutProgFamEquipPartes.Params[1].AsString := DM.qryManutProgFamEquipCODIGO.AsString;
  DM.qryManutProgFamEquipPartes.Open;

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

procedure TFrmTelaCadManutProgFamEquipPartes.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

if DM.qryManutProgFamEquipPartes.IsEmpty = False then
if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = mrYes then
    DM.qryManutProgFamEquipPartes.Delete;
end;

procedure TFrmTelaCadManutProgFamEquipPartes.GrdCadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;

end;

procedure TFrmTelaCadManutProgFamEquipPartes.GrdCadastroTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryManutProgFamEquipPartes);
end;

end.

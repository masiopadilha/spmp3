unit UnTelaCadEquipamentosEsp;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, FireDAC.Stan.Param;
type
  TFrmTelaCadEquipamentosEsp = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCadastroDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadEquipamentosEsp: TFrmTelaCadEquipamentosEsp;
implementation
{$R *.dfm}
uses UnTelaConsulta, UnDM;
procedure TFrmTelaCadEquipamentosEsp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
if DM.qryEquipamentosEsp.Active = True then
  begin
    DM.qryEquipamentosEsp.Close;
  end;
end;
procedure TFrmTelaCadEquipamentosEsp.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosEsp.Close;
DM.qryEquipamentosEsp.Open;
DM.qryEquipamentosEsp.Edit;
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
procedure TFrmTelaCadEquipamentosEsp.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;
DM.qryEquipamentosEsp.Delete;
end;
procedure TFrmTelaCadEquipamentosEsp.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (Key = #13) then
  begin
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

    DM.FTabela_auxiliar := 300;
    if (GrdCadastro.SelectedIndex = 0) then
      begin
        DM.FParamAuxiliar[1] := 'MATRICULA';
      end
    else
    if (GrdCadastro.SelectedIndex = 1) then
      begin
        DM.FParamAuxiliar[1] := 'NOME';
      end
    else
      Exit;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryEquipamentosEsp.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryEquipamentosEsp.Locate('MATRICULA', DM.FCodCombo, []) = False then
            begin
              DM.qryEquipamentosEsp.Append;
              DM.qryEquipamentosEspCODEMPRESA.AsString     := DM.FCodEmpresa;
              DM.qryEquipamentosEspCODEQUIPAMENTO.AsString := DM.FParamAuxiliar[0];
              DM.qryEquipamentosEspMATRICULA.AsString      := DM.FCodCombo;
              DM.qryEquipamentosEspNOME.AsString           := DM.FValorCombo;
              DM.qryEquipamentosEspEQUIPAMENTO.AsString    := DM.FValorCombo;
              DM.qryEquipamentosEsp.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;
end.

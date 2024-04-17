unit UnTelaCadLubrificProgEquipMObra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, UnDM;

type
  TFrmTelaCadLubrificProgEquipMObra = class(TFrmTelaPaiOKCancel)
    GrdEquipe: TDBGrid;
    GrdEquipeMObra: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdEquipeDblClick(Sender: TObject);
    procedure GrdEquipeMObraDblClick(Sender: TObject);
    procedure GrdEquipeMObraKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadLubrificProgEquipMObra: TFrmTelaCadLubrificProgEquipMObra;

implementation

{$R *.dfm}

uses UnTelaConsulta;

procedure TFrmTelaCadLubrificProgEquipMObra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryLubrificProgEquipEquipeMObra.Close;
  DM.qryLubrificProgEquipEquipe.Close;
end;

procedure TFrmTelaCadLubrificProgEquipMObra.FormCreate(Sender: TObject);
begin
  inherited;
  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    GrdEquipe.ReadOnly := True;
    GrdEquipeMObra.ReadOnly := True;
    Exit;
  end;

  if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    GrdEquipe.ReadOnly := True;
    GrdEquipeMObra.ReadOnly := True;
    DM.MSGAguarde('', False);
    Exit;
  end;

  DM.qryLubrificProgEquipEquipe.Open;
  DM.qryLubrificProgEquipEquipeMObra.Open;
end;

procedure TFrmTelaCadLubrificProgEquipMObra.GrdEquipeDblClick(Sender: TObject);
begin
  inherited;
  if DM.qryLubrificProgEquipEquipe.IsEmpty = True then Exit;

  DM.qryLubrificProgEquipEquipe.Delete;
end;

procedure TFrmTelaCadLubrificProgEquipMObra.GrdEquipeMObraDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryLubrificProgEquipEquipeMObra.IsEmpty = True then Exit;

  DM.qryLubrificProgEquipEquipeMObra.Delete;
end;

procedure TFrmTelaCadLubrificProgEquipMObra.GrdEquipeMObraKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if DM.qryLubrificProgEquipEquipeCODEQUIPE.IsNull = True then
  begin
    GrdEquipe.SelectedIndex := 0;
    GrdEquipe.SetFocus;
    Exit;
  end;
  if ((GrdEquipeMObra.SelectedIndex = 0) and (Key <> #13)) or (DM.qryLubrificProgEquipEquipe.IsEmpty = True) then
  begin
    Key := #0;
    Exit;
  end;
  if (Key = #13) and (GrdEquipeMObra.SelectedIndex = 0) then
  begin
    if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
      DM.MSGAguarde('', False);
      GrdEquipeMObra.ReadOnly := True;
      Exit;
    end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
      GrdEquipeMObra.ReadOnly := True;
      DM.MSGAguarde('', False);
      Exit;
    end;

    DM.FTabela_auxiliar := 130;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryLubrificProgEquipEquipeMObra.Edit;
      if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryLubrificProgEquipEquipeMObra.Locate('CODCARGO', DM.FCodCombo, []) = False then
        begin
          DM.qryLubrificProgEquipEquipe.Edit;
          DM.qryLubrificProgEquipEquipe.Post;
          DM.qryLubrificProgEquipEquipe.Edit;
          DM.qryLubrificProgEquipEquipeMObra.Append;
          DM.qryLubrificProgEquipEquipeMObraCODEQUIPE.AsInteger      := DM.qryLubrificProgEquipEquipeCODIGO.AsInteger;
          DM.qryLubrificProgEquipEquipeMObraCODEMPRESA.AsString      := DM.FCodEmpresa;
          DM.qryLubrificProgEquipEquipeMObraCODLUBRIFICPROGEQUIP.AsString := DM.FParamAuxiliar[0];
          DM.qryLubrificProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat   := DM.qryLubrificProgEquipEquipeTEMPO.AsFloat;
          DM.qryLubrificProgEquipEquipeMObraCODCARGO.AsString        := DM.FCodCombo;
          DM.qryLubrificProgEquipEquipeMObraCARGO.AsString           := DM.FValorCombo;
          DM.qryLubrificProgEquipEquipeMObra.Post;
          GrdEquipeMObra.SelectedIndex := 1;
        end;
      end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;

end;

end.

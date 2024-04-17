unit UnTelaCadManutProgEquipMObra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, UnDM;

type
  TFrmTelaCadManutProgEquipMObra = class(TFrmTelaPaiOKCancel)
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
  FrmTelaCadManutProgEquipMObra: TFrmTelaCadManutProgEquipMObra;

implementation

{$R *.dfm}

uses UnTelaConsulta;

procedure TFrmTelaCadManutProgEquipMObra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryManutProgEquipEquipeMObra.Close;
  DM.qryManutProgEquipEquipe.Close;
end;

procedure TFrmTelaCadManutProgEquipMObra.FormCreate(Sender: TObject);
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

  DM.qryManutProgEquipEquipe.Open;
  DM.qryManutProgEquipEquipeMObra.Open;
end;

procedure TFrmTelaCadManutProgEquipMObra.GrdEquipeDblClick(Sender: TObject);
begin
  inherited;
  if DM.qryManutProgEquipEquipe.IsEmpty = True then Exit;

  DM.qryManutProgEquipEquipe.Delete;
end;

procedure TFrmTelaCadManutProgEquipMObra.GrdEquipeMObraDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryManutProgEquipEquipeMObra.IsEmpty = True then Exit;

  DM.qryManutProgEquipEquipeMObra.Delete;
end;

procedure TFrmTelaCadManutProgEquipMObra.GrdEquipeMObraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if DM.qryManutProgEquipEquipeCODEQUIPE.IsNull = True then
  begin
    GrdEquipe.SelectedIndex := 0;
    GrdEquipe.SetFocus;
    Exit;
  end;
  if ((GrdEquipeMObra.SelectedIndex = 0) and (Key <> #13)) or (DM.qryManutProgEquipEquipe.IsEmpty = True) then
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
      DM.qryManutProgEquipEquipeMObra.Edit;
      if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryManutProgEquipEquipeMObra.Locate('CODCARGO', DM.FCodCombo, []) = False then
        begin
          DM.qryManutProgEquipEquipe.Edit;
          DM.qryManutProgEquipEquipe.Post;
          DM.qryManutProgEquipEquipe.Edit;
          DM.qryManutProgEquipEquipeMObra.Append;
          DM.qryManutProgEquipEquipeMObraCODEQUIPE.AsInteger      := DM.qryManutProgEquipEquipeCODIGO.AsInteger;
          DM.qryManutProgEquipEquipeMObraCODEMPRESA.AsString      := DM.FCodEmpresa;
          DM.qryManutProgEquipEquipeMObraCODMANUTPROGEQUIP.AsString := DM.FParamAuxiliar[0];
          DM.qryManutProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat   := DM.qryManutProgEquipEquipeTEMPO.AsFloat;
          DM.qryManutProgEquipEquipeMObraCODCARGO.AsString        := DM.FCodCombo;
          DM.qryManutProgEquipEquipeMObraCARGO.AsString           := DM.FValorCombo;
          DM.qryManutProgEquipEquipeMObra.Post;
          GrdEquipeMObra.SelectedIndex := 1;
        end;
      end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

unit UnTelaCadEquipamentosArqTec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadEquipamentosArqTec = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCadastroDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentosArqTec: TFrmTelaCadEquipamentosArqTec;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadEquipamentosArqTec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
if DM.qryEquipamentosArqTec.Active = True then
  begin
    DM.qryEquipamentosArqTec.Close;
  end;
end;

procedure TFrmTelaCadEquipamentosArqTec.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosArqTec.Close;
DM.qryEquipamentosArqTec.Open;
DM.qryEquipamentosArqTec.Edit;

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

procedure TFrmTelaCadEquipamentosArqTec.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;
DM.qryEquipamentosArqTec.Delete;
end;

procedure TFrmTelaCadEquipamentosArqTec.GrdCadastroKeyPress(Sender: TObject;
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

    DM.FTabela_auxiliar := 37;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryEquipamentosArqTec.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryEquipamentosArqTec.Locate('CODARQUIVO', DM.FCodCombo, []) = False then
            begin
              DM.qryEquipamentosArqTec.Append;
              DM.qryEquipamentosArqTecCODEMPRESA.AsString     := DM.FCodEmpresa;
              DM.qryEquipamentosArqTecCODEQUIPAMENTO.AsString := DM.FParamAuxiliar[0];
              DM.qryEquipamentosArqTecCODARQUIVO.AsString     := DM.FCodCombo;
              DM.qryEquipamentosArqTecARQUIVO.AsString        := DM.FValorCombo;
              DM.qryEquipamentosArqTecTIPO.AsString           := DM.FParamAuxiliar[1];
              DM.qryEquipamentosArqTec.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

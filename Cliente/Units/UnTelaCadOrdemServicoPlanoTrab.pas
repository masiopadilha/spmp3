unit UnTelaCadOrdemServicoPlanoTrab;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;
type
  TFrmTelaCadOrdemServicoPlanoTrab = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadOrdemServicoPlanoTrab: TFrmTelaCadOrdemServicoPlanoTrab;
implementation
{$R *.dfm}
uses UnTelaConsulta, UnDM;
procedure TFrmTelaCadOrdemServicoPlanoTrab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//DM.qryOrdemServicoEquipePlanoTrab.Close;
end;
procedure TFrmTelaCadOrdemServicoPlanoTrab.FormCreate(Sender: TObject);
begin
  inherited;
  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
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

if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    GrdCadastro.ReadOnly      := True;
  end;
//DM.qryOrdemServicoEquipePlanoTrab.Open;
end;
procedure TFrmTelaCadOrdemServicoPlanoTrab.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoEquipePlanoTrab.IsEmpty = True then Exit;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA')
  and (DM.qryOrdemServicoSITUACAO.AsString <> 'PROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
    begin
      PAuxiliares.Font.Color  := clRed;
      PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    end
else
  begin
   DM.qryOrdemServicoEquipePlanoTrab.Delete;
  end;
end;
procedure TFrmTelaCadOrdemServicoPlanoTrab.GrdCadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;
procedure TFrmTelaCadOrdemServicoPlanoTrab.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
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

if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    Exit;
  end;
if (GrdCadastro.SelectedIndex = 2) then
  begin
    Key := #0;
  end;
if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 410;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryOrdemServicoEquipePlanoTrab.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoEquipePlanoTrab.Locate('CODPLANOTRABALHO', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoEquipePlanoTrab.Append;
              DM.qryOrdemServicoEquipePlanoTrabCODEMPRESA.AsString       := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipePlanoTrabCODORDEMSERVICO.AsString  := DM.FParamAuxiliar[0];
              DM.qryOrdemServicoEquipePlanoTrabCODPLANOTRABALHO.AsString := DM.FCodCombo;
              DM.qryOrdemServicoEquipePlanoTrabIMPRIMIR.AsString         := 'S';
              DM.qryOrdemServicoEquipePlanoTrabPLANOTRABALHO.AsString    := DM.FValorCombo;
              DM.qryOrdemServicoEquipePlanoTrab.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;
end.

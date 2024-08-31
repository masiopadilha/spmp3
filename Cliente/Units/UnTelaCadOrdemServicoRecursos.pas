unit UnTelaCadOrdemServicoRecursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadOrdemServicoRecursos = class(TFrmTelaPaiOKCancel)
    GrdEquipe: TDBGrid;
    GrdEquipeRecursos: TDBGrid;
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdEquipeRecursosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdEquipeRecursosDblClick(Sender: TObject);
    procedure GrdEquipeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoRecursos: TFrmTelaCadOrdemServicoRecursos;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadOrdemServicoRecursos.BtnOKClick(Sender: TObject);
begin
PAuxiliares.Font.Color    := clGreen;
PAuxiliares.Caption       := EmptyStr;
DM.qryOrdemServicoEquipe.First;
while not DM.qryOrdemServicoEquipe.Eof = True do
  begin
    DM.qryOrdemServicoEquipeRecursos.First;
    while not DM.qryOrdemServicoEquipeRecursos.Eof = True do
      begin
        if DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsInteger <= 0 then
          begin
            PAuxiliares.Font.Color    := clRed;
            PAuxiliares.Caption       := 'QUANTIDADE INVÁLIDA!';
            GrdEquipeRecursos.SelectedIndex := 3;
            GrdEquipeRecursos.SetFocus;
            Exit;
          end;
        DM.qryOrdemServicoEquipeRecursos.Next;
       end;
    DM.qryOrdemServicoEquipe.Next;
  end;
  inherited;
end;

procedure TFrmTelaCadOrdemServicoRecursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//DM.qryOrdemServicoEquipe.Close;
//DM.qryOrdemServicoEquipeRecursos.Close;
end;

procedure TFrmTelaCadOrdemServicoRecursos.FormCreate(Sender: TObject);
begin
  inherited;
  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    GrdEquipe.ReadOnly := True;
    GrdEquipeRecursos.ReadOnly := True;
    Exit;
  end;

  if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    GrdEquipe.ReadOnly := True;
    GrdEquipeRecursos.ReadOnly := True;
    DM.MSGAguarde('', False);
    Exit;
  end;

if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    GrdEquipe.ReadOnly      := True;
    GrdEquipeRecursos.ReadOnly := True;
  end;

DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeRecursos.Open;
end;

procedure TFrmTelaCadOrdemServicoRecursos.GrdEquipeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadOrdemServicoRecursos.GrdEquipeRecursosDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoEquipeRecursos.IsEmpty = True then Exit;

if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
  end
else
  DM.qryOrdemServicoEquipeRecursos.Delete;
end;

procedure TFrmTelaCadOrdemServicoRecursos.GrdEquipeRecursosKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    GrdEquipeRecursos.ReadOnly      := True;
    Exit;
  end;

if ((GrdEquipeRecursos.SelectedIndex = 0) and (Key <> #13)) or (DM.qryOrdemServicoEquipe.IsEmpty = True) then
  begin
    Key := #0;
    Exit;
  end;

if (Key = #13) and (GrdEquipeRecursos.SelectedIndex = 0) then
  begin
    if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
      DM.MSGAguarde('', False);
      GrdEquipe.ReadOnly := True;
      GrdEquipeRecursos.ReadOnly := True;
      Exit;
    end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      DM.FDataSetParam.Cancel;
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
      GrdEquipe.ReadOnly := True;
      GrdEquipeRecursos.ReadOnly := True;
      DM.MSGAguarde('', False);
      Exit;
    end;

    DM.FTabela_auxiliar := 460;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryOrdemServicoEquipeRecursos.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoEquipeRecursos.Locate('CODRECURSO', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoEquipe.Edit;
              DM.qryOrdemServicoEquipe.Post;

              DM.qryOrdemServicoEquipeRecursos.Append;
              DM.qryOrdemServicoEquipeRecursosCODEMPRESA.AsString       := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipeRecursosCODEQUIPE.AsInteger       := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
              DM.qryOrdemServicoEquipeRecursosCODORDEMSERVICO.AsString  := DM.FParamAuxiliar[0];
              DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsFloat         := 0;
              DM.qryOrdemServicoEquipeRecursosCODRECURSO.AsString       := DM.FCodCombo;
              DM.qryOrdemServicoEquipeRecursosRECURSO.AsString          := DM.FValorCombo;
              DM.qryOrdemServicoEquipeRecursos.Post;

              GrdEquipeRecursos.SelectedIndex := 1;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;

end;

end.

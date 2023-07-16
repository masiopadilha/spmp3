unit UnTelaCadOrdemServicoMObra;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Data.DB;
type
  TFrmTelaCadOrdemServicoMObra = class(TFrmTelaPaiOkCancel)
    GrdEquipe: TDBGrid;
    GrdEquipeMObra: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdEquipeMObraKeyPress(Sender: TObject; var Key: Char);
    procedure GrdEquipeDblClick(Sender: TObject);
    procedure GrdEquipeMObraDblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadOrdemServicoMObra: TFrmTelaCadOrdemServicoMObra;
implementation
{$R *.dfm}
uses UnTelaConsulta, UnDM, UnTelaCadOrdemServico;
procedure TFrmTelaCadOrdemServicoMObra.BtnFecharClick(Sender: TObject);
begin
  DM.qryOrdemServico.Edit;
  DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat := 0;
  DM.qryOrdemServicoEquipe.First;
  if DM.qryOrdemServicoEquipe.IsEmpty = False then
    begin
      while not DM.qryOrdemServicoEquipe.Eof = True do
        begin
          if DM.qryOrdemServicoEquipeMObra.IsEmpty = False then
            begin
              DM.qryOrdemServicoEquipeMObra.First;
              while not DM.qryOrdemServicoEquipeMObra.Eof = True do
                begin
                  DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat := DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat + DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;
                  DM.qryOrdemServicoEquipeMObra.Next;
                end;
            end
          else
            DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat := 0;
          DM.qryOrdemServicoEquipe.Next;
        end;
    end;
    if (DM.qryOrdemServicoEquipeMObra.RecordCount > 0) and (DM.qryOrdemServicoCODMANUTENCAO.AsString <> '')
      and ((DM.qryOrdemServicoSITUACAO.AsString = 'CADASTRADA') or (DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA')) then
        begin
          DM.qryOrdemServico.Edit;
          DM.qryOrdemServicoSITUACAO.AsString := 'DETALHADA';
          DM.qryOrdemServico.Post;

          if DM.qryOrdemServicoGerencia.Locate('CODIGO', DM.qryOrdemServicoCODIGO.AsInteger,[]) = True then
            begin
              DM.qryOrdemServicoGerencia.Edit;
              DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'DETALHADA';
              DM.qryOrdemServicoGerencia.Post;
            end;

          FrmTelaCadOrdemServico.PSituacao.Caption := 'DETALHADA';
          FrmTelaCadOrdemServico.PSituacao.Color := clYellow;
          FrmTelaCadOrdemServico.PSituacao.Font.Color := clGreen;
        end;
  DM.qryOrdemServico.Edit;
  DM.qryOrdemServico.Post;
  inherited;
end;
procedure TFrmTelaCadOrdemServicoMObra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryOrdemServicoEquipeMObra.Close;
DM.qryOrdemServicoEquipe.Close;
end;
procedure TFrmTelaCadOrdemServicoMObra.FormCreate(Sender: TObject);
begin
  inherited;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    GrdEquipe.ReadOnly      := True;
    GrdEquipeMObra.ReadOnly := True;
  end;
DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeMObra.Open;
end;
procedure TFrmTelaCadOrdemServicoMObra.GrdEquipeDblClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoEquipe.IsEmpty = True then Exit;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
  end
else
  begin
    DM.qryOrdemServicoEquipeRecursos.Open;
    if DM.qryOrdemServicoEquipeRecursos.IsEmpty = False then
      begin
        PAuxiliares.Font.Color  := clRed;
        PAuxiliares.Caption     := 'EXISTEM RECURSOS CADASTRADOS NA EQUIPE!';
      end
    else
      begin
        DM.qryOrdemServicoEquipe.Delete;
      end;
    //DM.qryOrdemServicoEquipeRecursos.Close;
  end;
end;
procedure TFrmTelaCadOrdemServicoMObra.GrdEquipeMObraDblClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoEquipeMObra.IsEmpty = True then Exit;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
  end
else
  DM.qryOrdemServicoEquipeMObra.Delete;
end;
procedure TFrmTelaCadOrdemServicoMObra.GrdEquipeMObraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if DM.qryOrdemServicoEquipeCODEQUIPE.IsNull = True then
  begin
    GrdEquipe.SelectedIndex := 0;
    GrdEquipe.SetFocus;
    Exit;
  end;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    GrdEquipe.ReadOnly      := True;
    GrdEquipeMObra.ReadOnly := True;
    Exit;
  end;
if ((GrdEquipeMObra.SelectedIndex = 0) and (Key <> #13)) or (DM.qryOrdemServicoEquipe.IsEmpty = True) then
  begin
    Key := #0;
    Exit;
  end;
if (Key = #13) and (GrdEquipeMObra.SelectedIndex = 0) then
  begin
    DM.FTabela_auxiliar := 130;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryOrdemServicoEquipeMObra.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoEquipeMObra.Locate('CODCARGO', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoEquipe.Edit;
              DM.qryOrdemServicoEquipe.Post;
              DM.qryOrdemServicoEquipe.Edit;
              DM.qryOrdemServicoEquipeMObra.Append;
              DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsInteger      := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
              DM.qryOrdemServicoEquipeMObraCODEMPRESA.AsString      := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsString := DM.FParamAuxiliar[0];
              DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat   := DM.qryOrdemServicoEquipeTEMPO.AsFloat;
              DM.qryOrdemServicoEquipeMObraCODCARGO.AsString        := DM.FCodCombo;
              DM.qryOrdemServicoEquipeMObraCARGO.AsString           := DM.FValorCombo;
              DM.qryOrdemServicoEquipeMObra.Post;
              GrdEquipeMObra.SelectedIndex := 1;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;
end.

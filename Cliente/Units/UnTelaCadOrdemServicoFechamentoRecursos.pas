unit UnTelaCadOrdemServicoFechamentoRecursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoFechamentoRecursos = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    GrdEquipe: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure GrdEquipeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoFechamentoRecursos: TFrmTelaCadOrdemServicoFechamentoRecursos;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServicoFechamento, UnDM;

procedure TFrmTelaCadOrdemServicoFechamentoRecursos.BtnFecharClick(
  Sender: TObject);
begin
DM.qryOrdemServicoEquipeRecursosUtil.Cancel;
if DM.qryRecursos.Active = True then
  DM.qryRecursos.Cancel;
  inherited;
end;

procedure TFrmTelaCadOrdemServicoFechamentoRecursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qryOrdemServicoEquipe.Close;
DM.qryOrdemServicoEquipeRecursosUtil.Close;
end;

procedure TFrmTelaCadOrdemServicoFechamentoRecursos.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeRecursosUtil.Open;
end;

procedure TFrmTelaCadOrdemServicoFechamentoRecursos.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
DM.qryRecursos.Close;
DM.qryRecursos.Params[0].AsString := DM.qryOrdemServicoEquipeRecursosUtilCODRECURSO.AsString;
DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
DM.qryRecursos.Open;
if DM.qryRecursos.IsEmpty = False then
  begin
    DM.qryRecursos.Edit;
    DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger + DM.qryOrdemServicoEquipeRecursosUtilQTDESOLIC.AsInteger;
    DM.qryRecursos.Post;
  end;
DM.qryOrdemServicoEquipeRecursosUtil.Delete;
end;

procedure TFrmTelaCadOrdemServicoFechamentoRecursos.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 460;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuxiliar);
    End;

    if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryOrdemServicoEquipeRecursosUtil.Locate('CODRECURSO', DM.FCodCombo, []) = False then
          begin
            LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade do recurso:');
            if LCampo <> EmptyStr then
              begin
                try
                  StrToInt(LCampo)
                except
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                  Exit;
                end;

                if StrToInt(LCampo) <= 0  then Exit;

                DM.qryRecursos.Close;
                DM.qryRecursos.Params[0].AsString := DM.FCodCombo;
                DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
                DM.qryRecursos.Open;
                if DM.qryRecursosQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                  begin
                    DM.qryRecursos.Edit;
                    DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger - DM.qryOrdemServicoEquipeRecursosUtilQTDESOLIC.AsInteger;
                    DM.qryRecursos.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end
            else Exit;

            DM.qryOrdemServicoEquipeRecursosUtil.Append;
//            DM.qryOrdemServicoEquipeRecursosUtilCODIGO.AsInteger          := DM.qryOrdemServicoEquipeRecursosUtil.RecordCount + 1;
            DM.qryOrdemServicoEquipeRecursosUtilCODEMPRESA.AsString       := DM.FCodEmpresa;
            DM.qryOrdemServicoEquipeRecursosUtilCODEQUIPE.AsInteger       := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
            DM.qryOrdemServicoEquipeRecursosUtilCODORDEMSERVICO.AsString  := DM.qryOrdemServicoCODIGO.AsString;
            DM.qryOrdemServicoEquipeRecursosUtilQTDESOLIC.AsFloat         := StrToInt(LCampo);
            DM.qryOrdemServicoEquipeRecursosUtilENTRADA.AsDateTime        := DM.FDataHoraServidor;
            DM.qryOrdemServicoEquipeRecursosUtilCODRECURSO.AsString       := DM.FCodCombo;
            DM.qryOrdemServicoEquipeRecursosUtilRECURSO.AsString          := DM.FValorCombo;
            DM.qryOrdemServicoEquipeRecursosUtil.Post;

            FrmTelaCadOrdemServicoFechamento.BtnSalvar.ImageIndex := 115;
            FrmTelaCadOrdemServicoFechamento.PAuxiliares.Font.Color := clRed;
            FrmTelaCadOrdemServicoFechamento.PAuxiliares.Caption := 'GRAVE O REGISTRO PARA RECALCULAR O CUSTO DOS RECURSOS!!!';

            GrdCadastro.SelectedIndex := 1;
          end;
      end;
  end;
end;

procedure TFrmTelaCadOrdemServicoFechamentoRecursos.GrdEquipeKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

end.

unit UnTelaCadOrdemServicoFechamentoPecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoFechamentoPecas = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoFechamentoPecas: TFrmTelaCadOrdemServicoFechamentoPecas;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServicoFechamento, UnDM;

procedure TFrmTelaCadOrdemServicoFechamentoPecas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qryOrdemServicoEquipe.Close;
DM.qryOrdemServicoEquipePecasUtil.Close;
end;

procedure TFrmTelaCadOrdemServicoFechamentoPecas.FormCreate(Sender: TObject);
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

DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipePecasUtil.Open;
end;

procedure TFrmTelaCadOrdemServicoFechamentoPecas.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
DM.qryPecasReposicao.Close;
DM.qryPecasReposicao.Params[0].AsString := DM.qryOrdemServicoEquipePecasUtilCODPECASREPOSICAO.AsString;
DM.qryPecasReposicao.Params[1].AsString := DM.FCodEmpresa;
DM.qryPecasReposicao.Open;
if DM.qryPecasReposicao.IsEmpty = False then
  begin
    DM.qryPecasReposicao.Edit;
    DM.qryPecasReposicaoQUANTIDADE.AsInteger := DM.qryPecasReposicaoQUANTIDADE.AsInteger + DM.qryOrdemServicoEquipePecasUtilQTDESOLIC.AsInteger;
    DM.qryPecasReposicao.Post;
  end;
DM.qryOrdemServicoEquipePecasUtil.Delete;
end;

procedure TFrmTelaCadOrdemServicoFechamentoPecas.GrdCadastroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadOrdemServicoFechamentoPecas.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if (Key = #13) then
  begin
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

    DM.FTabela_auxiliar := 360;

    if (GrdCadastro.SelectedIndex = 1) then
      begin
        DM.FParamAuxiliar[1] := 'REFERENCIA';
      end
    else
    if (GrdCadastro.SelectedIndex = 2) then
      begin
        DM.FParamAuxiliar[1] := 'DESCRICAO';
      end
    else
      Exit;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuxiliar);
    End;

    if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryOrdemServicoEquipePecasUtil.Locate('CODPECASREPOSICAO', DM.FCodCombo, []) = False then
          begin
            LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade da peça:');
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

                DM.qryPecasReposicao.Close;
                DM.qryPecasReposicao.Params[0].AsString := DM.FCodCombo;
                DM.qryPecasReposicao.Params[1].AsString := DM.FCodEmpresa;
                DM.qryPecasReposicao.Open;
                if DM.qryPecasReposicaoQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                  begin
                    DM.qryPecasReposicao.Edit;
                    DM.qryPecasReposicaoQUANTIDADE.AsInteger := DM.qryPecasReposicaoQUANTIDADE.AsInteger - DM.qryOrdemServicoEquipePecasUtilQTDESOLIC.AsInteger;
                    DM.qryPecasReposicao.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end
            else Exit;

            DM.qryOrdemServicoEquipePecasUtil.Append;
//            DM.qryOrdemServicoEquipePecasUtilCODIGO.AsInteger           := DM.qryOrdemServicoEquipePecasUtil.RecordCount + 1;
            DM.qryOrdemServicoEquipePecasUtilCODEMPRESA.AsString        := DM.FCodEmpresa;
            DM.qryOrdemServicoEquipePecasUtilCODORDEMSERVICO.AsString   := DM.qryOrdemServicoCODIGO.AsString;
            DM.qryOrdemServicoEquipePecasUtilREFERENCIA.AsString        := DM.FParamAuxiliar[2];
            DM.qryOrdemServicoEquipePecasUtilCODPECASREPOSICAO.AsString := DM.FCodCombo;
            DM.qryOrdemServicoEquipePecasUtilQTDESOLIC.AsInteger        := StrToInt(LCampo);
            DM.qryOrdemServicoEquipePecasUtilPRECO.AsFloat              := DM.qryPecasReposicaoPRECO.AsFloat;
            DM.qryOrdemServicoEquipePecasUtilENTRADA.AsDateTime         := DM.FDataHoraServidor;
            DM.qryOrdemServicoEquipePecasUtilPECA.AsString              := DM.FValorCombo;
            DM.qryOrdemServicoEquipePecasUtil.Post;

            FrmTelaCadOrdemServicoFechamento.BtnSalvar.ImageIndex := 115;
            FrmTelaCadOrdemServicoFechamento.PAuxiliares.Font.Color := clRed;
            FrmTelaCadOrdemServicoFechamento.PAuxiliares.Caption := 'GRAVE O REGISTRO PARA RECALCULAR O CUSTO DAS PEÇAS DE REPOSIÇÃO!!!';

            GrdCadastro.SelectedIndex := 3;
          end;
      end;

  end;

end;

end.

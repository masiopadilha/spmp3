unit UnTelaCadOrdemServicoFechamentoLubrificantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoFechamentoLubrificantes = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoFechamentoLubrificantes: TFrmTelaCadOrdemServicoFechamentoLubrificantes;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServicoFechamento, UnDM;

procedure TFrmTelaCadOrdemServicoFechamentoLubrificantes.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qryOrdemServicoEquipe.Close;
DM.qryOrdemServicoEquipeLubrificantesUtil.Close;
end;

procedure TFrmTelaCadOrdemServicoFechamentoLubrificantes.FormCreate(
  Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeLubrificantesUtil.Open;
end;

procedure TFrmTelaCadOrdemServicoFechamentoLubrificantes.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
DM.qryLubrificantes.Close;
DM.qryLubrificantes.Params[0].AsString := DM.qryOrdemServicoEquipeLubrificantesUtilCODLUBRIFICANTE.AsString;
DM.qryLubrificantes.Params[1].AsString := DM.FCodEmpresa;
DM.qryLubrificantes.Open;
if DM.qryLubrificantes.IsEmpty = False then
  begin
    DM.qryLubrificantes.Edit;
    DM.qryLubrificantesQTDETOTALUTIL.AsInteger := DM.qryLubrificantesQTDETOTALUTIL.AsInteger + DM.qryOrdemServicoEquipeLubrificantesUtilQTDESOLIC.AsInteger;
    DM.qryLubrificantes.Post;
  end;
DM.qryOrdemServicoEquipeLubrificantesUtil.Delete;
end;

procedure TFrmTelaCadOrdemServicoFechamentoLubrificantes.GrdCadastroKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadOrdemServicoFechamentoLubrificantes.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 6400;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuxiliar);
    End;

    if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryOrdemServicoEquipeLubrificantesUtil.Locate('CODLUBRIFICANTE', DM.FCodCombo, []) = False then
          begin
            LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade do lubrificante:');
            if LCampo <> EmptyStr then
              begin
                try
                  StrToFloat(LCampo)
                except
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                  Exit;
                end;

                if StrToFloat(LCampo) <= 0  then Exit;

                DM.qryLubrificantes.Close;
                DM.qryLubrificantes.Params[0].AsString := DM.FCodCombo;
                DM.qryLubrificantes.Params[1].AsString := DM.FCodEmpresa;
                DM.qryLubrificantes.Open;
                if DM.qryLubrificantesQTDETOTALUTIL.AsFloat >= StrToFloat(LCampo) then
                  begin
                    DM.qryLubrificantes.Edit;
                    DM.qryLubrificantesQTDETOTALUTIL.AsFloat := DM.qryLubrificantesQTDETOTALUTIL.AsFloat - DM.qryOrdemServicoEquipeLubrificantesUtilQTDESOLIC.AsFloat;
                    DM.qryLubrificantes.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end
            else Exit;

            DM.qryOrdemServicoEquipeLubrificantesUtil.Append;
            DM.qryOrdemServicoEquipeLubrificantesUtilCODEMPRESA.AsString        := DM.FCodEmpresa;
            DM.qryOrdemServicoEquipeLubrificantesUtilCODORDEMSERVICO.AsString   := DM.qryOrdemServicoCODIGO.AsString;
            DM.qryOrdemServicoEquipeLubrificantesUtilCODLUBRIFICANTE.AsString   := DM.FCodCombo;
            DM.qryOrdemServicoEquipeLubrificantesUtilQTDESOLIC.AsFloat          := StrToFloat(LCampo);
            DM.qryOrdemServicoEquipeLubrificantesUtilPRECO.AsFloat              := DM.qryLubrificantesULTPRECO.AsFloat;
            DM.qryOrdemServicoEquipeLubrificantesUtilENTRADA.AsDateTime         := DM.FDataHoraServidor;
            DM.qryOrdemServicoEquipeLubrificantesUtilLUBRIFICANTE.AsString      := DM.FValorCombo;
            DM.qryOrdemServicoEquipeLubrificantesUtil.Post;

            FrmTelaCadOrdemServicoFechamento.BtnSalvar.ImageName := 'Operacional\naosalvo';
            FrmTelaCadOrdemServicoFechamento.PAuxiliares.Font.Color := clRed;
            FrmTelaCadOrdemServicoFechamento.PAuxiliares.Caption := 'GRAVE O REGISTRO PARA RECALCULAR O CUSTO DOS LUBRIFICANTES!!!';

            GrdCadastro.SelectedIndex := 2;
          end;
      end;
  end;
end;

end.

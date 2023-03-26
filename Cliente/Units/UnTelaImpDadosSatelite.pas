unit UnTelaImpDadosSatelite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Data.DB, Vcl.ComCtrls, System.DateUtils,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Param;

type
  TFrmTelaImpDadosSatelite = class(TFrmTelaPaiOkCancel)
    PBase: TPanel;
    BtnArquivo: TButton;
    OpenDialog1: TOpenDialog;
    StringGrid1: TStringGrid;
    Label5: TLabel;
    EdtCodEquipamento: TEdit;
    EdtDescEquipamento: TEdit;
    BtnEquipamento: TButton;
    GBAbastecimentos: TGroupBox;
    PAbastecimentos: TPanel;
    LblPlacaAbast: TLabel;
    LblMedidorAbast: TLabel;
    LblContadorAbast: TLabel;
    GBPneus: TGroupBox;
    PPneus: TPanel;
    LblPlacaPneus: TLabel;
    LblOdometro: TLabel;
    LblContadorPneus: TLabel;
    EdtPlacaAbast: TDBEdit;
    EdtMedidorAbast: TDBEdit;
    EdtContadorAbast: TDBEdit;
    EdtPlacaPneus: TDBEdit;
    EdtContadorPneus: TDBEdit;
    LblRodadosAbast: TLabel;
    EdtRodadosAbast: TEdit;
    LblRodadosPneus: TLabel;
    EdtRodadosPneus: TEdit;
    LblNovoValorAbast: TLabel;
    EdtNovoValorAbast: TEdit;
    LblNovoValorPneus: TLabel;
    EdtNovoValorPneus: TEdit;
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure BtnArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaImpDadosSatelite: TFrmTelaImpDadosSatelite;
  LDataImport: TDatetime;

implementation

{$R *.dfm}

uses UnTelaCadEquipamentos, UnDM;

procedure TFrmTelaImpDadosSatelite.BtnArquivoClick(Sender: TObject);
var
LPlacaEquip: String;
LTotalKm: Real;
Linha: SmallInt;
begin
  inherited;
Try
  if EdtCodEquipamento.Text = EmptyStr then
    begin
      EdtDescEquipamento.SetFocus;
      Exit;
    end;

  EdtRodadosAbast.Text   := EmptyStr;
  EdtRodadosPneus.Text   := EmptyStr;
  EdtNovoValorAbast.Text := EmptyStr;
  EdtNovoValorPneus.Text := EmptyStr;

  if OpenDialog1.Execute then
    DM.XlsToStringGrid(StringGrid1,OpenDialog1.FileName);

  if OpenDialog1.FileName = EmptyStr then Exit;


  DM.MSGAguarde('');

  LDataImport := StrToDateTime(Copy(StringGrid1.Cells[2, StringGrid1.RowCount - 1], 1, 10));
  LPlacaEquip   := Trim(Copy(StringGrid1.Cells[0, 0], 5, 9));

  LTotalKm := 0;
  for Linha := 3 to StringGrid1.RowCount - 1 do
    begin
      LTotalKm := LTotalKm + StrToFloat(DM.converter_ponto(StringGrid1.Cells[3, Linha]));
    end;

  LTotalKm := Round(LTotalKm);

  EdtRodadosAbast.Text   := FloatToStr(LTotalKm);
  EdtRodadosPneus.Text   := FloatToStr(LTotalKm);

  if EdtRodadosAbast.Text = EmptyStr then
    begin
      LblRodadosAbast.Font.Color := clRed;
    end
  else
    begin
      LblRodadosAbast.Font.Color := clBlack;
    end;

  if EdtRodadosPneus.Text = EmptyStr then
    begin
      LblRodadosPneus.Font.Color := clRed;
    end
  else
    begin
      LblRodadosPneus.Font.Color := clBlack;
    end;

  if EdtPlacaAbast.Text <> ''  then
    EdtNovoValorAbast.Text := FormatFloat(',0.00', DM.qryAbastecimentosCONTADORATUAL.AsFloat + LTotalKm);
  if EdtPlacaPneus.Text <> ''  then
    EdtNovoValorPneus.Text := FormatFloat(',0.00', DM.qryPneusChassiCONTADOR.AsFloat + LTotalKm);
Except
  Application.MessageBox('Não foi possível realizar a importação', 'SPMP3', MB_ICONWARNING + MB_OK);
  DM.MSGAguarde('', False);
End;
DM.MSGAguarde('', False);
end;

procedure TFrmTelaImpDadosSatelite.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = True then
  begin
    Try
      if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryEquipamentosCODIGO, DM.qryFormatoCodigoEQUIPAMENTOS, FrmTelaCadEquipamentos) = False then exit;
      Application.CreateForm(TFrmTelaCadEquipamentos, FrmTelaCadEquipamentos);
      FrmTelaCadEquipamentos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadEquipamentos);
    End;
  end
else
  begin
    DM.FTabela_auxiliar := 250;
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    DM.FNomeConsulta := 'Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        EdtCodEquipamento.Text  := DM.FCodCombo;
        EdtDescEquipamento.Text := DM.FValorCombo;

        DM.qryAbastecimentos.Close;
        DM.qryAbastecimentos.Params[0].AsString := DM.FCodCombo;
        DM.qryAbastecimentos.Params[1].AsString := DM.FCodEmpresa;
        DM.qryAbastecimentos.Open;

        DM.qryPneusChassi.Close;
        DM.qryPneusChassi.Params[0].AsString := DM.FCodCombo;
        DM.qryPneusChassi.Params[1].AsString := DM.FCodEmpresa;
        DM.qryPneusChassi.Open;

        if DM.qryAbastecimentosPLACA.AsString = EmptyStr then
          begin
            LblPlacaAbast.Font.Color := clRed;
          end
        else
          begin
            LblPlacaAbast.Font.Color := clBlack;
          end;
        LblRodadosAbast.Font.Color := clBlack;

        if DM.qryPneusChassiPLACA.AsString = EmptyStr then
          begin
            LblPlacaPneus.Font.Color := clRed;
          end
        else
          begin
            LblPlacaPneus.Font.Color := clBlack;
          end;
        LblRodadosPneus.Font.Color := clBlack;
      end;
      //Tratar as cores
  end;
end;

procedure TFrmTelaImpDadosSatelite.BtnOKClick(Sender: TObject);
begin
if EdtDescEquipamento.Text = '' then Abort;

if (EdtPlacaAbast.Text <> '') and (EdtPlacaPneus.Text <> '') and (EdtPlacaAbast.Text <> EdtPlacaPneus.Text) then
  begin
    Application.MessageBox('Placas diferentes nos controles de abastecimentos e pneus, favor corrigir a informação.', 'SPMP3', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
if (EdtPlacaAbast.Text <> '') and (EdtPlacaPneus.Text <> '') and (EdtPlacaAbast.Text = EdtPlacaPneus.Text) and (EdtRodadosAbast.Text <> '') then
  DM.AtualizarContadorSatelite(EdtCodEquipamento.Text, EdtPlacaAbast.Text, LDataImport, StrToFloat(EdtRodadosAbast.Text), 0);
if (EdtPlacaAbast.Text <> '') and (EdtPlacaPneus.Text = '') and (EdtRodadosAbast.Text <> '') then
  DM.AtualizarContadorSatelite(EdtCodEquipamento.Text, EdtPlacaAbast.Text, LDataImport, StrToFloat(EdtRodadosAbast.Text), 1);
if (EdtPlacaAbast.Text = '') and (EdtPlacaPneus.Text <> '') and (EdtRodadosPneus.Text <> '') then
  DM.AtualizarContadorSatelite(EdtCodEquipamento.Text, EdtPlacaPneus.Text, LDataImport, StrToFloat(EdtRodadosPneus.Text), 2);
  inherited;
end;

procedure TFrmTelaImpDadosSatelite.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryAbastecimentos.Close;
DM.qryPneusChassi.Close;
DM.qryPneusChassiPneus.Close;
DM.qryPneusChassiPosicoes.Close;
end;

end.

unit UnTelaCadAbastecimentosViagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, JvExMask,
  JvToolEdit, JvDBControls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadAbastecimentosViagens = class(TFrmTelaPaiParametros)
    Label24: TLabel;
    EdtRota: TDBEdit;
    BtnRota: TButton;
    Label25: TLabel;
    Label14: TLabel;
    EdtDataPartida: TJvDBDateEdit;
    Label23: TLabel;
    Label11: TLabel;
    Label27: TLabel;
    EdtTanqueSaida: TDBEdit;
    Label29: TLabel;
    Label15: TLabel;
    EdtDataChegada: TJvDBDateEdit;
    Label6: TLabel;
    EdtChegada: TDBEdit;
    Label28: TLabel;
    EdtTanqueChegada: TDBEdit;
    Label9: TLabel;
    EdtUrbano: TDBEdit;
    Label10: TLabel;
    EdtRodoviario: TDBEdit;
    Label13: TLabel;
    EdtCarregado: TDBEdit;
    LTotal: TLabel;
    LblTotalPercorrido: TDBText;
    EdtSaida: TDBEdit;
    GBCombustivel: TGroupBox;
    lblConsEspCombust: TDBText;
    LConsCombust: TLabel;
    lblConsCombust: TDBText;
    LConsRealCombust: TLabel;
    GBLubrificante: TGroupBox;
    LConsLubrific: TLabel;
    lblConsEspLubrific: TDBText;
    LConsRealLubrific: TLabel;
    lblConsLubrific: TDBText;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnRotaClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadAbastecimentosViagens: TFrmTelaCadAbastecimentosViagens;

implementation

{$R *.dfm}

uses UnTelaCadAbastecimentosRotas, UnDmRelatorios, UnDM;

procedure TFrmTelaCadAbastecimentosViagens.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryViagens.Active = True then
  begin
    DM.qryViagens.Cancel;
    DM.qryViagens.Edit;
  end;
end;

procedure TFrmTelaCadAbastecimentosViagens.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 95;
  inherited;
if (DM.qryViagensCODIGO.AsString <> EmptyStr) then
  begin
    DM.qryViagensCombust.Open;

    DM.qryViagensCombustAbast.Close;
    DM.qryViagensCombustAbast.Params[0].AsString := DM.qryViagensCombustCODEQUIPAMENTO.AsString;
    DM.qryViagensCombustAbast.Params[1].AsString := DM.qryViagensCombustCODIGO.AsString;
    DM.qryViagensCombustAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.qryViagensDATAPARTIDA.AsDateTime);
    DM.qryViagensCombustAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.qryViagensDATACHEGADA.AsDateTime) + ' 23:59:59';
    DM.qryViagensCombustAbast.Open;

    DM.qryViagensLubrific.Open;

    DM.qryViagensLubrificAbast.Close;
    DM.qryViagensLubrificAbast.Params[0].AsString := DM.qryViagensLubrificCODEQUIPAMENTO.AsString;
    DM.qryViagensLubrificAbast.Params[1].AsString := DM.qryViagensLubrificCODIGO.AsString;
    DM.qryViagensLubrificAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.qryViagensDATAPARTIDA.AsDateTime);
    DM.qryViagensLubrificAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.qryViagensDATACHEGADA.AsDateTime) + ' 23:59:59';
    DM.qryViagensLubrificAbast.Open;
  end;
end;

procedure TFrmTelaCadAbastecimentosViagens.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryViagensCombust.Close;
DM.qryViagensCombustAbast.Close;

DM.qryViagensLubrific.Close;
DM.qryViagensLubrificAbast.Close;

DM.qryViagensCODEQUIPAMENTO.AsString        := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
DM.qryViagensCODEMPRESA.AsString            := DM.FCodEmpresa;
DM.qryViagensDATACADASTRO.AsDateTime        := DM.FDataHoraServidor;
DM.qryViagensDATAULTALT.AsDateTime          := DM.FDataHoraServidor;
DM.qryViagensCODUSUARIOCAD.AsString         := DM.FCodUsuario;
DM.qryViagensCODUSUARIOALT.AsString         := DM.FCodUsuario;
DM.qryViagensDATAPARTIDA.AsDateTime         := DM.FDataHoraServidor;
DM.qryViagensDISTANCIA.AsFloat              := 0;
DM.qryViagensTANQUESAIDA.AsFloat            := 100;
DM.qryViagensTANQUECHEGADA.AsFloat          := 0;
DM.qryViagensURBANO.AsFloat                 := 0;
DM.qryViagensRODOVIARIO.AsFloat             := 0;
DM.qryViagensCARREGADO.AsFloat              := 0;
DM.qryViagensCONTADORSAIDA.AsFloat          := DM.qryAbastecimentosCONTADORATUAL.AsInteger;
DM.qryViagensCONTADORCHEGADA.AsFloat        := 0;
DM.qryViagensCONSUMOCOMBUST.AsFloat         := 0;
DM.qryViagensCONSUMOLUBRIFIC.AsFloat        := 0;

EdtRota.SetFocus;
end;

procedure TFrmTelaCadAbastecimentosViagens.BtnRotaClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;

if DM.qryViagens.Active = False then Exit;

if DM.qryViagensCODEQUIPAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O EQUIPAMENTO!'; EdtRota.SetFocus; Exit;
  end;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar  := 7900;
    DM.FNomeConsulta := 'Rotas';
    DM.qryViagens.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryViagensCODROTA.AsString := DM.FCodCombo;
        DM.qryViagensROTA.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadAbastecimentosRotas, FrmTelaCadAbastecimentosRotas);
      FrmTelaCadAbastecimentosRotas.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadAbastecimentosRotas);
    End;
  end;
DM.FDataSetParam    := DM.qryViagens;
DM.FDataSourceParam := DM.dsViagens;
DM.FTela            := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 95;
end;

procedure TFrmTelaCadAbastecimentosViagens.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

if DM.qryViagensCODROTA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A ROTA DO VEÍCULO!'; EdtRota.SetFocus; Exit;
  end;

if DM.qryViagensDATAPARTIDA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DATA DE PARTIDA DO TRAJETO!'; EdtDataPartida.SetFocus; Exit;
  end;

if DM.qryViagensCONTADORSAIDA.AsInteger <= 0  then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONTADOR NA PARTIDA DO TRAJETO!'; EdtSaida.SetFocus; Exit;
  end;

//if DM.qryViagensCONTADORSAIDA.AsInteger < DM.qryAbastecimentosCONTADORATUAL.AsInteger then
//  begin
//    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'CONTADOR INFERIOR AO CONTADOR DO ' + UpperCase(DM.qryAbastecimentosTIPO.AsString); EdtSaida.SetFocus; Exit;
//  end;

if (DM.qryViagensDATACHEGADA.AsDateTime > 0) and (DM.qryViagensCONTADORCHEGADA.AsInteger <= DM.qryViagensCONTADORSAIDA.AsInteger) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'CONTADOR INVÁLIDO'; EdtChegada.SetFocus; Exit;
  end;

if (DM.qryViagensDATACHEGADA.AsDateTime > 0) and (DM.qryViagensCONTADORSAIDA.AsInteger > DM.qryViagensCONTADORCHEGADA.AsInteger)  then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'CONTADOR NA PARTIDA MAIOR DO QUE NA CHEGADA!'; EdtChegada.SetFocus; Exit;
  end;

if DM.qryViagensTANQUESAIDA.AsInteger = 0 then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PERCENTUAL DO TANQUE NA SAÍDA DO TRAJETO!'; EdtTanqueSaida.SetFocus; Exit;
  end;

if (DM.qryViagensTANQUESAIDA.AsInteger < 0) or (DM.qryViagensTANQUESAIDA.AsInteger > 100) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'VALOR INVÁLIDO!'; EdtTanqueSaida.SetFocus; Exit;
  end;

if (DM.qryViagensTANQUECHEGADA.AsInteger < 0) or (DM.qryViagensTANQUECHEGADA.AsInteger > 100) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'VALOR INVÁLIDO!'; EdtTanqueChegada.SetFocus; Exit;
  end;

DM.MSGAguarde('');

  inherited;
DM.qryViagens.Params[0].AsString  := Dm.FCodEmpresa;
DM.qryViagens.Params[1].AsInteger := DM.qryViagensCODIGO.AsInteger;

if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

DM.MSGAguarde('', False);

if (DM.qryViagensCombustAbast.Active = False) and (DM.qryViagensDATACHEGADA.AsDateTime > 0) then
  begin
    DM.qryViagensCombust.Open;

    DM.qryViagensCombustAbast.Close;
    DM.qryViagensCombustAbast.Params[0].AsString := DM.qryViagensCombustCODEQUIPAMENTO.AsString;
    DM.qryViagensCombustAbast.Params[1].AsString := DM.qryViagensCombustCODIGO.AsString;
    DM.qryViagensCombustAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -12)) + ' 00:00:00';
    DM.qryViagensCombustAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
    DM.qryViagensCombustAbast.Open;

    DM.qryViagensLubrific.Open;

    DM.qryViagensLubrificAbast.Close;
    DM.qryViagensLubrificAbast.Params[0].AsString := DM.qryViagensLubrificCODEQUIPAMENTO.AsString;
    DM.qryViagensLubrificAbast.Params[1].AsString := DM.qryViagensLubrificCODIGO.AsString;
    DM.qryViagensLubrificAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -12)) + ' 00:00:00';
    DM.qryViagensLubrificAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
    DM.qryViagensLubrificAbast.Open;
  end;
end;

procedure TFrmTelaCadAbastecimentosViagens.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBViagensGeral;
DM.FTabela_auxiliar := 95;
  inherited;

end;

procedure TFrmTelaCadAbastecimentosViagens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryViagensCombustAbast.Close;
DM.qryViagensCombust.Close;
DM.qryViagensLubrificAbast.Close;
DM.qryViagensLubrific.Close;
DM.qryViagens.Close;
end;

procedure TFrmTelaCadAbastecimentosViagens.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryViagens;
DM.FDataSourceParam := DM.dsViagens;
DM.FTela := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 95;
end;

procedure TFrmTelaCadAbastecimentosViagens.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBViagensIndividual;
DM.FTabela_auxiliar := 951;
  inherited;

end;

end.

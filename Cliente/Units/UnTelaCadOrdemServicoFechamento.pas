unit UnTelaCadOrdemServicoFechamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB, System.DateUtils, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, Vcl.Buttons, Datasnap.DBClient, FireDAC.Stan.Param, Vcl.Grids,
  Vcl.DBGrids, JvExMask, JvToolEdit, JvMaskEdit, JvDBControls, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, JvCheckedMaskEdit, JvDatePickerEdit,
  JvDBDatePickerEdit, System.RegularExpressions;

type
  TFrmTelaCadOrdemServicoFechamento = class(TFrmTelaPaiCadastros)
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdtOrdemServico: TDBText;
    EdtEquipamento: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    LblHomemHora: TDBText;
    GrdServicosExec: TDBGrid;
    ChbParcial: TDBCheckBox;
    Label15: TLabel;
    LblOrigem: TLabel;
    LblCustoMObra: TDBText;
    Label8: TLabel;
    Label16: TLabel;
    LblCustoPecas: TDBText;
    Label19: TLabel;
    LblCustoRecursos: TDBText;
    Label20: TLabel;
    EdtDescCustoExtra: TDBEdit;
    EdtCustoExtra: TDBEdit;
    Label9: TLabel;
    EdtManutencao: TDBEdit;
    BtnManutencao: TButton;
    Label21: TLabel;
    Label10: TLabel;
    EdtMotivo: TDBEdit;
    BtnMotivo: TButton;
    Label23: TLabel;
    Label11: TLabel;
    EdtFalha: TDBEdit;
    BtnFalha: TButton;
    Label27: TLabel;
    Label12: TLabel;
    EdtCentroCusto: TDBEdit;
    BtnCentroCusto: TButton;
    Label22: TLabel;
    Label13: TLabel;
    EdtSolicitado: TDBEdit;
    BtnSolicitado: TButton;
    Label24: TLabel;
    Label14: TLabel;
    EdtOficina: TDBEdit;
    BtnOficina: TButton;
    Label25: TLabel;
    PSituacao: TPanel;
    LblTempoExec: TDBText;
    Label26: TLabel;
    LblCustoAuxiliares: TDBText;
    PopupMenuPecas: TPopupMenu;
    PecasdeReposicao1: TMenuItem;
    Lubrificantes1: TMenuItem;
    Label28: TLabel;
    LblDataFechamento: TDBText;
    Label29: TLabel;
    edtDescOrdemServico: TDBText;
    Label4: TLabel;
    edtDataInicioReal: TDateTimePicker;
    edtDataFimReal: TDateTimePicker;
    Label30: TLabel;
    EdtResponsavel: TDBEdit;
    BtnResponsavel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure GrdServicosExecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnManutencaoClick(Sender: TObject);
    procedure BtnCentroCustoClick(Sender: TObject);
    procedure BtnMotivoClick(Sender: TObject);
    procedure BtnSolicitadoClick(Sender: TObject);
    procedure BtnFalhaClick(Sender: TObject);
    procedure BtnOficinaClick(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure PecasdeReposicao1Click(Sender: TObject);
    procedure Lubrificantes1Click(Sender: TObject);
    procedure GrdServicosExecDblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ChbParcialClick(Sender: TObject);
    procedure BtnResponsavelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LCustoAlterado: Boolean;
  end;

var
  FrmTelaCadOrdemServicoFechamento: TFrmTelaCadOrdemServicoFechamento;


implementation

{$R *.dfm}

uses UnTelaCadOrdemServicoFechamentoMObra,
  UnTelaCadOrdemServicoFechamentoPecas, UnTelaCadOrdemServicoFechamentoRecursos,
  UnTelaCadTipoManutencao, UnTelaCadMotivoParada, UnTelaCadCausaFalha,
  UnTelaCadCentroCusto, UnTelaCadOficinas, UnTelaCadFuncionarios,
  UnDmRelatorios, UnTelaCadOrdemServicoFechamentoLubrificantes, UnTelaInspFechamento,
  UnDM;

procedure TFrmTelaCadOrdemServicoFechamento.BtnCentroCustoClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 400;
    DM.FNomeConsulta := 'Centros de Custos';
    DM.qryOrdemServico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoCODCENTROCUSTO.AsString := DM.FCodCombo;
        DM.qryOrdemServicoCENTROCUSTO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCENTROCUSTO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoCENTROCUSTO, FrmTelaCadCentroCusto) = False then exit;
      Application.CreateForm(TFrmTelaCadCentroCusto, FrmTelaCadCentroCusto);
      FrmTelaCadCentroCusto.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCentroCusto);
    End;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnConsultarClick(Sender: TObject);
begin
DM.FParamAuxiliar[1] := 'FECHADA';
DM.FTabela_auxiliar := 45;
  inherited;
if DM.qryOrdemServicoCODIGO.IsNull then Exit;

if DM.qryOrdemServicoSOLICITACAOTRAB.AsString <> EmptyStr then
  begin
    LblOrigem.Caption := DM.qryOrdemServicoSOLICITACAOTRAB.AsString;
  end
else
if DM.qryOrdemServicoROTAEQUIP.AsString = 'S' then
  begin
    LblOrigem.Caption := 'ROTA DE EQUIPAMENTOS';
  end
else
if DM.qryOrdemServicoMANUTPROGEQUIP.AsString <> EmptyStr then
  begin
    LblOrigem.Caption := DM.qryOrdemServicoMANUTPROGEQUIP.AsString;
  end
else
if DM.qryOrdemServicoLUBRIFICPROGEQUIP.AsString <> EmptyStr then
  begin
    LblOrigem.Caption := DM.qryOrdemServicoLUBRIFICPROGEQUIP.AsString;
  end
else
  begin
    LblOrigem.Caption := 'MANUAL';
  end;

if DM.qryOrdemServicoSITUACAO.AsString = 'CADASTRADA' then
  begin
    PSituacao.Caption := 'CADASTRADA';
    PSituacao.Font.Color := clRed;
    if DM.qryOrdemServicoCODMANUTENCAO.AsString <> EmptyStr then
      PSituacao.Color := clYellow
    else
      PSituacao.Color := $00BBFFFF;
  end;

if DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA' then
  begin
    PSituacao.Caption := 'SOLICITADA';
    PSituacao.Font.Color := clBlack;
    if DM.qryOrdemServicoCODMANUTENCAO.AsString <> EmptyStr then
      PSituacao.Color := clWhite
    else
      PSituacao.Color := $00F3F3F3;
  end;

if DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA'    then begin PSituacao.Caption := 'PROGRAMADA';    PSituacao.Color := clBlue;   PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'DETALHADA'     then begin PSituacao.Caption := 'DETALHADA';     PSituacao.Color := clYellow; PSituacao.Font.Color := clGreen;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA'    then begin PSituacao.Caption := 'PROGRAMADA';    PSituacao.Color := clBlue;   PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA' then begin PSituacao.Caption := 'DESPROGRAMADA'; PSituacao.Color := clYellow; PSituacao.Font.Color := clBlue;   end;
if DM.qryOrdemServicoSITUACAO.AsString = 'EXECUCAO'      then begin PSituacao.Caption := 'EXECUÇÃO';      PSituacao.Color := clInfoBk; PSituacao.Font.Color := clGreen;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'LIBERADA'      then begin PSituacao.Caption := 'LIBERADA';      PSituacao.Color := clGreen;  PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'FECHADA'       then begin PSituacao.Caption := 'FECHADA';       PSituacao.Color := clGray;   PSituacao.Font.Color := clBlack;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'PARALISADA'    then begin PSituacao.Caption := 'PARALISADA';    PSituacao.Color := clRed;    PSituacao.Font.Color := clYellow; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'CANCELADA'     then begin PSituacao.Caption := 'CANCELADA';     PSituacao.Color := clBlack;  PSituacao.Font.Color := $00FF8000; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'VENCIDA'       then begin PSituacao.Caption := 'VENCIDA';       PSituacao.Color := clRed;    PSituacao.Color      := clWhite;  end;

edtDataInicioReal.DateTime := DM.qryOrdemServicoDATAINICIOREAL.AsDateTime;
edtDataFimReal.DateTime := DM.qryOrdemServicoDATAFIMREAL.AsDateTime;
end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnFalhaClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 900;
    DM.FNomeConsulta := 'Causas de Falhas';
    DM.qryOrdemServico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoCODCAUSAFALHA.AsString := DM.FCodCombo;
        DM.qryOrdemServicoFALHA.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCAUSASFALHA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryCausaFalhaCODIGO, DM.qryFormatoCodigoCAUSASFALHA, FrmTelaCadCausaFalha) = False then exit;
      Application.CreateForm(TFrmTelaCadCausaFalha, FrmTelaCadCausaFalha);
      FrmTelaCadCausaFalha.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCausaFalha);
    End;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnManutencaoClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 100;
    DM.FNomeConsulta := 'Tipos de Manuteções';
    DM.qryOrdemServico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoCODMANUTENCAO.AsString := DM.FCodCombo;
        DM.qryOrdemServicoMANUTENCAO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADMANUTENCAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryTipoManutencaoCODIGO, DM.qryFormatoCodigoTIPOMANUTENCAO, FrmTelaCadTipoManutencao) = False then exit;
      Application.CreateForm(TFrmTelaCadTipoManutencao, FrmTelaCadTipoManutencao);
      FrmTelaCadTipoManutencao.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadTipoManutencao);
    End;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnMotivoClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 110;
    DM.FNomeConsulta := 'Motivos de Paradas';
    DM.qryOrdemServico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoCODMOTIVOPARADA.AsString := DM.FCodCombo;
        DM.qryOrdemServicoMOTIVOPARADA.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADMOTIVOPARADA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryMotivoParadaCODIGO, DM.qryFormatoCodigoMOTIVOPARADA, FrmTelaCadMotivoParada) = False then exit;
      Application.CreateForm(TFrmTelaCadMotivoParada, FrmTelaCadMotivoParada);
      FrmTelaCadMotivoParada.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadMotivoParada);
    End;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnNovoClick(Sender: TObject);
begin
//  inherited;

end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    DM.qryOrdemServico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoCODOFICINA.AsString := DM.FCodCombo;
        DM.qryOrdemServicoOFICINA.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADOFICINAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryOficinasCODIGO, DM.qryFormatoCodigoOFICINAS, FrmTelaCadOficinas) = False then exit;
      Application.CreateForm(TFrmTelaCadOficinas, FrmTelaCadOficinas);
      FrmTelaCadOficinas.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadOficinas);
    End;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnResponsavelClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.qryOrdemServico.Edit;
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoRESPONSAVEL.AsString   := DM.FCodCombo;
        DM.qryOrdemServicoNOMERESPONSAVEL.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
DM.FParamAuxiliar[1] := EmptyStr;

end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnSalvarClick(Sender: TObject);
const
  EmailRegexPattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
var
  LSalario, LHOficiais, LHomemHora, LHENormal, LHEFeriado, LPercHENormal, LPercHEFeriado, LCusto, LTotalHH : Real;
  LEmail: String;
begin
if (DM.qryUsuarioPInclusao.FieldByName('CADORDEMSERVICOFECHAR').AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if (DM.qryUsuarioPAlteracao.FieldByName('CADORDEMSERVICOFECHAR').AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

DM.qryOrdemServico.Edit;
DM.qryOrdemServicoDATAINICIOREAL.AsDateTime := edtDataInicioReal.DateTime;
DM.qryOrdemServicoDATAFIMREAL.AsDateTime := edtDataFimReal.DateTime;

if DM.qryOrdemServicoDATAINICIOREAL.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O INÍCIO DA O.S.!'; EdtDataInicioReal.SetFocus; Exit;
  end;
if DM.qryOrdemServicoDATAFIMREAL.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FIM DA O.S.!'; EdtDataFimReal.SetFocus; Exit;
  end;
if (DateOf(DM.qryOrdemServicoDATAINICIOREAL.AsDateTime) > DateOf(DM.FDataHoraServidor))
  or (DM.qryOrdemServicoDATAINICIOREAL.AsDateTime >= DM.qryOrdemServicoDATAFIMREAL.AsDateTime) then
    begin
      PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'DATA INVÁLIDA!'; EdtDataInicioReal.SetFocus; Exit;
    end;
if (DM.qryOrdemServicoDATAFIMREAL.AsDateTime <= DM.qryOrdemServicoDATAINICIOREAL.AsDateTime)
  or (DateOf(DM.qryOrdemServicoDATAFIMREAL.AsDateTime) > DateOf(DM.FDataHoraServidor)) then
    begin
      PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'DATA INVÁLIDA!'; EdtDataFimReal.SetFocus; Exit;
    end;
if (DM.qryOrdemServicoDATAFIMREAL.AsDateTime > DM.FDataHoraServidor) then
    begin
      PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'DATA INVÁLIDA!'; EdtDataFimReal.SetFocus; Exit;
    end;

DM.MSGAguarde('');

DM.qryOrdemServicoServExec.Edit;
DM.qryOrdemServicoServExec.Post;

//Localiza e atualiza o status da Solic. de Trab
if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
  begin
    DM.qrySolicitacaoTrab.Close;
    DM.qrySolicitacaoTrab.Params[0].AsString := DM.qryOrdemServicoCODSOLICITACAOTRAB.AsString;
    DM.qrySolicitacaoTrab.Params[1].AsString := DM.FCodEmpresa;
    DM.qrySolicitacaoTrab.Open;
    if DM.qrySolicitacaoTrab.IsEmpty = False then
      begin
        DM.qrySolicitacaoTrab.Edit;
        DM.qrySolicitacaoTrabSITUACAO.AsString := 'FECHADA';
        DM.qrySolicitacaoTrab.Post;
      end;

    if DM.qrySolicitacaoTrabEMAIL.AsString = '' then
    begin
      if Application.MessageBox('Deseja informar um endereço de e-mail para informar a conclusão da solicitação?', 'SPMP3', MB_YESNO) = IDYes then
      begin
        LEmail := DM.CampoInputBox('SPMP', 'Informe o email do funcionário:');
        if LEmail <> '' then
          if TRegEx.IsMatch(LEmail, EmailRegexPattern) = False then
            LEmail := '';
      end;
    end else
    begin
      LEmail := DM.qrySolicitacaoTrabEMAIL.AsString;
      if TRegEx.IsMatch(LEmail, EmailRegexPattern) = False then
        LEmail := '';
    end;

    if LEmail <> '' then
      DM.EnviarEmail('SOLICITAÇÃO CONCLUÍDA', LEmail, Format('%.*d', [6, DM.qryOrdemServicoCODIGO.AsInteger]));
  end;

//Cálculo dos custos da O.S.
//-----------------------------------------------Mão de obra---------------------------------------------------------------------
DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeMObra.Open;
DM.qryOrdemServicoEquipeMObraMovim.Open;
DM.qryOrdemServicoEquipeMObraUtil.Open;

DM.qryOrdemServicoMObraDisp.Close;
DM.qryOrdemServicoMObraDisp.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
DM.qryOrdemServicoMObraDisp.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
DM.qryOrdemServicoMObraDisp.Params[2].AsString := DM.FCodEmpresa;
if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
  DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'AUTÔNOMA'
else
  DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'OPERACIONAL';
DM.qryOrdemServicoMObraDisp.Open;

if DM.qryOrdemServicoEquipeMObra.Active = True then
  begin
    LTotalHH := 0;
    LCusto   := 0;


    DM.qryOrdemServicoEquipe.First;
    while not DM.qryOrdemServicoEquipe.Eof = True do
      begin
        DM.qryOrdemServicoEquipeMObra.First;
        while (not DM.qryOrdemServicoEquipeMObra.Eof = True) do
          begin
            DM.qryOrdemServicoEquipeMObraUtil.First;
            while not (DM.qryOrdemServicoEquipeMObraUtil.Eof  = True) and (DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString <> EmptyStr) do
              begin
                LSalario       := DM.qryOrdemServicoEquipeMObraUtilSALARIO.AsFloat;
                LHomemHora     := DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat;
                LHOficiais     := DM.qryOrdemServicoEquipeMObraUtilHOFICIAIS.AsFloat;
                LHENormal      := DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat;
                LHEFeriado     := DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;
                LPercHENormal  := DM.qryOrdemServicoEquipeMObraUtilHENORMAL.AsFloat/100;
                LPercHEFeriado := DM.qryOrdemServicoEquipeMObraUtilHEFERIADO.AsFloat/100;

                LTotalHH := LTotalHH + DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;
                LCusto := LCusto + ((LSalario/LHOficiais) * LHomemHora) + ((LSalario/LHOficiais) * (LHENormal * (1 + LPercHENormal))) + ((LSalario/LHOficiais) * (LHEFeriado * (1 + LPercHEFeriado)));


                DM.qryOrdemServicoEquipeMObraUtil.Next;
              end;
            DM.qryOrdemServicoEquipeMObra.Next;
          end;
        DM.qryOrdemServicoEquipe.Next;
      end;

    DM.qryOrdemServico.Edit;
    DM.qryOrdemServicoTEMPOHOMEMHORAEXEC.AsFloat := LTotalHH;
    DM.qryOrdemServicoCUSTOMOBRA.AsFloat := LCusto;
    DM.qryOrdemServico.Post;

    DM.qryTotalHomemHoraSeqHora.Close;

    DM.qryOrdemServicoEquipeMObra.Close;
    DM.qryOrdemServicoEquipeMObraMovim.Close;
    DM.qryOrdemServicoEquipeMObraUtil.Close;
    DM.qryOrdemServicoMObraDisp.Close;
  end;

//--------------------------------------------Peças de Reposição-----------------------------------------------------------------
DM.qryOrdemServicoEquipePecasUtil.Open;

LCusto   := 0;

DM.qryOrdemServicoEquipePecasUtil.First;
while not DM.qryOrdemServicoEquipePecasUtil.Eof = True do
  begin
    LCusto := LCusto + (DM.qryOrdemServicoEquipePecasUtilPRECO.AsFloat * DM.qryOrdemServicoEquipePecasUtilQTDESOLIC.AsFloat);

    DM.qryOrdemServicoEquipePecasUtil.Next;
  end;

DM.qryOrdemServico.Edit;
DM.qryOrdemServicoCUSTOPECAS.AsFloat := LCusto;
DM.qryOrdemServico.Post;

DM.qryOrdemServicoEquipePecasUtil.Close;
//-----------------------------------------------Lubrificantes-------------------------------------------------------------------
DM.qryOrdemServicoEquipeLubrificantesUtil.Open;

LCusto   := 0;
DM.qryOrdemServicoEquipeLubrificantesUtil.First;
while not DM.qryOrdemServicoEquipeLubrificantesUtil.Eof = True do
  begin
    LCusto := LCusto + (DM.qryOrdemServicoEquipeLubrificantesUtilPRECO.AsFloat * DM.qryOrdemServicoEquipeLubrificantesUtilQTDESOLIC.AsFloat);

    DM.qryOrdemServicoEquipeLubrificantesUtil.Next;
  end;
DM.qryOrdemServico.Edit;
DM.qryOrdemServicoCUSTORECURSOS.AsFloat := LCusto;
DM.qryOrdemServico.Post;

if DM.qryLubrificantes.Active = True then
  begin
    DM.qryLubrificantes.Edit;
    DM.qryLubrificantes.Post;
  end;
DM.qryOrdemServicoEquipeLubrificantesUtil.Close;
DM.qryLubrificantes.Close;
//-------------------------------------------------Recursos----------------------------------------------------------------------
DM.qryOrdemServicoEquipeRecursosUtil.Open;

LCusto   := 0;
DM.qryOrdemServicoEquipe.First;
DM.qryOrdemServicoEquipeRecursosUtil.First;
while not DM.qryOrdemServicoEquipe.Eof do
  begin
    while not DM.qryOrdemServicoEquipeRecursosUtil.Eof = True do
      begin
        LCusto := LCusto + (DM.qryOrdemServicoEquipeRecursosUtilPRECOHORA.AsFloat * DM.qryOrdemServicoEquipeRecursosUtilQTDESOLIC.AsFloat) * DM.qryOrdemServicoTEMPOEXECUTADO.AsFloat;

        DM.qryOrdemServicoEquipeRecursosUtil.Next;
      end;
    DM.qryOrdemServicoEquipe.Next;
  end;

DM.qryOrdemServico.Edit;
DM.qryOrdemServicoCUSTORECURSOS.AsFloat := LCusto;
DM.qryOrdemServico.Post;

if DM.qryRecursos.Active = True then
  begin
    DM.qryRecursos.Edit;
    DM.qryRecursos.Post;
  end;

DM.qryOrdemServicoEquipeRecursosUtil.Close;
DM.qryRecursos.Close;

if DM.qryOrdemServicoServExec.IsEmpty = False then
  begin
    DM.qryOrdemServicoServExec.Edit;
    DM.qryOrdemServicoServExec.Post;
    DM.qryOrdemServicoServExec.First;
  end;

DM.qryOrdemServicoEquipe.Close;

DM.qryOrdemServico.Edit;
DM.qryOrdemServicoSITUACAO.AsString       := 'FECHADA';
DM.qryOrdemServicoTEMPOEXECUTADO.AsFloat  := MinutesBetween(DM.qryOrdemServicoDATAINICIOREAL.AsDateTime, DM.qryOrdemServicoDATAFIMREAL.AsDateTime)/60;
//if DM.qryOrdemServicoDATAFECHAMENTO.IsNull = True then
  DM.qryOrdemServicoDATAFECHAMENTO.AsDateTime   := DateOf(DM.FDataHoraServidor);

DM.qryOrdemServicoCustoSec.Close;
DM.qryOrdemServicoCustoSec.Params[0].AsString := DM.qryOrdemServicoCODIGO.AsString;
DM.qryOrdemServicoCustoSec.Open;

DM.qryOrdemServico.Edit;
DM.qryOrdemServicoCUSTOSECUNDARIOS.AsFloat      := DM.qryOrdemServicoCustoSecCUSTOTOTALSEC.AsFloat;
DM.qryOrdemServico.Post;

DM.qryOrdemServicoCustoSec.Close;

if DM.qryOrdemServicoGerencia.Active = True then
begin
  if DM.qryOrdemServicoGerencia.Locate('CODIGO', DM.qryOrdemServicoCODIGO.AsString, []) = True then
    begin
      DM.qryOrdemServicoGerencia.Edit;
      DM.qryOrdemServicoGerenciaDATAFECHAMENTO.AsString := DM.qryOrdemServicoDATAFECHAMENTO.AsString;
      DM.qryOrdemServicoGerenciaSITUACAO.AsString       := 'FECHADA';
      DM.qryOrdemServicoGerencia.Post;
    end;
end;

PSituacao.Caption := 'FECHADA';
PSituacao.Color := clGray;
PSituacao.Font.Color := clBlack;

DM.MSGAguarde('', False);
  inherited;
end;

procedure TFrmTelaCadOrdemServicoFechamento.BtnSolicitadoClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.qryOrdemServico.Edit;
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoMATRICULA.AsString := DM.FCodCombo;
        DM.qryOrdemServicoSOLICITANTE.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServicoFechamento.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);

    if (DM.qryUsuarioPAcessoCADORDEMSERVICOFECHAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoFechamentoMObra, FrmTelaCadOrdemServicoFechamentoMObra);
    FrmTelaCadOrdemServicoFechamentoMObra.Caption := 'Fechamento de Mão de Obra da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadOrdemServicoFechamentoMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoFechamentoMObra);
    DM.FDataSetParam    := DM.qryOrdemServico;
    DM.FDataSourceParam := DM.dsOrdemServico;
  End;
end;

procedure TFrmTelaCadOrdemServicoFechamento.Button2Click(Sender: TObject);
begin
  inherited;
PopupMenuPecas.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServicoFechamento.Button3Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);

    if (DM.qryUsuarioPAcessoCADORDEMSERVICOFECHAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoFechamentoRecursos, FrmTelaCadOrdemServicoFechamentoRecursos);
    FrmTelaCadOrdemServicoFechamentoRecursos.Caption := 'Fechamento de Recursos da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadOrdemServicoFechamentoRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoFechamentoRecursos);
    DM.FDataSetParam    := DM.qryOrdemServico;
    DM.FDataSourceParam := DM.dsOrdemServico;
  End;
end;

procedure TFrmTelaCadOrdemServicoFechamento.Button4Click(Sender: TObject);
begin
  inherited;
  if (not DM.qryOrdemServicoCODMANUTPROGEQUIP.IsNull = True) or (not DM.qryOrdemServicoCODLUBRIFICPROGEQUIP.IsNull = True) or (DM.qryOrdemServicoROTAEQUIP.AsString = 'S') then
    Try
      if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaInspFechamento, FrmTelaInspFechamento);
      if not (DM.qryOrdemServicoCODMANUTPROGEQUIP.IsNull = True) and (DM.qryOrdemServicoROTAEQUIP.AsString <> 'S') then
        begin
          if DM.qryManutPeriodicas.Locate('CODORDEMSERVICO', DM.qryOrdemServicoCODIGO.AsString, []) = False then
            begin
              Application.MessageBox('Manutenção já fechada, não está mais disponível para alteração.', 'SPMP3', mb_OK + MB_ICONINFORMATION);
              Exit;
            end
          else
            begin
              DM.qryManutPeriodicas.Edit;
              DM.qryManutPeriodicasSITUACAOOS.AsString := 'FECHADA';
              DM.qryManutPeriodicas.Post;
            end;
        end
      else
      if not (DM.qryOrdemServicoCODLUBRIFICPROGEQUIP.IsNull = True) and (DM.qryOrdemServicoROTAEQUIP.AsString <> 'S') then
        begin
          FrmTelaInspFechamento.PCInspecoes.TabIndex := 1;
          if DM.qryLubrificPeriodicas.Locate('CODORDEMSERVICO', DM.qryOrdemServicoCODIGO.AsString, []) = False then
            begin
              Application.MessageBox('Lubrificação já fechada, não está mais disponível para alteração.', 'SPMP3', mb_OK + MB_ICONINFORMATION);
              Exit;
            end
          else
            begin
              DM.qryLubrificPeriodicas.Edit;
              DM.qryLubrificPeriodicasSITUACAOOS.AsString := 'FECHADA';
              DM.qryLubrificPeriodicas.Post;
            end;
        end
      else
      if DM.qryOrdemServicoROTAEQUIP.AsString = 'S' then
        begin
          FrmTelaInspFechamento.PCInspecoes.TabIndex := 2;
          if DM.qryRotaPeriodicas.Locate('CODORDEMSERVICO', DM.qryOrdemServicoCODIGO.AsString, []) = False then
            begin
              Application.MessageBox('Rota já fechada, não está mais disponível para alteração.', 'SPMP3', mb_OK + MB_ICONINFORMATION);
              Exit;
            end
          else
            begin
              DM.qryRotaPeriodicas.Edit;
              DM.qryRotaPeriodicasSITUACAOOS.AsString := 'FECHADA';
              DM.qryRotaPeriodicas.Post;
            end;
        end;
      FrmTelaInspFechamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaInspFechamento);
    End;
end;

procedure TFrmTelaCadOrdemServicoFechamento.ChbParcialClick(Sender: TObject);
begin
  inherited;
  BtnSalvar.ImageIndex := 115;
end;

procedure TFrmTelaCadOrdemServicoFechamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qrySolicitacaoTrab.Close;
end;

procedure TFrmTelaCadOrdemServicoFechamento.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela := 'CADORDEMSERVICO';
LCustoAlterado := False;

if DM.qryOrdemServicoServExec.Active = False then
  begin
    DM.qryOrdemServicoServExec.Close;
    DM.qryOrdemServicoServExec.Params[0].AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
    DM.qryOrdemServicoServExec.Open;
  end;
DM.qryOrdemServicoServExec.Edit;

if DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA'    then begin PSituacao.Caption := 'PROGRAMADA';    PSituacao.Color := clBlue;   PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'REPROGRAMADA'  then begin PSituacao.Caption := 'REPROGRAMADA';  PSituacao.Color := clBlue;   PSituacao.Font.Color := clYellow; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA' then begin PSituacao.Caption := 'DESPROGRAMADA'; PSituacao.Color := clYellow; PSituacao.Font.Color := clBlue;   end;
if DM.qryOrdemServicoSITUACAO.AsString = 'EXECUCAO'      then begin PSituacao.Caption := 'EXECUÇÃO';      PSituacao.Color := clInfoBk; PSituacao.Font.Color := clGreen;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'LIBERADA'      then begin PSituacao.Caption := 'LIBERADA';      PSituacao.Color := clGreen;  PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'FECHADA'       then begin PSituacao.Caption := 'FECHADA';       PSituacao.Color := clGray;   PSituacao.Font.Color := clBlack;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'PARALISADA'    then begin PSituacao.Caption := 'PARALISADA';    PSituacao.Color := clRed;    PSituacao.Font.Color := clYellow; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'CANCELADA'     then begin PSituacao.Caption := 'CANCELADA';     PSituacao.Color := clBlack;  PSituacao.Font.Color := $00FF8000; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'VENCIDA'       then begin PSituacao.Caption := 'VENCIDA';       PSituacao.Color := clRed;    PSituacao.Color      := clWhite;  end;

edtDataInicioReal.DateTime := DM.qryOrdemServicoDATAINICIOREAL.AsDateTime;
edtDataFimReal.DateTime := DM.qryOrdemServicoDATAFIMREAL.AsDateTime;

if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
  begin
    LblOrigem.Caption := 'Solicitação de Trabalho';
  end
else
if DM.qryOrdemServicoROTAEQUIP.AsString = 'S' then
  begin
    LblOrigem.Caption := 'Rota de Equipamentos';
  end
else
if DM.qryOrdemServicoMANUTPROGEQUIP.AsString <> EmptyStr then
  begin
    LblOrigem.Caption := 'Manutenção Preventiva';
  end
else
if DM.qryOrdemServicoLUBRIFICPROGEQUIP.AsString <> EmptyStr then
  begin
    LblOrigem.Caption := 'Lubrificação Preventiva';
  end
else
  begin
    LblOrigem.Caption := 'MANUAL';
  end;

if DM.qryOrdemServico.IsEmpty = False then
  ControleBotoes(2);

if DM.qryOrdemServicoSITUACAO.AsString = 'CADASTRADA'    then
  begin
    PSituacao.Caption := 'CADASTRADA';
    PSituacao.Font.Color := clRed;
    if DM.qryOrdemServicoCODMANUTENCAO.AsString <> EmptyStr then
      PSituacao.Color := clYellow
    else
      PSituacao.Color := $00BBFFFF;
  end;
end;

procedure TFrmTelaCadOrdemServicoFechamento.GrdServicosExecDblClick(
  Sender: TObject);
begin
  inherited;
if (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'CADASTRADA') or (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'DESPROGRAMADA') or (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'PARALISADA') then
  inherited;
if (DM.qryOrdemServicoServExec.Active = True) and (DM.qryOrdemServicoServExec.RecordCount > 0) then
    if Application.MessageBox('Deseja realmente excluir o serviço?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
      DM.qryOrdemServicoServExec.Delete;
end;

procedure TFrmTelaCadOrdemServicoFechamento.GrdServicosExecKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadOrdemServicoFechamento.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBOrdemServico;
DM.FTabela_auxiliar := 451;
  inherited;

end;

procedure TFrmTelaCadOrdemServicoFechamento.Lubrificantes1Click(
  Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);

    if (DM.qryUsuarioPAcessoCADORDEMSERVICOFECHAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoFechamentoLubrificantes, FrmTelaCadOrdemServicoFechamentoLubrificantes);
    FrmTelaCadOrdemServicoFechamentoLubrificantes.Caption := 'Fechamento de Lubrificantes da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadOrdemServicoFechamentoLubrificantes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoFechamentoLubrificantes);
  End;
end;

procedure TFrmTelaCadOrdemServicoFechamento.PecasdeReposicao1Click(
  Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);

    if (DM.qryUsuarioPAcessoCADORDEMSERVICOFECHAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoFechamentoPecas, FrmTelaCadOrdemServicoFechamentoPecas);
    FrmTelaCadOrdemServicoFechamentoPecas.Caption := 'Fechamento de Peças da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadOrdemServicoFechamentoPecas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoFechamentoPecas);
  End;
end;

end.

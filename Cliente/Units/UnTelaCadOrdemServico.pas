unit UnTelaCadOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, Data.DB, System.DateUtils, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServico = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    Label5: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    PSituacao: TPanel;
    Label8: TLabel;
    EdtManutencao: TDBEdit;
    BtnManutencao: TButton;
    Label6: TLabel;
    EdtMotivo: TDBEdit;
    BtnMotivo: TButton;
    Label7: TLabel;
    EdtFalha: TDBEdit;
    BtnFalha: TButton;
    Label9: TLabel;
    EdtCentroCusto: TDBEdit;
    BtnCentroCusto: TButton;
    Label10: TLabel;
    EdtSolicitado: TDBEdit;
    BtnSolicitado: TButton;
    Label11: TLabel;
    Label12: TLabel;
    CBPrioridade: TDBComboBox;
    CBCriticidade: TDBComboBox;
    Label13: TLabel;
    EdtOficina: TDBEdit;
    BtnOficina: TButton;
    Label14: TLabel;
    EdtOSPrincipal: TDBEdit;
    BtnOSPrincipal: TButton;
    ChbParado: TDBCheckBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EdtTempoPrev: TDBEdit;
    Label18: TLabel;
    LblHomemHora: TDBText;
    GrdServicosExec: TDBGrid;
    LblOrigem: TLabel;
    ChbAutonomo: TDBCheckBox;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    PopupMenuPecas: TPopupMenu;
    PecasdeReposicao1: TMenuItem;
    Lubrificantes1: TMenuItem;
    PopupMenuCons: TPopupMenu;
    Codigo1: TMenuItem;
    Descricao1: TMenuItem;
    Label20: TLabel;
    EdtResponsavel: TDBEdit;
    BtnResponsavel: TButton;
    Label28: TLabel;
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOSPrincipalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure GrdServicosExecKeyPress(Sender: TObject; var Key: Char);
    procedure Individual1Click(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnManutencaoClick(Sender: TObject);
    procedure BtnCentroCustoClick(Sender: TObject);
    procedure BtnMotivoClick(Sender: TObject);
    procedure BtnSolicitadoClick(Sender: TObject);
    procedure BtnFalhaClick(Sender: TObject);
    procedure BtnOficinaClick(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure PecasdeReposicao1Click(Sender: TObject);
    procedure Lubrificantes1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure GrdServicosExecDblClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
    procedure BtnResponsavelClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServico: TFrmTelaCadOrdemServico;

implementation

{$R *.dfm}

uses UnTelaCadOrdemServicoMObra, UnTelaCadOrdemServicoPecas,
  UnTelaCadOrdemServicoRecursos, UnTelaCadOrdemServicoPlanoTrab,
  UnTelaCadEquipamentos, UnTelaCadTipoManutencao, UnTelaCadMotivoParada,
  UnTelaCadCausaFalha, UnTelaCadCentroCusto, UnTelaCadFuncionarios,
  UnTelaCadOficinas, UnDmRelatorios, UnTelaCadOrdemServicoLubrificantes,
  UnTelaCadSolicitacaoTrab, UnTelaCadOrdemServicoGerencia, UnDM,
  UnTelaCadOrdemServicoMObraProg;

procedure TFrmTelaCadOrdemServico.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
DM.qryOrdemServicoServSolic.Cancel;
DM.qryOrdemServico.Cancel;
end;

procedure TFrmTelaCadOrdemServico.BtnCentroCustoClick(Sender: TObject);
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
      if (DM.qryUsuarioPAcessoCADCENTROCUSTO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
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

procedure TFrmTelaCadOrdemServico.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 45;
  inherited;
if DM.qryOrdemServicoCODIGO.IsNull then Exit;

if DM.qryOrdemServicoGerencia.Active = True then
  DM.qryOrdemServicoGerencia.Locate('CODIGO', DM.qryOrdemServicoCODIGO.AsInteger, []);

if DM.qryOrdemServicoSOLICITACAOTRAB.AsString <> EmptyStr then
  begin
    LblOrigem.Caption := DM.qryOrdemServicoSOLICITACAOTRAB.AsString;
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

if DM.qryOrdemServicoSITUACAO.AsString = 'CADASTRADA'    then
  begin
    PSituacao.Caption := 'CADASTRADA';
    PSituacao.Font.Color := clRed;
    if DM.qryOrdemServicoCODMANUTENCAO.AsString <> EmptyStr then
      PSituacao.Color := clYellow
    else
      PSituacao.Color := $00BBFFFF;
  end;

if DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA'    then
  begin
    PSituacao.Caption := 'SOLICITADA';
    PSituacao.Font.Color := clBlack;
    if DM.qryOrdemServicoCODMANUTENCAO.AsString <> EmptyStr then
      PSituacao.Color := clWhite
    else
      PSituacao.Color := $00F3F3F3;
  end;

if DM.qryOrdemServicoSOLICTRAB.AsString = 'S'    then
  begin
    PSituacao.ShowHint := True;
    PSituacao.Hint := DM.qryOrdemServicoJUSTIFICATIVA.AsString;
  end
else
  begin
    PSituacao.ShowHint := False;
    PSituacao.Hint := '';
  end;

if DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA'    then begin PSituacao.Caption := 'SOLICITADA';    PSituacao.Color := clWhite;  PSituacao.Font.Color := clBlack;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'DETALHADA'     then begin PSituacao.Caption := 'DETALHADA';     PSituacao.Color := clYellow; PSituacao.Font.Color := clGreen;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA'    then begin PSituacao.Caption := 'PROGRAMADA';    PSituacao.Color := clBlue;   PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'REPROGRAMADA'  then begin PSituacao.Caption := 'REPROGRAMADA';  PSituacao.Color := clBlue;   PSituacao.Font.Color := clYellow; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA' then begin PSituacao.Caption := 'DESPROGRAMADA'; PSituacao.Color := clYellow; PSituacao.Font.Color := clBlue;   end;
if DM.qryOrdemServicoSITUACAO.AsString = 'EXECUCAO'      then begin PSituacao.Caption := 'EXECUÇÃO';      PSituacao.Color := clInfoBk; PSituacao.Font.Color := clGreen;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'LIBERADA'      then begin PSituacao.Caption := 'LIBERADA';      PSituacao.Color := clGreen;  PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'FECHADA'       then begin PSituacao.Caption := 'FECHADA';       PSituacao.Color := clGray;   PSituacao.Font.Color := clBlack;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'PARALISADA'    then begin PSituacao.Caption := 'PARALISADA';    PSituacao.Color := clRed;    PSituacao.Font.Color := clYellow; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'CANCELADA'     then begin PSituacao.Caption := 'CANCELADA';     PSituacao.Color := clBlack;  PSituacao.Font.Color := $00FF8000; end;
end;

procedure TFrmTelaCadOrdemServico.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    DM.qryOrdemServico.Edit;
    if DM.FParamAuxiliar[1] = '' then
      begin
        PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        Exit;
      end
    else
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoCODEQUIPAMENTO.AsString := DM.FCodCombo;
        DM.qryOrdemServicoEQUIPAMENTO.AsString    := DM.FValorCombo;
        DM.qryOrdemServicoAREA.AsString := DM.FParamAuxiliar[2];
        DM.qryOrdemServicoCELULA.AsString := DM.FParamAuxiliar[3];
        DM.qryOrdemServicoLINHA.AsString := DM.FParamAuxiliar[4];
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryEquipamentosCODIGO, DM.qryFormatoCodigoEQUIPAMENTOS, FrmTelaCadEquipamentos) = False then exit;
      Application.CreateForm(TFrmTelaCadEquipamentos, FrmTelaCadEquipamentos);
      FrmTelaCadEquipamentos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadEquipamentos);
    End;
  end;
DM.FParamAuxiliar[1] := '';
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServico.BtnExcluirClick(Sender: TObject);
var
LMotivo : String;
begin
//if (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'CADASTRADA') or (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'DESPROGRAMADA') or (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'PARALISADA') then
//  inherited;
//DM.qryOrdemServicoGerencia.Delete;
//DM.qryOrdemServicoServSolic.Close;
//DM.qryOrdemServicoServSolic.Open;

if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (DM.qryOrdemServicoSITUACAO.AsString = 'CADASTRADA') or (DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA') or (DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA') then
  begin
    if Application.MessageBox('Deseja realmente cancelar a O.S. ?','SPMP', MB_YESNO + MB_ICONWARNING) = MRYes then
      begin
        LMotivo := DM.CampoInputBox('SPMP', 'Informe o motivo do cancelamento:');
        if LMotivo = EmptyStr then
          begin
            PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'É OBRIGATÓRIO INFORMAR O MOTIVO DO CANCELAMENTO!'; Exit;
          end;

        DM.qryOrdemServico.Edit;
        DM.qryOrdemServicoOBSERVACOES.AsString := LMotivo;
        DM.qryOrdemServicoSITUACAO.AsString    := 'CANCELADA';
        DM.qryOrdemServico.Post;

        if DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger then
          if DM.qryOrdemServicoGerencia.Locate('CODIGO', DM.qryOrdemServicoCODIGO.AsInteger, []) = False then Exit;

        DM.qryOrdemServicoGerencia.Edit;
        DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'CANCELADA';
        DM.qryOrdemServicoGerencia.Post;
//
        with DM.qryAuxiliar do
          begin
            Close;
            SQL.Add('UPDATE manutprogequipamentohist SET SITUACAO = ''FECHADA'', REALIZADA = ''N'' WHERE CODORDEMSERVICO = '+QuotedStr(DM.qryOrdemServicoCODIGO.AsString)+' AND CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+';'
                     + ' UPDATE lubrificprogequipamentohist SET SITUACAO = ''FECHADA'', REALIZADA = ''N'' WHERE CODORDEMSERVICO = '+QuotedStr(DM.qryOrdemServicoCODIGO.AsString)+' AND CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+';');
            Execute;
          end;
        PSituacao.Caption := 'CANCELADA';
        PSituacao.Color := clBlack;
        PSituacao.Font.Color := $00FF8000;
      end;
  end;
end;

procedure TFrmTelaCadOrdemServico.BtnFalhaClick(Sender: TObject);
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
        DM.qryOrdemServicoFALHA.AsString         := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCAUSASFALHA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
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

procedure TFrmTelaCadOrdemServico.BtnManutencaoClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 100;
    DM.FNomeConsulta := 'Tipos de Manutenções';
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
      if (DM.qryUsuarioPAcessoCADMANUTENCAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
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

procedure TFrmTelaCadOrdemServico.BtnMotivoClick(Sender: TObject);
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
      if (DM.qryUsuarioPAcessoCADMOTIVOPARADA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
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

procedure TFrmTelaCadOrdemServico.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if DM.qryOrdemServico.Active = False then
  begin
//    DM.qryOrdemServico.Close;
//    DM.qryOrdemServico.Params[0].AsInteger := -1;
//    DM.qryOrdemServico.Params[1].AsString  := DM.FCodEmpresa;
    DM.qryOrdemServico.Open;
  end;

//DM.FDataHoraServidor := DM.DataHoraServidor;

PAuxiliares.Font.Color  := clBlack;
PAuxiliares.Caption     := '';
PIdentificacao.Enabled  := True;
PProgramacao.Enabled    := True;
PDiversos.Enabled       := True;

DM.qryOrdemServicoCODEMPRESA.AsString        := DM.FCodEmpresa;
DM.qryOrdemServicoATIVO.AsString             := 'S';
DM.qryOrdemServicoVISIVEL.AsString           := 'S';
//DM.qryOrdemServicoDATACADASTRO.AsDateTime    := DM.FDataHoraServidor;
//DM.qryOrdemServicoDATAULTALT.AsDateTime      := DM.FDataHoraServidor;
//DM.qryOrdemServicoCODUSUARIOCAD.AsString     := DM.FCodUsuario;
//DM.qryOrdemServicoCODUSUARIOALT.AsString     := DM.FCodUsuario;
DM.qryOrdemServicoSITUACAO.AsString          := 'CADASTRADA';
DM.qryOrdemServicoEQUIPPARADO.AsString       := 'S';
DM.qryOrdemServicoIMPPLANOTRAB.AsString      := 'S';
DM.qryOrdemServicoREPROGRAMADA.AsString      := 'N';
DM.qryOrdemServicoROTAEQUIP.AsString         := 'N';
DM.qryOrdemServicoPARCIAL.AsString           := 'N';
DM.qryOrdemServicoEXECAUTONOMO.AsString      := 'N';
DM.qryOrdemServicoCUSTOMOBRA.AsFloat         := 0;
DM.qryOrdemServicoCUSTORECURSOS.AsFloat      := 0;
DM.qryOrdemServicoCUSTOPECAS.AsFloat         := 0;
DM.qryOrdemServicoCUSTOEXTRA.AsFloat         := 0;
DM.qryOrdemServicoCUSTOSECUNDARIOS.AsFloat   := 0;
DM.qryOrdemServicoQTDEREPROG.AsFloat         := 0;
DM.qryOrdemServicoTEMPOPREVISTO.AsFloat      := 0;
DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat     := 0;
DM.qryOrdemServicoTEMPOEXECUTADO.AsFloat     := 0;
DM.qryOrdemServicoTEMPOHOMEMHORAEXEC.AsFloat := 0;

PSituacao.Caption := 'CADASTRADA';
PSituacao.Font.Color := clRed;
if DM.qryOrdemServicoCODMANUTENCAO.AsString <> '' then
  PSituacao.Color := clYellow
else
  PSituacao.Color := $00BBFFFF;

EdtCodigo.ReadOnly := True;
EdtDescricao.ReadOnly := False;
EdtDescricao.SetFocus;
end;

procedure TFrmTelaCadOrdemServico.BtnOficinaClick(Sender: TObject);
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
      if (DM.qryUsuarioPAcessoCADOFICINAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
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

procedure TFrmTelaCadOrdemServico.BtnOSPrincipalClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServico.Active = False then Exit;
if DM.qryOrdemServico.IsEmpty = True then Exit;
DM.FTabela_auxiliar := 450;
DM.FNomeConsulta := 'Ordens de Serviços';
DM.qryOrdemServico.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    if DM.FCodCombo <> DM.qryOrdemServicoCODIGO.AsString then
      DM.qryOrdemServicoCODOSPRINCIPAL.AsString := DM.FCodCombo;
  end;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServico.BtnResponsavelClick(Sender: TObject);
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
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
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

procedure TFrmTelaCadOrdemServico.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'PROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA')
    and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'REPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') then Exit;

if DM.qryOrdemServicoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DA O.S.!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryOrdemServicoCODMANUTENCAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A MANUTENÇÃO DA O.S.!'; EdtManutencao.SetFocus; Exit;
  end;
//if DM.qryOrdemServicoCODMOTIVOPARADA.IsNull = True then
//  begin
//    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O MOTIVO DA O.S.!'; EdtMotivo.SetFocus; Exit;
//  end;
//if DM.qryOrdemServicoCODCAUSAFALHA.IsNull = True then
//  begin
//    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FALHA QUE GEROU A O.S.!'; EdtFalha.SetFocus; Exit;
//  end;
if DM.qryOrdemServicoCODCENTROCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CENTRO DE CUSTO DA O.S.!'; EdtCentroCusto.SetFocus; Exit;
  end;
if DM.qryOrdemServicoCODCENTROCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CENTRO DE CUSTO DA O.S.!'; EdtCentroCusto.SetFocus;
    Exit;
  end;
//if DM.qryOrdemServicoMATRICULA.IsNull = True then
//  begin
//    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O SOLICITANTE DA O.S.!'; EdtSolicitado.SetFocus; Exit;
//  end;
if DM.qryOrdemServicoPRIORIDADEPARADA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A PRIORIDADE DA O.S.!'; CBPrioridade.SetFocus; Exit;
  end;
if DM.qryOrdemServicoCRITICIDADE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CRITICIDADE DA O.S.!'; CBCriticidade.SetFocus; Exit;
  end;
if DM.qryOrdemServicoTEMPOPREVISTO.AsFloat <= 0 then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TEMPO PREVISTO DA O.S.!'; EdtTempoPrev.SetFocus; Exit;
  end;

if DM.qryOrdemServicoSOLICTRAB.IsNull then DM.qryOrdemServicoSOLICTRAB.AsString := 'N';

if DM.qryOrdemServicoCODOFICINA.IsNull then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A OFICINA DA O.S.!'; EdtOficina.SetFocus; Exit;
  end;

if DM.qryOrdemServicoCODOFICINA.IsNull then DM.qryOrdemServicoLOCAL.AsString := 'LOCAL'
else DM.qryOrdemServicoLOCAL.AsString := 'AREA';

if DM.qryOrdemServicoCODOSPRINCIPAL.IsNull then DM.qryOrdemServicoSUBORDEMSERVICO.AsString := 'N'
else DM.qryOrdemServicoSUBORDEMSERVICO.AsString := 'S';

if DM.qryOrdemServicoEXECAUTONOMO.IsNull then DM.qryOrdemServicoEXECAUTONOMO.AsString := 'N';

DM.qryOrdemServicoIMPORTANCIA.AsInteger := DM.AnalisarImportancia;

if (DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA') then
  begin
    DM.qryOrdemServicoEquipe.Open;
    DM.qryOrdemServicoEquipeMObra.Open;
    if DM.qryOrdemServicoEquipeMObra.RecordCount > 0 then
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

      PSituacao.Caption := 'DETALHADA';
      PSituacao.Color := clYellow;
      PSituacao.Font.Color := clGreen;
    end
    else
    begin
      DM.qryOrdemServico.Edit;
      DM.qryOrdemServicoSITUACAO.AsString := 'CADASTRADA';

      if DM.qryOrdemServicoGerencia.Locate('CODIGO', DM.qryOrdemServicoCODIGO.AsInteger,[]) = True then
        begin
          DM.qryOrdemServicoGerencia.Edit;
          DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'CADASTRADA';
          DM.qryOrdemServicoGerencia.Post;
        end;

      PSituacao.Caption := 'CADASTRADA';
      PSituacao.Color := clYellow;
      PSituacao.Font.Color := clRed;
    end;

    DM.qryOrdemServicoEquipe.Close;
    DM.qryOrdemServicoEquipeMObra.Close;
  end
else
  begin
    DM.qryOrdemServicoEquipe.Open;
    DM.qryOrdemServicoEquipeMObra.Open;
    if DM.qryOrdemServicoEquipeMObra.RecordCount > 0 then
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

      PSituacao.Caption := 'DETALHADA';
      PSituacao.Color := clYellow;
      PSituacao.Font.Color := clGreen;
    end;
    DM.qryOrdemServicoEquipe.Close;
    DM.qryOrdemServicoEquipeMObra.Close;
  end;

DM.MSGAguarde('');

  inherited;
DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
DM.qryOrdemServico.Params[1].AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;

DM.qryOrdemServicoGerencia.Refresh;

if DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger <= 0 then
  begin

    DM.qryOrdemServicoServSolic.First;
    while not DM.qryOrdemServicoServSolic.Eof = True do
      begin
        DM.qryOrdemServicoServSolic.Edit;
        DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
        DM.qryOrdemServicoServSolicCODEMPRESA.AsString := DM.FCodEmpresa;
        DM.qryOrdemServicoServSolic.Post;

        DM.qryOrdemServicoServSolic.Next;
      end;

  end;

DM.qryPlanoTrabalhoAut.Close;
DM.qryPlanoTrabalhoAut.Params[0].AsString := DM.FCodEmpresa;
DM.qryPlanoTrabalhoAut.Open;
DM.qryPlanoTrabalhoAut.First;
while not DM.qryPlanoTrabalhoAut.Eof = True do
  begin
    if DM.qryOrdemServicoEquipePlanoTrab.Locate('CODPLANOTRABALHO', DM.qryPlanoTrabalhoAutCODIGO.AsString, []) = False then
      begin
        DM.qryOrdemServicoEquipePlanoTrab.Append;
        DM.qryOrdemServicoEquipePlanoTrabCODEMPRESA.AsString       := DM.FCodEmpresa;
        DM.qryOrdemServicoEquipePlanoTrabCODORDEMSERVICO.AsInteger  := DM.qryOrdemServicoCODIGO.AsInteger;
        DM.qryOrdemServicoEquipePlanoTrabCODPLANOTRABALHO.AsString := DM.qryPlanoTrabalhoAutCODIGO.AsString;
        DM.qryOrdemServicoEquipePlanoTrabPLANOTRABALHO.AsString    := DM.qryPlanoTrabalhoAutDESCRICAO.AsString;
        DM.qryOrdemServicoEquipePlanoTrabIMPRIMIR.AsString         := 'S';
        DM.qryOrdemServicoEquipePlanoTrabDETALHES.AsString         := DM.qryPlanoTrabalhoAutDETALHES.AsString;
        DM.qryOrdemServicoEquipePlanoTrab.Post;
      end;

    DM.qryPlanoTrabalhoAut.Next;
  end;
DM.qryPlanoTrabalhoAut.Close;

if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodigo.ReadOnly := True;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadOrdemServico.BtnSolicitadoClick(Sender: TObject);
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
        DM.qryOrdemServicoMATRICULA.AsString   := DM.FCodCombo;
        DM.qryOrdemServicoSOLICITANTE.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
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

procedure TFrmTelaCadOrdemServico.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryOrdemServicoCODIGO.AsInteger <= 0 then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadOrdemServicoMObra, FrmTelaCadOrdemServicoMObra);
    FrmTelaCadOrdemServicoMObra.Caption := 'Mão de Obra da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadOrdemServicoMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoMObra);
    DM.FDataSetParam    := DM.qryOrdemServico;
    DM.FDataSourceParam := DM.dsOrdemServico;
  End;
end;

procedure TFrmTelaCadOrdemServico.Button2Click(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoCODIGO.AsInteger <= 0 then
  begin
    BtnSalvar.OnClick(Sender);
    Exit;
  end;

PopupMenuPecas.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOficinas;
DM.FTela            := 'CADORDEMSERVICO';
DM.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadOrdemServico.Button3Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryOrdemServicoCODIGO.AsInteger <= 0 then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadOrdemServicoRecursos, FrmTelaCadOrdemServicoRecursos);
    FrmTelaCadOrdemServicoRecursos.Caption := 'Recursos da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadOrdemServicoRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoRecursos);
    DM.FDataSetParam    := DM.qryOrdemServico;
    DM.FDataSourceParam := DM.dsOrdemServico;
  End;
end;

procedure TFrmTelaCadOrdemServico.Button4Click(Sender: TObject);
begin
  inherited;
  if DM.qryOrdemServicoEquipePlanoTrab.Active = False then DM.qryOrdemServicoEquipePlanoTrab.Open;
  Try
    if DM.qryOrdemServicoCODIGO.AsInteger <= 0 then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadOrdemServicoPlanoTrab, FrmTelaCadOrdemServicoPlanoTrab);
    FrmTelaCadOrdemServicoPlanoTrab.Caption := 'Planos de Trabalho da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadOrdemServicoPlanoTrab.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoPlanoTrab);
    DM.FDataSetParam    := DM.qryOrdemServico;
    DM.FDataSourceParam := DM.dsOrdemServico;
  End;
end;

procedure TFrmTelaCadOrdemServico.Button5Click(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoCODSOLICITACAOTRAB.IsNull = False then
  begin
    Try
      if (DM.qryUsuarioPAcessoCADSOLICITACAOTRAB.AsString <> 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then Exit;
      DM.qrySolicitacaoTrab.Close;
      DM.qrySolicitacaoTrab.Params[0].AsString := DM.qryOrdemServicoCODSOLICITACAOTRAB.AsString;
      DM.qrySolicitacaoTrab.Params[1].AsString := DM.FCodEmpresa;
      DM.qrySolicitacaoTrab.Open;
      DM.qrySolicitacaoTrab.Edit;

      Application.CreateForm(TFrmTelaCadSolicitacaoTrab, FrmTelaCadSolicitacaoTrab);

      with FrmTelaCadSolicitacaoTrab do
        begin
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'SOLICITADA'    then begin PSituacao.Caption := 'SOLICITADA';    PSituacao.Color := clWhite;  PSituacao.Font.Color := clBlack;  end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'CADASTRADA'    then begin PSituacao.Caption := 'CADASTRADA';    PSituacao.Color := clRed;    PSituacao.Font.Color := clYellow; end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'PROGRAMADA'    then begin PSituacao.Caption := 'PROGRAMADA';    PSituacao.Color := clBlue;   PSituacao.Font.Color := clWhite;  end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'REPROGRAMADA'  then begin PSituacao.Caption := 'REPROGRAMADA';  PSituacao.Color := clBlue;   PSituacao.Font.Color := clYellow; end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'DESPROGRAMADA' then begin PSituacao.Caption := 'DESPROGRAMADA'; PSituacao.Color := clYellow; PSituacao.Font.Color := clBlue;   end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'EXECUCAO'      then begin PSituacao.Caption := 'EXECUÇÃO';      PSituacao.Color := clInfoBk; PSituacao.Font.Color := clGreen;  end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'LIBERADA'      then begin PSituacao.Caption := 'LIBERADA';      PSituacao.Color := clGreen;  PSituacao.Font.Color := clWhite;  end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'FECHADA'       then begin PSituacao.Caption := 'FECHADA';       PSituacao.Color := clGray;   PSituacao.Font.Color := clBlack;  end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'PARALISADA'    then begin PSituacao.Caption := 'PARALISADA';    PSituacao.Color := clRed;    PSituacao.Font.Color := clYellow; end;
          if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'CANCELADA'     then begin PSituacao.Caption := 'CANCELADA';     PSituacao.Color := clBlack;  PSituacao.Font.Color := $00FF8000; end;

          if DM.qrySolicitacaoTrabSITUACAO_1.AsString <> '' then
            begin
              if (DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'CANCELADA') then
                begin
                  PAuxiliares.Font.Color  := clRed;
                  PAuxiliares.Caption     := 'ORDEM DE SERVIÇO CANCELADA, ALTERAÇÕES NÃO PERMITIDAS!';
                  PIdentificacao.Enabled  := False;
                  PProgramacao.Enabled    := False;
                  PDiversos.Enabled       := False;
                end;
            end;
        end;

      FrmTelaCadSolicitacaoTrab.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadSolicitacaoTrab);
      DM.FDataSetParam    := DM.qryOrdemServico;
      DM.FDataSourceParam := DM.dsOrdemServico;
      FrmTelaCadOrdemServicoGerencia.ConfigurarFiltros;
      DM.qryOrdemServicoGerencia.Locate('CODIGO', DM.qryOrdemServicoCODIGO.AsInteger, []);
    End;
  end;
end;

procedure TFrmTelaCadOrdemServico.Button6Click(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOPROGRAMAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;

if (DM.qryOrdemServicoSITUACAO.AsString = 'CADASTRADA') or (DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA')
  or (DM.qryOrdemServicoSITUACAO.AsString = 'REPROGRAMADA') or (DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA')
    or (DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA') then
    begin
      Try
        if DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat = 0 then
          begin
            PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'MÃO DE OBRA NÃO CADASTRADA!'; Exit;
          end;

        Application.CreateForm(TFrmTelaCadOrdemServicoMObraProg, FrmTelaCadOrdemServicoMObraProg);
        FrmTelaCadOrdemServicoMObraProg.ShowModal;
      Finally
        FreeAndNil(FrmTelaCadOrdemServicoMObraProg);
        PAuxiliares.Caption := '';
        PAuxiliares.Font.Color := clBlack;
      End;
    end
  else
    begin
      PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'O.S. JÁ PROCESSADA!'; Exit;
    end;

end;

procedure TFrmTelaCadOrdemServico.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadOrdemServico.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qryPlanoTrabalhoAut.Close;
DM.qryOrdemServicoServSolic.Close;
DM.qryOrdemServicoEquipePlanoTrab.Close;
DM.qryOrdemServico.Close;
end;

procedure TFrmTelaCadOrdemServico.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela := 'CADORDEMSERVICO';

if DM.qryOrdemServicoServSolic.Active = False then
  begin
    DM.qryOrdemServicoServSolic.Close;
    DM.qryOrdemServicoServSolic.Params[0].AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
    DM.qryOrdemServicoServSolic.Open;
  end;
//DM.qryOrdemServicoServSolic.Edit;

DM.qryOrdemServicoEquipePlanoTrab.Open;

if DM.qryOrdemServicoSITUACAO.AsString = 'SOLICITADA'    then begin PSituacao.Caption := 'SOLICITADA';    PSituacao.Color := clWhite;  PSituacao.Font.Color := clBlack;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'CADASTRADA'    then begin PSituacao.Caption := 'CADASTRADA';    PSituacao.Color := clYellow; PSituacao.Font.Color := clRed;    end;
if DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA'    then begin PSituacao.Caption := 'PROGRAMADA';    PSituacao.Color := clBlue;   PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'REPROGRAMADA'  then begin PSituacao.Caption := 'REPROGRAMADA';  PSituacao.Color := clBlue;   PSituacao.Font.Color := clYellow; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA' then begin PSituacao.Caption := 'DESPROGRAMADA'; PSituacao.Color := clYellow; PSituacao.Font.Color := clBlue;   end;
if DM.qryOrdemServicoSITUACAO.AsString = 'EXECUCAO'      then begin PSituacao.Caption := 'EXECUÇÃO';      PSituacao.Color := clInfoBk; PSituacao.Font.Color := clGreen;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'LIBERADA'      then begin PSituacao.Caption := 'LIBERADA';      PSituacao.Color := clGreen;  PSituacao.Font.Color := clWhite;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'FECHADA'       then begin PSituacao.Caption := 'FECHADA';       PSituacao.Color := clGray;   PSituacao.Font.Color := clBlack;  end;
if DM.qryOrdemServicoSITUACAO.AsString = 'PARALISADA'    then begin PSituacao.Caption := 'PARALISADA';    PSituacao.Color := clRed;    PSituacao.Font.Color := clYellow; end;
if DM.qryOrdemServicoSITUACAO.AsString = 'CANCELADA'     then begin PSituacao.Caption := 'CANCELADA';     PSituacao.Color := clBlack;  PSituacao.Font.Color := $00FF8000; end;

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


if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
  begin
    PSituacao.ShowHint := True;
    PSituacao.Hint := DM.qryOrdemServicoJUSTIFICATIVA.AsString;
  end
else
  begin
    PSituacao.ShowHint := False;
    PSituacao.Hint := '';
  end;


if DM.qryOrdemServico.IsEmpty = False then
  ControleBotoes(2);

if DM.qryOrdemServicoSITUACAO.AsString <> '' then
  begin
  if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') then
    begin
      PAuxiliares.Font.Color  := clRed;
      PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
      PIdentificacao.Enabled  := False;
      PProgramacao.Enabled    := False;
      PDiversos.Enabled       := False;
    end;
  end;
end;

procedure TFrmTelaCadOrdemServico.GrdServicosExecDblClick(Sender: TObject);
begin
  inherited;
if (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'CADASTRADA') or (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'SOLICITADA') or (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'DESPROGRAMADA') or (Trim(DM.qryOrdemServicoSITUACAO.AsString) = 'PARALISADA') then
  inherited;
if (DM.qryOrdemServicoServSolic.Active = True) and (DM.qryOrdemServicoServSolic.RecordCount > 0) then
  begin
    if Application.MessageBox('Deseja realmente excluir o serviço?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
      DM.qryOrdemServicoServSolic.Delete;
  end;
end;

procedure TFrmTelaCadOrdemServico.GrdServicosExecKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (GrdServicosExec.SelectedIndex = 3) and (Key <> #13) and (Key <> #9) then
  Key := #0;
end;

procedure TFrmTelaCadOrdemServico.Individual1Click(Sender: TObject);
begin
//DM.FDataSetRelat    := DmRelatorios.frxDBEquipIndividual;
//DM.FTabela_auxiliar := 451;
//  inherited;
if DM.qryOrdemServicoOFICINA.AsString = EmptyStr then
  DM.qryOrdemServicoOFICINA.AsString := 'Local';

DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeMObra.Open;
DM.qryOrdemServicoEquipeRecursosUtil.Open;
DM.qryOrdemServicoEquipePecasUtil.Open;
DM.qryOrdemServicoEquipePlanoTrab.Open;

//if Application.MessageBox('Deseja anexar alguma imagem?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYES then
//  begin
//    DM.qryOrdemServicoEquipeImagens.Close;
//    DM.qryOrdemServicoEquipeImagens.Params[0].AsString := DM.FCodEmpresa;
//    DM.qryOrdemServicoEquipeImagens.Params[1].AsString := DM.qryOrdemServicoCODEQUIPAMENTO.AsString;
//    DM.qryOrdemServicoEquipeImagens.Open;
//  end;

DmRelatorios.frxROrdemServico.ShowReport();
end;

procedure TFrmTelaCadOrdemServico.Lubrificantes1Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryOrdemServicoCODIGO.AsInteger <= 0 then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadOrdemServicoLubrificantes, FrmTelaCadOrdemServicoLubrificantes);
    FrmTelaCadOrdemServicoLubrificantes.Caption := 'Lubrificantes da O.S.: '+ DM.qryOrdemServicoCODIGO.AsString;
    FrmTelaCadOrdemServicoLubrificantes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoLubrificantes);
  End;
end;

procedure TFrmTelaCadOrdemServico.PecasdeReposicao1Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.qryOrdemServicoCODIGO.AsInteger <= 0 then
      begin
        BtnSalvar.OnClick(Sender);
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryOrdemServicoCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadOrdemServicoPecas, FrmTelaCadOrdemServicoPecas);
    FrmTelaCadOrdemServicoPecas.Caption := 'Peças da O.S.: '+ DM.qryOrdemServicoCODIGO.AsString;
    FrmTelaCadOrdemServicoPecas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoPecas);
  End;
end;

end.



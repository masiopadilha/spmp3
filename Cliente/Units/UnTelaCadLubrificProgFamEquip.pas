unit UnTelaCadLubrificProgFamEquip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.Mask, JvExStdCtrls, JvRichEdit, JvDBRichEdit, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadLubrificProgFamEquip = class(TFrmTelaPaiCadastros)
    BtnFamilia: TButton;
    BtnMonitoramento: TButton;
    ChbAtivo: TDBCheckBox;
    ChbVisivel: TDBCheckBox;
    EdtCodFamilia: TDBEdit;
    EdtCodLubrificacao: TDBEdit;
    EdtDescFamilia: TDBEdit;
    EdtDescLubrificacao: TDBEdit;
    EdtDescMonitoramento: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    GrdPlanoTrabalho: TDBGrid;
    Label8: TLabel;
    EdtProgramacao1: TEdit;
    Label9: TLabel;
    EdtProgramacao2: TDBEdit;
    BtnProgramacao: TButton;
    Label10: TLabel;
    EdtProgramacao3: TEdit;
    PopupMenuProgramacao: TPopupMenu;
    Consultar1: TMenuItem;
    ExcluirCorp: TMenuItem;
    REDetalhes: TJvDBRichEdit;
    GrdItens: TDBGrid;
    chbClonavel: TDBCheckBox;
    Label13: TLabel;
    EdtCodOficina: TDBEdit;
    EdtDescOficina: TDBEdit;
    BtnOficina: TButton;
    Label28: TLabel;
    Label11: TLabel;
    EdtDias: TDBEdit;
    Label12: TLabel;
    EdtManutencao: TDBEdit;
    BtnManutencao: TButton;
    Label21: TLabel;
    ChbParado: TDBCheckBox;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdPlanoTrabalhoDblClick(Sender: TObject);
    procedure GrdPlanoTrabalhoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdPlanoTrabalhoTitleClick(Column: TColumn);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodLubrificacaoExit(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure ExcluirCorpClick(Sender: TObject);
    procedure BtnProgramacaoClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnMonitoramentoClick(Sender: TObject);
    procedure BtnOficinaClick(Sender: TObject);
    procedure BtnManutencaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadLubrificProgFamEquip: TFrmTelaCadLubrificProgFamEquip;
  LConfirmouSalvar: Boolean;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadFamiliaEquipamento,
  UnTelaCadMonitoramento, UnDmRelatorios,
  UnTelaCadLubrificProgFamEquipPartes, UnTelaCadLubrificProgFamEquipPartesItens,
  UnDM, UnTelaCadOficinas, UnTelaCadTipoManutencao;

procedure TFrmTelaCadLubrificProgFamEquip.BtnCancelarClick(Sender: TObject);
begin
  inherited;
DM.qryLubrificProgFamEquipPlanoTrab.Close;
DM.qryLubrificProgFamEquipPartes.Close;
DM.qryLubrificProgFamEquipItens.Close;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnConsultarClick(Sender: TObject);
begin
  inherited;
DM.FTabela_auxiliar  := 35;
if DM.qryLubrificProgFamEquip.IsEmpty = False then
  begin
    DM.qryLubrificProgFamEquipPartes.Close;
//    DM.qryLubrificProgFamEquipPartes.Params[0].AsString := DM.FCodEmpresa;
//    DM.qryLubrificProgFamEquipPartes.Params[1].AsString := DM.qryLubrificProgFamEquipCODIGO.AsString;
    DM.qryLubrificProgFamEquipPartes.Open;
    DM.qryLubrificProgFamEquipItensTodos.Open;
    DM.qryLubrificProgFamEquipPlanoTrab.Open;
  end;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryLubrificProgFamEquipPlanoTrab.Close;
DM.qryLubrificProgFamEquipPartes.Close;
DM.qryLubrificProgFamEquipItens.Close;
DM.qryLubrificProgFamEquipItensTodos.Close;
DM.qryLubrificProgEquipItens.Close;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgFamEquip.Active = False then Exit;
if DM.qryLubrificProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    DM.qryLubrificProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificProgFamEquipCODFAMILIAEQUIP.AsString := DM.FCodCombo;
        DM.qryLubrificProgFamEquipFAMILIAEQUIPAMENTO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFAMILIAEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryFamEquipamentoCODIGO, DM.qryFormatoCodigoFAMILIAEQUIPAMENTO, FrmTelaCadFamiliaEquipamento) = False then exit;
      Application.CreateForm(TFrmTelaCadFamiliaEquipamento, FrmTelaCadFamiliaEquipamento);
      FrmTelaCadFamiliaEquipamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFamiliaEquipamento);
    End;
  end;
DM.FTela            := 'CADLUBRIFICPROG';
DM.FDataSetParam    := DM.qryLubrificProgFamEquip;
DM.FDataSourceParam := DM.dsLubrificProgFamEquip;
DM.FTabela_auxiliar := 35;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnManutencaoClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgFamEquip.Active = False then Exit;
if DM.qryLubrificProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 100;
    DM.FNomeConsulta := 'Tipos de Manutenções';
    DM.qryLubrificProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificProgFamEquipCODMANUTENCAO.AsString := DM.FCodCombo;
        DM.qryLubrificProgFamEquipMANUTENCAO.AsString    := DM.FValorCombo;
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
DM.FTela            := 'CADLUBRIFICPROG';
DM.FDataSetParam    := DM.qryLubrificProgFamEquip;
DM.FDataSourceParam := DM.dsLubrificProgFamEquip;
DM.FTabela_auxiliar := 35;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnMonitoramentoClick(
  Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgFamEquip.Active = False then Exit;
if DM.qryLubrificProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 420;
    DM.FNomeConsulta := 'Monitoramentos';
    DM.qryLubrificProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificProgFamEquipCODMONITORAMENTO.AsString := DM.FCodCombo;
        DM.qryLubrificProgFamEquipMONITORAMENTO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadMonitoramento, FrmTelaCadMonitoramento);
      FrmTelaCadMonitoramento.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadMonitoramento);
    End;
  end;
DM.FTela            := 'CADLUBRIFICPROG';
DM.FDataSetParam    := DM.qryLubrificProgFamEquip;
DM.FDataSourceParam := DM.dsLubrificProgFamEquip;
DM.FTabela_auxiliar := 35;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryLubrificProgFamEquipCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryLubrificProgFamEquipATIVO.AsString           := 'S';
DM.qryLubrificProgFamEquipVISIVEL.AsString         := 'S';
DM.qryLubrificProgFamEquipCLONAVEL.AsString        := 'N';
DM.qryLubrificProgFamEquipEQUIPPARADO.AsString     := 'S';

DM.qryLubrificProgFamEquipPlanoTrab.Open;

DM.qryLubrificProgEquipItens.Close;

EdtCodLubrificacao.ReadOnly := False;
EdtCodLubrificacao.SetFocus;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgFamEquip.Active = False then Exit;
if DM.qryLubrificProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    DM.qryLubrificProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificProgFamEquipCODOFICINA.AsString := DM.FCodCombo;
        DM.qryLubrificProgFamEquipOFICINA.AsString    := DM.FValorCombo;
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
DM.FTela            := 'CADLUBRIFICPROG';
DM.FDataSetParam    := DM.qryLubrificProgFamEquip;
DM.FDataSourceParam := DM.dsLubrificProgFamEquip;
DM.FTabela_auxiliar := 34;
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnProgramacaoClick(Sender: TObject);
begin
  inherited;
PopupMenuProgramacao.Tag := 1;
PopupMenuProgramacao.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadLubrificProgFamEquip.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryLubrificProgFamEquipCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodLubrificacao.SetFocus; Exit;
  end;
DM.FTabela_auxiliar  := 35;
if (DM.VerificaDuplo(EdtCodLubrificacao.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodLubrificacao.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryLubrificProgFamEquipDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescLubrificacao.SetFocus; Exit;
  end;
if DM.qryLubrificProgFamEquipCODFAMILIAEQUIP.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!'; EdtDescFamilia.SetFocus; Exit;
  end;
if DM.qryLubrificProgFamEquipCODOFICINA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A OFICINA DO REGISTRO!'; EdtDescOficina.SetFocus; Abort;
  end;
if DM.qryLubrificProgFamEquipCODMANUTENCAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A MANUTENÇÃO DO REGISTRO!'; EdtManutencao.SetFocus; Abort;
  end;
EdtCodLubrificacao.ReadOnly := True;

DM.MSGAguarde('');

DM.qryLubrificProgFamEquip.Params[0].AsString := DM.qryLubrificProgFamEquipCODIGO.AsString;
DM.qryLubrificProgFamEquip.Params[1].AsString := DM.FCodEmpresa;
  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

if DM.qryLubrificProgFamEquipPlanoTrab.IsEmpty = False then
  begin
    DM.qryLubrificProgFamEquipPlanoTrab.Edit;
    DM.qryLubrificProgFamEquipPlanoTrab.Post;
    DM.qryLubrificProgFamEquipPlanoTrab.Edit;
  end;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadLubrificProgFamEquip.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryLubrificProgFamEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        BtnConsultar.OnClick(Sender);
        DM.FParamAuxiliar[0] := DM.qryLubrificProgFamEquipCODIGO.AsString;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadLubrificProgFamEquipPartes, FrmTelaCadLubrificProgFamEquipPartes);
    FrmTelaCadLubrificProgFamEquipPartes.Caption := 'Partes da Lubrificação: '+ DM.qryLubrificProgFamEquipDESCRICAO.AsString;
    FrmTelaCadLubrificProgFamEquipPartes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgFamEquipPartes);
    DM.FDataSetParam    := DM.qryLubrificProgFamEquip;
    DM.FDataSourceParam := DM.dsLubrificProgFamEquip;
    DM.FTela            := 'CADLUBRIFICPROG';
    DM.FTabela_auxiliar := 35;
  End;
end;

procedure TFrmTelaCadLubrificProgFamEquip.Button2Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryLubrificProgFamEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        BtnConsultar.OnClick(Sender);
        DM.FParamAuxiliar[0] := DM.qryLubrificProgFamEquipCODIGO.AsString;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadLubrificProgFamEquipPartesItens, FrmTelaCadLubrificProgFamEquipPartesItens);
    FrmTelaCadLubrificProgFamEquipPartesItens.Caption := 'Itens da Lubrificação: '+ DM.qryLubrificProgFamEquipDESCRICAO.AsString;
    FrmTelaCadLubrificProgFamEquipPartesItens.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgFamEquipPartesItens);
    DM.FDataSetParam    := DM.qryLubrificProgFamEquip;
    DM.FDataSourceParam := DM.dsLubrificProgFamEquip;
    DM.FTela            := 'CADLUBRIFICPROG';
    DM.FTabela_auxiliar := 35;
  End;

end;

procedure TFrmTelaCadLubrificProgFamEquip.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBLubrificFamEquipGeral;
DM.FTabela_auxiliar := 35;
  inherited;

end;

procedure TFrmTelaCadLubrificProgFamEquip.Consultar1Click(Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgFamEquip.Active = False then Exit;
if DM.qryLubrificProgFamEquip.IsEmpty = True then Exit;
DM.FTabela_auxiliar := 120;
DM.FNomeConsulta := 'Tipos de Programação';
DM.qryLubrificProgFamEquip.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryLubrificProgFamEquipPROGRAMARPOR2.AsString := DM.FCodCombo;
    DM.qryLubrificProgFamEquipPROGRAMACAO2.AsString  := DM.FValorCombo;
  end;
end;

procedure TFrmTelaCadLubrificProgFamEquip.EdtCodLubrificacaoExit(
  Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadLubrificProgFamEquip.ExcluirCorpClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgFamEquip.Active = False then Exit;
if DM.qryLubrificProgFamEquip.IsEmpty = True then Exit;
DM.qryLubrificProgFamEquipPROGRAMARPOR2.AsString := EmptyStr;
DM.qryLubrificProgFamEquipPROGRAMACAO2.AsString  := EmptyStr;
end;

procedure TFrmTelaCadLubrificProgFamEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryLubrificProgEquipItens.Close;
DM.qryLubrificProgFamEquipItens.Close;
DM.qryLubrificProgFamEquipItensTodos.Close;
DM.qryLubrificProgFamEquipPartes.Close;
DM.qryLubrificProgFamEquipPlanoTrab.Close;
DM.qryLubrificProgFamEquip.Close;
end;

procedure TFrmTelaCadLubrificProgFamEquip.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADLUBRIFICPROG';
DM.FDataSetParam    := DM.qryLubrificProgFamEquip;
DM.FDataSourceParam := DM.dsLubrificProgFamEquip;
DM.FTabela_auxiliar  := 35;
end;

procedure TFrmTelaCadLubrificProgFamEquip.GrdPlanoTrabalhoDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgFamEquip.IsEmpty = True then Exit;
if DM.qryLubrificProgFamEquipPlanoTrab.IsEmpty = True then Exit;

if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    DM.qryLubrificProgFamEquipPlanoTrab.Delete;
    DM.qryLubrificProgFamEquipPlanoTrab.Edit;
  end;
end;

procedure TFrmTelaCadLubrificProgFamEquip.GrdPlanoTrabalhoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if (Key = #13) then
  begin
    if (DM.FAlterando = False) then
      begin
        if Application.MessageBox('Para cadastrar o plano de trabalho, o registro deverá ser gravado, deseja continuar?', 'SPMP3', MB_ICONQUESTION + MB_YESNO) = IDYes then
          begin
            BtnSalvar.OnClick(Sender);
            Exit;
          end
        else
          Exit;
      end;

    DM.FTabela_auxiliar := 410;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryLubrificProgFamEquipPlanoTrab.Locate('CODPLANOTRABALHO', DM.FCodCombo, []) = False then
            begin
              DM.qryLubrificProgFamEquipPlanoTrab.Append;
              DM.qryLubrificProgFamEquipPlanoTrabCODEMPRESA.AsString              := DM.FCodEmpresa;
              DM.qryLubrificProgFamEquipPlanoTrabCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificProgFamEquipCODIGO.AsString;
//              DM.qryLubrificProgFamEquipPlanoTrabCODIGO.AsInteger                 := DM.qryLubrificProgFamEquipPlanoTrab.RecordCount + 1;
              DM.qryLubrificProgFamEquipPlanoTrabCODPLANOTRABALHO.AsString        := DM.FCodCombo;
              DM.qryLubrificProgFamEquipPlanoTrabDESCRICAO.AsString               := DM.FValorCombo;
              DM.qryLubrificProgFamEquipPlanoTrabDETALHES.AsString                := DM.FParamAuxiliar[2];
              DM.qryLubrificProgFamEquipPlanoTrab.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

procedure TFrmTelaCadLubrificProgFamEquip.GrdPlanoTrabalhoTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryLubrificProgFamEquipPlanoTrab);
end;

procedure TFrmTelaCadLubrificProgFamEquip.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBLubrificFamEquipIndividual;
DM.FTabela_auxiliar := 351;
  inherited;

end;

end.

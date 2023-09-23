unit UnTelaCadManutProgFamEquip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Data.DB,
  Vcl.DBGrids, JvExStdCtrls, JvRichEdit, JvDBRichEdit, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadManutProgFamEquip = class(TFrmTelaPaiCadastros)
    Label5: TLabel;
    EdtCodManutencao: TDBEdit;
    EdtDescManutencao: TDBEdit;
    Label6: TLabel;
    EdtCodFamilia: TDBEdit;
    EdtDescFamilia: TDBEdit;
    BtnFamilia: TButton;
    ChbAtivo: TDBCheckBox;
    ChbVisivel: TDBCheckBox;
    Label4: TLabel;
    EdtDescMonitoramento: TDBEdit;
    BtnMonitoramento: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    GrdPlanoTrabalho: TDBGrid;
    Label8: TLabel;
    EdtProgramacao1: TEdit;
    Label9: TLabel;
    EdtProgramacao2: TDBEdit;
    Label10: TLabel;
    EdtProgramacao3: TEdit;
    BtnProgramacao: TButton;
    PopupMenuProgramacao: TPopupMenu;
    ExcluirCorp: TMenuItem;
    Consultar1: TMenuItem;
    REDetalhes: TJvDBRichEdit;
    GrdItens: TDBGrid;
    chbClonavel: TDBCheckBox;
    Label13: TLabel;
    EdtDescOficina: TDBEdit;
    BtnOficina: TButton;
    Label28: TLabel;
    EdtCodOficina: TDBEdit;
    EdtDias: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtManutencao: TDBEdit;
    BtnManutencao: TButton;
    Label21: TLabel;
    ChbParado: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure GrdPlanoTrabalhoDblClick(Sender: TObject);
    procedure GrdPlanoTrabalhoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdPlanoTrabalhoTitleClick(Column: TColumn);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodManutencaoExit(Sender: TObject);
    procedure BtnProgramacaoClick(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure ExcluirCorpClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnMonitoramentoClick(Sender: TObject);
    procedure BtnOficinaClick(Sender: TObject);
    procedure BtnManutencaoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodManutencaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgFamEquip: TFrmTelaCadManutProgFamEquip;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadFamiliaEquipamento,
  UnTelaCadMonitoramento, UnTelaCadTipoProgramacao,
  UnDmRelatorios, UnTelaCadManutProgFamEquipPartes,
  UnTelaCadManutProgFamEquipPartesItens, UnDM, UnTelaCadOficinas,
  UnTelaCadTipoManutencao;

procedure TFrmTelaCadManutProgFamEquip.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodManutencao.ReadOnly := True;
if DM.qryManutProgFamEquipItens.Active = True then
  DM.qryManutProgFamEquipItens.Cancel;
if DM.qryManutProgFamEquipPartes.Active = True then
  DM.qryManutProgFamEquipPartes.Cancel;
if DM.qryManutProgFamEquipPlanoTrab.Active = True then
  DM.qryManutProgFamEquipPlanoTrab.Cancel;
end;

procedure TFrmTelaCadManutProgFamEquip.BtnConsultarClick(Sender: TObject);
begin
  inherited;
DM.FTabela_auxiliar  := 34;
if DM.qryManutProgFamEquip.IsEmpty = False then
  begin
    DM.qryManutProgFamEquipPartes.Close;
//    DM.qryManutProgFamEquipPartes.Params[0].AsString := DM.FCodEmpresa;
//    DM.qryManutProgFamEquipPartes.Params[1].AsString := DM.qryManutProgFamEquipCODIGO.AsString;
    DM.qryManutProgFamEquipPartes.Open;
    DM.qryManutProgFamEquipItensTodos.Open;
    DM.qryManutProgFamEquipPlanoTrab.Open;
  end;
end;

procedure TFrmTelaCadManutProgFamEquip.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryManutProgFamEquipPlanoTrab.Close;
DM.qryManutProgFamEquipPartes.Close;
DM.qryManutProgFamEquipItens.Close;
DM.qryManutProgFamEquipItensTodos.Close;
DM.qryManutProgEquipItens.Close;
end;

procedure TFrmTelaCadManutProgFamEquip.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.qryManutProgFamEquip.Active = False then Exit;
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    DM.qryManutProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryManutProgFamEquipCODFAMILIAEQUIP.AsString := DM.FCodCombo;
        DM.qryManutProgFamEquipFAMILIAEQUIPAMENTO.AsString := DM.FValorCombo;
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
DM.FTela            := 'CADMANUTPROG';
DM.FDataSetParam    := DM.qryManutProgFamEquip;
DM.FDataSourceParam := DM.dsManutProgFamEquip;
DM.FTabela_auxiliar := 34;
end;

procedure TFrmTelaCadManutProgFamEquip.BtnManutencaoClick(Sender: TObject);
begin
  inherited;
if DM.qryManutProgFamEquip.Active = False then Exit;
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 100;
    DM.FNomeConsulta := 'Tipos de Manutenções';
    DM.qryManutProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryManutProgFamEquipCODMANUTENCAO.AsString := DM.FCodCombo;
        DM.qryManutProgFamEquipMANUTENCAO.AsString    := DM.FValorCombo;
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
DM.FTela            := 'CADMANUTPROG';
DM.FDataSetParam    := DM.qryManutProgFamEquip;
DM.FDataSourceParam := DM.dsManutProgFamEquip;
DM.FTabela_auxiliar := 34;

end;

procedure TFrmTelaCadManutProgFamEquip.BtnMonitoramentoClick(Sender: TObject);
begin
  inherited;
if DM.qryManutProgFamEquip.Active = False then Exit;
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 420;
    DM.FNomeConsulta := 'Monitoramentos';
    DM.qryManutProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryManutProgFamEquipCODMONITORAMENTO.AsString := DM.FCodCombo;
        DM.qryManutProgFamEquipMONITORAMENTO.AsString := DM.FValorCombo;
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
DM.FTela            := 'CADMANUTPROG';
DM.FDataSetParam    := DM.qryManutProgFamEquip;
DM.FDataSourceParam := DM.dsManutProgFamEquip;
DM.FTabela_auxiliar := 34;
end;

procedure TFrmTelaCadManutProgFamEquip.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryManutProgFamEquipCODEMPRESA.AsString    := DM.FCodEmpresa;
DM.qryManutProgFamEquipATIVO.AsString         := 'S';
DM.qryManutProgFamEquipVISIVEL.AsString       := 'S';
DM.qryManutProgFamEquipCLONAVEL.AsString      := 'N';
DM.qryManutProgFamEquipEQUIPPARADO.AsString   := 'S';

DM.qryManutProgFamEquipPlanoTrab.Open;

DM.qryManutProgEquipItens.Close;

EdtCodManutencao.ReadOnly := False;
EdtCodManutencao.SetFocus;
end;

procedure TFrmTelaCadManutProgFamEquip.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if DM.qryManutProgFamEquip.Active = False then Exit;
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    DM.qryManutProgFamEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryManutProgFamEquipCODOFICINA.AsString := DM.FCodCombo;
        DM.qryManutProgFamEquipOFICINA.AsString    := DM.FValorCombo;
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
DM.FTela            := 'CADMANUTPROG';
DM.FDataSetParam    := DM.qryManutProgFamEquip;
DM.FDataSourceParam := DM.dsManutProgFamEquip;
DM.FTabela_auxiliar := 34;
end;

procedure TFrmTelaCadManutProgFamEquip.BtnProgramacaoClick(Sender: TObject);
begin
  inherited;
PopupMenuProgramacao.Tag := 1;
PopupMenuProgramacao.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadManutProgFamEquip.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryManutProgFamEquipCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodManutencao.SetFocus; Abort;
  end;
DM.FTabela_auxiliar  := 34;
if (DM.VerificaDuplo(EdtCodManutencao.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodManutencao.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryManutProgFamEquipDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescManutencao.SetFocus; Abort;
  end;
if DM.qryManutProgFamEquipCODFAMILIAEQUIP.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!'; EdtDescFamilia.SetFocus; Abort;
  end;
if DM.qryManutProgFamEquipCODOFICINA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A OFICINA DO REGISTRO!'; EdtDescOficina.SetFocus; Abort;
  end;
if DM.qryManutProgFamEquipCODOFICINA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A MANUTENÇÃO DO REGISTRO!'; EdtManutencao.SetFocus; Abort;
  end;

EdtCodManutencao.ReadOnly := True;

DM.MSGAguarde('');

DM.qryManutProgFamEquip.Params[0].AsString := DM.qryManutProgFamEquipCODIGO.AsString;
DM.qryManutProgFamEquip.Params[1].AsString := DM.FCodEmpresa;
  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

if DM.qryManutProgFamEquipPlanoTrab.IsEmpty = False then
  begin
    DM.qryManutProgFamEquipPlanoTrab.Edit;
    DM.qryManutProgFamEquipPlanoTrab.Post;
    DM.qryManutProgFamEquipPlanoTrab.Edit;
  end;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadManutProgFamEquip.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryManutProgFamEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        BtnConsultar.OnClick(Sender);
        DM.FParamAuxiliar[0] := DM.qryManutProgFamEquipCODIGO.AsString;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadManutProgFamEquipPartes, FrmTelaCadManutProgFamEquipPartes);
    FrmTelaCadManutProgFamEquipPartes.Caption := 'Partes da Manutenção: '+ DM.qryManutProgFamEquipDESCRICAO.AsString;
    FrmTelaCadManutProgFamEquipPartes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgFamEquipPartes);
    DM.FDataSetParam    := DM.qryManutProgFamEquip;
    DM.FDataSourceParam := DM.dsManutProgFamEquip;
    DM.FTela            := 'CADMANUTPROG';
    DM.FTabela_auxiliar := 34;
  End;
end;

procedure TFrmTelaCadManutProgFamEquip.Button2Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryManutProgFamEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        BtnConsultar.OnClick(Sender);
        DM.FParamAuxiliar[0] := DM.qryManutProgFamEquipCODIGO.AsString;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadManutProgFamEquipPartesItens, FrmTelaCadManutProgFamEquipPartesItens);
    FrmTelaCadManutProgFamEquipPartesItens.Caption := 'Itens da Manutenção: '+ DM.qryManutProgFamEquipDESCRICAO.AsString;
    FrmTelaCadManutProgFamEquipPartesItens.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgFamEquipPartesItens);
    DM.FDataSetParam    := DM.qryManutProgFamEquip;
    DM.FDataSourceParam := DM.dsManutProgFamEquip;
    DM.FTela            := 'CADMANUTPROG';
    DM.FTabela_auxiliar := 34;
  End;
end;

procedure TFrmTelaCadManutProgFamEquip.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBManutFamEquipGeral;
DM.FTabela_auxiliar := 34;
  inherited;

end;

procedure TFrmTelaCadManutProgFamEquip.Consultar1Click(Sender: TObject);
begin
  inherited;
if DM.qryManutProgFamEquip.Active = False then Exit;
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;
DM.FTabela_auxiliar := 120;
DM.FNomeConsulta := 'Tipos de Programação';
DM.qryManutProgFamEquip.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryManutProgFamEquipPROGRAMARPOR2.AsString := DM.FCodCombo;
    DM.qryManutProgFamEquipPROGRAMACAO2.AsString  := DM.FValorCombo;
  end;
end;

procedure TFrmTelaCadManutProgFamEquip.EdtCodManutencaoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadManutProgFamEquip.EdtCodManutencaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
If Key = #13 Then
  Try
    Begin
      Key := #0;
      SelectNext(ActiveControl, True, True);
    End;
  Except
    Begin
      Application.MessageBox('Não foi possível identificar esse valor, por favor verifique o valor informado.','SPMP',MB_OK + MB_ICONERROR);
    End;
  End;
end;

procedure TFrmTelaCadManutProgFamEquip.ExcluirCorpClick(Sender: TObject);
begin
  inherited;
if DM.qryManutProgFamEquip.Active = False then Exit;
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;
DM.qryManutProgFamEquipPROGRAMARPOR2.AsString := EmptyStr;
DM.qryManutProgFamEquipPROGRAMACAO2.AsString  := EmptyStr;
end;

procedure TFrmTelaCadManutProgFamEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryManutProgEquipItens.Close;
DM.qryManutProgFamEquipItens.Close;
DM.qryManutProgFamEquipItensTodos.Close;
DM.qryManutProgFamEquipPartes.Close;
DM.qryManutProgFamEquipPlanoTrab.Close;
DM.qryManutProgFamEquip.Close;
end;

procedure TFrmTelaCadManutProgFamEquip.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADMANUTPROG';
DM.FDataSetParam    := DM.qryManutProgFamEquip;
DM.FDataSourceParam := DM.dsManutProgFamEquip;
DM.FTabela_auxiliar  := 34;
end;

procedure TFrmTelaCadManutProgFamEquip.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
//  inherited;

end;

procedure TFrmTelaCadManutProgFamEquip.GrdPlanoTrabalhoDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;
if DM.qryManutProgFamEquipPlanoTrab.IsEmpty = True then Exit;

if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    DM.qryManutProgFamEquipPlanoTrab.Delete;
    DM.qryManutProgFamEquipPlanoTrab.Edit;
  end;
end;

procedure TFrmTelaCadManutProgFamEquip.GrdPlanoTrabalhoKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
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
          if DM.qryManutProgFamEquipPlanoTrab.Locate('CODPLANOTRABALHO', DM.FCodCombo, []) = False then
            begin
              DM.qryManutProgFamEquipPlanoTrab.Append;
              DM.qryManutProgFamEquipPlanoTrabCODEMPRESA.AsString           := DM.FCodEmpresa;
              DM.qryManutProgFamEquipPlanoTrabCODMANUTPROGFAMEQUIP.AsString := DM.qryManutProgFamEquipCODIGO.AsString;
//              DM.qryManutProgFamEquipPlanoTrabCODIGO.AsInteger              := DM.qryManutProgFamEquipPlanoTrab.RecordCount + 1;
              DM.qryManutProgFamEquipPlanoTrabCODPLANOTRABALHO.AsString     := DM.FCodCombo;
              DM.qryManutProgFamEquipPlanoTrabDESCRICAO.AsString            := DM.FValorCombo;
              DM.qryManutProgFamEquipPlanoTrabDETALHES.AsString             := DM.FParamAuxiliar[2];
              DM.qryManutProgFamEquipPlanoTrab.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

procedure TFrmTelaCadManutProgFamEquip.GrdPlanoTrabalhoTitleClick(
  Column: TColumn);
begin
  inherited;
//DM.CliqueNoTitulo(Column, DM.qryManutProgFamEquipPlanoTrab);
end;

procedure TFrmTelaCadManutProgFamEquip.Individual1Click(Sender: TObject);
begin
if DM.qryManutProgFamEquip.IsEmpty = True then Exit;

DM.FDataSetRelat    := DmRelatorios.frxDBManutFamEquipIndividual;
DM.FTabela_auxiliar := 341;
  inherited;

end;

end.

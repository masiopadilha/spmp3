unit UnTelaCadLubrifictProgEquip;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvDBControls, Vcl.Grids, Vcl.DBGrids, Data.DB, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, System.DateUtils, FireDAC.Stan.Param, Vcl.Buttons;
type
  TFrmTelaCadLubrificProgEquip = class(TFrmTelaPaiCadastros)
    Label5: TLabel;
    EdtCodLubrificacao: TDBEdit;
    EdtDescLubrificacao: TDBEdit;
    Label7: TLabel;
    CBCriticidade: TDBComboBox;
    Label6: TLabel;
    EdtCodFamilia: TDBEdit;
    EdtDescFamilia: TDBEdit;
    BtnFamilia: TButton;
    Label11: TLabel;
    Label8: TLabel;
    EdtDias: TDBEdit;
    Label4: TLabel;
    EdtInicio: TJvDBDateEdit;
    Label9: TLabel;
    CBReprogramacao: TDBComboBox;
    Label10: TLabel;
    EdtControle: TDBEdit;
    Label14: TLabel;
    EdtProxInspecao: TDBEdit;
    Label13: TLabel;
    CBReprogramacao2: TDBComboBox;
    PCInspecoes: TPageControl;
    TSItens: TTabSheet;
    PItens: TPanel;
    TSItensEsp: TTabSheet;
    PEspecificos: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label16: TLabel;
    LblRota: TDBText;
    LblProgramarPor: TDBText;
    GrdItens: TDBGrid;
    GrdItensEsp: TDBGrid;
    Label20: TLabel;
    EdtCodResponsavel: TDBEdit;
    EdtDescResponsavel: TDBEdit;
    BtnResponsavel: TButton;
    Label12: TLabel;
    Label22: TLabel;
    DBCheckBox1: TDBCheckBox;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodLubrificacaoExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnResponsavelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadLubrificProgEquip: TFrmTelaCadLubrificProgEquip;
  LDataProgIni : TDateTime;
implementation
{$R *.dfm}
uses UnTelaCadLubrificProgFamEquip, UnDmRelatorios, UnTelaConsulta,
  UnTelaCadFuncionarios, UnDM, UnTelaCadLubrificProgEquipPartesItensEsp,
  UnTelaCadEquipamentos, UnTelaCadLubrificProgEquipPecas,
  UnTelaCadLubrificProgEquipRecursos, UnTelaCadLubrificProgEquipMObra;
procedure TFrmTelaCadLubrificProgEquip.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodLubrificacao.ReadOnly := True;
if DM.qryLubrificProgEquipItensEsp.Active = True then
  DM.qryLubrificProgEquipItensEsp.Cancel;
end;
procedure TFrmTelaCadLubrificProgEquip.BtnConsultarClick(Sender: TObject);
begin
  DM.FTabela_auxiliar := 33;
  DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
  inherited;
if DM.qryLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString <> EmptyStr then
  begin
    LDataProgIni := DM.qryLubrificProgEquipDTAINICIO1.AsDateTime;

    DM.qryLubrificProgEquipPartes.Close;
    DM.qryLubrificProgEquipPartes.Open;

    DM.qryLubrificProgEquipItens.Close;
    DM.qryLubrificProgEquipItens.Open;

    DM.qryLubrificProgEquipItensEsp.Close;
    DM.qryLubrificProgEquipItensEsp.Open;
    DM.qryLubrificProgEquipItensEsp.Edit;

    DM.qryLubrificProgEquipPlanoTrab.Close;
    DM.qryLubrificProgEquipPlanoTrab.Open;
  end
else
  begin
    DM.qryLubrificProgEquipItens.Close;
    DM.qryLubrificProgEquipItensEsp.Close;
    DM.qryLubrificProgEquipPlanoTrab.Close;
  end;
end;

procedure TFrmTelaCadLubrificProgEquip.BtnExcluirClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if DM.qryLubrificProgEquip.Active = False then Exit;

if DM.qryLubrificProgEquip.IsEmpty = True then Exit;

if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    Try
      if DM.qryLubrificProgEquip.IsEmpty = False then
        begin
          DM.qryLubrificProgEquipItensEsp.Close;
          DM.qryLubrificProgEquipItens.Close;
          DM.qryLubrificProgEquipPartes.Close;
          DM.qryLubrificProgEquip.Delete;
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'REGISTRO EXCLUÍDO COM SUCESSO!!!';
          ControleBotoes(0);
        end;
    Except
      on E: Exception do
      begin
        DM.GravaLog('Falha ao excluir o registro. ' + Screen.ActiveForm.Name + ' ', E.ClassName, E.Message);
        Application.MessageBox('Falha ao excluir o registro!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
        PAuxiliares.Caption := EmptyStr;
      end;
    End;
  end;
BtnSalvar.ImageIndex := 2;
//  inherited;
end;
procedure TFrmTelaCadLubrificProgEquip.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgEquip.Active = False then Exit;
if DM.qryLubrificProgEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 350;
    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
    DM.FNomeConsulta := 'Lubrificações de Famílias de Equipamentos';
    DM.qryLubrificProgEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString  := DM.FCodCombo;
        DM.qryLubrificProgEquipDESCLUBRIFICPROGFAMEQUIP.AsString := DM.FValorCombo;
        DM.qryLubrificProgEquipPROGRAMACAO2.AsString             := DM.FParamAuxiliar[2];
        DM.qryLubrificProgEquipFREQUENCIA1.AsString              := DM.FParamAuxiliar[3];

        DM.qryLubrificProgEquipPartes.Open;
        DM.qryLubrificProgEquipItens.Open;
        DM.qryLubrificProgEquipItensEsp.Open;
        DM.qryLubrificProgEquipItensEsp.Edit;
      end;
    if FrmTelaCadEquipamentos <> nil then
      DM.FParamAuxiliar[0] := FrmTelaCadEquipamentos.EdtCodEquip.Text
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryLubrificProgFamEquipCODIGO, DM.qryFormatoCodigoLubrificPROGFAMEQUIPAMENTO, FrmTelaCadLubrificProgFamEquip) = False then exit;
      Application.CreateForm(TFrmTelaCadLubrificProgFamEquip, FrmTelaCadLubrificProgFamEquip);
      FrmTelaCadLubrificProgFamEquip.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadLubrificProgFamEquip);
    End;
  end;
DM.FDataSetParam    := DM.qryLubrificProgEquip;
DM.FDataSourceParam := DM.dsLubrificProgEquip;
DM.FTabela_auxiliar := 33;
DM.FTela := 'CADLUBRIFICPROGEQUIP';
end;
procedure TFrmTelaCadLubrificProgEquip.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
DM.qryLubrificProgEquipCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString := DM.FParamAuxiliar[0];
DM.qryLubrificProgEquipDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryLubrificProgEquipDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryLubrificProgEquipCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryLubrificProgEquipCODUSUARIOALT.AsString  := DM.FCodUsuario;
DM.qryLubrificProgEquipGRUPOINSP.AsString      := 'N';
DM.qryLubrificProgEquipRELATORIO.AsString      := 'N';
DM.qryLubrificProgEquipATIVO.AsString          := 'N';
EdtCodLubrificacao.ReadOnly := False;
EdtCodLubrificacao.SetFocus;
end;
procedure TFrmTelaCadLubrificProgEquip.BtnResponsavelClick(Sender: TObject);
begin
  inherited;
if DM.qryLubrificProgEquip.Active = False then Exit;
if DM.qryLubrificProgEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.qryLubrificProgEquip.Edit;
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryLubrificProgEquipMATRICULA.AsString   := DM.FCodCombo;
        DM.qryLubrificProgEquipRESPONSAVEL.AsString := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qryLubrificProgEquip;
DM.FDataSourceParam := DM.dsLubrificProgEquip;
DM.FTabela_auxiliar := 33;
DM.FTela := 'CADLUBRIFICPROGEQUIP';
end;
procedure TFrmTelaCadLubrificProgEquip.BtnSalvarClick(Sender: TObject);
begin
if DM.FDataSetParam.IsEmpty = True then Exit;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if DM.qryLubrificProgEquipCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodLubrificacao.SetFocus; Exit;
  end;
DM.FTabela_auxiliar  := 33;
if (DM.VerificaDuplo(EdtCodLubrificacao.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodLubrificacao.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryLubrificProgEquipDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescLubrificacao.SetFocus; Exit;
  end;
if DM.qryLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!'; EdtDescFamilia.SetFocus; Exit;
  end;
if DM.qryLubrificProgEquipCRITICIDADE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CRITICIDADE DO REGISTRO!'; CBCriticidade.SetFocus; Exit;
  end;
if (DM.qryLubrificProgEquipFREQUENCIA1.IsNull = True) or (DM.qryLubrificProgEquipFREQUENCIA1.AsInteger <= 0) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PERÍODO EM DIAS PARA A LUBRIFICAÇÃO!'; EdtDias.SetFocus; Exit;
  end;
if (DM.qryLubrificProgEquipDTAINICIO1.IsNull = True) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DATA DE PROGRAMAÇÃO PARA A LUBRIFICAÇÃO!'; EdtInicio.SetFocus; Exit;
  end;
if DM.qryLubrificProgEquipREPROGRAMAR1.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A REPROGRAMAÇÃO DA LUBRIFICAÇÃO!'; CBReprogramacao.SetFocus; Exit;
  end;

if (DM.qryLubrificProgEquipDTAINICIO1.AsDateTime > 0)  and (DM.qryLubrificProgEquipGRUPOINSP.AsString <> 'S') then
  DM.qryLubrificProgEquipDTAINICIO1.AsDateTime := DateOf(DM.qryLubrificProgEquipDTAINICIO1.AsDateTime);

//Se alterar a data de início
if LDataProgIni <> 0 then
  begin
    if LDataProgIni <> DM.qryLubrificProgEquipDTAINICIO1.AsDateTime then
      begin
        DM.qryLubrificProgEquip.Edit;
        DM.qryLubrificProgEquipRELATORIO.AsString := 'N';
      end;
  end;

if (LblProgramarPor.Caption <> EmptyStr) then
  begin
    if DM.qryLubrificProgEquipFREQUENCIA2.IsNull = True then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONTROLE DA RESPECTIVA PROGRAMAÇÃO!'; EdtControle.SetFocus; Exit;
      end;
    if DM.qryLubrificProgEquipREPROGRAMAR2.IsNull = True then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A REPROGRAMAÇÃO DA LUBRIFICAÇÃO!'; CBReprogramacao2.SetFocus; Exit;
      end;

    //Verifica a maior leitura no histórico para não permitir que seja cadastrada um leitura inferior
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT MAX(LEITURA)LEITURA FROM `lubrificprogequipamentohist` WHERE CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+' AND CODEQUIPAMENTO = '+QuotedStr(DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString) + EmptyStr);
    DM.qryAuxiliar.Open;
    if DM.qryAuxiliar.FieldByName('LEITURA').AsFloat > DM.qryLubrificProgEquipFREQUENCIA2.AsFloat then
      begin
        Application.MessageBox('Já foram executadas inspeções com leituras superiores a informada!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        EdtProxInspecao.SetFocus;
        Exit;
      end;
    DM.qryAuxiliar.Close;
  end
else
  begin
    DM.qryLubrificProgEquipFREQUENCIA2.Clear;
    DM.qryLubrificProgEquipLEITURA.Clear;
    DM.qryLubrificProgEquipREPROGRAMAR2.Clear;
  end;

DM.MSGAguarde('');

if DM.FEmpTransf = True then
  begin
    if DM.qryEquipamentos.Active = False then
      begin
        DM.qryEquipamentos.Close;
        DM.qryEquipamentos.Params[0].AsString := DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString;
        DM.qryEquipamentos.Params[1].AsString := DM.FCodEmpresa;
        DM.qryEquipamentos.Open;
      end;
    DM.qryEquipEmRota.Close;
    DM.qryEquipEmRota.Params[0].AsString := DM.FCodEmpresa;
    DM.qryEquipEmRota.Params[1].AsString := DM.qryEquipamentosCODLOCALIZACAO.AsString;
    DM.qryEquipEmRota.Params[2].AsString := DM.qryEquipamentosCODCELULA.AsString;
    DM.qryEquipEmRota.Params[3].AsString := DM.qryEquipamentosCODLINHA.AsString;
    DM.qryEquipEmRota.Params[4].AsString := DM.qryEquipamentosSEQUENCIA.AsString;
    DM.qryEquipEmRota.Params[5].AsString := DM.qryManutProgEquipFREQUENCIA1.AsString;
    DM.qryEquipEmRota.Open;
    if (DM.qryEquipEmRotaCODIGO.IsNull = False) and (DM.qryLubrificProgEquipGRUPOINSP.AsString = 'S') then
      begin
        DM.qryLubrificProgEquip.Edit;
        DM.qryLubrificProgEquipGRUPOINSP.AsString    := 'S';
        DM.qryLubrificProgEquipREPROGRAMAR1.AsString := DM.qryEquipEmRotaREPROGRAMAR.AsString;
        DM.qryLubrificProgEquipROTA.AsString         := DM.qryEquipEmRotaROTA.AsString;
        DM.qryLubrificProgEquipDTAINICIO1.AsString   := DM.qryEquipEmRotaDATAINICIO.AsString;
        DM.qryLubrificProgEquipRELATORIO.AsString    := DM.qryEquipEmRotaRELATORIO.AsString;
      end;
    DM.qryEquipEmRota.Close;
  end;

DM.qryLubrificProgEquip.Params[0].AsString := EdtCodLubrificacao.Text;
DM.qryLubrificProgEquip.Params[1].AsString := DM.FCodEmpresa;
DM.qryLubrificProgEquip.Params[2].AsString := DM.FParamAuxiliar[0];

if DM.qryManutProgEquipItensEsp.IsEmpty = False then
  begin
    if DM.qryManutProgEquipCODIGO.AsString <> '' then
      begin
        DM.qryManutProgEquip.Edit;
        DM.qryManutProgEquip.Post;
      end;

   DM.qryManutProgEquipItensEsp.Edit;
   DM.qryManutProgEquipItensEsp.Post;
  end;

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodLubrificacao.ReadOnly := True;

DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('DELETE FROM lubrificprogequipitensesp WHERE CODLUBRIFICPROGEQUIP = ' + QuotedStr(DM.qryLubrificProgEquipCODIGO.AsString) + ' AND CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+' AND (ITEM IS NULL OR ITEM = '') AND (DESCINSPECAO IS NULL OR DESCINSPECAO = '')');
DM.qryAuxiliar.Execute;

DM.MSGAguarde('', False);
end;
procedure TFrmTelaCadLubrificProgEquip.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryLubrificProgEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      BtnConsultar.OnClick(Sender);

    DM.FParamAuxiliar[0] := DM.qryLubrificProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadLubrificProgEquipPartesItensEsp, FrmTelaCadLubrificProgEquipPartesItensEsp);
    FrmTelaCadLubrificProgEquipPartesItensEsp.Caption := 'Itens Específicos da Lubrificação: '+ DM.qryLubrificProgEquipDESCRICAO.AsString;
    FrmTelaCadLubrificProgEquipPartesItensEsp.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgEquipPartesItensEsp);
    DM.FDataSetParam    := DM.qryLubrificProgEquip;
    DM.FDataSourceParam := DM.dsLubrificProgEquip;
    DM.FTela            := 'CADLUBRIFICPROGEQUIP';
    DM.FParamAuxiliar[0]:= FrmTelaCadEquipamentos.EdtCodEquip.Text;
    DM.FTabela_auxiliar := 32;
    DM.FAlterando := True;
  End;
end;
procedure TFrmTelaCadLubrificProgEquip.Button2Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryLubrificProgEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      BtnConsultar.OnClick(Sender);

    DM.FParamAuxiliar[0] := DM.qryLubrificProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADLubrificPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadLubrificProgEquipPecas, FrmTelaCadLubrificProgEquipPecas);
    FrmTelaCadLubrificProgEquipPecas.Caption := 'Peças da da Lubrificação: '+ DM.qryLubrificProgEquipDESCRICAO.AsString;

    FrmTelaCadLubrificProgEquipPecas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgEquipPecas);
    DM.FDataSetParam    := DM.qryLubrificProgEquip;
    DM.FDataSourceParam := DM.dsLubrificProgEquip;
    DM.FTela            := 'CADLUBRIFICPROGEQUIP';
    DM.FParamAuxiliar[0]:= FrmTelaCadEquipamentos.EdtCodEquip.Text;
    DM.FTabela_auxiliar := 33;
    DM.FAlterando := True;
  End;
end;

procedure TFrmTelaCadLubrificProgEquip.Button3Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryLubrificProgEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      BtnConsultar.OnClick(Sender);

    DM.FParamAuxiliar[0] := DM.qryLubrificProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadLubrificProgEquipRecursos, FrmTelaCadLubrificProgEquipRecursos);
    FrmTelaCadLubrificProgEquipRecursos.Caption := 'Recursos da da Lubrificação: '+ DM.qryLubrificProgEquipDESCRICAO.AsString;

    FrmTelaCadLubrificProgEquipRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgEquipRecursos);
    DM.FDataSetParam    := DM.qryLubrificProgEquip;
    DM.FDataSourceParam := DM.dsLubrificProgEquip;
    DM.FTela            := 'CADLUBRIFICPROGEQUIP';
    DM.FParamAuxiliar[0]:= FrmTelaCadEquipamentos.EdtCodEquip.Text;
    DM.FTabela_auxiliar := 33;
    DM.FAlterando := True;
  End;
end;

procedure TFrmTelaCadLubrificProgEquip.Button4Click(Sender: TObject);
begin
  inherited;
  Try
    if DM.FParamAuxiliar[0] = EmptyStr then
      BtnConsultar.OnClick(Sender);

    DM.FParamAuxiliar[0] := DM.qryLubrificProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadLubrificProgEquipMObra, FrmTelaCadLubrificProgEquipMObra);
    FrmTelaCadLubrificProgEquipMObra.Caption := 'Mão de Obra da Lubrificação: '+ DM.qryLubrificProgEquipDESCRICAO.AsString;
    FrmTelaCadLubrificProgEquipMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgEquipMObra);
    DM.FDataSetParam    := DM.qryLubrificProgEquip;
    DM.FDataSourceParam := DM.dsLubrificProgEquip;
  End;
end;

procedure TFrmTelaCadLubrificProgEquip.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBLubrificProgEquipGeral;
DM.qryLubrificProgEquipItens.MasterSource := DM.dsAuxiliar;
DM.qryLubrificProgEquipItensEsp.MasterSource := DM.dsAuxiliar;
DM.qryLubrificProgEquipPlanoTrab.MasterSource := DM.dsAuxiliar;
DM.qryLubrificProgEquipItens.Open;
DM.qryLubrificProgEquipItensEsp.Open;
DM.qryLubrificProgEquipPlanoTrab.Open;
DM.FTabela_auxiliar  := 33;
  inherited;
DM.qryLubrificProgEquipItens.MasterSource := DM.dsLubrificProgEquip;
DM.qryLubrificProgEquipItensEsp.MasterSource := DM.dsLubrificProgEquip;
DM.qryLubrificProgEquipPlanoTrab.MasterSource := DM.dsLubrificProgEquip;
DM.qryLubrificProgEquipItens.Close; DM.qryLubrificProgEquipItens.Open;
DM.qryLubrificProgEquipItensEsp.Close;
DM.qryLubrificProgEquipPlanoTrab.Close;
end;
procedure TFrmTelaCadLubrificProgEquip.DBCheckBox1Click(Sender: TObject);
begin
  inherited;
  BtnSalvar.ImageIndex := 115;
end;

procedure TFrmTelaCadLubrificProgEquip.EdtCodLubrificacaoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;
procedure TFrmTelaCadLubrificProgEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryLubrificProgEquipItens.Close;
DM.qryLubrificProgEquipItensEsp.Close;
//if FrmTelaCadLubrificProgEquip = nil  then
  DM.qryLubrificProgEquip.Close;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
end;
procedure TFrmTelaCadLubrificProgEquip.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryLubrificProgEquip;
DM.FDataSourceParam := DM.dsLubrificProgEquip;
DM.FTabela_auxiliar  := 33;
DM.FTela := 'CADLUBRIFICPROGEQUIP';
LDataProgIni := 0;
end;
procedure TFrmTelaCadLubrificProgEquip.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBLubrificProgEquipIndividual;
DM.FTabela_auxiliar := 331;
  inherited;
end;
end.

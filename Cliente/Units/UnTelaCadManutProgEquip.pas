unit UnTelaCadManutProgEquip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvDBControls, Vcl.Grids, Vcl.DBGrids, Data.DB, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, System.DateUtils, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadManutProgEquip = class(TFrmTelaPaiCadastros)
    Label5: TLabel;
    EdtCodManutencao: TDBEdit;
    EdtDescManutencao: TDBEdit;
    Label6: TLabel;
    EdtCodFamilia: TDBEdit;
    EdtDescFamilia: TDBEdit;
    BtnFamilia: TButton;
    Label14: TLabel;
    Label8: TLabel;
    EdtDias: TDBEdit;
    Label4: TLabel;
    EdtInicio: TJvDBDateEdit;
    Label9: TLabel;
    Label7: TLabel;
    CBCriticidade: TDBComboBox;
    CBReprogramacao: TDBComboBox;
    Label16: TLabel;
    LblRota: TDBText;
    Label10: TLabel;
    EdtControle: TDBEdit;
    Label11: TLabel;
    EdtProxInspecao: TDBEdit;
    Label13: TLabel;
    CBReprogramacao2: TDBComboBox;
    PCInspecoes: TPageControl;
    TSItens: TTabSheet;
    TSItensEsp: TTabSheet;
    PItens: TPanel;
    PEspecificos: TPanel;
    GrdItensEsp: TDBGrid;
    Label17: TLabel;
    Label18: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    LblProgramarPor: TDBText;
    GrdItens: TDBGrid;
    Label20: TLabel;
    EdtCodResponsavel: TDBEdit;
    EdtDescResponsavel: TDBEdit;
    BtnResponsavel: TButton;
    Label21: TLabel;
    ChbAtivoNF: TDBCheckBox;
    Label22: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure EdtCodManutencaoExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnFamiliaClick(Sender: TObject);
    procedure BtnResponsavelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ChbAtivoNFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgEquip: TFrmTelaCadManutProgEquip;
  LDataProgIni : TDateTime;

implementation

{$R *.dfm}

uses UnTelaCadEquipamentosEsp, UnTelaConsulta,
  UnTelaCadFamiliaEquipamento, UnTelaCadManutProgFamEquip,
  UnDmRelatorios, UnTelaCadFuncionarios, UnDM,
  UnTelaCadManutProgEquipPartesItensEsp, UnTelaCadManutProgEquipPecas,
  UnTelaCadManutProgEquipRecursos, UnTelaCadEquipamentos,
  UnTelaCadManutProgEquipMObra;

procedure TFrmTelaCadManutProgEquip.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodManutencao.ReadOnly := True;
if DM.qryManutProgEquipItensEsp.Active = True then
 DM.qryManutProgEquipItensEsp.Cancel;
end;

procedure TFrmTelaCadManutProgEquip.BtnConsultarClick(Sender: TObject);
begin
  DM.FTabela_auxiliar := 32;
  DM.FParamAuxiliar[0] := DM.qryEquipamentosCODIGO.AsString;
  inherited;
if DM.qryManutProgEquipCODMANUTPROGFAMEQUIP.AsString <> EmptyStr then
  begin
    LDataProgIni := DM.qryManutProgEquipDTAINICIO1.AsDateTime;

    DM.qryManutProgEquipPartes.Close;
    DM.qryManutProgEquipPartes.Open;

    DM.qryManutProgEquipItens.Close;
    DM.qryManutProgEquipItens.Open;

    DM.qryManutProgEquipItensEsp.Close;
    DM.qryManutProgEquipItensEsp.Open;
    DM.qryManutProgEquipItensEsp.Edit;

    DM.qryManutProgEquipPlanoTrab.Close;
    DM.qryManutProgEquipPlanoTrab.Open;
  end
else
  begin
    DM.qryManutProgEquipItens.Close;
    DM.qryManutProgEquipItensEsp.Close;
    DM.qryManutProgEquipPlanoTrab.Close;
  end;
end;

procedure TFrmTelaCadManutProgEquip.BtnExcluirClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if DM.qryManutProgEquip.Active = False then Exit;

if DM.qryManutProgEquip.IsEmpty = True then Exit;

if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISS�O PARA EXCLUS�O!';
    Exit;
  end;

if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    Try
      if DM.qryManutProgEquip.IsEmpty = False then
        begin
          DM.qryManutProgEquipItensEsp.Close;
          DM.qryManutProgEquipItens.Close;
          DM.qryManutProgEquipPartes.Close;
          DM.qryManutProgEquip.Delete;
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'REGISTRO EXCLU�DO COM SUCESSO!!!';
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
//inherited;
end;

procedure TFrmTelaCadManutProgEquip.BtnFamiliaClick(Sender: TObject);
begin
  inherited;
if DM.qryManutProgEquip.Active = False then Exit;
if DM.qryManutProgEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar  := 340;
    DM.FParamAuxiliar[0] := DM.qryEquipamentosCODFAMILIAEQUIP.AsString;
    DM.FNomeConsulta     := 'Manuten��es de Fam�lias de Equipamentos';
    DM.qryManutProgEquip.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryManutProgEquipCODMANUTPROGFAMEQUIP.AsString  := DM.FCodCombo;
        DM.qryManutProgEquipDESCMANUTPROGFAMEQUIP.AsString := DM.FValorCombo;
        DM.qryManutProgEquipPROGRAMACAO2.AsString          := DM.FParamAuxiliar[2];
        DM.qryManutProgEquipFREQUENCIA1.AsString           := DM.FParamAuxiliar[3];

        DM.qryManutProgEquipPartes.Open;
        DM.qryManutProgEquipItens.Open;
        DM.qryManutProgEquipItensEsp.Open;
        DM.qryManutProgEquipItensEsp.Edit;
      end;
    if FrmTelaCadEquipamentos <> nil then
      DM.FParamAuxiliar[0] := FrmTelaCadEquipamentos.EdtCodEquip.Text
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryManutProgFamEquipCODIGO,DM.qryFormatoCodigoMANUTPROGFAMEQUIPAMENTO, FrmTelaCadManutProgFamEquip) = False then exit;
      Application.CreateForm(TFrmTelaCadManutProgFamEquip, FrmTelaCadManutProgFamEquip);
      FrmTelaCadManutProgFamEquip.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadManutProgFamEquip);
    End;
  end;
DM.FDataSetParam    := DM.qryManutProgEquip;
DM.FDataSourceParam := DM.dsManutProgEquip;
DM.FTabela_auxiliar := 32;
DM.FTela := 'CADMANUTPROGEQUIP';
end;

procedure TFrmTelaCadManutProgEquip.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryManutProgEquipCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryManutProgEquipCODEQUIPAMENTO.AsString := DM.FParamAuxiliar[0];
DM.qryManutProgEquipDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryManutProgEquipDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryManutProgEquipCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryManutProgEquipCODUSUARIOALT.AsString  := DM.FCodUsuario;
DM.qryManutProgEquipGRUPOINSP.AsString      := 'N';
DM.qryManutProgEquipRELATORIO.AsString      := 'N';
DM.qryManutProgEquipATIVO.AsString          := 'N';

DM.qryManutProgEquipItens.Close;

EdtCodManutencao.ReadOnly := False;
EdtCodManutencao.SetFocus;
end;

procedure TFrmTelaCadManutProgEquip.BtnResponsavelClick(Sender: TObject);
begin
  inherited;
if DM.qryManutProgEquip.Active = False then Exit;
if DM.qryManutProgEquip.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcion�rios';
   DM.qryManutProgEquip.Edit;
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
       DM.qryManutProgEquipMATRICULA.AsString   := DM.FCodCombo;
       DM.qryManutProgEquipRESPONSAVEL.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
DM.FDataSetParam    :=DM.qryManutProgEquip;
DM.FDataSourceParam := DM.dsManutProgEquip;
DM.FTabela_auxiliar := 32;
DM.FTela := 'CADMANUTPROGEQUIP';
end;

procedure TFrmTelaCadManutProgEquip.BtnSalvarClick(Sender: TObject);
begin
if DM.FDataSetParam.IsEmpty = True then Exit;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISS�O PARA ALTERA��O!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if DM.qryManutProgEquipCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O C�DIGO DO REGISTRO!'; EdtCodManutencao.SetFocus; Exit;
  end;
DM.FTabela_auxiliar  := 32;
if (DM.VerificaDuplo(EdtCodManutencao.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodManutencao.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR J� CADASTRADO!!!';
    Exit;
  end;
if DM.qryManutProgEquipDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRI��O DO REGISTRO!'; EdtDescManutencao.SetFocus; Exit;
  end;
if DM.qryManutProgEquipCODMANUTPROGFAMEQUIP.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FAM�LIA DO REGISTRO!'; EdtDescFamilia.SetFocus; Exit;
  end;
if DM.qryManutProgEquipCRITICIDADE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A CRITICIDADE DO REGISTRO!'; CBCriticidade.SetFocus; Exit;
  end;
if (DM.qryManutProgEquipFREQUENCIA1.IsNull = True) or (DM.qryManutProgEquipFREQUENCIA1.AsInteger <= 0) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O PER�ODO EM DIAS PARA A MANUTEN��O!'; EdtDias.SetFocus; Exit;
  end;
if (DM.qryManutProgEquipDTAINICIO1.IsNull = True) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DATA DE PROGRAMA��O PARA A MANUTEN��O!'; EdtInicio.SetFocus; Exit;
  end;
if DM.qryManutProgEquipREPROGRAMAR1.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A REPROGRAMA��O DA MANUTEN��O!'; CBReprogramacao.SetFocus; Exit;
  end;

if (DM.qryManutProgEquipDTAINICIO1.AsDateTime > 0) and (DM.qryManutProgEquipGRUPOINSP.AsString <> 'S') then
  DM.qryManutProgEquipDTAINICIO1.AsDateTime := DateOf(DM.qryManutProgEquipDTAINICIO1.AsDateTime);

//Se alterar a data de in�cio
if LDataProgIni <> 0 then
  begin
    if (LDataProgIni <> DM.qryManutProgEquipDTAINICIO1.AsDateTime) and (DM.qryManutProgEquipGRUPOINSP.AsString = 'N') then
      begin
        DM.qryManutProgEquip.Edit;
        DM.qryManutProgEquipRELATORIO.AsString := 'N';
      end;
  end;

if (LblProgramarPor.Caption <> EmptyStr) then
  begin
    if DM.qryManutProgEquipFREQUENCIA2.IsNull = True then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONTROLE DA RESPECTIVA PROGRAMA��O!'; EdtControle.SetFocus; Exit;
      end;
    if DM.qryManutProgEquipREPROGRAMAR2.IsNull = True then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A REPROGRAMA��O DA MANUTEN��O!'; CBReprogramacao2.SetFocus; Exit;
      end;

    //Verifica a maior leitura no hist�rico para n�o permitir que seja cadastrada um leitura inferior
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT MAX(LEITURA)LEITURA FROM `manutprogequipamentohist` WHERE CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+' AND CODEQUIPAMENTO = '+QuotedStr(DM.qryManutProgEquipCODEQUIPAMENTO.AsString) + EmptyStr);
    DM.qryAuxiliar.Open;
    if DM.qryAuxiliar.FieldByName('LEITURA').AsFloat >DM.qryManutProgEquipFREQUENCIA2.AsFloat then
      begin
        Application.MessageBox('J� foram executadas inspe��es com leituras superiores a informada!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        EdtProxInspecao.SetFocus;
        Exit;
      end;
    DM.qryAuxiliar.Close;
  end
else
  begin
    DM.qryManutProgEquipFREQUENCIA2.Clear;
    DM.qryManutProgEquipLEITURA.Clear;
    DM.qryManutProgEquipREPROGRAMAR2.Clear;
  end;

DM.MSGAguarde('');

if DM.FEmpTransf = True then
  begin
    if DM.qryEquipamentos.Active = False then
      begin
        DM.qryEquipamentos.Close;
        DM.qryEquipamentos.Params[0].AsString := DM.qryManutProgEquipCODEQUIPAMENTO.AsString;
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
    if (DM.qryEquipEmRotaCODIGO.IsNull = False) and (DM.qryManutProgEquipGRUPOINSP.AsString = 'S') then
      begin
        DM.qryManutProgEquip.Edit;
        DM.qryManutProgEquipGRUPOINSP.AsString    := 'S';
        DM.qryManutProgEquipREPROGRAMAR1.AsString :=DM.qryEquipEmRotaREPROGRAMAR.AsString;
        DM.qryManutProgEquipROTA.AsString         :=DM.qryEquipEmRotaROTA.AsString;
        DM.qryManutProgEquipDTAINICIO1.AsString   :=DM.qryEquipEmRotaDATAINICIO.AsString;
        DM.qryManutProgEquipRELATORIO.AsString    :=DM.qryEquipEmRotaRELATORIO.AsString;
      end;
    DM.qryEquipEmRota.Close;
  end;

DM.qryManutProgEquip.Params[0].AsString := EdtCodManutencao.Text;
DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
DM.qryManutProgEquip.Params[2].AsString := DM.FParamAuxiliar[0];

if DM.qryLubrificProgEquipItensEsp.IsEmpty = False then
  begin
    if DM.qryLubrificProgEquipCODIGO.AsString <> '' then
      begin
        DM.qryLubrificProgEquip.Edit;
        DM.qryLubrificProgEquip.Post;
      end;

   DM.qryLubrificProgEquipItensEsp.Edit;
   DM.qryLubrificProgEquipItensEsp.Post;
  end;

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

EdtCodManutencao.ReadOnly := True;

DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('DELETE FROM manutprogequiphistitensesp WHERE CODMANUTPROGEQUIP = ' + QuotedStr(DM.qryManutProgEquipCODIGO.AsString) + ' AND CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+' AND (ITEM IS NULL OR ITEM = '') AND (DESCINSPECAO IS NULL OR DESCINSPECAO = '')');
DM.qryAuxiliar.Execute;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadManutProgEquip.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      BtnConsultar.OnClick(Sender);

    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISS�O PARA ALTERA��O!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadManutProgEquipPartesItensEsp, FrmTelaCadManutProgEquipPartesItensEsp);
    FrmTelaCadManutProgEquipPartesItensEsp.Caption := 'Itens Espec�ficos da Manuten��o: '+ DM.qryManutProgEquipDESCRICAO.AsString;
    FrmTelaCadManutProgEquipPartesItensEsp.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgEquipPartesItensEsp);
    DM.FDataSetParam    := DM.qryManutProgEquip;
    DM.FDataSourceParam := DM.dsManutProgEquip;
    DM.FParamAuxiliar[0]:= FrmTelaCadEquipamentos.EdtCodEquip.Text;
    DM.FTela            := 'CADMANUTPROGEQUIP';
    DM.FTabela_auxiliar := 32;
    DM.FAlterando := True;
  End;
end;

procedure TFrmTelaCadManutProgEquip.Button2Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        BtnConsultar.OnClick(Sender);
      end;

    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISS�O PARA ALTERA��O!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadManutProgEquipPecas, FrmTelaCadManutProgEquipPecas);
    FrmTelaCadManutProgEquipPecas.Caption := 'Pe�as da O.S.: '+ DM.qryOrdemServicoCODIGO.AsString;
    FrmTelaCadManutProgEquipPecas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgEquipPecas);
    DM.FDataSetParam    := DM.qryManutProgEquip;
    DM.FDataSourceParam := DM.dsManutProgEquip;
    DM.FParamAuxiliar[0]:= FrmTelaCadEquipamentos.EdtCodEquip.Text;
    DM.FTela            := 'CADMANUTPROGEQUIP';
    DM.FTabela_auxiliar := 32;
    DM.FAlterando := True;
  End;
end;

procedure TFrmTelaCadManutProgEquip.Button3Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      BtnConsultar.OnClick(Sender);

    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISS�O PARA ALTERA��O!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadManutProgEquipRecursos, FrmTelaCadManutProgEquipRecursos);
    FrmTelaCadManutProgEquipRecursos.Caption := 'Recursos da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.AsInteger);
    FrmTelaCadManutProgEquipRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgEquipRecursos);
    DM.FDataSetParam    := DM.qryManutProgEquip;
    DM.FDataSourceParam := DM.dsManutProgEquip;
    DM.FTela            := 'CADMANUTPROGEQUIP';
    DM.FParamAuxiliar[0]:= FrmTelaCadEquipamentos.EdtCodEquip.Text;
    DM.FTabela_auxiliar := 32;
    DM.FAlterando := True;
  End;

end;

procedure TFrmTelaCadManutProgEquip.Button4Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then
      BtnConsultar.OnClick(Sender);

    DM.FParamAuxiliar[0] := DM.qryManutProgEquipCODIGO.AsString;

    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;

    if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        DM.FDataSetParam.Cancel;
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISS�O PARA ALTERA��O!';
        DM.MSGAguarde('', False);
        Exit;
      end;

    Application.CreateForm(TFrmTelaCadManutProgEquipMObra, FrmTelaCadManutProgEquipMObra);
    FrmTelaCadManutProgEquipMObra.Caption := 'M�o de Obra da Manuten��o: '+ DM.qryManutProgEquipCODIGO.AsString;
    FrmTelaCadManutProgEquipMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgEquipMObra);
    DM.FDataSetParam    := DM.qryManutProgEquip;
    DM.FDataSourceParam := DM.dsManutProgEquip;
  End;

end;

procedure TFrmTelaCadManutProgEquip.ChbAtivoNFClick(Sender: TObject);
begin
  inherited;
  BtnSalvar.ImageIndex := 115;
end;

procedure TFrmTelaCadManutProgEquip.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBManutProgEquipGeral;
DM.FTabela_auxiliar := 32;
  inherited;

end;

procedure TFrmTelaCadManutProgEquip.EdtCodManutencaoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadManutProgEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//if FrmTelaCadManutProgEquip = nil then
DM.qryManutProgEquipPartes.Close;
DM.qryManutProgEquip.Close;
DM.qryManutProgEquipItens.Close;
DM.qryManutProgEquipItensEsp.Close;
DM.qryManutProgEquipPlanoTrab.Close;
DM.qryAuxiliar.Close;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
end;

procedure TFrmTelaCadManutProgEquip.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    :=DM.qryManutProgEquip;
DM.FDataSourceParam := DM.dsManutProgEquip;
DM.FTela := 'CADMANUTPROGEQUIP';
DM.FTabela_auxiliar := 32;
LDataProgIni := 0;
end;

procedure TFrmTelaCadManutProgEquip.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBManutProgEquipIndividual;
DM.FTabela_auxiliar := 321;
  inherited;
end;

end.

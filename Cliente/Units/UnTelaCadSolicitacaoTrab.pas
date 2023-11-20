unit UnTelaCadSolicitacaoTrab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvDBControls, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, Datasnap.DBClient, FireDAC.Comp.Client, FireDAC.Stan.Param,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList;

type
  TFrmTelaCadSolicitacaoTrab = class(TFrmTelaPaiCadastros)
    Label5: TLabel;
    EdtCodSolicitante: TDBEdit;
    EdtDescSolicitante: TDBEdit;
    BtnSolicitante: TButton;
    Label4: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    Label6: TLabel;
    Label7: TLabel;
    LblCodOrdemServico: TDBText;
    Label8: TLabel;
    EdtServico: TDBEdit;
    Label11: TLabel;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Label17: TLabel;
    Label18: TLabel;
    PSituacao: TPanel;
    Label14: TLabel;
    MJustificativa: TDBMemo;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    EdtTempo: TDBEdit;
    Label10: TLabel;
    EdtPrazo: TDBEdit;
    Label12: TLabel;
    EdtHorario: TJvDBMaskEdit;
    Label13: TLabel;
    EdtValor: TDBEdit;
    lblCaracteres: TLabel;
    Label15: TLabel;
    CBPrioridade: TDBComboBox;
    Label16: TLabel;
    EdtAquisicao: TJvDBDateEdit;
    Label19: TLabel;
    Label20: TLabel;
    EdtOficina: TDBEdit;
    BtnOficina: TButton;
    Label28: TLabel;
    PopupMenuCons: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    procedure BtnNovoClick(Sender: TObject);

    function MontarGrafico(Data: TDateTime; Chart: TChart): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure BtnSolicitanteClick(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MJustificativaChange(Sender: TObject);
    procedure BtnOficinaClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Area1Click(Sender: TObject);
    procedure Equipamento1Click(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
    LProgramadas: array[1..31] of Real;
    LExecucao: array[1..31] of Real;
    LPrimeiroDataMes, LUltimaDataMes, LDataConsulta: TDateTime;
    LTotalHH, LNovoTotalHH: Real;

  public
    { Public declarations }
  end;

var
  FrmTelaCadSolicitacaoTrab: TFrmTelaCadSolicitacaoTrab;

implementation

{$R *.dfm}

uses UnTelaCadFuncionarios, UnTelaCadEquipamentos, UnTelaConsulta,
  UnDmRelatorios, UnTelaCadOrdemServico, UnDM, UnTelaCadOficinas;

procedure TFrmTelaCadSolicitacaoTrab.Area1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'Equipamento';
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if (DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'CANCELADA') then Exit;

EdtCodSolicitante.ReadOnly := True;
DM.qrySolicitacaoTrab.Cancel;
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnConsultarClick(Sender: TObject);
begin
if DM.FParamAuxiliar[2] = '' then
begin
  PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  Exit;
end else
if DM.FParamAuxiliar[2] = 'Matrícula' then
begin
  DM.FTabela_auxiliar := 40;
    inherited;
end else
begin
  if DM.FParamAuxiliar[3] = '' then
  begin
    DM.FParamAuxiliar[2] := '';
    Exit;
  end;

  DM.qryAuxiliar.Close;
  DM.qryAuxiliar.Fields.Clear;
  DM.qryAuxiliar.Indexes.Clear;
  DM.qryAuxiliar.SQL.Clear;
  DM.qryAuxiliar.SQL.Add('SELECT `solictrabalho`.`CODIGO` FROM `solictrabalho` WHERE `solictrabalho`.`CODORDEMSERVICO` = ' + DM.FParamAuxiliar[3]);
  DM.qryAuxiliar.Open;
  with DM.dsSolicitacaoTrab.DataSet as TFDQuery do
    begin
      Close;
      Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
      Params[1].AsString := DM.FCodEmpresa;
      Open;
      Edit;
    end;
  DM.qryAuxiliar.Close;
end;
PIdentificacao.Enabled  := True;
PProgramacao.Enabled    := True;
PDiversos.Enabled       := True;

if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'SOLICITADA'    then begin PSituacao.Caption := 'SOLICITADA';    PSituacao.Color := clWhite;  PSituacao.Font.Color := clBlack;  end;
if DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'DETALHADA'     then begin PSituacao.Caption := 'DETALHADA';     PSituacao.Color := clYellow; PSituacao.Font.Color := clGreen;  end;
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
DM.FParamAuxiliar[2] := '';
DM.FDataSetParam     := DM.qrySolicitacaoTrab;
DM.FDataSourceParam  := DM.dsSolicitacaoTrab;
DM.FTela := 'CADSOLICITACAOTRAB';
DM.FTabela_auxiliar := 40;
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if DM.qrySolicitacaoTrab.IsEmpty = True then Exit;

if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    DM.qrySolicitacaoTrab.Edit;
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qrySolicitacaoTrabCODEQUIPAMENTO.AsString := DM.FCodCombo;
        DM.qrySolicitacaoTrabEQUIPAMENTO.AsString    := DM.FValorCombo;
        DM.qrySolicitacaoTrabCODCENTROCUSTO.AsString := DM.FParamAuxiliar[5]
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryEquipamentosCODIGO, DM.qryFormatoCodigoEQUIPAMENTOS, FrmTelaCadEquipamentos) = False then exit;
      Application.CreateForm(TFrmTelaCadEquipamentos, FrmTelaCadEquipamentos);
      FrmTelaCadEquipamentos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadEquipamentos);
    End;
  end;

DM.FDataSetParam    := DM.qrySolicitacaoTrab;
DM.FDataSourceParam := DM.dsSolicitacaoTrab;
DM.FTela            := 'CADSOLICITACAOTRAB';
DM.FTabela_auxiliar := 40;
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnExcluirClick(Sender: TObject);
var
LMotivo : String;
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if DM.FDataSetParam.Active = False then Exit;

if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'CANCELADA') then Exit;

if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    with DM.FDataSetParam as TFDQuery do
      begin
        Try
          if DM.FDataSetParam.IsEmpty = False then
            begin
              DM.qryOrdemServico.Close;
              DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
              DM.qryOrdemServico.Params[1].AsInteger := DM.qrySolicitacaoTrabCODORDEMSERVICO.AsInteger;
              DM.qryOrdemServico.Open;
              if DM.qryOrdemServico.IsEmpty = False then
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
                end;

              DM.qrySolicitacaoTrab.Edit;
              DM.qrySolicitacaoTrabSITUACAO.AsString := 'CANCELADA';
              DM.qrySolicitacaoTrab.Post;
              DM.qrySolicitacaoTrab.Close;

              PAuxiliares.Font.Color := clRed;
              PAuxiliares.Caption := 'REGISTRO EXCLUÍDO COM SUCESSO!!!';

              ControleBotoes(0);

              PSituacao.Caption := 'CANCELADA';
              PSituacao.Color := clBlack;
              PSituacao.Font.Color := $00FF8000;
            end;
        Except
          on E: Exception do
          begin
            DM.GravaLog('Falha ao excluir o registro. FrmTelaCadSolicitacaoTrab Linha: 285', E.ClassName, E.Message);
            Application.MessageBox('Falha ao excluir o registro!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
            PAuxiliares.Caption := EmptyStr;
          end;
        End;
      end;
    BtnSalvar.ImageName := 'Operacional\salvar';
    PSituacao.Caption    := EmptyStr;
    PSituacao.Color      := $00DFDFDF;
  end;
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

//DM.FDataHoraServidor := DM.DataHoraServidor;

PIdentificacao.Enabled  := True;
PProgramacao.Enabled    := True;
PDiversos.Enabled       := True;

DM.qrySolicitacaoTrabCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qrySolicitacaoTrabDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qrySolicitacaoTrabDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qrySolicitacaoTrabCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qrySolicitacaoTrabCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtDescSolicitante.SetFocus;
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if DM.qrySolicitacaoTrab.Active = False then Exit;
if DM.qrySolicitacaoTrab.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    DM.qrySolicitacaoTrab.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qrySolicitacaoTrabCODOFICINA.AsString := DM.FCodCombo;
        DM.qrySolicitacaoTrabOFICINA.AsString    := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qrySolicitacaoTrab;
DM.FDataSourceParam := DM.dsSolicitacaoTrab;
DM.FTela            := 'CADSOLICITACAOTRAB';
DM.FTabela_auxiliar := 40;
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qrySolicitacaoTrabSITUACAO_1.AsString = 'CANCELADA') then Exit;

if DM.qrySolicitacaoTrabSOLICITANTE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O SOLICITANTE DO SERVIÇO!'; EdtDescSolicitante.SetFocus; Exit;
  end;
if DM.qrySolicitacaoTrabCODEQUIPAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O EQUIPAMENTO DO SERVIÇO!'; EdtDescEquipamento.SetFocus; Exit;
  end;
if DM.qrySolicitacaoTrabDESCSERVICO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO SERVIÇO!'; EdtServico.SetFocus; Exit;
  end;
if DM.qrySolicitacaoTrabPRIORIDADEPARADA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A PRIORIDADE DO SERVIÇO!'; CBPrioridade.SetFocus; Exit;
  end;
if DM.qrySolicitacaoTrabCODOFICINA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A OFICINA DO SERVIÇO!'; EdtOficina.SetFocus; Exit;
  end;


DM.MSGAguarde('');

if DM.qrySolicitacaoTrabCODORDEMSERVICO.AsInteger <= 0 then
  begin
    DM.qrySolicitacaoTrabSITUACAO_1.AsString       := 'CADASTRADA';

    DM.qrySolicitacaoTrabCODORDEMSERVICO.AsInteger := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qrySolicitacaoTrabDESCSERVICO.AsString
                                                                            , DM.qrySolicitacaoTrabCODEQUIPAMENTO.AsString, EmptyStr, EmptyStr, EmptyStr, 'S'
                                                                            , DM.qrySolicitacaoTrabCODSOLICITANTE.AsString, CBPrioridade.Text, 'Para o Equipamento', DM.qrySolicitacaoTrabCODCENTROCUSTO.AsString, DM.qrySolicitacaoTrabJUSTIFICATIVA.AsString, DM.qrySolicitacaoTrabTEMPOESTIMADO.AsString, DM.qrySolicitacaoTrabCODOFICINA.AsString, EmptyStr, EmptyStr);
    PSituacao.Caption    := 'CADASTRADA';
    PSituacao.Color      := clRed;
    PSituacao.Font.Color := clYellow;
  end;

  inherited;
DM.qrySolicitacaoTrab.Params[0].AsInteger := DM.qrySolicitacaoTrabCODIGO.AsInteger;
DM.qrySolicitacaoTrab.Params[1].AsString  := DM.FCodEmpresa;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadSolicitacaoTrab.BtnSolicitanteClick(Sender: TObject);
begin
  inherited;
if DM.qrySolicitacaoTrab.Active = False then Exit;
if DM.qrySolicitacaoTrab.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.FParamAuxiliar[1] := 'NOME';
    DM.qrySolicitacaoTrab.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qrySolicitacaoTrabCODSOLICITANTE.AsString := DM.FCodCombo;
        DM.qrySolicitacaoTrabSOLICITANTE.AsString    := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qrySolicitacaoTrab;
DM.FDataSourceParam := DM.dsSolicitacaoTrab;
DM.FTela            := 'CADSOLICITACAOTRAB';
DM.FTabela_auxiliar := 40;

end;

procedure TFrmTelaCadSolicitacaoTrab.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 40;
  inherited;
PIdentificacao.Enabled  := True;
PProgramacao.Enabled    := True;
PDiversos.Enabled       := True;

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

procedure TFrmTelaCadSolicitacaoTrab.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadSolicitacaoTrab.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBSolicTrabalhoGeral;
DM.FTabela_auxiliar := 40;
  inherited;

end;

procedure TFrmTelaCadSolicitacaoTrab.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadSolicitacaoTrab.Equipamento1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'Equpamento';
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadSolicitacaoTrab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qrySolicitacaoTrab.Close;
//DM.qryTotalHomemHora.Close;
DM.qryTotalHomemHoraSeqHora.Close;
if FrmTelaCadOrdemServico = nil then
  DM.qryOrdemServico.Close;

{if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
  begin
    DM.qryOrdemServicoGerencia.Close;
    DM.qryOrdemServicoGerencia.Params[0].AsString := DM.FCodEmpresa;
    //DM.qryOrdemServicoGerencia.Params[1].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -18)) + ' 00:00:00';
    //DM.qryOrdemServicoGerencia.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
    DM.qryOrdemServicoGerencia.Open;
  end;
}end;

procedure TFrmTelaCadSolicitacaoTrab.FormShow(Sender: TObject);
begin
  inherited;
  DM.FDataSetParam     := DM.qrySolicitacaoTrab;
  DM.FDataSourceParam  := DM.dsSolicitacaoTrab;
  DM.FTela := 'CADSOLICITACAOTRAB';

  LPrimeiroDataMes := DateOf(StartOfTheMonth(DM.FDataHoraServidor));
  LUltimaDataMes   := DateOf(EndOfTheMonth(LPrimeiroDataMes));

  LTotalHH         := 0;
  LNovoTotalHH     := 0;

  LDataConsulta := LPrimeiroDataMes;

  DM.qryTotalHomemHora.Close;
  DM.qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
  DM.qryTotalHomemHora.Open;
  DM.qryTotalHomemHoraSeqHora.Open;

  while LDataConsulta < LUltimaDataMes do
    begin
      LNovoTotalHH := DM.TotalHomemHoraDisp(LDataConsulta, EmptyStr, EmptyStr);

      if LNovoTotalHH > LTotalHH then
        LTotalHH := LNovoTotalHH;

      LDataConsulta := IncDay(LDataConsulta, 1);
    end;

  DM.qryTotalHomemHora.Close;
  DM.qryTotalHomemHoraSeqHora.Close;

  MontarGrafico(LPrimeiroDataMes, Chart1);
end;

procedure TFrmTelaCadSolicitacaoTrab.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBSolicTrabalhoIndividual;
DM.FTabela_auxiliar := 401;
  inherited;

end;

procedure TFrmTelaCadSolicitacaoTrab.MenuItem1Click(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FParamAuxiliar[2] := 'Ordem de Serviço';
    DM.FParamAuxiliar[3] := DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');;
    BtnConsultar.OnClick(Sender);
  end;
end;

procedure TFrmTelaCadSolicitacaoTrab.MenuItem2Click(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FParamAuxiliar[2] := 'Matrícula';
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Solicitantes';
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.FParamAuxiliar[3] := DM.FCodCombo;
        BtnConsultar.OnClick(Sender);
      end;
  end;
end;

procedure TFrmTelaCadSolicitacaoTrab.MJustificativaChange(Sender: TObject);
var
  MaxChars, CurrentChars, RemainingChars: Integer;
begin
  inherited;
  MaxChars := 250;
  CurrentChars := Length(MJustificativa.Text);
  RemainingChars := MaxChars - CurrentChars;
  lblCaracteres.Caption := IntToStr(RemainingChars) + ' caracteres restantes';
end;

function TFrmTelaCadSolicitacaoTrab.MontarGrafico(Data: TDateTime; Chart: TChart): Boolean;
var
I : SmallInt;
LData : TDateTime;
begin
Result := False;

Chart.Series[0].Clear;
Chart.Series[1].Clear;

DM.FTotalHHDisp := Round(DM.TotalHomemHoraDisp(Data, EmptyStr, EmptyStr));

Chart.LeftAxis.Maximum := DM.FTotalHHDisp;

LData := StrToDateTime('01/' + FormatFloat('00', MonthOf(Data)) + '/' + IntToStr(YearOf(Data)));

For I := 1 to 31 Do
  LProgramadas[I]:= 0;

For I := 1 to 31 Do
  LExecucao[I]:= 0;

DM.qryCalendarioOSProgramadas.Close;
DM.qryCalendarioOSProgramadas.Params[0].AsString := DM.FCodEmpresa;
DM.qryCalendarioOSProgramadas.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LData);
DM.qryCalendarioOSProgramadas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncDay(LData, DaysInMonth(LData)));
DM.qryCalendarioOSProgramadas.Open;

For I := 1 to 31 Do
  LProgramadas[I]:= 0;

For I := 1 to 31 Do
  LExecucao[I]:= 0;

while not DM.qryCalendarioOSProgramadas.Eof = True do
  begin
    LProgramadas[DayOf(DM.qryCalendarioOSProgramadasDATAPROGINI.AsDateTime)] := LProgramadas[DayOf(DM.qryCalendarioOSProgramadasDATAPROGINI.AsDateTime)] + DM.qryCalendarioOSProgramadasTEMPOPREVISTO.AsFloat;
    DM.qryCalendarioOSProgramadas.Next;
  end;

for I := 0 to DaysInMonth(DM.qryCalendarioOSProgramadasDATAPROGINI.AsDateTime) do
  begin
    Chart.Series[0].Add(LProgramadas[I]);
  end;

DM.qryCalendarioOSExecucao.Close;
DM.qryCalendarioOSExecucao.Params[0].AsString := DM.FCodEmpresa;
DM.qryCalendarioOSExecucao.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LData);
DM.qryCalendarioOSExecucao.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncDay(LData, DaysInMonth(LData)));
DM.qryCalendarioOSExecucao.Open;

while not DM.qryCalendarioOSExecucao.Eof = True do
  begin
    LExecucao[DayOf(DM.qryCalendarioOSExecucaoDATAINICIOREAL.AsDateTime)] := LExecucao[DayOf(DM.qryCalendarioOSExecucaoDATAINICIOREAL.AsDateTime)] + DM.qryCalendarioOSExecucaoTEMPOPREVISTO.AsFloat;
    DM.qryCalendarioOSExecucao.Next;
  end;

for I := 0 to DaysInMonth(DM.qryCalendarioOSExecucaoDATAINICIOREAL.AsDateTime) do
  begin
    Chart.Series[1].Add(LExecucao[I]);
  end;
end;

end.

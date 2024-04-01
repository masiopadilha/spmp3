unit UnTelaCadOrdemServicoGerencia;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, System.DateUtils,
  Vcl.DBCtrls, Vcl.Menus, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, JvExGrids, JvStringGrid, IOUtils;
type
  TFrmTelaCadOrdemServicoGerencia = class(TFrmTelaPaiOKCancel)
    PFuncoes: TPanel;
    GrdOrdemServico: TDBGrid;
    BtnCadastro: TButton;
    BtnProgramacao: TButton;
    BtnExecucao: TButton;
    BtnLiberacao: TButton;
    BtnFechamento: TButton;
    BtnParalisacao: TButton;
    BtnImpressao: TButton;
    BtnCancelamento: TButton;
    Label9: TLabel;
    CBPeriodo: TComboBox;
    BtnHistorico: TButton;
    PopupMenuLiberar: TPopupMenu;
    Total: TMenuItem;
    Parcial: TMenuItem;
    PopupMenuRelat: TPopupMenu;
    Ficha1: TMenuItem;
    Lista1: TMenuItem;
    btnMObra: TButton;
    PFiltros: TPanel;
    chkNProg: TCheckBox;
    chkProg: TCheckBox;
    chkExec: TCheckBox;
    chkLib: TCheckBox;
    chkFec: TCheckBox;
    chkPar: TCheckBox;
    chkSolic: TCheckBox;
    chkRot: TCheckBox;
    Panel1: TPanel;
    Label6: TLabel;
    BtnFamiliaEquip: TButton;
    Label13: TLabel;
    BtnOficina: TButton;
    edtOficina: TEdit;
    EdtFamiliaEquip: TEdit;
    Timer1: TTimer;
    Label2: TLabel;
    PopupMenuExecutar: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Label1: TLabel;
    edtManutencao: TEdit;
    BtnManutencao: TButton;
    MaodeObra1: TMenuItem;
    Inspecoes1: TMenuItem;
    Completa1: TMenuItem;
    Label11: TLabel;
    CBPrioridade: TComboBox;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label4: TLabel;
    EdtData2: TJvDateTimePicker;
    BtnConsultar: TButton;
    chbCanc: TCheckBox;
    Simples1: TMenuItem;
    Checklist1: TMenuItem;
    chkParado: TCheckBox;
    chkDetalhad: TCheckBox;
    Exportar1: TMenuItem;
    grid: TJvStringGrid;
    DSOSSimplesExcel: TDataSource;
    FDMemTOSSimplesExcel: TFDMemTable;
    FDMemTable1: TFDMemTable;
    IntegerField2: TIntegerField;
    StringField9: TStringField;
    DateTimeField7: TDateTimeField;
    DateTimeField8: TDateTimeField;
    DateTimeField9: TDateTimeField;
    DateTimeField10: TDateTimeField;
    DateTimeField11: TDateTimeField;
    DateTimeField12: TDateTimeField;
    StringField10: TStringField;
    StringField11: TStringField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    chbVenc: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure GrdOrdemServicoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ConfigurarFiltros;
    procedure BtnCadastroClick(Sender: TObject);
    procedure BtnProgramacaoClick(Sender: TObject);
    procedure GrdOrdemServicoDblClick(Sender: TObject);
    procedure GrdOrdemServicoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGConsSimplesClick(Sender: TObject);
    procedure BtnExecucaoClick(Sender: TObject);
    procedure BtnLiberacaoClick(Sender: TObject);
    procedure ParcialClick(Sender: TObject);
    procedure TotalClick(Sender: TObject);
    procedure BtnFechamentoClick(Sender: TObject);
    procedure BtnHistoricoClick(Sender: TObject);
    procedure BtnParalisacaoClick(Sender: TObject);
    procedure BtnCancelamentoClick(Sender: TObject);
    procedure BtnImpressaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ficha1Click(Sender: TObject);
    procedure btnMObraClick(Sender: TObject);
    procedure LiberarMaodeObraEmExecucao;
    procedure GrdOrdemServicoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnOficinaClick(Sender: TObject);
    procedure EdtOficinaDblClick(Sender: TObject);
    procedure EdtFamiliaEquipDblClick(Sender: TObject);
    procedure BtnFamiliaEquipClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtManutencaoDblClick(Sender: TObject);
    procedure BtnManutencaoClick(Sender: TObject);
    procedure chkNProgClick(Sender: TObject);
    procedure Completa1Click(Sender: TObject);
    procedure MaodeObra1Click(Sender: TObject);
    procedure Inspecoes1Click(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Simples1Click(Sender: TObject);
    procedure Checklist1Click(Sender: TObject);
    procedure CBPrioridadeChange(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
  private
    { Private declarations }
    hora_futura: TDateTime;

    procedure LimpaGrid(Grid: TStringGrid);
    procedure CopyDataSetToGrid(Query: TFDMemTable; StringGrid: TStringGrid);
  public
    { Public declarations }
  end;
var
  FrmTelaCadOrdemServicoGerencia: TFrmTelaCadOrdemServicoGerencia;
  LEquipamento, LCodOficina, LCodFamilia, LNProg, LDet, LProg, LExec,
  LLib, LFec, LPar, LSolic, LRot, LCanc, LVenc, LParado : String;
implementation
{$R *.dfm}
uses UnTelaConsulta, UnTelaCadOrdemServico,
  UnTelaCadOrdemServicoMObraProg, UnTelaCadOrdemServicoMObraExec,
  UnTelaCadOrdemServicoFechamento, UnTelaCadOrdemServicoHistorico,
  UnTelaCadOrdemServicoParalisacao, UnDmRelatorios,
  UnTelaCadOrdemServicoLocalizaMObra, UnDM;
procedure TFrmTelaCadOrdemServicoGerencia.BtnCadastroClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
  Try
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Timer1.Enabled := False;
    Application.CreateForm(TFrmTelaCadOrdemServico, FrmTelaCadOrdemServico);
    FrmTelaCadOrdemServico.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServico);
    Timer1.Enabled := True;
  End;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnCancelamentoClick(Sender: TObject);
var
LMotivo : String;
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CADASTRADA') or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DETALHADA')
  or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'SOLICITADA')
    or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DESPROGRAMADA') then
      begin
        if Application.MessageBox('Deseja realmente cancelar a O.S. ?','SPMP', MB_YESNO + MB_ICONWARNING) = MRYes then
          begin
            with DM.qryOrdemServico do
              begin
                Close;
                Params[0].AsString  := DM.FCodEmpresa;
                Params[1].AsInteger := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
                Open;
                Edit;
              end;
            LMotivo := DM.CampoInputBox('SPMP', 'Informe o motivo do cancelamento:');
            if LMotivo = EmptyStr then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'É OBRIGATÓRIO INFORMAR O MOTIVO DO CANCELAMENTO!'; Exit;
              end;
            DM.qryOrdemServico.Edit;
            DM.qryOrdemServicoOBSERVACOES.AsString := LMotivo;
            DM.qryOrdemServicoSITUACAO.AsString    := 'CANCELADA';
            DM.qryOrdemServico.Post;
            DM.qryOrdemServicoGerencia.Edit;
            DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'CANCELADA';
            DM.qryOrdemServicoGerenciaOBSERVACOES.AsString := LMotivo;
            DM.qryOrdemServicoGerencia.Post;
            with DM.qryAuxiliar do
              begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE manutprogequipamentohist SET SITUACAO = ''FECHADA'', REALIZADA = ''N'' WHERE CODORDEMSERVICO = '+QuotedStr(DM.qryOrdemServicoCODIGO.AsString)+' AND CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+';'
                         + ' UPDATE lubrificprogequipamentohist SET SITUACAO = ''FECHADA'', REALIZADA = ''N'' WHERE CODORDEMSERVICO = '+QuotedStr(DM.qryOrdemServicoCODIGO.AsString)+' AND CODEMPRESA = '+QuotedStr(DM.FCodEmpresa)+';');
                Execute;
              end;
          end;
      end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnConsultarClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if EdtData1.Date > EdtData2.Date then
  EdtData2.Date := EdtData1.Date;
DM.qryOrdemServicoGerencia.Close;
DM.qryOrdemServicoGerencia.Params[0].AsString := DM.FCodEmpresa;
DM.qryOrdemServicoGerencia.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
DM.qryOrdemServicoGerencia.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
DM.qryOrdemServicoGerencia.Open;
ConfigurarFiltros;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnExecucaoClick(Sender: TObject);
var
LTexto : PChar;
LPecas : String;
LSemEstoque : Boolean;
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOEXECUTAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PARALISADA') then
  begin
    BtnParalisacao.OnClick(Sender);
    Exit;
  end;

PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')
  or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA')
    or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CANCELADA')
      or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO') then Exit;

if DM.qryOrdemServicoGerenciaCODMANUTENCAO.AsString = EmptyStr Then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'CADASTRO DA ORDEM DE SERVIÇO INCOMPLETO!';
    Exit;
  end;

if Application.MessageBox('Deseja realmente executar a O.S.?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDNo then Exit;

Timer1.Enabled := False;

DM.MSGAguarde('');

DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
  with DM.qryOrdemServico do
    begin
      Close;
      Params[0].AsString := DM.FCodEmpresa;
      Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
      Open;
      Edit;
    end;

DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeMObra.Open;
if DM.qryOrdemServicoEquipeMObra.IsEmpty = True Then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'MÃO DE OBRA NÃO CADASTRADA!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if DM.qryOrdemServicoEquipe.Active                  = False then DM.qryOrdemServicoEquipe.Open;
if DM.qryOrdemServicoEquipeMObra.Active             = False then DM.qryOrdemServicoEquipeMObra.Open;
if DM.qryOrdemServicoEquipePecas.Active             = False then DM.qryOrdemServicoEquipePecas.Open;
if DM.qryOrdemServicoEquipeLubrificantes.Active     = False then DM.qryOrdemServicoEquipeLubrificantes.Open;
if DM.qryOrdemServicoEquipeRecursos.Active          = False then DM.qryOrdemServicoEquipeRecursos.Open;
if DM.qryOrdemServicoEquipeMObraUtil.Active         = False then DM.qryOrdemServicoEquipeMObraUtil.Open;
if DM.qryOrdemServicoEquipePecasUtil.Active         = False then DM.qryOrdemServicoEquipePecasUtil.Open;
if DM.qryOrdemServicoEquipeRecursosUtil.Active      = False then DM.qryOrdemServicoEquipeRecursosUtil.Open;
if DM.qryOrdemServicoEquipeLubrificantesUtil.Active = False then DM.qryOrdemServicoEquipeLubrificantesUtil.Open;
if DM.qryOrdemServicoMObraProg.Active               = False then DM.qryOrdemServicoMObraProg.Open;
if DM.qryOrdemServicoMObraExec.Active               = False then DM.qryOrdemServicoMObraExec.Open;

if DM.qryOrdemServicoEquipeMObraCODCALENDARIO.IsNull = True Then
  begin
    Try
      Application.CreateForm(TFrmTelaCadOrdemServicoMObraExec, FrmTelaCadOrdemServicoMObraExec);
      FrmTelaCadOrdemServicoMObraExec.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadOrdemServicoMObraExec);
    End;
    if DM.qryOrdemServicoEquipe.Active = False then DM.qryOrdemServicoEquipe.Open;
    if DM.qryOrdemServicoEquipeMObra.Active = False then DM.qryOrdemServicoEquipeMObra.Open;
    if DM.qryOrdemServicoEquipeMObraCODCALENDARIO.IsNull = True Then
      begin
        PAuxiliares.Font.Color  := clRed;
        PAuxiliares.Caption     := 'CALENDÁRIO DE MÃO DE OBRA NÃO CADASTRADO!';
        DM.MSGAguarde('', False);
        Exit;
      end;
  end;

DM.qryOrdemServicoMObraDisp.Close;
DM.qryOrdemServicoMObraDisp.Params[0].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
DM.qryOrdemServicoMObraDisp.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
DM.qryOrdemServicoMObraDisp.Params[2].AsString := DM.FCodEmpresa;
if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
  DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'AUTÔNOMA'
else
  DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'OPERACIONAL';
DM.qryOrdemServicoMObraDisp.Open;

//Verifica a disponibilidade das peças solicitadas no estoque
LPecas := 'As seguintes peças não estão disponíveis no estoque:' + #13;
LSemEstoque := False;
while not DM.qryOrdemServicoEquipePecas.Eof do
  begin
    if DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger > DM.qryOrdemServicoEquipePecasESTOQUE.AsInteger then
      begin
        LPecas := LPecas + #13 + 'Descrição: ' + DM.qryOrdemServicoEquipePecasPECA.AsString + #13 + 'Referência: '+DM.qryOrdemServicoEquipePecasREFERENCIA.AsString;
        LSemEstoque := True;
      end;
    DM.qryOrdemServicoEquipePecas.Next;
  end;

if LSemEstoque = True then
  begin
    //Caso deseje continuar com a OS mesmo sem peças no estoque, a qtde solicitada para a OS é zerada.
    LTexto := PChar(LPecas + #13 + #13+ 'Deseja prosseguir com a execução da ordem de serviço?');
    if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDNo then begin DM.MSGAguarde('', False); Exit; end;
      begin
        DM.qryOrdemServicoEquipePecas.First;
        while not DM.qryOrdemServicoEquipePecas.Eof do
          begin
            if DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger > DM.qryOrdemServicoEquipePecasESTOQUE.AsInteger then
              begin
                DM.qryOrdemServicoEquipePecas.Edit;
                DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger := 0;
                DM.qryOrdemServicoEquipePecas.Post;
              end;
            DM.qryOrdemServicoEquipePecas.Next
          end;
      end;
  end;

if LSemEstoque = False then
  begin
    DM.qryOrdemServicoEquipePecas.First;
    while not DM.qryOrdemServicoEquipePecas.Eof do
      begin
        if DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger <= DM.qryOrdemServicoEquipePecasESTOQUE.AsInteger then
          begin
            DM.qryOrdemServicoEquipePecasUtil.Append;
            DM.qryOrdemServicoEquipePecasUtilCODEMPRESA.AsString        := DM.FCodEmpresa;
            DM.qryOrdemServicoEquipePecasUtilCODORDEMSERVICO.AsInteger  := DM.qryOrdemServicoEquipePecasCODORDEMSERVICO.AsInteger;
            DM.qryOrdemServicoEquipePecasUtilCODPECASREPOSICAO.AsString := DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString;
            DM.qryOrdemServicoEquipePecasUtilQTDESOLIC.AsInteger        := DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger;
            DM.qryOrdemServicoEquipePecasUtilENTRADA.AsDateTime         := DM.FDataHoraServidor;
            DM.qryOrdemServicoEquipePecasUtil.Post;
            DM.qryPecasReposicao.Close;
            DM.qryPecasReposicao.Params[0].AsString := DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString;
            DM.qryPecasReposicao.Params[1].AsString := DM.FCodEmpresa;
            DM.qryPecasReposicao.Open;
            if DM.qryPecasReposicao.IsEmpty = False then
              begin
                DM.qryPecasReposicao.Edit;
                DM.qryPecasReposicaoQUANTIDADE.AsInteger := DM.qryPecasReposicaoQUANTIDADE.AsInteger - DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger;
                DM.qryPecasReposicao.Post;
              end;
          end;
        DM.qryOrdemServicoEquipePecas.Next
      end;
    //DM.qryOrdemServicoEquipePecasUtil.Close;
  end;

//Verifica a disponibilidade dos lubrificantes solicitados no estoque
LPecas := 'Os seguintes lubrificantes não estão disponíveis no estoque:' + #13;
LSemEstoque := False;
while not DM.qryOrdemServicoEquipeLubrificantes.Eof do
  begin
    if DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsFloat > DM.qryOrdemServicoEquipeLubrificantesESTOQUE.AsFloat then
      begin
        LPecas := LPecas + #13 + 'Descrição: ' + DM.qryOrdemServicoEquipeLubrificantesLUBRIFICANTE.AsString;
        LSemEstoque := True;
      end;
    DM.qryOrdemServicoEquipeLubrificantes.Next;
  end;

if LSemEstoque = True then
  begin
    //Caso deseje continuar com a OS mesmo sem peças no estoque, a qtde solicitada para a OS é zerada.
    LTexto := PChar(LPecas + #13 + #13+ 'Deseja prosseguir com a execução da ordem de serviço?');
    if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDNo then begin DM.MSGAguarde('', False); Exit; end;
      begin
        DM.qryOrdemServicoEquipeLubrificantes.First;
        while not DM.qryOrdemServicoEquipeLubrificantes.Eof do
          begin
            if DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsFloat > DM.qryOrdemServicoEquipeLubrificantesESTOQUE.AsFloat then
              begin
                DM.qryOrdemServicoEquipeLubrificantes.Edit;
                DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsFloat := 0;
                DM.qryOrdemServicoEquipeLubrificantes.Post;
              end;
            DM.qryOrdemServicoEquipeLubrificantes.Next
          end;
      end;
  end;

if LSemEstoque = False then
  begin
    DM.qryOrdemServicoEquipeLubrificantes.First;
    while not DM.qryOrdemServicoEquipeLubrificantes.Eof do
      begin
        if DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsInteger <= DM.qryOrdemServicoEquipeLubrificantesESTOQUE.AsInteger then
          begin
            DM.qryOrdemServicoEquipeLubrificantesUtil.Append;
            DM.qryOrdemServicoEquipeLubrificantesUtilCODEMPRESA.AsString        := DM.FCodEmpresa;
            DM.qryOrdemServicoEquipeLubrificantesUtilCODORDEMSERVICO.AsInteger  := DM.qryOrdemServicoEquipeLubrificantesCODORDEMSERVICO.AsInteger;
            DM.qryOrdemServicoEquipeLubrificantesUtilCODLUBRIFICANTE.AsString   := DM.qryOrdemServicoEquipeLubrificantesCODLUBRIFICANTE.AsString;
            DM.qryOrdemServicoEquipeLubrificantesUtilQTDESOLIC.AsInteger        := DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsInteger;
            DM.qryOrdemServicoEquipeLubrificantesUtilENTRADA.AsDateTime         := DM.FDataHoraServidor;
            DM.qryOrdemServicoEquipeLubrificantesUtil.Post;
            DM.qryLubrificantes.Close;
            DM.qryLubrificantes.Params[0].AsString := DM.qryOrdemServicoEquipeLubrificantesCODLUBRIFICANTE.AsString;
            DM.qryLubrificantes.Params[1].AsString := DM.FCodEmpresa;
            DM.qryLubrificantes.Open;
            if DM.qryLubrificantes.IsEmpty = False then
              begin
                DM.qryLubrificantes.Edit;
                DM.qryLubrificantesQTDETOTALUTIL.AsFloat := DM.qryLubrificantesQTDETOTALUTIL.AsFloat - DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsFloat;
                DM.qryLubrificantes.Post;
              end;
          end;
        DM.qryOrdemServicoEquipeLubrificantes.Next
      end;
    DM.qryOrdemServicoEquipeLubrificantesUtil.Close;
  end;

if DM.qryOrdemServicoMObraProg.IsEmpty = False then
  begin
    while not DM.qryOrdemServicoEquipeMObra.Eof = True do
      begin
        while not DM.qryOrdemServicoMObraProg.Eof = True do
          begin
            if DM.qryOrdemServicoMObraDisp.Locate('MATRICULA', DM.qryOrdemServicoMObraProgMATRICULA.AsString, []) = True then
              begin
                if DM.qryOrdemServicoMObraProgOCUPADO.AsString = 'S' then
                  begin
                    LTexto := PChar(DM.qryOrdemServicoMObraProgNOME.AsString + ' está ocupado em outro serviço, confirma a inclusão?');
                    if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
                      begin
                        DM.qryOrdemServicoEquipeMObraUtil.Append;
                        DM.qryOrdemServicoEquipeMObraUtilCODEMPRESA.AsString       := DM.FCodEmpresa;
                        DM.qryOrdemServicoEquipeMObraUtilCODEQUIPE.AsString        := DM.qryOrdemServicoMObraProgCODEQUIPE.AsString;
                        DM.qryOrdemServicoEquipeMObraUtilCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsInteger;
                        DM.qryOrdemServicoEquipeMObraUtilCODCARGO.AsString         := DM.qryOrdemServicoMObraProgCODCARGO.AsString;
                        DM.qryOrdemServicoEquipeMObraUtilCODCALENDARIO.AsString    := DM.qryOrdemServicoEquipeMObraCODCALENDARIO.AsString;
                        DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString        := DM.qryOrdemServicoMObraProgMATRICULA.AsString;
                        DM.qryOrdemServicoEquipeMObraUtilNOME.AsString             := DM.qryOrdemServicoMObraProgNOME.AsString;
                        DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat    := DM.qryOrdemServicoMObraProgTOTALHOMEMHORA.AsFloat;
                        DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat      := DM.qryOrdemServicoMObraProgQTDEHENORMAL.AsFloat;
                        DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat     := DM.qryOrdemServicoMObraProgQTDEHEFERIADO.AsFloat;
                        DM.qryOrdemServicoEquipeMObraUtilESPECIALISTA.AsString     := DM.qryOrdemServicoMObraProgESPECIALISTA.AsString;
                        DM.qryOrdemServicoEquipeMObraUtil.Post;

                        DM.qryOrdemServicoMObraExec.Append;
                        DM.qryOrdemServicoMObraExecCODEMPRESA.AsString        := DM.FCodEmpresa;
                        DM.qryOrdemServicoMObraExecCODORDEMSERVICO.AsInteger  := DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsInteger;
                        DM.qryOrdemServicoMObraExecCODEQUIPE.AsString         := DM.qryOrdemServicoMObraProgCODEQUIPE.AsString;
                        DM.qryOrdemServicoMObraExecCODCARGO.AsString          := DM.qryOrdemServicoMObraProgCODCARGO.AsString;
                        DM.qryOrdemServicoMObraExecMATRICULA.AsString         := DM.qryOrdemServicoMObraProgMATRICULA.AsString;
                        DM.qryOrdemServicoMObraExecNOME.AsString              := DM.qryOrdemServicoMObraProgNOME.AsString;
                        DM.qryOrdemServicoMObraExecENTRADA.AsDateTime         := DM.FDataHoraServidor;
                        DM.qryOrdemServicoMObraExec.Post;

                        //Verifica se a mão de obra não está programada em outra OS, se não estiver define status de Programada = NÃO
                        DM.qryAuxiliar.Close;
                        DM.qryAuxiliar.SQL.Clear;
                        DM.qryAuxiliar.SQL.Add('SELECT OMF.MATRICULA FROM `ordemservico` O, `ordemservicoequipemobrafunc` OMF WHERE OMF.CODORDEMSERVICO = O.CODIGO'
                                                +  ' AND O.SITUACAO = ''PROGRAMADA'' AND O.CODEMPRESA = :CODEMPRESA AND OMF.MATRICULA = :MATRICULA AND O.CODIGO <> :CODORDEMSERVICO');
                        DM.qryAuxiliar.Params.ParamByName('CODEMPRESA').AsString := DM.FCodEmpresa;
                        DM.qryAuxiliar.Params.ParamByName('MATRICULA').AsString  := DM.qryOrdemServicoMObraProgMATRICULA.AsString;
                        DM.qryAuxiliar.Params.ParamByName('CODORDEMSERVICO').AsString  := DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsString;
                        DM.qryAuxiliar.Open;
                        DM.qryOrdemServicoMObraDisp.Edit;
                        DM.qryOrdemServicoMObraDispOCUPADO.AsString := 'S';
                        if DM.qryAuxiliar.IsEmpty = True then DM.qryOrdemServicoMObraDispPROGRAMADO.AsString := 'N';
                        DM.qryOrdemServicoMObraDisp.Post;
                      end;
                  end
                else
                  begin
                    DM.qryOrdemServicoEquipeMObraUtil.Append;
                    DM.qryOrdemServicoEquipeMObraUtilCODEMPRESA.AsString       := DM.FCodEmpresa;
                    DM.qryOrdemServicoEquipeMObraUtilCODEQUIPE.AsString        := DM.qryOrdemServicoMObraProgCODEQUIPE.AsString;
                    DM.qryOrdemServicoEquipeMObraUtilCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsInteger;
                    DM.qryOrdemServicoEquipeMObraUtilCODCARGO.AsString         := DM.qryOrdemServicoMObraProgCODCARGO.AsString;
                    DM.qryOrdemServicoEquipeMObraUtilCODCALENDARIO.AsString    := DM.qryOrdemServicoEquipeMObraCODCALENDARIO.AsString;
                    DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString        := DM.qryOrdemServicoMObraProgMATRICULA.AsString;
                    DM.qryOrdemServicoEquipeMObraUtilNOME.AsString             := DM.qryOrdemServicoMObraProgNOME.AsString;
                    DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat    := DM.qryOrdemServicoMObraProgTOTALHOMEMHORA.AsFloat;
                    DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat      := DM.qryOrdemServicoMObraProgQTDEHENORMAL.AsFloat;
                    DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat     := DM.qryOrdemServicoMObraProgQTDEHEFERIADO.AsFloat;
                    DM.qryOrdemServicoEquipeMObraUtilESPECIALISTA.AsString     := DM.qryOrdemServicoMObraProgESPECIALISTA.AsString;
                    DM.qryOrdemServicoEquipeMObraUtil.Post;

                    DM.qryOrdemServicoMObraExec.Append;
                    DM.qryOrdemServicoMObraExecCODEMPRESA.AsString        := DM.FCodEmpresa;
                    DM.qryOrdemServicoMObraExecCODORDEMSERVICO.AsInteger  := DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsInteger;
                    DM.qryOrdemServicoMObraExecCODEQUIPE.AsString         := DM.qryOrdemServicoMObraProgCODEQUIPE.AsString;
                    DM.qryOrdemServicoMObraExecCODCARGO.AsString          := DM.qryOrdemServicoMObraProgCODCARGO.AsString;
                    DM.qryOrdemServicoMObraExecMATRICULA.AsString         := DM.qryOrdemServicoMObraProgMATRICULA.AsString;
                    DM.qryOrdemServicoMObraExecNOME.AsString              := DM.qryOrdemServicoMObraProgNOME.AsString;
                    DM.qryOrdemServicoMObraExecENTRADA.AsDateTime         := DM.FDataHoraServidor;
                    DM.qryOrdemServicoMObraExec.Post;

                    //Verifica se a mão de obra não está programada em outra OS, se não estiver define status de Programada = NÃO
                    DM.qryAuxiliar.Close;
                    DM.qryAuxiliar.SQL.Clear;
                    DM.qryAuxiliar.SQL.Add('SELECT OMF.MATRICULA FROM `ordemservico` O, `ordemservicoequipemobrafunc` OMF WHERE OMF.CODORDEMSERVICO = O.CODIGO'
                                            +  ' AND O.SITUACAO = ''PROGRAMADA'' AND O.CODEMPRESA = :CODEMPRESA AND OMF.MATRICULA = :MATRICULA AND O.CODIGO <> :CODORDEMSERVICO');
                    DM.qryAuxiliar.Params.ParamByName('CODEMPRESA').AsString := DM.FCodEmpresa;
                    DM.qryAuxiliar.Params.ParamByName('MATRICULA').AsString  := DM.qryOrdemServicoMObraProgMATRICULA.AsString;
                    DM.qryAuxiliar.Params.ParamByName('CODORDEMSERVICO').AsString  := DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsString;
                    DM.qryAuxiliar.Open;
                    DM.qryOrdemServicoMObraDisp.Edit;
                    DM.qryOrdemServicoMObraDispOCUPADO.AsString := 'S';
                    if DM.qryAuxiliar.IsEmpty = True then DM.qryOrdemServicoMObraDispPROGRAMADO.AsString := 'N';
                    DM.qryOrdemServicoMObraDisp.Post;
                  end;
              end;
            DM.qryOrdemServicoMObraProg.Next;
          end;
        DM.qryOrdemServicoEquipeMObra.Next;
      end;
  end;

while not DM.qryOrdemServicoEquipe.Eof do
  begin
    while not DM.qryOrdemServicoEquipeRecursos.Eof do
      begin
        if DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsInteger <= DM.qryOrdemServicoEquipeRecursosESTOQUE.AsInteger then
          begin
            DM.qryOrdemServicoEquipeRecursosUtil.Append;
            DM.qryOrdemServicoEquipeRecursosUtilCODEMPRESA.AsString        := DM.FCodEmpresa;
            DM.qryOrdemServicoEquipeRecursosUtilCODORDEMSERVICO.AsInteger  := DM.qryOrdemServicoCODIGO.AsInteger;
            DM.qryOrdemServicoEquipeRecursosUtilCODRECURSO.AsString        := DM.qryOrdemServicoEquipeRecursosCODRECURSO.AsString;
            DM.qryOrdemServicoEquipeRecursosUtilQTDESOLIC.AsInteger        := DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsInteger;
            DM.qryOrdemServicoEquipeRecursosUtilENTRADA.AsDateTime         := DM.FDataHoraServidor;
            DM.qryOrdemServicoEquipeRecursosUtil.Post;

            DM.qryRecursos.Close;
            DM.qryRecursos.Params[0].AsString := DM.qryOrdemServicoEquipeRecursosCODRECURSO.AsString;
            DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
            DM.qryRecursos.Open;
            if DM.qryRecursos.IsEmpty = False then
              begin
                DM.qryRecursos.Edit;
                DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger - DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsInteger;
                DM.qryRecursos.Post;
              end;
          end;
        DM.qryOrdemServicoEquipeRecursos.Next
      end;
    DM.qryOrdemServicoEquipe.Next;
  end;

//Se a O.S. estiver paralisada não assumir uma nova hora de início.
DM.qryOrdemServico.Edit;
if DM.qryOrdemServicoSITUACAO.AsString <> 'PARALISADA' then
  begin
    DM.qryOrdemServicoDATAINICIO.AsDateTime     := DM.FDataHoraServidor;
    DM.qryOrdemServicoDATAINICIOREAL.AsDateTime := DM.FDataHoraServidor;
  end;
DM.qryOrdemServicoSITUACAO.AsString := 'EXECUCAO';
DM.qryOrdemServico.Post;

DM.qryOrdemServicoGerencia.Edit;
DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'EXECUCAO';
DM.qryOrdemServicoGerenciaDATAINICIOREAL.AsDateTime := DM.FDataHoraServidor;
DM.qryOrdemServicoGerencia.Post;

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
        DM.qrySolicitacaoTrabSITUACAO.AsString := 'EXECUCAO';
        DM.qrySolicitacaoTrab.Post;
      end;
  end;

DM.MSGAguarde('', False);

DM.qryOrdemServicoEquipeMObra.Close;
DM.qryOrdemServicoMObraProg.Close;
DM.qryOrdemServicoMObraDisp.Close;
DM.qryOrdemServicoEquipe.Close;
DM.qryOrdemServicoEquipeMObra.Close;
DM.qryOrdemServicoEquipePecas.Close;
DM.qryOrdemServicoEquipeRecursos.Close;
DM.qryOrdemServicoEquipeLubrificantes.Close;

DM.qryOrdemServicoEquipeMObraUtil.Close;
DM.qryOrdemServicoEquipePecasUtil.Close;
DM.qryOrdemServicoEquipeRecursosUtil.Close;
DM.qryOrdemServicoEquipeLubrificantesUtil.Close;
DM.qryOrdemServicoMObraExec.Close;
DM.qryPecasReposicao.Close;
DM.qryRecursos.Close;
DM.qrySolicitacaoTrab.Close;
DM.qryAuxiliar.Close;

Timer1.Enabled := True;
end;

procedure TFrmTelaCadOrdemServicoGerencia.BtnFamiliaEquipClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    Timer1.Enabled := False;
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodFamilia          := DM.FCodCombo;
        EdtFamiliaEquip.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
    Timer1.Enabled := True;
  end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnFechamentoClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOFECHAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')
  or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA') then
    begin
      if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
        with DM.qryOrdemServico do
          begin
            Close;
            Params[0].AsString := DM.FCodEmpresa;
            Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
            Open;
            Edit;
          end;
      Try
        Timer1.Enabled := False;
        Application.CreateForm(TFrmTelaCadOrdemServicoFechamento, FrmTelaCadOrdemServicoFechamento);
        FrmTelaCadOrdemServicoFechamento.ShowModal;
      Finally
        FreeAndNil(FrmTelaCadOrdemServicoFechamento);
        Timer1.Enabled := True;
      End;
    end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnHistoricoClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
  Try
    Timer1.Enabled := False;
    Application.CreateForm(TFrmTelaCadOrdemServicoHistorico, FrmTelaCadOrdemServicoHistorico);
    FrmTelaCadOrdemServicoHistorico.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoHistorico);
    Timer1.Enabled := True;
  End;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnImpressaoClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnLiberacaoClick(Sender: TObject);
begin
  inherited;
if GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString <> 'EXECUCAO' Then Exit;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOLIBERAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
PopupMenuLiberar.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnManutencaoClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    Timer1.Enabled := False;
    DM.FTabela_auxiliar := 100;
    DM.FNomeConsulta := 'Tipos de Manutenções';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodManutencao     := DM.FCodCombo;
        edtManutencao.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
    Timer1.Enabled := True;
  end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    Timer1.Enabled := False;
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodOficina     := DM.FCodCombo;
        EdtOficina.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
    Timer1.Enabled := True;
  end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnParalisacaoClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOPARALISAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO') or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PARALISADA') then
    begin
      if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
        with DM.qryOrdemServico do
          begin
            Close;
            Params[0].AsString := DM.FCodEmpresa;
            Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
            Open;
            Edit;
          end;
      Try
        Timer1.Enabled := False;
        Application.CreateForm(TFrmTelaCadOrdemServicoParalisacao, FrmTelaCadOrdemServicoParalisacao);
        FrmTelaCadOrdemServicoParalisacao.Caption := 'Paralisações da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.Asfloat);
        FrmTelaCadOrdemServicoParalisacao.ShowModal;
      Finally
        FreeAndNil(FrmTelaCadOrdemServicoParalisacao);
        Timer1.Enabled := True;
      End;
    end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.BtnProgramacaoClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOPROGRAMAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CADASTRADA')
  or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'SOLICITADA') or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DETALHADA')
    or ((GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PROGRAMADA') or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REPROGRAMADA'))
      or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REPROGRAMADA')
        or (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DESPROGRAMADA') then
          begin
            Try
              if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
                with DM.qryOrdemServico do
                  begin
                    Close;
                    Params[0].AsString := DM.FCodEmpresa;
                    Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
                    Open;
                    Edit;
                  end;
              if DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat = 0 then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'MÃO DE OBRA NÃO CADASTRADA!'; Exit;
                end;
              if (DM.qryUsuarioPAcessoCADORDEMSERVICOPROGRAMAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
              Timer1.Enabled := False;
              Application.CreateForm(TFrmTelaCadOrdemServicoMObraProg, FrmTelaCadOrdemServicoMObraProg);
              FrmTelaCadOrdemServicoMObraProg.ShowModal;
            Finally
              FreeAndNil(FrmTelaCadOrdemServicoMObraProg);
              Timer1.Enabled := True;
            End;
          end
      else
        begin
          PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'O.S. JÁ PROCESSADA!'; Exit;
        end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.CBPrioridadeChange(Sender: TObject);
begin
  inherited;
  ConfigurarFiltros;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Checklist1Click(Sender: TObject);
begin
  inherited;
  if DM.qryOrdemServicoGerenciaCODMANUTPROGEQUIP.AsString <> '' then
  begin
    DM.qryChecklistManut.Close;
    DM.qryChecklistManut.Params[0].AsString := DM.qryOrdemServicoGerenciaCODIGO.AsString;
    DM.qryChecklistManut.Open;
    if DM.qryChecklistManut.IsEmpty = False then
    begin
      DmRelatorios.frxRChecklistManutProgEquip.ShowReport();
    end;
  end;
  if DM.qryOrdemServicoGerenciaCODLUBRIFICPROGEQUIP.AsString <> '' then
  begin
    DM.qryChecklistLubrific.Close;
    DM.qryChecklistLubrific.Params[0].AsString := DM.qryOrdemServicoGerenciaCODIGO.AsString;
    DM.qryChecklistLubrific.Open;

    if DM.qryChecklistLubrific.IsEmpty = False then
    begin
      DmRelatorios.frxRChecklistLubrificProgEquip.ShowReport();
    end;
//    DM.qryLubrificProgEquip.Close;
//    DM.qryLubrificProgEquip.Params[0].AsString := DM.qryOrdemServicoGerenciaCODLUBRIFICPROGEQUIP.AsString;
//    DM.qryLubrificProgEquip.Params[1].AsString := DM.FCodEmpresa;
//    DM.qryLubrificProgEquip.Params[2].AsString := DM.qryOrdemServicoGerenciaCODEQUIPAMENTO.AsString;
//    DM.qryLubrificProgEquip.Open;
//    if DM.qryLubrificProgEquip.IsEmpty = False then
//    begin
//      DM.FCodOrdemServico := DM.qryOrdemServicoGerenciaCODIGO.AsInteger;
//      DmRelatorios.frxRLubrificProgEquipIndividual.ShowReport();
//    end;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.chkNProgClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
ConfigurarFiltros;
end;
procedure TFrmTelaCadOrdemServicoGerencia.btnMObraClick(Sender: TObject);
begin
  inherited;
  Try
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Timer1.Enabled := False;
    Application.CreateForm(TFrmTelaCadOrdemServicoLocalizaMObra, FrmTelaCadOrdemServicoLocalizaMObra);
    FrmTelaCadOrdemServicoLocalizaMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoLocalizaMObra);
    Timer1.Enabled := True;
  End;
end;
procedure TFrmTelaCadOrdemServicoGerencia.Completa1Click(Sender: TObject);
begin
  inherited;
  Dm.FDMTOrdemServicoGerenciaRelat.Close;
  Dm.FDMTOrdemServicoGerenciaRelat.CopyFields(DM.qryOrdemServicoGerencia);
  Dm.FDMTOrdemServicoGerenciaRelat.CopyDataSet(DM.qryOrdemServicoGerencia, [coStructure, coRestart, coAppend, coCalcFields]);

  DmRelatorios.frxROrdemServicoGeralCompleta.ShowReport();

  DM.qryOrdemServicoGerenciaRelatMObraProg.Close;
  DM.qryOrdemServicoGerenciaRelatMObraUtil.Close;
  DM.qryOrdemServicoGerenciaRelatManut.Close;
  DM.qryOrdemServicoGerenciaRelatLubrific.Close;
end;
procedure TFrmTelaCadOrdemServicoGerencia.ConfigurarFiltros;
begin
  GrdOrdemServico.DataSource.DataSet.Filtered := False;
  GrdOrdemServico.DataSource.DataSet.Filter := EmptyStr;
  DM.qryOrdemServicoGerencia.IndexDefs.Clear;

  LNProg := ''; LDet := ''; LProg := ''; LExec := '';  LLib := ''; LFec := ''; LPar := ''; LSolic := ''; LRot := ''; LCanc := ''; LVenc := ''; LParado := '';

  if (chkNProg.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LDet := ' (SITUACAO = ''CADASTRADA'') OR (SITUACAO = ''DESPROGRAMADA'')'
    else
      LDet := ' OR (SITUACAO = ''CADASTRADA'') OR (SITUACAO = ''DESPROGRAMADA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LDet;

  if (chkDetalhad.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LNProg := ' (SITUACAO = ''DETALHADA'')'
    else
      LNProg := ' OR (SITUACAO = ''DETALHADA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LNProg;

  if (chkProg.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LProg  := ' (SITUACAO = ''PROGRAMADA'') or (SITUACAO = ''REPROGRAMADA'')'
    else
      LProg  := ' OR (SITUACAO = ''PROGRAMADA'') or (SITUACAO = ''REPROGRAMADA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LProg;

  if (chkExec.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LExec  := ' (SITUACAO = ''EXECUCAO'')'
    else
      LExec  := ' OR (SITUACAO = ''EXECUCAO'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LExec;

  if (chkLib.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LLib   := ' (SITUACAO = ''LIBERADA'')'
    else
      LLib   := ' OR (SITUACAO = ''LIBERADA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LLib;

  if (chkFec.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LFec   := ' (SITUACAO = ''FECHADA'')'
    else
      LFec   := ' OR (SITUACAO = ''FECHADA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LFec;

  if (chkPar.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LPar   := ' (SITUACAO = ''PARALISADA'')'
    else
      LPar   := ' OR (SITUACAO = ''PARALISADA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LPar;

  if (chkSolic.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      begin
        LSolic := ' (SOLICTRAB = ''S'')';
        if GrdOrdemServico.DataSource.DataSet.Filter <> '' then
          GrdOrdemServico.DataSource.DataSet.Filter := '(' + GrdOrdemServico.DataSource.DataSet.Filter + ')';
      end
    else
      begin
        LSolic := ' OR (SOLICTRAB = ''S'')';
        if GrdOrdemServico.DataSource.DataSet.Filter <> '' then
          GrdOrdemServico.DataSource.DataSet.Filter := '(' + GrdOrdemServico.DataSource.DataSet.Filter + ')';
      end;
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LSolic;

  if (chkRot.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      begin
        LRot   := ' (ROTAEQUIP = ''S'')';
        if GrdOrdemServico.DataSource.DataSet.Filter <> '' then
          GrdOrdemServico.DataSource.DataSet.Filter := '(' + GrdOrdemServico.DataSource.DataSet.Filter + ')';
      end
    else
      begin
        LRot   := ' OR (ROTAEQUIP = ''S'')';
        if GrdOrdemServico.DataSource.DataSet.Filter <> '' then
          GrdOrdemServico.DataSource.DataSet.Filter := '(' + GrdOrdemServico.DataSource.DataSet.Filter + ')';
      end;
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LRot ;


  if (chbCanc.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LCanc   := ' (SITUACAO = ''CANCELADA'')'
    else
      LCanc   := ' OR (SITUACAO = ''CANCELADA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LCanc;

  if (chbVenc.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LVenc   := ' (SITUACAO = ''VENCIDA'')'
    else
      LVenc   := ' OR (SITUACAO = ''VENCIDA'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LVenc;

  if (chkParado.Checked = True) then
    if GrdOrdemServico.DataSource.DataSet.Filter = '' then
      LParado   := ' (EQUIPPARADO = ''S'')'
    else
      LParado   := ' AND (EQUIPPARADO = ''S'')';
  GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + LParado;


  if GrdOrdemServico.DataSource.DataSet.Filter <> '' then
    GrdOrdemServico.DataSource.DataSet.Filter := '(' + GrdOrdemServico.DataSource.DataSet.Filter + ')';

  if EdtFamiliaEquip.Text <> '' then
    begin
      if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
        GrdOrdemServico.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = ' + QuotedStr(LCodFamilia)
      else
        GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
    end;

  if edtOficina.Text <> '' then
    begin
      if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
        GrdOrdemServico.DataSource.DataSet.Filter := 'CODOFICINA = ' + QuotedStr(LCodOficina)
      else
        GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND CODOFICINA = '+QuotedStr(LCodOficina);
    end;

    if edtManutencao.Text <> ''  then
    begin
      if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
        GrdOrdemServico.DataSource.DataSet.Filter := 'CODMANUTENCAO = ' + QuotedStr(LCodManutencao)
      else
        GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND CODMANUTENCAO = ' + QuotedStr(LCodManutencao);
    end;

  case CBPrioridade.ItemIndex of
    1:
      begin
        if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
          GrdOrdemServico.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Emergência'''
        else
          GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Emergência''';
      end;
    2:
      begin
        if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
          GrdOrdemServico.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 12 hs'''
        else
          GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 12 hs''';
      end;
    3:
      begin
        if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
          GrdOrdemServico.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 72 hs'''
        else
          GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 72 hs''';
      end;
    4:
      begin
        if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
          GrdOrdemServico.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 1 Semana'''
        else
          GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 1 Semana''';
      end;
    5:
      begin
        if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
          GrdOrdemServico.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 1 Mês'''
        else
          GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 1 Mês''';
      end;
    6:
      begin
        if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
          GrdOrdemServico.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Acima de um mês'''
        else
          GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Acima de um mês''';
      end;
  end;

  if LEquipamento <> EmptyStr then
    begin
      if GrdOrdemServico.DataSource.DataSet.Filter = EmptyStr then
        GrdOrdemServico.DataSource.DataSet.Filter := 'CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0])
      else
        GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0]);
    end;

  if GrdOrdemServico.DataSource.DataSet.Filter <> EmptyStr then
    GrdOrdemServico.DataSource.DataSet.Filtered := True;

  DM.qryOrdemServicoGerencia.First;
end;
procedure TFrmTelaCadOrdemServicoGerencia.edtManutencaoDblClick(Sender: TObject);
begin
  inherited;
  LCodManutencao := '';
  edtManutencao.Text := '';
  ConfigurarFiltros;
end;
procedure TFrmTelaCadOrdemServicoGerencia.EdtFamiliaEquipDblClick(Sender: TObject);
begin
  inherited;
  LCodFamilia := '';
  EdtFamiliaEquip.Text := '';
  ConfigurarFiltros;
end;
procedure TFrmTelaCadOrdemServicoGerencia.EdtOficinaDblClick(Sender: TObject);
begin
  inherited;
  LCodOficina := '';
  EdtOficina.Text := '';
  ConfigurarFiltros;
end;

procedure TFrmTelaCadOrdemServicoGerencia.LimpaGrid(Grid: TStringGrid);
var lin, col: integer;
begin
     for lin := 1 to Grid.RowCount - 1 do
       for col := 0 to Grid.ColCount - 1 do
         Grid.Cells[col, lin] := '';
end;

procedure TFrmTelaCadOrdemServicoGerencia.CopyDataSetToGrid(Query: TFDMemTable; StringGrid: TStringGrid);
var
  I, J: Integer;
begin
  // Limpe o TStringGrid, se necessário
  LimpaGrid(StringGrid);

  // Defina o número de colunas do TStringGrid
  StringGrid.ColCount := Query.FieldCount;
  StringGrid.RowCount := Query.RecordCount + 1;

  // Preencha os cabeçalhos das colunas com os nomes dos campos do ClientDataSet
  for I := 0 to Query.FieldCount - 1 do
  begin
    if Query.Fields[I].Visible = True then
      StringGrid.Cells[I, 0] := Query.Fields[I].DisplayLabel;
  end;

  // Preencha as células do TStringGrid com os valores da Query
  Query.First;
  J := 1; // Comece a partir da segunda linha
  while not Query.Eof do
  begin
    for I := 0 to Query.FieldCount - 1 do
    begin
      if Query.Fields[I].Visible = True then
        StringGrid.Cells[I, J] := Query.Fields[I].AsString;
    end;

    Query.Next;
    Inc(J);
  end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Exportar1Click(Sender: TObject);
var
  caminho: string;
begin
  inherited;
  caminho := 'C:\SPMP3\Planilhas';

  // Verifica se a pasta existe
  if not TDirectory.Exists(caminho) then
  begin
    // Cria a pasta se não existir
    try
      TDirectory.CreateDirectory(caminho);
    except
      on E: Exception do
        ShowMessage('Erro ao criar a pasta: C:\SPMP3\Planilhas' + E.Message);
    end;
  end
  else
    begin;
      FDMemTOSSimplesExcel.Close;
      FDMemTOSSimplesExcel.CopyDataSet(DM.qryOrdemServicoGerencia, [coStructure, coRestart, coAppend, coCalcFields]);
      FDMemTOSSimplesExcel.FieldByName('CODIGO').DisplayLabel           := 'O.S';
      FDMemTOSSimplesExcel.FieldByName('CODIGO').Index                  := 0;
      FDMemTOSSimplesExcel.FieldByName('DESCRICAO').DisplayLabel        := 'Serviço';
      FDMemTOSSimplesExcel.FieldByName('DESCRICAO').Index               := 1;
      FDMemTOSSimplesExcel.FieldByName('DATACADASTRO').DisplayLabel     := 'Cad.';
      FDMemTOSSimplesExcel.FieldByName('DATACADASTRO').Index            := 2;
      FDMemTOSSimplesExcel.FieldByName('PLANEJADA').Visible               := True;
      FDMemTOSSimplesExcel.FieldByName('PLANEJADA').DisplayLabel        := 'Plan.';
      FDMemTOSSimplesExcel.FieldByName('PLANEJADA').Index               := 3;
      FDMemTOSSimplesExcel.FieldByName('DATAPROGINI').DisplayLabel      := 'Prog.';
      FDMemTOSSimplesExcel.FieldByName('DATAPROGINI').Index             := 4;
      FDMemTOSSimplesExcel.FieldByName('DATAINICIOREAL').DisplayLabel   := 'Início';
      FDMemTOSSimplesExcel.FieldByName('DATAINICIOREAL').Index          := 5;
      FDMemTOSSimplesExcel.FieldByName('DATAFIMREAL').DisplayLabel      := 'Fim';
      FDMemTOSSimplesExcel.FieldByName('DATAFIMREAL').Index             := 6;
      FDMemTOSSimplesExcel.FieldByName('DATAFECHAMENTO').DisplayLabel   := 'Fecham.';
      FDMemTOSSimplesExcel.FieldByName('DATAFECHAMENTO').Index          := 7;
      FDMemTOSSimplesExcel.FieldByName('CODEQUIPAMENTO').DisplayLabel   := 'Equipam.';
      FDMemTOSSimplesExcel.FieldByName('CODEQUIPAMENTO').Index          := 8;
      FDMemTOSSimplesExcel.FieldByName('CENTROCUSTO').Visible           := True;
      FDMemTOSSimplesExcel.FieldByName('CENTROCUSTO').DisplayLabel      := 'Centro/Custo';
      FDMemTOSSimplesExcel.FieldByName('CENTROCUSTO').Index             := 9;
      FDMemTOSSimplesExcel.FieldByName('TEMPOPREVISTO').DisplayLabel    := 'Prev. (hs)';
      FDMemTOSSimplesExcel.FieldByName('TEMPOPREVISTO').Index           := 10;
      FDMemTOSSimplesExcel.FieldByName('TEMPOEXECUTADO').Visible           := True;
      FDMemTOSSimplesExcel.FieldByName('TEMPOEXECUTADO').DisplayLabel   := 'Exec. (hs)';
      FDMemTOSSimplesExcel.FieldByName('TEMPOEXECUTADO').Index          := 11;
      FDMemTOSSimplesExcel.FieldByName('SITUACAO').DisplayLabel         := 'Situação';
      FDMemTOSSimplesExcel.FieldByName('SITUACAO').Index                := 12;
      FDMemTOSSimplesExcel.FieldByName('TIPOMANUTENCAO').DisplayLabel   := 'Tipo';
      FDMemTOSSimplesExcel.FieldByName('TIPOMANUTENCAO').Index          := 13;
      FDMemTOSSimplesExcel.FieldByName('OFICINA').Visible               := True;
      FDMemTOSSimplesExcel.FieldByName('OFICINA').DisplayLabel          := 'Oficina';
      FDMemTOSSimplesExcel.FieldByName('OFICINA').Index                 := 14;
      FDMemTOSSimplesExcel.FieldByName('PRIORIDADEPARADA').Visible           := True;
      FDMemTOSSimplesExcel.FieldByName('PRIORIDADEPARADA').DisplayLabel := 'Prioridade';
      FDMemTOSSimplesExcel.FieldByName('PRIORIDADEPARADA').Index        := 15;
      FDMemTOSSimplesExcel.FieldByName('ORIGEM').Visible                := True;
      FDMemTOSSimplesExcel.FieldByName('ORIGEM').DisplayLabel           := 'O';
      FDMemTOSSimplesExcel.FieldByName('ORIGEM').Index                  := 16;

      FDMemTOSSimplesExcel.FieldByName('Equipamento').Visible           := False;
      FDMemTOSSimplesExcel.FieldByName('CODMANUTENCAO').Visible         := False;
      FDMemTOSSimplesExcel.FieldByName('ROTAEQUIP').Visible             := False;
      FDMemTOSSimplesExcel.FieldByName('MATRICULA').Visible             := False;
      FDMemTOSSimplesExcel.FieldByName('DESCINSPECAO').Visible          := False;
      FDMemTOSSimplesExcel.FieldByName('FREQUENCIA').Visible            := False;
      FDMemTOSSimplesExcel.FieldByName('REPROGRAMAR').Visible           := False;
      FDMemTOSSimplesExcel.FieldByName('SOLICTRAB').Visible             := False;
      FDMemTOSSimplesExcel.FieldByName('IMPORTANCIA').Visible           := False;

      CopyDataSetToGrid(FDMemTOSSimplesExcel, grid);
      caminho := caminho+'\Lista Simples das Ordens de Serviços.'+FormatDateTime('dd.mm.yyyy.hh.sss', now) + '.csv';
      grid.SaveToCSV(caminho);

      Application.MessageBox(PChar( 'Exportação do arquivo "' + caminho + '" concluída com sucesso!'), 'SPMP3', MB_OK + MB_ICONINFORMATION);
//      PAuxiliares.Caption := 'Exportação concluída!';
//      Sleep(3);
      PAuxiliares.Caption := '';
    end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
//DM.qryOrdemServicoGerencia.IndexDefs.Clear;
//DM.qryOrdemServicoGerencia.FetchOnDemand := False;
DM.qryOrdemServicoServSolic.Close;
DM.qryOrdemServicoServExec.Close;
DM.qryOrdemServicoEquipe.Close;
DM.qryOrdemServicoEquipePecas.Close;
DM.qryOrdemServicoEquipePlanoTrab.Close;
DM.qryOrdemServicoEquipePecasUtil.Close;
DM.qryOrdemServico.Close;
DM.qryOrdemServicoGerencia.Close;
DM.qryAuxiliar.Close;
GrdOrdemServico.DataSource.DataSet.Filtered := False;
GrdOrdemServico.DataSource.DataSet.Filter := EmptyStr;
Close;
end;
procedure TFrmTelaCadOrdemServicoGerencia.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryOrdemServico;
DM.FDataSourceParam := DM.dsOrdemServico;
DM.FTela := 'CADORDEMSERVICO';
EdtData1.Date := IncMonth(DateOf(DM.FDataHoraServidor), -1);
EdtData2.Date := DateOf(DM.FDataHoraServidor);
hora_futura := IncMinute(Now, DM.FTempoNovaOS);
end;
procedure TFrmTelaCadOrdemServicoGerencia.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//F5
if Key = 116 then
  begin
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
      begin
        DM.MSGAguarde();
        DM.qryOrdemServicoGerencia.Close;
        DM.qryOrdemServicoGerencia.Params[0].AsString := DM.FCodEmpresa;
        DM.qryOrdemServicoGerencia.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
        DM.qryOrdemServicoGerencia.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
        DM.qryOrdemServicoGerencia.Open;
        ConfigurarFiltros;
        DM.MSGAguarde('', False);
      end
    else
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  end;
 if (Shift = [ssCtrl, ssAlt]) then
  begin
    if (key = 79) then BtnCadastro.OnClick(Sender);
    if (key = 80) then BtnProgramacao.OnClick(Sender);
    if (key = 69) then BtnExecucao.OnClick(Sender);
    if (key = 76) then BtnLiberacao.OnClick(Sender);
    if (key = 70) then BtnFechamento.OnClick(Sender);
    if (key = 82) then BtnParalisacao.OnClick(Sender);
    if (key = 73) then BtnImpressao.OnClick(Sender);
    if (key = 67) then BtnCancelamento.OnClick(Sender);
    if (key = 77) then btnMObra.OnClick(Sender);
    if (key = 72) then BtnHistorico.OnClick(Sender);
  end;

  inherited;
end;
procedure TFrmTelaCadOrdemServicoGerencia.FormShow(Sender: TObject);
begin
  inherited;
  if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
    begin
      DM.qryOrdemServicoGerencia.Close;
      DM.qryOrdemServicoGerencia.Params[0].AsString := DM.FCodEmpresa;
      DM.qryOrdemServicoGerencia.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
      DM.qryOrdemServicoGerencia.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
      DM.qryOrdemServicoGerencia.Open;
      ConfigurarFiltros;
    end
  else
    begin
      Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.GrdOrdemServicoDblClick(
  Sender: TObject);
begin
  inherited;
  with DM.qryOrdemServico do
    begin
      Close;
      Params[0].AsString := DM.FCodEmpresa;
      Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
      Open;
      Edit;
    end;
  BtnCadastro.OnClick(Sender);
end;
procedure TFrmTelaCadOrdemServicoGerencia.GrdOrdemServicoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdOrdemServico.Columns[0].Title.Font.Size := 9; GrdOrdemServico.Columns[1].Title.Font.Size := 9; GrdOrdemServico.Columns[2].Title.Font.Size := 9;
GrdOrdemServico.Columns[3].Title.Font.Size := 9; GrdOrdemServico.Columns[4].Title.Font.Size := 9; GrdOrdemServico.Columns[5].Title.Font.Size := 9;
GrdOrdemServico.Columns[6].Title.Font.Size := 9; GrdOrdemServico.Columns[7].Title.Font.Size := 9; GrdOrdemServico.Columns[8].Title.Font.Size := 9;
GrdOrdemServico.Columns[9].Title.Font.Size := 9; GrdOrdemServico.Columns[10].Title.Font.Size := 9; GrdOrdemServico.Columns[11].Title.Font.Size := 9;
GrdOrdemServico.Columns[12].Title.Font.Size := 9; GrdOrdemServico.Columns[13].Title.Font.Size := 9; GrdOrdemServico.Columns[14].Title.Font.Size := 9;
GrdOrdemServico.Columns[15].Title.Font.Size := 9; GrdOrdemServico.Columns[16].Title.Font.Size := 9; GrdOrdemServico.Columns[0].Title.Font.Style := [fsbold];
GrdOrdemServico.Columns[0].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaCODIGO.DisplayLabel         := 'Código';
DM.qryOrdemServicoGerenciaCODIGO.DisplayWidth         := 8;
DM.qryOrdemServicoGerenciaCODIGO.Alignment            := taCenter;
GrdOrdemServico.Columns[1].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaCODEQUIPAMENTO.DisplayLabel := 'Cód. Equip.';
DM.qryOrdemServicoGerenciaCODEQUIPAMENTO.DisplayWidth := 15;
DM.qryOrdemServicoGerenciaCODEQUIPAMENTO.Alignment    := taCenter;
GrdOrdemServico.Columns[2].Title.Font.Style           := [fsbold];
GrdOrdemServico.Columns[2].Title.Alignment            := taLeftJustify;
DM.qryOrdemServicoGerenciaEQUIPAMENTO.DisplayLabel    := 'Equipamento';
DM.qryOrdemServicoGerenciaEQUIPAMENTO.DisplayWidth    := 45;
GrdOrdemServico.Columns[3].Title.Font.Style           := [fsbold];
GrdOrdemServico.Columns[3].Title.Alignment            := taLeftJustify;
DM.qryOrdemServicoGerenciaDESCRICAO.DisplayLabel      := 'Descrição';
DM.qryOrdemServicoGerenciaDESCRICAO.DisplayWidth      := 35;
GrdOrdemServico.Columns[4].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaDATACADASTRO.DisplayLabel   := 'Cadastro';
DM.qryOrdemServicoGerenciaDATACADASTRO.DisplayWidth   := 16;
DM.qryOrdemServicoGerenciaDATACADASTRO.Alignment      := taCenter;
GrdOrdemServico.Columns[5].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaSITUACAO.DisplayLabel       := 'Situação';
DM.qryOrdemServicoGerenciaSITUACAO.DisplayWidth       := 15;
DM.qryOrdemServicoGerenciaSITUACAO.Alignment          := taCenter;
GrdOrdemServico.Columns[6].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaDATAPROGINI.DisplayLabel    := 'Programada';
DM.qryOrdemServicoGerenciaDATAPROGINI.DisplayWidth    := 18;
DM.qryOrdemServicoGerenciaDATAPROGINI.Alignment       := taCenter;
GrdOrdemServico.Columns[7].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaDATAINICIOREAL.DisplayLabel := 'Início';
DM.qryOrdemServicoGerenciaDATAINICIOREAL.DisplayWidth := 18;
DM.qryOrdemServicoGerenciaDATAINICIOREAL.Alignment    := taCenter;
GrdOrdemServico.Columns[8].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaDATAFIMREAL.DisplayLabel    := 'Fim';
DM.qryOrdemServicoGerenciaDATAFIMREAL.DisplayWidth    := 18;
DM.qryOrdemServicoGerenciaDATAFIMREAL.Alignment       := taCenter;
GrdOrdemServico.Columns[9].Title.Alignment            := taCenter;
DM.qryOrdemServicoGerenciaDATAFECHAMENTO.DisplayLabel := 'Fechada';
DM.qryOrdemServicoGerenciaDATAFECHAMENTO.DisplayWidth := 14;
DM.qryOrdemServicoGerenciaDATAFECHAMENTO.Alignment    := taCenter;
GrdOrdemServico.Columns[10].Visible := False; GrdOrdemServico.Columns[11].Visible := False; GrdOrdemServico.Columns[12].Visible := False;
GrdOrdemServico.Columns[13].Visible := False; GrdOrdemServico.Columns[14].Visible := False; GrdOrdemServico.Columns[15].Visible := False;
GrdOrdemServico.Columns[16].Visible := False;
if (Column.Field.FieldName = 'SITUACAO') then
  begin
    GrdOrdemServico.Canvas.Font.Style := [fsBold];
    GrdOrdemServico.Canvas.Font.Name := 'Calibri';
    if GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'SOLICITADA' then
      begin
        if GrdOrdemServico.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> '' then
          begin GrdOrdemServico.Canvas.Brush.Color := clWhite; GrdOrdemServico.Canvas.Font.Color:= clBlack; end
        else
          begin GrdOrdemServico.Canvas.Brush.Color := $00F3F3F3; GrdOrdemServico.Canvas.Font.Color := clBlack end;
      end;
    if GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA' then
      begin
         GrdOrdemServico.Canvas.Brush.Color := clGray; GrdOrdemServico.Canvas.Font.Color:= clBlack;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CADASTRADA') then
      begin
        if GrdOrdemServico.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> '' then
          begin GrdOrdemServico.Canvas.Brush.Color := clYellow; GrdOrdemServico.Canvas.Font.Color := clRed end
        else
          begin GrdOrdemServico.Canvas.Brush.Color := $00BBFFFF; GrdOrdemServico.Canvas.Font.Color := clRed end;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DETALHADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clYellow; GrdOrdemServico.Canvas.Font.Color := clGreen;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PROGRAMADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clBlue; GrdOrdemServico.Canvas.Font.Color := clWhite;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REPROGRAMADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clBlue; GrdOrdemServico.Canvas.Font.Color := clYellow;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DESPROGRAMADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clYellow; GrdOrdemServico.Canvas.Font.Color := clBlue;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REALIZADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clBlack; GrdOrdemServico.Canvas.Font.Color := clYellow;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clInfoBk; GrdOrdemServico.Canvas.Font.Color := clGreen;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clGreen; GrdOrdemServico.Canvas.Font.Color := clWhite;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clGray; GrdOrdemServico.Canvas.Font.Color := clBlack;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PARALISADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clRed; GrdOrdemServico.Canvas.Font.Color  := clYellow;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CANCELADA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clBlack; GrdOrdemServico.Canvas.Font.Color  := $00FF8000;
      end;
    if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'VENCIDA')then
      begin
        GrdOrdemServico.Canvas.Brush.Color := clRed; GrdOrdemServico.Canvas.Font.Color := clWhite;
      end;
  end;
  if not odd(GrdOrdemServico.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'SITUACAO') then
        if not (gdSelected in State) then
          begin
            GrdOrdemServico.Canvas.Brush.Color := $00F7F8F9;
//            GrdOrdemServico.Canvas.FillRect(Rect);
//            GrdOrdemServico.DefaultDrawDataCell(rect,Column.Field,state);
        end;
//  if (GrdOrdemServico.DataSource.DataSet.FieldByName('SOLICTRAB').AsString = 'S') and (Column.Field.FieldName <> 'SITUACAO') then
//    begin
//      GrdOrdemServico.Canvas.Brush.Color := $00DDDDDD;
//    end;
  GrdOrdemServico.Canvas.FillRect(Rect);
  GrdOrdemServico.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
procedure TFrmTelaCadOrdemServicoGerencia.GrdOrdemServicoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;
procedure TFrmTelaCadOrdemServicoGerencia.GrdOrdemServicoKeyPress(
  Sender: TObject; var Key: Char);
var
LCampo : String;
begin
  inherited;
if (Key = #13) and (GrdOrdemServico.SelectedIndex = 0) then
  begin
    LCampo :=DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
//        DM.qryOrdemServicoGerencia.FetchOnDemand := True;
        if GrdOrdemServico.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
          Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
//        DM.qryOrdemServicoGerencia.FetchOnDemand := False;
      end;
  end;
if (Key = #13) and (GrdOrdemServico.SelectedIndex = 3) then
  begin
    LCampo :=DM.CampoInputBox('SPMP3', 'Informe a descrição da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
        ConfigurarFiltros;
        if GrdOrdemServico.DataSource.DataSet.Filter = '' then
          GrdOrdemServico.DataSource.DataSet.Filter := 'DESCRICAO LIKE ' + QuotedStr('%' + LCampo + '%')
        else
          begin
            GrdOrdemServico.DataSource.DataSet.Filter := GrdOrdemServico.DataSource.DataSet.Filter + ' AND DESCRICAO LIKE ' + QuotedStr('%' + LCampo + '%');
          end;
        GrdOrdemServico.DataSource.DataSet.Filtered := True;
      end
    else
      ConfigurarFiltros;
  end;
if (Key = #13) and (GrdOrdemServico.SelectedIndex = 2) then
  begin
    LEquipamento := EmptyStr;
    DM.FTabela_auxiliar := 250;
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.FParamAuxiliar[0] := DM.FCodCombo;
      LEquipamento         := DM.FValorCombo;
      FreeAndNil(FrmTelaAuxiliar);
      ConfigurarFiltros;
    End;
  end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.Inspecoes1Click(Sender: TObject);
begin
  inherited;
  DM.qryOrdemServicoGerenciaRelatManut.Close;
  DM.qryOrdemServicoGerenciaRelatManut.Params[0].AsString := DM.FCodEmpresa;
  DM.qryOrdemServicoGerenciaRelatManut.Open;
  if DM.qryOrdemServicoGerencia.Filtered = True then
    begin
      DM.qryOrdemServicoGerenciaRelatManut.Filter := DM.qryOrdemServicoGerencia.Filter;
      DM.qryOrdemServicoGerenciaRelatManut.Filtered := True;
    end;
  DM.qryOrdemServicoGerenciaRelatLubrific.Close;
  DM.qryOrdemServicoGerenciaRelatLubrific.Params[0].AsString := DM.FCodEmpresa;
  DM.qryOrdemServicoGerenciaRelatLubrific.Open;
  if DM.qryOrdemServicoGerencia.Filtered = True then
    begin
      DM.qryOrdemServicoGerenciaRelatLubrific.Filter := DM.qryOrdemServicoGerencia.Filter;
      DM.qryOrdemServicoGerenciaRelatLubrific.Filtered := True;
    end;
  DmRelatorios.frxROrdemServicoInsp.ShowReport();
  DM.qryOrdemServicoGerenciaRelatManut.Filtered := False;
  DM.qryOrdemServicoGerenciaRelatLubrific.Filtered := False;
  DM.qryOrdemServicoGerenciaRelatManut.Close;
  DM.qryOrdemServicoGerenciaRelatLubrific.Close;
end;
procedure TFrmTelaCadOrdemServicoGerencia.Ficha1Click(Sender: TObject);
begin
  inherited;
if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
  with DM.qryOrdemServico do
    begin
      Close;
      Params[0].AsString := DM.FCodEmpresa;
      Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
      Open;
      Edit;
    end;
if DM.qryOrdemServicoOFICINA.AsString = EmptyStr then
  DM.qryOrdemServicoOFICINA.AsString := 'Local';
DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoServSolic.Open;
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
DmRelatorios.frxROrdemServico.ShowReport();   //masio-temp
//DmRelatorios.frxReport2.ShowReport();
//
DM.qryOrdemServicoEquipe.Close;
DM.qryOrdemServicoServSolic.Close;
DM.qryOrdemServicoEquipeMObra.Close;
DM.qryOrdemServicoEquipeRecursosUtil.Close;
DM.qryOrdemServicoEquipePecasUtil.Close;
DM.qryOrdemServicoEquipePlanoTrab.Close;
//DM.qryOrdemServicoEquipeImagens.Close;
end;
procedure TFrmTelaCadOrdemServicoGerencia.ParcialClick(Sender: TObject);
begin
  inherited;
  Try
  if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
    with DM.qryOrdemServico do
      begin
        Close;
        Params[0].AsString := DM.FCodEmpresa;
        Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
        Open;
        Edit;
      end;
    Timer1.Enabled := False;
    Application.CreateForm(TFrmTelaCadOrdemServicoMObraExec, FrmTelaCadOrdemServicoMObraExec);
    FrmTelaCadOrdemServicoMObraExec.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoMObraExec);
    Timer1.Enabled := True;
  End;
end;
procedure TFrmTelaCadOrdemServicoGerencia.RGConsSimplesClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
ConfigurarFiltros;
end;
procedure TFrmTelaCadOrdemServicoGerencia.Simples1Click(Sender: TObject);
begin
  inherited;
  Dm.FDMTOrdemServicoGerenciaRelat.Close;
  Dm.FDMTOrdemServicoGerenciaRelat.CopyFields(DM.qryOrdemServicoGerencia);
  Dm.FDMTOrdemServicoGerenciaRelat.CopyDataSet(DM.qryOrdemServicoGerencia, [coStructure, coRestart, coAppend, coCalcFields]);
  DmRelatorios.frxROrdemServicoGeral.ShowReport();
end;
procedure TFrmTelaCadOrdemServicoGerencia.Timer1Timer(Sender: TObject);
var
  hora_atual, diferenca: TDateTime;
  df_hr: TTime;
  dt_ini, dt_final: TDate;
//  codos: Integer;
begin
  inherited;
  TThread.CreateAnonymousThread(
                                procedure
                                begin
                                  hora_atual := Now;
                                  if (hora_atual < hora_futura) then
                                      begin
                                          dt_ini := DateOf(hora_atual);
                                          dt_final := DateOf(hora_futura);
                                          diferenca := hora_futura - hora_atual;
                                          df_hr := TimeOf(diferenca);
                                          label2.Caption := 'Atualiza em ' +FormatDateTime('nn:ss', diferenca);
                                          Application.Title := Label1.Caption;
                                          Application.ProcessMessages;
                                      end
                                  else
                                    begin
                                      TThread.Synchronize(TThread.CurrentThread,
                                              procedure
                                              begin
                                                 if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
                                                   begin
                                                     DM.MSGAguarde();
                                                     Try
                                                       if not (DM.qryOrdemServicoGerencia.State in [dsBrowse]) then
                                                         DM.qryOrdemServicoGerencia.Cancel;
                                                       DM.qryOrdemServicoGerencia.Refresh;
                                                       hora_futura := IncMinute(Now, DM.FTempoNovaOS);
                                                     Except
                                                       DM.MSGAguarde('', False);
                                                       Abort;
                                                     End;
                                                     Application.ProcessMessages;
                                                     DM.MSGAguarde('', False);
                                                  end;
                                              end);
                                    end;
                                end
                               ).Start;
end;
procedure TFrmTelaCadOrdemServicoGerencia.TotalClick(Sender: TObject);
begin
  inherited;
if (GrdOrdemServico.DataSource.DataSet.FieldByName('SITUACAO').AsString <> 'EXECUCAO') then Exit;

if (Application.MessageBox('Deseja realmente liberar toda a mão de obra e os recursos da OS?','SPMP', MB_YESNO + MB_ICONQUESTION))= IDYes then
  begin
    Timer1.Enabled := False;
    DM.MSGAguarde('');
    DM.qryDataHoraServidor.Refresh;
    DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;
    if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
      with DM.qryOrdemServico do
        begin
          Close;
          Params[0].AsString := DM.FCodEmpresa;
          Params[1].AsString := GrdOrdemServico.DataSource.DataSet.FieldByName('CODIGO').AsString;
          Open;
          Edit;
        end;
    DM.qryOrdemServicoEquipe.Open;
    DM.qryOrdemServicoEquipeMObra.Open;
    DM.qryOrdemServicoServSolic.Close;
    DM.qryOrdemServicoServSolic.Params[0].AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
    DM.qryOrdemServicoServSolic.Open;
    DM.qryOrdemServicoServExec.Close;
    DM.qryOrdemServicoServExec.Params[0].AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
    DM.qryOrdemServicoServExec.Open;
    DM.qryOrdemServicoEquipeMObraUtil.Open;
    DM.qryOrdemServicoEquipeMObraMovim.Open;
    DM.qryOrdemServicoMObraDisp.Close;
    DM.qryOrdemServicoMObraDisp.Params[0].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
    DM.qryOrdemServicoMObraDisp.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
    DM.qryOrdemServicoMObraDisp.Params[2].AsString := DM.FCodEmpresa;
    if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
      DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'AUTÔNOMA'
    else
      DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'OPERACIONAL';
    DM.qryOrdemServicoMObraDisp.Open;
    DM.qryTotalHomemHora.Close;
    DM.qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
    DM.qryTotalHomemHora.Open;
    DM.qryTotalHomemHoraSeqHora.Open;
    LiberarMaodeObraEmExecucao;
    DM.qryOrdemServico.Edit;
    DM.qryOrdemServicoDATAFIM.AsDateTime     := DM.FDataHoraServidor;
    DM.qryOrdemServicoDATAFIMREAL.AsDateTime := DM.FDataHoraServidor;
    DM.qryOrdemServicoTEMPOEXECUTADO.AsFloat := (MinutesBetween(DM.qryOrdemServicoDATAINICIOREAL.AsDateTime, DM.qryOrdemServicoDATAFIMREAL.AsDateTime)) DIV 60;
    DM.qryOrdemServicoSITUACAO.AsString      := 'LIBERADA';
    DM.qryOrdemServicoDATAFIMREAL.AsDateTime := DM.FDataHoraServidor;
    DM.qryOrdemServico.Post;
    DM.qryOrdemServicoGerencia.Edit;
    DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'LIBERADA';
    DM.qryOrdemServicoGerencia.Post;
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
            DM.qrySolicitacaoTrabSITUACAO.AsString := 'LIBERADA';
            DM.qrySolicitacaoTrab.Post;
          end;
      end;
     while not DM.qryOrdemServicoServSolic.Eof = True do
       begin
         DM.qryOrdemServicoServExec.Append;
         DM.qryOrdemServicoServExecCODEMPRESA.AsString       := DM.FCodEmpresa;
         DM.qryOrdemServicoServExecCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger;
         DM.qryOrdemServicoServExecPARTE.AsString            := DM.qryOrdemServicoServSolicPARTE.AsString;
         DM.qryOrdemServicoServExecITEM.AsString             := DM.qryOrdemServicoServSolicITEM.AsString;
         DM.qryOrdemServicoServExecDESCRICAO.AsString        := DM.qryOrdemServicoServSolicDESCRICAO.AsString;
         DM.qryOrdemServicoServExecEQUIPPARADO.AsString      := DM.qryOrdemServicoServSolicEQUIPPARADO.AsString;
         DM.qryOrdemServicoServExecTEMPOEXECUCAO.AsFloat     := DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsFloat;
         DM.qryOrdemServicoServExec.Post;
         DM.qryOrdemServicoServSolic.Next;
       end;
    DM.qryOrdemServicoEquipe.Close;
    DM.qryOrdemServicoEquipeMObra.Close;
    DM.qryOrdemServicoEquipeRecursos.Close;
    DM.qryOrdemServicoEquipeMObraUtil.Close;
    DM.qryOrdemServicoEquipeMObraMovim.Close;
    DM.qryOrdemServicoServSolic.Close;
    DM.qryOrdemServicoServExec.Close;
    DM.qryOrdemServicoMObraDisp.Close;
    DM.qryTotalHomemHora.Close;
    DM.qryTotalHomemHoraSeqHora.Close;
    DM.qrySolicitacaoTrab.Close;
    DM.MSGAguarde('', False);
    Timer1.Enabled := True;
  end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.LiberarMaodeObraEmExecucao;
var
LTempoExec: Real;
LDataConsulta: TDateTime;
begin
while not DM.qryOrdemServicoEquipe.Eof = True do
  begin
    while not DM.qryOrdemServicoEquipeMObra.Eof = True do
      begin
        while not DM.qryOrdemServicoEquipeMObraUtil.Eof = True do
          begin
            LTempoExec := 0;
            while not DM.qryOrdemServicoEquipeMObraMovim.Eof = True do
              begin
                if DM.qryOrdemServicoEquipeMObraMovimSAIDA.IsNull = True then
                  begin
                    DM.qryOrdemServicoEquipeMObraMovim.Edit;
                    DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDateTime := DM.FDataHoraServidor;
                    DM.qryOrdemServicoEquipeMObraMovim.Post;
                  end;
                LDataConsulta := DM.qryOrdemServicoEquipeMObraMovimENTRADA.AsDatetime;
                //Calcula a hora útil trabalhada
                while LDataConsulta <= DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDatetime do
                  begin
                    if DM.TotalHomemHoraDisp(LDataConsulta, DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString, EmptyStr) > 0 then
                      LTempoExec := LTempoExec + 1;
                    LDataConsulta := IncHour(LDataConsulta, 1);
                  end;
                LTempoExec := (LTempoExec/60) + DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;
                DM.qryOrdemServicoEquipeMObraUtil.Edit;
                DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat := DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat + LTempoExec;
                DM.qryOrdemServicoEquipeMObraUtil.Post;
                if DM.qryOrdemServicoMObraDisp.Locate('MATRICULA', DM.qryOrdemServicoEquipeMObraMovimMATRICULA.AsString, []) = True then
                  begin
                    DM.qryOrdemServicoMObraDisp.Edit;
                    DM.qryOrdemServicoMObraDispOCUPADO.AsString := 'N';
                    DM.qryOrdemServicoMObraDisp.Post;
                  end;
                DM.qryOrdemServicoEquipeMObraMovim.Next;
              end;

            DM.qryOrdemServico.Edit;
            DM.qryOrdemServicoTEMPOHOMEMHORAEXEC.AsFloat := DM.qryOrdemServicoTEMPOHOMEMHORAEXEC.AsFloat + DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;
            DM.qryOrdemServicoCUSTOMOBRA.AsFloat         := DM.qryOrdemServicoCUSTOMOBRA.AsFloat + ((DM.qryOrdemServicoEquipeMObraUtilSALARIO.AsFloat/DM.qryOrdemServicoEquipeMObraUtilHOFICIAIS.AsFloat) * DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat);
            DM.qryOrdemServico.Post;
            DM.qryOrdemServicoEquipeMObraUtil.Next;
          end;
        DM.qryOrdemServicoEquipeMObra.Next;
      end;
    DM.qryOrdemServicoEquipe.Next;
  end;
end;
procedure TFrmTelaCadOrdemServicoGerencia.MaodeObra1Click(Sender: TObject);
begin
  inherited;
  DM.qryOrdemServicoGerenciaRelatMObraProg.Close;
  DM.qryOrdemServicoGerenciaRelatMObraProg.Params[0].AsString := DM.FCodEmpresa;
  DM.qryOrdemServicoGerenciaRelatMObraProg.Open;
  if DM.qryOrdemServicoGerencia.Filtered = True then
    begin
      DM.qryOrdemServicoGerenciaRelatMObraProg.Filter := DM.qryOrdemServicoGerencia.Filter;
      DM.qryOrdemServicoGerenciaRelatMObraProg.Filtered := True;
    end;
  DM.qryOrdemServicoGerenciaRelatMObraUtil.Close;
  DM.qryOrdemServicoGerenciaRelatMObraUtil.Params[0].AsString := DM.FCodEmpresa;
  DM.qryOrdemServicoGerenciaRelatMObraUtil.Open;
  if DM.qryOrdemServicoGerencia.Filtered = True then
    begin
      DM.qryOrdemServicoGerenciaRelatMObraUtil.Filter := DM.qryOrdemServicoGerencia.Filter;
      DM.qryOrdemServicoGerenciaRelatMObraUtil.Filtered := True;
    end;
  DmRelatorios.frxROrdemServicoMObra.ShowReport();
  DM.qryOrdemServicoGerenciaRelatMObraUtil.Filtered := False;
  DM.qryOrdemServicoGerenciaRelatMObraUtil.Close;
  DM.qryOrdemServicoGerenciaRelatMObraProg.Filtered := False;
  DM.qryOrdemServicoGerenciaRelatMObraProg.Close;
end;
end.

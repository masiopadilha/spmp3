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
  Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, JvExGrids, JvStringGrid, IOUtils,
  JvFullColorSpaces, JvFullColorCtrls, JvDBGridFooter, JvExDBGrids, JvDBGrid,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, System.Notification;

type
  TFrmTelaCadOrdemServicoGerencia = class(TFrmTelaPaiOKCancel)
    PFuncoes: TPanel;
    Label9: TLabel;
    CBPeriodo: TComboBox;
    PopupMenuLiberar: TPopupMenu;
    Total: TMenuItem;
    Parcial: TMenuItem;
    PopupMenuRelat: TPopupMenu;
    Ficha1: TMenuItem;
    Lista1: TMenuItem;
    PFiltros: TPanel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    PFiltros2: TPanel;
    Label6: TLabel;
    BtnFamiliaEquip: TButton;
    Label13: TLabel;
    BtnOficina: TButton;
    edtOficina: TEdit;
    EdtFamiliaEquip: TEdit;
    TimerCheckOS: TTimer;
    PopupMenuExecutar: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MaodeObra1: TMenuItem;
    Inspecoes1: TMenuItem;
    Completa1: TMenuItem;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label4: TLabel;
    EdtData2: TJvDateTimePicker;
    BtnConsultar: TButton;
    CheckBox8: TCheckBox;
    Simples1: TMenuItem;
    Checklist1: TMenuItem;
    CheckBox2: TCheckBox;
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
    CheckBox9: TCheckBox;
    PopupMenuOS: TPopupMenu;
    Vencida1: TMenuItem;
    DesafazerVencida1: TMenuItem;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Label11: TLabel;
    edtSolicitante: TEdit;
    BtnSolicitante: TButton;
    Panel10: TPanel;
    DBGrid: TJvDBGrid;
    chkRot: TCheckBox;
    chkParado: TCheckBox;
    Label18: TLabel;
    CBPrioridade: TComboBox;
    Label5: TLabel;
    CBTipoManutencao: TComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Label8: TLabel;
    Panel4: TPanel;
    Label10: TLabel;
    Panel5: TPanel;
    Label12: TLabel;
    Panel6: TPanel;
    Label14: TLabel;
    Panel7: TPanel;
    Label15: TLabel;
    Panel8: TPanel;
    Label16: TLabel;
    Panel9: TPanel;
    Label17: TLabel;
    chkSolic: TCheckBox;
    Button1: TBitBtn;
    Button2: TBitBtn;
    Button3: TBitBtn;
    Button4: TBitBtn;
    Button5: TBitBtn;
    Button6: TBitBtn;
    Button7: TBitBtn;
    Button8: TBitBtn;
    Button9: TBitBtn;
    Button10: TBitBtn;
    DBNavigator1: TDBNavigator;
    NotificationCenter1: TNotificationCenter;
    procedure FormCreate(Sender: TObject);
    procedure ConfigurarFiltros;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGConsSimplesClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ParcialClick(Sender: TObject);
    procedure TotalClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ficha1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure LiberarMaodeObraEmExecucao;
    procedure BtnOficinaClick(Sender: TObject);
    procedure EdtOficinaDblClick(Sender: TObject);
    procedure EdtFamiliaEquipDblClick(Sender: TObject);
    procedure BtnFamiliaEquipClick(Sender: TObject);
    procedure TimerCheckOSTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Completa1Click(Sender: TObject);
    procedure MaodeObra1Click(Sender: TObject);
    procedure Inspecoes1Click(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Simples1Click(Sender: TObject);
    procedure Checklist1Click(Sender: TObject);
    procedure CBPrioridadeChange(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure Vencida1Click(Sender: TObject);
    procedure DesafazerVencida1Click(Sender: TObject);
    procedure DBGridGetBtnParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; var ASortMarker: TSortMarker;
      IsDown: Boolean);
    procedure DBGridTitleClick(Column: TColumn);
    procedure StatusBar1Resize(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure edtSolicitanteDblClick(Sender: TObject);
    procedure BtnSolicitanteClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure EdtData1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Ascending:boolean;
    hora_futura: TDateTime;

    procedure LimpaGrid(Grid: TStringGrid);
    procedure CopyDataSetToGrid(Query: TFDMemTable; StringGrid: TStringGrid);
    procedure CliqueNoTitulo(Column: TColumn; FDQuery: TFDQuery; IndiceDefault: String);
  public
    { Public declarations }
  end;


var
  FrmTelaCadOrdemServicoGerencia: TFrmTelaCadOrdemServicoGerencia;
  LEquipamento, LCodOficina, LCodFamilia, LNProg, LDet, LProg, LExec,
  LLib, LFec, LPar, LSolic, LRot, LCanc, LVenc, LParado,
  LTipoManutencao, qryOrdemServicoGerencia : String;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServico,
  UnTelaCadOrdemServicoMObraProg, UnTelaCadOrdemServicoMObraExec,
  UnTelaCadOrdemServicoFechamento, UnTelaCadOrdemServicoHistorico,
  UnTelaCadOrdemServicoParalisacao, UnDmRelatorios,
  UnTelaCadOrdemServicoLocalizaMObra, UnDM;

procedure TFrmTelaCadOrdemServicoGerencia.Button8Click(Sender: TObject);
var
LMotivo : String;
begin
  inherited;
if (DM.qryUsuarioPExclusaoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CADASTRADA') or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DETALHADA')
  or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'SOLICITADA')
    or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DESPROGRAMADA') then
      begin
        if Application.MessageBox('Deseja realmente cancelar a O.S. ?','SPMP', MB_YESNO + MB_ICONWARNING) = MRYes then
          begin
            with DM.qryOrdemServico do
              begin
                Close;
                Params[0].AsString  := DM.FCodEmpresa;
                Params[1].AsInteger := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
                Open;
                Edit;
              end;
            LMotivo := DM.CampoInputBox('SPMP', 'Informe o motivo do cancelamento:');
            if LMotivo = EmptyStr then
              begin
                PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'MOTIVO OBRIGATÓRIO!'; Exit;
              end;

            DM.qryDataHoraServidor.Refresh;
            DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

            DM.qryOrdemServico.Edit;
            DM.qryOrdemServicoOBSERVACOES.AsString  := LMotivo;
            DM.qryOrdemServicoSITUACAO.AsString     := 'CANCELADA';
            DM.qryOrdemServicoDATACANCEL.AsDateTime := DM.FDataHoraServidor;
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

procedure TFrmTelaCadOrdemServicoGerencia.BitBtn1Click(Sender: TObject);
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
    TimerCheckOS.Enabled := False;

    Application.CreateForm(TFrmTelaCadOrdemServico, FrmTelaCadOrdemServico);
    FrmTelaCadOrdemServico.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServico);
    TimerCheckOS.Enabled := True;
  End;
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

procedure TFrmTelaCadOrdemServicoGerencia.Button3Click(Sender: TObject);
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
if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PARALISADA') then
  begin
    Button6.OnClick(Sender);
    Exit;
  end;

PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')
  or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA')
    or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CANCELADA')
      or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO') then Exit;

if DM.qryOrdemServicoGerenciaCODMANUTENCAO.AsString = EmptyStr Then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'CADASTRO DA ORDEM DE SERVIÇO INCOMPLETO!';
    Exit;
  end;

if Application.MessageBox('Deseja realmente executar a O.S.?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDNo then Exit;

TimerCheckOS.Enabled := False;

DM.MSGAguarde('');

DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
  with DM.qryOrdemServico do
    begin
      Close;
      Params[0].AsString := DM.FCodEmpresa;
      Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
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

TimerCheckOS.Enabled := True;
end;

procedure TFrmTelaCadOrdemServicoGerencia.BtnFamiliaEquipClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    TimerCheckOS.Enabled := False;
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodFamilia          := DM.FCodCombo;
        EdtFamiliaEquip.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
    TimerCheckOS.Enabled := True;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Button5Click(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOFECHAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')
  or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA') then
    begin
      with DM.qryOrdemServico do
        begin
          Close;
          Params[0].AsString := DM.FCodEmpresa;
          Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
          Open;
          Edit;
        end;
      Try
        TimerCheckOS.Enabled := False;
        Application.CreateForm(TFrmTelaCadOrdemServicoFechamento, FrmTelaCadOrdemServicoFechamento);
        FrmTelaCadOrdemServicoFechamento.ShowModal;
      Finally
        FreeAndNil(FrmTelaCadOrdemServicoFechamento);
        TimerCheckOS.Enabled := True;
      End;
    end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Button10Click(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
  Try
    TimerCheckOS.Enabled := False;
    Application.CreateForm(TFrmTelaCadOrdemServicoHistorico, FrmTelaCadOrdemServicoHistorico);
    FrmTelaCadOrdemServicoHistorico.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoHistorico);
    TimerCheckOS.Enabled := True;
  End;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Button7Click(Sender: TObject);
begin
  inherited;
if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'VENCIDA')
  or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CANCELADA') Then Exit;

TimerCheckOS.Enabled := False;

if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadOrdemServicoGerencia.Button4Click(Sender: TObject);
begin
  inherited;
if DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString <> 'EXECUCAO' Then Exit;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOLIBERAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
PopupMenuLiberar.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

//procedure TFrmTelaCadOrdemServicoGerencia.BtnManutencaoClick(Sender: TObject);
//begin
//  inherited;
//if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
//  begin
//    Timer1.Enabled := False;
//    DM.FTabela_auxiliar := 100;
//    DM.FNomeConsulta := 'Tipos de Manutenções';
//    if DM.ConsultarCombo <> EmptyStr then
//      begin
//        LCodManutencao     := DM.FCodCombo;
//        edtManutencao.Text := DM.FValorCombo;
//        ConfigurarFiltros;
//      end;
//    Timer1.Enabled := True;
//  end;
//end;

procedure TFrmTelaCadOrdemServicoGerencia.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    TimerCheckOS.Enabled := False;
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodOficina     := DM.FCodCombo;
        EdtOficina.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
    TimerCheckOS.Enabled := True;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Button6Click(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOPARALISAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO') or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PARALISADA') then
    begin
      if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
        with DM.qryOrdemServico do
          begin
            Close;
            Params[0].AsString := DM.FCodEmpresa;
            Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
            Open;
            Edit;
          end;
      Try
        TimerCheckOS.Enabled := False;
        Application.CreateForm(TFrmTelaCadOrdemServicoParalisacao, FrmTelaCadOrdemServicoParalisacao);
        FrmTelaCadOrdemServicoParalisacao.Caption := 'Paralisações da O.S.: '+ FormatFloat('#000000', DM.qryOrdemServicoCODIGO.Asfloat);
        FrmTelaCadOrdemServicoParalisacao.ShowModal;
      Finally
        FreeAndNil(FrmTelaCadOrdemServicoParalisacao);
        TimerCheckOS.Enabled := True;
      End;
    end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Button2Click(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPAcessoCADORDEMSERVICOPROGRAMAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CADASTRADA')
  or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'SOLICITADA') or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DETALHADA')
    or ((DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PROGRAMADA') or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REPROGRAMADA'))
      or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REPROGRAMADA')
        or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DESPROGRAMADA') then
          begin
            Try
              if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
                with DM.qryOrdemServico do
                  begin
                    Close;
                    Params[0].AsString := DM.FCodEmpresa;
                    Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
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
              TimerCheckOS.Enabled := False;
              Application.CreateForm(TFrmTelaCadOrdemServicoMObraProg, FrmTelaCadOrdemServicoMObraProg);
              FrmTelaCadOrdemServicoMObraProg.ShowModal;
            Finally
              FreeAndNil(FrmTelaCadOrdemServicoMObraProg);
              TimerCheckOS.Enabled := True;
            End;
          end
      else
        begin
          PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'O.S. JÁ PROCESSADA!'; Exit;
        end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.BtnSolicitanteClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    TimerCheckOS.Enabled := False;
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Solicitantes';
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodSolicitante     := DM.FCodCombo;
        edtSolicitante.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
    TimerCheckOS.Enabled := True;
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
      DM.qryChecklistManut.Close;
      DM.qryChecklistManutPartes.Close;
      DM.qryChecklistManutItens.Close;
      DM.qryChecklistManutItensEsp.Close;
      DM.qryChecklistManutMObra.Close;
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
      DM.qryChecklistLubrific.Close;
      DM.qryChecklistLubrificPartes.Close;
      DM.qryChecklistLubrificItens.Close;
      DM.qryChecklistLubrificItensEsp.Close;
      DM.qryChecklistLubrificMObra.Close;
    end;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.CheckBox1Click(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
ConfigurarFiltros;
end;
procedure TFrmTelaCadOrdemServicoGerencia.Button9Click(Sender: TObject);
begin
  inherited;
  Try
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    TimerCheckOS.Enabled := False;
    Application.CreateForm(TFrmTelaCadOrdemServicoLocalizaMObra, FrmTelaCadOrdemServicoLocalizaMObra);
    FrmTelaCadOrdemServicoLocalizaMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoLocalizaMObra);
    TimerCheckOS.Enabled := True;
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
  TimerCheckOS.Enabled := True;
end;

procedure TFrmTelaCadOrdemServicoGerencia.ConfigurarFiltros;
begin
  DBGrid.DataSource.DataSet.Filtered := False;
  DBGrid.DataSource.DataSet.Filter := EmptyStr;
  DM.qryOrdemServicoGerencia.IndexDefs.Clear;

  LNProg := ''; LDet := ''; LProg := ''; LExec := '';  LLib := ''; LFec := ''; LPar := '';
  LSolic := ''; LRot := ''; LCanc := ''; LVenc := ''; LParado := ''; LTipoManutencao := '';

  if (CheckBox1.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LDet := ' (SITUACAO = ''CADASTRADA'') OR (SITUACAO = ''DESPROGRAMADA'')'
    else
      LDet := ' OR (SITUACAO = ''CADASTRADA'') OR (SITUACAO = ''DESPROGRAMADA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LDet;

  if (CheckBox2.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LNProg := ' (SITUACAO = ''DETALHADA'')'
    else
      LNProg := ' OR (SITUACAO = ''DETALHADA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LNProg;

  if (CheckBox3.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LProg  := ' (SITUACAO = ''PROGRAMADA'') or (SITUACAO = ''REPROGRAMADA'')'
    else
      LProg  := ' OR (SITUACAO = ''PROGRAMADA'') or (SITUACAO = ''REPROGRAMADA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LProg;

  if (CheckBox4.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LExec  := ' (SITUACAO = ''EXECUCAO'')'
    else
      LExec  := ' OR (SITUACAO = ''EXECUCAO'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LExec;

  if (CheckBox5.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LLib   := ' (SITUACAO = ''LIBERADA'')'
    else
      LLib   := ' OR (SITUACAO = ''LIBERADA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LLib;

  if (CheckBox6.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LFec   := ' (SITUACAO = ''FECHADA'')'
    else
      LFec   := ' OR (SITUACAO = ''FECHADA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LFec;

  if (CheckBox7.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LPar   := ' (SITUACAO = ''PARALISADA'')'
    else
      LPar   := ' OR (SITUACAO = ''PARALISADA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LPar;

  if (chkSolic.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      begin
        LSolic := ' (SOLICTRAB = ''S'')';
        if DBGrid.DataSource.DataSet.Filter <> '' then
          DBGrid.DataSource.DataSet.Filter := '(' + DBGrid.DataSource.DataSet.Filter + ')';
      end
    else
      begin
        LSolic := ' AND (SOLICTRAB = ''S'')';
        if DBGrid.DataSource.DataSet.Filter <> '' then
          DBGrid.DataSource.DataSet.Filter := '(' + DBGrid.DataSource.DataSet.Filter + ')';
      end;
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LSolic;

  if (chkRot.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      begin
        LRot   := ' (ROTAEQUIP = ''S'')';
        if DBGrid.DataSource.DataSet.Filter <> '' then
          DBGrid.DataSource.DataSet.Filter := '(' + DBGrid.DataSource.DataSet.Filter + ')';
      end
    else
      begin
        LRot   := ' AND (ROTAEQUIP = ''S'')';
        if DBGrid.DataSource.DataSet.Filter <> '' then
          DBGrid.DataSource.DataSet.Filter := '(' + DBGrid.DataSource.DataSet.Filter + ')';
      end;
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LRot ;


  if (CheckBox8.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LCanc   := ' (SITUACAO = ''CANCELADA'')'
    else
      LCanc   := ' OR (SITUACAO = ''CANCELADA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LCanc;

  if (CheckBox9.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LVenc   := ' (SITUACAO = ''VENCIDA'')'
    else
      LVenc   := ' OR (SITUACAO = ''VENCIDA'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LVenc;

  if (chkParado.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LParado   := ' (EQUIPPARADO = ''S'')'
    else
      LParado   := ' AND (EQUIPPARADO = ''S'')';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LParado;


  if DBGrid.DataSource.DataSet.Filter <> '' then
    DBGrid.DataSource.DataSet.Filter := '(' + DBGrid.DataSource.DataSet.Filter + ')';

  if EdtFamiliaEquip.Text <> '' then
    begin
      if DBGrid.DataSource.DataSet.Filter = EmptyStr then
        DBGrid.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = ' + QuotedStr(LCodFamilia)
      else
        DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
    end;

  if edtOficina.Text <> '' then
    begin
      if DBGrid.DataSource.DataSet.Filter = EmptyStr then
        DBGrid.DataSource.DataSet.Filter := 'CODOFICINA = ' + QuotedStr(LCodOficina)
      else
        DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND CODOFICINA = '+QuotedStr(LCodOficina);
    end;

    if edtSolicitante.Text <> ''  then
    begin
      if DBGrid.DataSource.DataSet.Filter = EmptyStr then
        DBGrid.DataSource.DataSet.Filter := 'MATRICULA = ' + QuotedStr(LCodSolicitante)
      else
        DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND MATRICULA = ' + QuotedStr(LCodSolicitante);
    end;

    case CBTipoManutencao.ItemIndex of
      1:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Manutenção Autônoma'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Manutenção Autônoma''';
      end;
      2:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Manutenção Corretiva'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Manutenção Corretiva''';
      end;
      3:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Manutenção Preventiva'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Manutenção Preventiva''';
      end;
      4:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Manutenção Preditiva'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Manutenção Preditiva''';
      end;
      5:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Lubrificação'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Lubrificação''';
      end;
      6:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Novos Projetos'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Novos Projetos''';
      end;
      7:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Alterações de Projetos'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Alterações de Projetos''';
      end;
      8:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'TIPO = ''Outros Serviços'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND TIPO = ''Outros Serviços''';
      end;
    end;


  case CBPrioridade.ItemIndex of
    1:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Emergência'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Emergência''';
      end;
    2:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 12 hs'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 12 hs''';
      end;
    3:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 72 hs'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 72 hs''';
      end;
    4:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 1 Semana'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 1 Semana''';
      end;
    5:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Até 1 Mês'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Até 1 Mês''';
      end;
    6:
      begin
        if DBGrid.DataSource.DataSet.Filter = EmptyStr then
          DBGrid.DataSource.DataSet.Filter := 'PRIORIDADEPARADA = ''Acima de um mês'''
        else
          DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND PRIORIDADEPARADA = ''Acima de um mês''';
      end;
  end;

  if LEquipamento <> EmptyStr then
    begin
      if DBGrid.DataSource.DataSet.Filter = EmptyStr then
        DBGrid.DataSource.DataSet.Filter := 'CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0])
      else
        DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0]);
    end;

  if DBGrid.DataSource.DataSet.Filter <> EmptyStr then
    DBGrid.DataSource.DataSet.Filtered := True;

  DM.qryOrdemServicoGerencia.First;
end;

//procedure TFrmTelaCadOrdemServicoGerencia.edtManutencaoDblClick(Sender: TObject);
//begin
//  inherited;
//  LCodManutencao := '';
//  edtManutencao.Text := '';
//  ConfigurarFiltros;
//end;

procedure TFrmTelaCadOrdemServicoGerencia.EdtData1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    BtnConsultar.OnClick(Sender);
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

procedure TFrmTelaCadOrdemServicoGerencia.edtSolicitanteDblClick(
  Sender: TObject);
begin
  inherited;
  LCodSolicitante := '';
  EdtSolicitante.Text := '';
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

procedure TFrmTelaCadOrdemServicoGerencia.DesafazerVencida1Click(
  Sender: TObject);
begin
  inherited;
  if (DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'VENCIDA') then
    begin
      if (DM.qryOrdemServicoGerenciaCODMANUTPROGEQUIP.AsString <> '') then
      begin
        if Application.MessageBox('Deseja realmente definir a ordem de serviço como cadastrada?', 'SPMP3', MB_ICONEXCLAMATION + MB_YESNO) = IDYes then
        begin
          DM.qryAuxiliar.Close;
          DM.qryAuxiliar.SQL.Clear;
          DM.qryAuxiliar.SQL.Add('UPDATE `ordemservico` SET `SITUACAO` = ''CADASTRADA'' WHERE `CODIGO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';'
                                  + 'UPDATE `manutprogequipamentohist` SET `SITUACAO` = ''ABERTA'', `REALIZADA` = ''N'' WHERE `CODORDEMSERVICO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';');
          DM.qryAuxiliar.Execute;

          DM.qryOrdemServicoGerencia.Edit;
          DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'CADASTRADA';
          DM.qryOrdemServicoGerencia.Post;
        end;
      end else
      if (DM.qryOrdemServicoGerenciaCODLUBRIFICPROGEQUIP.AsString <> '') then
      begin
        if Application.MessageBox('Deseja realmente definir a ordem de serviço como cadastrada?', 'SPMP3', MB_ICONEXCLAMATION + MB_YESNO) = IDYes then
        begin
          DM.qryAuxiliar.Close;
          DM.qryAuxiliar.SQL.Clear;
          DM.qryAuxiliar.SQL.Add('UPDATE `ordemservico` SET `SITUACAO` = ''CADASTRADA'' WHERE `CODIGO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';'
                                  + 'UPDATE `lubrificprogequipamentohist` SET `SITUACAO` = ''ABERTA'', `REALIZADA` = ''N'' WHERE `CODORDEMSERVICO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';');
          DM.qryAuxiliar.Execute;

          DM.qryOrdemServicoGerencia.Edit;
          DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'CADASTRADA';
          DM.qryOrdemServicoGerencia.Post;
        end;
      end else
      begin
        Application.MessageBox('A ordem de serviço não é um plano de manutenção/lubrificação', 'SPMP3', MB_ICONSTOP + MB_OK);
        Exit;
      end;
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

      FDMemTOSSimplesExcel.FieldByName('DATACADASTRO').Visible          := True;
      FDMemTOSSimplesExcel.FieldByName('DATAPROGINI').Visible           := True;
      FDMemTOSSimplesExcel.FieldByName('DATAFECHAMENTO').Visible        := True;
      FDMemTOSSimplesExcel.FieldByName('DATAINICIOREAL').Visible        := True;
      FDMemTOSSimplesExcel.FieldByName('DATAFIMREAL').Visible           := True;
      FDMemTOSSimplesExcel.FieldByName('TEMPOPREVISTO').Visible         := True;

      FDMemTOSSimplesExcel.FieldByName('CODIGO').DisplayLabel           := 'O.S';
      FDMemTOSSimplesExcel.FieldByName('CODIGO').Index                  := 0;
      FDMemTOSSimplesExcel.FieldByName('DESCRICAO').DisplayLabel        := 'Serviço';
      FDMemTOSSimplesExcel.FieldByName('DESCRICAO').Index               := 1;
      FDMemTOSSimplesExcel.FieldByName('DATACADASTRO').DisplayLabel     := 'Cad.';
      FDMemTOSSimplesExcel.FieldByName('DATACADASTRO').Index            := 2;
      FDMemTOSSimplesExcel.FieldByName('PLANEJADA').Visible             := True;
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
      FDMemTOSSimplesExcel.FieldByName('CODEQUIPAMENTO').DisplayLabel   := 'Cód. Equipamento';
      FDMemTOSSimplesExcel.FieldByName('CODEQUIPAMENTO').Index          := 8;
      FDMemTOSSimplesExcel.FieldByName('EQUIPAMENTO').DisplayLabel      := 'Equipamento';
      FDMemTOSSimplesExcel.FieldByName('EQUIPAMENTO').Index             := 9;
      FDMemTOSSimplesExcel.FieldByName('EQUIPPARADO').DisplayLabel      := 'Parado';
      FDMemTOSSimplesExcel.FieldByName('EQUIPPARADO').Index             := 10;
      FDMemTOSSimplesExcel.FieldByName('CENTROCUSTO').Visible           := True;
      FDMemTOSSimplesExcel.FieldByName('CENTROCUSTO').DisplayLabel      := 'Centro/Custo';
      FDMemTOSSimplesExcel.FieldByName('CENTROCUSTO').Index             := 11;
      FDMemTOSSimplesExcel.FieldByName('TEMPOPREVISTO').DisplayLabel    := 'Prev. (hs)';
      FDMemTOSSimplesExcel.FieldByName('TEMPOPREVISTO').Index           := 12;
      FDMemTOSSimplesExcel.FieldByName('TEMPOEXECUTADO').Visible           := True;
      FDMemTOSSimplesExcel.FieldByName('TEMPOEXECUTADO').DisplayLabel   := 'Exec. (hs)';
      FDMemTOSSimplesExcel.FieldByName('TEMPOEXECUTADO').Index          := 13;
      FDMemTOSSimplesExcel.FieldByName('SITUACAO').DisplayLabel         := 'Situação';
      FDMemTOSSimplesExcel.FieldByName('SITUACAO').Index                := 14;
      FDMemTOSSimplesExcel.FieldByName('TIPOMANUTENCAO').DisplayLabel   := 'Tipo';
      FDMemTOSSimplesExcel.FieldByName('TIPOMANUTENCAO').Index          := 15;
      FDMemTOSSimplesExcel.FieldByName('OFICINA').Visible               := True;
      FDMemTOSSimplesExcel.FieldByName('OFICINA').DisplayLabel          := 'Oficina';
      FDMemTOSSimplesExcel.FieldByName('OFICINA').Index                 := 16;
      FDMemTOSSimplesExcel.FieldByName('PRIORIDADEPARADA').Visible      := True;
      FDMemTOSSimplesExcel.FieldByName('PRIORIDADEPARADA').DisplayLabel := 'Prioridade';
      FDMemTOSSimplesExcel.FieldByName('PRIORIDADEPARADA').Index        := 17;
      FDMemTOSSimplesExcel.FieldByName('ORIGEM').Visible                := True;
      FDMemTOSSimplesExcel.FieldByName('ORIGEM').DisplayLabel           := 'O';
      FDMemTOSSimplesExcel.FieldByName('ORIGEM').Index                  := 18;

//      FDMemTOSSimplesExcel.FieldByName('Equipamento').Visible           := False;
      FDMemTOSSimplesExcel.FieldByName('CODMANUTENCAO').Visible         := False;
      FDMemTOSSimplesExcel.FieldByName('ROTAEQUIP').Visible             := False;
      FDMemTOSSimplesExcel.FieldByName('MATRICULA').Visible             := False;
      FDMemTOSSimplesExcel.FieldByName('DESCINSPECAO').Visible          := False;
      FDMemTOSSimplesExcel.FieldByName('FREQUENCIA').Visible            := False;
      FDMemTOSSimplesExcel.FieldByName('REPROGRAMAR').Visible           := False;
      FDMemTOSSimplesExcel.FieldByName('SOLICTRAB').Visible             := False;
      FDMemTOSSimplesExcel.FieldByName('IMPORTANCIA').Visible           := False;

      CopyDataSetToGrid(FDMemTOSSimplesExcel, grid);
      caminho := caminho+'\Lista Simples das Ordens de Serviço.'+FormatDateTime('dd.mm.yyyy.hh.sss', now) + '.csv';
      grid.SaveToCSV(caminho);

      Application.MessageBox(PChar( 'Exportação do arquivo "' + caminho + '" concluída com sucesso!'), 'SPMP3', MB_OK + MB_ICONINFORMATION);
//      PAuxiliares.Caption := 'Exportação concluída!';
//      Sleep(3);
      PAuxiliares.Caption := '';
      TimerCheckOS.Enabled := True;
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
DM.qryOrdemServicoUltParalisacao.Close;
DM.qryAuxiliar.Close;
DBGrid.DataSource.DataSet.Filtered := False;
DBGrid.DataSource.DataSet.Filter := EmptyStr;
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

  TimerCheckOS.Enabled := True;


  hora_futura := IncMinute(Now, DM.FTempoNovaOS);
end;

procedure TFrmTelaCadOrdemServicoGerencia.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  LFirstOS: Integer;
  MyNotification: TNotification;
begin
//F5
if Key = 116 then
  begin
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
      begin
        DM.MSGAguarde();
        DM.qryOrdemServicoGerencia.Refresh;
        DM.qryOrdemServicoGerencia.First;

        LFirstOS := DM.qryOrdemServicoGerenciaCODIGO.AsInteger;
        if (LFirstOS <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)
          and ((TFDQuery(DBGrid.DataSource.DataSet).IndexName = '')
            or (TFDQuery(DBGrid.DataSource.DataSet).IndexName = 'CODIGO_DESC')) then
            begin
              MyNotification := NotificationCenter1.CreateNotification;
              try
                MyNotification.Name := 'SPMP3NewOSNotification';
                MyNotification.Title := 'SPMP3';
                MyNotification.AlertBody := 'Novas ordens de serviço foram emitidas!';

                NotificationCenter1.PresentNotification(MyNotification);
              finally
                MyNotification.Free;
              end;
            end;
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
    if (key = 79) then Button1.OnClick(Sender);
    if (key = 80) then Button2.OnClick(Sender);
    if (key = 69) then Button3.OnClick(Sender);
    if (key = 76) then Button4.OnClick(Sender);
    if (key = 70) then Button5.OnClick(Sender);
    if (key = 82) then Button6.OnClick(Sender);
    if (key = 73) then Button7.OnClick(Sender);
    if (key = 67) then Button8.OnClick(Sender);
    if (key = 77) then Button9.OnClick(Sender);
    if (key = 72) then Button10.OnClick(Sender);
  end;

  inherited;
end;

procedure TFrmTelaCadOrdemServicoGerencia.FormResize(Sender: TObject);
var
  i: Integer;
  ButtonWidth, Spacing, CheckBoxWidth, TotalWidth, StartPos, AvailableWidth,
  ColumnWidth: Integer;
begin
  inherited;
  // Defina o número de botões
  const ButtonCount = 10;
  // Calcule a largura do botão
  ButtonWidth := (ClientWidth div ButtonCount) -7;
  // Calcule o espaçamento entre os botões
  Spacing := (ClientWidth - (ButtonWidth * ButtonCount)) div (ButtonCount + 1);

  for i := 0 to ButtonCount - 1 do
    begin
      with TButton(FindComponent('Button' + IntToStr(i + 1))) do
      begin
        // Defina a largura do botão
        Width := ButtonWidth;
        // Defina a posição do botão
        Left := Spacing + i * (ButtonWidth + Spacing) - 2;
        if i = 9 then
          Left := Left - 1;
        // Defina a altura e posição vertical, se necessário
        Top := 7;  // por exemplo, 10 pixels da borda superior do formulário
        Height := 23; // altura do botão, ajustável conforme necessário
      end;
    end;


  // Obtém a largura de um CheckBox (assumindo que todos têm a mesma largura)
  CheckBoxWidth := CheckBox1.Width;

  // Calcula a largura total ocupada por todos os CheckBoxes
  TotalWidth := 9 * CheckBoxWidth;

  // Calcula o espaço entre os CheckBoxes
  Spacing := (ClientWidth - TotalWidth) div 10;
  // Define a posição inicial (margem esquerda)
  StartPos := Spacing;
  // Posiciona os CheckBoxes
  for i := 0 to 8 do
  begin
    TCheckBox(FindComponent('CheckBox' + IntToStr(i + 1))).Left := StartPos;
    StartPos := StartPos + CheckBoxWidth + Spacing;
  end;

  BtnFechar.Left := (PBotoes.Width div 2) - (BtnFechar.Width div 2);
  BtnFechar.Top := (PBotoes.Height div 2) - (BtnFechar.Height div 2);


  // Calcula a largura total das colunas sem contar a última
  TotalWidth := 0;
  for i := 0 to DBGrid.Columns.Count - 2 do
    TotalWidth := TotalWidth + DBGrid.Columns[i].Width;
  // Calcula a largura disponível para a última coluna
//  AvailableWidth := DBGrid.ClientWidth - TotalWidth;
  // Define a largura de cada coluna proporcionalmente
  for i := 0 to DBGrid.Columns.Count - 2 do
  begin
    ColumnWidth := (DBGrid.ClientWidth * DBGrid.Columns[i].Width) div TotalWidth;
    DBGrid.Columns[i].Width := ColumnWidth;
  end;
  // Define a largura da última coluna para preencher o restante do espaço
//  if DBGrid.Columns.Count > 0 then
//    DBGrid.Columns[DBGrid.Columns.Count - 1].Width := AvailableWidth;
end;

procedure TFrmTelaCadOrdemServicoGerencia.FormShow(Sender: TObject);
begin
  inherited;
  if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
    begin
      qryOrdemServicoGerencia := DM.qryOrdemServicoGerencia.SQL.Text;

      DM.qryOrdemServicoGerencia.Close;
      DM.qryOrdemServicoGerencia.Params[0].AsString := DM.FCodEmpresa;
      DM.qryOrdemServicoGerencia.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
      DM.qryOrdemServicoGerencia.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
      DM.qryOrdemServicoGerencia.Open;
      DM.qryOrdemServicoUltParalisacao.Open;
      ConfigurarFiltros;
    end
  else
    begin
      Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.CliqueNoTitulo(Column: TColumn; FDQuery: TFDQuery; IndiceDefault: String);
var
  sIndexName: string;
  oOrdenacao: TFDSortOption;
  i: smallint;
begin
  // retira a formatação em negrito de todas as colunas
  for i := 0 to DBGrid.Columns.Count - 1 do
    DBGrid.Columns[i].Title.Font.Style := [];

  // configura a ordenação ascendente ou descendente
  if TFDQuery(DBGrid.DataSource.DataSet).IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    oOrdenacao := soDescending;
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    oOrdenacao := soNoCase;
  end ;

  // adiciona a ordenação no DataSet, caso não exista
  if not Assigned(TFDQuery(DBGrid.DataSource.DataSet).Indexes.FindIndex(sIndexName)) then
    TFDQuery(DBGrid.DataSource.DataSet).AddIndex(sIndexName, Column.FieldName, EmptyStr, [oOrdenacao]);

  // formata o título da coluna em negrito
  Column.Title.Font.Style := [fsBold];

  // atribui a ordenação selecionada
  TFDQuery(DBGrid.DataSource.DataSet).IndexName := sIndexName;

  TFDQuery(DBGrid.DataSource.DataSet).First;
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
  TimerCheckOS.Enabled := True;
end;

procedure TFrmTelaCadOrdemServicoGerencia.DBGridDblClick(Sender: TObject);
begin
  inherited;
  with DM.qryOrdemServico do
    begin
      Close;
      Params[0].AsString := DM.FCodEmpresa;
      Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
      Open;
      Edit;
    end;
  if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')
     or (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA')
     then
    Button5.OnClick(Sender)
  else
    Button1.OnClick(Sender);
end;

procedure TFrmTelaCadOrdemServicoGerencia.DBGridDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'ORIGEM') then
  begin
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Autônoma' then
    begin
      DBGrid.Canvas.Brush.Color := $00CACACA;
      DBGrid.Canvas.Font.Color := $00CACACA;
    end else
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Corretiva' then
    begin
      DBGrid.Canvas.Brush.Color := clRed;
      DBGrid.Canvas.Font.Color := clRed;
    end else
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preventiva' then
    begin
      DBGrid.Canvas.Brush.Color := clBlue;
      DBGrid.Canvas.Font.Color := clBlue;
    end else
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preditiva' then
    begin
      DBGrid.Canvas.Brush.Color := $00BFFF;
      DBGrid.Canvas.Font.Color := $00BFFF;
    end else
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Lubrificação' then
    begin
      DBGrid.Canvas.Brush.Color := $AA520;
      DBGrid.Canvas.Font.Color := $AA520;
    end else
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Novos Projetos' then
    begin
      DBGrid.Canvas.Brush.Color := $B0082;
      DBGrid.Canvas.Font.Color := $B0082;
    end else
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Alterações de Projetos' then
    begin
      DBGrid.Canvas.Brush.Color := $008D55C6;
      DBGrid.Canvas.Font.Color := $008D55C6;
    end else
    if DBGrid.DataSource.DataSet.FieldByName('TIPO').AsString = 'Outros Serviços' then
    begin
      DBGrid.Canvas.Brush.Color := $007A7A7A;
      DBGrid.Canvas.Font.Color := $007A7A7A;
    end else
    begin
      DBGrid.Canvas.Brush.Color := $0093EEF0;
      DBGrid.Canvas.Font.Color := $0093EEF0;
    end;
  end;

  if (Column.Field.FieldName = 'SITUACAO') then
  begin
    DBGrid.Canvas.Font.Style := [fsBold];
    DBGrid.Canvas.Font.Name := 'Calibri';
    if DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'SOLICITADA' then
    begin
      if DBGrid.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> '' then
      begin
        DBGrid.Canvas.Brush.Color := clWhite;
        DBGrid.Canvas.Font.Color:= clBlack;
      end else
      begin
        DBGrid.Canvas.Brush.Color := $00F3F3F3;
        DBGrid.Canvas.Font.Color := clBlack
      end;
    end;
    if DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA' then
    begin
       DBGrid.Canvas.Brush.Color := clGray;
       DBGrid.Canvas.Font.Color:= clBlack;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CADASTRADA') then
    begin
      if DBGrid.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> '' then
      begin
        DBGrid.Canvas.Brush.Color := clYellow;
        DBGrid.Canvas.Font.Color := clRed
      end else
      begin
        DBGrid.Canvas.Brush.Color := $00BBFFFF;
        DBGrid.Canvas.Font.Color := clRed
      end;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DETALHADA')then
    begin
      DBGrid.Canvas.Brush.Color := clYellow; DBGrid.Canvas.Font.Color := clGreen;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PROGRAMADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlue; DBGrid.Canvas.Font.Color := clWhite;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REPROGRAMADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlue; DBGrid.Canvas.Font.Color := clYellow;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DESPROGRAMADA')then
    begin
      DBGrid.Canvas.Brush.Color := clYellow; DBGrid.Canvas.Font.Color := clBlue;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REALIZADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlack; DBGrid.Canvas.Font.Color := clYellow;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO')then
    begin
      DBGrid.Canvas.Brush.Color := clInfoBk; DBGrid.Canvas.Font.Color := clGreen;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')then
    begin
      DBGrid.Canvas.Brush.Color := clGreen; DBGrid.Canvas.Font.Color := clWhite;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA')then
    begin
      DBGrid.Canvas.Brush.Color := clGray; DBGrid.Canvas.Font.Color := clBlack;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PARALISADA')then
    begin
      DBGrid.Canvas.Brush.Color := clRed; DBGrid.Canvas.Font.Color  := clYellow;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CANCELADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlack; DBGrid.Canvas.Font.Color  := $00FF8000;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'VENCIDA')then
    begin
      DBGrid.Canvas.Brush.Color := clRed; DBGrid.Canvas.Font.Color := clWhite;
    end;
  end;

  DBGrid.Canvas.FillRect(Rect);
  DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Trim(Column.Field.FieldName) = 'EQUIPPARADO') and (Trim(Column.Field.AsString) = 'S') then
  begin
    DBGrid.Canvas.FillRect(Rect);
    ImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'EQUIPPARADO') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    DBGrid.Canvas.FillRect(Rect);
    ImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;

end;

procedure TFrmTelaCadOrdemServicoGerencia.DBGridGetBtnParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor;
  var ASortMarker: TSortMarker; IsDown: Boolean);
const
  Direction: array[boolean] of TSortmarker = (smDown, smUp);
begin
  inherited;
  if Field.FieldName = DBGrid.SortedField then
    ASortMarker := Direction[Ascending]
  else
    ASortMarker := smNone;
end;

procedure TFrmTelaCadOrdemServicoGerencia.DBGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadOrdemServicoGerencia.DBGridKeyPress(Sender: TObject;
  var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (DBGrid.SelectedIndex = 1) then
    begin
      LCampo := DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
      if LCampo <> EmptyStr then
        begin
          if DBGrid.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
            Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
        end;
    end;
  if (Key = #13) and (DBGrid.SelectedIndex = 5) then
    begin
      LCampo :=DM.CampoInputBox('SPMP3', 'Informe a descrição da ordem de serviço:');
      if LCampo <> EmptyStr then
        begin
          ConfigurarFiltros;
          if DBGrid.DataSource.DataSet.Filter = '' then
            DBGrid.DataSource.DataSet.Filter := 'DESCRICAO LIKE ' + QuotedStr('%' + LCampo + '%')
          else
            begin
              DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND DESCRICAO LIKE ' + QuotedStr('%' + LCampo + '%');
            end;
          DBGrid.DataSource.DataSet.Filtered := True;
        end
      else
        ConfigurarFiltros;
    end;
  if (Key = #13) and (DBGrid.SelectedIndex = 3) then
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

procedure TFrmTelaCadOrdemServicoGerencia.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  try
    CliqueNoTitulo(Column, TFDquery(DBGrid.DataSource.DataSet), DBGrid.DataSource.DataSet.Fields[1].Name);
  except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao ordenar o grid. FrmTelaCadOrdemServicoGerencia Linha: 1676', E.ClassName, E.Message);
      Application.MessageBox('Falha ao ordenar o grid operação!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Ficha1Click(Sender: TObject);
begin
  inherited;
if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
  with DM.qryOrdemServico do
    begin
      Close;
      Params[0].AsString := DM.FCodEmpresa;
      Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
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
DmRelatorios.frxROrdemServico.ShowReport();
TimerCheckOS.Enabled := True;
//masio-temp
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
      Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
      Open;
      Edit;
    end;

    TimerCheckOS.Enabled := False;

    Application.CreateForm(TFrmTelaCadOrdemServicoMObraExec, FrmTelaCadOrdemServicoMObraExec);
    FrmTelaCadOrdemServicoMObraExec.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoMObraExec);

    TimerCheckOS.Enabled := True;
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
  TimerCheckOS.Enabled := True;
end;

procedure TFrmTelaCadOrdemServicoGerencia.StatusBar1Resize(Sender: TObject);
begin
  inherited;
//  StatusBar1.Panels[0].Width := ClientWidth - 100;
//  DM.dsOrdemServicoGerenciaDataChange(nil, nil);
end;

procedure TFrmTelaCadOrdemServicoGerencia.TimerCheckOSTimer(Sender: TObject);
var
  hora_atual, diferenca: TDateTime;
  df_hr: TTime;
  dt_ini, dt_final: TDate;
  LTemp, LFirstOS, LNewFirstOS:Integer;
  MyNotification: TNotification;
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
                                          StatusBar1.Panels[4].Text := 'Atualiza em ' +FormatDateTime('nn:ss', diferenca);
                                         // Application.Title := Label1.Caption;
                                          Application.ProcessMessages;
                                      end
                                  else
                                    begin
                                      TThread.Synchronize(TThread.CurrentThread,
                                              procedure
                                              begin
                                                 if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
                                                   begin
                                                     DM.MSGAguarde('ATUALIZANDO');
                                                     Try
                                                       DM.qryOrdemServicoGerencia.First;
                                                       LFirstOS := DM.qryOrdemServicoGerenciaCODIGO.AsInteger;

                                                       if not (DM.qryOrdemServicoGerencia.State in [dsBrowse]) then
                                                         DM.qryOrdemServicoGerencia.Cancel;
                                                       LTemp :=  DM.FSegundosDesliga;

                                                       DM.qryOrdemServicoGerencia.Refresh;
                                                       DM.qryOrdemServicoGerencia.First;

                                                       if (LFirstOS <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)
                                                         and ((TFDQuery(DBGrid.DataSource.DataSet).IndexName = '')
                                                           or (TFDQuery(DBGrid.DataSource.DataSet).IndexName = 'CODIGO_DESC')) then
                                                           begin
                                                             MyNotification := NotificationCenter1.CreateNotification;
                                                             try
                                                               MyNotification.Name := 'SPMP3NewOSNotification';
                                                               MyNotification.Title := 'SPMP3';
                                                               MyNotification.AlertBody := 'Novas ordens de serviço foram emitidas!';

                                                               NotificationCenter1.PresentNotification(MyNotification);
                                                             finally
                                                               MyNotification.Free;
                                                             end;
                                                           end;

                                                       hora_futura := IncMinute(Now, DM.FTempoNovaOS);
                                                     Except
                                                       DM.MSGAguarde('', False);
                                                       Abort;
                                                     End;
                                                     Application.ProcessMessages;
                                                     DM.MSGAguarde('', False);
                                                     DM.FSegundosDesliga := LTemp;
                                                  end;
                                              end);
                                    end;
                                end
                               ).Start;
end;

procedure TFrmTelaCadOrdemServicoGerencia.TimerUpdateTimer(Sender: TObject);
var
  hora_atual, diferenca: TDateTime;
  df_hr: TTime;
  dt_ini, dt_final: TDate;
  LTemp, LFirstOS, LNewFirstOS:Integer;
begin
  inherited;
  hora_atual := Now;
  dt_ini := DateOf(hora_atual);
  dt_final := DateOf(hora_futura);
  diferenca := hora_futura - hora_atual;
  df_hr := TimeOf(diferenca);
 // StatusBar1.Panels[4].Text := 'Atualiza em ' +FormatDateTime('nn:ss', diferenca);
  Application.ProcessMessages;

end;

procedure TFrmTelaCadOrdemServicoGerencia.TotalClick(Sender: TObject);
begin
  inherited;
  if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString <> 'EXECUCAO') then Exit;

  if (Application.MessageBox('Deseja realmente liberar toda a mão de obra e os recursos da OS?','SPMP', MB_YESNO + MB_ICONQUESTION))= IDYes then
  begin
    TimerCheckOS.Enabled := False;

    DM.MSGAguarde('');

    DM.qryDataHoraServidor.Refresh;
    DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

    if (DM.qryOrdemServico.Active = False) or ((DM.qryOrdemServico.Active = True) and (DM.qryOrdemServicoCODIGO.AsInteger <> DM.qryOrdemServicoGerenciaCODIGO.AsInteger)) then
      with DM.qryOrdemServico do
      begin
        Close;
        Params[0].AsString := DM.FCodEmpresa;
        Params[1].AsString := DBGrid.DataSource.DataSet.FieldByName('CODIGO').AsString;
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

    TimerCheckOS.Enabled := True;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerencia.Vencida1Click(Sender: TObject);
begin
  inherited;
  if (DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'CADASTRADA') OR (DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'DETALHADA')
    OR (DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'PROGRAMADA')  OR (DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'REPROGRAMADA')
      OR (DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'DESPROGRAMADA') OR (DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'SOLICITADA') then
      begin
        if (DM.qryOrdemServicoGerenciaCODMANUTPROGEQUIP.AsString <> '') then
        begin
          if Application.MessageBox('Deseja realmente definir a ordem de serviço como vencida?', 'SPMP3', MB_ICONEXCLAMATION + MB_YESNO) = IDYes then
          begin
            DM.qryAuxiliar.Close;
            DM.qryAuxiliar.SQL.Clear;
            DM.qryAuxiliar.SQL.Add('UPDATE `ordemservico` SET `SITUACAO` = ''VENCIDA'' WHERE `CODIGO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';'
                                    + 'UPDATE `manutprogequipamentohist` SET `SITUACAO` = ''VENCIDA'', `REALIZADA` = ''N'' WHERE `CODORDEMSERVICO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';');
            DM.qryAuxiliar.Execute;

            DM.qryOrdemServicoGerencia.Edit;
            DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'VENCIDA';
            DM.qryOrdemServicoGerencia.Post;
          end;
        end else
        if (DM.qryOrdemServicoGerenciaCODLUBRIFICPROGEQUIP.AsString <> '') then
        begin
          if Application.MessageBox('Deseja realmente definir a ordem de serviço como vencida?', 'SPMP3', MB_ICONEXCLAMATION + MB_YESNO) = IDYes then
          begin
            DM.qryAuxiliar.Close;
            DM.qryAuxiliar.SQL.Clear;
            DM.qryAuxiliar.SQL.Add('UPDATE `ordemservico` SET `SITUACAO` = ''VENCIDA'' WHERE `CODIGO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';'
                                    + 'UPDATE `lubrificprogequipamentohist` SET `SITUACAO` = ''VENCIDA'', `REALIZADA` = ''N'' WHERE `CODORDEMSERVICO` = ' + QuotedStr(DM.qryOrdemServicoGerenciaCODIGO.AsString) + ';');
            DM.qryAuxiliar.Execute;

            DM.qryOrdemServicoGerencia.Edit;
            DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'VENCIDA';
            DM.qryOrdemServicoGerencia.Post;
          end;
        end else
        begin
          Application.MessageBox('A ordem de serviço não é um plano de manutenção/lubrificação', 'SPMP3', MB_ICONSTOP + MB_OK);
          Exit;
        end;
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
  TimerCheckOS.Enabled := True;
end;


end.

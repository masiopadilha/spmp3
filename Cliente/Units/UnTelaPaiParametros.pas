unit UnTelaPaiParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.DBCtrls, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Error;

type
  TFrmTelaPaiParametros = class(TForm)
    PControle: TPanel;
    PCentro: TPanel;
    StatusBar1: TStatusBar;
    PAuxiliares: TPanel;
    PopupMenuRelat: TPopupMenu;
    Individual1: TMenuItem;
    Completo1: TMenuItem;
    ActionList1: TActionList;
    TabNextTab1: TNextTab;
    BtnNovo: TButton;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    BtnExcluir: TButton;
    BtnConsultar: TButton;
    BtnImprimir: TButton;
    BtnImagem: TButton;
    BtnAjuda: TButton;
    BtnSair: TButton;
    LCadastroPor: TLabel;
    LblUsuCad: TDBText;
    LAlteracao: TLabel;
    LblUsuAlt: TDBText;
    LCadastro: TLabel;
    LblDataCad: TDBText;
    LAlteradoPor: TLabel;
    LblDataAlt: TDBText;
    MainMenuPadrao: TMainMenu;
    Arquivo1: TMenuItem;
    MmNovo: TMenuItem;
    MmSalvar: TMenuItem;
    MmCancelar: TMenuItem;
    MmExcluir: TMenuItem;
    N1: TMenuItem;
    MmSair: TMenuItem;
    MmExtras: TMenuItem;
    MmConsultar: TMenuItem;
    MmRelatorio: TMenuItem;
    mmAlertas: TMenuItem;
    mmAtivar: TMenuItem;
    mmDesativar: TMenuItem;
    MmAjuda: TMenuItem;
    MmConteudoeIndices: TMenuItem;
    SobreoSPMP1: TMenuItem;
    procedure MostrarValorHint;
    procedure ControleBotoes(Indice: SmallInt);
    procedure MmSalvarClick(Sender: TObject);
    procedure MmSairClick(Sender: TObject);
    procedure MmRelatorioClick(Sender: TObject);
    procedure MmNovoClick(Sender: TObject);
    procedure MmExcluirClick(Sender: TObject);
    procedure MmConteudoeIndicesClick(Sender: TObject);
    procedure MmConsultarClick(Sender: TObject);
    procedure MmCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnAjudaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabNextTab1AfterTabChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    ConsAuxiliar : String;
    { Public declarations }
  end;

var
  FrmTelaPaiParametros: TFrmTelaPaiParametros;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDmRelatorios, UnDM;


procedure TFrmTelaPaiParametros.BtnAjudaClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
HtmlHelp(0, Pchar(ExtractFilePath(Application.ExeName) + 'Ajuda.chm' + '::/C/SPMP-Fontes/SPMP3/Manual/HTML/'+Screen.ActiveForm.Name+'/'+Screen.ActiveForm.Name+'.html'), $0000,0);
end;

procedure TFrmTelaPaiParametros.BtnCancelarClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if DM.FDataSetParam.Active = False then Exit;

with DM.FDataSetParam as TFDQuery do
  begin
    DM.FDataSetParam.Cancel;
    if DM.FDataSetParam.IsEmpty = True then
      begin
        ControleBotoes(0);
        DM.FAlterando := False;
        DM.FDataSetParam.Close;
      end
    else
      begin
        ControleBotoes(2);
        DM.FAlterando := True;
        DM.FDataSetParam.Edit;
      end;
  end;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaPaiParametros.BtnConsultarClick(Sender: TObject);
var
c:SmallInt;
begin
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
Try
  Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
  DM.FNomeConsulta     := Screen.ActiveForm.Caption;
  FrmTelaAuxiliar.Caption := DM.FNomeConsulta;
  FrmTelaAuxiliar.ShowModal;
Finally
  FreeAndNil(FrmTelaAuxiliar);

  LblUsuCad.ShowHint := True;
  if LblUsuCad.DataField <> '' then
    if LblUsuCad.DataSource.DataSet.FieldByName('USUARIOCAD').AsString <> '' then
        LblUsuCad.Hint := LblUsuCad.DataSource.DataSet.FieldByName('USUARIOCAD').AsString
    else
    if LblUsuAlt.DataSource.DataSet.IsEmpty = False then
      LblUsuCad.Hint := 'Nome do usuário não localizado.'
    else
      LblUsuCad.ShowHint := False;

  LblUsuAlt.ShowHint := True;
  if LblUsuAlt.DataField <> '' then
    if LblUsuAlt.DataSource.DataSet.FieldByName('USUARIOALT').AsString <> '' then
        LblUsuAlt.Hint := LblUsuAlt.DataSource.DataSet.FieldByName('USUARIOALT').AsString
    else
    if LblUsuAlt.DataSource.DataSet.IsEmpty = False then
      LblUsuAlt.Hint := 'Nome do usuário não localizado.'
    else
      LblUsuAlt.ShowHint := False;


  For c:=1 to ComponentCount - 1 do
    Begin
      If Components[c] Is TDBEdit Then
        if TDBEdit(Components[c]).Tag = 555 then
          begin
            TDBEdit(Components[c]).ReadOnly := True;
          end;
    End;
End;
DM.FAlterando := True;
if DM.FDataSetParam.IsEmpty = False then
   ControleBotoes(2)
else
   ControleBotoes(0);
end;

procedure TFrmTelaPaiParametros.BtnExcluirClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if DM.FDataSetParam.Active = False then Exit;

if DM.FDataSetParam.IsEmpty = True then Exit;

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
              DM.FDataSetParam.Delete;
              DM.FDataSetParam.Close;
              PAuxiliares.Font.Color := clRed;
              PAuxiliares.Caption := 'REGISTRO EXCLUÍDO COM SUCESSO!!!';
              ControleBotoes(0);
            end;
        Except
          on E: Exception do
          begin
            DM.GravaLog('Falha ao excluir o registro. ' + Screen.ActiveForm.Name + ' ', E.ClassName, E.Message);
            Application.MessageBox('Falha ao excluir o registro!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
          end;
        End;
      end;
  end;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaPaiParametros.BtnImprimirClick(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaPaiParametros.BtnNovoClick(Sender: TObject);
var
c:SmallInt;
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

For c:=1 to ComponentCount - 1 do
    Begin
      If Components[c] Is TDBEdit Then
        if TDBEdit(Components[c]).Tag = 555 then
          begin
            TDBEdit(Components[c]).ReadOnly := False;
          end;
    End;

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

with DM.FDataSetParam as TFDQuery do
  begin
    DM.FDataSetParam.Close;
    DM.FDataSetParam.Open;
    DM.FDataSetParam.Append;
    DM.FDataSetParam.FieldByName('CODUSUARIOCAD').AsString := DM.FCodUsuario;
    DM.FDataSetParam.FieldByName('CODUSUARIOALT').AsString := DM.FCodUsuario;
//    DM.FDataSetParam.FieldByName('USUARIOCAD').AsString := DM.FNomeUsuario;
//    DM.FDataSetParam.FieldByName('USUARIOALT').AsString := DM.FNomeUsuario;
  end;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaPaiParametros.BtnSairClick(Sender: TObject);
begin
//BtnCancelar.OnClick(Sender);
Close;
end;

procedure TFrmTelaPaiParametros.BtnSalvarClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';
PControle.SetFocus;

if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
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

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if DM.FDataSetParam.IsEmpty = True then Exit;

DM.MSGAguarde('');

  try
    if DM.RetornaDataHoraServidor = True then
      begin
        DM.FDataSetParam.Edit;
        if DM.FDataSetParam.FieldByName('DATACADASTRO').IsNull = True then
          DM.FDataSetParam.FieldByName('DATACADASTRO').AsDateTime := DM.FDataHoraServidor;
        DM.FDataSetParam.FieldByName('DATAULTALT').AsDateTime     := DM.FDataHoraServidor;
        DM.FDataSetParam.Post;
        //DM.FDataSetParam.Refresh;
        DM.FDataSetParam.Edit;
      end;
  except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao gravar o registro.' + Screen.ActiveForm.Name + ' ', E.ClassName, E.Message);
      Application.MessageBox('Falha ao gravar o registro!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaPaiParametros.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat.DataSet := DM.qryAuxiliar;
Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
case DM.FTabela_auxiliar of
  4://Centro de Custo
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRCentroCusto.ShowReport();
    end;
  5://Classes
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRClasses.ShowReport();
    end;
  6://Famílias de Equipamentos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFamEquipamento.ShowReport();
    end;
  7://Famílias de Peças de Reposição
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFamPecasRep.ShowReport();
    end;
  8://Famílias de Recursos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFamRecursos.ShowReport();
    end;
  9://Causas de Falhas
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRCausaFalha.ShowReport();
    end;
  10://Tipos de Manutenção
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRTipoManutencao.ShowReport();
    end;
  11://Motivos de Parada
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRMotivoParada.ShowReport();
    end;
  12://Tipos de Programação
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRTipoProgramacao.ShowReport();
    end;
  13://Cargos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRCargos.ShowReport();
    end;
  14://Almoxarifados
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRAlmoxarifado.ShowReport();
    end;
  151://Áreas
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRAreas.ShowReport();
    end;
  19://Feriados
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFeriados.ShowReport();
    end;
  20://Oficinas
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxROficina.ShowReport();
    end;
  21://Fornecedores
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFornecedores.ShowReport();
    end;
  22://Fabricantes
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRfabricantes.ShowReport();
    end;
  23://Calendários de Mão de Obra
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRCalendMObra.ShowReport();
    end;
  24://Calendários de Equipamentos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRCalendEquip.ShowReport();
    end;
  26://Imagens
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRImagens.ShowReport();
    end;
  27://Disponibilidade
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRDispAdmissiveis.ShowReport();
    end;
  29://Usuários
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRUsuarios.ShowReport();
    end;
  39://Contadores
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRContadores.ShowReport();
    end;
  47://Pontos de Inspeção
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRPontosInspecao.ShowReport();
    end;
  48://Medidores
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRContadores.ShowReport();
    end;
  50://Kit de Recursos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRRecursosKitGeral.ShowReport();
    end;
  60://Ausências
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFuncionariosAusencias.ShowReport();
    end;
  61://Ferramentaria
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFerramentariaGeral.ShowReport();
    end;
  62://Kit de Peças de Reposição
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRPecasRepKitGeral.ShowReport();
    end;
  68://Arquivos Técnicos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRArqTecnicoGeral.ShowReport();
    end;
  69://Desenhos Técnicos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRDesTecnicoGeral.ShowReport();
    end;
  71://Informações Mensais de Funcionários
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRDespMensalFuncPerGeral.ShowReport();
    end;
  72://Informações Mensais da Manutenção
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRDespMensalManutGeral.ShowReport();
    end;
  73://Produção Mensal
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRDespMensalProdGeral.ShowReport();
    end;
  74://INformações Diversas
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRDespMensalDiversasGeral.ShowReport();
    end;
  80://Famílias de Pneus
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFamPneus.ShowReport();
    end;
  92://Consertos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRPneusChassiPneusConsertos.ShowReport();
    end;
  95://Trajetos Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRViagensGeral.ShowReport();
    end;
end;
DM.qryAuxiliar.Close;
FreeAndNil(FrmTelaAuxiliar);
end;

procedure TFrmTelaPaiParametros.ControleBotoes(Indice: SmallInt);
begin
  case Indice of
    0://Vazio
      begin
        BtnNovo.Enabled      := True;
        BtnSalvar.Enabled    := False;
        BtnCancelar.Enabled  := False;
        BtnExcluir.Enabled   := False;
        BtnConsultar.Enabled := True;
        BtnSair.Enabled      := True;
      end;
    1://Incluindo
      begin
        BtnNovo.Enabled      := False;
        BtnSalvar.Enabled    := True;
        BtnCancelar.Enabled  := True;
        BtnExcluir.Enabled   := False;
        BtnConsultar.Enabled := False;
        BtnSair.Enabled      := False;
      end;
    2://Consultando_Editando
      begin
        BtnNovo.Enabled      := True;
        BtnSalvar.Enabled    := True;
        BtnCancelar.Enabled  := True;
        BtnExcluir.Enabled   := True;
        BtnConsultar.Enabled := True;
        BtnSair.Enabled      := True;
      end;
  end;
end;

procedure TFrmTelaPaiParametros.FormActivate(Sender: TObject);
begin
DM.FModulo := Screen.ActiveForm.Caption;
//DM.RegistrarMovimentacao('ACESSO', DM.FCodEmpresa, DM.FCodUsuario, DM.FModulo, DM.FEstacao);
end;

procedure TFrmTelaPaiParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if BtnSair.Enabled = False then Abort;

DM.FModulo := Screen.ActiveForm.Caption;
//DM.RegistrarMovimentacao('SAIDA', DM.FCodEmpresa, DM.FCodUsuario, DM.FModulo, DM.FEstacao);

DM.MSGAguarde('', False);
  Try
    Close;
  except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao fechar a tela.' + Screen.ActiveForm.Name + ' ', E.ClassName, E.Message);
      Application.MessageBox('Falha ao fechar a tela!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
      Application.Terminate;
    end;
  End;
end;

procedure TFrmTelaPaiParametros.FormCreate(Sender: TObject);
begin
StatusBar1.Font.Size := 7;
StatusBar1.Panels[0].Text := DM.FNomeUsuario;
StatusBar1.Panels[1].Text := DM.FNivelAcesso;
StatusBar1.Panels[2].Text := DM.FNomeEmpresa;
StatusBar1.Panels[3].Text := DM.FNomeGrupo;

DM.FAlterando := True;
BtnNovo.Enabled := True;
BtnSalvar.Enabled := False;
BtnCancelar.Enabled := False;
BtnExcluir.Enabled := False;
ControleBotoes(0);
end;

procedure TFrmTelaPaiParametros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 27 then
  begin
    if Application.MessageBox('Deseja realmente sair?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
      Close;
  end;
end;

procedure TFrmTelaPaiParametros.FormKeyPress(Sender: TObject; var Key: Char);
begin
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;

If Key = #13 Then
  Try
    Begin
      Key := #0;
      SelectNext(ActiveControl, True, True);
    End;
  Except
    on E: Exception do
    begin
      DM.GravaLog('Não foi possível identificar esse valor, por favor verifique o valor informado.' + Screen.ActiveForm.Name + ' ', E.ClassName, E.Message);
      Application.MessageBox('Falha ao realizar operação!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  End;
end;

procedure TFrmTelaPaiParametros.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
MostrarValorHint;
end;

procedure TFrmTelaPaiParametros.FormPaint(Sender: TObject);
//var
//  altura, coluna: Word;
begin
//  altura := (ClientHeight + 255) div 256;
//    for coluna := 0 to 255 do
//      with Canvas do
//        begin
//          Brush.Color := RGB(coluna, 5, 5); { Modifique para obter cores diferentes }
//          FillRect(Rect(0, coluna * altura, ClientWidth, (coluna + 1) * altura));
//        end;
end;

procedure TFrmTelaPaiParametros.Individual1Click(Sender: TObject);
begin
if DM.FDataSetParam.IsEmpty = True then Exit;
DM.FDataSetRelat.DataSet := DM.FDataSetParam;
case DM.FTabela_auxiliar of
  4: DmRelatorios.frxRCentroCusto.ShowReport();
  5: DmRelatorios.frxRClasses.ShowReport();
  6: DmRelatorios.frxRFamEquipamento.ShowReport();
  7: DmRelatorios.frxRFamPecasRep.ShowReport();
  8: DmRelatorios.frxRFamRecursos.ShowReport();
  9: DmRelatorios.frxRCausaFalha.ShowReport();
 10: DmRelatorios.frxRTipoManutencao.ShowReport();
 11: DmRelatorios.frxRMotivoParada.ShowReport();
 12: DmRelatorios.frxRTipoProgramacao.ShowReport();
 13: DmRelatorios.frxRCargos.ShowReport();
 14: DmRelatorios.frxRAlmoxarifado.ShowReport();
 151:
   begin
     DM.FDataSetRelat.DataSet := DM.qryAuxiliar;
     DM.qryAuxiliar.Close;
     DM.qryAuxiliar.SQL.Clear;
     DM.qryAuxiliar.SQL.Add('SELECT `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`, `celulas`.`CODIGO` AS `CODCELULA`, `celulas`.`DESCRICAO` AS `DESCCELULA`, `linhas`.`CODIGO` AS `CODLINHA`,'
                            + ' `linhas`.`DESCRICAO` AS `DESCLINHA`'
                            + ' FROM `celulas` RIGHT JOIN `areas` ON (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`)'
                            + ' LEFT JOIN `linhas` ON (`celulas`.`CODIGO` = `linhas`.`CODCELULA`) AND (`celulas`.`CODAREA` = `linhas`.`CODAREA`) AND (`celulas`.`CODEMPRESA` = `linhas`.`CODEMPRESA`)'
                            + ' WHERE `areas`.`CODIGO` = '+QuotedStr(DM.qryAreasCODIGO.AsString)+' AND `areas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCAREA`, `DESCCELULA`, `DESCLINHA`');
     DM.qryAuxiliar.Open;
     DmRelatorios.frxRAreas.ShowReport();
   end;
 19: DmRelatorios.frxRFeriados.ShowReport();
 20: DmRelatorios.frxROficina.ShowReport();
 21: DmRelatorios.frxRFornecedores.ShowReport();
 22: DmRelatorios.frxRfabricantes.ShowReport();
 23: DmRelatorios.frxRCalendMObra.ShowReport();
 24: DmRelatorios.frxRCalendEquip.ShowReport();
 26: DmRelatorios.frxRImagens.ShowReport();
 27: DmRelatorios.frxRDispAdmissiveis.ShowReport();
 29: DmRelatorios.frxRUsuarios.ShowReport();
 47: DmRelatorios.frxRPontosInspecao.ShowReport();
 48: DmRelatorios.frxRContadores.ShowReport();
 60: DmRelatorios.frxRFuncionariosAusencias.ShowReport();
 80: DmRelatorios.frxRFamPneus.ShowReport();
 92: DmRelatorios.frxRPneusChassiPneusConsertos.ShowReport();
501: DmRelatorios.frxRRecursosKitIndividual.ShowReport();
611: DmRelatorios.frxRFerramentariaIndividual.ShowReport();
621: DmRelatorios.frxRPecasRepKitIndividual.ShowReport();
671: DmRelatorios.frxRDespMensalFuncPerIndividual.ShowReport();
681: DmRelatorios.frxRArqTecnicoIndividual.ShowReport();
691: DmRelatorios.frxRDesTecnicoIndividual.ShowReport();
721: DmRelatorios.frxRDespMensalManutIndividual.ShowReport();
731: DmRelatorios.frxRDespMensalProdIndividual.ShowReport();
741: DmRelatorios.frxRDespMensalDiversasIndividual.ShowReport();
951: DmRelatorios.frxRViagensIndividual.ShowReport();
end;
DM.FDataSetParam.Edit;
end;

procedure TFrmTelaPaiParametros.MmCancelarClick(Sender: TObject);
begin
BtnCancelar.OnClick(Sender);
end;

procedure TFrmTelaPaiParametros.MmConsultarClick(Sender: TObject);
begin
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaPaiParametros.MmConteudoeIndicesClick(Sender: TObject);
begin
BtnAjuda.OnClick(Sender);
end;

procedure TFrmTelaPaiParametros.MmExcluirClick(Sender: TObject);
begin
BtnExcluir.OnClick(Sender);
end;

procedure TFrmTelaPaiParametros.MmNovoClick(Sender: TObject);
begin
BtnNovo.OnClick(Sender);
end;

procedure TFrmTelaPaiParametros.MmRelatorioClick(Sender: TObject);
begin
BtnImprimir.OnClick(Sender);
end;

procedure TFrmTelaPaiParametros.MmSairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmTelaPaiParametros.MmSalvarClick(Sender: TObject);
begin
BtnSalvar.OnClick(Sender);
end;

procedure TFrmTelaPaiParametros.MostrarValorHint;
var
c:Integer;
begin
    For c:=1 to ComponentCount - 1 do
        Begin
          If Components[c] Is TDBEdit Then
            begin
              if TDBEdit(Components[c]).Field = nil then Exit;

              if TDBEdit(Components[c]).DataField = EmptyStr then Exit;
              TDBEdit(Components[c]).ShowHint := True;
              if TDBEdit(Components[c]).DataField <> EmptyStr then
                  TDBEdit(Components[c]).Hint := TDBEdit(Components[c]).DataSource.DataSet.FieldByName(TDBEdit(Components[c]).Field.FieldName).AsString;
            end;
          If Components[c] Is TDbLookupComboBox Then
            begin
              if TDbLookupComboBox(Components[c]).Field = nil then Exit;

              if TDbLookupComboBox(Components[c]).DataField = EmptyStr then Exit;
              TDbLookupComboBox(Components[c]).ShowHint := True;
              if TDbLookupComboBox(Components[c]).ListField <> EmptyStr then
                TDbLookupComboBox(Components[c]).Hint := TDbLookupComboBox(Components[c]).ListSource.DataSet.FieldByName(TDbLookupComboBox(Components[c]).ListField).AsString;
            end;
        End;
end;

procedure TFrmTelaPaiParametros.TabNextTab1AfterTabChange(Sender: TObject);
begin
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

end.

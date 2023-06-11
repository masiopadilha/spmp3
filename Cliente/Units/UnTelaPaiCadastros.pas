unit UnTelaPaiCadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Data.DB, DataSnap.DBClient,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, Data.SqlExpr, FireDAC.Comp.Client,
  Vcl.Buttons;

type
  TFrmTelaPaiCadastros = class(TForm)
    MainMenuPadrao: TMainMenu;
    Arquivo1: TMenuItem;
    MmNovo: TMenuItem;
    MmSalvar: TMenuItem;
    MmCancelar: TMenuItem;
    MmExcluir: TMenuItem;
    N1: TMenuItem;
    MmSair: TMenuItem;
    Registro1: TMenuItem;
    MmPrimeiro: TMenuItem;
    MmAnterior: TMenuItem;
    MmProximo: TMenuItem;
    MmUltimo: TMenuItem;
    MmExtras: TMenuItem;
    MmConsultar: TMenuItem;
    MmRelatorio: TMenuItem;
    mmAlertas: TMenuItem;
    mmAtivar: TMenuItem;
    mmDesativar: TMenuItem;
    MmAjuda: TMenuItem;
    MmConteudoeIndices: TMenuItem;
    SobreoSPMP1: TMenuItem;
    PControle: TPanel;
    PIdentificacao: TPanel;
    PProgramacao: TPanel;
    PDiversos: TPanel;
    LCadastro: TLabel;
    LCadastroPor: TLabel;
    LblDataCad: TDBText;
    LblUsuCad: TDBText;
    LAlteracao: TLabel;
    LAlteradoPor: TLabel;
    LblDataAlt: TDBText;
    LblUsuAlt: TDBText;
    TimerLetreiro: TTimer;
    TimerAlertas: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnNovo: TButton;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    BtnExcluir: TButton;
    BtnConsultar: TButton;
    BtnImprimir: TButton;
    BtnAjuda: TButton;
    BtnSair: TButton;
    Oculto1: TMenuItem;
    Botao11: TMenuItem;
    Botao21: TMenuItem;
    Botao31: TMenuItem;
    Botao41: TMenuItem;
    Botao51: TMenuItem;
    Botao61: TMenuItem;
    PopupMenuRelat: TPopupMenu;
    Individual1: TMenuItem;
    Completo1: TMenuItem;
    StatusBar1: TStatusBar;
    PAlertas: TPanel;
    LblAlertas: TLabel;
    PBase: TPanel;
    BtnMais: TButton;
    PAuxiliares: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ActionList1: TActionList;
    TabNextTab1: TNextTab;
    BtnImagem: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure MostrarValorHint;
    procedure ControleBotoes(Indice: SmallInt);

    function ObservacoesInputBox(const ACaption, APrompt:string): string;

    procedure PIdentificacaoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure TimerLetreiroTimer(Sender: TObject);
    procedure TimerAlertasTimer(Sender: TObject);
    procedure PAlertasDblClick(Sender: TObject);
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
    procedure BtnMaisClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAjudaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Botao11Click(Sender: TObject);
    procedure Botao21Click(Sender: TObject);
    procedure Botao31Click(Sender: TObject);
    procedure Botao41Click(Sender: TObject);
    procedure Botao51Click(Sender: TObject);
    procedure Botao61Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure TabNextTab1AfterTabChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaPaiCadastros: TFrmTelaPaiCadastros;


implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaPrincipal,
  UnDmRelatorios, UnDM;


function TFrmTelaPaiCadastros.ObservacoesInputBox(const ACaption, APrompt:string): string;
var
Form: TForm; Prompt: TLabel; DBMemo: TDBMemo; DialogUnits: TPoint;
ButtonTop, ButtonWidth, ButtonHeight: Integer; Value: string;
I: Integer; Buffer: array[0..51] of Char;
begin
  Result := EmptyStr;
  Form := TForm.Create(Application);
  with Form do
    Try
      Canvas.Font := Font; For I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
      For I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
      DialogUnits.X := DialogUnits.X div 52; BorderStyle := bsDialog; Caption := ACaption;
      ClientWidth := MulDiv(300, DialogUnits.X, 4);  ClientHeight := MulDiv(178, DialogUnits.Y, 8);
      Position := poScreenCenter; Prompt := TLabel.Create(Form);
      with Prompt do
        begin
         Parent := Form; AutoSize := True; Left := MulDiv(8, DialogUnits.X, 4); Top := MulDiv(8, DialogUnits.Y, 8);
         Caption := APrompt;
        end;
      DBMemo := TDBMemo.Create(Form);
      with DBMemo do
        begin
          Parent := Form; Left := Prompt.Left; Top := MulDiv(18, DialogUnits.Y, 8); Width := MulDiv(285, DialogUnits.X, 4);
          Height := MulDiv(177, DialogUnits.X, 4); DataSource := DM.FDataSourceParam; DataField := 'OBSERVACOES';
          ScrollBars := ssVertical; Tag := 99; ScrollBars := ssBoth; SelectAll;
          if DBMemo.DataSource.DataSet.State in [dsBrowse] then DBMemo.ReadOnly := True
          else DBMemo.ReadOnly := False;
        end;
      ButtonTop := MulDiv(158, DialogUnits.Y, 8); ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
        begin
         Parent := Form; Caption := 'OK'; ModalResult := mrOk; Default := True;
         SetBounds(MulDiv(120, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      if ShowModal = mrOk then
        begin
         Value  := DBMemo.Text; Result := Value;
        end;
    Finally
      FreeAndNil(Form);
    End;
end;

procedure TFrmTelaPaiCadastros.MostrarValorHint;
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
              if TDbLookupComboBox(Components[c]).DataField = EmptyStr then Exit;
              TDbLookupComboBox(Components[c]).ShowHint := True;
              if TDbLookupComboBox(Components[c]).ListField <> EmptyStr then
                TDbLookupComboBox(Components[c]).Hint := TDbLookupComboBox(Components[c]).ListSource.DataSet.FieldByName(TDbLookupComboBox(Components[c]).ListField).AsString;
            end;
        End;
end;

procedure TFrmTelaPaiCadastros.PAlertasDblClick(Sender: TObject);
begin
LblAlertas.Left := PAlertas.Width;
if TimerLetreiro.Enabled = True then
  begin
    TimerLetreiro.Enabled := False;
    TimerAlertas.Enabled  := False;
  end
else
  begin
    TimerLetreiro.Enabled := True;
    TimerAlertas.Enabled  := True;
  end;
end;

procedure TFrmTelaPaiCadastros.PIdentificacaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
MostrarValorHint;
end;

procedure TFrmTelaPaiCadastros.TabNextTab1AfterTabChange(Sender: TObject);
begin
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaPaiCadastros.TimerAlertasTimer(Sender: TObject);
begin
//UnFuncoesSPMP.Alertas;
end;

procedure TFrmTelaPaiCadastros.TimerLetreiroTimer(Sender: TObject);
begin
if LblAlertas.left >= -(LblAlertas.Width) then
  LblAlertas.left := LblAlertas.left-1
else
  LblAlertas.left := PAlertas.width;
end;

procedure TFrmTelaPaiCadastros.Botao11Click(Sender: TObject);
begin
Button1.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.Botao21Click(Sender: TObject);
begin
Button2.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.Botao31Click(Sender: TObject);
begin
Button3.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.Botao41Click(Sender: TObject);
begin
Button4.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.Botao51Click(Sender: TObject);
begin
Button5.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.Botao61Click(Sender: TObject);
begin
Button6.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.BtnAjudaClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
HtmlHelp(0, Pchar(ExtractFilePath(Application.ExeName) + 'Ajuda.chm' + '::/C/SPMP-Fontes/SPMP3/Manual/HTML/'+Screen.ActiveForm.Name+'/'+Screen.ActiveForm.Name+'.html'), $0000,0);
end;

procedure TFrmTelaPaiCadastros.BtnCancelarClick(Sender: TObject);
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

procedure TFrmTelaPaiCadastros.BtnConsultarClick(Sender: TObject);
var
c:SmallInt;
begin
DM.FMinutosInativo  := 0;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption    := EmptyStr;
Try
  Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
  DM.FNomeConsulta     := 'Consulta de: ' + Screen.ActiveForm.Caption;
  DM.FModulo           := DM.FNomeConsulta;
  FrmTelaAuxiliar.Caption := DM.FModulo;
  FrmTelaAuxiliar.ShowModal;
Finally
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

  FreeAndNil(FrmTelaAuxiliar);

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

procedure TFrmTelaPaiCadastros.BtnExcluirClick(Sender: TObject);
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
          PAuxiliares.Caption := EmptyStr;
        End;
      end;
  end;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaPaiCadastros.BtnImprimirClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaPaiCadastros.BtnMaisClick(Sender: TObject);
begin
  Try
    ObservacoesInputBox('SPMP','Observações:');
  Except
    Application.MessageBox('Não foi possível abrir a caixa de diálogo de mais informações!','SPMP', MB_OK + MB_ICONERROR);
  End;
end;

procedure TFrmTelaPaiCadastros.BtnNovoClick(Sender: TObject);
var
c:SmallInt;
begin
DM.FMinutosInativo  := 0;
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
    DM.FDataSetParam.Open();
    DM.FDataSetParam.EmptyDataSet;
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

procedure TFrmTelaPaiCadastros.BtnSairClick(Sender: TObject);
begin
//BtnCancelar.OnClick(Sender);
Close;
end;

procedure TFrmTelaPaiCadastros.BtnSalvarClick(Sender: TObject);
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

with DM.FDataSetParam do
  begin
    if DM.RetornaDataHoraServidor = True then
      begin

        DM.FDataSetParam.Edit;
        if DM.FDataSetParam.FieldByName('DATACADASTRO').IsNull = True then
          DM.FDataSetParam.FieldByName('DATACADASTRO').AsDateTime := DM.FDataHoraServidor;
        DM.FDataSetParam.FieldByName('DATAULTALT').AsDateTime     := DM.FDataHoraServidor;
        DM.FDataSetParam.FieldByName('CODUSUARIOALT').AsString    := DM.FCodUsuario;
        DM.FDataSetParam.Post;
        DM.FDataSetParam.Edit;
      end;
  end;

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageIndex := 2;
DM.MSGAguarde('', False);
end;

procedure TFrmTelaPaiCadastros.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat.DataSet := DM.qryAuxiliar;
Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
case DM.FTabela_auxiliar of
  25://Equipamento Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxREquipGeral.ShowReport();
    end;
  30://Funcionários Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRFuncionariosGeral.ShowReport();
    end;
  32://Manutenção Programada do Equipamento Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRManutProgEquipGeral.ShowReport();
    end;
  33://Lubrificação Programada do Equipamento Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRLubrificProgEquipGeral.ShowReport();
    end;
  34://Manutenção de Família Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRManutFamEquipGeral.ShowReport();
    end;
  35://Lubrificação de Família Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRLubrificFamEquipGeral.ShowReport();
    end;
  36://Peças de Reposição Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRPecasRepGeral.ShowReport();
    end;
  40://Solicitação de Trabalho Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRSolicTrabalhoGeral.ShowReport();
    end;
  41://Plano de Trabalho Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRPlanoTrabalhoGeral.ShowReport();
    end;
  46://Recursos
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRRecursosGeral.ShowReport();
    end;
  64://Lubrificantes Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRLubrificantesGeral.ShowReport();
    end;
  65://Ordem de Serviço de Terceiro Fora Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxROrdemServicoTercForaGeral.ShowReport();
    end;
  78://Abastecimentos Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRAbastecimentosGeral.ShowReport();
    end;
  83://Pneus Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRPneuGeral.ShowReport();
    end;
  84://Rota de Equipamento Geral
    begin
      FrmTelaAuxiliar.BtnConsultar.OnClick(Sender);
      DmRelatorios.frxRRotaGeral.ShowReport();
    end;
end;
end;

procedure TFrmTelaPaiCadastros.ControleBotoes(Indice: SmallInt);
begin
  case Indice of
    0://Vazio
      begin
        BtnNovo.Enabled      := True;
        BtnSalvar.Enabled    := False;
        BtnCancelar.Enabled  := False;
        BtnExcluir.Enabled   := False;
        BtnConsultar.Enabled := True;
        BtnImagem.Enabled    := False;
        BtnSair.Enabled      := True;
        Button1.Enabled      := True;
        Button2.Enabled      := True;
        Button3.Enabled      := True;
        Button4.Enabled      := True;
        Button5.Enabled      := True;
        Button6.Enabled      := True;
      end;
    1://Incluindo
      begin
        BtnNovo.Enabled      := False;
        BtnSalvar.Enabled    := True;
        BtnCancelar.Enabled  := True;
        BtnExcluir.Enabled   := False;
        BtnConsultar.Enabled := False;
        BtnImagem.Enabled    := False;
        BtnSair.Enabled      := False;

        Button1.Enabled      := False;
        Button2.Enabled      := False;
        Button3.Enabled      := False;
        Button4.Enabled      := False;
        Button5.Enabled      := False;
        Button6.Enabled      := False;
      end;
    2://Consultando_Editando
      begin
        BtnNovo.Enabled      := True;
        BtnSalvar.Enabled    := True;
        BtnCancelar.Enabled  := True;
        BtnExcluir.Enabled   := True;
        BtnConsultar.Enabled := True;
        BtnImagem.Enabled    := True;
        BtnSair.Enabled      := True;

        Button1.Enabled      := True;
        Button2.Enabled      := True;
        Button3.Enabled      := True;
        Button4.Enabled      := True;
        Button5.Enabled      := True;
        Button6.Enabled      := True;
      end;
  end;
end;

procedure TFrmTelaPaiCadastros.FormActivate(Sender: TObject);
begin
DM.FModulo := Screen.ActiveForm.Caption;
//DM.RegistrarMovimentacao('ACESSO', DM.FCodEmpresa, DM.FCodUsuario, DM.FModulo, DM.FEstacao);
end;

procedure TFrmTelaPaiCadastros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if BtnSair.Enabled = False then Abort;

DM.FModulo := Screen.ActiveForm.Caption;
//DM.RegistrarMovimentacao('SAIDA', DM.FCodEmpresa, DM.FCodUsuario, DM.FModulo, DM.FEstacao);

DM.MSGAguarde('', False);
  Try
    Close;
  Except
    Application.MessageBox('O SPMP encontrou um problema e precisa ser fechado!','SPMP', MB_OK + MB_ICONERROR);
    Application.Terminate;
  End;
end;

procedure TFrmTelaPaiCadastros.FormCreate(Sender: TObject);
begin
StatusBar1.Font.Size := 9;
StatusBar1.Panels[0].Text := DM.FNomeUsuario;
StatusBar1.Panels[1].Text := DM.FNivelAcesso;
StatusBar1.Panels[2].Text := DM.FNomeEmpresa;
StatusBar1.Panels[3].Text := DM.FNomeGrupo;

LblAlertas.Caption := FrmTelaPrincipal.LblAlertas.Caption;
DM.FAlterando := True;
//DM.FDataHoraServidor := DM.DataHoraServidor;
ControleBotoes(0);
end;

procedure TFrmTelaPaiCadastros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
    27:
      begin
        if Application.MessageBox('Deseja realmente sair?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
          Close;
      end;
   118: Button1.OnClick(Sender);
   119: Button2.OnClick(Sender);
   120: Button3.OnClick(Sender);
   121: Button4.OnClick(Sender);
   122: Button5.OnClick(Sender);
   123: Button6.OnClick(Sender);
  end;
end;

procedure TFrmTelaPaiCadastros.FormKeyPress(Sender: TObject; var Key: Char);
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
    Begin
      Application.MessageBox('Não foi possível identificar esse valor, por favor verifique o valor informado.','SPMP',MB_OK + MB_ICONERROR);
    End;
  End;
end;

procedure TFrmTelaPaiCadastros.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//if DM.FDConnSPMP3.ConnectionState <> csStateClosed then
//  begin
//    if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
//    else BtnSalvar.ImageIndex := 2;
//  end;

MostrarValorHint;
end;

procedure TFrmTelaPaiCadastros.Individual1Click(Sender: TObject);
begin
if DM.FDataSetParam.IsEmpty = True then Exit;
DM.FDataSetRelat.DataSet := DM.FDataSetParam;
case DM.FTabela_auxiliar of
  251: DmRelatorios.frxREquipIndividual.ShowReport();
  301: DmRelatorios.frxRFuncionariosIndividual.ShowReport();
  321: DmRelatorios.frxRManutProgEquipIndividual.ShowReport();
  331: DmRelatorios.frxRLubrificProgEquipIndividual.ShowReport();
  341: DmRelatorios.frxRManutFamEquipIndividual.ShowReport();
  351: DmRelatorios.frxRLubrificFamEquipIndividual.ShowReport();
  361: DmRelatorios.frxRPecasRepIndividual.ShowReport();
  401: DmRelatorios.frxRSolicTrabalhoIndividual.ShowReport();
  411: DmRelatorios.frxRPlanoTrabalhoIndividual.ShowReport();
  451: DmRelatorios.frxROrdemServico.ShowReport();   //masio-temp
  461: DmRelatorios.frxRRecrusosIndividual.ShowReport();
  641: DmRelatorios.frxRLubrificantesIndividual.ShowReport();
  651: DmRelatorios.frxROrdemServicoTercFora.ShowReport();
  781: DmRelatorios.frxRAbastecimentosIndividual.ShowReport();
  831: DmRelatorios.frxRPneuIndividual.ShowReport();
  841: DmRelatorios.frxRRotaIndividual.ShowReport();
end;
DM.FDataSetParam.Edit;
end;

procedure TFrmTelaPaiCadastros.MmCancelarClick(Sender: TObject);
begin
BtnCancelar.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.MmConsultarClick(Sender: TObject);
begin
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.MmConteudoeIndicesClick(Sender: TObject);
begin
BtnAjuda.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.MmExcluirClick(Sender: TObject);
begin
BtnExcluir.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.MmNovoClick(Sender: TObject);
begin
BtnNovo.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.MmRelatorioClick(Sender: TObject);
begin
BtnImprimir.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.MmSairClick(Sender: TObject);
begin
BtnSair.OnClick(Sender);
end;

procedure TFrmTelaPaiCadastros.MmSalvarClick(Sender: TObject);
begin
BtnSalvar.SetFocus;
BtnSalvar.OnClick(Sender);
end;

end.


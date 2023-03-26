unit UnTelaAuditoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, System.StrUtils, Vcl.Mask, JvExMask, JvToolEdit, System.DateUtils,
  frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF, System.Win.Registry, System.IniFiles,
  Vcl.DBCtrls, JvDBControls;

type
  TFrmTelaAuditoria = class(TFrmTelaPaiOKCancel)
    FDConnSPMP3Audit: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryAuditoria: TFDQuery;
    dsAuditoria: TDataSource;
    qryAuditoriaid: TFDAutoIncField;
    qryAuditoriatabela: TStringField;
    qryAuditoriaacao: TStringField;
    qryAuditoriaestacao: TStringField;
    qryAuditoriausuario: TStringField;
    qryAuditoriadata_hora: TDateTimeField;
    qryAuditoriaantes: TStringField;
    qryAuditoriadepois: TStringField;
    PGrid: TPanel;
    PMemos: TPanel;
    PAntes: TPanel;
    Label5: TLabel;
    PDepois: TPanel;
    Label6: TLabel;
    JvDBGridLista: TJvDBGrid;
    qryAuditoriaid_registro: TStringField;
    qryAuditoriaid_empresa: TStringField;
    qryAuditoriaTABELANOME: TStringField;
    pSearchBox: TPanel;
    PConsulta: TPanel;
    LblAcao: TLabel;
    LblEstacao: TLabel;
    lblUsuario: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    BtnConsultar: TButton;
    qryUsuarios: TFDQuery;
    qryUsuariosCODIGO: TStringField;
    qryUsuariosCODEMPRESA: TStringField;
    qryUsuariosMATRICULA: TStringField;
    qryUsuariosNOME: TStringField;
    qryUsuariosSENHA: TStringField;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    BtnImprimir: TButton;
    qryAuditoriaANTESORG: TStringField;
    qryAuditoriaDEPOISORG: TStringField;
    Label2: TLabel;
    FDMemTConsulta: TFDMemTable;
    FDMemTConsultaTABELA: TStringField;
    FDMemTConsultaACAO: TStringField;
    FDMemTConsultaESTACAO: TStringField;
    FDMemTConsultaCODUSUARIO: TStringField;
    FDMemTConsultaLOGIN: TStringField;
    FDMemTConsultaDATA1: TDateTimeField;
    FDMemTConsultaDATA2: TDateTimeField;
    cbTabelaNome: TDBComboBox;
    dsFDMemTConsulta: TDataSource;
    cbAcao: TDBComboBox;
    edtEstacao: TDBEdit;
    dedtDataCons1: TJvDBDateEdit;
    dedtDataCons2: TJvDBDateEdit;
    cbUsuario: TDBLookupComboBox;
    mAntes: TDBMemo;
    mDepois: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PCentroResize(Sender: TObject);
    procedure PMemosResize(Sender: TObject);
    procedure qryAuditoriaAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure qryAuditoriaCalcFields(DataSet: TDataSet);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure JvDBGridListaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGridListaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnAjudaClick(Sender: TObject);
  private
//    LAuditCodRegistro, LAuditCodEmpresa: String;

    function ArrayString(S : String; separador : char): TStringList;
    function ValidaTabelaEscolhida(Texto:String):String;
    function ValidaTelaEscolhida(Texto:String):String;

    procedure AjustaLarguraMinTituloGrid(var aGrid: TJvDBGrid);
    procedure BuscarDadosMemos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaAuditoria: TFrmTelaAuditoria;
  memoantes, memodepois: String;


implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaAuditoria.AjustaLarguraMinTituloGrid(var aGrid: TJvDBGrid);
var
  I: Integer;
begin
  for I := 0 to aGrid.Columns.Count - 1 do
    begin
      if (Length(aGrid.Columns[i].Title.Caption) > 0) and (((aGrid.Columns[i].Width) - 10) / (Length(aGrid.Columns[i].Title.Caption)) < 10) then
        aGrid.Columns[i].Width := (length(aGrid.Columns[i].Title.Caption) * 10) + 15;
    end;
  aGrid.Refresh;
end;

function TFrmTelaAuditoria.ArrayString(S : String; separador : char): TStringList;
var
  conta : integer;
  resultado : TStringList;
  Saux : string;
begin
  resultado := TStringList.Create;
  conta := pos(separador,S);
  if conta <> 0 then
    begin
      while trim(S) <> '' do
        begin
          Saux := copy(S,1,conta-1);
          delete(S,1,conta);
          if conta = 0 then
            begin
              Saux := S;
              S := '';
            end;
          resultado.Add(Saux);
          conta := pos(separador,S);
        end;
    end
  else
    begin
      Saux := S;
      resultado.Add(Saux);
    end;
  Result := resultado;
end;

procedure TFrmTelaAuditoria.BtnAjudaClick(Sender: TObject);
begin
//  inherited;
HtmlHelp(0, Pchar(ExtractFilePath(Application.ExeName) + 'Ajuda.chm' + '::C/SPMP-Fontes/SPMP3/Manual/HTML/Controle de usuários/'+Screen.ActiveForm.Name+'/'+Screen.ActiveForm.Name+'.html'), $0000,0);
end;

procedure TFrmTelaAuditoria.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  if dedtDataCons1.Date <= 0 then Exit;
  if dedtDataCons2.Date <= 0 then Exit;

  FDMemTConsulta.Post;
  FDMemTConsulta.Edit;

  qryAuditoria.Close();
  qryAuditoria.SQL.Clear;
  qryAuditoria.SQL.Text := 'SELECT `id`, `id_registro`, `id_empresa`, `tabela`, `acao`, `estacao`, `usuario`, `data_hora`, `antes`, `depois` FROM `spmpma_spmp.backups`.`auditoria`';
  qryAuditoria.SQL.Add(' WHERE `data_hora` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', FDMemTConsultaDATA1.AsDateTime)) + ',''%Y/%m/%d'') AND `data_hora` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd t', IncMinute(dedtDataCons2.Date, 1439))) + ',''%Y/%m/%d %T'')');
  if (cbTabelaNome.Text <> '') then
    qryAuditoria.SQL.Add(' AND `tabela` = ' + QuotedStr(ValidaTabelaEscolhida(FDMemTConsultaTABELA.AsString)));
  if (cbAcao.Text <> '') then
    begin
      if cbAcao.ItemIndex = 1 then qryAuditoria.SQL.Add(' AND `acao` = ''insert''');
      if cbAcao.ItemIndex = 2 then qryAuditoria.SQL.Add(' AND `acao` = ''update''');
      if cbAcao.ItemIndex = 3 then qryAuditoria.SQL.Add(' AND `acao` = ''delete''');
    end;
  if (edtEstacao.Text <> '') then
    qryAuditoria.SQL.Add(' AND `estacao` = ' + QuotedStr(FDMemTConsultaESTACAO.AsString));
  if (cbUsuario.Text <> '') then
    qryAuditoria.SQL.Add(' AND `usuario` = ' + QuotedStr(FDMemTConsultaCODUSUARIO.AsString));
  qryAuditoria.SQL.Add(' ORDER BY `data_hora` DESC');
  qryAuditoria.Open();

  AjustaLarguraMinTituloGrid(JvDBGridLista);
end;

procedure TFrmTelaAuditoria.BtnImprimirClick(Sender: TObject);
begin
  inherited;
 if qryAuditoria.Active = False then Exit;

 frxReport1.ShowReport();
end;

procedure TFrmTelaAuditoria.Button1Click(Sender: TObject);
//var
//  nPosicao: Integer;
//  sProcura: String;
//  nContador: Integer;
//
//   Lista: TStringList;
begin
  inherited;
//  Memo1.Clear;
//  sProcura := mAntes.Text;
//
//  nPosicao := 0;
//  nContador := 1;
//  While nContador < Length(sProcura) do
//    begin
//      nPosicao := PosEx(':', sProcura,nContador);
//      if nPosicao > 0  then
//         begin
//           Memo1.Lines.add(Trim(Copy(sProcura, nContador, nPosicao - nContador)));
//           nContador := nPosicao;
//         end;
//      Inc(nContador);
//    end;

//  Edit1.Text := 'a:00:1A:73:DE:02:6A;10.60.0.3;loja;1500;200';
//  Edit1.Text := mAntes.Lines.Text;
//  Memo1.Clear;
//
//  Lista := TStringList.Create;
//  Lista.Delimiter := ':';
//  Lista.DelimitedText := Edit1.Text;
//
//  Memo1.Lines.AddStrings(Lista);
//  ShowMessage(Memo1.Lines[1]);
end;

procedure TFrmTelaAuditoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FDMemTConsulta.Close;
  qryAuditoria.Close;
  DM.qryUsuariosAudit.Close;
end;

procedure TFrmTelaAuditoria.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  Registro: TRegistry;
begin
  inherited;
  FDMemTConsulta.Close; FDMemTConsulta.CreateDataSet; FDMemTConsulta.Edit;

  if FileExists(ExtractFilePath(Application.ExeName) + 'spmp.ini') then
    begin
      Ini :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'spmp.ini');
      FDConnSPMP3Audit.Params.Values['Database']  := DM.FDatabase;
      FDConnSPMP3Audit.Params.Values['User_Name'] := DM.FUserName;
      FDConnSPMP3Audit.Params.Values['Password']  := DM.Crypt('D', (Ini.ReadString( 'Conexao', 'Password', '')));
      FDConnSPMP3Audit.Params.Values['Server']    := DM.FHost;
      FDConnSPMP3Audit.Params.Values['Port']      := DM.FPort;
    end
  else
    begin
      Registro := TRegistry.Create;
      Registro.RootKey := HKEY_LOCAL_MACHINE;
      if registro.OpenKey('Software\SPMP3',true) then
        begin
          FDConnSPMP3Audit.Params.Values['Database']  := DM.FDatabase;
          FDConnSPMP3Audit.Params.Values['User_Name'] := DM.FUserName;
          FDConnSPMP3Audit.Params.Values['Password']  := DM.Crypt('D', (Registro.ReadString('Password')));
          FDConnSPMP3Audit.Params.Values['Server']    := DM.FHost;
          FDConnSPMP3Audit.Params.Values['Port']      := DM.FPort;
        end;
      registro.CloseKey;
      registro.Free;
    end;


//  qryUsuarios.Close;
//  qryUsuarios.Params[0].AsString := DM.FCodEmpresa;
//  qryUsuarios.Open();
//  cbUsuario.Items.Add('');
//  while not qryUsuarios.Eof = True do
//    begin
//      cbUsuario.Items.Add(qryUsuariosCODIGO.AsString);
//
//      qryUsuarios.Next;
//    end;
//  qryUsuarios.Close;

  DM.qryUsuariosAudit.Close;
  DM.qryUsuariosAudit.Params[0].AsString := DM.FCodEmpresa;
  DM.qryUsuariosAudit.Open;
end;

procedure TFrmTelaAuditoria.JvDBGridListaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  qryAuditoria.FieldByName('id').Visible               := False;
  qryAuditoria.FieldByName('id_empresa').Visible       := False;
  qryAuditoria.FieldByName('tabela').Visible           := False;
  qryAuditoria.FieldByName('antes').Visible            := False;
  qryAuditoria.FieldByName('depois').Visible           := False;
  qryAuditoria.FieldByName('antesorg').Visible         := False;
  qryAuditoria.FieldByName('depoisorg').Visible        := False;

  JvDBGridLista.Columns[0].Title.Alignment             := taCenter;
  JvDBGridLista.Columns[0].Alignment                   := taCenter;
  qryAuditoria.FieldByName('id_registro').DisplayLabel := 'Id';
  qryAuditoria.FieldByName('id_registro').DisplayWidth := 5;

  JvDBGridLista.Columns[1].Title.Alignment             := taCenter;
  JvDBGridLista.Columns[1].Alignment                   := taCenter;
  qryAuditoria.FieldByName('TABELANOME').DisplayLabel  := 'Tabela';
  qryAuditoria.FieldByName('TABELANOME').Index         := 4;
  qryAuditoria.FieldByName('TABELANOME').DisplayWidth  := 25;

  JvDBGridLista.Columns[2].Title.Alignment             := taCenter;
  JvDBGridLista.Columns[2].Alignment                   := taCenter;
  qryAuditoria.FieldByName('acao').DisplayLabel        := 'Ação';
  qryAuditoria.FieldByName('acao').DisplayWidth        := 10;

  JvDBGridLista.Columns[3].Title.Alignment             := taCenter;
  JvDBGridLista.Columns[3].Alignment                   := taCenter;
  qryAuditoria.FieldByName('estacao').DisplayLabel     := 'Estação';
  qryAuditoria.FieldByName('estacao').DisplayWidth     := 18;

  JvDBGridLista.Columns[4].Title.Alignment             := taCenter;
  JvDBGridLista.Columns[4].Alignment                   := taCenter;
  qryAuditoria.FieldByName('usuario').DisplayLabel     := 'Usuário';
  qryAuditoria.FieldByName('usuario').DisplayWidth     := 10;

  JvDBGridLista.Columns[5].Title.Alignment             := taCenter;
  JvDBGridLista.Columns[5].Alignment                   := taCenter;
  TDateTimeField(qryAuditoria.FieldByName('data_hora')).DisplayFormat := 'dd/mm/yyyy hh:mm';
  TDateTimeField(qryAuditoria.FieldByName('data_hora')).DisplayWidth  := 12;
  TDateTimeField(qryAuditoria.FieldByName('data_hora')).DisplayLabel  := 'Data/Hora';
end;

procedure TFrmTelaAuditoria.JvDBGridListaKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
if (Key = #13) and (JvDBGridLista.SelectedIndex = 0) then
  begin
    LCampo :=DM.CampoInputBox('SPMP3', 'Informe o código do registro:');
    if LCampo <> EmptyStr then
      begin
        qryAuditoria.Filter := '';
        qryAuditoria.Filter := 'id_registro = ' + QuotedStr(LCampo);
        qryAuditoria.Filtered := True;
      end
    else
      qryAuditoria.Filtered := False;
  end;
end;

procedure TFrmTelaAuditoria.PCentroResize(Sender: TObject);
begin
  inherited;
PGrid.Width := ((PCentro.Width div 2) + (PCentro.Width div 4)) - 2;
PMemos.Width := (PCentro.Width div 4) - 2;

AjustaLarguraMinTituloGrid(JvDBGridLista);
end;

procedure TFrmTelaAuditoria.PMemosResize(Sender: TObject);
begin
  inherited;
PAntes.Height := (PMemos.Height div 2) - 2;
PDepois.Height := (PMemos.Height div 2) - 2;
end;

procedure TFrmTelaAuditoria.BuscarDadosMemos;
var
  str : TStringList;
  y, sconta : integer;
begin
  mAntes.Lines.Clear;
  memoantes := '';
  str := arraystring(qryAuditoriaANTES.AsString,'|');
  sconta := str.Count;
  for y := 0 to sconta-1 do
    begin
//      mAntes.Lines.Add(str[y]);
      memoantes := memoantes + str[y] + #13;

    end;
  mAntes.Lines.Add(memoantes);
  mAntes.SelStart := 0;
  mAntes.SelLength := 0;
  mAntes.Perform(EM_SCROLLCARET, 0, 0);

  mDepois.Lines.Clear;
  memodepois := '';
  str := arraystring(qryAuditoriaDepois.AsString,'|');
  sconta := str.Count;
  for y := 0 to sconta-1 do
    begin
//      mDepois.Lines.Add(str[y]);
      memodepois := memodepois + str[y] + #13;
    end;
  mDepois.Lines.Add(memoantes);
  mDepois.SelStart := 0;
  mDepois.SelLength := 0;
  mDepois.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TFrmTelaAuditoria.qryAuditoriaAfterScroll(DataSet: TDataSet);
//var
//  str : TStringList;
//  y, sconta : integer;
begin
  inherited;
//  BuscarDadosMemos;
//  mAntes.Lines.Clear;
//  str := arraystring(qryAuditoriaANTES.AsString,'|');
//  sconta := str.Count;
//  for y := 0 to sconta-1 do
//    begin
//      mAntes.Lines.Add(str[y]);
//      if y = 0 then
//        if mAntes.Lines.Count > 0 then
//          begin
////            LAuditCodRegistro := str[y];
////            Edit1.Text := LAuditCodRegistro;
//          end;
//
//    end;
//  mAntes.SelStart := 0;
//  mAntes.SelLength := 0;
//  mAntes.Perform(EM_SCROLLCARET, 0, 0);
//
//
//  mDepois.Lines.Clear;
//  str := arraystring(qryAuditoriaDepois.AsString,'|');
//  sconta := str.Count;
//  for y := 0 to sconta-1 do
//    begin
//      mDepois.Lines.Add(str[y]);
//      if y = 0 then
//        if mAntes.Lines.Count > 0 then
//          begin
////            LAuditCodRegistro := str[y];
////            Edit1.Text := LAuditCodRegistro;
//          end;
//    end;
//  mDepois.SelStart := 0;
//  mDepois.SelLength := 0;
//  mDepois.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TFrmTelaAuditoria.qryAuditoriaCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryAuditoriaTABELANOME.AsString := ValidaTelaEscolhida(qryAuditoriatabela.AsString);
  BuscarDadosMemos;
//  qryAuditoriaANTESORG.AsString   := mAntes.Lines.Text;
//  qryAuditoriaDEPOISORG.AsString  := mDepois.Lines.Text;
  qryAuditoriaANTESORG.AsString   := memoantes;
  qryAuditoriaDEPOISORG.AsString  := memodepois;
end;

function TFrmTelaAuditoria.ValidaTelaEscolhida(Texto:String):String;
begin
  Result := '';

  if Texto = 'almoxarifado'                   then Result := 'Almoxarifados';
  if Texto = 'areas'                          then Result := 'Áreas';
  if Texto = 'arquivotecnico'                 then Result := 'Arquivos Técnicos';
  if Texto = 'arquivotecnicoemp'              then Result := 'Empréstimo de Arquivos Técnicos';
  if Texto = 'arquivotecnicoparam'            then Result := 'Parâmetro de Arquivos Técnicos';
  if Texto = 'calendario'                     then Result := 'Calendário de Mão de Obra';
  if Texto = 'calendarioseqhora'              then Result := 'Hora do Calendário de Mão de Obra';
  if Texto = 'calendarioequip'                then Result := 'Calendário de Equipamentos';
  if Texto = 'calendarioequipseqhora'         then Result := 'Hora do Calendário de Equipamentos';
  if Texto = 'cargos'                         then Result := 'Cargos';
  if Texto = 'causasfalha'                    then Result := 'Causas de Falha';
  if Texto = 'celulas'                        then Result := 'Células';
  if Texto = 'centrocusto'                    then Result := 'Centros de Custos';
  if Texto = 'classes'                        then Result := 'Classes de Equipamentos';
  if Texto = 'contadores'                     then Result := 'Contadores';
  if Texto = 'controlecombustivel'            then Result := 'Controle de Abastecimentos';
  if Texto = 'controlecombustivelc'           then Result := 'Combustível';
  if Texto = 'controlecombustivelcabast'      then Result := 'Abastecimento';
  if Texto = 'controlecombustivell'           then Result := 'Lubrificante';
  if Texto = 'controlecombustivellabast'      then Result := 'Lubrificação';
  if Texto = 'controlecombustivelmot'         then Result := 'Motoristas';
  if Texto = 'controlecombustivelrotas'       then Result := 'Rotas de Viágens';
  if Texto = 'controlecombustivelviagens'     then Result := 'Viágens';
  if Texto = 'despmendespmanut'               then Result := 'Despesas Mensais da Manutenção';
  if Texto = 'despmeninfdiversas'             then Result := 'Informações Diversas';
  if Texto = 'despmeninfofunc'                then Result := 'Informações de Funcionários';
  if Texto = 'despmeninfofuncper'             then Result := 'Período de Informações de Funcionários';
  if Texto = 'despmenprodmensal'              then Result := 'Produção Mensal';
  if Texto = 'despmentaxas'                   then Result := 'Taxas';
  if Texto = 'despmentaxasper'                then Result := 'Período de Taxas';
  if Texto = 'disponibilidade'                then Result := 'Disponibilidades';
  if Texto = 'empresa'                        then Result := 'Empresas';
  if Texto = 'equipamentos'                   then Result := 'Equipamentos';
  if Texto = 'equipamentosarqtec'             then Result := 'Arquivos Técnicos de Equipamentos';
  if Texto = 'equipamentoscont'               then Result := 'Contadores de Equipamentos';
  if Texto = 'equipamentosesp'                then Result := 'Mão de Obra Especializada';
  if Texto = 'equipamentoskitspecasrep'       then Result := 'Kit de Peças do Equipamento';
  if Texto = 'equipamentospecasrep'           then Result := 'Peças do Equipamento';
  if Texto = 'equipamentosptosinsp'           then Result := 'Pontos de Inspeção do Equipamento';
  if Texto = 'fabricante'                     then Result := 'Fabricantes';
  if Texto = 'familiaequipamento'             then Result := 'Família de Equipamentos';
  if Texto = 'familiaequipamentodados'        then Result := 'Dados da Família de Equipamentos';
  if Texto = 'familiaequipamentodadosr'       then Result := 'Dados da Família de Equipamentos (N)';
  if Texto = 'familiapecasreposicao'          then Result := 'Família de Peças de Reposição';
  if Texto = 'familiapecasreposicaodados'     then Result := 'Dados da Família de Peças de Reposição';
  if Texto = 'familiapneus'                   then Result := 'Família de Pneus';
  if Texto = 'familiapneusdados'              then Result := 'Dados de Família de Pneus';
  if Texto = 'familiarecursos'                then Result := 'Família de Recursos';
  if Texto = 'familiarecursosdados'           then Result := 'Dados de Família de Recursos';
  if Texto = 'feriados'                       then Result := 'Feriados';
  if Texto = 'ferramentaria'                  then Result := 'Feramentaria';
  if Texto = 'ferramentariaitens'             then Result := 'Itens da Ferramentaria';
  if Texto = 'ferramentariaitensemp'          then Result := 'Empréstimo de Itens da Ferramentaria';
  if Texto = 'formatocodigo'                  then Result := 'Formato de Códigos';
  if Texto = 'fornecedor'                     then Result := 'Fornecedores';
  if Texto = 'funcionarios'                   then Result := 'Mão de Obra';
  if Texto = 'funcionariosausencia'           then Result := 'Ausência de Mão de Obra';
  if Texto = 'funcionarioscxaferram'          then Result := 'Caixa de Ferramentas';
  if Texto = 'funcionariosinventario'         then Result := 'Inventário de Ferramentas';
  if Texto = 'grupos'                         then Result := 'Grupo Industrial';
  if Texto = 'imagens'                        then Result := 'Imagens';
  if Texto = 'inddesempenho'                  then Result := 'Indicadores de Desempenho';
  if Texto = 'linhas'                         then Result := 'Linhas';
  if Texto = 'lubrificantes'                  then Result := 'Lubrificantes';
  if Texto = 'lubrificprogequipamento'        then Result := 'Lubrificação Programada do Equipamento';
  if Texto = 'lubrificprogfamequipamento'     then Result := 'Lubrificação Programada de Família';
  if Texto = 'lubrificprogfamequipitens'      then Result := 'Itens da Lubrificação Programada de Família';
  if Texto = 'lubrificprogfamequippartes'     then Result := 'Partes da Lubrificação Programada de Família';
  if Texto = 'lubrificprogfamequipplanotrab'  then Result := 'Planos de Trabalho da Lubrific. Progr. de Família';
  if Texto = 'manutprogequipamento'           then Result := 'Manutenção Programada do Equipamento';
  if Texto = 'manutprogequipitens'            then Result := 'Itens da Manutenção Programada do Equipamento';
  if Texto = 'manutprogequipitensesp'         then Result := 'Itens Espec. da Manutenção Programada do Equipamento';
  if Texto = 'manutprogfamequipamento'        then Result := 'Manutenção Programada de Família';
  if Texto = 'manutprogfamequipitens'         then Result := 'Itens da Manutenção Programada de Família';
  if Texto = 'manutprogfamequippartes'        then Result := 'Partes da Manutenção Programada de Família';
  if Texto = 'manutprogfamequipplanotrab'     then Result := 'Planos de Trabalho da Manutenção Progr. de Família';
  if Texto = 'monitoramento'                  then Result := 'Monitoramento de Condições Operacionais';
  if Texto = 'monitoramentomedicoes'          then Result := 'Medições de Monitoramento de Condições Operacionais';
  if Texto = 'motivoparada'                   then Result := 'Motivos de Paradas';
  if Texto = 'oficinas'                       then Result := 'Oficinas';
  if Texto = 'ordemservico'                   then Result := 'Ordem de Serviço';
  if Texto = 'ordemservicoequipe'             then Result := 'Equipe de Ordem de Serviço';
  if Texto = 'ordemservicoequipemobra'        then Result := 'Mão de Obra de Ordem de Serviço';
  if Texto = 'ordemservicoequipemobrafunc'    then Result := 'Funcionário de Ordem de Serviço';
  if Texto = 'ordemservicoequipemobrahoras'   then Result := 'Entradas de Mão de Obra na Ordem de Serviço';
  if Texto = 'ordemservicoequipemobrautil'    then Result := 'Mão de Obra Utilizada na Ordem de Serviço';
  if Texto = 'ordemservicolubrificantes'      then Result := 'Lubrificantes da Ordem de Serviço';
  if Texto = 'ordemservicolubrificantesutil'  then Result := 'Lubrificantes Utilizados na Ordem de Serviço';
  if Texto = 'ordemservicoparalisacao'        then Result := 'Paralisações da Ordem de Serviço';
  if Texto = 'ordemservicopecasrep'           then Result := 'Peças da Ordem de Serviço';
  if Texto = 'ordemservicopecasreputil'       then Result := 'Peças Utilizadas na Ordem de Serviço';
  if Texto = 'ordemservicoplantrab'           then Result := 'Planos de Trabalho da Ordem de Serviço';
  if Texto = 'ordemservicoplanotrabutil'      then Result := 'Planos de Trabalho Utilizados na Ordem de Serviço';
  if Texto = 'ordemservicoservexec'           then Result := 'Serviços Executados na Ordem de Serviço';
  if Texto = 'ordemservicoservsolic'          then Result := 'Serviços Solicitados na Ordem de Serviço';
  if Texto = 'ordemservicotercfora'           then Result := 'Serviços Terceirizados Fora da Unidade';
  if Texto = 'ordemservicotercforaaditivos'   then Result := 'Aditivos de Serviços Terceirizados Fora da Unidade';
  if Texto = 'ordemservicotercforaoc'         then Result := 'Orçamento Complementar de Serviços Terc. Fora da Unidade';
  if Texto = 'ordemservicotercforaoe'         then Result := 'Orçamento Extra de Serviços Terceirizados Fora da Unidade';
  if Texto = 'ordemservicotercforaoi'         then Result := 'Orçamento Inicial de Serviços Terc. Fora da Unidade';
  if Texto = 'ordemservicotercunid'           then Result := 'Serviços Terceirizados na Unidade';
  if Texto = 'ordemservicotercunidaditivos'   then Result := 'Aditivos de Serviços Terceirizados na Unidade';
  if Texto = 'ordemservicotercunidmateriais'  then Result := 'Materiais de Serviços Terceirizados na Unidade';
  if Texto = 'ordemservicotercunidpecasrep'   then Result := 'Peças de Serviços Terceirizados na Unidade';
  if Texto = 'ordemservicotercunidrecursos'   then Result := 'Recursos de Serviços Terceirizados na Unidade';
  if Texto = 'ordemservicotercunidtarefas'    then Result := 'Tarefas de Serviços Terceirizados na Unidade';
  if Texto = 'ordemservicotercunidtarefpred'  then Result := 'Tarefas Predecessoras de Serviços Terc. na Unidade';
  if Texto = 'ordemservicotercunidmedicoes'   then Result := 'Medições de Serviços Terceirizados na Unidade';
  if Texto = 'pecasreposicao'                 then Result := 'Peças de Reposição';
  if Texto = 'pecasreposicaokit'              then Result := 'Kit de Peças';
  if Texto = 'planotrabalho'                  then Result := 'Plano de Trabalho';
  if Texto = 'pneus'                          then Result := 'Pneus';
  if Texto = 'pneusmontagemchassi'            then Result := 'Montagem de Pneus';
  if Texto = 'pneusmontagemchassiatrelamento' then Result := 'Atrelamento de Carregadeiras';
  if Texto = 'pneusmontagemchassipneus'       then Result := 'Pneus do Chassi';
  if Texto = 'pneusmontagemchassipneuscons'   then Result := 'Conserto de Pneus';
  if Texto = 'pneusmontagemchassiposicoes'    then Result := 'Posição de Pneus';
  if Texto = 'pneusnovos'                     then Result := 'Pneus Novos';
  if Texto = 'pontosinspecao'                 then Result := 'Pontos de Inspeção';
  if Texto = 'pontosinspecaoloc'              then Result := 'Locais de Pontos de Inspeção';
  if Texto = 'recursos'                       then Result := 'Recursos';
  if Texto = 'recursoskit'                    then Result := 'Kit de Recursos';
  if Texto = 'rotasequipamento'               then Result := 'Rotas de Equipamentos';
  if Texto = 'rotasequipamentoseq'            then Result := 'Sequências de Rotas de Equipamentos';
  if Texto = 'solictrabalho'                  then Result := 'Solicitação de Trabalho';
  if Texto = 'tipomanutencao'                 then Result := 'Tipos de Manutenções';
  if Texto = 'tipoprogramacao'                then Result := 'Tipos de Programação';
  if Texto = 'usuario'                        then Result := 'Usuários';
end;

function TfrmTelaAuditoria.ValidaTabelaEscolhida(Texto:String):String;
begin
  Result := '';

  if Texto = 'Almoxarifados'                                             then Result := 'almoxarifado';
  if Texto = 'Áreas'                                                     then Result := 'areas';
  if Texto = 'Arquivos Técnicos'                                         then Result := 'arquivotecnico';
  if Texto = 'Empréstimo de Arquivos Técnicos'                           then Result := 'arquivotecnicoemp';
  if Texto = 'Parâmetro de Arquivos Técnicos'                            then Result := 'arquivotecnicoparam';
  if Texto = 'Calendário de Mão de Obra'                                 then Result := 'calendario';
  if Texto = 'Hora do Calendário de Mão de Obra'                         then Result := 'calendarioseqhora';
  if Texto = 'Calendário de Equipamentos'                                then Result := 'calendarioequip';
  if Texto = 'Hora do Calendário de Equipamentos'                        then Result := 'calendarioequipseqhora';
  if Texto = 'Cargos'                                                    then Result := 'cargos';
  if Texto = 'Causas de Falha'                                           then Result := 'causasfalha';
  if Texto = 'Células'                                                   then Result := 'celulas';
  if Texto = 'Centros de Custos'                                         then Result := 'centrocusto';
  if Texto = 'Classes de Equipamentos'                                   then Result := 'classes';
  if Texto = 'Contadores'                                                then Result := 'contadores';
  if Texto = 'Controle de Abastecimentos'                                then Result := 'controlecombustivel';
  if Texto = 'Combustível'                                               then Result := 'controlecombustivelc';
  if Texto = 'Abastecimento'                                             then Result := 'controlecombustivelcabast';
  if Texto = 'Lubrificante'                                              then Result := 'controlecombustivell';
  if Texto = 'Lubrificação'                                              then Result := 'controlecombustivellabast';
  if Texto = 'Motoristas'                                                then Result := 'controlecombustivelmot';
  if Texto = 'Rotas de Viágens'                                          then Result := 'controlecombustivelrotas';
  if Texto = 'Viágens'                                                   then Result := 'controlecombustivelviagens';
  if Texto = 'Despesas Mensais da Manutenção'                            then Result := 'despmendespmanut';
  if Texto = 'Informações Diversas'                                      then Result := 'despmeninfdiversas';
  if Texto = 'Informações de Funcionários'                               then Result := 'despmeninfofunc';
  if Texto = 'Período de Informações de Funcionários'                    then Result := 'despmeninfofuncper';
  if Texto = 'Produção Mensal'                                           then Result := 'despmenprodmensal';
  if Texto = 'Taxas'                                                     then Result := 'despmentaxas';
  if Texto = 'Período de Taxas'                                          then Result := 'despmentaxasper';
  if Texto = 'Disponibilidades'                                          then Result := 'disponibilidade';
  if Texto = 'Empresas'                                                  then Result := 'empresa';
  if Texto = 'Equipamentos'                                              then Result := 'equipamentos';
  if Texto = 'Arquivos Técnicos de Equipamentos'                         then Result := 'equipamentosarqtec';
  if Texto = 'Contadores de Equipamentos'                                then Result := 'equipamentoscont';
  if Texto = 'Mão de Obra Especializada'                                 then Result := 'equipamentosesp';
  if Texto = 'Kit de Peças do Equipamento'                               then Result := 'equipamentoskitspecasrep';
  if Texto = 'Peças do Equipamento'                                      then Result := 'equipamentospecasrep';
  if Texto = 'Pontos de Inspeção do Equipamento'                         then Result := 'equipamentosptosinsp';
  if Texto = 'Fabricantes'                                               then Result := 'fabricante';
  if Texto = 'Família de Equipamentos'                                   then Result := 'familiaequipamento';
  if Texto = 'Dados da Família de Equipamentos'                          then Result := 'familiaequipamentodados';
  if Texto = 'Dados da Família de Equipamentos (N)'                      then Result := 'familiaequipamentodadosr';
  if Texto = 'Família de Peças de Reposição'                             then Result := 'familiapecasreposicao';
  if Texto = 'Dados da Família de Peças de Reposição'                    then Result := 'familiapecasreposicaodados';
  if Texto = 'Família de Pneus'                                          then Result := 'familiapneus';
  if Texto = 'Dados de Família de Pneus'                                 then Result := 'familiapneusdados';
  if Texto = 'Família de Recursos'                                       then Result := 'familiarecursos';
  if Texto = 'Dados de Família de Recursos'                              then Result := 'familiarecursosdados';
  if Texto = 'Feriados'                                                  then Result := 'feriados';
  if Texto = 'Feramentaria'                                              then Result := 'ferramentaria';
  if Texto = 'Itens da Ferramentaria'                                    then Result := 'ferramentariaitens';
  if Texto = 'Empréstimo de Itens da Ferramentaria'                      then Result := 'ferramentariaitensemp';
  if Texto = 'Formato de Códigos'                                        then Result := 'formatocodigo';
  if Texto = 'Fornecedores'                                              then Result := 'fornecedor';
  if Texto = 'Mão de Obra'                                               then Result := 'funcionarios';
  if Texto = 'Ausência de Mão de Obra'                                   then Result := 'funcionariosausencia';
  if Texto = 'Caixa de Ferramentas'                                      then Result := 'funcionarioscxaferram';
  if Texto = 'Inventário de Ferramentas'                                 then Result := 'funcionariosinventario';
  if Texto = 'Grupo Industrial'                                          then Result := 'grupos';
  if Texto = 'Imagens'                                                   then Result := 'imagens';
  if Texto = 'Indicadores de Desempenho'                                 then Result := 'inddesempenho';
  if Texto = 'Linhas'                                                    then Result := 'linhas';
  if Texto = 'Lubrificantes'                                             then Result := 'lubrificantes';
  if Texto = 'Lubrificação Programada do Equipamento'                    then Result := 'lubrificprogequipamento';
  if Texto = 'Lubrificação Programada de Família'                        then Result := 'lubrificprogfamequipamento';
  if Texto = 'Itens da Lubrificação Programada de Família'               then Result := 'lubrificprogfamequipitens';
  if Texto = 'Partes da Lubrificação Programada de Família'              then Result := 'lubrificprogfamequippartes';
  if Texto = 'Planos de Trabalho da Lubrific. Progr. de Família'         then Result := 'lubrificprogfamequipplanotrab';
  if Texto = 'Manutenção Programada do Equipamento'                      then Result := 'manutprogequipamento';
  if Texto = 'Itens da Manutenção Programada do Equipamento'             then Result := 'manutprogequipitens';
  if Texto = 'Itens Espec. da Manutenção Programada do Equipamento'      then Result := 'manutprogequipitensesp';
  if Texto = 'Manutenção Programada de Família'                          then Result := 'manutprogfamequipamento';
  if Texto = 'Itens da Manutenção Programada de Família'                 then Result := 'manutprogfamequipitens';
  if Texto = 'Partes da Manutenção Programada de Família'                then Result := 'manutprogfamequippartes';
  if Texto = 'Planos de Trabalho da Manutenção Progr. de Família'        then Result := 'manutprogfamequipplanotrab';
  if Texto = 'Monitoramento de Condições Operacionais'                   then Result := 'monitoramento';
  if Texto = 'Medições de Monitoramento de Condições Operacionais'       then Result := 'monitoramentomedicoes';
  if Texto = 'Motivos de Paradas'                                        then Result := 'motivoparada';
  if Texto = 'Oficinas'                                                  then Result := 'oficinas';
  if Texto = 'Ordem de Serviço'                                          then Result := 'ordemservico';
  if Texto = 'Equipe de Ordem de Serviço'                                then Result := 'ordemservicoequipe';
  if Texto = 'Mão de Obra de Ordem de Serviço'                           then Result := 'ordemservicoequipemobra';
  if Texto = 'Funcionário de Ordem de Serviço'                           then Result := 'ordemservicoequipemobrafunc';
  if Texto = 'Entradas de Mão de Obra na Ordem de Serviço'               then Result := 'ordemservicoequipemobrahoras';
  if Texto = 'Mão de Obra Utilizada na Ordem de Serviço'                 then Result := 'ordemservicoequipemobrautil';
  if Texto = 'Lubrificantes da Ordem de Serviço'                         then Result := 'ordemservicolubrificantes';
  if Texto = 'Lubrificantes Utilizados na Ordem de Serviço'              then Result := 'ordemservicolubrificantesutil';
  if Texto = 'Paralisações da Ordem de Serviço'                          then Result := 'ordemservicoparalisacao';
  if Texto = 'Peças da Ordem de Serviço'                                 then Result := 'ordemservicopecasrep';
  if Texto = 'Peças Utilizadas na Ordem de Serviço'                      then Result := 'ordemservicopecasreputil';
  if Texto = 'Planos de Trabalho da Ordem de Serviço'                    then Result := 'ordemservicoplantrab';
  if Texto = 'Planos de Trabalho Utilizados na Ordem de Serviço'         then Result := 'ordemservicoplanotrabutil';
  if Texto = 'Serviços Executados na Ordem de Serviço'                   then Result := 'ordemservicoservexec';
  if Texto = 'Serviços Solicitados na Ordem de Serviço'                  then Result := 'ordemservicoservsolic';
  if Texto = 'Serviços Terceirizados Fora da Unidade'                    then Result := 'ordemservicotercfora';
  if Texto = 'Aditivos de Serviços Terceirizados Fora da Unidade'        then Result := 'ordemservicotercforaaditivos';
  if Texto = 'Orçamento Complementar de Serviços Terc. Fora da Unidade'  then Result := 'ordemservicotercforaoc';
  if Texto = 'Orçamento Extra de Serviços Terceirizados Fora da Unidade' then Result := 'ordemservicotercforaoe';
  if Texto = 'Orçamento Inicial de Serviços Terc. Fora da Unidade'       then Result := 'ordemservicotercforaoi';
  if Texto = 'Serviços Terceirizados na Unidade'                         then Result := 'ordemservicotercunid';
  if Texto = 'Aditivos de Serviços Terceirizados na Unidade'             then Result := 'ordemservicotercunidaditivos';
  if Texto = 'Materiais de Serviços Terceirizados na Unidade'            then Result := 'ordemservicotercunidmateriais';
  if Texto = 'Peças de Serviços Terceirizados na Unidade'                then Result := 'ordemservicotercunidpecasrep';
  if Texto = 'Recursos de Serviços Terceirizados na Unidade'             then Result := 'ordemservicotercunidrecursos';
  if Texto = 'Tarefas de Serviços Terceirizados na Unidade'              then Result := 'ordemservicotercunidtarefas';
  if Texto = 'Tarefas Predecessoras de Serviços Terc. na Unidade'        then Result := 'ordemservicotercunidtarefpred';
  if Texto = 'Medições de Serviços Terceirizados na Unidade'             then Result := 'ordemservicotercunidmedicoes';
  if Texto = 'Peças de Reposição'                                        then Result := 'pecasreposicao';
  if Texto = 'Kit de Peças'                                              then Result := 'pecasreposicaokit';
  if Texto = 'Plano de Trabalho'                                         then Result := 'planotrabalho';
  if Texto = 'Pneus'                                                     then Result := 'pneus';
  if Texto = 'Montagem de Pneus'                                         then Result := 'pneusmontagemchassi';
  if Texto = 'Atrelamento de Carregadeiras'                              then Result := 'pneusmontagemchassiatrelamento';
  if Texto = 'Pneus do Chassi'                                           then Result := 'pneusmontagemchassipneus';
  if Texto = 'Conserto de Pneus'                                         then Result := 'pneusmontagemchassipneuscons';
  if Texto = 'Posição de Pneus'                                          then Result := 'pneusmontagemchassiposicoes';
  if Texto = 'Pneus Novos'                                               then Result := 'pneusnovos';
  if Texto = 'Pontos de Inspeção'                                        then Result := 'pontosinspecao';
  if Texto = 'Locais de Pontos de Inspeção'                              then Result := 'pontosinspecaoloc';
  if Texto = 'Recursos'                                                  then Result := 'recursos';
  if Texto = 'Kit de Recursos'                                           then Result := 'recursoskit';
  if Texto = 'Rotas de Equipamentos'                                     then Result := 'rotasequipamento';
  if Texto = 'Sequências de Rotas de Equipamentos'                       then Result := 'rotasequipamentoseq';
  if Texto = 'Solicitação de Trabalho'                                   then Result := 'solictrabalho';
  if Texto = 'Tipos de Manutenções'                                      then Result := 'tipomanutencao';
  if Texto = 'Tipos de Programação'                                      then Result := 'tipoprogramacao';
  if Texto = 'Usuários'                                                  then Result := 'usuario';
end;

end.

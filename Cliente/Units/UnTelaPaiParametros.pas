unit UnTelaPaiParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.DBCtrls, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Error,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.WinXCtrls,
  System.ImageList, Vcl.ImgList;

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
    BtnNovo1: TButton;
    BtnSalvar1: TButton;
    BtnCancelar1: TButton;
    BtnExcluir1: TButton;
    BtnConsultar1: TButton;
    BtnImprimir1: TButton;
    BtnImagem1: TButton;
    BtnAjuda1: TButton;
    BtnSair1: TButton;
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
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnConsultar: TBitBtn;
    btnImprimir: TBitBtn;
    btnAjuda: TBitBtn;
    btnSair: TBitBtn;
    PageControlCRUD: TPageControl;
    TabSheetLista: TTabSheet;
    PanelCor: TPanel;
    pJvDBGridLista: TPanel;
    pSearchBox: TPanel;
    SearchBoxConsulta: TSearchBox;
    JvDBGridLista: TJvDBGrid;
    TabSheetCadastra: TTabSheet;
    ScrollBox1: TScrollBox;
    PanelColor: TPanel;
    ImageList1: TImageList;
    ChbAtivoCons: TCheckBox;
    chbVisivelCons: TCheckBox;
    LCadastroPor: TLabel;
    LblUsuCad: TDBText;
    LAlteracao: TLabel;
    LblUsuAlt: TDBText;
    LCadastro: TLabel;
    LblDataAlt: TDBText;
    LAlteradoPor: TLabel;
    LblDataCad: TDBText;
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
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabNextTab1AfterTabChange(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnAjudaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvDBGridListaDblClick(Sender: TObject);
    procedure SearchBoxConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure ChbAtivoConsClick(Sender: TObject);
    procedure SearchBoxConsultaInvokeSearch(Sender: TObject);
    procedure chbVisivelConsClick(Sender: TObject);
  private
    { Private declarations }

    procedure Consultar;
    procedure AjustaLarguraMinTituloGrid(var aGrid: TJvDBGrid);
  public
    ConsAuxiliar : String;
    { Public declarations }
  end;

var
  FrmTelaPaiParametros: TFrmTelaPaiParametros;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDmRelatorios, UnDM, UnTelaCadMonitMedicoes;


procedure TFrmTelaPaiParametros.AjustaLarguraMinTituloGrid(var aGrid: TJvDBGrid);
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

procedure TFrmTelaPaiParametros.Consultar;
var
  LMensagem: PChar;
begin
  inherited;
  try
    if DM.FTabela_auxiliar = 0 then Exit;

    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.Fields.Clear;
    DM.qryAuxiliar.Indexes.Clear;
    DM.qryAuxiliar.SQL.Clear;
    case DM.FTabela_auxiliar of
      0: DM.qryAuxiliar.SQL.Add('select * from grupos where descricao like :descricao order by descricao'); //Grupos
      1: DM.qryAuxiliar.SQL.Add('select * from empresa where nome like :descricao and codgrupo = '+QuotedStr(DM.FParamAuxiliar[0]) + ' order by nome'); //Unidades
      2: DM.qryAuxiliar.SQL.Add('select * from usuario where nome like :descricao and codnivelacesso = ''ADC-00001'' OR codnivelacesso = ''USC-00001'' order by nome'); //Adm. Corporativo
      3: DM.qryAuxiliar.SQL.Add('select * from usuario where nome like :descricao and codnivelacesso = ''ADU-00001'' and codempresa = '+QuotedStr(DM.FParamAuxiliar[0]) + '  order by nome'); //Adm. Unidade
      4, 400: DM.qryAuxiliar.SQL.Add('select * from centrocusto where descricao like :descricao order by descricao'); //Centro de Custo
      5, 500: DM.qryAuxiliar.SQL.Add('select * from classes where descricao like :descricao order by descricao'); //Classes
      6, 600: DM.qryAuxiliar.SQL.Add('select * from familiaequipamento where descricao like :descricao order by descricao'); //Famílias de Equipamentos
      7, 700: DM.qryAuxiliar.SQL.Add('select * from familiapecasreposicao where descricao like :descricao order by descricao'); //Famílias de Peças
      8, 800: DM.qryAuxiliar.SQL.Add('select * from familiarecursos where descricao like :descricao order by descricao'); //Famílias de Recursos
      9, 900: DM.qryAuxiliar.SQL.Add('select* from causasfalha where descricao like :descricao order by descricao'); //Causas de Falhas
      10, 100: DM.qryAuxiliar.SQL.Add('select * from tipomanutencao where descricao like :descricao order by tipomanutencao'); //Tipos de Manutenção
      11, 110: DM.qryAuxiliar.SQL.Add('select * from motivoparada where descricao like :descricao order by descricao'); //Motivos de Parada
      12, 120: DM.qryAuxiliar.SQL.Add('select * from tipoprogramacao where descricao like :descricao  order by descricao'); //Tipos de Programação
      13, 130: DM.qryAuxiliar.SQL.Add('select codigo, descricao from cargos where descricao like :descricao  order by descricao'); //Cargos
      14: DM.qryAuxiliar.SQL.Add('SELECT `almoxarifado`.`CODIGO`, `almoxarifado`.`DESCRICAO`, `almoxarifado`.`MATERIAL`, `almoxarifado`.`NUMITENS`, `almoxarifado`.`AREA`, `centrocusto`.`DESCRICAO`CENTROCUSTO'
                                  + ' FROM `almoxarifado` INNER JOIN `centrocusto` ON (`almoxarifado`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `almoxarifado`.`DESCRICAO` LIKE :descricao AND `almoxarifado`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Almoxarifados
      15, 150: DM.qryAuxiliar.SQL.Add('select codigo, descricao from areas where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Áreas
      151: DM.qryAuxiliar.SQL.Add('SELECT `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`, `celulas`.`CODIGO` AS `CODCELULA`, `celulas`.`DESCRICAO` AS `DESCCELULA`, `linhas`.`CODIGO` AS `CODLINHA`,'
                                  + ' `linhas`.`DESCRICAO` AS `DESCLINHA`'
                                  + ' FROM `celulas` LEFT JOIN `areas` ON (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`)'
                                  + ' LEFT JOIN `linhas` ON (`celulas`.`CODIGO` = `linhas`.`CODCELULA`) AND (`celulas`.`CODAREA` = `linhas`.`CODAREA`) AND (`celulas`.`CODEMPRESA` = `linhas`.`CODEMPRESA`)'
                                  + ' WHERE `areas`.`DESCRICAO` LIKE :descricao AND `areas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCAREA`, `DESCCELULA`, `DESCLINHA`'); //Áreas (Relatório) Geral
      16, 160: DM.qryAuxiliar.SQL.Add('select * from celulas where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codarea = '+ QuotedStr(DM.FParamAuxiliar[1]) + ' order by descricao'); //Células
      17, 170: DM.qryAuxiliar.SQL.Add('select * from linhas where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codarea = ' + QuotedStr(DM.FParamAuxiliar[1]) + ' and codcelula = ' + QuotedStr(DM.FParamAuxiliar[2]) + ' order by descricao'); //Linhas
      18, 180: DM.qryAuxiliar.SQL.Add('SELECT `SEQUENCIA`, `CODIGO` AS `CODEQUIPAMENTO`, `DESCRICAO` FROM `equipamentos` WHERE (`SEQUENCIA` IS NOT NULL AND `DESCRICAO` LIKE :descricao AND `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `CODLOCALIZACAO` = ' + QuotedStr(DM.FParamAuxiliar[1]) + ' AND `CODCELULA` = ' + QuotedStr(DM.FParamAuxiliar[2]) + ' AND `CODLINHA` = ' + QuotedStr(DM.FParamAuxiliar[3]) + ' AND `OPERANDO` = ''S'') ORDER BY `SEQUENCIA` ASC'); //Sequências
      19: DM.qryAuxiliar.SQL.Add('select * from feriados where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Feriados
      20, 200: DM.qryAuxiliar.SQL.Add('SELECT `oficinas`.`CODIGO`, `oficinas`.`DESCRICAO`, `centrocusto`.`DESCRICAO`CENTROCUSTO FROM `oficinas` INNER JOIN `centrocusto`'
                                       + ' ON (`oficinas`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `oficinas`.`DESCRICAO` LIKE :descricao AND `oficinas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Oficinas
      21, 210: DM.qryAuxiliar.SQL.Add('select * from fornecedor where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Fornecedores
      22, 220: DM.qryAuxiliar.SQL.Add('select * from fabricante where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Fabricantes
      23, 230: DM.qryAuxiliar.SQL.Add('select * from calendario where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Calendário de Mão de Obra
      24, 240: DM.qryAuxiliar.SQL.Add('select * from calendarioequip where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Calendário de Equipamentos
      25, 250:
        begin
          if (DM.FParamAuxiliar[1] <> 'CODIGO') and (DM.FParamAuxiliar[1] <> 'DESCRICAO') then
            DM.FParamAuxiliar[1] := 'DESCRICAO';
          DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP, `areas`.`DESCRICAO` AREA, `celulas`.`DESCRICAO` CELULA, `linhas`.`DESCRICAO` LINHA ,`equipamentos`.`SEQUENCIA`'
                                  + ' , `centrocusto`.`DESCRICAO` CENTROCUSTO, `centrocusto`.`CODIGO` CODCENTROCUSTO, `equipamentos`.`CODFAMILIAEQUIP` FROM `equipamentos` LEFT JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)'
                                  + ' INNER JOIN `centrocusto` ON (`equipamentos`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`)'
                                  + ' LEFT JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                                  + ' LEFT JOIN `celulas` ON (`equipamentos`.`CODCELULA` = `celulas`.`CODIGO`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`) AND (`celulas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                  + ' LEFT JOIN `linhas` ON (`equipamentos`.`CODLINHA` =  `linhas`.`CODIGO`) AND (`linhas`.`CODCELULA` = `celulas`.`CODIGO`) AND (`linhas`.`CODAREA` = `areas`.`CODIGO`) AND (`linhas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                  + ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[1]+' like :descricao and `equipamentos`.`codempresa` = '+QuotedStr(DM.FCodEmpresa) + '');
          if DM.FTabela_auxiliar = 250 then
                                    DM.qryAuxiliar.SQL.Add(' AND `OPERANDO` = ''S''');
          if DM.FCodFamilia <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODFAMILIAEQUIP` = '+QuotedStr(DM.FCodFamilia));
          if DM.FCodArea <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODLOCALIZACAO` = '+QuotedStr(DM.FCodArea));
          if DM.FCodCelula <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODCELULA` = '+QuotedStr(DM.FCodCelula));
          if DM.FCodLinha <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODLINHA` = '+QuotedStr(DM.FCodLinha));
            DM.qryAuxiliar.SQL.Add(' ) order by `equipamentos`.`DESCRICAO`'); //Equipamentos
        end;
      26: DM.qryAuxiliar.SQL.Add('SELECT `imagens`.`CODIGO`, `imagens`.`DESCRICAO`, `imagens`.`CODEQUIPAMENTO` CODEQUIPAMENTO, `equipamentos`.`DESCRICAO`EQUIPAMENTO, `imagens`.`DESCSECUNDARIO`PONTO FROM `imagens` LEFT JOIN `equipamentos`'
                                 + ' ON (`imagens`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) AND (`equipamentos`.`CODIGO` = `imagens`.`CODEQUIPAMENTO`) WHERE (`imagens`.`DESCRICAO` like :descricao AND `imagens`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `imagens`.descricao'); //Imagens
      27: DM.qryAuxiliar.SQL.Add('select codigo, coditem, tipoitem, valitem from disponibilidade where coditem like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by coditem'); //Disponibilidades
      28: DM.qryAuxiliar.SQL.Add('select codigo, descricao from nivelacesso where descricao like :descricao and codigo <> ''ADC-00001'' and codigo <> ''ADU-00001'' order by descricao'); //Nível de Acesso
      29, 2900: DM.qryAuxiliar.SQL.Add('SELECT `usuario`.`CODIGO`, `usuario`.`NOME`, `nivelacesso`.`DESCRICAO`NIVELACESSO, `usuario`.`CODPERMISSAOACESSO` FROM `usuario`'
                                       + ' INNER JOIN `nivelacesso` ON (`usuario`.`CODNIVELACESSO` = `nivelacesso`.`CODIGO`)WHERE (`usuario`.`NOME` like :descricao AND `usuario`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' and `usuario`.`CODNIVELACESSO` <> ''ADC-00001'' and `usuario`.`CODNIVELACESSO` <> ''ADU-00001'') order by `usuario`.nome'); //Usuários
      30, 300, 301:
          if FrmTelaCadMonitMedicoes = nil then
            DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO` FROM funcionarios INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.'+DM.FParamAuxiliar[1]+' LIKE :descricao AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `funcionarios`.nome') //Funcionários
          else
            DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO` FROM funcionarios INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.'+DM.FParamAuxiliar[9]+' LIKE :descricao AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `funcionarios`.nome'); //Funcionários
      31:
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from equipamentos where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' AND CODLOCALIZACAO = :CODAREA AND CODCELULA = :CODCELULA AND CODIGO <> :CODEQUIPAMENTO order by descricao'); //Equipamentos Primários
          DM.qryAuxiliar.Params[1].AsString := DM.qryEquipamentosCODLOCALIZACAO.AsString;
          DM.qryAuxiliar.Params[2].AsString := DM.qryEquipamentosCODCELULA.AsString;
          DM.qryAuxiliar.Params[3].AsString := DM.qryEquipamentosCODIGO.AsString;
        end;
      32, 321:
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `manutprogequipamento`.`CODIGO`, `manutprogequipamento`.`CODEMPRESA`, `manutprogequipamento`.`CODEQUIPAMENTO`, `manutprogequipamento`.`CODMANUTPROGFAMEQUIP`'
                                 + ', `manutprogequipamento`.`CODMONITORAMENTO`, `manutprogequipamento`.`MATRICULA`, `manutprogequipamento`.`DESCRICAO`, `manutprogequipamento`.`CRITICIDADE`'
                                 + ', `manutprogequipamento`.`FREQUENCIA1`, `manutprogequipamento`.`DTAINICIO1`, `manutprogequipamento`.`REPROGRAMAR1`, `manutprogequipamento`.`FREQUENCIA2`'
                                 + ', `manutprogequipamento`.`REPROGRAMAR2`, `manutprogequipamento`.`LEITURA`, `manutprogequipamento`.`RELATORIO`, `manutprogequipamento`.`GRUPOINSP`'
                                 + ', `manutprogequipamento`.`DATACADASTRO`, `manutprogequipamento`.`CODUSUARIOCAD`, `manutprogequipamento`.`DATAULTALT`, `manutprogequipamento`.`CODUSUARIOALT`'
                                 + ', `manutprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `manutprogfamequipamento`.`DESCRICAO` DESCMANUTPROGFAMEQUIP'
                                 + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                                 + ', DATE_ADD(`manutprogequipamento`.`DTAINICIO1`, INTERVAL `manutprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP, `equipamentos`.`CODLOCALIZACAO` As CODAREA, `areas`.`DESCRICAO` AS DESCAREA'
                                 + ' FROM `manutprogequipamento`'
                                 + ' LEFT JOIN `usuario` ON (`manutprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                                 + ' LEFT JOIN `usuario` AS `usuario_1` ON (`manutprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                                 + ' LEFT JOIN `manutprogfamequipamento` ON (`manutprogequipamento`.`CODMANUTPROGFAMEQUIP` = `manutprogfamequipamento`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `manutprogfamequipamento`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `tipoprogramacao` ON (`manutprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                                 + ' INNER JOIN `equipamentos` ON (`manutprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' INNER JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `funcionarios` ON (`manutprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`manutprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                                 + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                                 + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                                 + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                                 + ' WHERE (`manutprogequipamento`.`DESCRICAO` LIKE :descricao AND `manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `manutprogequipamento`.`CODEQUIPAMENTO` = '+QuotedStr(DM.FParamAuxiliar[0]) + ') ORDER BY `manutprogequipamento`.`DESCRICAO`'); //Manutenções Programadas do Equipamento
        end;
      33, 331:
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                                 + ', `lubrificprogequipamento`.`CODMONITORAMENTO`, `lubrificprogequipamento`.`MATRICULA`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`CRITICIDADE`'
                                 + ', `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`REPROGRAMAR1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                                 + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogequipamento`.`LEITURA`, `lubrificprogequipamento`.`RELATORIO`, `lubrificprogequipamento`.`GRUPOINSP`'
                                 + ', `lubrificprogequipamento`.`DATACADASTRO`, `lubrificprogequipamento`.`CODUSUARIOCAD`, `lubrificprogequipamento`.`DATAULTALT`, `lubrificprogequipamento`.`CODUSUARIOALT`'
                                 + ', `lubrificprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP'
                                 + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                                 + ', DATE_ADD(`lubrificprogequipamento`.`DTAINICIO1`, INTERVAL `lubrificprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP'
                                 + ' FROM `lubrificprogequipamento`'
                                 + ' LEFT JOIN `usuario` ON (`lubrificprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                                 + ' LEFT JOIN `usuario` AS `usuario_1` ON (`lubrificprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                                 + ' LEFT JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `lubrificprogfamequipamento`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                                 + ' INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `funcionarios` ON (`lubrificprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                                 + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                                 + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                                 + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                                 + ' WHERE (`lubrificprogequipamento`.`DESCRICAO` LIKE :descricao AND `lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `lubrificprogequipamento`.`CODEQUIPAMENTO` = '+QuotedStr(DM.FParamAuxiliar[0]) + ') ORDER BY `lubrificprogequipamento`.`DESCRICAO`'); //Lubrificações Programadas do Equipamento
        end;
      34, 340:
        begin
           if  DM.FTabela_auxiliar = 340 then
           begin
              DM.qryAuxiliar.SQL.Add('SELECT `manutprogfamequipamento`.`CODIGO`, `manutprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2, '
                                     + ' `oficinas`.`DESCRICAO` AS Oficina, `manutprogfamequipamento`.`FREQUENCIA` AS Frequência FROM `manutprogfamequipamento` INNER JOIN `familiaequipamento` ON (`manutprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) '
                                     + ' LEFT JOIN `tipoprogramacao` ON (`manutprogfamequipamento`.`PROGRAMARPOR2`) = `tipoprogramacao`.`CODIGO` LEFT JOIN `oficinas` ON (`manutprogfamequipamento`.`CODOFICINA` = `oficinas`.`CODIGO`)'
                                     + ' WHERE (`manutprogfamequipamento`.`CODFAMILIAEQUIP`  = ' + QuotedStr(DM.FParamAuxiliar[0])  + ' AND `manutprogfamequipamento`.`DESCRICAO` LIKE :descricao AND `manutprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `familiaequipamento`.`DESCRICAO`');
           end else
           begin
              DM.qryAuxiliar.SQL.Add('SELECT `manutprogfamequipamento`.`CODIGO`, `manutprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2, '
                                     + ' `oficinas`.`DESCRICAO` AS Oficina, `manutprogfamequipamento`.`FREQUENCIA` AS Frequência FROM `manutprogfamequipamento` INNER JOIN `familiaequipamento` ON (`manutprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) '
                                     + ' LEFT JOIN `tipoprogramacao` ON (`manutprogfamequipamento`.`PROGRAMARPOR2`) = `tipoprogramacao`.`CODIGO` LEFT JOIN `oficinas` ON (`manutprogfamequipamento`.`CODOFICINA` = `oficinas`.`CODIGO`)'
                                     + ' WHERE (`manutprogfamequipamento`.`DESCRICAO` LIKE :descricao AND `manutprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `familiaequipamento`.`DESCRICAO`');
           end; //Manutenção de Família de Equipamento


        end;
      35, 350:
        begin
           if  DM.FTabela_auxiliar = 350 then
           begin
             DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogfamequipamento`.`CODIGO`, `lubrificprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2,'
                                    + ' `oficinas`.`DESCRICAO` AS Oficina, `lubrificprogfamequipamento`.`FREQUENCIA` AS Frequência '
                                    + ' FROM `lubrificprogfamequipamento` INNER JOIN `familiaequipamento` ON (`lubrificprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2`'
                                    + '  = `tipoprogramacao`.`CODIGO`) LEFT JOIN `oficinas` ON (`lubrificprogfamequipamento`.`CODOFICINA` = `oficinas`.`CODIGO`) '
                                    + ' WHERE (`lubrificprogfamequipamento`.`CODFAMILIAEQUIP`  = ' + QuotedStr(DM.FParamAuxiliar[0])  + ' AND `lubrificprogfamequipamento`.`DESCRICAO` LIKE :descricao AND `lubrificprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `familiaequipamento`.`DESCRICAO`');
           end else
           begin
             DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogfamequipamento`.`CODIGO`, `lubrificprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2,'
                                    + ' `oficinas`.`DESCRICAO` AS Oficina, `lubrificprogfamequipamento`.`FREQUENCIA` AS Frequência '
                                    + ' FROM `lubrificprogfamequipamento` INNER JOIN `familiaequipamento` ON (`lubrificprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2`'
                                    + '  = `tipoprogramacao`.`CODIGO`) LEFT JOIN `oficinas` ON (`lubrificprogfamequipamento`.`CODOFICINA` = `oficinas`.`CODIGO`) '
                                    + ' WHERE (`lubrificprogfamequipamento`.`DESCRICAO` LIKE :descricao AND `lubrificprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `familiaequipamento`.`DESCRICAO`');
           end; //Lubrificação de Família de Equipamento
        end;
      36, 360: DM.qryAuxiliar.SQL.Add('SELECT `pecasreposicao`.`CODIGO`, `pecasreposicao`.`DESCRICAO`, `pecasreposicao`.`REFERENCIA`, `familiapecasreposicao`.`DESCRICAO` AS `FAMILIAPECA`, `pecasreposicao`.`QUANTIDADE` FROM `pecasreposicao` INNER JOIN `familiapecasreposicao`'
                                      + ' ON (`pecasreposicao`.`CODFAMILIAPECAREP` = `familiapecasreposicao`.`CODIGO`) WHERE (`pecasreposicao`.`DESCRICAO` LIKE :descricao AND `pecasreposicao`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pecasreposicao`.`DESCRICAO`'); //Peças de Reposição
      37, 370: DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipo from arquivotecnico where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Arquivos Técnicos
      38, 380: DM.qryAuxiliar.SQL.Add('select codigo, descricao from pontosinspecao where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Ponto de Inspeção
      39, 390:
          DM.qryAuxiliar.SQL.Add('SELECT `contadores`.`CODIGO`, `contadores`.`DESCRICAO`, `contadores`.`CODPROGRAMACAO`, `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO` FROM `contadores`'
                                  +  ' LEFT JOIN `tipoprogramacao` ON (`contadores`.`CODPROGRAMACAO` = `tipoprogramacao`.`CODIGO`) where `contadores`.`descricao` like :descricao and `contadores`.`codempresa` = '+QuotedStr(DM.FCodEmpresa) + ' order by `contadores`.`descricao`'); //Contadores
      40:
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `solictrabalho`.`CODORDEMSERVICO`, `solictrabalho`.`DESCSERVICO`, `solictrabalho`.`DATACADASTRO`, `funcionarios`.`NOME` AS `SOLICITANTE`, `solictrabalho`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `solictrabalho`.`CODIGO`'
                                  + ' FROM `solictrabalho` INNER JOIN `funcionarios` ON (`solictrabalho`.`CODSOLICITANTE` = `funcionarios`.`MATRICULA`) AND (`solictrabalho`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                  + ' LEFT JOIN `equipamentos` ON (`solictrabalho`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`)  AND (`solictrabalho`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) '
                                  + ' WHERE (`solictrabalho`.`DESCSERVICO` LIKE :descricao ');
                                  if DM.FParamAuxiliar[2] = 'Ordem de Serviço' then
                                    DM.qryAuxiliar.SQL.Add('AND `solictrabalho`.`CODORDEMSERVICO` = ' + DM.FParamAuxiliar[3]);
                                  if DM.FParamAuxiliar[2] = 'Matrícula' then
                                    DM.qryAuxiliar.SQL.Add('AND `solictrabalho`.`CODSOLICITANTE` = ' + DM.FParamAuxiliar[3]);
                                  DM.qryAuxiliar.SQL.Add(' AND `solictrabalho`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+') ORDER BY `solictrabalho`.`DATACADASTRO` DESC'); //Solicitação de Trabalho
        end;
      41, 410: DM.qryAuxiliar.SQL.Add('select codigo, descricao, detalhes from planotrabalho where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Plano de Trabalho
      42, 420: DM.qryAuxiliar.SQL.Add('select codigo, descricao from monitoramento where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Monitoramento
      43, 430: DM.qryAuxiliar.SQL.Add('SELECT mfp.`CODIGO`, mfp.`DESCRICAO` FROM manutprogfamequippartes mfp INNER JOIN manutprogfamequipamento mf ON (mfp.`CODMANUTPROGFAMEQUIP` = mf.`CODIGO`) AND (mfp.`CODEMPRESA` = mf.`CODEMPRESA`)'
                                       + ' where mfp.descricao like :descricao and (mfp.`CODMANUTPROGFAMEQUIP` = '+QuotedStr(DM.FParamAuxiliar[1])+') and mfp.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Parte de Manutenção de Família
      44, 440: DM.qryAuxiliar.SQL.Add('SELECT mfp.`CODIGO`, mfp.`DESCRICAO` FROM lubrificprogfamequippartes mfp INNER JOIN lubrificprogfamequipamento mf ON (mfp.`CODLUBRIFICPROGFAMEQUIP` = mf.`CODIGO`) AND (mfp.`CODEMPRESA` = mf.`CODEMPRESA`)'
                                  + ' where mfp.descricao like :descricao and (mfp.`CODLUBRIFICPROGFAMEQUIP` = '+QuotedStr(DM.FParamAuxiliar[1])+') and mfp.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Parte de Lubrificação de Família
      45, 450:
        begin
          if DM.FParamAuxiliar[1] <> EmptyStr then
            begin
              DM.qryAuxiliar.SQL.Add('SELECT `ordemservico`.`CODIGO`, `ordemservico`.`DESCRICAO`, `ordemservico`.`DATACADASTRO`, `funcionarios`.`NOME` AS `SOLICITANTE`, `ordemservico`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`'
                                      + ' FROM `ordemservico` LEFT JOIN `funcionarios` ON (`ordemservico`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservico`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`) LEFT JOIN `equipamentos`'
                                      + ' ON (`ordemservico`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`ordemservico`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE (`ordemservico`.`DESCRICAO` like :descricao AND `ordemservico`.`situacao` = '+QuotedStr(DM.FParamAuxiliar[1])+' AND `ordemservico`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+')'
                                      + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'' ORDER BY `ordemservico`.`DATACADASTRO` DESC');
            end
          else
            begin
              DM.qryAuxiliar.SQL.Add('SELECT `ordemservico`.`CODIGO`, `ordemservico`.`DESCRICAO`, `ordemservico`.`DATACADASTRO`, `funcionarios`.`NOME` AS `SOLICITANTE`, `ordemservico`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`'
                                      + ' FROM `ordemservico` LEFT JOIN `funcionarios` ON (`ordemservico`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservico`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`) LEFT JOIN `equipamentos`'
                                      + ' ON (`ordemservico`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`ordemservico`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE (`ordemservico`.`DESCRICAO` like :descricao AND `ordemservico`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+')'
                                      + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'' ORDER BY `ordemservico`.`DATACADASTRO` DESC');
            end;
        end; //Ordem de Serviço
      46, 460: DM.qryAuxiliar.SQL.Add('SELECT `recursos`.`CODIGO`, `recursos`.`DESCRICAO`, `familiarecursos`.`DESCRICAO` AS `FAMILIARECURSO`, `recursos`.`QUANTIDADE` FROM `recursos` INNER JOIN `familiarecursos` ON (`recursos`.`CODFAMILIARECURSO` = `familiarecursos`.`CODIGO`)'
                                       + ' WHERE `recursos`.`DESCRICAO` LIKE :descricao AND `recursos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' ORDER BY `recursos`.`DESCRICAO`'); //Recursos
      47, 470: DM.qryAuxiliar.SQL.Add('select p.`CODIGO`, p.`DESCRICAO`, f.`DESCRICAO` AS `FAMILIAEQUIP` FROM `pontosinspecao` p INNER JOIN familiaequipamento f ON (p.`CODFAMILIAEQUIP` = f.`CODIGO`) WHERE p.descricao like :descricao and p.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by p.descricao'); //Pontos de Inspeção
      48, 480: DM.qryAuxiliar.SQL.Add('SELECT `equipamentoscont`.`CODIGO`, `equipamentoscont`.`CODCONTADOR`, `equipamentoscont`.`DESCRICAO`, `contadores`.`CODPROGRAMACAO`, `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO` FROM `equipamentoscont`'
                                       +  ' INNER JOIN `contadores` ON (`equipamentoscont`.`CODCONTADOR` = `contadores`.`CODIGO`) AND (`equipamentoscont`.`CODEMPRESA` = `contadores`.`CODEMPRESA`)'
                                       +  ' LEFT JOIN `tipoprogramacao` ON (`contadores`.`CODPROGRAMACAO` = `tipoprogramacao`.`CODIGO`) WHERE (`equipamentoscont`.`DESCRICAO` LIKE :descricao and `equipamentoscont`.`CODEQUIPAMENTO` = ' + QuotedStr(DM.FParamAuxiliar[2]) + ' and `contadores`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') order by `equipamentoscont`.`DESCRICAO`'); //Contadores do Equipamento
      49: DM.qryAuxiliar.SQL.Add('SELECT `celulas`.`CODIGO`, `celulas`.`DESCRICAO`, `celulas`.`TIPO`, `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `AREA` FROM `celulas`'
                                  +  ' INNER JOIN `areas` ON (`celulas`.`CODAREA` = `areas`.`CODIGO`) AND (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                                  +  ' WHERE (`celulas`.`descricao` like :descricao AND `celulas`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND LENGTH(`celulas`.`DESCRICAO`)  > 1)'
                                  +  ' ORDER BY `celulas`.`DESCRICAO` ASC;'); //Células
      50, 5000: DM.qryAuxiliar.SQL.Add('select codigo, descricao, quantidade from recursoskit where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Kit de Recursos
      60: DM.qryAuxiliar.SQL.Add('SELECT `funcionariosausencia`.`CODIGO`, `funcionariosausencia`.`MATRICULA`, `funcionarios`.`NOME`, `funcionariosausencia`.`MOTIVO`, `funcionariosausencia`.`INICIO`, `funcionariosausencia`.`FIM`'
                                  +  ' FROM `funcionariosausencia` INNER JOIN `funcionarios` ON (`funcionariosausencia`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`funcionariosausencia`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                  +  ' WHERE ( `funcionariosausencia`.`MOTIVO` LIKE :descricao AND`funcionariosausencia`.`MATRICULA` = '+ QuotedStr(DM.FParamAuxiliar[0]) +' AND `funcionariosausencia`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `funcionariosausencia`.`INICIO` DESC'); //Ausências de Funcionários
      61: DM.qryAuxiliar.SQL.Add('select codigo, descricao from ferramentaria where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Ferramentaria
      62, 6200: DM.qryAuxiliar.SQL.Add('select codigo, descricao, quantidade from pecasreposicaokit where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Kit de Peças
      64, 6400: DM.qryAuxiliar.SQL.Add('select codigo, descricao, qtdetotalutil from lubrificantes where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao'); //Lubrificantes
      65: DM.qryAuxiliar.SQL.Add('select o.codigo, o.descricao, e.descricao as equipamento, o.datacadastro from ordemservicotercfora o inner join equipamentos e on (o.codequipamento = e.codigo) and (o.codempresa = e.codempresa) where o.descricao like :descricao and o.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by o.codigo desc'); //Ordem de Serviço Fora
      66: DM.qryAuxiliar.SQL.Add('select codigo, descricao from ordemservicotercunid where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by codigo desc'); //Ordem de Serviço Na Unidade
      67, 6700: DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO`, `DATAPROGINI`, `DATAPROGFIN`, `PREDECESSORA` FROM `ordemservicotercunidtarefas`'
                                        +  ' WHERE (`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `CODORDEMSERVICO` = ' + QuotedStr(DM.qryOrdemServicoTercUnidCODIGO.AsString) +' AND `DESCRICAO` LIKE :descricao) ORDER BY `DATAPROGINI` ASC'); //Tarefas da OS Terc.
      68: DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnico where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and tipo = ''Literatura'' order by descricao asc'); //Literturas Técnicas
      69: DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnico where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and tipo = ''Desenho'' order by descricao asc'); //Desenhos Técnicos
      70, 7000: DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnicoparam where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and tipo = '+QuotedStr(DM.FParamAuxiliar[1])+' order by descricao asc'); //Editoras, Temas, Assuntos, Tipos
      71: DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmeninfofuncper where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc'); //Despesas Mensais de Funcionários
      72: DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmendespmanut where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc'); //Despesas Mensais da Manutenção
      73: DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmenprodmensal where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc'); //Despesas Mensais da Produção
      74: DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmeninfdiversas where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc'); //Despesas Mensais Diversas
      75: DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from inddesempenho where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc'); //Indicadores de Desempenho
      76: DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `areas`.`DESCRICAO` AS `AREA`, `celulas`.`DESCRICAO` AS `CELULA`, `linhas`.`DESCRICAO` AS `LINHA`, `equipamentos`.`SEQUENCIA`, `equipamentos`.`SECUNDARIO`'
                                  +  ' FROM `equipamentos` INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                                  +  ' INNER JOIN `celulas` ON (`equipamentos`.`CODCELULA` = `celulas`.`CODIGO`) AND (`areas`.`CODIGO` = `celulas`.`CODAREA`) AND (`areas`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)'
                                  +  ' LEFT JOIN `linhas` ON (`equipamentos`.`CODLINHA` = `linhas`.`CODIGO`) AND (`celulas`.`CODAREA` = `linhas`.`CODAREA`) AND (`celulas`.`CODIGO` = `linhas`.`CODCELULA`) AND (`celulas`.`CODEMPRESA` = `linhas`.`CODEMPRESA`)'
                                  +  ' WHERE (`equipamentos`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`DESCRICAO` LIKE :descricao AND `equipamentos`.`OPERANDO` = ''S'' AND `equipamentos`.`RESERVA` = ''S'') ORDER BY `equipamentos`.`DESCRICAO` ASC;'); //Posição
      77: DM.qryAuxiliar.SQL.Add('SELECT `ferramentariaitens`.`CODFERRAMEM`, `recursos`.`DESCRICAO` AS `FERRAMENTA`, `ferramentariaitens`.`CODRECURSO`, `ferramentaria`.`CODIGO` AS `CODFERRAMENTARIA`, `ferramentaria`.`DESCRICAO` AS `FERRAMENTARIA`, `ferramentariaitens`.`QUANTIDADE`'
                                  +  ' FROM `ferramentariaitens` INNER JOIN `ferramentaria` ON (`ferramentariaitens`.`CODFERRAMEM` = `ferramentaria`.`CODIGO`) AND (`ferramentariaitens`.`CODEMPRESA` = `ferramentaria`.`CODEMPRESA`) INNER JOIN `recursos`'
                                  +  ' ON (`ferramentariaitens`.`CODRECURSO` = `recursos`.`CODIGO`) AND (`ferramentariaitens`.`CODEMPRESA` = `recursos`.`CODEMPRESA`) WHERE (`ferramentariaitens`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `recursos`.`DESCRICAO` LIKE :descricao) ORDER BY `FERRAMENTA` ASC;'); //Item de Ferramentaria
      78, 780: DM.qryAuxiliar.SQL.Add('SELECT `controlecombustivel`.`CODIGO`, `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `EQUIPAMENTO`, `controlecombustivel`.`PLACA`, `contadores`.`DESCRICAO` AS `CONTADOR`'
                                       +  ' , `controlecombustivel`.`CONTADORATUAL` AS `CONTADOR` FROM `controlecombustivel` INNER JOIN `equipamentos` ON (`controlecombustivel`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                       +  ' INNER JOIN `contadores` ON (`controlecombustivel`.`CODCONTADOR` = `contadores`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `contadores`.`CODEMPRESA`)'
                                       +  ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[1]+' LIKE :descricao AND `controlecombustivel`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `EQUIPAMENTO` ASC'); //Abastecimentos
      79, 7900: DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `controlecombustivelrotas` WHERE (`DESCRICAO` LIKE :descricao AND `CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `DESCRICAO` ASC'); //Rotas de Abastecimentos
      80, 8000: DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiapneus where descricao like :descricao order by descricao'); //Família de Pneus
      81, 8100: DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `pneusimagens` WHERE `DESCRICAO` LIKE :descricao ORDER BY `DESCRICAO` ASC'); //Imagens de Chassi
      82, 8200, 8201:
        begin
          case DM.FTabela_auxiliar of
            82, 8201:
              begin
                DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassi`.`CODIGO`, `pneusmontagemchassi`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO`, `pneusmontagemchassi`.`CHASSI`, `pneusmontagemchassi`.`PLACA` AS `Placa` FROM `pneusmontagemchassi`'
                                        +  ' INNER JOIN `pneusimagens` ON (`pneusmontagemchassi`.`CHASSI` = `pneusimagens`.`DESCRICAO`) INNER JOIN `equipamentos`'
                                        +  ' ON (`pneusmontagemchassi`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`pneusmontagemchassi`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                        +  ' WHERE (`equipamentos`.`DESCRICAO` LIKE :descricao AND `pneusmontagemchassi`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') ORDER BY `equipamentos`.`DESCRICAO` ASC');
              end;
            8200:
              begin
                DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassi`.`CODIGO`, `pneusmontagemchassi`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO`, `pneusmontagemchassi`.`CHASSI`, `pneusmontagemchassi`.`PLACA` AS `Placa` FROM `pneusmontagemchassi`'
                                        +  ' INNER JOIN `pneusimagens` ON (`pneusmontagemchassi`.`CHASSI` = `pneusimagens`.`DESCRICAO`) INNER JOIN `equipamentos`'
                                        +  ' ON (`pneusmontagemchassi`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`pneusmontagemchassi`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                        +  ' WHERE (`equipamentos`.`DESCRICAO` LIKE :descricao AND `pneusmontagemchassi`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `pneusmontagemchassi`.`CHASSI` = ''Carroceria de Carreta C/ 1 Eixo'''
                                        +  ' OR `pneusmontagemchassi`.`CHASSI` = ''Carroceria de Carreta C/ 2 Eixos'' OR `pneusmontagemchassi`.`CHASSI` = ''Carroceria de Carreta C/ 3 Eixos'') AND `pneusmontagemchassi`.`STATUS` = ''PARADO'' ORDER BY `equipamentos`.`DESCRICAO` ASC');
              end;
          end;
        end; //Montagem de Chassi/Atrelamento
      83, 8300, 8301:
        begin
          if DM.FTabela_auxiliar = 83 then
            begin
              DM.qryAuxiliar.SQL.Add('SELECT `pneus`.`CODIGO`, `pneus`.`DESCRICAO`, `familiapneus`.`DESCRICAO` AS `FAMILIAPNEU`, `pneus`.`STATUS`, `pneus`.`QUANTIDADE` FROM `pneus` INNER JOIN `familiapneus`'
                                      +  ' ON (`pneus`.`CODFAMILIAPNEU` = `familiapneus`.`CODIGO`) WHERE (`pneus`.`DESCRICAO` LIKE :descricao AND `pneus`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pneus`.`DESCRICAO` DESC');
            end
          else
          if DM.FTabela_auxiliar = 8300 then
            begin
              DM.qryAuxiliar.SQL.Add('SELECT `pneus`.`CODIGO`, `pneus`.`DESCRICAO`, `familiapneus`.`DESCRICAO` AS `FAMILIAPNEU`, `pneus`.`STATUS`, `pneus`.`QUANTIDADE` FROM `pneus` INNER JOIN `familiapneus`'
                                      +  ' ON (`pneus`.`CODFAMILIAPNEU` = `familiapneus`.`CODIGO`) WHERE (`pneus`.`DESCRICAO` LIKE :descricao AND `pneus`.`TIPO` = '+QuotedStr(DM.FParamAuxiliar[1])+' AND `pneus`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pneus`.`DESCRICAO` DESC');
            end
          else
          if DM.FTabela_auxiliar = 8301 then
            begin
              DM.qryAuxiliar.SQL.Add('SELECT `pneus`.`CODIGO`, `pneus`.`DESCRICAO`, `familiapneus`.`DESCRICAO` AS `FAMILIAPNEU`, `pneus`.`STATUS`, `pneus`.`QUANTIDADE` FROM `pneus` INNER JOIN `familiapneus`'
                                      +  ' ON (`pneus`.`CODFAMILIAPNEU` = `familiapneus`.`CODIGO`) WHERE (`pneus`.`DESCRICAO` LIKE :descricao AND `pneus`.`STATUS` = ''USADO'' AND `pneus`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pneus`.`DESCRICAO` DESC');
            end;
        end; //Pneus
      84: DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO`, `FREQUENCIA` FROM `rotasequipamento` WHERE `DESCRICAO` LIKE :descricao ORDER BY `DESCRICAO` ASC'); //Rotas
      85: DM.qryAuxiliar.SQL.Add('SELECT `CODIGO` AS `CODEQUIPAMENTO`, `DESCRICAO` AS `EQUIPATUAL`, `CODFAMILIAEQUIP`, `CODCELULA`, `CODLINHA` FROM `equipamentos`'
                                  +  ' WHERE (`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+' AND `DESCRICAO` = :descricao AND `CODLOCALIZACAO` = '+QuotedStr(DM.FParamAuxiliar[1])+''
                                  +  ' AND `CODCELULA` = '+QuotedStr(DM.FParamAuxiliar[2])+' AND `CODLINHA` = '+QuotedStr(DM.FParamAuxiliar[3])+')'); //Equipamento atual na sequência
     86: DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO`, `TIPOPONTO` FROM `monitoramento` WHERE `DESCRICAO` LIKE :descricao AND `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCRICAO` DESC'); //Monitoramento
     87: DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `pontosinspecaoloc` WHERE `DESCRICAO` LIKE :descricao AND `CODPONTOINSP` = '+QuotedStr(DM.FParamAuxiliar[1])+' AND `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCRICAO` DESC'); //Locais de Ponto de Inspeção
     88: DM.qryAuxiliar.SQL.Add('SELECT `equipamentosptosinsp`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO`, `pontosinspecaoloc`.`LIMINFSEG`, `pontosinspecaoloc`.`LIMINFMAX`, `pontosinspecaoloc`.`LIMSUPSEG`, `pontosinspecaoloc`.`LIMSUPMAX` FROM `equipamentosptosinsp`'
                                 +  ' INNER JOIN `equipamentos` ON (`equipamentosptosinsp`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`equipamentosptosinsp`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) INNER JOIN `pontosinspecaoloc` ON (`equipamentosptosinsp`.`CODEMPRESA`'
                                 +  ' = `pontosinspecaoloc`.`CODEMPRESA`) AND (`equipamentosptosinsp`.`CODPONTOINSPECAO` = `pontosinspecaoloc`.`CODPONTOINSP`) WHERE (`equipamentos`.'+DM.FParamAuxiliar[8]+'  LIKE :descricao AND `equipamentosptosinsp`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') AND `equipamentosptosinsp`.`CODPONTOINSPECAO` = '+QuotedStr(DM.FParamAuxiliar[1])
                                 +  ' GROUP BY  `equipamentosptosinsp`.`CODEQUIPAMENTO` ORDER BY `equipamentos`.`DESCRICAO` ASC'); //Equipamentos Monitorados (Pontos de Inspeção)
     89:
         DM.qryAuxiliar.SQL.Add('SELECT `equipamentoscont`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` FROM `equipamentoscont` INNER JOIN `equipamentos` ON (`equipamentoscont`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`equipamentoscont`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[8]+' LIKE :descricao AND `equipamentoscont`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `equipamentoscont`.`CODCONTADOR` = ' + QuotedStr(DM.FParamAuxiliar[1])+''
                                 + ' AND `equipamentoscont`.`CODEQUIPAMENTO` NOT IN (SELECT `controlecombustivel`.`CODEQUIPAMENTO` FROM `controlecombustivel` WHERE `controlecombustivel`.`CODEMPRESA` = `equipamentoscont`.`CODEMPRESA`'
                                 + ' AND `controlecombustivel`.`CODEQUIPAMENTO` = `equipamentoscont`.`CODEQUIPAMENTO`)) GROUP BY `equipamentoscont`.`CODEQUIPAMENTO` ORDER BY `equipamentos`.`DESCRICAO` ASC'); //Equipamentos monitorados (Contadores)
      90, 9000: DM.qryAuxiliar.SQL.Add('select codigo, descricao from pontosinspecaoloc where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codpontoinsp = '+ QuotedStr(DM.FParamAuxiliar[1]) + ' order by descricao'); //Locais de Pontos de Inspeção
      91: DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmentaxasper where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc'); //Controle de Multas
      92: DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassipneuscons`.`CODIGO`, `pneusmontagemchassipneuscons`.`ID`, `pneus`.`DESCRICAO`, `pneusmontagemchassipneuscons`.`ACAO`, `pneusmontagemchassipneuscons`.`ENVIO`, `pneusmontagemchassipneuscons`.`ENTREGA`'
                                  +  ' , `pneusmontagemchassipneuscons`.`RODAGEM`, `pneusmontagemchassipneuscons`.`SERVICO`, `fornecedor`.`DESCRICAO` AS `FORNECEDOR`, `pneusmontagemchassipneuscons`.`CUSTO` FROM `pneusmontagemchassipneuscons`'
                                  +  '  INNER JOIN `pneus` ON (`pneusmontagemchassipneuscons`.`CODPNEU` = `pneus`.`CODIGO`) AND (`pneusmontagemchassipneuscons`.`CODEMPRESA` = `pneus`.`CODEMPRESA`) INNER JOIN `fornecedor`'
                                  +  ' ON (`pneusmontagemchassipneuscons`.`CODFORNECEDOR` = `fornecedor`.`CODIGO`) WHERE (`pneus`.`DESCRICAO` LIKE :descricao AND `pneusmontagemchassipneuscons`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pneusmontagemchassipneuscons`.`ENVIO` ASC'); //Conserto de Pneus
      93: DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassipneus`.`CODIGO`, `pneusmontagemchassipneus`.`ID`, `pneus`.`DESCRICAO`, `pneusmontagemchassipneus`.`RODADOS`, `pneusmontagemchassipneus`.`CODPNEU`, `pneus`.`STATUS` FROM `pneusmontagemchassipneus`'
                                  +  ' INNER JOIN `pneus` ON (`pneusmontagemchassipneus`.`CODPNEU` = `pneus`.`CODIGO`) AND (`pneusmontagemchassipneus`.`CODEMPRESA` = `pneus`.`CODEMPRESA`)'
                                  +  ' WHERE (`pneusmontagemchassipneus`.`ID` LIKE :descricao AND `pneusmontagemchassipneus`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `pneusmontagemchassipneus`.`STATUS` = ''REPARO'''
                                  +  ' ) ORDER BY `pneusmontagemchassipneus`.`ID` DESC'); //ID de Pneus
      94: DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassi`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `pneusmontagemchassiposicoes`.`POSICAO` FROM `pneusmontagemchassiposicoes`'
                                  +  ' INNER JOIN `pneusmontagemchassi` ON (`pneusmontagemchassiposicoes`.`CODCHASSI` = `pneusmontagemchassi`.`CODIGO`) INNER JOIN `equipamentos`'
                                  +  ' ON (`pneusmontagemchassi`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`pneusmontagemchassi`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                  +  ' WHERE (`pneusmontagemchassiposicoes`.`POSICAO` LIKE :descricao AND `pneusmontagemchassiposicoes`.`CODCHASSI` =  ' + QuotedStr(DM.FParamAuxiliar[1]) + ' ) ORDER BY `pneusmontagemchassiposicoes`.`CODIGO` ASC'); //Posições do Chassi
      95, 9500: DM.qryAuxiliar.SQL.Add('SELECT `controlecombustivelviagens`.`CODIGO`, `controlecombustivelrotas`.`DESCRICAO` AS `ROTA`, `controlecombustivelviagens`.`DATAPARTIDA`, `controlecombustivelviagens`.`DATACHEGADA` FROM `controlecombustivelviagens`'
                                        +  ' INNER JOIN `controlecombustivelrotas` ON (`controlecombustivelviagens`.`CODROTA` = `controlecombustivelrotas`.`CODIGO`) WHERE (`controlecombustivelrotas`.`DESCRICAO` LIKE :descricao) ORDER BY `controlecombustivelviagens`.`DATAPARTIDA` DESC'); //Trajetos
    end;
    DM.qryAuxiliar.Params[0].AsString := '%' + SearchBoxConsulta.Text + '%';
    DM.qryAuxiliar.Open;

    if (DM.FTabela_auxiliar <> 18) and (DM.FTabela_auxiliar <> 180) and (DM.FTabela_auxiliar <> 94) and (DM.FTabela_auxiliar <> 95) then
      begin
        JvDBGridLista.Columns[0].Title.Alignment  := taCenter;
        DM.qryAuxiliar.Fields[0].Alignment    := taCenter;
        DM.qryAuxiliar.FieldByName('CODIGO').DisplayLabel := 'Código';
//        DM.qryAuxiliar.Fields[0].DisplayWidth := 15;
        DM.qryAuxiliar.Fields[0].Alignment    := taCenter;
        DM.qryAuxiliar.FieldByName('DESCRICAO').DisplayLabel := 'Descrição';
  //      DM.qryAuxiliar.Fields[1].DisplayWidth := 50;
        JvDBGridLista.Columns[DM.qryAuxiliar.FieldByName('ATIVO').Index].Title.Alignment  := taCenter;
        DM.qryAuxiliar.FieldByName('ATIVO').DisplayLabel := 'Ativo';
        DM.qryAuxiliar.FieldByName('ATIVO').Alignment    := taCenter;
        JvDBGridLista.Columns[DM.qryAuxiliar.FieldByName('VISIVEL').Index].Title.Alignment  := taCenter;
        DM.qryAuxiliar.FieldByName('VISIVEL').DisplayLabel := 'Visível';
        DM.qryAuxiliar.FieldByName('VISIVEL').Alignment    := taCenter;
        JvDBGridLista.Columns[DM.qryAuxiliar.FieldByName('DATACADASTRO').Index].Title.Alignment  := taCenter;
        DM.qryAuxiliar.FieldByName('DATACADASTRO').DisplayLabel := 'Cadastro';
        DM.qryAuxiliar.FieldByName('DATACADASTRO').Alignment    := taCenter;
        JvDBGridLista.Columns[DM.qryAuxiliar.FieldByName('CODUSUARIOCAD').Index].Title.Alignment  := taCenter;
        DM.qryAuxiliar.FieldByName('CODUSUARIOCAD').DisplayLabel := 'Usu. Cad.';
        DM.qryAuxiliar.FieldByName('CODUSUARIOCAD').Alignment    := taCenter;
        JvDBGridLista.Columns[DM.qryAuxiliar.FieldByName('DATAULTALT').Index].Title.Alignment  := taCenter;
        DM.qryAuxiliar.FieldByName('DATAULTALT').DisplayLabel := 'Alteração';
        DM.qryAuxiliar.FieldByName('DATAULTALT').Alignment    := taCenter;
        JvDBGridLista.Columns[DM.qryAuxiliar.FieldByName('CODUSUARIOALT').Index].Title.Alignment  := taCenter;
        DM.qryAuxiliar.FieldByName('CODUSUARIOALT').DisplayLabel := 'Usu. Alt.';
        DM.qryAuxiliar.FieldByName('CODUSUARIOALT').Alignment    := taCenter;
      end
    else
      begin
        DM.qryAuxiliar.Fields[0].DisplayLabel := 'Sequência';
        DM.qryAuxiliar.Fields[0].DisplayWidth := 10;
        DM.qryAuxiliar.Fields[0].Alignment    := taCenter;
        DM.qryAuxiliar.Fields[1].DisplayLabel := 'Equipamento Atual';
        DM.qryAuxiliar.Fields[1].DisplayWidth := 50;
      end;
    case DM.FTabela_auxiliar of
      12, 19, 120, 20, 200://
        begin
          DM.qryAuxiliar.Fields[2].Visible := False;
        end;
      14, 1400://Almoxarifados
        begin
          DM.qryAuxiliar.Fields[2].Visible := False;
          DM.qryAuxiliar.Fields[3].Visible := False;
          DM.qryAuxiliar.Fields[4].Visible := False;
          DM.qryAuxiliar.Fields[5].Visible := False;
        end;
      6, 7, 8, 80, 600, 700, 800, 8000://Famílias
        begin
          DM.qryAuxiliar.Fields[2].Visible := False;
          DM.qryAuxiliar.Fields[3].Visible := False;
          DM.qryAuxiliar.Fields[4].Visible := False;
          DM.qryAuxiliar.Fields[5].Visible := False;
          DM.qryAuxiliar.Fields[6].Visible := False;
          DM.qryAuxiliar.Fields[7].Visible := False;
          DM.qryAuxiliar.Fields[8].Visible := False;
          DM.qryAuxiliar.Fields[9].Visible := False;
          DM.qryAuxiliar.Fields[10].Visible := False;
          DM.qryAuxiliar.Fields[11].Visible := False;
          DM.qryAuxiliar.Fields[12].Visible := False;
        end;
      10, 100://Tipos de Manutenção
        begin
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Tipo';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 30;
        end;
      25, 250://Equipamentos
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 40;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Família';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Área';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Célula';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[5].DisplayLabel := 'Linha';
          DM.qryAuxiliar.Fields[5].DisplayWidth := 20;
          DM.qryAuxiliar.Fields[6].DisplayLabel := 'Sequência';
          DM.qryAuxiliar.Fields[6].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[7].DisplayLabel := 'Centro de Custo';
          DM.qryAuxiliar.Fields[7].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[8].Visible      := False;
          DM.qryAuxiliar.Fields[9].Visible      := False;
        end;
      34, 340, 35, 350://Inspeções de Família
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Família';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 38;
          DM.qryAuxiliar.Fields[3].DisplayLabel := '2º Programação';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[4].Visible      := False;
          DM.qryAuxiliar.Fields[5].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[6].DisplayWidth := 30;
        end;
      26://Imagens
        begin
          DM.qryAuxiliar.Fields[0].Visible := False;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Descrição';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 30;
          JvDBGridLista.Columns[1].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 12;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Equipamento';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 40;
          DM.qryAuxiliar.Fields[4].Visible      := False;
        end;
      27://Disponibilidades
        begin
          DM.qryAuxiliar.Fields[0].Visible := False;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Código';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Tipo';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 12;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Item';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 30;
        end;
      29://Usuários
        begin
          JvDBGridLista.Columns[0].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[0].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Código';
          DM.qryAuxiliar.Fields[0].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[0].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Descrição';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Nível';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[3].Visible      := False;
        end;
      30://Funcionários
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cargo';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 20;
        end;
      32, 33, 321, 331://Manutenção/Lubrificação Programada do Equipamento
        begin
          DM.qryAuxiliar.Fields[6].DisplayLabel := 'Descrição';
          DM.qryAuxiliar.Fields[6].DisplayWidth := 50;
          DM.qryAuxiliar.Fields[1].Visible := False;
          DM.qryAuxiliar.Fields[2].Visible := False;
          DM.qryAuxiliar.Fields[3].Visible := False;
          DM.qryAuxiliar.Fields[4].Visible := False;
          DM.qryAuxiliar.Fields[5].Visible := False;
          DM.qryAuxiliar.Fields[7].Visible := False;
          DM.qryAuxiliar.Fields[8].Visible := False;
          DM.qryAuxiliar.Fields[9].Visible := False;
          DM.qryAuxiliar.Fields[10].Visible := False;
          DM.qryAuxiliar.Fields[11].Visible := False;
          DM.qryAuxiliar.Fields[12].Visible := False;
          DM.qryAuxiliar.Fields[13].Visible := False;
          DM.qryAuxiliar.Fields[14].Visible := False;
          DM.qryAuxiliar.Fields[15].Visible := False;
          DM.qryAuxiliar.Fields[16].Visible := False;
          DM.qryAuxiliar.Fields[17].Visible := False;
          DM.qryAuxiliar.Fields[18].Visible := False;
          DM.qryAuxiliar.Fields[19].Visible := False;
          DM.qryAuxiliar.Fields[20].Visible := False;
          DM.qryAuxiliar.Fields[21].Visible := False;
          DM.qryAuxiliar.Fields[22].Visible := False;
          DM.qryAuxiliar.Fields[23].Visible := False;
          DM.qryAuxiliar.Fields[24].Visible := False;
          DM.qryAuxiliar.Fields[25].Visible := False;
          DM.qryAuxiliar.Fields[26].Visible := False;
          DM.qryAuxiliar.Fields[27].Visible := False;
          DM.qryAuxiliar.Fields[28].Visible := False;
        end;
      36, 360://Peças de Reposição
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 40;
          if DM.FParamAuxiliar[1] = 'REFERENCIA' then
            JvDBGridLista.Columns[2].Title.Font.Style := [fsBold];
          if DM.FParamAuxiliar[1] = 'DESCRICAO' then
            JvDBGridLista.Columns[1].Title.Font.Style := [fsBold];
          DM.qryAuxiliar.Fields[1].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
          JvDBGridLista.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Referência';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 5;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Família';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Qtde';
          JvDBGridLista.Columns[4].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[4].DisplayWidth := 5;
        end;
      37://Arquivos Técnicos
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 40;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Tipo';
          JvDBGridLista.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
        end;
      300://Funcionários
        begin
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Matrícula';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Nome';
          if DM.FParamAuxiliar[1] = 'MATRICULA' then
            JvDBGridLista.Columns[0].Title.Font.Style := [fsBold];
          if DM.FParamAuxiliar[1] = 'NOME' then
            JvDBGridLista.Columns[1].Title.Font.Style := [fsBold];
          DM.qryAuxiliar.Fields[2].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cargo';
        end;
      301://Funcionários Programados
        begin
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Matrícula';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Nome';
          if DM.FParamAuxiliar[1] = 'MATRICULA' then
            JvDBGridLista.Columns[0].Title.Font.Style := [fsBold];
          if DM.FParamAuxiliar[1] = 'NOME' then
            JvDBGridLista.Columns[1].Title.Font.Style := [fsBold];
          DM.qryAuxiliar.Fields[2].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cargo';
          DM.qryAuxiliar.Filter   := 'CARGO = '+ QuotedStr(DM.FParamAuxiliar[2]);
          DM.qryAuxiliar.Filtered := True;
        end;
      39, 390://Contadores
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[2].Visible      := False;
          DM.qryAuxiliar.Fields[3].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Programação';
        end;
      40, 45, 450://Solicitação de Trabalho_Ordem de Serviço
        begin
          DM.qryAuxiliar.Edit;
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Ordem de Serviço';
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Serviço';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 30;
          JvDBGridLista.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cadastro';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 18;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Solicitante';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 22;
          JvDBGridLista.Columns[4].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[4].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[5].DisplayLabel := 'Equipamento';
          DM.qryAuxiliar.Fields[5].DisplayWidth := 30;
        end;
      41,410:
        begin
          DM.qryAuxiliar.Fields[2].Visible := False;
        end;
      46, 460:
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 32;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Família';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Qtde';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 10;
        end;
      47://Pontos de Inspeção
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Família';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 25;
        end;
      48,480://Contadores do Equipamento
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
          DM.qryAuxiliar.Fields[3].Visible      := False;
          DM.qryAuxiliar.Fields[1].DisplayWidth := 10;
          JvDBGridLista.Columns[0].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[1].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Código';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Descrição';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Programação';
        end;
      49://Células Mecânicas
        begin
          JvDBGridLista.Columns[2].Title.Alignment := taCenter;
          DM.qryAuxiliar.Fields[2].Alignment     := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayLabel  := 'Tipo';
          DM.qryAuxiliar.Fields[2].DisplayWidth  := 15;
          JvDBGridLista.Columns[3].Title.Alignment := taCenter;
          DM.qryAuxiliar.Fields[3].DisplayLabel  := 'Cód. Área';
          DM.qryAuxiliar.Fields[3].Alignment     := taCenter;
          DM.qryAuxiliar.Fields[3].DisplayWidth  := 10;
          DM.qryAuxiliar.Fields[4].DisplayLabel  := 'Área';
          DM.qryAuxiliar.Fields[4].DisplayWidth  := 30;
        end;
      60://Ausências de Funcionários
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
          DM.qryAuxiliar.Fields[1].Visible      := False;
          DM.qryAuxiliar.Fields[2].Visible      := False;
          DM.qryAuxiliar.Fields[3].DisplayWidth := 40;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Motivo';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Início';
          DM.qryAuxiliar.Fields[5].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[5].DisplayLabel := 'Fim';
        end;
      50, 5000, 62, 6200://Kits
        begin
          DM.qryAuxiliar.Fields[2].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Qtde';
        end;
      63://Peças instaladas no equipamento
        begin
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Referência';
          DM.qryAuxiliar.Fields[0].DisplayWidth := 20;
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Referência';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 40;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Peça de Reposição';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 40;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Equipamento';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Local';
        end;
      64, 6400://Lubrificantes
        begin
          JvDBGridLista.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Qtde';
        end;
      67, 6700://Tarefas e Predecessoras
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayWidth := 18;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Início';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 18;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Fim';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Predecessora';
        end;
      71, 72, 73, 74, 75, 91://Despesas Mensais de Funcionários/Manutenção/Produção/Taxas
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Mês';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Ano';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 15;
        end;
      76:
        begin
          JvDBGridLista.Columns[2].Title.Alignment  := taLeftJustify;
          DM.qryAuxiliar.Fields[2].Alignment    := taLeftJustify;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Área';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Célula';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 20;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Linha';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 20;
          DM.qryAuxiliar.Fields[5].DisplayLabel := 'Sequência';
          DM.qryAuxiliar.Fields[5].DisplayWidth := 5;
          DM.qryAuxiliar.Fields[6].DisplayLabel := 'Secundário';
          DM.qryAuxiliar.Fields[6].DisplayWidth := 5;
          DM.qryAuxiliar.Fields[6].Alignment    := taCenter;
          if DM.FEmpTransf = False then
            begin
              DM.qryAuxiliar.Fields[4].Visible := False;
            end
          else
            begin
            end;
        end;
      77:
        begin
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Ferramenta';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Ferramentaria';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[5].DisplayLabel := 'Qtde';
          DM.qryAuxiliar.Fields[0].Visible      := False;
          DM.qryAuxiliar.Fields[2].Visible      := False;
          DM.qryAuxiliar.Fields[3].Visible      := False;
        end;
      78, 780:
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
          JvDBGridLista.Columns[0].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[1].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Equipamento';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 40;
          JvDBGridLista.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Placa';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 10;
          JvDBGridLista.Columns[3].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Medidor';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 10;
          JvDBGridLista.Columns[4].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[5].DisplayLabel := 'Contador';
          DM.qryAuxiliar.Fields[5].DisplayWidth := 10;
        end;
      79, 7900:
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
        end;
      81, 8100:
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
        end;
      82, 8200, 8201://Chassi
        begin
          DM.qryAuxiliar.Fields[0].Visible         := False;
          DM.qryAuxiliar.Fields[3].Visible         := False;
          JvDBGridLista.Columns[0].Title.Alignment     := taCenter;
          DM.qryAuxiliar.Fields[1].Alignment       := taCenter;
          DM.qryAuxiliar.Fields[1].DisplayLabel    := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[1].DisplayWidth    := 15;
          DM.qryAuxiliar.Fields[2].DisplayLabel    := 'Equipamento';
          DM.qryAuxiliar.Fields[2].DisplayWidth    := 30;
          JvDBGridLista.Columns[2].Title.Alignment     := taCenter;
          DM.qryAuxiliar.Fields[3].Alignment       := taCenter;
          DM.qryAuxiliar.Fields[3].DisplayLabel    := 'Placa';
          DM.qryAuxiliar.Fields[3].DisplayWidth    := 15;
        end;
      83,8300,8301://Pneus
        begin
          DM.qryAuxiliar.Fields[0].Visible         := False;
          DM.qryAuxiliar.Fields[1].DisplayWidth    := 30;
          DM.qryAuxiliar.Fields[2].DisplayLabel    := 'Família';
          DM.qryAuxiliar.Fields[2].DisplayWidth    := 27;
          DM.qryAuxiliar.Fields[3].DisplayLabel    := 'Status';
          DM.qryAuxiliar.Fields[3].DisplayWidth    := 10;
          DM.qryAuxiliar.Fields[4].DisplayLabel    := 'Qtde.';
          DM.qryAuxiliar.Fields[4].DisplayWidth    := 5;
        end;
      84://Rotas de Equipamento
        begin
        DM.qryAuxiliar.Fields[2].DisplayLabel := 'Frequência';
        DM.qryAuxiliar.Fields[2].DisplayWidth := 10;
        end;
      85://Equipamento atual na sequência
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth    := 20;
          DM.qryAuxiliar.Fields[2].DisplayLabel    := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[2].DisplayWidth    := 20;
          DM.qryAuxiliar.Fields[3].DisplayLabel    := 'Equipamento';
          DM.qryAuxiliar.Fields[3].DisplayWidth    := 40;
          DM.qryAuxiliar.Fields[4].Visible         := False;
          DM.qryAuxiliar.Fields[5].Visible         := False;
        end;
      86://Monitoramento
        begin
          DM.qryAuxiliar.Fields[2].DisplayLabel    := 'Tipo';
          DM.qryAuxiliar.Fields[2].DisplayWidth    := 20;
          DM.qryAuxiliar.Fields[0].Visible         := False;
        end;
      88://Equipamentos Monitorados (Pontos de Inspeção)
        begin
          DM.qryAuxiliar.Fields[2].Visible         := False;
          DM.qryAuxiliar.Fields[3].Visible         := False;
          DM.qryAuxiliar.Fields[4].Visible         := False;
          DM.qryAuxiliar.Fields[5].Visible         := False;
        end;
      90,9000://Locais de Pontos de Inspeção
        begin
          DM.qryAuxiliar.Fields[0].Visible := False;
        end;
      92://ID de Pneus
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
          DM.qryAuxiliar.Fields[1].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'ID';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Descrição';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Ação';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Envio';
          DM.qryAuxiliar.Fields[5].Visible      := False;
          DM.qryAuxiliar.Fields[6].Visible      := False;
          DM.qryAuxiliar.Fields[7].Visible      := False;
          DM.qryAuxiliar.Fields[8].Visible      := False;
          DM.qryAuxiliar.Fields[9].Visible      := False;
        end;
      93://ID de Pneus
        begin
          DM.qryAuxiliar.Fields[0].Visible      := False;
          DM.qryAuxiliar.Fields[4].Visible      := False;
          DM.qryAuxiliar.Fields[5].Visible      := False;
          DM.qryAuxiliar.Fields[1].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'ID';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Descrição';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Rodados';
        end;
      94://Posição de Pneus
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Posição';
        end;
      95, 9500://Trajetos
        begin
          DM.qryAuxiliar.Fields[0].Visible := False;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Rota';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Partida';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Chegada';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 15;
        end;
    end;

    DM.FParamAuxiliar[3] := '';
    DM.FParamAuxiliar[4] := '';
    DM.FParamAuxiliar[5] := '';
    DM.FParamAuxiliar[6] := '';
  except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao realizar a consulta. frmTelaAuxiliar: 1232', E.ClassName, E.Message);
      Application.MessageBox('Falha ao realizar a consulta!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TFrmTelaPaiParametros.btnAjudaClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
HtmlHelp(0, Pchar(ExtractFilePath(Application.ExeName) + 'Ajuda.chm' + '::/C/SPMP-Fontes/SPMP3/Manual/HTML/'+Screen.ActiveForm.Name+'/'+Screen.ActiveForm.Name+'.html'), $0000,0);
end;

procedure TFrmTelaPaiParametros.btnCancelarClick(Sender: TObject);
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
btnSalvar.ImageName := 'Operacional\salvar';
PageControlCRUD.ActivePage := TabSheetLista;
end;

procedure TFrmTelaPaiParametros.btnConsultarClick(Sender: TObject);
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

procedure TFrmTelaPaiParametros.btnExcluirClick(Sender: TObject);
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
btnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaPaiParametros.btnImprimirClick(Sender: TObject);
begin
 if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaPaiParametros.btnNovoClick(Sender: TObject);
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

PageControlCRUD.ActivePage := TabSheetCadastra;

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
btnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaPaiParametros.btnSairClick(Sender: TObject);
begin
//BtnCancelar.OnClick(Sender);
Close;
end;

procedure TFrmTelaPaiParametros.btnSalvarClick(Sender: TObject);
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
btnSalvar.ImageName := 'Operacional\salvar';
PageControlCRUD.ActivePage := TabSheetLista;
end;

procedure TFrmTelaPaiParametros.ChbAtivoConsClick(Sender: TObject);
begin
  if ChbAtivoCons.Checked = True then
  begin

    DM.qryAuxiliar.Filter := 'ATIVO = ''S''';
    DM.qryAuxiliar.Filtered := True;
  end else
  begin
    DM.qryAuxiliar.Filter := '';
    DM.qryAuxiliar.Filtered := False;
  end;
end;

procedure TFrmTelaPaiParametros.chbVisivelConsClick(Sender: TObject);
begin
  if ChbVisivelCons.Checked = True then
  begin
    DM.qryAuxiliar.Filter := 'VISIVEL = ''S''';
    DM.qryAuxiliar.Filtered := True;
  end else
  begin
    DM.qryAuxiliar.Filter := '';
    DM.qryAuxiliar.Filtered := False;
  end;
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
        btnSalvar.Enabled    := False;
        BtnCancelar.Enabled  := False;
        BtnExcluir.Enabled   := False;
        BtnConsultar.Enabled := True;
        BtnSair.Enabled      := True;
      end;
    1://Incluindo
      begin
        BtnNovo.Enabled      := False;
        btnSalvar.Enabled    := True;
        BtnCancelar.Enabled  := True;
        BtnExcluir.Enabled   := False;
        BtnConsultar.Enabled := False;
        BtnSair.Enabled      := False;
      end;
    2://Consultando_Editando
      begin
        BtnNovo.Enabled      := True;
        btnSalvar.Enabled    := True;
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
//if BtnSair.Enabled = False then Abort;

DM.FModulo := Screen.ActiveForm.Caption;
//DM.RegistrarMovimentacao('SAIDA', DM.FCodEmpresa, DM.FCodUsuario, DM.FModulo, DM.FEstacao);

DM.MSGAguarde('', False);
  Try
    FreeAndNil(Self);
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
var
  i: SmallInt;
begin
StatusBar1.Font.Size := 7;
StatusBar1.Panels[0].Text := DM.FNomeUsuario;
StatusBar1.Panels[1].Text := DM.FNivelAcesso;
StatusBar1.Panels[2].Text := DM.FNomeEmpresa;
StatusBar1.Panels[3].Text := DM.FNomeGrupo;

DM.FAlterando := True;
BtnNovo.Enabled := True;
btnSalvar.Enabled := False;
BtnCancelar.Enabled := False;
BtnExcluir.Enabled := False;
ControleBotoes(0);

//JvDBGridLista.DataSource := DM.FDataSourceParam;

//for i := 1 to TFDQuery(DM.FDataSourceParam.DataSet).ParamCount do
//  begin
//    if SameText(ParamStr(i), '/CODEMPRESA') then
//      TFDQuery(DM.FDataSourceParam.DataSet).ParamByName('CODEMPRESA').AsString := DM.FCodEmpresa;
//  end;

//TFDQuery(DM.FDataSourceParam.DataSet).Open;
end;

procedure TFrmTelaPaiParametros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if Key = 27 then
//  begin
//    if Application.MessageBox('Deseja realmente sair?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
//      Close;
//  end;
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

procedure TFrmTelaPaiParametros.FormResize(Sender: TObject);
begin
  AjustaLarguraMinTituloGrid(JvDBGridLista);
end;

procedure TFrmTelaPaiParametros.FormShow(Sender: TObject);
begin
  inherited;
  TabSheetLista.TabVisible    := False;
  TabSheetCadastra.TabVisible := False;
  PageControlCRUD.ActivePage  := TabSheetLista;
  Consultar;
  if DM.FTabela_auxiliar = 0 then
  begin
    PageControlCRUD.ActivePageIndex := 1;
  end else
  begin
    if JvDBGridLista.DataSource.DataSet.FindField('ATIVO').FieldName = '' then
      ChbAtivoCons.Visible := False;
    if JvDBGridLista.DataSource.DataSet.FindField('VISIVEL').FieldName = '' then
      ChbVisivelCons.Visible := False;
    SearchBoxConsulta.SetFocus;
  end;
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

procedure TFrmTelaPaiParametros.JvDBGridListaDblClick(Sender: TObject);
var
c:SmallInt;
begin
  if DM.DSAuxiliar.DataSet.Active = False then Exit;
//  if EdtConsulta.Focused = True then Exit;

  case DM.FTabela_auxiliar of
   28, 31, 87, 100, 110, 120, 130, 150, 160, 170, 200, 210, 220, 230, 240, 300, 301, 320, 330, 370, 380, 400, 420, 430, 440, 450, 460, 470, 490, 500, 5000, 600, 700, 800, 900, 6400, 7000, 7900, 8000, 8301, 8100, 9000, 9500://Combos e outras consultas
     begin
       DM.FCodCombo   := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo := DM.DSAuxiliar.DataSet.Fields[1].AsString;
     end;
   0://Grupos
     begin
       with DM.dsGrupos.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   1://Unidades
     begin
       with DM.dsUnidades.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FParamAuxiliar[0];
           Open;
           Edit;
         end;
     end;
   2://Adm. Corporativo
     begin
       with DM.dsAdmCorp.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   3://Adm. Unidade
     begin
       with DM.dsAdmUnid.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FParamAuxiliar[0];
           Open;
           Edit;
         end;
     end;
   4://Centro de Custo
     begin
       with DM.dsCentroCusto.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   5://Classes
     begin
       with DM.dsClasses.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   6://Famílias de Equipamentos
     begin
       with DM.dsFamEquipamento.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   7://Famílias de Peças
     begin
       with DM.dsFamPecasRep.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   8://Famílias de Recursos
     begin
       with DM.dsFamRecursos.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   9://Causas de Falhas
     begin
       with DM.dsCausaFalha.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   10://Tipos de Manutenções
     begin
       with DM.dsTipoManutencao.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   11://Motivos de Paradas
     begin
       with DM.dsMotivoParada.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   12://Tipos de Programação
     begin
       with DM.dsTipoProgramacao.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   13://Cargos
     begin
       with DM.dsCargos.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   14://Almoxarifados
     begin
       with DM.dsAlmoxarifado.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   15://Áreas
     begin
       with DM.dsAreas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   16://Células
     begin
       with DM.dsCelulas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Params[2].AsString := DM.qryAreasCODIGO.AsString;
           Open;
           Edit;
         end;
     end;
   17://Linhas
     begin
       with DM.dsLinhas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Params[2].AsString := DM.qryAreasCODIGO.AsString;
           Params[3].AsString := DM.qryCelulasCODIGO.AsString;
           Open;
           Edit;
         end;
     end;
   18, 180://Sequencias
     begin
       DM.FCodCombo   := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo := DM.DSAuxiliar.DataSet.Fields[2].AsString;
       DM.FParamAuxiliar[4] := DM.DSAuxiliar.DataSet.Fields[1].AsString;
     end;
   19://Feriados
     begin
       with DM.dsFeriados.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   20://Oficinas
     begin
       with DM.dsOficinas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   21://Fornecedores
     begin
       with DM.dsFornecedores.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   22://Fabricantes
     begin
       with DM.dsFabricantes.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   23://Calendário de Mão de Obra
     begin
       with DM.dsCalendMObra.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
           DM.qryCalendMObraSeqHora.Open;
           DM.qryCalendMObraSeqHora.Edit;
         end;
     end;
   24://Calendário de Equipamentos
     begin
       with DM.dsCalendEquip.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
           DM.qryCalendEquipSeqHora.Open;
           DM.qryCalendEquipSeqHora.Edit;
         end;
     end;
   25://Equipamentos
     begin
       with DM.dsEquipamentos.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   250://Equipamentos
     begin
       DM.FCodCombo   := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.DSAuxiliar.DataSet.Fields[3].AsString;
       DM.FParamAuxiliar[3] := DM.DSAuxiliar.DataSet.Fields[4].AsString;
       DM.FParamAuxiliar[4] := DM.DSAuxiliar.DataSet.Fields[5].AsString;
       DM.FParamAuxiliar[5] := DM.DSAuxiliar.DataSet.Fields[8].AsString;
       DM.FParamAuxiliar[6] := DM.DSAuxiliar.DataSet.Fields[9].AsString;
     end;
   26://Imagens
     begin
       with DM.dsImagens.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   27://Disponibilidades
     begin
       with DM.dsDispAdmissiveis.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsInteger := DM.DSAuxiliar.DataSet.Fields[0].AsInteger;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
           DM.FParamAuxiliar[0] := DM.DSAuxiliar.DataSet.Fields[2].AsString;
         end;
     end;
   29://Usuários
     begin
       with DM.dsUsuarios.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   2900:
     begin
       DM.FCodCombo   := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[0] := DM.DSAuxiliar.DataSet.Fields[3].AsString;
     end;
   30://Funcionários
     begin
       with DM.dsFuncionarios.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   32://Manutenção Programada de Equipamento
     begin
       with DM.dsManutProgEquip.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Params[2].AsString := DM.FParamAuxiliar[0];
           Open;
           Edit;
           DM.FParamAuxiliar[1] := DM.DSAuxiliar.DataSet.Fields[24].AsString; //LblProgramarPor
         end;
     end;
   33://Lubrificação Programada de Equipamento
     begin
       with DM.dsLubrificProgEquip.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Params[2].AsString := DM.FParamAuxiliar[0];
           Open;
           Edit;
           DM.FParamAuxiliar[1] := DM.DSAuxiliar.DataSet.Fields[24].AsString; //LblProgramarPor
         end;
     end;
   34://Manutenção de Família de Equipamento
     begin
       with DM.dsManutProgFamEquip.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   340, 350://Peças de Reposição do Equipamento/Manutenção de Família de Equipamentos/Lubrificação de Família de Equipamento
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('PROGRAMARPOR2').AsString;
       DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('Frequência').AsString;
     end;
   35://Lubrificação de Família de Equipamento
     begin
       with DM.dsLubrificProgFamEquip.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   36://Peças de Reposição do Equipamento
     begin
       with DM.dsPecasReposicao.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   360://Peças de Reposição do Equipamento
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('REFERENCIA').AsString;
       DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('QUANTIDADE').AsString;
     end;
   37:
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[1] := DM.qryAuxiliar.FieldByName('TIPO').AsString;
     end;
   39://Contadores
     begin
       with DM.dsContadores.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   390://Contadores
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('CODPROGRAMACAO').AsString;
       DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('PROGRAMACAO').AsString;
     end;
   40://Solicitação de Trabalho
     begin
       with DM.dsSolicitacaoTrab.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsInteger := DM.DSAuxiliar.DataSet.Fields[6].AsInteger;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   41://Plano de Trabalho
     begin
       with DM.dsPlanoTrabalho.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   410://Plano de Trabalho
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('DETALHES').AsString;
     end;
   42://Monitoramento
     begin
       with DM.dsMonitoramento.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   45://Ordem de Serviço
     begin
       with DM.dsOrdemServico.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.FCodEmpresa;
           Params[1].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   46://Recursos
     begin
       with DM.dsRecursos.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   47://Pontos de Inspeção
     begin
       with DM.dsPontosInspecao.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   48://Medidores do Equipamento
     begin
       with DM.dsContadores.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   480: //Medidores do Equipamento
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[2].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('CODPROGRAMACAO').AsString;
       DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('PROGRAMACAO').AsString;
     end;
   49://Células da Mecânica
     begin
       DM.FCodCombo   := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[1] := DM.qryAuxiliar.FieldByName('CODAREA').AsString;
     end;
   50://Kit de Recursos
     begin
       with DM.dsRecursoKit.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.FCodEmpresa;
           Params[1].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   60://Ausências de Funcionários
     begin
       with DM.dsFuncionariosAusencias.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   61://Ferramentaria
     begin
       with DM.dsFerramentaria.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   62://Kit de Peças
     begin
       with DM.dsPecaReposicaoKit.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.FCodEmpresa;
           Params[1].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   64://Lubrificantes
     begin
       with DM.dsLubrificantes.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   65://Ordem de Serviço Fora
     begin
       with DM.dsOrdemServicoTercFora.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   66://Ordem de Serviço na Unidade
     begin
       with DM.dsOrdemServicoTercUnid.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   67://Tarefas
     begin
       with DM.dsOrdemServicoTercUnidTarefas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FParamAuxiliar[0];
           Open;
           Edit;
           DM.FParamAuxiliar[1] := DM.DSAuxiliar.DataSet.Fields[0].AsString;
         end;
     end;
   6700://Predecessoras
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('DATAPROGINI').AsString;
       DM.FParamAuxiliar[4] := DM.qryAuxiliar.FieldByName('DATAPROGFIN').AsString;
     end;
   68, 69://Arquivos e Desenhos Técnicos
     begin
       with DM.dsArquivoTecnico.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           if DM.FTabela_auxiliar = 68 then
             Params[2].AsString := 'Literatura'
           else
             Params[2].AsString := 'Desenho';
           Open;
           Edit;
         end;
     end;
   70:// Parâmetros de Arquivos Técnicos
     begin
       with DM.dsArquivoTecnicoParam.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Params[2].AsString := DM.FParamAuxiliar[1];
           Open;
           Edit;
         end;
     end;
   71://Despesas Mensais de Funcionários
     begin
       with DM.dsDespMensalFuncPer.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   72://Despesas Mensais da Manutenção
     begin
       with DM.dsDespMensalManutencao.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   73://Despesas Mensais da Produção
     begin
       with DM.dsDespMensalProdMensal.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   74://Despesas Mensais Diversas
     begin
       with DM.dsDespMensalDiversas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   75://Indicadores de Desempenho
     begin
       with DM.dsIndDesempenho.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   76://Posição
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
     end;
   77://Item da Ferramentaria
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('CODRECURSO').AsString;
       DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('FERRAMENTARIA').AsString;
       DM.FParamAuxiliar[4] := DM.qryAuxiliar.FieldByName('QUANTIDADE').AsString;
     end;
   78://Abastecimentos
     begin
       with DM.dsAbastecimentos.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[1].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
  780://Satélite
    begin
      DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[1].AsString;
      DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[2].AsString;
      DM.FParamAuxiliar[1] := DM.qryAuxiliar.FieldByName('PLACA').AsString;
    end;
   79://Rotas de Abastecimentos
     begin
       with DM.dsAbastecimentosRotas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.FCodEmpresa;
           Params[1].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   80://Família de Pneus
     begin
       with DM.dsFamPneus.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   82://Chassis
     begin
       with DM.dsPneusChassi.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[1].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   8200, 8201://Atrelamento
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[2].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('CHASSI').AsString;
       DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('PLACA').AsString;
     end;
   83://Pneus
     begin
       with DM.dsPneus.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   8300://Instalação de Pneu
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('STATUS').AsString;
     end;
   84://Rotas
     begin
       with DM.dsRotas.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   85://Equipamento atual na sequência
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[5] := DM.qryAuxiliar.FieldByName('EQUIPATUAL').AsString;
       DM.FParamAuxiliar[6] := DM.qryAuxiliar.FieldByName('CODEQUIPAMENTO').AsString;
       DM.FParamAuxiliar[7] := DM.qryAuxiliar.FieldByName('CODFAMILIAEQUIP').AsString;
     end;
   86://Monitoramento
     begin
       with DM.dsMonitoramento.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
           DM.qryMonitMedicoesPtosInsp.Close;
           DM.qryMonitMedicoesCont.Close;
         end;
     end;
   88://Equipamentos Monitorados (Pontos de Inspeção)
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.FCodCombo;
       DM.FParamAuxiliar[3] := DM.FValorCombo;
       DM.FParamAuxiliar[4] := DM.qryAuxiliar.FieldByName('LIMINFMAX').AsString;
       DM.FParamAuxiliar[5] := DM.qryAuxiliar.FieldByName('LIMINFSEG').AsString;
       DM.FParamAuxiliar[6] := DM.qryAuxiliar.FieldByName('LIMSUPSEG').AsString;
       DM.FParamAuxiliar[7] := DM.qryAuxiliar.FieldByName('LIMSUPMAX').AsString;
     end;
   89://Equipamentos monitorados (Contadores)
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.FCodCombo;
       DM.FParamAuxiliar[3] := DM.FValorCombo;
       DM.FParamAuxiliar[4] := EmptyStr;
       DM.FParamAuxiliar[5] := EmptyStr;
       DM.FParamAuxiliar[6] := EmptyStr;
       DM.FParamAuxiliar[7] := EmptyStr;
     end;
   90://Locais de Pontos de Inspeção
     begin
       with DM.dsPontosInspecaoLoc.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Params[2].AsString := DM.qryPontosInspecaoCODIGO.AsString;
           Open;
           Edit;
         end;
     end;
   91://Taxas
     begin
       with DM.dsDespMensalTaxasPer.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
   92://Conserto de Pneus
     begin
       with DM.dsPneusChassiPneusConsertos.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Params[1].AsString := DM.FCodEmpresa;
           Open;
           Edit;
         end;
     end;
   93://ID de Pneus
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[2].AsString;
       DM.FParamAuxiliar[2] := DM.DSAuxiliar.DataSet.Fields[3].AsString;
       DM.FParamAuxiliar[3] := DM.DSAuxiliar.DataSet.Fields[4].AsString;
       DM.FParamAuxiliar[4] := DM.DSAuxiliar.DataSet.Fields[5].AsString;
     end;
   94://Posição de Pneus
     begin
       DM.FCodCombo         := DM.DSAuxiliar.DataSet.Fields[0].AsString;
       DM.FValorCombo       := DM.DSAuxiliar.DataSet.Fields[1].AsString;
       DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('POSICAO').AsString;
     end;
   95://Viagens
     begin
       with DM.dsViagens.DataSet as TFDQuery do
         begin
           Close;
           Params[0].AsString := DM.FCodEmpresa;
           Params[1].AsString := DM.DSAuxiliar.DataSet.Fields[0].AsString;
           Open;
           Edit;
         end;
     end;
  end;

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

  DM.FAlterando := True;
  if DM.FDataSetParam.IsEmpty = False then
    ControleBotoes(2)
  else
    ControleBotoes(0);

  PageControlCRUD.ActivePage := TabSheetCadastra;
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
btnSalvar.OnClick(Sender);
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

procedure TFrmTelaPaiParametros.SearchBoxConsultaInvokeSearch(Sender: TObject);
begin
  Consultar;
end;

procedure TFrmTelaPaiParametros.SearchBoxConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Consultar;
end;

procedure TFrmTelaPaiParametros.TabNextTab1AfterTabChange(Sender: TObject);
begin
if DM.FDataSetParam.Modified = True then btnSalvar.ImageName := 'Operacional\naosalvo'
else btnSalvar.ImageName := 'Operacional\salvar';
end;

end.

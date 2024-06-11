unit UnTelaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.DBClient, UnTelaPaiOkCancel,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Intf,
  JvExDBGrids, JvDBGrid;

type
  TFrmTelaAuxiliar = class(TFrmTelaPaiOKCancel)
    BtnConsultar: TButton;
    EdtConsulta: TEdit;
    PFiltroEquip: TPanel;
    Label6: TLabel;
    EdtFamiliaEquip: TEdit;
    BtnFamiliaEquip: TButton;
    Label13: TLabel;
    edtArea: TEdit;
    BtnArea: TButton;
    Label1: TLabel;
    edtLinha: TEdit;
    BtnLinha: TButton;
    Label2: TLabel;
    EdtCelula: TEdit;
    BtnCelula: TButton;
    GrdAuxiliar: TJvDBGrid;
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure GrdAuxiliarDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdtFamiliaEquipDblClick(Sender: TObject);
    procedure BtnFamiliaEquipClick(Sender: TObject);
    procedure edtAreaDblClick(Sender: TObject);
    procedure BtnAreaClick(Sender: TObject);
    procedure edtLinhaDblClick(Sender: TObject);
    procedure BtnLinhaClick(Sender: TObject);
    procedure EdtCelulaDblClick(Sender: TObject);
    procedure BtnCelulaClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdAuxiliarTitleClick(Column: TColumn);

  private
    { Private declarations }

    procedure CliqueNoTitulo(Column: TColumn; FDQuery: TFDQuery; IndiceDefault: String);

  public
    { Public declarations }

  end;


var
  FrmTelaAuxiliar: TFrmTelaAuxiliar;

implementation

{$R *.dfm}

uses UnTelaCadMonitMedicoes, UnDM;

procedure TFrmTelaAuxiliar.CliqueNoTitulo(Column: TColumn; FDQuery: TFDQuery; IndiceDefault: String);
var
  sIndexName: string;
  oOrdenacao: TFDSortOption;
  i: smallint;
begin
  // retira a formatação em negrito de todas as colunas
  for i := 0 to GrdAuxiliar.Columns.Count - 1 do
    GrdAuxiliar.Columns[i].Title.Font.Style := [];

  // configura a ordenação ascendente ou descendente
  if TFDQuery(GrdAuxiliar.DataSource.DataSet).IndexName = Column.FieldName + '_ASC' then
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
  if not Assigned(TFDQuery(GrdAuxiliar.DataSource.DataSet).Indexes.FindIndex(sIndexName)) then
    TFDQuery(GrdAuxiliar.DataSource.DataSet).AddIndex(sIndexName, Column.FieldName, EmptyStr, [oOrdenacao]);

  // formata o título da coluna em negrito
  Column.Title.Font.Style := [fsBold];

  // atribui a ordenação selecionada
  TFDQuery(GrdAuxiliar.DataSource.DataSet).IndexName := sIndexName;

  TFDQuery(GrdAuxiliar.DataSource.DataSet).First;
end;

procedure TFrmTelaAuxiliar.BtnAreaClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 150;
    DM.FNomeConsulta := 'Áreas';
    DM.FPromptConsulta := 'Informe a descrição a ser consultada';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.FCodArea     := DM.FCodCombo;
        edtArea.Text := DM.FValorCombo;
        DM.FParamAuxiliar[18] := DM.FCodArea;
        DM.FParamAuxiliar[19] := '';
        EdtCelula.Clear;
        DM.FParamAuxiliar[20] := '';
        edtLinha.Clear;
      end;
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    BtnConsultar.OnClick(Sender);
  end;
end;

procedure TFrmTelaAuxiliar.BtnCelulaClick(Sender: TObject);
begin
  inherited;
if edtArea.Text = '' then
  begin
    edtArea.SetFocus;
    Exit;
  end;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 160;
    DM.FNomeConsulta := 'Células';
    DM.FPromptConsulta := 'Informe a descrição a ser consultada';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.FCodCelula         := DM.FCodCombo;
        edtCelula.Text        := DM.FValorCombo;
        DM.FParamAuxiliar[19] := DM.FCodCelula;
        DM.FParamAuxiliar[20] := '';
        edtLinha.Clear;
      end;
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    BtnConsultar.OnClick(Sender);
  end;
end;

procedure TFrmTelaAuxiliar.BtnConsultarClick(Sender: TObject);
var
  LMensagem: PChar;
begin
  inherited;
  try
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.Fields.Clear;
    DM.qryAuxiliar.Indexes.Clear;
    DM.qryAuxiliar.SQL.Clear;
    case DM.FTabela_auxiliar of
      0://Grupos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from grupos where descricao like :descricao order by descricao');
        end;
      1://Unidades
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, nome from empresa where nome like :descricao and codgrupo = '+QuotedStr(DM.FParamAuxiliar[0]) + ' order by nome');
        end;
      2://Adm. Corporativo
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where nome like :descricao and codnivelacesso = ''ADC-00001'' OR codnivelacesso = ''USC-00001'' order by nome');
        end;
      3://Adm. Unidade
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where nome like :descricao and codnivelacesso = ''ADU-00001'' and codempresa = '+QuotedStr(DM.FParamAuxiliar[0]) + '  order by nome');
        end;
      4, 400://Centro de Custo
        begin
          if DM.FTabela_auxiliar = 400 then
            DM.qryAuxiliar.SQL.Add('select codigo, descricao from centrocusto where visivel = ''S'' and descricao like :descricao order by descricao')
          else
            DM.qryAuxiliar.SQL.Add('select codigo, descricao from centrocusto where descricao like :descricao order by descricao')
        end;
      5, 500://Classes
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from classes where descricao like :descricao order by descricao');
        end;
      6, 600://Famílias de Equipamentos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiaequipamento where descricao like :descricao order by descricao');
        end;
      7, 700://Famílias de Peças
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiapecasreposicao where descricao like :descricao order by descricao');
        end;
      8, 800://Famílias de Recursos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiarecursos where descricao like :descricao order by descricao');
        end;
      9, 900://Causas de Falhas
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from causasfalha where descricao like :descricao order by descricao');
        end;
      10, 100://Tipos de Manutenção
        begin
          if  DM.FTabela_auxiliar = 100 then
            DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipomanutencao, ativo, visivel from tipomanutencao where descricao like :descricao and visivel = ''S'' order by tipomanutencao, descricao')
          else
            DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipomanutencao, ativo, visivel from tipomanutencao where descricao like :descricao order by tipomanutencao, descricao');
        end;
      11, 110://Motivos de Parada
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from motivoparada where descricao like :descricao order by descricao');
        end;
      12,120://Tipos de Programação
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipo from tipoprogramacao where descricao like :descricao  order by descricao');
        end;
      13, 130://Cargos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from cargos where descricao like :descricao  order by descricao');
        end;
      14://Almoxarifados
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `almoxarifado`.`CODIGO`, `almoxarifado`.`DESCRICAO`, `almoxarifado`.`MATERIAL`, `almoxarifado`.`NUMITENS`, `almoxarifado`.`AREA`, `centrocusto`.`DESCRICAO`CENTROCUSTO'
                                  + ' FROM `almoxarifado` INNER JOIN `centrocusto` ON (`almoxarifado`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `almoxarifado`.`DESCRICAO` LIKE :descricao AND `almoxarifado`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      15, 150://Áreas
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from areas where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      151://Áreas (Relatório) Geral
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`, `celulas`.`CODIGO` AS `CODCELULA`, `celulas`.`DESCRICAO` AS `DESCCELULA`, `linhas`.`CODIGO` AS `CODLINHA`,'
                                  + ' `linhas`.`DESCRICAO` AS `DESCLINHA`'
                                  + ' FROM `celulas` LEFT JOIN `areas` ON (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`)'
                                  + ' LEFT JOIN `linhas` ON (`celulas`.`CODIGO` = `linhas`.`CODCELULA`) AND (`celulas`.`CODAREA` = `linhas`.`CODAREA`) AND (`celulas`.`CODEMPRESA` = `linhas`.`CODEMPRESA`)'
                                  + ' WHERE `areas`.`DESCRICAO` LIKE :descricao AND `areas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCAREA`, `DESCCELULA`, `DESCLINHA`');
        end;
      16, 160://Células
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from celulas where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codarea = '+ QuotedStr(DM.FParamAuxiliar[18]) + ' order by descricao');
        end;
      17, 170://Linhas
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from linhas where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codarea = ' + QuotedStr(DM.FParamAuxiliar[18]) + ' and codcelula = ' + QuotedStr(DM.FParamAuxiliar[19]) + ' order by descricao');
        end;
      18, 180://Sequências
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `SEQUENCIA`, `CODIGO` AS `CODEQUIPAMENTO`, `DESCRICAO` FROM `equipamentos` WHERE (`SEQUENCIA` IS NOT NULL AND `DESCRICAO` LIKE :descricao AND `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `CODLOCALIZACAO` = ' + QuotedStr(DM.FParamAuxiliar[18]) + ' AND `CODCELULA` = ' + QuotedStr(DM.FParamAuxiliar[19]) + ' AND `CODLINHA` = ' + QuotedStr(DM.FParamAuxiliar[20]) + ' AND `OPERANDO` = ''S'') ORDER BY `SEQUENCIA` ASC');
        end;
      19://Feriados
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, dataferiado from feriados where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      20, 200://Oficinas
        begin
          if  DM.FTabela_auxiliar = 200 then
            DM.qryAuxiliar.SQL.Add('SELECT `oficinas`.`CODIGO`, `oficinas`.`DESCRICAO`, `centrocusto`.`DESCRICAO`CENTROCUSTO FROM `oficinas` INNER JOIN `centrocusto`'
                                    + ' ON (`oficinas`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `oficinas`.`DESCRICAO` LIKE :descricao and `oficinas`.`visivel` = ''S'' AND `oficinas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao')
          else
            DM.qryAuxiliar.SQL.Add('SELECT `oficinas`.`CODIGO`, `oficinas`.`DESCRICAO`, `centrocusto`.`DESCRICAO`CENTROCUSTO FROM `oficinas` INNER JOIN `centrocusto`'
                                    + ' ON (`oficinas`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `oficinas`.`DESCRICAO` LIKE :descricao AND `oficinas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      21, 210://Fornecedores
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from fornecedor where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      22, 220://Fabricantes
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from fabricante where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      23, 230://Calendário de Mão de Obra
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from calendario where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      24, 240://Calendário de Equipamentos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from calendarioequip where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      25, 250, 251://Equipamentos, Equipamentos Rotas
        begin
          if (DM.FParamAuxiliar[1] <> 'CODIGO') and (DM.FParamAuxiliar[1] <> 'DESCRICAO') then
            DM.FParamAuxiliar[1] := 'DESCRICAO';
          if (DM.FTabela_auxiliar = 25) or (DM.FTabela_auxiliar = 250) then
            DM.qryAuxiliar.SQL.Add('SELECT '
                                    + ' `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `equipamentos`.`CODFAMILIAEQUIP`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP'
                                    + ', `equipamentos`.`CODCENTROCUSTO`, `centrocusto`.`DESCRICAO` CENTROCUSTO'
                                    + ', `equipamentos`.`CODLOCALIZACAO` CODAREA, `areas`.`DESCRICAO` AREA, `equipamentos`.`CODCELULA`, `celulas`.`DESCRICAO` CELULA'
                                    + ', `equipamentos`.`CODLINHA`, `linhas`.`DESCRICAO` LINHA, `equipamentos`.`SEQUENCIA`, `equipamentos`.`OPERANDO`'
                                    + ' FROM `equipamentos`'
                                    + ' INNER JOIN `centrocusto` ON (`equipamentos`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`)'
                                    + ' LEFT JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)'
                                    + ' LEFT JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                                    + ' LEFT JOIN `celulas` ON (`equipamentos`.`CODCELULA` = `celulas`.`CODIGO`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`) AND (`celulas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                    + ' LEFT JOIN `linhas` ON (`equipamentos`.`CODLINHA` =  `linhas`.`CODIGO`) AND (`linhas`.`CODCELULA` = `celulas`.`CODIGO`) AND (`linhas`.`CODAREA` = `areas`.`CODIGO`) AND (`linhas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                    + ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[1]+' like :descricao and `equipamentos`.`codempresa` = '+QuotedStr(DM.FCodEmpresa) + '')
          else
            DM.qryAuxiliar.SQL.Add('SELECT '
                                    + ' `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `equipamentos`.`CODFAMILIAEQUIP`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP'
                                    + ', `equipamentos`.`CODCENTROCUSTO`, `centrocusto`.`DESCRICAO` CENTROCUSTO'
                                    + ', `equipamentos`.`CODLOCALIZACAO` CODAREA, `areas`.`DESCRICAO` AREA, `equipamentos`.`CODCELULA`, `celulas`.`DESCRICAO` CELULA'
                                    + ', `equipamentos`.`CODLINHA`, `linhas`.`DESCRICAO` LINHA, `equipamentos`.`SEQUENCIA`, `equipamentos`.`OPERANDO`'
                                    + ' INNER JOIN `centrocusto` ON (`equipamentos`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`)'
                                    + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)'
                                    + ' INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                                    + ' INNER JOIN `celulas` ON (`equipamentos`.`CODCELULA` = `celulas`.`CODIGO`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`) AND (`celulas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                    + ' INNER JOIN `linhas` ON (`equipamentos`.`CODLINHA` =  `linhas`.`CODIGO`) AND (`linhas`.`CODCELULA` = `celulas`.`CODIGO`) AND (`linhas`.`CODAREA` = `areas`.`CODIGO`) AND (`linhas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                    + ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[1]+' like :descricao and `equipamentos`.`codempresa` = '+QuotedStr(DM.FCodEmpresa) + '');
          if (DM.FTabela_auxiliar = 250) or (DM.FTabela_auxiliar = 251) then
                        DM.qryAuxiliar.SQL.Add(' AND `OPERANDO` = ''S''');
          if DM.FCodFamilia <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODFAMILIAEQUIP` = '+QuotedStr(DM.FCodFamilia));
          if DM.FCodArea <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODLOCALIZACAO` = '+QuotedStr(DM.FCodArea));
          if DM.FCodCelula <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODCELULA` = '+QuotedStr(DM.FCodCelula));
          if DM.FCodLinha <> '' then
                                    DM.qryAuxiliar.SQL.Add(' AND `equipamentos`.`CODLINHA` = '+QuotedStr(DM.FCodLinha));
          DM.qryAuxiliar.SQL.Add(' ) order by `equipamentos`.`DESCRICAO`, `areas`.`DESCRICAO`, `celulas`.`DESCRICAO`, `linhas`.`DESCRICAO`, `equipamentos`.`SEQUENCIA`');
        end;
      26://Imagens
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `imagens`.`CODIGO`, `imagens`.`DESCRICAO`, `imagens`.`CODEQUIPAMENTO` CODEQUIPAMENTO, `equipamentos`.`DESCRICAO`EQUIPAMENTO, `imagens`.`DESCSECUNDARIO`PONTO FROM `imagens` LEFT JOIN `equipamentos`'
                                 + ' ON (`imagens`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) AND (`equipamentos`.`CODIGO` = `imagens`.`CODEQUIPAMENTO`) WHERE (`imagens`.`DESCRICAO` like :descricao AND `imagens`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `imagens`.descricao');
        end;
      27://Disponibilidades
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, coditem, tipoitem, valitem from disponibilidade where coditem like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by coditem');
        end;
      28://Nível de Acesso
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from nivelacesso where descricao like :descricao and codigo <> ''ADC-00001'' and codigo <> ''ADU-00001'' order by descricao');
        end;
      29, 2900://Usuários
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `usuario`.`CODIGO`, `usuario`.`NOME`, `nivelacesso`.`DESCRICAO`NIVELACESSO, `usuario`.`CODPERMISSAOACESSO` FROM `usuario`'
                                 + ' INNER JOIN `nivelacesso` ON (`usuario`.`CODNIVELACESSO` = `nivelacesso`.`CODIGO`)WHERE (`usuario`.`NOME` like :descricao AND `usuario`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' and `usuario`.`CODNIVELACESSO` <> ''ADC-00001'' and `usuario`.`CODNIVELACESSO` <> ''ADU-00001'') order by `usuario`.nome');
        end;
      30, 300, 301://Funcionários
        begin
          if FrmTelaCadMonitMedicoes = nil then
            DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO`, `funcionarios`.`EMAIL` FROM funcionarios INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.'+DM.FParamAuxiliar[1]+' LIKE :descricao AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `funcionarios`.nome')
          else
            DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO`, `funcionarios`.`EMAIL` FROM funcionarios INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.'+DM.FParamAuxiliar[9]+' LIKE :descricao AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `funcionarios`.nome');
        end;
      31://Equipamentos Primários
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from equipamentos where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' AND CODLOCALIZACAO = :CODAREA AND CODCELULA = :CODCELULA AND CODIGO <> :CODEQUIPAMENTO order by descricao');
          DM.qryAuxiliar.Params[1].AsString := DM.qryEquipamentosCODLOCALIZACAO.AsString;
          DM.qryAuxiliar.Params[2].AsString := DM.qryEquipamentosCODCELULA.AsString;
          DM.qryAuxiliar.Params[3].AsString := DM.qryEquipamentosCODIGO.AsString;
        end;
      32, 321://Manutenções Programadas do Equipamento
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `manutprogequipamento`.`CODIGO`, `manutprogequipamento`.`CODEMPRESA`, `manutprogequipamento`.`CODEQUIPAMENTO`, `manutprogequipamento`.`CODMANUTPROGFAMEQUIP`'
                                 + ', `manutprogequipamento`.`CODMONITORAMENTO`, `manutprogequipamento`.`MATRICULA`, `manutprogequipamento`.`DESCRICAO`, `manutprogequipamento`.`CRITICIDADE`'
                                 + ', `manutprogequipamento`.`FREQUENCIA1`, `manutprogequipamento`.`DTAINICIO1`, `manutprogequipamento`.`REPROGRAMAR1`, `manutprogequipamento`.`FREQUENCIA2`'
                                 + ', `manutprogequipamento`.`REPROGRAMAR2`, `manutprogequipamento`.`LEITURA`, `manutprogequipamento`.`RELATORIO`, `manutprogequipamento`.`GRUPOINSP`'
                                 + ', `manutprogequipamento`.`DATACADASTRO`, `manutprogequipamento`.`CODUSUARIOCAD`, `manutprogequipamento`.`DATAULTALT`, `manutprogequipamento`.`CODUSUARIOALT`'
                                 + ', `manutprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `manutprogfamequipamento`.`DESCRICAO` DESCMANUTPROGFAMEQUIP'
                                 + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                                 + ', DATE_ADD(`manutprogequipamento`.`DTAINICIO1`, INTERVAL `manutprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP, `equipamentos`.`CODLOCALIZACAO` As CODAREA, `areas`.`DESCRICAO` AS DESCAREA'
                                 + ', `manutprogequipamento`.`ATIVO`'
                                 + ' FROM `manutprogequipamento`'
                                 + ' LEFT JOIN `usuario` ON (`manutprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                                 + ' LEFT JOIN `usuario` AS `usuario_1` ON (`manutprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                                 + ' LEFT JOIN `manutprogfamequipamento` ON (`manutprogequipamento`.`CODMANUTPROGFAMEQUIP` = `manutprogfamequipamento`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `manutprogfamequipamento`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `tipoprogramacao` ON (`manutprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                                 + ' INNER JOIN `equipamentos` ON (`manutprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `funcionarios` ON (`manutprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`manutprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                                 + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                                 + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                                 + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                                 + ' WHERE (`manutprogequipamento`.`DESCRICAO` LIKE :descricao AND `manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `manutprogequipamento`.`CODEQUIPAMENTO` = '+QuotedStr(DM.FParamAuxiliar[0]) + ') ORDER BY `manutprogequipamento`.`DESCRICAO`');
        end;
      33, 331://Lubrificações Programadas do Equipamento
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                                 + ', `lubrificprogequipamento`.`CODMONITORAMENTO`, `lubrificprogequipamento`.`MATRICULA`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`CRITICIDADE`'
                                 + ', `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`REPROGRAMAR1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                                 + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogequipamento`.`LEITURA`, `lubrificprogequipamento`.`RELATORIO`, `lubrificprogequipamento`.`GRUPOINSP`'
                                 + ', `lubrificprogequipamento`.`DATACADASTRO`, `lubrificprogequipamento`.`CODUSUARIOCAD`, `lubrificprogequipamento`.`DATAULTALT`, `lubrificprogequipamento`.`CODUSUARIOALT`'
                                 + ', `lubrificprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP'
                                 + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                                 + ', DATE_ADD(`lubrificprogequipamento`.`DTAINICIO1`, INTERVAL `lubrificprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP, `equipamentos`.`CODLOCALIZACAO` As CODAREA, `areas`.`DESCRICAO` AS DESCAREA'
                                 + ', `lubrificprogequipamento`.`ATIVO`'
                                 + ' FROM `lubrificprogequipamento`'
                                 + ' LEFT JOIN `usuario` ON (`lubrificprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                                 + ' LEFT JOIN `usuario` AS `usuario_1` ON (`lubrificprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                                 + ' LEFT JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `lubrificprogfamequipamento`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                                 + ' INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `funcionarios` ON (`lubrificprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                 + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                                 + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                                 + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                                 + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                                 + ' WHERE (`lubrificprogequipamento`.`DESCRICAO` LIKE :descricao AND `lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `lubrificprogequipamento`.`CODEQUIPAMENTO` = '+QuotedStr(DM.FParamAuxiliar[0]) + ') ORDER BY `lubrificprogequipamento`.`DESCRICAO`');
        end;
      34, 340://Manutenção de Família de Equipamento
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
           end;


        end;
      35, 350://Lubrificação de Família de Equipamento
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
           end;
        end;
      36, 360://Peças de Reposição
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `pecasreposicao`.`CODIGO`, `pecasreposicao`.`DESCRICAO`, `pecasreposicao`.`REFERENCIA`, `familiapecasreposicao`.`DESCRICAO` AS `FAMILIAPECA`, `pecasreposicao`.`QUANTIDADE` FROM `pecasreposicao` INNER JOIN `familiapecasreposicao`'
                                  + ' ON (`pecasreposicao`.`CODFAMILIAPECAREP` = `familiapecasreposicao`.`CODIGO`) WHERE (`pecasreposicao`.`DESCRICAO` LIKE :descricao AND `pecasreposicao`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pecasreposicao`.`DESCRICAO`');
        end;
      37, 370://Arquivos Técnicos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipo from arquivotecnico where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      38, 380://Ponto de Inspeção
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from pontosinspecao where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      39, 390://Contadores
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `contadores`.`CODIGO`, `contadores`.`DESCRICAO`, `contadores`.`CODPROGRAMACAO`, `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO` FROM `contadores`'
                                  +  ' LEFT JOIN `tipoprogramacao` ON (`contadores`.`CODPROGRAMACAO` = `tipoprogramacao`.`CODIGO`) where `contadores`.`descricao` like :descricao and `contadores`.`codempresa` = '+QuotedStr(DM.FCodEmpresa) + ' order by `contadores`.`descricao`');
        end;
      40://Solicitação de Trabalho
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `solictrabalho`.`CODORDEMSERVICO`, `solictrabalho`.`DESCSERVICO`, `solictrabalho`.`DATACADASTRO`, `funcionarios`.`NOME` AS `SOLICITANTE`, `solictrabalho`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `solictrabalho`.`CODIGO`'
                                  + ' FROM `solictrabalho` INNER JOIN `funcionarios` ON (`solictrabalho`.`CODSOLICITANTE` = `funcionarios`.`MATRICULA`) AND (`solictrabalho`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                  + ' LEFT JOIN `equipamentos` ON (`solictrabalho`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`)  AND (`solictrabalho`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) '
                                  + ' WHERE (`solictrabalho`.`DESCSERVICO` LIKE :descricao ');
                                  if DM.FParamAuxiliar[2] = 'Ordem de Serviço' then
                                    DM.qryAuxiliar.SQL.Add('AND `solictrabalho`.`CODORDEMSERVICO` = ' + DM.FParamAuxiliar[3]);
                                  if DM.FParamAuxiliar[2] = 'Matrícula' then
                                    DM.qryAuxiliar.SQL.Add('AND `solictrabalho`.`CODSOLICITANTE` = ' + DM.FParamAuxiliar[3]);
                                  DM.qryAuxiliar.SQL.Add(' AND `solictrabalho`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+') ORDER BY `solictrabalho`.`DATACADASTRO` DESC');

          DM.FParamAuxiliar[2] := '';
          DM.FParamAuxiliar[3] := '';
        end;
      41, 410://Plano de Trabalho
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, detalhes from planotrabalho where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      42, 420://Monitoramento
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from monitoramento where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      43, 430://Parte de Manutenção de Família
        begin
          DM.qryAuxiliar.SQL.Add('SELECT mfp.`CODIGO`, mfp.`DESCRICAO` FROM manutprogfamequippartes mfp INNER JOIN manutprogfamequipamento mf ON (mfp.`CODMANUTPROGFAMEQUIP` = mf.`CODIGO`) AND (mfp.`CODEMPRESA` = mf.`CODEMPRESA`)'
                                  + ' where mfp.descricao like :descricao and (mfp.`CODMANUTPROGFAMEQUIP` = '+QuotedStr(DM.FParamAuxiliar[1])+') and mfp.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      44, 440://Parte de Lubrificação de Família
        begin
          DM.qryAuxiliar.SQL.Add('SELECT mfp.`CODIGO`, mfp.`DESCRICAO` FROM lubrificprogfamequippartes mfp INNER JOIN lubrificprogfamequipamento mf ON (mfp.`CODLUBRIFICPROGFAMEQUIP` = mf.`CODIGO`) AND (mfp.`CODEMPRESA` = mf.`CODEMPRESA`)'
                                  + ' where mfp.descricao like :descricao and (mfp.`CODLUBRIFICPROGFAMEQUIP` = '+QuotedStr(DM.FParamAuxiliar[1])+') and mfp.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      45, 450://Ordem de Serviço
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
        end;
      46, 460://Recursos
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `recursos`.`CODIGO`, `recursos`.`DESCRICAO`, `familiarecursos`.`DESCRICAO` AS `FAMILIARECURSO`, `recursos`.`QUANTIDADE` FROM `recursos` INNER JOIN `familiarecursos` ON (`recursos`.`CODFAMILIARECURSO` = `familiarecursos`.`CODIGO`)'
                                  + ' WHERE `recursos`.`DESCRICAO` LIKE :descricao AND `recursos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' ORDER BY `recursos`.`DESCRICAO`');
        end;
      47, 470://Pontos de Inspeção
        begin
          DM.qryAuxiliar.SQL.Add('select p.`CODIGO`, p.`DESCRICAO`, f.`DESCRICAO` AS `FAMILIAEQUIP` FROM `pontosinspecao` p INNER JOIN familiaequipamento f ON (p.`CODFAMILIAEQUIP` = f.`CODIGO`) WHERE p.descricao like :descricao and p.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by p.descricao');
        end;
      48, 480://Contadores do Equipamento
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `equipamentoscont`.`CODIGO`, `equipamentoscont`.`CODCONTADOR`, `equipamentoscont`.`DESCRICAO`, `contadores`.`CODPROGRAMACAO`, `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO` FROM `equipamentoscont`'
                                  +  ' INNER JOIN `contadores` ON (`equipamentoscont`.`CODCONTADOR` = `contadores`.`CODIGO`) AND (`equipamentoscont`.`CODEMPRESA` = `contadores`.`CODEMPRESA`)'
                                  +  ' LEFT JOIN `tipoprogramacao` ON (`contadores`.`CODPROGRAMACAO` = `tipoprogramacao`.`CODIGO`) WHERE (`equipamentoscont`.`DESCRICAO` LIKE :descricao and `equipamentoscont`.`CODEQUIPAMENTO` = ' + QuotedStr(DM.FParamAuxiliar[2]) + ' and `contadores`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') order by `equipamentoscont`.`DESCRICAO`');
        end;
      49://Células
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `celulas`.`CODIGO`, `celulas`.`DESCRICAO`, `celulas`.`TIPO`, `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `AREA` FROM `celulas`'
                                  +  ' INNER JOIN `areas` ON (`celulas`.`CODAREA` = `areas`.`CODIGO`) AND (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                                  +  ' WHERE (`celulas`.`descricao` like :descricao AND `celulas`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND LENGTH(`celulas`.`DESCRICAO`)  > 1)'
                                  +  ' ORDER BY `celulas`.`DESCRICAO` ASC;')
        end;
      50, 5000://Kit de Recursos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, quantidade from recursoskit where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      60://Ausências de Funcionários
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `funcionariosausencia`.`CODIGO`, `funcionariosausencia`.`MATRICULA`, `funcionarios`.`NOME`, `funcionariosausencia`.`MOTIVO`, `funcionariosausencia`.`INICIO`, `funcionariosausencia`.`FIM`'
                                  +  ' FROM `funcionariosausencia` INNER JOIN `funcionarios` ON (`funcionariosausencia`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`funcionariosausencia`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                  +  ' WHERE ( `funcionariosausencia`.`MOTIVO` LIKE :descricao AND`funcionariosausencia`.`MATRICULA` = '+ QuotedStr(DM.FParamAuxiliar[0]) +' AND `funcionariosausencia`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `funcionariosausencia`.`INICIO` DESC');
        end;
      61://Ferramentaria
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from ferramentaria where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      62, 6200://Kit de Peças
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, quantidade from pecasreposicaokit where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      //63://Peças instaladas no equipamento
        //begin
         // DM.qryAuxiliar.SQL.Add('SELECT `equipamentospecasrep`.`REFERENCIA`, `equipamentospecasrep`.`DESCRICAO` PECA, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `equipamentospecasrep`.`LOCALIZACAO`';
         //                         +  ' FROM `equipamentospecasrep` INNER JOIN `equipamentos` ON (`equipamentospecasrep`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`equipamentospecasrep`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)';
         //                         +  ' WHERE `equipamentospecasrep`.`REFERENCIA` like :descricao AND `equipamentospecasrep`.`codempresa` = ' + QuotedStr(DM.FCodEmpresa) + ' ORDER BY `equipamentos`.`DESCRICAO` ASC';
        //end;
      64, 6400://Lubrificantes
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, qtdetotalutil from lubrificantes where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
        end;
      65://Ordem de Serviço Fora
        begin
          DM.qryAuxiliar.SQL.Add('select o.codigo, o.descricao, e.descricao as equipamento, o.datacadastro from ordemservicotercfora o inner join equipamentos e on (o.codequipamento = e.codigo) and (o.codempresa = e.codempresa) where o.descricao like :descricao and o.codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by o.codigo desc');
        end;
      66://Ordem de Serviço Na Unidade
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from ordemservicotercunid where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by codigo desc');
        end;
      67, 6700://Tarefas da OS Terc.
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO`, `DATAPROGINI`, `DATAPROGFIN`, `PREDECESSORA` FROM `ordemservicotercunidtarefas`'
                                  +  ' WHERE (`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `CODORDEMSERVICO` = ' + QuotedStr(DM.qryOrdemServicoTercUnidCODIGO.AsString) +' AND `DESCRICAO` LIKE :descricao) ORDER BY `DATAPROGINI` ASC');
        end;
      68://Literturas Técnicas
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnico where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and tipo = ''Literatura'' order by descricao asc');
        end;
      69://Desenhos Técnicos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnico where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and tipo = ''Desenho'' order by descricao asc');
        end;
      70, 7000://Editoras, Temas, Assuntos, Tipos
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnicoparam where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and tipo = '+QuotedStr(DM.FParamAuxiliar[1])+' order by descricao asc');
        end;
      71://Despesas Mensais de Funcionários
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmeninfofuncper where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc');
        end;
      72://Despesas Mensais da Manutenção
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmendespmanut where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc');
        end;
      73://Despesas Mensais da Produção
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmenprodmensal where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc');
        end;
      74://Despesas Mensais Diversas
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmeninfdiversas where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc');
        end;
      75://Indicadores de Desempenho
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from inddesempenho where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc');
        end;
      76://Posição
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `areas`.`DESCRICAO` AS `AREA`, `celulas`.`DESCRICAO` AS `CELULA`, `linhas`.`DESCRICAO` AS `LINHA`, `equipamentos`.`SEQUENCIA`, `equipamentos`.`SECUNDARIO`'
                                  +  ' FROM `equipamentos` INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                                  +  ' INNER JOIN `celulas` ON (`equipamentos`.`CODCELULA` = `celulas`.`CODIGO`) AND (`areas`.`CODIGO` = `celulas`.`CODAREA`) AND (`areas`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)'
                                  +  ' LEFT JOIN `linhas` ON (`equipamentos`.`CODLINHA` = `linhas`.`CODIGO`) AND (`celulas`.`CODAREA` = `linhas`.`CODAREA`) AND (`celulas`.`CODIGO` = `linhas`.`CODCELULA`) AND (`celulas`.`CODEMPRESA` = `linhas`.`CODEMPRESA`)'
                                  +  ' WHERE (`equipamentos`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`DESCRICAO` LIKE :descricao AND `equipamentos`.`OPERANDO` = ''S'' AND `equipamentos`.`RESERVA` = ''S'') ORDER BY `equipamentos`.`DESCRICAO` ASC;');
        end;
      77://Item de Ferramentaria
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `ferramentariaitens`.`CODFERRAMEM`, `recursos`.`DESCRICAO` AS `FERRAMENTA`, `ferramentariaitens`.`CODRECURSO`, `ferramentaria`.`CODIGO` AS `CODFERRAMENTARIA`, `ferramentaria`.`DESCRICAO` AS `FERRAMENTARIA`, `ferramentariaitens`.`QUANTIDADE`'
                                  +  ' FROM `ferramentariaitens` INNER JOIN `ferramentaria` ON (`ferramentariaitens`.`CODFERRAMEM` = `ferramentaria`.`CODIGO`) AND (`ferramentariaitens`.`CODEMPRESA` = `ferramentaria`.`CODEMPRESA`) INNER JOIN `recursos`'
                                  +  ' ON (`ferramentariaitens`.`CODRECURSO` = `recursos`.`CODIGO`) AND (`ferramentariaitens`.`CODEMPRESA` = `recursos`.`CODEMPRESA`) WHERE (`ferramentariaitens`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `recursos`.`DESCRICAO` LIKE :descricao) ORDER BY `FERRAMENTA` ASC;');
        end;
      78, 780://Abastecimentos
        begin
          if DM.FParamAuxiliar[1] <> 'PLACA' then
          begin
            DM.qryAuxiliar.SQL.Add('SELECT `controlecombustivel`.`CODIGO`, `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `EQUIPAMENTO`, `controlecombustivel`.`PLACA`, `contadores`.`DESCRICAO` AS `CONTADOR`'
                                    +  ' , `controlecombustivel`.`CONTADORATUAL` AS `CONTADOR` FROM `controlecombustivel` INNER JOIN `equipamentos` ON (`controlecombustivel`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                    +  ' INNER JOIN `contadores` ON (`controlecombustivel`.`CODCONTADOR` = `contadores`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `contadores`.`CODEMPRESA`)'
                                    +  ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[1]+' LIKE :descricao AND `controlecombustivel`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `EQUIPAMENTO` ASC');
          end else
          begin
            DM.qryAuxiliar.SQL.Add('SELECT `controlecombustivel`.`CODIGO`, `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `EQUIPAMENTO`, `controlecombustivel`.`PLACA`, `contadores`.`DESCRICAO` AS `CONTADOR`'
                                    +  ' , `controlecombustivel`.`CONTADORATUAL` AS `CONTADOR` FROM `controlecombustivel` INNER JOIN `equipamentos` ON (`controlecombustivel`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                    +  ' INNER JOIN `contadores` ON (`controlecombustivel`.`CODCONTADOR` = `contadores`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `contadores`.`CODEMPRESA`)'
                                    +  ' WHERE (`controlecombustivel`.`PLACA` LIKE :descricao AND `controlecombustivel`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `EQUIPAMENTO` ASC');
          end;
        end;
      79, 7900://Rotas de Abastecimentos
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `controlecombustivelrotas` WHERE (`DESCRICAO` LIKE :descricao AND `CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `DESCRICAO` ASC');
        end;
      80, 8000://Família de Pneus
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiapneus where descricao like :descricao order by descricao');
        end;
      81, 8100://Imagens de Chassi
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `pneusimagens` WHERE `DESCRICAO` LIKE :descricao ORDER BY `DESCRICAO` ASC');
        end;
      82, 8200, 8201://Montagem de Chassi/Atrelamento
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
        end;
      83, 8300, 8301://Pneus
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
        end;
      84://Rotas
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO`, `FREQUENCIA` FROM `rotasequipamento` WHERE `DESCRICAO` LIKE :descricao ORDER BY `DESCRICAO` ASC');
        end;
      85://Equipamento atual na sequência
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `CODIGO` AS `CODEQUIPAMENTO`, `DESCRICAO` AS `EQUIPATUAL`, `CODFAMILIAEQUIP`, `CODCELULA`, `CODLINHA` FROM `equipamentos`'
                                  +  ' WHERE (`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+' AND `DESCRICAO` = :descricao AND `CODLOCALIZACAO` = '+QuotedStr(DM.FParamAuxiliar[1])+''
                                  +  ' AND `CODCELULA` = '+QuotedStr(DM.FParamAuxiliar[2])+' AND `CODLINHA` = '+QuotedStr(DM.FParamAuxiliar[3])+')');
       end;
     86://Monitoramento
       begin
          DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO`, `TIPOPONTO` FROM `monitoramento` WHERE `DESCRICAO` LIKE :descricao AND `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCRICAO` DESC');
       end;
     87://Locais de Ponto de Inspeção
       begin
          DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `pontosinspecaoloc` WHERE `DESCRICAO` LIKE :descricao AND `CODPONTOINSP` = '+QuotedStr(DM.FParamAuxiliar[1])+' AND `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCRICAO` DESC');
       end;
     88://Equipamentos Monitorados (Pontos de Inspeção)
       begin
         DM.qryAuxiliar.SQL.Add('SELECT `equipamentosptosinsp`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO`, `pontosinspecaoloc`.`LIMINFSEG`, `pontosinspecaoloc`.`LIMINFMAX`, `pontosinspecaoloc`.`LIMSUPSEG`, `pontosinspecaoloc`.`LIMSUPMAX` FROM `equipamentosptosinsp`'
                                 +  ' INNER JOIN `equipamentos` ON (`equipamentosptosinsp`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`equipamentosptosinsp`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) INNER JOIN `pontosinspecaoloc` ON (`equipamentosptosinsp`.`CODEMPRESA`'
                                 +  ' = `pontosinspecaoloc`.`CODEMPRESA`) AND (`equipamentosptosinsp`.`CODPONTOINSPECAO` = `pontosinspecaoloc`.`CODPONTOINSP`) WHERE (`equipamentos`.'+DM.FParamAuxiliar[8]+'  LIKE :descricao AND `equipamentosptosinsp`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ') AND `equipamentosptosinsp`.`CODPONTOINSPECAO` = '+QuotedStr(DM.FParamAuxiliar[1])
                                 +  ' GROUP BY  `equipamentosptosinsp`.`CODEQUIPAMENTO` ORDER BY `equipamentos`.`DESCRICAO` ASC');
       end;
     89://Equipamentos monitorados (Contadores)
       begin
         DM.qryAuxiliar.SQL.Add('SELECT `equipamentoscont`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` FROM `equipamentoscont` INNER JOIN `equipamentos` ON (`equipamentoscont`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`equipamentoscont`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
         +  ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[8]+' LIKE :descricao AND `equipamentoscont`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `equipamentoscont`.`CODCONTADOR` = ' + QuotedStr(DM.FParamAuxiliar[1])+''
         +  ' AND `equipamentoscont`.`CODEQUIPAMENTO` NOT IN (SELECT `controlecombustivel`.`CODEQUIPAMENTO` FROM `controlecombustivel` WHERE `controlecombustivel`.`CODEMPRESA` = `equipamentoscont`.`CODEMPRESA`'
         +  ' AND `controlecombustivel`.`CODEQUIPAMENTO` = `equipamentoscont`.`CODEQUIPAMENTO`)) GROUP BY `equipamentoscont`.`CODEQUIPAMENTO` ORDER BY `equipamentos`.`DESCRICAO` ASC');
  //       DM.qryAuxiliar.SQL.Add('SELECT `equipamentoscont`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` FROM `equipamentoscont`'
  //                               +  ' INNER JOIN `equipamentos` ON (`equipamentoscont`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`equipamentoscont`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
  //                               +  ' WHERE (`equipamentos`.'+DM.FParamAuxiliar[8]+'  LIKE :descricao AND `equipamentoscont`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `equipamentoscont`.`CODCONTADOR` = '+QuotedStr(DM.FParamAuxiliar[1]);
  //                               +  ' GROUP BY `equipamentoscont`.`CODEQUIPAMENTO` ORDER BY `equipamentos`.`DESCRICAO` ASC');
       end;
      90, 9000://Locais de Pontos de Inspeção
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, descricao from pontosinspecaoloc where descricao like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codpontoinsp = '+ QuotedStr(DM.FParamAuxiliar[1]) + ' order by descricao');
        end;
      91://Controle de Multas
        begin
          DM.qryAuxiliar.SQL.Add('select codigo, mes, ano from despmentaxasper where mes like :descricao and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by mes asc, ano asc');
        end;
      92://Conserto de Pneus
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassipneuscons`.`CODIGO`, `pneusmontagemchassipneuscons`.`ID`, `pneus`.`DESCRICAO`, `pneusmontagemchassipneuscons`.`ACAO`, `pneusmontagemchassipneuscons`.`ENVIO`, `pneusmontagemchassipneuscons`.`ENTREGA`'
                                  +  ' , `pneusmontagemchassipneuscons`.`RODAGEM`, `pneusmontagemchassipneuscons`.`SERVICO`, `fornecedor`.`DESCRICAO` AS `FORNECEDOR`, `pneusmontagemchassipneuscons`.`CUSTO` FROM `pneusmontagemchassipneuscons`'
                                  +  '  INNER JOIN `pneus` ON (`pneusmontagemchassipneuscons`.`CODPNEU` = `pneus`.`CODIGO`) AND (`pneusmontagemchassipneuscons`.`CODEMPRESA` = `pneus`.`CODEMPRESA`) INNER JOIN `fornecedor`'
                                  +  ' ON (`pneusmontagemchassipneuscons`.`CODFORNECEDOR` = `fornecedor`.`CODIGO`) WHERE (`pneus`.`DESCRICAO` LIKE :descricao AND `pneusmontagemchassipneuscons`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pneusmontagemchassipneuscons`.`ENVIO` ASC');
        end;
      93://ID de Pneus
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassipneus`.`CODIGO`, `pneusmontagemchassipneus`.`ID`, `pneus`.`DESCRICAO`, `pneusmontagemchassipneus`.`RODADOS`, `pneusmontagemchassipneus`.`CODPNEU`, `pneus`.`STATUS` FROM `pneusmontagemchassipneus`'
                                  +  ' INNER JOIN `pneus` ON (`pneusmontagemchassipneus`.`CODPNEU` = `pneus`.`CODIGO`) AND (`pneusmontagemchassipneus`.`CODEMPRESA` = `pneus`.`CODEMPRESA`)'
                                  +  ' WHERE (`pneusmontagemchassipneus`.`ID` LIKE :descricao AND `pneusmontagemchassipneus`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `pneusmontagemchassipneus`.`STATUS` = ''REPARO'''
                                  +  ' ) ORDER BY `pneusmontagemchassipneus`.`ID` DESC');
        end;
      94://Posições do Chassi
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassi`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `pneusmontagemchassiposicoes`.`POSICAO` FROM `pneusmontagemchassiposicoes`'
                                  +  ' INNER JOIN `pneusmontagemchassi` ON (`pneusmontagemchassiposicoes`.`CODCHASSI` = `pneusmontagemchassi`.`CODIGO`) INNER JOIN `equipamentos`'
                                  +  ' ON (`pneusmontagemchassi`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`pneusmontagemchassi`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                                  +  ' WHERE (`pneusmontagemchassiposicoes`.`POSICAO` LIKE :descricao AND `pneusmontagemchassiposicoes`.`CODCHASSI` =  ' + QuotedStr(DM.FParamAuxiliar[1]) + ' ) ORDER BY `pneusmontagemchassiposicoes`.`CODIGO` ASC');
        end;
      95, 9500://Trajetos
        begin
          DM.qryAuxiliar.SQL.Add('SELECT `controlecombustivelviagens`.`CODIGO`, `controlecombustivelrotas`.`DESCRICAO` AS `ROTA`, `controlecombustivelviagens`.`DATAPARTIDA`, `controlecombustivelviagens`.`DATACHEGADA` FROM `controlecombustivelviagens`'
                                  +  ' INNER JOIN `controlecombustivelrotas` ON (`controlecombustivelviagens`.`CODROTA` = `controlecombustivelrotas`.`CODIGO`) WHERE (`controlecombustivelrotas`.`DESCRICAO` LIKE :descricao) ORDER BY `controlecombustivelviagens`.`DATAPARTIDA` DESC');
        end;
    end;
    DM.qryAuxiliar.Params[0].AsString := '%' + EdtConsulta.Text + '%';
    DM.qryAuxiliar.Open;
    GrdAuxiliar.Columns[0].Title.Alignment  := taCenter;
    if (DM.FTabela_auxiliar <> 18) and (DM.FTabela_auxiliar <> 180) and (DM.FTabela_auxiliar <> 94) and (DM.FTabela_auxiliar <> 95) then
      begin
        GrdAuxiliar.Columns[0].Title.Alignment  := taCenter;
        DM.qryAuxiliar.Fields[0].Alignment    := taCenter;
        DM.qryAuxiliar.Fields[0].DisplayLabel := 'Código';
        DM.qryAuxiliar.Fields[0].DisplayWidth := 12;
        DM.qryAuxiliar.Fields[0].Alignment    := taCenter;
        DM.qryAuxiliar.Fields[1].DisplayLabel := 'Descrição';
        DM.qryAuxiliar.Fields[1].DisplayWidth := 45;
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
          DM.qryAuxiliar.Fields[2].DisplayLabel              := 'Tipo';
          DM.qryAuxiliar.Fields[2].DisplayWidth              := 30;
          GrdAuxiliar.Columns[3].Title.Alignment             := taCenter;
          DM.qryAuxiliar.FieldByName('ATIVO').DisplayLabel   := 'Ativo';
          DM.qryAuxiliar.FieldByName('ATIVO').Alignment      := taCenter;
          GrdAuxiliar.Columns[4].Title.Alignment             := taCenter;
          DM.qryAuxiliar.FieldByName('VISIVEL').DisplayLabel := 'Visível';
          DM.qryAuxiliar.FieldByName('VISIVEL').Alignment    := taCenter;
        end;
      25, 250://Equipamentos
        begin
          DM.qryAuxiliar.FieldByName('DESCRICAO').DisplayWidth    := 40;
          DM.qryAuxiliar.FieldByName('FAMILIAEQUIP').DisplayLabel := 'Família';
          DM.qryAuxiliar.FieldByName('FAMILIAEQUIP').DisplayWidth := 25;
          DM.qryAuxiliar.FieldByName('CENTROCUSTO').DisplayLabel  := 'Centro de Custo';
          DM.qryAuxiliar.FieldByName('CENTROCUSTO').DisplayWidth  := 15;
          DM.qryAuxiliar.FieldByName('AREA').DisplayLabel         := 'Área';
          DM.qryAuxiliar.FieldByName('AREA').DisplayWidth         := 25;
          DM.qryAuxiliar.FieldByName('CELULA').DisplayLabel       := 'Célula';
          DM.qryAuxiliar.FieldByName('CELULA').DisplayWidth       := 20;
          DM.qryAuxiliar.FieldByName('LINHA').DisplayLabel        := 'Linha';
          DM.qryAuxiliar.FieldByName('LINHA').DisplayWidth        := 15;
          DM.qryAuxiliar.FieldByName('SEQUENCIA').DisplayLabel    := 'Sequência';
          DM.qryAuxiliar.FieldByName('SEQUENCIA').DisplayWidth    := 10;
          DM.qryAuxiliar.FieldByName('OPERANDO').DisplayLabel     := 'Operando';
          DM.qryAuxiliar.FieldByName('OPERANDO').Alignment        := taCenter;
          GrdAuxiliar.Columns[8].Title.Alignment                            := taCenter;
          DM.qryAuxiliar.FieldByName('CODFAMILIAEQUIP').Visible   := False;
          DM.qryAuxiliar.FieldByName('CODAREA').Visible           := False;
          DM.qryAuxiliar.FieldByName('CODCELULA').Visible         := False;
          DM.qryAuxiliar.FieldByName('CODLINHA').Visible          := False;
          DM.qryAuxiliar.FieldByName('CODCENTROCUSTO').Visible    := False;
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
          GrdAuxiliar.Columns[1].Title.Alignment  := taCenter;
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
          GrdAuxiliar.Columns[0].Title.Alignment  := taCenter;
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
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Email';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 30;
        end;
      32, 33, 321, 331://Manutenção/Lubrificação Programada do Equipamento
        begin
          DM.qryAuxiliar.FieldByName('DESCRICAO').DisplayLabel              := 'Descrição';
          DM.qryAuxiliar.FieldByName('DESCRICAO').DisplayWidth              := 50;

          DM.qryAuxiliar.FieldByName('DTAINICIO1').DisplayLabel             := 'Programada';
          DM.qryAuxiliar.FieldByName('DTAINICIO1').Alignment                := taCenter;
          DM.qryAuxiliar.FieldByName('DTAINICIO1').DisplayWidth             := 10;
          GrdAuxiliar.Columns[2].Title.Alignment                            := taCenter;

          DM.qryAuxiliar.FieldByName('FREQUENCIA1').DisplayLabel            := 'Dias';
          DM.qryAuxiliar.FieldByName('FREQUENCIA1').Alignment               := taCenter;
          DM.qryAuxiliar.FieldByName('FREQUENCIA1').DisplayWidth            := 10;
          DM.qryAuxiliar.FieldByName('FREQUENCIA1').DisplayWidth            := 5;
          GrdAuxiliar.Columns[8].Title.Alignment                            := taCenter;

          GrdAuxiliar.Columns[9].Title.Alignment                            := taCenter;

          if (DM.FTabela_auxiliar = 32) or (DM.FTabela_auxiliar = 321) then
          begin
            DM.qryAuxiliar.FieldByName('DESCMANUTPROGFAMEQUIP').DisplayLabel  := 'Família da Manutenção';
            DM.qryAuxiliar.FieldByName('DESCMANUTPROGFAMEQUIP').DisplayWidth  := 45;
          end else
          begin
            DM.qryAuxiliar.FieldByName('DESCLUBRIFICPROGFAMEQUIP').DisplayLabel  := 'Família da Lubrificação';
            DM.qryAuxiliar.FieldByName('DESCLUBRIFICPROGFAMEQUIP').DisplayWidth  := 45;
          end;

          DM.qryAuxiliar.FieldByName('RESPONSAVEL').DisplayLabel            := 'Responsável';
          DM.qryAuxiliar.FieldByName('RESPONSAVEL').DisplayWidth            := 25;

          DM.qryAuxiliar.FieldByName('ATIVO').DisplayLabel                  := 'Ativo';
          DM.qryAuxiliar.FieldByName('ATIVO').Alignment                     := taCenter;
          DM.qryAuxiliar.FieldByName('ATIVO').DisplayWidth                  := 5;
          GrdAuxiliar.Columns[31].Title.Alignment                           := taCenter;

          DM.qryAuxiliar.Fields[1].Visible := False;
          DM.qryAuxiliar.Fields[2].Visible := False;
          DM.qryAuxiliar.Fields[3].Visible := False;
          DM.qryAuxiliar.Fields[4].Visible := False;
          DM.qryAuxiliar.Fields[5].Visible := False;
          DM.qryAuxiliar.Fields[7].Visible := False;
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
          DM.qryAuxiliar.Fields[24].Visible := False;
          DM.qryAuxiliar.Fields[25].Visible := False;
          DM.qryAuxiliar.Fields[27].Visible := False;
          DM.qryAuxiliar.Fields[28].Visible := False;
          DM.qryAuxiliar.Fields[29].Visible := False;
          DM.qryAuxiliar.Fields[30].Visible := False;
        end;
      36, 360://Peças de Reposição
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 40;
          if DM.FParamAuxiliar[1] = 'REFERENCIA' then
            GrdAuxiliar.Columns[2].Title.Font.Style := [fsBold];
          if DM.FParamAuxiliar[1] = 'DESCRICAO' then
            GrdAuxiliar.Columns[1].Title.Font.Style := [fsBold];
          DM.qryAuxiliar.Fields[1].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
          GrdAuxiliar.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Referência';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 5;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Família';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Qtde';
          GrdAuxiliar.Columns[4].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[4].DisplayWidth := 5;
        end;
      37://Arquivos Técnicos
        begin
          DM.qryAuxiliar.Fields[1].DisplayWidth := 40;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Tipo';
          GrdAuxiliar.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayWidth := 10;
          DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
        end;
      300://Funcionários
        begin
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Matrícula';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Nome';
          if DM.FParamAuxiliar[1] = 'MATRICULA' then
            GrdAuxiliar.Columns[0].Title.Font.Style := [fsBold];
          if DM.FParamAuxiliar[1] = 'NOME' then
            GrdAuxiliar.Columns[1].Title.Font.Style := [fsBold];
          DM.qryAuxiliar.Fields[2].DisplayWidth := 25;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cargo';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Email';
        end;
      301://Funcionários Programados
        begin
          DM.qryAuxiliar.Fields[0].DisplayLabel := 'Matrícula';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Nome';
          if DM.FParamAuxiliar[1] = 'MATRICULA' then
            GrdAuxiliar.Columns[0].Title.Font.Style := [fsBold];
          if DM.FParamAuxiliar[1] = 'NOME' then
            GrdAuxiliar.Columns[1].Title.Font.Style := [fsBold];
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
          GrdAuxiliar.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cadastro';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 18;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Solicitante';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 22;
          GrdAuxiliar.Columns[4].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[4].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[5].DisplayLabel := 'Equipamento';
          DM.qryAuxiliar.Fields[5].DisplayWidth := 30;
          if  DM.FTabela_auxiliar = 40 then
            DM.qryAuxiliar.Fields[6].Visible := False;
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
          GrdAuxiliar.Columns[0].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[1].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Código';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 35;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Descrição';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 30;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Programação';
        end;
      49://Células Mecânicas
        begin
          GrdAuxiliar.Columns[2].Title.Alignment := taCenter;
          DM.qryAuxiliar.Fields[2].Alignment     := taCenter;
          DM.qryAuxiliar.Fields[2].DisplayLabel  := 'Tipo';
          DM.qryAuxiliar.Fields[2].DisplayWidth  := 15;
          GrdAuxiliar.Columns[3].Title.Alignment := taCenter;
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
          GrdAuxiliar.Columns[2].Title.Alignment  := taCenter;
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
          GrdAuxiliar.Columns[2].Title.Alignment  := taLeftJustify;
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
          GrdAuxiliar.Columns[0].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[1].Alignment    := taCenter;
          DM.qryAuxiliar.Fields[1].DisplayLabel := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[1].DisplayWidth := 15;
          DM.qryAuxiliar.Fields[2].DisplayLabel := 'Equipamento';
          DM.qryAuxiliar.Fields[2].DisplayWidth := 40;
          GrdAuxiliar.Columns[2].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[3].DisplayLabel := 'Placa';
          DM.qryAuxiliar.Fields[3].DisplayWidth := 10;
          GrdAuxiliar.Columns[3].Title.Alignment  := taCenter;
          DM.qryAuxiliar.Fields[4].DisplayLabel := 'Medidor';
          DM.qryAuxiliar.Fields[4].DisplayWidth := 10;
          GrdAuxiliar.Columns[4].Title.Alignment  := taCenter;
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
          GrdAuxiliar.Columns[0].Title.Alignment     := taCenter;
          DM.qryAuxiliar.Fields[1].Alignment       := taCenter;
          DM.qryAuxiliar.Fields[1].DisplayLabel    := 'Cód. Equip.';
          DM.qryAuxiliar.Fields[1].DisplayWidth    := 15;
          DM.qryAuxiliar.Fields[2].DisplayLabel    := 'Equipamento';
          DM.qryAuxiliar.Fields[2].DisplayWidth    := 30;
          GrdAuxiliar.Columns[2].Title.Alignment     := taCenter;
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

procedure TFrmTelaAuxiliar.BtnFamiliaEquipClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.FParamAuxiliar[3] := '';
        DM.FCodFamilia          := DM.FCodCombo;
        EdtFamiliaEquip.Text := DM.FValorCombo;
        DM.FParamAuxiliar[3] := DM.FCodFamilia;
        DM.qryAuxiliar.Close;
        DM.qryAuxiliar.SQL.Clear;
      end;
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    BtnConsultar.OnClick(Sender);
  end;
end;

procedure TFrmTelaAuxiliar.BtnFecharClick(Sender: TObject);
begin
  inherited;
  DM.FCodCombo := EmptyStr;
  DM.FValorCombo := EmptyStr;
end;

procedure TFrmTelaAuxiliar.BtnLinhaClick(Sender: TObject);
begin
  inherited;
if edtArea.Text = '' then
  begin
    edtArea.SetFocus;
    Exit;
  end;
if EdtCelula.Text = '' then
  begin
    EdtCelula.SetFocus;
    Exit;
  end;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 170;
    DM.FNomeConsulta := 'Linhas';
    DM.FPromptConsulta := 'Informe a descrição a ser consultada';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.FParamAuxiliar[20] := DM.FCodLinha;
        DM.FCodLinha          := DM.FCodCombo;
        edtLinha.Text         := DM.FValorCombo;
      end;
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    BtnConsultar.OnClick(Sender);
  end;
end;

procedure TFrmTelaAuxiliar.edtAreaDblClick(Sender: TObject);
begin
  inherited;
  DM.FCodArea  := '';
  edtArea.Text := '';
  DM.FCodArea  := '';
  DM.FCodCelula  := '';
  edtCelula.Text := '';
  DM.FCodCelula  := '';
  DM.FCodLinha  := '';
  edtLinha.Text := '';
  DM.FCodLinha  := '';
  BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaAuxiliar.EdtCelulaDblClick(Sender: TObject);
begin
  inherited;
  DM.FCodCelula  := '';
  edtCelula.Text := '';
  DM.FCodCelula  := '';
  DM.FCodLinha  := '';
  edtLinha.Text := '';
  DM.FCodLinha  := '';
  BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaAuxiliar.EdtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if Key = #13 then
  BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaAuxiliar.EdtFamiliaEquipDblClick(Sender: TObject);
begin
  inherited;
  DM.FCodFamilia  := '';
  EdtFamiliaEquip.Text := '';
  BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaAuxiliar.edtLinhaDblClick(Sender: TObject);
begin
  inherited;
  DM.FCodLinha  := '';
  edtLinha.Text := '';
  DM.FCodLinha  := '';
  BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaAuxiliar.FormActivate(Sender: TObject);
begin
  inherited;
  DM.qryAuxiliar.Close;
  DM.qryAuxiliar.SQL.Clear;
end;

procedure TFrmTelaAuxiliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.FNomeConsulta := EmptyStr;
  DM.FPromptConsulta := EmptyStr;
  DM.qryAuxiliar.Close;
end;

procedure TFrmTelaAuxiliar.FormCreate(Sender: TObject);
begin
  inherited;
DM.FCodCombo   := EmptyStr;
DM.FValorCombo := EmptyStr;

if DM.FNomeConsulta <> '' then
  FrmTelaAuxiliar.Caption := DM.FNomeConsulta;

DM.qryAuxiliar.Close;

if FrmTelaAuxiliar.Caption = 'Equipamentos' then
  begin
    PFiltroEquip.Visible := True;
  end;

if DM.FPromptConsulta = '' then
  DM.FPromptConsulta := 'Informe o valor a ser consultado';

EdtConsulta.TextHint := DM.FPromptConsulta;
end;

procedure TFrmTelaAuxiliar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if Key = #13 then
  begin
    BtnOK.OnClick(Sender);
  end;
end;

procedure TFrmTelaAuxiliar.FormShow(Sender: TObject);
begin
  inherited;
  BtnConsultar.SetFocus;
end;

procedure TFrmTelaAuxiliar.GrdAuxiliarDblClick(Sender: TObject);
begin
  inherited;
  if DM.DSAuxiliar.DataSet.Active = False then Exit;
  if EdtConsulta.Focused = True then Exit;

  case DM.FTabela_auxiliar of
    28, 31, 87, 100, 110, 120, 130, 150, 160, 170, 200, 210, 220, 230, 240, 320, 330, 370, 380, 400, 420, 430, 440, 450, 460, 470, 490, 500, 5000, 600, 700, 800, 900, 6400, 7000, 7900, 8000, 8301, 8100, 9000, 9500://Combos e outras consultas
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
        DM.FParamAuxiliar[2] := DM.qryAuxiliar.FieldByName('CODFAMILIAEQUIP').AsString;
        DM.FParamAuxiliar[3] := DM.qryAuxiliar.FieldByName('FAMILIAEQUIP').AsString;
        DM.FParamAuxiliar[4] := DM.qryAuxiliar.FieldByName('CODAREA').AsString;
        DM.FParamAuxiliar[5] := DM.qryAuxiliar.FieldByName('AREA').AsString;
        DM.FParamAuxiliar[6] := DM.qryAuxiliar.FieldByName('CODCELULA').AsString;
        DM.FParamAuxiliar[7] := DM.qryAuxiliar.FieldByName('CELULA').AsString;
        DM.FParamAuxiliar[8] := DM.qryAuxiliar.FieldByName('CODLINHA').AsString;
        DM.FParamAuxiliar[9] := DM.qryAuxiliar.FieldByName('LINHA').AsString;
        DM.FParamAuxiliar[10] := DM.qryAuxiliar.FieldByName('SEQUENCIA').AsString;
        DM.FParamAuxiliar[11] := DM.qryAuxiliar.FieldByName('CODCENTROCUSTO').AsString;
        DM.FParamAuxiliar[12] := DM.qryAuxiliar.FieldByName('CENTROCUSTO').AsString;
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
    300, 301: //Funcionários
      begin
        DM.FCodCombo   := DM.DSAuxiliar.DataSet.Fields[0].AsString;
        DM.FValorCombo := DM.DSAuxiliar.DataSet.Fields[1].AsString;
        DM.FParamAuxiliar[4] := DM.DSAuxiliar.DataSet.Fields[3].AsString;
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
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
Close;
end;

procedure TFrmTelaAuxiliar.GrdAuxiliarTitleClick(Column: TColumn);
begin
  inherited;
  try
    CliqueNoTitulo(Column, TFDquery(GrdAuxiliar.DataSource.DataSet), GrdAuxiliar.DataSource.DataSet.Fields[1].Name);
  except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao ordenar o grid. FrmTelaConsulta Linha: 2327', E.ClassName, E.Message);
      Application.MessageBox('Falha ao ordenar o grid operação!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;
end;


end.

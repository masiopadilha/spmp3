unit UnTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.DateUtils, Data.DB, Datasnap.DBClient, Data.SqlExpr, System.UITypes, Vcl.Imaging.pngimage,
  Vcl.Buttons, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Error, Winapi.ShellAPI,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdHTTP, System.Math, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, JvExExtCtrls,
  JvShape, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Stan.Async, FireDAC.DApt,
  System.Notification, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TFrmTelaPrincipal = class(TForm)
    imgBackground: TImage;
    MainMenuPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    PAlertas: TPanel;
    StatusBar1: TStatusBar;
    Modulos1: TMenuItem;
    Param1: TMenuItem;
    Equipamentos1: TMenuItem;
    ManutenoProgramada1: TMenuItem;
    SolicitaodeTrabalho1: TMenuItem;
    PlanodeTrabalho1: TMenuItem;
    ModeObra1: TMenuItem;
    Recursos1: TMenuItem;
    OrdemdeServio1: TMenuItem;
    Calendrio1: TMenuItem;
    MenudeParmetros1: TMenuItem;
    N8: TMenuItem;
    Corporativo2: TMenuItem;
    Cargos2: TMenuItem;
    iposdeProgramao1: TMenuItem;
    MotivosdeParadas2: TMenuItem;
    iposdeManuteno1: TMenuItem;
    CausasdeFalhas1: TMenuItem;
    Famlias1: TMenuItem;
    Recursos7: TMenuItem;
    PeasdeReposio3: TMenuItem;
    Equipamentos2: TMenuItem;
    ClassesdeEquipamentos1: TMenuItem;
    CentrosdeCustos1: TMenuItem;
    GrupoIndustrial1: TMenuItem;
    FormatodeCdigos1: TMenuItem;
    Unidade2: TMenuItem;
    DisponibilidadesAdmissveis1: TMenuItem;
    Fabricantes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Imagens2: TMenuItem;
    CalendriodeEquipamentos1: TMenuItem;
    CalendriodeModeObra1: TMenuItem;
    Feriados1: TMenuItem;
    reas1: TMenuItem;
    Almoxarifados1: TMenuItem;
    Oficinas2: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    Histrico5: TMenuItem;
    LiteraturasTcnicas1: TMenuItem;
    NavegaoGrfica1: TMenuItem;
    ModeObraEspecializada1: TMenuItem;
    PecasdeReposio1: TMenuItem;
    LubrificaoProgramada2: TMenuItem;
    ManutenoProgramada2: TMenuItem;
    Confiabilidade2: TMenuItem;
    Contadores4: TMenuItem;
    PontosdeInspeo2: TMenuItem;
    Cadastro16: TMenuItem;
    N1: TMenuItem;
    LubrificaoProgramadadeFamlias1: TMenuItem;
    InspeeseManutenesPeridicas1: TMenuItem;
    ConsultadeEquipamentosParados2: TMenuItem;
    PontosdeInspeoeContadores1: TMenuItem;
    MonitoramentodeCondiesOperacionais1: TMenuItem;
    EquipamentosReservas2: TMenuItem;
    RotasdeManuteno1: TMenuItem;
    Histrico1: TMenuItem;
    Ausncias1: TMenuItem;
    Cadastro1: TMenuItem;
    Recursos2: TMenuItem;
    Ferramentaria3: TMenuItem;
    KitdeRecursos1: TMenuItem;
    Cadastro2: TMenuItem;
    PeasdeReposio4: TMenuItem;
    Histrico8: TMenuItem;
    KitdePeasdeReposio2: TMenuItem;
    Cadastro3: TMenuItem;
    Lubrificantes1: TMenuItem;
    Gerenciamento1: TMenuItem;
    LocalizarFuncionrio2: TMenuItem;
    Cadastro4: TMenuItem;
    ServiosExecutadosporTerceirizadosnaUnidade2: TMenuItem;
    ServiosExecutadosporTerceirizadosforadaUnidade2: TMenuItem;
    Ajuda1: TMenuItem;
    Sair1: TMenuItem;
    Contedoendice2: TMenuItem;
    Utilitrios1: TMenuItem;
    ArquivosTcnicos1: TMenuItem;
    Desenho2: TMenuItem;
    Literatura2: TMenuItem;
    InformaesMensais2: TMenuItem;
    IndicadoresdeDesempenho2: TMenuItem;
    ControledeFrota2: TMenuItem;
    ControledePneus2: TMenuItem;
    MontagemdeVeculos1: TMenuItem;
    Cadastro11: TMenuItem;
    FamliadePneus2: TMenuItem;
    ControledeAbastecimentos2: TMenuItem;
    Rotas2: TMenuItem;
    Cadastro17: TMenuItem;
    Alertas2: TMenuItem;
    InformaesGerenciaisCorporativas2: TMenuItem;
    ConsultadeAcessos1: TMenuItem;
    UsuariosAtivos1: TMenuItem;
    TimerOscioso: TTimer;
    Permissoes1: TMenuItem;
    ManutencaoProgramadadeFamilias1: TMenuItem;
    PontosdeInspecao1: TMenuItem;
    Contadores1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Cadastro5: TMenuItem;
    N5: TMenuItem;
    Assunto1: TMenuItem;
    Editora1: TMenuItem;
    Literatura1: TMenuItem;
    ema1: TMenuItem;
    Cadastro6: TMenuItem;
    N6: TMenuItem;
    Projeto1: TMenuItem;
    DespesasdeFuncionarios1: TMenuItem;
    DespesasdaManutencao1: TMenuItem;
    Producao1: TMenuItem;
    Diversos1: TMenuItem;
    Ferramentaria2: TMenuItem;
    CaixadeFerramentas1: TMenuItem;
    Cadastro8: TMenuItem;
    Inventario1: TMenuItem;
    Fechamento1: TMenuItem;
    Consulta1: TMenuItem;
    Historico1: TMenuItem;
    Relatorios1: TMenuItem;
    InformaesConsolidadasdeOS1: TMenuItem;
    DisponibilidadedoEquipamento1: TMenuItem;
    DespesasdeEquipamentos1: TMenuItem;
    MTBF1: TMenuItem;
    MTTR1: TMenuItem;
    Backlog1: TMenuItem;
    odas1: TMenuItem;
    Area1: TMenuItem;
    odas2: TMenuItem;
    ipodeManuteno1: TMenuItem;
    MotivodeParada1: TMenuItem;
    CentrodeCusto1: TMenuItem;
    Oficina1: TMenuItem;
    odas4: TMenuItem;
    rea2: TMenuItem;
    Parametros1: TMenuItem;
    Corporativos1: TMenuItem;
    Equipamentos3: TMenuItem;
    CentrosdeCustos2: TMenuItem;
    ClassesdeEquipamentos2: TMenuItem;
    Famlias2: TMenuItem;
    Recursos3: TMenuItem;
    PeasdeReposio1: TMenuItem;
    Equipamentos4: TMenuItem;
    CausasdeFalhas2: TMenuItem;
    iposdeManuteno2: TMenuItem;
    MotivosdeParadas1: TMenuItem;
    iposdeProgramao2: TMenuItem;
    Cargos1: TMenuItem;
    Unidade3: TMenuItem;
    Fabricantes2: TMenuItem;
    Fornecedores2: TMenuItem;
    Imagens1: TMenuItem;
    CalendriodeEquipamentos2: TMenuItem;
    CalendriodeModeObra2: TMenuItem;
    Feriados2: TMenuItem;
    reas2: TMenuItem;
    Almoxarifados2: TMenuItem;
    Oficinas1: TMenuItem;
    ManutencaoProgramada2: TMenuItem;
    LubrificacaoProgramada2: TMenuItem;
    ModeObra2: TMenuItem;
    Recursos4: TMenuItem;
    PeasdeReposio2: TMenuItem;
    Lubrificantes2: TMenuItem;
    PecadeReposicao1: TMenuItem;
    Equipamento1: TMenuItem;
    ConsultadePecas1: TMenuItem;
    PorPeca1: TMenuItem;
    PorEquipamento1: TMenuItem;
    axas1: TMenuItem;
    CustosdoMes1: TMenuItem;
    Consertos1: TMenuItem;
    ProgressBar1: TProgressBar;
    Pneus1: TMenuItem;
    Satelite1: TMenuItem;
    Pedidos1: TMenuItem;
    Viagens1: TMenuItem;
    Familia1: TMenuItem;
    odos1: TMenuItem;
    Familia2: TMenuItem;
    FamliadeEquipamentos1: TMenuItem;
    Equpamentos1: TMenuItem;
    Equipamentos5: TMenuItem;
    FamliadeEquipamentos2: TMenuItem;
    Opcoes1: TMenuItem;
    lblLicenca: TLabel;
    Auditoria1: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    AlterarCodigo1: TMenuItem;
    Fechamento2: TMenuItem;
    Area4: TMenuItem;
    ListaCompleta1: TMenuItem;
    PorFamilia1: TMenuItem;
    ListaCompleta2: TMenuItem;
    PorEquipamento2: TMenuItem;
    ListaCompleta3: TMenuItem;
    PorEquipamento3: TMenuItem;
    ListaCompleta4: TMenuItem;
    PorFamilia2: TMenuItem;
    Area5: TMenuItem;
    AlterarFamilia1: TMenuItem;
    Area6: TMenuItem;
    NaoProgramadas1: TMenuItem;
    NaoProgramadas2: TMenuItem;
    TimerOscioso2: TTimer;
    LblTempoDesliga: TLabel;
    Cadastro7: TMenuItem;
    Consulta2: TMenuItem;
    Cadastro9: TMenuItem;
    Consulta3: TMenuItem;
    ShapeEficiencia: TJvShape;
    LblEficSolicTrabVal: TLabel;
    LblEficSolicTrab: TLabel;
    imgEficSolicTrab: TImage;
    ChartSituacaoOS: TChart;
    Series3: THorizBarSeries;
    ChartTipoManutencao: TChart;
    HorizBarSeries1: THorizBarSeries;
    ShapePeriodo: TJvShape;
    lblFiltro: TLabel;
    cbAno: TComboBox;
    lblAno: TLabel;
    lblMes: TLabel;
    cbMes: TComboBox;
    butAtualizarDashboard: TSpeedButton;
    ChartOSOficina: TChart;
    HorizBarSeries2: TPieSeries;
    ShapeMTBF: TJvShape;
    lblMTBF: TLabel;
    imgMTBF: TImage;
    lblMTBFVal: TLabel;
    ShapeMTTR: TJvShape;
    lblMTTR: TLabel;
    imgMTTR: TImage;
    lblMTTRVal: TLabel;
    lblDisponibilidade: TLabel;
    imgDisponibilidade: TImage;
    ShapeDisponibilidade: TJvShape;
    lblDisponibilidadeVal: TLabel;
    vimgSPMPLogo: TVirtualImage;
    ImageCollection1: TImageCollection;
    ChartSolicTrabalho: TChart;
    BarSeries1: TBarSeries;
    BarSeries2: TLineSeries;
    Series1: THorizBarSeries;
    ShapeOficina: TJvShape;
    cbOficina: TDBLookupComboBox;
    memFiltros: TFDMemTable;
    memFiltrosCODOFICINA: TStringField;
    memFiltrosMATRICULA: TStringField;
    dsFiltros: TDataSource;
    qryOficinas: TFDQuery;
    lblOficina: TLabel;
    dsOficinas: TDataSource;
    btnFiltraOficina: TSpeedButton;
    ShapeSolicitante: TJvShape;
    lblSolicitante: TLabel;
    CBSolicitante: TDBLookupComboBox;
    btnFiltraSolic: TSpeedButton;
    qryFuncionarios: TFDQuery;
    dsFuncionarios: TDataSource;
    qryFuncionariosMATRICULA: TStringField;
    qryFuncionariosNOME: TStringField;
    NotificationCenter1: TNotificationCenter;
    ShapeManutencao: TJvShape;
    lblManutencao: TLabel;
    memFiltrosCODMANUTENCAO: TStringField;
    btnFiltraManutencao: TSpeedButton;
    cbManutencao: TComboBox;
    procedure MenudeParmetros1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Cadastro16Click(Sender: TObject);
    procedure CentrosdeCustos1Click(Sender: TObject);
    procedure TimerLetreiroTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PAlertasDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormatodeCdigos1Click(Sender: TObject);
    procedure GrupoIndustrial1Click(Sender: TObject);
    procedure TimerOsciosoTimer(Sender: TObject);
    procedure ClassesdeEquipamentos1Click(Sender: TObject);
    procedure Equipamentos2Click(Sender: TObject);
    procedure PeasdeReposio3Click(Sender: TObject);
    procedure Recursos7Click(Sender: TObject);
    procedure CausasdeFalhas1Click(Sender: TObject);
    procedure iposdeManuteno1Click(Sender: TObject);
    procedure MotivosdeParadas2Click(Sender: TObject);
    procedure iposdeProgramao1Click(Sender: TObject);
    procedure Cargos2Click(Sender: TObject);
    procedure Oficinas2Click(Sender: TObject);
    procedure Almoxarifados1Click(Sender: TObject);
    procedure reas1Click(Sender: TObject);
    procedure Feriados1Click(Sender: TObject);
    procedure CalendriodeModeObra1Click(Sender: TObject);
    procedure CalendriodeEquipamentos1Click(Sender: TObject);
    procedure Imagens2Click(Sender: TObject);
    procedure Fabricantes1Click(Sender: TObject);
    procedure DisponibilidadesAdmissveis1Click(Sender: TObject);
    procedure CadastrodeUsurios1Click(Sender: TObject);
    procedure Permissoes1Click(Sender: TObject);
    procedure PecasdeReposio1Click(Sender: TObject);
    procedure ModeObraEspecializada1Click(Sender: TObject);
    procedure LiteraturasTcnicas1Click(Sender: TObject);
    procedure PontosdeInspeo2Click(Sender: TObject);
    procedure Contadores4Click(Sender: TObject);
    procedure Confiabilidade2Click(Sender: TObject);
    procedure ManutenoProgramada2Click(Sender: TObject);
    procedure LubrificaoProgramada2Click(Sender: TObject);
    procedure NavegaoGrfica1Click(Sender: TObject);
    procedure Histrico5Click(Sender: TObject);
    procedure SolicitaodeTrabalho1Click(Sender: TObject);
    procedure PlanodeTrabalho1Click(Sender: TObject);
    procedure Cadastro4Click(Sender: TObject);
    procedure Gerenciamento1Click(Sender: TObject);
    procedure PontosdeInspecao1Click(Sender: TObject);
    procedure Contadores1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Ausncias1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Cadastro2Click(Sender: TObject);
    procedure KitdeRecursos1Click(Sender: TObject);
    procedure Ferramentaria3Click(Sender: TObject);
    procedure Cadastro3Click(Sender: TObject);
    procedure KitdePeasdeReposio2Click(Sender: TObject);
    procedure Lubrificantes1Click(Sender: TObject);
    procedure LocalizarFuncionrio2Click(Sender: TObject);
    procedure ServiosExecutadosporTerceirizadosforadaUnidade2Click(
      Sender: TObject);
    procedure ServiosExecutadosporTerceirizadosnaUnidade2Click(Sender: TObject);
    procedure Calendrio1Click(Sender: TObject);
    procedure Cadastro5Click(Sender: TObject);
    procedure Assunto1Click(Sender: TObject);
    procedure Literatura1Click(Sender: TObject);
    procedure ema1Click(Sender: TObject);
    procedure Cadastro6Click(Sender: TObject);
    procedure Projeto1Click(Sender: TObject);
    procedure DespesasdeFuncionarios1Click(Sender: TObject);
    procedure Producao1Click(Sender: TObject);
    procedure Diversos1Click(Sender: TObject);
    procedure IndicadoresdeDesempenho2Click(Sender: TObject);
    procedure InformaesGerenciaisCorporativas2Click(Sender: TObject);
    procedure Alertas2Click(Sender: TObject);
    procedure Cadastro8Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure Cadastro17Click(Sender: TObject);
    procedure Rotas2Click(Sender: TObject);
    procedure FamliadePneus2Click(Sender: TObject);
    procedure Cadastro11Click(Sender: TObject);
    procedure ConsultadeEquipamentosParados2Click(Sender: TObject);
    procedure RotasdeManuteno1Click(Sender: TObject);
    procedure EquipamentosReservas2Click(Sender: TObject);
    procedure MonitoramentodeCondiesOperacionais1Click(Sender: TObject);
    procedure MontagemdeVeculos1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Editora1Click(Sender: TObject);
    procedure UsuariosAtivos1Click(Sender: TObject);
    procedure ConsultadeAcessos1Click(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
    procedure Historico1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure CentrosdeCustos2Click(Sender: TObject);
    procedure ClassesdeEquipamentos2Click(Sender: TObject);
    procedure Equipamentos4Click(Sender: TObject);
    procedure PeasdeReposio1Click(Sender: TObject);
    procedure Recursos3Click(Sender: TObject);
    procedure CausasdeFalhas2Click(Sender: TObject);
    procedure iposdeManuteno2Click(Sender: TObject);
    procedure MotivosdeParadas1Click(Sender: TObject);
    procedure iposdeProgramao2Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure Oficinas1Click(Sender: TObject);
    procedure Almoxarifados2Click(Sender: TObject);
    procedure reas2Click(Sender: TObject);
    procedure Feriados2Click(Sender: TObject);
    procedure CalendriodeModeObra2Click(Sender: TObject);
    procedure CalendriodeEquipamentos2Click(Sender: TObject);
    procedure Imagens1Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure Fabricantes2Click(Sender: TObject);
    procedure Ferramentaria2Click(Sender: TObject);
    procedure Contedoendice2Click(Sender: TObject);
    procedure ModeObra2Click(Sender: TObject);
    procedure Recursos4Click(Sender: TObject);
    procedure PeasdeReposio2Click(Sender: TObject);
    procedure Lubrificantes2Click(Sender: TObject);
    procedure Backlog1Click(Sender: TObject);
    procedure PecadeReposicao1Click(Sender: TObject);
    procedure Equipamento1Click(Sender: TObject);
    procedure PorPeca1Click(Sender: TObject);
    procedure PorEquipamento1Click(Sender: TObject);
    procedure axas1Click(Sender: TObject);
    procedure CustosdoMes1Click(Sender: TObject);
    procedure Consertos1Click(Sender: TObject);
    procedure DisponibilidadedoEquipamento1Click(Sender: TObject);
    procedure odas2Click(Sender: TObject);
    procedure ipodeManuteno1Click(Sender: TObject);
    procedure MotivodeParada1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure Oficina1Click(Sender: TObject);
    procedure Area1Click(Sender: TObject);
    procedure odas4Click(Sender: TObject);
    procedure rea2Click(Sender: TObject);
    procedure Pneus1Click(Sender: TObject);
    procedure Satelite1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Viagens1Click(Sender: TObject);
    procedure Familia1Click(Sender: TObject);
    procedure odos1Click(Sender: TObject);
    procedure Familia2Click(Sender: TObject);
    procedure Opcoes1Click(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
    procedure DespesasdaManutencao1Click(Sender: TObject);
    procedure AlterarCodigo1Click(Sender: TObject);
    procedure Fechamento2Click(Sender: TObject);
    procedure Area4Click(Sender: TObject);
    procedure ListaCompleta1Click(Sender: TObject);
    procedure PorFamilia1Click(Sender: TObject);
    procedure ListaCompleta2Click(Sender: TObject);
    procedure PorEquipamento2Click(Sender: TObject);
    procedure ListaCompleta3Click(Sender: TObject);
    procedure ListaCompleta4Click(Sender: TObject);
    procedure PorEquipamento3Click(Sender: TObject);
    procedure PorFamilia2Click(Sender: TObject);
    procedure Area5Click(Sender: TObject);
    procedure AlterarFamilia1Click(Sender: TObject);
    procedure Area6Click(Sender: TObject);
    procedure NaoProgramadas1Click(Sender: TObject);
    procedure NaoProgramadas2Click(Sender: TObject);
    procedure TimerOscioso2Timer(Sender: TObject);
    procedure Cadastro7Click(Sender: TObject);
    procedure Consulta2Click(Sender: TObject);
    procedure Cadastro9Click(Sender: TObject);
    procedure Consulta3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure butAtualizarDashboardClick(Sender: TObject);
    procedure MTBF1Click(Sender: TObject);
    procedure MTTR1Click(Sender: TObject);
    procedure btnFiltraOficinaClick(Sender: TObject);
    procedure btnFiltraSolicClick(Sender: TObject);
    procedure CBSolicitanteKeyPress(Sender: TObject; var Key: Char);
    procedure cbOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltraManutencaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    OriginalFormWidth, OriginalFormHeight, OriginalSituacaoOSWidth,
    OriginalSituacaoOSHeight, OriginalTipoManutencaoWidth, OriginalTipoManutencaoHeight,
    OriginalSolicTrabalhoWidth, OriginalSolicTrabalhoHeight, OriginalSolicTrabalhoTop,
    OriginalOSOficinaWidth, OriginalOSOficinaHeight, OriginalOSOficinaTop: Integer;
    ProporcaoTopTipoManut, ProporcaoTopOSOficina: Double;
  public
    { Public declarations }

    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
//    procedure CalcularDashboard;

  end;

var
  FrmTelaPrincipal: TFrmTelaPrincipal;

implementation

{$R *.dfm}

uses UnTelaMenuParametros, UnTelaCadCentroCusto,
  UnTelaCadEquipamentos, UnTelaCadFormatoCodigo, UnTelaCadGrupoIndustrial,
  UnTelaCadClasses, UnTelaCadCargos, UnTelaCadCausaFalha,
  UnTelaCadFamiliaEquipamento, UnTelaCadFamiliaPecasRep,
  UnTelaCadFamiliaRecursos, UnTelaCadMotivoParada, UnTelaCadTipoManutencao,
  UnTelaCadTipoProgramacao, UnTelaCadOficinas, UnTelaCadAlmoxarifados,
  UnTelaCadAreas, UnTelaCadCalendEquip, UnTelaCadCalendMObra,
  UnTelaCadDisponibilidade, UnTelaCadFabricantes, UnTelaCadFeriados,
  UnTelaCadFornecedores, UnTelaCadImagens, UnTelaCadUsuarios, UnTelaPermissoes,
  UnTelaCadLubrifictProgEquip, UnTelaCadManutProgEquip, UnTelaConsulta,
  UnTelaCadEquipamentosPecas, UnTelaCadEquipamentosEsp,
  UnTelaCadEquipamentosArqTec, UnTelaCadEquipamentosPontosInsp,
  UnTelaCadEquipamentosContadores, UnTelaCadEquipamentosConf,
  UnTelaCadNavegacaoGrafica, UnTelaCadEquipamentosHist,
  UnTelaCadSolicitacaoTrab, UnTelaCadPlanoTrabalho, UnTelaCadManutProgFamEquip,
  UnTelaCadLubrificProgFamEquip, UnTelaInspFechamento, UnTelaCadOrdemServico,
  UnTelaCadOrdemServicoMObra, UnTelaCadOrdemServicoGerencia,
  UnTelaCadPontoInspecao, UnTelaCadContadores, UnTelaCadFuncionarios,
  UnTelaCadFuncionariosCxaFerramentas, UnTelaCadFuncionariosCxaFerramInv,
  UnTelaCadFuncionariosAusencias, UnTelaCadFuncionariosHist, UnTelaCadRecursos,
  UnTelaCadRecursosKit, UnTelaCadRecursosFerram, UnTelaCadPecasReposicao,
  UnTelaCadPecasReposicaoKit, UnTelaCadPecasReposicaoHist,
  UnTelaCadLubrificantes, UnTelaCadOrdemServicoLocalizaMObra,
  UnTelaCadOrdemServicoTercFora, UnTelaCadOrdemServicoTercUnid,
  UnTelaCadCalendarioOS, UnTelaCadArqTecnicoLiteratura,
  UnTelaCadArqTecnicoLiteraturaParam, UnTelaCadArqTecnicoDesenho,
  UnTelaCadInfMensalFuncionarios, UnTelaCadInfMensalDespesasMensais,
  UnTelaCadInfMensalProducaoMensal, UnTelaCadInfMensalDiversas,
  UnTelaCadIndDesempenho, UnTelaInfGerenciais, UnTelaCadAlertas,
  UnTelaCadFuncionariosFerramentaria, UnTelaCadAbastecimentos,
  UnTelaCadAbastecimentosRotas, UnTelaCadFamiliaPneus, UnTelaCadPneusChassi,
  UnTelaCadPneus, UnTelaParadasDiarias, UnTelaCadRotaProgEquip,
  UnTelaCadEquipamentoReserva, UnTelaCadMonitoramento, UnTelaUsuariosAtivos,
  UnTelaUsuarioAcessos, UnTelaInspVenc, UnTelaInspFechamentoHist,
  UnTelaInspConsulta, UnTelaCadInfMensalTaxas, UnTelaCustosMes,
  UnTelaCadPneusChassiPneusConsertos, UnDmRelatorios,
  UnTelaConsultaPeriodo, UnTelaCadPneusChassiRelat, UnTelaImpDadosSatelite,
  UnTelaImpPedidos, UnTelaCadAbastecimentosViagens, UnTelaOpcoes, UnDM,
  UnTelaAuditoria, UnDmAlertas, UnTelaCadEquipamentosAltCod,
  UnTelaCadOrdemServicoFechamento, UnTelaCadEquipamentosAltFamiliaCod,
  UnTempoOcioso, UnTelaCadManutProgFamEquipConsulta,
  UnTelaCadLubrificProgFamEquipConsulta, UnTelaCadSolicitacaoTrabCons,
  UnDMDashboard;


procedure TFrmTelaPrincipal.AppIdle(Sender: TObject; var Done: Boolean);
begin
  TimerOscioso.Enabled := True;
  TimerOscioso2.Enabled := True;
end;

procedure TFrmTelaPrincipal.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.message of
    WM_MOUSEACTIVATE, WM_KEYFIRST..WM_KEYLAST, WM_MOUSEFIRST..WM_MOUSELAST:
    begin
      TimerOscioso.Enabled := False;
      TimerOscioso2.Enabled := False;
      DM.FSegundosDesliga := DM.FMinutosInativo * 60;
      LblTempoDesliga.Caption := ' O sistema será encerrado em ' + DM.SecondToTime(DM.FSegundosDesliga);
      if frmSistemaOcioso <> nil then
        if frmSistemaOcioso.Active = True then
          frmSistemaOcioso.Close;
    end;
  end;
end;

procedure TFrmTelaPrincipal.Alertas2Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaCadAlertas, FrmTelaCadAlertas);
    FrmTelaCadAlertas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAlertas);
  End;
end;

procedure TFrmTelaPrincipal.Almoxarifados1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADALMOXARIFADO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryAlmoxarifadoCODIGO, DM.qryFormatoCodigoALMOXARIFADO, FrmTelaCadAlmoxarifados) = False then exit;
    Application.CreateForm(TFrmTelaCadAlmoxarifados, FrmTelaCadAlmoxarifados);
    FrmTelaCadAlmoxarifados.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAlmoxarifados);
  End;
end;

procedure TFrmTelaPrincipal.Almoxarifados2Click(Sender: TObject);
begin
  if not Assigned(DmRelatorios) then
    Application.CreateForm(TDmRelatorios, DmRelatorios);
  DmRelatorios.frxDBAlmoxarifado.DataSet := DM.qryAuxiliar;
  DM.qryAuxiliar.Close;
  DM.qryAuxiliar.SQL.Clear;
  DM.qryAuxiliar.SQL.Add('SELECT `almoxarifado`.`CODIGO`, `almoxarifado`.`DESCRICAO`, `almoxarifado`.`MATERIAL`, `almoxarifado`.`NUMITENS`, `almoxarifado`.`AREA`, `centrocusto`.`DESCRICAO`CENTROCUSTO'
                          + ' FROM `almoxarifado` INNER JOIN `centrocusto` ON (`almoxarifado`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `almoxarifado`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
  DM.qryAuxiliar.Open;
  DmRelatorios.frxRAlmoxarifado.ShowReport();
  DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.AlterarCodigo1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if (DM.qryUsuarioPAlteracaoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Alteração não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosAltCod, FrmTelaCadEquipamentosAltCod);
    FrmTelaCadEquipamentosAltCod.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosAltCod);
  End;
end;

procedure TFrmTelaPrincipal.AlterarFamilia1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if (DM.qryUsuarioPAlteracaoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Alteração não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosAltFamiliaCod, FrmTelaCadEquipamentosAltFamiliaCod);
    FrmTelaCadEquipamentosAltFamiliaCod.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosAltFamiliaCod);
  End;
end;

procedure TFrmTelaPrincipal.Area1Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';
if DM.ConsultarCombo <> '' then
  begin
    FrmTelaPrincipal.Tag := 1;
    Try
      Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
      FrmTelaConsultaPeriodo.ShowModal;
    Finally
      DM.FCodCombo := EmptyStr;
      DM.FValorCombo := EmptyStr;
      DM.FTabela_auxiliar := -1;
      FreeAndNil(FrmTelaConsultaPeriodo);
    End;
  end;
end;

procedure TFrmTelaPrincipal.Area4Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';

if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBManutProgEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
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
                           + ' WHERE (`manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`CODLOCALIZACAO` = '+QuotedStr(DM.FCodCombo) + ') ORDER BY `manutprogequipamento`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxRManutProgEquipGeral.ShowReport();
  end;
end;

procedure TFrmTelaPrincipal.Area5Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBLubrificProgEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                           + ', `lubrificprogequipamento`.`CODMONITORAMENTO`, `lubrificprogequipamento`.`MATRICULA`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`CRITICIDADE`'
                           + ', `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`REPROGRAMAR1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                           + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogequipamento`.`LEITURA`, `lubrificprogequipamento`.`RELATORIO`, `lubrificprogequipamento`.`GRUPOINSP`'
                           + ', `lubrificprogequipamento`.`DATACADASTRO`, `lubrificprogequipamento`.`CODUSUARIOCAD`, `lubrificprogequipamento`.`DATAULTALT`, `lubrificprogequipamento`.`CODUSUARIOALT`'
                           + ', `lubrificprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP'
                           + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                           + ', DATE_ADD(`lubrificprogequipamento`.`DTAINICIO1`, INTERVAL `lubrificprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP, `equipamentos`.`CODLOCALIZACAO` As CODAREA, `areas`.`DESCRICAO` AS DESCAREA'
                           + ' FROM `lubrificprogequipamento`'
                           + ' LEFT JOIN `usuario` ON (`lubrificprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                           + ' LEFT JOIN `usuario` AS `usuario_1` ON (`lubrificprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                           + ' LEFT JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `lubrificprogfamequipamento`.`CODEMPRESA`)'
                           + ' LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                           + ' INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                           + ' INNER JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                           + ' LEFT JOIN `funcionarios` ON (`lubrificprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                           + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                           + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                           + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                           + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                           + ' WHERE (`lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `areas`.`CODIGO` = '+QuotedStr(DM.FCodCombo) + ') ORDER BY `lubrificprogequipamento`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxRLubrificProgEquipGeral.ShowReport();
  end;

end;

procedure TFrmTelaPrincipal.Area6Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP, `areas`.`DESCRICAO` AREA FROM `equipamentos`'
                           + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)'
                           + ' INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO` and `equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                           + ' WHERE (`equipamentos`.`CODIGO` = `equipamentos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' and `equipamentos`.`CODLOCALIZACAO` =  '+QuotedStr(DM.FCodCombo) + ') order by `equipamentos`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxREquipGeral.ShowReport();
  end;

end;

procedure TFrmTelaPrincipal.Assunto1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
    DM.FParamAuxiliar[1] := 'ASSUNTO';
    FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Assunto';
    FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
  End;
end;

procedure TFrmTelaPrincipal.Auditoria1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPERMISSOES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaAuditoria, FrmTelaAuditoria);
    FrmTelaAuditoria.ShowModal;
  Finally
    FreeAndNil(FrmTelaAuditoria);
  End;
end;

procedure TFrmTelaPrincipal.Ausncias1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 300;
        DM.FParamAuxiliar[1] := 'NOME';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosAusencias, FrmTelaCadFuncionariosAusencias);
    FrmTelaCadFuncionariosAusencias.Caption := 'Ausências de: '+ DM.FValorCombo;
    FrmTelaCadFuncionariosAusencias.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosAusencias);
  End;
end;

procedure TFrmTelaPrincipal.axas1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADINFMENSAIS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadInfMensalTaxas, FrmTelaCadInfMensalTaxas);
    FrmTelaCadInfMensalTaxas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadInfMensalTaxas);
  End;
end;

procedure TFrmTelaPrincipal.Backlog1Click(Sender: TObject);
begin
  inherited;
  FrmTelaPrincipal.Tag := 6;
  Try
    Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
    FrmTelaConsultaPeriodo.ShowModal;
  Finally
    FreeAndNil(FrmTelaConsultaPeriodo);
  End;
end;

procedure TFrmTelaPrincipal.btnFiltraManutencaoClick(Sender: TObject);
begin
  DM.MSGAguarde('');
  DMDashboard.CalcularDashboard;
  DM.MSGAguarde('', False);
end;

procedure TFrmTelaPrincipal.btnFiltraOficinaClick(Sender: TObject);
begin
  DM.MSGAguarde('');
  DMDashboard.CalcularDashboard;
  DM.MSGAguarde('', False);
end;

procedure TFrmTelaPrincipal.btnFiltraSolicClick(Sender: TObject);
var
  LTotalSolicitado, LTotalFechado: Integer;
  LSolicitadas: array[1..12] of Integer;
  LFechadas: array[1..12] of Integer;

begin
    //----------------------------SOLICITADAS-------------------------------------------------------------------------------------------------------------------------------------
    if CBSolicitante.Text = '' then Exit;

    DM.MSGAguarde('');

    ChartSolicTrabalho.Series[0].Clear;
    ChartSolicTrabalho.Series[1].Clear;
    LTotalSolicitado := 0;
    LTotalFechado := 0;
    DMDashboard.qryDashboard.Close;
    DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                  +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
                                  + ' FROM'
                                  + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
                                  + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
                                  + ' LEFT JOIN'
                                  + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
                                  + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` <> ''CANCELADA'' and s.`MATRICULA` = :matricula';

    if memFiltrosCODOFICINA.AsString <> '' then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + 'LEFT JOIN `tipomanutencao` t ON (t.`CODIGO` = s.`CODMANUTENCAO`) AND (t.`TIPOMANUTENCAO`) LIKE :tipomanutencao';

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);
    DMDashboard.qryDashboard.Params[1].AsString := qryFuncionariosMATRICULA.AsString;
    case cbManutencao.ItemIndex of
      0: DMDashboard.qryDashboard.Params[1].AsString := '%%';
      1: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Autônoma';
      2: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Corretiva';
      3: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preventiva';
      4: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preditiva';
      5: DMDashboard.qryDashboard.Params[1].AsString := 'Lubrificação';
      6: DMDashboard.qryDashboard.Params[1].AsString := 'Novos Projetos';
      7: DMDashboard.qryDashboard.Params[1].AsString := 'Alterações';
      8: DMDashboard.qryDashboard.Params[1].AsString := 'Outras';
    end;
    DMDashboard.qryDashboard.Open;

    while not DMDashboard.qryDashboard.Eof = True do
    begin
      LSolicitadas[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
      LTotalSolicitado := LTotalSolicitado + DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;

      DMDashboard.qryDashboard.Next;
    end;
    DMDashboard.qryDashboard.Close;

    //------------------------------FECHADAS--------------------------------------------------------------------------------------------------------------------------------------
    DMDashboard.qryDashboard.Close;
    DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                  +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
                                  + ' FROM'
                                  + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
                                  + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
                                  + ' LEFT JOIN'
                                  + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
                                  + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` = ''FECHADA'' and s.`MATRICULA` = :matricula' ;

    if memFiltrosCODOFICINA.AsString <> '' then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + 'LEFT JOIN `tipomanutencao` t ON (t.`CODIGO` = s.`CODMANUTENCAO`) AND (t.`TIPOMANUTENCAO`) LIKE :tipomanutencao';

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);
    DMDashboard.qryDashboard.Params[1].AsString := qryFuncionariosMATRICULA.AsString;
    case cbManutencao.ItemIndex of
      0: DMDashboard.qryDashboard.Params[1].AsString := '%%';
      1: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Autônoma';
      2: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Corretiva';
      3: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preventiva';
      4: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preditiva';
      5: DMDashboard.qryDashboard.Params[1].AsString := 'Lubrificação';
      6: DMDashboard.qryDashboard.Params[1].AsString := 'Novos Projetos';
      7: DMDashboard.qryDashboard.Params[1].AsString := 'Alterações';
      8: DMDashboard.qryDashboard.Params[1].AsString := 'Outras';
    end;
    DMDashboard.qryDashboard.Open;

    while not DMDashboard.qryDashboard.Eof = True do
    begin
      LFechadas[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
      LTotalFechado := LTotalFechado + DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;

      DMDashboard.qryDashboard.Next;
    end;

    DMDashboard.qryDashboard.First;
    while not DMDashboard.qryDashboard.Eof = True do
    begin
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Feb' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Fev');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Fev');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Apr' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Abr');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Abr');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'May' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Mai');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Mai');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Aug' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Ago');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Ago');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Sep' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Set');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Set');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Oct' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Out');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Out');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Dec' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Dez');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Dez');
      end else
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('MES').AsString);
        ChartSolicTrabalho.Series[1].Add(LFechadas[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('MES').AsString);
      end;

      DMDashboard.qryDashboard.Next;
    end;
    DMDashboard.qryDashboard.Close;

    if LTotalSolicitado > 0 then
      LblEficSolicTrabVal.Caption := FormatFloat('0.00%', (LTotalFechado/LTotalSolicitado) * 100)
    else
      LblEficSolicTrabVal.Caption := '0%';

    DM.MSGAguarde('', False);
end;

procedure TFrmTelaPrincipal.butAtualizarDashboardClick(Sender: TObject);
begin
  cbOficina.ListFieldIndex := -1;
  CBSolicitante.ListFieldIndex := -1;

  DM.MSGAguarde('');

  memFiltros.Edit;
  memFiltrosMATRICULA.AsString := '';
  memFiltrosCODOFICINA.AsString := '';
  memFiltrosCODMANUTENCAO.AsString := '';
  DMDashboard.CalcularDashboard;
  DM.MSGAguarde('', False);
end;

procedure TFrmTelaPrincipal.Button1Click(Sender: TObject);
begin
DM.MSGAguarde('');
end;

procedure TFrmTelaPrincipal.Cadastro11Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryPneusCODIGO, DM.qryFormatoCodigoPNEUS, FrmTelaCadPneus) = False then exit;
    Application.CreateForm(TFrmTelaCadPneus, FrmTelaCadPneus);
    FrmTelaCadPneus.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPneus);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro16Click(Sender: TObject);
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

procedure TFrmTelaPrincipal.Cadastro17Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadAbastecimentos,FrmTelaCadAbastecimentos);
    FrmTelaCadAbastecimentos.Position := poScreenCenter;
    FrmTelaCadAbastecimentos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAbastecimentos);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro1Click(Sender: TObject);
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

procedure TFrmTelaPrincipal.Cadastro2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADRECURSOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryRecursosCODIGO, DM.qryFormatoCodigoRECURSOS, FrmTelaCadRecursos) = False then exit;
    Application.CreateForm(TFrmTelaCadRecursos, FrmTelaCadRecursos);
    FrmTelaCadRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadRecursos);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro3Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryPecasReposicaoCODIGO, DM.qryFormatoCodigoPECASREPOSICAO, FrmTelaCadPecasReposicao) = False then exit;
    Application.CreateForm(TFrmTelaCadPecasReposicao, FrmTelaCadPecasReposicao);
    FrmTelaCadPecasReposicao.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPecasReposicao);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro4Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServico, FrmTelaCadOrdemServico);
    FrmTelaCadOrdemServico.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServico);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro5Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryArquivoTecnicoCODIGO, DM.qryFormatoCodigoARQUIVOTECNICO, FrmTelaCadArqTecnicoLiteratura) = False then exit;
    Application.CreateForm(TFrmTelaCadArqTecnicoLiteratura, FrmTelaCadArqTecnicoLiteratura);
    FrmTelaCadArqTecnicoLiteratura.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadArqTecnicoLiteratura);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro6Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryArquivoTecnicoCODIGO, DM.qryFormatoCodigoARQUIVOTECNICO, FrmTelaCadArqTecnicoLiteratura) = False then exit;
    Application.CreateForm(TFrmTelaCadArqTecnicoDesenho, FrmTelaCadArqTecnicoDesenho);
    FrmTelaCadArqTecnicoDesenho.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadArqTecnicoDesenho);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro7Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryManutProgFamEquipCODIGO, DM.qryFormatoCodigoMANUTPROGFAMEQUIPAMENTO, FrmTelaCadManutProgFamEquip) = False then exit;
    Application.CreateForm(TFrmTelaCadManutProgFamEquip, FrmTelaCadManutProgFamEquip);
    FrmTelaCadManutProgFamEquip.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgFamEquip);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro8Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 300;
        DM.FParamAuxiliar[1] := 'NOME';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosCxaFerramentas, FrmTelaCadFuncionariosCxaFerramentas);
    FrmTelaCadFuncionariosCxaFerramentas.Caption := 'Caixa de Ferramentas de: '+ DM.FValorCombo;
    FrmTelaCadFuncionariosCxaFerramentas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosCxaFerramentas);
  End;
end;

procedure TFrmTelaPrincipal.Cadastro9Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryLubrificProgFamEquipCODIGO, DM.qryFormatoCodigoLUBRIFICPROGFAMEQUIPAMENTO, FrmTelaCadLubrificProgFamEquip) = False then exit;
    Application.CreateForm(TFrmTelaCadLubrificProgFamEquip, FrmTelaCadLubrificProgFamEquip);
    FrmTelaCadLubrificProgFamEquip.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgFamEquip);
  End;
end;

procedure TFrmTelaPrincipal.CadastrodeUsurios1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADUSUARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryUsuariosCODIGO, DM.qryFormatoCodigoUSUARIO, FrmTelaCadUsuarios) = False then exit;
    Application.CreateForm(TFrmTelaCadUsuarios, FrmTelaCadUsuarios);
    FrmTelaCadUsuarios.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadUsuarios);
  End;
end;

//procedure TFrmTelaPrincipal.CalcularDashboard;
//var
//  LTotalSolicitado, LTotalFechado: Real;
//  LColor: TColor;
//begin
//  //---------------------------GrafSolicTrab------------------------------------------------------------------------------------------------------------------------------------
//  //----------------------------SOLICITADAS-------------------------------------------------------------------------------------------------------------------------------------
//  ChartSolicTrabalho.Series[0].Clear;
//  ChartSolicTrabalho.Series[1].Clear;
//  LTotalSolicitado := 0;
//  LTotalFechado := 0;
//  DM.qryDashboard.Close;
//  DM.qryDashboard.SQL.Text := 'SELECT'
//                                +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
//                                + ' FROM'
//                                + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
//                                + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
//                                + ' LEFT JOIN'
//                                + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
//                                + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` <> ''CANCELADA'''
//                                + ' GROUP BY MES'
//                                + ' ORDER BY'
//                                + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
//  DM.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);
//  DM.qryDashboard.Open;
//
//  while not DM.qryDashboard.Eof = True do
//  begin
//    LSolicitadas[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
//    LTotalSolicitado := LTotalSolicitado + DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
//
//    DM.qryDashboard.Next;
//  end;
//  DM.qryDashboard.Close;
//
//  //------------------------------FECHADAS--------------------------------------------------------------------------------------------------------------------------------------
//  DM.qryDashboard.Close;
//  DM.qryDashboard.SQL.Text := 'SELECT'
//                                +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
//                                + ' FROM'
//                                + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
//                                + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
//                                + ' LEFT JOIN'
//                                + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
//                                + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` = ''FECHADA'''
//                                + ' GROUP BY MES'
//                                + ' ORDER BY'
//                                + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
//  DM.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);;
//  DM.qryDashboard.Open;
//
//  while not DM.qryDashboard.Eof = True do
//  begin
//    LFechadas[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
//    LTotalFechado := LTotalFechado + DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
//
//    DM.qryDashboard.Next;
//  end;
//
//  DM.qryDashboard.First;
//  while not DM.qryDashboard.Eof = True do
//  begin
//    if DM.qryDashboard.FieldByName('MES').AsString = 'Feb' then
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Fev');
//      ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Fev');
//    end else
//    if DM.qryDashboard.FieldByName('MES').AsString = 'Apr' then
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Abr');
//      ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Abr');
//    end else
//    if DM.qryDashboard.FieldByName('MES').AsString = 'May' then
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Mai');
//      ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Mai');
//    end else
//    if DM.qryDashboard.FieldByName('MES').AsString = 'Aug' then
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Ago');
//      ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Ago');
//    end else
//    if DM.qryDashboard.FieldByName('MES').AsString = 'Sep' then
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Set');
//      ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Set');
//    end else
//    if DM.qryDashboard.FieldByName('MES').AsString = 'Oct' then
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Out');
//      ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Out');
//    end else
//    if DM.qryDashboard.FieldByName('MES').AsString = 'Dec' then
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Dez');
//      ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Dez');
//    end else
//    begin
//      ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('MES').AsString);
//      ChartSolicTrabalho.Series[1].Add(LFechadas[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('MES').AsString);
//    end;
//
//    DM.qryDashboard.Next;
//  end;
//  DM.qryDashboard.Close;
//
//  if LTotalSolicitado > 0 then
//    LblEficSolicTrabVal.Caption := FormatFloat('0.00%', (LTotalFechado/LTotalSolicitado) * 100)
//  else
//    LblEficSolicTrabVal.Caption := '0%';
//
//  //---------------------------TIPOS DE MANUTENÇÃO------------------------------------------------------------------------------------------------------------------------------
//
//  ChartTipoManutencao.Series[0].Clear;
//  DM.qryDashboard.Close;
//  DM.qryDashboard.SQL.Text := 'SELECT'
//                              + ' TIPO.TIPO, COUNT(o.`CODIGO`) AS TOTAL'
//                              + ' FROM'
//                              + ' (SELECT ''Manutenção Preventiva'' AS TIPO'
//                              + ' UNION ALL SELECT ''Manutenção Corretiva'' UNION ALL SELECT ''Manutenção Preditiva'''
//                              + ' UNION ALL SELECT ''Lubrificação'' UNION ALL SELECT ''Manutenção Autônoma'''
//                              + ' UNION ALL SELECT ''Novos Projetos'' UNION ALL SELECT ''Outros Serviços'') AS TIPO'
//                              + ' LEFT JOIN `tipomanutencao` AS t ON  TIPO.TIPO = t.`TIPOMANUTENCAO`'
//                              + ' LEFT JOIN `ordemservico` AS o ON o.`CODMANUTENCAO` = t.`CODIGO`'
//                              + ' AND MONTH(o.`DATACADASTRO`) = :MES AND YEAR(o.`DATACADASTRO`) = :ANO'
//                              + ' GROUP BY TIPO.TIPO;';
//  DM.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
//  DM.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
//  DM.qryDashboard.Open;
//
//  while not DM.qryDashboard.Eof = True do
//  begin
//    if DM.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
//      LTipoManutencao[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTAL').AsInteger;
//
//    DM.qryDashboard.Next;
//  end;
//
//  DM.qryDashboard.First;
//  while not DM.qryDashboard.Eof = True do
//  begin
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Cadastrada' then
//      LColor := $00BBFFFF
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Solicitada' then
//      LColor := $00F3F3F3
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Fechada' then
//      LColor := clGray
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Detalhada' then
//      LColor := clYellow
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Programada' then
//      LColor := clBlue
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Reprogramada' then
//      LColor := clBlue
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Desprogramada' then
//      LColor := clYellow
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Execução' then
//      LColor := clInfoBk
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Liberada' then
//      LColor := clGreen
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Paralisada' then
//      LColor := clRed
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Cancelada' then
//      LColor := clBlack
//    else
//    if DM.qryDashboard.FieldByName('TIPO').AsString = 'Vencida' then
//      LColor := $006666FF
//    else
//      LColor := clGray;
//
//    if LTipoManutencao[DM.qryDashboard.RecNo] > 0 then
//      ChartTipoManutencao.Series[0].Add(LTipoManutencao[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('TIPO').AsString, LColor);
//
//    DM.qryDashboard.Next;
//  end;
//  DM.qryDashboard.Close;
//  //----------------------------SITUAÇÃO DAS OS---------------------------------------------------------------------------------------------------------------------------------
//
//  ChartSituacaoOS.Series[0].Clear;
//  DM.qryDashboard.Close;
//  DM.qryDashboard.SQL.Text := 'SELECT'
//                              + ' (CASE'
//                              + ' WHEN SITUACAO.SITUACAO = ''SOLICITADA'' THEN ''Solicitada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''CADASTRADA'' THEN ''Cadastrada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''DETALHADA'' THEN ''Detalhada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''PROGRAMADA'' THEN ''Programada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''DESPROGRAMADA'' THEN ''Desprogramada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''REPROGRAMADA'' THEN ''Reprogramada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''EXECUCAO'' THEN ''Execução'''
//                              + ' WHEN SITUACAO.SITUACAO = ''PARALISADA'' THEN ''Paralisada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''LIBERADA'' THEN ''Liberada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''FECHADA'' THEN ''Fechada'''
//                              + ' WHEN SITUACAO.SITUACAO = ''VENCIDA'' THEN ''Vencida'''
//                              + ' ELSE ''OUTRO'''
//                              + ' END) AS SITUACAO'
//                              +', COUNT(o.`CODIGO`) AS TOTAL'
//                              + ' FROM'
//                              + ' (SELECT ''SOLICITADA'' AS SITUACAO UNION ALL SELECT ''CADASTRADA'''
//                              + ' UNION ALL SELECT ''DETALHADA'' UNION ALL SELECT ''PROGRAMADA'''
//                              + ' UNION ALL SELECT ''DESPROGRAMADA'' UNION ALL SELECT ''REPROGRAMADA'''
//                              + ' UNION ALL SELECT ''EXECUCAO'' UNION ALL SELECT ''PARALISADA'''
//                              + ' UNION ALL SELECT ''LIBERADA'' UNION ALL SELECT ''FECHADA'''
//                              + ' UNION ALL SELECT ''VENCIDA'') AS SITUACAO'
//                              + ' LEFT JOIN `ordemservico` AS o ON o.`SITUACAO` = SITUACAO.SITUACAO'
//                              + ' AND MONTH(o.`DATACADASTRO`) = :mes AND YEAR(o.`DATACADASTRO`) = :ano'
//                              + ' GROUP BY SITUACAO.SITUACAO;';
//  DM.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
//  DM.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
//  DM.qryDashboard.Open;
//
//  while not DM.qryDashboard.Eof = True do
//  begin
//    if DM.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
//      LSituacaoOS[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTAL').AsInteger;
//
//    DM.qryDashboard.Next;
//  end;
//
//  DM.qryDashboard.First;
//  while not DM.qryDashboard.Eof = True do
//  begin
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Cadastrada' then
//      LColor := $00BBFFFF
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Solicitada' then
//      LColor := $00F3F3F3
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Fechada' then
//      LColor := clGray
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Detalhada' then
//      LColor := clYellow
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Programada' then
//      LColor := clBlue
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Reprogramada' then
//      LColor := clBlue
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Desprogramada' then
//      LColor := clYellow
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Execução' then
//      LColor := clInfoBk
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Liberada' then
//      LColor := clGreen
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Paralisada' then
//      LColor := clRed
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Cancelada' then
//      LColor := clBlack
//    else
//    if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Vencida' then
//      LColor := $006666FF
//    else
//      LColor := clGray;
//
//    if LSituacaoOS[DM.qryDashboard.RecNo] > 0 then
//      ChartSituacaoOS.Series[0].Add(LSituacaoOS[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('SITUACAO').AsString, LColor);
//
//    DM.qryDashboard.Next;
//  end;
//  DM.qryDashboard.Close;
//end;

procedure TFrmTelaPrincipal.Calendrio1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCALENDARIOOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadCalendarioOS, FrmTelaCadCalendarioOS);
    FrmTelaCadCalendarioOS.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCalendarioOS);
  End;
end;

procedure TFrmTelaPrincipal.CalendriodeEquipamentos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCALENDEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryCalendEquipCODIGO, DM.qryFormatoCodigoCALENDARIOEQUIP, FrmTelaCadCalendEquip) = False then exit;
    Application.CreateForm(TFrmTelaCadCalendEquip, FrmTelaCadCalendEquip);
    FrmTelaCadCalendEquip.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCalendEquip);
  End;
end;

procedure TFrmTelaPrincipal.CalendriodeEquipamentos2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBCalendEquip.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from calendarioequip where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRCalendEquip.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.CalendriodeModeObra1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCALENDMOBRA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryCalendMObraCODIGO, DM.qryFormatoCodigoCALENDARIO, FrmTelaCadCalendMObra) = False then exit;
    Application.CreateForm(TFrmTelaCadCalendMObra, FrmTelaCadCalendMObra);
    FrmTelaCadCalendMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCalendMObra);
  End;
end;

procedure TFrmTelaPrincipal.CalendriodeModeObra2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBCalendMObra.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from calendario where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRCalendMObra.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Cargos1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBCargos.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from cargos order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRCargos.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Cargos2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCARGOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryCargosCODIGO, DM.qryFormatoCodigoCARGOS, FrmTelaCadCargos) = False then exit;
    Application.CreateForm(TFrmTelaCadCargos, FrmTelaCadCargos);
    FrmTelaCadCargos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCargos);
  End;
end;

procedure TFrmTelaPrincipal.CausasdeFalhas1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCAUSASFALHA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryCausaFalhaCODIGO, DM.qryFormatoCodigoCAUSASFALHA, FrmTelaCadCausaFalha) = False then exit;
    Application.CreateForm(TFrmTelaCadCausaFalha, FrmTelaCadCausaFalha);
    FrmTelaCadCausaFalha.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCausaFalha);
  End;
end;

procedure TFrmTelaPrincipal.CausasdeFalhas2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBCausaFalha.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from causasfalha order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRCausaFalha.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.cbOficinaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnFiltraOficina.OnClick(Sender);
  end;

end;

procedure TFrmTelaPrincipal.CBSolicitanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnFiltraSolic.OnClick(Sender);
  end;
end;

procedure TFrmTelaPrincipal.CentrodeCusto1Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 400;
DM.FNomeConsulta := 'Centros de Custos';
if DM.ConsultarCombo <> '' then
  begin
    FrmTelaPrincipal.Tag := 1;
    Try
      Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
      FrmTelaConsultaPeriodo.ShowModal;
    Finally
      DM.FCodCombo := EmptyStr;
      DM.FValorCombo := EmptyStr;
      DM.FTabela_auxiliar := -1;
      FreeAndNil(FrmTelaConsultaPeriodo);
    End;
  end;
end;

procedure TFrmTelaPrincipal.CentrosdeCustos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCENTROCUSTO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoCENTROCUSTO, FrmTelaCadCentroCusto) = False then exit;
    //if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoNATUREZAFINANCEIRA, FrmTelaCadCentroCusto) = False then exit;
    Application.CreateForm(TFrmTelaCadCentroCusto, FrmTelaCadCentroCusto);
    FrmTelaCadCentroCusto.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCentroCusto);
  End;
end;

procedure TFrmTelaPrincipal.CentrosdeCustos2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBCentroCusto.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from centrocusto order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRCentroCusto.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.ClassesdeEquipamentos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCLASSES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryClassesCODIGO, DM.qryFormatoCodigoCLASSES, FrmTelaCadClasses) = False then exit;
    Application.CreateForm(TFrmTelaCadClasses, FrmTelaCadClasses);
    FrmTelaCadClasses.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadClasses);
  End;
end;

procedure TFrmTelaPrincipal.ClassesdeEquipamentos2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBClasses.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from classes order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRClasses.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Confiabilidade2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROGEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosConf, FrmTelaCadEquipamentosConf);
    FrmTelaCadEquipamentosConf.Caption := 'Confiabilidade do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadEquipamentosConf.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadEquipamentosConf);
  End;
end;

procedure TFrmTelaPrincipal.Consertos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadPneusChassiPneusConsertos, FrmTelaCadPneusChassiPneusConsertos);
    FrmTelaCadPneusChassiPneusConsertos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPneusChassiPneusConsertos);
  End;
end;

procedure TFrmTelaPrincipal.Consulta1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADRELATINSP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaInspConsulta, FrmTelaInspConsulta);
    FrmTelaInspConsulta.ShowModal;
  Finally
    FreeAndNil(FrmTelaInspConsulta);
  End;
end;

procedure TFrmTelaPrincipal.Consulta2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadManutProgFamEquipConsulta, FrmTelaCadManutProgFamEquipConsulta);
    FrmTelaCadManutProgFamEquipConsulta.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadManutProgFamEquipConsulta);
  End;
end;

procedure TFrmTelaPrincipal.Consulta3Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADLUBRIFICPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadLubrificProgFamEquipConsulta, FrmTelaCadLubrificProgFamEquipConsulta);
    FrmTelaCadLubrificProgFamEquipConsulta.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificProgFamEquipConsulta);
  End;
end;

procedure TFrmTelaPrincipal.ConsultadeAcessos1Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaUsuarioAcessos, FrmTelaUsuarioAcessos);
    FrmTelaUsuarioAcessos.ShowModal;
  Finally
    FreeAndNil(FrmTelaUsuarioAcessos);
  End;
end;

procedure TFrmTelaPrincipal.ConsultadeEquipamentosParados2Click(
  Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONFIABILIDADE.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaParadasDiarias, FrmTelaParadasDiarias);
    FrmTelaParadasDiarias.ShowModal;
  Finally
    FreeAndNil(FrmTelaParadasDiarias);
  End;
end;

procedure TFrmTelaPrincipal.Contadores1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryContadoresCODIGO, DM.qryFormatoCodigoPONTOSINSPECAO, FrmTelaCadContadores) = False then exit;
    Application.CreateForm(TFrmTelaCadContadores, FrmTelaCadContadores);
    FrmTelaCadContadores.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadContadores);
  End;
end;

procedure TFrmTelaPrincipal.Contadores4Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosContadores, FrmTelaCadEquipamentosContadores);
    FrmTelaCadEquipamentosContadores.Caption := 'Contadores do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadEquipamentosContadores.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadEquipamentosContadores);
  End;
end;

procedure TFrmTelaPrincipal.Contedoendice2Click(Sender: TObject);
begin
  HtmlHelp(0, Pchar(ExtractFilePath(Application.ExeName) + 'Ajuda.chm' + '::/C/SPMP-Fontes/SPMP3/Manual/HTML/Introdução/Introduo.html'), $0000,0);
end;

procedure TFrmTelaPrincipal.CustosdoMes1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADRELATORIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCustosMes, FrmTelaCustosMes);
    FrmTelaCustosMes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCustosMes);
  End;
end;

procedure TFrmTelaPrincipal.DespesasdaManutencao1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADINFMENSAIS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadInfMensalDespesasMensais, FrmTelaCadInfMensalDespesasMensais);
    FrmTelaCadInfMensalDespesasMensais.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadInfMensalDespesasMensais);
  End;
end;

procedure TFrmTelaPrincipal.DespesasdeFuncionarios1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADINFMENSAIS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadInfMensalFuncionarios, FrmTelaCadInfMensalFuncionarios);
    FrmTelaCadInfMensalFuncionarios.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadInfMensalFuncionarios);
  End;
end;

procedure TFrmTelaPrincipal.DisponibilidadedoEquipamento1Click(Sender: TObject);
begin
  FrmTelaPrincipal.Tag := 2;
  Try
    Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
    FrmTelaConsultaPeriodo.ShowModal;
  Finally
    FreeAndNil(FrmTelaConsultaPeriodo);
  End;
end;

procedure TFrmTelaPrincipal.DisponibilidadesAdmissveis1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADDISPONIBILIDADE.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadDisponibilidade, FrmTelaCadDisponibilidade);
    FrmTelaCadDisponibilidade.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadDisponibilidade);
  End;
end;

procedure TFrmTelaPrincipal.Diversos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADINFMENSAIS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadInfMensalDiversas, FrmTelaCadInfMensalDiversas);
    FrmTelaCadInfMensalDiversas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadInfMensalDiversas);
  End;
end;

procedure TFrmTelaPrincipal.Editora1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
    DM.FParamAuxiliar[1] := 'EDITORA';
    FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Editora';
    FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
  End;
end;

procedure TFrmTelaPrincipal.ema1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
    DM.FParamAuxiliar[1] := 'TEMA';
    FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Tema';
    FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
  End;
end;

procedure TFrmTelaPrincipal.Equipamento1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar  := 250;
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    DM.qryPecasReposicaoHistEquip.Close;
    DM.qryPecasReposicaoHistEquip.Params[0].AsString := DM.FCodEmpresa;
    DM.qryPecasReposicaoHistEquip.Params[1].AsString := DM.FParamAuxiliar[0];
    DM.qryPecasReposicaoHistEquip.Open;
    Application.CreateForm(TFrmTelaCadPecasReposicaoHist, FrmTelaCadPecasReposicaoHist);
    FrmTelaCadPecasReposicaoHist.GrdOS.DataSource := DM.dsPecasReposicaoHistEquip;
    FrmTelaCadPecasReposicaoHist.Caption := 'Histórico do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadPecasReposicaoHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPecasReposicaoHist);
  End;
end;

procedure TFrmTelaPrincipal.Equipamentos2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFAMILIAEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFamEquipamentoCODIGO, DM.qryFormatoCodigoFAMILIAEQUIPAMENTO, FrmTelaCadFamiliaEquipamento) = False then exit;
    Application.CreateForm(TFrmTelaCadFamiliaEquipamento, FrmTelaCadFamiliaEquipamento);
    FrmTelaCadFamiliaEquipamento.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFamiliaEquipamento);
  End;
end;

procedure TFrmTelaPrincipal.Equipamentos4Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBFamEquipamento.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11, campo12 from familiaequipamento order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRFamEquipamento.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.EquipamentosReservas2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentoReserva, FrmTelaCadEquipamentoReserva);
    FrmTelaCadEquipamentoReserva.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentoReserva);
  End;
end;

procedure TFrmTelaPrincipal.Fabricantes1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFABRICANTES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFabricantesCODIGO, DM.qryFormatoCodigoFABRICANTE, FrmTelaCadFabricantes) = False then exit;
    Application.CreateForm(TFrmTelaCadFabricantes, FrmTelaCadFabricantes);
    FrmTelaCadFabricantes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFabricantes);
  End;
end;

procedure TFrmTelaPrincipal.Fabricantes2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBFabricantes.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from fabricante where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRfabricantes.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Familia1Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 600;
DM.FNomeConsulta := 'Família de Equipamentos';
if DM.ConsultarCombo <> '' then
  begin
    FrmTelaPrincipal.Tag := 3;
    Try
      Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
      FrmTelaConsultaPeriodo.ShowModal;
    Finally
      DM.FCodCombo := EmptyStr;
      DM.FValorCombo := EmptyStr;
      DM.FTabela_auxiliar := -1;
      FreeAndNil(FrmTelaConsultaPeriodo);
    End;
  end;
end;

procedure TFrmTelaPrincipal.Familia2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 600;
DM.FNomeConsulta := 'Família de Equipamentos';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP, `areas`.`DESCRICAO` AREA FROM `equipamentos`'
                           + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)'
                           + ' INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO` and `equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                           + ' WHERE (`equipamentos`.`CODIGO` = `equipamentos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' and `equipamentos`.`CODFAMILIAEQUIP` =  '+QuotedStr(DM.FCodCombo) + ') order by `equipamentos`.`DESCRICAO`');

    DM.qryAuxiliar.Open;
    DmRelatorios.frxREquipGeral.ShowReport();
  end;
end;

procedure TFrmTelaPrincipal.FamliadePneus2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFamPneusCODIGO, DM.qryFormatoCodigoFAMILIAPNEUS, FrmTelaCadFamiliaPneus) = False then exit;
    Application.CreateForm(TFrmTelaCadFamiliaPneus, FrmTelaCadFamiliaPneus);
    FrmTelaCadFamiliaPneus.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFamiliaPneus);
  End;
end;

procedure TFrmTelaPrincipal.Fechamento1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFECHAMANUT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaInspFechamento, FrmTelaInspFechamento);
    FrmTelaInspFechamento.ShowModal;
  Finally
    FreeAndNil(FrmTelaInspFechamento);
  End;
end;

procedure TFrmTelaPrincipal.Fechamento2Click(Sender: TObject);
var
  LCampo : String;
begin
  if (DM.qryUsuarioPAcessoCADORDEMSERVICOFECHAR.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

  LCampo :=DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
  try
    StrToInt(LCampo);
  except
    on E: Exception do
    begin
      MessageDlg('Ocorreu um erro ao buscar a Ordem de Serviço, informe apenas valores numéricos.' + #13 +
                 'Caso o erro se repita, favor entrar em contato com o administrador do sistema.' + #13 +
                 'Mensagem de erro: ' + E.Message, mtError, [mbOK], 0);
      Exit;
    end;
  end;

  if LCampo <> EmptyStr then
    begin
      with DM.qryOrdemServico do
        begin
          Close;
          Params[0].AsString := DM.FCodEmpresa;
          Params[1].AsString := LCampo;
          Open;
        end;
      if DM.qryOrdemServico.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
      begin
        Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.qryOrdemServicoSITUACAO.AsString <> 'LIBERADA' then
      begin
        MessageDlg('Ordem de serviço:  '+ DM.qryOrdemServicoSITUACAO.AsString +', não liberada para fechamento.', mtError, [mbOK], 0);
        Exit;
      end;
    end;

  Try
    Application.CreateForm(TFrmTelaCadOrdemServicoFechamento, FrmTelaCadOrdemServicoFechamento);
    FrmTelaCadOrdemServicoFechamento.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoFechamento);
    DM.qryOrdemServico.Close;
  End;
end;

procedure TFrmTelaPrincipal.Feriados1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFERIADOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFeriadosCODIGO, DM.qryFormatoCodigoFERIADOS, FrmTelaCadFeriados) = False then exit;
    Application.CreateForm(TFrmTelaCadFeriados, FrmTelaCadFeriados);
    FrmTelaCadFeriados.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFeriados);
  End;
end;

procedure TFrmTelaPrincipal.Feriados2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBFeriados.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao, dataferiado from feriados where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRFeriados.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Ferramentaria2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 300;
        DM.FParamAuxiliar[1] := 'NOME';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          DM.FParamAuxiliar[1] := DM.FValorCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosFerramentaria, FrmTelaCadFuncionariosFerramentaria);
    FrmTelaCadFuncionariosFerramentaria.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosFerramentaria);
  End;
end;

procedure TFrmTelaPrincipal.Ferramentaria3Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFERRAMENTARIA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFerramentariaCODIGO, DM.qryFormatoCodigoRECURSOS, FrmTelaCadRecursosFerram) = False then exit;
    Application.CreateForm(TFrmTelaCadRecursosFerram, FrmTelaCadRecursosFerram);
    FrmTelaCadRecursosFerram.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadRecursosFerram);
  End;
end;

procedure TFrmTelaPrincipal.FormatodeCdigos1Click(Sender: TObject);
begin
if (DM.qryUsuarioPAcessoCADFORMATOCODIGO.AsString = 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
  Try
    Application.CreateForm(TFrmTelaCadFormatoCodigo, FrmTelaCadFormatoCodigo);
    FrmTelaCadFormatoCodigo.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFormatoCodigo);
  End
else
  begin
    Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TFrmTelaPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    if DM.FNomeUsuario <> 'sam_spmp' then
      begin
        qryOficinas.Close;
        qryFuncionarios.Close;

        TimerOscioso.Enabled := False;
        TimerOscioso2.Enabled := False;

        DM.RetornaDataHoraServidor;

        DM.qryAcesso.Close;
        DM.qryAcesso.Params[0].AsString := DM.FNomeUsuario;
        DM.qryAcesso.Open;
        DM.qryAcesso.Edit;
        DM.qryAcessoDATASAIDA.AsDateTime  := DM.FDataHoraServidor;
        DM.qryAcessoATIVO.AsString        := 'N';
        DM.qryAcessoPERIODO.AsString      := IntToStr(MinutesBetween(DM.qryAcessoDATAACESSO.AsDateTime, DM.qryAcessoDATASAIDA.AsDateTime));
        DM.qryAcesso.Post;

        DM.qryUsuario.Edit;
        DM.qryUsuarioLOGADO.AsString       := 'N';
        DM.qryUsuarioQUEDAENERGIA.AsString := 'N';
        DM.qryUsuario.Post;
      end;
  except
    on E: Exception do begin
      DM.FDConnSPMP3.Rollback;
      Application.Terminate;
      raise;
    end;
    on E: EFDDBEngineException do
    begin
      DM.FDConnSPMP3.Rollback;
      FreeAndNil(DMAlertas);
      FreeAndNil(DmRelatorios);
      FreeAndNil(DM);
      Application.Terminate;
      raise;
    end;
  end;

  DM.qryUsuario.Close;
  DM.qryFormatoCodigo.Close;
  DM.qryUsuarioAcessos.Close;
  if DM.FFecharForms = True then
    begin
      FreeAndNil(frmSistemaOcioso);
      DM.FDConnSPMP3.Connected := False;
    end;
end;

procedure TFrmTelaPrincipal.FormCreate(Sender: TObject);
begin
ChartTipoManutencao.Series[0].Transparency := 30;
ChartSituacaoOS.Series[0].Transparency := 30;
ChartOSOficina.Series[0].Transparency := 15;
ChartSolicTrabalho.Series[0].Transparency := 20;
ChartSolicTrabalho.Series[1].Transparency := 30;

CBAno.Text := DateTimeToStr(YearOf(DM.FDataHoraServidor));
CBMes.ItemIndex := MonthOf(DM.FDataHoraServidor) - 1;

OriginalFormWidth            := Self.ClientWidth;
OriginalFormHeight           := Self.ClientHeight;
OriginalSituacaoOSWidth      := ChartSituacaoOS.Width;
OriginalSituacaoOSHeight     := ChartSituacaoOS.Height;
OriginalTipoManutencaoWidth  := ChartTipoManutencao.Width;
OriginalTipoManutencaoHeight := ChartTipoManutencao.Height;
OriginalSolicTrabalhoWidth   := ChartSolicTrabalho.Width;
OriginalSolicTrabalhoHeight  := ChartSolicTrabalho.Height;
OriginalSolicTrabalhoTop     := ChartSolicTrabalho.Top;
OriginalOSOficinaWidth       := ChartOSOficina.Width;
OriginalOSOficinaHeight      := ChartOSOficina.Height;
OriginalOSOficinaTop         := ChartSolicTrabalho.Top;

ProporcaoTopTipoManut := OriginalSolicTrabalhoTop/OriginalFormHeight;
ProporcaoTopOSOficina := OriginalOSOficinaTop/OriginalFormHeight;

memFiltros.Close; memFiltros.CreateDataSet; memFiltros.Edit;
qryOficinas.Close;
qryOficinas.Params[0].AsString := DM.FCodEmpresa;
qryOficinas.Open;

qryFuncionarios.Close;
qryFuncionarios.Params[0].AsString := DM.FCodEmpresa;
qryFuncionarios.Open;

if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador Corporativo') and  (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade')
  and (DM.qryUsuarioNIVELACESSO.AsString <> 'Controlador de Manutenção') and (DM.qryUsuarioNIVELACESSO.AsString <> 'Executante de Trabalho A')
    and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      ChartSituacaoOS.Visible := False;
      ChartTipoManutencao.Visible := False;
      ChartOSOficina.Visible := False;
      ShapeOficina.Visible := False;
      lblOficina.Visible := False;
      cbOficina.Visible := False;
      btnFiltraOficina.Visible := False;
      ShapeDisponibilidade.Visible := False;
      lblDisponibilidade.Visible := False;
      lblDisponibilidadeVal.Visible := False;
      imgDisponibilidade.Visible := False;
      ShapeMTTR.Visible := False;
      lblMTTR.Visible := False;
      lblMTTRVal.Visible := False;
      imgMTTR.Visible := False;
      ShapeMTBF.Visible := False;
      lblMTBF.Visible := False;
      lblMTBFVal.Visible := False;
      imgMTBF.Visible := False;

      if DM.FMatricula <> '' then
      begin
        if qryFuncionarios.Locate('MATRICULA', DM.FMatricula, []) = True then
        begin
          memFiltros.Edit;
          memFiltrosMATRICULA.AsString := DM.FMatricula;
          btnFiltraSolic.OnClick(Sender);
        end else
        begin
          ChartSolicTrabalho.Series[0].Clear;
          ChartSolicTrabalho.Series[1].Clear;
        end;
      end else
      begin
        ChartSolicTrabalho.Series[0].Clear;
        ChartSolicTrabalho.Series[1].Clear;
      end;
    end;

  StatusBar1.Font.Size := 9;
  StatusBar1.Panels[0].Text := DM.FNomeUsuario;
  StatusBar1.Panels[1].Text := DM.FNivelAcesso;
  StatusBar1.Panels[2].Text := DM.FNomeEmpresa;
  StatusBar1.Panels[3].Text := DM.FNomeGrupo;
  if DM.FDiasRestantes < 36500 then
    StatusBar1.Panels[4].Text :=  'Licença: '+FormatFloat('00', DM.FDiasRestantes)+' dias restantes - ' + DM.FVersaoMacro
  else
    StatusBar1.Panels[4].Text :=  'Licença: Ilimitada - ' + DM.FVersaoMacro;
  //  StatusBar1.Panels[4].Text := DM.FVersaoMacro;


  //  if DM.FDiasRestantes < 36500 then
  //    lblLicenca.Caption :=  'Licença: '+FormatFloat('00', DM.FDiasRestantes)+' dias restantes'
  //  else
  //    lblLicenca.Caption :=  'Licença: Ilimitada';

  if (DM.FNivelAcesso <> 'Administrador Corporativo') and (DM.FNivelAcesso <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      ConsultadeAcessos1.Enabled := False;
      Permissoes1.Enabled := False;
      FormatodeCdigos1.Enabled := False;
      GrupoIndustrial1.Enabled := False;
      CadastrodeUsurios1.Enabled := False;
      Auditoria1.Enabled := False;
      Opcoes1.Enabled := False;
    end;

  RotasdeManuteno1.Visible := DM.FEmpTransf;
end;

procedure TFrmTelaPrincipal.FormResize(Sender: TObject);
var
  WidthRatio, HeightRatio: Double;
begin
  if FrmTelaPrincipal <> nil then
  begin
    // Calcula a proporção de aumento do Form
    WidthRatio := Self.ClientWidth / OriginalFormWidth;
    HeightRatio := Self.ClientHeight / OriginalFormHeight;

    // Ajusta o tamanho do Panel proporcionalmente ao aumento do Form
    ChartSituacaoOS.Width := Round(OriginalSituacaoOSWidth * WidthRatio);
    ChartSituacaoOS.Height := Round(OriginalSituacaoOSHeight * HeightRatio);

    ChartTipoManutencao.Width := Round(OriginalTipoManutencaoWidth * WidthRatio);
    ChartTipoManutencao.Height := Round(OriginalTipoManutencaoHeight * HeightRatio);
   // ChartTipoManutencao.Top := ChartSituacaoOS.Height + 23;
    ChartTipoManutencao.Left := ChartSituacaoOS.Width + 22;

    ChartSolicTrabalho.Width := Round(OriginalSolicTrabalhoWidth * WidthRatio);
    ChartSolicTrabalho.Height := Round(OriginalSolicTrabalhoHeight * HeightRatio) - 10;
    if ChartSolicTrabalho.Height < 165 then ChartSolicTrabalho.Height := 165;
    ChartSolicTrabalho.Top := Round(Self.ClientHeight - ChartSolicTrabalho.Height) - 50;

    ChartOSOficina.Width := Round((OriginalOSOficinaWidth * WidthRatio)/1.65);
    if ChartOSOficina.Width < 345 then ChartOSOficina.Width := 345;
    ChartOSOficina.Height := Round(OriginalOSOficinaHeight * HeightRatio);

    ShapeEficiencia.Top := ChartSolicTrabalho.Top - 95;
    LblEficSolicTrab.Top := ChartSolicTrabalho.Top - 95;
    LblEficSolicTrabVal.Top := ChartSolicTrabalho.Top - 60;
    imgEficSolicTrab.Top := ChartSolicTrabalho.Top - 60;

    ChartOSOficina.Top := Round(Self.ClientHeight - ChartOSOficina.Height) - 48;
    ChartOSOficina.Left := (Self.ClientWidth - ChartOSOficina.Width) - 15;

//    ShapeOficina.Top := ChartOSOficina.Top - ShapeOficina.Height - 10;
//    ShapeOficina.Left := (Self.ClientWidth - ShapeOficina.Width) - 15;
//    btnFiltraOficina.Top := ChartOSOficina.Top - ShapeOficina.Height - 5;
//    lblOficina.Top := ChartOSOficina.Top - ShapeOficina.Height - 5;
//    cbOficina.Top := ChartOSOficina.Top - ShapeOficina.Height + 30;

    ShapeSolicitante.Top := ShapeEficiencia.Top - ShapeSolicitante.Height - 12;
    btnFiltraSolic.Top := ShapeEficiencia.Top - ShapeSolicitante.Height - 8;
    lblSolicitante.Top := ShapeEficiencia.Top - ShapeSolicitante.Height - 5;
    cbSolicitante.Top := ShapeEficiencia.Top - ShapeSolicitante.Height + 30;

    ShapeMTBF.Left := ShapePeriodo.Left - ShapeMTBF.Width - 7;
    lblMTBF.Left := ShapePeriodo.Left - ShapeMTBF.Width - 17;
    lblMTBFVal.Left := ShapePeriodo.Left - lblMTBFVal.Width - 17;
    imgMTBF.Left := ShapePeriodo.Left - ShapeMTBF.Width - 17;

    ShapeMTTR.Left := ShapePeriodo.Left - ShapeMTBF.Width - 7;
    lblMTTR.Left := ShapePeriodo.Left - ShapeMTBF.Width - 17;
    lblMTTRVal.Left := ShapePeriodo.Left - lblMTTRVal.Width - 17;
    imgMTTR.Left := ShapePeriodo.Left - ShapeMTBF.Width - 17;

    ShapeDisponibilidade.Left := ShapePeriodo.Left - ShapeDisponibilidade.Width - 7;
    lblDisponibilidade.Left := ShapePeriodo.Left - ShapeDisponibilidade.Width - 17;
    lblDisponibilidadeVal.Left := ShapePeriodo.Left - lblDisponibilidadeVal.Width - 17;
    imgDisponibilidade.Left := ShapePeriodo.Left - ShapeDisponibilidade.Width - 17;


    if WindowState = wsMaximized then
    begin
      vimgSPMPLogo.ImageIndex := 0;
      vimgSPMPLogo.ImageHeight := 125;
      vimgSPMPLogo.ImageWidth := 548;
    end else
    if ClientWidth >= 1185 then
    begin
      vimgSPMPLogo.ImageIndex := 1;
      vimgSPMPLogo.ImageHeight := 100;
      vimgSPMPLogo.ImageWidth := 438;
    end else
    begin
      vimgSPMPLogo.ImageIndex := 2;
      vimgSPMPLogo.ImageHeight := 85;
      vimgSPMPLogo.ImageWidth := 372;
    end;
  end;
end;

procedure TFrmTelaPrincipal.FormShow(Sender: TObject);
begin
  DM.FFecharForms := False;
  TimerOscioso.Interval := DM.FMinutosInativo * 60000;
  DM.FSegundosDesliga := DM.FMinutosInativo * 60;
  LblTempoDesliga.Caption := 'O sistema será encerrado em ' + DM.SecondToTime(TimerOscioso.Interval);

  Application.OnMessage := AppMessage;
  Application.OnIdle := AppIdle;
end;

procedure TFrmTelaPrincipal.Fornecedores1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFORNECEDORES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFornecedoresCODIGO, DM.qryFormatoCodigoFORNECEDOR, FrmTelaCadFornecedores) = False then exit;
    Application.CreateForm(TFrmTelaCadFornecedores, FrmTelaCadFornecedores);
    FrmTelaCadFornecedores.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFornecedores);
  End;
end;

procedure TFrmTelaPrincipal.Fornecedores2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBFornecedores.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from fornecedor where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');DM.qryAuxiliar.Open;
DM.qryAuxiliar.Open;
DmRelatorios.frxRFornecedores.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Gerenciamento1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoGerencia, FrmTelaCadOrdemServicoGerencia);
    FrmTelaCadOrdemServicoGerencia.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoGerencia);
  End;
end;

procedure TFrmTelaPrincipal.GrupoIndustrial1Click(Sender: TObject);
begin
if (DM.qryUsuarioPAcessoCADGRUPOINDUSTRIAL.AsString = 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
  Try
    if DM.AplicarMascara(DM.qryUnidadesCODIGO, DM.qryFormatoCodigoEMPRESA, FrmTelaCadGrupoIndustrial) = False then exit;
    if DM.AplicarMascara(DM.qryAdmCorpCODIGO, DM.qryFormatoCodigoUSUARIO, FrmTelaCadGrupoIndustrial) = False then exit;
    if DM.AplicarMascara(DM.qryAdmUnidCODIGO, DM.qryFormatoCodigoUSUARIO, FrmTelaCadGrupoIndustrial) = False then exit;
    Application.CreateForm(TFrmTelaCadGrupoIndustrial, FrmTelaCadGrupoIndustrial);
    FrmTelaCadGrupoIndustrial.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadGrupoIndustrial);
  End
else
  begin
    Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
end;

procedure TFrmTelaPrincipal.Historico1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFECHAMANUT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaInspFechamentoHist, FrmTelaInspFechamentoHist);
    //FrmTelaInspFechamentoHist.Caption := DM.FValorCombo;
    FrmTelaInspFechamentoHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaInspFechamentoHist);
  End;
end;

procedure TFrmTelaPrincipal.Histrico1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
//    if DM.FParamAuxiliar[0] = EmptyStr then
//      begin
//        DM.FTabela_auxiliar := 300;
//        DM.FParamAuxiliar[1] := 'NOME';
//        Try
//          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
//          FrmTelaAuxiliar.ShowModal;
//        Finally
//          DM.FParamAuxiliar[0] := DM.FCodCombo;
//          FreeAndNil(FrmTelaAuxiliar);
//        End;
//        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
//      end;
    Application.CreateForm(TFrmTelaCadFuncionariosHist, FrmTelaCadFuncionariosHist);
    FrmTelaCadFuncionariosHist.Caption := 'Histórico de: '+ DM.FValorCombo;
    FrmTelaCadFuncionariosHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosHist);
  End;
end;

procedure TFrmTelaPrincipal.Histrico5Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROGEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryManutProgEquipCODIGO, DM.qryFormatoCodigoMANUTPROGEQUIPAMENTO, FrmTelaCadManutProgEquip) = False then exit;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    with DM.dsEquipamentoS.DataSet as TFDQuery do
      begin
        Close;
        Params[0].AsString := DM.FCodCombo;
        Params[1].AsString := DM.FCodEmpresa;
        Open;
        Edit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosHist, FrmTelaCadEquipamentosHist);
    FrmTelaCadEquipamentosHist.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadEquipamentosHist);
  End;
end;

procedure TFrmTelaPrincipal.Imagens1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBImagens.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `imagens`.`CODIGO`, `imagens`.`DESCRICAO`, `equipamentos`.`DESCRICAO`EQUIPAMENTO, `imagens`.`DESCSECUNDARIO`PONTO, `imagens`.`FOTO` FROM `imagens` LEFT JOIN `equipamentos`'
                       +  ' ON (`imagens`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) AND (`equipamentos`.`CODIGO` = `imagens`.`CODEQUIPAMENTO`) WHERE (`imagens`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `imagens`.descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRImagens.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Imagens2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADIMANGENS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadImagens, FrmTelaCadImagens);
    FrmTelaCadImagens.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadImagens);
  End;
end;

procedure TFrmTelaPrincipal.IndicadoresdeDesempenho2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADINDDESEMPENHO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadIndDesempenho, FrmTelaCadIndDesempenho);
    FrmTelaCadIndDesempenho.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadIndDesempenho);
  End;
end;

procedure TFrmTelaPrincipal.InformaesGerenciaisCorporativas2Click(
  Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADRELATORIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaInfGerenciais, FrmTelaInfGerenciais);
    FrmTelaInfGerenciais.ShowModal;
  Finally
    FreeAndNil(FrmTelaInfGerenciais);
  End;
end;

procedure TFrmTelaPrincipal.Inventario1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 300;
        DM.FParamAuxiliar[1] := 'NOME';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosCxaFerramInv, FrmTelaCadFuncionariosCxaFerramInv);
    FrmTelaCadFuncionariosCxaFerramInv.Caption := 'Caixa de Ferramentas de: '+ DM.FValorCombo;
    FrmTelaCadFuncionariosCxaFerramInv.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosCxaFerramInv);
  End;
end;

procedure TFrmTelaPrincipal.ipodeManuteno1Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 100;
DM.FNomeConsulta := 'Tipos de Manutenção';
if DM.ConsultarCombo <> '' then
  begin
    FrmTelaPrincipal.Tag := 1;
    Try
      Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
      FrmTelaConsultaPeriodo.ShowModal;
    Finally
      DM.FCodCombo := EmptyStr;
      DM.FValorCombo := EmptyStr;
      DM.FTabela_auxiliar := -1;
      FreeAndNil(FrmTelaConsultaPeriodo);
    End;
  end;
end;

procedure TFrmTelaPrincipal.iposdeManuteno1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTENCAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryTipoManutencaoCODIGO, DM.qryFormatoCodigoTIPOMANUTENCAO, FrmTelaCadTipoManutencao) = False then exit;
    Application.CreateForm(TFrmTelaCadTipoManutencao, FrmTelaCadTipoManutencao);
    FrmTelaCadTipoManutencao.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadTipoManutencao);
  End;
end;

procedure TFrmTelaPrincipal.iposdeManuteno2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBTipoManutencao.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipomanutencao from tipomanutencao order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRTipoManutencao.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.iposdeProgramao1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADTIPOPROGRAMACAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryTipoProgramacaoCODIGO, DM.qryFormatoCodigoTIPOPROGRAMACAO, FrmTelaCadTipoProgramacao) = False then exit;
    Application.CreateForm(TFrmTelaCadTipoProgramacao, FrmTelaCadTipoProgramacao);
    FrmTelaCadTipoProgramacao.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadTipoProgramacao);
  End;
end;

procedure TFrmTelaPrincipal.iposdeProgramao2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBTipoProgramacao.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipo from tipoprogramacao order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRTipoProgramacao.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.KitdePeasdeReposio2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPECASREPKIT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryPecaReposicaoKitCODIGO, DM.qryFormatoCodigoPECASREPOSICAOKIT, FrmTelaCadPecasReposicaoKit) = False then exit;
    Application.CreateForm(TFrmTelaCadPecasReposicaoKit, FrmTelaCadPecasReposicaoKit);
    FrmTelaCadPecasReposicaoKit.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPecasReposicaoKit);
  End;
end;

procedure TFrmTelaPrincipal.KitdeRecursos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADRECURSOSKIT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryRecursoKitCODIGO, DM.qryFormatoCodigoRECURSOSKIT, FrmTelaCadRecursosKit) = False then exit;
    Application.CreateForm(TFrmTelaCadRecursosKit, FrmTelaCadRecursosKit);
    FrmTelaCadRecursosKit.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadRecursosKit);
  End;
end;

procedure TFrmTelaPrincipal.ListaCompleta1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBManutFamEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `manutprogfamequipamento`.`CODIGO`, `manutprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2'
                       + ' FROM `manutprogfamequipamento` INNER JOIN `familiaequipamento` ON (`manutprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) LEFT JOIN `tipoprogramacao` ON (`manutprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                       + ' WHERE (`manutprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `manutprogfamequipamento`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRManutFamEquipGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.ListaCompleta2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBManutEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `manutprogequipamento`.`CODIGO`, `manutprogequipamento`.`CODEMPRESA`, `manutprogequipamento`.`CODEQUIPAMENTO`, `manutprogequipamento`.`CODMANUTPROGFAMEQUIP`'
                       + ', `manutprogequipamento`.`DESCRICAO`, `manutprogequipamento`.`FREQUENCIA1`, `manutprogequipamento`.`DTAINICIO1`, `manutprogequipamento`.`FREQUENCIA2`'
                       + ', `manutprogequipamento`.`REPROGRAMAR2`, `manutprogfamequipamento`.`DESCRICAO` AS `DESCMANUTPROGFAMEQUIP`, `manutprogfamequipamento`.`CODIGO` AS `CODMANUTPROGFAMEQUIP`'
                       + ', `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`'
                       + ' FROM `manutprogequipamento`'
                       + ' INNER JOIN `manutprogfamequipamento` ON (`manutprogequipamento`.`CODMANUTPROGFAMEQUIP` = `manutprogfamequipamento`.`CODIGO`)'
                       + ' INNER JOIN `equipamentos` ON (`manutprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                       + ' INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                       + ' WHERE (`manutprogequipamento`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ')'
                       + ' ORDER BY `equipamentos`.`DESCRICAO`');
//                       + ' ORDER BY `equipamentos`.`DESCRICAO`, `areas`.`DESCRICAO`');

DM.qryAuxiliar.Open;
DmRelatorios.frxRManutEquipGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.ListaCompleta3Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBLubrificEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                       + ', `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                       + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogfamequipamento`.`DESCRICAO` AS `DESCLUBRIFICPROGFAMEQUIP`, `lubrificprogfamequipamento`.`CODIGO` AS `CODLUBRIFICPROGFAMEQUIP`'
                       + ', `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`'
                       + ' FROM `lubrificprogequipamento`'
                       + ' INNER JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`)'
                       + ' INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                       + ' INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                       + ' WHERE (`lubrificprogequipamento`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ')'
                       + ' ORDER BY `equipamentos`.`DESCRICAO`');
//                       + ' ORDER BY `equipamentos`.`DESCRICAO`, `areas`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRLubrificEquipGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.ListaCompleta4Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBLubrificFamEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogfamequipamento`.`CODIGO`, `lubrificprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2'
                       +  ' FROM `lubrificprogfamequipamento` INNER JOIN `familiaequipamento` ON (`lubrificprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2`'
                       +  '  = `tipoprogramacao`.`CODIGO`) WHERE (`lubrificprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `lubrificprogfamequipamento`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRLubrificFamEquipGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.Literatura1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
    DM.FParamAuxiliar[1] := 'LITERATURA';
    FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Literatura';
    FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
  End;
end;

procedure TFrmTelaPrincipal.LiteraturasTcnicas1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosArqTec, FrmTelaCadEquipamentosArqTec);
    FrmTelaCadEquipamentosArqTec.Caption := 'Literaturas Técnicas do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadEquipamentosArqTec.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadEquipamentosArqTec);
  End;
end;

procedure TFrmTelaPrincipal.LocalizarFuncionrio2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoLocalizaMObra, FrmTelaCadOrdemServicoLocalizaMObra);
    FrmTelaCadOrdemServicoLocalizaMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoLocalizaMObra);
  End;
end;

procedure TFrmTelaPrincipal.Lubrificantes1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADLUBRIFICANTES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryLubrificantesCODIGO, DM.qryFormatoCodigoLUBRIFICANTES, FrmTelaCadLubrificantes) = False then exit;
    Application.CreateForm(TFrmTelaCadLubrificantes, FrmTelaCadLubrificantes);
    FrmTelaCadLubrificantes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadLubrificantes);
  End;
end;

procedure TFrmTelaPrincipal.Lubrificantes2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBLubrificantesGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from lubrificantes where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRLubrificantesGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.LubrificaoProgramada2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADLUBRIFICPROGEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryLubrificProgEquipCODIGO, DM.qryFormatoCodigoLUBRIFICPROGEQUIPAMENTO, FrmTelaCadLubrificProgEquip) = False then exit;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadLubrificProgEquip, FrmTelaCadLubrificProgEquip);
    FrmTelaCadLubrificProgEquip.Caption := 'Lubrificação Programada do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadLubrificProgEquip.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadLubrificProgEquip);
  End;
end;

procedure TFrmTelaPrincipal.ManutenoProgramada2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROGEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryManutProgEquipCODIGO, DM.qryFormatoCodigoMANUTPROGEQUIPAMENTO, FrmTelaCadManutProgEquip) = False then exit;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadManutProgEquip, FrmTelaCadManutProgEquip);
    FrmTelaCadManutProgEquip.Caption := 'Manutenção Programada do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadManutProgEquip.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadManutProgEquip);
  End;
end;

procedure TFrmTelaPrincipal.MenudeParmetros1Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaMenuParametros, FrmTelaMenuParametros);
    FrmTelaMenuParametros.ShowModal;
  Finally
    FreeAndNil(FrmTelaMenuParametros);
  End;
end;

procedure TFrmTelaPrincipal.ModeObra2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBFuncionariosGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO` FROM funcionarios INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `funcionarios`.nome');
DM.qryAuxiliar.Open;
DmRelatorios.frxRFuncionariosGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.ModeObraEspecializada1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMAODEOBRAESP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosEsp, FrmTelaCadEquipamentosEsp);
    FrmTelaCadEquipamentosEsp.Caption := 'Especialistas do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadEquipamentosEsp.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadEquipamentosEsp);
  End;
end;

procedure TFrmTelaPrincipal.MonitoramentodeCondiesOperacionais1Click(
  Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadMonitoramento, FrmTelaCadMonitoramento);
    FrmTelaCadMonitoramento.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadMonitoramento);
  End;
end;

procedure TFrmTelaPrincipal.MontagemdeVeculos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadPneusChassi, FrmTelaCadPneusChassi);
    FrmTelaCadPneusChassi.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPneusChassi);
  End;
end;

procedure TFrmTelaPrincipal.MotivodeParada1Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 110;
DM.FNomeConsulta := 'Motivos de Paradas';
if DM.ConsultarCombo <> '' then
  begin
    FrmTelaPrincipal.Tag := 1;
    Try
      Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
      FrmTelaConsultaPeriodo.ShowModal;
    Finally
      DM.FCodCombo := EmptyStr;
      DM.FValorCombo := EmptyStr;
      DM.FTabela_auxiliar := -1;
      FreeAndNil(FrmTelaConsultaPeriodo);
    End;
  end;
end;

procedure TFrmTelaPrincipal.MotivosdeParadas1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBMotivoParada.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from motivoparada order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRMotivoParada.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.MotivosdeParadas2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMOTIVOPARADA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryMotivoParadaCODIGO, DM.qryFormatoCodigoMOTIVOPARADA, FrmTelaCadMotivoParada) = False then exit;
    Application.CreateForm(TFrmTelaCadMotivoParada, FrmTelaCadMotivoParada);
    FrmTelaCadMotivoParada.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadMotivoParada);
  End;
end;

procedure TFrmTelaPrincipal.MTBF1Click(Sender: TObject);
begin
  FrmTelaPrincipal.Tag := 4;
  Try
    Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
    FrmTelaConsultaPeriodo.ShowModal;
  Finally
    DM.FCodCombo := EmptyStr;
    DM.FValorCombo := EmptyStr;
    DM.FTabela_auxiliar := -1;
    FreeAndNil(FrmTelaConsultaPeriodo);
  End;
end;

procedure TFrmTelaPrincipal.MTTR1Click(Sender: TObject);
begin
  FrmTelaPrincipal.Tag := 5;
  Try
    Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
    FrmTelaConsultaPeriodo.ShowModal;
  Finally
    DM.FCodCombo := EmptyStr;
    DM.FValorCombo := EmptyStr;
    DM.FTabela_auxiliar := -1;
    FreeAndNil(FrmTelaConsultaPeriodo);
  End;
end;

procedure TFrmTelaPrincipal.NaoProgramadas1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

  DmRelatorios.frxDBManutProgEquipGeral.DataSet := DM.qryAuxiliar;
  DM.qryAuxiliar.Close;
  DM.qryAuxiliar.SQL.Clear;
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
                         + ' WHERE (`manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + '  AND `manutprogequipamento`.`DTAINICIO1` IS NULL) ORDER BY `manutprogequipamento`.`DESCRICAO`');
  DM.qryAuxiliar.Open;
  DmRelatorios.frxRManutProgEquipGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.NaoProgramadas2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

  DmRelatorios.frxDBLubrificProgEquipGeral.DataSet := DM.qryAuxiliar;
  DM.qryAuxiliar.Close;
  DM.qryAuxiliar.SQL.Clear;
  DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                         + ', `lubrificprogequipamento`.`CODMONITORAMENTO`, `lubrificprogequipamento`.`MATRICULA`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`CRITICIDADE`'
                         + ', `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`REPROGRAMAR1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                         + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogequipamento`.`LEITURA`, `lubrificprogequipamento`.`RELATORIO`, `lubrificprogequipamento`.`GRUPOINSP`'
                         + ', `lubrificprogequipamento`.`DATACADASTRO`, `lubrificprogequipamento`.`CODUSUARIOCAD`, `lubrificprogequipamento`.`DATAULTALT`, `lubrificprogequipamento`.`CODUSUARIOALT`'
                         + ', `lubrificprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP'
                         + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                         + ', DATE_ADD(`lubrificprogequipamento`.`DTAINICIO1`, INTERVAL `lubrificprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP, `equipamentos`.`CODLOCALIZACAO` As CODAREA, `areas`.`DESCRICAO` AS DESCAREA'
                         + ' FROM `lubrificprogequipamento`'
                         + ' LEFT JOIN `usuario` ON (`lubrificprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                         + ' LEFT JOIN `usuario` AS `usuario_1` ON (`lubrificprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                         + ' LEFT JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `lubrificprogfamequipamento`.`CODEMPRESA`)'
                         + ' LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                         + ' INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                         + ' INNER JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                         + ' LEFT JOIN `funcionarios` ON (`lubrificprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                         + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                         + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                         + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                         + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                         + ' WHERE (`lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `lubrificprogequipamento`.`DTAINICIO1` IS NULL ) ORDER BY `lubrificprogequipamento`.`DESCRICAO`');
  DM.qryAuxiliar.Open;
  DmRelatorios.frxRLubrificProgEquipGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.NavegaoGrfica1Click(Sender: TObject);
begin
  Try
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadNavegacaoGrafica, FrmTelaCadNavegacaoGrafica);
    FrmTelaCadNavegacaoGrafica.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadNavegacaoGrafica);
  End;
end;

procedure TFrmTelaPrincipal.odas2Click(Sender: TObject);
begin
  FrmTelaPrincipal.Tag := 1;
  Try
    Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
    FrmTelaConsultaPeriodo.ShowModal;
  Finally
    FreeAndNil(FrmTelaConsultaPeriodo);
  End;
end;

procedure TFrmTelaPrincipal.odas4Click(Sender: TObject);
begin
  FrmTelaPrincipal.Tag := 3;
  Try
    Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
    FrmTelaConsultaPeriodo.ShowModal;
  Finally
    FreeAndNil(FrmTelaConsultaPeriodo);
  End;
end;

procedure TFrmTelaPrincipal.odos1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP, `areas`.`DESCRICAO` AREA FROM `equipamentos`'
                           + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`)'
                           + ' INNER JOIN `areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO` and `equipamentos`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                           + ' WHERE (`equipamentos`.`CODIGO` = `equipamentos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `equipamentos`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxREquipGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.Oficina1Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 200;
DM.FNomeConsulta := 'Oficinas';
if DM.ConsultarCombo <> '' then
  begin
    FrmTelaPrincipal.Tag := 1;
    Try
      Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
      FrmTelaConsultaPeriodo.ShowModal;
    Finally
      DM.FCodCombo := EmptyStr;
      DM.FValorCombo := EmptyStr;
      DM.FTabela_auxiliar := -1;
      FreeAndNil(FrmTelaConsultaPeriodo);
    End;
  end;
end;

procedure TFrmTelaPrincipal.Oficinas1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBOficina.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `oficinas`.`CODIGO`, `oficinas`.`DESCRICAO`, `centrocusto`.`DESCRICAO`CENTROCUSTO FROM `oficinas` INNER JOIN `centrocusto`'
                       +  ' ON (`oficinas`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `oficinas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxROficina.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Oficinas2Click(Sender: TObject);
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

procedure TFrmTelaPrincipal.Opcoes1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPERMISSOES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaOpcoes, FrmTelaOpcoes);
    FrmTelaOpcoes.ShowModal;
  Finally
    FreeAndNil(FrmTelaOpcoes);
  End;
end;

procedure TFrmTelaPrincipal.PAlertasDblClick(Sender: TObject);
begin
//LblAlertas.Left := PAlertas.Width;
//if TimerLetreiro.Enabled = True then
//  begin
//    TimerLetreiro.Enabled := False;
//    TimerAlertas.Enabled  := False;
//  end
//else
//  begin
//    TimerLetreiro.Enabled := True;
//    TimerAlertas.Enabled  := True;
//    DM.ConsultarAlertas;
//  end;
end;

procedure TFrmTelaPrincipal.PeasdeReposio1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBFamPecasRep.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11, campo12 from familiapecasreposicao order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRFamPecasRep.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.PeasdeReposio2Click(Sender: TObject);
begin
DmRelatorios.frxDBPecasRepGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `pecasreposicao`.`CODIGO`, `pecasreposicao`.`DESCRICAO`, `pecasreposicao`.`REFERENCIA`, `familiapecasreposicao`.`DESCRICAO` AS `FAMILIAPECA`, `pecasreposicao`.`QUANTIDADE` FROM `pecasreposicao` INNER JOIN `familiapecasreposicao`'
                       + ' ON (`pecasreposicao`.`CODFAMILIAPECAREP` = `familiapecasreposicao`.`CODIGO`) WHERE (`pecasreposicao`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `pecasreposicao`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRPecasRepGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.PeasdeReposio3Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFAMILIAPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFamPecasRepCODIGO, DM.qryFormatoCodigoFAMILIAPECASREPOSICAO, FrmTelaCadFamiliaPecasRep) = False then exit;
    Application.CreateForm(TFrmTelaCadFamiliaPecasRep, FrmTelaCadFamiliaPecasRep);
    FrmTelaCadFamiliaPecasRep.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFamiliaPecasRep);
  End;
end;

procedure TFrmTelaPrincipal.PecadeReposicao1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        DM.FTabela_auxiliar  := 360;
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    DM.qryPecasReposicaoHistPecas.Close;
    DM.qryPecasReposicaoHistPecas.Params[0].AsString := DM.FCodEmpresa;
    DM.qryPecasReposicaoHistPecas.Params[1].AsString := DM.FParamAuxiliar[0];
    DM.qryPecasReposicaoHistPecas.Open;
    Application.CreateForm(TFrmTelaCadPecasReposicaoHist, FrmTelaCadPecasReposicaoHist);
    FrmTelaCadPecasReposicaoHist.GrdOS.DataSource := DM.dsPecasReposicaoHistPecas;
    FrmTelaCadPecasReposicaoHist.Caption := 'Histórico da Peça: '+ DM.FValorCombo;
    FrmTelaCadPecasReposicaoHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPecasReposicaoHist);
  End;
end;

procedure TFrmTelaPrincipal.PecasdeReposio1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPECASREPOSICAOEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.Width := 585;
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosPecas, FrmTelaCadEquipamentosPecas);
    FrmTelaCadEquipamentosPecas.Caption := 'Peças do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadEquipamentosPecas.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadEquipamentosPecas);
  End;
end;

procedure TFrmTelaPrincipal.Pedidos1Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaImpPedidos, FrmTelaImpPedidos);
    FrmTelaImpPedidos.ShowModal;
  Finally
    FreeAndNil(FrmTelaImpPedidos);
  End;
end;

procedure TFrmTelaPrincipal.Permissoes1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPERMISSOES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaPermissoes, FrmTelaPermissoes);
    FrmTelaPermissoes.ShowModal;
  Finally
    FreeAndNil(FrmTelaPermissoes);
  End;
end;

procedure TFrmTelaPrincipal.PlanodeTrabalho1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPLANOTRAB.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryPlanoTrabalhoCODIGO, DM.qryFormatoCodigoPLANOTRABALHO, FrmTelaCadPlanoTrabalho) = False then exit;
    Application.CreateForm(TFrmTelaCadPlanoTrabalho, FrmTelaCadPlanoTrabalho);
    FrmTelaCadPlanoTrabalho.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPlanoTrabalho);
  End;
end;

procedure TFrmTelaPrincipal.Pneus1Click(Sender: TObject);
begin
Try
  Application.CreateForm(TFrmTelaCadPneusChassiRelat, FrmTelaCadPneusChassiRelat);
  FrmTelaCadPneusChassiRelat.ShowModal;
Finally
  FreeAndNil(FrmTelaCadPneusChassiRelat);
End;
end;

procedure TFrmTelaPrincipal.PontosdeInspecao1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryPontosInspecaoCODIGO, DM.qryFormatoCodigoPONTOSINSPECAO, FrmTelaCadPontoInspecao) = False then exit;
    Application.CreateForm(TFrmTelaCadPontoInspecao, FrmTelaCadPontoInspecao);
    FrmTelaCadPontoInspecao.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPontoInspecao);
  End;
end;

procedure TFrmTelaPrincipal.PontosdeInspeo2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 250;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadEquipamentosPontosInsp, FrmTelaCadEquipamentosPontosInsp);
    FrmTelaCadEquipamentosPontosInsp.Caption := 'Pontos de Inspeção do Equipamento: '+ DM.FValorCombo;
    FrmTelaCadEquipamentosPontosInsp.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadEquipamentosPontosInsp);
  End;
end;

procedure TFrmTelaPrincipal.PorEquipamento1Click(Sender: TObject);
begin
if (DM.qryUsuarioPAcessoCADPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.FParamAuxiliar[0] = EmptyStr then
  begin
    DM.FTabela_auxiliar  := 250;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.FParamAuxiliar[0] := DM.FCodCombo;
      FreeAndNil(FrmTelaAuxiliar);
    End;
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;
  end;
DM.qryPecasReposicaoInstEquip.Close;
DM.qryPecasReposicaoInstEquip.Params[0].AsString := DM.FParamAuxiliar[0];
DM.qryPecasReposicaoInstEquip.Params[1].AsString := DM.FCodEmpresa;
DM.qryPecasReposicaoInstEquip.Open;
if DM.qryPecasReposicaoInstEquip.IsEmpty = False then
  begin
    DmRelatorios.frxDBPecasRepInstEquip.DataSource := DM.dsPecasReposicaoInstEquip;
    DmRelatorios.frxRPecasRepInstEquip.ShowReport();
  end;
DM.qryPecasReposicaoInstEquip.Close;
DM.FParamAuxiliar[0] := EmptyStr;
DM.FParamAuxiliar[1] := EmptyStr;
end;

procedure TFrmTelaPrincipal.PorEquipamento2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 250;
DM.FNomeConsulta := 'Equipamentos';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBManutProgEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
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
                           + ' WHERE (`manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`CODIGO` = '+QuotedStr(DM.FCodCombo) + ') ORDER BY `manutprogequipamento`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxRManutProgEquipGeral.ShowReport();
  end;
end;

procedure TFrmTelaPrincipal.PorEquipamento3Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 250;
DM.FNomeConsulta := 'Equipamentos';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBLubrificProgEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                           + ', `lubrificprogequipamento`.`CODMONITORAMENTO`, `lubrificprogequipamento`.`MATRICULA`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`CRITICIDADE`'
                           + ', `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`REPROGRAMAR1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                           + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogequipamento`.`LEITURA`, `lubrificprogequipamento`.`RELATORIO`, `lubrificprogequipamento`.`GRUPOINSP`'
                           + ', `lubrificprogequipamento`.`DATACADASTRO`, `lubrificprogequipamento`.`CODUSUARIOCAD`, `lubrificprogequipamento`.`DATAULTALT`, `lubrificprogequipamento`.`CODUSUARIOALT`'
                           + ', `lubrificprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP'
                           + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                           + ', DATE_ADD(`lubrificprogequipamento`.`DTAINICIO1`, INTERVAL `lubrificprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP, `equipamentos`.`CODLOCALIZACAO` As CODAREA, `areas`.`DESCRICAO` AS DESCAREA'
                           + ' FROM `lubrificprogequipamento`'
                           + ' LEFT JOIN `usuario` ON (`lubrificprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                           + ' LEFT JOIN `usuario` AS `usuario_1` ON (`lubrificprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                           + ' LEFT JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `lubrificprogfamequipamento`.`CODEMPRESA`)'
                           + ' LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                           + ' INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                           + ' INNER JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                           + ' LEFT JOIN `funcionarios` ON (`lubrificprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                           + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                           + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                           + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                           + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                           + ' WHERE (`lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`CODIGO` = '+QuotedStr(DM.FCodCombo) + ') ORDER BY `lubrificprogequipamento`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxRLubrificProgEquipGeral.ShowReport();
  end;
end;

procedure TFrmTelaPrincipal.PorFamilia1Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 600;
DM.FNomeConsulta := 'Família de Equipamentos';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBManutProgEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
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
                           + ' WHERE (`manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`CODFAMILIAEQUIP` = '+QuotedStr(DM.FCodCombo) + ') ORDER BY `manutprogequipamento`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxRManutProgEquipGeral.ShowReport();
  end;
end;

procedure TFrmTelaPrincipal.PorFamilia2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 600;
DM.FNomeConsulta := 'Família de Equipamentos';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBLubrificProgEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                           + ', `lubrificprogequipamento`.`CODMONITORAMENTO`, `lubrificprogequipamento`.`MATRICULA`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`CRITICIDADE`'
                           + ', `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`REPROGRAMAR1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                           + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogequipamento`.`LEITURA`, `lubrificprogequipamento`.`RELATORIO`, `lubrificprogequipamento`.`GRUPOINSP`'
                           + ', `lubrificprogequipamento`.`DATACADASTRO`, `lubrificprogequipamento`.`CODUSUARIOCAD`, `lubrificprogequipamento`.`DATAULTALT`, `lubrificprogequipamento`.`CODUSUARIOALT`'
                           + ', `lubrificprogequipamento`.`OBSERVACOES`, `usuario`.`NOME` USUARIOCAD, `usuario_1`.`NOME`USUARIOALT, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP'
                           + ', `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO2`, `equipamentos`.`DESCRICAO` EQUIPAMENTO, `funcionarios`.`NOME` RESPONSAVEL, `rotasequipamento`.`DESCRICAO` AS `ROTA`'
                           + ', DATE_ADD(`lubrificprogequipamento`.`DTAINICIO1`, INTERVAL `lubrificprogequipamento`.`FREQUENCIA1` DAY) C_PROXINSP, `equipamentos`.`CODLOCALIZACAO` As CODAREA, `areas`.`DESCRICAO` AS DESCAREA'
                           + ' FROM `lubrificprogequipamento`'
                           + ' LEFT JOIN `usuario` ON (`lubrificprogequipamento`.`CODUSUARIOCAD` = `usuario`.`CODIGO`)'
                           + ' LEFT JOIN `usuario` AS `usuario_1` ON (`lubrificprogequipamento`.`CODUSUARIOALT` = `usuario_1`.`CODIGO`)'
                           + ' LEFT JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `lubrificprogfamequipamento`.`CODEMPRESA`)'
                           + ' LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                           + ' INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                           + ' INNER JOIN `areas` ON (`areas`.`CODIGO` = `equipamentos`.`CODLOCALIZACAO`) AND (`areas`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                           + ' LEFT JOIN `funcionarios` ON (`lubrificprogequipamento`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                           + ' LEFT JOIN `rotasequipamentoseq` ON (`equipamentos`.`CODEMPRESA` = `rotasequipamentoseq`.`CODEMPRESA`) AND (`equipamentos`.`CODLOCALIZACAO` = `rotasequipamentoseq`.`CODAREA`)'
                           + ' AND (`equipamentos`.`CODCELULA` = `rotasequipamentoseq`.`CODCELULA`) AND (`equipamentos`.`CODLINHA` = `rotasequipamentoseq`.`CODLINHA`)'
                           + ' AND (`equipamentos`.`SEQUENCIA` = `rotasequipamentoseq`.`SEQUENCIA`)'
                           + ' LEFT JOIN `rotasequipamento` ON (`rotasequipamentoseq`.`CODROTA` = `rotasequipamento`.`CODIGO`) AND (`rotasequipamentoseq`.`CODEMPRESA` = `rotasequipamento`.`CODEMPRESA`)'
                           + ' WHERE (`lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' AND `equipamentos`.`CODFAMILIAEQUIP` = '+QuotedStr(DM.FCodCombo) + ') ORDER BY `lubrificprogequipamento`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxRLubrificProgEquipGeral.ShowReport();
  end;
end;

procedure TFrmTelaPrincipal.PorPeca1Click(Sender: TObject);
begin
if (DM.qryUsuarioPAcessoCADPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.FParamAuxiliar[0] = EmptyStr then
  begin
    DM.FTabela_auxiliar  := 360;
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.FParamAuxiliar[0] := DM.FCodCombo;
      FreeAndNil(FrmTelaAuxiliar);
    End;
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;
  end;
DM.qryPecasReposicaoInstPecas.Close;
DM.qryPecasReposicaoInstPecas.Params[0].AsString := DM.FParamAuxiliar[0];
DM.qryPecasReposicaoInstPecas.Params[1].AsString := DM.FCodEmpresa;
DM.qryPecasReposicaoInstPecas.Open;
if DM.qryPecasReposicaoInstPecas.IsEmpty = False then
  begin
    DmRelatorios.frxRPecasRepInstPeca.ShowReport();
  end;
DM.qryPecasReposicaoInstPecas.Close;
DM.FParamAuxiliar[0] := EmptyStr;
DM.FParamAuxiliar[1] := EmptyStr;
end;

procedure TFrmTelaPrincipal.Producao1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADINFMENSAIS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadInfMensalProducaoMensal, FrmTelaCadInfMensalProducaoMensal);
    FrmTelaCadInfMensalProducaoMensal.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadInfMensalProducaoMensal);
  End;
end;

procedure TFrmTelaPrincipal.Projeto1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
    DM.FParamAuxiliar[1] := 'PROJETO';
    FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Projeto';
    FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
  End;
end;

procedure TFrmTelaPrincipal.Viagens1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.FParamAuxiliar[0] = EmptyStr then
      begin
        DM.FTabela_auxiliar := 780;
        DM.FParamAuxiliar[1] := 'DESCRICAO';
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.FParamAuxiliar[0] := DM.FCodCombo;
          FreeAndNil(FrmTelaAuxiliar);
        End;
        if DM.FParamAuxiliar[0] = EmptyStr then Exit;
      end;
    Application.CreateForm(TFrmTelaCadAbastecimentosViagens, FrmTelaCadAbastecimentosViagens);
    FrmTelaCadAbastecimentosViagens.Position := poScreenCenter;
    FrmTelaCadAbastecimentosViagens.ShowModal;
  Finally
    DM.FParamAuxiliar[0] := EmptyStr;
    FreeAndNil(FrmTelaCadAbastecimentosViagens);
  End;
end;

procedure TFrmTelaPrincipal.rea2Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';
if DM.ConsultarCombo <> '' then
  begin
    FrmTelaPrincipal.Tag := 3;
    Try
      Application.CreateForm(TFrmTelaConsultaPeriodo, FrmTelaConsultaPeriodo);
      FrmTelaConsultaPeriodo.ShowModal;
    Finally
      DM.FCodCombo := EmptyStr;
      DM.FValorCombo := EmptyStr;
      DM.FTabela_auxiliar := -1;
      FreeAndNil(FrmTelaConsultaPeriodo);
    End;
  end;
end;

procedure TFrmTelaPrincipal.reas1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADAREAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryAreasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
    if DM.AplicarMascara(DM.qryCelulasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
    if DM.AplicarMascara(DM.qryLinhasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
    Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
    FrmTelaCadAreas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAreas);
  End;
end;

procedure TFrmTelaPrincipal.reas2Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBAreas.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`, `celulas`.`CODIGO` AS `CODCELULA`, `celulas`.`DESCRICAO` AS `DESCCELULA`, `linhas`.`CODIGO` AS `CODLINHA`,'
                       +  ' `linhas`.`DESCRICAO` AS `DESCLINHA`'
                       +  ' FROM `celulas` RIGHT JOIN `areas` ON (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`) AND (`celulas`.`CODAREA` = `areas`.`CODIGO`)'
                       +  ' LEFT JOIN `linhas` ON (`celulas`.`CODIGO` = `linhas`.`CODCELULA`) AND (`celulas`.`CODAREA` = `linhas`.`CODAREA`) AND (`celulas`.`CODEMPRESA` = `linhas`.`CODEMPRESA`)'
                       +  ' WHERE `areas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' ORDER BY `DESCAREA`, `DESCCELULA`, `DESCLINHA`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRAreas.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Recursos3Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBFamRecursos.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11, campo12 from familiarecursos order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRFamRecursos.ShowReport();
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaPrincipal.Recursos4Click(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxDBRecursosGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `recursos`.`CODIGO`, `recursos`.`DESCRICAO`, `recursos`.`QUANTIDADE`, `recursos`.`DESCRICAO` AS `FAMILIARECURSO` FROM `recursos` INNER JOIN `familiarecursos`'
                       + ' ON (`recursos`.`CODFAMILIARECURSO` = `familiarecursos`.`CODIGO`) WHERE (`recursos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `recursos`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRRecursosGeral.ShowReport();
end;

procedure TFrmTelaPrincipal.Recursos7Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFAMILIARECURSOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryFamRecursosCODIGO, DM.qryFormatoCodigoFAMILIARECURSOS, FrmTelaCadFamiliaRecursos) = False then exit;
    Application.CreateForm(TFrmTelaCadFamiliaRecursos, FrmTelaCadFamiliaRecursos);
    FrmTelaCadFamiliaRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFamiliaRecursos);
  End;
end;

procedure TFrmTelaPrincipal.Rotas2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadAbastecimentosRotas,FrmTelaCadAbastecimentosRotas);
    FrmTelaCadAbastecimentosRotas.Position := poScreenCenter;
    FrmTelaCadAbastecimentosRotas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAbastecimentosRotas);
  End;
end;

procedure TFrmTelaPrincipal.RotasdeManuteno1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    if DM.AplicarMascara(DM.qryRotasCODIGO, DM.qryFormatoCodigoMANUTPROGEQUIPAMENTO, FrmTelaCadRotaProgEquip) = False then exit;
    Application.CreateForm(TFrmTelaCadRotaProgEquip, FrmTelaCadRotaProgEquip);
    FrmTelaCadRotaProgEquip.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadRotaProgEquip);
  End;
end;

procedure TFrmTelaPrincipal.Sair1Click(Sender: TObject);
var
  X: Integer;
begin
  if DM.FFecharForms = True then
    begin
      for X := 0 to Application.ComponentCount-1 do
      if Application.Components[X] is TForm then
        if not(TForm(Application.Components[X]) = Application.MainForm) then
          if TForm(Application.Components[X]).Showing then TForm(Application.Components[X]).Close;
    end;
  Close;
end;

procedure TFrmTelaPrincipal.Satelite1Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaImpDadosSatelite, FrmTelaImpDadosSatelite);
    FrmTelaImpDadosSatelite.ShowModal;
  Finally
    FreeAndNil(FrmTelaImpDadosSatelite);
  End;
end;

procedure TFrmTelaPrincipal.ServiosExecutadosporTerceirizadosforadaUnidade2Click(
  Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADTERCEIRIZADAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoTercFora, FrmTelaCadOrdemServicoTercFora);
    FrmTelaCadOrdemServicoTercFora.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercFora);
  End;
end;

procedure TFrmTelaPrincipal.ServiosExecutadosporTerceirizadosnaUnidade2Click(
  Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADTERCEIRIZADAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadOrdemServicoTercUnid, FrmTelaCadOrdemServicoTercUnid);
    FrmTelaCadOrdemServicoTercUnid.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServicoTercUnid);
  End;
end;

procedure TFrmTelaPrincipal.SolicitaodeTrabalho1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADSOLICITACAOTRAB.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadSolicitacaoTrab, FrmTelaCadSolicitacaoTrab);
    FrmTelaCadSolicitacaoTrab.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadSolicitacaoTrab);
  End;
end;

procedure TFrmTelaPrincipal.TimerOscioso2Timer(Sender: TObject);
begin
  DM.FSegundosDesliga := DM.FSegundosDesliga - 1;
  LblTempoDesliga.Caption := 'O sistema será encerrado em ' + DM.SecondToTime(DM.FSegundosDesliga);
  if (DM.FSegundosDesliga <= 30) and (DM.FSegundosDesliga >= 0) then
  begin
    if (DM.FSegundosDesliga > 0) then
    begin
      if (frmSistemaOcioso.Active = False) and (frmSistemaOcioso <> nil) then
      begin
        frmSistemaOcioso.Left := RandomRange(0, Screen.Width - frmSistemaOcioso.Width);
        frmSistemaOcioso.Top := RandomRange(0, Screen.Height - frmSistemaOcioso.Height);
        frmSistemaOcioso.ShowModal;
      end;
      frmSistemaOcioso.lblTempoRegressivo.Caption := 'O sistema será desligado em '+IntToStr(DM.FSegundosDesliga)+' segundos.';
      if DM.FSegundosDesliga < 0 then
        Sair1Click(Sender);

     // ShowMessageFmt('O sistema será desligado em %d segundos.', [DM.FSegundosDesliga]);
    end else
    if (DM.FSegundosDesliga = 0) then
    begin
      //frmSistemaOcioso.Close;
      Sair1Click(Sender);
    end;
  end;
end;

procedure TFrmTelaPrincipal.TimerOsciosoTimer(Sender: TObject);
var
  MyNotification: TNotification;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  try
    MyNotification.Name := 'SPMP3CloseNotification';
    MyNotification.Title := 'SPMP3';
    MyNotification.AlertBody := 'Sistema encerrado por inatividade!';

    NotificationCenter1.PresentNotification(MyNotification);
  finally
    MyNotification.Free;
  end;

  DM.FFecharForms := True;
  Close;
end;

procedure TFrmTelaPrincipal.UsuariosAtivos1Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaUsuariosAtivos, FrmTelaUsuariosAtivos);
    FrmTelaUsuariosAtivos.ShowModal;
  Finally
    FreeAndNil(FrmTelaUsuariosAtivos);
  End;
end;

procedure TFrmTelaPrincipal.TimerLetreiroTimer(Sender: TObject);
begin
//LblAlertas.Caption := DM.FAlerta;
//if LblAlertas.left >= -(LblAlertas.Width) then
//  LblAlertas.left := LblAlertas.left-1
//else
//  LblAlertas.left := PAlertas.width;
end;


end.

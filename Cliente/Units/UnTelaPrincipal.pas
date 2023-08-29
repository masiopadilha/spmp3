unit UnTelaPrincipal;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.DateUtils, Data.DB, Datasnap.DBClient, Data.SqlExpr, System.UITypes, Vcl.Imaging.pngimage,
  Vcl.Buttons, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.Stan.Error, Winapi.ShellAPI,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP;
type
  TFrmTelaPrincipal = class(TForm)
    Image1: TImage;
    MainMenuPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    PAlertas: TPanel;
    LblAlertas: TLabel;
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
    TimerLetreiro: TTimer;
    TimerAlertas: TTimer;
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
    Area2: TMenuItem;
    Area3: TMenuItem;
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
    SpeedButton1: TSpeedButton;
    FamliadeEquipamentos1: TMenuItem;
    Equpamentos1: TMenuItem;
    Equipamentos5: TMenuItem;
    FamliadeEquipamentos2: TMenuItem;
    Opcoes1: TMenuItem;
    lblLicenca: TLabel;
    Auditoria1: TMenuItem;
    Button1: TButton;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    AlterarCodigo1: TMenuItem;
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
    procedure ManutencaoProgramadadeFamilias1Click(Sender: TObject);
    procedure LubrificaoProgramadadeFamlias1Click(Sender: TObject);
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
    procedure TimerAlertasTimer(Sender: TObject);
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
    procedure Area2Click(Sender: TObject);
    procedure Area3Click(Sender: TObject);
    procedure Pneus1Click(Sender: TObject);
    procedure Satelite1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Viagens1Click(Sender: TObject);
    procedure Familia1Click(Sender: TObject);
    procedure odos1Click(Sender: TObject);
    procedure Familia2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FamliadeEquipamentos1Click(Sender: TObject);
    procedure Equpamentos1Click(Sender: TObject);
    procedure Equipamentos5Click(Sender: TObject);
    procedure FamliadeEquipamentos2Click(Sender: TObject);
    procedure Opcoes1Click(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
    procedure DespesasdaManutencao1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AlterarCodigo1Click(Sender: TObject);
  private
    procedure CheckUpdateVersion;
    { Private declarations }
//    procedure AppIdle(Sender: TObject; var Done: Boolean);
//    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
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
  UnTelaAuditoria, UnDmAlertas, UnTelaCadEquipamentosAltCod;

procedure TFrmTelaPrincipal.CheckUpdateVersion;
var
  LLocalDir: String;
  LFileVersionLocal: Currency;
  LFileVersionServer: Currency;
  LLocalUpdateFile: PWideChar;
begin
  //Se a pasta local não existir, então criar.
  LLocalDir          := 'c:\SPMP3';
  LLocalUpdateFile   := PChar(ExtractFilePath(Application.ExeName)+'UpdateVersion.bat');
  //Checar a versão do programa no servidor e comparar com a atual.
//  LFileVersionLocal  := DM.GetFileDateAsIntegerAndBuildVersion(Application.ExeName);
//  LFileVersionServer := DM.GetFileDateAsIntegerAndBuildVersion(DM.FServerPathExeVersion);
  //Checar a versão do programa no servidor e comparar com a atual.
  LFileVersionLocal  := StrToCurr(DM.getVersion(Application.ExeName));
  LFileVersionServer := StrToCurr(DM.getVersion(DM.FServerPathExeVersion));
  if LFileVersionServer > LFileVersionLocal then
    begin
      MessageDlg('Há uma nova versão no servidor.' + #13 + 'Pressione OK para iniciar a atualização.', mtInformation, [mbOK], 0);
      ShellExecute(Handle, 'open', LLocalUpdateFile, nil, nil, SW_HIDE);
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
    Application.CreateForm(TFrmTelaCadEquipamentosAltCod, FrmTelaCadEquipamentosAltCod);
    FrmTelaCadEquipamentosAltCod.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadEquipamentosAltCod);
  End;
end;

procedure TFrmTelaPrincipal.AppIdle(Sender: TObject; var Done: Boolean);
begin
  TimerOscioso.Enabled := True;
end;
procedure TFrmTelaPrincipal.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.message of
    WM_LBUTTONDOWN, WM_RBUTTONDOWN,WM_KEYDOWN: TimerOscioso.Enabled := False;
  end;
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
procedure TFrmTelaPrincipal.Area2Click(Sender: TObject);
begin
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';
if DM.ConsultarCombo <> '' then
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
end;
procedure TFrmTelaPrincipal.Area3Click(Sender: TObject);
begin
  inherited;
DM.FTabela_auxiliar := 150;
DM.FNomeConsulta := 'Áreas';
if DM.ConsultarCombo <> '' then
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
procedure TFrmTelaPrincipal.Button1Click(Sender: TObject);
//var
//  amount1 : Currency;
//  LFileVersion: Currency;
//
//  direc, name, repli, line, dir: String;
begin
//  amount1 := 1234.567;
//
//  // Display in a Currency format
//  // CurrencyString := '? ';
//  ShowMessage('Using 4 digits = '+CurrToStrF(amount1, ffCurrency, 4));
//  ShowMessage('Using 2 digits = '+CurrToStrF(amount1, ffCurrency, 2));
//  ShowMessage('Using 0 digits = '+CurrToStrF(amount1, ffCurrency, 0));
//  ShellExecute(Handle, 'open', 'c:\spmp3', nil, nil, SW_HIDE);
//  DMAlertas.TrayIcon1.ShowBalloonHint();

//Direc := 'C:\SPMP3\Backup';
//name := 'SPMP3.exe';
//line := 'C:\SPMP3';
//dir := '/localhost/SPMP3';
//repli := '';
//
//if not (DirectoryExists(direc)) then
//  begin
//   ShowMessage('ERRO 217 '+#13+'CONTACT O ADMINISTRADOR DO SISTEMA');
//   abort;
//  end;
//
// if (FileExists(line)) then
//  BEGIN
//   if repli = 'S' THEN
//    BEGIN
//     DeleteFile(line);
//    END
//   else
//    BEGIN
//     ShowMessage('o arquivo ja existe neste local');
//     IdFTP1.Disconnect;
//     abort;
//    END;
//  end;
// if NOT (FileExists(line)) then
//  BEGIN
//    with IdFTP1 do try
//     Username := 'farmace@spmp.maceio.br';
//     Password := 'farmaceadmin';
//     Host := 'ftp.spmp.maceio.br';
//     Connect;
//     ChangeDir(dir);
//    finally
//    end;
//   begin
//    try
//     begin
//      IdFTP1.Get(Name, Line, false);
//     end;
//     finally
//     IdFTP1.Disconnect;
//    end;
//   end;
// END;
//DM.FDQuery1.Close;
//DM.FDQuery1.Params.ParamByName('NEWCODE').AsString := Edit1.Text;
//DM.FDQuery1.Params.ParamByName('OLDCODE').AsString := Edit2.Text;
//DM.FDQuery1.Execute();
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
DmRelatorios.frxDBCausaFalha.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao from causasfalha order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRCausaFalha.ShowReport();
DM.qryAuxiliar.Close;
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
DmRelatorios.frxDBFamEquipamento.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11, campo12 from familiaequipamento order by descricao');
DM.qryAuxiliar.Open;
DmRelatorios.frxRFamEquipamento.ShowReport();
DM.qryAuxiliar.Close;
end;
procedure TFrmTelaPrincipal.Equipamentos5Click(Sender: TObject);
begin
DmRelatorios.frxDBLubrificEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`CODEMPRESA`, `lubrificprogequipamento`.`CODEQUIPAMENTO`, `lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP`'
                       + ', `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`DTAINICIO1`, `lubrificprogequipamento`.`FREQUENCIA2`'
                       + ', `lubrificprogequipamento`.`REPROGRAMAR2`, `lubrificprogfamequipamento`.`DESCRICAO` AS `DESCLUBRIFICPROGFAMEQUIP`, `lubrificprogfamequipamento`.`CODIGO` AS `CODLUBRIFICPROGFAMEQUIP`'
                       + ', `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`'
                       + ' FROM `spmpma_spmp`.`lubrificprogequipamento`'
                       + ' INNER JOIN `spmpma_spmp`.`lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`)'
                       + ' INNER JOIN `spmpma_spmp`.`equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                       + ' INNER JOIN `spmpma_spmp`.`areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                       + ' WHERE (`lubrificprogequipamento`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ')'
                       + ' ORDER BY `equipamentos`.`DESCRICAO`');
//                       + ' ORDER BY `equipamentos`.`DESCRICAO`, `areas`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRLubrificEquipGeral.ShowReport();
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
procedure TFrmTelaPrincipal.Equpamentos1Click(Sender: TObject);
begin
DmRelatorios.frxDBManutEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `manutprogequipamento`.`CODIGO`, `manutprogequipamento`.`CODEMPRESA`, `manutprogequipamento`.`CODEQUIPAMENTO`, `manutprogequipamento`.`CODMANUTPROGFAMEQUIP`'
                       + ', `manutprogequipamento`.`DESCRICAO`, `manutprogequipamento`.`FREQUENCIA1`, `manutprogequipamento`.`DTAINICIO1`, `manutprogequipamento`.`FREQUENCIA2`'
                       + ', `manutprogequipamento`.`REPROGRAMAR2`, `manutprogfamequipamento`.`DESCRICAO` AS `DESCMANUTPROGFAMEQUIP`, `manutprogfamequipamento`.`CODIGO` AS `CODMANUTPROGFAMEQUIP`'
                       + ', `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `areas`.`CODIGO` AS `CODAREA`, `areas`.`DESCRICAO` AS `DESCAREA`'
                       + ' FROM `spmpma_spmp`.`manutprogequipamento`'
                       + ' INNER JOIN `spmpma_spmp`.`manutprogfamequipamento` ON (`manutprogequipamento`.`CODMANUTPROGFAMEQUIP` = `manutprogfamequipamento`.`CODIGO`)'
                       + ' INNER JOIN `spmpma_spmp`.`equipamentos` ON (`manutprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                       + ' INNER JOIN `spmpma_spmp`.`areas` ON (`equipamentos`.`CODLOCALIZACAO` = `areas`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `areas`.`CODEMPRESA`)'
                       + ' WHERE (`manutprogequipamento`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ')'
                       + ' ORDER BY `equipamentos`.`DESCRICAO`');
//                       + ' ORDER BY `equipamentos`.`DESCRICAO`, `areas`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRManutEquipGeral.ShowReport();
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
DM.FTabela_auxiliar := 600;
DM.FNomeConsulta := 'Família de Equipamentos';
if DM.ConsultarCombo <> '' then
  begin
    DmRelatorios.frxDBEquipGeral.DataSet := DM.qryAuxiliar;
    DM.qryAuxiliar.Close;
    DM.qryAuxiliar.SQL.Clear;
    DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP FROM `equipamentos`'
                           + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`equipamentos`.`CODIGO` = `equipamentos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ' and `equipamentos`.`CODFAMILIAEQUIP` =  '+QuotedStr(DM.FCodCombo) + ') order by `equipamentos`.`DESCRICAO`');
    DM.qryAuxiliar.Open;
    DmRelatorios.frxREquipGeral.ShowReport();
  end;
end;
procedure TFrmTelaPrincipal.FamliadeEquipamentos1Click(Sender: TObject);
begin
DmRelatorios.frxDBManutFamEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `manutprogfamequipamento`.`CODIGO`, `manutprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2'
                       + ' FROM `manutprogfamequipamento` INNER JOIN `familiaequipamento` ON (`manutprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) LEFT JOIN `tipoprogramacao` ON (`manutprogfamequipamento`.`PROGRAMARPOR2` = `tipoprogramacao`.`CODIGO`)'
                       + ' WHERE (`manutprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `manutprogfamequipamento`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRManutFamEquipGeral.ShowReport();
end;
procedure TFrmTelaPrincipal.FamliadeEquipamentos2Click(Sender: TObject);
begin
DmRelatorios.frxDBLubrificFamEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogfamequipamento`.`CODIGO`, `lubrificprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO`, `tipoprogramacao`.`DESCRICAO` AS PROGRAMARPOR2, `tipoprogramacao`.`CODIGO` AS CODPROGRAMARPOR2'
                       +  ' FROM `lubrificprogfamequipamento` INNER JOIN `familiaequipamento` ON (`lubrificprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) LEFT JOIN `tipoprogramacao` ON (`lubrificprogfamequipamento`.`PROGRAMARPOR2`'
                       +  '  = `tipoprogramacao`.`CODIGO`) WHERE (`lubrificprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') ORDER BY `lubrificprogfamequipamento`.`DESCRICAO`');
DM.qryAuxiliar.Open;
DmRelatorios.frxRLubrificFamEquipGeral.ShowReport();
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
    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
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
        DM.RetornaDataHoraServidor;
        DM.qryAcesso.Close;
        DM.qryAcesso.Params[0].AsString := DM.FNomeUsuario;
        DM.qryAcesso.Open;
        DM.qryAcesso.Edit;
        DM.qryAcessoDATASAIDA.AsDateTime  := DateOf(DM.FDataHoraServidor);
        DM.qryAcessoHORASAIDA.AsDateTime  := DM.FDataHoraServidor;
        DM.qryAcessoATIVO.AsString        := 'N';
        DM.qryAcessoPERIODO.AsString      := IntToStr(MinutesBetween(DM.qryAcessoHORAENTRADA.AsDateTime, DM.qryAcessoHORASAIDA.AsDateTime));
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
    on E: EFDDBEngineException do begin
      DM.FDConnSPMP3.Rollback;
      Application.Terminate;
      raise;
    end;
  end;
  DM.qryUsuario.Close;
  DM.qryFormatoCodigo.Close;
  DM.qryUsuarioAcessos.Close;
  if DM.FFecharForms = True then
    begin
      DM.FDConnSPMP3.Connected := False;
      Application.MessageBox('Sistema será encerrado por inatividade!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
    end;
  Application.Terminate;
end;
procedure TFrmTelaPrincipal.FormCreate(Sender: TObject);
begin
//CheckUpdateVersion;
StatusBar1.Font.Size := 9;
StatusBar1.Panels[0].Text := DM.FNomeUsuario;
StatusBar1.Panels[1].Text := DM.FNivelAcesso;
StatusBar1.Panels[2].Text := DM.FNomeEmpresa;
StatusBar1.Panels[3].Text := DM.FNomeGrupo;
//StatusBar1.Panels[4].Text := DM.FVersao + ' beta';
StatusBar1.Panels[4].Text := DM.FVersao;
if DM.FDiasRestantes < 36500 then
  lblLicenca.Caption :=  'Licença: '+FormatFloat('00', DM.FDiasRestantes)+' dias restantes'
else
  lblLicenca.Caption :=  'Licença: Ilimitada';
LblAlertas.Caption := DM.FAlerta;
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
DM.FFecharForms := False;
TimerOscioso.Interval := DM.FMinutosInativo * 60000;
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
procedure TFrmTelaPrincipal.LubrificaoProgramadadeFamlias1Click(
  Sender: TObject);
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
procedure TFrmTelaPrincipal.ManutencaoProgramadadeFamilias1Click(
  Sender: TObject);
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
DmRelatorios.frxDBEquipGeral.DataSet := DM.qryAuxiliar;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP FROM `equipamentos`'
                       +  ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`equipamentos`.`CODIGO` = `equipamentos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `equipamentos`.`DESCRICAO`');
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
procedure TFrmTelaPrincipal.PorPeca1Click(Sender: TObject);
begin
if (DM.qryUsuarioPAcessoCADPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
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
//  if DM.FFecharForms = True then
//    begin
//      for X := 1 to Screen.FormCount -1 do
//        Screen.Forms[X].Close;
//    end;
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
procedure TFrmTelaPrincipal.SpeedButton1Click(Sender: TObject);
var
sWindowsDir:String;
begin
  sWindowsDir := GetEnvironmentVariable('LOCALAPPDATA');
  ShowMessage(sWindowsDir);
end;
procedure TFrmTelaPrincipal.TimerOsciosoTimer(Sender: TObject);
begin
//Se oscioso por um tempo determinado, fechar o sistema
//if DM.FMinutosInativo = 36000  then
  DM.FFecharForms := True;
  Sair1Click(Sender);
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
procedure TFrmTelaPrincipal.TimerAlertasTimer(Sender: TObject);
begin
//if DM.SQLConnSPMP3Web.ConnectionState = csStateClosed then
//  Try
//    DM.SQLConnSPMP3Web.Connected := True;
//  Except
//    Exit;
//  End;
  try
    DM.ConsultarAlertas;
  except
    TimerAlertas.Enabled := False;
  end;
end;
procedure TFrmTelaPrincipal.TimerLetreiroTimer(Sender: TObject);
begin
LblAlertas.Caption := DM.FAlerta;
if LblAlertas.left >= -(LblAlertas.Width) then
  LblAlertas.left := LblAlertas.left-1
else
  LblAlertas.left := PAlertas.width;
end;
end.

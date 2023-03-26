unit UnCMWeb;

interface

uses
  System.SysUtils, System.Classes, UnCCWeb, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Data.DbxHTTPLayer, Datasnap.DBClient,
  Datasnap.DSConnect, Data.DB, Data.SqlExpr, Vcl.ImgList, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Dialogs, Winapi.Windows, Winapi.TlHelp32, System.DateUtils, System.UITypes, Vcl.Graphics,
  Vcl.AppEvnts, Vcl.Mask, Vcl.DBGrids, Vcl.imaging.jpeg, frxClass, frxDBSet,
  frxExportPDF, IdStack, frxRich, System.Win.ComObj, Vcl.ExtCtrls, Vcl.imaging.PNGImage, System.IniFiles,
  Vcl.Grids, System.Variants, System.ImageList, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, Datasnap.DSClientRest, System.Win.Registry, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, frxExportBaseDialog, System.IOUtils,
  FireDAC.Comp.DataSet, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.MySQL;

const
  OffsetMemoryStream : Int64 = 0;

type
  TArrayFloat = array[0..10] of Real;
  TArrayString = array[0..1] of String;

  TCMWeb = class(TDataModule)
    CDUpdates: TClientDataSet;
    CDCadCentroCusto: TClientDataSet;
    DSCadCentroCusto: TDataSource;
    CDAuxiliar: TClientDataSet;
    DSAuxiliar: TDataSource;
    ImageListBotoes: TImageList;
    CDUsuario: TClientDataSet;
    DSUsuario: TDataSource;
    CDAcesso: TClientDataSet;
    CDCadFormatoCodigo: TClientDataSet;
    DSCadFormatoCodigo: TDataSource;
    CDCadGrupos: TClientDataSet;
    DSCadGrupos: TDataSource;
    CDCadUnidades: TClientDataSet;
    DSCadUnidades: TDataSource;
    CDCadAdmCorp: TClientDataSet;
    DSCadAdmCorp: TDataSource;
    CDCadAdmUnid: TClientDataSet;
    DSCadAdmUnid: TDataSource;
    CDUsuariosAtivos: TClientDataSet;
    CDCadClasses: TClientDataSet;
    DSCadClasses: TDataSource;
    CDCadFamEquipamento: TClientDataSet;
    DSCadFamEquipamento: TDataSource;
    CDCadCargos: TClientDataSet;
    DSCadCargos: TDataSource;
    CDCadCausaFalha: TClientDataSet;
    DSCadCausaFalha: TDataSource;
    CDCadFamPecasRep: TClientDataSet;
    DSCadFamPecasRep: TDataSource;
    CDCadFamRecursos: TClientDataSet;
    DSCadFamRecursos: TDataSource;
    CDCadMotivoParada: TClientDataSet;
    DSCadMotivoParada: TDataSource;
    CDCadTipoManutencao: TClientDataSet;
    DSCadTipoManutencao: TDataSource;
    CDCadTipoProgramacao: TClientDataSet;
    DSCadTipoProgramacao: TDataSource;
    CDCadCalendEquip: TClientDataSet;
    DSCadCalendEquip: TDataSource;
    DSCadCalendMObra: TDataSource;
    CDCadDispAdmissiveis: TClientDataSet;
    DSCadDispAdmissiveis: TDataSource;
    CDCadAlmoxarifado: TClientDataSet;
    DSCadAlmoxarifado: TDataSource;
    CDCadAreas: TClientDataSet;
    DSCadAreas: TDataSource;
    CDCadFabricantes: TClientDataSet;
    DSCadFabricantes: TDataSource;
    CDCadFeriados: TClientDataSet;
    DSCadFeriados: TDataSource;
    CDCadFornecedores: TClientDataSet;
    DSCadFornecedores: TDataSource;
    CDCadImagens: TClientDataSet;
    DSCadImagens: TDataSource;
    CDCadOficinas: TClientDataSet;
    DSCadOficinas: TDataSource;
    CDCadUsuarios: TClientDataSet;
    DSCadUsuarios: TDataSource;
    CDCadCelulas: TClientDataSet;
    DSCadCelulas: TDataSource;
    CDCadLinhas: TClientDataSet;
    DSCadLinhas: TDataSource;
    CDCadCalendEquipSeqHora: TClientDataSet;
    DSCadCalendEquipSeqHora: TDataSource;
    CDPermissoesAcesso: TClientDataSet;
    CDTotalTabelas: TClientDataSet;
    CDPermissoesAlteraracao: TClientDataSet;
    CDPermissoesExclusao: TClientDataSet;
    CDPermissoesInclusao: TClientDataSet;
    CDNivelAcesso: TClientDataSet;
    CDPermissoesAcessoPadrao: TClientDataSet;
    CDPermissoesExclusaoPadrao: TClientDataSet;
    CDPermissoesInclusaoPadrao: TClientDataSet;
    CDPermissoesAlteraracaoPadrao: TClientDataSet;
    CDCadManutProgEquip: TClientDataSet;
    DSCadManutProgEquip: TDataSource;
    CDCadManutProgEquipItens: TClientDataSet;
    DSCadManutProgEquipItens: TDataSource;
    CDCadManutProgEquipItensEsp: TClientDataSet;
    DSCadManutProgEquipItensEsp: TDataSource;
    CDCadLubrificProgEquip: TClientDataSet;
    DSCadLubrificProgEquip: TDataSource;
    CDCadLubrificProgEquipItens: TClientDataSet;
    DSCadLubrificProgEquipItens: TDataSource;
    CDCadLubrificProgEquipItensEsp: TClientDataSet;
    DSCadLubrificProgEquipItensEsp: TDataSource;
    CDCadEquipamentoHist: TClientDataSet;
    DSCadEquipamentoHist: TDataSource;
    CDCadEquipamentoHistNumParadas: TClientDataSet;
    DSCadEquipamentoHistNumParadas: TDataSource;
    CDCadCalendMObra: TClientDataSet;
    CDCadCalendMObraSeqHora: TClientDataSet;
    DSCadCalendMObraSeqHora: TDataSource;
    CDCadEquipamentoTipoManutHist: TClientDataSet;
    DSCadEquipamentoTipoManutHist: TDataSource;
    CDCadEquipamentoManutHist: TClientDataSet;
    DSCadEquipamentoManutHist: TDataSource;
    CDCadEquipamentoLubrificHist: TClientDataSet;
    DSCadEquipamentoLubrificHist: TDataSource;
    CDCadSolicitacaoTrab: TClientDataSet;
    DSCadSolicitacaoTrab: TDataSource;
    CDCadSolicitacaoTrabProgramadas: TClientDataSet;
    DSCadSolicitacaoTrabProgramadas: TDataSource;
    CDCadSolicitacaoTrabExecucao: TClientDataSet;
    DSCadSolicitacaoTrabExecucao: TDataSource;
    CDCadTotalHomemHora: TClientDataSet;
    CDCadTotalHomemHoraSeqHora: TClientDataSet;
    DSCadTotalHomemHora: TDataSource;
    DSCadTotalHomemHoraSeqHora: TDataSource;
    CDCadPlanoTrabalho: TClientDataSet;
    DSCadPlanoTrabalho: TDataSource;
    CDCadManutProgFamEquip: TClientDataSet;
    DSCadManutProgFamEquip: TDataSource;
    CDCadManutProgFamEquipPlanoTrab: TClientDataSet;
    DSCadManutProgFamEquipPlanoTrab: TDataSource;
    CDCadMonitoramento: TClientDataSet;
    DSCadMonitoramento: TDataSource;
    CDCadManutProgFamEquipPartes: TClientDataSet;
    DSCadManutProgFamEquipPartes: TDataSource;
    CDCadManutProgFamEquipItens: TClientDataSet;
    DSCadManutProgFamEquipItens: TDataSource;
    CDCadLubrificProgFamEquip: TClientDataSet;
    DSCadLubrificProgFamEquip: TDataSource;
    CDCadLubrificProgFamEquipPlanoTrab: TClientDataSet;
    DSCadLubrificProgFamEquipPlanoTrab: TDataSource;
    CDCadLubrificProgFamEquipPartes: TClientDataSet;
    DSCadLubrificProgFamEquipPartes: TDataSource;
    CDCadLubrificProgFamEquipItens: TClientDataSet;
    DSCadLubrificProgFamEquipItens: TDataSource;
    CDManutPeriodicas: TClientDataSet;
    DSManutPeriodicas: TDataSource;
    CDManutPeriodicasItens: TClientDataSet;
    DSManutPeriodicasItens: TDataSource;
    CDCadPontosInspecao: TClientDataSet;
    DSCadPontosInspecao: TDataSource;
    CDCadPontosInspecaoLoc: TClientDataSet;
    DSCadPontosInspecaoLoc: TDataSource;
    CDCadContadores: TClientDataSet;
    DSCadContadores: TDataSource;
    CDCadFuncionarios: TClientDataSet;
    DSCadFuncionarios: TDataSource;
    SQLConnSPMP3Web: TSQLConnection;
    CDCadPecasReposicao: TClientDataSet;
    DSCadPecasReposicao: TDataSource;
    CDCadRecursos: TClientDataSet;
    DSCadRecursos: TDataSource;
    ApplicationEventsSPMP: TApplicationEvents;
    CDCadFuncionariosCxaFerram: TClientDataSet;
    DSCadFuncionariosCxaFerram: TDataSource;
    CDCadRecursoKit: TClientDataSet;
    DSCadRecursoKit: TDataSource;
    CDCadRecursoKitItens: TClientDataSet;
    DSCadRecursoKitItens: TDataSource;
    CDCadFuncionariosCxaFerramInv: TClientDataSet;
    DSCadFuncionariosCxaFerramInv: TDataSource;
    CDCadFuncionariosCxaFerramInvItens: TClientDataSet;
    DSCadFuncionariosCxaFerramInvItens: TDataSource;
    CDCadFuncionariosAusencias: TClientDataSet;
    DSCadFuncionariosAusencias: TDataSource;
    CDCadFuncionariosHist: TClientDataSet;
    DSCadFuncionariosHist: TDataSource;
    CDCadFuncionariosTipoManutHist: TClientDataSet;
    DSCadFuncionariosTipoManutHist: TDataSource;
    CDCadFuncionariosHistServicos: TClientDataSet;
    DSCadFuncionariosHistServicos: TDataSource;
    CDCadFuncionariosHistAusencias: TClientDataSet;
    DSCadFuncionariosHistAusencias: TDataSource;
    CDCadFuncionariosHistServicosHOMEMHORA_AGR: TAggregateField;
    DSCadRecursosDados: TDataSource;
    CDCadRecursosDados: TClientDataSet;
    DSCadPecasReposicaoDados: TDataSource;
    CDCadPecasReposicaoDados: TClientDataSet;
    CDCadFerramentaria: TClientDataSet;
    DSCadFerramentaria: TDataSource;
    CDCadFerramentariaItens: TClientDataSet;
    DSCadFerramentariaItens: TDataSource;
    CDCadPecaReposicaoKit: TClientDataSet;
    DSCadPecaReposicaoKit: TDataSource;
    CDCadPecaReposicaoKitItens: TClientDataSet;
    DSCadPecaReposicaoKitItens: TDataSource;
    CDCadPecasReposicaoHistPecas: TClientDataSet;
    DSCadPecasReposicaoHistPecas: TDataSource;
    CDCadLubrificantes: TClientDataSet;
    DSCadLubrificantes: TDataSource;
    CDCadOrdemServicoTercFora: TClientDataSet;
    DSCadOrdemServicoTercFora: TDataSource;
    CDCadOrdemServicoTercForaOI: TClientDataSet;
    DSCadOrdemServicoTercForaOI: TDataSource;
    CDCadOrdemServicoTercForaOC: TClientDataSet;
    DSCadOrdemServicoTercForaOC: TDataSource;
    CDCadOrdemServicoTercForaOE: TClientDataSet;
    DSCadOrdemServicoTercForaOE: TDataSource;
    CDCadOrdemServicoTercForaAditivos: TClientDataSet;
    DSCadOrdemServicoTercForaAditivos: TDataSource;
    CDCadOrdemServicoTercUnid: TClientDataSet;
    DSCadOrdemServicoTercUnid: TDataSource;
    CDCadOrdemServicoTercUnidTarefas: TClientDataSet;
    DSCadOrdemServicoTercUnidTarefas: TDataSource;
    CDCadOrdemServicoTercUnidTarefasPred: TClientDataSet;
    DSCadOrdemServicoTercUnidTarefasPred: TDataSource;
    CDCadOrdemServicoTercUnidMedicoes: TClientDataSet;
    DSCadOrdemServicoTercUnidMedicoes: TDataSource;
    DSCadOrdemServicoTercUnidGrafTarefas: TDataSource;
    CDCadOrdemServicoTercUnidGrafTarefas: TClientDataSet;
    CDCadOrdemServicoTercUnidAditivos: TClientDataSet;
    DSCadOrdemServicoTercUnidAditivos: TDataSource;
    CDCadOrdemServicoTercUnidMateriais: TClientDataSet;
    DSCadOrdemServicoTercUnidMateriais: TDataSource;
    CDCadOrdemServicoTercUnidRecurso: TClientDataSet;
    DSCadOrdemServicoTercUnidRecurso: TDataSource;
    CDCadOrdemServicoTercUnidPecas: TClientDataSet;
    DSCadOrdemServicoTercUnidPecas: TDataSource;
    CDCadArquivoTecnico: TClientDataSet;
    DSCadArquivoTecnico: TDataSource;
    CDCadArquivoTecnicoParam: TClientDataSet;
    DSCadArquivoTecnicoParam: TDataSource;
    CDCadDespMensalFuncPer: TClientDataSet;
    DSCadDespMensalFuncPer: TDataSource;
    CDCadDespMensalFunc: TClientDataSet;
    DSCadDespMensalFunc: TDataSource;
    CDCadDespMensalManutencao: TClientDataSet;
    DSCadDespMensalManutencao: TDataSource;
    CDCadDespMensalManutencaoCustos: TClientDataSet;
    DSCadDespMensalManutencaoCustos: TDataSource;
    CDCadDespMensalProdMensal: TClientDataSet;
    DSCadDespMensalProdMensal: TDataSource;
    CDCadDespMensalDiversas: TClientDataSet;
    DSCadDespMensalDiversas: TDataSource;
    CDCadIndDesempenho: TClientDataSet;
    DSCadIndDesempenho: TDataSource;
    CDCadIndDesempPercParadas: TClientDataSet;
    DSCadIndDesempPercParadas: TDataSource;
    CDCadTotalEquipHora: TClientDataSet;
    CDCadTotalEquipSeqHora: TClientDataSet;
    DSCadTotalEquipHora: TDataSource;
    DSCadTotalEquipSeqHora: TDataSource;
    CDCadIndDesempTotalHE: TClientDataSet;
    DSCadIndDesempTotalHE: TDataSource;
    CDRelatGerencNumParadas: TClientDataSet;
    DSRelatGerencNumParadas: TDataSource;
    CDRelatGerencPercParadas: TClientDataSet;
    DSRelatGerencPercParadas: TDataSource;
    CDRelatGerencHorasParadas: TClientDataSet;
    DSRelatGerencHorasParadas: TDataSource;
    CDRelatGerencCustos: TClientDataSet;
    DSRelatGerencCustos: TDataSource;
    CDRelatGerencHE: TClientDataSet;
    DSRelatGerencHE: TDataSource;
    CDRelatGerencOS: TClientDataSet;
    DSRelatGerencOS: TDataSource;
    CDRelatGerencProdMObra: TClientDataSet;
    DSRelatGerencProdMObra: TDataSource;
    CDRelatGerencCustoPrev: TClientDataSet;
    DSRelatGerencCustoPrev: TDataSource;
    DSRelatGerenclDispEquip: TDataSource;
    CDRelatGerencDispEquip: TClientDataSet;
    CDRelatGerencDespEquip: TClientDataSet;
    DSRelatGerencDespEquip: TDataSource;
    CDCadAlertas: TClientDataSet;
    DSCadAlertas: TDataSource;
    CDCadFuncionariosFerramentaria: TClientDataSet;
    DSCadFuncionariosFerramentaria: TDataSource;
    CDCadAbastecimentos: TClientDataSet;
    DSCadAbastecimentos: TDataSource;
    CDCadAbastecimentosCombust: TClientDataSet;
    DSCadAbastecimentosCombust: TDataSource;
    CDCadAbastecimentosCombustAbast: TClientDataSet;
    DSCadAbastecimentosCombustAbast: TDataSource;
    CDCadAbastecimentosRotas: TClientDataSet;
    DSCadAbastecimentosRotas: TDataSource;
    CDCadAbastecimentosLubrific: TClientDataSet;
    DSCadAbastecimentosLubrific: TDataSource;
    CDCadAbastecimentosLubrificAbast: TClientDataSet;
    DSCadAbastecimentosLubrificAbast: TDataSource;
    CDCadAbastecimentosCombustAbastMAX_DATA: TAggregateField;
    CDCadAbastecimentosCombustAbastMAX_ODOM: TAggregateField;
    CDCadAbastecimentosLeitor: TClientDataSet;
    DSCadAbastecimentosLeitor: TDataSource;
    CDCadFamPneus: TClientDataSet;
    DSCadFamPneus: TDataSource;
    CDCadPneus: TClientDataSet;
    DSCadPneus: TDataSource;
    CDCadPneusChassi: TClientDataSet;
    DSCadPneusChassi: TDataSource;
    CDCadPneusChassiImagens: TClientDataSet;
    DSCadPneusChassiImagens: TDataSource;
    CDCadPneusChassiPosicoes: TClientDataSet;
    DSCadPneusChassiPosicoes: TDataSource;
    CDCadPneusChassiPneus: TClientDataSet;
    DSCadPneusChassiPneus: TDataSource;
    CDCadPneusChassiAtrelamento: TClientDataSet;
    DSCadPneusChassiAtrelamento: TDataSource;
    CDCadPneusChassiAtrelamentoHist: TClientDataSet;
    DSCadPneusChassiAtrelamentoHist: TDataSource;
    CDCadPneusDados: TClientDataSet;
    DSCadPneusDados: TDataSource;
    CDCadPneusChassiPneusHist: TClientDataSet;
    DSCadPneusChassiPneusHist: TDataSource;
    CDParadasDiariasEquip: TClientDataSet;
    DSParadasDiariasEquip: TDataSource;
    CDParadasDiariasEquipParadas: TClientDataSet;
    DSParadasDiariasEquipParadas: TDataSource;
    CDCadRotas: TClientDataSet;
    DSCadRotas: TDataSource;
    CDCadRotasSequencia: TClientDataSet;
    DSCadRotasSequencia: TDataSource;
    CDEquipamentoReservas: TClientDataSet;
    DSEquipamentoReservas: TDataSource;
    CDCadMonitMedicoesPtosInsp: TClientDataSet;
    DSCadMonitMedicoesPtosInsp: TDataSource;
    CDCadMonitMedicoesPtosInspMAXMEDICAO: TAggregateField;
    CDCadMonitMedicoesCont: TClientDataSet;
    DSCadMonitMedicoesCont: TDataSource;
    CDCadMonitMedicoesContManut: TClientDataSet;
    DSCadMonitMedicoesContManut: TDataSource;
    CDCadMonitMedicoesContMAXMEDICAO: TAggregateField;
    CDCadMonitMedicoesContMAXDATA: TAggregateField;
    CDEquipamentoSubst: TClientDataSet;
    DSEquipamentoSubst: TDataSource;
    CDEquipamentoSubstHist: TClientDataSet;
    DSEquipamentoSubstHist: TDataSource;
    CDOrdemServicoGerencia: TClientDataSet;
    DSOrdemServicoGerencia: TDataSource;
    DSUsuariosAtivos: TDataSource;
    CDUsuarioAcessos: TClientDataSet;
    DSUsuarioAcessos: TDataSource;
    frxPDFExport1: TfrxPDFExport;
    CDManutVenc: TClientDataSet;
    DSManutVenc: TDataSource;
    DSManutPeriodicasItensEsp: TDataSource;
    CDManutPeriodicasItensEsp: TClientDataSet;
    CDLubrificPeriodicas: TClientDataSet;
    DSLubrificPeriodicas: TDataSource;
    CDLubrificPeriodicasItens: TClientDataSet;
    DSLubrificPeriodicasItens: TDataSource;
    CDLubrificPeriodicasItensEsp: TClientDataSet;
    DSLubrificPeriodicasItensEsp: TDataSource;
    CDLubrificVenc: TClientDataSet;
    DSLubrificVenc: TDataSource;
    CDCadRotasSequenciaInsp: TClientDataSet;
    DSCadRotasSequenciaInsp: TDataSource;
    CDRotaEquipVenc: TClientDataSet;
    DSRotaEquipVenc: TDataSource;
    CDRotaEquipVencSeq: TClientDataSet;
    DSRotaEquipVencSeq: TDataSource;
    CDRotaEquipVencSeqManut: TClientDataSet;
    DSRotaEquipVencSeqManut: TDataSource;
    CDCadRotasSequenciaInspItens: TClientDataSet;
    DSCadRotasSequenciaInspItens: TDataSource;
    CDCadRotasSequenciaInspItensEsp: TClientDataSet;
    DSCadRotasSequenciaInspItensEsp: TDataSource;
    CDRotaPeriodicas: TClientDataSet;
    DSRotaPeriodicas: TDataSource;
    CDRotaPeriodicasManut: TClientDataSet;
    DSRotaPeriodicasManut: TDataSource;
    CDRotaPeriodicasManutItens: TClientDataSet;
    DSRotaPeriodicasManutItens: TDataSource;
    CDRotaPeriodicasManutItensEsp: TClientDataSet;
    DSRotaPeriodicasManutItensEsp: TDataSource;
    CDManutCons: TClientDataSet;
    DSManutCons: TDataSource;
    CDLubrificCons: TClientDataSet;
    DSLubrificCons: TDataSource;
    CDRotaCons: TClientDataSet;
    DSRotaCons: TDataSource;
    CDCadMonitMedicoesPtosInspMAXDATA: TAggregateField;
    DSPConnSPMP3Web: TDSProviderConnection;
    CDRelatGerencMTBF: TClientDataSet;
    CDRelatGerencMTTR: TClientDataSet;
    CDRelatGerencMTTRCODIGO: TStringField;
    CDRelatGerencMTTRDESCRICAO: TStringField;
    CDRelatGerencMTTRVALOR: TStringField;
    CDRelatGerencBacklog: TClientDataSet;
    CDRelatGerencBacklogCODIGO: TStringField;
    CDRelatGerencBacklogDESCRICAO: TStringField;
    CDRelatGerencBacklogVALOR: TStringField;
    CDRelatGerencBacklogDATA1: TStringField;
    CDRelatGerencBacklogDATA2: TStringField;
    CDRelatGerencMTTRDATA1: TStringField;
    CDRelatGerencMTTRDATA2: TStringField;
    CDCadEquipamento: TClientDataSet;
    DSCadEquipamento: TDataSource;
    CDCadEquipamentoDados: TClientDataSet;
    DSCadEquipamentoDados: TDataSource;
    CDCadEquipamentoPecas: TClientDataSet;
    DSCadEquipamentoPecas: TDataSource;
    CDCadEquipamentoEsp: TClientDataSet;
    DSCadEquipamentoEsp: TDataSource;
    CDCadEquipamentoArqTec: TClientDataSet;
    DSCadEquipamentoArqTec: TDataSource;
    CDCadEquipamentoPontosInsp: TClientDataSet;
    DSCadEquipamentoPontosInsp: TDataSource;
    CDCadEquipamentoContadores: TClientDataSet;
    DSCadEquipamentoContadores: TDataSource;
    CDCadEquipamentoDadosR: TClientDataSet;
    DSCadEquipamentoDadosR: TDataSource;
    DSEquipamentosChecaLocal: TDataSource;
    CDEquipamentosChecaLocal: TClientDataSet;
    CDCadEquipamentoArvore: TClientDataSet;
    DSCadEquipamentoArvore: TDataSource;
    CDCadEquipamentoArvoreSec: TClientDataSet;
    DSCadEquipamentoArvoreSec: TDataSource;
    CDCadEquipEmRota: TClientDataSet;
    DSCadEquipEmRota: TDataSource;
    CDCadAlertasOS: TClientDataSet;
    CDCadAlertasManut: TClientDataSet;
    CDCadAlertasLubrific: TClientDataSet;
    CDCadAlertasRota: TClientDataSet;
    CDUsuarioPAcesso: TClientDataSet;
    CDUsuarioPAlteracao: TClientDataSet;
    CDUsuarioPExclusao: TClientDataSet;
    CDUsuarioPInclusao: TClientDataSet;
    CDCadAbastecimentosManutInsp: TClientDataSet;
    DSCadAbastecimentosManutInsp: TDataSource;
    CDManutVencC_DIASATRASO: TIntegerField;
    CDLubrificVencC_DIASATRASO: TIntegerField;
    CDRotaEquipVencC_DIASATRASO: TIntegerField;
    CDCadPneusChassiAtrelamentoStatus: TClientDataSet;
    DSCadPneusChassiAtrelamentoStatus: TDataSource;
    CDCadPneusChassiAtrelamentoRelat: TClientDataSet;
    DSCadPneusChassiAtrelamentoRelat: TDataSource;
    CDCadPecasReposicaoInstEquip: TClientDataSet;
    DSCadPecasReposicaoInstEquip: TDataSource;
    CDOrdemServicoGerenciaCALC_ORIGEM: TStringField;
    CDCadPecasReposicaoHistEquip: TClientDataSet;
    DSCadPecasReposicaoHistEquip: TDataSource;
    CDCadTotalHomemHoraProgExec: TClientDataSet;
    DSCadTotalHomemHoraProgExec: TDataSource;
    CDCadTotalHomemHoraProgExecTOTALHHPROG: TFMTBCDField;
    CDCadTotalHomemHoraProgExecTOTALHHEXEC: TFMTBCDField;
    CDCadPecasReposicaoInstPecas: TClientDataSet;
    DSCadPecasReposicaoInstPecas: TDataSource;
    CDCadDespMensalTaxasPer: TClientDataSet;
    DSCadDespMensalTaxasPer: TDataSource;
    CDCadDespMensalTaxas: TClientDataSet;
    DSCadDespMensalTaxas: TDataSource;
    CDCustosMesMObra: TClientDataSet;
    DSCustosMesMObra: TDataSource;
    CDCustosMesPecas: TClientDataSet;
    DSCustosMesPecas: TDataSource;
    CDCustosMesRecursos: TClientDataSet;
    DSCustosMesRecursos: TDataSource;
    CDCustosMesExtras: TClientDataSet;
    DSCustosMesExtras: TDataSource;
    CDCadPneusChassiPneusConsertos: TClientDataSet;
    DSCadPneusChassiPneusConsertos: TDataSource;
    CDCustosMesPneusNovos: TClientDataSet;
    DSCustosMesPneusNovos: TDataSource;
    CDCustosMesPneusUsados: TClientDataSet;
    DSCustosMesPneusUsados: TDataSource;
    CDCadPneusIDs: TClientDataSet;
    DSCadPneusIDs: TDataSource;
    CDTotalFamilias: TClientDataSet;
    CDRelatGerencDispEquipDISP: TFloatField;
    CDRelatGerencDispEquipTOTALHORASPARADAS: TAggregateField;
    CDRelatGerencDispEquipTOTALHORASFECHADAS: TAggregateField;
    CDCadTotalHomemHoraTOTALHOFICIAIS: TAggregateField;
    CDCustoMesPneus: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    CDCadPneusChassiPosicoesHist: TClientDataSet;
    DSCadPneusChassiPosicoesHist: TDataSource;
    CDCadPneusChassiCusto: TClientDataSet;
    DSCadPneusChassiCusto: TDataSource;
    CDCadPneusChassiIDCusto: TClientDataSet;
    DSCadPneusChassiIDCusto: TDataSource;
    CDCadAbastecimentosCombustAbastCUSTOTOTAL: TAggregateField;
    CDCadAbastecimentosLubrificInsp: TClientDataSet;
    DSCadAbastecimentosLubrificInsp: TDataSource;
    CDUsuariosUnidades: TClientDataSet;
    DSUsuariosUnidades: TDataSource;
    CDCadAbastecimentosLubrificAbastMAX_DATA: TAggregateField;
    CDCadAbastecimentosLubrificAbastMAX_ODOM: TAggregateField;
    CDCadAbastecimentosLubrificAbastCUSTOTOTAL: TAggregateField;
    CDNivelAcessoCODIGO: TStringField;
    CDNivelAcessoCODEMPRESA: TStringField;
    CDNivelAcessoDESCRICAO: TStringField;
    CDNivelAcessoDATACADASTRO: TDateTimeField;
    CDNivelAcessoCODUSUARIOCAD: TStringField;
    CDNivelAcessoDATAULTALT: TDateTimeField;
    CDNivelAcessoCODUSUARIOALT: TStringField;
    CDPermissoesAcessoPadraoCODIGO: TAutoIncField;
    CDPermissoesAcessoPadraoCODNIVELACESSO: TStringField;
    CDPermissoesAcessoPadraoPESSOAL: TStringField;
    CDPermissoesAcessoPadraoCADALMOXARIFADO: TStringField;
    CDPermissoesAcessoPadraoCADAREAS: TStringField;
    CDPermissoesAcessoPadraoCADARQUIVOTECNICO: TStringField;
    CDPermissoesAcessoPadraoCADCALENDARIOOS: TStringField;
    CDPermissoesAcessoPadraoCADCALENDEQUIP: TStringField;
    CDPermissoesAcessoPadraoCADCALENDMOBRA: TStringField;
    CDPermissoesAcessoPadraoCADCARGOS: TStringField;
    CDPermissoesAcessoPadraoCADCAUSASFALHA: TStringField;
    CDPermissoesAcessoPadraoCADCENTROCUSTO: TStringField;
    CDPermissoesAcessoPadraoCADCLASSES: TStringField;
    CDPermissoesAcessoPadraoCADCONFIABILIDADE: TStringField;
    CDPermissoesAcessoPadraoCADCONSULTAS: TStringField;
    CDPermissoesAcessoPadraoCADCONTROLEPNEUS: TStringField;
    CDPermissoesAcessoPadraoCADDISPONIBILIDADE: TStringField;
    CDPermissoesAcessoPadraoCADEQUIPAMENTOS: TStringField;
    CDPermissoesAcessoPadraoCADFABRICANTES: TStringField;
    CDPermissoesAcessoPadraoCADFAMILIAEQUIP: TStringField;
    CDPermissoesAcessoPadraoCADFAMILIAPECASREP: TStringField;
    CDPermissoesAcessoPadraoCADFAMILIARECURSOS: TStringField;
    CDPermissoesAcessoPadraoCADFECHAMANUT: TStringField;
    CDPermissoesAcessoPadraoCADFERIADOS: TStringField;
    CDPermissoesAcessoPadraoCADFORMATOCODIGO: TStringField;
    CDPermissoesAcessoPadraoCADFORNECEDORES: TStringField;
    CDPermissoesAcessoPadraoCADFUNCIONARIOS: TStringField;
    CDPermissoesAcessoPadraoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesAcessoPadraoCADHISTORICOEQUIP: TStringField;
    CDPermissoesAcessoPadraoCADIMANGENS: TStringField;
    CDPermissoesAcessoPadraoCADINDDESEMPENHO: TStringField;
    CDPermissoesAcessoPadraoCADINFMENSAIS: TStringField;
    CDPermissoesAcessoPadraoCADLUBRIFICANTES: TStringField;
    CDPermissoesAcessoPadraoCADLUBRIFICPROG: TStringField;
    CDPermissoesAcessoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesAcessoPadraoCADMANUTENCAO: TStringField;
    CDPermissoesAcessoPadraoCADMANUTPROG: TStringField;
    CDPermissoesAcessoPadraoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesAcessoPadraoCADMAODEOBRAESP: TStringField;
    CDPermissoesAcessoPadraoCADMONITORAMENTO: TStringField;
    CDPermissoesAcessoPadraoCADMOTIVOPARADA: TStringField;
    CDPermissoesAcessoPadraoCADNAVEGACAO: TStringField;
    CDPermissoesAcessoPadraoCADOFICINAS: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICO: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesAcessoPadraoCADPECASREP: TStringField;
    CDPermissoesAcessoPadraoCADPECASREPINST: TStringField;
    CDPermissoesAcessoPadraoCADPECASREPKIT: TStringField;
    CDPermissoesAcessoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesAcessoPadraoCADPERMISSOES: TStringField;
    CDPermissoesAcessoPadraoCADPLANOTRAB: TStringField;
    CDPermissoesAcessoPadraoCADPONTOSINSPECAO: TStringField;
    CDPermissoesAcessoPadraoCADRECURSOS: TStringField;
    CDPermissoesAcessoPadraoCADRECURSOSKIT: TStringField;
    CDPermissoesAcessoPadraoCADRELATINSP: TStringField;
    CDPermissoesAcessoPadraoCADRELATORIOS: TStringField;
    CDPermissoesAcessoPadraoCADRESERVA: TStringField;
    CDPermissoesAcessoPadraoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesAcessoPadraoCADTERCEIRIZADAS: TStringField;
    CDPermissoesAcessoPadraoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesAcessoPadraoCADUSUARIOS: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesAcessoPadraoCADFERRAMENTARIA: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesAcessoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesExclusaoPadraoCODIGO: TAutoIncField;
    CDPermissoesExclusaoPadraoCODNIVELACESSO: TStringField;
    CDPermissoesExclusaoPadraoPESSOAL: TStringField;
    CDPermissoesExclusaoPadraoCADALMOXARIFADO: TStringField;
    CDPermissoesExclusaoPadraoCADAREAS: TStringField;
    CDPermissoesExclusaoPadraoCADARQUIVOTECNICO: TStringField;
    CDPermissoesExclusaoPadraoCADCALENDARIOOS: TStringField;
    CDPermissoesExclusaoPadraoCADCALENDEQUIP: TStringField;
    CDPermissoesExclusaoPadraoCADCALENDMOBRA: TStringField;
    CDPermissoesExclusaoPadraoCADCARGOS: TStringField;
    CDPermissoesExclusaoPadraoCADCAUSASFALHA: TStringField;
    CDPermissoesExclusaoPadraoCADCENTROCUSTO: TStringField;
    CDPermissoesExclusaoPadraoCADCLASSES: TStringField;
    CDPermissoesExclusaoPadraoCADCONFIABILIDADE: TStringField;
    CDPermissoesExclusaoPadraoCADCONSULTAS: TStringField;
    CDPermissoesExclusaoPadraoCADCONTROLEPNEUS: TStringField;
    CDPermissoesExclusaoPadraoCADDISPONIBILIDADE: TStringField;
    CDPermissoesExclusaoPadraoCADEQUIPAMENTOS: TStringField;
    CDPermissoesExclusaoPadraoCADFABRICANTES: TStringField;
    CDPermissoesExclusaoPadraoCADFAMILIAEQUIP: TStringField;
    CDPermissoesExclusaoPadraoCADFAMILIAPECASREP: TStringField;
    CDPermissoesExclusaoPadraoCADFAMILIARECURSOS: TStringField;
    CDPermissoesExclusaoPadraoCADFECHAMANUT: TStringField;
    CDPermissoesExclusaoPadraoCADFERIADOS: TStringField;
    CDPermissoesExclusaoPadraoCADFORMATOCODIGO: TStringField;
    CDPermissoesExclusaoPadraoCADFORNECEDORES: TStringField;
    CDPermissoesExclusaoPadraoCADFUNCIONARIOS: TStringField;
    CDPermissoesExclusaoPadraoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesExclusaoPadraoCADHISTORICOEQUIP: TStringField;
    CDPermissoesExclusaoPadraoCADIMANGENS: TStringField;
    CDPermissoesExclusaoPadraoCADINDDESEMPENHO: TStringField;
    CDPermissoesExclusaoPadraoCADINFMENSAIS: TStringField;
    CDPermissoesExclusaoPadraoCADLUBRIFICANTES: TStringField;
    CDPermissoesExclusaoPadraoCADLUBRIFICPROG: TStringField;
    CDPermissoesExclusaoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesExclusaoPadraoCADMANUTENCAO: TStringField;
    CDPermissoesExclusaoPadraoCADMANUTPROG: TStringField;
    CDPermissoesExclusaoPadraoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesExclusaoPadraoCADMAODEOBRAESP: TStringField;
    CDPermissoesExclusaoPadraoCADMONITORAMENTO: TStringField;
    CDPermissoesExclusaoPadraoCADMOTIVOPARADA: TStringField;
    CDPermissoesExclusaoPadraoCADNAVEGACAO: TStringField;
    CDPermissoesExclusaoPadraoCADOFICINAS: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICO: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesExclusaoPadraoCADPECASREP: TStringField;
    CDPermissoesExclusaoPadraoCADPECASREPINST: TStringField;
    CDPermissoesExclusaoPadraoCADPECASREPKIT: TStringField;
    CDPermissoesExclusaoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesExclusaoPadraoCADPERMISSOES: TStringField;
    CDPermissoesExclusaoPadraoCADPLANOTRAB: TStringField;
    CDPermissoesExclusaoPadraoCADPONTOSINSPECAO: TStringField;
    CDPermissoesExclusaoPadraoCADRECURSOS: TStringField;
    CDPermissoesExclusaoPadraoCADRECURSOSKIT: TStringField;
    CDPermissoesExclusaoPadraoCADRELATINSP: TStringField;
    CDPermissoesExclusaoPadraoCADRELATORIOS: TStringField;
    CDPermissoesExclusaoPadraoCADRESERVA: TStringField;
    CDPermissoesExclusaoPadraoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesExclusaoPadraoCADTERCEIRIZADAS: TStringField;
    CDPermissoesExclusaoPadraoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesExclusaoPadraoCADUSUARIOS: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesExclusaoPadraoCADFERRAMENTARIA: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesExclusaoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesInclusaoPadraoCODIGO: TAutoIncField;
    CDPermissoesInclusaoPadraoCODNIVELACESSO: TStringField;
    CDPermissoesInclusaoPadraoPESSOAL: TStringField;
    CDPermissoesInclusaoPadraoCADALMOXARIFADO: TStringField;
    CDPermissoesInclusaoPadraoCADAREAS: TStringField;
    CDPermissoesInclusaoPadraoCADARQUIVOTECNICO: TStringField;
    CDPermissoesInclusaoPadraoCADCALENDARIOOS: TStringField;
    CDPermissoesInclusaoPadraoCADCALENDEQUIP: TStringField;
    CDPermissoesInclusaoPadraoCADCALENDMOBRA: TStringField;
    CDPermissoesInclusaoPadraoCADCARGOS: TStringField;
    CDPermissoesInclusaoPadraoCADCAUSASFALHA: TStringField;
    CDPermissoesInclusaoPadraoCADCENTROCUSTO: TStringField;
    CDPermissoesInclusaoPadraoCADCLASSES: TStringField;
    CDPermissoesInclusaoPadraoCADCONFIABILIDADE: TStringField;
    CDPermissoesInclusaoPadraoCADCONSULTAS: TStringField;
    CDPermissoesInclusaoPadraoCADCONTROLEPNEUS: TStringField;
    CDPermissoesInclusaoPadraoCADDISPONIBILIDADE: TStringField;
    CDPermissoesInclusaoPadraoCADEQUIPAMENTOS: TStringField;
    CDPermissoesInclusaoPadraoCADFABRICANTES: TStringField;
    CDPermissoesInclusaoPadraoCADFAMILIAEQUIP: TStringField;
    CDPermissoesInclusaoPadraoCADFAMILIAPECASREP: TStringField;
    CDPermissoesInclusaoPadraoCADFAMILIARECURSOS: TStringField;
    CDPermissoesInclusaoPadraoCADFECHAMANUT: TStringField;
    CDPermissoesInclusaoPadraoCADFERIADOS: TStringField;
    CDPermissoesInclusaoPadraoCADFORMATOCODIGO: TStringField;
    CDPermissoesInclusaoPadraoCADFORNECEDORES: TStringField;
    CDPermissoesInclusaoPadraoCADFUNCIONARIOS: TStringField;
    CDPermissoesInclusaoPadraoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesInclusaoPadraoCADHISTORICOEQUIP: TStringField;
    CDPermissoesInclusaoPadraoCADIMANGENS: TStringField;
    CDPermissoesInclusaoPadraoCADINDDESEMPENHO: TStringField;
    CDPermissoesInclusaoPadraoCADINFMENSAIS: TStringField;
    CDPermissoesInclusaoPadraoCADLUBRIFICANTES: TStringField;
    CDPermissoesInclusaoPadraoCADLUBRIFICPROG: TStringField;
    CDPermissoesInclusaoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesInclusaoPadraoCADMANUTENCAO: TStringField;
    CDPermissoesInclusaoPadraoCADMANUTPROG: TStringField;
    CDPermissoesInclusaoPadraoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesInclusaoPadraoCADMAODEOBRAESP: TStringField;
    CDPermissoesInclusaoPadraoCADMONITORAMENTO: TStringField;
    CDPermissoesInclusaoPadraoCADMOTIVOPARADA: TStringField;
    CDPermissoesInclusaoPadraoCADNAVEGACAO: TStringField;
    CDPermissoesInclusaoPadraoCADOFICINAS: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICO: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesInclusaoPadraoCADPECASREP: TStringField;
    CDPermissoesInclusaoPadraoCADPECASREPINST: TStringField;
    CDPermissoesInclusaoPadraoCADPECASREPKIT: TStringField;
    CDPermissoesInclusaoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesInclusaoPadraoCADPERMISSOES: TStringField;
    CDPermissoesInclusaoPadraoCADPLANOTRAB: TStringField;
    CDPermissoesInclusaoPadraoCADPONTOSINSPECAO: TStringField;
    CDPermissoesInclusaoPadraoCADRECURSOS: TStringField;
    CDPermissoesInclusaoPadraoCADRECURSOSKIT: TStringField;
    CDPermissoesInclusaoPadraoCADRELATINSP: TStringField;
    CDPermissoesInclusaoPadraoCADRELATORIOS: TStringField;
    CDPermissoesInclusaoPadraoCADRESERVA: TStringField;
    CDPermissoesInclusaoPadraoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesInclusaoPadraoCADTERCEIRIZADAS: TStringField;
    CDPermissoesInclusaoPadraoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesInclusaoPadraoCADUSUARIOS: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesInclusaoPadraoCADFERRAMENTARIA: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesInclusaoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesAlteraracaoPadraoCODIGO: TAutoIncField;
    CDPermissoesAlteraracaoPadraoCODNIVELACESSO: TStringField;
    CDPermissoesAlteraracaoPadraoPESSOAL: TStringField;
    CDPermissoesAlteraracaoPadraoCADALMOXARIFADO: TStringField;
    CDPermissoesAlteraracaoPadraoCADAREAS: TStringField;
    CDPermissoesAlteraracaoPadraoCADARQUIVOTECNICO: TStringField;
    CDPermissoesAlteraracaoPadraoCADCALENDARIOOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADCALENDEQUIP: TStringField;
    CDPermissoesAlteraracaoPadraoCADCALENDMOBRA: TStringField;
    CDPermissoesAlteraracaoPadraoCADCARGOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADCAUSASFALHA: TStringField;
    CDPermissoesAlteraracaoPadraoCADCENTROCUSTO: TStringField;
    CDPermissoesAlteraracaoPadraoCADCLASSES: TStringField;
    CDPermissoesAlteraracaoPadraoCADCONFIABILIDADE: TStringField;
    CDPermissoesAlteraracaoPadraoCADCONSULTAS: TStringField;
    CDPermissoesAlteraracaoPadraoCADCONTROLEPNEUS: TStringField;
    CDPermissoesAlteraracaoPadraoCADDISPONIBILIDADE: TStringField;
    CDPermissoesAlteraracaoPadraoCADEQUIPAMENTOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADFABRICANTES: TStringField;
    CDPermissoesAlteraracaoPadraoCADFAMILIAEQUIP: TStringField;
    CDPermissoesAlteraracaoPadraoCADFAMILIAPECASREP: TStringField;
    CDPermissoesAlteraracaoPadraoCADFAMILIARECURSOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADFECHAMANUT: TStringField;
    CDPermissoesAlteraracaoPadraoCADFERIADOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADFORMATOCODIGO: TStringField;
    CDPermissoesAlteraracaoPadraoCADFORNECEDORES: TStringField;
    CDPermissoesAlteraracaoPadraoCADFUNCIONARIOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesAlteraracaoPadraoCADHISTORICOEQUIP: TStringField;
    CDPermissoesAlteraracaoPadraoCADIMANGENS: TStringField;
    CDPermissoesAlteraracaoPadraoCADINDDESEMPENHO: TStringField;
    CDPermissoesAlteraracaoPadraoCADINFMENSAIS: TStringField;
    CDPermissoesAlteraracaoPadraoCADLUBRIFICANTES: TStringField;
    CDPermissoesAlteraracaoPadraoCADLUBRIFICPROG: TStringField;
    CDPermissoesAlteraracaoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesAlteraracaoPadraoCADMANUTENCAO: TStringField;
    CDPermissoesAlteraracaoPadraoCADMANUTPROG: TStringField;
    CDPermissoesAlteraracaoPadraoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesAlteraracaoPadraoCADMAODEOBRAESP: TStringField;
    CDPermissoesAlteraracaoPadraoCADMONITORAMENTO: TStringField;
    CDPermissoesAlteraracaoPadraoCADMOTIVOPARADA: TStringField;
    CDPermissoesAlteraracaoPadraoCADNAVEGACAO: TStringField;
    CDPermissoesAlteraracaoPadraoCADOFICINAS: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICO: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesAlteraracaoPadraoCADPECASREP: TStringField;
    CDPermissoesAlteraracaoPadraoCADPECASREPINST: TStringField;
    CDPermissoesAlteraracaoPadraoCADPECASREPKIT: TStringField;
    CDPermissoesAlteraracaoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesAlteraracaoPadraoCADPERMISSOES: TStringField;
    CDPermissoesAlteraracaoPadraoCADPLANOTRAB: TStringField;
    CDPermissoesAlteraracaoPadraoCADPONTOSINSPECAO: TStringField;
    CDPermissoesAlteraracaoPadraoCADRECURSOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADRECURSOSKIT: TStringField;
    CDPermissoesAlteraracaoPadraoCADRELATINSP: TStringField;
    CDPermissoesAlteraracaoPadraoCADRELATORIOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADRESERVA: TStringField;
    CDPermissoesAlteraracaoPadraoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesAlteraracaoPadraoCADTERCEIRIZADAS: TStringField;
    CDPermissoesAlteraracaoPadraoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesAlteraracaoPadraoCADUSUARIOS: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesAlteraracaoPadraoCADFERRAMENTARIA: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesAlteraracaoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesAcessoCODIGO: TAutoIncField;
    CDPermissoesAcessoCODNIVELACESSO: TStringField;
    CDPermissoesAcessoPESSOAL: TStringField;
    CDPermissoesAcessoCADALMOXARIFADO: TStringField;
    CDPermissoesAcessoCADAREAS: TStringField;
    CDPermissoesAcessoCADARQUIVOTECNICO: TStringField;
    CDPermissoesAcessoCADCALENDARIOOS: TStringField;
    CDPermissoesAcessoCADCALENDEQUIP: TStringField;
    CDPermissoesAcessoCADCALENDMOBRA: TStringField;
    CDPermissoesAcessoCADCARGOS: TStringField;
    CDPermissoesAcessoCADCAUSASFALHA: TStringField;
    CDPermissoesAcessoCADCENTROCUSTO: TStringField;
    CDPermissoesAcessoCADCLASSES: TStringField;
    CDPermissoesAcessoCADCONFIABILIDADE: TStringField;
    CDPermissoesAcessoCADCONSULTAS: TStringField;
    CDPermissoesAcessoCADCONTROLEPNEUS: TStringField;
    CDPermissoesAcessoCADDISPONIBILIDADE: TStringField;
    CDPermissoesAcessoCADEQUIPAMENTOS: TStringField;
    CDPermissoesAcessoCADFABRICANTES: TStringField;
    CDPermissoesAcessoCADFAMILIAEQUIP: TStringField;
    CDPermissoesAcessoCADFAMILIAPECASREP: TStringField;
    CDPermissoesAcessoCADFAMILIARECURSOS: TStringField;
    CDPermissoesAcessoCADFECHAMANUT: TStringField;
    CDPermissoesAcessoCADFERIADOS: TStringField;
    CDPermissoesAcessoCADFORMATOCODIGO: TStringField;
    CDPermissoesAcessoCADFORNECEDORES: TStringField;
    CDPermissoesAcessoCADFUNCIONARIOS: TStringField;
    CDPermissoesAcessoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesAcessoCADHISTORICOEQUIP: TStringField;
    CDPermissoesAcessoCADIMANGENS: TStringField;
    CDPermissoesAcessoCADINDDESEMPENHO: TStringField;
    CDPermissoesAcessoCADINFMENSAIS: TStringField;
    CDPermissoesAcessoCADLUBRIFICANTES: TStringField;
    CDPermissoesAcessoCADLUBRIFICPROG: TStringField;
    CDPermissoesAcessoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesAcessoCADMANUTENCAO: TStringField;
    CDPermissoesAcessoCADMANUTPROG: TStringField;
    CDPermissoesAcessoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesAcessoCADMAODEOBRAESP: TStringField;
    CDPermissoesAcessoCADMONITORAMENTO: TStringField;
    CDPermissoesAcessoCADMOTIVOPARADA: TStringField;
    CDPermissoesAcessoCADNAVEGACAO: TStringField;
    CDPermissoesAcessoCADOFICINAS: TStringField;
    CDPermissoesAcessoCADORDEMSERVICO: TStringField;
    CDPermissoesAcessoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesAcessoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesAcessoCADPECASREP: TStringField;
    CDPermissoesAcessoCADPECASREPINST: TStringField;
    CDPermissoesAcessoCADPECASREPKIT: TStringField;
    CDPermissoesAcessoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesAcessoCADPERMISSOES: TStringField;
    CDPermissoesAcessoCADPLANOTRAB: TStringField;
    CDPermissoesAcessoCADPONTOSINSPECAO: TStringField;
    CDPermissoesAcessoCADRECURSOS: TStringField;
    CDPermissoesAcessoCADRECURSOSKIT: TStringField;
    CDPermissoesAcessoCADRELATINSP: TStringField;
    CDPermissoesAcessoCADRELATORIOS: TStringField;
    CDPermissoesAcessoCADRESERVA: TStringField;
    CDPermissoesAcessoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesAcessoCADTERCEIRIZADAS: TStringField;
    CDPermissoesAcessoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesAcessoCADUSUARIOS: TStringField;
    CDPermissoesAcessoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesAcessoCADFERRAMENTARIA: TStringField;
    CDPermissoesAcessoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesAcessoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesAcessoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesAcessoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesAcessoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesAcessoNOME: TStringField;
    CDPermissoesAcessoCODUSUARIO: TStringField;
    CDPermissoesAcessoMATRICULA: TStringField;
    CDPermissoesAcessoNIVELACESSO: TStringField;
    CDPermissoesAlteraracaoCODIGO: TAutoIncField;
    CDPermissoesAlteraracaoCODNIVELACESSO: TStringField;
    CDPermissoesAlteraracaoPESSOAL: TStringField;
    CDPermissoesAlteraracaoCADALMOXARIFADO: TStringField;
    CDPermissoesAlteraracaoCADAREAS: TStringField;
    CDPermissoesAlteraracaoCADARQUIVOTECNICO: TStringField;
    CDPermissoesAlteraracaoCADCALENDARIOOS: TStringField;
    CDPermissoesAlteraracaoCADCALENDEQUIP: TStringField;
    CDPermissoesAlteraracaoCADCALENDMOBRA: TStringField;
    CDPermissoesAlteraracaoCADCARGOS: TStringField;
    CDPermissoesAlteraracaoCADCAUSASFALHA: TStringField;
    CDPermissoesAlteraracaoCADCENTROCUSTO: TStringField;
    CDPermissoesAlteraracaoCADCLASSES: TStringField;
    CDPermissoesAlteraracaoCADCONFIABILIDADE: TStringField;
    CDPermissoesAlteraracaoCADCONSULTAS: TStringField;
    CDPermissoesAlteraracaoCADCONTROLEPNEUS: TStringField;
    CDPermissoesAlteraracaoCADDISPONIBILIDADE: TStringField;
    CDPermissoesAlteraracaoCADEQUIPAMENTOS: TStringField;
    CDPermissoesAlteraracaoCADFABRICANTES: TStringField;
    CDPermissoesAlteraracaoCADFAMILIAEQUIP: TStringField;
    CDPermissoesAlteraracaoCADFAMILIAPECASREP: TStringField;
    CDPermissoesAlteraracaoCADFAMILIARECURSOS: TStringField;
    CDPermissoesAlteraracaoCADFECHAMANUT: TStringField;
    CDPermissoesAlteraracaoCADFERIADOS: TStringField;
    CDPermissoesAlteraracaoCADFORMATOCODIGO: TStringField;
    CDPermissoesAlteraracaoCADFORNECEDORES: TStringField;
    CDPermissoesAlteraracaoCADFUNCIONARIOS: TStringField;
    CDPermissoesAlteraracaoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesAlteraracaoCADHISTORICOEQUIP: TStringField;
    CDPermissoesAlteraracaoCADIMANGENS: TStringField;
    CDPermissoesAlteraracaoCADINDDESEMPENHO: TStringField;
    CDPermissoesAlteraracaoCADINFMENSAIS: TStringField;
    CDPermissoesAlteraracaoCADLUBRIFICANTES: TStringField;
    CDPermissoesAlteraracaoCADLUBRIFICPROG: TStringField;
    CDPermissoesAlteraracaoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesAlteraracaoCADMANUTENCAO: TStringField;
    CDPermissoesAlteraracaoCADMANUTPROG: TStringField;
    CDPermissoesAlteraracaoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesAlteraracaoCADMAODEOBRAESP: TStringField;
    CDPermissoesAlteraracaoCADMONITORAMENTO: TStringField;
    CDPermissoesAlteraracaoCADMOTIVOPARADA: TStringField;
    CDPermissoesAlteraracaoCADNAVEGACAO: TStringField;
    CDPermissoesAlteraracaoCADOFICINAS: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICO: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesAlteraracaoCADPECASREP: TStringField;
    CDPermissoesAlteraracaoCADPECASREPINST: TStringField;
    CDPermissoesAlteraracaoCADPECASREPKIT: TStringField;
    CDPermissoesAlteraracaoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesAlteraracaoCADPERMISSOES: TStringField;
    CDPermissoesAlteraracaoCADPLANOTRAB: TStringField;
    CDPermissoesAlteraracaoCADPONTOSINSPECAO: TStringField;
    CDPermissoesAlteraracaoCADRECURSOS: TStringField;
    CDPermissoesAlteraracaoCADRECURSOSKIT: TStringField;
    CDPermissoesAlteraracaoCADRELATINSP: TStringField;
    CDPermissoesAlteraracaoCADRELATORIOS: TStringField;
    CDPermissoesAlteraracaoCADRESERVA: TStringField;
    CDPermissoesAlteraracaoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesAlteraracaoCADTERCEIRIZADAS: TStringField;
    CDPermissoesAlteraracaoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesAlteraracaoCADUSUARIOS: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesAlteraracaoCADFERRAMENTARIA: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesAlteraracaoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesAlteraracaoCODUSUARIO: TStringField;
    CDPermissoesAlteraracaoMATRICULA: TStringField;
    CDPermissoesAlteraracaoNOME: TStringField;
    CDPermissoesAlteraracaoNIVELACESSO: TStringField;
    CDPermissoesExclusaoCODIGO: TAutoIncField;
    CDPermissoesExclusaoCODNIVELACESSO: TStringField;
    CDPermissoesExclusaoPESSOAL: TStringField;
    CDPermissoesExclusaoCADALMOXARIFADO: TStringField;
    CDPermissoesExclusaoCADAREAS: TStringField;
    CDPermissoesExclusaoCADARQUIVOTECNICO: TStringField;
    CDPermissoesExclusaoCADCALENDARIOOS: TStringField;
    CDPermissoesExclusaoCADCALENDEQUIP: TStringField;
    CDPermissoesExclusaoCADCALENDMOBRA: TStringField;
    CDPermissoesExclusaoCADCARGOS: TStringField;
    CDPermissoesExclusaoCADCAUSASFALHA: TStringField;
    CDPermissoesExclusaoCADCENTROCUSTO: TStringField;
    CDPermissoesExclusaoCADCLASSES: TStringField;
    CDPermissoesExclusaoCADCONFIABILIDADE: TStringField;
    CDPermissoesExclusaoCADCONSULTAS: TStringField;
    CDPermissoesExclusaoCADCONTROLEPNEUS: TStringField;
    CDPermissoesExclusaoCADDISPONIBILIDADE: TStringField;
    CDPermissoesExclusaoCADEQUIPAMENTOS: TStringField;
    CDPermissoesExclusaoCADFABRICANTES: TStringField;
    CDPermissoesExclusaoCADFAMILIAEQUIP: TStringField;
    CDPermissoesExclusaoCADFAMILIAPECASREP: TStringField;
    CDPermissoesExclusaoCADFAMILIARECURSOS: TStringField;
    CDPermissoesExclusaoCADFECHAMANUT: TStringField;
    CDPermissoesExclusaoCADFERIADOS: TStringField;
    CDPermissoesExclusaoCADFORMATOCODIGO: TStringField;
    CDPermissoesExclusaoCADFORNECEDORES: TStringField;
    CDPermissoesExclusaoCADFUNCIONARIOS: TStringField;
    CDPermissoesExclusaoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesExclusaoCADHISTORICOEQUIP: TStringField;
    CDPermissoesExclusaoCADIMANGENS: TStringField;
    CDPermissoesExclusaoCADINDDESEMPENHO: TStringField;
    CDPermissoesExclusaoCADINFMENSAIS: TStringField;
    CDPermissoesExclusaoCADLUBRIFICANTES: TStringField;
    CDPermissoesExclusaoCADLUBRIFICPROG: TStringField;
    CDPermissoesExclusaoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesExclusaoCADMANUTENCAO: TStringField;
    CDPermissoesExclusaoCADMANUTPROG: TStringField;
    CDPermissoesExclusaoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesExclusaoCADMAODEOBRAESP: TStringField;
    CDPermissoesExclusaoCADMONITORAMENTO: TStringField;
    CDPermissoesExclusaoCADMOTIVOPARADA: TStringField;
    CDPermissoesExclusaoCADNAVEGACAO: TStringField;
    CDPermissoesExclusaoCADOFICINAS: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICO: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesExclusaoCADPECASREP: TStringField;
    CDPermissoesExclusaoCADPECASREPINST: TStringField;
    CDPermissoesExclusaoCADPECASREPKIT: TStringField;
    CDPermissoesExclusaoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesExclusaoCADPERMISSOES: TStringField;
    CDPermissoesExclusaoCADPLANOTRAB: TStringField;
    CDPermissoesExclusaoCADPONTOSINSPECAO: TStringField;
    CDPermissoesExclusaoCADRECURSOS: TStringField;
    CDPermissoesExclusaoCADRECURSOSKIT: TStringField;
    CDPermissoesExclusaoCADRELATINSP: TStringField;
    CDPermissoesExclusaoCADRELATORIOS: TStringField;
    CDPermissoesExclusaoCADRESERVA: TStringField;
    CDPermissoesExclusaoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesExclusaoCADTERCEIRIZADAS: TStringField;
    CDPermissoesExclusaoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesExclusaoCADUSUARIOS: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesExclusaoCADFERRAMENTARIA: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesExclusaoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesExclusaoCODUSUARIO: TStringField;
    CDPermissoesExclusaoMATRICULA: TStringField;
    CDPermissoesExclusaoNOME: TStringField;
    CDPermissoesExclusaoNIVELACESSO: TStringField;
    CDPermissoesInclusaoCODIGO: TAutoIncField;
    CDPermissoesInclusaoCODNIVELACESSO: TStringField;
    CDPermissoesInclusaoPESSOAL: TStringField;
    CDPermissoesInclusaoCADALMOXARIFADO: TStringField;
    CDPermissoesInclusaoCADAREAS: TStringField;
    CDPermissoesInclusaoCADARQUIVOTECNICO: TStringField;
    CDPermissoesInclusaoCADCALENDARIOOS: TStringField;
    CDPermissoesInclusaoCADCALENDEQUIP: TStringField;
    CDPermissoesInclusaoCADCALENDMOBRA: TStringField;
    CDPermissoesInclusaoCADCARGOS: TStringField;
    CDPermissoesInclusaoCADCAUSASFALHA: TStringField;
    CDPermissoesInclusaoCADCENTROCUSTO: TStringField;
    CDPermissoesInclusaoCADCLASSES: TStringField;
    CDPermissoesInclusaoCADCONFIABILIDADE: TStringField;
    CDPermissoesInclusaoCADCONSULTAS: TStringField;
    CDPermissoesInclusaoCADCONTROLEPNEUS: TStringField;
    CDPermissoesInclusaoCADDISPONIBILIDADE: TStringField;
    CDPermissoesInclusaoCADEQUIPAMENTOS: TStringField;
    CDPermissoesInclusaoCADFABRICANTES: TStringField;
    CDPermissoesInclusaoCADFAMILIAEQUIP: TStringField;
    CDPermissoesInclusaoCADFAMILIAPECASREP: TStringField;
    CDPermissoesInclusaoCADFAMILIARECURSOS: TStringField;
    CDPermissoesInclusaoCADFECHAMANUT: TStringField;
    CDPermissoesInclusaoCADFERIADOS: TStringField;
    CDPermissoesInclusaoCADFORMATOCODIGO: TStringField;
    CDPermissoesInclusaoCADFORNECEDORES: TStringField;
    CDPermissoesInclusaoCADFUNCIONARIOS: TStringField;
    CDPermissoesInclusaoCADGRUPOINDUSTRIAL: TStringField;
    CDPermissoesInclusaoCADHISTORICOEQUIP: TStringField;
    CDPermissoesInclusaoCADIMANGENS: TStringField;
    CDPermissoesInclusaoCADINDDESEMPENHO: TStringField;
    CDPermissoesInclusaoCADINFMENSAIS: TStringField;
    CDPermissoesInclusaoCADLUBRIFICANTES: TStringField;
    CDPermissoesInclusaoCADLUBRIFICPROG: TStringField;
    CDPermissoesInclusaoCADLUBRIFICPROGEQUIP: TStringField;
    CDPermissoesInclusaoCADMANUTENCAO: TStringField;
    CDPermissoesInclusaoCADMANUTPROG: TStringField;
    CDPermissoesInclusaoCADMANUTPROGEQUIP: TStringField;
    CDPermissoesInclusaoCADMAODEOBRAESP: TStringField;
    CDPermissoesInclusaoCADMONITORAMENTO: TStringField;
    CDPermissoesInclusaoCADMOTIVOPARADA: TStringField;
    CDPermissoesInclusaoCADNAVEGACAO: TStringField;
    CDPermissoesInclusaoCADOFICINAS: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICO: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICOHIST: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDPermissoesInclusaoCADPECASREP: TStringField;
    CDPermissoesInclusaoCADPECASREPINST: TStringField;
    CDPermissoesInclusaoCADPECASREPKIT: TStringField;
    CDPermissoesInclusaoCADPECASREPOSICAOEQUIP: TStringField;
    CDPermissoesInclusaoCADPERMISSOES: TStringField;
    CDPermissoesInclusaoCADPLANOTRAB: TStringField;
    CDPermissoesInclusaoCADPONTOSINSPECAO: TStringField;
    CDPermissoesInclusaoCADRECURSOS: TStringField;
    CDPermissoesInclusaoCADRECURSOSKIT: TStringField;
    CDPermissoesInclusaoCADRELATINSP: TStringField;
    CDPermissoesInclusaoCADRELATORIOS: TStringField;
    CDPermissoesInclusaoCADRESERVA: TStringField;
    CDPermissoesInclusaoCADSOLICITACAOTRAB: TStringField;
    CDPermissoesInclusaoCADTERCEIRIZADAS: TStringField;
    CDPermissoesInclusaoCADTIPOPROGRAMACAO: TStringField;
    CDPermissoesInclusaoCADUSUARIOS: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICOFECHAR: TStringField;
    CDPermissoesInclusaoCADFERRAMENTARIA: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICOPARALISAR: TStringField;
    CDPermissoesInclusaoCADORDEMSERVICOLIBERAR: TStringField;
    CDPermissoesInclusaoCODUSUARIO: TStringField;
    CDPermissoesInclusaoMATRICULA: TStringField;
    CDPermissoesInclusaoNOME: TStringField;
    CDPermissoesInclusaoNIVELACESSO: TStringField;
    CDCadTotalHomemHoraMATRICULA: TStringField;
    CDCadTotalHomemHoraCODEMPRESA: TStringField;
    CDCadTotalHomemHoraNOME: TStringField;
    CDCadTotalHomemHoraCODCALENDARIO: TStringField;
    CDCadTotalHomemHoraDESCCALENDARIO: TStringField;
    CDCadTotalHomemHoraHOFICIAIS: TIntegerField;
    CDCadTotalHomemHoraCODCARGO: TStringField;
    CDCadTotalHomemHoraDESCCARGO: TStringField;
    CDCadTotalHomemHoraSeqHoraCODIGO: TAutoIncField;
    CDCadTotalHomemHoraSeqHoraCODEMPRESA: TStringField;
    CDCadTotalHomemHoraSeqHoraCODCALENDARIO: TStringField;
    CDCadTotalHomemHoraSeqHoraCALENDARIO: TStringField;
    CDCadTotalHomemHoraSeqHoraSEQUENCIA: TIntegerField;
    CDCadTotalHomemHoraSeqHoraHORAINI1: TTimeField;
    CDCadTotalHomemHoraSeqHoraHORAFIN1: TTimeField;
    CDCadTotalHomemHoraSeqHoraHHDISP1: TLargeintField;
    CDCadTotalHomemHoraSeqHoraHORAINI2: TTimeField;
    CDCadTotalHomemHoraSeqHoraHORAFIN2: TTimeField;
    CDCadTotalHomemHoraSeqHoraHHDISP2: TLargeintField;
    CDCadTotalHomemHoraSeqHoraHORAINI3: TTimeField;
    CDCadTotalHomemHoraSeqHoraHORAFIN3: TTimeField;
    CDCadTotalHomemHoraSeqHoraHHDISP3: TLargeintField;
    CDCadTotalHomemHoraSeqHoraHORAINI4: TTimeField;
    CDCadTotalHomemHoraSeqHoraHORAFIN4: TTimeField;
    CDCadTotalHomemHoraSeqHoraHHDISP4: TLargeintField;
    CDCadTotalEquipHoraCODIGO: TStringField;
    CDCadTotalEquipHoraCODEMPRESA: TStringField;
    CDCadTotalEquipHoraDESCRICAO: TStringField;
    CDCadTotalEquipHoraCODCALENDARIO: TStringField;
    CDCadTotalEquipHoraCALENDARIOEQUIP: TStringField;
    CDCadTotalEquipHoraHOFICIAIS: TIntegerField;
    CDCadTotalEquipSeqHoraCODIGO: TAutoIncField;
    CDCadTotalEquipSeqHoraCODEMPRESA: TStringField;
    CDCadTotalEquipSeqHoraCODCALENDARIOEQUIP: TStringField;
    CDCadTotalEquipSeqHoraCALENDARIO: TStringField;
    CDCadTotalEquipSeqHoraSEQUENCIA: TIntegerField;
    CDCadTotalEquipSeqHoraHORAINI1: TTimeField;
    CDCadTotalEquipSeqHoraHORAFIN1: TTimeField;
    CDCadTotalEquipSeqHoraHHDISP1: TLargeintField;
    CDCadTotalEquipSeqHoraHORAINI2: TTimeField;
    CDCadTotalEquipSeqHoraHORAFIN2: TTimeField;
    CDCadTotalEquipSeqHoraHHDISP2: TLargeintField;
    CDCadTotalEquipSeqHoraHORAINI3: TTimeField;
    CDCadTotalEquipSeqHoraHORAFIN3: TTimeField;
    CDCadTotalEquipSeqHoraHHDISP3: TLargeintField;
    CDCadTotalEquipSeqHoraHORAINI4: TTimeField;
    CDCadTotalEquipSeqHoraHORAFIN4: TTimeField;
    CDCadTotalEquipSeqHoraHHDISP4: TLargeintField;
    CDUsuarioCODIGO: TStringField;
    CDUsuarioCODEMPRESA: TStringField;
    CDUsuarioCODGRUPO: TIntegerField;
    CDUsuarioCODEMPRESAS: TAutoIncField;
    CDUsuarioMATRICULA: TStringField;
    CDUsuarioNOME: TStringField;
    CDUsuarioSENHA: TStringField;
    CDUsuarioLOGADO: TStringField;
    CDUsuarioQUEDAENERGIA: TStringField;
    CDUsuarioTEMPORARIO: TStringField;
    CDUsuarioDATAFIM: TDateTimeField;
    CDUsuarioCODNIVELACESSO: TStringField;
    CDUsuarioCODPERMISSAOACESSO: TIntegerField;
    CDUsuarioCODPERMISSAOINCLUSAO: TIntegerField;
    CDUsuarioCODPERMISSAOALTERACAO: TIntegerField;
    CDUsuarioCODPERMISSAOEXCLUSAO: TIntegerField;
    CDUsuarioSENHAALTERADA: TStringField;
    CDUsuarioEMPRESA: TStringField;
    CDUsuarioTRANSFORMACAO: TStringField;
    CDUsuarioNIVELACESSO: TStringField;
    CDUsuarioGRUPO: TStringField;
    CDUsuarioCODFORMATOCODIGO: TIntegerField;
    CDUsuarioPAcessoCODIGO: TAutoIncField;
    CDUsuarioPAcessoCODNIVELACESSO: TStringField;
    CDUsuarioPAcessoPESSOAL: TStringField;
    CDUsuarioPAcessoCADALMOXARIFADO: TStringField;
    CDUsuarioPAcessoCADAREAS: TStringField;
    CDUsuarioPAcessoCADARQUIVOTECNICO: TStringField;
    CDUsuarioPAcessoCADCALENDARIOOS: TStringField;
    CDUsuarioPAcessoCADCALENDEQUIP: TStringField;
    CDUsuarioPAcessoCADCALENDMOBRA: TStringField;
    CDUsuarioPAcessoCADCARGOS: TStringField;
    CDUsuarioPAcessoCADCAUSASFALHA: TStringField;
    CDUsuarioPAcessoCADCENTROCUSTO: TStringField;
    CDUsuarioPAcessoCADCLASSES: TStringField;
    CDUsuarioPAcessoCADCONFIABILIDADE: TStringField;
    CDUsuarioPAcessoCADCONSULTAS: TStringField;
    CDUsuarioPAcessoCADCONTROLEPNEUS: TStringField;
    CDUsuarioPAcessoCADDISPONIBILIDADE: TStringField;
    CDUsuarioPAcessoCADEQUIPAMENTOS: TStringField;
    CDUsuarioPAcessoCADFABRICANTES: TStringField;
    CDUsuarioPAcessoCADFAMILIAEQUIP: TStringField;
    CDUsuarioPAcessoCADFAMILIAPECASREP: TStringField;
    CDUsuarioPAcessoCADFAMILIARECURSOS: TStringField;
    CDUsuarioPAcessoCADFECHAMANUT: TStringField;
    CDUsuarioPAcessoCADFERIADOS: TStringField;
    CDUsuarioPAcessoCADFORMATOCODIGO: TStringField;
    CDUsuarioPAcessoCADFORNECEDORES: TStringField;
    CDUsuarioPAcessoCADFUNCIONARIOS: TStringField;
    CDUsuarioPAcessoCADGRUPOINDUSTRIAL: TStringField;
    CDUsuarioPAcessoCADHISTORICOEQUIP: TStringField;
    CDUsuarioPAcessoCADIMANGENS: TStringField;
    CDUsuarioPAcessoCADINDDESEMPENHO: TStringField;
    CDUsuarioPAcessoCADINFMENSAIS: TStringField;
    CDUsuarioPAcessoCADLUBRIFICANTES: TStringField;
    CDUsuarioPAcessoCADLUBRIFICPROG: TStringField;
    CDUsuarioPAcessoCADLUBRIFICPROGEQUIP: TStringField;
    CDUsuarioPAcessoCADMANUTENCAO: TStringField;
    CDUsuarioPAcessoCADMANUTPROG: TStringField;
    CDUsuarioPAcessoCADMANUTPROGEQUIP: TStringField;
    CDUsuarioPAcessoCADMAODEOBRAESP: TStringField;
    CDUsuarioPAcessoCADMONITORAMENTO: TStringField;
    CDUsuarioPAcessoCADMOTIVOPARADA: TStringField;
    CDUsuarioPAcessoCADNAVEGACAO: TStringField;
    CDUsuarioPAcessoCADOFICINAS: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICO: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICOHIST: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDUsuarioPAcessoCADPECASREP: TStringField;
    CDUsuarioPAcessoCADPECASREPINST: TStringField;
    CDUsuarioPAcessoCADPECASREPKIT: TStringField;
    CDUsuarioPAcessoCADPECASREPOSICAOEQUIP: TStringField;
    CDUsuarioPAcessoCADPERMISSOES: TStringField;
    CDUsuarioPAcessoCADPLANOTRAB: TStringField;
    CDUsuarioPAcessoCADPONTOSINSPECAO: TStringField;
    CDUsuarioPAcessoCADRECURSOS: TStringField;
    CDUsuarioPAcessoCADRECURSOSKIT: TStringField;
    CDUsuarioPAcessoCADRELATINSP: TStringField;
    CDUsuarioPAcessoCADRELATORIOS: TStringField;
    CDUsuarioPAcessoCADRESERVA: TStringField;
    CDUsuarioPAcessoCADSOLICITACAOTRAB: TStringField;
    CDUsuarioPAcessoCADTERCEIRIZADAS: TStringField;
    CDUsuarioPAcessoCADTIPOPROGRAMACAO: TStringField;
    CDUsuarioPAcessoCADUSUARIOS: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICOFECHAR: TStringField;
    CDUsuarioPAcessoCADFERRAMENTARIA: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICOEXECUTAR: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICOPARALISAR: TStringField;
    CDUsuarioPAcessoCADORDEMSERVICOLIBERAR: TStringField;
    CDUsuarioPAcessoNOME: TStringField;
    CDUsuarioPAcessoCODUSUARIO: TStringField;
    CDUsuarioPAcessoMATRICULA: TStringField;
    CDUsuarioPAcessoNIVELACESSO: TStringField;
    CDUsuarioPAlteracaoCODIGO: TAutoIncField;
    CDUsuarioPAlteracaoCODNIVELACESSO: TStringField;
    CDUsuarioPAlteracaoPESSOAL: TStringField;
    CDUsuarioPAlteracaoCADALMOXARIFADO: TStringField;
    CDUsuarioPAlteracaoCADAREAS: TStringField;
    CDUsuarioPAlteracaoCADARQUIVOTECNICO: TStringField;
    CDUsuarioPAlteracaoCADCALENDARIOOS: TStringField;
    CDUsuarioPAlteracaoCADCALENDEQUIP: TStringField;
    CDUsuarioPAlteracaoCADCALENDMOBRA: TStringField;
    CDUsuarioPAlteracaoCADCARGOS: TStringField;
    CDUsuarioPAlteracaoCADCAUSASFALHA: TStringField;
    CDUsuarioPAlteracaoCADCENTROCUSTO: TStringField;
    CDUsuarioPAlteracaoCADCLASSES: TStringField;
    CDUsuarioPAlteracaoCADCONFIABILIDADE: TStringField;
    CDUsuarioPAlteracaoCADCONSULTAS: TStringField;
    CDUsuarioPAlteracaoCADCONTROLEPNEUS: TStringField;
    CDUsuarioPAlteracaoCADDISPONIBILIDADE: TStringField;
    CDUsuarioPAlteracaoCADEQUIPAMENTOS: TStringField;
    CDUsuarioPAlteracaoCADFABRICANTES: TStringField;
    CDUsuarioPAlteracaoCADFAMILIAEQUIP: TStringField;
    CDUsuarioPAlteracaoCADFAMILIAPECASREP: TStringField;
    CDUsuarioPAlteracaoCADFAMILIARECURSOS: TStringField;
    CDUsuarioPAlteracaoCADFECHAMANUT: TStringField;
    CDUsuarioPAlteracaoCADFERIADOS: TStringField;
    CDUsuarioPAlteracaoCADFORMATOCODIGO: TStringField;
    CDUsuarioPAlteracaoCADFORNECEDORES: TStringField;
    CDUsuarioPAlteracaoCADFUNCIONARIOS: TStringField;
    CDUsuarioPAlteracaoCADGRUPOINDUSTRIAL: TStringField;
    CDUsuarioPAlteracaoCADHISTORICOEQUIP: TStringField;
    CDUsuarioPAlteracaoCADIMANGENS: TStringField;
    CDUsuarioPAlteracaoCADINDDESEMPENHO: TStringField;
    CDUsuarioPAlteracaoCADINFMENSAIS: TStringField;
    CDUsuarioPAlteracaoCADLUBRIFICANTES: TStringField;
    CDUsuarioPAlteracaoCADLUBRIFICPROG: TStringField;
    CDUsuarioPAlteracaoCADLUBRIFICPROGEQUIP: TStringField;
    CDUsuarioPAlteracaoCADMANUTENCAO: TStringField;
    CDUsuarioPAlteracaoCADMANUTPROG: TStringField;
    CDUsuarioPAlteracaoCADMANUTPROGEQUIP: TStringField;
    CDUsuarioPAlteracaoCADMAODEOBRAESP: TStringField;
    CDUsuarioPAlteracaoCADMONITORAMENTO: TStringField;
    CDUsuarioPAlteracaoCADMOTIVOPARADA: TStringField;
    CDUsuarioPAlteracaoCADNAVEGACAO: TStringField;
    CDUsuarioPAlteracaoCADOFICINAS: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICO: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICOHIST: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDUsuarioPAlteracaoCADPECASREP: TStringField;
    CDUsuarioPAlteracaoCADPECASREPINST: TStringField;
    CDUsuarioPAlteracaoCADPECASREPKIT: TStringField;
    CDUsuarioPAlteracaoCADPECASREPOSICAOEQUIP: TStringField;
    CDUsuarioPAlteracaoCADPERMISSOES: TStringField;
    CDUsuarioPAlteracaoCADPLANOTRAB: TStringField;
    CDUsuarioPAlteracaoCADPONTOSINSPECAO: TStringField;
    CDUsuarioPAlteracaoCADRECURSOS: TStringField;
    CDUsuarioPAlteracaoCADRECURSOSKIT: TStringField;
    CDUsuarioPAlteracaoCADRELATINSP: TStringField;
    CDUsuarioPAlteracaoCADRELATORIOS: TStringField;
    CDUsuarioPAlteracaoCADRESERVA: TStringField;
    CDUsuarioPAlteracaoCADSOLICITACAOTRAB: TStringField;
    CDUsuarioPAlteracaoCADTERCEIRIZADAS: TStringField;
    CDUsuarioPAlteracaoCADTIPOPROGRAMACAO: TStringField;
    CDUsuarioPAlteracaoCADUSUARIOS: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICOFECHAR: TStringField;
    CDUsuarioPAlteracaoCADFERRAMENTARIA: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICOEXECUTAR: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICOPARALISAR: TStringField;
    CDUsuarioPAlteracaoCADORDEMSERVICOLIBERAR: TStringField;
    CDUsuarioPAlteracaoCODUSUARIO: TStringField;
    CDUsuarioPAlteracaoMATRICULA: TStringField;
    CDUsuarioPAlteracaoNOME: TStringField;
    CDUsuarioPAlteracaoNIVELACESSO: TStringField;
    CDUsuarioPExclusaoCODIGO: TAutoIncField;
    CDUsuarioPExclusaoCODNIVELACESSO: TStringField;
    CDUsuarioPExclusaoPESSOAL: TStringField;
    CDUsuarioPExclusaoCADALMOXARIFADO: TStringField;
    CDUsuarioPExclusaoCADAREAS: TStringField;
    CDUsuarioPExclusaoCADARQUIVOTECNICO: TStringField;
    CDUsuarioPExclusaoCADCALENDARIOOS: TStringField;
    CDUsuarioPExclusaoCADCALENDEQUIP: TStringField;
    CDUsuarioPExclusaoCADCALENDMOBRA: TStringField;
    CDUsuarioPExclusaoCADCARGOS: TStringField;
    CDUsuarioPExclusaoCADCAUSASFALHA: TStringField;
    CDUsuarioPExclusaoCADCENTROCUSTO: TStringField;
    CDUsuarioPExclusaoCADCLASSES: TStringField;
    CDUsuarioPExclusaoCADCONFIABILIDADE: TStringField;
    CDUsuarioPExclusaoCADCONSULTAS: TStringField;
    CDUsuarioPExclusaoCADCONTROLEPNEUS: TStringField;
    CDUsuarioPExclusaoCADDISPONIBILIDADE: TStringField;
    CDUsuarioPExclusaoCADEQUIPAMENTOS: TStringField;
    CDUsuarioPExclusaoCADFABRICANTES: TStringField;
    CDUsuarioPExclusaoCADFAMILIAEQUIP: TStringField;
    CDUsuarioPExclusaoCADFAMILIAPECASREP: TStringField;
    CDUsuarioPExclusaoCADFAMILIARECURSOS: TStringField;
    CDUsuarioPExclusaoCADFECHAMANUT: TStringField;
    CDUsuarioPExclusaoCADFERIADOS: TStringField;
    CDUsuarioPExclusaoCADFORMATOCODIGO: TStringField;
    CDUsuarioPExclusaoCADFORNECEDORES: TStringField;
    CDUsuarioPExclusaoCADFUNCIONARIOS: TStringField;
    CDUsuarioPExclusaoCADGRUPOINDUSTRIAL: TStringField;
    CDUsuarioPExclusaoCADHISTORICOEQUIP: TStringField;
    CDUsuarioPExclusaoCADIMANGENS: TStringField;
    CDUsuarioPExclusaoCADINDDESEMPENHO: TStringField;
    CDUsuarioPExclusaoCADINFMENSAIS: TStringField;
    CDUsuarioPExclusaoCADLUBRIFICANTES: TStringField;
    CDUsuarioPExclusaoCADLUBRIFICPROG: TStringField;
    CDUsuarioPExclusaoCADLUBRIFICPROGEQUIP: TStringField;
    CDUsuarioPExclusaoCADMANUTENCAO: TStringField;
    CDUsuarioPExclusaoCADMANUTPROG: TStringField;
    CDUsuarioPExclusaoCADMANUTPROGEQUIP: TStringField;
    CDUsuarioPExclusaoCADMAODEOBRAESP: TStringField;
    CDUsuarioPExclusaoCADMONITORAMENTO: TStringField;
    CDUsuarioPExclusaoCADMOTIVOPARADA: TStringField;
    CDUsuarioPExclusaoCADNAVEGACAO: TStringField;
    CDUsuarioPExclusaoCADOFICINAS: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICO: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICOHIST: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDUsuarioPExclusaoCADPECASREP: TStringField;
    CDUsuarioPExclusaoCADPECASREPINST: TStringField;
    CDUsuarioPExclusaoCADPECASREPKIT: TStringField;
    CDUsuarioPExclusaoCADPECASREPOSICAOEQUIP: TStringField;
    CDUsuarioPExclusaoCADPERMISSOES: TStringField;
    CDUsuarioPExclusaoCADPLANOTRAB: TStringField;
    CDUsuarioPExclusaoCADPONTOSINSPECAO: TStringField;
    CDUsuarioPExclusaoCADRECURSOS: TStringField;
    CDUsuarioPExclusaoCADRECURSOSKIT: TStringField;
    CDUsuarioPExclusaoCADRELATINSP: TStringField;
    CDUsuarioPExclusaoCADRELATORIOS: TStringField;
    CDUsuarioPExclusaoCADRESERVA: TStringField;
    CDUsuarioPExclusaoCADSOLICITACAOTRAB: TStringField;
    CDUsuarioPExclusaoCADTERCEIRIZADAS: TStringField;
    CDUsuarioPExclusaoCADTIPOPROGRAMACAO: TStringField;
    CDUsuarioPExclusaoCADUSUARIOS: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICOFECHAR: TStringField;
    CDUsuarioPExclusaoCADFERRAMENTARIA: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICOPARALISAR: TStringField;
    CDUsuarioPExclusaoCADORDEMSERVICOLIBERAR: TStringField;
    CDUsuarioPExclusaoCODUSUARIO: TStringField;
    CDUsuarioPExclusaoMATRICULA: TStringField;
    CDUsuarioPExclusaoNOME: TStringField;
    CDUsuarioPExclusaoNIVELACESSO: TStringField;
    CDUsuarioPInclusaoCODIGO: TAutoIncField;
    CDUsuarioPInclusaoCODNIVELACESSO: TStringField;
    CDUsuarioPInclusaoPESSOAL: TStringField;
    CDUsuarioPInclusaoCADALMOXARIFADO: TStringField;
    CDUsuarioPInclusaoCADAREAS: TStringField;
    CDUsuarioPInclusaoCADARQUIVOTECNICO: TStringField;
    CDUsuarioPInclusaoCADCALENDARIOOS: TStringField;
    CDUsuarioPInclusaoCADCALENDEQUIP: TStringField;
    CDUsuarioPInclusaoCADCALENDMOBRA: TStringField;
    CDUsuarioPInclusaoCADCARGOS: TStringField;
    CDUsuarioPInclusaoCADCAUSASFALHA: TStringField;
    CDUsuarioPInclusaoCADCENTROCUSTO: TStringField;
    CDUsuarioPInclusaoCADCLASSES: TStringField;
    CDUsuarioPInclusaoCADCONFIABILIDADE: TStringField;
    CDUsuarioPInclusaoCADCONSULTAS: TStringField;
    CDUsuarioPInclusaoCADCONTROLEPNEUS: TStringField;
    CDUsuarioPInclusaoCADDISPONIBILIDADE: TStringField;
    CDUsuarioPInclusaoCADEQUIPAMENTOS: TStringField;
    CDUsuarioPInclusaoCADFABRICANTES: TStringField;
    CDUsuarioPInclusaoCADFAMILIAEQUIP: TStringField;
    CDUsuarioPInclusaoCADFAMILIAPECASREP: TStringField;
    CDUsuarioPInclusaoCADFAMILIARECURSOS: TStringField;
    CDUsuarioPInclusaoCADFECHAMANUT: TStringField;
    CDUsuarioPInclusaoCADFERIADOS: TStringField;
    CDUsuarioPInclusaoCADFORMATOCODIGO: TStringField;
    CDUsuarioPInclusaoCADFORNECEDORES: TStringField;
    CDUsuarioPInclusaoCADFUNCIONARIOS: TStringField;
    CDUsuarioPInclusaoCADGRUPOINDUSTRIAL: TStringField;
    CDUsuarioPInclusaoCADHISTORICOEQUIP: TStringField;
    CDUsuarioPInclusaoCADIMANGENS: TStringField;
    CDUsuarioPInclusaoCADINDDESEMPENHO: TStringField;
    CDUsuarioPInclusaoCADINFMENSAIS: TStringField;
    CDUsuarioPInclusaoCADLUBRIFICANTES: TStringField;
    CDUsuarioPInclusaoCADLUBRIFICPROG: TStringField;
    CDUsuarioPInclusaoCADLUBRIFICPROGEQUIP: TStringField;
    CDUsuarioPInclusaoCADMANUTENCAO: TStringField;
    CDUsuarioPInclusaoCADMANUTPROG: TStringField;
    CDUsuarioPInclusaoCADMANUTPROGEQUIP: TStringField;
    CDUsuarioPInclusaoCADMAODEOBRAESP: TStringField;
    CDUsuarioPInclusaoCADMONITORAMENTO: TStringField;
    CDUsuarioPInclusaoCADMOTIVOPARADA: TStringField;
    CDUsuarioPInclusaoCADNAVEGACAO: TStringField;
    CDUsuarioPInclusaoCADOFICINAS: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICO: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICOHIST: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    CDUsuarioPInclusaoCADPECASREP: TStringField;
    CDUsuarioPInclusaoCADPECASREPINST: TStringField;
    CDUsuarioPInclusaoCADPECASREPKIT: TStringField;
    CDUsuarioPInclusaoCADPECASREPOSICAOEQUIP: TStringField;
    CDUsuarioPInclusaoCADPERMISSOES: TStringField;
    CDUsuarioPInclusaoCADPLANOTRAB: TStringField;
    CDUsuarioPInclusaoCADPONTOSINSPECAO: TStringField;
    CDUsuarioPInclusaoCADRECURSOS: TStringField;
    CDUsuarioPInclusaoCADRECURSOSKIT: TStringField;
    CDUsuarioPInclusaoCADRELATINSP: TStringField;
    CDUsuarioPInclusaoCADRELATORIOS: TStringField;
    CDUsuarioPInclusaoCADRESERVA: TStringField;
    CDUsuarioPInclusaoCADSOLICITACAOTRAB: TStringField;
    CDUsuarioPInclusaoCADTERCEIRIZADAS: TStringField;
    CDUsuarioPInclusaoCADTIPOPROGRAMACAO: TStringField;
    CDUsuarioPInclusaoCADUSUARIOS: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICOFECHAR: TStringField;
    CDUsuarioPInclusaoCADFERRAMENTARIA: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICOPARALISAR: TStringField;
    CDUsuarioPInclusaoCADORDEMSERVICOLIBERAR: TStringField;
    CDUsuarioPInclusaoCODUSUARIO: TStringField;
    CDUsuarioPInclusaoMATRICULA: TStringField;
    CDUsuarioPInclusaoNOME: TStringField;
    CDUsuarioPInclusaoNIVELACESSO: TStringField;
    CDCadAbastecimentosLubrificInspCODIGO: TStringField;
    CDCadAbastecimentosManutInspCODIGO: TStringField;
    CDCadAlertasCODIGO: TAutoIncField;
    CDCadAlertasCODEMPRESA: TStringField;
    CDCadAlertasDESCRICAO: TStringField;
    CDCadAlertasVENCIMENTO: TDateTimeField;
    CDCadAlertasANTECIPAR: TIntegerField;
    CDCadAlertasPROLONGAR: TIntegerField;
    CDCadAlertasINTERVALO: TIntegerField;
    CDCadAlertasOSTOTALCAD: TLargeintField;
    CDCadAlertasOSTOTALPROG: TLargeintField;
    CDCadAlertasOSTOTALEXEC: TLargeintField;
    CDCadAlertasManutTOTAL: TLargeintField;
    CDCadAlertasLubrificTOTAL: TLargeintField;
    CDCadAlertasRotaTOTAL: TLargeintField;
    CDCadAlmoxarifadoCODIGO: TStringField;
    CDCadAlmoxarifadoCODEMPRESA: TStringField;
    CDCadAlmoxarifadoCODCENTROCUSTO: TStringField;
    CDCadAlmoxarifadoDESCRICAO: TStringField;
    CDCadAlmoxarifadoMATERIAL: TStringField;
    CDCadAlmoxarifadoNUMITENS: TIntegerField;
    CDCadAlmoxarifadoAREA: TIntegerField;
    CDCadAlmoxarifadoATIVO: TStringField;
    CDCadAlmoxarifadoVISIVEL: TStringField;
    CDCadAlmoxarifadoDATACADASTRO: TDateTimeField;
    CDCadAlmoxarifadoCODUSUARIOCAD: TStringField;
    CDCadAlmoxarifadoDATAULTALT: TDateTimeField;
    CDCadAlmoxarifadoCODUSUARIOALT: TStringField;
    CDCadAlmoxarifadoCENTROCUSTO: TStringField;
    CDCadAlmoxarifadoUSUARIOCAD: TStringField;
    CDCadAlmoxarifadoUSUARIOALT: TStringField;
    CDCadAreasCODIGO: TStringField;
    CDCadAreasCODEMPRESA: TStringField;
    CDCadAreasDESCRICAO: TStringField;
    CDCadAreasATIVO: TStringField;
    CDCadAreasVISIVEL: TStringField;
    CDCadAreasDATACADASTRO: TDateTimeField;
    CDCadAreasCODUSUARIOCAD: TStringField;
    CDCadAreasDATAULTALT: TDateTimeField;
    CDCadAreasCODUSUARIOALT: TStringField;
    CDCadAreasUSUARIOCAD: TStringField;
    CDCadAreasUSUARIOALT: TStringField;
    CDCadCelulasCODIGO: TStringField;
    CDCadCelulasCODEMPRESA: TStringField;
    CDCadCelulasCODAREA: TStringField;
    CDCadCelulasDESCRICAO: TStringField;
    CDCadCelulasTIPO: TStringField;
    CDCadCelulasFATORMARCHADM: TBCDField;
    CDCadCelulasDATACADASTRO: TDateTimeField;
    CDCadCelulasCODUSUARIOCAD: TStringField;
    CDCadCelulasDATAULTALT: TDateTimeField;
    CDCadCelulasCODUSUARIOALT: TStringField;
    CDCadCelulasAREA: TStringField;
    CDCadCelulasUSUARIOCAD: TStringField;
    CDCadCelulasUSUARIOALT: TStringField;
    CDCadLinhasCODIGO: TStringField;
    CDCadLinhasCODEMPRESA: TStringField;
    CDCadLinhasCODAREA: TStringField;
    CDCadLinhasCODCELULA: TStringField;
    CDCadLinhasDESCRICAO: TStringField;
    CDCadLinhasDATACADASTRO: TDateTimeField;
    CDCadLinhasCODUSUARIOCAD: TStringField;
    CDCadLinhasDATAULTALT: TDateTimeField;
    CDCadLinhasCODUSUARIOALT: TStringField;
    CDCadLinhasAREA: TStringField;
    CDCadLinhasCELULA: TStringField;
    CDCadLinhasUSUARIOCAD: TStringField;
    CDCadLinhasUSUARIOALT: TStringField;
    CDCadArquivoTecnicoCODIGO: TStringField;
    CDCadArquivoTecnicoCODEMPRESA: TStringField;
    CDCadArquivoTecnicoCODEQUIPAMENTO: TStringField;
    CDCadArquivoTecnicoCODEDITORA: TIntegerField;
    CDCadArquivoTecnicoCODTEMA: TIntegerField;
    CDCadArquivoTecnicoCODASSUNTO: TIntegerField;
    CDCadArquivoTecnicoCODLITERATURA: TIntegerField;
    CDCadArquivoTecnicoCODPROJETO: TIntegerField;
    CDCadArquivoTecnicoTIPO: TStringField;
    CDCadArquivoTecnicoDESCRICAO: TStringField;
    CDCadArquivoTecnicoCONJUNTO: TStringField;
    CDCadArquivoTecnicoAUTOR: TStringField;
    CDCadArquivoTecnicoNUMORIGINAL: TStringField;
    CDCadArquivoTecnicoNUMUNIDADE: TStringField;
    CDCadArquivoTecnicoESTANTE: TStringField;
    CDCadArquivoTecnicoPRATELEIRA: TStringField;
    CDCadArquivoTecnicoGAVETA: TStringField;
    CDCadArquivoTecnicoPASTA: TStringField;
    CDCadArquivoTecnicoARQUIVO: TStringField;
    CDCadArquivoTecnicoMAPOTECA: TStringField;
    CDCadArquivoTecnicoESTACAO: TStringField;
    CDCadArquivoTecnicoEMPRESTADO: TStringField;
    CDCadArquivoTecnicoDATACADASTRO: TDateTimeField;
    CDCadArquivoTecnicoCODUSUARIOCAD: TStringField;
    CDCadArquivoTecnicoDATAULTALT: TDateTimeField;
    CDCadArquivoTecnicoCODUSUARIOALT: TStringField;
    CDCadArquivoTecnicoDIVERSOS: TStringField;
    CDCadArquivoTecnicoOBSERVACOES: TBlobField;
    CDCadArquivoTecnicoEQUIPAMENTO: TStringField;
    CDCadArquivoTecnicoEDITORA: TStringField;
    CDCadArquivoTecnicoTEMA: TStringField;
    CDCadArquivoTecnicoASSUNTO: TStringField;
    CDCadArquivoTecnicoLITERATURA: TStringField;
    CDCadArquivoTecnicoPROJETO: TStringField;
    CDCadArquivoTecnicoUSUARIOCAD: TStringField;
    CDCadArquivoTecnicoUSUARIOALT: TStringField;
    CDCadArquivoTecnicoParamCODIGO: TAutoIncField;
    CDCadArquivoTecnicoParamCODEMPRESA: TStringField;
    CDCadArquivoTecnicoParamTIPO: TStringField;
    CDCadArquivoTecnicoParamDESCRICAO: TStringField;
    CDCadArquivoTecnicoParamDATACADASTRO: TDateTimeField;
    CDCadArquivoTecnicoParamCODUSUARIOCAD: TStringField;
    CDCadArquivoTecnicoParamDATAULTALT: TDateTimeField;
    CDCadArquivoTecnicoParamCODUSUARIOALT: TStringField;
    CDCadArquivoTecnicoParamUSUARIOCAD: TStringField;
    CDCadArquivoTecnicoParamUSUARIOALT: TStringField;
    CDCadCalendEquipCODIGO: TStringField;
    CDCadCalendEquipCODEMPRESA: TStringField;
    CDCadCalendEquipDESCRICAO: TStringField;
    CDCadCalendEquipATIVO: TStringField;
    CDCadCalendEquipVISIVEL: TStringField;
    CDCadCalendEquipMAXHORAUTIL: TIntegerField;
    CDCadCalendEquipHOFICIAIS: TIntegerField;
    CDCadCalendEquipDATACADASTRO: TDateTimeField;
    CDCadCalendEquipCODUSUARIOCAD: TStringField;
    CDCadCalendEquipDATAULTALT: TDateTimeField;
    CDCadCalendEquipCODUSUARIOALT: TStringField;
    CDCadCalendEquipUSUARIOCAD: TStringField;
    CDCadCalendEquipUSUARIOALT: TStringField;
    CDCadCalendEquipSeqHoraCODIGO: TAutoIncField;
    CDCadCalendEquipSeqHoraCODEMPRESA: TStringField;
    CDCadCalendEquipSeqHoraCODCALENDARIOEQUIP: TStringField;
    CDCadCalendEquipSeqHoraSEQUENCIA: TIntegerField;
    CDCadCalendEquipSeqHoraDATA: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAINI1: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAFIN1: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAINI2: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAFIN2: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAINI3: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAFIN3: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAINI4: TDateTimeField;
    CDCadCalendEquipSeqHoraHORAFIN4: TDateTimeField;
    CDCadCalendMObraCODIGO: TStringField;
    CDCadCalendMObraCODEMPRESA: TStringField;
    CDCadCalendMObraDESCRICAO: TStringField;
    CDCadCalendMObraATIVO: TStringField;
    CDCadCalendMObraVISIVEL: TStringField;
    CDCadCalendMObraMAXHORAUTIL: TShortintField;
    CDCadCalendMObraHENORMAL: TIntegerField;
    CDCadCalendMObraHEFERIADO: TIntegerField;
    CDCadCalendMObraHOFICIAIS: TIntegerField;
    CDCadCalendMObraHREAIS: TIntegerField;
    CDCadCalendMObraDATACADASTRO: TDateTimeField;
    CDCadCalendMObraCODUSUARIOCAD: TStringField;
    CDCadCalendMObraDATAULTALT: TDateTimeField;
    CDCadCalendMObraCODUSUARIOALT: TStringField;
    CDCadCalendMObraUSUARIOCAD: TStringField;
    CDCadCalendMObraUSUARIOALT: TStringField;
    CDCadCalendMObraSeqHoraCODIGO: TAutoIncField;
    CDCadCalendMObraSeqHoraCODEMPRESA: TStringField;
    CDCadCalendMObraSeqHoraCODCALENDARIO: TStringField;
    CDCadCalendMObraSeqHoraSEQUENCIA: TIntegerField;
    CDCadCalendMObraSeqHoraDATA: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAINI1: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAFIN1: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAINI2: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAFIN2: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAINI3: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAFIN3: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAINI4: TDateTimeField;
    CDCadCalendMObraSeqHoraHORAFIN4: TDateTimeField;
    CDCadCargosCODIGO: TStringField;
    CDCadCargosDESCRICAO: TStringField;
    CDCadCargosDATACADASTRO: TDateTimeField;
    CDCadCargosCODUSUARIOCAD: TStringField;
    CDCadCargosDATAULTALT: TDateTimeField;
    CDCadCargosCODUSUARIOALT: TStringField;
    CDCadCargosUSUARIOCAD: TStringField;
    CDCadCargosUSUARIOALT: TStringField;
    CDCadCausaFalhaCODIGO: TStringField;
    CDCadCausaFalhaDESCRICAO: TStringField;
    CDCadCausaFalhaATIVO: TStringField;
    CDCadCausaFalhaVISIVEL: TStringField;
    CDCadCausaFalhaDATACADASTRO: TDateTimeField;
    CDCadCausaFalhaCODUSUARIOCAD: TStringField;
    CDCadCausaFalhaDATAULTALT: TDateTimeField;
    CDCadCausaFalhaCODUSUARIOALT: TStringField;
    CDCadCausaFalhaUSUARIOCAD: TStringField;
    CDCadCausaFalhaUSUARIOALT: TStringField;
    CDCadCentroCustoCODIGO: TStringField;
    CDCadCentroCustoDESCRICAO: TStringField;
    CDCadCentroCustoATIVO: TStringField;
    CDCadCentroCustoVISIVEL: TStringField;
    CDCadCentroCustoDATACADASTRO: TDateTimeField;
    CDCadCentroCustoCODUSUARIOCAD: TStringField;
    CDCadCentroCustoDATAULTALT: TDateTimeField;
    CDCadCentroCustoCODUSUARIOALT: TStringField;
    CDCadCentroCustoUSUARIOCAD: TStringField;
    CDCadCentroCustoUSUARIOALT: TStringField;
    CDCadClassesCODIGO: TStringField;
    CDCadClassesDESCRICAO: TStringField;
    CDCadClassesATIVO: TStringField;
    CDCadClassesVISIVEL: TStringField;
    CDCadClassesDATACADASTRO: TDateTimeField;
    CDCadClassesCODUSUARIOCAD: TStringField;
    CDCadClassesDATAULTALT: TDateTimeField;
    CDCadClassesCODUSUARIOALT: TStringField;
    CDCadClassesUSUARIOCAD: TStringField;
    CDCadClassesUSUARIOALT: TStringField;
    CDCadDespMensalFuncPerCODIGO: TAutoIncField;
    CDCadDespMensalFuncPerCODEMPRESA: TStringField;
    CDCadDespMensalFuncPerMES: TStringField;
    CDCadDespMensalFuncPerANO: TStringField;
    CDCadDespMensalFuncPerDATAFECHAMENTO: TDateTimeField;
    CDCadDispAdmissiveisCODIGO: TAutoIncField;
    CDCadDispAdmissiveisCODEMPRESA: TStringField;
    CDCadDispAdmissiveisCODITEM: TStringField;
    CDCadDispAdmissiveisVALITEM: TBCDField;
    CDCadDispAdmissiveisTIPOITEM: TStringField;
    CDCadDispAdmissiveisDATACADASTRO: TDateTimeField;
    CDCadDispAdmissiveisCODUSUARIOCAD: TStringField;
    CDCadDispAdmissiveisDATAULTALT: TDateTimeField;
    CDCadDispAdmissiveisCODUSUARIOALT: TStringField;
    CDCadDispAdmissiveisUSUARIOCAD: TStringField;
    CDCadDispAdmissiveisUSUARIOALT: TStringField;
    CDCadDispAdmissiveisAREA: TStringField;
    CDCadDispAdmissiveisCELULA: TStringField;
    CDCadDispAdmissiveisEQUIPAMENTO: TStringField;
    CDCadEquipamentoDadosCODIGO: TAutoIncField;
    CDCadEquipamentoDadosCODEMPRESA: TStringField;
    CDCadEquipamentoDadosCODFAMILIAEQUIP: TStringField;
    CDCadEquipamentoDadosCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoDadosREGISTRO1: TStringField;
    CDCadEquipamentoDadosREGISTRO2: TStringField;
    CDCadEquipamentoDadosREGISTRO3: TStringField;
    CDCadEquipamentoDadosREGISTRO4: TStringField;
    CDCadEquipamentoDadosREGISTRO5: TStringField;
    CDCadEquipamentoDadosREGISTRO6: TStringField;
    CDCadEquipamentoDadosREGISTRO7: TStringField;
    CDCadEquipamentoDadosREGISTRO8: TStringField;
    CDCadEquipamentoDadosREGISTRO9: TStringField;
    CDCadEquipamentoDadosREGISTRO10: TStringField;
    CDCadEquipamentoDadosREGISTRO11: TStringField;
    CDCadEquipamentoDadosREGISTRO12: TStringField;
    CDCadEquipamentoDadosINFORMACOES: TBlobField;
    CDCadEquipamentoPecasCODIGO: TAutoIncField;
    CDCadEquipamentoPecasCODEMPRESA: TStringField;
    CDCadEquipamentoPecasCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoPecasCODPECAREP: TStringField;
    CDCadEquipamentoPecasDESCRICAO: TStringField;
    CDCadEquipamentoPecasQUANTIDADE: TIntegerField;
    CDCadEquipamentoPecasREFERENCIA: TStringField;
    CDCadEquipamentoPecasCODUNIDADE: TStringField;
    CDCadEquipamentoPecasLOCALIZACAO: TStringField;
    CDCadEquipamentoPecasPECA: TStringField;
    CDCadEquipamentoPecasEQUIPAMENTO: TStringField;
    CDCadEquipamentoEspCODIGO: TAutoIncField;
    CDCadEquipamentoEspCODEMPRESA: TStringField;
    CDCadEquipamentoEspCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoEspMATRICULA: TStringField;
    CDCadEquipamentoEspNOME: TStringField;
    CDCadEquipamentoEspEQUIPAMENTO: TStringField;
    CDCadEquipamentoArqTecCODIGO: TAutoIncField;
    CDCadEquipamentoArqTecCODEMPRESA: TStringField;
    CDCadEquipamentoArqTecCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoArqTecCODARQUIVO: TStringField;
    CDCadEquipamentoArqTecTIPO: TStringField;
    CDCadEquipamentoArqTecARQUIVO: TStringField;
    CDCadEquipamentoArqTecEQUIPAMENTO: TStringField;
    CDCadEquipamentoPontosInspCODIGO: TAutoIncField;
    CDCadEquipamentoPontosInspCODEMPRESA: TStringField;
    CDCadEquipamentoPontosInspCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoPontosInspCODPONTOINSPECAO: TStringField;
    CDCadEquipamentoPontosInspEQUIPAMENTO: TStringField;
    CDCadEquipamentoPontosInspPONTOINSPECAO: TStringField;
    CDCadEquipamentoContadoresCODIGO: TAutoIncField;
    CDCadEquipamentoContadoresCODEMPRESA: TStringField;
    CDCadEquipamentoContadoresCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoContadoresCODCONTADOR: TStringField;
    CDCadEquipamentoContadoresDESCRICAO: TStringField;
    CDCadEquipamentoContadoresEQUIPAMENTO: TStringField;
    CDCadEquipamentoContadoresCONTADOR: TStringField;
    CDCadEquipamentoContadoresPROGRAMACAO: TStringField;
    CDEquipamentosChecaLocalCODIGO: TStringField;
    CDEquipamentosChecaLocalCODEMPRESA: TStringField;
    CDEquipamentosChecaLocalDESCRICAO: TStringField;
    CDCadEquipamentoArvoreCODIGO: TStringField;
    CDCadEquipamentoArvoreDESCRICAO: TStringField;
    CDCadEquipamentoArvoreCODEQUIPAMENTOPAI: TStringField;
    CDCadEquipamentoArvoreDESCEQUIPAMENTOPAI: TStringField;
    CDCadEquipamentoArvoreSEQUENCIA: TIntegerField;
    CDCadEquipamentoArvoreCODAREA: TStringField;
    CDCadEquipamentoArvoreSecCODIGO: TStringField;
    CDCadEquipamentoArvoreSecDESCRICAO: TStringField;
    CDCadEquipamentoArvoreSecCODEQUIPAMENTOPAI: TStringField;
    CDCadEquipamentoArvoreSecDESCEQUIPAMENTOPAI: TStringField;
    CDCadEquipEmRotaCODIGO: TAutoIncField;
    CDCadEquipEmRotaCODEMPRESA: TStringField;
    CDCadEquipEmRotaCODAREA: TStringField;
    CDCadEquipEmRotaCODCELULA: TStringField;
    CDCadEquipEmRotaCODLINHA: TStringField;
    CDCadEquipEmRotaSEQUENCIA: TIntegerField;
    CDCadEquipEmRotaREPROGRAMAR: TStringField;
    CDCadEquipEmRotaROTA: TStringField;
    CDCadEquipEmRotaDATAINICIO: TDateTimeField;
    CDCadEquipEmRotaRELATORIO: TStringField;
    CDCadEquipamentoManutHistINDICE: TAutoIncField;
    CDCadEquipamentoManutHistDESCRICAO: TStringField;
    CDCadEquipamentoManutHistCODORDEMSERVICO: TIntegerField;
    CDCadEquipamentoManutHistDTAINICIO1: TDateTimeField;
    CDCadEquipamentoManutHistDATAEXECUCAO: TDateTimeField;
    CDCadEquipamentoManutHistDATAFECHAMENTO: TDateTimeField;
    CDCadFabricantesCODIGO: TStringField;
    CDCadFabricantesCODEMPRESA: TStringField;
    CDCadFabricantesDESCRICAO: TStringField;
    CDCadFabricantesID: TStringField;
    CDCadFabricantesENDERECO: TStringField;
    CDCadFabricantesEMAIL: TStringField;
    CDCadFabricantesFONE: TStringField;
    CDCadFabricantesCONTATO: TStringField;
    CDCadFabricantesATIVO: TStringField;
    CDCadFabricantesVISIVEL: TStringField;
    CDCadFabricantesDATACADASTRO: TDateTimeField;
    CDCadFabricantesCODUSUARIOCAD: TStringField;
    CDCadFabricantesDATAULTALT: TDateTimeField;
    CDCadFabricantesCODUSUARIOALT: TStringField;
    CDCadFabricantesUSUARIOCAD: TStringField;
    CDCadFabricantesUSUARIOALT: TStringField;
    CDCadFamEquipamentoCODIGO: TStringField;
    CDCadFamEquipamentoDESCRICAO: TStringField;
    CDCadFamEquipamentoATIVO: TStringField;
    CDCadFamEquipamentoVISIVEL: TStringField;
    CDCadFamEquipamentoCAMPO1: TStringField;
    CDCadFamEquipamentoN1: TStringField;
    CDCadFamEquipamentoCAMPO2: TStringField;
    CDCadFamEquipamentoN2: TStringField;
    CDCadFamEquipamentoCAMPO3: TStringField;
    CDCadFamEquipamentoN3: TStringField;
    CDCadFamEquipamentoCAMPO4: TStringField;
    CDCadFamEquipamentoN4: TStringField;
    CDCadFamEquipamentoCAMPO5: TStringField;
    CDCadFamEquipamentoN5: TStringField;
    CDCadFamEquipamentoCAMPO6: TStringField;
    CDCadFamEquipamentoN6: TStringField;
    CDCadFamEquipamentoCAMPO7: TStringField;
    CDCadFamEquipamentoN7: TStringField;
    CDCadFamEquipamentoCAMPO8: TStringField;
    CDCadFamEquipamentoN8: TStringField;
    CDCadFamEquipamentoCAMPO9: TStringField;
    CDCadFamEquipamentoN9: TStringField;
    CDCadFamEquipamentoCAMPO10: TStringField;
    CDCadFamEquipamentoN10: TStringField;
    CDCadFamEquipamentoCAMPO11: TStringField;
    CDCadFamEquipamentoN11: TStringField;
    CDCadFamEquipamentoDATACADASTRO: TDateTimeField;
    CDCadFamEquipamentoCODUSUARIOCAD: TStringField;
    CDCadFamEquipamentoDATAULTALT: TDateTimeField;
    CDCadFamEquipamentoCODUSUARIOALT: TStringField;
    CDCadFamEquipamentoUSUARIOCAD: TStringField;
    CDCadFamEquipamentoUSUARIOALT: TStringField;
    CDCadFamPecasRepCODIGO: TStringField;
    CDCadFamPecasRepDESCRICAO: TStringField;
    CDCadFamPecasRepATIVO: TStringField;
    CDCadFamPecasRepVISIVEL: TStringField;
    CDCadFamPecasRepCAMPO1: TStringField;
    CDCadFamPecasRepCAMPO2: TStringField;
    CDCadFamPecasRepCAMPO3: TStringField;
    CDCadFamPecasRepCAMPO4: TStringField;
    CDCadFamPecasRepCAMPO5: TStringField;
    CDCadFamPecasRepCAMPO6: TStringField;
    CDCadFamPecasRepCAMPO7: TStringField;
    CDCadFamPecasRepCAMPO8: TStringField;
    CDCadFamPecasRepCAMPO9: TStringField;
    CDCadFamPecasRepCAMPO10: TStringField;
    CDCadFamPecasRepCAMPO11: TStringField;
    CDCadFamPecasRepDATACADASTRO: TDateTimeField;
    CDCadFamPecasRepCODUSUARIOCAD: TStringField;
    CDCadFamPecasRepDATAULTALT: TDateTimeField;
    CDCadFamPecasRepCODUSUARIOALT: TStringField;
    CDCadFamPecasRepUSUARIOCAD: TStringField;
    CDCadFamPecasRepUSUARIOALT: TStringField;
    CDCadFamPneusCODIGO: TStringField;
    CDCadFamPneusDESCRICAO: TStringField;
    CDCadFamPneusATIVO: TStringField;
    CDCadFamPneusVISIVEL: TStringField;
    CDCadFamPneusCAMPO1: TStringField;
    CDCadFamPneusCAMPO2: TStringField;
    CDCadFamPneusCAMPO3: TStringField;
    CDCadFamPneusCAMPO4: TStringField;
    CDCadFamPneusCAMPO5: TStringField;
    CDCadFamPneusCAMPO6: TStringField;
    CDCadFamPneusCAMPO7: TStringField;
    CDCadFamPneusCAMPO8: TStringField;
    CDCadFamPneusCAMPO9: TStringField;
    CDCadFamPneusCAMPO10: TStringField;
    CDCadFamPneusCAMPO11: TStringField;
    CDCadFamPneusDATACADASTRO: TDateTimeField;
    CDCadFamPneusCODUSUARIOCAD: TStringField;
    CDCadFamPneusDATAULTALT: TDateTimeField;
    CDCadFamPneusCODUSUARIOALT: TStringField;
    CDCadFamPneusUSUARIOCAD: TStringField;
    CDCadFamPneusUSUARIOALT: TStringField;
    CDCadFamRecursosCODIGO: TStringField;
    CDCadFamRecursosDESCRICAO: TStringField;
    CDCadFamRecursosATIVO: TStringField;
    CDCadFamRecursosVISIVEL: TStringField;
    CDCadFamRecursosCAMPO1: TStringField;
    CDCadFamRecursosCAMPO2: TStringField;
    CDCadFamRecursosCAMPO3: TStringField;
    CDCadFamRecursosCAMPO4: TStringField;
    CDCadFamRecursosCAMPO5: TStringField;
    CDCadFamRecursosCAMPO6: TStringField;
    CDCadFamRecursosCAMPO7: TStringField;
    CDCadFamRecursosCAMPO8: TStringField;
    CDCadFamRecursosCAMPO9: TStringField;
    CDCadFamRecursosCAMPO10: TStringField;
    CDCadFamRecursosCAMPO11: TStringField;
    CDCadFamRecursosDATACADASTRO: TDateTimeField;
    CDCadFamRecursosCODUSUARIOCAD: TStringField;
    CDCadFamRecursosDATAULTALT: TDateTimeField;
    CDCadFamRecursosCODUSUARIOALT: TStringField;
    CDCadFamRecursosUSUARIOCAD: TStringField;
    CDCadFamRecursosUSUARIOALT: TStringField;
    CDCadFeriadosCODIGO: TStringField;
    CDCadFeriadosCODEMPRESA: TStringField;
    CDCadFeriadosDESCRICAO: TStringField;
    CDCadFeriadosDATAFERIADO: TStringField;
    CDCadFeriadosDATACADASTRO: TDateTimeField;
    CDCadFeriadosCODUSUARIOCAD: TStringField;
    CDCadFeriadosDATAULTALT: TDateTimeField;
    CDCadFeriadosCODUSUARIOALT: TStringField;
    CDCadFeriadosUSUARIOCAD: TStringField;
    CDCadFeriadosUSUARIOALT: TStringField;
    CDCadFerramentariaCODIGO: TStringField;
    CDCadFerramentariaCODEMPRESA: TStringField;
    CDCadFerramentariaDESCRICAO: TStringField;
    CDCadFerramentariaDATACADASTRO: TDateTimeField;
    CDCadFerramentariaCODUSUARIOCAD: TStringField;
    CDCadFerramentariaDATAULTALT: TDateTimeField;
    CDCadFerramentariaCODUSUARIOALT: TStringField;
    CDCadFerramentariaUSUARIOCAD: TStringField;
    CDCadFerramentariaUSUARIOALT: TStringField;
    CDCadFormatoCodigoCODIGO: TAutoIncField;
    CDCadFormatoCodigoALMOXARIFADO: TStringField;
    CDCadFormatoCodigoAREAS: TStringField;
    CDCadFormatoCodigoARQUIVOTECNICO: TStringField;
    CDCadFormatoCodigoCALENDARIOEQUIP: TStringField;
    CDCadFormatoCodigoCALENDARIO: TStringField;
    CDCadFormatoCodigoCARGOS: TStringField;
    CDCadFormatoCodigoCAUSASFALHA: TStringField;
    CDCadFormatoCodigoCELULAS: TStringField;
    CDCadFormatoCodigoCENTROCUSTO: TStringField;
    CDCadFormatoCodigoCLASSES: TStringField;
    CDCadFormatoCodigoPNEUS: TStringField;
    CDCadFormatoCodigoDESTECNICO: TStringField;
    CDCadFormatoCodigoEMPRESA: TStringField;
    CDCadFormatoCodigoEQUIPAMENTOS: TStringField;
    CDCadFormatoCodigoFABRICANTE: TStringField;
    CDCadFormatoCodigoFAMILIAEQUIPAMENTO: TStringField;
    CDCadFormatoCodigoFAMILIAPNEUS: TStringField;
    CDCadFormatoCodigoFAMILIAPECASREPOSICAO: TStringField;
    CDCadFormatoCodigoFAMILIARECURSOS: TStringField;
    CDCadFormatoCodigoFERIADOS: TStringField;
    CDCadFormatoCodigoFORNECEDOR: TStringField;
    CDCadFormatoCodigoLUBRIFICANTES: TStringField;
    CDCadFormatoCodigoLUBRIFICPROGFAMEQUIPAMENTO: TStringField;
    CDCadFormatoCodigoLUBRIFICPROGEQUIPAMENTO: TStringField;
    CDCadFormatoCodigoMANUTPROGFAMEQUIPAMENTO: TStringField;
    CDCadFormatoCodigoMANUTPROGEQUIPAMENTO: TStringField;
    CDCadFormatoCodigoMOTIVOPARADA: TStringField;
    CDCadFormatoCodigoNATUREZAFINANCEIRA: TStringField;
    CDCadFormatoCodigoOFICINAS: TStringField;
    CDCadFormatoCodigoPONTOSINSPECAO: TStringField;
    CDCadFormatoCodigoPECASREPOSICAO: TStringField;
    CDCadFormatoCodigoPECASREPOSICAOKIT: TStringField;
    CDCadFormatoCodigoPLANOTRABALHO: TStringField;
    CDCadFormatoCodigoRECURSOS: TStringField;
    CDCadFormatoCodigoTIPOPROGRAMACAO: TStringField;
    CDCadFormatoCodigoRECURSOSKIT: TStringField;
    CDCadFormatoCodigoUSUARIO: TStringField;
    CDCadFormatoCodigoTIPOMANUTENCAO: TStringField;
    CDTotalTabelasCODIGO: TAutoIncField;
    CDTotalTabelasTOTAL1: TLargeintField;
    CDTotalTabelasTOTAL2: TLargeintField;
    CDTotalTabelasTOTAL3: TLargeintField;
    CDTotalTabelasTOTAL4: TLargeintField;
    CDTotalTabelasTOTAL5: TLargeintField;
    CDTotalTabelasTOTAL6: TLargeintField;
    CDTotalTabelasTOTAL7: TLargeintField;
    CDTotalTabelasTOTAL8: TLargeintField;
    CDTotalTabelasTOTAL9: TLargeintField;
    CDTotalTabelasTOTAL10: TLargeintField;
    CDTotalTabelasTOTAL11: TLargeintField;
    CDTotalTabelasTOTAL12: TLargeintField;
    CDTotalTabelasTOTAL13: TLargeintField;
    CDTotalTabelasTOTAL14: TLargeintField;
    CDTotalTabelasTOTAL15: TLargeintField;
    CDTotalTabelasTOTAL16: TLargeintField;
    CDTotalTabelasTOTAL17: TLargeintField;
    CDTotalTabelasTOTAL18: TLargeintField;
    CDTotalTabelasTOTAL19: TLargeintField;
    CDTotalTabelasTOTAL20: TLargeintField;
    CDTotalTabelasTOTAL21: TLargeintField;
    CDTotalTabelasTOTAL22: TLargeintField;
    CDTotalTabelasTOTAL23: TLargeintField;
    CDTotalTabelasTOTAL24: TLargeintField;
    CDTotalTabelasTOTAL25: TLargeintField;
    CDTotalTabelasTOTAL26: TLargeintField;
    CDTotalTabelasTOTAL27: TLargeintField;
    CDTotalTabelasTOTAL28: TLargeintField;
    CDTotalTabelasTOTAL29: TLargeintField;
    CDTotalTabelasTOTAL30: TLargeintField;
    CDTotalTabelasTOTAL31: TLargeintField;
    CDTotalTabelasTOTAL32: TLargeintField;
    CDTotalTabelasTOTAL33: TLargeintField;
    CDTotalTabelasTOTAL34: TLargeintField;
    CDTotalTabelasTOTAL35: TLargeintField;
    CDTotalTabelasTOTAL36: TLargeintField;
    CDCadFornecedoresCODIGO: TStringField;
    CDCadFornecedoresCODEMPRESA: TStringField;
    CDCadFornecedoresDESCRICAO: TStringField;
    CDCadFornecedoresID: TStringField;
    CDCadFornecedoresENDERECO: TStringField;
    CDCadFornecedoresEMAIL: TStringField;
    CDCadFornecedoresFONE: TStringField;
    CDCadFornecedoresCONTATO: TStringField;
    CDCadFornecedoresATIVO: TStringField;
    CDCadFornecedoresVISIVEL: TStringField;
    CDCadFornecedoresDATACADASTRO: TDateTimeField;
    CDCadFornecedoresCODUSUARIOCAD: TStringField;
    CDCadFornecedoresDATAULTALT: TDateTimeField;
    CDCadFornecedoresCODUSUARIOALT: TStringField;
    CDCadFornecedoresUSUARIOCAD: TStringField;
    CDCadFornecedoresUSUARIOALT: TStringField;
    CDCadFuncionariosCxaFerramCODIGO: TAutoIncField;
    CDCadFuncionariosCxaFerramCODEMPRESA: TStringField;
    CDCadFuncionariosCxaFerramMATRICULA: TStringField;
    CDCadFuncionariosCxaFerramKIT: TStringField;
    CDCadFuncionariosCxaFerramCODITEM: TStringField;
    CDCadFuncionariosCxaFerramDESCRICAO: TStringField;
    CDCadFuncionariosCxaFerramQUANTIDADE: TIntegerField;
    CDCadFuncionariosCxaFerramDATAENTREGA: TDateTimeField;
    CDCadFuncionariosCxaFerramFUNCIONARIO: TStringField;
    CDCadFuncionariosAusenciasCODIGO: TAutoIncField;
    CDCadFuncionariosAusenciasCODEMPRESA: TStringField;
    CDCadFuncionariosAusenciasMATRICULA: TStringField;
    CDCadFuncionariosAusenciasMOTIVO: TStringField;
    CDCadFuncionariosAusenciasINICIO: TDateTimeField;
    CDCadFuncionariosAusenciasFIM: TDateTimeField;
    CDCadFuncionariosAusenciasDATACADASTRO: TDateTimeField;
    CDCadFuncionariosAusenciasCODUSUARIOCAD: TStringField;
    CDCadFuncionariosAusenciasDATAULTALT: TDateTimeField;
    CDCadFuncionariosAusenciasCODUSUARIOALT: TStringField;
    CDCadFuncionariosAusenciasUSUARIOCAD: TStringField;
    CDCadFuncionariosAusenciasUSUARIOALT: TStringField;
    CDCadFuncionariosAusenciasNOME: TStringField;
    CDCadFuncionariosHistMATRICULA: TStringField;
    CDCadFuncionariosHistNOME: TStringField;
    CDCadFuncionariosHistCALENDARIO: TStringField;
    CDCadFuncionariosHistCARGO: TStringField;
    CDCadGruposCODIGO: TAutoIncField;
    CDCadGruposCODNIVELACESSO: TStringField;
    CDCadGruposCODFORMATOCODIGO: TIntegerField;
    CDCadGruposDESCRICAO: TStringField;
    CDCadGruposDATACADASTRO: TDateField;
    CDCadGruposCODUSUARIOCAD: TStringField;
    CDCadGruposDATAULTALT: TDateField;
    CDCadGruposCODUSUARIOALT: TStringField;
    CDCadGruposUSUARIOCAD: TStringField;
    CDCadGruposUSUARIOALT: TStringField;
    CDCadUnidadesCODIGO: TStringField;
    CDCadUnidadesCODGRUPO: TIntegerField;
    CDCadAdmCorpCODIGO: TStringField;
    CDCadAdmCorpCODEMPRESA: TStringField;
    CDCadAdmCorpCODGRUPO: TIntegerField;
    CDCadAdmCorpCODEMPRESAS: TAutoIncField;
    CDCadAdmCorpMATRICULA: TStringField;
    CDCadAdmCorpNOME: TStringField;
    CDCadAdmCorpSENHA: TStringField;
    CDCadAdmCorpLOGADO: TStringField;
    CDCadAdmCorpQUEDAENERGIA: TStringField;
    CDCadAdmCorpTEMPORARIO: TStringField;
    CDCadAdmCorpDATAFIM: TDateTimeField;
    CDCadAdmCorpCODNIVELACESSO: TStringField;
    CDCadAdmCorpCODPERMISSAOACESSO: TIntegerField;
    CDCadAdmCorpCODPERMISSAOINCLUSAO: TIntegerField;
    CDCadAdmCorpCODPERMISSAOALTERACAO: TIntegerField;
    CDCadAdmCorpCODPERMISSAOEXCLUSAO: TIntegerField;
    CDCadAdmCorpSENHAALTERADA: TStringField;
    CDCadAdmCorpDATACADASTRO: TDateField;
    CDCadAdmCorpCODUSUARIOCAD: TStringField;
    CDCadAdmCorpDATAULTALT: TDateField;
    CDCadAdmCorpCODUSUARIOALT: TStringField;
    CDCadAdmCorpUSUARIOCAD: TStringField;
    CDCadAdmCorpUSUARIOALT: TStringField;
    CDCadAdmCorpGRUPO: TStringField;
    CDCadAdmCorpEMPRESA: TStringField;
    CDCadAdmCorpFUNCIONARIO: TStringField;
    CDCadAdmCorpNIVELACESSO: TStringField;
    CDCadAdmUnidCODIGO: TStringField;
    CDCadAdmUnidCODEMPRESA: TStringField;
    CDCadAdmUnidCODGRUPO: TIntegerField;
    CDCadAdmUnidCODEMPRESAS: TAutoIncField;
    CDCadAdmUnidMATRICULA: TStringField;
    CDCadAdmUnidNOME: TStringField;
    CDCadAdmUnidSENHA: TStringField;
    CDCadAdmUnidLOGADO: TStringField;
    CDCadAdmUnidQUEDAENERGIA: TStringField;
    CDCadAdmUnidTEMPORARIO: TStringField;
    CDCadAdmUnidDATAFIM: TDateTimeField;
    CDCadAdmUnidCODNIVELACESSO: TStringField;
    CDCadAdmUnidCODPERMISSAOACESSO: TIntegerField;
    CDCadAdmUnidCODPERMISSAOINCLUSAO: TIntegerField;
    CDCadAdmUnidCODPERMISSAOALTERACAO: TIntegerField;
    CDCadAdmUnidCODPERMISSAOEXCLUSAO: TIntegerField;
    CDCadAdmUnidSENHAALTERADA: TStringField;
    CDCadAdmUnidDATACADASTRO: TDateField;
    CDCadAdmUnidCODUSUARIOCAD: TStringField;
    CDCadAdmUnidDATAULTALT: TDateField;
    CDCadAdmUnidCODUSUARIOALT: TStringField;
    CDCadAdmUnidUSUARIOCAD: TStringField;
    CDCadAdmUnidUSUARIOALT: TStringField;
    CDCadAdmUnidGRUPO: TStringField;
    CDCadAdmUnidEMPRESA: TStringField;
    CDCadAdmUnidFUNCIONARIO: TStringField;
    CDCadAdmUnidNIVELACESSO: TStringField;
    CDCadImagensCODIGO: TAutoIncField;
    CDCadImagensCODEMPRESA: TStringField;
    CDCadImagensTIPO: TStringField;
    CDCadImagensCODEQUIPAMENTO: TStringField;
    CDCadImagensCODITEMSECUNDARIO: TStringField;
    CDCadImagensDESCRICAO: TStringField;
    CDCadImagensPONTO: TStringField;
    CDCadImagensDATACADASTRO: TDateTimeField;
    CDCadImagensCODUSUARIOCAD: TStringField;
    CDCadImagensDATAULTALT: TDateTimeField;
    CDCadImagensCODUSUARIOALT: TStringField;
    CDCadImagensTIPOFOTO: TStringField;
    CDCadImagensFOTO: TBlobField;
    CDCadImagensOBSERVACOES: TBlobField;
    CDCadImagensEQUIPAMENTO: TStringField;
    CDCadImagensUSUARIOCAD: TStringField;
    CDCadImagensUSUARIOALT: TStringField;
    CDCadLubrificProgEquipCODIGO: TStringField;
    CDCadLubrificProgEquipCODEMPRESA: TStringField;
    CDCadLubrificProgEquipCODEQUIPAMENTO: TStringField;
    CDCadLubrificProgEquipCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDCadLubrificProgEquipCODMONITORAMENTO: TIntegerField;
    CDCadLubrificProgEquipDESCRICAO: TStringField;
    CDCadLubrificProgEquipCRITICIDADE: TStringField;
    CDCadLubrificProgEquipDTAINICIO1: TDateTimeField;
    CDCadLubrificProgEquipREPROGRAMAR1: TStringField;
    CDCadLubrificProgEquipREPROGRAMAR2: TStringField;
    CDCadLubrificProgEquipLEITURA: TIntegerField;
    CDCadLubrificProgEquipRELATORIO: TStringField;
    CDCadLubrificProgEquipGRUPOINSP: TStringField;
    CDCadLubrificProgEquipDATACADASTRO: TDateTimeField;
    CDCadLubrificProgEquipCODUSUARIOCAD: TStringField;
    CDCadLubrificProgEquipDATAULTALT: TDateTimeField;
    CDCadLubrificProgEquipCODUSUARIOALT: TStringField;
    CDCadLubrificProgEquipOBSERVACOES: TBlobField;
    CDCadLubrificProgEquipUSUARIOCAD: TStringField;
    CDCadLubrificProgEquipUSUARIOALT: TStringField;
    CDCadLubrificProgEquipDESCLUBRIFICPROGFAMEQUIP: TStringField;
    CDCadLubrificProgEquipPROGRAMACAO2: TStringField;
    CDCadLubrificProgEquipEQUIPAMENTO: TStringField;
    CDCadLubrificProgEquipROTA: TStringField;
    CDCadLubrificProgFamEquipCODIGO: TStringField;
    CDCadLubrificProgFamEquipCODEMPRESA: TStringField;
    CDCadLubrificProgFamEquipCODFAMILIAEQUIP: TStringField;
    CDCadLubrificProgFamEquipCODMONITORAMENTO: TIntegerField;
    CDCadLubrificProgFamEquipDESCRICAO: TStringField;
    CDCadLubrificProgFamEquipPROGRAMARPOR1: TStringField;
    CDCadLubrificProgFamEquipPROGRAMARPOR2: TStringField;
    CDCadLubrificProgFamEquipPROGRAMARPOR3: TStringField;
    CDCadLubrificProgFamEquipATIVO: TStringField;
    CDCadLubrificProgFamEquipVISIVEL: TStringField;
    CDCadLubrificProgFamEquipDATACADASTRO: TDateTimeField;
    CDCadLubrificProgFamEquipCODUSUARIOCAD: TStringField;
    CDCadLubrificProgFamEquipDATAULTALT: TDateTimeField;
    CDCadLubrificProgFamEquipCODUSUARIOALT: TStringField;
    CDCadLubrificProgFamEquipOBSERVACOES: TBlobField;
    CDCadLubrificProgFamEquipFAMILIAEQUIPAMENTO: TStringField;
    CDCadLubrificProgFamEquipMONITORAMENTO: TStringField;
    CDCadLubrificProgFamEquipPROGRAMACAO2: TStringField;
    CDCadLubrificProgFamEquipUSUARIOCAD: TStringField;
    CDCadLubrificProgFamEquipUSUARIOALT: TStringField;
    CDCadLubrificProgFamEquipPlanoTrabCODIGO: TAutoIncField;
    CDCadLubrificProgFamEquipPlanoTrabCODEMPRESA: TStringField;
    CDCadLubrificProgFamEquipPlanoTrabCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDCadLubrificProgFamEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    CDCadLubrificProgFamEquipPlanoTrabDESCRICAO: TStringField;
    CDCadLubrificProgFamEquipPlanoTrabDETALHES: TBlobField;
    CDCadLubrificProgFamEquipPartesCODIGO: TAutoIncField;
    CDCadLubrificProgFamEquipPartesCODEMPRESA: TStringField;
    CDCadLubrificProgFamEquipPartesDESCRICAO: TStringField;
    CDCadLubrificProgFamEquipPartesCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDCadLubrificProgFamEquipPartesCODFAMILIAEQUIP: TStringField;
    CDCadManutProgFamEquipCODIGO: TStringField;
    CDCadManutProgFamEquipCODEMPRESA: TStringField;
    CDCadManutProgFamEquipCODFAMILIAEQUIP: TStringField;
    CDCadManutProgFamEquipCODMONITORAMENTO: TIntegerField;
    CDCadManutProgFamEquipDESCRICAO: TStringField;
    CDCadManutProgFamEquipPROGRAMARPOR1: TStringField;
    CDCadManutProgFamEquipPROGRAMARPOR2: TStringField;
    CDCadManutProgFamEquipPROGRAMARPOR3: TStringField;
    CDCadManutProgFamEquipATIVO: TStringField;
    CDCadManutProgFamEquipVISIVEL: TStringField;
    CDCadManutProgFamEquipDATACADASTRO: TDateTimeField;
    CDCadManutProgFamEquipCODUSUARIOCAD: TStringField;
    CDCadManutProgFamEquipDATAULTALT: TDateTimeField;
    CDCadManutProgFamEquipCODUSUARIOALT: TStringField;
    CDCadManutProgFamEquipOBSERVACOES: TBlobField;
    CDCadManutProgFamEquipFAMILIAEQUIPAMENTO: TStringField;
    CDCadManutProgFamEquipMONITORAMENTO: TStringField;
    CDCadManutProgFamEquipPROGRAMACAO2: TStringField;
    CDCadManutProgFamEquipUSUARIOCAD: TStringField;
    CDCadManutProgFamEquipUSUARIOALT: TStringField;
    CDCadManutProgFamEquipPlanoTrabCODIGO: TAutoIncField;
    CDCadManutProgFamEquipPlanoTrabCODEMPRESA: TStringField;
    CDCadManutProgFamEquipPlanoTrabCODMANUTPROGFAMEQUIP: TStringField;
    CDCadManutProgFamEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    CDCadManutProgFamEquipPlanoTrabDESCRICAO: TStringField;
    CDCadManutProgFamEquipPlanoTrabDETALHES: TBlobField;
    CDCadMonitoramentoCODIGO: TAutoIncField;
    CDCadMonitoramentoCODEMPRESA: TStringField;
    CDCadMonitoramentoCODPONTOINSPECAO: TStringField;
    CDCadMonitoramentoCODCONTADOR: TStringField;
    CDCadMonitoramentoCODORDEMSERVICO: TIntegerField;
    CDCadMonitoramentoDESCRICAO: TStringField;
    CDCadMonitoramentoTIPOPONTO: TStringField;
    CDCadMonitoramentoCODPONTOINSPLOC: TIntegerField;
    CDCadMonitoramentoEMISSAOOS: TStringField;
    CDCadMonitoramentoDATACADASTRO: TDateTimeField;
    CDCadMonitoramentoCODUSUARIOCAD: TStringField;
    CDCadMonitoramentoDATAULTALT: TDateTimeField;
    CDCadMonitoramentoCODUSUARIOALT: TStringField;
    CDCadMonitoramentoOBSERVACOES: TBlobField;
    CDCadMonitoramentoUSUARIOCAD: TStringField;
    CDCadMonitoramentoUSUARIOALT: TStringField;
    CDCadMonitoramentoPONTOINSPECAO: TStringField;
    CDCadMonitoramentoCONTADOR: TStringField;
    CDCadMonitoramentoCODPROGRAMACAO: TStringField;
    CDCadMonitoramentoPROGRAMACAO: TStringField;
    CDCadMonitoramentoPONTOINSPLOC: TStringField;
    CDCadMotivoParadaCODIGO: TStringField;
    CDCadMotivoParadaDESCRICAO: TStringField;
    CDCadMotivoParadaATIVO: TStringField;
    CDCadMotivoParadaVISIVEL: TStringField;
    CDCadMotivoParadaDATACADASTRO: TDateTimeField;
    CDCadMotivoParadaCODUSUARIOCAD: TStringField;
    CDCadMotivoParadaDATAULTALT: TDateTimeField;
    CDCadMotivoParadaCODUSUARIOALT: TStringField;
    CDCadMotivoParadaUSUARIOCAD: TStringField;
    CDCadMotivoParadaUSUARIOALT: TStringField;
    CDCadOficinasCODIGO: TStringField;
    CDCadOficinasCODEMPRESA: TStringField;
    CDCadOficinasCODCENTROCUSTO: TStringField;
    CDCadOficinasDESCRICAO: TStringField;
    CDCadOficinasDATACADASTRO: TDateTimeField;
    CDCadOficinasCODUSUARIOCAD: TStringField;
    CDCadOficinasDATAULTALT: TDateTimeField;
    CDCadOficinasCODUSUARIOALT: TStringField;
    CDCadOficinasCENTROCUSTO: TStringField;
    CDCadOficinasUSUARIOCAD: TStringField;
    CDCadOficinasUSUARIOALT: TStringField;
    CDCadPecaReposicaoKitCODIGO: TStringField;
    CDCadPecaReposicaoKitCODEMPRESA: TStringField;
    CDCadPecaReposicaoKitDESCRICAO: TStringField;
    CDCadPecaReposicaoKitQUANTIDADE: TIntegerField;
    CDCadPecaReposicaoKitQTDERESERV: TIntegerField;
    CDCadPecaReposicaoKitDATACADASTRO: TDateTimeField;
    CDCadPecaReposicaoKitCODUSUARIOCAD: TStringField;
    CDCadPecaReposicaoKitDATAULTALT: TDateTimeField;
    CDCadPecaReposicaoKitCODUSUARIOALT: TStringField;
    CDCadPecaReposicaoKitUSUARIOCAD: TStringField;
    CDCadPecaReposicaoKitUSUARIOALT: TStringField;
    CDCadPecaReposicaoKitItensCODIGO: TAutoIncField;
    CDCadPecaReposicaoKitItensCODEMPRESA: TStringField;
    CDCadPecaReposicaoKitItensCODKIT: TStringField;
    CDCadPecaReposicaoKitItensCODPECAREPOSICAO: TStringField;
    CDCadPecaReposicaoKitItensQUANTIDADE: TIntegerField;
    CDCadPecaReposicaoKitItensREFERENCIA: TStringField;
    CDCadPecaReposicaoKitItensDESCRICAO: TStringField;
    CDCadPecasReposicaoDadosCODIGO: TAutoIncField;
    CDCadPecasReposicaoDadosCODEMPRESA: TStringField;
    CDCadPecasReposicaoDadosCODFAMILIAPECASREP: TStringField;
    CDCadPecasReposicaoDadosCODPECAREPOSICAO: TStringField;
    CDCadPecasReposicaoDadosREGISTRO1: TStringField;
    CDCadPecasReposicaoDadosREGISTRO2: TStringField;
    CDCadPecasReposicaoDadosREGISTRO3: TStringField;
    CDCadPecasReposicaoDadosREGISTRO4: TStringField;
    CDCadPecasReposicaoDadosREGISTRO5: TStringField;
    CDCadPecasReposicaoDadosREGISTRO6: TStringField;
    CDCadPecasReposicaoDadosREGISTRO7: TStringField;
    CDCadPecasReposicaoDadosREGISTRO8: TStringField;
    CDCadPecasReposicaoDadosREGISTRO9: TStringField;
    CDCadPecasReposicaoDadosREGISTRO10: TStringField;
    CDCadPecasReposicaoDadosREGISTRO11: TStringField;
    CDCadPecasReposicaoDadosREGISTRO12: TStringField;
    CDCadPecasReposicaoDadosINFORMACOES: TBlobField;
    CDCadPecasReposicaoHistPecasREFERENCIA: TStringField;
    CDCadPecasReposicaoHistPecasPECA: TStringField;
    CDCadPecasReposicaoHistPecasCODORDEMSERVICO: TIntegerField;
    CDCadPecasReposicaoHistPecasOS: TStringField;
    CDCadPecasReposicaoHistPecasQTDESOLIC: TIntegerField;
    CDCadPecasReposicaoHistPecasENTRADA: TDateTimeField;
    CDCadPecasReposicaoHistPecasCODEQUIPAMENTO: TStringField;
    CDCadPecasReposicaoHistPecasDESCEQUIPAMENTO: TStringField;
    CDCadPecasReposicaoInstEquipCODIGO: TStringField;
    CDCadPecasReposicaoInstEquipREFERENCIA: TStringField;
    CDCadPecasReposicaoInstEquipPECA: TStringField;
    CDCadPecasReposicaoInstEquipQUANTIDADE: TIntegerField;
    CDCadPecasReposicaoInstEquipEQUIPAMENTO: TStringField;
    CDCadPecasReposicaoInstEquipLOCALIZACAO: TStringField;
    CDCadPecasReposicaoHistEquipREFERENCIA: TStringField;
    CDCadPecasReposicaoHistEquipPECA: TStringField;
    CDCadPecasReposicaoHistEquipCODORDEMSERVICO: TIntegerField;
    CDCadPecasReposicaoHistEquipOS: TStringField;
    CDCadPecasReposicaoHistEquipQTDESOLIC: TIntegerField;
    CDCadPecasReposicaoHistEquipENTRADA: TDateTimeField;
    CDCadPecasReposicaoHistEquipCODEQUIPAMENTO: TStringField;
    CDCadPecasReposicaoHistEquipDESCEQUIPAMENTO: TStringField;
    CDCadPecasReposicaoInstPecasCODIGO: TStringField;
    CDCadPecasReposicaoInstPecasREFERENCIA: TStringField;
    CDCadPecasReposicaoInstPecasPECA: TStringField;
    CDCadPecasReposicaoInstPecasQUANTIDADE: TIntegerField;
    CDCadPecasReposicaoInstPecasCODEQUIPAMENTO: TStringField;
    CDCadPecasReposicaoInstPecasEQUIPAMENTO: TStringField;
    CDCadPecasReposicaoInstPecasLOCALIZACAO: TStringField;
    CDCadPlanoTrabalhoCODIGO: TStringField;
    CDCadPlanoTrabalhoCODEMPRESA: TStringField;
    CDCadPlanoTrabalhoCODFAMILIAEQUIP: TStringField;
    CDCadPlanoTrabalhoDESCRICAO: TStringField;
    CDCadPlanoTrabalhoATIVO: TStringField;
    CDCadPlanoTrabalhoVISIVEL: TStringField;
    CDCadPlanoTrabalhoAUTOMATICO: TStringField;
    CDCadPlanoTrabalhoDATACADASTRO: TDateTimeField;
    CDCadPlanoTrabalhoCODUSUARIOCAD: TStringField;
    CDCadPlanoTrabalhoDATAULTALT: TDateTimeField;
    CDCadPlanoTrabalhoCODUSUARIOALT: TStringField;
    CDCadPlanoTrabalhoDETALHES: TBlobField;
    CDCadPlanoTrabalhoOBSERVACOES: TBlobField;
    CDCadPlanoTrabalhoUSUARIOCAD: TStringField;
    CDCadPlanoTrabalhoUSUARIOALT: TStringField;
    CDCadPontosInspecaoCODIGO: TStringField;
    CDCadPontosInspecaoCODEMPRESA: TStringField;
    CDCadPontosInspecaoDESCRICAO: TStringField;
    CDCadPontosInspecaoCODFAMILIAEQUIP: TStringField;
    CDCadPontosInspecaoDATACADASTRO: TDateTimeField;
    CDCadPontosInspecaoCODUSUARIOCAD: TStringField;
    CDCadPontosInspecaoDATAULTALT: TDateTimeField;
    CDCadPontosInspecaoCODUSUARIOALT: TStringField;
    CDCadPontosInspecaoFAMILIAEQUIP: TStringField;
    CDCadPontosInspecaoUSUARIOCAD: TStringField;
    CDCadPontosInspecaoUSUARIOALT: TStringField;
    CDCadContadoresCODIGO: TStringField;
    CDCadContadoresCODEMPRESA: TStringField;
    CDCadContadoresDESCRICAO: TStringField;
    CDCadContadoresCODPROGRAMACAO: TStringField;
    CDCadContadoresDATACADASTRO: TDateTimeField;
    CDCadContadoresCODUSUARIOCAD: TStringField;
    CDCadContadoresDATAULTALT: TDateTimeField;
    CDCadContadoresCODUSUARIOALT: TStringField;
    CDCadContadoresPROGRAMACAO: TStringField;
    CDCadContadoresUSUARIOCAD: TStringField;
    CDCadContadoresUSUARIOALT: TStringField;
    CDCadRecursoKitCODIGO: TStringField;
    CDCadRecursoKitCODEMPRESA: TStringField;
    CDCadRecursoKitDESCRICAO: TStringField;
    CDCadRecursoKitQUANTIDADE: TIntegerField;
    CDCadRecursoKitQTDERESERV: TIntegerField;
    CDCadRecursoKitDATACADASTRO: TDateTimeField;
    CDCadRecursoKitCODUSUARIOCAD: TStringField;
    CDCadRecursoKitDATAULTALT: TDateTimeField;
    CDCadRecursoKitCODUSUARIOALT: TStringField;
    CDCadRecursoKitUSUARIOCAD: TStringField;
    CDCadRecursoKitUSUARIOALT: TStringField;
    CDCadRecursoKitItensCODIGO: TAutoIncField;
    CDCadRecursoKitItensCODEMPRESA: TStringField;
    CDCadRecursoKitItensCODKIT: TStringField;
    CDCadRecursoKitItensCODRECURSO: TStringField;
    CDCadRecursoKitItensQUANTIDADE: TIntegerField;
    CDCadRecursoKitItensDESCRICAO: TStringField;
    CDCadRotasCODIGO: TStringField;
    CDCadRotasCODEMPRESA: TStringField;
    CDCadRotasDESCRICAO: TStringField;
    CDCadRotasDATAINICIO: TDateTimeField;
    CDCadRotasREPROGRAMAR: TStringField;
    CDCadRotasRELATORIO: TStringField;
    CDCadRotasDATACADASTRO: TDateTimeField;
    CDCadRotasCODUSUARIOCAD: TStringField;
    CDCadRotasDATAULTALT: TDateTimeField;
    CDCadRotasCODUSUARIOALT: TStringField;
    CDCadRotasOBSERVACOES: TBlobField;
    CDCadRotasUSUARIOCAD: TStringField;
    CDCadRotasUSUARIOALT: TStringField;
    CDCadRotasSequenciaInspCODIGO: TStringField;
    CDCadRotasSequenciaInspCODEMPRESA: TStringField;
    CDCadRotasSequenciaInspCODEQUIPAMENTO: TStringField;
    CDCadRotasSequenciaInspDESCRICAO: TStringField;
    CDCadRotasSequenciaInspREPROGRAMAR1: TStringField;
    CDCadRotasSequenciaInspGRUPOINSP: TStringField;
    CDCadRotasSequenciaInspCODMANUTPROGFAMEQUIP: TStringField;
    CDCadRotasSequenciaInspDTAINICIO1: TDateTimeField;
    CDCadRotasSequenciaInspRELATORIO: TStringField;
    CDCadRotasSequenciaInspItensCODIGO: TAutoIncField;
    CDCadRotasSequenciaInspItensCODEMPRESA: TStringField;
    CDCadRotasSequenciaInspItensCODMANUTPROGFAMEQUIP: TStringField;
    CDCadRotasSequenciaInspItensCODPARTE: TIntegerField;
    CDCadRotasSequenciaInspItensITEM: TStringField;
    CDCadRotasSequenciaInspItensDESCINSPECAO: TStringField;
    CDCadRotasSequenciaInspItensEQUIPPARADO: TStringField;
    CDCadRotasSequenciaInspItensEXECAUTONOMO: TStringField;
    CDCadRotasSequenciaInspItensDESCPARTE: TStringField;
    CDCadRotasSequenciaInspItensEspCODIGO: TAutoIncField;
    CDCadRotasSequenciaInspItensEspCODEMPRESA: TStringField;
    CDCadRotasSequenciaInspItensEspCODMANUTPROGEQUIP: TStringField;
    CDCadRotasSequenciaInspItensEspCODPARTE: TIntegerField;
    CDCadRotasSequenciaInspItensEspITEM: TStringField;
    CDCadRotasSequenciaInspItensEspDESCINSPECAO: TStringField;
    CDCadRotasSequenciaInspItensEspEQUIPPARADO: TStringField;
    CDCadRotasSequenciaInspItensEspEXECAUTONOMO: TStringField;
    CDCadRotasSequenciaInspItensEspEXECUTADO: TStringField;
    CDCadRotasSequenciaInspItensEspBOM: TStringField;
    CDCadRotasSequenciaInspItensEspREGULAR: TStringField;
    CDCadRotasSequenciaInspItensEspRUIM: TStringField;
    CDCadRotasSequenciaInspItensEspPARTE: TStringField;
    CDCadSolicitacaoTrabCODIGO: TAutoIncField;
    CDCadSolicitacaoTrabCODEMPRESA: TStringField;
    CDCadSolicitacaoTrabCODEQUIPAMENTO: TStringField;
    CDCadSolicitacaoTrabCODSOLICITANTE: TStringField;
    CDCadSolicitacaoTrabCODCENTROCUSTO: TStringField;
    CDCadTipoManutencaoCODIGO: TStringField;
    CDCadTipoManutencaoDESCRICAO: TStringField;
    CDCadTipoManutencaoTIPOMANUTENCAO: TStringField;
    CDCadTipoManutencaoCONFIABILIDADE: TStringField;
    CDCadTipoManutencaoDATACADASTRO: TDateTimeField;
    CDCadTipoManutencaoCODUSUARIOCAD: TStringField;
    CDCadTipoManutencaoDATAULTALT: TDateTimeField;
    CDCadTipoManutencaoCODUSUARIOALT: TStringField;
    CDCadTipoManutencaoUSUARIOCAD: TStringField;
    CDCadTipoManutencaoUSUARIOALT: TStringField;
    CDCadTipoProgramacaoCODIGO: TStringField;
    CDCadTipoProgramacaoDESCRICAO: TStringField;
    CDCadTipoProgramacaoTIPO: TStringField;
    CDCadTipoProgramacaoATIVO: TStringField;
    CDCadTipoProgramacaoVISIVEL: TStringField;
    CDCadTipoProgramacaoDATACADASTRO: TDateTimeField;
    CDCadTipoProgramacaoCODUSUARIOCAD: TStringField;
    CDCadTipoProgramacaoDATAULTALT: TDateTimeField;
    CDCadTipoProgramacaoCODUSUARIOALT: TStringField;
    CDCadTipoProgramacaoUSUARIOCAD: TStringField;
    CDCadTipoProgramacaoUSUARIOALT: TStringField;
    CDCadUsuariosCODIGO: TStringField;
    CDCadUsuariosCODEMPRESA: TStringField;
    CDCadUsuariosCODGRUPO: TIntegerField;
    CDCadUsuariosCODEMPRESAS: TAutoIncField;
    CDCadUsuariosMATRICULA: TStringField;
    CDCadUsuariosNOME: TStringField;
    CDCadUsuariosSENHA: TStringField;
    CDCadUsuariosLOGADO: TStringField;
    CDCadUsuariosQUEDAENERGIA: TStringField;
    CDCadUsuariosTEMPORARIO: TStringField;
    CDCadUsuariosDATAFIM: TDateTimeField;
    CDCadUsuariosCODNIVELACESSO: TStringField;
    CDCadUsuariosCODPERMISSAOACESSO: TIntegerField;
    CDCadUsuariosCODPERMISSAOINCLUSAO: TIntegerField;
    CDCadUsuariosCODPERMISSAOALTERACAO: TIntegerField;
    CDCadUsuariosCODPERMISSAOEXCLUSAO: TIntegerField;
    CDCadUsuariosSENHAALTERADA: TStringField;
    CDCadUsuariosDATACADASTRO: TDateField;
    CDCadUsuariosCODUSUARIOCAD: TStringField;
    CDCadUsuariosDATAULTALT: TDateField;
    CDCadUsuariosCODUSUARIOALT: TStringField;
    CDCadUsuariosUSUARIOCAD: TStringField;
    CDCadUsuariosUSUARIOALT: TStringField;
    CDCadUsuariosFUNCIONARIO: TStringField;
    CDCadUsuariosNIVELACESSO: TStringField;
    CDManutPeriodicasINDICE: TAutoIncField;
    CDManutPeriodicasCODEMPRESA: TStringField;
    CDManutPeriodicasCODIGO: TStringField;
    CDManutPeriodicasCODEQUIPAMENTO: TStringField;
    CDManutPeriodicasCODMANUTPROGFAMEQUIP: TStringField;
    CDManutPeriodicasCODMONITORAMENTO: TIntegerField;
    CDManutPeriodicasCODORDEMSERVICO: TIntegerField;
    CDManutPeriodicasMATRICULA: TStringField;
    CDManutPeriodicasDESCRICAO: TStringField;
    CDManutPeriodicasDTAINICIO1: TDateTimeField;
    CDManutPeriodicasREPROGRAMAR1: TStringField;
    CDManutPeriodicasLEITURA: TIntegerField;
    CDManutPeriodicasSITUACAO: TStringField;
    CDManutPeriodicasDATAEXECUCAO: TDateTimeField;
    CDManutPeriodicasDATAFECHAMENTO: TDateTimeField;
    CDManutPeriodicasRELATORIO: TStringField;
    CDManutPeriodicasGEROUOS: TStringField;
    CDManutPeriodicasREALIZADA: TStringField;
    CDManutPeriodicasGRUPOINSP: TStringField;
    CDManutPeriodicasSITUACAOOS: TStringField;
    CDManutPeriodicasCODMANUTENCAO: TStringField;
    CDManutPeriodicasDATAINICIOREAL: TDateTimeField;
    CDManutPeriodicasDATAFIMREAL: TDateTimeField;
    CDManutPeriodicasEQUIPAMENTO: TStringField;
    CDManutPeriodicasMATRICULAOS: TStringField;
    CDManutPeriodicasFUNCIONARIOOS: TStringField;
    CDManutPeriodicasAREA: TStringField;
    CDLubrificVencCODIGO: TStringField;
    CDLubrificVencCODEQUIPAMENTO: TStringField;
    CDLubrificVencDESCRICAO: TStringField;
    CDLubrificVencDTAINICIO1: TDateTimeField;
    CDLubrificVencEQUIPAMENTO: TStringField;
    CDRotaEquipVencCODIGO: TStringField;
    CDRotaEquipVencCODEMPRESA: TStringField;
    CDRotaEquipVencDESCRICAO: TStringField;
    CDRotaEquipVencDATAINICIO: TDateTimeField;
    CDRotaEquipVencREPROGRAMAR: TStringField;
    CDRotaEquipVencRELATORIO: TStringField;
    CDRotaEquipVencSeqCODIGO: TAutoIncField;
    CDRotaEquipVencSeqCODEMPRESA: TStringField;
    CDRotaEquipVencSeqCODROTA: TStringField;
    CDRotaEquipVencSeqCODAREA: TStringField;
    CDRotaEquipVencSeqCODCELULA: TStringField;
    CDRotaEquipVencSeqCODLINHA: TStringField;
    CDRotaEquipVencSeqSEQUENCIA: TIntegerField;
    CDRotaEquipVencSeqCODFAMILIAEQUIP: TStringField;
    CDRotaEquipVencSeqAREA: TStringField;
    CDRotaEquipVencSeqCELULA: TStringField;
    CDRotaEquipVencSeqLINHA: TStringField;
    CDRotaEquipVencSeqFAMILIAEQUIP: TStringField;
    CDRotaEquipVencSeqCODEQUIPATUAL: TStringField;
    CDRotaEquipVencSeqEQUIPATUAL: TStringField;
    CDRotaEquipVencSeqFREQUENCIA: TIntegerField;
    CDRotaEquipVencSeqManutCODIGO: TStringField;
    CDRotaEquipVencSeqManutCODEMPRESA: TStringField;
    CDRotaEquipVencSeqManutDESCRICAO: TStringField;
    CDRotaEquipVencSeqManutDTAINICIO1: TDateTimeField;
    CDRotaEquipVencSeqManutRELATORIO: TStringField;
    CDParadasDiariasEquipCODIGO: TStringField;
    CDParadasDiariasEquipCODEMPRESA: TStringField;
    CDParadasDiariasEquipDESCRICAO: TStringField;
    CDParadasDiariasEquipSECUNDARIO: TStringField;
    CDParadasDiariasEquipDateField1: TDateField;
    CDParadasDiariasEquipDateField2: TDateField;
    CDParadasDiariasEquipDateField3: TDateField;
    CDParadasDiariasEquipDateField4: TDateField;
    CDParadasDiariasEquipDateField5: TDateField;
    CDParadasDiariasEquipDateField6: TDateField;
    CDParadasDiariasEquipDateField7: TDateField;
    CDParadasDiariasEquipDateField8: TDateField;
    CDParadasDiariasEquipDateField9: TDateField;
    CDParadasDiariasEquipDateField10: TDateField;
    CDParadasDiariasEquipDateField11: TDateField;
    CDParadasDiariasEquipDateField12: TDateField;
    CDParadasDiariasEquipDateField13: TDateField;
    CDParadasDiariasEquipDateField14: TDateField;
    CDParadasDiariasEquipDateField15: TDateField;
    CDParadasDiariasEquipDateField16: TDateField;
    CDParadasDiariasEquipDateField17: TDateField;
    CDParadasDiariasEquipDateField18: TDateField;
    CDParadasDiariasEquipDateField19: TDateField;
    CDParadasDiariasEquipDateField20: TDateField;
    CDParadasDiariasEquipDateField21: TDateField;
    CDParadasDiariasEquipDateField22: TDateField;
    CDParadasDiariasEquipDateField23: TDateField;
    CDParadasDiariasEquipDateField24: TDateField;
    CDParadasDiariasEquipDateField25: TDateField;
    CDParadasDiariasEquipDateField26: TDateField;
    CDParadasDiariasEquipDateField27: TDateField;
    CDParadasDiariasEquipDateField28: TDateField;
    CDParadasDiariasEquipDateField29: TDateField;
    CDParadasDiariasEquipDateField30: TDateField;
    CDParadasDiariasEquipDateField31: TDateField;
    CDParadasDiariasEquipParadasCODEQUIPAMENTO: TStringField;
    CDParadasDiariasEquipParadasDATAINICIOREAL: TDateTimeField;
    CDParadasDiariasEquipParadasDATAFIMREAL: TDateTimeField;
    CDParadasDiariasEquipParadasFALHA: TStringField;
    CDParadasDiariasEquipParadasPARADA: TStringField;
    CDParadasDiariasEquipParadasTIPOMANUTENCAO: TStringField;
    CDRelatGerencProdMObraTOTALHHPREV: TFMTBCDField;
    CDRelatGerencProdMObraPROD: TFMTBCDField;
    CDRelatGerencDispEquipCODIGO: TStringField;
    CDRelatGerencDispEquipDESCRICAO: TStringField;
    CDRelatGerencDispEquipHORASPARADASABERTAS: TFMTBCDField;
    CDRelatGerencDispEquipHORASPARADASFECHADAS: TFMTBCDField;
    CDRelatGerencDespEquipCODIGO: TStringField;
    CDRelatGerencDespEquipDESCRICAO: TStringField;
    CDRelatGerencDespEquipCODAREA: TStringField;
    CDRelatGerencDespEquipDESCAREA: TStringField;
    CDRelatGerencDespEquipCUSTOMOBRA: TFMTBCDField;
    CDRelatGerencDespEquipCUSTORECURSOS: TFMTBCDField;
    CDRelatGerencDespEquipCUSTOPECAS: TFMTBCDField;
    CDRelatGerencDespEquipCUSTOEXTRAS: TFMTBCDField;
    CDRelatGerencDespEquipCUSTOSECUNDARIOS: TFMTBCDField;
    CDRelatGerencNumParadasTIPOMANUTENCAO: TStringField;
    CDRelatGerencNumParadasTOTALOS: TLargeintField;
    CDRelatGerencHETOTALHE: TFMTBCDField;
    CDRotaPeriodicasCODIGO: TStringField;
    CDRotaPeriodicasCODEMPRESA: TStringField;
    CDRotaPeriodicasFREQUENCIA: TIntegerField;
    CDRotaPeriodicasDESCRICAO: TStringField;
    CDRotaPeriodicasREPROGRAMAR: TStringField;
    CDRotaPeriodicasRELATORIO: TStringField;
    CDRotaPeriodicasDTAINICIO1: TDateTimeField;
    CDRotaPeriodicasSITUACAOOS: TStringField;
    CDRotaPeriodicasCODMANUTENCAO: TStringField;
    CDRotaPeriodicasCODORDEMSERVICO: TAutoIncField;
    CDRotaPeriodicasMATRICULAOS: TStringField;
    CDRotaPeriodicasManutINDICE: TAutoIncField;
    CDRotaPeriodicasManutCODEMPRESA: TStringField;
    CDRotaPeriodicasManutCODIGO: TStringField;
    CDRotaPeriodicasManutCODORDEMSERVICO: TIntegerField;
    CDRotaPeriodicasManutMATRICULA: TStringField;
    CDRotaPeriodicasManutDESCRICAO: TStringField;
    CDRotaPeriodicasManutFREQUENCIA1: TIntegerField;
    CDRotaPeriodicasManutDTAINICIO1: TDateTimeField;
    CDRotaPeriodicasManutREPROGRAMAR1: TStringField;
    CDRotaPeriodicasManutSITUACAO: TStringField;
    CDRotaPeriodicasManutDATAEXECUCAO: TDateTimeField;
    CDRotaPeriodicasManutDATAFECHAMENTO: TDateTimeField;
    CDRotaPeriodicasManutRELATORIO: TStringField;
    CDRotaPeriodicasManutGEROUOS: TStringField;
    CDRotaPeriodicasManutGRUPOINSP: TStringField;
    CDRotaPeriodicasManutREALIZADA: TStringField;
    CDRotaPeriodicasManutCODEQUIPAMENTO: TStringField;
    CDRotaPeriodicasManutEQUIPAMENTO: TStringField;
    CDRotaPeriodicasManutCODROTA: TStringField;
    CDTotalFamiliasTOTAL1: TLargeintField;
    CDTotalFamiliasTOTAL2: TLargeintField;
    CDTotalFamiliasTOTAL3: TLargeintField;
    CDTotalFamiliasTOTAL4: TLargeintField;
    CDUsuariosAtivosMATRICULA: TStringField;
    CDUsuariosAtivosNOME: TStringField;
    CDUsuariosAtivosLOGADO: TStringField;
    CDUsuariosAtivosESTACAO: TStringField;
    CDUsuariosAtivosDATAACESSO: TDateTimeField;
    CDUsuariosAtivosHORAENTRADA: TDateTimeField;
    CDUsuariosAtivosPERIODO: TIntegerField;
    CDUsuarioAcessosCODIGO: TAutoIncField;
    CDUsuarioAcessosCODEMPRESA: TStringField;
    CDUsuarioAcessosUSUARIO: TStringField;
    CDUsuarioAcessosMODULO: TStringField;
    CDUsuarioAcessosDATAACESSO: TDateTimeField;
    CDUsuarioAcessosDATASAIDA: TDateTimeField;
    CDUsuarioAcessosESTACAO: TStringField;
    CDEquipamentoSubstHistCODIGO: TAutoIncField;
    CDEquipamentoSubstHistCODEMPRESA: TStringField;
    CDEquipamentoSubstHistCODEQUIPAMENTO: TStringField;
    CDEquipamentoSubstHistCODEQUIPAMENTOPAI: TStringField;
    CDEquipamentoSubstHistCODEQUIPAMENTOSUBS: TStringField;
    CDEquipamentoSubstHistCODAREA: TStringField;
    CDEquipamentoSubstHistCODCELULA: TStringField;
    CDEquipamentoSubstHistCODLINHA: TStringField;
    CDEquipamentoSubstHistSEQUENCIA: TIntegerField;
    CDEquipamentoSubstHistDATAINSTALACAO: TDateTimeField;
    CDEquipamentoSubstHistDATARETIRADA: TDateTimeField;
    CDEquipamentoSubstHistCODUSUARIOALT: TStringField;
    CDEquipamentoSubstHistMOTIVOTROCA: TBlobField;
    CDEquipamentoSubstHistEQUIPAMENTO: TStringField;
    CDEquipamentoSubstHistAREA: TStringField;
    CDEquipamentoSubstHistCELULA: TStringField;
    CDEquipamentoSubstHistLINHA: TStringField;
    CDRelatGerencMTBFCODIGO: TStringField;
    CDRelatGerencMTBFDESCRICAO: TStringField;
    CDRelatGerencMTBFVALOR: TFloatField;
    CDRelatGerencMTBFDATA1: TStringField;
    CDRelatGerencMTBFDATA2: TStringField;
    CDRelatGerencPercParadasTOTALOS: TLargeintField;
    CDRelatGerencPercParadasPERCENTCORRET: TFMTBCDField;
    CDRelatGerencPercParadasPERCENTPREV: TFMTBCDField;
    CDRelatGerencPercParadasPERCENTPRED: TFMTBCDField;
    CDRelatGerencPercParadasPERCENTOUTROS: TFMTBCDField;
    CDLubrificPeriodicasPERIODOCONSULTA: TStringField;
    CDManutVencCODIGO: TStringField;
    CDManutVencCODEQUIPAMENTO: TStringField;
    CDManutVencDESCRICAO: TStringField;
    CDManutVencDTAINICIO1: TDateTimeField;
    CDManutVencEQUIPAMENTO: TStringField;
    CDCadLubrificProgEquipCODORDEMSERVICO: TIntegerField;
    CDManutPeriodicasPERIODOCONSULTA: TStringField;
    CDCadRotasSequenciaInspFREQUENCIA1: TSmallintField;
    CDCadRotasFREQUENCIA: TSmallintField;
    CDCadLubrificProgEquipFREQUENCIA1: TSmallintField;
    CDManutVencFREQUENCIA1: TSmallintField;
    CDLubrificVencFREQUENCIA1: TSmallintField;
    CDRotaEquipVencFREQUENCIA: TSmallintField;
    CDCadManutProgEquipCODIGO: TStringField;
    CDCadManutProgEquipCODEMPRESA: TStringField;
    CDCadManutProgEquipCODEQUIPAMENTO: TStringField;
    CDCadManutProgEquipCODMANUTPROGFAMEQUIP: TStringField;
    CDCadManutProgEquipCODMONITORAMENTO: TIntegerField;
    CDCadManutProgEquipDESCRICAO: TStringField;
    CDCadManutProgEquipCRITICIDADE: TStringField;
    CDCadManutProgEquipFREQUENCIA1: TSmallintField;
    CDCadManutProgEquipDTAINICIO1: TDateTimeField;
    CDCadManutProgEquipREPROGRAMAR1: TStringField;
    CDCadManutProgEquipREPROGRAMAR2: TStringField;
    CDCadManutProgEquipLEITURA: TIntegerField;
    CDCadManutProgEquipRELATORIO: TStringField;
    CDCadManutProgEquipGRUPOINSP: TStringField;
    CDCadManutProgEquipDATACADASTRO: TDateTimeField;
    CDCadManutProgEquipCODUSUARIOCAD: TStringField;
    CDCadManutProgEquipDATAULTALT: TDateTimeField;
    CDCadManutProgEquipCODUSUARIOALT: TStringField;
    CDCadManutProgEquipOBSERVACOES: TBlobField;
    CDCadManutProgEquipUSUARIOCAD: TStringField;
    CDCadManutProgEquipUSUARIOALT: TStringField;
    CDCadManutProgEquipDESCMANUTPROGFAMEQUIP: TStringField;
    CDCadManutProgEquipPROGRAMACAO2: TStringField;
    CDCadManutProgEquipEQUIPAMENTO: TStringField;
    CDCadManutProgEquipROTA: TStringField;
    CDCadManutProgEquipCODORDEMSERVICO: TIntegerField;
    CDManutPeriodicasFREQUENCIA1: TSmallintField;
    CDLubrificPeriodicasINDICE: TAutoIncField;
    CDLubrificPeriodicasCODEMPRESA: TStringField;
    CDLubrificPeriodicasCODIGO: TStringField;
    CDLubrificPeriodicasCODEQUIPAMENTO: TStringField;
    CDLubrificPeriodicasCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDLubrificPeriodicasCODMONITORAMENTO: TIntegerField;
    CDLubrificPeriodicasCODORDEMSERVICO: TIntegerField;
    CDLubrificPeriodicasMATRICULA: TStringField;
    CDLubrificPeriodicasDESCRICAO: TStringField;
    CDLubrificPeriodicasFREQUENCIA1: TSmallintField;
    CDLubrificPeriodicasDTAINICIO1: TDateTimeField;
    CDLubrificPeriodicasREPROGRAMAR1: TStringField;
    CDLubrificPeriodicasLEITURA: TIntegerField;
    CDLubrificPeriodicasSITUACAO: TStringField;
    CDLubrificPeriodicasDATAEXECUCAO: TDateTimeField;
    CDLubrificPeriodicasDATAFECHAMENTO: TDateTimeField;
    CDLubrificPeriodicasRELATORIO: TStringField;
    CDLubrificPeriodicasGEROUOS: TStringField;
    CDLubrificPeriodicasREALIZADA: TStringField;
    CDLubrificPeriodicasGRUPOINSP: TStringField;
    CDLubrificPeriodicasSITUACAOOS: TStringField;
    CDLubrificPeriodicasCODMANUTENCAO: TStringField;
    CDLubrificPeriodicasDATAINICIOREAL: TDateTimeField;
    CDLubrificPeriodicasDATAFIMREAL: TDateTimeField;
    CDLubrificPeriodicasEQUIPAMENTO: TStringField;
    CDLubrificPeriodicasMATRICULAOS: TStringField;
    CDLubrificPeriodicasFUNCIONARIOOS: TStringField;
    CDLubrificPeriodicasAREA: TStringField;
    CDCadOrdemServico: TClientDataSet;
    DSCadOrdemServico: TDataSource;
    CDCadOrdemServicoServSolic: TClientDataSet;
    CDCadOrdemServicoEquipe: TClientDataSet;
    CDCadOrdemServicoEquipeMObra: TClientDataSet;
    CDCadOrdemServicoEquipeMObraCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeMObraCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeMObraCODEQUIPE: TIntegerField;
    CDCadOrdemServicoEquipeMObraCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeMObraCODCARGO: TStringField;
    CDCadOrdemServicoEquipeMObraCODCALENDARIO: TStringField;
    CDCadOrdemServicoEquipeMObraCARGO: TStringField;
    CDCadOrdemServicoEquipeMObraCALENDARIO: TStringField;
    CDCadOrdemServicoEquipeMObraHOMEMHORAOS: TAggregateField;
    CDCadOrdemServicoEquipePecas: TClientDataSet;
    CDCadOrdemServicoEquipePecasCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipePecasCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipePecasCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipePecasCODPECASREPOSICAO: TStringField;
    CDCadOrdemServicoEquipePecasQTDESOLIC: TIntegerField;
    CDCadOrdemServicoEquipePecasQTDERESERV: TIntegerField;
    CDCadOrdemServicoEquipePecasENTRADA: TDateTimeField;
    CDCadOrdemServicoEquipePecasREFERENCIA: TStringField;
    CDCadOrdemServicoEquipePecasESTOQUE: TIntegerField;
    CDCadOrdemServicoEquipePecasPECA: TStringField;
    CDCadOrdemServicoEquipeRecursos: TClientDataSet;
    CDCadOrdemServicoEquipeRecursosCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeRecursosCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeRecursosCODEQUIPE: TIntegerField;
    CDCadOrdemServicoEquipeRecursosCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeRecursosCODRECURSO: TStringField;
    CDCadOrdemServicoEquipeRecursosQTDESOLIC: TIntegerField;
    CDCadOrdemServicoEquipeRecursosQTDERESERV: TIntegerField;
    CDCadOrdemServicoEquipeRecursosENTRADA: TDateTimeField;
    CDCadOrdemServicoEquipeRecursosRECURSO: TStringField;
    CDCadOrdemServicoEquipeRecursosESTOQUE: TIntegerField;
    CDCadOrdemServicoEquipePlanoTrab: TClientDataSet;
    CDCadOrdemServicoEquipePlanoTrabCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipePlanoTrabCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipePlanoTrabCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipePlanoTrabCODPLANOTRABALHO: TStringField;
    CDCadOrdemServicoEquipePlanoTrabIMPRIMIR: TStringField;
    CDCadOrdemServicoEquipePlanoTrabPLANOTRABALHO: TStringField;
    CDCadOrdemServicoEquipePlanoTrabDETALHES: TBlobField;
    CDCadOrdemServicoEquipeMObraUtil: TClientDataSet;
    CDCadOrdemServicoEquipePecasUtil: TClientDataSet;
    CDCadOrdemServicoEquipeRecursosUtil: TClientDataSet;
    CDCadOrdemServicoEquipeMObraMovim: TClientDataSet;
    CDCadOrdemServicoEquipeMObraMovimCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeMObraMovimCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeMObraMovimCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeMObraMovimCODEQUIPE: TIntegerField;
    CDCadOrdemServicoEquipeMObraMovimCODCARGO: TStringField;
    CDCadOrdemServicoEquipeMObraMovimMATRICULA: TStringField;
    CDCadOrdemServicoEquipeMObraMovimNOME: TStringField;
    CDCadOrdemServicoEquipeMObraMovimENTRADA: TDateTimeField;
    CDCadOrdemServicoEquipeMObraMovimSAIDA: TDateTimeField;
    CDCadOrdemServicoServExec: TClientDataSet;
    CDCadOrdemServicoHistorico: TClientDataSet;
    CDCadOrdemServicoHistoricoServExec: TClientDataSet;
    CDCadOrdemServicoHistoricoServExecCODIGO: TAutoIncField;
    CDCadOrdemServicoHistoricoServExecCODEMPRESA: TStringField;
    CDCadOrdemServicoHistoricoServExecCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoHistoricoServExecPARTE: TStringField;
    CDCadOrdemServicoHistoricoServExecITEM: TStringField;
    CDCadOrdemServicoHistoricoServExecDESCRICAO: TStringField;
    CDCadOrdemServicoHistoricoServExecEQUIPPARADO: TStringField;
    CDCadOrdemServicoLocalizaMObra: TClientDataSet;
    CDCadOrdemServicoLocalizaMObraMATRICULA: TStringField;
    CDCadOrdemServicoLocalizaMObraNOME: TStringField;
    CDCadOrdemServicoLocalizaMObraCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoLocalizaMObraENTRADA: TDateTimeField;
    CDCadOrdemServicoLocalizaMObraCODEQUIPAMENTO: TStringField;
    CDCadOrdemServicoLocalizaMObraEQUIPAMENTO: TStringField;
    CDCadOrdemServicoMObraDisp: TClientDataSet;
    CDCadOrdemServicoMObraDispMATRICULA: TStringField;
    CDCadOrdemServicoMObraDispCODEMPRESA: TStringField;
    CDCadOrdemServicoMObraDispNOME: TStringField;
    CDCadOrdemServicoMObraDispOCUPADO: TStringField;
    CDCadOrdemServicoMObraDispPROGRAMADO: TStringField;
    CDCadOrdemServicoMObraDispCODCARGO: TStringField;
    CDCadOrdemServicoMObraDispCARGO: TStringField;
    CDCadOrdemServicoMObraDispCODCALENDARIO: TStringField;
    CDCadOrdemServicoMObraDispCALENDARIO: TStringField;
    CDCadOrdemServicoMObraDispCODEQUIPESP: TStringField;
    CDCadOrdemServicoMObraDispEQUIPESP: TStringField;
    CDCadOrdemServicoMObraExec: TClientDataSet;
    CDCadOrdemServicoMObraExecCODIGO: TAutoIncField;
    CDCadOrdemServicoMObraExecCODEMPRESA: TStringField;
    CDCadOrdemServicoMObraExecCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoMObraExecCODEQUIPE: TIntegerField;
    CDCadOrdemServicoMObraExecCODCARGO: TStringField;
    CDCadOrdemServicoMObraExecMATRICULA: TStringField;
    CDCadOrdemServicoMObraExecNOME: TStringField;
    CDCadOrdemServicoMObraExecENTRADA: TDateTimeField;
    CDCadOrdemServicoMObraExecSAIDA: TDateTimeField;
    CDCadOrdemServicoMObraExecCARGO: TStringField;
    CDCadOrdemServicoMObraExecCODCALENDARIO: TStringField;
    CDCadOrdemServicoMObraExecCALENDARIO: TStringField;
    CDCadOrdemServicoMObraProg: TClientDataSet;
    CDCadOrdemServicoCustoSec: TClientDataSet;
    DSCadOrdemServicoServSolic: TDataSource;
    DSCadOrdemServicoEquipe: TDataSource;
    DSCadOrdemServicoEquipeMObra: TDataSource;
    DSCadOrdemServicoEquipePecas: TDataSource;
    DSCadOrdemServicoEquipeRecursos: TDataSource;
    DSCadOrdemServicoEquipePlanoTrab: TDataSource;
    DSCadOrdemServicoEquipeMObraUtil: TDataSource;
    DSCadOrdemServicoEquipePecasUtil: TDataSource;
    DSCadOrdemServicoEquipeRecursosUtil: TDataSource;
    DSCadOrdemServicoEquipeMObraMovim: TDataSource;
    DSCadOrdemServicoServExec: TDataSource;
    DSCadOrdemServicoHistorico: TDataSource;
    DSCadOrdemServicoHistoricoServExec: TDataSource;
    DSCadOrdemServicoLocalizaMObra: TDataSource;
    DSCadOrdemServicoMObraDisp: TDataSource;
    DSCadOrdemServicoMObraExec: TDataSource;
    DSCadOrdemServicoMObraProg: TDataSource;
    DSCadOrdemServicoCustoSec: TDataSource;
    CDCadOrdemServicoParalisacao: TClientDataSet;
    DSCadOrdemServicoParalisacao: TDataSource;
    CDSAM: TClientDataSet;
    CDSAMCODIGO: TIntegerField;
    CDSAMCHAVE: TStringField;
    CDSAMINSTALACAO: TDateField;
    CDSAMEMPRESA: TStringField;
    CDSAMUSUARIOS: TIntegerField;
    CDCadOrdemServicoCODIGO: TAutoIncField;
    CDCadOrdemServicoCODEMPRESA: TStringField;
    CDCadOrdemServicoCODEQUIPAMENTO: TStringField;
    CDCadOrdemServicoCODMANUTENCAO: TStringField;
    CDCadOrdemServicoCODMOTIVOPARADA: TStringField;
    CDCadOrdemServicoCODCAUSAFALHA: TStringField;
    CDCadOrdemServicoCODCENTROCUSTO: TStringField;
    CDCadOrdemServicoCODMONITORAMENTO: TIntegerField;
    CDCadOrdemServicoMATRICULA: TStringField;
    CDCadOrdemServicoCODOFICINA: TStringField;
    CDCadOrdemServicoCODOSPRINCIPAL: TIntegerField;
    CDCadOrdemServicoCODMANUTPROGEQUIP: TStringField;
    CDCadOrdemServicoCODLUBRIFICPROGEQUIP: TStringField;
    CDCadOrdemServicoCODEQUIPAMENTOPAI: TStringField;
    CDCadOrdemServicoDESCRICAO: TStringField;
    CDCadOrdemServicoPRIORIDADEPARADA: TStringField;
    CDCadOrdemServicoCRITICIDADE: TStringField;
    CDCadOrdemServicoEQUIPPARADO: TStringField;
    CDCadOrdemServicoATIVO: TStringField;
    CDCadOrdemServicoVISIVEL: TStringField;
    CDCadOrdemServicoTEMPOPREVISTO: TBCDField;
    CDCadOrdemServicoTEMPOHOMEMHORA: TBCDField;
    CDCadOrdemServicoSUBORDEMSERVICO: TStringField;
    CDCadOrdemServicoLOCAL: TStringField;
    CDCadOrdemServicoEXECAUTONOMO: TStringField;
    CDCadOrdemServicoSOLICTRAB: TStringField;
    CDCadOrdemServicoPROGMANUAL: TStringField;
    CDCadOrdemServicoIMPORTANCIA: TSmallintField;
    CDCadOrdemServicoSITUACAO: TStringField;
    CDCadOrdemServicoROTAEQUIP: TStringField;
    CDCadOrdemServicoPARCIAL: TStringField;
    CDCadOrdemServicoDATAPROGINI: TDateTimeField;
    CDCadOrdemServicoDATAPROGFIN: TDateTimeField;
    CDCadOrdemServicoREPROGRAMADA: TStringField;
    CDCadOrdemServicoDATAREPROG: TDateTimeField;
    CDCadOrdemServicoQTDEREPROG: TSmallintField;
    CDCadOrdemServicoMOTIVOREPROG: TStringField;
    CDCadOrdemServicoDATAINICIO: TDateTimeField;
    CDCadOrdemServicoDATAINICIOREAL: TDateTimeField;
    CDCadOrdemServicoDATAFIM: TDateTimeField;
    CDCadOrdemServicoDATAFIMREAL: TDateTimeField;
    CDCadOrdemServicoDATAFECHAMENTO: TDateTimeField;
    CDCadOrdemServicoDATACANCEL: TDateTimeField;
    CDCadOrdemServicoTEMPOEXECUTADO: TBCDField;
    CDCadOrdemServicoTEMPOHOMEMHORAEXEC: TBCDField;
    CDCadOrdemServicoCUSTOMOBRA: TBCDField;
    CDCadOrdemServicoCUSTORECURSOS: TBCDField;
    CDCadOrdemServicoCUSTOPECAS: TBCDField;
    CDCadOrdemServicoCUSTOEXTRA: TBCDField;
    CDCadOrdemServicoCUSTOEXTRADESC: TStringField;
    CDCadOrdemServicoCUSTOSECUNDARIOS: TBCDField;
    CDCadOrdemServicoIMPPLANOTRAB: TStringField;
    CDCadOrdemServicoDATACADASTRO: TDateTimeField;
    CDCadOrdemServicoCODUSUARIOCAD: TStringField;
    CDCadOrdemServicoDATAULTALT: TDateTimeField;
    CDCadOrdemServicoCODUSUARIOALT: TStringField;
    CDCadOrdemServicoOBSERVACOES: TBlobField;
    CDCadOrdemServicoEQUIPAMENTO: TStringField;
    CDCadOrdemServicoAREA: TStringField;
    CDCadOrdemServicoCELULA: TStringField;
    CDCadOrdemServicoLINHA: TStringField;
    CDCadOrdemServicoMANUTENCAO: TStringField;
    CDCadOrdemServicoMOTIVOPARADA: TStringField;
    CDCadOrdemServicoFALHA: TStringField;
    CDCadOrdemServicoCENTROCUSTO: TStringField;
    CDCadOrdemServicoOFICINA: TStringField;
    CDCadOrdemServicoSOLICITANTE: TStringField;
    CDCadOrdemServicoMANUTPROGEQUIP: TStringField;
    CDCadOrdemServicoLUBRIFICPROGEQUIP: TStringField;
    CDCadOrdemServicoCODSOLICITACAOTRAB: TIntegerField;
    CDCadOrdemServicoSOLICITACAOTRAB: TStringField;
    CDCadOrdemServicoUSUARIOCAD: TStringField;
    CDCadOrdemServicoUSUARIOALT: TStringField;
    CDOrdemServicoGerenciaCODIGO: TAutoIncField;
    CDOrdemServicoGerenciaDESCRICAO: TStringField;
    CDOrdemServicoGerenciaDATACADASTRO: TDateTimeField;
    CDOrdemServicoGerenciaDATAPROGINI: TDateTimeField;
    CDOrdemServicoGerenciaDATAINICIOREAL: TDateTimeField;
    CDOrdemServicoGerenciaDATAFECHAMENTO: TDateTimeField;
    CDOrdemServicoGerenciaCODMANUTENCAO: TStringField;
    CDOrdemServicoGerenciaROTAEQUIP: TStringField;
    CDOrdemServicoGerenciaSOLICTRAB: TStringField;
    CDOrdemServicoGerenciaSITUACAO: TStringField;
    CDOrdemServicoGerenciaMATRICULA: TStringField;
    CDOrdemServicoGerenciaIMPORTANCIA: TIntegerField;
    CDOrdemServicoGerenciaCODEQUIPAMENTO: TStringField;
    CDOrdemServicoGerenciaEQUIPAMENTO: TStringField;
    CDCadEquipamentoDadosRCODIGO: TAutoIncField;
    CDCadEquipamentoDadosRCODEMPRESA: TStringField;
    CDCadEquipamentoDadosRCODFAMILIAEQUIP: TStringField;
    CDCadEquipamentoDadosRCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoDadosRREGISTRO1: TBCDField;
    CDCadEquipamentoDadosRREGISTRO2: TBCDField;
    CDCadEquipamentoDadosRREGISTRO3: TBCDField;
    CDCadEquipamentoDadosRREGISTRO4: TBCDField;
    CDCadEquipamentoDadosRREGISTRO5: TBCDField;
    CDCadEquipamentoDadosRREGISTRO6: TBCDField;
    CDCadEquipamentoDadosRREGISTRO7: TBCDField;
    CDCadEquipamentoDadosRREGISTRO8: TBCDField;
    CDCadEquipamentoDadosRREGISTRO9: TBCDField;
    CDCadEquipamentoDadosRREGISTRO10: TBCDField;
    CDCadEquipamentoDadosRREGISTRO11: TBCDField;
    CDCadEquipamentoDadosRREGISTRO12: TBCDField;
    CDCadEquipamentoDadosRINFORMACOES: TBlobField;
    CDCadEquipamentoCODIGO: TStringField;
    CDCadEquipamentoCODEMPRESA: TStringField;
    CDCadEquipamentoCODCALENDARIO: TStringField;
    CDCadEquipamentoCODLOCALIZACAO: TStringField;
    CDCadEquipamentoCODCELULA: TStringField;
    CDCadEquipamentoCODLINHA: TStringField;
    CDCadEquipamentoSEQUENCIA: TIntegerField;
    CDCadEquipamentoCODFABRICANTE: TStringField;
    CDCadEquipamentoCODFORNECEDOR: TStringField;
    CDCadEquipamentoCODCENTROCUSTO: TStringField;
    CDCadEquipamentoCODCLASSE: TStringField;
    CDCadEquipamentoCODFAMILIAEQUIP: TStringField;
    CDCadEquipamentoCODEQUIPAMENTOPAI: TStringField;
    CDCadEquipamentoSTATUS: TStringField;
    CDCadEquipamentoDESCRICAO: TStringField;
    CDCadEquipamentoDATAAQUISICAO: TDateTimeField;
    CDCadEquipamentoDATAINIFUNC: TDateTimeField;
    CDCadEquipamentoDATAGARANTIA: TDateTimeField;
    CDCadEquipamentoNOTAFISCAL: TStringField;
    CDCadEquipamentoOPERANDO: TStringField;
    CDCadEquipamentoRESERVA: TStringField;
    CDCadEquipamentoSECUNDARIO: TStringField;
    CDCadEquipamentoCALCULARCONF: TStringField;
    CDCadEquipamentoDATAINICIOCONF: TDateTimeField;
    CDCadEquipamentoPERIODOCONF: TStringField;
    CDCadEquipamentoCALCULADACONF: TStringField;
    CDCadEquipamentoFATORMARCHAADM: TBCDField;
    CDCadEquipamentoDIASEMISSAOOS: TIntegerField;
    CDCadEquipamentoDATACADASTRO: TDateTimeField;
    CDCadEquipamentoCODUSUARIOCAD: TStringField;
    CDCadEquipamentoDATAULTALT: TDateTimeField;
    CDCadEquipamentoCODUSUARIOALT: TStringField;
    CDCadEquipamentoOBSERVACOES: TBlobField;
    CDCadEquipamentoUSUARIOCAD: TStringField;
    CDCadEquipamentoUSUARIOALT: TStringField;
    CDCadEquipamentoCALENDARIOEQUIP: TStringField;
    CDCadEquipamentoAREA: TStringField;
    CDCadEquipamentoCELULA: TStringField;
    CDCadEquipamentoLINHA: TStringField;
    CDCadEquipamentoDESCPAI: TStringField;
    CDCadEquipamentoFABRICANTE: TStringField;
    CDCadEquipamentoFORNECEDOR: TStringField;
    CDCadEquipamentoCENTROCUSTO: TStringField;
    CDCadEquipamentoCLASSE: TStringField;
    CDCadEquipamentoFAMILIAEQUIP: TStringField;
    CDCadLubrificProgEquipItensCODIGO: TIntegerField;
    CDCadLubrificProgEquipItensCODEMPRESA: TStringField;
    CDCadLubrificProgEquipItensCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDCadLubrificProgEquipItensCODPARTE: TIntegerField;
    CDCadLubrificProgEquipItensITEM: TStringField;
    CDCadLubrificProgEquipItensDESCINSPECAO: TStringField;
    CDCadLubrificProgEquipItensEQUIPPARADO: TStringField;
    CDCadLubrificProgEquipItensTEMPO: TBCDField;
    CDCadLubrificProgEquipItensEXECAUTONOMO: TStringField;
    CDCadLubrificProgEquipItensPARTE: TStringField;
    CDCadLubrificProgEquipItensEspCODIGO: TAutoIncField;
    CDCadLubrificProgEquipItensEspCODEMPRESA: TStringField;
    CDCadLubrificProgEquipItensEspCODLUBRIFICPROGEQUIP: TStringField;
    CDCadLubrificProgEquipItensEspCODPARTE: TIntegerField;
    CDCadLubrificProgEquipItensEspITEM: TStringField;
    CDCadLubrificProgEquipItensEspDESCINSPECAO: TStringField;
    CDCadLubrificProgEquipItensEspEQUIPPARADO: TStringField;
    CDCadLubrificProgEquipItensEspTEMPO: TBCDField;
    CDCadLubrificProgEquipItensEspEXECAUTONOMO: TStringField;
    CDCadLubrificProgEquipItensEspEXECUTADO: TStringField;
    CDCadLubrificProgEquipItensEspBOM: TStringField;
    CDCadLubrificProgEquipItensEspREGULAR: TStringField;
    CDCadLubrificProgEquipItensEspRUIM: TStringField;
    CDCadLubrificProgEquipItensEspPARTE: TStringField;
    CDCadLubrificProgFamEquipItensCODIGO: TAutoIncField;
    CDCadLubrificProgFamEquipItensCODEMPRESA: TStringField;
    CDCadLubrificProgFamEquipItensCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDCadLubrificProgFamEquipItensCODPARTE: TIntegerField;
    CDCadLubrificProgFamEquipItensITEM: TStringField;
    CDCadLubrificProgFamEquipItensDESCINSPECAO: TStringField;
    CDCadLubrificProgFamEquipItensEQUIPPARADO: TStringField;
    CDCadLubrificProgFamEquipItensTEMPO: TBCDField;
    CDCadLubrificProgFamEquipItensEXECAUTONOMO: TStringField;
    CDCadLubrificProgFamEquipItensEXECUTADO: TStringField;
    CDCadLubrificProgFamEquipItensBOM: TStringField;
    CDCadLubrificProgFamEquipItensREGULAR: TStringField;
    CDCadLubrificProgFamEquipItensRUIM: TStringField;
    CDCadLubrificProgFamEquipItensPARTE: TStringField;
    CDCadLubrificProgFamEquipItensDESCLUBRIFICENCAO: TStringField;
    CDCadManutProgEquipItensPARTE: TStringField;
    CDCadManutProgEquipItensCODIGO: TIntegerField;
    CDCadManutProgEquipItensCODEMPRESA: TStringField;
    CDCadManutProgEquipItensCODMANUTPROGFAMEQUIP: TStringField;
    CDCadManutProgEquipItensCODPARTE: TIntegerField;
    CDCadManutProgEquipItensITEM: TStringField;
    CDCadManutProgEquipItensDESCINSPECAO: TStringField;
    CDCadManutProgEquipItensEQUIPPARADO: TStringField;
    CDCadManutProgEquipItensTEMPO: TBCDField;
    CDCadManutProgEquipItensEXECAUTONOMO: TStringField;
    CDCadManutProgFamEquipPartesCODIGO: TAutoIncField;
    CDCadManutProgFamEquipPartesCODEMPRESA: TStringField;
    CDCadManutProgFamEquipPartesDESCRICAO: TStringField;
    CDCadManutProgFamEquipPartesCODMANUTPROGFAMEQUIP: TStringField;
    CDCadManutProgFamEquipPartesCODFAMILIAEQUIP: TStringField;
    CDCadManutProgFamEquipItensCODIGO: TAutoIncField;
    CDCadManutProgFamEquipItensCODEMPRESA: TStringField;
    CDCadManutProgFamEquipItensCODMANUTPROGFAMEQUIP: TStringField;
    CDCadManutProgFamEquipItensCODPARTE: TIntegerField;
    CDCadManutProgFamEquipItensITEM: TStringField;
    CDCadManutProgFamEquipItensDESCINSPECAO: TStringField;
    CDCadManutProgFamEquipItensEQUIPPARADO: TStringField;
    CDCadManutProgFamEquipItensTEMPO: TBCDField;
    CDCadManutProgFamEquipItensEXECAUTONOMO: TStringField;
    CDCadManutProgFamEquipItensEXECUTADO: TStringField;
    CDCadManutProgFamEquipItensBOM: TStringField;
    CDCadManutProgFamEquipItensREGULAR: TStringField;
    CDCadManutProgFamEquipItensRUIM: TStringField;
    CDCadManutProgFamEquipItensPARTE: TStringField;
    CDCadManutProgFamEquipItensDESCMANUTENCAO: TStringField;
    CDManutPeriodicasItensINDICE: TAutoIncField;
    CDManutPeriodicasItensCODEMPRESA: TStringField;
    CDManutPeriodicasItensHISTORICO: TIntegerField;
    CDManutPeriodicasItensCODIGO: TIntegerField;
    CDManutPeriodicasItensCODMANUTPROGEQUIP: TStringField;
    CDManutPeriodicasItensDTAINICIO1: TDateTimeField;
    CDManutPeriodicasItensDATAINSPECAO: TDateTimeField;
    CDManutPeriodicasItensCODPARTE: TIntegerField;
    CDManutPeriodicasItensITEM: TStringField;
    CDManutPeriodicasItensDESCINSPECAO: TStringField;
    CDManutPeriodicasItensEQUIPPARADO: TStringField;
    CDManutPeriodicasItensTEMPO: TBCDField;
    CDManutPeriodicasItensEXECAUTONOMO: TStringField;
    CDManutPeriodicasItensEXECUTADO: TStringField;
    CDManutPeriodicasItensBOM: TStringField;
    CDManutPeriodicasItensREGULAR: TStringField;
    CDManutPeriodicasItensRUIM: TStringField;
    CDManutPeriodicasItensPARTE: TStringField;
    CDManutPeriodicasItensEspINDICE: TAutoIncField;
    CDManutPeriodicasItensEspCODEMPRESA: TStringField;
    CDManutPeriodicasItensEspHISTORICO: TIntegerField;
    CDManutPeriodicasItensEspCODIGO: TIntegerField;
    CDManutPeriodicasItensEspCODMANUTPROGEQUIP: TStringField;
    CDManutPeriodicasItensEspDTAINICIO1: TDateTimeField;
    CDManutPeriodicasItensEspDATAINSPECAO: TDateTimeField;
    CDManutPeriodicasItensEspCODPARTE: TIntegerField;
    CDManutPeriodicasItensEspITEM: TStringField;
    CDManutPeriodicasItensEspDESCINSPECAO: TStringField;
    CDManutPeriodicasItensEspEQUIPPARADO: TStringField;
    CDManutPeriodicasItensEspTEMPO: TBCDField;
    CDManutPeriodicasItensEspEXECAUTONOMO: TStringField;
    CDManutPeriodicasItensEspEXECUTADO: TStringField;
    CDManutPeriodicasItensEspBOM: TStringField;
    CDManutPeriodicasItensEspREGULAR: TStringField;
    CDManutPeriodicasItensEspRUIM: TStringField;
    CDManutPeriodicasItensEspPARTE: TStringField;
    CDLubrificPeriodicasItensINDICE: TAutoIncField;
    CDLubrificPeriodicasItensCODEMPRESA: TStringField;
    CDLubrificPeriodicasItensHISTORICO: TIntegerField;
    CDLubrificPeriodicasItensCODIGO: TIntegerField;
    CDLubrificPeriodicasItensCODLUBRIFICPROGEQUIP: TStringField;
    CDLubrificPeriodicasItensDTAINICIO1: TDateTimeField;
    CDLubrificPeriodicasItensDATAINSPECAO: TDateTimeField;
    CDLubrificPeriodicasItensCODPARTE: TIntegerField;
    CDLubrificPeriodicasItensITEM: TStringField;
    CDLubrificPeriodicasItensDESCINSPECAO: TStringField;
    CDLubrificPeriodicasItensEQUIPPARADO: TStringField;
    CDLubrificPeriodicasItensTEMPO: TBCDField;
    CDLubrificPeriodicasItensEXECAUTONOMO: TStringField;
    CDLubrificPeriodicasItensEXECUTADO: TStringField;
    CDLubrificPeriodicasItensBOM: TStringField;
    CDLubrificPeriodicasItensREGULAR: TStringField;
    CDLubrificPeriodicasItensRUIM: TStringField;
    CDLubrificPeriodicasItensPARTE: TStringField;
    CDLubrificPeriodicasItensEspINDICE: TAutoIncField;
    CDLubrificPeriodicasItensEspCODEMPRESA: TStringField;
    CDLubrificPeriodicasItensEspHISTORICO: TIntegerField;
    CDLubrificPeriodicasItensEspCODIGO: TIntegerField;
    CDLubrificPeriodicasItensEspCODLUBRIFICPROGEQUIP: TStringField;
    CDLubrificPeriodicasItensEspDTAINICIO1: TDateTimeField;
    CDLubrificPeriodicasItensEspDATAINSPECAO: TDateTimeField;
    CDLubrificPeriodicasItensEspCODPARTE: TIntegerField;
    CDLubrificPeriodicasItensEspITEM: TStringField;
    CDLubrificPeriodicasItensEspDESCINSPECAO: TStringField;
    CDLubrificPeriodicasItensEspEQUIPPARADO: TStringField;
    CDLubrificPeriodicasItensEspTEMPO: TBCDField;
    CDLubrificPeriodicasItensEspEXECAUTONOMO: TStringField;
    CDLubrificPeriodicasItensEspEXECUTADO: TStringField;
    CDLubrificPeriodicasItensEspBOM: TStringField;
    CDLubrificPeriodicasItensEspREGULAR: TStringField;
    CDLubrificPeriodicasItensEspRUIM: TStringField;
    CDLubrificPeriodicasItensEspPARTE: TStringField;
    CDLubrificPeriodicasItensEspEXECUTADO_CHK: TBooleanField;
    CDLubrificPeriodicasItensEspBOM_CHK: TBooleanField;
    CDLubrificPeriodicasItensEspREGULAR_CHK: TBooleanField;
    CDLubrificPeriodicasItensEspRUIM_CHK: TBooleanField;
    CDLubrificPeriodicasItensEXECUTADO_CHK: TBooleanField;
    CDLubrificPeriodicasItensBOM_CHK: TBooleanField;
    CDLubrificPeriodicasItensREGULAR_CHK: TBooleanField;
    CDLubrificPeriodicasItensRUIM_CHK: TBooleanField;
    CDManutPeriodicasItensEspEXECUTADO_CHK: TBooleanField;
    CDManutPeriodicasItensEspBOM_CHK: TBooleanField;
    CDManutPeriodicasItensEspREGULAR_CHK: TBooleanField;
    CDManutPeriodicasItensEspRUIM_CHK: TBooleanField;
    CDManutPeriodicasItensEXECUTADO_CHK: TBooleanField;
    CDManutPeriodicasItensBOM_CHK: TBooleanField;
    CDManutPeriodicasItensREGULAR_CHK: TBooleanField;
    CDManutPeriodicasItensRUIM_CHK: TBooleanField;
    CDRotaPeriodicasManutItensEspINDICE: TIntegerField;
    CDRotaPeriodicasManutItensEspCODEMPRESA: TStringField;
    CDRotaPeriodicasManutItensEspHISTORICO: TIntegerField;
    CDRotaPeriodicasManutItensEspCODIGO: TIntegerField;
    CDRotaPeriodicasManutItensEspCODMANUTPROGEQUIP: TStringField;
    CDRotaPeriodicasManutItensEspDTAINICIO1: TDateTimeField;
    CDRotaPeriodicasManutItensEspDATAINSPECAO: TDateTimeField;
    CDRotaPeriodicasManutItensEspCODPARTE: TIntegerField;
    CDRotaPeriodicasManutItensEspITEM: TStringField;
    CDRotaPeriodicasManutItensEspDESCINSPECAO: TStringField;
    CDRotaPeriodicasManutItensEspEQUIPPARADO: TStringField;
    CDRotaPeriodicasManutItensEspEXECAUTONOMO: TStringField;
    CDRotaPeriodicasManutItensEspEXECUTADO: TStringField;
    CDRotaPeriodicasManutItensEspBOM: TStringField;
    CDRotaPeriodicasManutItensEspREGULAR: TStringField;
    CDRotaPeriodicasManutItensEspRUIM: TStringField;
    CDRotaPeriodicasManutItensEspPARTE: TStringField;
    CDRotaPeriodicasManutItensEspEXECUTADO_CHK: TBooleanField;
    CDRotaPeriodicasManutItensEspBOM_CHK: TBooleanField;
    CDRotaPeriodicasManutItensEspREGULAR_CHK: TBooleanField;
    CDRotaPeriodicasManutItensEspRUIM_CHK: TBooleanField;
    CDCadPontosInspecaoLocCODIGO: TAutoIncField;
    CDCadPontosInspecaoLocCODEMPRESA: TStringField;
    CDCadPontosInspecaoLocCODPONTOINSP: TStringField;
    CDCadPontosInspecaoLocCODTIPOPROGRAMACAO: TStringField;
    CDCadPontosInspecaoLocDESCRICAO: TStringField;
    CDCadPontosInspecaoLocEMISSAOOS: TStringField;
    CDCadPontosInspecaoLocUNIDMEDIDA: TStringField;
    CDCadPontosInspecaoLocLIMINFSEG: TBCDField;
    CDCadPontosInspecaoLocLIMINFMAX: TBCDField;
    CDCadPontosInspecaoLocLIMSUPSEG: TBCDField;
    CDCadPontosInspecaoLocLIMSUPMAX: TBCDField;
    CDCadPontosInspecaoLocTIPOPROGRAMACAO: TStringField;
    CDCadMonitMedicoesContCODIGO: TAutoIncField;
    CDCadMonitMedicoesContCODEMPRESA: TStringField;
    CDCadMonitMedicoesContCODEQUIPAMENTO: TStringField;
    CDCadMonitMedicoesContCODMONITORAMENTO: TIntegerField;
    CDCadMonitMedicoesContMATRICULA: TStringField;
    CDCadMonitMedicoesContDATAMEDICAO: TDateTimeField;
    CDCadMonitMedicoesContMEDICAO: TBCDField;
    CDCadMonitMedicoesContOSGERADA: TFloatField;
    CDCadMonitMedicoesContCONTADOR: TStringField;
    CDCadMonitMedicoesContEQUIPAMENTO: TStringField;
    CDCadMonitMedicoesContFUNCIONARIO: TStringField;
    CDCadMonitMedicoesContSITUACAOOS: TStringField;
    CDCadMonitMedicoesContManutCODIGO: TStringField;
    CDCadMonitMedicoesContManutCODEMPRESA: TStringField;
    CDCadMonitMedicoesContManutCODEQUIPAMENTO: TStringField;
    CDCadMonitMedicoesContManutCODMANUTPROGFAMEQUIP: TStringField;
    CDCadMonitMedicoesContManutMANUTENCAO: TStringField;
    CDCadMonitMedicoesContManutDTAINICIO1: TDateTimeField;
    CDCadMonitMedicoesContManutFREQUENCIA2: TSmallintField;
    CDCadMonitMedicoesContManutLEITURA: TIntegerField;
    CDCadMonitMedicoesContManutREPROGRAMAR2: TStringField;
    CDCadMonitMedicoesContManutRELATORIO: TStringField;
    CDCadMonitMedicoesContManutMANUTPROGFAMEQUIP: TStringField;
    CDCadFuncionariosMATRICULA: TStringField;
    CDCadFuncionariosCODEMPRESA: TStringField;
    CDCadFuncionariosCODCARGO: TStringField;
    CDCadFuncionariosCODCALENDARIO: TStringField;
    CDCadFuncionariosCODAREA: TStringField;
    CDCadFuncionariosCODCELULA: TStringField;
    CDCadFuncionariosNOME: TStringField;
    CDCadFuncionariosAPELIDO: TStringField;
    CDCadFuncionariosCPF: TStringField;
    CDCadFuncionariosENDERECO: TStringField;
    CDCadFuncionariosBAIRRO: TStringField;
    CDCadFuncionariosCIDADE: TStringField;
    CDCadFuncionariosESTADO: TStringField;
    CDCadFuncionariosCEP: TStringField;
    CDCadFuncionariosTELEFONE: TStringField;
    CDCadFuncionariosCELULAR: TStringField;
    CDCadFuncionariosSALARIO: TBCDField;
    CDCadFuncionariosDATANASCIMENTO: TDateTimeField;
    CDCadFuncionariosDATAADMISSAO: TDateTimeField;
    CDCadFuncionariosESCOLARIDADE: TStringField;
    CDCadFuncionariosEMAIL: TStringField;
    CDCadFuncionariosMOBRA: TStringField;
    CDCadFuncionariosTERCEIRO: TStringField;
    CDCadFuncionariosUSUARIO: TStringField;
    CDCadFuncionariosDIASUSO: TIntegerField;
    CDCadFuncionariosAUTONOMO: TStringField;
    CDCadFuncionariosDATACADASTRO: TDateTimeField;
    CDCadFuncionariosCODUSUARIOCAD: TStringField;
    CDCadFuncionariosDATAULTALT: TDateTimeField;
    CDCadFuncionariosCODUSUARIOALT: TStringField;
    CDCadFuncionariosOCUPADO: TStringField;
    CDCadFuncionariosPROGRAMADO: TStringField;
    CDCadFuncionariosATIVO: TStringField;
    CDCadFuncionariosMOTIVOAUSENCIA: TStringField;
    CDCadFuncionariosCURSOS: TStringField;
    CDCadFuncionariosTIPOIMAGEM: TStringField;
    CDCadFuncionariosIMAGEM: TBlobField;
    CDCadFuncionariosOBSERVACOES: TBlobField;
    CDCadFuncionariosAREA: TStringField;
    CDCadFuncionariosCARGO: TStringField;
    CDCadFuncionariosCALENDARIO: TStringField;
    CDCadFuncionariosCELULA: TStringField;
    CDCadFuncionariosUSUARIOCAD: TStringField;
    CDCadFuncionariosUSUARIOALT: TStringField;
    CDCadPecasReposicaoCODIGO: TStringField;
    CDCadPecasReposicaoCODEMPRESA: TStringField;
    CDCadPecasReposicaoDESCRICAO: TStringField;
    CDCadPecasReposicaoCODFABRICANTE: TStringField;
    CDCadPecasReposicaoCODFORNECEDOR: TStringField;
    CDCadPecasReposicaoCODFAMILIAPECAREP: TStringField;
    CDCadPecasReposicaoESTOCAVEL: TStringField;
    CDCadPecasReposicaoLOCALESTOCAGEM: TStringField;
    CDCadPecasReposicaoREFERENCIA: TStringField;
    CDCadPecasReposicaoCODUNIDADE: TStringField;
    CDCadPecasReposicaoUNIDMEDIDA: TStringField;
    CDCadPecasReposicaoQUANTIDADE: TIntegerField;
    CDCadPecasReposicaoQTDERESERVADA: TIntegerField;
    CDCadPecasReposicaoPRECO: TBCDField;
    CDCadPecasReposicaoPESO: TBCDField;
    CDCadPecasReposicaoFABRICADA: TStringField;
    CDCadPecasReposicaoCATALOGO: TStringField;
    CDCadPecasReposicaoKIT: TStringField;
    CDCadPecasReposicaoDATACADASTRO: TDateTimeField;
    CDCadPecasReposicaoCODUSUARIOCAD: TStringField;
    CDCadPecasReposicaoDATAULTALT: TDateTimeField;
    CDCadPecasReposicaoCODUSUARIOALT: TStringField;
    CDCadPecasReposicaoOBSERVACOES: TBlobField;
    CDCadPecasReposicaoFABRICANTE: TStringField;
    CDCadPecasReposicaoFORNECEDOR: TStringField;
    CDCadPecasReposicaoFAMILIAPECA: TStringField;
    CDCadPecasReposicaoUSUARIOCAD: TStringField;
    CDCadPecasReposicaoUSUARIOALT: TStringField;
    CDCadRecursosCODIGO: TStringField;
    CDCadRecursosCODEMPRESA: TStringField;
    CDCadRecursosCODLOCALIZACAO: TStringField;
    CDCadRecursosCODFABRICANTE: TStringField;
    CDCadRecursosCODFORNECEDOR: TStringField;
    CDCadRecursosCODCENTROCUSTO: TStringField;
    CDCadRecursosCODCLASSE: TStringField;
    CDCadRecursosCODFAMILIARECURSO: TStringField;
    CDCadRecursosDESCRICAO: TStringField;
    CDCadRecursosDATAFABRICACAO: TDateTimeField;
    CDCadRecursosDATAGARANTIA: TDateTimeField;
    CDCadRecursosDATAAQUISICAO: TDateTimeField;
    CDCadRecursosQUANTIDADE: TIntegerField;
    CDCadRecursosQTDERESERVADA: TIntegerField;
    CDCadRecursosPRECO: TBCDField;
    CDCadRecursosAMORTIZACAO: TBCDField;
    CDCadRecursosCUSTOHORA: TBCDField;
    CDCadRecursosKIT: TStringField;
    CDCadRecursosESTADO: TStringField;
    CDCadRecursosDATACADASTRO: TDateTimeField;
    CDCadRecursosCODUSUARIOCAD: TStringField;
    CDCadRecursosDATAULTALT: TDateTimeField;
    CDCadRecursosCODUSUARIOALT: TStringField;
    CDCadRecursosOBSERVACOES: TBlobField;
    CDCadRecursosAREA: TStringField;
    CDCadRecursosFABRICANTE: TStringField;
    CDCadRecursosFORNECEDOR: TStringField;
    CDCadRecursosCENTROCUSTO: TStringField;
    CDCadRecursosCLASSE: TStringField;
    CDCadRecursosFAMILIARECURSO: TStringField;
    CDCadRecursosUSUARIOCAD: TStringField;
    CDCadRecursosUSUARIOALT: TStringField;
    CDCadRecursosCUSTOHORA_CALC: TFloatField;
    CDCadRecursosDadosCODIGO: TAutoIncField;
    CDCadRecursosDadosCODEMPRESA: TStringField;
    CDCadRecursosDadosCODFAMILIARECURSOS: TStringField;
    CDCadRecursosDadosCODRECURSO: TStringField;
    CDCadRecursosDadosREGISTRO1: TStringField;
    CDCadRecursosDadosREGISTRO2: TStringField;
    CDCadRecursosDadosREGISTRO3: TStringField;
    CDCadRecursosDadosREGISTRO4: TStringField;
    CDCadRecursosDadosREGISTRO5: TStringField;
    CDCadRecursosDadosREGISTRO6: TStringField;
    CDCadRecursosDadosREGISTRO7: TStringField;
    CDCadRecursosDadosREGISTRO8: TStringField;
    CDCadRecursosDadosREGISTRO9: TStringField;
    CDCadRecursosDadosREGISTRO10: TStringField;
    CDCadRecursosDadosREGISTRO11: TStringField;
    CDCadRecursosDadosREGISTRO12: TStringField;
    CDCadRecursosDadosINFORMACOES: TBlobField;
    CDCadFerramentariaItensCODIGO: TAutoIncField;
    CDCadFerramentariaItensCODEMPRESA: TStringField;
    CDCadFerramentariaItensCODFERRAMEM: TStringField;
    CDCadFerramentariaItensCODRECURSO: TStringField;
    CDCadFerramentariaItensQUANTIDADE: TIntegerField;
    CDCadFerramentariaItensSTATUS: TStringField;
    CDCadFerramentariaItensDATAEMPRESTIMO: TDateTimeField;
    CDCadFerramentariaItensRECURSO: TStringField;
    CDCadLubrificantesCODIGO: TStringField;
    CDCadLubrificantesCODEMPRESA: TStringField;
    CDCadLubrificantesCODFABRICANTE: TStringField;
    CDCadLubrificantesCODFORNECEDOR: TStringField;
    CDCadLubrificantesCODLOCALIZACAO: TStringField;
    CDCadLubrificantesDESCRICAO: TStringField;
    CDCadLubrificantesOLEO: TStringField;
    CDCadLubrificantesVISCOSIDADE: TBCDField;
    CDCadLubrificantesPONTOFULGOR: TBCDField;
    CDCadLubrificantesGRAUISO: TBCDField;
    CDCadLubrificantesGRAUACMA: TBCDField;
    CDCadLubrificantesDENSIDADE: TBCDField;
    CDCadLubrificantesPONTOFLUIDEZ: TBCDField;
    CDCadLubrificantesGRAUNLGI: TBCDField;
    CDCadLubrificantesPENETRACAO: TBCDField;
    CDCadLubrificantesPONTOGOTA: TBCDField;
    CDCadLubrificantesANTIDESGASTE: TStringField;
    CDCadLubrificantesANTICORROZIVO: TStringField;
    CDCadLubrificantesANTIOXIDANTE: TStringField;
    CDCadLubrificantesANTIFERRUGEM: TStringField;
    CDCadLubrificantesANTIESPUMANTE: TStringField;
    CDCadLubrificantesEXTREMAPRESSAO: TStringField;
    CDCadLubrificantesDETERGENTE: TStringField;
    CDCadLubrificantesDISPERSANTE: TStringField;
    CDCadLubrificantesSINTETICO: TStringField;
    CDCadLubrificantesESTOCADO: TStringField;
    CDCadLubrificantesQTDETOTALUTIL: TBCDField;
    CDCadLubrificantesCONSMEDIOANUAL: TBCDField;
    CDCadLubrificantesQTDEDIASRESUP: TBCDField;
    CDCadLubrificantesULTPRECO: TBCDField;
    CDCadLubrificantesCATALOGO: TStringField;
    CDCadLubrificantesCRITICIDADE: TStringField;
    CDCadLubrificantesCODUNIDADE: TStringField;
    CDCadLubrificantesATIVO: TStringField;
    CDCadLubrificantesVISIVEL: TStringField;
    CDCadLubrificantesDATACADASTRO: TDateTimeField;
    CDCadLubrificantesCODUSUARIOCAD: TStringField;
    CDCadLubrificantesDATAULTALT: TDateTimeField;
    CDCadLubrificantesCODUSUARIOALT: TStringField;
    CDCadLubrificantesOBSERVACOES: TBlobField;
    CDCadLubrificantesAREA: TStringField;
    CDCadLubrificantesFABRICANTE: TStringField;
    CDCadLubrificantesFORNECEDOR: TStringField;
    CDCadLubrificantesUSUARIOCAD: TStringField;
    CDCadLubrificantesUSUARIOALT: TStringField;
    CDCadFuncionariosFerramentariaCODIGO: TAutoIncField;
    CDCadFuncionariosFerramentariaCODEMPRESA: TStringField;
    CDCadFuncionariosFerramentariaCODFERRAMENTARIA: TStringField;
    CDCadFuncionariosFerramentariaCODFERRAMENTARIAITEM: TStringField;
    CDCadFuncionariosFerramentariaMATRICULA: TStringField;
    CDCadFuncionariosFerramentariaQUANTIDADE: TIntegerField;
    CDCadFuncionariosFerramentariaDATAEMPRESTIMO: TDateTimeField;
    CDCadFuncionariosFerramentariaDATADEVOLUCAO: TDateTimeField;
    CDCadFuncionariosFerramentariaFERRAMENTARIA: TStringField;
    CDCadFuncionariosFerramentariaITEM: TStringField;
    CDCadFuncionariosFerramentariaNOME: TStringField;
    CDCadFuncionariosTipoManutHistTIPOMANUTENCAO: TStringField;
    CDCadFuncionariosTipoManutHistTOTALOS: TLargeintField;
    CDCadFuncionariosHistServicosCODORDEMSERVICO: TIntegerField;
    CDCadFuncionariosHistServicosSERVICO: TStringField;
    CDCadFuncionariosHistServicosEQUIPAMENTO: TStringField;
    CDCadFuncionariosHistServicosTEMPOEXECUCAO: TBCDField;
    CDCadFuncionariosHistServicosTOTALHOMEMHORA: TBCDField;
    CDCadFuncionariosHistAusenciasINICIO: TDateTimeField;
    CDCadFuncionariosHistAusenciasFIM: TDateTimeField;
    CDCadManutProgEquipItensEspCODIGO: TAutoIncField;
    CDCadManutProgEquipItensEspCODEMPRESA: TStringField;
    CDCadManutProgEquipItensEspCODMANUTPROGEQUIP: TStringField;
    CDCadManutProgEquipItensEspCODPARTE: TIntegerField;
    CDCadManutProgEquipItensEspITEM: TStringField;
    CDCadManutProgEquipItensEspDESCINSPECAO: TStringField;
    CDCadManutProgEquipItensEspEQUIPPARADO: TStringField;
    CDCadManutProgEquipItensEspTEMPO: TBCDField;
    CDCadManutProgEquipItensEspEXECAUTONOMO: TStringField;
    CDCadManutProgEquipItensEspEXECUTADO: TStringField;
    CDCadManutProgEquipItensEspBOM: TStringField;
    CDCadManutProgEquipItensEspREGULAR: TStringField;
    CDCadManutProgEquipItensEspRUIM: TStringField;
    CDCadManutProgEquipItensEspPARTE: TStringField;
    CDManutConsCODIGO: TStringField;
    CDManutConsCODEMPRESA: TStringField;
    CDManutConsCODEQUIPAMENTO: TStringField;
    CDManutConsCODMANUTPROGFAMEQUIP: TStringField;
    CDManutConsCODMONITORAMENTO: TIntegerField;
    CDManutConsDESCRICAO: TStringField;
    CDManutConsCRITICIDADE: TStringField;
    CDManutConsFREQUENCIA1: TSmallintField;
    CDManutConsDTAINICIO1: TDateTimeField;
    CDManutConsREPROGRAMAR1: TStringField;
    CDManutConsFREQUENCIA2: TSmallintField;
    CDManutConsLEITURA: TIntegerField;
    CDManutConsREPROGRAMAR2: TStringField;
    CDManutConsRELATORIO: TStringField;
    CDManutConsEQUIPAMENTO: TStringField;
    CDManutConsSEQUENCIA: TIntegerField;
    CDManutConsCODFAMILIAEQUIP: TStringField;
    CDManutConsFAMILIAEQUIP: TStringField;
    CDManutConsCODAREA: TStringField;
    CDManutConsAREA: TStringField;
    CDManutConsCODCELULA: TStringField;
    CDManutConsCELULA: TStringField;
    CDManutConsCODLINHA: TStringField;
    CDManutConsLINHA: TStringField;
    CDLubrificConsCODIGO: TStringField;
    CDLubrificConsCODEMPRESA: TStringField;
    CDLubrificConsCODEQUIPAMENTO: TStringField;
    CDLubrificConsCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDLubrificConsCODMONITORAMENTO: TIntegerField;
    CDLubrificConsDESCRICAO: TStringField;
    CDLubrificConsCRITICIDADE: TStringField;
    CDLubrificConsFREQUENCIA1: TSmallintField;
    CDLubrificConsDTAINICIO1: TDateTimeField;
    CDLubrificConsREPROGRAMAR1: TStringField;
    CDLubrificConsFREQUENCIA2: TSmallintField;
    CDLubrificConsLEITURA: TIntegerField;
    CDLubrificConsREPROGRAMAR2: TStringField;
    CDLubrificConsRELATORIO: TStringField;
    CDLubrificConsEQUIPAMENTO: TStringField;
    CDLubrificConsSEQUENCIA: TIntegerField;
    CDLubrificConsCODFAMILIAEQUIP: TStringField;
    CDLubrificConsFAMILIAEQUIP: TStringField;
    CDLubrificConsCODAREA: TStringField;
    CDLubrificConsAREA: TStringField;
    CDLubrificConsCODCELULA: TStringField;
    CDLubrificConsCELULA: TStringField;
    CDLubrificConsCODLINHA: TStringField;
    CDLubrificConsLINHA: TStringField;
    CDRotaConsCODIGO: TStringField;
    CDRotaConsCODEMPRESA: TStringField;
    CDRotaConsDESCRICAO: TStringField;
    CDRotaConsFREQUENCIA: TSmallintField;
    CDRotaConsDATAINICIO: TDateTimeField;
    CDRotaConsREPROGRAMAR: TStringField;
    CDRotaConsRELATORIO: TStringField;
    CDCadOrdemServicoServSolicCODIGO: TAutoIncField;
    CDCadOrdemServicoServSolicCODEMPRESA: TStringField;
    CDCadOrdemServicoServSolicCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoServSolicPARTE: TStringField;
    CDCadOrdemServicoServSolicITEM: TStringField;
    CDCadOrdemServicoServSolicDESCRICAO: TStringField;
    CDCadOrdemServicoServSolicEQUIPPARADO: TStringField;
    CDCadOrdemServicoServSolicTEMPOEXECUCAO: TBCDField;
    CDCadOrdemServicoEquipeMObraTOTALHOMEMHORA: TBCDField;
    CDCadOrdemServicoEquipeMObraMATRICULA: TStringField;
    CDCadOrdemServicoEquipeMObraNOME: TStringField;
    CDCadOrdemServicoMObraProgCODIGO: TAutoIncField;
    CDCadOrdemServicoMObraProgCODEMPRESA: TStringField;
    CDCadOrdemServicoMObraProgCODEQUIPE: TIntegerField;
    CDCadOrdemServicoMObraProgCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoMObraProgCODCARGO: TStringField;
    CDCadOrdemServicoMObraProgMATRICULA: TStringField;
    CDCadOrdemServicoMObraProgNOME: TStringField;
    CDCadOrdemServicoMObraProgTOTALHOMEMHORA: TBCDField;
    CDCadOrdemServicoMObraProgQTDEHENORMAL: TBCDField;
    CDCadOrdemServicoMObraProgQTDEHEFERIADO: TBCDField;
    CDCadOrdemServicoMObraProgESPECIALISTA: TStringField;
    CDCadOrdemServicoMObraProgCODCALENDARIO: TStringField;
    CDCadOrdemServicoMObraProgCALENDARIO: TStringField;
    CDOrdemServicoGerenciaTEMPOPREVISTO: TBCDField;
    CDCadOrdemServicoEquipeMObraUtilCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeMObraUtilCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeMObraUtilCODEQUIPE: TIntegerField;
    CDCadOrdemServicoEquipeMObraUtilCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeMObraUtilCODCARGO: TStringField;
    CDCadOrdemServicoEquipeMObraUtilCODCALENDARIO: TStringField;
    CDCadOrdemServicoEquipeMObraUtilMATRICULA: TStringField;
    CDCadOrdemServicoEquipeMObraUtilNOME: TStringField;
    CDCadOrdemServicoEquipeMObraUtilTOTALHOMEMHORA: TBCDField;
    CDCadOrdemServicoEquipeMObraUtilQTDEHENORMAL: TBCDField;
    CDCadOrdemServicoEquipeMObraUtilQTDEHEFERIADO: TBCDField;
    CDCadOrdemServicoEquipeMObraUtilESPECIALISTA: TStringField;
    CDCadOrdemServicoEquipeMObraUtilFECHAMENTO: TDateTimeField;
    CDCadOrdemServicoEquipeMObraUtilCARGO: TStringField;
    CDCadOrdemServicoEquipeMObraUtilCALENDARIO: TStringField;
    CDCadOrdemServicoEquipeMObraUtilHOFICIAIS: TIntegerField;
    CDCadOrdemServicoEquipeMObraUtilSALARIO: TBCDField;
    CDCadOrdemServicoEquipeRecursosUtilCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeRecursosUtilCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeRecursosUtilCODEQUIPE: TIntegerField;
    CDCadOrdemServicoEquipeRecursosUtilCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeRecursosUtilCODRECURSO: TStringField;
    CDCadOrdemServicoEquipeRecursosUtilQTDESOLIC: TIntegerField;
    CDCadOrdemServicoEquipeRecursosUtilQTDERESERV: TIntegerField;
    CDCadOrdemServicoEquipeRecursosUtilENTRADA: TDateTimeField;
    CDCadOrdemServicoEquipeRecursosUtilRECURSO: TStringField;
    CDCadOrdemServicoEquipeRecursosUtilESTOQUE: TIntegerField;
    CDCadOrdemServicoServExecCODIGO: TAutoIncField;
    CDCadOrdemServicoServExecCODEMPRESA: TStringField;
    CDCadOrdemServicoServExecCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoServExecPARTE: TStringField;
    CDCadOrdemServicoServExecITEM: TStringField;
    CDCadOrdemServicoServExecDESCRICAO: TStringField;
    CDCadOrdemServicoServExecEQUIPPARADO: TStringField;
    CDCadOrdemServicoServExecTEMPOEXECUCAO: TBCDField;
    CDCadOrdemServicoMObraDispAPELIDO: TStringField;
    CDCadOrdemServicoMObraDispIMAGEM: TBlobField;
    CDCadOrdemServicoParalisacaoCODIGO: TAutoIncField;
    CDCadOrdemServicoParalisacaoCODEMPRESA: TStringField;
    CDCadOrdemServicoParalisacaoCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoParalisacaoDATAPARALISACAO: TDateTimeField;
    CDCadOrdemServicoParalisacaoDATARETORNO: TDateTimeField;
    CDCadOrdemServicoParalisacaoMOTIVOPARALISACAO: TStringField;
    CDCadOrdemServicoHistoricoServExecTEMPOEXECUCAO: TBCDField;
    CDCadOrdemServicoCustoSecCUSTOTOTALSEC: TFMTBCDField;
    CDCadOrdemServicoTercUnidCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidMATRICULA: TStringField;
    CDCadOrdemServicoTercUnidCODCENTROCUSTO: TStringField;
    CDCadOrdemServicoTercUnidDESCRICAO: TStringField;
    CDCadOrdemServicoTercUnidCONTRATO: TStringField;
    CDCadOrdemServicoTercUnidDATACONTRATOINI: TDateTimeField;
    CDCadOrdemServicoTercUnidDATACONTRATOFIN: TDateTimeField;
    CDCadOrdemServicoTercUnidDATAINICIOSERV: TDateTimeField;
    CDCadOrdemServicoTercUnidDATAFIMSERV: TDateTimeField;
    CDCadOrdemServicoTercUnidVALORCONTRATO: TBCDField;
    CDCadOrdemServicoTercUnidVALORFINAL: TBCDField;
    CDCadOrdemServicoTercUnidNUMPARCELAS: TIntegerField;
    CDCadOrdemServicoTercUnidRECURSOS: TStringField;
    CDCadOrdemServicoTercUnidMATERIAL: TStringField;
    CDCadOrdemServicoTercUnidEMPREITADA: TStringField;
    CDCadOrdemServicoTercUnidSITUACAO: TStringField;
    CDCadOrdemServicoTercUnidDATAFECHAMENTO: TDateTimeField;
    CDCadOrdemServicoTercUnidDATACADASTRO: TDateTimeField;
    CDCadOrdemServicoTercUnidCODUSUARIOCAD: TStringField;
    CDCadOrdemServicoTercUnidDATAULTALT: TDateTimeField;
    CDCadOrdemServicoTercUnidCODUSUARIOALT: TStringField;
    CDCadOrdemServicoTercUnidOBSERVACOES: TBlobField;
    CDCadOrdemServicoTercUnidFUNCIONARIO: TStringField;
    CDCadOrdemServicoTercUnidCENTROCUSTO: TStringField;
    CDCadOrdemServicoTercUnidUSUARIOCAD: TStringField;
    CDCadOrdemServicoTercUnidUSUARIOALT: TStringField;
    CDCadOrdemServicoTercUnidTarefasCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidTarefasCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidTarefasCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidTarefasCODCALENDARIO: TStringField;
    CDCadOrdemServicoTercUnidTarefasDESCRICAO: TStringField;
    CDCadOrdemServicoTercUnidTarefasTEMPOPREVISTO: TBCDField;
    CDCadOrdemServicoTercUnidTarefasDATAPROGINI: TDateTimeField;
    CDCadOrdemServicoTercUnidTarefasDATAPROGFIN: TDateTimeField;
    CDCadOrdemServicoTercUnidTarefasPREDECESSORA: TStringField;
    CDCadOrdemServicoTercUnidTarefasCALENDARIO: TStringField;
    CDCadOrdemServicoTercUnidTarefasPredCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidTarefasPredCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidTarefasPredCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidTarefasPredCODANTECESSORA: TIntegerField;
    CDCadOrdemServicoTercUnidTarefasPredCODTAREFA: TIntegerField;
    CDCadOrdemServicoTercUnidTarefasPredTAREFA: TStringField;
    CDCadOrdemServicoTercUnidTarefasPredDATAPROGINI: TDateTimeField;
    CDCadOrdemServicoTercUnidTarefasPredDATAPROGFIN: TDateTimeField;
    CDCadOrdemServicoTercUnidMedicoesCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidMedicoesCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidMedicoesCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidMedicoesDATAMEDICAO: TDateTimeField;
    CDCadOrdemServicoTercUnidMedicoesLIBERADO: TStringField;
    CDCadOrdemServicoTercUnidMedicoesPARCELA: TIntegerField;
    CDCadOrdemServicoTercUnidAditivosCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidAditivosCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidAditivosCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidAditivosNOVADATAFIN: TDateTimeField;
    CDCadOrdemServicoTercUnidAditivosNOVOVALOR: TBCDField;
    CDCadOrdemServicoTercUnidAditivosNOVONUMPARCELAS: TIntegerField;
    CDCadOrdemServicoTercUnidAditivosMOTIVO: TBlobField;
    CDCadOrdemServicoTercUnidAditivosMAXNOVOVALOR: TBCDField;
    CDCadOrdemServicoTercUnidMateriaisCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidMateriaisCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidMateriaisCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidMateriaisDESCRICAO: TStringField;
    CDCadOrdemServicoTercUnidMateriaisQUANTIDADE: TIntegerField;
    CDCadOrdemServicoTercUnidMateriaisPRECO: TBCDField;
    CDCadOrdemServicoTercUnidRecursoCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidRecursoCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidRecursoCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidRecursoCODRECURSO: TStringField;
    CDCadOrdemServicoTercUnidRecursoQUANTIDADE: TIntegerField;
    CDCadOrdemServicoTercUnidRecursoRECURSO: TStringField;
    CDCadOrdemServicoTercUnidPecasCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidPecasCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidPecasCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidPecasCODPECAREP: TStringField;
    CDCadOrdemServicoTercUnidPecasQUANTIDADE: TIntegerField;
    CDCadOrdemServicoTercUnidPecasPECAREPOSICAO: TStringField;
    CDCadOrdemServicoTercUnidPecasREFERENCIA: TStringField;
    CDCadOrdemServicoTercForaAditivosCODIGO: TAutoIncField;
    CDCadOrdemServicoTercForaAditivosCODEMPRESA: TStringField;
    CDCadOrdemServicoTercForaAditivosCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercForaAditivosNOVADATAFIN: TDateTimeField;
    CDCadOrdemServicoTercForaAditivosNOVOVALOR: TBCDField;
    CDCadOrdemServicoTercForaAditivosNOVONUMPARCELAS: TIntegerField;
    CDCadOrdemServicoTercForaAditivosMOTIVO: TBlobField;
    CDCadOrdemServicoTercForaOECODIGO: TAutoIncField;
    CDCadOrdemServicoTercForaOECODEMPRESA: TStringField;
    CDCadOrdemServicoTercForaOECODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercForaOENUMERO: TIntegerField;
    CDCadOrdemServicoTercForaOEDESCRICAO: TStringField;
    CDCadOrdemServicoTercForaOETOTAL: TBCDField;
    CDCadOrdemServicoTercForaOCCODIGO: TAutoIncField;
    CDCadOrdemServicoTercForaOCCODEMPRESA: TStringField;
    CDCadOrdemServicoTercForaOCCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercForaOCNUMERO: TIntegerField;
    CDCadOrdemServicoTercForaOCDESCRICAO: TStringField;
    CDCadOrdemServicoTercForaOCTOTAL: TBCDField;
    CDCadOrdemServicoTercForaOICODEMPRESA: TStringField;
    CDCadOrdemServicoTercForaOICODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercForaOINUMERO: TIntegerField;
    CDCadOrdemServicoTercForaOIDESCRICAO: TStringField;
    CDCadOrdemServicoTercForaOITOTAL: TBCDField;
    CDCadOrdemServicoTercForaCODIGO: TAutoIncField;
    CDCadOrdemServicoTercForaCODEMPRESA: TStringField;
    CDCadOrdemServicoTercForaCODEQUIPAMENTO: TStringField;
    CDCadOrdemServicoTercForaDESCRICAO: TStringField;
    CDCadOrdemServicoTercForaCONTRATO: TStringField;
    CDCadOrdemServicoTercForaNUMCONTRATO: TStringField;
    CDCadOrdemServicoTercForaNUMPEDIDO: TStringField;
    CDCadOrdemServicoTercForaPEDIDO: TStringField;
    CDCadOrdemServicoTercForaDATACONTRATOINI: TDateTimeField;
    CDCadOrdemServicoTercForaDATACONTRATOFIN: TDateTimeField;
    CDCadOrdemServicoTercForaTOTALSERVINI: TBCDField;
    CDCadOrdemServicoTercForaTOTALSERVCOMP: TBCDField;
    CDCadOrdemServicoTercForaTOTALSERVTERC: TBCDField;
    CDCadOrdemServicoTercForaTOTALGERAL: TBCDField;
    CDCadOrdemServicoTercForaDATACADASTRO: TDateTimeField;
    CDCadOrdemServicoTercForaCODUSUARIOCAD: TStringField;
    CDCadOrdemServicoTercForaDATAULTALT: TDateTimeField;
    CDCadOrdemServicoTercForaCODUSUARIOALT: TStringField;
    CDCadOrdemServicoTercForaOBSERVACOES: TBlobField;
    CDCadOrdemServicoTercForaEQUIPAMENTO: TStringField;
    CDCadOrdemServicoTercForaUSUARIOCAD: TStringField;
    CDCadOrdemServicoTercForaUSUARIOALT: TStringField;
    CDCadOrdemServicoTercUnidGrafTarefasCODIGO: TAutoIncField;
    CDCadOrdemServicoTercUnidGrafTarefasCODEMPRESA: TStringField;
    CDCadOrdemServicoTercUnidGrafTarefasCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoTercUnidGrafTarefasCODCALENDARIO: TStringField;
    CDCadOrdemServicoTercUnidGrafTarefasDESCRICAO: TStringField;
    CDCadOrdemServicoTercUnidGrafTarefasTEMPOPREVISTO: TBCDField;
    CDCadOrdemServicoTercUnidGrafTarefasDATAPROGINI: TDateTimeField;
    CDCadOrdemServicoTercUnidGrafTarefasDATAPROGFIN: TDateTimeField;
    CDCadOrdemServicoTercUnidGrafTarefasPREDECESSORA: TStringField;
    CDCadOrdemServicoTercUnidGrafTarefasCALENDARIO: TStringField;
    CDCadOrdemServicoTercForaOICODIGO: TAutoIncField;
    CDCadOrdemServicoTercForaOIS_TOTAL: TAggregateField;
    CDCadOrdemServicoTercForaOCS_TOTAL: TAggregateField;
    CDCadOrdemServicoTercForaOES_TOTAL: TAggregateField;
    CDCadOrdemServicoTercForaAditivosS_NOVOVALOR: TAggregateField;
    CDCadDespMensalFuncCODIGO: TAutoIncField;
    CDCadDespMensalFuncCODEMPRESA: TStringField;
    CDCadDespMensalFuncCODDESPINFOFUNCPER: TIntegerField;
    CDCadDespMensalFuncMATRICULA: TStringField;
    CDCadDespMensalFuncMES: TStringField;
    CDCadDespMensalFuncANO: TStringField;
    CDCadDespMensalFuncHENOREXEC: TIntegerField;
    CDCadDespMensalFuncHEFEREXEC: TIntegerField;
    CDCadDespMensalFuncHENORPAGAS: TIntegerField;
    CDCadDespMensalFuncHEFERPAGAS: TIntegerField;
    CDCadDespMensalFuncHORASFOLGAS: TIntegerField;
    CDCadDespMensalFuncACIDSEMPT: TIntegerField;
    CDCadDespMensalFuncACIDCOMPT: TIntegerField;
    CDCadDespMensalFuncDIASPERDTOT: TIntegerField;
    CDCadDespMensalFuncCUSTOTREIN: TBCDField;
    CDCadDespMensalFuncNOME: TStringField;
    CDCadDespMensalManutencaoCODIGO: TAutoIncField;
    CDCadDespMensalManutencaoCODEMPRESA: TStringField;
    CDCadDespMensalManutencaoMATRICULA: TStringField;
    CDCadDespMensalManutencaoMES: TStringField;
    CDCadDespMensalManutencaoANO: TStringField;
    CDCadDespMensalManutencaoDESPRECEQUIP: TBCDField;
    CDCadDespMensalManutencaoDESPMATDIVERSOS: TBCDField;
    CDCadDespMensalManutencaoDESPUTILRECURSOS: TBCDField;
    CDCadDespMensalManutencaoDESPMOBRAADM: TBCDField;
    CDCadDespMensalManutencaoDESPCUSTOTREIN: TBCDField;
    CDCadDespMensalManutencaoDESPCUSTOHE: TBCDField;
    CDCadDespMensalManutencaoDESPTOTAL: TBCDField;
    CDCadDespMensalManutencaoCustosMOBRAADM: TFMTBCDField;
    CDCadDespMensalManutencaoCustosCUSTOTREINAM: TFMTBCDField;
    CDCadDespMensalManutencaoCustosMATREQ: TFMTBCDField;
    CDCadDespMensalManutencaoCustosHORASEXTRAS: TFMTBCDField;
    CDCadDespMensalManutencaoCustosRECURSOS: TFMTBCDField;
    CDCadDespMensalProdMensalCODIGO: TAutoIncField;
    CDCadDespMensalProdMensalCODEMPRESA: TStringField;
    CDCadDespMensalProdMensalCODAREA: TStringField;
    CDCadDespMensalProdMensalMES: TStringField;
    CDCadDespMensalProdMensalANO: TStringField;
    CDCadDespMensalProdMensalPRODFABRICADO: TStringField;
    CDCadDespMensalProdMensalTOTAL: TBCDField;
    CDCadDespMensalProdMensalTIPO: TStringField;
    CDCadDespMensalProdMensalAREA: TStringField;
    CDCadDespMensalTaxasCODIGO: TAutoIncField;
    CDCadDespMensalTaxasCODEMPRESA: TStringField;
    CDCadDespMensalTaxasCODDESPTAXAPER: TIntegerField;
    CDCadDespMensalTaxasDESCRICAO: TStringField;
    CDCadDespMensalTaxasVALOR: TBCDField;
    CDCadDespMensalTaxasPerCODIGO: TAutoIncField;
    CDCadDespMensalTaxasPerCODEMPRESA: TStringField;
    CDCadDespMensalTaxasPerMES: TStringField;
    CDCadDespMensalTaxasPerANO: TStringField;
    CDCadDespMensalTaxasPerDATAFECHAMENTO: TDateTimeField;
    CDCadDespMensalDiversasCODIGO: TAutoIncField;
    CDCadDespMensalDiversasCODEMPRESA: TStringField;
    CDCadDespMensalDiversasMES: TStringField;
    CDCadDespMensalDiversasANO: TStringField;
    CDCadDespMensalDiversasCOEFGRAVACID: TBCDField;
    CDCadDespMensalDiversasCOEFFREQACID: TBCDField;
    CDCadDespMensalDiversasCUSTOTOTALEST: TBCDField;
    CDCadDespMensalDiversasHORASNORMAISTRAB: TIntegerField;
    CDCadDespMensalDiversasCOTACAODOLAR: TBCDField;
    CDCadIndDesempenhoCODIGO: TAutoIncField;
    CDCadIndDesempenhoCODEMPRESA: TStringField;
    CDCadIndDesempenhoMES: TStringField;
    CDCadIndDesempenhoANO: TStringField;
    CDCadIndDesempenhoDISPEQUIP: TBCDField;
    CDCadIndDesempenhoMANUTCORRET: TBCDField;
    CDCadIndDesempenhoHORASMANUTCORRET: TBCDField;
    CDCadIndDesempenhoMANUTPREV: TBCDField;
    CDCadIndDesempenhoHORASMANUTPREV: TBCDField;
    CDCadIndDesempenhoMANUTPRED: TBCDField;
    CDCadIndDesempenhoHORASMANUTPRED: TBCDField;
    CDCadIndDesempenhoOUTROSSERV: TBCDField;
    CDCadIndDesempenhoHORASOUTROSSERV: TBCDField;
    CDCadIndDesempenhoNAOCONFORM: TBCDField;
    CDCadIndDesempenhoHORASEXTRASUNID: TBCDField;
    CDCadIndDesempenhoHORAEXTRAMEC: TBCDField;
    CDCadIndDesempenhoFREQACIDMEC: TBCDField;
    CDCadIndDesempenhoGRAVACIDMEC: TBCDField;
    CDCadIndDesempenhoHORAEXTRAELE: TBCDField;
    CDCadIndDesempenhoFREQACIDELE: TBCDField;
    CDCadIndDesempenhoGRAVACIDELE: TBCDField;
    CDCadIndDesempenhoHORAEXTRACIV: TBCDField;
    CDCadIndDesempenhoFREQACIDCIV: TBCDField;
    CDCadIndDesempenhoGRAVACIDCIV: TBCDField;
    CDCadIndDesempenhoHORAEXTRAAPTEC: TBCDField;
    CDCadIndDesempenhoFREQACIDAPTEC: TBCDField;
    CDCadIndDesempenhoGRAVACIDAPTEC: TBCDField;
    CDCadIndDesempenhoCUSTOAREAMANUT: TBCDField;
    CDCadIndDesempenhoCUSTOCELMEC: TBCDField;
    CDCadIndDesempenhoCUSTOCELELET: TBCDField;
    CDCadIndDesempenhoCUSTOCELCIV: TBCDField;
    CDCadIndDesempenhoCUSTOCELAPTEC: TBCDField;
    CDCadIndDesempenhoCUSTOTREINMANUT: TBCDField;
    CDCadIndDesempenhoCUSTOTERCMANUT: TBCDField;
    CDCadIndDesempenhoCUSTOESTMANUT: TBCDField;
    CDCadIndDesempenhoCUSTOTOTALMANUT: TBCDField;
    CDCadIndDesempenhoCUSTODESPMANUT: TBCDField;
    CDCadIndDesempPercParadasTOTALOS: TLargeintField;
    CDCadIndDesempPercParadasPERCENTCORRET: TFMTBCDField;
    CDCadIndDesempPercParadasPERCENTPREV: TFMTBCDField;
    CDCadIndDesempPercParadasPERCENTPRED: TFMTBCDField;
    CDCadIndDesempPercParadasPERCENTOUTROS: TFMTBCDField;
    CDCadIndDesempTotalHEHORAEXTRAMEC: TFMTBCDField;
    CDCadIndDesempTotalHEHORAEXTRAELE: TFMTBCDField;
    CDCadIndDesempTotalHEHORAEXTRACIV: TFMTBCDField;
    CDCadIndDesempTotalHEHORAEXTRAAPT: TFMTBCDField;
    CDCadIndDesempTotalHEHORAEXTRAPROD: TFMTBCDField;
    CDCadAbastecimentosCombustCODIGO: TAutoIncField;
    CDCadAbastecimentosCombustCODEMPRESA: TStringField;
    CDCadAbastecimentosCombustCODEQUIPAMENTO: TStringField;
    CDCadAbastecimentosCombustTIPOCOMBUSTIVEL: TStringField;
    CDCadAbastecimentosCombustCONSPOTENCIAL: TBCDField;
    CDCadAbastecimentosCombustAbastCODIGO: TAutoIncField;
    CDCadAbastecimentosCombustAbastCODEMPRESA: TStringField;
    CDCadAbastecimentosCombustAbastCODEQUIPAMENTO: TStringField;
    CDCadAbastecimentosCombustAbastCODCOMBUSTIVEL: TIntegerField;
    CDCadAbastecimentosCombustAbastCODROTA: TIntegerField;
    CDCadAbastecimentosCombustAbastDATACOMBUST: TDateTimeField;
    CDCadAbastecimentosCombustAbastODOMETROCOMBUST: TIntegerField;
    CDCadAbastecimentosCombustAbastQTDECOMBUST: TBCDField;
    CDCadAbastecimentosCombustAbastPRECOCOMBUST: TBCDField;
    CDCadAbastecimentosCombustAbastVALORCOMBUST: TBCDField;
    CDCadAbastecimentosCombustAbastMATRICULA: TStringField;
    CDCadAbastecimentosCombustAbastLEITOR: TStringField;
    CDCadAbastecimentosCombustAbastTROCALEITOR: TIntegerField;
    CDCadAbastecimentosCombustAbastNOME: TStringField;
    CDCadAbastecimentosCombustAbastTIPOCOMBUSTIVEL: TStringField;
    CDCadAbastecimentosCombustAbastCONSPOTENCIAL: TBCDField;
    CDCadAbastecimentosLubrificAbastCODIGO: TAutoIncField;
    CDCadAbastecimentosLubrificAbastCODEMPRESA: TStringField;
    CDCadAbastecimentosLubrificAbastCODEQUIPAMENTO: TStringField;
    CDCadAbastecimentosLubrificAbastCODLUBRIFICANTE: TIntegerField;
    CDCadAbastecimentosLubrificAbastCODROTA: TIntegerField;
    CDCadAbastecimentosLubrificAbastDATALUBRIFIC: TDateTimeField;
    CDCadAbastecimentosLubrificAbastODOMETROLUBRIFIC: TIntegerField;
    CDCadAbastecimentosLubrificAbastQTDELUBRIFIC: TBCDField;
    CDCadAbastecimentosLubrificAbastPRECOLUBRIFIC: TBCDField;
    CDCadAbastecimentosLubrificAbastVALORLUBRIFIC: TBCDField;
    CDCadAbastecimentosLubrificAbastMATRICULA: TStringField;
    CDCadAbastecimentosLubrificAbastLEITOR: TStringField;
    CDCadAbastecimentosLubrificAbastTROCALEITOR: TIntegerField;
    CDCadAbastecimentosLubrificAbastCONSUMO: TBCDField;
    CDCadAbastecimentosLubrificAbastNOME: TStringField;
    CDCadAbastecimentosLubrificAbastLUBRIFICANTE: TStringField;
    CDCadAbastecimentosLubrificAbastCONSPOTENCIAL: TBCDField;
    CDCadAbastecimentosCODIGO: TAutoIncField;
    CDCadAbastecimentosCODEMPRESA: TStringField;
    CDCadAbastecimentosCODEQUIPAMENTO: TStringField;
    CDCadAbastecimentosCODCONTADOR: TStringField;
    CDCadAbastecimentosCODROTA: TIntegerField;
    CDCadAbastecimentosTIPO: TStringField;
    CDCadAbastecimentosDESCRICAO: TStringField;
    CDCadAbastecimentosURBANO: TIntegerField;
    CDCadAbastecimentosRODOVIARIO: TIntegerField;
    CDCadAbastecimentosCARREGADO: TIntegerField;
    CDCadAbastecimentosCONTADORATUAL: TBCDField;
    CDCadAbastecimentosDATACONTADORATUAL: TDateTimeField;
    CDCadAbastecimentosPLACA: TStringField;
    CDCadAbastecimentosDATACADASTRO: TDateTimeField;
    CDCadAbastecimentosCODUSUARIOCAD: TStringField;
    CDCadAbastecimentosDATAULTALT: TDateTimeField;
    CDCadAbastecimentosCODUSUARIOALT: TStringField;
    CDCadAbastecimentosOBSERVACOES: TBlobField;
    CDCadAbastecimentosEQUIPAMENTO: TStringField;
    CDCadAbastecimentosCONTADOR: TStringField;
    CDCadAbastecimentosCODPROGRAMACAO: TStringField;
    CDCadAbastecimentosPROGRAMACAO: TStringField;
    CDCadAbastecimentosROTA: TStringField;
    CDCadAbastecimentosUSUARIOCAD: TStringField;
    CDCadAbastecimentosUSUARIOALT: TStringField;
    CDCadPneusIDsID: TIntegerField;
    CDCadPneusIDsRODADOS: TIntegerField;
    CDCadPneusIDsINSTALADO: TDateTimeField;
    CDCadPneusIDsCODEQUIPAMENTO: TStringField;
    CDCadPneusIDsDESCEQUIPAMENTO: TStringField;
    CDCadPneusIDsSTATUS: TStringField;
    CDCadPneusIDsCODEMPRESA: TStringField;
    CDCadPneusIDsCODPNEU: TStringField;
    CDCadPneusChassiCODIGO: TAutoIncField;
    CDCadPneusChassiCODEMPRESA: TStringField;
    CDCadPneusChassiCODEQUIPAMENTO: TStringField;
    CDCadPneusChassiDESCRICAO: TStringField;
    CDCadPneusChassiTIPO: TStringField;
    CDCadPneusChassiCHASSI: TStringField;
    CDCadPneusChassiSTATUS: TStringField;
    CDCadPneusChassiPLACA: TStringField;
    CDCadPneusChassiCONTADOR: TIntegerField;
    CDCadPneusChassiDATACONTADORATUAL: TDateTimeField;
    CDCadPneusChassiDATACADASTRO: TDateTimeField;
    CDCadPneusChassiCODUSUARIOCAD: TStringField;
    CDCadPneusChassiDATAULTALT: TDateTimeField;
    CDCadPneusChassiCODUSUARIOALT: TStringField;
    CDCadPneusChassiOBSERVACOES: TBlobField;
    CDCadPneusChassiEQUIPAMENTO: TStringField;
    CDCadPneusChassiIMAGEM: TBlobField;
    CDCadPneusChassiUSUARIOCAD: TStringField;
    CDCadPneusChassiUSUARIOALT: TStringField;
    CDCadPneusChassiImagensCODIGO: TAutoIncField;
    CDCadPneusChassiImagensDESCRICAO: TStringField;
    CDCadPneusChassiImagensTIPOIMAGEM: TStringField;
    CDCadPneusChassiImagensIMAGEM: TBlobField;
    CDCadPneusChassiPosicoesCODIGO: TAutoIncField;
    CDCadPneusChassiPosicoesCODEMPRESA: TStringField;
    CDCadPneusChassiPosicoesCODCHASSI: TIntegerField;
    CDCadPneusChassiPosicoesPOSICAO: TStringField;
    CDCadPneusChassiPosicoesCODPNEU: TStringField;
    CDCadPneusChassiPosicoesID: TIntegerField;
    CDCadPneusChassiPosicoesINSTALADO: TDateTimeField;
    CDCadPneusChassiPosicoesLIMRODAGEM: TIntegerField;
    CDCadPneusChassiPosicoesTIPO: TStringField;
    CDCadPneusChassiPosicoesSTATUS: TStringField;
    CDCadPneusChassiPosicoesRODADOS: TIntegerField;
    CDCadPneusChassiPosicoesCUSTO: TBCDField;
    CDCadPneusChassiPosicoesCUSTOKM: TFMTBCDField;
    CDCadPneusChassiPneusCODIGO: TAutoIncField;
    CDCadPneusChassiPneusCODEMPRESA: TStringField;
    CDCadPneusChassiPneusCODCHASSI: TIntegerField;
    CDCadPneusChassiPneusCODPNEU: TStringField;
    CDCadPneusChassiPneusID: TIntegerField;
    CDCadPneusChassiPneusINSTALADO: TDateTimeField;
    CDCadPneusChassiPneusRODADOS: TIntegerField;
    CDCadPneusChassiPneusPOSICAO: TStringField;
    CDCadPneusChassiPneusSTATUS: TStringField;
    CDCadPneusChassiPneusCONTADOR: TBCDField;
    CDCadPneusChassiPneusCUSTO: TBCDField;
    CDCadPneusChassiPneusCUSTOKM: TFMTBCDField;
    CDCadPneusChassiPneusPNEU: TStringField;
    CDCadPneusChassiPneusEQUIPAMENTO: TStringField;
    CDCadPneusChassiAtrelamentoCODIGO: TAutoIncField;
    CDCadPneusChassiAtrelamentoCODEMPRESA: TStringField;
    CDCadPneusChassiAtrelamentoCODCHASSI: TIntegerField;
    CDCadPneusChassiAtrelamentoCODCARROCERIA1: TIntegerField;
    CDCadPneusChassiAtrelamentoCODCARROCERIA2: TIntegerField;
    CDCadPneusChassiAtrelamentoCODCARROCERIA3: TIntegerField;
    CDCadPneusChassiAtrelamentoINSTALADO1: TDateTimeField;
    CDCadPneusChassiAtrelamentoINSTALADO2: TDateTimeField;
    CDCadPneusChassiAtrelamentoINSTALADO3: TDateTimeField;
    CDCadPneusChassiAtrelamentoCODEQUIPCAVALO: TStringField;
    CDCadPneusChassiAtrelamentoDESCEQUIPCAVALO: TStringField;
    CDCadPneusChassiAtrelamentoCHASSICAVALO: TStringField;
    CDCadPneusChassiAtrelamentoCODEQUIPCARROCEIRA1: TStringField;
    CDCadPneusChassiAtrelamentoDESCEQUIPCARROCEIRA1: TStringField;
    CDCadPneusChassiAtrelamentoCHASSICARROCEIRA1: TStringField;
    CDCadPneusChassiAtrelamentoCODEQUIPCARROCEIRA2: TStringField;
    CDCadPneusChassiAtrelamentoDESCEQUIPCARROCEIRA2: TStringField;
    CDCadPneusChassiAtrelamentoCHASSICARROCEIRA2: TStringField;
    CDCadPneusChassiAtrelamentoCODEQUIPCARROCEIRA3: TStringField;
    CDCadPneusChassiAtrelamentoDESCEQUIPCARROCEIRA3: TStringField;
    CDCadPneusChassiAtrelamentoCHASSICARROCEIRA3: TStringField;
    CDCadPneusChassiAtrelamentoHistCODIGO: TAutoIncField;
    CDCadPneusChassiAtrelamentoHistCODEMPRESA: TStringField;
    CDCadPneusChassiAtrelamentoHistCODCHASSI: TIntegerField;
    CDCadPneusChassiAtrelamentoHistPOSICAO: TStringField;
    CDCadPneusChassiAtrelamentoHistCODCARROCERIA: TIntegerField;
    CDCadPneusChassiAtrelamentoHistDATA: TDateTimeField;
    CDCadPneusChassiAtrelamentoHistOPERACAO: TStringField;
    CDCadPneusChassiAtrelamentoHistCONTADOR: TIntegerField;
    CDCadPneusChassiAtrelamentoHistRODAGEM: TIntegerField;
    CDCadPneusChassiAtrelamentoHistCAVALO: TStringField;
    CDCadPneusChassiAtrelamentoHistCARROCERIA: TStringField;
    CDCadPneusChassiPneusHistCODIGO: TAutoIncField;
    CDCadPneusChassiPneusHistCODEMPRESA: TStringField;
    CDCadPneusChassiPneusHistCODCHASSI: TIntegerField;
    CDCadPneusChassiPneusHistID: TIntegerField;
    CDCadPneusChassiPneusHistEQUIPAMENTO: TStringField;
    CDCadPneusChassiPneusHistPOSICAO: TStringField;
    CDCadPneusChassiPneusHistDATA: TDateTimeField;
    CDCadPneusChassiPneusHistOPERACAO: TStringField;
    CDCadPneusChassiPneusHistSTATUS: TStringField;
    CDCadPneusChassiPneusHistRODAGEM: TIntegerField;
    CDCadPneusChassiPneusHistCUSTO: TBCDField;
    CDCadPneusChassiPneusHistCUSTOKM: TFMTBCDField;
    CDCadPneusChassiPneusHistCODPNEU: TStringField;
    CDCadPneusChassiPneusHistUNIDADE: TStringField;
    CDCadPneusChassiPneusHistCONTADOR: TBCDField;
    CDCadPneusChassiPneusHistMOTIVO: TStringField;
    CDCadPneusChassiPneusHistPNEU: TStringField;
    CDCadPneusChassiPneusHistTIPO: TStringField;
    CDCadPneusChassiPneusHistFABRICANTE: TStringField;
    CDCadPneusChassiPneusHistFORNECEDOR: TStringField;
    CDCadPneusChassiAtrelamentoRelatCODCAVALO: TStringField;
    CDCadPneusChassiAtrelamentoRelatCODEMPRESA: TStringField;
    CDCadPneusChassiAtrelamentoRelatDESCCAVALO: TStringField;
    CDCadPneusChassiAtrelamentoRelatCODCARROCERIA1: TStringField;
    CDCadPneusChassiAtrelamentoRelatDESCCARROCERIA1: TStringField;
    CDCadPneusChassiAtrelamentoRelatCODCARROCERIA2: TStringField;
    CDCadPneusChassiAtrelamentoRelatDESCCARROCERIA2: TStringField;
    CDCadPneusChassiAtrelamentoRelatCODCARROCERIA3: TStringField;
    CDCadPneusChassiAtrelamentoRelatDESCCARROCERIA3: TStringField;
    CDCadPneusChassiAtrelamentoRelatCHASSICAVALO: TStringField;
    CDCadPneusChassiAtrelamentoRelatCHASSICARROCERIA1: TStringField;
    CDCadPneusChassiAtrelamentoRelatCHASSICARROCERIA2: TStringField;
    CDCadPneusChassiAtrelamentoRelatCHASSICARROCERIA3: TStringField;
    CDCadPneusChassiPneusConsertosCODIGO: TAutoIncField;
    CDCadPneusChassiPneusConsertosCODEMPRESA: TStringField;
    CDCadPneusChassiPneusConsertosCODPNEU: TStringField;
    CDCadPneusChassiPneusConsertosCODFORNECEDOR: TStringField;
    CDCadPneusChassiPneusConsertosID: TIntegerField;
    CDCadPneusChassiPneusConsertosACAO: TStringField;
    CDCadPneusChassiPneusConsertosCUSTO: TBCDField;
    CDCadPneusChassiPneusConsertosRODAGEM: TIntegerField;
    CDCadPneusChassiPneusConsertosSERVICO: TStringField;
    CDCadPneusChassiPneusConsertosENVIO: TDateTimeField;
    CDCadPneusChassiPneusConsertosENTREGA: TDateTimeField;
    CDCadPneusChassiPneusConsertosDATACADASTRO: TDateTimeField;
    CDCadPneusChassiPneusConsertosCODUSUARIOCAD: TStringField;
    CDCadPneusChassiPneusConsertosDATAULTALT: TDateTimeField;
    CDCadPneusChassiPneusConsertosCODUSUARIOALT: TStringField;
    CDCadPneusChassiPneusConsertosOBSERVACOES: TBlobField;
    CDCadPneusChassiPneusConsertosFORNECEDOR: TStringField;
    CDCadPneusChassiPneusConsertosPNEU: TStringField;
    CDCadPneusChassiPneusConsertosUSUARIOCAD: TStringField;
    CDCadPneusChassiPneusConsertosUSUARIOALT: TStringField;
    CDCadPneusChassiPosicoesHistCODIGO: TAutoIncField;
    CDCadPneusChassiPosicoesHistCODEMPRESA: TStringField;
    CDCadPneusChassiPosicoesHistCODCHASSI: TIntegerField;
    CDCadPneusChassiPosicoesHistPOSICAO: TStringField;
    CDCadPneusChassiPosicoesHistCODPNEU: TStringField;
    CDCadPneusChassiPosicoesHistID: TIntegerField;
    CDCadPneusChassiPosicoesHistOPERACAO: TStringField;
    CDCadPneusChassiPosicoesHistDATA: TDateTimeField;
    CDCadPneusChassiPosicoesHistRODAGEM: TIntegerField;
    CDCadPneusChassiPosicoesHistCUSTO: TBCDField;
    CDCadPneusChassiPosicoesHistCUSTOKM: TFMTBCDField;
    CDCadPneusChassiPosicoesHistTIPO: TStringField;
    CDCadPneusChassiPosicoesHistDESCEQUIPAMENTO: TStringField;
    CDCadPneusChassiCustoCODEQUIPAMENTO: TStringField;
    CDCadPneusChassiCustoDESCEQUIPAMENTO: TStringField;
    CDCadPneusChassiCustoID: TIntegerField;
    CDCadPneusChassiCustoPOSICAO: TStringField;
    CDCadPneusChassiCustoMAXRODAGEM: TIntegerField;
    CDCadPneusChassiCustoMAXCUSTO: TBCDField;
    CDCadPneusChassiCustoMAXCUSTOKM: TFMTBCDField;
    CDCadPneusChassiIDCustoID: TIntegerField;
    CDCadPneusChassiIDCustoMAXRODAGEM: TIntegerField;
    CDCadPneusChassiIDCustoMAXCUSTO: TBCDField;
    CDCadPneusChassiIDCustoMAXCUSTOKM: TFMTBCDField;
    CDCadPneusChassiIDCustoPOSICAO: TStringField;
    CDCadPneusChassiIDCustoCODEQUIPAMENTO: TStringField;
    CDCadPneusChassiIDCustoDESCEQUIPAMENTO: TStringField;
    CDCadPneusChassiPERIODOCONSULTA: TStringField;
    CDCadPneusChassiCustoPERIODOCONSULTA: TStringField;
    CDCadPneusChassiCustoFILTRO: TStringField;
    CDCadPneusChassiIDCustoPERIODOCONSULTA: TStringField;
    CDCadPneusChassiPosicoesHistPERIODOCONSULTA: TStringField;
    CDCustosMesPneusUsadosCONSERTOS: TFMTBCDField;
    CDCustosMesPneusNovosCUSTOPNEUSNOVOS: TFMTBCDField;
    CDCustosMesExtrasTOTALEXTRAS: TFMTBCDField;
    CDCustosMesRecursosTOTALRECURSOS: TFMTBCDField;
    CDCustosMesPecasTOTALPECAS: TFMTBCDField;
    CDCustosMesMObraMATRICULA: TStringField;
    CDCustosMesMObraNOME: TStringField;
    CDCustosMesMObraSALARIO: TBCDField;
    CDCustosMesMObraCALENDARIO: TStringField;
    CDCustosMesMObraHOFICIAIS: TIntegerField;
    CDCustosMesMObraENTRADA: TDateTimeField;
    CDCustosMesMObraSAIDA: TDateTimeField;
    CDCustosMesMObraTEMPOHOMEMHORAEXEC: TBCDField;
    CDCustosMesMObraSITUACAO: TStringField;
    CDCustosMesMObraHORASUTIL: TBCDField;
    CDCadSolicitacaoTrabDESCSERVICO: TStringField;
    CDCadSolicitacaoTrabTEMPOESTIMADO: TBCDField;
    CDCadSolicitacaoTrabPRAZOSOLIC: TIntegerField;
    CDCadSolicitacaoTrabJUSTIFICATIVA: TStringField;
    CDCadSolicitacaoTrabHORARIOSOLIC: TDateTimeField;
    CDCadSolicitacaoTrabVALORPROG: TBCDField;
    CDCadSolicitacaoTrabCODORDEMSERVICO: TIntegerField;
    CDCadSolicitacaoTrabSITUACAO: TStringField;
    CDCadSolicitacaoTrabDATACADASTRO: TDateTimeField;
    CDCadSolicitacaoTrabCODUSUARIOCAD: TStringField;
    CDCadSolicitacaoTrabDATAULTALT: TDateTimeField;
    CDCadSolicitacaoTrabCODUSUARIOALT: TStringField;
    CDCadSolicitacaoTrabOBSERVACOES: TBlobField;
    CDCadSolicitacaoTrabEQUIPAMENTO: TStringField;
    CDCadSolicitacaoTrabSOLICITANTE: TStringField;
    CDCadSolicitacaoTrabSITUACAO_1: TStringField;
    CDCadSolicitacaoTrabUSUARIOCAD: TStringField;
    CDCadSolicitacaoTrabUSUARIOALT: TStringField;
    CDCadUnidadesNOME: TStringField;
    CDCadUnidadesLOCAL: TStringField;
    CDCadUnidadesATIVO: TStringField;
    CDCadUnidadesVISIVEL: TStringField;
    CDCadUnidadesTRANSFORMACAO: TStringField;
    CDCadUnidadesDATACADASTRO: TDateTimeField;
    CDCadUnidadesCODUSUARIOCAD: TStringField;
    CDCadUnidadesDATAULTALT: TDateTimeField;
    CDCadUnidadesCODUSUARIOALT: TStringField;
    CDCadUnidadesGRUPO: TStringField;
    CDCadUnidadesUSUARIOCAD: TStringField;
    CDCadUnidadesUSUARIOALT: TStringField;
    CDCadMonitMedicoesPtosInspCODIGO: TAutoIncField;
    CDCadMonitMedicoesPtosInspCODEMPRESA: TStringField;
    CDCadMonitMedicoesPtosInspCODEQUIPAMENTO: TStringField;
    CDCadMonitMedicoesPtosInspCODMONITORAMENTO: TIntegerField;
    CDCadMonitMedicoesPtosInspMATRICULA: TStringField;
    CDCadMonitMedicoesPtosInspDATAMEDICAO: TDateTimeField;
    CDCadMonitMedicoesPtosInspMEDICAO: TBCDField;
    CDCadMonitMedicoesPtosInspOSGERADA: TFloatField;
    CDCadMonitMedicoesPtosInspPONTOINSP: TStringField;
    CDCadMonitMedicoesPtosInspPONTOINSPLOC: TStringField;
    CDCadMonitMedicoesPtosInspEMISSAOOS: TStringField;
    CDCadMonitMedicoesPtosInspUNIDMEDIDA: TStringField;
    CDCadMonitMedicoesPtosInspLIMINFSEG: TBCDField;
    CDCadMonitMedicoesPtosInspLIMINFMAX: TBCDField;
    CDCadMonitMedicoesPtosInspLIMSUPSEG: TBCDField;
    CDCadMonitMedicoesPtosInspLIMSUPMAX: TBCDField;
    CDCadMonitMedicoesPtosInspEQUIPAMENTO: TStringField;
    CDCadMonitMedicoesPtosInspFUNCIONARIO: TStringField;
    CDCadMonitMedicoesPtosInspSITUACAOOS: TStringField;
    CDRelatGerencOSCODIGO: TAutoIncField;
    CDRelatGerencOSCODEMPRESA: TStringField;
    CDRelatGerencOSDESCRICAO: TStringField;
    CDRelatGerencOSCODEQUIPAMENTO: TStringField;
    CDRelatGerencOSDATAINICIOREAL: TDateTimeField;
    CDRelatGerencOSDATAFIMREAL: TDateTimeField;
    CDRelatGerencOSDATAFECHAMENTO: TDateTimeField;
    CDRelatGerencOSTEMPOEXECUTADO: TBCDField;
    CDRelatGerencOSTEMPOHOMEMHORAEXEC: TBCDField;
    CDRelatGerencOSCUSTOMOBRA: TBCDField;
    CDRelatGerencOSCUSTORECURSOS: TBCDField;
    CDRelatGerencOSCUSTOPECAS: TBCDField;
    CDRelatGerencOSCUSTOEXTRA: TBCDField;
    CDRelatGerencOSCUSTOSECUNDARIOS: TBCDField;
    CDRelatGerencOSEQUIPAMENTO: TStringField;
    CDRelatGerencOSCODAREA: TStringField;
    CDRelatGerencOSAREA: TStringField;
    CDRelatGerencOSCODMANUTENCAO: TStringField;
    CDRelatGerencOSMANUTENCAO: TStringField;
    CDRelatGerencOSCODMOTIVOPARADA: TStringField;
    CDRelatGerencOSMOTIVOPARADA: TStringField;
    CDRelatGerencOSCODFALHA: TStringField;
    CDRelatGerencOSFALHA: TStringField;
    CDRelatGerencOSCODCENTROCUSTO: TStringField;
    CDRelatGerencOSCENTROCUSTO: TStringField;
    CDRelatGerencOSCODOFICINA: TStringField;
    CDRelatGerencOSOFICINA: TStringField;
    CDRelatGerencOSPRIORIDADEPARADA: TStringField;
    CDRelatGerencOSMATRICULA: TStringField;
    CDRelatGerencOSFUNCIONARIO: TStringField;
    CDCadEquipamentoPRECO: TBCDField;
    CDAcessoCODIGO: TAutoIncField;
    CDAcessoCODEMPRESA: TStringField;
    CDAcessoUSUARIO: TStringField;
    CDAcessoDATAACESSO: TDateTimeField;
    CDAcessoDATASAIDA: TDateTimeField;
    CDAcessoHORAENTRADA: TDateTimeField;
    CDAcessoHORASAIDA: TDateTimeField;
    CDAcessoESTACAO: TStringField;
    CDAcessoATIVO: TStringField;
    CDAcessoPERIODO: TIntegerField;
    CDCadFamEquipamentoCAMPO12: TStringField;
    CDCadFamEquipamentoN12: TStringField;
    CDCadFamPecasRepCAMPO12: TStringField;
    CDCadFamPneusCAMPO12: TStringField;
    CDCadFamRecursosCAMPO12: TStringField;
    CDCadAreasFATORMARCHADM: TBCDField;
    CDCadOrdemServicoEquipeLubrificantes: TClientDataSet;
    DSCadOrdemServicoEquipeLubrificantes: TDataSource;
    CDCadOrdemServicoEquipeLubrificantesCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeLubrificantesCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeLubrificantesCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeLubrificantesCODLUBRIFICANTE: TStringField;
    CDCadOrdemServicoEquipeLubrificantesQTDESOLIC: TBCDField;
    CDCadOrdemServicoEquipeLubrificantesENTRADA: TDateTimeField;
    CDCadOrdemServicoEquipeLubrificantesLUBRIFICANTE: TStringField;
    CDCadOrdemServicoEquipeLubrificantesESTOQUE: TBCDField;
    CDCadOrdemServicoEquipeLubrificantesUtil: TClientDataSet;
    DSCadOrdemServicoEquipeLubrificantesUtil: TDataSource;
    CDCadOrdemServicoEquipeLubrificantesUtilCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeLubrificantesUtilCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeLubrificantesUtilCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeLubrificantesUtilCODLUBRIFICANTE: TStringField;
    CDCadOrdemServicoEquipeLubrificantesUtilQTDESOLIC: TBCDField;
    CDCadOrdemServicoEquipeLubrificantesUtilENTRADA: TDateTimeField;
    CDCadOrdemServicoEquipeLubrificantesUtilLUBRIFICANTE: TStringField;
    CDCadOrdemServicoEquipeLubrificantesUtilESTOQUE: TBCDField;
    CDCadOrdemServicoEquipeLubrificantesUtilPRECO: TBCDField;
    CDCadOrdemServicoEquipePecasUtilCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipePecasUtilCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipePecasUtilCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipePecasUtilCODPECASREPOSICAO: TStringField;
    CDCadOrdemServicoEquipePecasUtilQTDESOLIC: TIntegerField;
    CDCadOrdemServicoEquipePecasUtilQTDERESERV: TIntegerField;
    CDCadOrdemServicoEquipePecasUtilENTRADA: TDateTimeField;
    CDCadOrdemServicoEquipePecasUtilPECA: TStringField;
    CDCadOrdemServicoEquipePecasUtilREFERENCIA: TStringField;
    CDCadOrdemServicoEquipePecasUtilESTOQUE: TIntegerField;
    CDCadOrdemServicoEquipePecasUtilPRECO: TBCDField;
    CDCadOrdemServicoEquipeCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeCODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoEquipeCODEQUIPE: TStringField;
    CDCadOrdemServicoEquipeTEMPO: TBCDField;
    CDCadEquipamentoLubrificHistINDICE: TAutoIncField;
    CDCadEquipamentoLubrificHistDESCRICAO: TStringField;
    CDCadEquipamentoLubrificHistCODORDEMSERVICO: TIntegerField;
    CDCadEquipamentoLubrificHistDTAINICIO1: TDateTimeField;
    CDCadEquipamentoLubrificHistDATAEXECUCAO: TDateTimeField;
    CDCadEquipamentoLubrificHistDATAFECHAMENTO: TDateTimeField;
    CDCadOrdemServicoHistoricoCODIGO: TAutoIncField;
    CDCadOrdemServicoHistoricoDESCRICAO: TStringField;
    CDCadOrdemServicoHistoricoCODEQUIPAMENTO: TStringField;
    CDCadOrdemServicoHistoricoEQUIPAMENTO: TStringField;
    CDCadOrdemServicoHistoricoDATACADASTRO: TDateTimeField;
    CDCadOrdemServicoHistoricoCODAREA: TStringField;
    CDCadOrdemServicoHistoricoAREA: TStringField;
    CDCadOrdemServicoHistoricoCODMOTIVOPARADA: TStringField;
    CDCadOrdemServicoHistoricoMOTIVOPARADA: TStringField;
    CDCadOrdemServicoHistoricoCODMANUTENCAO: TStringField;
    CDCadOrdemServicoHistoricoMANUTENCAO: TStringField;
    CDCadOrdemServicoHistoricoCODCAUSAFALHA: TStringField;
    CDCadOrdemServicoHistoricoCAUSAFALHA: TStringField;
    CDCadOrdemServicoHistoricoCODCENTROCUSTO: TStringField;
    CDCadOrdemServicoHistoricoCENTROCUSTO: TStringField;
    CDCadOrdemServicoHistoricoDATAINICIOREAL: TDateTimeField;
    CDCadOrdemServicoHistoricoDATAFIMREAL: TDateTimeField;
    CDCadOrdemServicoHistoricoTEMPOPREVISTO: TBCDField;
    CDCadOrdemServicoHistoricoTEMPOEXECUTADO: TBCDField;
    CDCadOrdemServicoHistoricoCUSTOTOTAL: TFMTBCDField;
    CDCadOrdemServicoHistoricoSITUACAO: TStringField;
    CDCadOrdemServicoHistoricoSOLICTRAB: TStringField;
    CDCadOrdemServicoHistoricoROTAEQUIP: TStringField;
    CDCadOrdemServicoHistoricoPERIODOCONSULTA: TStringField;
    CDCadOrdemServicoEquipeRecursosUtilPRECOHORA: TFMTBCDField;
    CDCadRotasSequenciaInspItensTEMPO: TBCDField;
    CDRotaPeriodicasManutItensEspTEMPO: TBCDField;
    CDCadRotasSequenciaInspItensEspTEMPO: TBCDField;
    CDCadAbastecimentosCombustAbastCONSUMO: TBCDField;
    CDRelatGerencHorasParadasCODIGO: TAutoIncField;
    CDRelatGerencHorasParadasCODEQUIPAMENTO: TStringField;
    CDRelatGerencHorasParadasTIPOMANUTENCAO: TStringField;
    CDRelatGerencHorasParadasDATAINICIOREAL: TDateTimeField;
    CDRelatGerencHorasParadasDATAFIMREAL: TDateTimeField;
    CDRelatGerencHorasParadasDATAFECHAMENTO: TDateTimeField;
    CDRelatGerencHorasParadasHORASPARADAS: TFMTBCDField;
    CDRelatGerencCustosCUSTOMOBRA: TBCDField;
    CDRelatGerencCustosCUSTORECURSOS: TBCDField;
    CDRelatGerencCustosCUSTOPECAS: TBCDField;
    CDRelatGerencCustosCUSTOEXTRA: TBCDField;
    CDRelatGerencCustosCUSTOSECUNDARIOS: TBCDField;
    CDRelatGerencCustosCODEQUIPAMENTO: TStringField;
    CDRelatGerencCustosCODAREA: TStringField;
    CDRelatGerencCustosCODCELULA: TStringField;
    CDRelatGerencCustosCODLINHA: TStringField;
    CDRelatGerencCustosSEQUENCIA: TIntegerField;
    CDRelatGerencCustosCODMANUTENCAO: TStringField;
    CDRelatGerencCustosPRIORIDADEPARADA: TStringField;
    CDRelatGerencCustosCODOFICINA: TStringField;
    CDRelatGerencCustosCODCENTROCUSTO: TStringField;
    CDOrdemServicoGerenciaCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeMObraUtilHENORMAL: TIntegerField;
    CDCadOrdemServicoEquipeMObraUtilHEFERIADO: TIntegerField;
    CDCadEquipamentoHistCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoHistEQUIPAMENTO: TStringField;
    CDCadEquipamentoHistCALENDARIO: TStringField;
    CDCadEquipamentoHistFORNECEDOR: TStringField;
    CDCadEquipamentoHistFABRICANTE: TStringField;
    CDCadEquipamentoHistORDEMSERVICO: TAutoIncField;
    CDCadEquipamentoHistSERVICO: TStringField;
    CDCadEquipamentoHistTIPOMANUTENCAO: TStringField;
    CDCadEquipamentoHistMOTIVOPARADA: TStringField;
    CDCadEquipamentoHistCAUSAFALHA: TStringField;
    CDCadEquipamentoHistCENTROCUSTO: TStringField;
    CDCadEquipamentoHistPRIORIDADEPARADA: TStringField;
    CDCadEquipamentoHistEQUIPPARADO: TStringField;
    CDCadEquipamentoHistDATAINICIOREAL: TDateTimeField;
    CDCadEquipamentoHistDATAFIMREAL: TDateTimeField;
    CDCadEquipamentoHistDATAFECHAMENTO: TDateTimeField;
    CDCadEquipamentoHistTEMPOEXECUTADO: TBCDField;
    CDCadEquipamentoHistTEMPOHOMEMHORAEXEC: TBCDField;
    CDCadEquipamentoHistCUSTOMOBRA: TBCDField;
    CDCadEquipamentoHistCUSTORECURSOS: TBCDField;
    CDCadEquipamentoHistCUSTOPECAS: TBCDField;
    CDCadEquipamentoHistCUSTOEXTRA: TBCDField;
    CDCadEquipamentoHistCUSTOSECUNDARIOS: TBCDField;
    CDCadEquipamentoHistNumParadasNUMPARADAS: TLargeintField;
    CDCadEquipamentoHistTercFora: TClientDataSet;
    DSCadEquipamentoHistTercFora: TDataSource;
    CDCadEquipamentoHistTercForaTOTAL: TFMTBCDField;
    CDRelatGerencCustoPrevCUSTOTOTALEXEC: TFMTBCDField;
    CDRelatGerencCustoPrevMOBRAPREV: TFMTBCDField;
    CDRelatGerencCustoPrevPECASPREV: TFMTBCDField;
    CDRelatGerencCustoPrevRECUPREV: TFMTBCDField;
    CDMovimentacao: TClientDataSet;
    CDMovimentacaoCODIGO: TAutoIncField;
    CDMovimentacaoCODEMPRESA: TStringField;
    CDMovimentacaoUSUARIO: TStringField;
    CDMovimentacaoMODULO: TStringField;
    CDMovimentacaoDATAACESSO: TDateTimeField;
    CDMovimentacaoDATASAIDA: TDateTimeField;
    CDMovimentacaoESTACAO: TStringField;
    CDCadOrdemServicoHistoricoCELULA: TStringField;
    CDCadOrdemServicoHistoricoOFICINA: TStringField;
    DSUsuarioPAcesso: TDataSource;
    CDCadPecasReposicaoIMAGEM: TBlobField;
    CDCadRecursosIMAGEM: TBlobField;
    CDCadManutProgEquipMATRICULA: TStringField;
    CDCadManutProgEquipRESPONSAVEL: TStringField;
    CDCadLubrificProgEquipMATRICULA: TStringField;
    CDCadLubrificProgEquipRESPONSAVEL: TStringField;
    DSMovimentacao: TDataSource;
    CDMovimentacaoUsuarios: TClientDataSet;
    CDCadSolicitacaoTrabProgramadasCODIGO: TIntegerField;
    CDCadSolicitacaoTrabProgramadasDESCRICAO: TStringField;
    CDCadSolicitacaoTrabProgramadasDATAPROGINI: TDateTimeField;
    CDCadSolicitacaoTrabProgramadasTEMPOPREVISTO: TBCDField;
    CDCadSolicitacaoTrabExecucaoCODIGO: TAutoIncField;
    CDCadSolicitacaoTrabExecucaoDESCRICAO: TStringField;
    CDCadSolicitacaoTrabExecucaoDATAINICIOREAL: TDateTimeField;
    CDCadSolicitacaoTrabExecucaoTEMPOPREVISTO: TBCDField;
    CDCadPneusCODIGO: TStringField;
    CDCadPneusCODEMPRESA: TStringField;
    CDCadPneusCODFABRICANTE: TStringField;
    CDCadPneusCODFORNECEDOR: TStringField;
    CDCadPneusCODFAMILIAPNEU: TStringField;
    CDCadPneusDESCRICAO: TStringField;
    CDCadPneusDATAAQUISICAO: TDateTimeField;
    CDCadPneusDATAGARANTIA: TDateTimeField;
    CDCadPneusPRECO: TBCDField;
    CDCadPneusQUANTIDADE: TIntegerField;
    CDCadPneusTROCA: TStringField;
    CDCadPneusTIPO: TStringField;
    CDCadPneusSTATUS: TStringField;
    CDCadPneusDATACADASTRO: TDateTimeField;
    CDCadPneusCODUSUARIOCAD: TStringField;
    CDCadPneusDATAULTALT: TDateTimeField;
    CDCadPneusCODUSUARIOALT: TStringField;
    CDCadPneusOBSERVACOES: TBlobField;
    CDCadPneusFABRICANTE: TStringField;
    CDCadPneusFORNECEDOR: TStringField;
    CDCadPneusFAMILIAPNEU: TStringField;
    CDCadPneusUSUARIOCAD: TStringField;
    CDCadPneusUSUARIOALT: TStringField;
    CDMovimentacaoUsuariosCODIGO: TAutoIncField;
    CDMovimentacaoUsuariosCODEMPRESA: TStringField;
    CDMovimentacaoUsuariosUSUARIO: TStringField;
    CDMovimentacaoUsuariosMODULO: TStringField;
    CDMovimentacaoUsuariosDATAACESSO: TDateTimeField;
    CDMovimentacaoUsuariosDATASAIDA: TDateTimeField;
    CDMovimentacaoUsuariosESTACAO: TStringField;
    CDCadTotalEquipHoraCOAREA: TStringField;
    CDRelatGerencHorasParadasCODAREA: TStringField;
    CDCadManutProgEquipPlanoTrab: TClientDataSet;
    DSCadManutProgEquipPlanoTrab: TDataSource;
    CDCadManutProgEquipPlanoTrabCODIGO: TAutoIncField;
    CDCadManutProgEquipPlanoTrabCODEMPRESA: TStringField;
    CDCadManutProgEquipPlanoTrabCODMANUTPROGFAMEQUIP: TStringField;
    CDCadManutProgEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    CDCadManutProgEquipPlanoTrabDESCRICAO: TStringField;
    CDCadManutProgEquipPlanoTrabDETALHES: TBlobField;
    CDCadLubrificProgEquipPlanoTrab: TClientDataSet;
    DSCadLubrificProgEquipPlanoTrab: TDataSource;
    CDCadLubrificProgEquipPlanoTrabCODIGO: TAutoIncField;
    CDCadLubrificProgEquipPlanoTrabCODEMPRESA: TStringField;
    CDCadLubrificProgEquipPlanoTrabCODLUBRIFICPROGFAMEQUIP: TStringField;
    CDCadLubrificProgEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    CDCadLubrificProgEquipPlanoTrabDESCRICAO: TStringField;
    CDCadLubrificProgEquipPlanoTrabDETALHES: TBlobField;
    CDCadManutProgEquipC_PROXINSP: TDateTimeField;
    CDCadPlanoTrabalhoAut: TClientDataSet;
    DSCadPlanoTrabalhoAut: TDataSource;
    CDCadPlanoTrabalhoAutCODIGO: TStringField;
    CDCadPlanoTrabalhoAutCODEMPRESA: TStringField;
    CDCadPlanoTrabalhoAutDESCRICAO: TStringField;
    CDCadPlanoTrabalhoAutDETALHES: TBlobField;
    CDCadLubrificProgEquipC_PROXINSP: TDateTimeField;
    CDCadOrdemServicoHistoricoMATRICULA: TStringField;
    CDCadOrdemServicoHistoricoSOLICITANTE: TStringField;
    CDRotaPeriodicasManutFUNCIONARIOOS: TStringField;
    CDCadRotasC_PROXINSP: TDateTimeField;
    CDCadRotasC_CODORDEMSERVICO: TIntegerField;
    CDCadOrdemServicoRESPONSAVEL: TStringField;
    CDCadOrdemServicoNOMERESPONSAVEL: TStringField;
    CDCadLubrificProgFamEquipPlanoTrabAUTOMATICO: TStringField;
    CDCadManutProgFamEquipPlanoTrabAUTOMATICO: TStringField;
    CDCadManutProgEquipPlanoTrabAUTOMATICO: TStringField;
    CDCadLubrificProgEquipPlanoTrabAUTOMATICO: TStringField;
    CDCadLubrificProgEquipFREQUENCIA2: TIntegerField;
    CDCadManutProgEquipFREQUENCIA2: TIntegerField;
    CDCadPneusDadosCODIGO: TAutoIncField;
    CDCadPneusDadosCODEMPRESA: TStringField;
    CDCadPneusDadosCODFAMILIAPNEUS: TStringField;
    CDCadPneusDadosCODPNEU: TStringField;
    CDCadPneusDadosREGISTRO1: TStringField;
    CDCadPneusDadosREGISTRO2: TStringField;
    CDCadPneusDadosREGISTRO3: TStringField;
    CDCadPneusDadosREGISTRO4: TStringField;
    CDCadPneusDadosREGISTRO5: TStringField;
    CDCadPneusDadosREGISTRO6: TStringField;
    CDCadPneusDadosREGISTRO7: TStringField;
    CDCadPneusDadosREGISTRO8: TStringField;
    CDCadPneusDadosREGISTRO9: TStringField;
    CDCadPneusDadosREGISTRO10: TStringField;
    CDCadPneusDadosREGISTRO11: TStringField;
    CDCadPneusDadosREGISTRO12: TStringField;
    CDCadPneusDadosINFORMACOES: TBlobField;
    CDAutoInc: TClientDataSet;
    CDCadMonitoramentoCODPLANOTRABALHO: TStringField;
    CDCadMonitoramentoPLANOTRABALHO: TStringField;
    CDCadMonitoramentoPlanoTrab: TClientDataSet;
    DSCadMonitoramentoPlanoTrab: TDataSource;
    CDCadMonitoramentoPlanoTrabCODIGO: TStringField;
    CDCadMonitoramentoPlanoTrabCODEMPRESA: TStringField;
    CDCadMonitoramentoPlanoTrabCODFAMILIAEQUIP: TStringField;
    CDCadMonitoramentoPlanoTrabDESCRICAO: TStringField;
    CDCadMonitoramentoPlanoTrabATIVO: TStringField;
    CDCadMonitoramentoPlanoTrabVISIVEL: TStringField;
    CDCadMonitoramentoPlanoTrabAUTOMATICO: TStringField;
    CDCadMonitoramentoPlanoTrabDATACADASTRO: TDateTimeField;
    CDCadMonitoramentoPlanoTrabCODUSUARIOCAD: TStringField;
    CDCadMonitoramentoPlanoTrabDATAULTALT: TDateTimeField;
    CDCadMonitoramentoPlanoTrabCODUSUARIOALT: TStringField;
    CDCadMonitoramentoPlanoTrabDETALHES: TBlobField;
    CDCadMonitoramentoPlanoTrabOBSERVACOES: TBlobField;
    CDCadMonitoramentoPlanoTrabUSUARIOCAD: TStringField;
    CDCadMonitoramentoPlanoTrabUSUARIOALT: TStringField;
    CDCadEquipamentoImagens: TClientDataSet;
    DSCadEquipamentoImagens: TDataSource;
    CDCadEquipamentoImagensCODIGO: TAutoIncField;
    CDCadEquipamentoImagensCODEMPRESA: TStringField;
    CDCadEquipamentoImagensCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoImagensCODITEMSECUNDARIO: TStringField;
    CDCadEquipamentoImagensDESCRICAO: TStringField;
    CDCadEquipamentoImagensDESCSECUNDARIO: TStringField;
    CDCadEquipamentoImagensTIPOFOTO: TStringField;
    CDCadEquipamentoImagensFOTO: TBlobField;
    CDCadOrdemServicoEquipeImagens: TClientDataSet;
    DSCadOrdemServicoEquipeImagens: TDataSource;
    CDCadOrdemServicoEquipeImagensCODIGO: TAutoIncField;
    CDCadOrdemServicoEquipeImagensCODEMPRESA: TStringField;
    CDCadOrdemServicoEquipeImagensCODEQUIPAMENTO: TStringField;
    CDCadOrdemServicoEquipeImagensCODITEMSECUNDARIO: TStringField;
    CDCadOrdemServicoEquipeImagensDESCRICAO: TStringField;
    CDCadOrdemServicoEquipeImagensDESCSECUNDARIO: TStringField;
    CDCadOrdemServicoEquipeImagensTIPOFOTO: TStringField;
    CDCadOrdemServicoEquipeImagensFOTO: TBlobField;
    IdTCPClient1: TIdTCPClient;
    CDCadAbastecimentosCombustAbastROTA: TStringField;
    CDCadAbastecimentosLubrificAbastROTA: TStringField;
    CDCadAbastecimentosLubrificCODIGO: TAutoIncField;
    CDCadAbastecimentosLubrificCODEMPRESA: TStringField;
    CDCadAbastecimentosLubrificCODEQUIPAMENTO: TStringField;
    CDCadAbastecimentosLubrificCODLUBRIFICANTE: TStringField;
    CDCadAbastecimentosLubrificCONSPOTENCIAL: TBCDField;
    CDCadAbastecimentosLubrificLUBRIFICANTE: TStringField;
    DSMovimentacaoUsuarios: TDataSource;
    CDCadViagens: TClientDataSet;
    DSCadViagens: TDataSource;
    CDCadViagensCODIGO: TAutoIncField;
    CDCadViagensCODEMPRESA: TStringField;
    CDCadViagensCODEQUIPAMENTO: TStringField;
    CDCadViagensCODROTA: TIntegerField;
    CDCadViagensDESCRICAO: TStringField;
    CDCadViagensDATAPARTIDA: TDateTimeField;
    CDCadViagensDATACHEGADA: TDateTimeField;
    CDCadViagensTANQUESAIDA: TIntegerField;
    CDCadViagensTANQUECHEGADA: TIntegerField;
    CDCadViagensDISTANCIA: TBCDField;
    CDCadViagensURBANO: TIntegerField;
    CDCadViagensRODOVIARIO: TIntegerField;
    CDCadViagensCARREGADO: TIntegerField;
    CDCadViagensCONTADORSAIDA: TBCDField;
    CDCadViagensCONTADORCHEGADA: TBCDField;
    CDCadViagensCONSUMOCOMBUST: TBCDField;
    CDCadViagensCONSUMOLUBRIFIC: TBCDField;
    CDCadViagensDATACADASTRO: TDateTimeField;
    CDCadViagensCODUSUARIOCAD: TStringField;
    CDCadViagensDATAULTALT: TDateTimeField;
    CDCadViagensCODUSUARIOALT: TStringField;
    CDCadViagensOBSERVACOES: TBlobField;
    CDCadViagensEQUIPAMENTO: TStringField;
    CDCadViagensMEDIDOR: TStringField;
    CDCadViagensUSUARIOCAD: TStringField;
    CDCadViagensUSUARIOALT: TStringField;
    CDCadViagensROTA: TStringField;
    CDCadViagensVOLUMETANQUE: TBCDField;
    CDCadViagensCombust: TClientDataSet;
    DSCadViagensCombust: TDataSource;
    DSCadViagensCombustAbast: TDataSource;
    CDCadViagensCombustAbast: TClientDataSet;
    CDCadViagensLubrific: TClientDataSet;
    DSCadViagensLubrific: TDataSource;
    CDCadViagensLubrificAbast: TClientDataSet;
    DSCadViagensLubrificAbast: TDataSource;
    CDCadViagensCombustAbastMAX_DATA: TAggregateField;
    CDCadViagensCombustAbastMAX_ODOM: TAggregateField;
    CDCadViagensCombustAbastCUSTOTOTAL: TAggregateField;
    CDCadViagensLubrificAbastMAX_DATA: TAggregateField;
    CDCadViagensLubrificAbastMAX_ODOM: TAggregateField;
    CDCadViagensLubrificAbastCUSTOTOTAL: TAggregateField;
    CDCadViagensCombustAbastTOTALABAST: TAggregateField;
    CDCadViagensCombustCODIGO: TAutoIncField;
    CDCadViagensCombustCODEMPRESA: TStringField;
    CDCadViagensCombustCODEQUIPAMENTO: TStringField;
    CDCadViagensCombustTIPOCOMBUSTIVEL: TStringField;
    CDCadViagensCombustCONSPOTENCIAL: TBCDField;
    CDCadViagensCombustAbastCODIGO: TAutoIncField;
    CDCadViagensCombustAbastCODEMPRESA: TStringField;
    CDCadViagensCombustAbastCODEQUIPAMENTO: TStringField;
    CDCadViagensCombustAbastCODCOMBUSTIVEL: TIntegerField;
    CDCadViagensCombustAbastCODROTA: TIntegerField;
    CDCadViagensCombustAbastDATACOMBUST: TDateTimeField;
    CDCadViagensCombustAbastODOMETROCOMBUST: TIntegerField;
    CDCadViagensCombustAbastQTDECOMBUST: TBCDField;
    CDCadViagensCombustAbastPRECOCOMBUST: TBCDField;
    CDCadViagensCombustAbastVALORCOMBUST: TBCDField;
    CDCadViagensCombustAbastMATRICULA: TStringField;
    CDCadViagensCombustAbastLEITOR: TStringField;
    CDCadViagensCombustAbastTROCALEITOR: TIntegerField;
    CDCadViagensCombustAbastCONSUMO: TBCDField;
    CDCadViagensCombustAbastROTA: TStringField;
    CDCadViagensCombustAbastNOME: TStringField;
    CDCadViagensCombustAbastTIPOCOMBUSTIVEL: TStringField;
    CDCadViagensCombustAbastCONSPOTENCIAL: TBCDField;
    CDCadViagensLubrificCODIGO: TAutoIncField;
    CDCadViagensLubrificCODEMPRESA: TStringField;
    CDCadViagensLubrificCODEQUIPAMENTO: TStringField;
    CDCadViagensLubrificCODLUBRIFICANTE: TStringField;
    CDCadViagensLubrificCONSPOTENCIAL: TBCDField;
    CDCadViagensLubrificLUBRIFICANTE: TStringField;
    CDCadViagensLubrificAbastCODIGO: TAutoIncField;
    CDCadViagensLubrificAbastCODEMPRESA: TStringField;
    CDCadViagensLubrificAbastCODEQUIPAMENTO: TStringField;
    CDCadViagensLubrificAbastCODLUBRIFICANTE: TIntegerField;
    CDCadViagensLubrificAbastCODROTA: TIntegerField;
    CDCadViagensLubrificAbastDATALUBRIFIC: TDateTimeField;
    CDCadViagensLubrificAbastODOMETROLUBRIFIC: TIntegerField;
    CDCadViagensLubrificAbastQTDELUBRIFIC: TBCDField;
    CDCadViagensLubrificAbastPRECOLUBRIFIC: TBCDField;
    CDCadViagensLubrificAbastVALORLUBRIFIC: TBCDField;
    CDCadViagensLubrificAbastMATRICULA: TStringField;
    CDCadViagensLubrificAbastLEITOR: TStringField;
    CDCadViagensLubrificAbastTROCALEITOR: TIntegerField;
    CDCadViagensLubrificAbastCONSUMO: TBCDField;
    CDCadViagensLubrificAbastROTA: TStringField;
    CDCadViagensLubrificAbastNOME: TStringField;
    CDCadViagensLubrificAbastLUBRIFICANTE: TStringField;
    CDCadViagensLubrificAbastCONSPOTENCIAL: TBCDField;
    CDCadViagensLubrificAbastTOTALLUBRIFIC: TAggregateField;
    CDCadViagensSUM_TOTALKM: TAggregateField;
    CDCadViagensSUM_TOTALCONSCOMBUST: TAggregateField;
    CDCadViagensSUM_TOTALCONSLUBRIFIC: TAggregateField;
    CDCadViagensPLACA: TStringField;
    CDCadAbastecimentosVOLUMETANQUE: TBCDField;
    CDCadAbastecimentosPERIODO: TStringField;
    CDCadViagensCONSPOTCOMBUST: TBCDField;
    CDCadViagensCONSPOTLUBRIFIC: TBCDField;
    CDRelatGerencOSDESCFAMILIAEQUIP: TStringField;
    CDRelatGerencOSCODFAMILIAEQUIP: TStringField;
    CDRelatGerencDespEquipCODFAMILIAEQUIP: TStringField;
    CDRelatGerencDespEquipDESCFAMILIAEQUIP: TStringField;
    CDRelatGerencDespEquipCALC_TOTAL: TFloatField;
    CDCadFuncionariosCxaFerramInvItensCODIGO: TIntegerField;
    CDCadFuncionariosCxaFerramInvItensCODEMPRESA: TStringField;
    CDCadFuncionariosCxaFerramInvItensCODINVENTARIO: TIntegerField;
    CDCadFuncionariosCxaFerramInvItensMATRICULA: TStringField;
    CDCadFuncionariosCxaFerramInvItensKIT: TStringField;
    CDCadFuncionariosCxaFerramInvItensCODITEM: TStringField;
    CDCadFuncionariosCxaFerramInvItensDESCRICAO: TStringField;
    CDCadFuncionariosCxaFerramInvItensQUANTIDADE: TIntegerField;
    CDCadFuncionariosCxaFerramInvItensMOTIVOPERDA: TBlobField;
    CDCadFuncionariosCxaFerramInvItensENTREGUE: TIntegerField;
    CDCadFuncionariosCxaFerramInvCODIGO: TAutoIncField;
    CDCadFuncionariosCxaFerramInvCODEMPRESA: TStringField;
    CDCadFuncionariosCxaFerramInvMATRICULA: TStringField;
    CDCadFuncionariosCxaFerramInvDATACADASTRO: TDateTimeField;
    CDCadFuncionariosCxaFerramInvDATAFECHAMENTO: TDateTimeField;
    CDCadFuncionariosCxaFerramInvFREQUENCIA: TIntegerField;
    CDCadFuncionariosCxaFerramInvSITUACAO: TStringField;
    CDCadFuncionariosCxaFerramInvFUNCIONARIO: TStringField;
    CDCadEquipamentoHist_SUMTEMPOEXEC: TAggregateField;
    CDCadEquipamentoHist_SUMCUSTOS: TAggregateField;
    CDCadEquipamentoHist_SUMCUSTOSSEC: TAggregateField;
    CDCadEquipamentoTipoManutHistCODEQUIPAMENTO: TStringField;
    CDCadEquipamentoTipoManutHistDESCRICAO: TStringField;
    CDManutPeriodicasHist: TClientDataSet;
    AutoIncField1: TAutoIncField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    SmallintField1: TSmallintField;
    DateTimeField1: TDateTimeField;
    StringField11: TStringField;
    IntegerField3: TIntegerField;
    StringField12: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    dsManutPeriodicasHist: TDataSource;
    CDLubrificPeriodicasHist: TClientDataSet;
    AutoIncField2: TAutoIncField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField28: TStringField;
    StringField29: TStringField;
    SmallintField2: TSmallintField;
    DateTimeField6: TDateTimeField;
    StringField30: TStringField;
    IntegerField6: TIntegerField;
    StringField31: TStringField;
    DateTimeField7: TDateTimeField;
    DateTimeField8: TDateTimeField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    DateTimeField9: TDateTimeField;
    DateTimeField10: TDateTimeField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    DSLubrificPeriodicasHist: TDataSource;
    CDManutPeriodicasHistItens: TClientDataSet;
    dsManutPeriodicasHistItens: TDataSource;
    CDLubrificPeriodicasHistItens: TClientDataSet;
    dsLubrificPeriodicasHistItens: TDataSource;
    CDManutPeriodicasHistItensINDICE: TAutoIncField;
    CDManutPeriodicasHistItensCODEMPRESA: TStringField;
    CDManutPeriodicasHistItensHISTORICO: TIntegerField;
    CDManutPeriodicasHistItensCODIGO: TIntegerField;
    CDManutPeriodicasHistItensCODMANUTPROGEQUIP: TStringField;
    CDManutPeriodicasHistItensDTAINICIO1: TDateTimeField;
    CDManutPeriodicasHistItensDATAINSPECAO: TDateTimeField;
    CDManutPeriodicasHistItensCODPARTE: TIntegerField;
    CDManutPeriodicasHistItensITEM: TStringField;
    CDManutPeriodicasHistItensDESCINSPECAO: TStringField;
    CDManutPeriodicasHistItensEQUIPPARADO: TStringField;
    CDManutPeriodicasHistItensTEMPO: TBCDField;
    CDManutPeriodicasHistItensEXECAUTONOMO: TStringField;
    CDManutPeriodicasHistItensEXECUTADO: TStringField;
    CDManutPeriodicasHistItensBOM: TStringField;
    CDManutPeriodicasHistItensREGULAR: TStringField;
    CDManutPeriodicasHistItensRUIM: TStringField;
    CDManutPeriodicasHistItensPARTE: TStringField;
    CDManutPeriodicasHistItensEXECUTADO_CHK: TBooleanField;
    CDManutPeriodicasHistItensBOM_CHK: TBooleanField;
    CDManutPeriodicasHistItensREGULAR_CHK: TBooleanField;
    CDManutPeriodicasHistItensRUIM_CHK: TBooleanField;
    CDLubrificPeriodicasHistItensINDICE: TAutoIncField;
    CDLubrificPeriodicasHistItensCODEMPRESA: TStringField;
    CDLubrificPeriodicasHistItensHISTORICO: TIntegerField;
    CDLubrificPeriodicasHistItensCODIGO: TIntegerField;
    CDLubrificPeriodicasHistItensCODLUBRIFICPROGEQUIP: TStringField;
    CDLubrificPeriodicasHistItensDTAINICIO1: TDateTimeField;
    CDLubrificPeriodicasHistItensDATAINSPECAO: TDateTimeField;
    CDLubrificPeriodicasHistItensCODPARTE: TIntegerField;
    CDLubrificPeriodicasHistItensITEM: TStringField;
    CDLubrificPeriodicasHistItensDESCINSPECAO: TStringField;
    CDLubrificPeriodicasHistItensEQUIPPARADO: TStringField;
    CDLubrificPeriodicasHistItensTEMPO: TBCDField;
    CDLubrificPeriodicasHistItensEXECAUTONOMO: TStringField;
    CDLubrificPeriodicasHistItensEXECUTADO: TStringField;
    CDLubrificPeriodicasHistItensBOM: TStringField;
    CDLubrificPeriodicasHistItensREGULAR: TStringField;
    CDLubrificPeriodicasHistItensRUIM: TStringField;
    CDLubrificPeriodicasHistItensPARTE: TStringField;
    CDLubrificPeriodicasHistItensEXECUTADO_CHK: TBooleanField;
    CDLubrificPeriodicasHistItensBOM_CHK: TBooleanField;
    CDLubrificPeriodicasHistItensREGULAR_CHK: TBooleanField;
    CDLubrificPeriodicasHistItensRUIM_CHK: TBooleanField;
    CDManutPeriodicasHistItensEsp: TClientDataSet;
    dsManutPeriodicasHistItensEsp: TDataSource;
    CDLubrificPeriodicasHistItensEsp: TClientDataSet;
    dsLubrificPeriodicasHistItensEsp: TDataSource;
    CDManutPeriodicasHistItensEspINDICE: TAutoIncField;
    CDManutPeriodicasHistItensEspCODEMPRESA: TStringField;
    CDManutPeriodicasHistItensEspHISTORICO: TIntegerField;
    CDManutPeriodicasHistItensEspCODIGO: TIntegerField;
    CDManutPeriodicasHistItensEspCODMANUTPROGEQUIP: TStringField;
    CDManutPeriodicasHistItensEspDTAINICIO1: TDateTimeField;
    CDManutPeriodicasHistItensEspDATAINSPECAO: TDateTimeField;
    CDManutPeriodicasHistItensEspCODPARTE: TIntegerField;
    CDManutPeriodicasHistItensEspITEM: TStringField;
    CDManutPeriodicasHistItensEspDESCINSPECAO: TStringField;
    CDManutPeriodicasHistItensEspEQUIPPARADO: TStringField;
    CDManutPeriodicasHistItensEspTEMPO: TBCDField;
    CDManutPeriodicasHistItensEspEXECAUTONOMO: TStringField;
    CDManutPeriodicasHistItensEspEXECUTADO: TStringField;
    CDManutPeriodicasHistItensEspBOM: TStringField;
    CDManutPeriodicasHistItensEspREGULAR: TStringField;
    CDManutPeriodicasHistItensEspRUIM: TStringField;
    CDManutPeriodicasHistItensEspPARTE: TStringField;
    CDManutPeriodicasHistItensEspEXECUTADO_CHK: TBooleanField;
    CDManutPeriodicasHistItensEspBOM_CHK: TBooleanField;
    CDManutPeriodicasHistItensEspREGULAR_CHK: TBooleanField;
    CDManutPeriodicasHistItensEspRUIM_CHK: TStringField;
    CDLubrificPeriodicasHistItensEspINDICE: TAutoIncField;
    CDLubrificPeriodicasHistItensEspCODEMPRESA: TStringField;
    CDLubrificPeriodicasHistItensEspHISTORICO: TIntegerField;
    CDLubrificPeriodicasHistItensEspCODIGO: TIntegerField;
    CDLubrificPeriodicasHistItensEspCODLUBRIFICPROGEQUIP: TStringField;
    CDLubrificPeriodicasHistItensEspDTAINICIO1: TDateTimeField;
    CDLubrificPeriodicasHistItensEspDATAINSPECAO: TDateTimeField;
    CDLubrificPeriodicasHistItensEspCODPARTE: TIntegerField;
    CDLubrificPeriodicasHistItensEspITEM: TStringField;
    CDLubrificPeriodicasHistItensEspDESCINSPECAO: TStringField;
    CDLubrificPeriodicasHistItensEspEQUIPPARADO: TStringField;
    CDLubrificPeriodicasHistItensEspTEMPO: TBCDField;
    CDLubrificPeriodicasHistItensEspEXECAUTONOMO: TStringField;
    CDLubrificPeriodicasHistItensEspEXECUTADO: TStringField;
    CDLubrificPeriodicasHistItensEspBOM: TStringField;
    CDLubrificPeriodicasHistItensEspREGULAR: TStringField;
    CDLubrificPeriodicasHistItensEspRUIM: TStringField;
    CDLubrificPeriodicasHistItensEspPARTE: TStringField;
    CDLubrificPeriodicasHistItensEspEXECUTADO_CHK: TBooleanField;
    CDLubrificPeriodicasHistItensEspBOM_CHK: TBooleanField;
    CDLubrificPeriodicasHistItensEspREGULAR_CHK: TBooleanField;
    CDLubrificPeriodicasHistItensEspRUIM_CHK: TBooleanField;
    CDOrdemServicoGerenciaCODOFICINA: TStringField;
    CDOrdemServicoGerenciaTIPOMANUTENCAO: TStringField;
    CDOrdemServicoGerenciaCODFAMEQUIP: TStringField;
    CDManutVencCODFAMILIAEQUIP: TStringField;
    CDLubrificVencCODFAMILIAEQUIP: TStringField;
    CDManutPeriodicasHistCODFAMILIAEQUIP: TStringField;
    CDLubrificPeriodicasHistCODFAMILIAEQUIP: TStringField;
    CDCadEquipamentoTipoManutHistTOTAL: TLargeintField;
    CDCadEquipamentoTipoManutHistCUSTOTOTAL: TFMTBCDField;
    CDCadFuncionariosTipoManutHistTOTALHOMEMHORA: TFMTBCDField;
    CDCadManutProgFamEquipItensTodos: TClientDataSet;
    AutoIncField3: TAutoIncField;
    StringField44: TStringField;
    StringField45: TStringField;
    IntegerField7: TIntegerField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    BCDField1: TBCDField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField51: TStringField;
    StringField52: TStringField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    DSCadManutProgFamEquipItensTodos: TDataSource;
    CDCadLubrificProgFamEquipItensTodos: TClientDataSet;
    AutoIncField4: TAutoIncField;
    StringField56: TStringField;
    StringField57: TStringField;
    IntegerField8: TIntegerField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    BCDField2: TBCDField;
    StringField61: TStringField;
    StringField62: TStringField;
    StringField63: TStringField;
    StringField64: TStringField;
    StringField65: TStringField;
    StringField66: TStringField;
    StringField67: TStringField;
    DSCadLubrificProgFamEquipItensTodos: TDataSource;
    CDCustoMesTercUnid: TClientDataSet;
    dsCustoMesTercUnid: TDataSource;
    CDCustoMesTercUnidTOTALTERCUNID: TFMTBCDField;
    CDManutConsC_DIASATRASO: TLargeintField;
    CDLubrificConsC_DIASATRASO: TLargeintField;
    CDManutConsPERIODO: TStringField;
    CDLubrificConsPERIODO: TStringField;
    CDUsuariosAtivosQUEDAENERGIA: TStringField;
    CDUsuariosAtivosCODIGO: TStringField;
    CDCadUsuariosBLOQUEIO: TSmallintField;
    CDCadAdmCorpBLOQUEIO: TSmallintField;
    CDCadAdmUnidBLOQUEIO: TSmallintField;
    CDUsuarioBLOQUEIO: TSmallintField;
    CDUsuariosUnidadesEMPRESA: TStringField;
    CDUsuariosUnidadesTRANSFORMACAO: TStringField;
    CDUsuariosUnidadesCODGRUPO: TIntegerField;
    CDUsuariosUnidadesGRUPO: TStringField;
    CDUsuariosUnidadesCODIGO: TFDAutoIncField;
    CDUsuariosUnidadesCODEMPRESAS: TIntegerField;
    CDUsuariosUnidadesCODNIVELACESSO: TStringField;
    CDUsuariosUnidadesCODEMPRESA: TStringField;
    cdUnidadesCorp: TClientDataSet;
    dsUnidadesCorp: TDataSource;
    cdUnidadesCorpCODEMPRESA: TStringField;
    cdUnidadesCorpEMPRESA: TStringField;
    cdUnidadesCorpTRANSFORMACAO: TStringField;
    cdUnidadesCorpCODGRUPO: TIntegerField;
    cdUnidadesCorpGRUPO: TStringField;
    CDRotaPeriodicasManutItensINDICE: TAutoIncField;
    CDRotaPeriodicasManutItensCODEMPRESA: TStringField;
    CDRotaPeriodicasManutItensHISTORICO: TIntegerField;
    CDRotaPeriodicasManutItensCODIGO: TIntegerField;
    CDRotaPeriodicasManutItensCODMANUTPROGEQUIP: TStringField;
    CDRotaPeriodicasManutItensDTAINICIO1: TDateTimeField;
    CDRotaPeriodicasManutItensDATAINSPECAO: TDateTimeField;
    CDRotaPeriodicasManutItensCODPARTE: TIntegerField;
    CDRotaPeriodicasManutItensITEM: TStringField;
    CDRotaPeriodicasManutItensDESCINSPECAO: TStringField;
    CDRotaPeriodicasManutItensEQUIPPARADO: TStringField;
    CDRotaPeriodicasManutItensTEMPO: TBCDField;
    CDRotaPeriodicasManutItensEXECAUTONOMO: TStringField;
    CDRotaPeriodicasManutItensEXECUTADO: TStringField;
    CDRotaPeriodicasManutItensBOM: TStringField;
    CDRotaPeriodicasManutItensREGULAR: TStringField;
    CDRotaPeriodicasManutItensRUIM: TStringField;
    CDRotaPeriodicasManutItensPARTE: TStringField;
    CDRotaPeriodicasManutItensEXECUTADO_CHK: TBooleanField;
    CDRotaPeriodicasManutItensBOM_CHK: TBooleanField;
    CDRotaPeriodicasManutItensREGULAR_CHK: TBooleanField;
    CDRotaPeriodicasManutItensRUIM_CHK: TBooleanField;
    CDRotaEquipVencSeqManutFREQUENCIA1: TSmallintField;
    CDRotaEquipVencSeqManutCODEQUIPAMENTO: TStringField;
    CDCadRotasSequenciaCODIGO: TAutoIncField;
    CDCadRotasSequenciaCODEMPRESA: TStringField;
    CDCadRotasSequenciaCODROTA: TStringField;
    CDCadRotasSequenciaCODAREA: TStringField;
    CDCadRotasSequenciaCODCELULA: TStringField;
    CDCadRotasSequenciaCODLINHA: TStringField;
    CDCadRotasSequenciaSEQUENCIA: TIntegerField;
    CDCadRotasSequenciaCODFAMILIAEQUIP: TStringField;
    CDCadRotasSequenciaAREA: TStringField;
    CDCadRotasSequenciaCELULA: TStringField;
    CDCadRotasSequenciaLINHA: TStringField;
    CDCadRotasSequenciaFAMILIAEQUIP: TStringField;
    CDCadRotasSequenciaCODEQUIPATUAL: TStringField;
    CDCadRotasSequenciaEQUIPATUAL: TStringField;
    CDCadRotasSequenciaFREQUENCIA: TSmallintField;
    CDRotaConsPERIODO: TStringField;
    CDRotaConsC_DIASATRASO: TLargeintField;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    CDCadAbastecimentosRotasCODIGO: TAutoIncField;
    CDCadAbastecimentosRotasCODEMPRESA: TStringField;
    CDCadAbastecimentosRotasCODVEICULO: TStringField;
    CDCadAbastecimentosRotasDESCRICAO: TStringField;
    CDCadAbastecimentosRotasTIPO: TStringField;
    CDCadAbastecimentosRotasPORCENTAGEM: TBCDField;
    CDCadAbastecimentosRotasDISTANCIA: TIntegerField;
    CDCadAbastecimentosRotasOBSERVACOES: TBlobField;
    procedure ConsultarNovoPeriodo(Combobox : TComboBox; Tempo:SmallInt);
    procedure ApplicationEventsSPMPException(Sender: TObject; E: Exception);
    procedure CDCadRecursosCalcFields(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercUnidRecursoAfterPost(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercUnidPecasAfterPost(DataSet: TDataSet);
    procedure CDCadPneusChassiAfterPost(DataSet: TDataSet);
    procedure CDCadPneusChassiAtrelamentoAfterPost(DataSet: TDataSet);
    procedure CDCadPneusChassiAtrelamentoHistAfterPost(DataSet: TDataSet);
    procedure CDCadPneusChassiPosicoesAfterScroll(DataSet: TDataSet);
    procedure CDCadMonitMedicoesPtosInspAfterScroll(DataSet: TDataSet);
    procedure CDCadFormatoCodigoAfterPost(DataSet: TDataSet);
    procedure CDCadGruposAfterPost(DataSet: TDataSet);
    procedure CDCadArquivoTecnicoParamAfterPost(DataSet: TDataSet);
    procedure CDCadFuncionariosAusenciasAfterPost(DataSet: TDataSet);
    procedure CDCadOrdemServicoMObraProgAfterPost(DataSet: TDataSet);
    procedure CDCadOrdemServico1AfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure CDManutPeriodicasAfterInsert(DataSet: TDataSet);
    procedure CDOrdemServicoGerenciaAfterScroll(DataSet: TDataSet);
    procedure CDParadasDiariasEquipAfterOpen(DataSet: TDataSet);
    procedure CDLubrificPeriodicasAfterInsert(DataSet: TDataSet);
    procedure CDCadImagensAfterPost(DataSet: TDataSet);

    procedure CliqueNoTitulo(Column: TColumn; ClientDataSet: TClientDataSet);
    procedure ConsultarAlertas;
    procedure VoltaConfig_Titulo(DBGrid: TDBGrid; Indice: integer = -1);
    procedure ExibeFoto(DataSet: TDataSet; BlobFieldName: String; ImageExibicao: TImage);
    procedure SetJPGCompression(ACompression: integer; const AInFile: string; const AOutFile: string);
    procedure MSGAguarde(strTexto: String = ''; boolAguarde: Boolean = true);

    function JpgToBmp(cImage: String): Boolean;
    function GetVersion: string;
    function AnalisarImportancia:SmallInt;
    function AplicarMascara(Campo,Mascara:TStringField;Form:TForm):Boolean;
    function CampoInputBox(const ACaption, APrompt:string): string;
    function ConsultarCombo: String;
    function CustosEquipamento(Parametros : Array of String): Boolean;
    function DataFeriado(Hora:String):Boolean;
    function HistoricoInspecoes(Tipo:SmallInt; Codigo, Descricao, CodFamilia, Reprogramar, Frequencia, CodEquip, DataInicio, CodMonit: String): Boolean;
    function HomemHoraDia(Situacao : String; Data1, Data2 : TDateTime) : Real;
    function HorasFuncTotal:Real;
    function HorasParadasEquipamento(CodEquipamento, Tipo, Area, Celula: String): Real;
    function HorasReaisTrabTotal(Tipo: SmallInt; CodEquip, CodArea: String):Real;
    function LicencaExpirada: Boolean;
    function ListaProcesso:Boolean;
    function LoadJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string): Boolean;
    function PasswordInputBox(const ACaption, APrompt:string): string;
    function RetornaPrimeiroDia(Data : TDateTime):TDateTime;
    function SaveJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string; Quality: Integer): Boolean;
    function TotalHomemHoraDisp(Data : TDateTime; Matricula: String) : Real;
    function TotalEquipHoraDisp(Data: TDateTime): Real;
    function VerificaPrimeiroAcesso:Boolean;
    function VerificaDuplo(Valor: String): Boolean;
    function VerificarInspecoes: Boolean;
    function XlsToStringGrid(xStringGrid: TStringGrid; xFileXLS: string): Boolean;
    function converter_ponto(valor_com_virgula: string): string;
    function AtualizarContadorSatelite(CodEquipamento, Placa: String; DataImportacao: TDateTime; Rodagem: Real; Indice: SmallInt):String;

    procedure RegistrarMovimentacao(Operacao, CodEmpresa, CodUsuario, Modulo, Estacao: String);
    procedure CDCadOrdemServicoServExecAfterInsert(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercUnidMedicoesAfterInsert(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercUnidAditivosAfterInsert(DataSet: TDataSet);
    procedure CDCadManutProgFamEquipPartesAfterInsert(DataSet: TDataSet);
    procedure CDCadLubrificProgFamEquipPartesAfterInsert(DataSet: TDataSet);
    procedure CDCadLubrificProgEquipItensEspAfterInsert(DataSet: TDataSet);
    procedure CDCadSolicitacaoTrabPRAZOSOLICValidate(Sender: TField);
    procedure CDManutVencCalcFields(DataSet: TDataSet);
    procedure CDLubrificVencCalcFields(DataSet: TDataSet);
    procedure CDRotaEquipVencCalcFields(DataSet: TDataSet);
    procedure CDOrdemServicoGerenciaCalcFields(DataSet: TDataSet);
    procedure CDRelatGerencDispEquipCalcFields(DataSet: TDataSet);
    procedure CDManutPeriodicasCalcFields(DataSet: TDataSet);
    procedure CDManutPeriodicasItensCalcFields(DataSet: TDataSet);
    procedure CDManutPeriodicasItensEspCalcFields(DataSet: TDataSet);
    procedure CDLubrificPeriodicasCalcFields(DataSet: TDataSet);
    procedure CDLubrificPeriodicasItensCalcFields(DataSet: TDataSet);
    procedure CDLubrificPeriodicasItensEspCalcFields(DataSet: TDataSet);
    procedure CDCadOrdemServicoHistoricoCalcFields(DataSet: TDataSet);
    procedure CDCadPneusChassiPosicoesHistCalcFields(DataSet: TDataSet);
    procedure CDCadPneusChassiCalcFields(DataSet: TDataSet);
    procedure CDCadPneusChassiCustoCalcFields(DataSet: TDataSet);
    procedure CDCadPneusChassiIDCustoCalcFields(DataSet: TDataSet);
    procedure CDCadManutProgEquipCalcFields(DataSet: TDataSet);
    procedure CDCadLubrificProgEquipCalcFields(DataSet: TDataSet);
    procedure CDCadRotasSequenciaAfterScroll(DataSet: TDataSet);
    procedure CDCadOrdemServicoServSolicAfterInsert(DataSet: TDataSet);
    procedure CDRotaPeriodicasManutItensEspCalcFields(DataSet: TDataSet);
    procedure CDRotaPeriodicasManutItensCalcFields(DataSet: TDataSet);
    procedure CDCadRecursoKitAfterScroll(DataSet: TDataSet);
    procedure CDCadPecaReposicaoKitAfterScroll(DataSet: TDataSet);
    procedure CDCadFerramentariaAfterScroll(DataSet: TDataSet);
    procedure CDCadOrdemServicoEquipeMObraAfterScroll(DataSet: TDataSet);
    procedure CDCadOrdemServicoMObraDispAfterScroll(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercUnidMateriaisAfterInsert(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercForaAfterScroll(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercForaOIAfterInsert(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercForaOCAfterInsert(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercForaOEAfterInsert(DataSet: TDataSet);
    procedure CDCadOrdemServicoTercForaAditivosAfterInsert(DataSet: TDataSet);
    procedure CDCadDespMensalFuncPerAfterScroll(DataSet: TDataSet);
    procedure CDCadDespMensalTaxasPerAfterScroll(DataSet: TDataSet);
    procedure CDCadDespMensalTaxasAfterInsert(DataSet: TDataSet);
    procedure CDCadPneusChassiAfterScroll(DataSet: TDataSet);
    procedure CDCadAlertasAfterInsert(DataSet: TDataSet);
    procedure CDCadOrdemServicoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDCadOrdemServicoEquipeAfterInsert(DataSet: TDataSet);
    procedure CDMovimentacaoReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure SQLConnSPMP3WebAfterConnect(Sender: TObject);
    procedure CDCadFuncionariosAUTONOMOValidate(Sender: TField);
    procedure CDCadFuncionariosMOBRAValidate(Sender: TField);
    procedure CDCadRotasCalcFields(DataSet: TDataSet);
    procedure CDCadManutProgFamEquipItensAfterPost(DataSet: TDataSet);
    procedure CDCadLubrificProgFamEquipItensAfterPost(DataSet: TDataSet);
    procedure CDCadManutProgEquipItensEspAfterInsert(DataSet: TDataSet);
    procedure CDCadEquipamentoImagensAfterScroll(DataSet: TDataSet);
    procedure VerificaConexaoBanco(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDCadAbastecimentosCalcFields(DataSet: TDataSet);
    procedure CDCadViagensTANQUESAIDAValidate(Sender: TField);
    procedure CDRelatGerencDespEquipCalcFields(DataSet: TDataSet);
    procedure CDCadEquipamentoTipoManutHistAfterScroll(DataSet: TDataSet);
    procedure CDManutPeriodicasAfterScroll(DataSet: TDataSet);
    procedure CDLubrificPeriodicasAfterScroll(DataSet: TDataSet);
    procedure CDManutPeriodicasHistAfterScroll(DataSet: TDataSet);
    procedure CDLubrificPeriodicasHistAfterScroll(DataSet: TDataSet);
    procedure CDManutPeriodicasHistItensCalcFields(DataSet: TDataSet);
    procedure CDLubrificPeriodicasHistItensCalcFields(DataSet: TDataSet);
    procedure CDManutPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
    procedure CDLubrificPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
    procedure CDManutVencAfterGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure CDLubrificVencAfterGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure CDCadManutProgEquipAfterOpen(DataSet: TDataSet);
    procedure CDCadLubrificProgEquipAfterOpen(DataSet: TDataSet);
    procedure CDCadManutProgEquipAfterClose(DataSet: TDataSet);
    procedure CDCadLubrificProgEquipAfterClose(DataSet: TDataSet);
    procedure CDCadOrdemServicoAfterClose(DataSet: TDataSet);
    procedure CDCadOrdemServicoEquipeAfterClose(DataSet: TDataSet);
    procedure CDCadOrdemServicoEquipeMObraUtilAfterClose(DataSet: TDataSet);
    procedure CDCadOrdemServicoHistoricoAfterClose(DataSet: TDataSet);
    procedure CDCadOrdemServicoEquipeMObraAfterClose(DataSet: TDataSet);
    procedure CDManutConsCalcFields(DataSet: TDataSet);
    procedure CDLubrificConsCalcFields(DataSet: TDataSet);
    procedure CDRotaConsCalcFields(DataSet: TDataSet);
  private
    FInstanceOwner: Boolean;
    FSMWebClient: TSMClient;
    function GetSMWebClient: TSMClient;
    { Private declarations }
  public
    FTabela_auxiliar : SmallInt;
    FDataSetParam : TClientDataSet;
    FDataSetRelat : TfrxDBDataset;
    FDataSourceParam : TDataSource;
    FDataHoraServidor : TDateTime;
    FPerfil, FLogin, FPassword, FHost, FPort, FCodUsuario, FNomeUsuario, FCodEmpresa, FNomeEmpresa, FCodGrupo, FNomeGrupo, FAlerta, FLicenca, FTela, FCodCombo, FValorCombo,
    FCodAcesso, FCodAlteracao, FCodExclusao, FCodInclusao, FNivelAcesso, FEstacao, FModulo, FNomeConsulta, FCodConsultaEquip: String;
    FNumUsuarios, FCodOrdemServico : Integer;
    FInstalacao, FDataConsultaMObra, FDataConsulta1, FDataConsulta2 : TDateTime;
    FParamAuxiliar: array[0..10] of String;
    FTotalOS, FMinutosInativo, FTotalParadasEquip : Integer;
    FAcessoLiberado, FEmpTransf, FAlterando : Boolean;
    FParametros : TArray<String>;
    FCustos : TArray<Real>;
    FTotalHHDisp, FTotalHorasFunc, FTotalHorasParadas : Real;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMClient: TSMClient read GetSMWebClient write FSMWebClient;

end;

var
  CMWeb: TCMWeb;
  LTentaConexao: Boolean;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnTelaConsulta, UnTelaCadOrdemServicoGerencia,
  UnTelaCadOrdemServicoMObraProg, UnTelaCadFuncionarios,
  UnTelaCadOrdemServicoTercUnidTarefas, UnTelaCadPneusChassi,
  UnTelaCadMonitoramento, UnTelaInspVenc, UnTelaCadOrdemServico,
  UnTelaInspFechamento, UnTelaAcesso, UnTelaPrincipal, UnTelaCadAlertas,
  UnTelaInspFechamentoHist, UnTelaCadOrdemServicoHistorico,
  UnTelaCadPneusChassiRelat, UnTelaCadAbastecimentos, UnTelaAguarde,
  UnDmRelatorios, UnTelaCadOrdemServicoMObraExecDisp,
  UnTelaCadEquipamentosImagens, UnTelaCadEquipamentosHist, UnTelaInspConsulta,
  UnTelaCadRotaProgEquip;

{$R *.dfm}

constructor TCMWeb.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TCMWeb.VerificaConexaoBanco(DataSet: TDataSet);
begin
  Try
    IdTCPClient1.ReadTimeout    := 2000;
    IdTCPClient1.ConnectTimeout := 2000;
    IdTCPClient1.Port           := 52215;
    IdTCPClient1.Host           := CMWeb.FHost; // ip é um campo que o usuario sete qual o ip da maquina servidora
    IdTCPClient1.Connect;
    IdTCPClient1.Disconnect;
    SQLConnSPMP3Web.Tag := 0;
  Except
    MessageDlg('ERRO DE CONEXÃO'+#13+'Houve perda de conexão com o servidor, o sistema será fechado!', mtError, [mbOK], 0);
    SQLConnSPMP3Web.Connected := False;
    //Application.Terminate;
  End;
end;

function TCMWeb.GetVersion: string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Size := GetFileVersionInfoSize(PChar (ParamStr (0)), Size2);
  if Size > 0 then
  begin
    GetMem (Pt, Size);
    try
      GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
      VerQueryValue (Pt, '\', Pt2, Size2);
      with TVSFixedFileInfo (Pt2^) do
      begin
        Result:= ' Ver '+
                 IntToStr (HiWord (dwFileVersionMS)) + '.' +
                 IntToStr (LoWord (dwFileVersionMS)) + '.' +
                 IntToStr (HiWord (dwFileVersionLS)) + '.' +
                 IntToStr (LoWord (dwFileVersionLS));
      end;
    finally
      FreeMem (Pt);
    end;
  end;
end;

procedure TCMWeb.RegistrarMovimentacao(Operacao, CodEmpresa, CodUsuario, Modulo,
  Estacao: String);
var

  sWindowsDir : String;
  Handle: TextFile;
begin
//if CMWeb.SQLConnSPMP3Web.ConnectionState = csStateClosed then Exit;
//if (LowerCase(CMWeb.FNomeUsuario) = 'sam_spmp') then Exit;
////CMWeb.FDataHoraServidor := CMWeb.SMClient.DataHoraServidor;
if Operacao = 'ACESSO' then
  begin
    CDMovimentacaoUsuarios.First;
    if CDMovimentacaoUsuarios.Locate('MODULO;DATASAIDA', VarArrayOf([Modulo, Null]), []) = False then
      begin
        CDMovimentacaoUsuarios.Append;
        CDMovimentacaoUsuariosCODIGO.AsInteger      := CDMovimentacaoUsuarios.RecordCount + 1;
        CDMovimentacaoUsuariosCODEMPRESA.AsString   := CMWeb.FCodEmpresa;
        CDMovimentacaoUsuariosUSUARIO.AsString      := CMWeb.FCodUsuario;
        CDMovimentacaoUsuariosMODULO.AsString       := Modulo;
        CDMovimentacaoUsuariosDATAACESSO.AsDateTime := now();
        CDMovimentacaoUsuariosESTACAO.AsString      := CMWeb.FEstacao;
        CDMovimentacaoUsuarios.Post;
//        CDMovimentacaoUsuarios.ApplyUpdates(0);
//        CDMovimentacaoUsuarios.Refresh;
      end;
  end;
if Operacao = 'SAIDA' then
  begin
    CDMovimentacaoUsuarios.First;
    if CDMovimentacaoUsuarios.Locate('MODULO;DATASAIDA', VarArrayOf([Modulo, Null]), []) = True then
      begin
        CDMovimentacaoUsuarios.Edit;
        CDMovimentacaoUsuariosDATASAIDA.AsDateTime := now();
        CMWeb.CDMovimentacaoUsuarios.Post;
//        CMWeb.CDMovimentacaoUsuarios.ApplyUpdates(0);
//        CMWeb.CDMovimentacaoUsuarios.Refresh;
      end;
  end;


  sWindowsDir := GetEnvironmentVariable('LOCALAPPDATA');

  ForceDirectories(sWindowsDir+'\SPMP3');

  try
    AssignFile(Handle, sWindowsDir+'\SPMP3\user.log');

    if not FileExists(sWindowsDir+'\SPMP3\user.log') then
      Rewrite(Handle);
    Append(Handle);
    WriteLn(Handle, Operacao+'> '+DateTimeToStr(Now)+'> '+CMWeb.FNomeUsuario+'> '+CMWeb.FEstacao+'> '+ Screen.ActiveForm.Caption);
  finally
    CloseFile(Handle);
  end;
end;


function TCMWeb.CustosEquipamento(Parametros: Array of String): Boolean;
begin
{
FParametro[0] => CodEquipamento  FParametro[1] => CodArea
FParametro[2] => CodCelula       FParametro[3] => CodLinha
FParametro[4] => CodPosicao      FParametro[5] => CodManutencao
FParametro[6] => Prioridade      FParametro[7] => CodOficina
FParametro[8] => CodCentroCusto  FParametro[9] => Situacao
}

  with CMWeb.CDAuxiliar do
    begin
      Close;

      CommandText := 'SELECT `ordemservico`.`CODIGO`, `ordemservico`.`CODEMPRESA`, `ordemservico`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO`, `tipomanutencao`.`DESCRICAO`';
      CommandText := CommandText + ' , `tipomanutencao`.`TIPOMANUTENCAO`, `motivoparada`.`DESCRICAO`, `causasfalha`.`DESCRICAO`, `centrocusto`.`DESCRICAO`, `ordemservico`.`PRIORIDADEPARADA`';
      CommandText := CommandText + ' , `ordemservico`.`EQUIPPARADO`, `ordemservico`.`DATAINICIOREAL`, `ordemservico`.`DATAFIMREAL`, `ordemservico`.`DATAFECHAMENTO`, `ordemservico`.`TEMPOEXECUTADO`';
      CommandText := CommandText + ' , `ordemservico`.`TEMPOHOMEMHORAEXEC`, `ordemservico`.`CUSTOMOBRA`, `ordemservico`.`CUSTORECURSOS`, `ordemservico`.`CUSTOPECAS`, `ordemservico`.`CUSTOEXTRA`';

      CommandText := CommandText + ' FROM `ordemservico`';

      CommandText := CommandText + ' INNER JOIN `equipamentos` ON (`ordemservico`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`ordemservico`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)';
      CommandText := CommandText + ' INNER JOIN `tipomanutencao` ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)';
      CommandText := CommandText + ' INNER JOIN `motivoparada` ON (`ordemservico`.`CODMOTIVOPARADA` = `motivoparada`.`CODIGO`)';
      CommandText := CommandText + ' INNER JOIN `causasfalha` ON (`ordemservico`.`CODCAUSAFALHA` = `causasfalha`.`CODIGO`)';
      CommandText := CommandText + ' INNER JOIN `centrocusto` ON (`ordemservico`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`)';

      CommandText := CommandText + ' WHERE (`ordemservico`.`CODEMPRESA` = :codempresa';
      Params[0].AsString := CMWeb.FCodEmpresa;

      CommandText := CommandText + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(:data1,''%Y/%m/%d'') AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(:data2,''%Y/%m/%d'')';
      Params[1].AsString := FormatDateTime('yyyy/mm/dd', FDataConsulta1);
      Params[2].AsString := FormatDateTime('yyyy/mm/dd', FDataConsulta2);

      CommandText := CommandText + ' AND `ordemservico`.`SITUACAO` = :situacao)';
      Params.ParamByName('situacao').AsString := Parametros[9];

      if Parametros[0] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`CODEQUIPAMENTO` = :codequipamento';
          Params.ParamByName('codequipamento').AsString := Parametros[0];
        end;
{      if Parametros[1] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`CODAREA` = :codarea';
          Params.ParamByName('codarea').AsString := Parametros[1];
        end;
      if Parametros[2] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`CODAREA` = :codarea';
          CommandText := CommandText + ' AND `ordemservico`.`CODCELULA` = :codcelula';
          Params.ParamByName('codarea').AsString := Parametros[1];
          Params.ParamByName('codcelula').AsString := Parametros[2];
        end;
      if Parametros[3] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`CODAREA` = :codarea';
          CommandText := CommandText + ' AND `ordemservico`.`CODCELULA` = :codcelula';
          CommandText := CommandText + ' AND `ordemservico`.`CODLINHA` = :codlinha';
          Params.ParamByName('codarea').AsString  := Parametros[1];
          Params.ParamByName('codcelula').AsString  := Parametros[2];
          Params.ParamByName('codlinha').AsString := Parametros[3];
        end;
      if Parametros[4] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`CODPOSICAO` = :codposicao';
          Params.ParamByName('codposicao').AsString := Parametros[4];
        end;
}      if Parametros[5] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `tipomanutencao`.`TIPOMANUTENCAO` = :tipomanutencao';
          Params.ParamByName('tipomanutencao').AsString := Parametros[5];
        end;
      if Parametros[6] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`PRIORIDADEPARADA` = :prioridade';
          Params.ParamByName('prioridade').AsString := Parametros[6];
        end;
      if Parametros[7] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`CODOFICINA` = :codoficina';
          Params.ParamByName('codoficina').AsString := Parametros[7];
        end;
      if Parametros[8] <> EmptyStr then
        begin
          CommandText := CommandText + ' AND `ordemservico`.`CODCENTROCUSTO` = :codcentrocusto';
          Params.ParamByName('codcentrocusto').AsString := Parametros[8];
        end;
      CommandText := CommandText + ' ORDER BY `ordemservico`.`CODIGO` ASC';
      Open;

      CMWeb.FCustos := TArray<Real>.Create(0, 0, 0, 0, 0);

      while not CMWeb.CDAuxiliar.Eof do
        begin
          CMWeb.FCustos[0] := CMWeb.FCustos[0] + FieldByName('CUSTOMOBRA').AsExtended;
          CMWeb.FCustos[1] := CMWeb.FCustos[1] + FieldByName('CUSTORECURSOS').AsExtended;
          CMWeb.FCustos[2] := CMWeb.FCustos[2] + FieldByName('CUSTOPECAS').AsExtended;
          CMWeb.FCustos[3] := CMWeb.FCustos[3] + FieldByName('CUSTOEXTRA').AsExtended;

          CMWeb.CDAuxiliar.Next;
        end;

      CMWeb.CDAuxiliar.Close;
      CMWeb.CDAuxiliar.CommandText := 'SELECT SUM(`TOTALGERAL`) FROM `ordemservicotercfora` WHERE (`CODEMPRESA` = :codempresa';
      CMWeb.CDAuxiliar.CommandText :=  CMWeb.CDAuxiliar.CommandText + ' AND `DATACONTRATOINI` >= STR_TO_DATE(:data1,''%Y/%m/%d'') AND `DATACONTRATOINI` <= STR_TO_DATE(:data2,''%Y/%m/%d'')';
      CMWeb.CDAuxiliar.CommandText :=  CMWeb.CDAuxiliar.CommandText + ' AND `DATACONTRATOFIN` >= STR_TO_DATE(:data1,''%Y/%m/%d'') AND `DATACONTRATOFIN` <= STR_TO_DATE(:data2,''%Y/%m/%d'')';

      if Parametros[0] <> EmptyStr then
        begin
          CMWeb.CDAuxiliar.CommandText := CommandText + ' AND `CODEQUIPAMENTO` = :codequipamento)';
          CMWeb.CDAuxiliar.Params.ParamByName('codequipamento').AsString := Parametros[0];
        end;
      CMWeb.CDAuxiliar.Params.ParamByName('codempresa').AsString := CMWeb.FCodEmpresa;
      CMWeb.CDAuxiliar.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd', FDataConsulta1);
      CMWeb.CDAuxiliar.Params.ParamByName('data2').AsString := FormatDateTime('yyyy/mm/dd', FDataConsulta2);
      CMWeb.CDAuxiliar.Open;
      CMWeb.FCustos[4] := Fields[0].AsFloat;

      Close;
      Result := True;
    end;
end;

destructor TCMWeb.Destroy;
begin
  FSMWebClient.Free;
  inherited;
end;

function TCMWeb.GetSMWebClient: TSMClient;
begin
  if FSMWebClient = nil then
  begin
    SQLConnSPMP3Web.Open;
    FSMWebClient:= TSMClient.Create(SQLConnSPMP3Web.DBXConnection, FInstanceOwner);
  end;
  Result := FSMWebClient;
end;

function TCMWeb.HomemHoraDia(Situacao: String; Data1, Data2 : TDateTime): Real;
begin
Result := 0;
  with CMWeb.CDAuxiliar do
    begin
      Close;
      CommandText := 'SELECT SUM(OM.TOTALHOMEMHORA)TOTALDIA FROM `ordemservico` O, `ordemservicoequipemobra` OM WHERE OM.CODORDEMSERVICO = O.CODIGO AND O.CODEMPRESA = :CODEMPRESA';
      if Situacao = 'PROGRAMADA' then
        CommandText := CommandText + ' AND (O.SITUACAO = ''PROGRAMADA'' OR O.SITUACAO = ''REPROGRAMADA'')'
      else
        CommandText := CommandText + ' AND (O.SITUACAO = ''EXECUCAO''';
      CommandText := CommandText + ' AND (O.DATAPROGINI >= STR_TO_DATE(:DATASAIDA1,''%Y/%m/%d %T'')) AND (O.DATAPROGINI <= STR_TO_DATE(:DATASAIDA2,''%Y/%m/%d %T'')) ';
      Params.ParamByName('CODEMPRESA').AsString   := CMWeb.FCodEmpresa;
      Params.ParamByName('DATASAIDA1').AsDateTime := Data1;
      Params.ParamByName('DATASAIDA2').AsDateTime := Data2;
      Execute;
      Open;
      if FieldByName('TOTALDIA').IsNull = False then
        Result := FieldByName('TOTALDIA').AsFloat;
    end;
end;

function TCMWeb.HorasParadasEquipamento(CodEquipamento, Tipo, Area, Celula: String): Real;
var
//LDataInicioFechada, LDataFimFechada :TDateTime;
//I: SmallInt;
LTotal : Real;
begin
LTotal := 0;

if DateOf(CMWeb.FDataConsulta2) = DateOf(CMWeb.FDataHoraServidor) then
  CMWeb.FDataConsulta2 := CMWeb.FDataHoraServidor;

CMWeb.CDRelatGerencHorasParadas.Close;
CMWeb.CDRelatGerencHorasParadas.Params.ParamByName('codempresa').AsString := CMWeb.FCodEmpresa;
CMWeb.CDRelatGerencHorasParadas.Params.ParamByName('data1').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', CMWeb.FDataConsulta1);
CMWeb.CDRelatGerencHorasParadas.Params.ParamByName('data2').AsString    := FormatDateTime('yyyy/mm/dd hh:mm:ss', CMWeb.FDataConsulta2) + ' 23:59:59';
CMWeb.CDRelatGerencHorasParadas.Open;
CMWeb.CDRelatGerencHorasParadas.Filtered := False;
if (CodEquipamento <> '') then
  begin
    CMWeb.CDRelatGerencHorasParadas.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(CodEquipamento);
    CMWeb.CDRelatGerencHorasParadas.Filtered := True;
  end
else
if (Area <> '') then
  begin
    CMWeb.CDRelatGerencHorasParadas.Filter := 'CODAREA = ' + QuotedStr(Area);
    CMWeb.CDRelatGerencHorasParadas.Filtered := True;
  end;

while not CMWeb.CDRelatGerencHorasParadas.Eof = True do
  begin
    //Se já terminou
    if (CMWeb.CDRelatGerencHorasParadasHORASPARADAS.IsNull = False) and (CMWeb.CDRelatGerencHorasParadasDATAINICIOREAL.AsDateTime >= CMWeb.FDataConsulta1) then
        LTotal := LTotal + CMWeb.CDRelatGerencHorasParadasHORASPARADAS.AsFloat;
    //Se não terminou
    if (CMWeb.CDRelatGerencHorasParadasHORASPARADAS.IsNull = True) then
      begin
        //Se iniciou antes da data inicial da consulta
        if CMWeb.CDRelatGerencHorasParadasDATAINICIOREAL.AsDateTime < DateOf(CMWeb.FDataConsulta1) then
          LTotal := LTotal + MinutesBetween(CMWeb.FDataConsulta1, CMWeb.FDataConsulta2)/60
        else
          LTotal := LTotal + MinutesBetween(CMWeb.CDRelatGerencHorasParadasDATAINICIOREAL.AsDateTime, CMWeb.FDataConsulta2)/60;
      end;

    CMWeb.CDRelatGerencHorasParadas.Next;
  end;
CMWeb.FTotalParadasEquip := CMWeb.CDRelatGerencHorasParadas.RecordCount;
Result := LTotal;
end;

function TCMWeb.HorasReaisTrabTotal(Tipo: SmallInt; CodEquip, CodArea: String):Real;
var
LDataConsulta : TDateTime;
LHorasReais : Real;
begin
LDataConsulta := FDataConsulta1;
LHorasReais   := 0;
case Tipo of
  0:
    begin
      CDCadTotalHomemHora.Close;
      CDCadTotalHomemHora.Params[0].AsString := CMWeb.FCodEmpresa;
      CDCadTotalHomemHora.Open;
      CDCadTotalHomemHoraSeqHora.Open;

      if (CodEquip <> EmptyStr) then
        begin
          CDCadTotalHomemHora.Filter := 'CODIGO = ' + QuotedStr(CodEquip);
          CDCadTotalHomemHora.Filtered := True;
        end
      else
        begin
          CDCadTotalHomemHora.Filter := '';
          CDCadTotalHomemHora.Filtered := False;
        end;

      while LDataConsulta < FDataConsulta2 do
        begin
          if DataFeriado(FormatDateTime('dd/mm/yyyy', LDataConsulta)) = False then
            LHorasReais := LHorasReais + TotalHomemHoraDisp(LDataConsulta, EmptyStr);
          LDataConsulta := IncDay(LDataConsulta, 1);
        end;
    end;
  1:
    begin
      CDCadTotalEquipHora.Close;
      CDCadTotalEquipHora.Params[0].AsString := CMWeb.FCodEmpresa;
      CDCadTotalEquipHora.Open;
      CDCadTotalEquipSeqHora.Open;

      if (CodEquip <> EmptyStr) and (CodArea <> EmptyStr) then
        begin
          CDCadTotalEquipHora.Filter := 'CODIGO = ' + QuotedStr(CodEquip) + ' AND CODAREA = ' + QuotedStr(CodArea);
          CDCadTotalEquipHora.Filtered := True;
        end
      else
      if (CodEquip <> EmptyStr) and (CodArea = EmptyStr) then
        begin
          CDCadTotalEquipHora.Filter := 'CODIGO = ' + QuotedStr(CodEquip);
          CDCadTotalEquipHora.Filtered := True;
        end
      else
      if (CodEquip = EmptyStr) and (CodArea <> EmptyStr) then
        begin
          CDCadTotalEquipHora.Filter := 'CODAREA = ' + QuotedStr(CodArea);
          CDCadTotalEquipHora.Filtered := True;
        end
      else
        begin
          CDCadTotalEquipHora.Filter := '';
          CDCadTotalEquipHora.Filtered := False;
        end;

       while LDataConsulta < FDataConsulta2 do
        begin
          LHorasReais := LHorasReais + TotalEquipHoraDisp(LDataConsulta);
          LDataConsulta := IncDay(LDataConsulta, 1);
        end;
    end;
end;
Result := LHorasReais;
end;

function TCMWeb.HorasFuncTotal:Real;
var
I: SmallInt;
begin
FTotalHorasFunc := 0;

with CMWeb.CDAuxiliar do
  begin
    Close;
    CommandText := 'SELECT E.CODIGO CODEQUIPAMENTO, C.CODIGO CODCALENDARIOEQUIP, C.HOFICIAIS FROM `equipamentos` E, `calendarioequip` C ';
    CommandText := CommandText + ' WHERE E.CODCALENDARIO = C.CODIGO AND E.OPERANDO = ''S'' AND E.CODEMPRESA = :CODEMPRESA AND C.CODEMPRESA = E.CODEMPRESA ORDER BY E.CODIGO';
    Params.ParamByName('CODEMPRESA').AsString := CMWeb.FCodEmpresa;
    Execute; Open; First;
    for I := 1 to CMWeb.CDAuxiliar.RecordCount do
      begin
        FTotalHorasFunc := (FTotalHorasFunc + CMWeb.CDAuxiliar.FieldByName('HOFICIAIS').AsFloat);
      end;
    Next;
  end;

FTotalHorasFunc := FTotalHorasFunc * DaysInMonth(FDataConsulta2);
Result := FTotalHorasFunc;
end;

procedure TCMWeb.ApplicationEventsSPMPException(Sender: TObject; E: Exception);
var
  Handle: TextFile;
begin
  try
    AssignFile(Handle, ExtractFilePath(Application.ExeName)+'\Error.log');
    if not FileExists(ExtractFilePath(Application.ExeName)+'\Error.log') then
      Rewrite(Handle);
    Append(Handle);
    WriteLn(Handle, DateTimeToStr(Now)+'> '+CMWeb.FNomeUsuario+'> '+CMWeb.FEstacao+'> '+ Screen.ActiveForm.Name+'> '+Screen.ActiveControl.Name+'> '+E.ClassName+' >'+E.Message);
  finally
    CloseFile(Handle);
  end;

  if (Pos('foreign key', E.message) > 0) or (Pos('parent row', E.message) > 0) or (Pos('constraint', E.message) > 0) then
    begin
      CMWeb.FDataSetParam.CancelUpdates;
      MessageDlg('Registro com relacionamento em outros cadastros!', mtError, [mbOK], 0);
    end
  else
  if E.ClassType = EIdSocketError then
    begin
      if E is EIdSocketError then
        case EIdSocketError(E).LastError of
          10054: Application.MessageBox('Sua sessão com o servidor expirou.', 'SPMP3', MB_OK + MB_ICONWARNING);
          10053: Application.MessageBox('Houve uma falha de conexão de número #10053 com a rede.', 'SPMP3', MB_OK + MB_ICONWARNING);
          10060: Application.MessageBox('Ocorreu uma falha na conexão de "Tempo Esgotado" de número #10060.', 'SPMP3', MB_OK + MB_ICONWARNING);
          10061: Application.MessageBox('Houve uma falha de "Conexão recusada" de número #10061 pelo servidor.', 'SPMP3', MB_OK + MB_ICONWARNING);
          11004: Application.MessageBox('Houve uma falha na conexão de número #11004 com a rede', 'SPMP3', MB_OK + MB_ICONWARNING);
        end;

      LTentaConexao := True;
      while LTentaConexao = True do
        Try
          CDAuxiliar.Close;
          CDAuxiliar.CommandText := 'select codigo from acessos where codigo = -1';
          CDAuxiliar.Open;
          MessageDlg('Comunicação com o banco de dados restabelecida!', mtInformation, [mbOK], 0);
          CDAuxiliar.Close;
          LTentaConexao := False;
        Except on E: Exception do
          begin
            if Application.MessageBox('Erro na comunicação com o banco de dados, deseja tentar novamente?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
              begin
                LTentaConexao := True;
                Abort;
              end
            else
              LTentaConexao := False;
          end;
        End;
    end
  else
  if E.Message = 'Remote error: Authentication manager rejected user credentials. This may due to invalid combination of DS user name and password' then
    begin
      Application.MessageBox('Dados de acesso incorretos!', 'SPMP3', MB_OK + MB_ICONERROR);
    end
  else
  if E.ClassType = EDBEditError then
    begin
      MessageDlg('VALOR INVÁLIDO!'+#13+'Preencha o campo corretamente.', mtError, [mbOK], 0);
    end
  else
  if E.ClassType = EDatabaseError then
    begin
      CMWeb.FDataSetParam.Cancel;
      MessageDlg('O SISTEMA APRESENTOU O ERRO: "'+E.Message+'"'+#13 + 'Caso o erro persista, contacte o suporte para solucionar o problema.', mtError, [mbOK], 0);
    end
  else
  if E.ClassType = EConvertError then
    begin
      MessageDlg('VALOR INVÁLIDO!' + #13 + 'Verifique o valor informado, caso o erro persista contacte o suporte para solucionar o problema.', mtError, [mbOK], 0);      ;
    end
  else
  if (E.ClassType = EOleException) or (Copy(E.Message, 1, 12) = 'Socket Error')
    or (Copy(E.Message, 1,58) = 'Remote error: Lost connection to MySQL server during query')
      or (Copy(E.Message, 1,54) = 'Remote error: ReceiveHeader: Net packets out of order:')
        or (Copy(E.Message, 1, 63) = 'Remote error: [FireDAC][Phys][MySQL] MySQL server has gone away') then
        begin
          LTentaConexao := False;
          //MessageDlg('Erro na comunicação com o banco de dados, o sistema será fechado. Se o erro persistir, contacte o suporte', mtError, [mbOK], 0);
          if Application.MessageBox('Erro de comunicação com o servidor ou conexão expirada, deseja tentar reconectar novamente?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
            begin
              LTentaConexao := True;
              while LTentaConexao = True do
                Try
                  CDAuxiliar.Close;
                  CDAuxiliar.CommandText := 'select codigo from acessos where codigo = -1';
                  CDAuxiliar.Open;
                  MessageDlg('Comunicação com o banco de dados restabelecida!', mtInformation, [mbOK], 0);
                  CDAuxiliar.Close;
                  LTentaConexao := False;
                Except on E: Exception do
                  begin
                    if Application.MessageBox('Erro na comunicação com o banco de dados, deseja tentar novamente?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
                      LTentaConexao := True
                    else
                      LTentaConexao := False;
                  end;
                End;
            end
          else
            begin
              MessageDlg('Erro na comunicação com o banco de dados, o sistema será fechado. Se o erro persistir, contacte o suporte', mtError, [mbOK], 0);
              Application.Terminate;
            end;
        end
  else
  if E.Message = 'TDBXError >Operation failed.  Connection was closed' then
    begin
      if Application.MessageBox('Erro de comunicação com o banco de dados, deseja tentar reconectar novamente?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
        begin
          LTentaConexao := True;
          while LTentaConexao = True do
            Try
              CDAuxiliar.Close;
              CDAuxiliar.CommandText := 'select codigo from acessos where codigo = -1';
              CDAuxiliar.Open;
              MessageDlg('Comunicação com o banco de dados restabelecida!', mtInformation, [mbOK], 0);
              CDAuxiliar.Close;
              LTentaConexao := False;
            Except on E: Exception do
              begin
                if Application.MessageBox('Erro na comunicação com o banco de dados, deseja tentar novamente?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
                  LTentaConexao := True
                else
                  LTentaConexao := False;
              end;
            End;
        end
      else
        begin
          MessageDlg('Erro na comunicação com o banco de dados, o sistema será fechado. Se o erro persistir, contacte o suporte', mtError, [mbOK], 0);
          Application.Terminate;
        end;
    end
  else
    begin
      MessageDlg('FALHA NA SOLICITAÇÃO: "'+E.Message+'"'+#13+'Ocorreu um erro durante a operação, tente novamente, caso o problema persista contacte o suporte.', mtError, [mbOK], 0);
    end;
end;

function TCMWeb.AtualizarContadorSatelite(CodEquipamento, Placa: String; DataImportacao: TDateTime; Rodagem: Real; Indice: SmallInt): String;
var
I: SmallInt;
begin
if (Indice = 0) or (Indice = 1) then
  begin
    CMWeb.CDCadAbastecimentos.Close;
    CMWeb.CDCadAbastecimentos.Params[0].AsString := CodEquipamento;
    CMWeb.CDCadAbastecimentos.Params[1].AsString := CMWeb.FCodEmpresa;
    CMWeb.CDCadAbastecimentos.Open;
    if CMWeb.CDCadAbastecimentos.IsEmpty = False then
      begin
        if DataImportacao <= CMWeb.CDCadAbastecimentosDATACONTADORATUAL.AsDateTime then
          begin
            Application.MessageBox('Arquivo já importado!', 'SPMP3', MB_ICONSTOP + MB_OK);
            Abort;
          end;
        if Placa <> CMWeb.CDCadAbastecimentosPLACA.AsString then
          begin
            Application.MessageBox('Equipamento incorreto!', 'SPMP3', MB_ICONWARNING + MB_OK);
            Abort;
          end;

        if Rodagem > 0 then
          begin
            CMWeb.CDCadAbastecimentos.Edit;
            CMWeb.CDCadAbastecimentosDATACONTADORATUAL.AsDateTime := DataImportacao;
            CMWeb.CDCadAbastecimentosCONTADORATUAL.AsFloat        := CMWeb.CDCadAbastecimentosCONTADORATUAL.AsFloat + Rodagem;
            CMWeb.CDCadAbastecimentos.ApplyUpdates(0);
            //CMWeb.CDCadAbastecimentos.Refresh;
            //----------------------------------------------------------------------------------------------------------------
            CMWeb.CDCadAbastecimentosManutInsp.Close;
            CMWeb.CDCadAbastecimentosManutInsp.Params[0].AsString := CMWeb.FCodEmpresa;
            CMWeb.CDCadAbastecimentosManutInsp.Params[1].AsString := CMWeb.CDCadAbastecimentosCODEQUIPAMENTO.AsString;
            CMWeb.CDCadAbastecimentosManutInsp.Params[2].AsString := CMWeb.CDCadAbastecimentosCODPROGRAMACAO.AsString;
            CMWeb.CDCadAbastecimentosManutInsp.Params[3].AsString := CMWeb.CDCadAbastecimentosCONTADORATUAL.AsString;
            CMWeb.CDCadAbastecimentosManutInsp.Open;
            CMWeb.CDCadAbastecimentosManutInsp.First;
            while not CMWeb.CDCadAbastecimentosManutInsp.Eof = True do
              begin
                CMWeb.CDCadManutProgEquip.Close;
                CMWeb.CDCadManutProgEquip.Params[0].AsString := CMWeb.CDCadAbastecimentosManutInspCODIGO.AsString;
                CMWeb.CDCadManutProgEquip.Params[1].AsString := CMWeb.FCodEmpresa;
                CMWeb.CDCadManutProgEquip.Params[2].AsString := CMWeb.CDCadAbastecimentosCODEQUIPAMENTO.AsString;
                CMWeb.CDCadManutProgEquip.Open;

                CMWeb.FCodOrdemServico := CMWeb.SMClient.GerarOS(CMWeb.FCodUsuario, CMWeb.FCodEmpresa, CMWeb.CDCadManutProgEquipDESCRICAO.AsString
                                                              , CMWeb.CDCadManutProgEquipEQUIPAMENTO.AsString, CMWeb.CDCadManutProgEquipCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                              , EmptyStr, 'Emergência', 'Para o Equipamento');

                if CMWeb.CDCadManutProgEquip.IsEmpty = False then
                  CMWeb.SMClient.HistoricoInspecoes(0, CMWeb.FCodEmpresa, CMWeb.CDCadManutProgEquipCODEQUIPAMENTO.AsString, CMWeb.CDCadManutProgEquipCODIGO.AsString, CMWeb.FCodOrdemServico);

                DmRelatorios.frxRManutProgEquipIndividual.ShowReport();

                //Sendo a inspeção reprogramada pela 'programação', programa a próxima inspeção independente se a manutenção foi fechada ou não.
                if CMWeb.CDCadManutProgEquipREPROGRAMAR2.AsString = 'Programação' then
                  begin
                    CMWeb.CDCadManutProgEquip.Edit;
                    CMWeb.CDCadManutProgEquipRELATORIO.AsString    := 'N';
                    CMWeb.CDCadManutProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(CMWeb.FDataHoraServidor), CMWeb.CDCadManutProgEquipFREQUENCIA1.AsInteger);
                    CMWeb.CDCadManutProgEquipLEITURA.AsFloat       := CMWeb.CDCadAbastecimentosCONTADORATUAL.AsFloat + CMWeb.CDCadManutProgEquipFREQUENCIA2.AsFloat;
                    CMWeb.CDCadManutProgEquip.Post;
                  end;

                //Sendo a inspeção reprogramada pela execução, definir como manutenção em aberto até ser efetuado o fechamento, portanto não permitindo
                //a geração de outra manutenção mesmo que o período vença novamente. Define a coluna 'RELATORIO = S' para impedir a geração de outra manutenção até ser fechada.
                if CMWeb.CDCadManutProgEquipREPROGRAMAR1.AsString = 'Execução' then
                  begin
                    CMWeb.CDCadManutProgEquip.Edit;
                    CMWeb.CDCadManutProgEquipRELATORIO.AsString := 'S';
                    CMWeb.CDCadManutProgEquipLEITURA.AsFloat    := CMWeb.CDCadAbastecimentosCONTADORATUAL.AsFloat + CMWeb.CDCadManutProgEquipFREQUENCIA2.AsInteger;
                    CMWeb.CDCadManutProgEquip.Post;
                  end;

                CMWeb.CDCadManutProgEquip.ApplyUpdates(0);

                CMWeb.CDCadManutProgEquip.Close;
                CMWeb.CDCadManutProgEquipItens.Close;
                CMWeb.CDCadManutProgEquipItensEsp.Close;

                CMWeb.CDCadAbastecimentosManutInsp.Next;
              end;


            CMWeb.CDCadAbastecimentosLubrificInsp.Close;
            CMWeb.CDCadAbastecimentosLubrificInsp.Params[0].AsString := CMWeb.FCodEmpresa;
            CMWeb.CDCadAbastecimentosLubrificInsp.Params[1].AsString := CMWeb.CDCadAbastecimentosCODEQUIPAMENTO.AsString;
            CMWeb.CDCadAbastecimentosLubrificInsp.Params[2].AsString := CMWeb.CDCadAbastecimentosCODPROGRAMACAO.AsString;
            CMWeb.CDCadAbastecimentosLubrificInsp.Params[3].AsString := CMWeb.CDCadAbastecimentosCONTADORATUAL.AsString;
            CMWeb.CDCadAbastecimentosLubrificInsp.Open;
            CMWeb.CDCadAbastecimentosLubrificInsp.First;
            while not CMWeb.CDCadAbastecimentosLubrificInsp.Eof = True do
              begin
                CMWeb.CDCadLubrificProgEquip.Close;
                CMWeb.CDCadLubrificProgEquip.Params[0].AsString := CMWeb.CDCadAbastecimentosLubrificInspCODIGO.AsString;
                CMWeb.CDCadLubrificProgEquip.Params[1].AsString := CMWeb.FCodEmpresa;
                CMWeb.CDCadLubrificProgEquip.Params[2].AsString := CMWeb.CDCadAbastecimentosCODEQUIPAMENTO.AsString;
                CMWeb.CDCadLubrificProgEquip.Open;

                CMWeb.FCodOrdemServico := CMWeb.SMClient.GerarOS(CMWeb.FCodUsuario, CMWeb.FCodEmpresa, CMWeb.CDCadLubrificProgEquipDESCRICAO.AsString
                                                              , CMWeb.CDCadLubrificProgEquipEQUIPAMENTO.AsString, CMWeb.CDCadLubrificProgEquipCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                              , EmptyStr, 'Emergência', 'Para o Equipamento');

                if CMWeb.CDCadLubrificProgEquip.IsEmpty = False then
                  CMWeb.SMClient.HistoricoInspecoes(1, CMWeb.FCodEmpresa, CMWeb.CDCadLubrificProgEquipCODEQUIPAMENTO.AsString, CMWeb.CDCadLubrificProgEquipCODIGO.AsString, CMWeb.FCodOrdemServico);

                DmRelatorios.frxRLubrificProgEquipIndividual.ShowReport();

                //Sendo a inspeção reprogramada pela 'programação', programa a próxima inspeção independente se a Lubrificenção foi fechada ou não.
                if CMWeb.CDCadLubrificProgEquipREPROGRAMAR2.AsString = 'Programação' then
                  begin
                    CMWeb.CDCadLubrificProgEquip.Edit;
                    CMWeb.CDCadLubrificProgEquipRELATORIO.AsString    := 'N';
                    CMWeb.CDCadLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(CMWeb.FDataHoraServidor), CMWeb.CDCadLubrificProgEquipFREQUENCIA1.AsInteger);
                    CMWeb.CDCadLubrificProgEquipLEITURA.AsFloat       := CMWeb.CDCadAbastecimentosCONTADORATUAL.AsFloat + CMWeb.CDCadLubrificProgEquipFREQUENCIA2.AsFloat;
                    CMWeb.CDCadLubrificProgEquip.Post;
                  end;

                //Sendo a inspeção reprogramada pela execução, definir como Lubrificenção em aberto até ser efetuado o fechamento, portanto não permitindo
                //a geração de outra Lubrificação mesmo que o período vença novamente. Define a coluna 'RELATORIO = S' para impedir a geração de outra Lubrificação até ser fechada.
                if CMWeb.CDCadLubrificProgEquipREPROGRAMAR1.AsString = 'Execução' then
                  begin
                    CMWeb.CDCadLubrificProgEquip.Edit;
                    CMWeb.CDCadLubrificProgEquipRELATORIO.AsString := 'S';
                    CMWeb.CDCadLubrificProgEquipLEITURA.AsFloat    := CMWeb.CDCadAbastecimentosCONTADORATUAL.AsFloat + CMWeb.CDCadLubrificProgEquipFREQUENCIA2.AsInteger;
                    CMWeb.CDCadLubrificProgEquip.Post;
                  end;

                CMWeb.CDCadLubrificProgEquip.ApplyUpdates(0);

                CMWeb.CDCadLubrificProgEquip.Close;
                CMWeb.CDCadLubrificProgEquipItens.Close;
                CMWeb.CDCadLubrificProgEquipItensEsp.Close;

                CMWeb.CDCadAbastecimentosLubrificInsp.Next;
              end;
            //----------------------------------------------------------------------------------------------------------------
            if Indice = 1 then
              Application.MessageBox('Dados importados com sucesso!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
          end;
      end;
  end;
if (Indice = 0) or (Indice = 2) then
  begin
    CMWeb.CDCadPneusChassi.Close;
    CMWeb.CDCadPneusChassi.Params[0].AsString := CodEquipamento;
    CMWeb.CDCadPneusChassi.Params[1].AsString := CMWeb.FCodEmpresa;
    CMWeb.CDCadPneusChassi.Open;
    if CMWeb.CDCadPneusChassi.IsEmpty = False then
      begin
        if DataImportacao <= CMWeb.CDCadPneusChassiDATACONTADORATUAL.AsDateTime then
          begin
            Application.MessageBox('Arquivo já importado!', 'SPMP3', MB_ICONSTOP + MB_OK);
            Abort;
          end;
        if Placa <> CMWeb.CDCadPneusChassiPLACA.AsString then
          begin
            Application.MessageBox('Equipamento incorreto!', 'SPMP3', MB_ICONWARNING + MB_OK);
            Abort;
          end;

        if Rodagem > 0 then
          begin
            CMWeb.CDCadPneusChassi.Edit;
            CMWeb.CDCadPneusChassiDATACONTADORATUAL.AsDateTime := DataImportacao;
            CMWeb.CDCadPneusChassiCONTADOR.AsFloat             := CMWeb.CDCadPneusChassiCONTADOR.AsFloat + Rodagem;
            CMWeb.CDCadPneusChassi.ApplyUpdates(0);
            //CMWeb.CDCadPneusChassi.Refresh;

            //AtualizarRodagemPneus
            CMWeb.CDCadPneusChassiPosicoes.Close;
            CMWeb.CDCadPneusChassiPosicoes.Params[0].AsString := CMWeb.FCodEmpresa;
            CMWeb.CDCadPneusChassiPosicoes.Params[1].AsString := CMWeb.CDCadPneusChassiCODIGO.AsString;
            CMWeb.CDCadPneusChassiPosicoes.Open;
            CMWeb.CDCadPneusChassiPosicoes.First;
            CMWeb.CDCadPneusChassiPneus.Close;
            CMWeb.CDCadPneusChassiPneus.Params[0].AsString := CMWeb.FCodEmpresa;
            CMWeb.CDCadPneusChassiPneus.Open;
            for I := 0 to CMWeb.CDCadPneusChassiPosicoes.RecordCount -1 do
              begin
                if (CMWeb.CDCadPneusChassiPneus.Locate('ID', CMWeb.CDCadPneusChassiPosicoesID.AsInteger, []) = True) then
                  if (CMWeb.CDCadPneusChassiPneusCONTADOR.AsFloat < CMWeb.CDCadPneusChassiCONTADOR.AsFloat) then
                    begin
                      CMWeb.CDCadPneusChassiPneus.Edit;
                      CMWeb.CDCadPneusChassiPneusRODADOS.AsInteger  := CMWeb.CDCadPneusChassiPneusRODADOS.AsInteger + (CMWeb.CDCadPneusChassiCONTADOR.AsInteger - CMWeb.CDCadPneusChassiPneusCONTADOR.AsInteger);
                      CMWeb.CDCadPneusChassiPneusCONTADOR.AsInteger := CMWeb.CDCadPneusChassiCONTADOR.AsInteger;
                      CMWeb.CDCadPneusChassiPneus.Post;
                    end;
                CMWeb.CDCadPneusChassiPosicoes.Next;
              end;
            CMWeb.CDCadPneusChassiPneus.Edit;
            CMWeb.CDCadPneusChassiPneus.ApplyUpdates(0);
            //CMWeb.CDCadPneusChassiPneus.Refresh;

            Application.MessageBox('Dados importados com sucesso!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
          end;
      end;
  end;
end;

function TCMWeb.VerificaDuplo(Valor: String): Boolean;
begin
Result := False;
CMWeb.CDAuxiliar.Close;
CMWeb.CDAuxiliar.Filtered := False;
if CMWeb.FTabela_auxiliar < 0 then Exit;

Try
  case CMWeb.FTabela_auxiliar of
    1://Unidades
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, nome from empresa where `CODIGO` = '+ QuotedStr(Valor)+' and codgrupo = '+QuotedStr(CMWeb.CDCadGruposCODIGO.AsString) + EmptyStr;
      end;
    2, 222://Adm. Corporativo
      begin
        case CMWeb.FTabela_auxiliar of
          2:CMWeb.CDAuxiliar.CommandText := 'select codigo, nome from usuario where `CODIGO` = '+ QuotedStr(Valor)+' and codnivelacesso = ''ADC-00001'' OR codnivelacesso = ''USC-00001''';
        222:CMWeb.CDAuxiliar.CommandText := 'select codigo, nome from usuario where `NOME` LIKE '+ QuotedStr(Valor)+' and codnivelacesso = ''ADC-00001'' OR codnivelacesso = ''USC-00001''';
        end;
      end;
    3, 333://Adm. Unidade
      begin
        case CMWeb.FTabela_auxiliar of
          3:CMWeb.CDAuxiliar.CommandText := 'select codigo, nome from usuario where `CODIGO` = '+ QuotedStr(Valor)+' and codnivelacesso = ''ADU-00001'' and codempresa = '+QuotedStr(CMWeb.FParamAuxiliar[0]);
        333:CMWeb.CDAuxiliar.CommandText := 'select codigo, nome from usuario where `NOME` LIKE '+ QuotedStr(Valor)+' and codnivelacesso = ''ADU-00001'' and codempresa = '+QuotedStr(CMWeb.FParamAuxiliar[0]);
        end;
      end;
    4://Centro de Custo
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from spmpma_spmp.centrocusto where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    5://Classes
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from spmpma_spmp.classes where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    6://Famílias de Equipamentos
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiaequipamento where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    7://Famílias de Peças
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiapecasreposicao where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    8://Famílias de Recursos
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiarecursos where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    9://Causas de Falhas
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from causasfalha where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    10://Tipos de Manutenção
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, tipomanutencao from tipomanutencao where `CODIGO` = ' + QuotedStr(Valor) + EmptyStr;
      end;
    11://Motivos de Parada
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from motivoparada where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    12://Tipos de Programação
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, tipo from tipoprogramacao where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    13://Cargos
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from cargos where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr;
      end;
    14://Almoxarifados
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `almoxarifado`.`CODIGO`, `almoxarifado`.`DESCRICAO`, `almoxarifado`.`MATERIAL`, `almoxarifado`.`NUMITENS`, `almoxarifado`.`AREA`, `centrocusto`.`DESCRICAO`CENTROCUSTO';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' FROM `almoxarifado` INNER JOIN `centrocusto` ON (`almoxarifado`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `almoxarifado`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `almoxarifado`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + EmptyStr;
      end;
    15://Áreas
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from areas where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    16://Células
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from celulas where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    17://Linhas
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from linhas where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    18://Sequências
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from sequencias where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa) + ' and codarea = ' + QuotedStr(CMWeb.FParamAuxiliar[1]) + ' and codcelula = ' + QuotedStr(CMWeb.FParamAuxiliar[2]) + ' and codlinha = ' + QuotedStr(CMWeb.FParamAuxiliar[3]);
      end;
    19://Feriados
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, dataferiado from feriados where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    20://Oficinas
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `oficinas`.`CODIGO`, `oficinas`.`DESCRICAO`, `centrocusto`.`DESCRICAO` AS CENTROCUSTO FROM `oficinas` INNER JOIN `centrocusto`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' ON (`oficinas`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `oficinas`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `oficinas`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    21://Fornecedores
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from fornecedor where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    22://Fabricantes
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from fabricante where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    23://Calendário de Mão de Obra
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from calendario where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    24://Calendário de Equipamentos
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from calendarioequip where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    25://Equipamentos
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP FROM `equipamentos`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`equipamentos`.`CODIGO` = '+ QuotedStr(Valor) +' AND `equipamentos`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ')'
      end;
    27://Disponibilidade
      begin
        CMWeb.CDAuxiliar.CommandText := 'select coditem, codigo, tipoitem from disponibilidade where `CODITEM` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    29, 2900://Usuários
      begin
        case CMWeb.FTabela_auxiliar of
          29:
            begin
              CMWeb.CDAuxiliar.CommandText := 'SELECT `usuario`.`CODIGO`, `usuario`.`NOME`, `nivelacesso`.`DESCRICAO`NIVELACESSO FROM `usuario`';
              CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' INNER JOIN `nivelacesso` ON (`usuario`.`CODNIVELACESSO` = `nivelacesso`.`CODIGO`) WHERE (`usuario`.`CODIGO` = ' + QuotedStr(Valor) + ' AND `usuario`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ' and `usuario`.`CODNIVELACESSO` <> ''ADC-00001'' and `usuario`.`CODNIVELACESSO` <> ''ADU-00001'')'
            end;
        2900:
          begin
              CMWeb.CDAuxiliar.CommandText := 'SELECT `usuario`.`CODIGO`, `usuario`.`NOME`, `nivelacesso`.`DESCRICAO`NIVELACESSO FROM `usuario`';
              CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' INNER JOIN `nivelacesso` ON (`usuario`.`CODNIVELACESSO` = `nivelacesso`.`CODIGO`) WHERE (`usuario`.`NOME` LIKE ' + QuotedStr(Valor) + ' AND `usuario`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ' and `usuario`.`CODNIVELACESSO` <> ''ADC-00001'' and `usuario`.`CODNIVELACESSO` <> ''ADU-00001'')'
          end;
        end;
      end;
    30://Funcionários
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO` FROM funcionarios INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.`MATRICULA` = '+ QuotedStr(Valor) + ' AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ')';
      end;
    32://Manutenções Programadas do Equipamento
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `manutprogequipamento`.`CODIGO`, `manutprogequipamento`.`DESCRICAO`, `manutprogequipamento`.`FREQUENCIA1`, `manutprogequipamento`.`FREQUENCIA2`, `manutprogfamequipamento`.`DESCRICAO` DESCMANUTPROGFAMEQUIP,';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' `equipamentos`.`DESCRICAO` EQUIPAMENTO FROM `manutprogequipamento` INNER JOIN `manutprogfamequipamento` ON (`manutprogequipamento`.`CODMANUTPROGFAMEQUIP` = `manutprogfamequipamento`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' = `manutprogfamequipamento`.`CODEMPRESA`) INNER JOIN `equipamentos` ON (`manutprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE (`manutprogequipamento`.`CODIGO`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' = '+ QuotedStr(Valor) + ' AND `manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa)+')';
      end;
    33://Lubrificações Programadas do Equipamento
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`FREQUENCIA2`, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP,';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' `equipamentos`.`DESCRICAO` EQUIPAMENTO FROM `lubrificprogequipamento` INNER JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' = `lubrificprogfamequipamento`.`CODEMPRESA`) INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' (`lubrificprogequipamento`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa)+')';
      end;
    34://Manutenção de Família de Equipamento
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `manutprogfamequipamento`.`CODIGO`, `manutprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO` FROM `manutprogfamequipamento` INNER JOIN `familiaequipamento`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' ON (`manutprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`manutprogfamequipamento`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `manutprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ')';
      end;
    35://Lubrificação de Família de Equipamento
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `lubrificprogfamequipamento`.`CODIGO`, `lubrificprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO` FROM `lubrificprogfamequipamento` INNER JOIN `familiaequipamento`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' ON (`lubrificprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`lubrificprogfamequipamento`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `lubrificprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ')';
      end;
    36, 360://Peças de Reposição
      begin
        if CMWeb.FParamAuxiliar[1] = 'CODIGO' then
          CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, referencia, quantidade Qtde from pecasreposicao where `CODIGO` = ' + QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
        if CMWeb.FParamAuxiliar[1] = 'REFERENCIA' then
          CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, referencia, quantidade Qtde from pecasreposicao where `REFERENCIA` = ' + QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
        if CMWeb.FParamAuxiliar[1] = 'DESCRICAO' then
          CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, referencia, quantidade Qtde from pecasreposicao where `DESCRICAO` = ' + QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    39://Contadores
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `contadores`.`CODIGO`, `contadores`.`DESCRICAO`, `contadores`.`CODPROGRAMACAO`, `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO` FROM `contadores`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' LEFT JOIN `tipoprogramacao` ON (`contadores`.`CODPROGRAMACAO` = `tipoprogramacao`.`CODIGO`) where `contadores`.`codigo` = ' + QuotedStr(Valor) + ' and `contadores`.`codempresa` = '+QuotedStr(CMWeb.FCodEmpresa) + ' order by `contadores`.`descricao`';
      end;
    40://Solicitação de Trabalho
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT s.CODIGO, s.DESCSERVICO, e.DESCRICAO FROM solictrabalho s INNER JOIN equipamentos e ON (s.CODEQUIPAMENTO = e.CODIGO) AND (s.CODEMPRESA = e.CODEMPRESA) where s.DESCSERVICO like ' + QuotedStr(Valor) + ' and s.codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    41://Plano de Trabalho
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, detalhes from planotrabalho where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    46, 460://Recursos
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao, quantidade from recursos where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    47://Pontos de Inspeção
      begin
        CMWeb.CDAuxiliar.CommandText := 'select p.`CODIGO`, p.`DESCRICAO`, f.`DESCRICAO` AS `FAMILIAEQUIP` FROM `pontosinspecao` p INNER JOIN familiaequipamento f ON (p.`CODFAMILIAEQUIP` = f.`CODIGO`) WHERE p.`CODIGO` = '+ QuotedStr(Valor) + ' and p.codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    48://Contadores
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from contadores where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    50://Kit de Recursos
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from recursoskit where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    61://Ferramentaria
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from ferramentaria where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    62://Kit de Peças
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from pecasreposicaokit where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    64://Lubrificantes
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from lubrificantes where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
    6700://Tarefas de Ordens de Serviços Terceirizadas
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `DESCRICAO` FROM `ordemservicotercunidtarefas` WHERE (`DESCRICAO` =  '+ QuotedStr(Valor) + '  AND `CODEMPRESA` = '+ QuotedStr(CMWeb.FCodEmpresa)+' AND `CODORDEMSERVICO` = '+QuotedStr(CMWeb.CDCadOrdemServicoTercUnidTarefasCODORDEMSERVICO.AsString)+')';
      end;
    68://Literturas Técnicas
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from arquivotecnico where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
      end;
  //  69://Desenhos Técnicos
  //    begin
  //      CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from arquivotecnico where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa);
  //    end;
    78://Abastecimentos
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `controlecombustivel`.`CODIGO`, `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `EQUIPAMENTO` FROM `controlecombustivel`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' INNER JOIN `equipamentos` ON (`controlecombustivel`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' WHERE (`equipamentos`.`CODIGO` = ' + QuotedStr(Valor) + ' AND `controlecombustivel`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ')';
      end;
    80://Família de Pneus
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `CODIGO`, `DESCRICAO` FROM `familiapneus` WHERE `CODIGO` = ' + QuotedStr(Valor) + EmptyStr;
      end;
    82://Montagem de Chassi
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `pneusmontagemchassi`.`CODIGO`, `pneusmontagemchassi`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `EQUIPAMENTO`, `pneusmontagemchassi`.`CHASSI` FROM `pneusmontagemchassi` INNER JOIN `equipamentos` ON (`pneusmontagemchassi`.`CODEQUIPAMENTO`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' = `equipamentos`.`CODIGO`) AND (`pneusmontagemchassi`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE (`equipamentos`.`CODIGO` = ' + QuotedStr(Valor) + ' AND `pneusmontagemchassi`.`CODEMPRESA` = '+QuotedStr(CMWeb.FCodEmpresa) + ')';
      end;
    83://Pneus
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `pneus`.`CODIGO`, `pneus`.`DESCRICAO`, `familiapneus`.`DESCRICAO` AS `FAMILIA` FROM `pneus` INNER JOIN `familiapneus`';
        CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' ON (`pneus`.`CODFAMILIAPNEU` = `familiapneus`.`CODIGO`) WHERE (`pneus`.`CODIGO` = ' + QuotedStr(Valor) + ' AND `pneus`.`CODEMPRESA` = ' + QuotedStr(CMWeb.FCodEmpresa) + ')';
      end;
    84://Rotas
      begin
        CMWeb.CDAuxiliar.CommandText := 'SELECT `CODIGO`, `DESCRICAO` FROM `rotasequipamento` WHERE `CODIGO` = ' + QuotedStr(Valor);
      end;
    86, 866://Monitoramento
      begin
        if CMWeb.FTabela_auxiliar = 86 then
          begin
            CMWeb.CDAuxiliar.CommandText := 'SELECT `monitoramento`.`CODIGO`, `monitoramento`.`DESCRICAO`, `contadores`.`DESCRICAO` AS `CONTADOR` FROM `monitoramento` INNER JOIN `contadores` ON (`monitoramento`.`CODEMPRESA` = `contadores`.`CODEMPRESA`)';
            CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' AND (`monitoramento`.`CODCONTADOR` = `contadores`.`CODIGO`) WHERE (`monitoramento`.`CODCONTADOR` = ' + QuotedStr(Valor) + ' AND `monitoramento`.`CODEMPRESA` = ' + QuotedStr(CMWeb.FCodEmpresa) + ')';
          end
        else
          begin
            CMWeb.CDAuxiliar.CommandText := 'SELECT `monitoramento`.`CODIGO`, `monitoramento`.`DESCRICAO`, `monitoramento`.`CODEMPRESA`, `pontosinspecao`.`DESCRICAO` AS `PONTO`, `pontosinspecaoloc`.`DESCRICAO` AS `LOCAL` FROM `monitoramento`';
            CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' INNER JOIN `pontosinspecao` ON (`monitoramento`.`CODEMPRESA` = `pontosinspecao`.`CODEMPRESA`) AND (`monitoramento`.`CODPONTOINSPECAO` = `pontosinspecao`.`CODIGO`)';
            CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' INNER JOIN `pontosinspecaoloc` ON (`monitoramento`.`CODPONTOINSPLOC` = `pontosinspecaoloc`.`CODIGO`) AND (`pontosinspecaoloc`.`CODPONTOINSP` = `pontosinspecao`.`CODIGO`) AND (`pontosinspecaoloc`.`CODEMPRESA` = `pontosinspecao`.`CODEMPRESA`)';
            CMWeb.CDAuxiliar.CommandText := CMWeb.CDAuxiliar.CommandText + ' WHERE (`monitoramento`.`CODCONTADOR` = ' + QuotedStr(Valor) + ' AND `monitoramento`.`CODEMPRESA` = ' + QuotedStr(CMWeb.FCodEmpresa) + ' AND `pontosinspecaoloc`.`CODIGO` = ' + QuotedStr(CMWeb.CDCadMonitoramentoCODPONTOINSPLOC.AsString) + ')';
          end;
      end;
    90://Locais de Pontos de Inspeção
      begin
        CMWeb.CDAuxiliar.CommandText := 'select codigo, descricao from pontosinspecaoloc where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(CMWeb.FCodEmpresa) + ' and codpontoinsp = '+ QuotedStr(CMWeb.FParamAuxiliar[1]);
      end;
  end;
except on E: Exception do
  begin
    //MessageDlg('Houve um problema ao conectar o banco: '+E.Message, mtError, [mbOK], 0);
    //Application.Terminate;
  end;
End;
CMWeb.CDAuxiliar.Open;
if CMWeb.CDAuxiliar.IsEmpty = False then
  Result := True;
end;

function TCMWeb.VerificaPrimeiroAcesso:Boolean;
var
  LSenhaAtual, LNovaSenha, LNovaSenhaConfirmacao : String;
begin
Result := False;

if CMWeb.FNomeUsuario <> LowerCase('sam_spmp') then
  begin
    if (Trim(CDUsuariosENHAALTERADA.AsString) <> 'S') then
      begin
        if Application.MessageBox('O sistema detectou que sua senha ainda não foi alterada desde o seu cadastro.'+#13+#13+'É necessário fazê-lo agora, deseja prosseguir ?','SPMP', MB_YESNO + MB_ICONQUESTION)=IDYes then
          begin
            LSenhaAtual := PasswordInputBox('Senha temporária atual','Digite sua senha:');

            // Verificar senha informada.
            if (LSenhaAtual = EmptyStr) or (LSenhaAtual <> SMClient.Crypt('D', CDUsuarioSENHA.AsString)) then
              begin
                MessageDlg('Senha temporária incorreta!', mtWarning, [mbOK], 0);
              end
            else
              begin // SenhaAtual foi informada corretamente.
                if LSenhaAtual = SMClient.Crypt('D', CDUsuarioSENHA.AsString) then
                  begin
                    LNovaSenha := PasswordInputBox('Nova Senha','Digite sua nova senha.');
                    if Length(LNovaSenha) < 6 then
                      begin
                        Application.MessageBox('A senha deve conter pelo menos 6 caracteres!', 'SPMP3', MB_OK+MB_ICONSTOP);
                        CMWeb.MSGAguarde('', False);
                      end
                    else
                      begin
                        LNovaSenhaConfirmacao := PasswordInputBox('Confirme Nova Senha','Confirme sua nova senha.');
                        if LNovaSenha <>  LNovaSenhaConfirmacao then
                          begin
                            Application.MessageBox('Senhas informadas são diferentes!', 'SPMP3', MB_OK+MB_ICONSTOP);
                            CMWeb.MSGAguarde('', False);
                          end
                        else
                        if (LNovaSenha <> EmptyStr) and (LNovaSenhaConfirmacao <> EmptyStr) and (LNovaSenha = LNovaSenhaConfirmacao) then
                          begin
                            CDUsuario.Edit;
                            CDUsuarioSENHA.AsString         := SMClient.Crypt('C', LNovaSenha);
                            CDUsuarioSENHAALTERADA.AsString := 'S';
                            CDUsuarioBLOQUEIO.AsInteger     := 0;

                            CDUsuario.Post();
                            CDUsuario.ApplyUpdates(0);
                            Result := True;
                          end;
                      end;
                  end;
              end;
          end;
      end
    else
      Result := True;
  end;
end;

function TCMWeb.PasswordInputBox(const ACaption, APrompt:string): string;
var
Form: TForm;
Prompt: TLabel;
Edit: TEdit;
DialogUnits: TPoint;
ButtonTop, ButtonWidth, ButtonHeight: Integer;
Value: string;
I: Integer;
Buffer: array[0..51] of Char;
begin
  Result := EmptyStr;
  Form := TForm.Create(Application);
  with Form do
    Try
      Canvas.Font := Font;
      For I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
      For I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
      DialogUnits.X := DialogUnits.X div 52;
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(183, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
        begin
         Parent := Form;
         AutoSize := True;
         Left := MulDiv(8, DialogUnits.X, 4);
         Top := MulDiv(8, DialogUnits.Y, 8);
         Caption := APrompt;
        end;
      Edit := TEdit.Create(Form);
      with Edit do
        begin
         Parent := Form;
         Left := Prompt.Left;
         Top := MulDiv(19, DialogUnits.Y, 8);
         Width := MulDiv(164, DialogUnits.X, 4);
         MaxLength := 30;
         PasswordChar := '*';
         SelectAll;
        end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
        begin
         Parent := Form;
         Caption := 'OK';
         ModalResult := mrOk;
         Default := True;
         SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      with TButton.Create(Form) do
        begin
         Parent := Form;
         Caption := 'Cancel';
         ModalResult := mrCancel;
         Cancel := True;
         SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      if ShowModal = mrOk then
        begin
         Value := Edit.Text;
         Result := Value;
        end;
    Finally
      FreeAndNil(Form);
    End;
end;

function TCMWeb.RetornaPrimeiroDia(Data: TDateTime): TDateTime;
begin
Result := StrToDateTime('01/'+ Copy(FormatDateTime('dd/mm/yyyy', Data), 4, 7))
end;

function TCMWeb.TotalHomemHoraDisp(Data: TDateTime; Matricula: String): Real;
var
LTotal: Real;
I, LQtdDias, LSequencia : Integer;
LDataClicada : TDateTime;
begin
LDataClicada := Data;
LTotal       := 0;

if Matricula <> EmptyStr then
  begin
    CDCadTotalHomemHora.Filter   := 'MATRICULA = ' + QuotedStr(Matricula);
    CDCadTotalHomemHora.Filtered := True;
  end;


for I := 1 to CDCadTotalHomemHora.RecordCount do
  begin
    LSequencia := 0;

    if LDataClicada > 0 then
      begin
        CDCadTotalHomemHoraSeqHora.First;
        while not CDCadTotalHomemHoraSeqHora.Eof do
          begin
            LSequencia := LSequencia + 1;
            CDCadTotalHomemHoraSeqHora.Next;
          end;
        LQtdDias   := DaysBetween(0, LDataClicada);

        if LSequencia > 0 then
           begin
            LQtdDias := LQtdDias mod LSequencia;
            if (LQtdDias = 0) then LQtdDias := StrToInt(CDCadTotalHomemHoraSeqHoraSEQUENCIA.AsString);
           end;

        CDCadTotalHomemHoraSeqHora.Locate('SEQUENCIA', LQtdDias,[LopartiALKey,LocaseInsensitive]);
      end;

    LTotal := LTotal + ((CDCadTotalHomemHoraSeqHoraHHDISP1.AsFloat/60) + (CDCadTotalHomemHoraSeqHoraHHDISP2.AsFloat/60) + (CDCadTotalHomemHoraSeqHoraHHDISP3.AsFloat/60) + (CDCadTotalHomemHoraSeqHoraHHDISP4.AsFloat/60));

    CDCadTotalHomemHora.Next;
  end;

Result := LTotal;

if Matricula <> EmptyStr then
  begin
    CDCadTotalHomemHora.Filter   := EmptyStr;
    CDCadTotalHomemHora.Filtered := False;
  end;
end;

function TCMWeb.TotalEquipHoraDisp(Data: TDateTime): Real;
var
LTotal: Real;
LQtdDias, LSequencia : Integer;
LDataClicada : TDateTime;
begin
LDataClicada := Data;
LTotal       := 0;

while not CDCadTotalEquipHora.Eof = True do
  begin
    LSequencia := 0;

    if LDataClicada > 0 then
      begin
        CDCadTotalEquipSeqHora.First;
        while not CDCadTotalEquipSeqHora.Eof do
          begin
            LSequencia := LSequencia + 1;
            CDCadTotalEquipSeqHora.Next;
          end;
        LQtdDias   := DaysBetween(0, LDataClicada);

        if LSequencia > 0 then
           begin
            LQtdDias := LQtdDias mod LSequencia;
            if (LQtdDias = 0) then LQtdDias := StrToInt(CDCadTotalEquipSeqHoraSEQUENCIA.AsString);
           end;

        CDCadTotalEquipSeqHora.Locate('SEQUENCIA', LQtdDias,[LopartiALKey,LocaseInsensitive]);
      end;

    LTotal := LTotal + Round((CDCadTotalEquipSeqHoraHHDISP1.AsFloat/60) + (CDCadTotalEquipSeqHoraHHDISP2.AsFloat/60) + (CDCadTotalEquipSeqHoraHHDISP3.AsFloat/60) + (CDCadTotalEquipSeqHoraHHDISP4.AsFloat/60));

    CDCadTotalEquipHora.Next;
  end;

CDCadTotalEquipHora.First;

Result := LTotal;
end;

function TCMWeb.ListaProcesso:Boolean;
var
  ProcEntry: TProcessEntry32;
  Hnd: THandle;
  Fnd: Boolean;
  Count : SmallInt;
begin
Result := False;
Count  := 0;
  Hnd := CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);
  //if Hnd <> -1 then
  begin
    ProcEntry.dwSize := SizeOf(TProcessEntry32);
    Fnd := Process32First(Hnd, ProcEntry);
    while Fnd do
      begin
        if ProcEntry.szExeFile= 'SPMP3.exe' then
          begin
            Count := Count + 1;
          end;
        Fnd := Process32Next(Hnd, ProcEntry);
      end;
    if Count > 1 then
      Result := True;

    CloseHandle(Hnd);
  end;
end;

function TCMWeb.LicencaExpirada: Boolean;
var
LChave, LNomeEmpresa, LUsuarios, c : String;
I, LDiasRestantes, LNovoCodigo : Integer;
LTexto : PChar;
begin
Result := True;
//Verificar licença da Unidade
CMWeb.CDSAM.Open;
CMWeb.FNomeEmpresa := CDSAMEMPRESA.AsString;
LDiasRestantes := 0;

if CMWeb.CDSAM.IsEmpty = True then
  begin
    LChave := CampoInputBox('SPMP', 'Informe a chave fornecida pela SAM:');
    if LChave = EmptyStr then
      begin
        Application.Terminate;
      end
    else
      begin
        //UnFuncoesSPMP.FSenhaSystem := LChave;
        LChave := SMClient.Crypt('D', LChave);

        I := 1;
        c := Copy(LChave, 1, 1);
        while c <> '|' do
          begin
            LNomeEmpresa := LNomeEmpresa + c;
            I := I + 1;
            c := Copy(LChave, I, 1);
          end;
        c := Copy(LChave, I + 1, 1);
        //I := 1;
        while c <> '|' do
          begin
            LUsuarios := LUsuarios + c;
            I := I + 1;
            c := Copy(LChave, I + 1, 1);
          end;

        FLicenca     := Copy(LChave, I + 2, Length(LChave));
        CMWeb.FNumUsuarios := StrToInt(LUsuarios);

        FInstalacao := CMWeb.FDataHoraServidor;

        if (FLicenca <> 'TRIAL') and (FLicenca <> '3 MESES') and (FLicenca <> '6 MESES') and (FLicenca <> '1 ANO')
          and (FLicenca <> '2 ANOS') and (FLicenca <> '3 ANOS') and (FLicenca <> '4 ANOS')
            and (FLicenca <> '5 ANOS') and (FLicenca <> 'ILIMITADA') then
              begin
                Application.MessageBox('Chave Inválida!!!', 'SPMP3', MB_OK + MB_ICONERROR);
                Application.Terminate;
              end;


        LNovoCodigo := CDSAMCODIGO.AsInteger + 1;
        CDSAM.Append;
        CDSAMCODIGO.AsInteger    := LNovoCodigo;
        CDSAMCHAVE.AsString      := SMClient.Crypt('C', LChave);
        CDSAMINSTALACAO.AsDateTime := CMWeb.FDataHoraServidor;
        CDSAMEMPRESA.AsString    := LNomeEmpresa;
        CDSAMUSUARIOS.AsString   := LUsuarios;
        CDSAM.ApplyUpdates(0);

        CMWeb.FInstalacao  := CDSAMINSTALACAO.AsDateTime;

        Result := False;
      end;
  end
else
  begin
    LChave          := SMClient.Crypt('D', CDSAMCHAVE.AsString);
    CMWeb.FInstalacao  := CDSAMINSTALACAO.AsDateTime;

    LNomeEmpresa := EmptyStr;
    I := 1;
    c := Copy(LChave, 1, 1);
    while c <> '|' do
      begin
        LNomeEmpresa := LNomeEmpresa + c;
        I := I + 1;
        c := Copy(LChave, I, 1);
      end;
    c := Copy(LChave, I + 1, 1);
    //I := 1;
    while c <> '|' do
      begin
        LUsuarios := LUsuarios + c;
        I := I + 1;
        c := Copy(LChave, I + 1, 1);
      end;

    FLicenca     := Copy(LChave, I + 2, Length(LChave));
    CMWeb.FNumUsuarios := StrToInt(LUsuarios);

    if FLicenca = 'TRIAL'     then LDiasRestantes := 7    - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = '3 MESES'   then LDiasRestantes := 90   - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = '6 MESES'   then LDiasRestantes := 180  - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = '1 ANO'     then LDiasRestantes := 365  - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = '2 ANOS'    then LDiasRestantes := 730  - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = '3 ANOS'    then LDiasRestantes := 1095 - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = '4 ANOS'    then LDiasRestantes := 7    - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = '5 ANOS'    then LDiasRestantes := 1460 - DaysBetween(CMWeb.FDataHoraServidor, CDSAMINSTALACAO.AsDateTime) else
    if FLicenca = 'ILIMITADA' then LDiasRestantes := 36500;

    if (LDiasRestantes > 0) and (LDiasRestantes <= 30) then
      begin
        LTexto := PChar('Período de acesso se encerra em '+FormatFloat('00', LDiasRestantes)+' dias!'+#13+'Caso ainda não possua, entre em contato com o fornecedor do software para informar nova chave de acesso.'+#13+'Deseja informar nova chave agora?');
        if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONWARNING)=IDYES then
          begin
            LChave := CampoInputBox('SPMP', 'Informe a chave fornecida pela SAM:');
            if LChave = EmptyStr then
              begin
                Application.Terminate;
              end
            else
              begin
                LChave       := SMClient.Crypt('D', LChave);
                LNomeEmpresa := EmptyStr;
                LUsuarios    := EmptyStr;
                I := 1;
                c := Copy(LChave, 1, 1);
                while c <> '|' do
                  begin
                    LNomeEmpresa := LNomeEmpresa + c;
                    I := I + 1;
                    c := Copy(LChave, I, 1);
                  end;
                c := Copy(LChave, I + 1, 1);
                //I := 1;
                while c <> '|' do
                  begin
                    LUsuarios := LUsuarios + c;
                    I := I + 1;
                    c := Copy(LChave, I + 1, 1);
                  end;
                FLicenca     := Copy(LChave, I + 2, Length(LChave));
                CMWeb.FInstalacao  := CMWeb.FDataHoraServidor;
                CMWeb.FNumUsuarios := StrToInt(LUsuarios);

                LNovoCodigo := CDSAMCODIGO.AsInteger + 1;
                CDSAM.Append;
                CDSAMCODIGO.AsInteger    := LNovoCodigo;
                CDSAMCHAVE.AsString      := SMClient.Crypt('C', LChave);
                CDSAMINSTALACAO.AsDateTime := CMWeb.FDataHoraServidor;
                CDSAMEMPRESA.AsString    := LNomeEmpresa;
                CDSAMUSUARIOS.AsString   := LUsuarios;
                CDSAM.ApplyUpdates(0);

                Result := False;
              end;
          end
        else
          Result := False;
      end
    else
    if LDiasRestantes <= 0 then
      begin
        if Application.MessageBox('Período de acesso encerrado, deseja informar a nova chave de acesso?', 'SPMP3', MB_YESNO + MB_ICONERROR) = IDYes then
          begin
            LChave := CampoInputBox('SPMP', 'Informe a chave fornecida pela SAM:');
            if LChave = EmptyStr then
              begin
                Application.Terminate;
              end
            else
              begin
                LChave       := SMClient.Crypt('D', LChave);
                LNomeEmpresa := EmptyStr;
                LUsuarios    := EmptyStr;
                I := 1;
                c := Copy(LChave, 1, 1);
                while c <> '|' do
                  begin
                    LNomeEmpresa := LNomeEmpresa + c;
                    I := I + 1;
                    c := Copy(LChave, I, 1);
                  end;
                c := Copy(LChave, I + 1, 1);
                //I := 1;
                while c <> '|' do
                  begin
                    LUsuarios := LUsuarios + c;
                    I := I + 1;
                    c := Copy(LChave, I + 1, 1);
                  end;
                CMWeb.FLicenca     := Copy(LChave, I + 2, Length(LChave));
                CMWeb.FInstalacao  := CMWeb.FDataHoraServidor;
                CMWeb.FNumUsuarios := StrToInt(LUsuarios);

                LNovoCodigo := CDSAMCODIGO.AsInteger + 1;
                CDSAM.Append;
                CDSAMCODIGO.AsInteger    := LNovoCodigo;
                CDSAMCHAVE.AsString      := SMClient.Crypt('C', LChave);
                CDSAMINSTALACAO.AsDateTime := CMWeb.FDataHoraServidor;
                CDSAMEMPRESA.AsString    := LNomeEmpresa;
                CDSAMUSUARIOS.AsString   := LUsuarios;
                CDSAM.ApplyUpdates(0);

                Result := False;
              end;
          end
        else
          begin
            Application.Terminate;
          end;
      end
    else
      Result := False;
  end;
CMWeb.CDSAM.Close;
end;

function TCMWeb.CampoInputBox(const ACaption, APrompt:string): string;
var
Form: TForm; Prompt: TLabel; Edit: TEdit; DialogUnits: TPoint;
ButtonTop, ButtonWidth, ButtonHeight: Integer; Value: string; I: Integer;
Buffer: array[0..51] of Char;
begin
  Result := EmptyStr;
  Form := TForm.Create(Application);
  with Form do
    Try
      Canvas.Font := Font;
      For I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
      For I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits)); DialogUnits.X := DialogUnits.X div 52;
      BorderStyle := bsDialog; Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4); ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter; Prompt := TLabel.Create(Form);
      with Prompt do
        begin
         Parent := Form; AutoSize := True; Left := MulDiv(8, DialogUnits.X, 4); Top := MulDiv(8, DialogUnits.Y, 8);
         Caption := APrompt;
        end;
      Edit := TEdit.Create(Form);
      with Edit do
        begin
         Parent := Form; Left := Prompt.Left; Top := MulDiv(19, DialogUnits.Y, 8); Width := MulDiv(164, DialogUnits.X, 4);
         //CharCase := ecUpperCase;
         //SelectAll;
        end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8); ButtonWidth := MulDiv(50, DialogUnits.X, 4); ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
        begin
         Parent := Form;
         Caption := 'OK';
         ModalResult := mrOk;
         Default := True;
         SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      with TButton.Create(Form) do
        begin
         Parent := Form;
         Caption := 'Cancel';
         ModalResult := mrCancel;
         Cancel := True;
         SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      if ShowModal = mrOk then
        begin
         if Edit.Text <> EmptyStr then
           begin
            Value := Edit.Text; Result := Value;
           end;
        end;
    Finally
      FreeAndNil(Form);
    End;
end;

procedure TCMWeb.CDCadAbastecimentosCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadAbastecimentos <> nil then
  begin
    CDCadAbastecimentosPERIODO.AsString := FrmTelaCadAbastecimentos.CBPeriodo.Text;
  end;
end;

procedure TCMWeb.CDCadAlertasAfterInsert(DataSet: TDataSet);
begin
CDCadAlertasCODIGO.AsInteger    := CMWeb.CDCadAlertas.RecordCount + 1;
CDCadAlertasCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadArquivoTecnicoParamAfterPost(DataSet: TDataSet);
begin
CDCadArquivoTecnicoParam.Edit;
if (CDCadArquivoTecnicoParamCODIGO.IsNull = True)  then
  begin
    //CDCadArquivoTecnicoParamCODIGO.AsInteger    := CMWeb.SMClient.GerarSequencia('ARQUIVOTECNICO_S');
    CDCadArquivoTecnicoParamCODEMPRESA.AsString := CMWeb.FCodEmpresa;
    CDCadArquivoTecnicoParamTIPO.AsString       := CMWeb.FParamAuxiliar[1];
  end;
end;

procedure TCMWeb.CDCadDespMensalFuncPerAfterScroll(DataSet: TDataSet);
begin
CMWeb.CDCadDespMensalFunc.Close;
CMWeb.CDCadDespMensalFunc.Params[0].AsInteger := CMWeb.CDCadDespMensalFuncPerCODIGO.AsInteger;
CMWeb.CDCadDespMensalFunc.Open;
end;

procedure TCMWeb.CDCadDespMensalTaxasAfterInsert(DataSet: TDataSet);
begin
CDCadDespMensalTaxasCODIGO.AsInteger    := CDCadDespMensalTaxas.RecordCount + 1;
CDCadDespMensalTaxasCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadDespMensalTaxasPerAfterScroll(DataSet: TDataSet);
begin
CMWeb.CDCadDespMensalTaxas.Close;
CMWeb.CDCadDespMensalTaxas.Params[0].AsInteger := CMWeb.CDCadDespMensalTaxasPerCODIGO.AsInteger;
CMWeb.CDCadDespMensalTaxas.Open;
end;

procedure TCMWeb.CDCadEquipamentoImagensAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadEquipamentosImagens <> nil then
  CMWeb.ExibeFoto(CMWeb.CDCadEquipamentoImagens, 'FOTO', FrmTelaCadEquipamentosImagens.ImgFotoEquip);
end;

procedure TCMWeb.CDCadEquipamentoTipoManutHistAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadEquipamentosHist <> nil then
  begin
    CMWeb.CDCadEquipamentoManutHist.Filter := '';
  end;
end;

procedure TCMWeb.CDCadFerramentariaAfterScroll(DataSet: TDataSet);
begin
CMWeb.CDCadFerramentariaItens.Close;
CMWeb.CDCadFerramentariaItens.Params[0].AsString := CMWeb.FCodEmpresa;
CMWeb.CDCadFerramentariaItens.Params[1].AsString := CMWeb.CDCadFerramentariaCODIGO.AsString;
CMWeb.CDCadFerramentariaItens.Open;
end;

procedure TCMWeb.CDCadFormatoCodigoAfterPost(DataSet: TDataSet);
begin
//CDCadFormatoCodigo.Edit;
//if (CDCadFormatoCodigoCODIGO.IsNull = True)  then
  //CDCadFormatoCodigoCODIGO.AsInteger := CMWeb.SMClient.GerarSequencia('FORMATOCODIGO_S');
end;

procedure TCMWeb.CDCadFuncionariosAusenciasAfterPost(DataSet: TDataSet);
begin
CDCadFuncionariosAusencias.Edit;
if CDCadFuncionariosAusenciasCODIGO.IsNull = True then
  begin
   //CDCadFuncionariosAusenciasCODIGO.AsInteger    := CMWeb.SMClient.GerarSequencia('FUNCIONARIOSAUSENCIA_S');
   CDCadFuncionariosAusenciasCODEMPRESA.AsString := CMWeb.FCodEmpresa;
   CDCadFuncionariosAusenciasMATRICULA.AsString  := CMWeb.FParamAuxiliar[0];
  end;
end;

procedure TCMWeb.CDCadFuncionariosAUTONOMOValidate(Sender: TField);
begin
if (CMWeb.CDCadFuncionariosAUTONOMO.AsString = 'S') and (CMWeb.CDCadFuncionariosMOBRA.AsString <> 'AUTÔNOMO') then
  begin
    CMWeb.CDCadFuncionarios.Edit;
    CMWeb.CDCadFuncionariosMOBRA.AsString := 'AUTÔNOMA';
  end
else
if (CMWeb.CDCadFuncionariosAUTONOMO.AsString = 'N') and (CMWeb.CDCadFuncionariosMOBRA.AsString = 'AUTÔNOMO') then
  begin
    CMWeb.CDCadFuncionarios.Edit;
    CMWeb.CDCadFuncionariosMOBRA.Clear;
  end;
end;

procedure TCMWeb.CDCadFuncionariosMOBRAValidate(Sender: TField);
begin
if (CMWeb.CDCadFuncionariosMOBRA.AsString = 'AUTÔNOMA') and (CMWeb.CDCadFuncionariosAUTONOMO.AsString = 'N') then
  begin
    CMWeb.CDCadFuncionarios.Edit;
    CMWeb.CDCadFuncionariosAUTONOMO.AsString := 'S';
  end
else
if (CMWeb.CDCadFuncionariosMOBRA.AsString <> 'AUTÔNOMA') and (CMWeb.CDCadFuncionariosAUTONOMO.AsString <> 'S') then
  begin
    CMWeb.CDCadFuncionarios.Edit;
    CMWeb.CDCadFuncionariosAUTONOMO.AsString := 'N';
  end;
end;

procedure TCMWeb.CDCadGruposAfterPost(DataSet: TDataSet);
begin
CDCadGrupos.Edit;
if CDCadGruposCODIGO.IsNull = True then
  begin
   //CDCadGruposCODIGO.AsInteger           := CMWeb.SMClient.GerarSequencia('GRUPOS_S');
   CDCadGruposCODFORMATOCODIGO.AsInteger := CMWeb.CDCadFormatoCodigoCODIGO.AsInteger;
  end;
end;

procedure TCMWeb.CDCadImagensAfterPost(DataSet: TDataSet);
begin
CDCadImagens.Edit;
if CDCadImagensCODIGO.IsNull = True then
   //CMWeb.CDCadImagensCODIGO.AsInteger := CMWeb.SMClient.GerarSequencia('IMAGENS_S');
CDCadImagensCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadLubrificProgEquipAfterClose(DataSet: TDataSet);
begin
  CMWeb.CDCadLubrificProgEquipItens.Close;
  CMWeb.CDCadLubrificProgEquipItensEsp.Close;
  CMWeb.CDCadLubrificProgEquipPlanoTrab.Close;
end;

procedure TCMWeb.CDCadLubrificProgEquipAfterOpen(DataSet: TDataSet);
begin
  if CMWeb.CDCadLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString <> '' then
    begin
      CMWeb.CDCadLubrificProgEquipItens.Close;
      CMWeb.CDCadLubrificProgEquipItens.Params[0].AsString := CMWeb.FCodEmpresa;
      CMWeb.CDCadLubrificProgEquipItens.Params[1].AsString := CMWeb.CDCadLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString;
      CMWeb.CDCadLubrificProgEquipItens.Open;
    end
  else
    CMWeb.CDCadLubrificProgEquipItens.Close;

  if CMWeb.CDCadLubrificProgEquipCODIGO.AsString <> '' then
    begin
      CMWeb.CDCadLubrificProgEquipItensEsp.Close;
      CMWeb.CDCadLubrificProgEquipItensEsp.Params[0].AsString := CMWeb.FCodEmpresa;
      CMWeb.CDCadLubrificProgEquipItensEsp.Params[1].AsString := CMWeb.CDCadLubrificProgEquipCODIGO.AsString;
      CMWeb.CDCadLubrificProgEquipItensEsp.Open;
    end
  else
    CMWeb.CDCadLubrificProgEquipItensEsp.Close;

  if CMWeb.CDCadLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString <> '' then
    begin
      CMWeb.CDCadLubrificProgEquipPlanoTrab.Close;
      CMWeb.CDCadLubrificProgEquipPlanoTrab.Params[0].AsString := CMWeb.FCodEmpresa;
      CMWeb.CDCadLubrificProgEquipPlanoTrab.Params[1].AsString := CMWeb.CDCadLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString;
      CMWeb.CDCadLubrificProgEquipPlanoTrab.Open;
    end;
end;

procedure TCMWeb.CDCadLubrificProgEquipCalcFields(DataSet: TDataSet);
begin
if (FrmTelaInspVenc <> nil) or (FrmTelaInspConsulta <> nil) then
  begin
    CDCadLubrificProgEquipCODORDEMSERVICO.AsInteger := CMWeb.FCodOrdemServico;
  end;
if CDCadLubrificProgEquipDTAINICIO1.AsString <> '' then
  CDCadLubrificProgEquipC_PROXINSP.AsDateTime := IncDay(CDCadLubrificProgEquipDTAINICIO1.AsDateTime, CDCadLubrificProgEquipFREQUENCIA1.AsInteger);
end;

procedure TCMWeb.CDCadLubrificProgEquipItensEspAfterInsert(DataSet: TDataSet);
begin
CDCadLubrificProgEquipItensEspCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
CDCadLubrificProgEquipItensEspCODLUBRIFICPROGEQUIP.AsString := CDCadLubrificProgEquipCODIGO.AsString;
end;

procedure TCMWeb.CDCadLubrificProgFamEquipItensAfterPost(DataSet: TDataSet);
begin
CDCadLubrificProgFamEquipItens.Edit;
//CDCadLubrificProgFamEquipItensCODIGO.AsInteger                 := CDCadLubrificProgFamEquipItens.RecordCount + 1;
CDCadLubrificProgFamEquipItensCODEMPRESA.AsString              := CMWeb.FCodEmpresa;
CDCadLubrificProgFamEquipItensCODLUBRIFICPROGFAMEQUIP.AsString := CDCadLubrificProgFamEquipCODIGO.AsString;
CDCadLubrificProgFamEquipItensCODPARTE.AsString                := CDCadLubrificProgFamEquipPartesCODIGO.AsString;
end;

procedure TCMWeb.CDCadLubrificProgFamEquipPartesAfterInsert(DataSet: TDataSet);
begin
CDCadLubrificProgFamEquipPartesCODIGO.AsInteger                 := CDCadLubrificProgFamEquipPartes.RecordCount + 1;
CDCadLubrificProgFamEquipPartesCODEMPRESA.AsString              := CMWeb.FCodEmpresa;
CDCadLubrificProgFamEquipPartesCODLUBRIFICPROGFAMEQUIP.AsString := CDCadLubrificProgFamEquipCODIGO.AsString;
CDCadLubrificProgFamEquipPartesCODFAMILIAEQUIP.AsString         := CDCadLubrificProgFamEquipCODFAMILIAEQUIP.AsString;
end;

procedure TCMWeb.CDCadManutProgEquipAfterClose(DataSet: TDataSet);
begin
  CMWeb.CDCadManutProgEquipItens.Close;
  CMWeb.CDCadManutProgEquipItensEsp.Close;
  CMWeb.CDCadManutProgEquipPlanoTrab.Close;
end;

procedure TCMWeb.CDCadManutProgEquipAfterOpen(DataSet: TDataSet);
begin
  if CMWeb.CDCadManutProgEquipCODMANUTPROGFAMEQUIP.AsString <> '' then
    begin
      CMWeb.CDCadManutProgEquipItens.Close;
      CMWeb.CDCadManutProgEquipItens.Params[0].AsString := CMWeb.FCodEmpresa;
      CMWeb.CDCadManutProgEquipItens.Params[1].AsString := CMWeb.CDCadManutProgEquipCODMANUTPROGFAMEQUIP.AsString;
      CMWeb.CDCadManutProgEquipItens.Open;
    end
  else
    CMWeb.CDCadManutProgEquipItens.Close;

  if CMWeb.CDCadManutProgEquipCODMANUTPROGFAMEQUIP.AsString <> '' then
    begin
      CMWeb.CDCadManutProgEquipItensEsp.Close;
      CMWeb.CDCadManutProgEquipItensEsp.Params[0].AsString := CMWeb.FCodEmpresa;
      CMWeb.CDCadManutProgEquipItensEsp.Params[1].AsString := CMWeb.CDCadManutProgEquipCODIGO.AsString;
      CMWeb.CDCadManutProgEquipItensEsp.Open;
    end
  else
    CMWeb.CDCadManutProgEquipItensEsp.Close;

  if CMWeb.CDCadManutProgEquipCODMANUTPROGFAMEQUIP.AsString <> '' then
    begin
      CMWeb.CDCadManutProgEquipPlanoTrab.Close;
      CMWeb.CDCadManutProgEquipPlanoTrab.Params[0].AsString := CMWeb.FCodEmpresa;
      CMWeb.CDCadManutProgEquipPlanoTrab.Params[1].AsString := CMWeb.CDCadManutProgEquipCODMANUTPROGFAMEQUIP.AsString;
      CMWeb.CDCadManutProgEquipPlanoTrab.Open;
    end
  else
    CMWeb.CDCadManutProgEquipPlanoTrab.Close;

end;

procedure TCMWeb.CDCadManutProgEquipCalcFields(DataSet: TDataSet);
begin
if (FrmTelaInspVenc <> nil) or (FrmTelaInspConsulta <> nil) then
  begin
    CDCadManutProgEquipCODORDEMSERVICO.AsInteger := CMWeb.FCodOrdemServico;
  end;
if CDCadManutProgEquipDTAINICIO1.AsString <> '' then
  CDCadManutProgEquipC_PROXINSP.AsDateTime := IncDay(CDCadManutProgEquipDTAINICIO1.AsDateTime, CDCadManutProgEquipFREQUENCIA1.AsInteger);
enD;

procedure TCMWeb.CDCadManutProgEquipItensEspAfterInsert(DataSet: TDataSet);
begin
CDCadManutProgEquipItensEspCODEMPRESA.AsString        := CMWeb.FCodEmpresa;
CDCadManutProgEquipItensEspCODMANUTPROGEQUIP.AsString := CDCadManutProgEquipCODIGO.AsString;
end;

procedure TCMWeb.CDCadManutProgFamEquipItensAfterPost(DataSet: TDataSet);
begin
CDCadManutProgFamEquipItens.Edit;
//CDCadManutProgFamEquipItensCODIGO.AsInteger              := Random(1000);
CDCadManutProgFamEquipItensCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
CDCadManutProgFamEquipItensCODMANUTPROGFAMEQUIP.AsString := CDCadManutProgFamEquipCODIGO.AsString;
CDCadManutProgFamEquipItensCODPARTE.AsString             := CDCadManutProgFamEquipPartesCODIGO.AsString;
end;

procedure TCMWeb.CDCadManutProgFamEquipPartesAfterInsert(DataSet: TDataSet);
begin
CDCadManutProgFamEquipPartesCODIGO.AsInteger              := CDCadManutProgFamEquipPartes.RecordCount + 1;
CDCadManutProgFamEquipPartesCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
CDCadManutProgFamEquipPartesCODMANUTPROGFAMEQUIP.AsString := CDCadManutProgFamEquipCODIGO.AsString;
CDCadManutProgFamEquipPartesCODFAMILIAEQUIP.AsString      := CDCadManutProgFamEquipCODFAMILIAEQUIP.AsString;
end;

procedure TCMWeb.CDCadMonitMedicoesPtosInspAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadMonitoramento <> nil then
  with FrmTelaCadMonitoramento do
    begin
      if CMWeb.CDCadMonitMedicoesPtosInsp.Active = True then
        begin
          if CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat > CMWeb.CDCadMonitMedicoesPtosInspLIMSUPMAX.AsFloat then
            begin
              BtnInfMax.Enabled    := False;
              BtnInf.Enabled       := False;
              BtnSup.Enabled       := False;

              BtnSupMax.ImageIndex := 66;
              BtnSupMax.Enabled    := True;
            end;

          if (CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat > CMWeb.CDCadMonitMedicoesPtosInspLIMSUPSEG.AsFloat) and (CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat < CMWeb.CDCadMonitMedicoesPtosInspLIMSUPMAX.AsFloat) then
            begin
              BtnInfMax.Enabled    := False;
              BtnInf.Enabled       := False;
              BtnSupMax.Enabled    := False;

              BtnSup.ImageIndex    := 100;
              BtnSup.Enabled       := True;
            end;

          if CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat < CMWeb.CDCadMonitMedicoesPtosInspLIMINFMAX.AsFloat then
            begin
              BtnInf.Enabled       := False;
              BtnSup.Enabled       := False;
              BtnSupMax.Enabled    := False;

              BtnInfMax.ImageIndex := 66;
              BtnInfMax.Enabled    := True;
            end;

          if (CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat < CMWeb.CDCadMonitMedicoesPtosInspLIMINFSEG.AsFloat) and (CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat > CMWeb.CDCadMonitMedicoesPtosInspLIMINFMAX.AsFloat) then
            begin
              BtnInfMax.Enabled    := False;
              BtnSup.Enabled       := False;
              BtnSupMax.Enabled    := False;

              BtnInf.ImageIndex    := 100;
              BtnInf.Enabled       := True;
            end;

          if (CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat < CMWeb.CDCadMonitMedicoesPtosInspLIMSUPSEG.AsFloat) and (CMWeb.CDCadMonitMedicoesPtosInspMEDICAO.AsFloat > CMWeb.CDCadMonitMedicoesPtosInspLIMINFSEG.AsFloat) then
            begin
              BtnInfMax.Enabled := False;
              BtnInf.Enabled    := False;
              BtnSup.Enabled    := False;
              BtnSupMax.Enabled := False;
            end;
        end;
    end;
end;

procedure TCMWeb.CDCadOrdemServico1AfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
    CMWeb.CDOrdemServicoGerencia.Edit;
    CMWeb.CDOrdemServicoGerenciaDESCRICAO.AsString     := CDCadOrdemServicoDESCRICAO.AsString;
    CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString      := CDCadOrdemServicoSITUACAO.AsString;
    CMWeb.CDOrdemServicoGerenciaCODMANUTENCAO.AsString := CDCadOrdemServicoCODMANUTENCAO.AsString;
    CMWeb.CDOrdemServicoGerenciaEQUIPAMENTO.AsString   := CDCadOrdemServicoEQUIPAMENTO.AsString;
    CMWeb.CDOrdemServicoGerenciaMATRICULA.AsString     := CDCadOrdemServicoMATRICULA.AsString;
    CMWeb.CDOrdemServicoGerencia.Post;
end;

procedure TCMWeb.CDCadOrdemServicoAfterClose(DataSet: TDataSet);
begin
if FrmTelaCadOrdemServicoGerencia = nil then
  begin
    CMWeb.CDCadOrdemServicoServSolic.Close;
    CMWeb.CDCadOrdemServicoServExec.Close;
    CMWeb.CDCadOrdemServicoEquipe.Close;
    CMWeb.CDCadOrdemServicoEquipePecas.Close;
    CMWeb.CDCadOrdemServicoEquipePlanoTrab.Close;
    CMWeb.CDCadOrdemServicoEquipePecasUtil.Close;
  end;
end;

procedure TCMWeb.CDCadOrdemServicoEquipeAfterClose(DataSet: TDataSet);
begin
  CMWeb.CDCadOrdemServicoEquipeMObra.Close;
  CMWeb.CDCadOrdemServicoEquipeMObraUtil.Close;
  CMWeb.CDCadOrdemServicoEquipePecas.Close;
  CMWeb.CDCadOrdemServicoEquipePecasUtil.Close;
  CMWeb.CDCadOrdemServicoEquipeRecursos.Close;
  CMWeb.CDCadOrdemServicoEquipeRecursosUtil.Close;
  CMWeb.CDCadOrdemServicoEquipePlanoTrab.Close;
end;

procedure TCMWeb.CDCadOrdemServicoEquipeAfterInsert(DataSet: TDataSet);
begin
CMWeb.CDCadOrdemServicoEquipeCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
CMWeb.CDCadOrdemServicoEquipeCODORDEMSERVICO.AsInteger := CMWeb.CDCadOrdemServicoCODIGO.AsInteger;
end;

procedure TCMWeb.CDCadOrdemServicoEquipeMObraAfterClose(DataSet: TDataSet);
begin
CMWeb.CDCadOrdemServicoMObraExec.Close;
CMWeb.CDCadOrdemServicoEquipeMObraUtil.Close;
CMWeb.CDCadOrdemServicoMObraProg.Close;
end;

procedure TCMWeb.CDCadOrdemServicoEquipeMObraAfterScroll(DataSet: TDataSet);
begin
CDCadOrdemServicoMObraExec.Close;
CDCadOrdemServicoMObraExec.Params[0].AsString := CDCadOrdemServicoEquipeMObraCODORDEMSERVICO.AsString;
CDCadOrdemServicoMObraExec.Params[1].AsString := CDCadOrdemServicoEquipeMObraCODEQUIPE.AsString;
CDCadOrdemServicoMObraExec.Params[2].AsString := CDCadOrdemServicoEquipeMObraMATRICULA.AsString;
CDCadOrdemServicoMObraExec.Open;

CMWeb.CDCadOrdemServicoMObraProg.Open;
end;

procedure TCMWeb.CDCadOrdemServicoEquipeMObraUtilAfterClose(DataSet: TDataSet);
begin
CMWeb.CDCadOrdemServicoEquipeMObraMovim.Close;
end;

procedure TCMWeb.CDCadOrdemServicoHistoricoAfterClose(DataSet: TDataSet);
begin
CMWeb.CDCadOrdemServicoHistoricoServExec.Close;
end;

procedure TCMWeb.CDCadOrdemServicoHistoricoCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadOrdemServicoHistorico <> nil then
  begin
    CDCadOrdemServicoHistoricoPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadOrdemServicoHistorico.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadOrdemServicoHistorico.EdtData2.Date)
  end;
end;

procedure TCMWeb.CDCadOrdemServicoMObraDispAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadOrdemServicoMObraDisp <> nil then
  CMWeb.ExibeFoto(CMWeb.CDCadOrdemServicoMObraDisp, 'IMAGEM', FrmTelaCadOrdemServicoMObraDisp.ImgFotoFunc);
end;

procedure TCMWeb.CDCadOrdemServicoMObraProgAfterPost(DataSet: TDataSet);
begin
CDCadOrdemServicoMObraProg.Edit;
if (CDCadOrdemServicoMObraProgMATRICULA.AsString <> EmptyStr) then
  begin
    if CMWeb.CDCadOrdemServicoMObraProgTOTALHOMEMHORA.AsFloat > CMWeb.CDCadOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat then
      begin
        CDCadOrdemServicoMObraProgTOTALHOMEMHORA.AsFloat := CMWeb.CDCadOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;
      end;
  end;
end;

procedure TCMWeb.CDCadOrdemServicoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
Action := raCancel;
raise exception.create(e.message);
end;

procedure TCMWeb.CDCadOrdemServicoServExecAfterInsert(DataSet: TDataSet);
begin
CDCadOrdemServicoServExecCODIGO.AsInteger := CDCadOrdemServicoServExec.RecordCount + 1;
end;

procedure TCMWeb.CDCadOrdemServicoServSolicAfterInsert(DataSet: TDataSet);
begin
CDCadOrdemServicoServSolicCODIGO.AsInteger := CDCadOrdemServicoServSolic.RecordCount + 1;
CDCadOrdemServicoServSolicCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadOrdemServicoTercForaAditivosAfterInsert(
  DataSet: TDataSet);
begin
CDCadOrdemServicoTercForaAditivosCODIGO.AsInteger    := CDCadOrdemServicoTercForaAditivos.RecordCount + 1;
CDCadOrdemServicoTercForaAditivosCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadOrdemServicoTercForaAfterScroll(DataSet: TDataSet);
begin
CDCadOrdemServicoTercForaOC.Close;
CDCadOrdemServicoTercForaOC.Params[0].AsString := CDCadOrdemServicoTercForaCODIGO.AsString;;
CDCadOrdemServicoTercForaOC.Open;

CDCadOrdemServicoTercForaOE.Close;
CDCadOrdemServicoTercForaOE.Params[0].AsString := CDCadOrdemServicoTercForaCODIGO.AsString;;
CDCadOrdemServicoTercForaOE.Open;

CDCadOrdemServicoTercForaAditivos.Close;
CDCadOrdemServicoTercForaAditivos.Params[0].AsString := CDCadOrdemServicoTercForaCODIGO.AsString;;
CDCadOrdemServicoTercForaAditivos.Open;
end;

procedure TCMWeb.CDCadOrdemServicoTercForaOCAfterInsert(DataSet: TDataSet);
begin
CDCadOrdemServicoTercForaOCCODIGO.AsInteger    := CDCadOrdemServicoTercForaOC.RecordCount + 1;
CDCadOrdemServicoTercForaOCCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadOrdemServicoTercForaOEAfterInsert(DataSet: TDataSet);
begin
CDCadOrdemServicoTercForaOECODIGO.AsInteger    := CDCadOrdemServicoTercForaOE.RecordCount + 1;
CDCadOrdemServicoTercForaOECODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadOrdemServicoTercForaOIAfterInsert(DataSet: TDataSet);
begin
CDCadOrdemServicoTercForaOICODIGO.AsInteger    := CDCadOrdemServicoTercForaOI.RecordCount + 1;
CDCadOrdemServicoTercForaOICODEMPRESA.AsString := FCodEmpresa;
end;

procedure TCMWeb.CDCadOrdemServicoTercUnidAditivosAfterInsert(
  DataSet: TDataSet);
begin
CDCadOrdemServicoTercUnidAditivosCODIGO.AsInteger          := CDCadOrdemServicoTercUnidAditivos.RecordCount + 1;
CDCadOrdemServicoTercUnidAditivosCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDCadOrdemServicoTercUnidMateriaisAfterInsert(
  DataSet: TDataSet);
begin
CDCadOrdemServicoTercUnidMateriaisCODIGO.AsInteger          := CDCadOrdemServicoTercUnidMateriais.RecordCount + 1;
CDCadOrdemServicoTercUnidMateriaisCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
CDCadOrdemServicoTercUnidMateriaisCODORDEMSERVICO.AsInteger := CDCadOrdemServicoTercUnidCODIGO.AsInteger;
end;

procedure TCMWeb.CDCadOrdemServicoTercUnidMedicoesAfterInsert(
  DataSet: TDataSet);
begin
CDCadOrdemServicoTercUnidMedicoesCODIGO.AsInteger          := CDCadOrdemServicoTercUnidMedicoes.RecordCount + 1;
CDCadOrdemServicoTercUnidMedicoesCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
CDCadOrdemServicoTercUnidMedicoesCODORDEMSERVICO.AsInteger := CDCadOrdemServicoTercUnidCODIGO.AsInteger;
CDCadOrdemServicoTercUnidMedicoesDATAMEDICAO.AsDateTime    := DateOf(FDataHoraServidor);
CDCadOrdemServicoTercUnidMedicoesLIBERADO.AsString         := 'S';
CDCadOrdemServicoTercUnidMedicoesPARCELA.AsInteger         := 0;
end;

procedure TCMWeb.CDCadOrdemServicoTercUnidPecasAfterPost(DataSet: TDataSet);
begin
CDCadOrdemServicoTercUnidPecas.Edit;
if (CDCadOrdemServicoTercUnidPecasCODIGO.IsNull = True) then
  begin
    //CDCadOrdemServicoTercUnidPecasCODIGO.AsInteger          := CMWeb.SMClient.GerarSequencia('ORDEMSERVICOPECASREP_S');
    CDCadOrdemServicoTercUnidPecasCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
    CDCadOrdemServicoTercUnidPecasCODORDEMSERVICO.AsInteger := CDCadOrdemServicoTercUnidCODIGO.AsInteger;
  end;
end;

procedure TCMWeb.CDCadOrdemServicoTercUnidRecursoAfterPost(DataSet: TDataSet);
begin
CDCadOrdemServicoTercUnidRecurso.Edit;
if (CDCadOrdemServicoTercUnidRecursoCODIGO.IsNull = True) then
  begin
    //CDCadOrdemServicoTercUnidRecursoCODIGO.AsInteger          := CMWeb.SMClient.GerarSequencia('ORDEMSERVICORECURSOS_S');
    CDCadOrdemServicoTercUnidRecursoCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
    CDCadOrdemServicoTercUnidRecursoCODORDEMSERVICO.AsInteger := CDCadOrdemServicoTercUnidCODIGO.AsInteger;
  end;
end;

procedure TCMWeb.CDCadPecaReposicaoKitAfterScroll(DataSet: TDataSet);
begin
CMWeb.CDCadPecaReposicaoKitItens.Close;
CMWeb.CDCadPecaReposicaoKitItens.Params[0].AsString := CMWeb.FCodEmpresa;
CMWeb.CDCadPecaReposicaoKitItens.Params[1].AsString := CMWeb.CDCadPecaReposicaoKitCODIGO.AsString;
CMWeb.CDCadPecaReposicaoKitItens.Open;
end;

procedure TCMWeb.CDCadPneusChassiAfterPost(DataSet: TDataSet);
begin
CDCadPneusChassi.Edit;
if (CDCadPneusChassiCODIGO.IsNull = True) then
  begin
    //CDCadPneusChassiCODIGO.AsInteger          := CMWeb.SMClient.GerarSequencia('ORDEMSERVICORECURSOS_S');
    CDCadPneusChassiCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
  end;
end;

procedure TCMWeb.CDCadPneusChassiAfterScroll(DataSet: TDataSet);
begin
CDCadPneusChassiAtrelamento.Close;
CDCadPneusChassiAtrelamento.Params[0].AsString := FCodEmpresa;
CDCadPneusChassiAtrelamento.Params[1].AsString := CDCadPneusChassiCODIGO.AsString;
CDCadPneusChassiAtrelamento.Open;
end;

procedure TCMWeb.CDCadPneusChassiAtrelamentoAfterPost(DataSet: TDataSet);
begin
CDCadPneusChassiAtrelamento.Edit;
if (CDCadPneusChassiAtrelamentoCODIGO.IsNull = True) then
  begin
    //CDCadPneusChassiAtrelamentoCODIGO.AsInteger    := CMWeb.SMClient.GerarSequencia('PNEUSMONTAGEMCHASSI_S');
    CDCadPneusChassiAtrelamentoCODEMPRESA.AsString := CMWeb.FCodEmpresa;
    CDCadPneusChassiAtrelamentoCODCHASSI.AsInteger := CMWeb.CDCadPneusChassiCODIGO.AsInteger;
  end;
end;

procedure TCMWeb.CDCadPneusChassiAtrelamentoHistAfterPost(DataSet: TDataSet);
begin
CDCadPneusChassiAtrelamentoHist.Edit;
if (CDCadPneusChassiAtrelamentoHistCODIGO.IsNull = True) then
  begin
    //CDCadPneusChassiAtrelamentoHistCODIGO.AsInteger    := CMWeb.SMClient.GerarSequencia('PNEUSMONTAGEMCHASSI_S');
    CDCadPneusChassiAtrelamentoHistCODEMPRESA.AsString := CMWeb.FCodEmpresa;
    CDCadPneusChassiAtrelamentoHistCODCHASSI.AsInteger := CMWeb.CDCadPneusChassiCODIGO.AsInteger;
  end;
end;

procedure TCMWeb.CDCadPneusChassiCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassiRelat <> nil then
  begin
    CDCadPneusChassiPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date)
  end;
end;

procedure TCMWeb.CDCadPneusChassiCustoCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassiRelat <> nil then
  begin
    CDCadPneusChassiCustoPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date);

    if FrmTelaCadPneusChassiRelat.RGTipo.ItemIndex = 1 then
      CMWeb.CDCadPneusChassiCustoFILTRO.AsString := 'POSICAO'
    else
      CMWeb.CDCadPneusChassiCustoFILTRO.Clear;
  end;
end;

procedure TCMWeb.CDCadPneusChassiIDCustoCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassiRelat <> nil then
  begin
    CDCadPneusChassiIDCustoPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date)
  end;
end;

procedure TCMWeb.CDCadPneusChassiPosicoesAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassi <> nil then
  with FrmTelaCadPneusChassi do
    begin
      if CMWeb.CDCadPneusChassiCHASSI.AsString = 'Carregadeira de Pneus' then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito'  then
            begin BtnPneu.Left := 58; BtnPneu.Top := 24; end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin BtnPneu.Left := 58; BtnPneu.Top := 126; end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito'   then
            begin BtnPneu.Left := 163; BtnPneu.Top := 24; end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo'  then
            begin BtnPneu.Left := 163; BtnPneu.Top := 126; end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Carro de Passeio C/Diferencial Duplo') or (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Carro de Passeio C/Diferencial Frontal') or (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Carro de Passeio C/Diferencial Trazeiro') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito'  then
            begin BtnPneu.Left := 25; BtnPneu.Top := 19; end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin BtnPneu.Left := 25; BtnPneu.Top := 97; end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito'   then
            begin BtnPneu.Left := 172; BtnPneu.Top := 19; end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo'  then
            begin BtnPneu.Left := 172; BtnPneu.Top := 97; end;
        end;
      if CMWeb.CDCadPneusChassiCHASSI.AsString = 'Carroceria de Carreta C/ 1 Eixo' then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 98;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 33;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 89;
            end;
        end;
      if CMWeb.CDCadPneusChassiCHASSI.AsString = 'Carroceria de Carreta C/ 2 Eixos' then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 98;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 33;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 89;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 98;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 33;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 89;
            end;
        end;
      if CMWeb.CDCadPneusChassiCHASSI.AsString = 'Carroceria de Carreta C/ 3 Eixos' then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 98;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 33;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 89;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 98;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 33;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 89;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 98;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 33;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 89;
            end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/2 Eixos C/Diferencial Frontal') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 25;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 36;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 92;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 36;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 92;
            end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/2 Eixos C/Diferencial Trazeiro') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 25;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 36;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 92;
            end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Duplo') or (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Frontal') or (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Trazeiro') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 36;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 92;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 36;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 92;
            end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Trazeiro') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 36;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 92;
            end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Ônibus C/ 2 Eixos') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 20;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 100;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 21;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 31;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 86;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 95;
            end;
        end;
      if CMWeb.CDCadPneusChassiCHASSI.AsString = 'Ônibus C/ 3 Eixos' then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 20;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 100;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 21;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 31;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 86;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 95;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 21;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 31;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 86;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 95;
            end;
        end;
      if CMWeb.CDCadPneusChassiCHASSI.AsString = 'Patrol' then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 00; BtnPneu.Top := 33;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 00; BtnPneu.Top := 114;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito' then
            begin
              BtnPneu.Left := 200; BtnPneu.Top := 23;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 200; BtnPneu.Top := 124;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Traseiro Lado Direito' then
            begin
              BtnPneu.Left := 270; BtnPneu.Top := 23;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Traseiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 270; BtnPneu.Top := 124;
            end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Duplo') or (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Frontal') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 25;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 37;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 92;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 37;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 92;
            end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Trazeiro') then
        begin
            if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
              begin
                BtnPneu.Left := 20; BtnPneu.Top := 25;
              end;
            if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
              begin
                BtnPneu.Left := 20; BtnPneu.Top := 105;
              end;
            if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 27;
              end;
            if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 101;
              end;
            if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 37;
              end;
            if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 92;
              end;
        end;
      if (CMWeb.CDCadPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Triplo') then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 25;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 105;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 37;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 92;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 37;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 92;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 27;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 101;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 37;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 92;
            end;
        end;
    if CMWeb.CDCadPneusChassiCHASSI.AsString = 'Trator' then
        begin
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 12; BtnPneu.Top := 32;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 12; BtnPneu.Top := 112;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito' then
            begin
              BtnPneu.Left := 145; BtnPneu.Top := 21;
            end;
          if CMWeb.CDCadPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 145; BtnPneu.Top := 123;
            end;
        end;
    end;
end;

procedure TCMWeb.CDCadPneusChassiPosicoesHistCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassi <> nil then
  begin
    CDCadPneusChassiPosicoesHistPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date)
  end;
end;

procedure TCMWeb.CDCadRecursoKitAfterScroll(DataSet: TDataSet);
begin
CMWeb.CDCadRecursoKitItens.Close;
CMWeb.CDCadRecursoKitItens.Params[0].AsString := CMWeb.FCodEmpresa;
CMWeb.CDCadRecursoKitItens.Params[1].AsString := CMWeb.CDCadRecursoKitCODIGO.AsString;
CMWeb.CDCadRecursoKitItens.Open;
end;

procedure TCMWeb.CDCadRecursosCalcFields(DataSet: TDataSet);
begin
if CDCadRecursosAMORTIZACAO.AsFloat > 0 then
  CDCadRecursosCUSTOHORA_CALC.AsFloat := CDCadRecursosPRECO.AsFloat/CDCadRecursosAMORTIZACAO.AsFloat;
end;

procedure TCMWeb.CDCadRotasCalcFields(DataSet: TDataSet);
begin
if FrmTelaInspVenc <> nil then
  begin
    CDCadRotasC_CODORDEMSERVICO.AsInteger := CMWeb.FCodOrdemServico;
  end;
if CDCadRotasDATAINICIO.AsString <> '' then
  CDCadRotasC_PROXINSP.AsDateTime := IncDay(CDCadRotasDATAINICIO.AsDateTime, CDCadRotasFREQUENCIA.AsInteger);
end;

procedure TCMWeb.CDCadRotasSequenciaAfterScroll(DataSet: TDataSet);
begin
//if CDCadRotasSequencia.IsEmpty = False then
//  begin
//  if FrmTelaCadRotaProgEquip <> nil then
//    begin
//      with FrmTelaCadRotaProgEquip do
//        begin
//          PAuxiliares.Font.Color := clBlack;
//          PAuxiliares.Caption := FormatFloat('00', CDCadRotasSequenciaInsp.RecordCount) + ' INSPEÇÕES CADASTRADAS NESSE PERÍODO';
//        end;
//    end;
//  end;
end;

procedure TCMWeb.CDCadSolicitacaoTrabPRAZOSOLICValidate(Sender: TField);
begin
//if CDCadSolicitacaoTrabPRAZOSOLIC.AsInteger > 2147483647 then
  //CDCadSolicitacaoTrabPRAZOSOLIC.AsInteger := 2147483647;
end;

procedure TCMWeb.CDCadViagensTANQUESAIDAValidate(Sender: TField);
begin
if (CDCadViagensDATACHEGADA.AsDateTime > 0) then
  begin
    if (CMWeb.CDCadViagensDATAPARTIDA.AsDateTime > 0) and (CMWeb.CDCadViagensDATACHEGADA.AsDateTime > 0) then
      begin
        CMWeb.CDCadViagensCombust.Open;

        CMWeb.CDCadViagensCombustAbast.Close;
        CMWeb.CDCadViagensCombustAbast.Params[0].AsString := CMWeb.CDCadViagensCombustCODEQUIPAMENTO.AsString;
        CMWeb.CDCadViagensCombustAbast.Params[1].AsString := CMWeb.CDCadViagensCombustCODIGO.AsString;
        CMWeb.CDCadViagensCombustAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', CDCadViagensDATAPARTIDA.AsDateTime) + ' 00:00:00';
        CMWeb.CDCadViagensCombustAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', CDCadViagensDATACHEGADA.AsDateTime) + ' 23:59:59';
        CMWeb.CDCadViagensCombustAbast.Open;

        CMWeb.CDCadViagensLubrific.Open;

        CMWeb.CDCadViagensLubrificAbast.Close;
        CMWeb.CDCadViagensLubrificAbast.Params[0].AsString := CMWeb.CDCadViagensLubrificCODEQUIPAMENTO.AsString;
        CMWeb.CDCadViagensLubrificAbast.Params[1].AsString := CMWeb.CDCadViagensLubrificCODIGO.AsString;
        CMWeb.CDCadViagensLubrificAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', CDCadViagensDATAPARTIDA.AsDateTime) + ' 00:00:00';
        CMWeb.CDCadViagensLubrificAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', CDCadViagensDATACHEGADA.AsDateTime) + ' 23:59:59';
        CMWeb.CDCadViagensLubrificAbast.Open;
      end;

  //(PERCENUAL DO TANQUE NA SAÍDA/100) X VOLUME DO TANQUE + TOTAL ABASTECIDO – (VOLUME DO TANQUE – (PERCENTUAL DO TANQUE NA CHEGADA/100) X VOLUME DO TANQUE.

    if CDCadViagensCONTADORCHEGADA.AsFloat > CDCadViagensCONTADORSAIDA.AsFloat then
      CDCadViagensDISTANCIA.AsFloat := CDCadViagensCONTADORCHEGADA.AsFloat - CDCadViagensCONTADORSAIDA.AsFloat;

    if CDCadViagensCombustAbastTOTALABAST.Value > 0 then
      CDCadViagensCONSUMOCOMBUST.AsFloat := CDCadViagensDISTANCIA.AsFloat/(((CDCadViagensTANQUESAIDA.AsFloat/100) * CDCadViagensVOLUMETANQUE.AsFloat) + CDCadViagensCombustAbastTOTALABAST.Value - ((CDCadViagensTANQUECHEGADA.AsFloat/100) * CDCadViagensVOLUMETANQUE.AsFloat));

    if CDCadViagensLubrificAbastTOTALLUBRIFIC.Value > 0 then
      CDCadViagensCONSUMOLUBRIFIC.AsFloat := CDCadViagensLubrificAbastTOTALLUBRIFIC.Value/CDCadViagensDISTANCIA.AsFloat;
  end;
end;

procedure TCMWeb.CDLubrificConsCalcFields(DataSet: TDataSet);
begin
  if FrmTelaInspConsulta <> nil then
    begin
      with FrmTelaInspConsulta do
        begin
          case CBPeriodo.ItemIndex of
            0: CDLubrificConsPERIODO.AsString := 'Vencidas';
            1: CDLubrificConsPERIODO.AsString := 'Próximos 7 dias';
            2: CDLubrificConsPERIODO.AsString := 'Próximos 30 dias';
            3: CDLubrificConsPERIODO.AsString := 'Próximos 60 dias';
            4: CDLubrificConsPERIODO.AsString := 'Próximos 90 dias';
            5: CDLubrificConsPERIODO.AsString := 'Próximos 180 dias';
            6: CDLubrificConsPERIODO.AsString := 'Próximos 365 dias';
          end;
        end;
    end;
end;

procedure TCMWeb.CDLubrificPeriodicasAfterInsert(DataSet: TDataSet);
begin
//if (CDLubrificPeriodicasINDICE.IsNull = True) then
   //CDLubrificPeriodicasINDICE.AsInteger := CMWeb.SMClient.GerarSequencia('LUBRIFICPROGEQUIPHIST_S');
CDLubrificPeriodicasCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDLubrificPeriodicasAfterScroll(DataSet: TDataSet);
begin
  If CDLubrificPeriodicas.Eof Then
    CDLubrificPeriodicas.GetNextPacket;
end;

procedure TCMWeb.CDLubrificPeriodicasCalcFields(DataSet: TDataSet);
begin
if FrmTelaInspFechamentoHist <> nil then
  begin
    CDLubrificPeriodicasPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData2.Date)
  end;
end;

procedure TCMWeb.CDLubrificPeriodicasHistAfterScroll(DataSet: TDataSet);
begin
  If CDLubrificPeriodicasHist.Eof Then
    CDLubrificPeriodicasHist.GetNextPacket;
end;

procedure TCMWeb.CDLubrificPeriodicasHistItensCalcFields(DataSet: TDataSet);
begin
if CDLubrificPeriodicasHistItensEXECUTADO.AsString = 'S' then CDLubrificPeriodicasHistItensEXECUTADO_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensEXECUTADO_CHK.AsBoolean := False;
if CDLubrificPeriodicasHistItensBOM.AsString = 'S' then CDLubrificPeriodicasHistItensBOM_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensBOM_CHK.AsBoolean := False;
if CDLubrificPeriodicasHistItensREGULAR.AsString = 'S' then CDLubrificPeriodicasHistItensREGULAR_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensREGULAR_CHK.AsBoolean := False;
if CDLubrificPeriodicasHistItensRUIM.AsString = 'S' then CDLubrificPeriodicasHistItensRUIM_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensRUIM_CHK.AsBoolean := False;

end;

procedure TCMWeb.CDLubrificPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
begin
if CDLubrificPeriodicasHistItensEspEXECUTADO.AsString = 'S' then CDLubrificPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := False;
if CDLubrificPeriodicasHistItensEspBOM.AsString = 'S' then CDLubrificPeriodicasHistItensEspBOM_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensEspBOM_CHK.AsBoolean := False;
if CDLubrificPeriodicasHistItensEspREGULAR.AsString = 'S' then CDLubrificPeriodicasHistItensEspREGULAR_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensEspREGULAR_CHK.AsBoolean := False;
if CDLubrificPeriodicasHistItensEspRUIM.AsString = 'S' then CDLubrificPeriodicasHistItensEspRUIM_CHK.AsBoolean := True
else CDLubrificPeriodicasHistItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDLubrificPeriodicasItensCalcFields(DataSet: TDataSet);
begin
if CDLubrificPeriodicasItensEXECUTADO.AsString = 'S' then CDLubrificPeriodicasItensEXECUTADO_CHK.AsBoolean := True
else CDLubrificPeriodicasItensEXECUTADO_CHK.AsBoolean := False;
if CDLubrificPeriodicasItensBOM.AsString = 'S' then CDLubrificPeriodicasItensBOM_CHK.AsBoolean := True
else CDLubrificPeriodicasItensBOM_CHK.AsBoolean := False;
if CDLubrificPeriodicasItensREGULAR.AsString = 'S' then CDLubrificPeriodicasItensREGULAR_CHK.AsBoolean := True
else CDLubrificPeriodicasItensREGULAR_CHK.AsBoolean := False;
if CDLubrificPeriodicasItensRUIM.AsString = 'S' then CDLubrificPeriodicasItensRUIM_CHK.AsBoolean := True
else CDLubrificPeriodicasItensRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDLubrificPeriodicasItensEspCalcFields(DataSet: TDataSet);
begin
if CDLubrificPeriodicasItensEspEXECUTADO.AsString = 'S' then CDLubrificPeriodicasItensEspEXECUTADO_CHK.AsBoolean := True
else CDLubrificPeriodicasItensEspEXECUTADO_CHK.AsBoolean := False;
if CDLubrificPeriodicasItensEspBOM.AsString = 'S' then CDLubrificPeriodicasItensEspBOM_CHK.AsBoolean := True
else CDLubrificPeriodicasItensEspBOM_CHK.AsBoolean := False;
if CDLubrificPeriodicasItensEspREGULAR.AsString = 'S' then CDLubrificPeriodicasItensEspREGULAR_CHK.AsBoolean := True
else CDLubrificPeriodicasItensEspREGULAR_CHK.AsBoolean := False;
if CDLubrificPeriodicasItensEspRUIM.AsString = 'S' then CDLubrificPeriodicasItensEspRUIM_CHK.AsBoolean := True
else CDLubrificPeriodicasItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDLubrificVencAfterGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  if FrmTelaInspVenc <> nil then
    begin
      if CMWeb.CDLubrificVenc.Active = True then
      FrmTelaInspVenc.TSLubrific.Caption := 'Lubrificações ('+ IntToStr(CMWeb.CDLubrificVenc.RecordCount)+')';
    end;
end;

procedure TCMWeb.CDLubrificVencCalcFields(DataSet: TDataSet);
begin
if CDLubrificVencDTAINICIO1.AsDateTime > 0 then
  CDLubrificVencC_DIASATRASO.AsInteger := DaysBetween(DateOf(CMWeb.FDataHoraServidor), DateOf(CDLubrificVencDTAINICIO1.AsDateTime))
else
  CDLubrificVencC_DIASATRASO.AsInteger := 0;
end;

procedure TCMWeb.CDManutConsCalcFields(DataSet: TDataSet);
begin
  if FrmTelaInspConsulta <> nil then
    begin
      with FrmTelaInspConsulta do
        begin
          case CBPeriodo.ItemIndex of
            0: CDManutConsPERIODO.AsString := 'Vencidas';
            1: CDManutConsPERIODO.AsString := 'Próximos 7 dias';
            2: CDManutConsPERIODO.AsString := 'Próximos 30 dias';
            3: CDManutConsPERIODO.AsString := 'Próximos 60 dias';
            4: CDManutConsPERIODO.AsString := 'Próximos 90 dias';
            5: CDManutConsPERIODO.AsString := 'Próximos 180 dias';
            6: CDManutConsPERIODO.AsString := 'Próximos 365 dias';
          end;
        end;
    end;
end;

procedure TCMWeb.CDManutPeriodicasAfterInsert(DataSet: TDataSet);
begin
//if (CDManutPeriodicasINDICE.IsNull = True) then
   //CDManutPeriodicasINDICE.AsInteger := CMWeb.SMClient.GerarSequencia('MANUTPROGEQUIPHIST_S');
CDManutPeriodicasCODEMPRESA.AsString := CMWeb.FCodEmpresa;
end;

procedure TCMWeb.CDManutPeriodicasAfterScroll(DataSet: TDataSet);
begin
  If CDManutPeriodicas.Eof Then
    CDManutPeriodicas.GetNextPacket;
end;

procedure TCMWeb.CDManutPeriodicasCalcFields(DataSet: TDataSet);
begin
if FrmTelaInspFechamentoHist <> nil then
  begin
    CDManutPeriodicasPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData2.Date)
  end;
end;

procedure TCMWeb.CDManutPeriodicasHistAfterScroll(DataSet: TDataSet);
begin
  If CDManutPeriodicasHist.Eof Then
    CDManutPeriodicasHist.GetNextPacket;
end;

procedure TCMWeb.CDManutPeriodicasHistItensCalcFields(DataSet: TDataSet);
begin
if CDManutPeriodicasHistItensEXECUTADO.AsString = 'S' then CDManutPeriodicasHistItensEXECUTADO_CHK.AsBoolean := True
else CDManutPeriodicasHistItensEXECUTADO_CHK.AsBoolean := False;
if CDManutPeriodicasHistItensBOM.AsString = 'S' then CDManutPeriodicasHistItensBOM_CHK.AsBoolean := True
else CDManutPeriodicasHistItensBOM_CHK.AsBoolean := False;
if CDManutPeriodicasHistItensREGULAR.AsString = 'S' then CDManutPeriodicasHistItensREGULAR_CHK.AsBoolean := True
else CDManutPeriodicasHistItensREGULAR_CHK.AsBoolean := False;
if CDManutPeriodicasHistItensRUIM.AsString = 'S' then CDManutPeriodicasHistItensRUIM_CHK.AsBoolean := True
else CDManutPeriodicasHistItensRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDManutPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
begin
if cDManutPeriodicasHistItensEspEXECUTADO.AsString = 'S' then cDManutPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := True
else cDManutPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := False;
if cDManutPeriodicasHistItensEspBOM.AsString = 'S' then cDManutPeriodicasHistItensEspBOM_CHK.AsBoolean := True
else cDManutPeriodicasHistItensEspBOM_CHK.AsBoolean := False;
if cDManutPeriodicasHistItensEspREGULAR.AsString = 'S' then cDManutPeriodicasHistItensEspREGULAR_CHK.AsBoolean := True
else cDManutPeriodicasHistItensEspREGULAR_CHK.AsBoolean := False;
if cDManutPeriodicasHistItensEspRUIM.AsString = 'S' then cDManutPeriodicasHistItensEspRUIM_CHK.AsBoolean := True
else cDManutPeriodicasHistItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDManutPeriodicasItensCalcFields(DataSet: TDataSet);
begin
if CDManutPeriodicasItensEXECUTADO.AsString = 'S' then CDManutPeriodicasItensEXECUTADO_CHK.AsBoolean := True
else CDManutPeriodicasItensEXECUTADO_CHK.AsBoolean := False;
if CDManutPeriodicasItensBOM.AsString = 'S' then CDManutPeriodicasItensBOM_CHK.AsBoolean := True
else CDManutPeriodicasItensBOM_CHK.AsBoolean := False;
if CDManutPeriodicasItensREGULAR.AsString = 'S' then CDManutPeriodicasItensREGULAR_CHK.AsBoolean := True
else CDManutPeriodicasItensREGULAR_CHK.AsBoolean := False;
if CDManutPeriodicasItensRUIM.AsString = 'S' then CDManutPeriodicasItensRUIM_CHK.AsBoolean := True
else CDManutPeriodicasItensRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDManutPeriodicasItensEspCalcFields(DataSet: TDataSet);
begin
if CDManutPeriodicasItensEspEXECUTADO.AsString = 'S' then CDManutPeriodicasItensEspEXECUTADO_CHK.AsBoolean := True
else CDManutPeriodicasItensEspEXECUTADO_CHK.AsBoolean := False;
if CDManutPeriodicasItensEspBOM.AsString = 'S' then CDManutPeriodicasItensEspBOM_CHK.AsBoolean := True
else CDManutPeriodicasItensEspBOM_CHK.AsBoolean := False;
if CDManutPeriodicasItensEspREGULAR.AsString = 'S' then CDManutPeriodicasItensEspREGULAR_CHK.AsBoolean := True
else CDManutPeriodicasItensEspREGULAR_CHK.AsBoolean := False;
if CDManutPeriodicasItensEspRUIM.AsString = 'S' then CDManutPeriodicasItensEspRUIM_CHK.AsBoolean := True
else CDManutPeriodicasItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDManutVencAfterGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  if FrmTelaInspVenc <> nil then
    begin
      if CMWeb.CDManutVenc.Active = True then
        FrmTelaInspVenc.TSManut.Caption := 'Manutenções ('+ IntToStr(CMWeb.CDManutVenc.RecordCount)+')';
      //FrmTelaInspVenc.TSLubrific.Caption := 'Lubrificações ('+ IntToStr(CMWeb.CDCadLubrificVenc.RecordCount)+')';
    end;
end;

procedure TCMWeb.CDManutVencCalcFields(DataSet: TDataSet);
begin
if CDManutVencDTAINICIO1.AsDateTime > 0 then
  CDManutVencC_DIASATRASO.AsInteger := DaysBetween(DateOf(CMWeb.FDataHoraServidor), DateOf(CDManutVencDTAINICIO1.AsDateTime))
else
  CDManutVencC_DIASATRASO.AsInteger := 0;
end;

procedure TCMWeb.CDMovimentacaoReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
raise Exception.Create(E.Message);
end;

procedure TCMWeb.CDOrdemServicoGerenciaAfterScroll(DataSet: TDataSet);
begin
//If CDOrdemServicoGerencia.Eof Then
//  CDOrdemServicoGerencia.GetNextPacket;

if FrmTelaCadOrdemServicoGerencia <> nil then
  with FrmTelaCadOrdemServicoGerencia do
    begin
      if CDOrdemServicoGerenciaSITUACAO.AsString = 'FECHADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'CADASTRADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'PROGRAMADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'REPROGRAMADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'DESPROGRAMADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'REALIZADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'EXECUCAO' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'LIBERADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'FECHADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'PARALISADA' then
        begin
        end;
      if  CDOrdemServicoGerenciaSITUACAO.AsString = 'CANCELADA' then
        begin
        end;
  end;
end;

procedure TCMWeb.CDOrdemServicoGerenciaCalcFields(DataSet: TDataSet);
begin
if CMWeb.CDOrdemServicoGerenciaSOLICTRAB.AsString <> EmptyStr then
  CMWeb.CDOrdemServicoGerenciaCALC_ORIGEM.AsString := 'Solicitação de Trabalho'
else
if CMWeb.CDCadOrdemServicoROTAEQUIP.AsString = 'S' then
  CMWeb.CDOrdemServicoGerenciaCALC_ORIGEM.AsString := 'Rota de Equipamentos'
else
if CMWeb.CDCadOrdemServicoMANUTPROGEQUIP.AsString <> EmptyStr then
  CMWeb.CDOrdemServicoGerenciaCALC_ORIGEM.AsString := 'Manutenção Programada'
else
if CMWeb.CDCadOrdemServicoLUBRIFICPROGEQUIP.AsString <> EmptyStr then
  CMWeb.CDOrdemServicoGerenciaCALC_ORIGEM.AsString := 'Lubrificação Programada'
else
  CMWeb.CDOrdemServicoGerenciaCALC_ORIGEM.AsString := 'Manual'
end;

procedure TCMWeb.CDParadasDiariasEquipAfterOpen(DataSet: TDataSet);
begin
CDParadasDiariasEquipParadas.Filtered := False;
CDParadasDiariasEquipParadas.Filter   := 'CODEQUIPAMENTO = '+ QuotedStr(CDParadasDiariasEquipCODIGO.AsString);
CDParadasDiariasEquipParadas.Filtered := True;
end;

procedure TCMWeb.CDRelatGerencDespEquipCalcFields(DataSet: TDataSet);
begin
CDRelatGerencDespEquipCALC_TOTAL.AsFloat := CDRelatGerencDespEquipCUSTOMOBRA.AsFloat + CDRelatGerencDespEquipCUSTORECURSOS.AsFloat + CDRelatGerencDespEquipCUSTOPECAS.AsFloat + CDRelatGerencDespEquipCUSTOEXTRAS.AsFloat + CDRelatGerencDespEquipCUSTOSECUNDARIOS.AsFloat;
end;

procedure TCMWeb.CDRelatGerencDispEquipCalcFields(DataSet: TDataSet);
begin
CMWeb.CDCadTotalEquipHora.Filtered := False;
CMWeb.CDCadTotalEquipHora.Filter   := 'CODIGO = ' + QuotedStr(CMWeb.CDRelatGerencDispEquipCODIGO.AsString);
CMWeb.CDCadTotalEquipHora.Filtered := True;

//if CMWeb.CDRelatGerencDispEquipCODIGO.AsString = 'ENV 05-003' then ShowMessage('Já');

CMWeb.FTotalHorasParadas := CMWeb.CDRelatGerencDispEquipHORASPARADASABERTAS.AsFloat + CMWeb.CDRelatGerencDispEquipHORASPARADASFECHADAS.AsFloat;  //CMWeb.HorasParadasEquipamento(CMWeb.CDRelatGerencDispEquipCODIGO.AsString, EmptyStr, EmptyStr, EmptyStr);
CMWeb.FTotalHorasFunc    := CMWeb.CDCadTotalEquipHoraHOFICIAIS.AsFloat; //CMWeb.HorasReaisTrabTotal(1, CMWeb.CDRelatGerencDispEquipCODIGO.AsString);
if CMWeb.FTotalHorasParadas > CMWeb.FTotalHorasFunc then
CMWeb.FTotalHorasParadas := CMWeb.FTotalHorasFunc;

CMWeb.CDRelatGerencDispEquipDISP.AsFloat := 100 * (CMWeb.FTotalHorasFunc - CMWeb.FTotalHorasParadas)/CMWeb.FTotalHorasFunc;
end;

procedure TCMWeb.CDRotaConsCalcFields(DataSet: TDataSet);
begin
  if FrmTelaInspConsulta <> nil then
    begin
      with FrmTelaInspConsulta do
        begin
          case CBPeriodo.ItemIndex of
            0: CDRotaConsPERIODO.AsString := 'Vencidas';
            1: CDRotaConsPERIODO.AsString := 'Próximos 7 dias';
            2: CDRotaConsPERIODO.AsString := 'Próximos 30 dias';
            3: CDRotaConsPERIODO.AsString := 'Próximos 60 dias';
            4: CDRotaConsPERIODO.AsString := 'Próximos 90 dias';
            5: CDRotaConsPERIODO.AsString := 'Próximos 180 dias';
            6: CDRotaConsPERIODO.AsString := 'Próximos 365 dias';
          end;
        end;
    end;
end;

procedure TCMWeb.CDRotaEquipVencCalcFields(DataSet: TDataSet);
begin
if CDRotaEquipVencDATAINICIO.AsDateTime > 0 then
 CDRotaEquipVencC_DIASATRASO.AsInteger := DaysBetween(DateOf(CMWeb.FDataHoraServidor), DateOf(CDRotaEquipVencDATAINICIO.AsDateTime))
else
 CDRotaEquipVencC_DIASATRASO.AsInteger := 0;
end;

procedure TCMWeb.CDRotaPeriodicasManutItensCalcFields(DataSet: TDataSet);
begin
if CDRotaPeriodicasManutItensEXECUTADO.AsString = 'S' then CDRotaPeriodicasManutItensEXECUTADO_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensEXECUTADO_CHK.AsBoolean := False;
if CDRotaPeriodicasManutItensBOM.AsString = 'S' then CDRotaPeriodicasManutItensBOM_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensBOM_CHK.AsBoolean := False;
if CDRotaPeriodicasManutItensREGULAR.AsString = 'S' then CDRotaPeriodicasManutItensREGULAR_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensREGULAR_CHK.AsBoolean := False;
if CDRotaPeriodicasManutItensRUIM.AsString = 'S' then CDRotaPeriodicasManutItensRUIM_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensRUIM_CHK.AsBoolean := False;
end;

procedure TCMWeb.CDRotaPeriodicasManutItensEspCalcFields(DataSet: TDataSet);
begin
if CDRotaPeriodicasManutItensEspEXECUTADO.AsString = 'S' then CDRotaPeriodicasManutItensEspEXECUTADO_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensEspEXECUTADO_CHK.AsBoolean := False;
if CDRotaPeriodicasManutItensEspBOM.AsString = 'S' then CDRotaPeriodicasManutItensEspBOM_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensEspBOM_CHK.AsBoolean := False;
if CDRotaPeriodicasManutItensEspREGULAR.AsString = 'S' then CDRotaPeriodicasManutItensEspREGULAR_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensEspREGULAR_CHK.AsBoolean := False;
if CDRotaPeriodicasManutItensEspRUIM.AsString = 'S' then CDRotaPeriodicasManutItensEspRUIM_CHK.AsBoolean := True
else CDRotaPeriodicasManutItensEspRUIM_CHK.AsBoolean := False;
end;

function TCMWeb.AplicarMascara(Campo,Mascara:TStringField;Form:TForm):Boolean;
var
Texto : PChar;
begin
Result := True;
Campo.EditMask := Mascara.AsString;
if Campo.EditMask = EmptyStr then
  begin
    Texto := PChar('Máscara do código: "'+Mascara.DisplayLabel+'" não encontrada, por favor, informe a respectiva formatação para poder incluir dados na tabela.');
    Application.MessageBox(Texto,'SPMP',MB_OK + MB_ICONSTOP);
    Result := False;
  end;
end;

procedure TCMWeb.ConsultarAlertas;
var
I, LAntecipar, LProlongar: SmallInt;
LVencimento : TDateTime;
begin
if FrmTelaCadAlertas <> nil then Exit;

if FrmTelaPrincipal <> nil then
  begin
    FrmTelaPrincipal.PAlertas.Font.Color := clGreen;
    if FrmTelaPrincipal.TimerLetreiro.Enabled = False then Exit;
  end;

CDCadAlertas.Close;
CDCadAlertas.Params[0].AsString := CMWeb.FCodEmpresa;
CDCadAlertas.Open;

FAlerta := EmptyStr;
if CDCadAlertas.IsEmpty = False then
  begin
    for I := 1 to CDCadAlertas.RecordCount do
      begin
        LVencimento := DateOf(CDCadAlertasVENCIMENTO.AsDateTime);
        LAntecipar  := CDCadAlertas.FieldByName('ANTECIPAR').AsInteger;
        LProlongar  := CDCadAlertas.FieldByName('PROLONGAR').AsInteger;

        if (DateOf(FDataHoraServidor) >= IncDay(LVencimento, (LAntecipar * (-1)))) and (DateOf(FDataHoraServidor) <= (IncDay(LVencimento, LProlongar))) then
          begin
            if I = 1 then
              FAlerta := FAlerta + CDCadAlertas.FieldByName('DESCRICAO').AsString + ' em '+FormatDateTime('dd/mm/yyyy', LVencimento)
            else
              FAlerta := FAlerta + '  |  ' + CDCadAlertas.FieldByName('DESCRICAO').AsString + ' em '+FormatDateTime('dd/mm/yyyy', CDCadAlertas.FieldByName('VENCIMENTO').AsDateTime)
          end;
        CDCadAlertas.Next;
      end;
  end;

CDCadAlertasOS.Close;
CDCadAlertasOS.Params.ParamByName('codempresa').AsString  := FCodEmpresa;
CDCadAlertasOS.Params.ParamByName('data1').AsString  := FormatDateTime('yyyy/mm/dd', IncMonth(CMWeb.FDataHoraServidor, -12)) + ' 00:00:00';
CDCadAlertasOS.Params.ParamByName('data2').AsString  := FormatDateTime('yyyy/mm/dd', DateOf(FDataHoraServidor)) + ' 23:59:59';
CDCadAlertasOS.Open;

if FAlerta = EmptyStr then FAlerta := 'Ordens de Serviços: CADASTRADAS = ' + FormatFloat('00', CDCadAlertasOSTOTALCAD.AsFloat)
else FAlerta := FAlerta + '  |  ' + 'Ordens de Serviços: CADASTRADAS = ' + FormatFloat('00', CDCadAlertasOSTOTALCAD.AsFloat);

if FAlerta = EmptyStr then FAlerta := 'Ordens de Serviços: PROGRAMADAS = ' + FormatFloat('00', CDCadAlertasOSTOTALPROG.AsFloat)
else FAlerta := FAlerta + '  |  ' + 'Ordens de Serviços: PROGRAMADAS = ' + FormatFloat('00', CDCadAlertasOSTOTALPROG.AsFloat);

if FAlerta = EmptyStr then FAlerta := 'Ordens de Serviços: EXECUÇÃO = ' + FormatFloat('00', CDCadAlertasOSTOTALEXEC.AsFloat)
else FAlerta := FAlerta + '  |  ' + 'Ordens de Serviços: EXECUÇÃO = ' + FormatFloat('00', CDCadAlertasOSTOTALEXEC.AsFloat);

CDCadAlertasRota.Close;
CDCadAlertasRota.Params[0].AsString   := FCodEmpresa;
CDCadAlertasRota.Params[1].AsDateTime := DateOf(FDataHoraServidor);
CDCadAlertasRota.Open;
FAlerta := FAlerta + '  |  ' + 'Rotas Vencidas = ' + FormatCurr('00', CDCadAlertasRotaTOTAL.AsInteger);

CDCadAlertasManut.Close;
CDCadAlertasManut.Params[0].AsString   := FCodEmpresa;
CDCadAlertasManut.Params[1].AsDateTime := DateOf(FDataHoraServidor);
CDCadAlertasManut.Open;
FAlerta := FAlerta + '  |  ' + 'Manutenções Vencidas = ' + FormatCurr('00', CDCadAlertasManutTOTAL.AsInteger);

CDCadAlertasLubrific.Close;
CDCadAlertasLubrific.Params[0].AsString   := FCodEmpresa;
CDCadAlertasLubrific.Params[1].AsDateTime := DateOf(FDataHoraServidor);
CDCadAlertasLubrific.Open;

FAlerta := FAlerta + '  |  ' + 'Lubrificações Vencidas = ' + FormatCurr('00', CDCadAlertasLubrificTOTAL.AsInteger);

if (CMWeb.CDUsuarioCODNIVELACESSO.AsString = 'ADU-00001') then
  begin
    if CMWeb.CDOrdemServicoGerencia.RecordCount > FTotalOS then
      begin
        Winapi.Windows.Beep(1800,100);
        Sleep(250);
        Winapi.Windows.Beep(1800,100);
        CMWeb.FTotalOS := CMWeb.CDOrdemServicoGerencia.RecordCount;
      end;
  end;

CDCadAlertas.Close;
CDCadAlertasOS.Close;
CDCadAlertasManut.Close;
CDCadAlertasLubrific.Close;
CDCadAlertasRota.Close;
end;

function TCMWeb.ConsultarCombo:String;
begin
  Try
    Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
    FrmTelaAuxiliar.Caption := CMWeb.FNomeConsulta;
    FrmTelaAuxiliar.ShowModal;
  Finally
    Result := CMWeb.FCodCombo;
    FreeAndNil(FrmTelaAuxiliar);
  End;
end;

function TCMWeb.DataFeriado(Hora:String):Boolean;
begin
Result := False;
CMWeb.CDAuxiliar.Close;
CMWeb.CDAuxiliar.CommandText := 'select dataferiado, descricao from feriados where codempresa = '+QuotedStr(CMWeb.FCodEmpresa) + ' order by descricao';
CMWeb.CDAuxiliar.Open;
CMWeb.CDAuxiliar.First;
while not CMWeb.CDAuxiliar.Eof do
  begin
    if CMWeb.CDAuxiliar.FieldByName('DATAFERIADO').AsString = Copy(Hora,1,5) then begin Result := True; Exit; end;
    CMWeb.CDAuxiliar.Next;
  end;
end;

procedure TCMWeb.DataModuleCreate(Sender: TObject);
var
i:integer;
Ini:  TIniFile;
Registro: TRegistry;
begin
if FileExists(ExtractFilePath(Application.ExeName) + 'spmp.ini') then
  begin
    Ini :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'spmp.ini');
    CMWeb.FPerfil      := Ini.ReadString( 'Perfil', 'Versão', EmptyStr);
    CMWeb.FHost        := Ini.ReadString( 'Conexao', 'SPMPService', EmptyStr);

    for i := 0 to Pred(ComponentCount) do
      begin
        If (Components[I] Is TClientDataSet) Then
          begin
            TClientDataSet(Components[I]).BeforeOpen := VerificaConexaoBanco;
            TClientDataSet(Components[I]).BeforeRefresh := VerificaConexaoBanco;
          end;
      end;

    Try
      with CMWeb.SQLConnSPMP3Web do
        begin
          Params.Values['HostName'] := CMWeb.FHost;
            if CMWeb.FPerfil = 'Local' then
              begin
                Params.Values['Port']     := '3311';
                Params.Values['CommunicationProtocol'] := 'tcp/ip';
              end
            else
              begin
                Params.Values['Port']     := '52215';
                Params.Values['CommunicationProtocol'] := 'http';
              end;
          Connected := True;
        end;
      Ini.Free;
    Except
      MessageDlg('ERRO DE CONEXÃO'+#13+'Sem conexão com o servidor, o sistema não pode ser executado!', mtError, [mbOK], 0);
      Abort;
    End;
  end
else
  begin
    Registro := TRegistry.Create;
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    if registro.OpenKey('SOFTWARE\SPMP3', true) then
      begin
        CMWeb.FPerfil      := Registro.ReadString('Versão');
        CMWeb.FHost        := Registro.ReadString('SPMPService');

        for i := 0 to Pred(ComponentCount) do
          begin
            If (Components[I] Is TClientDataSet) Then
              TClientDataSet(Components[I]).BeforeOpen := VerificaConexaoBanco;
          end;

        Try
          with CMWeb.SQLConnSPMP3Web do
            begin
              Params.Values['HostName'] := CMWeb.FHost;
                if CMWeb.FPerfil = 'Local' then
                  begin
                    Params.Values['Port']     := '3311';
                    Params.Values['CommunicationProtocol'] := 'tcp/ip';
                  end
                else
                  begin
                    Params.Values['Port']     := '52215';
                    Params.Values['CommunicationProtocol'] := 'http';
                  end;
              Connected := True;
            end;
          Registro.Free;
        Except
          MessageDlg('Sem conexão com o servidor!', mtError, [mbOK], 0);
          Abort;
        End;
      end;
  end;
end;

procedure TCMWeb.ConsultarNovoPeriodo(Combobox : TComboBox; Tempo:SmallInt);
begin
if Tempo = 1 then
  begin
    case Combobox.ItemIndex of
      0://Últimos 7 dias
        begin
          FDataConsulta1 := IncDay((DateOf(CMWeb.FDataHoraServidor)), -7);
          FDataConsulta2 := CMWeb.FDataHoraServidor;
        end;
      1://Últimos 30 dias
        begin
          FDataConsulta1 := IncDay((DateOf(CMWeb.FDataHoraServidor)), -30);
          FDataConsulta2 := CMWeb.FDataHoraServidor;
        end;
      2://Últimos 60 dias
        begin
          FDataConsulta1 := IncDay((DateOf(CMWeb.FDataHoraServidor)), -60);
          FDataConsulta2 := CMWeb.FDataHoraServidor;
        end;
      3://Últimos 90 dias
        begin
          FDataConsulta1 := IncDay((DateOf(CMWeb.FDataHoraServidor)), -90);
          FDataConsulta2 := CMWeb.FDataHoraServidor;
        end;
      4://Últimos 180 dias
        begin
          FDataConsulta1 := IncDay((DateOf(CMWeb.FDataHoraServidor)), -180);
          FDataConsulta2 := CMWeb.FDataHoraServidor;
        end;
      5://Últimos 360 dias
        begin
          FDataConsulta1 := IncDay((DateOf(CMWeb.FDataHoraServidor)), -360);
          FDataConsulta2 := CMWeb.FDataHoraServidor;
        end;
    end;
  end
else
  begin
    FDataConsulta1 := DateOf(CMWeb.FDataHoraServidor);
    case Combobox.ItemIndex of
      0://Próximos 7 dias
        begin
          FDataConsulta2 := IncDay((DateOf(CMWeb.FDataHoraServidor)), 7);
        end;
      1://Próximos 30 dias
        begin
          FDataConsulta2 := IncDay((DateOf(CMWeb.FDataHoraServidor)), 30);
        end;
      2://Próximos 60 dias
        begin
          FDataConsulta2 := IncDay((DateOf(CMWeb.FDataHoraServidor)), 60);
        end;
      3://Próximos 90 dias
        begin
          FDataConsulta2 := IncDay((DateOf(CMWeb.FDataHoraServidor)), 90);
        end;
      4://Próximos 180 dias
        begin
          FDataConsulta2 := IncDay((DateOf(CMWeb.FDataHoraServidor)), 180);
        end;
      5://Próximos 360 dias
        begin
          FDataConsulta2 := IncDay((DateOf(CMWeb.FDataHoraServidor)), 360);
        end;
    end;
  end;

FDataConsulta2 := IncMinute(CMWeb.FDataConsulta2, 1439);
end;


procedure TCMWeb.CliqueNoTitulo(Column: TColumn; ClientDataSet: TClientDataSet);
var
  strColumn: string;
  x: integer;
  JaEstaEmUso: Boolean;
  idOptions: TIndexOptions;
  dbgrGrid: TDbGrid;
begin
dbgrGrid := TDbGrid(Column.Grid);
with dbgrGrid.DataSource.DataSet do
  begin
    strColumn := INDICE_DEFAULT;

    { Se for um campo calculado não faz nada }
    if (Column.Field.FieldKind = fkCalculated) or (Column.Field.DataType in [ftBlob, ftMemo]) then
      Exit;

    {Verifica se o índice já está em uso}
    JaEstaEmUso := Column.Field.FieldName = ClientDataSet.IndexName;

    {Verifica a existência do índice e suas propriedades}
    ClientDataSet.IndexDefs.Update;
    for x := 0 to ClientDataSet.IndexDefs.Count - 1 do
      begin
        if ClientDataSet.IndexDefs.Items[x].Name = Column.Field.FieldName then
          begin
            strColumn := Column.Field.FieldName;
            {Determina como deve ser criado o índice(ASC or DESC), inverte a condição ixDescending}
            if ixDescending in ClientDataSet.IndexDefs.Items[x].Options then
              idOptions := []
            else
              idOptions := [ixDescending]
            {endif};
          end
        {endif};
      end;

    {Se não encontrou o índice ou o índice já está em uso}
    if (strColumn = INDICE_DEFAULT ) or JaEstaEmUso then
      begin
        if JaEstaEmUso then
          ClientDataSet.DeleteIndex(Column.Field.FieldName)
        {endif};

        try
          ClientDataSet.AddIndex(Column.Field.FieldName, Column.Field.FieldName, idOptions, EmptyStr, EmptyStr, 0);
          strColumn := Column.Field.FieldName;
        except
          {O índice está indeterminado, então é passado para o índice padrão}
          if JaEstaEmUso then
            strColumn := INDICE_DEFAULT
          {endif};
        end;
      end
    {endif};

    try
      ClientDataSet.IndexName := strColumn;
    except
      ClientDataSet.IndexName := INDICE_DEFAULT;
    end;

    Column.Title.Color := GRID_COR_INDICE_TITULO;
  end;

  VoltaConfig_Titulo( dbgrGrid, Column.Index );
end;

{ Volta a cor inicial do título das colunas, menos a coluna que está com o
  índice  }
procedure TCMWeb.VoltaConfig_Titulo(DBGrid: TDBGrid; Indice: integer = -1);
var
  x: integer;
begin
  with DBGrid do
    begin
      for x := 0 to Columns.Count - 1 do
        begin
          if  Columns[x].Visible and ( x <> Indice ) and ( Columns[x].Title.Color = GRID_COR_INDICE_TITULO ) then
            Columns[x].Title.Color := clBtnFace
        {endif};
        end;
    end;
end;

function TCMWeb.LoadJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string): Boolean;
var
  JPEGImage: TJPEGImage;
begin
Result := True;
  if (FileName = EmptyStr) then    // No FileName so nothing
    Result := False  //to load - return False...
  else
  begin
    try  // Start of try except
      JPEGImage := TJPEGImage.Create;  // Create the JPEG image... try  // now
      try  // to load the file but
        JPEGImage.LoadFromFile(FilePath + FileName);
        // might fail...with an Exception.
        Bitmap.Assign(JPEGImage);
        SaveJPEGPictureFile(Bitmap, FilePath, filename, 50);
        // Assign the image to our bitmap.Result := True;
        // Got it so return True.
      finally
        JPEGImage.Free;  // ...must get rid of the JPEG image. finally
      end; {try}
    except
      Result := False; // Oops...never Loaded, so return False.
    end; {try}
  end; {if}
end; {LoadJPEGPictureFile}

procedure TCMWeb.ExibeFoto(DataSet : TDataSet; BlobFieldName: String; ImageExibicao: TImage);
var
MemoryStream: TMemoryStream;
jpg: TJpegImage;
png: TPNGImage;
begin
MemoryStream := TMemoryStream.Create;
if not(DataSet.IsEmpty) and not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
  try
    if DataSet <> CMWeb.CDCadPneusChassiImagens then
      begin
        jpg := TJpegImage.Create;
        (DataSet.FieldByName(BlobFieldName) as TBlobField).SaveToStream(MemoryStream);
        MemoryStream.Position := OffsetMemoryStream;
        Jpg.LoadFromStream(MemoryStream);
        ImageExibicao.Picture.Assign(Jpg);
      end
    else
      begin
        png := TPngImage.Create;
        (DataSet.FieldByName(BlobFieldName) as TBlobField).SaveToStream(MemoryStream);
        MemoryStream.Position := OffsetMemoryStream;
        png.LoadFromStream(MemoryStream);
        ImageExibicao.Picture.Assign(png);
      end;
  finally
    //Jpg.Free;
  end
else
  ImageExibicao.Picture := nil;
MemoryStream.Free;
end;

procedure TCMWeb.SetJPGCompression(ACompression: integer; const AInFile: string; const AOutFile: string);
var
  iCompression: integer;
  oJPG: TJPegImage;
  oBMP: TBitMap;
begin
  { Forcar a Compressião para a faixa entre 1..100 }
  iCompression := abs(ACompression);
  if iCompression = 0 then
    iCompression := 1;
  if iCompression > 100 then
    iCompression := 100;

  { Cria as classes de trabalho Jpeg e Bmp }
  oJPG := TJPegImage.Create;
  oJPG.LoadFromFile(AInFile);
  oBMP := TBitMap.Create;
  oBMP.Assign(oJPG);

  { Fazer a Compressão e salva o novo arquivo }
  oJPG.CompressionQuality := iCompression;
  oJPG.Compress;
  oJPG.SaveToFile(AOutFile);

  { Limpar }
  oJPG.Free;
  oBMP.Free;
end;

function TCMWeb.JpgToBmp(cImage: String): Boolean;
var MyJPEG : TJPEGImage; MyBMP : TBitmap;
begin
  Result := False;
  if fileExists(cImage) then
  begin
    MyJPEG := TJPEGImage.Create;
    with MyJPEG do
    begin
      try
        LoadFromFile(cImage);
        MyBMP := TBitmap.Create;
        with MyBMP do
        begin
          Width := MyJPEG.Width;
          Height := MyJPEG.Height;
          Canvas.Draw(0,0,MyJPEG);
          SaveToFile('C:\SPMP3\Temp.bmp');
          Free;
          Result := True;
        end;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TCMWeb.SQLConnSPMP3WebAfterConnect(Sender: TObject);
begin
if FrmTelaPrincipal <> nil then
  if FrmTelaPrincipal.TimerAlertas.Enabled = False then
    FrmTelaPrincipal.TimerAlertas.Enabled := True;
end;

function TCMWeb.SaveJPEGPictureFile(Bitmap: TBitmap; FilePath, FileName: string; Quality: Integer): Boolean;
begin
  Result := True;
  try
    if ForceDirectories(FilePath) then
    begin
      with TJPegImage.Create do
      begin
        try
          Assign(Bitmap);
          CompressionQuality := Quality;
          SaveToFile('C:\SPMP3\Temp.jpg');
        finally
          Free;
        end; {try}
      end; {with}
    end; {if}
  except
    raise;
    Result := False;
  end; {try}
end; {SaveJPEGPictureFile}

function TCMWeb.VerificarInspecoes: Boolean;
begin
Result := False;

CMWeb.FModulo := 'Inspeções Vencidas';

CDManutVenc.Close;
CDManutVenc.Params.ParamByName('codempresa').AsString := CMWeb.FCodEmpresa;
CDManutVenc.Params.ParamByName('DATA').AsString       := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
CDManutVenc.Open;

CDLubrificVenc.Close;
CDLubrificVenc.Params.ParamByName('codempresa').AsString := CMWeb.FCodEmpresa;
CDLubrificVenc.Params.ParamByName('DATA').AsString       := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
CDLubrificVenc.Open;

if CMWeb.FEmpTransf = True then
  begin
    CDRotaEquipVenc.Close;
    CDRotaEquipVenc.Params.ParamByName('codempresa').AsString := CMWeb.FCodEmpresa;
    CDRotaEquipVenc.Params.ParamByName('DATA').AsString       := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
    CDRotaEquipVenc.Open;
  end;

  if (CMWeb.CDManutVenc.IsEmpty = False) or (CMWeb.CDLubrificVenc.IsEmpty = False) or (CMWeb.CDRotaEquipVenc.IsEmpty = False) then
    begin
      Try
        Application.CreateForm(TFrmTelaInspVenc, FrmTelaInspVenc);
        FrmTelaInspVenc.TSManut.Caption := 'Manutenções ('+ IntToStr(CMWeb.CDManutVenc.RecordCount)+')';
        FrmTelaInspVenc.TSLubrific.Caption := 'Lubrificações ('+ IntToStr(CMWeb.CDLubrificVenc.RecordCount)+')';
        if CMWeb.FEmpTransf = True then
          begin
            FrmTelaInspVenc.TSRotas.Caption := 'Rotas ('+ IntToStr(CMWeb.CDRotaEquipVenc.RecordCount)+')';
          end;
        FrmTelaInspVenc.ShowModal;
      Finally
        FreeAndNil(FrmTelaInspVenc);
      End;
    end;
end;

function TCMWeb.HistoricoInspecoes(Tipo:SmallInt; Codigo, Descricao, CodFamilia, Reprogramar, Frequencia, CodEquip, DataInicio, CodMonit: String): Boolean;
var
LIndice: Integer;
begin
Result := False;

case Tipo of
  0:
    begin
      CMWeb.CDManutPeriodicas.Open;
      CMWeb.CDManutPeriodicas.Append;
      CMWeb.CDManutPeriodicasCODIGO.AsString               := Codigo;
      CMWeb.CDManutPeriodicasCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
      CMWeb.CDManutPeriodicasDESCRICAO.AsString            := Descricao;
      CMWeb.CDManutPeriodicasCODMANUTPROGFAMEQUIP.AsString := CodFamilia;
      CMWeb.CDManutPeriodicasREPROGRAMAR1.AsString         := Reprogramar;
      CMWeb.CDManutPeriodicasFREQUENCIA1.AsString          := Frequencia;
      CMWeb.CDManutPeriodicasCODEQUIPAMENTO.AsString       := CodEquip;
      CMWeb.CDManutPeriodicasDTAINICIO1.AsString           := DataInicio;
      CMWeb.CDManutPeriodicasCODORDEMSERVICO.AsInteger     := CMWeb.FCodOrdemServico;
      CMWeb.CDManutPeriodicasCODMONITORAMENTO.AsString     := CodMonit;
      CMWeb.CDManutPeriodicasSITUACAO.AsString             := 'ABERTA';
      CMWeb.CDManutPeriodicasREALIZADA.AsString            := 'N'; CMWeb.CDManutPeriodicasGEROUOS.AsString              := 'S';
      CMWeb.CDManutPeriodicasGRUPOINSP.AsString            := 'N'; CMWeb.CDManutPeriodicasRELATORIO.AsString            := 'S';

      LIndice := CMWeb.SMClient.RetornaProximoIndice('manutprogequipamentohist');
      CMWeb.CDManutPeriodicasINDICE.AsInteger := LIndice;
      CMWeb.CDManutPeriodicas.ApplyUpdates(0);
      //CMWeb.CDCadManutPeriodicas.Refresh;

      if CMWeb.CDCadManutProgEquip.IsEmpty = False then
        begin
          CMWeb.CDCadManutProgEquipItens.First;
          CMWeb.CDCadManutProgEquipItensEsp.First;

          CMWeb.CDManutPeriodicasItens.Open;
          CMWeb.CDManutPeriodicasItensEsp.Open;

          while not CMWeb.CDCadManutProgEquipItens.Eof = True do
            begin
              CMWeb.CDManutPeriodicasItens.Append;
              CMWeb.CDManutPeriodicasItensINDICE.AsInteger              := CMWeb.CDCadManutProgEquipItens.RecNo;
              //CMWeb.CDManutPeriodicasItensCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
              //CMWeb.CDManutPeriodicasItensHISTORICO.AsInteger           := LIndice;
              CMWeb.CDManutPeriodicasItensCODIGO.AsString               := CMWeb.CDCadManutProgEquipItensCODIGO.AsString;
              CMWeb.CDManutPeriodicasItensCODMANUTPROGEQUIP.AsString    := CMWeb.CDCadManutProgEquipCODIGO.AsString;
              CMWeb.CDManutPeriodicasItensCODPARTE.AsString             := CMWeb.CDCadManutProgEquipItensCODPARTE.AsString;
              CMWeb.CDManutPeriodicasItensITEM.AsString                 := CMWeb.CDCadManutProgEquipItensITEM.AsString;
              CMWeb.CDManutPeriodicasItensDESCINSPECAO.AsString         := CMWeb.CDCadManutProgEquipItensDESCINSPECAO.AsString;
              CMWeb.CDManutPeriodicasItensEQUIPPARADO.AsString          := CMWeb.CDCadManutProgEquipItensEQUIPPARADO.AsString;
              CMWeb.CDManutPeriodicasItensTEMPO.AsFloat                 := CMWeb.CDCadManutProgEquipItensTEMPO.AsFloat;
              CMWeb.CDManutPeriodicasItensEXECAUTONOMO.AsString         := CMWeb.CDCadManutProgEquipItensEXECAUTONOMO.AsString;
              CMWeb.CDManutPeriodicasItensEXECUTADO.AsString            := 'N';
              CMWeb.CDManutPeriodicasItensBOM.AsString                  := 'N';
              CMWeb.CDManutPeriodicasItensREGULAR.AsString              := 'N';
              CMWeb.CDManutPeriodicasItensRUIM.AsString                 := 'N';
              CMWeb.CDManutPeriodicasItens.Post;

              CMWeb.CDCadManutProgEquipItens.Next;
            end;


          while not CMWeb.CDCadManutProgEquipItensEsp.Eof = True do
            begin
              CMWeb.CDManutPeriodicasItensEsp.Append;
              CMWeb.CDManutPeriodicasItensEspCODEMPRESA.AsString        := CMWeb.FCodEmpresa;
              CMWeb.CDManutPeriodicasItensEspHISTORICO.AsInteger        := CMWeb.CDManutPeriodicasINDICE.AsInteger;
              CMWeb.CDManutPeriodicasItensEspCODIGO.AsString            := CMWeb.CDCadManutProgEquipItensEspCODIGO.AsString;
              CMWeb.CDManutPeriodicasItensEspCODMANUTPROGEQUIP.AsString := CMWeb.CDCadManutProgEquipCODIGO.AsString;
              CMWeb.CDManutPeriodicasItensEspCODPARTE.AsString          := CMWeb.CDCadManutProgEquipItensEspCODPARTE.AsString;
              CMWeb.CDManutPeriodicasItensEspITEM.AsString              := CMWeb.CDCadManutProgEquipItensEspITEM.AsString;
              CMWeb.CDManutPeriodicasItensEspDESCINSPECAO.AsString      := CMWeb.CDCadManutProgEquipItensEspDESCINSPECAO.AsString;
              CMWeb.CDManutPeriodicasItensEspEQUIPPARADO.AsString       := CMWeb.CDCadManutProgEquipItensEspEQUIPPARADO.AsString;
              CMWeb.CDManutPeriodicasItensEspTEMPO.AsString             := CMWeb.CDCadManutProgEquipItensEspTEMPO.AsString;
              CMWeb.CDManutPeriodicasItensEspEXECAUTONOMO.AsString      := CMWeb.CDCadManutProgEquipItensEspEXECAUTONOMO.AsString;
              CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString         := 'N'; CMWeb.CDManutPeriodicasItensEspBOM.AsString  := 'N';
              CMWeb.CDManutPeriodicasItensEspREGULAR.AsString           := 'N'; CMWeb.CDManutPeriodicasItensEspRUIM.AsString := 'N';
              CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);

              CMWeb.CDCadManutProgEquipItensEsp.Next;
            end;
        end;

      //CMWeb.CDCadManutPeriodicas.Close;
      //CMWeb.CDCadManutPeriodicasItens.Close;
      //CMWeb.CDCadManutPeriodicasItensEsp.Close;
      CMWeb.CDCadManutProgEquip.Close;
      CMWeb.CDCadManutProgEquipItens.Close;
      CMWeb.CDCadManutProgEquipItensEsp.Close;
    end;
  1:
    begin
      CMWeb.CDLubrificPeriodicas.Open;
      CMWeb.CDLubrificPeriodicas.Append;
      CMWeb.CDLubrificPeriodicasCODIGO.AsString                  := Codigo;
      CMWeb.CDLubrificPeriodicasCODEMPRESA.AsString              := CMWeb.FCodEmpresa;
      CMWeb.CDLubrificPeriodicasDESCRICAO.AsString               := Descricao;
      CMWeb.CDLubrificPeriodicasCODLUBRIFICPROGFAMEQUIP.AsString := CodFamilia;
      CMWeb.CDLubrificPeriodicasREPROGRAMAR1.AsString            := Reprogramar;
      CMWeb.CDLubrificPeriodicasFREQUENCIA1.AsString             := Frequencia;
      CMWeb.CDLubrificPeriodicasCODEQUIPAMENTO.AsString          := CodEquip;
      CMWeb.CDLubrificPeriodicasDTAINICIO1.AsString              := DataInicio;
      CMWeb.CDLubrificPeriodicasCODORDEMSERVICO.AsInteger        := CMWeb.FCodOrdemServico;
      CMWeb.CDLubrificPeriodicasCODMONITORAMENTO.AsString        := CodMonit;
      CMWeb.CDLubrificPeriodicasSITUACAO.AsString                := 'ABERTA';
      CMWeb.CDLubrificPeriodicasREALIZADA.AsString               := 'N'; CMWeb.CDLubrificPeriodicasGEROUOS.AsString   := 'S';
      CMWeb.CDLubrificPeriodicasGRUPOINSP.AsString               := 'N'; CMWeb.CDLubrificPeriodicasRELATORIO.AsString := 'S';

      LIndice := CMWeb.SMClient.RetornaProximoIndice('lubrificprogequipamentohist');
      CMWeb.CDLubrificPeriodicas.ApplyUpdates(0);
      //CMWeb.CDCadLubrificPeriodicas.Refresh;

      if CMWeb.CDCadLubrificProgEquip.IsEmpty = False then
        begin
          CMWeb.CDLubrificPeriodicasItens.Open;
          CMWeb.CDLubrificPeriodicasItensEsp.Open;

          while not CMWeb.CDCadLubrificProgEquipItens.Eof = True do
            begin
              CMWeb.CDLubrificPeriodicasItens.Append;
              CMWeb.CDLubrificPeriodicasItensCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
              CMWeb.CDLubrificPeriodicasItensHISTORICO.AsInteger           := LIndice;
              CMWeb.CDLubrificPeriodicasItensCODIGO.AsString               := CMWeb.CDCadLubrificProgEquipItensCODIGO.AsString;
              CMWeb.CDLubrificPeriodicasItensCODLUBRIFICPROGEQUIP.AsString := CMWeb.CDCadLubrificProgEquipCODIGO.AsString;
              CMWeb.CDLubrificPeriodicasItensCODPARTE.AsString             := CMWeb.CDCadLubrificProgEquipItensCODPARTE.AsString;
              CMWeb.CDLubrificPeriodicasItensITEM.AsString                 := CMWeb.CDCadLubrificProgEquipItensITEM.AsString;
              CMWeb.CDLubrificPeriodicasItensDESCINSPECAO.AsString         := CMWeb.CDCadLubrificProgEquipItensDESCINSPECAO.AsString;
              CMWeb.CDLubrificPeriodicasItensEQUIPPARADO.AsString          := CMWeb.CDCadLubrificProgEquipItensEQUIPPARADO.AsString;
              CMWeb.CDLubrificPeriodicasItensTEMPO.AsString                := CMWeb.CDCadLubrificProgEquipItensTEMPO.AsString;
              CMWeb.CDLubrificPeriodicasItensEXECAUTONOMO.AsString         := CMWeb.CDCadLubrificProgEquipItensEXECAUTONOMO.AsString;
              CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString            := 'N'; CMWeb.CDLubrificPeriodicasItensBOM.AsString  := 'N';
              CMWeb.CDLubrificPeriodicasItensREGULAR.AsString              := 'N'; CMWeb.CDLubrificPeriodicasItensRUIM.AsString := 'N';
              CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);

              CMWeb.CDCadLubrificProgEquipItens.Next;
            end;

          while not CMWeb.CDCadLubrificProgEquipItensEsp.Eof = True do
            begin
              CMWeb.CDLubrificPeriodicasItensEsp.Append;
              //CMWeb.CDCadLubrificPeriodicasItensEspINDICE.AsInteger           := CMWeb.SMClient.GerarSequencia('LUBRIFICPROGEQUIPHISTITENSESP_S');
              CMWeb.CDLubrificPeriodicasItensEspCODEMPRESA.AsString        := CMWeb.FCodEmpresa;
              CMWeb.CDLubrificPeriodicasItensEspHISTORICO.AsInteger        := CMWeb.CDLubrificPeriodicasINDICE.AsInteger;
              CMWeb.CDLubrificPeriodicasItensEspCODIGO.AsString            := CMWeb.CDCadLubrificProgEquipItensEspCODIGO.AsString;
              CMWeb.CDLubrificPeriodicasItensEspCODLUBRIFICPROGEQUIP.AsString := CMWeb.CDCadLubrificProgEquipCODIGO.AsString;
              CMWeb.CDLubrificPeriodicasItensEspCODPARTE.AsString          := CMWeb.CDCadLubrificProgEquipItensEspCODPARTE.AsString;
              CMWeb.CDLubrificPeriodicasItensEspITEM.AsString              := CMWeb.CDCadLubrificProgEquipItensEspITEM.AsString;
              CMWeb.CDLubrificPeriodicasItensEspDESCINSPECAO.AsString      := CMWeb.CDCadLubrificProgEquipItensEspDESCINSPECAO.AsString;
              CMWeb.CDLubrificPeriodicasItensEspEQUIPPARADO.AsString       := CMWeb.CDCadLubrificProgEquipItensEspEQUIPPARADO.AsString;
              CMWeb.CDLubrificPeriodicasItensEspTEMPO.AsString             := CMWeb.CDCadLubrificProgEquipItensEspTEMPO.AsString;
              CMWeb.CDLubrificPeriodicasItensEspEXECAUTONOMO.AsString      := CMWeb.CDCadLubrificProgEquipItensEspEXECAUTONOMO.AsString;
              CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString         := 'N'; CMWeb.CDLubrificPeriodicasItensEspBOM.AsString  := 'N';
              CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString           := 'N'; CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString := 'N';
              CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);

              CMWeb.CDCadLubrificProgEquipItensEsp.Next;
            end;
        end;

      CMWeb.CDLubrificPeriodicas.Close;
      CMWeb.CDLubrificPeriodicasItens.Close;
      CMWeb.CDLubrificPeriodicasItensEsp.Close;
      CMWeb.CDCadLubrificProgEquip.Close;
      CMWeb.CDCadLubrificProgEquipItens.Close;
      CMWeb.CDCadLubrificProgEquipItensEsp.Close;
    end;
  2:
    begin
      CMWeb.CDManutPeriodicas.Open;
      CMWeb.CDManutPeriodicasItens.Open;
      CMWeb.CDManutPeriodicasItensEsp.Open;

      CMWeb.CDCadRotasSequencia.First;
      while not CMWeb.CDCadRotasSequencia.Eof = True do
        begin
          CMWeb.CDCadRotasSequenciaInsp.First;
          while not CMWeb.CDCadRotasSequenciaInsp.Eof = True do
            begin
              CMWeb.CDManutPeriodicas.Append;
              CMWeb.CDManutPeriodicasCODIGO.AsString               := Codigo;
              CMWeb.CDManutPeriodicasCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
              CMWeb.CDManutPeriodicasDESCRICAO.AsString            := Descricao;
              CMWeb.CDManutPeriodicasCODMANUTPROGFAMEQUIP.AsString := CodFamilia;
              CMWeb.CDManutPeriodicasREPROGRAMAR1.AsString         := Reprogramar;
              CMWeb.CDManutPeriodicasFREQUENCIA1.AsString          := Frequencia;
              CMWeb.CDManutPeriodicasCODEQUIPAMENTO.AsString       := CodEquip;
              CMWeb.CDManutPeriodicasDTAINICIO1.AsString           := DataInicio;
              CMWeb.CDManutPeriodicasCODORDEMSERVICO.AsInteger     := CMWeb.FCodOrdemServico;
              CMWeb.CDManutPeriodicasCODMONITORAMENTO.AsString     := CodMonit;
              CMWeb.CDManutPeriodicasSITUACAO.AsString             := 'ABERTA';
              CMWeb.CDManutPeriodicasREALIZADA.AsString            := 'N'; CMWeb.CDManutPeriodicasGEROUOS.AsString   := 'S';
              CMWeb.CDManutPeriodicasGRUPOINSP.AsString            := 'S'; CMWeb.CDManutPeriodicasRELATORIO.AsString := 'S';


              LIndice := CMWeb.SMClient.RetornaProximoIndice('manutprogequipamentohist');
              CMWeb.CDManutPeriodicas.ApplyUpdates(0);
              //CMWeb.CDCadManutPeriodicas.Refresh;

              CMWeb.CDCadRotasSequenciaInspItens.First;
              while not CMWeb.CDCadRotasSequenciaInspItens.Eof = True do
                begin
                  CMWeb.CDManutPeriodicasItens.Append;
                  //CMWeb.CDCadManutPeriodicasItensINDICE.AsInteger              := CMWeb.SMClient.GerarSequencia('MANUTPROGEQUIPHISTITENS_S');
                  CMWeb.CDManutPeriodicasItensCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
                  CMWeb.CDManutPeriodicasItensHISTORICO.AsInteger           := LIndice;
                  CMWeb.CDManutPeriodicasItensCODIGO.AsString               := CMWeb.CDCadRotasSequenciaInspItensCODIGO.AsString;
                  CMWeb.CDManutPeriodicasItensCODMANUTPROGEQUIP.AsString    := CMWeb.CDCadRotasCODIGO.AsString;
                  CMWeb.CDManutPeriodicasItensCODPARTE.AsString             := CMWeb.CDCadRotasSequenciaInspItensCODPARTE.AsString;
                  CMWeb.CDManutPeriodicasItensITEM.AsString                 := CMWeb.CDCadRotasSequenciaInspItensITEM.AsString;
                  CMWeb.CDManutPeriodicasItensDESCINSPECAO.AsString         := CMWeb.CDCadRotasSequenciaInspItensDESCINSPECAO.AsString;
                  CMWeb.CDManutPeriodicasItensEQUIPPARADO.AsString          := CMWeb.CDCadRotasSequenciaInspItensEQUIPPARADO.AsString;
                  CMWeb.CDManutPeriodicasItensTEMPO.AsString                := CMWeb.CDCadRotasSequenciaInspItensTEMPO.AsString;
                  CMWeb.CDManutPeriodicasItensEXECAUTONOMO.AsString         := CMWeb.CDCadRotasSequenciaInspItensEXECAUTONOMO.AsString;
                  CMWeb.CDManutPeriodicasItensEXECUTADO.AsString            := 'N'; CMWeb.CDManutPeriodicasItensBOM.AsString  := 'N';
                  CMWeb.CDManutPeriodicasItensREGULAR.AsString              := 'N'; CMWeb.CDManutPeriodicasItensRUIM.AsString := 'N';
                  CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);

                  CMWeb.CDCadRotasSequenciaInspItens.Next;
                end;

              CMWeb.CDCadRotasSequenciaInspItensEsp.First;
              while not CMWeb.CDCadRotasSequenciaInspItensEsp.Eof = True do
                begin
                  CMWeb.CDManutPeriodicasItensEsp.Append;
                  //CMWeb.CDCadManutPeriodicasItensEspINDICE.AsInteger              := CMWeb.SMClient.GerarSequencia('MANUTPROGEQUIPHISTITENSESP_S');
                  CMWeb.CDManutPeriodicasItensEspCODEMPRESA.AsString           := CMWeb.FCodEmpresa;
                  CMWeb.CDManutPeriodicasItensEspHISTORICO.AsInteger           := CMWeb.CDManutPeriodicasINDICE.AsInteger;
                  CMWeb.CDManutPeriodicasItensEspCODIGO.AsString               := CMWeb.CDCadRotasSequenciaInspItensEspCODIGO.AsString;
                  CMWeb.CDManutPeriodicasItensEspCODMANUTPROGEQUIP.AsString    := CMWeb.CDCadRotasCODIGO.AsString;
                  CMWeb.CDManutPeriodicasItensEspCODPARTE.AsString             := CMWeb.CDCadRotasSequenciaInspItensEspCODPARTE.AsString;
                  CMWeb.CDManutPeriodicasItensEspITEM.AsString                 := CMWeb.CDCadRotasSequenciaInspItensEspITEM.AsString;
                  CMWeb.CDManutPeriodicasItensEspDESCINSPECAO.AsString         := CMWeb.CDCadRotasSequenciaInspItensEspDESCINSPECAO.AsString;
                  CMWeb.CDManutPeriodicasItensEspEQUIPPARADO.AsString          := CMWeb.CDCadRotasSequenciaInspItensEspEQUIPPARADO.AsString;
                  CMWeb.CDManutPeriodicasItensEspTEMPO.AsString                := CMWeb.CDCadRotasSequenciaInspItensEspTEMPO.AsString;
                  CMWeb.CDManutPeriodicasItensEspEXECAUTONOMO.AsString         := CMWeb.CDCadRotasSequenciaInspItensEspEXECAUTONOMO.AsString;
                  CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString            := 'N'; CMWeb.CDManutPeriodicasItensEspBOM.AsString  := 'N';
                  CMWeb.CDManutPeriodicasItensEspREGULAR.AsString              := 'N'; CMWeb.CDManutPeriodicasItensEspRUIM.AsString := 'N';
                  CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);

                  CMWeb.CDCadRotasSequenciaInspItensEsp.Next;
                end;

              CMWeb.CDCadRotasSequenciaInsp.Next;
            end;

          CMWeb.CDCadRotasSequencia.Next;
        end;

      //CMWeb.CDCadManutPeriodicas.Close;
      //CMWeb.CDCadManutPeriodicasItens.Close;
      //CMWeb.CDCadManutPeriodicasItensEsp.Close;
      CMWeb.CDCadRotasSequenciaInspItensEsp.Close;
      CMWeb.CDCadRotasSequenciaInspItens.Close;
      CMWeb.CDCadRotasSequenciaInsp.Close;
      CMWeb.CDCadRotasSequencia.Close;
      CMWeb.CDCadRotas.Close;
    end;
end;

end;

function TCMWeb.AnalisarImportancia:SmallInt;
Begin
Result := 0;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Emergência' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 18;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Emergência' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 17;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Emergência' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 16;

if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 12 hs' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 15;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 12 hs' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 14;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 12 hs' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 13;

if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 72 hs' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 12;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 72 hs' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 11;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 72 hs' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 10;

if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Semana' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 9;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Semana' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 8;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Semana' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 7;

if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Mês' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 6;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Mês' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 5;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Mês' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 4;

if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Acima de um mês' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 3;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Acima de um mês' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 2;
if Trim(CDCadOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Acima de um mês' then
  if Trim(CDCadOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 1;
End;

function TCMWeb.XlsToStringGrid(xStringGrid: TStringGrid; xFileXLS: string): Boolean;
 const
   xlCellTypeLastCell = $0000000B;
 var
   XLSAplicacao, AbaXLS: OLEVariant;
   RangeMatrix: Variant;
   x, y, k, r: Integer;
 begin
   Result := False;
   // Cria Excel- OLE Object
   XLSAplicacao := CreateOleObject('Excel.Application');
   try
     // Esconde Excel
     XLSAplicacao.Visible := False;
     // Abre o Workbook
     XLSAplicacao.Workbooks.Open(xFileXLS);

     //Selecione aqui a aba que você deseja abrir primeiro - 1,2,3,4....
     XLSAplicacao.WorkSheets[1].Activate;

     //Selecione aqui a aba que você deseja ativar - começando sempre no 1
     AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(xFileXLS)].WorkSheets[1];
     AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
     // Pegar o número da última linha
     x := XLSAplicacao.ActiveCell.Row;
     // Pegar o número da última coluna
     y := XLSAplicacao.ActiveCell.Column;
     // Seta xStringGrid linha e coluna
     XStringGrid.RowCount := x;
     XStringGrid.ColCount := y;
     // Associaca a variant WorkSheet com a variant do Delphi
     RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
     // Cria o loop para listar os registros no TStringGrid
     k := 1;
     repeat
       for r := 1 to y do
         XStringGrid.Cells[(r - 1), (k - 1)] := RangeMatrix[k, r];
       Inc(k, 1);
     until k > x;
     RangeMatrix := Unassigned;
   finally
     // Fecha o Microsoft Excel
     if not VarIsEmpty(XLSAplicacao) then
     begin
       XLSAplicacao.Quit;
       XLSAplicacao := Unassigned;
       AbaXLS := Unassigned;
       Result := True;
     end;
   end;
 end;

function TCMWeb.converter_ponto(valor_com_virgula: string): string;
var
  i: integer;
begin
  for i := 1 to Length(valor_com_virgula) do
    if valor_com_virgula[i] = '.' then
      valor_com_virgula[i] := ',';
  result := valor_com_virgula;
end;

procedure TCMWeb.MSGAguarde(strTexto: String = ''; boolAguarde: Boolean = true);
begin
  if boolAguarde = True then
    begin
      Application.CreateForm(TFrmTelaAguarde, FrmTelaAguarde);
      FrmTelaAguarde.Show;
      FrmTelaAguarde.Repaint;
    end
  else
    begin
      FreeAndNil(FrmTelaAguarde);
    end;
end;

end.

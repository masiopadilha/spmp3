unit UnDmRelatorios;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxRich, frxDMPExport,  frxExportBaseDialog, frxExportCSV, frxExportText,
  frxExportXLSX, frxExportPDF, frxExportMail;

type
  TDmRelatorios = class(TDataModule)
    frxDBAbastecimentosGeral: TfrxDBDataset;
    frxDBAbastecimentosIndividual: TfrxDBDataset;
    frxDBAbastecimentosIndividualCombust: TfrxDBDataset;
    frxDBAbastecimentosIndividualCombustAbast: TfrxDBDataset;
    frxDBAbastecimentosIndividualCombustLubrific: TfrxDBDataset;
    frxDBAbastecimentosIndividualLubrific: TfrxDBDataset;
    frxDBAlmoxarifado: TfrxDBDataset;
    frxDBAreas: TfrxDBDataset;
    frxDBArqTecnicoGeral: TfrxDBDataset;
    frxDBArqTecnicoIndividual: TfrxDBDataset;
    frxDBCalendEquip: TfrxDBDataset;
    frxDBCalendMObra: TfrxDBDataset;
    frxDBCargos: TfrxDBDataset;
    frxDBCausaFalha: TfrxDBDataset;
    frxDBCentroCusto: TfrxDBDataset;
    frxDBClasses: TfrxDBDataset;
    frxDBContadores: TfrxDBDataset;
    frxDBDesTecnicoGeral: TfrxDBDataset;
    frxDBDesTecnicoIndividual: TfrxDBDataset;
    frxDBDespMensalDiversasGeral: TfrxDBDataset;
    frxDBDespMensalDiversasIndividual: TfrxDBDataset;
    frxDBDespMensalFuncIndividual: TfrxDBDataset;
    frxDBDespMensalFuncPerGeral: TfrxDBDataset;
    frxDBDespMensalFuncPerIndividual: TfrxDBDataset;
    frxDBDespMensalManutGeral: TfrxDBDataset;
    frxDBDespMensalManutIndividual: TfrxDBDataset;
    frxDBDespMensalProdGeral: TfrxDBDataset;
    frxDBDespMensalProdIndividual: TfrxDBDataset;
    frxDBDispAdmissiveis: TfrxDBDataset;
    frxDBEquipGeral: TfrxDBDataset;
    frxDBEquipIndividual: TfrxDBDataset;
    frxDBEquipIndividualCampos: TfrxDBDataset;
    frxDBEquipIndividualDados: TfrxDBDataset;
    frxDBEquipamentoLubrificHist: TfrxDBDataset;
    frxDBEquipamentoManutHist: TfrxDBDataset;
    frxDBEquipamentosHist: TfrxDBDataset;
    frxDBEquipamentosHistOS: TfrxDBDataset;
    frxDBFabricantes: TfrxDBDataset;
    frxDBFamEquipamento: TfrxDBDataset;
    frxDBFamPecasRep: TfrxDBDataset;
    frxDBFamPneus: TfrxDBDataset;
    frxDBFamRecursos: TfrxDBDataset;
    frxDBFeriados: TfrxDBDataset;
    frxDBFerramentariaGeral: TfrxDBDataset;
    frxDBFerramentariaIndividual: TfrxDBDataset;
    frxDBFerramentariaKitItens: TfrxDBDataset;
    frxDBFornecedores: TfrxDBDataset;
    frxDBFuncionariosAusencias: TfrxDBDataset;
    frxDBFuncionariosCxaFerram: TfrxDBDataset;
    frxDBFuncionariosCxaFerramInv: TfrxDBDataset;
    frxDBFuncionariosCxaFerramInvItens: TfrxDBDataset;
    frxDBFuncionariosFerramentaria: TfrxDBDataset;
    frxDBFuncionariosGeral: TfrxDBDataset;
    frxDBFuncionariosIndividual: TfrxDBDataset;
    frxDBImagens: TfrxDBDataset;
    frxDBInspConsLubrific: TfrxDBDataset;
    frxDBInspConsManut: TfrxDBDataset;
    frxDBInspConsRotas: TfrxDBDataset;
    frxDBLubrificEquipGeral: TfrxDBDataset;
    frxDBLubrificFamEquipGeral: TfrxDBDataset;
    frxDBLubrificFamEquipIndividual: TfrxDBDataset;
    frxDBLubrificFamEquipIndividualInspecoes: TfrxDBDataset;
    frxDBLubrificFamEquipIndividualPlanoTrab: TfrxDBDataset;
    frxDBLubrificPeriodicas: TfrxDBDataset;
    frxDBLubrificPeriodicasItens: TfrxDBDataset;
    frxDBLubrificPeriodicasItensEsp: TfrxDBDataset;
    frxDBLubrificProgEquipGeral: TfrxDBDataset;
    frxDBLubrificProgEquipIndividual: TfrxDBDataset;
    frxDBLubrificProgEquipIndividualItens: TfrxDBDataset;
    frxDBLubrificProgEquipIndividualItensEsp: TfrxDBDataset;
    frxDBLubrificProgEquipPlanoTrab: TfrxDBDataset;
    frxDBLubrificantesGeral: TfrxDBDataset;
    frxDBLubrificantesIndividual: TfrxDBDataset;
    frxDBManutEquipGeral: TfrxDBDataset;
    frxDBManutFamEquipGeral: TfrxDBDataset;
    frxDBManutFamEquipIndividual: TfrxDBDataset;
    frxDBManutFamEquipIndividualInspecoes: TfrxDBDataset;
    frxDBManutFamEquipIndividualPlanoTrab: TfrxDBDataset;
    frxDBManutPeriodicas: TfrxDBDataset;
    frxDBManutPeriodicasItens: TfrxDBDataset;
    frxDBManutPeriodicasItensEsp: TfrxDBDataset;
    frxDBManutProgEquipGeral: TfrxDBDataset;
    frxDBManutProgEquipIndividual: TfrxDBDataset;
    frxDBManutProgEquipIndividualItens: TfrxDBDataset;
    frxDBManutProgEquipIndividualItensEsp: TfrxDBDataset;
    frxDBManutProgEquipPlanoTrab: TfrxDBDataset;
    frxDBMonitPlanoTrab: TfrxDBDataset;
    frxDBMonitoramento: TfrxDBDataset;
    frxDBMotivoParada: TfrxDBDataset;
    frxDBOficina: TfrxDBDataset;
    frxDBOrdemServico: TfrxDBDataset;
    frxDBOrdemServicoEquipe: TfrxDBDataset;
    frxDBOrdemServicoEquipeMObra: TfrxDBDataset;
    frxDBOrdemServicoHistorico: TfrxDBDataset;
    frxDBOrdemServicoHistoricoServExec: TfrxDBDataset;
    frxDBOrdemServicoResumoHistorico: TfrxDBDataset;
    frxDBOrdemServicoServicos: TfrxDBDataset;
    frxDBOrdemServicoTercFora: TfrxDBDataset;
    frxDBOrdemServicoTercForaAditivos: TfrxDBDataset;
    frxDBOrdemServicoTercForaOC: TfrxDBDataset;
    frxDBOrdemServicoTercForaOE: TfrxDBDataset;
    frxDBOrdemServicoTercForaOI: TfrxDBDataset;
    frxDBPecasRepGeral: TfrxDBDataset;
    frxDBPecasRepIndividual: TfrxDBDataset;
    frxDBPecasRepIndividualCampos: TfrxDBDataset;
    frxDBPecasRepIndividualDados: TfrxDBDataset;
    frxDBPecasRepInstEquip: TfrxDBDataset;
    frxDBPecasRepInstPeca: TfrxDBDataset;
    frxDBPecasRepKitGeral: TfrxDBDataset;
    frxDBPecasRepKitIndividual: TfrxDBDataset;
    frxDBPecasRepKitItens: TfrxDBDataset;
    frxDBPlanoTrabalhoGeral: TfrxDBDataset;
    frxDBPlanoTrabalhoIndividual: TfrxDBDataset;
    frxDBPneusChassi: TfrxDBDataset;
    frxDBPneusChassiAtrelamento: TfrxDBDataset;
    frxDBPneusChassiCusto: TfrxDBDataset;
    frxDBPneusChassiIDCusto: TfrxDBDataset;
    frxDBPneusChassiPneus: TfrxDBDataset;
    frxDBPneusChassiPneusConsertos: TfrxDBDataset;
    frxDBPneusChassiPneusHist: TfrxDBDataset;
    frxDBPneusChassiPosicoes: TfrxDBDataset;
    frxDBPneusChassiPosicoesHist: TfrxDBDataset;
    frxDBPneusGeral: TfrxDBDataset;
    frxDBPneusIndividual: TfrxDBDataset;
    frxDBPneusIndividualCampos: TfrxDBDataset;
    frxDBPneusIndividualDados: TfrxDBDataset;
    frxDBPontosInspecao: TfrxDBDataset;
    frxDBRecursosGeral: TfrxDBDataset;
    frxDBRecursosIndividual: TfrxDBDataset;
    frxDBRecursosIndividualCampos: TfrxDBDataset;
    frxDBRecursosIndividualDados: TfrxDBDataset;
    frxDBRecursosKitGeral: TfrxDBDataset;
    frxDBRecursosKitIndividual: TfrxDBDataset;
    frxDBRecursosKitItens: TfrxDBDataset;
    frxDBRelatGerencBacklog: TfrxDBDataset;
    frxDBRelatGerencDespEquip: TfrxDBDataset;
    frxDBRelatGerencDispEquip: TfrxDBDataset;
    frxDBRelatGerencMTBF: TfrxDBDataset;
    frxDBRelatGerencMTTR: TfrxDBDataset;
    frxDBRelatGerencOS: TfrxDBDataset;
    frxDBRotaGeral: TfrxDBDataset;
    frxDBRotaIndividual: TfrxDBDataset;
    frxDBRotaSeqIndividual: TfrxDBDataset;
    frxDBRotaSeqInspIndividual: TfrxDBDataset;
    frxDBRotaSeqInspItensEspIndividual: TfrxDBDataset;
    frxDBRotaSeqInspItensIndividual: TfrxDBDataset;
    frxDBSolicTrabalhoGeral: TfrxDBDataset;
    frxDBSolicTrabalhoIndividual: TfrxDBDataset;
    frxDBTipoManutencao: TfrxDBDataset;
    frxDBTipoProgramacao: TfrxDBDataset;
    frxDBUsuario: TfrxDBDataset;
    frxDBUsuarios: TfrxDBDataset;
    frxDBViagensGeral: TfrxDBDataset;
    frxDBViagensIndividual: TfrxDBDataset;
    frxDBViagensIndividualCombust: TfrxDBDataset;
    frxDBViagensIndividualCombustAbast: TfrxDBDataset;
    frxDBViagensIndividualCombustLubrific: TfrxDBDataset;
    frxDBViagensIndividualLubrific: TfrxDBDataset;
    frxRAbastecimentosGeral: TfrxReport;
    frxRAbastecimentosIndividual: TfrxReport;
    frxRAlmoxarifado: TfrxReport;
    frxRAreas: TfrxReport;
    frxRArqTecnicoGeral: TfrxReport;
    frxRArqTecnicoIndividual: TfrxReport;
    frxRCalendEquip: TfrxReport;
    frxRCalendMObra: TfrxReport;
    frxRCargos: TfrxReport;
    frxRCausaFalha: TfrxReport;
    frxRCentroCusto: TfrxReport;
    frxRClasses: TfrxReport;
    frxRContadores: TfrxReport;
    frxRDesTecnicoGeral: TfrxReport;
    frxRDesTecnicoIndividual: TfrxReport;
    frxRDespMensalDiversasGeral: TfrxReport;
    frxRDespMensalDiversasIndividual: TfrxReport;
    frxRDespMensalFuncPerGeral: TfrxReport;
    frxRDespMensalFuncPerIndividual: TfrxReport;
    frxRDespMensalManutGeral: TfrxReport;
    frxRDespMensalManutIndividual: TfrxReport;
    frxRDespMensalProdGeral: TfrxReport;
    frxRDespMensalProdIndividual: TfrxReport;
    frxRDispAdmissiveis: TfrxReport;
    frxREquipGeral: TfrxReport;
    frxREquipIndividual: TfrxReport;
    frxREquipamentosHist: TfrxReport;
    frxRFamEquipamento: TfrxReport;
    frxRFamPecasRep: TfrxReport;
    frxRFamPneus: TfrxReport;
    frxRFamRecursos: TfrxReport;
    frxRFeriados: TfrxReport;
    frxRFerramentariaGeral: TfrxReport;
    frxRFerramentariaIndividual: TfrxReport;
    frxRFornecedores: TfrxReport;
    frxRFuncionariosAusencias: TfrxReport;
    frxRFuncionariosCxaFerramInv: TfrxReport;
    frxRFuncionariosFerramentaria: TfrxReport;
    frxRFuncionariosGeral: TfrxReport;
    frxRFuncionariosIndividual: TfrxReport;
    frxRFuncionarioscxaFerram: TfrxReport;
    frxRImagens: TfrxReport;
    frxRLubrificEquipGeral: TfrxReport;
    frxRLubrificFamEquipGeral: TfrxReport;
    frxRLubrificFamEquipIndividual: TfrxReport;
    frxRLubrificPeriodicas: TfrxReport;
    frxRLubrificProgEquipGeral: TfrxReport;
    frxRLubrificProgEquipIndividual: TfrxReport;
    frxRLubrificantesGeral: TfrxReport;
    frxRLubrificantesIndividual: TfrxReport;
    frxRManutEquipGeral: TfrxReport;
    frxRManutFamEquipGeral: TfrxReport;
    frxRManutFamEquipIndividual: TfrxReport;
    frxRManutPeriodicas: TfrxReport;
    frxRManutProgEquipGeral: TfrxReport;
    frxRMonitoramento: TfrxReport;
    frxRMotivoParada: TfrxReport;
    frxROficina: TfrxReport;
    frxROrdemServico: TfrxReport;
    frxROrdemServicoHistorico: TfrxReport;
    frxROrdemServicoResumoHistorico: TfrxReport;
    frxROrdemServicoTercFora: TfrxReport;
    frxROrdemServicoTercForaGeral: TfrxReport;
    frxRPecasRepGeral: TfrxReport;
    frxRPecasRepIndividual: TfrxReport;
    frxRPecasRepInstEquip: TfrxReport;
    frxRPecasRepInstPeca: TfrxReport;
    frxRPecasRepKitGeral: TfrxReport;
    frxRPecasRepKitIndividual: TfrxReport;
    frxRPlanoTrabalhoGeral: TfrxReport;
    frxRPlanoTrabalhoIndividual: TfrxReport;
    frxRPneuGeral: TfrxReport;
    frxRPneuIndividual: TfrxReport;
    frxRPneusChassi: TfrxReport;
    frxRPneusChassiAtrelamento: TfrxReport;
    frxRPneusChassiCusto: TfrxReport;
    frxRPneusChassiIDCusto: TfrxReport;
    frxRPneusChassiPneus: TfrxReport;
    frxRPneusChassiPneusConsertos: TfrxReport;
    frxRPneusChassiPneusHist: TfrxReport;
    frxRPontosInspecao: TfrxReport;
    frxRRecrusosIndividual: TfrxReport;
    frxRRecursosGeral: TfrxReport;
    frxRRecursosKitGeral: TfrxReport;
    frxRRecursosKitIndividual: TfrxReport;
    frxRRelatGerencBacklog: TfrxReport;
    frxRRelatGerencDespEquip: TfrxReport;
    frxRRelatGerencDispEquip: TfrxReport;
    frxRRelatGerencMTBF: TfrxReport;
    frxRRelatGerencMTTR: TfrxReport;
    frxRRelatGerencOS: TfrxReport;
    frxRRotaGeral: TfrxReport;
    frxRRotaIndividual: TfrxReport;
    frxRSolicTrabalhoGeral: TfrxReport;
    frxRSolicTrabalhoIndividual: TfrxReport;
    frxRTipoManutencao: TfrxReport;
    frxRTipoProgramacao: TfrxReport;
    frxRUsuarios: TfrxReport;
    frxRViagensGeral: TfrxReport;
    frxRViagensIndividual: TfrxReport;
    frxRfabricantes: TfrxReport;
    frxDBOrdemServicoEquipeMObraUtil: TfrxDBDataset;
    frxDBOrdemServicoEquipeRecursos: TfrxDBDataset;
    frxDBOrdemServicoPecas: TfrxDBDataset;
    frxDBOrdemServicoPlanoTrab: TfrxDBDataset;
    frxDBInspConsManutItens: TfrxDBDataset;
    frxDBInspConsLubrificItens: TfrxDBDataset;
    frxRInspConsLubrific: TfrxReport;
    frxDBInspConsManutItensEsp: TfrxDBDataset;
    frxDBInspConsManutPlanoTrab: TfrxDBDataset;
    frxRInspConsRotas: TfrxReport;
    frxDBInspConsRotasSeq: TfrxDBDataset;
    frxDBInspConsRotasSeqManut: TfrxDBDataset;
    frxDBInspConsRotasSeqManutItens: TfrxDBDataset;
    frxDBInspConsRotasSeqManutItensEsp: TfrxDBDataset;
    frxDBInspConsLubrificItensEsp: TfrxDBDataset;
    frxRManutProgEquipIndividual: TfrxReport;
    frxRInspConsManut: TfrxReport;
    frxDBInspConsLubrificPlanoTrab: TfrxDBDataset;
    frxDBOrdemServicoImagens: TfrxDBDataset;
    frxDBOrdemServicoGeral: TfrxDBDataset;
    frxDBOrdemServicoGeralMObraProg: TfrxDBDataset;
    frxRInspConsLubrific1: TfrxReport;
    frxRInspConsRotas1: TfrxReport;
    frxRInspConsManut1: TfrxReport;
    frxDBOrdemServicoGeralMObraUtil: TfrxDBDataset;
    frxDBOrdemServicoGeralManut: TfrxDBDataset;
    frxDBOrdemServicoGeralLubrific: TfrxDBDataset;
    frxDBFuncionariosHist: TfrxDBDataset;
    frxDBFuncionariosTipoManutHist: TfrxDBDataset;
    frxDBFuncionariosHistServicos: TfrxDBDataset;
    frxDBOSProgramada: TfrxDBDataset;
    frxRPrevistoRealizado: TfrxReport;
    frxDBOSProgramadasExecucaoMObra: TfrxDBDataset;
    frxRFuncionariosHist: TfrxReport;
    frxDBOrdemServicoLocalizaMObra: TfrxDBDataset;
    frxDBOrdemServicoLocalizaMObraOSProg: TfrxDBDataset;
    frxROrdemServicoLocalizaMObra: TfrxReport;
    frxReport2: TfrxReport;
    frxROrdemServicoMObra: TfrxReport;
    frxROrdemServicoInsp: TfrxReport;
    frxDBOrdemServicoLocalizaMObraOSExec: TfrxDBDataset;
    frxDBOServicoGeralObservacoes: TfrxDBDataset;
    frxDBOrdemServicoGerenciaRelatMObraProgOS: TfrxDBDataset;
    frxDBOrdemServicoGerenciaRelatMObraUtilOS: TfrxDBDataset;
    frxROrdemServicoGeralCompleta: TfrxReport;
    frxReport1: TfrxReport;
    frxROrdemServicoGeral: TfrxReport;
    frxCSVExport1: TfrxCSVExport;
    frxXLSXExport1: TfrxXLSXExport;
    procedure frxDBManutProgEquipGeralOpen(Sender: TObject);
    procedure frxDBLubrificProgEquipGeralOpen(Sender: TObject);
    procedure frxDBManutProgEquipIndividualOpen(Sender: TObject);
    procedure frxDBLubrificProgEquipIndividualOpen(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatorios: TDmRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnTelaCadOrdemServicoHistorico, UnTelaInspConsulta,
  UnTelaCadEquipamentosHist, UnDM, UnTelaConsultaPeriodo,
  UnTelaCadOrdemServicoGerencia;

{$R *.dfm}

procedure TDmRelatorios.frxDBLubrificProgEquipGeralOpen(Sender: TObject);
begin
  DM.qryLubrificProgEquipItens.Close;
  DM.qryLubrificProgEquipItens.Params[0].AsString := DM.FCodEmpresa;
  DM.qryLubrificProgEquipItens.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODLUBRIFICPROGFAMEQUIP').AsString;
  DM.qryLubrificProgEquipItens.Open;

  DM.qryLubrificProgEquipItensEsp.Close;
  DM.qryLubrificProgEquipItensEsp.Params[0].AsString := DM.FCodEmpresa;
  DM.qryLubrificProgEquipItensEsp.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODIGO').AsString;
  DM.qryLubrificProgEquipItensEsp.Open;

  DM.qryLubrificProgEquipPlanoTrab.Close;
  DM.qryLubrificProgEquipPlanoTrab.Params[0].AsString := DM.FCodEmpresa;
  DM.qryLubrificProgEquipPlanoTrab.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODLUBRIFICPROGFAMEQUIP').AsString;
  DM.qryLubrificProgEquipPlanoTrab.Open;
end;

procedure TDmRelatorios.frxDBLubrificProgEquipIndividualOpen(Sender: TObject);
begin
//  DM.qryLubrificProgEquipItens.Close;
//  DM.qryLubrificProgEquipItens.Params[0].AsString := DM.FCodEmpresa;
//  DM.qryLubrificProgEquipItens.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODLUBRIFICPROGFAMEQUIP').AsString;
//  DM.qryLubrificProgEquipItens.Open;
//
//  DM.qryLubrificProgEquipItensEsp.Close;
//  DM.qryLubrificProgEquipItensEsp.Params[0].AsString := DM.FCodEmpresa;
//  DM.qryLubrificProgEquipItensEsp.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODIGO').AsString;
//  DM.qryLubrificProgEquipItensEsp.Open;
//
//  DM.qryLubrificProgEquipPlanoTrab.Close;
//  DM.qryLubrificProgEquipPlanoTrab.Params[0].AsString := DM.FCodEmpresa;
//  DM.qryLubrificProgEquipPlanoTrab.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODLUBRIFICPROGFAMEQUIP').AsString;
//  DM.qryLubrificProgEquipPlanoTrab.Open;
end;

procedure TDmRelatorios.frxDBManutProgEquipGeralOpen(Sender: TObject);
begin
  DM.qryManutProgEquipItens.Close;
  DM.qryManutProgEquipItens.Params[0].AsString := DM.FCodEmpresa;
  DM.qryManutProgEquipItens.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODMANUTPROGFAMEQUIP').AsString;
  DM.qryManutProgEquipItens.Open;

  DM.qryManutProgEquipItensEsp.Close;
  DM.qryManutProgEquipItensEsp.Params[0].AsString := DM.FCodEmpresa;
  DM.qryManutProgEquipItensEsp.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODIGO').AsString;
  DM.qryManutProgEquipItensEsp.Open;

  DM.qryManutProgEquipPlanoTrab.Close;
  DM.qryManutProgEquipPlanoTrab.Params[0].AsString := DM.FCodEmpresa;
  DM.qryManutProgEquipPlanoTrab.Params[1].AsString := DM.qryAuxiliar.FieldByName('CODMANUTPROGFAMEQUIP').AsString;
  DM.qryManutProgEquipPlanoTrab.Open;

end;

procedure TDmRelatorios.frxDBManutProgEquipIndividualOpen(Sender: TObject);
begin
//  DM.qryManutProgEquipItens.Close;
//  DM.qryManutProgEquipItens.Params[0].AsString := DM.FCodEmpresa;
//  DM.qryManutProgEquipItens.Params[1].AsString := DM.qryManutProgEquip.FieldByName('CODMANUTPROGFAMEQUIP').AsString;
//  DM.qryManutProgEquipItens.Open;
//
//  DM.qryManutProgEquipItensEsp.Close;
//  DM.qryManutProgEquipItensEsp.Params[0].AsString := DM.FCodEmpresa;
//  DM.qryManutProgEquipItensEsp.Params[1].AsString := DM.qryManutProgEquip.FieldByName('CODIGO').AsString;
//  DM.qryManutProgEquipItensEsp.Open;
//
//  DM.qryManutProgEquipPlanoTrab.Close;
//  DM.qryManutProgEquipPlanoTrab.Params[0].AsString := DM.FCodEmpresa;
//  DM.qryManutProgEquipPlanoTrab.Params[1].AsString := DM.qryManutProgEquip.FieldByName('CODMANUTPROGFAMEQUIP').AsString;
//  DM.qryManutProgEquipPlanoTrab.Open;

end;

end.

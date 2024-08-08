program SPMP3;




{$R *.dres}

uses
  Vcl.Forms,
  Midas,
  Midaslib,
  System.SysUtils,
  Vcl.Dialogs,
  Winapi.Windows,
  Winapi.TlHelp32,
  System.UITypes,
  Data.DB,
  UnTelaPaiOkCancel in '..\Units\UnTelaPaiOkCancel.pas' {FrmTelaPaiOKCancel},
  UnTelaPaiParametros in '..\Units\UnTelaPaiParametros.pas' {FrmTelaPaiParametros},
  UnTelaAcesso in '..\Units\UnTelaAcesso.pas' {FrmTelaAcesso},
  UnTelaCadAlmoxarifados in '..\Units\UnTelaCadAlmoxarifados.pas' {FrmTelaCadAlmoxarifados},
  UnTelaCadAreas in '..\Units\UnTelaCadAreas.pas' {FrmTelaCadAreas},
  UnTelaCadCalendEquip in '..\Units\UnTelaCadCalendEquip.pas' {FrmTelaCadCalendEquip},
  UnTelaCadCalendMObra in '..\Units\UnTelaCadCalendMObra.pas' {FrmTelaCadCalendMObra},
  UnTelaCadCargos in '..\Units\UnTelaCadCargos.pas' {FrmTelaCadCargos},
  UnTelaCadCausaFalha in '..\Units\UnTelaCadCausaFalha.pas' {FrmTelaCadCausaFalha},
  UnTelaCadCentroCusto in '..\Units\UnTelaCadCentroCusto.pas' {FrmTelaCadCentroCusto},
  UnTelaCadClasses in '..\Units\UnTelaCadClasses.pas' {FrmTelaCadClasses},
  UnTelaCadDisponibilidade in '..\Units\UnTelaCadDisponibilidade.pas' {FrmTelaCadDisponibilidade},
  UnTelaCadEquipamentos in '..\Units\UnTelaCadEquipamentos.pas' {FrmTelaCadEquipamentos},
  UnTelaCadFabricantes in '..\Units\UnTelaCadFabricantes.pas' {FrmTelaCadFabricantes},
  UnTelaCadFamiliaEquipamento in '..\Units\UnTelaCadFamiliaEquipamento.pas' {FrmTelaCadFamiliaEquipamento},
  UnTelaCadFamiliaPecasRep in '..\Units\UnTelaCadFamiliaPecasRep.pas' {FrmTelaCadFamiliaPecasRep},
  UnTelaCadFamiliaRecursos in '..\Units\UnTelaCadFamiliaRecursos.pas' {FrmTelaCadFamiliaRecursos},
  UnTelaCadFeriados in '..\Units\UnTelaCadFeriados.pas' {FrmTelaCadFeriados},
  UnTelaCadFormatoCodigo in '..\Units\UnTelaCadFormatoCodigo.pas' {FrmTelaCadFormatoCodigo},
  UnTelaCadFornecedores in '..\Units\UnTelaCadFornecedores.pas' {FrmTelaCadFornecedores},
  UnTelaCadGrupoIndustrial in '..\Units\UnTelaCadGrupoIndustrial.pas' {FrmTelaCadGrupoIndustrial},
  UnTelaCadImagens in '..\Units\UnTelaCadImagens.pas' {FrmTelaCadImagens},
  UnTelaCadLubrifictProgEquip in '..\Units\UnTelaCadLubrifictProgEquip.pas' {FrmTelaCadLubrificProgEquip},
  UnTelaCadManutProgEquip in '..\Units\UnTelaCadManutProgEquip.pas' {FrmTelaCadManutProgEquip},
  UnTelaCadMotivoParada in '..\Units\UnTelaCadMotivoParada.pas' {FrmTelaCadMotivoParada},
  UnTelaCadOficinas in '..\Units\UnTelaCadOficinas.pas' {FrmTelaCadOficinas},
  UnTelaCadTipoManutencao in '..\Units\UnTelaCadTipoManutencao.pas' {FrmTelaCadTipoManutencao},
  UnTelaCadTipoProgramacao in '..\Units\UnTelaCadTipoProgramacao.pas' {FrmTelaCadTipoProgramacao},
  UnTelaCadUsuarios in '..\Units\UnTelaCadUsuarios.pas' {FrmTelaCadUsuarios},
  UnTelaConsulta in '..\Units\UnTelaConsulta.pas' {FrmTelaAuxiliar},
  UnTelaMenuParametros in '..\Units\UnTelaMenuParametros.pas' {FrmTelaMenuParametros},
  UnTelaPaiCadastros in '..\Units\UnTelaPaiCadastros.pas' {FrmTelaPaiCadastros},
  UnTelaPermissoes in '..\Units\UnTelaPermissoes.pas' {FrmTelaPermissoes},
  UnTelaPrincipal in '..\Units\UnTelaPrincipal.pas' {FrmTelaPrincipal},
  UnTelaCadEquipamentosPecas in '..\Units\UnTelaCadEquipamentosPecas.pas' {FrmTelaCadEquipamentosPecas},
  UnTelaCadEquipamentosEsp in '..\Units\UnTelaCadEquipamentosEsp.pas' {FrmTelaCadEquipamentosEsp},
  UnTelaCadEquipamentosArqTec in '..\Units\UnTelaCadEquipamentosArqTec.pas' {FrmTelaCadEquipamentosArqTec},
  UnTelaCadNavegacaoGrafica in '..\Units\UnTelaCadNavegacaoGrafica.pas' {FrmTelaCadNavegacaoGrafica},
  UnTelaCadEquipamentosHist in '..\Units\UnTelaCadEquipamentosHist.pas' {FrmTelaCadEquipamentosHist},
  UnTelaCadEquipamentosPontosInsp in '..\Units\UnTelaCadEquipamentosPontosInsp.pas' {FrmTelaCadEquipamentosPontosInsp},
  UnTelaCadEquipamentosContadores in '..\Units\UnTelaCadEquipamentosContadores.pas' {FrmTelaCadEquipamentosContadores},
  UnTelaCadEquipamentosConf in '..\Units\UnTelaCadEquipamentosConf.pas' {FrmTelaCadEquipamentosConf},
  UnTelaCadSolicitacaoTrab in '..\Units\UnTelaCadSolicitacaoTrab.pas' {FrmTelaCadSolicitacaoTrab},
  UnTelaCadPlanoTrabalho in '..\Units\UnTelaCadPlanoTrabalho.pas' {FrmTelaCadPlanoTrabalho},
  UnTelaCadManutProgFamEquip in '..\Units\UnTelaCadManutProgFamEquip.pas' {FrmTelaCadManutProgFamEquip},
  UnTelaCadLubrificProgFamEquip in '..\Units\UnTelaCadLubrificProgFamEquip.pas' {FrmTelaCadLubrificProgFamEquip},
  UnTelaInspFechamento in '..\Units\UnTelaInspFechamento.pas' {FrmTelaInspFechamento},
  UnTelaCadOrdemServico in '..\Units\UnTelaCadOrdemServico.pas' {FrmTelaCadOrdemServico},
  UnTelaCadOrdemServicoMObra in '..\Units\UnTelaCadOrdemServicoMObra.pas' {FrmTelaCadOrdemServicoMObra},
  UnTelaCadOrdemServicoPecas in '..\Units\UnTelaCadOrdemServicoPecas.pas' {FrmTelaCadOrdemServicoPecas},
  UnTelaCadOrdemServicoRecursos in '..\Units\UnTelaCadOrdemServicoRecursos.pas' {FrmTelaCadOrdemServicoRecursos},
  UnTelaCadOrdemServicoPlanoTrab in '..\Units\UnTelaCadOrdemServicoPlanoTrab.pas' {FrmTelaCadOrdemServicoPlanoTrab},
  UnTelaCadOrdemServicoGerencia in '..\Units\UnTelaCadOrdemServicoGerencia.pas' {FrmTelaCadOrdemServicoGerencia},
  UnTelaCadOrdemServicoMObraProg in '..\Units\UnTelaCadOrdemServicoMObraProg.pas' {FrmTelaCadOrdemServicoMObraProg},
  UnTelaCadOrdemServicoMObraProgHHDisp in '..\Units\UnTelaCadOrdemServicoMObraProgHHDisp.pas' {FrmTelaCadOrdemServicoMObraProgHHDisp},
  UnTelaCadPontoInspecao in '..\Units\UnTelaCadPontoInspecao.pas' {FrmTelaCadPontoInspecao},
  UnTelaCadContadores in '..\Units\UnTelaCadContadores.pas' {FrmTelaCadContadores},
  UnTelaCadFuncionarios in '..\Units\UnTelaCadFuncionarios.pas' {FrmTelaCadFuncionarios},
  UnTelaCadOrdemServicoMObraExec in '..\Units\UnTelaCadOrdemServicoMObraExec.pas' {FrmTelaCadOrdemServicoMObraExec},
  UnTelaCadOrdemServicoFechamento in '..\Units\UnTelaCadOrdemServicoFechamento.pas' {FrmTelaCadOrdemServicoFechamento},
  UnTelaCadOrdemServicoFechamentoMObra in '..\Units\UnTelaCadOrdemServicoFechamentoMObra.pas' {FrmTelaCadOrdemServicoFechamentoMObra},
  UnTelaCadOrdemServicoFechamentoPecas in '..\Units\UnTelaCadOrdemServicoFechamentoPecas.pas' {FrmTelaCadOrdemServicoFechamentoPecas},
  UnTelaCadOrdemServicoFechamentoRecursos in '..\Units\UnTelaCadOrdemServicoFechamentoRecursos.pas' {FrmTelaCadOrdemServicoFechamentoRecursos},
  UnTelaCadOrdemServicoHistorico in '..\Units\UnTelaCadOrdemServicoHistorico.pas' {FrmTelaCadOrdemServicoHistorico},
  UnTelaCadOrdemServicoParalisacao in '..\Units\UnTelaCadOrdemServicoParalisacao.pas' {FrmTelaCadOrdemServicoParalisacao},
  UnTelaCadFuncionariosCxaFerramentas in '..\Units\UnTelaCadFuncionariosCxaFerramentas.pas' {FrmTelaCadFuncionariosCxaFerramentas},
  UnTelaCadFuncionariosCxaFerramInv in '..\Units\UnTelaCadFuncionariosCxaFerramInv.pas' {FrmTelaCadFuncionariosCxaFerramInv},
  UnTelaCadFuncionariosAusencias in '..\Units\UnTelaCadFuncionariosAusencias.pas' {FrmTelaCadFuncionariosAusencias},
  UnTelaCadFuncionariosHist in '..\Units\UnTelaCadFuncionariosHist.pas' {FrmTelaCadFuncionariosHist},
  UnTelaCadRecursos in '..\Units\UnTelaCadRecursos.pas' {FrmTelaCadRecursos},
  UnTelaCadRecursosKit in '..\Units\UnTelaCadRecursosKit.pas' {FrmTelaCadRecursosKit},
  UnTelaCadRecursosFerram in '..\Units\UnTelaCadRecursosFerram.pas' {FrmTelaCadRecursosFerram},
  UnTelaCadPecasReposicao in '..\Units\UnTelaCadPecasReposicao.pas' {FrmTelaCadPecasReposicao},
  UnTelaCadPecasReposicaoKit in '..\Units\UnTelaCadPecasReposicaoKit.pas' {FrmTelaCadPecasReposicaoKit},
  UnTelaCadPecasReposicaoHist in '..\Units\UnTelaCadPecasReposicaoHist.pas' {FrmTelaCadPecasReposicaoHist},
  UnTelaCadLubrificantes in '..\Units\UnTelaCadLubrificantes.pas' {FrmTelaCadLubrificantes},
  UnTelaCadOrdemServicoLocalizaMObra in '..\Units\UnTelaCadOrdemServicoLocalizaMObra.pas' {FrmTelaCadOrdemServicoLocalizaMObra},
  UnTelaCadOrdemServicoTercFora in '..\Units\UnTelaCadOrdemServicoTercFora.pas' {FrmTelaCadOrdemServicoTercFora},
  UnTelaCadOrdemServicoTercUnid in '..\Units\UnTelaCadOrdemServicoTercUnid.pas' {FrmTelaCadOrdemServicoTercUnid},
  UnTelaCadOrdemServicoTercUnidTarefas in '..\Units\UnTelaCadOrdemServicoTercUnidTarefas.pas' {FrmTelaCadOrdemServicoTercUnidTarefas},
  UnTelaCadOrdemServicoTercUnidAditivos in '..\Units\UnTelaCadOrdemServicoTercUnidAditivos.pas' {FrmTelaCadOrdemServicoTercUnidAditivos},
  UnTelaCadOrdemServicoTercUnidMateriais in '..\Units\UnTelaCadOrdemServicoTercUnidMateriais.pas' {FrmTelaCadOrdemServicoTercUnidMateriais},
  UnTelaCadOrdemServicoTercUnidRecursos in '..\Units\UnTelaCadOrdemServicoTercUnidRecursos.pas' {FrmTelaCadOrdemServicoTercUnidRecursos},
  UnTelaCadOrdemServicoTercUnidPecas in '..\Units\UnTelaCadOrdemServicoTercUnidPecas.pas' {FrmTelaCadOrdemServicoTercUnidPecas},
  UnTelaCadCalendarioOS in '..\Units\UnTelaCadCalendarioOS.pas' {FrmTelaCadCalendarioOS},
  UnTelaCadArqTecnicoLiteratura in '..\Units\UnTelaCadArqTecnicoLiteratura.pas' {FrmTelaCadArqTecnicoLiteratura},
  UnTelaCadArqTecnicoLiteraturaParam in '..\Units\UnTelaCadArqTecnicoLiteraturaParam.pas' {FrmTelaCadArqTecnicoLiteraturaParam},
  UnTelaCadArqTecnicoDesenho in '..\Units\UnTelaCadArqTecnicoDesenho.pas' {FrmTelaCadArqTecnicoDesenho},
  UnTelaCadInfMensalFuncionarios in '..\Units\UnTelaCadInfMensalFuncionarios.pas' {FrmTelaCadInfMensalFuncionarios},
  UnTelaCadInfMensalDespesasMensais in '..\Units\UnTelaCadInfMensalDespesasMensais.pas' {FrmTelaCadInfMensalDespesasMensais},
  UnTelaCadInfMensalProducaoMensal in '..\Units\UnTelaCadInfMensalProducaoMensal.pas' {FrmTelaCadInfMensalProducaoMensal},
  UnTelaCadInfMensalDiversas in '..\Units\UnTelaCadInfMensalDiversas.pas' {FrmTelaCadInfMensalDiversas},
  UnTelaCadIndDesempenho in '..\Units\UnTelaCadIndDesempenho.pas' {FrmTelaCadIndDesempenho},
  UnTelaInfGerenciais in '..\Units\UnTelaInfGerenciais.pas' {FrmTelaInfGerenciais},
  UnTelaCadAlertas in '..\Units\UnTelaCadAlertas.pas' {FrmTelaCadAlertas},
  UnTelaCadFuncionariosFerramentaria in '..\Units\UnTelaCadFuncionariosFerramentaria.pas' {FrmTelaCadFuncionariosFerramentaria},
  UnTelaCadAbastecimentosRotas in '..\Units\UnTelaCadAbastecimentosRotas.pas' {FrmTelaCadAbastecimentosRotas},
  UnTelaCadFamiliaPneus in '..\Units\UnTelaCadFamiliaPneus.pas' {FrmTelaCadFamiliaPneus},
  UnTelaCadPneusChassi in '..\Units\UnTelaCadPneusChassi.pas' {FrmTelaCadPneusChassi},
  UnTelaCadPneusChassiPneus in '..\Units\UnTelaCadPneusChassiPneus.pas' {FrmTelaCadPneusChassiPneus},
  UnTelaCadPneusChassiAtrelamentoHist in '..\Units\UnTelaCadPneusChassiAtrelamentoHist.pas' {FrmTelaCadPneusChassiAtrelamentoHist},
  UnTelaCadPneus in '..\Units\UnTelaCadPneus.pas' {FrmTelaCadPneus},
  UnTelaParadasDiarias in '..\Units\UnTelaParadasDiarias.pas' {FrmTelaParadasDiarias},
  UnTelaCadRotaProgEquip in '..\Units\UnTelaCadRotaProgEquip.pas' {FrmTelaCadRotaProgEquip},
  UnTelaCadEquipamentoReserva in '..\Units\UnTelaCadEquipamentoReserva.pas' {FrmTelaCadEquipamentoReserva},
  UnTelaCadMonitoramento in '..\Units\UnTelaCadMonitoramento.pas' {FrmTelaCadMonitoramento},
  UnTelaCadMonitMedicoes in '..\Units\UnTelaCadMonitMedicoes.pas' {FrmTelaCadMonitMedicoes},
  UnTelaAcessoUnidade in '..\Units\UnTelaAcessoUnidade.pas' {FrmTelaAcessoUnidade},
  UnTelaUsuariosAtivos in '..\Units\UnTelaUsuariosAtivos.pas' {FrmTelaUsuariosAtivos},
  UnTelaUsuarioAcessos in '..\Units\UnTelaUsuarioAcessos.pas' {FrmTelaUsuarioAcessos},
  UnTelaInspVenc in '..\Units\UnTelaInspVenc.pas' {FrmTelaInspVenc},
  UnTelaInspFechamentoHist in '..\Units\UnTelaInspFechamentoHist.pas' {FrmTelaInspFechamentoHist},
  UnTelaInspConsulta in '..\Units\UnTelaInspConsulta.pas' {FrmTelaInspConsulta},
  UnTelaSplash in '..\Units\UnTelaSplash.pas' {FrmTelaSplash},
  UnTelaCadPneusChassiAtrelamento in '..\Units\UnTelaCadPneusChassiAtrelamento.pas' {FrmTelaCadPneusChassiAtrelamento},
  UnTelaCadInfMensalDespesasMensaisMatReq in '..\Units\UnTelaCadInfMensalDespesasMensaisMatReq.pas' {FrmTelaCadInfMensalDespesasMensaisMatReq},
  UnTelaCadInfMensalDespesasMensaisRecManut in '..\Units\UnTelaCadInfMensalDespesasMensaisRecManut.pas' {FrmTelaCadInfMensalDespesasMensaisRecManut},
  UnTelaCadInfMensalTaxas in '..\Units\UnTelaCadInfMensalTaxas.pas' {FrmTelaCadInfMensalTaxas},
  UnTelaCustosMes in '..\Units\UnTelaCustosMes.pas' {FrmTelaCustosMes},
  UnTelaCadPneusChassiPneusConsertos in '..\Units\UnTelaCadPneusChassiPneusConsertos.pas' {FrmTelaCadPneusChassiPneusConsertos},
  UnTelaCadPneusIDs in '..\Units\UnTelaCadPneusIDs.pas' {FrmTelaCadPneusIDs},
  UnTelaCadPneusChassiPneusHist in '..\Units\UnTelaCadPneusChassiPneusHist.pas' {FrmTelaCadPneusChassiPneusHist},
  UnDmRelatorios in '..\Units\UnDmRelatorios.pas' {DmRelatorios: TDataModule},
  UnTelaCadManutProgFamEquipPartes in '..\Units\UnTelaCadManutProgFamEquipPartes.pas' {FrmTelaCadManutProgFamEquipPartes},
  UnTelaCadManutProgFamEquipPartesItens in '..\Units\UnTelaCadManutProgFamEquipPartesItens.pas' {FrmTelaCadManutProgFamEquipPartesItens},
  UnTelaCadLubrificProgFamEquipPartes in '..\Units\UnTelaCadLubrificProgFamEquipPartes.pas' {FrmTelaCadLubrificProgFamEquipPartes},
  UnTelaCadLubrificProgFamEquipPartesItens in '..\Units\UnTelaCadLubrificProgFamEquipPartesItens.pas' {FrmTelaCadLubrificProgFamEquipPartesItens},
  UnTelaConsultaPeriodo in '..\Units\UnTelaConsultaPeriodo.pas' {FrmTelaConsultaPeriodo},
  UnTelaCadCalendarioOSServicos in '..\Units\UnTelaCadCalendarioOSServicos.pas' {FrmTelaCadCalendarioOSServicos},
  UnTelaCadPneusChassiRelat in '..\Units\UnTelaCadPneusChassiRelat.pas' {FrmTelaCadPneusChassiRelat},
  UnTelaCadAbastecimentosCombustivel in '..\Units\UnTelaCadAbastecimentosCombustivel.pas' {FrmTelaCadAbastecimentosCombustivel},
  UnTelaCadAbastecimentosLubrificante in '..\Units\UnTelaCadAbastecimentosLubrificante.pas' {FrmTelaCadAbastecimentosLubrificante},
  UnTelaCadAbastecimentos in '..\Units\UnTelaCadAbastecimentos.pas' {FrmTelaCadAbastecimentos},
  UnTelaImpDadosSatelite in '..\Units\UnTelaImpDadosSatelite.pas' {FrmTelaImpDadosSatelite},
  UnTelaAguarde in '..\Units\UnTelaAguarde.pas' {FrmTelaAguarde},
  UnTelaImpPedidos in '..\Units\UnTelaImpPedidos.pas' {FrmTelaImpPedidos},
  UnTelaCadOrdemServicoMObraExecDisp in '..\Units\UnTelaCadOrdemServicoMObraExecDisp.pas' {FrmTelaCadOrdemServicoMObraDisp},
  UnTelaCadOrdemServicoTercUnidMedicoes in '..\Units\UnTelaCadOrdemServicoTercUnidMedicoes.pas' {FrmTelaCadOrdemServicoTercUnidMedicoes},
  UnTelaCadOrdemServicoLubrificantes in '..\Units\UnTelaCadOrdemServicoLubrificantes.pas' {FrmTelaCadOrdemServicoLubrificantes},
  UnTelaCadOrdemServicoFechamentoLubrificantes in '..\Units\UnTelaCadOrdemServicoFechamentoLubrificantes.pas' {FrmTelaCadOrdemServicoFechamentoLubrificantes},
  UnTelaCadEquipamentosImagens in '..\Units\UnTelaCadEquipamentosImagens.pas' {FrmTelaCadEquipamentosImagens},
  UnTelaCadAbastecimentosViagens in '..\Units\UnTelaCadAbastecimentosViagens.pas' {FrmTelaCadAbastecimentosViagens},
  UnTelaOpcoes in '..\Units\UnTelaOpcoes.pas' {FrmTelaOpcoes},
  Vcl.Themes,
  Vcl.Styles,
  UnDM in '..\Units\UnDM.pas' {DM: TDataModule},
  UnTelaCadManutProgEquipPartesItensEsp in '..\Units\UnTelaCadManutProgEquipPartesItensEsp.pas' {FrmTelaCadManutProgEquipPartesItensEsp},
  UnTelaCadLubrificProgEquipPartesItensEsp in '..\Units\UnTelaCadLubrificProgEquipPartesItensEsp.pas' {FrmTelaCadLubrificProgEquipPartesItensEsp},
  UnTelaAuditoria in '..\Units\UnTelaAuditoria.pas' {FrmTelaAuditoria},
  UnTelaGerenciador in '..\Units\UnTelaGerenciador.pas' {FrmTelaGerenciador},
  UnDmAlertas in '..\Units\UnDmAlertas.pas' {DMAlertas: TDataModule},
  UnTelaCadEquipamentosAltCod in '..\Units\UnTelaCadEquipamentosAltCod.pas' {FrmTelaCadEquipamentosAltCod},
  UnTelaCadEquipamentosAltFamiliaCod in '..\Units\UnTelaCadEquipamentosAltFamiliaCod.pas' {FrmTelaCadEquipamentosAltFamiliaCod},
  UnTelaCadManutProgEquipPecas in '..\Units\UnTelaCadManutProgEquipPecas.pas' {FrmTelaCadManutProgEquipPecas},
  UnTelaCadManutProgEquipRecursos in '..\Units\UnTelaCadManutProgEquipRecursos.pas' {FrmTelaCadManutProgEquipRecursos},
  UnTelaCadLubrificProgEquipPecas in '..\Units\UnTelaCadLubrificProgEquipPecas.pas' {FrmTelaCadLubrificProgEquipPecas},
  UnTelaCadLubrificProgEquipRecursos in '..\Units\UnTelaCadLubrificProgEquipRecursos.pas' {FrmTelaCadLubrificProgEquipRecursos},
  UnTelaCadManutProgFamEquipClonagem in '..\Units\UnTelaCadManutProgFamEquipClonagem.pas' {FrmTelaCadManutProgFamEquipClonagem},
  UnTelaCadLubrificProgFamEquipClonagem in '..\Units\UnTelaCadLubrificProgFamEquipClonagem.pas' {FrmTelaCadLubrificProgFamEquipClonagem},
  UnTelaCadManutProgEquipMObra in '..\Units\UnTelaCadManutProgEquipMObra.pas' {FrmTelaCadManutProgEquipMObra},
  UnTelaCadLubrificProgEquipMObra in '..\Units\UnTelaCadLubrificProgEquipMObra.pas' {FrmTelaCadLubrificProgEquipMObra},
  unRelatorioPadrao in '..\Units\Report\unRelatorioPadrao.pas' {frmRelatorioPadrao},
  unTelaInspVencRelatManut in '..\Units\Report\unTelaInspVencRelatManut.pas' {FrmTelaInspVencRelatManut},
  UnTempoOcioso in '..\Units\UnTempoOcioso.pas' {frmSistemaOcioso},
  UnTelaCadManutProgFamEquipConsulta in '..\Units\UnTelaCadManutProgFamEquipConsulta.pas' {FrmTelaCadManutProgFamEquipConsulta},
  UnTelaCadLubrificProgFamEquipConsulta in '..\Units\UnTelaCadLubrificProgFamEquipConsulta.pas' {FrmTelaCadLubrificProgFamEquipConsulta},
  UnTelaCadSolicitacaoTrabCons in '..\Units\UnTelaCadSolicitacaoTrabCons.pas' {FrmTelaCadSolicitacaoTrabCons},
  unTelaOutrosIndicadores in '..\Units\unTelaOutrosIndicadores.pas' {FrmTelaOutrosIndicadores},
  UnDMDashboard in '..\Units\UnDMDashboard.pas' {DMDashboard: TDataModule},
  UnTelaCadOrdemServicoGerenciaValidacoes in '..\Units\UnTelaCadOrdemServicoGerenciaValidacoes.pas' {FrmTelaCadOrdemServicoGerenciaValidacoes};

{$R *.res}
begin
  {$WARNINGS OFF}
//  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  {$WARNINGS ON}
if (FindWindow(nil, PChar('SPMP3 - Acesso')) > 0) or (FindWindow(nil, PChar('Inspeções Vencidas')) > 0)
  or (FindWindow(nil, PChar('SPMP - Sistema do Plano de Manutenção Programada')) > 0) then
    begin
      Application.MessageBox('SPMP3 já está em execução!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.Title := '';
  TStyleManager.TrySetStyle('Windows10 Malibu');
  Application.Title := 'SPMP - Sistema do Plano de Manutenção Programada';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMDashboard, DMDashboard);
  Application.CreateForm(TDMAlertas, DMAlertas);
  Application.CreateForm(TFrmTelaAcesso, FrmTelaAcesso);
  Application.CreateForm(TfrmSistemaOcioso, frmSistemaOcioso);
  Application.CreateForm(TFrmTelaCadOrdemServicoGerenciaValidacoes, FrmTelaCadOrdemServicoGerenciaValidacoes);
  FrmTelaAcesso.ShowModal;
  if DM.FAcessoLiberado = True then
  begin
    FreeAndNil(FrmTelaAcesso);
    Try
      Application.CreateForm(TFrmTelaPrincipal, FrmTelaPrincipal);

      FrmTelaSplash := TFrmTelaSplash.Create(Application);
      FrmTelaSplash.ShowModal;
      FreeAndNil(FrmTelaSplash);

      if (DM.qryUsuarioNIVELACESSO.AsString = 'Administrador de Unidade') or (DM.qryUsuarioNIVELACESSO.AsString = 'Controlador de Manutenção')
        or (DM.qryUsuarioNIVELACESSO.AsString = 'Executante de Trabalho A') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
        begin
          if (DM.qryManutVenc.IsEmpty = False) or (DM.qryLubrificVenc.IsEmpty = False) or (DM.qryRotaEquipVenc.IsEmpty = False) then
          begin
            Try
              Application.CreateForm(TFrmTelaInspVenc, FrmTelaInspVenc);
              FrmTelaInspVenc.TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutVenc.RecordCount)+')';
              FrmTelaInspVenc.TSLubrific.Caption := 'Lubrificações ('+ IntToStr(DM.qryLubrificVenc.RecordCount)+')';
              if DM.FEmpTransf = True then
              begin
                FrmTelaInspVenc.TSRotas.Caption := 'Rotas ('+ IntToStr(DM.qryRotaEquipVenc.RecordCount)+')';
              end;
              FrmTelaInspVenc.ShowModal;
            Finally
              FreeAndNil(FrmTelaInspVenc);
            End;
          end else
          begin
            DM.qryManutVenc.Close;
            DM.qryLubrificVenc.Close;
            DM.qryRotaEquipVenc.Close;
          end;
        end;

      Application.Run;
    Finally
       FreeAndNil(FrmTelaPrincipal);
       FreeAndNil(frmSistemaOcioso);
       FreeAndNil(DMAlertas);
       FreeAndNil(DmRelatorios);
       FreeAndNil(DmDashboard);
       FreeAndNil(DM);

      Application.Terminate;
    End;
  end else
  begin
    FrmTelaAcesso.Close;
    FreeAndNil(FrmTelaAcesso);
    FreeAndNil(DMAlertas);
    FreeAndNil(DmRelatorios);
    FreeAndNil(DmDashboard);
    FreeAndNil(DM);
  end;

end.

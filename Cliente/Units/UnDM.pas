unit UnDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  System.Types,
  Winapi.Windows,
  Winapi.WinSvc, Datasnap.DBClient, Vcl.AppEvnts, System.ImageList, Vcl.ImgList,
  System.UITypes,
  Vcl.Dialogs,
  frxDBSet,
  Vcl.imaging.jpeg,
  Vcl.imaging.PNGImage,
  Vcl.ExtCtrls,
  System.DateUtils,
  Vcl.Graphics,
  System.Variants,
  Vcl.Grids,
  System.Win.ComObj, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  frxClass, frxExportBaseDialog, frxExportPDF, IdStack, Vcl.Mask, frxRich,
  FireDAC.VCLUI.Error, System.IniFiles, System.Win.Registry, System.Math,
  Winapi.ShellAPI, Vcl.Menus, IdURI, IdHTTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, System.Zip;

const
  OffsetMemoryStream : Int64 = 0;

type
  TDM = class(TDataModule)
    qryAcesso: TFDQuery;
    qryAlmoxarifado: TFDQuery;
    qryAlmoxarifadoCODIGO: TStringField;
    qryAlmoxarifadoCODEMPRESA: TStringField;
    qryAlmoxarifadoCODCENTROCUSTO: TStringField;
    qryAlmoxarifadoDESCRICAO: TStringField;
    qryAlmoxarifadoMATERIAL: TStringField;
    qryAlmoxarifadoNUMITENS: TIntegerField;
    qryAlmoxarifadoAREA: TIntegerField;
    qryAlmoxarifadoATIVO: TStringField;
    qryAlmoxarifadoVISIVEL: TStringField;
    qryAlmoxarifadoDATACADASTRO: TDateTimeField;
    qryAlmoxarifadoCODUSUARIOCAD: TStringField;
    qryAlmoxarifadoDATAULTALT: TDateTimeField;
    qryAlmoxarifadoCODUSUARIOALT: TStringField;
    qryAlmoxarifadoCENTROCUSTO: TStringField;
    qryAlmoxarifadoUSUARIOCAD: TStringField;
    qryAlmoxarifadoUSUARIOALT: TStringField;
    qryAreas: TFDQuery;
    qryAreasCODIGO: TStringField;
    qryAreasCODEMPRESA: TStringField;
    qryAreasDESCRICAO: TStringField;
    qryAreasATIVO: TStringField;
    qryAreasVISIVEL: TStringField;
    qryAreasFATORMARCHADM: TBCDField;
    qryAreasDATACADASTRO: TDateTimeField;
    qryAreasCODUSUARIOCAD: TStringField;
    qryAreasDATAULTALT: TDateTimeField;
    qryAreasCODUSUARIOALT: TStringField;
    qryAreasUSUARIOCAD: TStringField;
    qryAreasUSUARIOALT: TStringField;
    qryArquivoTecnico: TFDQuery;
    qryArquivoTecnicoCODIGO: TStringField;
    qryArquivoTecnicoCODEMPRESA: TStringField;
    qryArquivoTecnicoCODEQUIPAMENTO: TStringField;
    qryArquivoTecnicoCODEDITORA: TIntegerField;
    qryArquivoTecnicoCODTEMA: TIntegerField;
    qryArquivoTecnicoCODASSUNTO: TIntegerField;
    qryArquivoTecnicoCODLITERATURA: TIntegerField;
    qryArquivoTecnicoCODPROJETO: TIntegerField;
    qryArquivoTecnicoTIPO: TStringField;
    qryArquivoTecnicoDESCRICAO: TStringField;
    qryArquivoTecnicoCONJUNTO: TStringField;
    qryArquivoTecnicoAUTOR: TStringField;
    qryArquivoTecnicoNUMORIGINAL: TStringField;
    qryArquivoTecnicoNUMUNIDADE: TStringField;
    qryArquivoTecnicoESTANTE: TStringField;
    qryArquivoTecnicoPRATELEIRA: TStringField;
    qryArquivoTecnicoGAVETA: TStringField;
    qryArquivoTecnicoPASTA: TStringField;
    qryArquivoTecnicoARQUIVO: TStringField;
    qryArquivoTecnicoMAPOTECA: TStringField;
    qryArquivoTecnicoESTACAO: TStringField;
    qryArquivoTecnicoEMPRESTADO: TStringField;
    qryArquivoTecnicoDATACADASTRO: TDateTimeField;
    qryArquivoTecnicoCODUSUARIOCAD: TStringField;
    qryArquivoTecnicoDATAULTALT: TDateTimeField;
    qryArquivoTecnicoCODUSUARIOALT: TStringField;
    qryArquivoTecnicoDIVERSOS: TStringField;
    qryArquivoTecnicoOBSERVACOES: TBlobField;
    qryArquivoTecnicoEQUIPAMENTO: TStringField;
    qryArquivoTecnicoEDITORA: TStringField;
    qryArquivoTecnicoTEMA: TStringField;
    qryArquivoTecnicoASSUNTO: TStringField;
    qryArquivoTecnicoLITERATURA: TStringField;
    qryArquivoTecnicoPROJETO: TStringField;
    qryArquivoTecnicoUSUARIOCAD: TStringField;
    qryArquivoTecnicoUSUARIOALT: TStringField;
    qryArquivoTecnicoParam: TFDQuery;
    qryArquivoTecnicoParamCODIGO: TFDAutoIncField;
    qryArquivoTecnicoParamCODEMPRESA: TStringField;
    qryArquivoTecnicoParamTIPO: TStringField;
    qryArquivoTecnicoParamDESCRICAO: TStringField;
    qryArquivoTecnicoParamDATACADASTRO: TDateTimeField;
    qryArquivoTecnicoParamCODUSUARIOCAD: TStringField;
    qryArquivoTecnicoParamDATAULTALT: TDateTimeField;
    qryArquivoTecnicoParamCODUSUARIOALT: TStringField;
    qryArquivoTecnicoParamUSUARIOCAD: TStringField;
    qryArquivoTecnicoParamUSUARIOALT: TStringField;
    qryAuxiliar: TFDQuery;
    qryCalendEquip: TFDQuery;
    qryCalendEquipCODIGO: TStringField;
    qryCalendEquipCODEMPRESA: TStringField;
    qryCalendEquipDESCRICAO: TStringField;
    qryCalendEquipATIVO: TStringField;
    qryCalendEquipVISIVEL: TStringField;
    qryCalendEquipMAXHORAUTIL: TIntegerField;
    qryCalendEquipHOFICIAIS: TIntegerField;
    qryCalendEquipDATACADASTRO: TDateTimeField;
    qryCalendEquipCODUSUARIOCAD: TStringField;
    qryCalendEquipDATAULTALT: TDateTimeField;
    qryCalendEquipCODUSUARIOALT: TStringField;
    qryCalendEquipUSUARIOCAD: TStringField;
    qryCalendEquipUSUARIOALT: TStringField;
    qryCalendEquipSeqHora: TFDQuery;
    qryCalendEquipSeqHoraCODIGO: TFDAutoIncField;
    qryCalendEquipSeqHoraCODEMPRESA: TStringField;
    qryCalendEquipSeqHoraCODCALENDARIOEQUIP: TStringField;
    qryCalendEquipSeqHoraSEQUENCIA: TIntegerField;
    qryCalendEquipSeqHoraDATA: TDateTimeField;
    qryCalendEquipSeqHoraHORAINI1: TDateTimeField;
    qryCalendEquipSeqHoraHORAFIN1: TDateTimeField;
    qryCalendEquipSeqHoraHORAINI2: TDateTimeField;
    qryCalendEquipSeqHoraHORAFIN2: TDateTimeField;
    qryCalendEquipSeqHoraHORAINI3: TDateTimeField;
    qryCalendEquipSeqHoraHORAFIN3: TDateTimeField;
    qryCalendEquipSeqHoraHORAINI4: TDateTimeField;
    qryCalendEquipSeqHoraHORAFIN4: TDateTimeField;
    qryCalendMObra: TFDQuery;
    qryCalendMObraSeqHora: TFDQuery;
    qryCargos: TFDQuery;
    qryCargosCODIGO: TStringField;
    qryCargosDESCRICAO: TStringField;
    qryCargosDATACADASTRO: TDateTimeField;
    qryCargosCODUSUARIOCAD: TStringField;
    qryCargosDATAULTALT: TDateTimeField;
    qryCargosCODUSUARIOALT: TStringField;
    qryCargosUSUARIOCAD: TStringField;
    qryCargosUSUARIOALT: TStringField;
    qryCausaFalha: TFDQuery;
    qryCausaFalhaCODIGO: TStringField;
    qryCausaFalhaDESCRICAO: TStringField;
    qryCausaFalhaATIVO: TStringField;
    qryCausaFalhaVISIVEL: TStringField;
    qryCausaFalhaDATACADASTRO: TDateTimeField;
    qryCausaFalhaCODUSUARIOCAD: TStringField;
    qryCausaFalhaDATAULTALT: TDateTimeField;
    qryCausaFalhaCODUSUARIOALT: TStringField;
    qryCausaFalhaUSUARIOCAD: TStringField;
    qryCausaFalhaUSUARIOALT: TStringField;
    qryCelulas: TFDQuery;
    qryCelulasCODIGO: TStringField;
    qryCelulasCODEMPRESA: TStringField;
    qryCelulasCODAREA: TStringField;
    qryCelulasDESCRICAO: TStringField;
    qryCelulasTIPO: TStringField;
    qryCelulasFATORMARCHADM: TBCDField;
    qryCelulasDATACADASTRO: TDateTimeField;
    qryCelulasCODUSUARIOCAD: TStringField;
    qryCelulasDATAULTALT: TDateTimeField;
    qryCelulasCODUSUARIOALT: TStringField;
    qryCelulasAREA: TStringField;
    qryCelulasUSUARIOCAD: TStringField;
    qryCelulasUSUARIOALT: TStringField;
    qryCentroCusto: TFDQuery;
    qryCentroCustoCODIGO: TStringField;
    qryCentroCustoDESCRICAO: TStringField;
    qryCentroCustoATIVO: TStringField;
    qryCentroCustoVISIVEL: TStringField;
    qryCentroCustoDATACADASTRO: TDateTimeField;
    qryCentroCustoCODUSUARIOCAD: TStringField;
    qryCentroCustoDATAULTALT: TDateTimeField;
    qryCentroCustoCODUSUARIOALT: TStringField;
    qryCentroCustoUSUARIOCAD: TStringField;
    qryCentroCustoUSUARIOALT: TStringField;
    qryClasses: TFDQuery;
    qryClassesCODIGO: TStringField;
    qryClassesDESCRICAO: TStringField;
    qryClassesATIVO: TStringField;
    qryClassesVISIVEL: TStringField;
    qryClassesDATACADASTRO: TDateTimeField;
    qryClassesCODUSUARIOCAD: TStringField;
    qryClassesDATAULTALT: TDateTimeField;
    qryClassesCODUSUARIOALT: TStringField;
    qryClassesUSUARIOCAD: TStringField;
    qryClassesUSUARIOALT: TStringField;
    qryDataHoraServidor: TFDQuery;
    qryDataHoraServidordatahoraservidor: TDateTimeField;
    qryDespMensalDiversas: TFDQuery;
    qryDespMensalDiversasCODIGO: TFDAutoIncField;
    qryDespMensalDiversasCODEMPRESA: TStringField;
    qryDespMensalDiversasMES: TStringField;
    qryDespMensalDiversasANO: TStringField;
    qryDespMensalDiversasCOEFGRAVACID: TBCDField;
    qryDespMensalDiversasCOEFFREQACID: TBCDField;
    qryDespMensalDiversasCUSTOTOTALEST: TBCDField;
    qryDespMensalDiversasHORASNORMAISTRAB: TIntegerField;
    qryDespMensalDiversasCOTACAODOLAR: TBCDField;
    qryDespMensalFuncPer: TFDQuery;
    qryDespMensalManutencao: TFDQuery;
    qryDespMensalManutencaoCODIGO: TFDAutoIncField;
    qryDespMensalManutencaoCODEMPRESA: TStringField;
    qryDespMensalManutencaoMATRICULA: TStringField;
    qryDespMensalManutencaoMES: TStringField;
    qryDespMensalManutencaoANO: TStringField;
    qryDespMensalManutencaoDESPRECEQUIP: TBCDField;
    qryDespMensalManutencaoDESPMATDIVERSOS: TBCDField;
    qryDespMensalManutencaoDESPUTILRECURSOS: TBCDField;
    qryDespMensalManutencaoDESPMOBRAADM: TBCDField;
    qryDespMensalManutencaoDESPCUSTOTREIN: TBCDField;
    qryDespMensalManutencaoDESPCUSTOHE: TBCDField;
    qryDespMensalManutencaoDESPTOTAL: TBCDField;
    qryDespMensalManutencaoCustos: TFDQuery;
    qryDespMensalManutencaoCustosMOBRAADM: TFMTBCDField;
    qryDespMensalManutencaoCustosCUSTOTREINAM: TFMTBCDField;
    qryDespMensalManutencaoCustosMATREQ: TFMTBCDField;
    qryDespMensalManutencaoCustosHORASEXTRAS: TFMTBCDField;
    qryDespMensalManutencaoCustosRECURSOS: TFMTBCDField;
    qryDespMensalProdMensal: TFDQuery;
    qryDespMensalProdMensalCODIGO: TFDAutoIncField;
    qryDespMensalProdMensalCODEMPRESA: TStringField;
    qryDespMensalProdMensalCODAREA: TStringField;
    qryDespMensalProdMensalMES: TStringField;
    qryDespMensalProdMensalANO: TStringField;
    qryDespMensalProdMensalPRODFABRICADO: TStringField;
    qryDespMensalProdMensalTOTAL: TBCDField;
    qryDespMensalProdMensalTIPO: TStringField;
    qryDespMensalProdMensalAREA: TStringField;
    qryDespMensalTaxas: TFDQuery;
    qryDespMensalTaxasCODIGO: TFDAutoIncField;
    qryDespMensalTaxasCODEMPRESA: TStringField;
    qryDespMensalTaxasCODDESPTAXAPER: TIntegerField;
    qryDespMensalTaxasDESCRICAO: TStringField;
    qryDespMensalTaxasVALOR: TBCDField;
    qryDespMensalTaxasPer: TFDQuery;
    qryDespMensalTaxasPerCODIGO: TFDAutoIncField;
    qryDespMensalTaxasPerCODEMPRESA: TStringField;
    qryDespMensalTaxasPerMES: TStringField;
    qryDespMensalTaxasPerANO: TStringField;
    qryDespMensalTaxasPerDATAFECHAMENTO: TDateTimeField;
    qryDispAdmissiveis: TFDQuery;
    qryEquipamentosReservas: TFDQuery;
    qryEquipamentosSubst: TFDQuery;
    qryEquipamentosSubstHist: TFDQuery;
    qryEquipamentosSubstHistCODIGO: TFDAutoIncField;
    qryEquipamentosSubstHistCODEMPRESA: TStringField;
    qryEquipamentosSubstHistCODEQUIPAMENTO: TStringField;
    qryEquipamentosSubstHistCODEQUIPAMENTOPAI: TStringField;
    qryEquipamentosSubstHistCODEQUIPAMENTOSUBS: TStringField;
    qryEquipamentosSubstHistCODAREA: TStringField;
    qryEquipamentosSubstHistCODCELULA: TStringField;
    qryEquipamentosSubstHistCODLINHA: TStringField;
    qryEquipamentosSubstHistSEQUENCIA: TIntegerField;
    qryEquipamentosSubstHistDATAINSTALACAO: TDateTimeField;
    qryEquipamentosSubstHistDATARETIRADA: TDateTimeField;
    qryEquipamentosSubstHistCODUSUARIOALT: TStringField;
    qryEquipamentosSubstHistMOTIVOTROCA: TBlobField;
    qryEquipamentosSubstHistEQUIPAMENTO: TStringField;
    qryEquipamentosSubstHistAREA: TStringField;
    qryEquipamentosSubstHistCELULA: TStringField;
    qryEquipamentosSubstHistLINHA: TStringField;
    qryFabricantes: TFDQuery;
    qryFabricantesCODIGO: TStringField;
    qryFabricantesCODEMPRESA: TStringField;
    qryFabricantesDESCRICAO: TStringField;
    qryFabricantesID: TStringField;
    qryFabricantesENDERECO: TStringField;
    qryFabricantesEMAIL: TStringField;
    qryFabricantesFONE: TStringField;
    qryFabricantesCONTATO: TStringField;
    qryFabricantesATIVO: TStringField;
    qryFabricantesVISIVEL: TStringField;
    qryFabricantesDATACADASTRO: TDateTimeField;
    qryFabricantesCODUSUARIOCAD: TStringField;
    qryFabricantesDATAULTALT: TDateTimeField;
    qryFabricantesCODUSUARIOALT: TStringField;
    qryFabricantesUSUARIOCAD: TStringField;
    qryFabricantesUSUARIOALT: TStringField;
    qryFamEquipamento: TFDQuery;
    qryFamEquipamentoCODIGO: TStringField;
    qryFamEquipamentoDESCRICAO: TStringField;
    qryFamEquipamentoATIVO: TStringField;
    qryFamEquipamentoVISIVEL: TStringField;
    qryFamEquipamentoCAMPO1: TStringField;
    qryFamEquipamentoN1: TStringField;
    qryFamEquipamentoCAMPO2: TStringField;
    qryFamEquipamentoN2: TStringField;
    qryFamEquipamentoCAMPO3: TStringField;
    qryFamEquipamentoN3: TStringField;
    qryFamEquipamentoCAMPO4: TStringField;
    qryFamEquipamentoN4: TStringField;
    qryFamEquipamentoCAMPO5: TStringField;
    qryFamEquipamentoN5: TStringField;
    qryFamEquipamentoCAMPO6: TStringField;
    qryFamEquipamentoN6: TStringField;
    qryFamEquipamentoCAMPO7: TStringField;
    qryFamEquipamentoN7: TStringField;
    qryFamEquipamentoCAMPO8: TStringField;
    qryFamEquipamentoN8: TStringField;
    qryFamEquipamentoCAMPO9: TStringField;
    qryFamEquipamentoN9: TStringField;
    qryFamEquipamentoCAMPO10: TStringField;
    qryFamEquipamentoN10: TStringField;
    qryFamEquipamentoCAMPO11: TStringField;
    qryFamEquipamentoN11: TStringField;
    qryFamEquipamentoCAMPO12: TStringField;
    qryFamEquipamentoN12: TStringField;
    qryFamEquipamentoDATACADASTRO: TDateTimeField;
    qryFamEquipamentoCODUSUARIOCAD: TStringField;
    qryFamEquipamentoDATAULTALT: TDateTimeField;
    qryFamEquipamentoCODUSUARIOALT: TStringField;
    qryFamEquipamentoUSUARIOCAD: TStringField;
    qryFamEquipamentoUSUARIOALT: TStringField;
    qryFamPecasRep: TFDQuery;
    qryFamPecasRepCODIGO: TStringField;
    qryFamPecasRepDESCRICAO: TStringField;
    qryFamPecasRepATIVO: TStringField;
    qryFamPecasRepVISIVEL: TStringField;
    qryFamPecasRepCAMPO1: TStringField;
    qryFamPecasRepCAMPO2: TStringField;
    qryFamPecasRepCAMPO3: TStringField;
    qryFamPecasRepCAMPO4: TStringField;
    qryFamPecasRepCAMPO5: TStringField;
    qryFamPecasRepCAMPO6: TStringField;
    qryFamPecasRepCAMPO7: TStringField;
    qryFamPecasRepCAMPO8: TStringField;
    qryFamPecasRepCAMPO9: TStringField;
    qryFamPecasRepCAMPO10: TStringField;
    qryFamPecasRepCAMPO11: TStringField;
    qryFamPecasRepCAMPO12: TStringField;
    qryFamPecasRepDATACADASTRO: TDateTimeField;
    qryFamPecasRepCODUSUARIOCAD: TStringField;
    qryFamPecasRepDATAULTALT: TDateTimeField;
    qryFamPecasRepCODUSUARIOALT: TStringField;
    qryFamPecasRepUSUARIOCAD: TStringField;
    qryFamPecasRepUSUARIOALT: TStringField;
    qryFamPneus: TFDQuery;
    qryFamPneusCODIGO: TStringField;
    qryFamPneusDESCRICAO: TStringField;
    qryFamPneusATIVO: TStringField;
    qryFamPneusVISIVEL: TStringField;
    qryFamPneusCAMPO1: TStringField;
    qryFamPneusCAMPO2: TStringField;
    qryFamPneusCAMPO3: TStringField;
    qryFamPneusCAMPO4: TStringField;
    qryFamPneusCAMPO5: TStringField;
    qryFamPneusCAMPO6: TStringField;
    qryFamPneusCAMPO7: TStringField;
    qryFamPneusCAMPO8: TStringField;
    qryFamPneusCAMPO9: TStringField;
    qryFamPneusCAMPO10: TStringField;
    qryFamPneusCAMPO11: TStringField;
    qryFamPneusCAMPO12: TStringField;
    qryFamPneusDATACADASTRO: TDateTimeField;
    qryFamPneusCODUSUARIOCAD: TStringField;
    qryFamPneusDATAULTALT: TDateTimeField;
    qryFamPneusCODUSUARIOALT: TStringField;
    qryFamPneusUSUARIOCAD: TStringField;
    qryFamPneusUSUARIOALT: TStringField;
    qryFamRecursos: TFDQuery;
    qryFamRecursosCODIGO: TStringField;
    qryFamRecursosDESCRICAO: TStringField;
    qryFamRecursosATIVO: TStringField;
    qryFamRecursosVISIVEL: TStringField;
    qryFamRecursosCAMPO1: TStringField;
    qryFamRecursosCAMPO2: TStringField;
    qryFamRecursosCAMPO3: TStringField;
    qryFamRecursosCAMPO4: TStringField;
    qryFamRecursosCAMPO5: TStringField;
    qryFamRecursosCAMPO6: TStringField;
    qryFamRecursosCAMPO7: TStringField;
    qryFamRecursosCAMPO8: TStringField;
    qryFamRecursosCAMPO9: TStringField;
    qryFamRecursosCAMPO10: TStringField;
    qryFamRecursosCAMPO11: TStringField;
    qryFamRecursosCAMPO12: TStringField;
    qryFamRecursosDATACADASTRO: TDateTimeField;
    qryFamRecursosCODUSUARIOCAD: TStringField;
    qryFamRecursosDATAULTALT: TDateTimeField;
    qryFamRecursosCODUSUARIOALT: TStringField;
    qryFamRecursosUSUARIOCAD: TStringField;
    qryFamRecursosUSUARIOALT: TStringField;
    qryFeriados: TFDQuery;
    qryFeriadosCODIGO: TStringField;
    qryFeriadosCODEMPRESA: TStringField;
    qryFeriadosDESCRICAO: TStringField;
    qryFeriadosDATAFERIADO: TStringField;
    qryFeriadosDATACADASTRO: TDateTimeField;
    qryFeriadosCODUSUARIOCAD: TStringField;
    qryFeriadosDATAULTALT: TDateTimeField;
    qryFeriadosCODUSUARIOALT: TStringField;
    qryFeriadosUSUARIOCAD: TStringField;
    qryFeriadosUSUARIOALT: TStringField;
    qryFerramentaria: TFDQuery;
    qryFerramentariaCODIGO: TStringField;
    qryFerramentariaCODEMPRESA: TStringField;
    qryFerramentariaDESCRICAO: TStringField;
    qryFerramentariaDATACADASTRO: TDateTimeField;
    qryFerramentariaCODUSUARIOCAD: TStringField;
    qryFerramentariaDATAULTALT: TDateTimeField;
    qryFerramentariaCODUSUARIOALT: TStringField;
    qryFerramentariaUSUARIOCAD: TStringField;
    qryFerramentariaUSUARIOALT: TStringField;
    qryFerramentariaItens: TFDQuery;
    qryFerramentariaItensCODIGO: TFDAutoIncField;
    qryFerramentariaItensCODEMPRESA: TStringField;
    qryFerramentariaItensCODFERRAMEM: TStringField;
    qryFerramentariaItensCODRECURSO: TStringField;
    qryFerramentariaItensQUANTIDADE: TIntegerField;
    qryFerramentariaItensSTATUS: TStringField;
    qryFerramentariaItensDATAEMPRESTIMO: TDateTimeField;
    qryFerramentariaItensRECURSO: TStringField;
    qryFormatoCodigo: TFDQuery;
    qryFormatoCodigoCODIGO: TFDAutoIncField;
    qryFormatoCodigoALMOXARIFADO: TStringField;
    qryFormatoCodigoAREAS: TStringField;
    qryFormatoCodigoARQUIVOTECNICO: TStringField;
    qryFormatoCodigoCALENDARIOEQUIP: TStringField;
    qryFormatoCodigoCALENDARIO: TStringField;
    qryFormatoCodigoCARGOS: TStringField;
    qryFormatoCodigoCAUSASFALHA: TStringField;
    qryFormatoCodigoCELULAS: TStringField;
    qryFormatoCodigoCENTROCUSTO: TStringField;
    qryFormatoCodigoCLASSES: TStringField;
    qryFormatoCodigoPNEUS: TStringField;
    qryFormatoCodigoDESTECNICO: TStringField;
    qryFormatoCodigoEMPRESA: TStringField;
    qryFormatoCodigoEQUIPAMENTOS: TStringField;
    qryFormatoCodigoFABRICANTE: TStringField;
    qryFormatoCodigoFAMILIAEQUIPAMENTO: TStringField;
    qryFormatoCodigoFAMILIAPNEUS: TStringField;
    qryFormatoCodigoFAMILIAPECASREPOSICAO: TStringField;
    qryFormatoCodigoFAMILIARECURSOS: TStringField;
    qryFormatoCodigoFERIADOS: TStringField;
    qryFormatoCodigoFORNECEDOR: TStringField;
    qryFormatoCodigoLUBRIFICANTES: TStringField;
    qryFormatoCodigoLUBRIFICPROGFAMEQUIPAMENTO: TStringField;
    qryFormatoCodigoLUBRIFICPROGEQUIPAMENTO: TStringField;
    qryFormatoCodigoMANUTPROGFAMEQUIPAMENTO: TStringField;
    qryFormatoCodigoMANUTPROGEQUIPAMENTO: TStringField;
    qryFormatoCodigoMOTIVOPARADA: TStringField;
    qryFormatoCodigoNATUREZAFINANCEIRA: TStringField;
    qryFormatoCodigoOFICINAS: TStringField;
    qryFormatoCodigoPONTOSINSPECAO: TStringField;
    qryFormatoCodigoPECASREPOSICAO: TStringField;
    qryFormatoCodigoPECASREPOSICAOKIT: TStringField;
    qryFormatoCodigoPLANOTRABALHO: TStringField;
    qryFormatoCodigoRECURSOS: TStringField;
    qryFormatoCodigoTIPOPROGRAMACAO: TStringField;
    qryFormatoCodigoRECURSOSKIT: TStringField;
    qryFormatoCodigoUSUARIO: TStringField;
    qryFormatoCodigoTIPOMANUTENCAO: TStringField;
    qryFornecedores: TFDQuery;
    qryFornecedoresCODIGO: TStringField;
    qryFornecedoresCODEMPRESA: TStringField;
    qryFornecedoresDESCRICAO: TStringField;
    qryFornecedoresID: TStringField;
    qryFornecedoresENDERECO: TStringField;
    qryFornecedoresEMAIL: TStringField;
    qryFornecedoresFONE: TStringField;
    qryFornecedoresCONTATO: TStringField;
    qryFornecedoresATIVO: TStringField;
    qryFornecedoresVISIVEL: TStringField;
    qryFornecedoresDATACADASTRO: TDateTimeField;
    qryFornecedoresCODUSUARIOCAD: TStringField;
    qryFornecedoresDATAULTALT: TDateTimeField;
    qryFornecedoresCODUSUARIOALT: TStringField;
    qryFornecedoresUSUARIOCAD: TStringField;
    qryFornecedoresUSUARIOALT: TStringField;
    qryGerarOS: TFDQuery;
    qryGerarOSCODIGO: TFDAutoIncField;
    qryGerarOSCODEMPRESA: TStringField;
    qryGerarOSCODEQUIPAMENTO: TStringField;
    qryGerarOSMATRICULA: TStringField;
    qryGerarOSCODMANUTPROGEQUIP: TStringField;
    qryGerarOSCODLUBRIFICPROGEQUIP: TStringField;
    qryGerarOSDESCRICAO: TStringField;
    qryGerarOSPRIORIDADEPARADA: TStringField;
    qryGerarOSCRITICIDADE: TStringField;
    qryGerarOSROTAEQUIP: TStringField;
    qryGerarOSEQUIPPARADO: TStringField;
    qryGerarOSATIVO: TStringField;
    qryGerarOSVISIVEL: TStringField;
    qryGerarOSTEMPOPREVISTO: TBCDField;
    qryGerarOSSOLICTRAB: TStringField;
    qryGerarOSSITUACAO: TStringField;
    qryGerarOSEXECAUTONOMO: TStringField;
    qryGerarOSIMPPLANOTRAB: TStringField;
    qryGerarOSREPROGRAMADA: TStringField;
    qryGerarOSPARCIAL: TStringField;
    qryGerarOSCUSTOMOBRA: TBCDField;
    qryGerarOSCUSTORECURSOS: TBCDField;
    qryGerarOSCUSTOPECAS: TBCDField;
    qryGerarOSCUSTOEXTRA: TBCDField;
    qryGerarOSCUSTOSECUNDARIOS: TBCDField;
    qryGerarOSQTDEREPROG: TSmallintField;
    qryGerarOSTEMPOEXECUTADO: TBCDField;
    qryGerarOSTEMPOHOMEMHORA: TBCDField;
    qryGerarOSTEMPOHOMEMHORAEXEC: TBCDField;
    qryGerarOSDATACADASTRO: TDateTimeField;
    qryGerarOSDATAULTALT: TDateTimeField;
    qryGerarOSCODUSUARIOCAD: TStringField;
    qryGerarOSCODUSUARIOALT: TStringField;
    qryImagens: TFDQuery;
    qryIndDesempenho: TFDQuery;
    qryIndDesempenhoCODIGO: TFDAutoIncField;
    qryIndDesempenhoCODEMPRESA: TStringField;
    qryIndDesempenhoMES: TStringField;
    qryIndDesempenhoANO: TStringField;
    qryIndDesempenhoDISPEQUIP: TBCDField;
    qryIndDesempenhoMANUTCORRET: TBCDField;
    qryIndDesempenhoHORASMANUTCORRET: TBCDField;
    qryIndDesempenhoMANUTPREV: TBCDField;
    qryIndDesempenhoHORASMANUTPREV: TBCDField;
    qryIndDesempenhoMANUTPRED: TBCDField;
    qryIndDesempenhoHORASMANUTPRED: TBCDField;
    qryIndDesempenhoOUTROSSERV: TBCDField;
    qryIndDesempenhoHORASOUTROSSERV: TBCDField;
    qryIndDesempenhoNAOCONFORM: TBCDField;
    qryIndDesempenhoHORASEXTRASUNID: TBCDField;
    qryIndDesempenhoHORAEXTRAMEC: TBCDField;
    qryIndDesempenhoFREQACIDMEC: TBCDField;
    qryIndDesempenhoGRAVACIDMEC: TBCDField;
    qryIndDesempenhoHORAEXTRAELE: TBCDField;
    qryIndDesempenhoFREQACIDELE: TBCDField;
    qryIndDesempenhoGRAVACIDELE: TBCDField;
    qryIndDesempenhoHORAEXTRACIV: TBCDField;
    qryIndDesempenhoFREQACIDCIV: TBCDField;
    qryIndDesempenhoGRAVACIDCIV: TBCDField;
    qryIndDesempenhoHORAEXTRAAPTEC: TBCDField;
    qryIndDesempenhoFREQACIDAPTEC: TBCDField;
    qryIndDesempenhoGRAVACIDAPTEC: TBCDField;
    qryIndDesempenhoCUSTOAREAMANUT: TBCDField;
    qryIndDesempenhoCUSTOCELMEC: TBCDField;
    qryIndDesempenhoCUSTOCELELET: TBCDField;
    qryIndDesempenhoCUSTOCELCIV: TBCDField;
    qryIndDesempenhoCUSTOCELAPTEC: TBCDField;
    qryIndDesempenhoCUSTOTREINMANUT: TBCDField;
    qryIndDesempenhoCUSTOTERCMANUT: TBCDField;
    qryIndDesempenhoCUSTOESTMANUT: TBCDField;
    qryIndDesempenhoCUSTOTOTALMANUT: TBCDField;
    qryIndDesempenhoCUSTODESPMANUT: TBCDField;
    qryIndDesempPercParadas: TFDQuery;
    qryIndDesempPercParadasTOTALOS: TLargeintField;
    qryIndDesempPercParadasPERCENTCORRET: TFMTBCDField;
    qryIndDesempPercParadasPERCENTPREV: TFMTBCDField;
    qryIndDesempPercParadasPERCENTPRED: TFMTBCDField;
    qryIndDesempPercParadasPERCENTOUTROS: TFMTBCDField;
    qryIndDesempTotalHE: TFDQuery;
    qryIndDesempTotalHEHORAEXTRAMEC: TFMTBCDField;
    qryIndDesempTotalHEHORAEXTRAELE: TFMTBCDField;
    qryIndDesempTotalHEHORAEXTRACIV: TFMTBCDField;
    qryIndDesempTotalHEHORAEXTRAAPT: TFMTBCDField;
    qryIndDesempTotalHEHORAEXTRAPROD: TFMTBCDField;
    qryLinhas: TFDQuery;
    qryLinhasCODIGO: TStringField;
    qryLinhasCODEMPRESA: TStringField;
    qryLinhasCODAREA: TStringField;
    qryLinhasCODCELULA: TStringField;
    qryLinhasDESCRICAO: TStringField;
    qryLinhasDATACADASTRO: TDateTimeField;
    qryLinhasCODUSUARIOCAD: TStringField;
    qryLinhasDATAULTALT: TDateTimeField;
    qryLinhasCODUSUARIOALT: TStringField;
    qryLinhasAREA: TStringField;
    qryLinhasCELULA: TStringField;
    qryLinhasUSUARIOCAD: TStringField;
    qryLinhasUSUARIOALT: TStringField;
    qryLogin: TFDQuery;
    qryLubrificantes: TFDQuery;
    qryLubrificantesCODIGO: TStringField;
    qryLubrificantesCODEMPRESA: TStringField;
    qryLubrificantesCODFABRICANTE: TStringField;
    qryLubrificantesCODFORNECEDOR: TStringField;
    qryLubrificantesCODLOCALIZACAO: TStringField;
    qryLubrificantesDESCRICAO: TStringField;
    qryLubrificantesOLEO: TStringField;
    qryLubrificantesVISCOSIDADE: TBCDField;
    qryLubrificantesPONTOFULGOR: TBCDField;
    qryLubrificantesGRAUISO: TBCDField;
    qryLubrificantesGRAUACMA: TBCDField;
    qryLubrificantesDENSIDADE: TBCDField;
    qryLubrificantesPONTOFLUIDEZ: TBCDField;
    qryLubrificantesGRAUNLGI: TBCDField;
    qryLubrificantesPENETRACAO: TBCDField;
    qryLubrificantesPONTOGOTA: TBCDField;
    qryLubrificantesANTIDESGASTE: TStringField;
    qryLubrificantesANTICORROZIVO: TStringField;
    qryLubrificantesANTIOXIDANTE: TStringField;
    qryLubrificantesANTIFERRUGEM: TStringField;
    qryLubrificantesANTIESPUMANTE: TStringField;
    qryLubrificantesEXTREMAPRESSAO: TStringField;
    qryLubrificantesDETERGENTE: TStringField;
    qryLubrificantesDISPERSANTE: TStringField;
    qryLubrificantesSINTETICO: TStringField;
    qryLubrificantesESTOCADO: TStringField;
    qryLubrificantesQTDETOTALUTIL: TBCDField;
    qryLubrificantesCONSMEDIOANUAL: TBCDField;
    qryLubrificantesQTDEDIASRESUP: TBCDField;
    qryLubrificantesULTPRECO: TBCDField;
    qryLubrificantesCATALOGO: TStringField;
    qryLubrificantesCRITICIDADE: TStringField;
    qryLubrificantesCODUNIDADE: TStringField;
    qryLubrificantesATIVO: TStringField;
    qryLubrificantesVISIVEL: TStringField;
    qryLubrificantesDATACADASTRO: TDateTimeField;
    qryLubrificantesCODUSUARIOCAD: TStringField;
    qryLubrificantesDATAULTALT: TDateTimeField;
    qryLubrificantesCODUSUARIOALT: TStringField;
    qryLubrificantesOBSERVACOES: TBlobField;
    qryLubrificantesAREA: TStringField;
    qryLubrificantesFABRICANTE: TStringField;
    qryLubrificantesFORNECEDOR: TStringField;
    qryLubrificantesUSUARIOCAD: TStringField;
    qryLubrificantesUSUARIOALT: TStringField;
    qryLubrificPeriodicasHist: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField23: TStringField;
    StringField24: TStringField;
    SmallintField2: TSmallintField;
    DateTimeField6: TDateTimeField;
    StringField25: TStringField;
    IntegerField6: TIntegerField;
    StringField26: TStringField;
    DateTimeField7: TDateTimeField;
    DateTimeField8: TDateTimeField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    DateTimeField9: TDateTimeField;
    DateTimeField10: TDateTimeField;
    StringField33: TStringField;
    qryLubrificPeriodicasHistCODFAMILIAEQUIP: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    qryLubrificProgEquip: TFDQuery;
    qryLubrificProgEquipCODIGO: TStringField;
    qryLubrificProgEquipCODEMPRESA: TStringField;
    qryLubrificProgEquipCODEQUIPAMENTO: TStringField;
    qryLubrificProgEquipCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgEquipCODMONITORAMENTO: TIntegerField;
    qryLubrificProgEquipMATRICULA: TStringField;
    qryLubrificProgEquipDESCRICAO: TStringField;
    qryLubrificProgEquipCRITICIDADE: TStringField;
    qryLubrificProgEquipFREQUENCIA1: TSmallintField;
    qryLubrificProgEquipDTAINICIO1: TDateTimeField;
    qryLubrificProgEquipREPROGRAMAR1: TStringField;
    qryLubrificProgEquipFREQUENCIA2: TIntegerField;
    qryLubrificProgEquipREPROGRAMAR2: TStringField;
    qryLubrificProgEquipLEITURA: TIntegerField;
    qryLubrificProgEquipRELATORIO: TStringField;
    qryLubrificProgEquipGRUPOINSP: TStringField;
    qryLubrificProgEquipDATACADASTRO: TDateTimeField;
    qryLubrificProgEquipCODUSUARIOCAD: TStringField;
    qryLubrificProgEquipDATAULTALT: TDateTimeField;
    qryLubrificProgEquipCODUSUARIOALT: TStringField;
    qryLubrificProgEquipOBSERVACOES: TBlobField;
    qryLubrificProgEquipUSUARIOCAD: TStringField;
    qryLubrificProgEquipUSUARIOALT: TStringField;
    qryLubrificProgEquipDESCLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgEquipPROGRAMACAO2: TStringField;
    qryLubrificProgEquipEQUIPAMENTO: TStringField;
    qryLubrificProgEquipROTA: TStringField;
    qryLubrificProgEquipRESPONSAVEL: TStringField;
    qryLubrificProgEquipItens: TFDQuery;
    qryLubrificProgEquipItensCODIGO: TIntegerField;
    qryLubrificProgEquipItensCODEMPRESA: TStringField;
    qryLubrificProgEquipItensCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgEquipItensCODPARTE: TIntegerField;
    qryLubrificProgEquipItensITEM: TStringField;
    qryLubrificProgEquipItensDESCINSPECAO: TStringField;
    qryLubrificProgEquipItensEQUIPPARADO: TStringField;
    qryLubrificProgEquipItensTEMPO: TBCDField;
    qryLubrificProgEquipItensEXECAUTONOMO: TStringField;
    qryLubrificProgEquipItensPARTE: TStringField;
    qryLubrificProgEquipItensEsp: TFDQuery;
    qryLubrificProgEquipItensEspCODIGO: TFDAutoIncField;
    qryLubrificProgEquipItensEspCODEMPRESA: TStringField;
    qryLubrificProgEquipItensEspCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificProgEquipItensEspCODPARTE: TIntegerField;
    qryLubrificProgEquipItensEspITEM: TStringField;
    qryLubrificProgEquipItensEspDESCINSPECAO: TStringField;
    qryLubrificProgEquipItensEspEQUIPPARADO: TStringField;
    qryLubrificProgEquipItensEspTEMPO: TBCDField;
    qryLubrificProgEquipItensEspEXECAUTONOMO: TStringField;
    qryLubrificProgEquipItensEspEXECUTADO: TStringField;
    qryLubrificProgEquipItensEspBOM: TStringField;
    qryLubrificProgEquipItensEspREGULAR: TStringField;
    qryLubrificProgEquipItensEspRUIM: TStringField;
    qryLubrificProgEquipItensEspPARTE: TStringField;
    qryLubrificProgEquipItensEspApagar: TFDQuery;
    qryManutPeriodicasHist: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField3: TIntegerField;
    StringField8: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    DateTimeField4: TDateTimeField;
    DateTimeField5: TDateTimeField;
    StringField15: TStringField;
    qryManutPeriodicasHistCODFAMILIAEQUIP: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    qryManutVenc: TFDQuery;
    qryMotivoParada: TFDQuery;
    qryMotivoParadaCODIGO: TStringField;
    qryMotivoParadaDESCRICAO: TStringField;
    qryMotivoParadaATIVO: TStringField;
    qryMotivoParadaVISIVEL: TStringField;
    qryMotivoParadaDATACADASTRO: TDateTimeField;
    qryMotivoParadaCODUSUARIOCAD: TStringField;
    qryMotivoParadaDATAULTALT: TDateTimeField;
    qryMotivoParadaCODUSUARIOALT: TStringField;
    qryMotivoParadaUSUARIOCAD: TStringField;
    qryMotivoParadaUSUARIOALT: TStringField;
    qryNivelAcesso: TFDQuery;
    qryNivelAcessoCODIGO: TStringField;
    qryNivelAcessoCODEMPRESA: TStringField;
    qryNivelAcessoDESCRICAO: TStringField;
    qryNivelAcessoDATACADASTRO: TDateTimeField;
    qryNivelAcessoCODUSUARIOCAD: TStringField;
    qryNivelAcessoDATAULTALT: TDateTimeField;
    qryNivelAcessoCODUSUARIOALT: TStringField;
    qryOficinas: TFDQuery;
    qryOficinasCODIGO: TStringField;
    qryOficinasCODEMPRESA: TStringField;
    qryOficinasCODCENTROCUSTO: TStringField;
    qryOficinasDESCRICAO: TStringField;
    qryOficinasDATACADASTRO: TDateTimeField;
    qryOficinasCODUSUARIOCAD: TStringField;
    qryOficinasDATAULTALT: TDateTimeField;
    qryOficinasCODUSUARIOALT: TStringField;
    qryOficinasCENTROCUSTO: TStringField;
    qryOficinasUSUARIOCAD: TStringField;
    qryOficinasUSUARIOALT: TStringField;
    qryParadasDiariasEquip: TFDQuery;
    qryParadasDiariasEquipCODIGO: TStringField;
    qryParadasDiariasEquipCODEMPRESA: TStringField;
    qryParadasDiariasEquipDESCRICAO: TStringField;
    qryParadasDiariasEquipSECUNDARIO: TStringField;
    qryParadasDiariasEquipDateField1: TDateField;
    qryParadasDiariasEquipDateField2: TDateField;
    qryParadasDiariasEquipDateField3: TDateField;
    qryParadasDiariasEquipDateField4: TDateField;
    qryParadasDiariasEquipDateField5: TDateField;
    qryParadasDiariasEquipDateField6: TDateField;
    qryParadasDiariasEquipDateField7: TDateField;
    qryParadasDiariasEquipDateField8: TDateField;
    qryParadasDiariasEquipDateField9: TDateField;
    qryParadasDiariasEquipDateField10: TDateField;
    qryParadasDiariasEquipDateField11: TDateField;
    qryParadasDiariasEquipDateField12: TDateField;
    qryParadasDiariasEquipDateField13: TDateField;
    qryParadasDiariasEquipDateField14: TDateField;
    qryParadasDiariasEquipDateField15: TDateField;
    qryParadasDiariasEquipDateField16: TDateField;
    qryParadasDiariasEquipDateField17: TDateField;
    qryParadasDiariasEquipDateField18: TDateField;
    qryParadasDiariasEquipDateField19: TDateField;
    qryParadasDiariasEquipDateField20: TDateField;
    qryParadasDiariasEquipDateField21: TDateField;
    qryParadasDiariasEquipDateField22: TDateField;
    qryParadasDiariasEquipDateField23: TDateField;
    qryParadasDiariasEquipDateField24: TDateField;
    qryParadasDiariasEquipDateField25: TDateField;
    qryParadasDiariasEquipDateField26: TDateField;
    qryParadasDiariasEquipDateField27: TDateField;
    qryParadasDiariasEquipDateField28: TDateField;
    qryParadasDiariasEquipDateField29: TDateField;
    qryParadasDiariasEquipDateField30: TDateField;
    qryParadasDiariasEquipDateField31: TDateField;
    qryParadasDiariasEquipParadas: TFDQuery;
    qryParadasDiariasEquipParadasCODEQUIPAMENTO: TStringField;
    qryParadasDiariasEquipParadasDATAINICIOREAL: TDateTimeField;
    qryParadasDiariasEquipParadasDATAFIMREAL: TDateTimeField;
    qryParadasDiariasEquipParadasFALHA: TStringField;
    qryParadasDiariasEquipParadasPARADA: TStringField;
    qryParadasDiariasEquipParadasTIPOMANUTENCAO: TStringField;
    qryPecaReposicaoKit: TFDQuery;
    qryPecaReposicaoKitCODIGO: TStringField;
    qryPecaReposicaoKitCODEMPRESA: TStringField;
    qryPecaReposicaoKitDESCRICAO: TStringField;
    qryPecaReposicaoKitQUANTIDADE: TIntegerField;
    qryPecaReposicaoKitQTDERESERV: TIntegerField;
    qryPecaReposicaoKitDATACADASTRO: TDateTimeField;
    qryPecaReposicaoKitCODUSUARIOCAD: TStringField;
    qryPecaReposicaoKitDATAULTALT: TDateTimeField;
    qryPecaReposicaoKitCODUSUARIOALT: TStringField;
    qryPecaReposicaoKitUSUARIOCAD: TStringField;
    qryPecaReposicaoKitUSUARIOALT: TStringField;
    qryPecaReposicaoKitItens: TFDQuery;
    qryPermissoesAcesso: TFDQuery;
    qryPermissoesAcessoCODIGO: TFDAutoIncField;
    qryPermissoesAcessoCODNIVELACESSO: TStringField;
    qryPermissoesAcessoPESSOAL: TStringField;
    qryPermissoesAcessoCADALMOXARIFADO: TStringField;
    qryPermissoesAcessoCADAREAS: TStringField;
    qryPermissoesAcessoCADARQUIVOTECNICO: TStringField;
    qryPermissoesAcessoCADCALENDARIOOS: TStringField;
    qryPermissoesAcessoCADCALENDEQUIP: TStringField;
    qryPermissoesAcessoCADCALENDMOBRA: TStringField;
    qryPermissoesAcessoCADCARGOS: TStringField;
    qryPermissoesAcessoCADCAUSASFALHA: TStringField;
    qryPermissoesAcessoCADCENTROCUSTO: TStringField;
    qryPermissoesAcessoCADCLASSES: TStringField;
    qryPermissoesAcessoCADCONFIABILIDADE: TStringField;
    qryPermissoesAcessoCADCONSULTAS: TStringField;
    qryPermissoesAcessoCADCONTROLEPNEUS: TStringField;
    qryPermissoesAcessoCADDISPONIBILIDADE: TStringField;
    qryPermissoesAcessoCADEQUIPAMENTOS: TStringField;
    qryPermissoesAcessoCADFABRICANTES: TStringField;
    qryPermissoesAcessoCADFAMILIAEQUIP: TStringField;
    qryPermissoesAcessoCADFAMILIAPECASREP: TStringField;
    qryPermissoesAcessoCADFAMILIARECURSOS: TStringField;
    qryPermissoesAcessoCADFECHAMANUT: TStringField;
    qryPermissoesAcessoCADFERIADOS: TStringField;
    qryPermissoesAcessoCADFORMATOCODIGO: TStringField;
    qryPermissoesAcessoCADFORNECEDORES: TStringField;
    qryPermissoesAcessoCADFUNCIONARIOS: TStringField;
    qryPermissoesAcessoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesAcessoCADHISTORICOEQUIP: TStringField;
    qryPermissoesAcessoCADIMANGENS: TStringField;
    qryPermissoesAcessoCADINDDESEMPENHO: TStringField;
    qryPermissoesAcessoCADINFMENSAIS: TStringField;
    qryPermissoesAcessoCADLUBRIFICANTES: TStringField;
    qryPermissoesAcessoCADLUBRIFICPROG: TStringField;
    qryPermissoesAcessoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesAcessoCADMANUTENCAO: TStringField;
    qryPermissoesAcessoCADMANUTPROG: TStringField;
    qryPermissoesAcessoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesAcessoCADMAODEOBRAESP: TStringField;
    qryPermissoesAcessoCADMONITORAMENTO: TStringField;
    qryPermissoesAcessoCADMOTIVOPARADA: TStringField;
    qryPermissoesAcessoCADNAVEGACAO: TStringField;
    qryPermissoesAcessoCADOFICINAS: TStringField;
    qryPermissoesAcessoCADORDEMSERVICO: TStringField;
    qryPermissoesAcessoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesAcessoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesAcessoCADPECASREP: TStringField;
    qryPermissoesAcessoCADPECASREPINST: TStringField;
    qryPermissoesAcessoCADPECASREPKIT: TStringField;
    qryPermissoesAcessoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesAcessoCADPERMISSOES: TStringField;
    qryPermissoesAcessoCADPLANOTRAB: TStringField;
    qryPermissoesAcessoCADPONTOSINSPECAO: TStringField;
    qryPermissoesAcessoCADRECURSOS: TStringField;
    qryPermissoesAcessoCADRECURSOSKIT: TStringField;
    qryPermissoesAcessoCADRELATINSP: TStringField;
    qryPermissoesAcessoCADRELATORIOS: TStringField;
    qryPermissoesAcessoCADRESERVA: TStringField;
    qryPermissoesAcessoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesAcessoCADTERCEIRIZADAS: TStringField;
    qryPermissoesAcessoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesAcessoCADUSUARIOS: TStringField;
    qryPermissoesAcessoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesAcessoCADFERRAMENTARIA: TStringField;
    qryPermissoesAcessoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesAcessoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesAcessoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesAcessoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesAcessoCADORDEMSERVICOLIBERAR: TStringField;
    qryPermissoesAcessoNOME: TStringField;
    qryPermissoesAcessoCODUSUARIO: TStringField;
    qryPermissoesAcessoMATRICULA: TStringField;
    qryPermissoesAcessoNIVELACESSO: TStringField;
    qryPermissoesAcessoPadrao: TFDQuery;
    qryPermissoesAcessoPadraoCODIGO: TFDAutoIncField;
    qryPermissoesAcessoPadraoCODNIVELACESSO: TStringField;
    qryPermissoesAcessoPadraoPESSOAL: TStringField;
    qryPermissoesAcessoPadraoCADALMOXARIFADO: TStringField;
    qryPermissoesAcessoPadraoCADAREAS: TStringField;
    qryPermissoesAcessoPadraoCADARQUIVOTECNICO: TStringField;
    qryPermissoesAcessoPadraoCADCALENDARIOOS: TStringField;
    qryPermissoesAcessoPadraoCADCALENDEQUIP: TStringField;
    qryPermissoesAcessoPadraoCADCALENDMOBRA: TStringField;
    qryPermissoesAcessoPadraoCADCARGOS: TStringField;
    qryPermissoesAcessoPadraoCADCAUSASFALHA: TStringField;
    qryPermissoesAcessoPadraoCADCENTROCUSTO: TStringField;
    qryPermissoesAcessoPadraoCADCLASSES: TStringField;
    qryPermissoesAcessoPadraoCADCONFIABILIDADE: TStringField;
    qryPermissoesAcessoPadraoCADCONSULTAS: TStringField;
    qryPermissoesAcessoPadraoCADCONTROLEPNEUS: TStringField;
    qryPermissoesAcessoPadraoCADDISPONIBILIDADE: TStringField;
    qryPermissoesAcessoPadraoCADEQUIPAMENTOS: TStringField;
    qryPermissoesAcessoPadraoCADFABRICANTES: TStringField;
    qryPermissoesAcessoPadraoCADFAMILIAEQUIP: TStringField;
    qryPermissoesAcessoPadraoCADFAMILIAPECASREP: TStringField;
    qryPermissoesAcessoPadraoCADFAMILIARECURSOS: TStringField;
    qryPermissoesAcessoPadraoCADFECHAMANUT: TStringField;
    qryPermissoesAcessoPadraoCADFERIADOS: TStringField;
    qryPermissoesAcessoPadraoCADFORMATOCODIGO: TStringField;
    qryPermissoesAcessoPadraoCADFORNECEDORES: TStringField;
    qryPermissoesAcessoPadraoCADFUNCIONARIOS: TStringField;
    qryPermissoesAcessoPadraoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesAcessoPadraoCADHISTORICOEQUIP: TStringField;
    qryPermissoesAcessoPadraoCADIMANGENS: TStringField;
    qryPermissoesAcessoPadraoCADINDDESEMPENHO: TStringField;
    qryPermissoesAcessoPadraoCADINFMENSAIS: TStringField;
    qryPermissoesAcessoPadraoCADLUBRIFICANTES: TStringField;
    qryPermissoesAcessoPadraoCADLUBRIFICPROG: TStringField;
    qryPermissoesAcessoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesAcessoPadraoCADMANUTENCAO: TStringField;
    qryPermissoesAcessoPadraoCADMANUTPROG: TStringField;
    qryPermissoesAcessoPadraoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesAcessoPadraoCADMAODEOBRAESP: TStringField;
    qryPermissoesAcessoPadraoCADMONITORAMENTO: TStringField;
    qryPermissoesAcessoPadraoCADMOTIVOPARADA: TStringField;
    qryPermissoesAcessoPadraoCADNAVEGACAO: TStringField;
    qryPermissoesAcessoPadraoCADOFICINAS: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICO: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesAcessoPadraoCADPECASREP: TStringField;
    qryPermissoesAcessoPadraoCADPECASREPINST: TStringField;
    qryPermissoesAcessoPadraoCADPECASREPKIT: TStringField;
    qryPermissoesAcessoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesAcessoPadraoCADPERMISSOES: TStringField;
    qryPermissoesAcessoPadraoCADPLANOTRAB: TStringField;
    qryPermissoesAcessoPadraoCADPONTOSINSPECAO: TStringField;
    qryPermissoesAcessoPadraoCADRECURSOS: TStringField;
    qryPermissoesAcessoPadraoCADRECURSOSKIT: TStringField;
    qryPermissoesAcessoPadraoCADRELATINSP: TStringField;
    qryPermissoesAcessoPadraoCADRELATORIOS: TStringField;
    qryPermissoesAcessoPadraoCADRESERVA: TStringField;
    qryPermissoesAcessoPadraoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesAcessoPadraoCADTERCEIRIZADAS: TStringField;
    qryPermissoesAcessoPadraoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesAcessoPadraoCADUSUARIOS: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesAcessoPadraoCADFERRAMENTARIA: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesAcessoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    qryPermissoesAlteracao: TFDQuery;
    qryPermissoesAlteracaoCODIGO: TFDAutoIncField;
    qryPermissoesAlteracaoCODNIVELACESSO: TStringField;
    qryPermissoesAlteracaoPESSOAL: TStringField;
    qryPermissoesAlteracaoCADALMOXARIFADO: TStringField;
    qryPermissoesAlteracaoCADAREAS: TStringField;
    qryPermissoesAlteracaoCADARQUIVOTECNICO: TStringField;
    qryPermissoesAlteracaoCADCALENDARIOOS: TStringField;
    qryPermissoesAlteracaoCADCALENDEQUIP: TStringField;
    qryPermissoesAlteracaoCADCALENDMOBRA: TStringField;
    qryPermissoesAlteracaoCADCARGOS: TStringField;
    qryPermissoesAlteracaoCADCAUSASFALHA: TStringField;
    qryPermissoesAlteracaoCADCENTROCUSTO: TStringField;
    qryPermissoesAlteracaoCADCLASSES: TStringField;
    qryPermissoesAlteracaoCADCONFIABILIDADE: TStringField;
    qryPermissoesAlteracaoCADCONSULTAS: TStringField;
    qryPermissoesAlteracaoCADCONTROLEPNEUS: TStringField;
    qryPermissoesAlteracaoCADDISPONIBILIDADE: TStringField;
    qryPermissoesAlteracaoCADEQUIPAMENTOS: TStringField;
    qryPermissoesAlteracaoCADFABRICANTES: TStringField;
    qryPermissoesAlteracaoCADFAMILIAEQUIP: TStringField;
    qryPermissoesAlteracaoCADFAMILIAPECASREP: TStringField;
    qryPermissoesAlteracaoCADFAMILIARECURSOS: TStringField;
    qryPermissoesAlteracaoCADFECHAMANUT: TStringField;
    qryPermissoesAlteracaoCADFERIADOS: TStringField;
    qryPermissoesAlteracaoCADFORMATOCODIGO: TStringField;
    qryPermissoesAlteracaoCADFORNECEDORES: TStringField;
    qryPermissoesAlteracaoCADFUNCIONARIOS: TStringField;
    qryPermissoesAlteracaoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesAlteracaoCADHISTORICOEQUIP: TStringField;
    qryPermissoesAlteracaoCADIMANGENS: TStringField;
    qryPermissoesAlteracaoCADINDDESEMPENHO: TStringField;
    qryPermissoesAlteracaoCADINFMENSAIS: TStringField;
    qryPermissoesAlteracaoCADLUBRIFICANTES: TStringField;
    qryPermissoesAlteracaoCADLUBRIFICPROG: TStringField;
    qryPermissoesAlteracaoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesAlteracaoCADMANUTENCAO: TStringField;
    qryPermissoesAlteracaoCADMANUTPROG: TStringField;
    qryPermissoesAlteracaoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesAlteracaoCADMAODEOBRAESP: TStringField;
    qryPermissoesAlteracaoCADMONITORAMENTO: TStringField;
    qryPermissoesAlteracaoCADMOTIVOPARADA: TStringField;
    qryPermissoesAlteracaoCADNAVEGACAO: TStringField;
    qryPermissoesAlteracaoCADOFICINAS: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICO: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesAlteracaoCADPECASREP: TStringField;
    qryPermissoesAlteracaoCADPECASREPINST: TStringField;
    qryPermissoesAlteracaoCADPECASREPKIT: TStringField;
    qryPermissoesAlteracaoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesAlteracaoCADPERMISSOES: TStringField;
    qryPermissoesAlteracaoCADPLANOTRAB: TStringField;
    qryPermissoesAlteracaoCADPONTOSINSPECAO: TStringField;
    qryPermissoesAlteracaoCADRECURSOS: TStringField;
    qryPermissoesAlteracaoCADRECURSOSKIT: TStringField;
    qryPermissoesAlteracaoCADRELATINSP: TStringField;
    qryPermissoesAlteracaoCADRELATORIOS: TStringField;
    qryPermissoesAlteracaoCADRESERVA: TStringField;
    qryPermissoesAlteracaoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesAlteracaoCADTERCEIRIZADAS: TStringField;
    qryPermissoesAlteracaoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesAlteracaoCADUSUARIOS: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesAlteracaoCADFERRAMENTARIA: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesAlteracaoCADORDEMSERVICOLIBERAR: TStringField;
    qryPermissoesAlteracaoCODUSUARIO: TStringField;
    qryPermissoesAlteracaoMATRICULA: TStringField;
    qryPermissoesAlteracaoNOME: TStringField;
    qryPermissoesAlteracaoNIVELACESSO: TStringField;
    qryPermissoesAlteracaoPadrao: TFDQuery;
    qryPermissoesAlteracaoPadraoCODIGO: TFDAutoIncField;
    qryPermissoesAlteracaoPadraoCODNIVELACESSO: TStringField;
    qryPermissoesAlteracaoPadraoPESSOAL: TStringField;
    qryPermissoesAlteracaoPadraoCADALMOXARIFADO: TStringField;
    qryPermissoesAlteracaoPadraoCADAREAS: TStringField;
    qryPermissoesAlteracaoPadraoCADARQUIVOTECNICO: TStringField;
    qryPermissoesAlteracaoPadraoCADCALENDARIOOS: TStringField;
    qryPermissoesAlteracaoPadraoCADCALENDEQUIP: TStringField;
    qryPermissoesAlteracaoPadraoCADCALENDMOBRA: TStringField;
    qryPermissoesAlteracaoPadraoCADCARGOS: TStringField;
    qryPermissoesAlteracaoPadraoCADCAUSASFALHA: TStringField;
    qryPermissoesAlteracaoPadraoCADCENTROCUSTO: TStringField;
    qryPermissoesAlteracaoPadraoCADCLASSES: TStringField;
    qryPermissoesAlteracaoPadraoCADCONFIABILIDADE: TStringField;
    qryPermissoesAlteracaoPadraoCADCONSULTAS: TStringField;
    qryPermissoesAlteracaoPadraoCADCONTROLEPNEUS: TStringField;
    qryPermissoesAlteracaoPadraoCADDISPONIBILIDADE: TStringField;
    qryPermissoesAlteracaoPadraoCADEQUIPAMENTOS: TStringField;
    qryPermissoesAlteracaoPadraoCADFABRICANTES: TStringField;
    qryPermissoesAlteracaoPadraoCADFAMILIAEQUIP: TStringField;
    qryPermissoesAlteracaoPadraoCADFAMILIAPECASREP: TStringField;
    qryPermissoesAlteracaoPadraoCADFAMILIARECURSOS: TStringField;
    qryPermissoesAlteracaoPadraoCADFECHAMANUT: TStringField;
    qryPermissoesAlteracaoPadraoCADFERIADOS: TStringField;
    qryPermissoesAlteracaoPadraoCADFORMATOCODIGO: TStringField;
    qryPermissoesAlteracaoPadraoCADFORNECEDORES: TStringField;
    qryPermissoesAlteracaoPadraoCADFUNCIONARIOS: TStringField;
    qryPermissoesAlteracaoPadraoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesAlteracaoPadraoCADHISTORICOEQUIP: TStringField;
    qryPermissoesAlteracaoPadraoCADIMANGENS: TStringField;
    qryPermissoesAlteracaoPadraoCADINDDESEMPENHO: TStringField;
    qryPermissoesAlteracaoPadraoCADINFMENSAIS: TStringField;
    qryPermissoesAlteracaoPadraoCADLUBRIFICANTES: TStringField;
    qryPermissoesAlteracaoPadraoCADLUBRIFICPROG: TStringField;
    qryPermissoesAlteracaoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesAlteracaoPadraoCADMANUTENCAO: TStringField;
    qryPermissoesAlteracaoPadraoCADMANUTPROG: TStringField;
    qryPermissoesAlteracaoPadraoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesAlteracaoPadraoCADMAODEOBRAESP: TStringField;
    qryPermissoesAlteracaoPadraoCADMONITORAMENTO: TStringField;
    qryPermissoesAlteracaoPadraoCADMOTIVOPARADA: TStringField;
    qryPermissoesAlteracaoPadraoCADNAVEGACAO: TStringField;
    qryPermissoesAlteracaoPadraoCADOFICINAS: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICO: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesAlteracaoPadraoCADPECASREP: TStringField;
    qryPermissoesAlteracaoPadraoCADPECASREPINST: TStringField;
    qryPermissoesAlteracaoPadraoCADPECASREPKIT: TStringField;
    qryPermissoesAlteracaoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesAlteracaoPadraoCADPERMISSOES: TStringField;
    qryPermissoesAlteracaoPadraoCADPLANOTRAB: TStringField;
    qryPermissoesAlteracaoPadraoCADPONTOSINSPECAO: TStringField;
    qryPermissoesAlteracaoPadraoCADRECURSOS: TStringField;
    qryPermissoesAlteracaoPadraoCADRECURSOSKIT: TStringField;
    qryPermissoesAlteracaoPadraoCADRELATINSP: TStringField;
    qryPermissoesAlteracaoPadraoCADRELATORIOS: TStringField;
    qryPermissoesAlteracaoPadraoCADRESERVA: TStringField;
    qryPermissoesAlteracaoPadraoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesAlteracaoPadraoCADTERCEIRIZADAS: TStringField;
    qryPermissoesAlteracaoPadraoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesAlteracaoPadraoCADUSUARIOS: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesAlteracaoPadraoCADFERRAMENTARIA: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesAlteracaoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    qryPermissoesExclusao: TFDQuery;
    qryPermissoesExclusaoCODIGO: TFDAutoIncField;
    qryPermissoesExclusaoCODNIVELACESSO: TStringField;
    qryPermissoesExclusaoPESSOAL: TStringField;
    qryPermissoesExclusaoCADALMOXARIFADO: TStringField;
    qryPermissoesExclusaoCADAREAS: TStringField;
    qryPermissoesExclusaoCADARQUIVOTECNICO: TStringField;
    qryPermissoesExclusaoCADCALENDARIOOS: TStringField;
    qryPermissoesExclusaoCADCALENDEQUIP: TStringField;
    qryPermissoesExclusaoCADCALENDMOBRA: TStringField;
    qryPermissoesExclusaoCADCARGOS: TStringField;
    qryPermissoesExclusaoCADCAUSASFALHA: TStringField;
    qryPermissoesExclusaoCADCENTROCUSTO: TStringField;
    qryPermissoesExclusaoCADCLASSES: TStringField;
    qryPermissoesExclusaoCADCONFIABILIDADE: TStringField;
    qryPermissoesExclusaoCADCONSULTAS: TStringField;
    qryPermissoesExclusaoCADCONTROLEPNEUS: TStringField;
    qryPermissoesExclusaoCADDISPONIBILIDADE: TStringField;
    qryPermissoesExclusaoCADEQUIPAMENTOS: TStringField;
    qryPermissoesExclusaoCADFABRICANTES: TStringField;
    qryPermissoesExclusaoCADFAMILIAEQUIP: TStringField;
    qryPermissoesExclusaoCADFAMILIAPECASREP: TStringField;
    qryPermissoesExclusaoCADFAMILIARECURSOS: TStringField;
    qryPermissoesExclusaoCADFECHAMANUT: TStringField;
    qryPermissoesExclusaoCADFERIADOS: TStringField;
    qryPermissoesExclusaoCADFORMATOCODIGO: TStringField;
    qryPermissoesExclusaoCADFORNECEDORES: TStringField;
    qryPermissoesExclusaoCADFUNCIONARIOS: TStringField;
    qryPermissoesExclusaoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesExclusaoCADHISTORICOEQUIP: TStringField;
    qryPermissoesExclusaoCADIMANGENS: TStringField;
    qryPermissoesExclusaoCADINDDESEMPENHO: TStringField;
    qryPermissoesExclusaoCADINFMENSAIS: TStringField;
    qryPermissoesExclusaoCADLUBRIFICANTES: TStringField;
    qryPermissoesExclusaoCADLUBRIFICPROG: TStringField;
    qryPermissoesExclusaoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesExclusaoCADMANUTENCAO: TStringField;
    qryPermissoesExclusaoCADMANUTPROG: TStringField;
    qryPermissoesExclusaoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesExclusaoCADMAODEOBRAESP: TStringField;
    qryPermissoesExclusaoCADMONITORAMENTO: TStringField;
    qryPermissoesExclusaoCADMOTIVOPARADA: TStringField;
    qryPermissoesExclusaoCADNAVEGACAO: TStringField;
    qryPermissoesExclusaoCADOFICINAS: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICO: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesExclusaoCADPECASREP: TStringField;
    qryPermissoesExclusaoCADPECASREPINST: TStringField;
    qryPermissoesExclusaoCADPECASREPKIT: TStringField;
    qryPermissoesExclusaoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesExclusaoCADPERMISSOES: TStringField;
    qryPermissoesExclusaoCADPLANOTRAB: TStringField;
    qryPermissoesExclusaoCADPONTOSINSPECAO: TStringField;
    qryPermissoesExclusaoCADRECURSOS: TStringField;
    qryPermissoesExclusaoCADRECURSOSKIT: TStringField;
    qryPermissoesExclusaoCADRELATINSP: TStringField;
    qryPermissoesExclusaoCADRELATORIOS: TStringField;
    qryPermissoesExclusaoCADRESERVA: TStringField;
    qryPermissoesExclusaoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesExclusaoCADTERCEIRIZADAS: TStringField;
    qryPermissoesExclusaoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesExclusaoCADUSUARIOS: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesExclusaoCADFERRAMENTARIA: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesExclusaoCADORDEMSERVICOLIBERAR: TStringField;
    qryPermissoesExclusaoCODUSUARIO: TStringField;
    qryPermissoesExclusaoMATRICULA: TStringField;
    qryPermissoesExclusaoNOME: TStringField;
    qryPermissoesExclusaoNIVELACESSO: TStringField;
    qryPermissoesExclusaoPadrao: TFDQuery;
    qryPermissoesExclusaoPadraoCODIGO: TFDAutoIncField;
    qryPermissoesExclusaoPadraoCODNIVELACESSO: TStringField;
    qryPermissoesExclusaoPadraoPESSOAL: TStringField;
    qryPermissoesExclusaoPadraoCADALMOXARIFADO: TStringField;
    qryPermissoesExclusaoPadraoCADAREAS: TStringField;
    qryPermissoesExclusaoPadraoCADARQUIVOTECNICO: TStringField;
    qryPermissoesExclusaoPadraoCADCALENDARIOOS: TStringField;
    qryPermissoesExclusaoPadraoCADCALENDEQUIP: TStringField;
    qryPermissoesExclusaoPadraoCADCALENDMOBRA: TStringField;
    qryPermissoesExclusaoPadraoCADCARGOS: TStringField;
    qryPermissoesExclusaoPadraoCADCAUSASFALHA: TStringField;
    qryPermissoesExclusaoPadraoCADCENTROCUSTO: TStringField;
    qryPermissoesExclusaoPadraoCADCLASSES: TStringField;
    qryPermissoesExclusaoPadraoCADCONFIABILIDADE: TStringField;
    qryPermissoesExclusaoPadraoCADCONSULTAS: TStringField;
    qryPermissoesExclusaoPadraoCADCONTROLEPNEUS: TStringField;
    qryPermissoesExclusaoPadraoCADDISPONIBILIDADE: TStringField;
    qryPermissoesExclusaoPadraoCADEQUIPAMENTOS: TStringField;
    qryPermissoesExclusaoPadraoCADFABRICANTES: TStringField;
    qryPermissoesExclusaoPadraoCADFAMILIAEQUIP: TStringField;
    qryPermissoesExclusaoPadraoCADFAMILIAPECASREP: TStringField;
    qryPermissoesExclusaoPadraoCADFAMILIARECURSOS: TStringField;
    qryPermissoesExclusaoPadraoCADFECHAMANUT: TStringField;
    qryPermissoesExclusaoPadraoCADFERIADOS: TStringField;
    qryPermissoesExclusaoPadraoCADFORMATOCODIGO: TStringField;
    qryPermissoesExclusaoPadraoCADFORNECEDORES: TStringField;
    qryPermissoesExclusaoPadraoCADFUNCIONARIOS: TStringField;
    qryPermissoesExclusaoPadraoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesExclusaoPadraoCADHISTORICOEQUIP: TStringField;
    qryPermissoesExclusaoPadraoCADIMANGENS: TStringField;
    qryPermissoesExclusaoPadraoCADINDDESEMPENHO: TStringField;
    qryPermissoesExclusaoPadraoCADINFMENSAIS: TStringField;
    qryPermissoesExclusaoPadraoCADLUBRIFICANTES: TStringField;
    qryPermissoesExclusaoPadraoCADLUBRIFICPROG: TStringField;
    qryPermissoesExclusaoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesExclusaoPadraoCADMANUTENCAO: TStringField;
    qryPermissoesExclusaoPadraoCADMANUTPROG: TStringField;
    qryPermissoesExclusaoPadraoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesExclusaoPadraoCADMAODEOBRAESP: TStringField;
    qryPermissoesExclusaoPadraoCADMONITORAMENTO: TStringField;
    qryPermissoesExclusaoPadraoCADMOTIVOPARADA: TStringField;
    qryPermissoesExclusaoPadraoCADNAVEGACAO: TStringField;
    qryPermissoesExclusaoPadraoCADOFICINAS: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICO: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesExclusaoPadraoCADPECASREP: TStringField;
    qryPermissoesExclusaoPadraoCADPECASREPINST: TStringField;
    qryPermissoesExclusaoPadraoCADPECASREPKIT: TStringField;
    qryPermissoesExclusaoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesExclusaoPadraoCADPERMISSOES: TStringField;
    qryPermissoesExclusaoPadraoCADPLANOTRAB: TStringField;
    qryPermissoesExclusaoPadraoCADPONTOSINSPECAO: TStringField;
    qryPermissoesExclusaoPadraoCADRECURSOS: TStringField;
    qryPermissoesExclusaoPadraoCADRECURSOSKIT: TStringField;
    qryPermissoesExclusaoPadraoCADRELATINSP: TStringField;
    qryPermissoesExclusaoPadraoCADRELATORIOS: TStringField;
    qryPermissoesExclusaoPadraoCADRESERVA: TStringField;
    qryPermissoesExclusaoPadraoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesExclusaoPadraoCADTERCEIRIZADAS: TStringField;
    qryPermissoesExclusaoPadraoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesExclusaoPadraoCADUSUARIOS: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesExclusaoPadraoCADFERRAMENTARIA: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesExclusaoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    qryPermissoesInclusao: TFDQuery;
    qryPermissoesInclusaoCODIGO: TFDAutoIncField;
    qryPermissoesInclusaoCODNIVELACESSO: TStringField;
    qryPermissoesInclusaoPESSOAL: TStringField;
    qryPermissoesInclusaoCADALMOXARIFADO: TStringField;
    qryPermissoesInclusaoCADAREAS: TStringField;
    qryPermissoesInclusaoCADARQUIVOTECNICO: TStringField;
    qryPermissoesInclusaoCADCALENDARIOOS: TStringField;
    qryPermissoesInclusaoCADCALENDEQUIP: TStringField;
    qryPermissoesInclusaoCADCALENDMOBRA: TStringField;
    qryPermissoesInclusaoCADCARGOS: TStringField;
    qryPermissoesInclusaoCADCAUSASFALHA: TStringField;
    qryPermissoesInclusaoCADCENTROCUSTO: TStringField;
    qryPermissoesInclusaoCADCLASSES: TStringField;
    qryPermissoesInclusaoCADCONFIABILIDADE: TStringField;
    qryPermissoesInclusaoCADCONSULTAS: TStringField;
    qryPermissoesInclusaoCADCONTROLEPNEUS: TStringField;
    qryPermissoesInclusaoCADDISPONIBILIDADE: TStringField;
    qryPermissoesInclusaoCADEQUIPAMENTOS: TStringField;
    qryPermissoesInclusaoCADFABRICANTES: TStringField;
    qryPermissoesInclusaoCADFAMILIAEQUIP: TStringField;
    qryPermissoesInclusaoCADFAMILIAPECASREP: TStringField;
    qryPermissoesInclusaoCADFAMILIARECURSOS: TStringField;
    qryPermissoesInclusaoCADFECHAMANUT: TStringField;
    qryPermissoesInclusaoCADFERIADOS: TStringField;
    qryPermissoesInclusaoCADFORMATOCODIGO: TStringField;
    qryPermissoesInclusaoCADFORNECEDORES: TStringField;
    qryPermissoesInclusaoCADFUNCIONARIOS: TStringField;
    qryPermissoesInclusaoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesInclusaoCADHISTORICOEQUIP: TStringField;
    qryPermissoesInclusaoCADIMANGENS: TStringField;
    qryPermissoesInclusaoCADINDDESEMPENHO: TStringField;
    qryPermissoesInclusaoCADINFMENSAIS: TStringField;
    qryPermissoesInclusaoCADLUBRIFICANTES: TStringField;
    qryPermissoesInclusaoCADLUBRIFICPROG: TStringField;
    qryPermissoesInclusaoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesInclusaoCADMANUTENCAO: TStringField;
    qryPermissoesInclusaoCADMANUTPROG: TStringField;
    qryPermissoesInclusaoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesInclusaoCADMAODEOBRAESP: TStringField;
    qryPermissoesInclusaoCADMONITORAMENTO: TStringField;
    qryPermissoesInclusaoCADMOTIVOPARADA: TStringField;
    qryPermissoesInclusaoCADNAVEGACAO: TStringField;
    qryPermissoesInclusaoCADOFICINAS: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICO: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesInclusaoCADPECASREP: TStringField;
    qryPermissoesInclusaoCADPECASREPINST: TStringField;
    qryPermissoesInclusaoCADPECASREPKIT: TStringField;
    qryPermissoesInclusaoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesInclusaoCADPERMISSOES: TStringField;
    qryPermissoesInclusaoCADPLANOTRAB: TStringField;
    qryPermissoesInclusaoCADPONTOSINSPECAO: TStringField;
    qryPermissoesInclusaoCADRECURSOS: TStringField;
    qryPermissoesInclusaoCADRECURSOSKIT: TStringField;
    qryPermissoesInclusaoCADRELATINSP: TStringField;
    qryPermissoesInclusaoCADRELATORIOS: TStringField;
    qryPermissoesInclusaoCADRESERVA: TStringField;
    qryPermissoesInclusaoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesInclusaoCADTERCEIRIZADAS: TStringField;
    qryPermissoesInclusaoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesInclusaoCADUSUARIOS: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesInclusaoCADFERRAMENTARIA: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesInclusaoCADORDEMSERVICOLIBERAR: TStringField;
    qryPermissoesInclusaoCODUSUARIO: TStringField;
    qryPermissoesInclusaoMATRICULA: TStringField;
    qryPermissoesInclusaoNOME: TStringField;
    qryPermissoesInclusaoNIVELACESSO: TStringField;
    qryPermissoesInclusaoPadrao: TFDQuery;
    qryPermissoesInclusaoPadraoCODIGO: TFDAutoIncField;
    qryPermissoesInclusaoPadraoCODNIVELACESSO: TStringField;
    qryPermissoesInclusaoPadraoPESSOAL: TStringField;
    qryPermissoesInclusaoPadraoCADALMOXARIFADO: TStringField;
    qryPermissoesInclusaoPadraoCADAREAS: TStringField;
    qryPermissoesInclusaoPadraoCADARQUIVOTECNICO: TStringField;
    qryPermissoesInclusaoPadraoCADCALENDARIOOS: TStringField;
    qryPermissoesInclusaoPadraoCADCALENDEQUIP: TStringField;
    qryPermissoesInclusaoPadraoCADCALENDMOBRA: TStringField;
    qryPermissoesInclusaoPadraoCADCARGOS: TStringField;
    qryPermissoesInclusaoPadraoCADCAUSASFALHA: TStringField;
    qryPermissoesInclusaoPadraoCADCENTROCUSTO: TStringField;
    qryPermissoesInclusaoPadraoCADCLASSES: TStringField;
    qryPermissoesInclusaoPadraoCADCONFIABILIDADE: TStringField;
    qryPermissoesInclusaoPadraoCADCONSULTAS: TStringField;
    qryPermissoesInclusaoPadraoCADCONTROLEPNEUS: TStringField;
    qryPermissoesInclusaoPadraoCADDISPONIBILIDADE: TStringField;
    qryPermissoesInclusaoPadraoCADEQUIPAMENTOS: TStringField;
    qryPermissoesInclusaoPadraoCADFABRICANTES: TStringField;
    qryPermissoesInclusaoPadraoCADFAMILIAEQUIP: TStringField;
    qryPermissoesInclusaoPadraoCADFAMILIAPECASREP: TStringField;
    qryPermissoesInclusaoPadraoCADFAMILIARECURSOS: TStringField;
    qryPermissoesInclusaoPadraoCADFECHAMANUT: TStringField;
    qryPermissoesInclusaoPadraoCADFERIADOS: TStringField;
    qryPermissoesInclusaoPadraoCADFORMATOCODIGO: TStringField;
    qryPermissoesInclusaoPadraoCADFORNECEDORES: TStringField;
    qryPermissoesInclusaoPadraoCADFUNCIONARIOS: TStringField;
    qryPermissoesInclusaoPadraoCADGRUPOINDUSTRIAL: TStringField;
    qryPermissoesInclusaoPadraoCADHISTORICOEQUIP: TStringField;
    qryPermissoesInclusaoPadraoCADIMANGENS: TStringField;
    qryPermissoesInclusaoPadraoCADINDDESEMPENHO: TStringField;
    qryPermissoesInclusaoPadraoCADINFMENSAIS: TStringField;
    qryPermissoesInclusaoPadraoCADLUBRIFICANTES: TStringField;
    qryPermissoesInclusaoPadraoCADLUBRIFICPROG: TStringField;
    qryPermissoesInclusaoPadraoCADLUBRIFICPROGEQUIP: TStringField;
    qryPermissoesInclusaoPadraoCADMANUTENCAO: TStringField;
    qryPermissoesInclusaoPadraoCADMANUTPROG: TStringField;
    qryPermissoesInclusaoPadraoCADMANUTPROGEQUIP: TStringField;
    qryPermissoesInclusaoPadraoCADMAODEOBRAESP: TStringField;
    qryPermissoesInclusaoPadraoCADMONITORAMENTO: TStringField;
    qryPermissoesInclusaoPadraoCADMOTIVOPARADA: TStringField;
    qryPermissoesInclusaoPadraoCADNAVEGACAO: TStringField;
    qryPermissoesInclusaoPadraoCADOFICINAS: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICO: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICOHIST: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryPermissoesInclusaoPadraoCADPECASREP: TStringField;
    qryPermissoesInclusaoPadraoCADPECASREPINST: TStringField;
    qryPermissoesInclusaoPadraoCADPECASREPKIT: TStringField;
    qryPermissoesInclusaoPadraoCADPECASREPOSICAOEQUIP: TStringField;
    qryPermissoesInclusaoPadraoCADPERMISSOES: TStringField;
    qryPermissoesInclusaoPadraoCADPLANOTRAB: TStringField;
    qryPermissoesInclusaoPadraoCADPONTOSINSPECAO: TStringField;
    qryPermissoesInclusaoPadraoCADRECURSOS: TStringField;
    qryPermissoesInclusaoPadraoCADRECURSOSKIT: TStringField;
    qryPermissoesInclusaoPadraoCADRELATINSP: TStringField;
    qryPermissoesInclusaoPadraoCADRELATORIOS: TStringField;
    qryPermissoesInclusaoPadraoCADRESERVA: TStringField;
    qryPermissoesInclusaoPadraoCADSOLICITACAOTRAB: TStringField;
    qryPermissoesInclusaoPadraoCADTERCEIRIZADAS: TStringField;
    qryPermissoesInclusaoPadraoCADTIPOPROGRAMACAO: TStringField;
    qryPermissoesInclusaoPadraoCADUSUARIOS: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICOFECHAR: TStringField;
    qryPermissoesInclusaoPadraoCADFERRAMENTARIA: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICOEXECUTAR: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICOPARALISAR: TStringField;
    qryPermissoesInclusaoPadraoCADORDEMSERVICOLIBERAR: TStringField;
    qryPlanoTrabalho: TFDQuery;
    qryPlanoTrabalhoCODIGO: TStringField;
    qryPlanoTrabalhoCODEMPRESA: TStringField;
    qryPlanoTrabalhoCODFAMILIAEQUIP: TStringField;
    qryPlanoTrabalhoDESCRICAO: TStringField;
    qryPlanoTrabalhoATIVO: TStringField;
    qryPlanoTrabalhoVISIVEL: TStringField;
    qryPlanoTrabalhoAUTOMATICO: TStringField;
    qryPlanoTrabalhoDATACADASTRO: TDateTimeField;
    qryPlanoTrabalhoCODUSUARIOCAD: TStringField;
    qryPlanoTrabalhoDATAULTALT: TDateTimeField;
    qryPlanoTrabalhoCODUSUARIOALT: TStringField;
    qryPlanoTrabalhoDETALHES: TBlobField;
    qryPlanoTrabalhoOBSERVACOES: TBlobField;
    qryPlanoTrabalhoUSUARIOCAD: TStringField;
    qryPlanoTrabalhoUSUARIOALT: TStringField;
    qryPneus: TFDQuery;
    qryPneusCODIGO: TStringField;
    qryPneusCODEMPRESA: TStringField;
    qryPneusCODFABRICANTE: TStringField;
    qryPneusCODFORNECEDOR: TStringField;
    qryPneusCODFAMILIAPNEU: TStringField;
    qryPneusDESCRICAO: TStringField;
    qryPneusDATAAQUISICAO: TDateTimeField;
    qryPneusDATAGARANTIA: TDateTimeField;
    qryPneusPRECO: TBCDField;
    qryPneusQUANTIDADE: TIntegerField;
    qryPneusTROCA: TStringField;
    qryPneusTIPO: TStringField;
    qryPneusSTATUS: TStringField;
    qryPneusDATACADASTRO: TDateTimeField;
    qryPneusCODUSUARIOCAD: TStringField;
    qryPneusDATAULTALT: TDateTimeField;
    qryPneusCODUSUARIOALT: TStringField;
    qryPneusOBSERVACOES: TBlobField;
    qryPneusFABRICANTE: TStringField;
    qryPneusFORNECEDOR: TStringField;
    qryPneusFAMILIAPNEU: TStringField;
    qryPneusUSUARIOCAD: TStringField;
    qryPneusUSUARIOALT: TStringField;
    qryPneusChassi: TFDQuery;
    qryPneusChassiCODIGO: TFDAutoIncField;
    qryPneusChassiCODEMPRESA: TStringField;
    qryPneusChassiCODEQUIPAMENTO: TStringField;
    qryPneusChassiDESCRICAO: TStringField;
    qryPneusChassiTIPO: TStringField;
    qryPneusChassiCHASSI: TStringField;
    qryPneusChassiSTATUS: TStringField;
    qryPneusChassiPLACA: TStringField;
    qryPneusChassiCONTADOR: TIntegerField;
    qryPneusChassiDATACONTADORATUAL: TDateTimeField;
    qryPneusChassiDATACADASTRO: TDateTimeField;
    qryPneusChassiCODUSUARIOCAD: TStringField;
    qryPneusChassiDATAULTALT: TDateTimeField;
    qryPneusChassiCODUSUARIOALT: TStringField;
    qryPneusChassiOBSERVACOES: TBlobField;
    qryPneusChassiEQUIPAMENTO: TStringField;
    qryPneusChassiIMAGEM: TBlobField;
    qryPneusChassiUSUARIOCAD: TStringField;
    qryPneusChassiUSUARIOALT: TStringField;
    qryPneusChassiAtrelamento: TFDQuery;
    qryPneusChassiAtrelamentoCODIGO: TFDAutoIncField;
    qryPneusChassiAtrelamentoCODEMPRESA: TStringField;
    qryPneusChassiAtrelamentoCODCHASSI: TIntegerField;
    qryPneusChassiAtrelamentoCODCARROCERIA1: TIntegerField;
    qryPneusChassiAtrelamentoCODCARROCERIA2: TIntegerField;
    qryPneusChassiAtrelamentoCODCARROCERIA3: TIntegerField;
    qryPneusChassiAtrelamentoINSTALADO1: TDateTimeField;
    qryPneusChassiAtrelamentoINSTALADO2: TDateTimeField;
    qryPneusChassiAtrelamentoINSTALADO3: TDateTimeField;
    qryPneusChassiAtrelamentoCODEQUIPCAVALO: TStringField;
    qryPneusChassiAtrelamentoDESCEQUIPCAVALO: TStringField;
    qryPneusChassiAtrelamentoCHASSICAVALO: TStringField;
    qryPneusChassiAtrelamentoCODEQUIPCARROCEIRA1: TStringField;
    qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA1: TStringField;
    qryPneusChassiAtrelamentoCHASSICARROCEIRA1: TStringField;
    qryPneusChassiAtrelamentoCODEQUIPCARROCEIRA2: TStringField;
    qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA2: TStringField;
    qryPneusChassiAtrelamentoCHASSICARROCEIRA2: TStringField;
    qryPneusChassiAtrelamentoCODEQUIPCARROCEIRA3: TStringField;
    qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA3: TStringField;
    qryPneusChassiAtrelamentoCHASSICARROCEIRA3: TStringField;
    qryPneusChassiAtrelamentoHist: TFDQuery;
    qryPneusChassiAtrelamentoHistCODIGO: TFDAutoIncField;
    qryPneusChassiAtrelamentoHistCODEMPRESA: TStringField;
    qryPneusChassiAtrelamentoHistCODCHASSI: TIntegerField;
    qryPneusChassiAtrelamentoHistPOSICAO: TStringField;
    qryPneusChassiAtrelamentoHistCODCARROCERIA: TIntegerField;
    qryPneusChassiAtrelamentoHistDATA: TDateTimeField;
    qryPneusChassiAtrelamentoHistOPERACAO: TStringField;
    qryPneusChassiAtrelamentoHistCONTADOR: TIntegerField;
    qryPneusChassiAtrelamentoHistRODAGEM: TIntegerField;
    qryPneusChassiAtrelamentoHistCAVALO: TStringField;
    qryPneusChassiAtrelamentoHistCARROCERIA: TStringField;
    qryPneusChassiHistorico: TFDQuery;
    qryPneusChassiHistoricoCODIGO: TFDAutoIncField;
    qryPneusChassiHistoricoCODEMPRESA: TStringField;
    qryPneusChassiHistoricoCODCHASSI: TIntegerField;
    qryPneusChassiHistoricoID: TIntegerField;
    qryPneusChassiHistoricoEQUIPAMENTO: TStringField;
    qryPneusChassiHistoricoPOSICAO: TStringField;
    qryPneusChassiHistoricoDATA: TDateTimeField;
    qryPneusChassiHistoricoOPERACAO: TStringField;
    qryPneusChassiHistoricoSTATUS: TStringField;
    qryPneusChassiHistoricoRODAGEM: TIntegerField;
    qryPneusChassiHistoricoPRECO: TBCDField;
    qryPneusChassiHistoricoCUSTO: TFMTBCDField;
    qryPneusChassiHistoricoCODPNEU: TStringField;
    qryPneusChassiHistoricoUNIDADE: TStringField;
    qryPneusChassiHistoricoCONTADOR: TBCDField;
    qryPneusChassiHistoricoMOTIVO: TStringField;
    qryPneusChassiHistoricoPNEU: TStringField;
    qryPneusChassiHistoricoTIPO: TStringField;
    qryPneusChassiImagens: TFDQuery;
    qryPneusChassiImagensCODIGO: TFDAutoIncField;
    qryPneusChassiImagensDESCRICAO: TStringField;
    qryPneusChassiImagensTIPOIMAGEM: TStringField;
    qryPneusChassiImagensIMAGEM: TBlobField;
    qryPneusChassiPneus: TFDQuery;
    qryPneusChassiPneusHist: TFDQuery;
    qryPneusChassiPneusHistCODIGO: TFDAutoIncField;
    qryPneusChassiPneusHistCODEMPRESA: TStringField;
    qryPneusChassiPneusHistCODCHASSI: TIntegerField;
    qryPneusChassiPneusHistID: TIntegerField;
    qryPneusChassiPneusHistEQUIPAMENTO: TStringField;
    qryPneusChassiPneusHistPOSICAO: TStringField;
    qryPneusChassiPneusHistDATA: TDateTimeField;
    qryPneusChassiPneusHistOPERACAO: TStringField;
    qryPneusChassiPneusHistSTATUS: TStringField;
    qryPneusChassiPneusHistRODAGEM: TIntegerField;
    qryPneusChassiPneusHistCUSTO: TBCDField;
    qryPneusChassiPneusHistCUSTOKM: TFMTBCDField;
    qryPneusChassiPneusHistCODPNEU: TStringField;
    qryPneusChassiPneusHistUNIDADE: TStringField;
    qryPneusChassiPneusHistCONTADOR: TBCDField;
    qryPneusChassiPneusHistMOTIVO: TStringField;
    qryPneusChassiPneusHistPNEU: TStringField;
    qryPneusChassiPneusHistTIPO: TStringField;
    qryPneusChassiPneusHistFABRICANTE: TStringField;
    qryPneusChassiPneusHistFORNECEDOR: TStringField;
    qryPneusChassiPosicoes: TFDQuery;
    qryPneusChassiPosicoesCODIGO: TFDAutoIncField;
    qryPneusChassiPosicoesCODEMPRESA: TStringField;
    qryPneusChassiPosicoesCODCHASSI: TIntegerField;
    qryPneusChassiPosicoesPOSICAO: TStringField;
    qryPneusChassiPosicoesCODPNEU: TStringField;
    qryPneusChassiPosicoesID: TIntegerField;
    qryPneusChassiPosicoesINSTALADO: TDateTimeField;
    qryPneusChassiPosicoesLIMRODAGEM: TIntegerField;
    qryPneusChassiPosicoesTIPO: TStringField;
    qryPneusChassiPosicoesSTATUS: TStringField;
    qryPneusChassiPosicoesRODADOS: TIntegerField;
    qryPneusChassiPosicoesCUSTO: TBCDField;
    qryPneusChassiPosicoesCUSTOKM: TFMTBCDField;
    qryRotaEquipVenc: TFDQuery;
    qryRotaEquipVencSeq: TFDQuery;
    qryRotaEquipVencSeqCODIGO: TFDAutoIncField;
    qryRotaEquipVencSeqCODEMPRESA: TStringField;
    qryRotaEquipVencSeqCODROTA: TStringField;
    qryRotaEquipVencSeqCODAREA: TStringField;
    qryRotaEquipVencSeqCODCELULA: TStringField;
    qryRotaEquipVencSeqCODLINHA: TStringField;
    qryRotaEquipVencSeqSEQUENCIA: TIntegerField;
    qryRotaEquipVencSeqCODFAMILIAEQUIP: TStringField;
    qryRotaEquipVencSeqAREA: TStringField;
    qryRotaEquipVencSeqCELULA: TStringField;
    qryRotaEquipVencSeqLINHA: TStringField;
    qryRotaEquipVencSeqFAMILIAEQUIP: TStringField;
    qryRotaEquipVencSeqCODEQUIPATUAL: TStringField;
    qryRotaEquipVencSeqEQUIPATUAL: TStringField;
    qryRotaEquipVencSeqFREQUENCIA: TIntegerField;
    qryRotaEquipVencSeqManut: TFDQuery;
    qryRotaEquipVencSeqManutCODIGO: TStringField;
    qryRotaEquipVencSeqManutCODEMPRESA: TStringField;
    qryRotaEquipVencSeqManutDESCRICAO: TStringField;
    qryRotaEquipVencSeqManutDTAINICIO1: TDateTimeField;
    qryRotaEquipVencSeqManutFREQUENCIA: TSmallintField;
    qryRotaEquipVencSeqManutRELATORIO: TStringField;
    qryRotaEquipVencSeqManutCODEQUIPATUAL: TStringField;
    qryRotaPeriodicas: TFDQuery;
    qryRotaPeriodicasCODIGO: TStringField;
    qryRotaPeriodicasCODEMPRESA: TStringField;
    qryRotaPeriodicasFREQUENCIA: TIntegerField;
    qryRotaPeriodicasDESCRICAO: TStringField;
    qryRotaPeriodicasREPROGRAMAR: TStringField;
    qryRotaPeriodicasRELATORIO: TStringField;
    qryRotaPeriodicasDTAINICIO1: TDateTimeField;
    qryRotaPeriodicasSITUACAOOS: TStringField;
    qryRotaPeriodicasCODMANUTENCAO: TStringField;
    qryRotaPeriodicasCODORDEMSERVICO: TFDAutoIncField;
    qryRotaPeriodicasMATRICULAOS: TStringField;
    qryRotaPeriodicasManut: TFDQuery;
    qryRotaPeriodicasManutINDICE: TFDAutoIncField;
    qryRotaPeriodicasManutCODEMPRESA: TStringField;
    qryRotaPeriodicasManutCODIGO: TStringField;
    qryRotaPeriodicasManutCODORDEMSERVICO: TIntegerField;
    qryRotaPeriodicasManutMATRICULA: TStringField;
    qryRotaPeriodicasManutDESCRICAO: TStringField;
    qryRotaPeriodicasManutFREQUENCIA1: TSmallintField;
    qryRotaPeriodicasManutDTAINICIO1: TDateTimeField;
    qryRotaPeriodicasManutREPROGRAMAR1: TStringField;
    qryRotaPeriodicasManutSITUACAO: TStringField;
    qryRotaPeriodicasManutDATAEXECUCAO: TDateTimeField;
    qryRotaPeriodicasManutDATAFECHAMENTO: TDateTimeField;
    qryRotaPeriodicasManutRELATORIO: TStringField;
    qryRotaPeriodicasManutGEROUOS: TStringField;
    qryRotaPeriodicasManutGRUPOINSP: TStringField;
    qryRotaPeriodicasManutREALIZADA: TStringField;
    qryRotaPeriodicasManutCODEQUIPAMENTO: TStringField;
    qryRotaPeriodicasManutEQUIPAMENTO: TStringField;
    qryRotaPeriodicasManutCODROTA: TStringField;
    qryRotaPeriodicasManutFUNCIONARIOOS: TStringField;
    qryRotaPeriodicasManutItens: TFDQuery;
    qryRotaPeriodicasManutItensINDICE: TFDAutoIncField;
    qryRotaPeriodicasManutItensCODEMPRESA: TStringField;
    qryRotaPeriodicasManutItensHISTORICO: TIntegerField;
    qryRotaPeriodicasManutItensCODIGO: TIntegerField;
    qryRotaPeriodicasManutItensCODMANUTPROGEQUIP: TStringField;
    qryRotaPeriodicasManutItensDTAINICIO1: TDateTimeField;
    qryRotaPeriodicasManutItensDATAINSPECAO: TDateTimeField;
    qryRotaPeriodicasManutItensCODPARTE: TIntegerField;
    qryRotaPeriodicasManutItensITEM: TStringField;
    qryRotaPeriodicasManutItensDESCINSPECAO: TStringField;
    qryRotaPeriodicasManutItensEQUIPPARADO: TStringField;
    qryRotaPeriodicasManutItensTEMPO: TBCDField;
    qryRotaPeriodicasManutItensEXECAUTONOMO: TStringField;
    qryRotaPeriodicasManutItensEXECUTADO: TStringField;
    qryRotaPeriodicasManutItensBOM: TStringField;
    qryRotaPeriodicasManutItensREGULAR: TStringField;
    qryRotaPeriodicasManutItensRUIM: TStringField;
    qryRotaPeriodicasManutItensPARTE: TStringField;
    qryRotaPeriodicasManutItensEsp: TFDQuery;
    qryRotaPeriodicasManutItensEspINDICE: TIntegerField;
    qryRotaPeriodicasManutItensEspCODEMPRESA: TStringField;
    qryRotaPeriodicasManutItensEspHISTORICO: TIntegerField;
    qryRotaPeriodicasManutItensEspCODIGO: TIntegerField;
    qryRotaPeriodicasManutItensEspCODMANUTPROGEQUIP: TStringField;
    qryRotaPeriodicasManutItensEspDTAINICIO1: TDateTimeField;
    qryRotaPeriodicasManutItensEspDATAINSPECAO: TDateTimeField;
    qryRotaPeriodicasManutItensEspCODPARTE: TIntegerField;
    qryRotaPeriodicasManutItensEspITEM: TStringField;
    qryRotaPeriodicasManutItensEspDESCINSPECAO: TStringField;
    qryRotaPeriodicasManutItensEspEQUIPPARADO: TStringField;
    qryRotaPeriodicasManutItensEspTEMPO: TBCDField;
    qryRotaPeriodicasManutItensEspEXECAUTONOMO: TStringField;
    qryRotaPeriodicasManutItensEspEXECUTADO: TStringField;
    qryRotaPeriodicasManutItensEspBOM: TStringField;
    qryRotaPeriodicasManutItensEspREGULAR: TStringField;
    qryRotaPeriodicasManutItensEspRUIM: TStringField;
    qryRotaPeriodicasManutItensEspPARTE: TStringField;
    qryRotas: TFDQuery;
    qryRotasCODIGO: TStringField;
    qryRotasCODEMPRESA: TStringField;
    qryRotasDESCRICAO: TStringField;
    qryRotasDATAINICIO: TDateTimeField;
    qryRotasREPROGRAMAR: TStringField;
    qryRotasFREQUENCIA: TSmallintField;
    qryRotasRELATORIO: TStringField;
    qryRotasDATACADASTRO: TDateTimeField;
    qryRotasCODUSUARIOCAD: TStringField;
    qryRotasDATAULTALT: TDateTimeField;
    qryRotasCODUSUARIOALT: TStringField;
    qryRotasOBSERVACOES: TBlobField;
    qryRotasUSUARIOCAD: TStringField;
    qryRotasUSUARIOALT: TStringField;
    qryRotasSequencia: TFDQuery;
    qryRotasSequenciaCODIGO: TFDAutoIncField;
    qryRotasSequenciaCODEMPRESA: TStringField;
    qryRotasSequenciaCODROTA: TStringField;
    qryRotasSequenciaCODAREA: TStringField;
    qryRotasSequenciaCODCELULA: TStringField;
    qryRotasSequenciaCODLINHA: TStringField;
    qryRotasSequenciaSEQUENCIA: TIntegerField;
    qryRotasSequenciaCODFAMILIAEQUIP: TStringField;
    qryRotasSequenciaAREA: TStringField;
    qryRotasSequenciaCELULA: TStringField;
    qryRotasSequenciaLINHA: TStringField;
    qryRotasSequenciaFAMILIAEQUIP: TStringField;
    qryRotasSequenciaCODEQUIPATUAL: TStringField;
    qryRotasSequenciaEQUIPATUAL: TStringField;
    qryRotasSequenciaFREQUENCIA: TSmallintField;
    qryRotasSequenciaInsp: TFDQuery;
    qryRotasSequenciaInspCODIGO: TStringField;
    qryRotasSequenciaInspCODEMPRESA: TStringField;
    qryRotasSequenciaInspCODEQUIPAMENTO: TStringField;
    qryRotasSequenciaInspDESCRICAO: TStringField;
    qryRotasSequenciaInspREPROGRAMAR1: TStringField;
    qryRotasSequenciaInspGRUPOINSP: TStringField;
    qryRotasSequenciaInspCODMANUTPROGFAMEQUIP: TStringField;
    qryRotasSequenciaInspDTAINICIO1: TDateTimeField;
    qryRotasSequenciaInspRELATORIO: TStringField;
    qryRotasSequenciaInspItens: TFDQuery;
    qryRotasSequenciaInspItensCODIGO: TFDAutoIncField;
    qryRotasSequenciaInspItensCODEMPRESA: TStringField;
    qryRotasSequenciaInspItensCODMANUTPROGFAMEQUIP: TStringField;
    qryRotasSequenciaInspItensCODPARTE: TIntegerField;
    qryRotasSequenciaInspItensITEM: TStringField;
    qryRotasSequenciaInspItensDESCINSPECAO: TStringField;
    qryRotasSequenciaInspItensEQUIPPARADO: TStringField;
    qryRotasSequenciaInspItensTEMPO: TBCDField;
    qryRotasSequenciaInspItensEXECAUTONOMO: TStringField;
    qryRotasSequenciaInspItensDESCPARTE: TStringField;
    qryRotasSequenciaInspItensEsp: TFDQuery;
    qryRotasSequenciaInspItensEspCODIGO: TFDAutoIncField;
    qryRotasSequenciaInspItensEspCODEMPRESA: TStringField;
    qryRotasSequenciaInspItensEspCODMANUTPROGEQUIP: TStringField;
    qryRotasSequenciaInspItensEspCODPARTE: TIntegerField;
    qryRotasSequenciaInspItensEspITEM: TStringField;
    qryRotasSequenciaInspItensEspDESCINSPECAO: TStringField;
    qryRotasSequenciaInspItensEspEQUIPPARADO: TStringField;
    qryRotasSequenciaInspItensEspTEMPO: TBCDField;
    qryRotasSequenciaInspItensEspEXECAUTONOMO: TStringField;
    qryRotasSequenciaInspItensEspEXECUTADO: TStringField;
    qryRotasSequenciaInspItensEspBOM: TStringField;
    qryRotasSequenciaInspItensEspREGULAR: TStringField;
    qryRotasSequenciaInspItensEspRUIM: TStringField;
    qryRotasSequenciaInspItensEspPARTE: TStringField;
    qrySAM: TFDQuery;
    qrySequencia: TFDQuery;
    qrySequenciaNEXT_SEQUENCE: TIntegerField;
    qryTipoManutencao: TFDQuery;
    qryTipoManutencaoCODIGO: TStringField;
    qryTipoManutencaoDESCRICAO: TStringField;
    qryTipoManutencaoTIPOMANUTENCAO: TStringField;
    qryTipoManutencaoCONFIABILIDADE: TStringField;
    qryTipoManutencaoDATACADASTRO: TDateTimeField;
    qryTipoManutencaoCODUSUARIOCAD: TStringField;
    qryTipoManutencaoDATAULTALT: TDateTimeField;
    qryTipoManutencaoCODUSUARIOALT: TStringField;
    qryTipoManutencaoUSUARIOCAD: TStringField;
    qryTipoManutencaoUSUARIOALT: TStringField;
    qryTipoProgramacao: TFDQuery;
    qryTipoProgramacaoCODIGO: TStringField;
    qryTipoProgramacaoDESCRICAO: TStringField;
    qryTipoProgramacaoTIPO: TStringField;
    qryTipoProgramacaoATIVO: TStringField;
    qryTipoProgramacaoVISIVEL: TStringField;
    qryTipoProgramacaoDATACADASTRO: TDateTimeField;
    qryTipoProgramacaoCODUSUARIOCAD: TStringField;
    qryTipoProgramacaoDATAULTALT: TDateTimeField;
    qryTipoProgramacaoCODUSUARIOALT: TStringField;
    qryTipoProgramacaoUSUARIOCAD: TStringField;
    qryTipoProgramacaoUSUARIOALT: TStringField;
    qryTotalEquipHora: TFDQuery;
    qryTotalEquipHoraCODIGO: TStringField;
    qryTotalEquipHoraCODEMPRESA: TStringField;
    qryTotalEquipHoraDESCRICAO: TStringField;
    qryTotalEquipHoraCOAREA: TStringField;
    qryTotalEquipHoraCALENDARIOEQUIP: TStringField;
    qryTotalEquipHoraHOFICIAIS: TIntegerField;
    qryTotalEquipHoraSeqHora: TFDQuery;
    qryTotalEquipHoraSeqHoraCODIGO: TFDAutoIncField;
    qryTotalEquipHoraSeqHoraCODEMPRESA: TStringField;
    qryTotalEquipHoraSeqHoraCODCALENDARIOEQUIP: TStringField;
    qryTotalEquipHoraSeqHoraCALENDARIO: TStringField;
    qryTotalEquipHoraSeqHoraSEQUENCIA: TIntegerField;
    qryTotalEquipHoraSeqHoraHORAINI1: TTimeField;
    qryTotalEquipHoraSeqHoraHORAFIN1: TTimeField;
    qryTotalEquipHoraSeqHoraHHDISP1: TLargeintField;
    qryTotalEquipHoraSeqHoraHORAINI2: TTimeField;
    qryTotalEquipHoraSeqHoraHORAFIN2: TTimeField;
    qryTotalEquipHoraSeqHoraHHDISP2: TLargeintField;
    qryTotalEquipHoraSeqHoraHORAINI3: TTimeField;
    qryTotalEquipHoraSeqHoraHORAFIN3: TTimeField;
    qryTotalEquipHoraSeqHoraHHDISP3: TLargeintField;
    qryTotalEquipHoraSeqHoraHORAINI4: TTimeField;
    qryTotalEquipHoraSeqHoraHORAFIN4: TTimeField;
    qryTotalEquipHoraSeqHoraHHDISP4: TLargeintField;
    qryTotalHomemHora: TFDQuery;
    qryTotalHomemHoraMATRICULA: TStringField;
    qryTotalHomemHoraCODEMPRESA: TStringField;
    qryTotalHomemHoraNOME: TStringField;
    qryTotalHomemHoraCODCALENDARIO: TStringField;
    qryTotalHomemHoraDESCCALENDARIO: TStringField;
    qryTotalHomemHoraHOFICIAIS: TIntegerField;
    qryTotalHomemHoraCODCARGO: TStringField;
    qryTotalHomemHoraDESCCARGO: TStringField;
    qryTotalHomemHoraProgExec: TFDQuery;
    qryTotalHomemHoraProgExecTOTALHHPROG: TFMTBCDField;
    qryTotalHomemHoraProgExecTOTALHHEXEC: TFMTBCDField;
    qryTotalHomemHoraSeqHora: TFDQuery;
    qryTotalHomemHoraSeqHoraCODIGO: TFDAutoIncField;
    qryTotalHomemHoraSeqHoraCODEMPRESA: TStringField;
    qryTotalHomemHoraSeqHoraCODCALENDARIO: TStringField;
    qryTotalHomemHoraSeqHoraCALENDARIO: TStringField;
    qryTotalHomemHoraSeqHoraSEQUENCIA: TIntegerField;
    qryTotalHomemHoraSeqHoraHORAINI1: TTimeField;
    qryTotalHomemHoraSeqHoraHORAFIN1: TTimeField;
    qryTotalHomemHoraSeqHoraHHDISP1: TLargeintField;
    qryTotalHomemHoraSeqHoraHORAINI2: TTimeField;
    qryTotalHomemHoraSeqHoraHORAFIN2: TTimeField;
    qryTotalHomemHoraSeqHoraHHDISP2: TLargeintField;
    qryTotalHomemHoraSeqHoraHORAINI3: TTimeField;
    qryTotalHomemHoraSeqHoraHORAFIN3: TTimeField;
    qryTotalHomemHoraSeqHoraHHDISP3: TLargeintField;
    qryTotalHomemHoraSeqHoraHORAINI4: TTimeField;
    qryTotalHomemHoraSeqHoraHORAFIN4: TTimeField;
    qryTotalHomemHoraSeqHoraHHDISP4: TLargeintField;
    qryTotalTabelas: TFDQuery;
    qryTotalTabelasCODIGO: TFDAutoIncField;
    qryTotalTabelasTOTAL1: TLargeintField;
    qryTotalTabelasTOTAL2: TLargeintField;
    qryTotalTabelasTOTAL3: TLargeintField;
    qryTotalTabelasTOTAL4: TLargeintField;
    qryTotalTabelasTOTAL5: TLargeintField;
    qryTotalTabelasTOTAL6: TLargeintField;
    qryTotalTabelasTOTAL7: TLargeintField;
    qryTotalTabelasTOTAL8: TLargeintField;
    qryTotalTabelasTOTAL9: TLargeintField;
    qryTotalTabelasTOTAL10: TLargeintField;
    qryTotalTabelasTOTAL11: TLargeintField;
    qryTotalTabelasTOTAL12: TLargeintField;
    qryTotalTabelasTOTAL13: TLargeintField;
    qryTotalTabelasTOTAL14: TLargeintField;
    qryTotalTabelasTOTAL15: TLargeintField;
    qryTotalTabelasTOTAL16: TLargeintField;
    qryTotalTabelasTOTAL17: TLargeintField;
    qryTotalTabelasTOTAL18: TLargeintField;
    qryTotalTabelasTOTAL19: TLargeintField;
    qryTotalTabelasTOTAL20: TLargeintField;
    qryTotalTabelasTOTAL21: TLargeintField;
    qryTotalTabelasTOTAL22: TLargeintField;
    qryTotalTabelasTOTAL23: TLargeintField;
    qryTotalTabelasTOTAL24: TLargeintField;
    qryTotalTabelasTOTAL25: TLargeintField;
    qryTotalTabelasTOTAL26: TLargeintField;
    qryTotalTabelasTOTAL27: TLargeintField;
    qryTotalTabelasTOTAL28: TLargeintField;
    qryTotalTabelasTOTAL29: TLargeintField;
    qryTotalTabelasTOTAL30: TLargeintField;
    qryTotalTabelasTOTAL31: TLargeintField;
    qryTotalTabelasTOTAL32: TLargeintField;
    qryTotalTabelasTOTAL33: TLargeintField;
    qryTotalTabelasTOTAL34: TLargeintField;
    qryTotalTabelasTOTAL35: TLargeintField;
    qryTotalTabelasTOTAL36: TLargeintField;
    qryUsuario: TFDQuery;
    qryUsuarioCODIGO: TStringField;
    qryUsuarioCODEMPRESA: TStringField;
    qryUsuarioCODGRUPO: TIntegerField;
    qryUsuarioCODEMPRESAS: TFDAutoIncField;
    qryUsuarioMATRICULA: TStringField;
    qryUsuarioNOME: TStringField;
    qryUsuarioSENHA: TStringField;
    qryUsuarioLOGADO: TStringField;
    qryUsuarioQUEDAENERGIA: TStringField;
    qryUsuarioTEMPORARIO: TStringField;
    qryUsuarioDATAFIM: TDateTimeField;
    qryUsuarioCODNIVELACESSO: TStringField;
    qryUsuarioCODPERMISSAOACESSO: TIntegerField;
    qryUsuarioCODPERMISSAOINCLUSAO: TIntegerField;
    qryUsuarioCODPERMISSAOALTERACAO: TIntegerField;
    qryUsuarioCODPERMISSAOEXCLUSAO: TIntegerField;
    qryUsuarioBLOQUEIO: TSmallintField;
    qryUsuarioEMPRESA: TStringField;
    qryUsuarioTRANSFORMACAO: TStringField;
    qryUsuarioNIVELACESSO: TStringField;
    qryUsuarioGRUPO: TStringField;
    qryUsuarioCODFORMATOCODIGO: TIntegerField;
    qryUsuarioPAcesso: TFDQuery;
    qryUsuarioPAcessoCODIGO: TFDAutoIncField;
    qryUsuarioPAcessoCODNIVELACESSO: TStringField;
    qryUsuarioPAcessoPESSOAL: TStringField;
    qryUsuarioPAcessoCADALMOXARIFADO: TStringField;
    qryUsuarioPAcessoCADAREAS: TStringField;
    qryUsuarioPAcessoCADARQUIVOTECNICO: TStringField;
    qryUsuarioPAcessoCADCALENDARIOOS: TStringField;
    qryUsuarioPAcessoCADCALENDEQUIP: TStringField;
    qryUsuarioPAcessoCADCALENDMOBRA: TStringField;
    qryUsuarioPAcessoCADCARGOS: TStringField;
    qryUsuarioPAcessoCADCAUSASFALHA: TStringField;
    qryUsuarioPAcessoCADCENTROCUSTO: TStringField;
    qryUsuarioPAcessoCADCLASSES: TStringField;
    qryUsuarioPAcessoCADCONFIABILIDADE: TStringField;
    qryUsuarioPAcessoCADCONSULTAS: TStringField;
    qryUsuarioPAcessoCADCONTROLEPNEUS: TStringField;
    qryUsuarioPAcessoCADDISPONIBILIDADE: TStringField;
    qryUsuarioPAcessoCADEQUIPAMENTOS: TStringField;
    qryUsuarioPAcessoCADFABRICANTES: TStringField;
    qryUsuarioPAcessoCADFAMILIAEQUIP: TStringField;
    qryUsuarioPAcessoCADFAMILIAPECASREP: TStringField;
    qryUsuarioPAcessoCADFAMILIARECURSOS: TStringField;
    qryUsuarioPAcessoCADFECHAMANUT: TStringField;
    qryUsuarioPAcessoCADFERIADOS: TStringField;
    qryUsuarioPAcessoCADFORMATOCODIGO: TStringField;
    qryUsuarioPAcessoCADFORNECEDORES: TStringField;
    qryUsuarioPAcessoCADFUNCIONARIOS: TStringField;
    qryUsuarioPAcessoCADGRUPOINDUSTRIAL: TStringField;
    qryUsuarioPAcessoCADHISTORICOEQUIP: TStringField;
    qryUsuarioPAcessoCADIMANGENS: TStringField;
    qryUsuarioPAcessoCADINDDESEMPENHO: TStringField;
    qryUsuarioPAcessoCADINFMENSAIS: TStringField;
    qryUsuarioPAcessoCADLUBRIFICANTES: TStringField;
    qryUsuarioPAcessoCADLUBRIFICPROG: TStringField;
    qryUsuarioPAcessoCADLUBRIFICPROGEQUIP: TStringField;
    qryUsuarioPAcessoCADMANUTENCAO: TStringField;
    qryUsuarioPAcessoCADMANUTPROG: TStringField;
    qryUsuarioPAcessoCADMANUTPROGEQUIP: TStringField;
    qryUsuarioPAcessoCADMAODEOBRAESP: TStringField;
    qryUsuarioPAcessoCADMONITORAMENTO: TStringField;
    qryUsuarioPAcessoCADMOTIVOPARADA: TStringField;
    qryUsuarioPAcessoCADNAVEGACAO: TStringField;
    qryUsuarioPAcessoCADOFICINAS: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICO: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICOHIST: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryUsuarioPAcessoCADPECASREP: TStringField;
    qryUsuarioPAcessoCADPECASREPINST: TStringField;
    qryUsuarioPAcessoCADPECASREPKIT: TStringField;
    qryUsuarioPAcessoCADPECASREPOSICAOEQUIP: TStringField;
    qryUsuarioPAcessoCADPERMISSOES: TStringField;
    qryUsuarioPAcessoCADPLANOTRAB: TStringField;
    qryUsuarioPAcessoCADPONTOSINSPECAO: TStringField;
    qryUsuarioPAcessoCADRECURSOS: TStringField;
    qryUsuarioPAcessoCADRECURSOSKIT: TStringField;
    qryUsuarioPAcessoCADRELATINSP: TStringField;
    qryUsuarioPAcessoCADRELATORIOS: TStringField;
    qryUsuarioPAcessoCADRESERVA: TStringField;
    qryUsuarioPAcessoCADSOLICITACAOTRAB: TStringField;
    qryUsuarioPAcessoCADTERCEIRIZADAS: TStringField;
    qryUsuarioPAcessoCADTIPOPROGRAMACAO: TStringField;
    qryUsuarioPAcessoCADUSUARIOS: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICOFECHAR: TStringField;
    qryUsuarioPAcessoCADFERRAMENTARIA: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICOEXECUTAR: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICOPARALISAR: TStringField;
    qryUsuarioPAcessoCADORDEMSERVICOLIBERAR: TStringField;
    qryUsuarioPAcessoNOME: TStringField;
    qryUsuarioPAcessoCODUSUARIO: TStringField;
    qryUsuarioPAcessoMATRICULA: TStringField;
    qryUsuarioPAcessoNIVELACESSO: TStringField;
    qryUsuarioPAlteracao: TFDQuery;
    qryUsuarioPAlteracaoCODIGO: TFDAutoIncField;
    qryUsuarioPAlteracaoCODNIVELACESSO: TStringField;
    qryUsuarioPAlteracaoPESSOAL: TStringField;
    qryUsuarioPAlteracaoCADALMOXARIFADO: TStringField;
    qryUsuarioPAlteracaoCADAREAS: TStringField;
    qryUsuarioPAlteracaoCADARQUIVOTECNICO: TStringField;
    qryUsuarioPAlteracaoCADCALENDARIOOS: TStringField;
    qryUsuarioPAlteracaoCADCALENDEQUIP: TStringField;
    qryUsuarioPAlteracaoCADCALENDMOBRA: TStringField;
    qryUsuarioPAlteracaoCADCARGOS: TStringField;
    qryUsuarioPAlteracaoCADCAUSASFALHA: TStringField;
    qryUsuarioPAlteracaoCADCENTROCUSTO: TStringField;
    qryUsuarioPAlteracaoCADCLASSES: TStringField;
    qryUsuarioPAlteracaoCADCONFIABILIDADE: TStringField;
    qryUsuarioPAlteracaoCADCONSULTAS: TStringField;
    qryUsuarioPAlteracaoCADCONTROLEPNEUS: TStringField;
    qryUsuarioPAlteracaoCADDISPONIBILIDADE: TStringField;
    qryUsuarioPAlteracaoCADEQUIPAMENTOS: TStringField;
    qryUsuarioPAlteracaoCADFABRICANTES: TStringField;
    qryUsuarioPAlteracaoCADFAMILIAEQUIP: TStringField;
    qryUsuarioPAlteracaoCADFAMILIAPECASREP: TStringField;
    qryUsuarioPAlteracaoCADFAMILIARECURSOS: TStringField;
    qryUsuarioPAlteracaoCADFECHAMANUT: TStringField;
    qryUsuarioPAlteracaoCADFERIADOS: TStringField;
    qryUsuarioPAlteracaoCADFORMATOCODIGO: TStringField;
    qryUsuarioPAlteracaoCADFORNECEDORES: TStringField;
    qryUsuarioPAlteracaoCADFUNCIONARIOS: TStringField;
    qryUsuarioPAlteracaoCADGRUPOINDUSTRIAL: TStringField;
    qryUsuarioPAlteracaoCADHISTORICOEQUIP: TStringField;
    qryUsuarioPAlteracaoCADIMANGENS: TStringField;
    qryUsuarioPAlteracaoCADINDDESEMPENHO: TStringField;
    qryUsuarioPAlteracaoCADINFMENSAIS: TStringField;
    qryUsuarioPAlteracaoCADLUBRIFICANTES: TStringField;
    qryUsuarioPAlteracaoCADLUBRIFICPROG: TStringField;
    qryUsuarioPAlteracaoCADLUBRIFICPROGEQUIP: TStringField;
    qryUsuarioPAlteracaoCADMANUTENCAO: TStringField;
    qryUsuarioPAlteracaoCADMANUTPROG: TStringField;
    qryUsuarioPAlteracaoCADMANUTPROGEQUIP: TStringField;
    qryUsuarioPAlteracaoCADMAODEOBRAESP: TStringField;
    qryUsuarioPAlteracaoCADMONITORAMENTO: TStringField;
    qryUsuarioPAlteracaoCADMOTIVOPARADA: TStringField;
    qryUsuarioPAlteracaoCADNAVEGACAO: TStringField;
    qryUsuarioPAlteracaoCADOFICINAS: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICO: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICOHIST: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryUsuarioPAlteracaoCADPECASREP: TStringField;
    qryUsuarioPAlteracaoCADPECASREPINST: TStringField;
    qryUsuarioPAlteracaoCADPECASREPKIT: TStringField;
    qryUsuarioPAlteracaoCADPECASREPOSICAOEQUIP: TStringField;
    qryUsuarioPAlteracaoCADPERMISSOES: TStringField;
    qryUsuarioPAlteracaoCADPLANOTRAB: TStringField;
    qryUsuarioPAlteracaoCADPONTOSINSPECAO: TStringField;
    qryUsuarioPAlteracaoCADRECURSOS: TStringField;
    qryUsuarioPAlteracaoCADRECURSOSKIT: TStringField;
    qryUsuarioPAlteracaoCADRELATINSP: TStringField;
    qryUsuarioPAlteracaoCADRELATORIOS: TStringField;
    qryUsuarioPAlteracaoCADRESERVA: TStringField;
    qryUsuarioPAlteracaoCADSOLICITACAOTRAB: TStringField;
    qryUsuarioPAlteracaoCADTERCEIRIZADAS: TStringField;
    qryUsuarioPAlteracaoCADTIPOPROGRAMACAO: TStringField;
    qryUsuarioPAlteracaoCADUSUARIOS: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICOFECHAR: TStringField;
    qryUsuarioPAlteracaoCADFERRAMENTARIA: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICOEXECUTAR: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICOPARALISAR: TStringField;
    qryUsuarioPAlteracaoCADORDEMSERVICOLIBERAR: TStringField;
    qryUsuarioPAlteracaoCODUSUARIO: TStringField;
    qryUsuarioPAlteracaoMATRICULA: TStringField;
    qryUsuarioPAlteracaoNOME: TStringField;
    qryUsuarioPAlteracaoNIVELACESSO: TStringField;
    qryUsuarioPExclusao: TFDQuery;
    qryUsuarioPExclusaoCODIGO: TFDAutoIncField;
    qryUsuarioPExclusaoCODNIVELACESSO: TStringField;
    qryUsuarioPExclusaoPESSOAL: TStringField;
    qryUsuarioPExclusaoCADALMOXARIFADO: TStringField;
    qryUsuarioPExclusaoCADAREAS: TStringField;
    qryUsuarioPExclusaoCADARQUIVOTECNICO: TStringField;
    qryUsuarioPExclusaoCADCALENDARIOOS: TStringField;
    qryUsuarioPExclusaoCADCALENDEQUIP: TStringField;
    qryUsuarioPExclusaoCADCALENDMOBRA: TStringField;
    qryUsuarioPExclusaoCADCARGOS: TStringField;
    qryUsuarioPExclusaoCADCAUSASFALHA: TStringField;
    qryUsuarioPExclusaoCADCENTROCUSTO: TStringField;
    qryUsuarioPExclusaoCADCLASSES: TStringField;
    qryUsuarioPExclusaoCADCONFIABILIDADE: TStringField;
    qryUsuarioPExclusaoCADCONSULTAS: TStringField;
    qryUsuarioPExclusaoCADCONTROLEPNEUS: TStringField;
    qryUsuarioPExclusaoCADDISPONIBILIDADE: TStringField;
    qryUsuarioPExclusaoCADEQUIPAMENTOS: TStringField;
    qryUsuarioPExclusaoCADFABRICANTES: TStringField;
    qryUsuarioPExclusaoCADFAMILIAEQUIP: TStringField;
    qryUsuarioPExclusaoCADFAMILIAPECASREP: TStringField;
    qryUsuarioPExclusaoCADFAMILIARECURSOS: TStringField;
    qryUsuarioPExclusaoCADFECHAMANUT: TStringField;
    qryUsuarioPExclusaoCADFERIADOS: TStringField;
    qryUsuarioPExclusaoCADFORMATOCODIGO: TStringField;
    qryUsuarioPExclusaoCADFORNECEDORES: TStringField;
    qryUsuarioPExclusaoCADFUNCIONARIOS: TStringField;
    qryUsuarioPExclusaoCADGRUPOINDUSTRIAL: TStringField;
    qryUsuarioPExclusaoCADHISTORICOEQUIP: TStringField;
    qryUsuarioPExclusaoCADIMANGENS: TStringField;
    qryUsuarioPExclusaoCADINDDESEMPENHO: TStringField;
    qryUsuarioPExclusaoCADINFMENSAIS: TStringField;
    qryUsuarioPExclusaoCADLUBRIFICANTES: TStringField;
    qryUsuarioPExclusaoCADLUBRIFICPROG: TStringField;
    qryUsuarioPExclusaoCADLUBRIFICPROGEQUIP: TStringField;
    qryUsuarioPExclusaoCADMANUTENCAO: TStringField;
    qryUsuarioPExclusaoCADMANUTPROG: TStringField;
    qryUsuarioPExclusaoCADMANUTPROGEQUIP: TStringField;
    qryUsuarioPExclusaoCADMAODEOBRAESP: TStringField;
    qryUsuarioPExclusaoCADMONITORAMENTO: TStringField;
    qryUsuarioPExclusaoCADMOTIVOPARADA: TStringField;
    qryUsuarioPExclusaoCADNAVEGACAO: TStringField;
    qryUsuarioPExclusaoCADOFICINAS: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICO: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICOHIST: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryUsuarioPExclusaoCADPECASREP: TStringField;
    qryUsuarioPExclusaoCADPECASREPINST: TStringField;
    qryUsuarioPExclusaoCADPECASREPKIT: TStringField;
    qryUsuarioPExclusaoCADPECASREPOSICAOEQUIP: TStringField;
    qryUsuarioPExclusaoCADPERMISSOES: TStringField;
    qryUsuarioPExclusaoCADPLANOTRAB: TStringField;
    qryUsuarioPExclusaoCADPONTOSINSPECAO: TStringField;
    qryUsuarioPExclusaoCADRECURSOS: TStringField;
    qryUsuarioPExclusaoCADRECURSOSKIT: TStringField;
    qryUsuarioPExclusaoCADRELATINSP: TStringField;
    qryUsuarioPExclusaoCADRELATORIOS: TStringField;
    qryUsuarioPExclusaoCADRESERVA: TStringField;
    qryUsuarioPExclusaoCADSOLICITACAOTRAB: TStringField;
    qryUsuarioPExclusaoCADTERCEIRIZADAS: TStringField;
    qryUsuarioPExclusaoCADTIPOPROGRAMACAO: TStringField;
    qryUsuarioPExclusaoCADUSUARIOS: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICOFECHAR: TStringField;
    qryUsuarioPExclusaoCADFERRAMENTARIA: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICOPARALISAR: TStringField;
    qryUsuarioPExclusaoCADORDEMSERVICOLIBERAR: TStringField;
    qryUsuarioPExclusaoCODUSUARIO: TStringField;
    qryUsuarioPExclusaoMATRICULA: TStringField;
    qryUsuarioPExclusaoNOME: TStringField;
    qryUsuarioPExclusaoNIVELACESSO: TStringField;
    qryUsuarioPInclusao: TFDQuery;
    qryUsuarioPInclusaoCODIGO: TFDAutoIncField;
    qryUsuarioPInclusaoCODNIVELACESSO: TStringField;
    qryUsuarioPInclusaoPESSOAL: TStringField;
    qryUsuarioPInclusaoCADALMOXARIFADO: TStringField;
    qryUsuarioPInclusaoCADAREAS: TStringField;
    qryUsuarioPInclusaoCADARQUIVOTECNICO: TStringField;
    qryUsuarioPInclusaoCADCALENDARIOOS: TStringField;
    qryUsuarioPInclusaoCADCALENDEQUIP: TStringField;
    qryUsuarioPInclusaoCADCALENDMOBRA: TStringField;
    qryUsuarioPInclusaoCADCARGOS: TStringField;
    qryUsuarioPInclusaoCADCAUSASFALHA: TStringField;
    qryUsuarioPInclusaoCADCENTROCUSTO: TStringField;
    qryUsuarioPInclusaoCADCLASSES: TStringField;
    qryUsuarioPInclusaoCADCONFIABILIDADE: TStringField;
    qryUsuarioPInclusaoCADCONSULTAS: TStringField;
    qryUsuarioPInclusaoCADCONTROLEPNEUS: TStringField;
    qryUsuarioPInclusaoCADDISPONIBILIDADE: TStringField;
    qryUsuarioPInclusaoCADEQUIPAMENTOS: TStringField;
    qryUsuarioPInclusaoCADFABRICANTES: TStringField;
    qryUsuarioPInclusaoCADFAMILIAEQUIP: TStringField;
    qryUsuarioPInclusaoCADFAMILIAPECASREP: TStringField;
    qryUsuarioPInclusaoCADFAMILIARECURSOS: TStringField;
    qryUsuarioPInclusaoCADFECHAMANUT: TStringField;
    qryUsuarioPInclusaoCADFERIADOS: TStringField;
    qryUsuarioPInclusaoCADFORMATOCODIGO: TStringField;
    qryUsuarioPInclusaoCADFORNECEDORES: TStringField;
    qryUsuarioPInclusaoCADFUNCIONARIOS: TStringField;
    qryUsuarioPInclusaoCADGRUPOINDUSTRIAL: TStringField;
    qryUsuarioPInclusaoCADHISTORICOEQUIP: TStringField;
    qryUsuarioPInclusaoCADIMANGENS: TStringField;
    qryUsuarioPInclusaoCADINDDESEMPENHO: TStringField;
    qryUsuarioPInclusaoCADINFMENSAIS: TStringField;
    qryUsuarioPInclusaoCADLUBRIFICANTES: TStringField;
    qryUsuarioPInclusaoCADLUBRIFICPROG: TStringField;
    qryUsuarioPInclusaoCADLUBRIFICPROGEQUIP: TStringField;
    qryUsuarioPInclusaoCADMANUTENCAO: TStringField;
    qryUsuarioPInclusaoCADMANUTPROG: TStringField;
    qryUsuarioPInclusaoCADMANUTPROGEQUIP: TStringField;
    qryUsuarioPInclusaoCADMAODEOBRAESP: TStringField;
    qryUsuarioPInclusaoCADMONITORAMENTO: TStringField;
    qryUsuarioPInclusaoCADMOTIVOPARADA: TStringField;
    qryUsuarioPInclusaoCADNAVEGACAO: TStringField;
    qryUsuarioPInclusaoCADOFICINAS: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICO: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICOHIST: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICOMAODEOBRA: TStringField;
    qryUsuarioPInclusaoCADPECASREP: TStringField;
    qryUsuarioPInclusaoCADPECASREPINST: TStringField;
    qryUsuarioPInclusaoCADPECASREPKIT: TStringField;
    qryUsuarioPInclusaoCADPECASREPOSICAOEQUIP: TStringField;
    qryUsuarioPInclusaoCADPERMISSOES: TStringField;
    qryUsuarioPInclusaoCADPLANOTRAB: TStringField;
    qryUsuarioPInclusaoCADPONTOSINSPECAO: TStringField;
    qryUsuarioPInclusaoCADRECURSOS: TStringField;
    qryUsuarioPInclusaoCADRECURSOSKIT: TStringField;
    qryUsuarioPInclusaoCADRELATINSP: TStringField;
    qryUsuarioPInclusaoCADRELATORIOS: TStringField;
    qryUsuarioPInclusaoCADRESERVA: TStringField;
    qryUsuarioPInclusaoCADSOLICITACAOTRAB: TStringField;
    qryUsuarioPInclusaoCADTERCEIRIZADAS: TStringField;
    qryUsuarioPInclusaoCADTIPOPROGRAMACAO: TStringField;
    qryUsuarioPInclusaoCADUSUARIOS: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICOFECHAR: TStringField;
    qryUsuarioPInclusaoCADFERRAMENTARIA: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICOPROGRAMAR: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICODESPROGRAMAR: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICOEXECUTAR: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICOPARALISAR: TStringField;
    qryUsuarioPInclusaoCADORDEMSERVICOLIBERAR: TStringField;
    qryUsuarioPInclusaoCODUSUARIO: TStringField;
    qryUsuarioPInclusaoMATRICULA: TStringField;
    qryUsuarioPInclusaoNOME: TStringField;
    qryUsuarioPInclusaoNIVELACESSO: TStringField;
    qryViagens: TFDQuery;
    qryViagensCODIGO: TFDAutoIncField;
    qryViagensCODEMPRESA: TStringField;
    qryViagensCODEQUIPAMENTO: TStringField;
    qryViagensCODROTA: TIntegerField;
    qryViagensDESCRICAO: TStringField;
    qryViagensDATAPARTIDA: TDateTimeField;
    qryViagensDATACHEGADA: TDateTimeField;
    qryViagensTANQUESAIDA: TIntegerField;
    qryViagensTANQUECHEGADA: TIntegerField;
    qryViagensDISTANCIA: TBCDField;
    qryViagensURBANO: TIntegerField;
    qryViagensRODOVIARIO: TIntegerField;
    qryViagensCARREGADO: TIntegerField;
    qryViagensCONTADORSAIDA: TBCDField;
    qryViagensCONTADORCHEGADA: TBCDField;
    qryViagensCONSUMOCOMBUST: TBCDField;
    qryViagensCONSUMOLUBRIFIC: TBCDField;
    qryViagensDATACADASTRO: TDateTimeField;
    qryViagensCODUSUARIOCAD: TStringField;
    qryViagensDATAULTALT: TDateTimeField;
    qryViagensCODUSUARIOALT: TStringField;
    qryViagensOBSERVACOES: TBlobField;
    qryViagensEQUIPAMENTO: TStringField;
    qryViagensPLACA: TStringField;
    qryViagensCONSPOTCOMBUST: TBCDField;
    qryViagensCONSPOTLUBRIFIC: TBCDField;
    qryViagensVOLUMETANQUE: TBCDField;
    qryViagensMEDIDOR: TStringField;
    qryViagensROTA: TStringField;
    qryViagensUSUARIOCAD: TStringField;
    qryViagensUSUARIOALT: TStringField;
    qryViagensCombust: TFDQuery;
    qryViagensCombustCODIGO: TFDAutoIncField;
    qryViagensCombustCODEMPRESA: TStringField;
    qryViagensCombustCODEQUIPAMENTO: TStringField;
    qryViagensCombustTIPOCOMBUSTIVEL: TStringField;
    qryViagensCombustCONSPOTENCIAL: TBCDField;
    qryViagensCombustAbast: TFDQuery;
    qryViagensCombustAbastCODIGO: TFDAutoIncField;
    qryViagensCombustAbastCODEMPRESA: TStringField;
    qryViagensCombustAbastCODEQUIPAMENTO: TStringField;
    qryViagensCombustAbastCODCOMBUSTIVEL: TIntegerField;
    qryViagensCombustAbastCODROTA: TIntegerField;
    qryViagensCombustAbastDATACOMBUST: TDateTimeField;
    qryViagensCombustAbastODOMETROCOMBUST: TIntegerField;
    qryViagensCombustAbastQTDECOMBUST: TBCDField;
    qryViagensCombustAbastPRECOCOMBUST: TBCDField;
    qryViagensCombustAbastVALORCOMBUST: TBCDField;
    qryViagensCombustAbastMATRICULA: TStringField;
    qryViagensCombustAbastLEITOR: TStringField;
    qryViagensCombustAbastTROCALEITOR: TIntegerField;
    qryViagensCombustAbastCONSUMO: TBCDField;
    qryViagensCombustAbastROTA: TStringField;
    qryViagensCombustAbastNOME: TStringField;
    qryViagensCombustAbastTIPOCOMBUSTIVEL: TStringField;
    qryViagensCombustAbastCONSPOTENCIAL: TBCDField;
    qryViagensLubrific: TFDQuery;
    qryViagensLubrificCODIGO: TFDAutoIncField;
    qryViagensLubrificCODEMPRESA: TStringField;
    qryViagensLubrificCODEQUIPAMENTO: TStringField;
    qryViagensLubrificCODLUBRIFICANTE: TStringField;
    qryViagensLubrificCONSPOTENCIAL: TBCDField;
    qryViagensLubrificLUBRIFICANTE: TStringField;
    qryViagensLubrificAbast: TFDQuery;
    qryViagensLubrificAbastCODIGO: TFDAutoIncField;
    qryViagensLubrificAbastCODEMPRESA: TStringField;
    qryViagensLubrificAbastCODEQUIPAMENTO: TStringField;
    qryViagensLubrificAbastCODLUBRIFICANTE: TIntegerField;
    qryViagensLubrificAbastCODROTA: TIntegerField;
    qryViagensLubrificAbastDATALUBRIFIC: TDateTimeField;
    qryViagensLubrificAbastODOMETROLUBRIFIC: TIntegerField;
    qryViagensLubrificAbastQTDELUBRIFIC: TBCDField;
    qryViagensLubrificAbastPRECOLUBRIFIC: TBCDField;
    qryViagensLubrificAbastVALORLUBRIFIC: TBCDField;
    qryViagensLubrificAbastMATRICULA: TStringField;
    qryViagensLubrificAbastLEITOR: TStringField;
    qryViagensLubrificAbastTROCALEITOR: TIntegerField;
    qryViagensLubrificAbastCONSUMO: TBCDField;
    qryViagensLubrificAbastROTA: TStringField;
    qryViagensLubrificAbastNOME: TStringField;
    qryViagensLubrificAbastLUBRIFICANTE: TStringField;
    qryViagensLubrificAbastCONSPOTENCIAL: TBCDField;
    FDConnSPMP3: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    dsAbastecimentos: TDataSource;
    dsAbastecimentosCombust: TDataSource;
    dsAbastecimentosCombustAbast: TDataSource;
    dsAbastecimentosRotas: TDataSource;
    dsAbastecimentosLubrific: TDataSource;
    dsAbastecimentosLubrificAbast: TDataSource;
    dsAbastecimentosLeitor: TDataSource;
    dsAbastecimentosManutInsp: TDataSource;
    dsAbastecimentosLubrificInsp: TDataSource;
    dsAlertas: TDataSource;
    dsAlertasOS: TDataSource;
    dsAlertasManut: TDataSource;
    dsAlertasLubrific: TDataSource;
    dsAlertasRotas: TDataSource;
    dsAcesso: TDataSource;
    dsAlmoxarifado: TDataSource;
    dsAreas: TDataSource;
    dsCelulas: TDataSource;
    dsLinhas: TDataSource;
    dsArquivoTecnico: TDataSource;
    dsArquivoTecnicoParam: TDataSource;
    dsCalendEquip: TDataSource;
    dsCalendMObra: TDataSource;
    dsCargos: TDataSource;
    dsCalendEquipSeqHora: TDataSource;
    dsCalendMObraSeqHora: TDataSource;
    dsCausaFalha: TDataSource;
    dsCentroCusto: TDataSource;
    dsClasses: TDataSource;
    dsCustosMesMObra: TDataSource;
    dsCustosMesPecas: TDataSource;
    dsCustosMesRecursos: TDataSource;
    dsCustosMesExtras: TDataSource;
    qryAbastecimentos: TFDQuery;
    qryAbastecimentosCODIGO: TFDAutoIncField;
    qryAbastecimentosCODEMPRESA: TStringField;
    qryAbastecimentosCODEQUIPAMENTO: TStringField;
    qryAbastecimentosCODCONTADOR: TStringField;
    qryAbastecimentosCODROTA: TIntegerField;
    qryAbastecimentosTIPO: TStringField;
    qryAbastecimentosDESCRICAO: TStringField;
    qryAbastecimentosVOLUMETANQUE: TBCDField;
    qryAbastecimentosURBANO: TIntegerField;
    qryAbastecimentosRODOVIARIO: TIntegerField;
    qryAbastecimentosCARREGADO: TIntegerField;
    qryAbastecimentosCONTADORATUAL: TBCDField;
    qryAbastecimentosDATACONTADORATUAL: TDateTimeField;
    qryAbastecimentosPLACA: TStringField;
    qryAbastecimentosDATACADASTRO: TDateTimeField;
    qryAbastecimentosCODUSUARIOCAD: TStringField;
    qryAbastecimentosDATAULTALT: TDateTimeField;
    qryAbastecimentosCODUSUARIOALT: TStringField;
    qryAbastecimentosOBSERVACOES: TBlobField;
    qryAbastecimentosEQUIPAMENTO: TStringField;
    qryAbastecimentosCONTADOR: TStringField;
    qryAbastecimentosCODPROGRAMACAO: TStringField;
    qryAbastecimentosPROGRAMACAO: TStringField;
    qryAbastecimentosROTA: TStringField;
    qryAbastecimentosUSUARIOCAD: TStringField;
    qryAbastecimentosUSUARIOALT: TStringField;
    qryAbastecimentosCombust: TFDQuery;
    qryAbastecimentosCombustAbast: TFDQuery;
    qryAbastecimentosRotas: TFDQuery;
    qryAbastecimentosRotasCODIGO: TFDAutoIncField;
    qryAbastecimentosRotasCODEMPRESA: TStringField;
    qryAbastecimentosRotasCODVEICULO: TStringField;
    qryAbastecimentosRotasDESCRICAO: TStringField;
    qryAbastecimentosRotasTIPO: TStringField;
    qryAbastecimentosRotasPORCENTAGEM: TBCDField;
    qryAbastecimentosRotasDISTANCIA: TIntegerField;
    qryAbastecimentosRotasOBSERVACOES: TBlobField;
    qryAbastecimentosLubrific: TFDQuery;
    qryAbastecimentosLubrificAbast: TFDQuery;
    qryAbastecimentosLeitor: TFDQuery;
    qryAbastecimentosManutInsp: TFDQuery;
    qryAbastecimentosManutInspCODIGO: TStringField;
    qryAbastecimentosLubrificInsp: TFDQuery;
    qryAbastecimentosLubrificInspCODIGO: TStringField;
    qryAlertas: TFDQuery;
    qryAlertasCODIGO: TFDAutoIncField;
    qryAlertasCODEMPRESA: TStringField;
    qryAlertasDESCRICAO: TStringField;
    qryAlertasVENCIMENTO: TDateTimeField;
    qryAlertasANTECIPAR: TIntegerField;
    qryAlertasPROLONGAR: TIntegerField;
    qryAlertasINTERVALO: TIntegerField;
    qryAlertasOS: TFDQuery;
    qryAlertasOSTOTALCAD: TLargeintField;
    qryAlertasOSTOTALPROG: TLargeintField;
    qryAlertasOSTOTALEXEC: TLargeintField;
    qryAlertasManut: TFDQuery;
    qryAlertasManutTOTAL: TLargeintField;
    qryAlertasLubrific: TFDQuery;
    qryAlertasLubrificTOTAL: TLargeintField;
    qryAlertasRotas: TFDQuery;
    qryAlertasRotasTOTAL: TLargeintField;
    qryCustosMesMObra: TFDQuery;
    qryCustosMesMObraMATRICULA: TStringField;
    qryCustosMesMObraNOME: TStringField;
    qryCustosMesMObraSALARIO: TBCDField;
    qryCustosMesMObraCALENDARIO: TStringField;
    qryCustosMesMObraHOFICIAIS: TIntegerField;
    qryCustosMesMObraENTRADA: TDateTimeField;
    qryCustosMesMObraSAIDA: TDateTimeField;
    qryCustosMesMObraTEMPOHOMEMHORAEXEC: TBCDField;
    qryCustosMesMObraSITUACAO: TStringField;
    qryCustosMesMObraHORASUTIL: TBCDField;
    qryCustosMesPecas: TFDQuery;
    qryCustosMesPecasTOTALPECAS: TFMTBCDField;
    qryCustosMesRecursos: TFDQuery;
    qryCustosMesRecursosTOTALRECURSOS: TFMTBCDField;
    qryCustosMesExtras: TFDQuery;
    qryCustosMesExtrasTOTALEXTRAS: TFMTBCDField;
    qryCustosMesPneusNovos: TFDQuery;
    qryCustosMesPneusNovosCUSTOPNEUSNOVOS: TFMTBCDField;
    qryCustosMesPneusUsados: TFDQuery;
    qryCustosMesPneusUsadosCONSERTOS: TFMTBCDField;
    qryCustosMesTercUnid: TFDQuery;
    qryCustosMesTercUnidTOTALTERCUNID: TFMTBCDField;
    dsCustosMesPneusNovos: TDataSource;
    dsCustosMesPneusUsados: TDataSource;
    dsCustosMesTercUnid: TDataSource;
    dsDespMensalProdMensal: TDataSource;
    dsDespMensalTaxasPer: TDataSource;
    dsDespMensalTaxas: TDataSource;
    dsDispAdmissiveis: TDataSource;
    dsEquipamentos: TDataSource;
    dsEquipamentosDados: TDataSource;
    dsEquipamentosPecas: TDataSource;
    dsEquipamentosEsp: TDataSource;
    dsEquipamentosArqTec: TDataSource;
    dsEquipamentosPontosInsp: TDataSource;
    dsEquipamentosContadores: TDataSource;
    dsEquipamentosDadosR: TDataSource;
    dsEquipamentosChecaLocal: TDataSource;
    dsEquipamentosArvore: TDataSource;
    dsEquipamentosArvoreSec: TDataSource;
    dsEquipamentosImagens: TDataSource;
    dsEquipamentosReservas: TDataSource;
    dsEquipamentosHist: TDataSource;
    dsEquipamentoTipoManutHist: TDataSource;
    dsEquipamentoManutHist: TDataSource;
    dsEquipamentoLubrificHist: TDataSource;
    dsEquipamentosHistTercFora: TDataSource;
    dsEquipamentosSubst: TDataSource;
    dsEquipamentosSubstHist: TDataSource;
    dsFabricantes: TDataSource;
    dsFamEquipamento: TDataSource;
    dsFamPecasRep: TDataSource;
    dsFamPneus: TDataSource;
    dsFamRecursos: TDataSource;
    dsFeriados: TDataSource;
    dsFerramentaria: TDataSource;
    dsFerramentariaItens: TDataSource;
    dsFormatoCodigo: TDataSource;
    dsFornecedores: TDataSource;
    dsFuncionarios: TDataSource;
    dsFuncionariosCxaFerram: TDataSource;
    qryDespMensalFunc: TFDQuery;
    qryDespMensalFuncCODIGO: TFDAutoIncField;
    qryDespMensalFuncCODEMPRESA: TStringField;
    qryDespMensalFuncCODDESPINFOFUNCPER: TIntegerField;
    qryDespMensalFuncMATRICULA: TStringField;
    qryDespMensalFuncMES: TStringField;
    qryDespMensalFuncANO: TStringField;
    qryDespMensalFuncHENOREXEC: TIntegerField;
    qryDespMensalFuncHEFEREXEC: TIntegerField;
    qryDespMensalFuncHENORPAGAS: TIntegerField;
    qryDespMensalFuncHEFERPAGAS: TIntegerField;
    qryDespMensalFuncHORASFOLGAS: TIntegerField;
    qryDespMensalFuncACIDSEMPT: TIntegerField;
    qryDespMensalFuncACIDCOMPT: TIntegerField;
    qryDespMensalFuncDIASPERDTOT: TIntegerField;
    qryDespMensalFuncCUSTOTREIN: TBCDField;
    qryDespMensalFuncNOME: TStringField;
    qryEquipamentos: TFDQuery;
    qryEquipamentosCODIGO: TStringField;
    qryEquipamentosCODEMPRESA: TStringField;
    qryEquipamentosCODCALENDARIO: TStringField;
    qryEquipamentosCODLOCALIZACAO: TStringField;
    qryEquipamentosCODCELULA: TStringField;
    qryEquipamentosCODLINHA: TStringField;
    qryEquipamentosSEQUENCIA: TIntegerField;
    qryEquipamentosCODFABRICANTE: TStringField;
    qryEquipamentosCODFORNECEDOR: TStringField;
    qryEquipamentosCODCENTROCUSTO: TStringField;
    qryEquipamentosCODCLASSE: TStringField;
    qryEquipamentosCODFAMILIAEQUIP: TStringField;
    qryEquipamentosCODEQUIPAMENTOPAI: TStringField;
    qryEquipamentosSTATUS: TStringField;
    qryEquipamentosDESCRICAO: TStringField;
    qryEquipamentosDATAAQUISICAO: TDateTimeField;
    qryEquipamentosDATAINIFUNC: TDateTimeField;
    qryEquipamentosDATAGARANTIA: TDateTimeField;
    qryEquipamentosNOTAFISCAL: TStringField;
    qryEquipamentosPRECO: TBCDField;
    qryEquipamentosOPERANDO: TStringField;
    qryEquipamentosRESERVA: TStringField;
    qryEquipamentosSECUNDARIO: TStringField;
    qryEquipamentosCALCULARCONF: TStringField;
    qryEquipamentosDATAINICIOCONF: TDateTimeField;
    qryEquipamentosPERIODOCONF: TStringField;
    qryEquipamentosCALCULADACONF: TStringField;
    qryEquipamentosFATORMARCHAADM: TBCDField;
    qryEquipamentosDIASEMISSAOOS: TIntegerField;
    qryEquipamentosDATACADASTRO: TDateTimeField;
    qryEquipamentosCODUSUARIOCAD: TStringField;
    qryEquipamentosDATAULTALT: TDateTimeField;
    qryEquipamentosCODUSUARIOALT: TStringField;
    qryEquipamentosOBSERVACOES: TBlobField;
    qryEquipamentosUSUARIOCAD: TStringField;
    qryEquipamentosUSUARIOALT: TStringField;
    qryEquipamentosCALENDARIOEQUIP: TStringField;
    qryEquipamentosAREA: TStringField;
    qryEquipamentosCELULA: TStringField;
    qryEquipamentosLINHA: TStringField;
    qryEquipamentosDESCPAI: TStringField;
    qryEquipamentosFABRICANTE: TStringField;
    qryEquipamentosFORNECEDOR: TStringField;
    qryEquipamentosCENTROCUSTO: TStringField;
    qryEquipamentosCLASSE: TStringField;
    qryEquipamentosFAMILIAEQUIP: TStringField;
    qryEquipamentosDados: TFDQuery;
    qryEquipamentosPecas: TFDQuery;
    qryEquipamentosPecasCODIGO: TFDAutoIncField;
    qryEquipamentosPecasCODEMPRESA: TStringField;
    qryEquipamentosPecasCODEQUIPAMENTO: TStringField;
    qryEquipamentosPecasCODPECAREP: TStringField;
    qryEquipamentosPecasDESCRICAO: TStringField;
    qryEquipamentosPecasQUANTIDADE: TIntegerField;
    qryEquipamentosPecasREFERENCIA: TStringField;
    qryEquipamentosPecasCODUNIDADE: TStringField;
    qryEquipamentosPecasLOCALIZACAO: TStringField;
    qryEquipamentosPecasPECA: TStringField;
    qryEquipamentosPecasEQUIPAMENTO: TStringField;
    qryEquipamentosEsp: TFDQuery;
    qryEquipamentosEspCODIGO: TFDAutoIncField;
    qryEquipamentosEspCODEMPRESA: TStringField;
    qryEquipamentosEspCODEQUIPAMENTO: TStringField;
    qryEquipamentosEspMATRICULA: TStringField;
    qryEquipamentosEspNOME: TStringField;
    qryEquipamentosEspEQUIPAMENTO: TStringField;
    qryEquipamentosArqTec: TFDQuery;
    qryEquipamentosArqTecCODIGO: TFDAutoIncField;
    qryEquipamentosArqTecCODEMPRESA: TStringField;
    qryEquipamentosArqTecCODEQUIPAMENTO: TStringField;
    qryEquipamentosArqTecCODARQUIVO: TStringField;
    qryEquipamentosArqTecTIPO: TStringField;
    qryEquipamentosArqTecARQUIVO: TStringField;
    qryEquipamentosArqTecEQUIPAMENTO: TStringField;
    qryEquipamentosPontosInsp: TFDQuery;
    qryEquipamentosContadores: TFDQuery;
    qryEquipamentosDadosR: TFDQuery;
    qryEquipamentosChecaLocal: TFDQuery;
    qryEquipamentosChecaLocalCODIGO: TStringField;
    qryEquipamentosChecaLocalCODEMPRESA: TStringField;
    qryEquipamentosChecaLocalDESCRICAO: TStringField;
    qryEquipamentosArvore: TFDQuery;
    qryEquipamentosArvoreCODIGO: TStringField;
    qryEquipamentosArvoreDESCRICAO: TStringField;
    qryEquipamentosArvoreCODEQUIPAMENTOPAI: TStringField;
    qryEquipamentosArvoreDESCEQUIPAMENTOPAI: TStringField;
    qryEquipamentosArvoreSEQUENCIA: TIntegerField;
    qryEquipamentosArvoreCODAREA: TStringField;
    qryEquipamentosArvoreSec: TFDQuery;
    qryEquipamentosArvoreSecCODIGO: TStringField;
    qryEquipamentosArvoreSecDESCRICAO: TStringField;
    qryEquipamentosArvoreSecCODEQUIPAMENTOPAI: TStringField;
    qryEquipamentosArvoreSecDESCEQUIPAMENTOPAI: TStringField;
    qryEquipamentosImagens: TFDQuery;
    qryEquipamentosImagensCODIGO: TFDAutoIncField;
    qryEquipamentosImagensCODEMPRESA: TStringField;
    qryEquipamentosImagensCODEQUIPAMENTO: TStringField;
    qryEquipamentosImagensCODITEMSECUNDARIO: TStringField;
    qryEquipamentosImagensDESCRICAO: TStringField;
    qryEquipamentosImagensDESCSECUNDARIO: TStringField;
    qryEquipamentosImagensTIPOFOTO: TStringField;
    qryEquipamentosImagensFOTO: TBlobField;
    qryEquipamentosHist: TFDQuery;
    qryEquipamentosHistCODEQUIPAMENTO: TStringField;
    qryEquipamentosHistEQUIPAMENTO: TStringField;
    qryEquipamentosHistCALENDARIO: TStringField;
    qryEquipamentosHistFORNECEDOR: TStringField;
    qryEquipamentosHistFABRICANTE: TStringField;
    qryEquipamentosHistORDEMSERVICO: TFDAutoIncField;
    qryEquipamentosHistSERVICO: TStringField;
    qryEquipamentosHistTIPOMANUTENCAO: TStringField;
    qryEquipamentosHistMOTIVOPARADA: TStringField;
    qryEquipamentosHistCAUSAFALHA: TStringField;
    qryEquipamentosHistCENTROCUSTO: TStringField;
    qryEquipamentosHistPRIORIDADEPARADA: TStringField;
    qryEquipamentosHistEQUIPPARADO: TStringField;
    qryEquipamentosHistDATAINICIOREAL: TDateTimeField;
    qryEquipamentosHistDATAFIMREAL: TDateTimeField;
    qryEquipamentosHistDATAFECHAMENTO: TDateTimeField;
    qryEquipamentosHistTEMPOEXECUTADO: TBCDField;
    qryEquipamentosHistTEMPOHOMEMHORAEXEC: TBCDField;
    qryEquipamentosHistCUSTOMOBRA: TBCDField;
    qryEquipamentosHistCUSTORECURSOS: TBCDField;
    qryEquipamentosHistCUSTOPECAS: TBCDField;
    qryEquipamentosHistCUSTOEXTRA: TBCDField;
    qryEquipamentosHistCUSTOSECUNDARIOS: TBCDField;
    qryEquipamentoTipoManutHist: TFDQuery;
    qryEquipamentoTipoManutHistCODEQUIPAMENTO: TStringField;
    qryEquipamentoTipoManutHistDESCRICAO: TStringField;
    qryEquipamentoTipoManutHistTOTAL: TLargeintField;
    qryEquipamentoTipoManutHistCUSTOTOTAL: TFMTBCDField;
    qryEquipamentoManutHist: TFDQuery;
    qryEquipamentoManutHistINDICE: TFDAutoIncField;
    qryEquipamentoManutHistDESCRICAO: TStringField;
    qryEquipamentoManutHistCODORDEMSERVICO: TIntegerField;
    qryEquipamentoManutHistDTAINICIO1: TDateTimeField;
    qryEquipamentoManutHistDATAEXECUCAO: TDateTimeField;
    qryEquipamentoManutHistDATAFECHAMENTO: TDateTimeField;
    qryEquipamentoLubrificHist: TFDQuery;
    qryEquipamentoLubrificHistINDICE: TFDAutoIncField;
    qryEquipamentoLubrificHistDESCRICAO: TStringField;
    qryEquipamentoLubrificHistCODORDEMSERVICO: TIntegerField;
    qryEquipamentoLubrificHistDTAINICIO1: TDateTimeField;
    qryEquipamentoLubrificHistDATAEXECUCAO: TDateTimeField;
    qryEquipamentoLubrificHistDATAFECHAMENTO: TDateTimeField;
    qryEquipamentosHistTercFora: TFDQuery;
    qryEquipamentosHistTercForaTOTAL: TFMTBCDField;
    qryFuncionarios: TFDQuery;
    qryFuncionariosMATRICULA: TStringField;
    qryFuncionariosCODEMPRESA: TStringField;
    qryFuncionariosCODCARGO: TStringField;
    qryFuncionariosCODCALENDARIO: TStringField;
    qryFuncionariosCODAREA: TStringField;
    qryFuncionariosCODCELULA: TStringField;
    qryFuncionariosNOME: TStringField;
    qryFuncionariosAPELIDO: TStringField;
    qryFuncionariosCPF: TStringField;
    qryFuncionariosENDERECO: TStringField;
    qryFuncionariosBAIRRO: TStringField;
    qryFuncionariosCIDADE: TStringField;
    qryFuncionariosESTADO: TStringField;
    qryFuncionariosCEP: TStringField;
    qryFuncionariosTELEFONE: TStringField;
    qryFuncionariosCELULAR: TStringField;
    qryFuncionariosSALARIO: TBCDField;
    qryFuncionariosDATANASCIMENTO: TDateTimeField;
    qryFuncionariosDATAADMISSAO: TDateTimeField;
    qryFuncionariosESCOLARIDADE: TStringField;
    qryFuncionariosEMAIL: TStringField;
    qryFuncionariosMOBRA: TStringField;
    qryFuncionariosTERCEIRO: TStringField;
    qryFuncionariosUSUARIO: TStringField;
    qryFuncionariosDIASUSO: TIntegerField;
    qryFuncionariosAUTONOMO: TStringField;
    qryFuncionariosDATACADASTRO: TDateTimeField;
    qryFuncionariosCODUSUARIOCAD: TStringField;
    qryFuncionariosDATAULTALT: TDateTimeField;
    qryFuncionariosCODUSUARIOALT: TStringField;
    qryFuncionariosOCUPADO: TStringField;
    qryFuncionariosPROGRAMADO: TStringField;
    qryFuncionariosATIVO: TStringField;
    qryFuncionariosMOTIVOAUSENCIA: TStringField;
    qryFuncionariosCURSOS: TStringField;
    qryFuncionariosTIPOIMAGEM: TStringField;
    qryFuncionariosIMAGEM: TBlobField;
    qryFuncionariosOBSERVACOES: TBlobField;
    qryFuncionariosAREA: TStringField;
    qryFuncionariosCARGO: TStringField;
    qryFuncionariosCALENDARIO: TStringField;
    qryFuncionariosCELULA: TStringField;
    qryFuncionariosUSUARIOCAD: TStringField;
    qryFuncionariosUSUARIOALT: TStringField;
    qryFuncionariosCxaFerram: TFDQuery;
    qryFuncionariosCxaFerramCODIGO: TFDAutoIncField;
    qryFuncionariosCxaFerramCODEMPRESA: TStringField;
    qryFuncionariosCxaFerramMATRICULA: TStringField;
    qryFuncionariosCxaFerramKIT: TStringField;
    qryFuncionariosCxaFerramCODITEM: TStringField;
    qryFuncionariosCxaFerramDESCRICAO: TStringField;
    qryFuncionariosCxaFerramQUANTIDADE: TIntegerField;
    qryFuncionariosCxaFerramDATAENTREGA: TDateTimeField;
    qryFuncionariosCxaFerramFUNCIONARIO: TStringField;
    qryFuncionariosCxaFerramInv: TFDQuery;
    qryFuncionariosCxaFerramInvCODIGO: TFDAutoIncField;
    qryFuncionariosCxaFerramInvCODEMPRESA: TStringField;
    qryFuncionariosCxaFerramInvMATRICULA: TStringField;
    qryFuncionariosCxaFerramInvDATACADASTRO: TDateTimeField;
    qryFuncionariosCxaFerramInvDATAFECHAMENTO: TDateTimeField;
    qryFuncionariosCxaFerramInvFREQUENCIA: TIntegerField;
    qryFuncionariosCxaFerramInvSITUACAO: TStringField;
    qryFuncionariosCxaFerramInvFUNCIONARIO: TStringField;
    qryFuncionariosCxaFerramInvItens: TFDQuery;
    qryFuncionariosAusencias: TFDQuery;
    qryFuncionariosAusenciasCODIGO: TFDAutoIncField;
    qryFuncionariosAusenciasCODEMPRESA: TStringField;
    qryFuncionariosAusenciasMATRICULA: TStringField;
    qryFuncionariosAusenciasMOTIVO: TStringField;
    qryFuncionariosAusenciasINICIO: TDateTimeField;
    qryFuncionariosAusenciasFIM: TDateTimeField;
    qryFuncionariosAusenciasDATACADASTRO: TDateTimeField;
    qryFuncionariosAusenciasCODUSUARIOCAD: TStringField;
    qryFuncionariosAusenciasDATAULTALT: TDateTimeField;
    qryFuncionariosAusenciasCODUSUARIOALT: TStringField;
    qryFuncionariosAusenciasUSUARIOCAD: TStringField;
    qryFuncionariosAusenciasUSUARIOALT: TStringField;
    qryFuncionariosAusenciasNOME: TStringField;
    qryFuncionariosFerramentaria: TFDQuery;
    qryFuncionariosFerramentariaCODIGO: TFDAutoIncField;
    qryFuncionariosFerramentariaCODEMPRESA: TStringField;
    qryFuncionariosFerramentariaCODFERRAMENTARIA: TStringField;
    qryFuncionariosFerramentariaCODFERRAMENTARIAITEM: TStringField;
    qryFuncionariosFerramentariaMATRICULA: TStringField;
    qryFuncionariosFerramentariaQUANTIDADE: TIntegerField;
    qryFuncionariosFerramentariaDATAEMPRESTIMO: TDateTimeField;
    qryFuncionariosFerramentariaDATADEVOLUCAO: TDateTimeField;
    qryFuncionariosFerramentariaFERRAMENTARIA: TStringField;
    qryFuncionariosFerramentariaITEM: TStringField;
    qryFuncionariosFerramentariaNOME: TStringField;
    dsFuncionariosCxaFerramInv: TDataSource;
    dsFuncionariosCxaFerramInvItens: TDataSource;
    dsFuncionariosAusencias: TDataSource;
    dsFuncionariosFerramentaria: TDataSource;
    dsDespMensalDiversas: TDataSource;
    dsDespMensalFuncPer: TDataSource;
    dsDespMensalFunc: TDataSource;
    dsDespMensalManutencao: TDataSource;
    dsDespMensalManutencaoCustos: TDataSource;
    dsFuncionariosHist: TDataSource;
    dsFuncionariosTipoManutHist: TDataSource;
    dsFuncionariosHistServicos: TDataSource;
    qryFuncionariosHist: TFDQuery;
    qryFuncionariosHistMATRICULA: TStringField;
    qryFuncionariosHistNOME: TStringField;
    qryFuncionariosHistCALENDARIO: TStringField;
    qryFuncionariosHistCARGO: TStringField;
    qryFuncionariosTipoManutHist: TFDQuery;
    qryFuncionariosTipoManutHistTOTALOS: TLargeintField;
    qryFuncionariosTipoManutHistTOTALHOMEMHORA: TFMTBCDField;
    qryFuncionariosHistServicos: TFDQuery;
    qryFuncionariosHistAusencias: TFDQuery;
    qryFuncionariosHistAusenciasINICIO: TDateTimeField;
    qryFuncionariosHistAusenciasFIM: TDateTimeField;
    dsFuncionariosHistAusencias: TDataSource;
    dsGrupos: TDataSource;
    dsUnidades: TDataSource;
    dsAdmCorp: TDataSource;
    dsAdmUnid: TDataSource;
    dsImagens: TDataSource;
    dsIndDesempenho: TDataSource;
    dsIndDesempPercParadas: TDataSource;
    dsIndDesempTotalHE: TDataSource;
    dsLubrificantes: TDataSource;
    dsLubrificProgEquip: TDataSource;
    dsLubrificProgEquipItens: TDataSource;
    dsLubrificProgEquipItensEsp: TDataSource;
    dsLubrificProgEquipItensEspApagar: TDataSource;
    dsLubrificProgFamEquip: TDataSource;
    dsLubrificProgFamEquipPlanoTrab: TDataSource;
    dsLubrificProgFamEquipPartes: TDataSource;
    dsLubrificProgFamEquipItens: TDataSource;
    dsLubrificProgFamEquipItensApagar: TDataSource;
    dsLubrificProgFamEquipItensTodos: TDataSource;
    dsManutCons: TDataSource;
    dsLubrificCons: TDataSource;
    dsRotaCons: TDataSource;
    dsManutPeriodicas: TDataSource;
    dsManutPeriodicasItens: TDataSource;
    dsManutPeriodicasItensEsp: TDataSource;
    dsLubrificPeriodicas: TDataSource;
    dsLubrificPeriodicasItens: TDataSource;
    dsLubrificPeriodicasItensEsp: TDataSource;
    qryGrupos: TFDQuery;
    qryGruposCODIGO: TFDAutoIncField;
    qryGruposCODNIVELACESSO: TStringField;
    qryGruposCODFORMATOCODIGO: TIntegerField;
    qryGruposDESCRICAO: TStringField;
    qryGruposDATACADASTRO: TDateField;
    qryGruposCODUSUARIOCAD: TStringField;
    qryGruposDATAULTALT: TDateField;
    qryGruposCODUSUARIOALT: TStringField;
    qryGruposUSUARIOCAD: TStringField;
    qryGruposUSUARIOALT: TStringField;
    qryUnidades: TFDQuery;
    qryUnidadesCODIGO: TStringField;
    qryUnidadesCODGRUPO: TIntegerField;
    qryUnidadesNOME: TStringField;
    qryUnidadesLOCAL: TStringField;
    qryUnidadesATIVO: TStringField;
    qryUnidadesVISIVEL: TStringField;
    qryUnidadesTRANSFORMACAO: TStringField;
    qryUnidadesDATACADASTRO: TDateTimeField;
    qryUnidadesCODUSUARIOCAD: TStringField;
    qryUnidadesDATAULTALT: TDateTimeField;
    qryUnidadesCODUSUARIOALT: TStringField;
    qryUnidadesGRUPO: TStringField;
    qryUnidadesUSUARIOCAD: TStringField;
    qryUnidadesUSUARIOALT: TStringField;
    qryAdmCorp: TFDQuery;
    qryAdmCorpCODIGO: TStringField;
    qryAdmCorpCODEMPRESA: TStringField;
    qryAdmCorpCODGRUPO: TIntegerField;
    qryAdmCorpCODEMPRESAS: TFDAutoIncField;
    qryAdmCorpMATRICULA: TStringField;
    qryAdmCorpNOME: TStringField;
    qryAdmCorpSENHA: TStringField;
    qryAdmCorpLOGADO: TStringField;
    qryAdmCorpQUEDAENERGIA: TStringField;
    qryAdmCorpTEMPORARIO: TStringField;
    qryAdmCorpDATAFIM: TDateTimeField;
    qryAdmCorpCODNIVELACESSO: TStringField;
    qryAdmCorpCODPERMISSAOACESSO: TIntegerField;
    qryAdmCorpCODPERMISSAOINCLUSAO: TIntegerField;
    qryAdmCorpCODPERMISSAOALTERACAO: TIntegerField;
    qryAdmCorpCODPERMISSAOEXCLUSAO: TIntegerField;
    qryAdmCorpSENHAALTERADA: TStringField;
    qryAdmCorpBLOQUEIO: TSmallintField;
    qryAdmCorpDATACADASTRO: TDateField;
    qryAdmCorpCODUSUARIOCAD: TStringField;
    qryAdmCorpDATAULTALT: TDateField;
    qryAdmCorpCODUSUARIOALT: TStringField;
    qryAdmCorpUSUARIOCAD: TStringField;
    qryAdmCorpUSUARIOALT: TStringField;
    qryAdmCorpGRUPO: TStringField;
    qryAdmCorpEMPRESA: TStringField;
    qryAdmCorpFUNCIONARIO: TStringField;
    qryAdmCorpNIVELACESSO: TStringField;
    qryAdmUnid: TFDQuery;
    qryAdmUnidCODIGO: TStringField;
    qryAdmUnidCODEMPRESA: TStringField;
    qryAdmUnidCODGRUPO: TIntegerField;
    qryAdmUnidCODEMPRESAS: TFDAutoIncField;
    qryAdmUnidMATRICULA: TStringField;
    qryAdmUnidNOME: TStringField;
    qryAdmUnidSENHA: TStringField;
    qryAdmUnidLOGADO: TStringField;
    qryAdmUnidQUEDAENERGIA: TStringField;
    qryAdmUnidTEMPORARIO: TStringField;
    qryAdmUnidDATAFIM: TDateTimeField;
    qryAdmUnidCODNIVELACESSO: TStringField;
    qryAdmUnidCODPERMISSAOACESSO: TIntegerField;
    qryAdmUnidCODPERMISSAOINCLUSAO: TIntegerField;
    qryAdmUnidCODPERMISSAOALTERACAO: TIntegerField;
    qryAdmUnidCODPERMISSAOEXCLUSAO: TIntegerField;
    qryAdmUnidSENHAALTERADA: TStringField;
    qryAdmUnidBLOQUEIO: TSmallintField;
    qryAdmUnidDATACADASTRO: TDateField;
    qryAdmUnidCODUSUARIOCAD: TStringField;
    qryAdmUnidDATAULTALT: TDateField;
    qryAdmUnidCODUSUARIOALT: TStringField;
    qryAdmUnidUSUARIOCAD: TStringField;
    qryAdmUnidUSUARIOALT: TStringField;
    qryAdmUnidGRUPO: TStringField;
    qryAdmUnidEMPRESA: TStringField;
    qryAdmUnidFUNCIONARIO: TStringField;
    qryAdmUnidNIVELACESSO: TStringField;
    qryLubrificProgFamEquip: TFDQuery;
    qryLubrificProgFamEquipCODIGO: TStringField;
    qryLubrificProgFamEquipCODEMPRESA: TStringField;
    qryLubrificProgFamEquipCODFAMILIAEQUIP: TStringField;
    qryLubrificProgFamEquipCODMONITORAMENTO: TIntegerField;
    qryLubrificProgFamEquipDESCRICAO: TStringField;
    qryLubrificProgFamEquipPROGRAMARPOR1: TStringField;
    qryLubrificProgFamEquipPROGRAMARPOR2: TStringField;
    qryLubrificProgFamEquipPROGRAMARPOR3: TStringField;
    qryLubrificProgFamEquipATIVO: TStringField;
    qryLubrificProgFamEquipVISIVEL: TStringField;
    qryLubrificProgFamEquipDATACADASTRO: TDateTimeField;
    qryLubrificProgFamEquipCODUSUARIOCAD: TStringField;
    qryLubrificProgFamEquipDATAULTALT: TDateTimeField;
    qryLubrificProgFamEquipCODUSUARIOALT: TStringField;
    qryLubrificProgFamEquipOBSERVACOES: TBlobField;
    qryLubrificProgFamEquipFAMILIAEQUIPAMENTO: TStringField;
    qryLubrificProgFamEquipMONITORAMENTO: TStringField;
    qryLubrificProgFamEquipPROGRAMACAO2: TStringField;
    qryLubrificProgFamEquipUSUARIOCAD: TStringField;
    qryLubrificProgFamEquipUSUARIOALT: TStringField;
    qryLubrificProgFamEquipPlanoTrab: TFDQuery;
    qryLubrificProgFamEquipPlanoTrabCODIGO: TFDAutoIncField;
    qryLubrificProgFamEquipPlanoTrabCODEMPRESA: TStringField;
    qryLubrificProgFamEquipPlanoTrabCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgFamEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    qryLubrificProgFamEquipPlanoTrabDESCRICAO: TStringField;
    qryLubrificProgFamEquipPlanoTrabDETALHES: TBlobField;
    qryLubrificProgFamEquipPlanoTrabAUTOMATICO: TStringField;
    qryLubrificProgFamEquipPartes: TFDQuery;
    qryLubrificProgFamEquipPartesCODIGO: TFDAutoIncField;
    qryLubrificProgFamEquipPartesCODEMPRESA: TStringField;
    qryLubrificProgFamEquipPartesDESCRICAO: TStringField;
    qryLubrificProgFamEquipPartesCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgFamEquipPartesCODFAMILIAEQUIP: TStringField;
    qryLubrificProgFamEquipItens: TFDQuery;
    qryLubrificProgFamEquipItensCODIGO: TFDAutoIncField;
    qryLubrificProgFamEquipItensCODEMPRESA: TStringField;
    qryLubrificProgFamEquipItensCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgFamEquipItensCODPARTE: TIntegerField;
    qryLubrificProgFamEquipItensITEM: TStringField;
    qryLubrificProgFamEquipItensDESCINSPECAO: TStringField;
    qryLubrificProgFamEquipItensEQUIPPARADO: TStringField;
    qryLubrificProgFamEquipItensTEMPO: TBCDField;
    qryLubrificProgFamEquipItensEXECAUTONOMO: TStringField;
    qryLubrificProgFamEquipItensEXECUTADO: TStringField;
    qryLubrificProgFamEquipItensBOM: TStringField;
    qryLubrificProgFamEquipItensREGULAR: TStringField;
    qryLubrificProgFamEquipItensRUIM: TStringField;
    qryLubrificProgFamEquipItensPARTE: TStringField;
    qryLubrificProgFamEquipItensDESCLUBRIFICENCAO: TStringField;
    qryLubrificProgFamEquipItensApagar: TFDQuery;
    qryLubrificProgFamEquipItensTodos: TFDQuery;
    FDAutoIncField4: TFDAutoIncField;
    StringField49: TStringField;
    StringField50: TStringField;
    IntegerField8: TIntegerField;
    StringField51: TStringField;
    StringField52: TStringField;
    StringField53: TStringField;
    BCDField2: TBCDField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    StringField57: TStringField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    qryManutCons: TFDQuery;
    qryManutConsCODIGO: TStringField;
    qryManutConsCODEMPRESA: TStringField;
    qryManutConsCODEQUIPAMENTO: TStringField;
    qryManutConsCODMANUTPROGFAMEQUIP: TStringField;
    qryManutConsCODMONITORAMENTO: TIntegerField;
    qryManutConsDESCRICAO: TStringField;
    qryManutConsCRITICIDADE: TStringField;
    qryManutConsFREQUENCIA1: TSmallintField;
    qryManutConsDTAINICIO1: TDateTimeField;
    qryManutConsREPROGRAMAR1: TStringField;
    qryManutConsFREQUENCIA2: TSmallintField;
    qryManutConsLEITURA: TIntegerField;
    qryManutConsREPROGRAMAR2: TStringField;
    qryManutConsRELATORIO: TStringField;
    qryManutConsEQUIPAMENTO: TStringField;
    qryManutConsSEQUENCIA: TIntegerField;
    qryManutConsCODFAMILIAEQUIP: TStringField;
    qryManutConsFAMILIAEQUIP: TStringField;
    qryManutConsCODAREA: TStringField;
    qryManutConsAREA: TStringField;
    qryManutConsCODCELULA: TStringField;
    qryManutConsCELULA: TStringField;
    qryManutConsCODLINHA: TStringField;
    qryManutConsLINHA: TStringField;
    qryLubrificCons: TFDQuery;
    qryLubrificConsCODIGO: TStringField;
    qryLubrificConsCODEMPRESA: TStringField;
    qryLubrificConsCODEQUIPAMENTO: TStringField;
    qryLubrificConsCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificConsCODMONITORAMENTO: TIntegerField;
    qryLubrificConsDESCRICAO: TStringField;
    qryLubrificConsCRITICIDADE: TStringField;
    qryLubrificConsFREQUENCIA1: TSmallintField;
    qryLubrificConsDTAINICIO1: TDateTimeField;
    qryLubrificConsREPROGRAMAR1: TStringField;
    qryLubrificConsFREQUENCIA2: TSmallintField;
    qryLubrificConsLEITURA: TIntegerField;
    qryLubrificConsREPROGRAMAR2: TStringField;
    qryLubrificConsRELATORIO: TStringField;
    qryLubrificConsEQUIPAMENTO: TStringField;
    qryLubrificConsSEQUENCIA: TIntegerField;
    qryLubrificConsCODFAMILIAEQUIP: TStringField;
    qryLubrificConsFAMILIAEQUIP: TStringField;
    qryLubrificConsCODAREA: TStringField;
    qryLubrificConsAREA: TStringField;
    qryLubrificConsCODCELULA: TStringField;
    qryLubrificConsCELULA: TStringField;
    qryLubrificConsCODLINHA: TStringField;
    qryLubrificConsLINHA: TStringField;
    qryRotaCons: TFDQuery;
    qryRotaConsCODIGO: TStringField;
    qryRotaConsCODEMPRESA: TStringField;
    qryRotaConsDESCRICAO: TStringField;
    qryRotaConsFREQUENCIA: TSmallintField;
    qryRotaConsDATAINICIO: TDateTimeField;
    qryRotaConsREPROGRAMAR: TStringField;
    qryRotaConsRELATORIO: TStringField;
    qryManutPeriodicas: TFDQuery;
    qryManutPeriodicasINDICE: TFDAutoIncField;
    qryManutPeriodicasCODEMPRESA: TStringField;
    qryManutPeriodicasCODEQUIPAMENTO: TStringField;
    qryManutPeriodicasCODMANUTPROGFAMEQUIP: TStringField;
    qryManutPeriodicasCODMONITORAMENTO: TIntegerField;
    qryManutPeriodicasCODORDEMSERVICO: TIntegerField;
    qryManutPeriodicasMATRICULA: TStringField;
    qryManutPeriodicasDESCRICAO: TStringField;
    qryManutPeriodicasFREQUENCIA1: TSmallintField;
    qryManutPeriodicasDTAINICIO1: TDateTimeField;
    qryManutPeriodicasREPROGRAMAR1: TStringField;
    qryManutPeriodicasLEITURA: TIntegerField;
    qryManutPeriodicasSITUACAO: TStringField;
    qryManutPeriodicasDATAEXECUCAO: TDateTimeField;
    qryManutPeriodicasDATAFECHAMENTO: TDateTimeField;
    qryManutPeriodicasRELATORIO: TStringField;
    qryManutPeriodicasGEROUOS: TStringField;
    qryManutPeriodicasREALIZADA: TStringField;
    qryManutPeriodicasGRUPOINSP: TStringField;
    qryManutPeriodicasSITUACAOOS: TStringField;
    qryManutPeriodicasCODMANUTENCAO: TStringField;
    qryManutPeriodicasDATAINICIOREAL: TDateTimeField;
    qryManutPeriodicasDATAFIMREAL: TDateTimeField;
    qryManutPeriodicasEQUIPAMENTO: TStringField;
    qryManutPeriodicasMATRICULAOS: TStringField;
    qryManutPeriodicasFUNCIONARIOOS: TStringField;
    qryManutPeriodicasAREA: TStringField;
    qryManutPeriodicasItens: TFDQuery;
    qryManutPeriodicasItensINDICE: TFDAutoIncField;
    qryManutPeriodicasItensCODEMPRESA: TStringField;
    qryManutPeriodicasItensHISTORICO: TIntegerField;
    qryManutPeriodicasItensCODIGO: TIntegerField;
    qryManutPeriodicasItensCODMANUTPROGEQUIP: TStringField;
    qryManutPeriodicasItensDTAINICIO1: TDateTimeField;
    qryManutPeriodicasItensDATAINSPECAO: TDateTimeField;
    qryManutPeriodicasItensCODPARTE: TIntegerField;
    qryManutPeriodicasItensITEM: TStringField;
    qryManutPeriodicasItensDESCINSPECAO: TStringField;
    qryManutPeriodicasItensEQUIPPARADO: TStringField;
    qryManutPeriodicasItensTEMPO: TBCDField;
    qryManutPeriodicasItensEXECAUTONOMO: TStringField;
    qryManutPeriodicasItensEXECUTADO: TStringField;
    qryManutPeriodicasItensBOM: TStringField;
    qryManutPeriodicasItensREGULAR: TStringField;
    qryManutPeriodicasItensRUIM: TStringField;
    qryManutPeriodicasItensPARTE: TStringField;
    qryManutPeriodicasItensEsp: TFDQuery;
    qryManutPeriodicasItensEspINDICE: TFDAutoIncField;
    qryManutPeriodicasItensEspCODEMPRESA: TStringField;
    qryManutPeriodicasItensEspHISTORICO: TIntegerField;
    qryManutPeriodicasItensEspCODIGO: TIntegerField;
    qryManutPeriodicasItensEspCODMANUTPROGEQUIP: TStringField;
    qryManutPeriodicasItensEspDTAINICIO1: TDateTimeField;
    qryManutPeriodicasItensEspDATAINSPECAO: TDateTimeField;
    qryManutPeriodicasItensEspCODPARTE: TIntegerField;
    qryManutPeriodicasItensEspITEM: TStringField;
    qryManutPeriodicasItensEspDESCINSPECAO: TStringField;
    qryManutPeriodicasItensEspEQUIPPARADO: TStringField;
    qryManutPeriodicasItensEspTEMPO: TBCDField;
    qryManutPeriodicasItensEspEXECAUTONOMO: TStringField;
    qryManutPeriodicasItensEspEXECUTADO: TStringField;
    qryManutPeriodicasItensEspBOM: TStringField;
    qryManutPeriodicasItensEspREGULAR: TStringField;
    qryManutPeriodicasItensEspRUIM: TStringField;
    qryManutPeriodicasItensEspPARTE: TStringField;
    qryLubrificPeriodicas: TFDQuery;
    qryLubrificPeriodicasINDICE: TFDAutoIncField;
    qryLubrificPeriodicasCODEMPRESA: TStringField;
    qryLubrificPeriodicasCODIGO: TStringField;
    qryLubrificPeriodicasCODEQUIPAMENTO: TStringField;
    qryLubrificPeriodicasCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificPeriodicasCODMONITORAMENTO: TIntegerField;
    qryLubrificPeriodicasCODORDEMSERVICO: TIntegerField;
    qryLubrificPeriodicasMATRICULA: TStringField;
    qryLubrificPeriodicasDESCRICAO: TStringField;
    qryLubrificPeriodicasFREQUENCIA1: TSmallintField;
    qryLubrificPeriodicasDTAINICIO1: TDateTimeField;
    qryLubrificPeriodicasREPROGRAMAR1: TStringField;
    qryLubrificPeriodicasLEITURA: TIntegerField;
    qryLubrificPeriodicasSITUACAO: TStringField;
    qryLubrificPeriodicasDATAEXECUCAO: TDateTimeField;
    qryLubrificPeriodicasDATAFECHAMENTO: TDateTimeField;
    qryLubrificPeriodicasRELATORIO: TStringField;
    qryLubrificPeriodicasGEROUOS: TStringField;
    qryLubrificPeriodicasREALIZADA: TStringField;
    qryLubrificPeriodicasGRUPOINSP: TStringField;
    qryLubrificPeriodicasSITUACAOOS: TStringField;
    qryLubrificPeriodicasCODMANUTENCAO: TStringField;
    qryLubrificPeriodicasDATAINICIOREAL: TDateTimeField;
    qryLubrificPeriodicasDATAFIMREAL: TDateTimeField;
    qryLubrificPeriodicasEQUIPAMENTO: TStringField;
    qryLubrificPeriodicasMATRICULAOS: TStringField;
    qryLubrificPeriodicasFUNCIONARIOOS: TStringField;
    qryLubrificPeriodicasAREA: TStringField;
    qryLubrificPeriodicasItens: TFDQuery;
    qryLubrificPeriodicasItensINDICE: TFDAutoIncField;
    qryLubrificPeriodicasItensCODEMPRESA: TStringField;
    qryLubrificPeriodicasItensHISTORICO: TIntegerField;
    qryLubrificPeriodicasItensCODIGO: TIntegerField;
    qryLubrificPeriodicasItensCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificPeriodicasItensDTAINICIO1: TDateTimeField;
    qryLubrificPeriodicasItensDATAINSPECAO: TDateTimeField;
    qryLubrificPeriodicasItensCODPARTE: TIntegerField;
    qryLubrificPeriodicasItensITEM: TStringField;
    qryLubrificPeriodicasItensDESCINSPECAO: TStringField;
    qryLubrificPeriodicasItensEQUIPPARADO: TStringField;
    qryLubrificPeriodicasItensTEMPO: TBCDField;
    qryLubrificPeriodicasItensEXECAUTONOMO: TStringField;
    qryLubrificPeriodicasItensEXECUTADO: TStringField;
    qryLubrificPeriodicasItensBOM: TStringField;
    qryLubrificPeriodicasItensREGULAR: TStringField;
    qryLubrificPeriodicasItensRUIM: TStringField;
    qryLubrificPeriodicasItensPARTE: TStringField;
    qryLubrificPeriodicasItensEsp: TFDQuery;
    qryLubrificPeriodicasItensEspINDICE: TFDAutoIncField;
    qryLubrificPeriodicasItensEspCODEMPRESA: TStringField;
    qryLubrificPeriodicasItensEspHISTORICO: TIntegerField;
    qryLubrificPeriodicasItensEspCODIGO: TIntegerField;
    qryLubrificPeriodicasItensEspCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificPeriodicasItensEspDTAINICIO1: TDateTimeField;
    qryLubrificPeriodicasItensEspDATAINSPECAO: TDateTimeField;
    qryLubrificPeriodicasItensEspCODPARTE: TIntegerField;
    qryLubrificPeriodicasItensEspITEM: TStringField;
    qryLubrificPeriodicasItensEspDESCINSPECAO: TStringField;
    qryLubrificPeriodicasItensEspEQUIPPARADO: TStringField;
    qryLubrificPeriodicasItensEspTEMPO: TBCDField;
    qryLubrificPeriodicasItensEspEXECAUTONOMO: TStringField;
    qryLubrificPeriodicasItensEspEXECUTADO: TStringField;
    qryLubrificPeriodicasItensEspBOM: TStringField;
    qryLubrificPeriodicasItensEspREGULAR: TStringField;
    qryLubrificPeriodicasItensEspRUIM: TStringField;
    qryLubrificPeriodicasItensEspPARTE: TStringField;
    dsManutPeriodicasHist: TDataSource;
    dsLubrificPeriodicasHist: TDataSource;
    qryManutProgEquip: TFDQuery;
    qryManutProgEquipCODIGO: TStringField;
    qryManutProgEquipCODEMPRESA: TStringField;
    qryManutProgEquipCODEQUIPAMENTO: TStringField;
    qryManutProgEquipCODMANUTPROGFAMEQUIP: TStringField;
    qryManutProgEquipCODMONITORAMENTO: TIntegerField;
    qryManutProgEquipDESCRICAO: TStringField;
    qryManutProgEquipMATRICULA: TStringField;
    qryManutProgEquipCRITICIDADE: TStringField;
    qryManutProgEquipFREQUENCIA1: TSmallintField;
    qryManutProgEquipDTAINICIO1: TDateTimeField;
    qryManutProgEquipREPROGRAMAR1: TStringField;
    qryManutProgEquipFREQUENCIA2: TIntegerField;
    qryManutProgEquipREPROGRAMAR2: TStringField;
    qryManutProgEquipLEITURA: TIntegerField;
    qryManutProgEquipRELATORIO: TStringField;
    qryManutProgEquipGRUPOINSP: TStringField;
    qryManutProgEquipDATACADASTRO: TDateTimeField;
    qryManutProgEquipCODUSUARIOCAD: TStringField;
    qryManutProgEquipDATAULTALT: TDateTimeField;
    qryManutProgEquipCODUSUARIOALT: TStringField;
    qryManutProgEquipOBSERVACOES: TBlobField;
    qryManutProgEquipUSUARIOCAD: TStringField;
    qryManutProgEquipUSUARIOALT: TStringField;
    qryManutProgEquipDESCMANUTPROGFAMEQUIP: TStringField;
    qryManutProgEquipPROGRAMACAO2: TStringField;
    qryManutProgEquipEQUIPAMENTO: TStringField;
    qryManutProgEquipROTA: TStringField;
    qryManutProgEquipRESPONSAVEL: TStringField;
    qryManutProgEquipItens: TFDQuery;
    qryManutProgEquipItensCODIGO: TIntegerField;
    qryManutProgEquipItensCODEMPRESA: TStringField;
    qryManutProgEquipItensCODMANUTPROGFAMEQUIP: TStringField;
    qryManutProgEquipItensCODPARTE: TIntegerField;
    qryManutProgEquipItensITEM: TStringField;
    qryManutProgEquipItensDESCINSPECAO: TStringField;
    qryManutProgEquipItensEQUIPPARADO: TStringField;
    qryManutProgEquipItensTEMPO: TBCDField;
    qryManutProgEquipItensEXECAUTONOMO: TStringField;
    qryManutProgEquipItensPARTE: TStringField;
    qryManutProgEquipItensEsp: TFDQuery;
    qryManutProgEquipItensEspCODIGO: TFDAutoIncField;
    qryManutProgEquipItensEspCODEMPRESA: TStringField;
    qryManutProgEquipItensEspCODMANUTPROGEQUIP: TStringField;
    qryManutProgEquipItensEspCODPARTE: TIntegerField;
    qryManutProgEquipItensEspITEM: TStringField;
    qryManutProgEquipItensEspDESCINSPECAO: TStringField;
    qryManutProgEquipItensEspEQUIPPARADO: TStringField;
    qryManutProgEquipItensEspTEMPO: TBCDField;
    qryManutProgEquipItensEspEXECAUTONOMO: TStringField;
    qryManutProgEquipItensEspEXECUTADO: TStringField;
    qryManutProgEquipItensEspBOM: TStringField;
    qryManutProgEquipItensEspREGULAR: TStringField;
    qryManutProgEquipItensEspRUIM: TStringField;
    qryManutProgEquipItensEspPARTE: TStringField;
    qryEquipEmRota: TFDQuery;
    qryEquipEmRotaCODIGO: TFDAutoIncField;
    qryEquipEmRotaCODEMPRESA: TStringField;
    qryEquipEmRotaCODAREA: TStringField;
    qryEquipEmRotaCODCELULA: TStringField;
    qryEquipEmRotaCODLINHA: TStringField;
    qryEquipEmRotaSEQUENCIA: TIntegerField;
    qryEquipEmRotaREPROGRAMAR: TStringField;
    qryEquipEmRotaROTA: TStringField;
    qryEquipEmRotaDATAINICIO: TDateTimeField;
    qryEquipEmRotaRELATORIO: TStringField;
    qryManutProgEquipItensEspApagar: TFDQuery;
    qryManutProgFamEquip: TFDQuery;
    qryManutProgFamEquipCODIGO: TStringField;
    qryManutProgFamEquipCODEMPRESA: TStringField;
    qryManutProgFamEquipCODFAMILIAEQUIP: TStringField;
    qryManutProgFamEquipCODMONITORAMENTO: TIntegerField;
    qryManutProgFamEquipDESCRICAO: TStringField;
    qryManutProgFamEquipPROGRAMARPOR1: TStringField;
    qryManutProgFamEquipPROGRAMARPOR2: TStringField;
    qryManutProgFamEquipPROGRAMARPOR3: TStringField;
    qryManutProgFamEquipATIVO: TStringField;
    qryManutProgFamEquipVISIVEL: TStringField;
    qryManutProgFamEquipDATACADASTRO: TDateTimeField;
    qryManutProgFamEquipCODUSUARIOCAD: TStringField;
    qryManutProgFamEquipDATAULTALT: TDateTimeField;
    qryManutProgFamEquipCODUSUARIOALT: TStringField;
    qryManutProgFamEquipOBSERVACOES: TBlobField;
    qryManutProgFamEquipFAMILIAEQUIPAMENTO: TStringField;
    qryManutProgFamEquipMONITORAMENTO: TStringField;
    qryManutProgFamEquipPROGRAMACAO2: TStringField;
    qryManutProgFamEquipUSUARIOCAD: TStringField;
    qryManutProgFamEquipUSUARIOALT: TStringField;
    qryManutProgFamEquipPlanoTrab: TFDQuery;
    qryManutProgFamEquipPlanoTrabCODIGO: TFDAutoIncField;
    qryManutProgFamEquipPlanoTrabCODEMPRESA: TStringField;
    qryManutProgFamEquipPlanoTrabCODMANUTPROGFAMEQUIP: TStringField;
    qryManutProgFamEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    qryManutProgFamEquipPlanoTrabDESCRICAO: TStringField;
    qryManutProgFamEquipPlanoTrabDETALHES: TBlobField;
    qryManutProgFamEquipPlanoTrabAUTOMATICO: TStringField;
    qryManutProgFamEquipPartes: TFDQuery;
    qryManutProgFamEquipPartesCODIGO: TFDAutoIncField;
    qryManutProgFamEquipPartesCODEMPRESA: TStringField;
    qryManutProgFamEquipPartesDESCRICAO: TStringField;
    qryManutProgFamEquipPartesCODMANUTPROGFAMEQUIP: TStringField;
    qryManutProgFamEquipPartesCODFAMILIAEQUIP: TStringField;
    qryManutProgFamEquipItens: TFDQuery;
    qryManutProgFamEquipItensCODIGO: TFDAutoIncField;
    qryManutProgFamEquipItensCODEMPRESA: TStringField;
    qryManutProgFamEquipItensCODMANUTPROGFAMEQUIP: TStringField;
    qryManutProgFamEquipItensCODPARTE: TIntegerField;
    qryManutProgFamEquipItensITEM: TStringField;
    qryManutProgFamEquipItensDESCINSPECAO: TStringField;
    qryManutProgFamEquipItensEQUIPPARADO: TStringField;
    qryManutProgFamEquipItensTEMPO: TBCDField;
    qryManutProgFamEquipItensEXECAUTONOMO: TStringField;
    qryManutProgFamEquipItensEXECUTADO: TStringField;
    qryManutProgFamEquipItensBOM: TStringField;
    qryManutProgFamEquipItensREGULAR: TStringField;
    qryManutProgFamEquipItensRUIM: TStringField;
    qryManutProgFamEquipItensPARTE: TStringField;
    qryManutProgFamEquipItensDESCMANUTENCAO: TStringField;
    qryManutProgFamEquipItensApagar: TFDQuery;
    qryManutProgFamEquipItensTodos: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    StringField37: TStringField;
    StringField38: TStringField;
    IntegerField7: TIntegerField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    BCDField1: TBCDField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    qryLubrificVenc: TFDQuery;
    dsManutProgEquip: TDataSource;
    dsManutProgEquipItens: TDataSource;
    dsManutProgEquipItensEsp: TDataSource;
    dsEquipEmRota: TDataSource;
    dsManutProgEquipItensEspApagar: TDataSource;
    dsManutProgFamEquip: TDataSource;
    dsManutProgFamEquipPlanoTrab: TDataSource;
    dsManutProgFamEquipPartes: TDataSource;
    dsManutProgFamEquipItens: TDataSource;
    dsManutProgFamEquipItensApagar: TDataSource;
    dsManutProgFamEquipItensTodos: TDataSource;
    dsManutVenc: TDataSource;
    dsLubrificVenc: TDataSource;
    dsMonitoramento: TDataSource;
    dsMonitMedicoesPtosInsp: TDataSource;
    dsMonitMedicoesCont: TDataSource;
    dsMonitMedicoesContManut: TDataSource;
    dsMotivoParada: TDataSource;
    dsNvelAcesso: TDataSource;
    dsPermissoesAcessoPadrao: TDataSource;
    dsPermissoesAlteracaoPadrao: TDataSource;
    dsPermissoesExclusaoPadrao: TDataSource;
    dsPermissoesInclusaoPadrao: TDataSource;
    dsOficinas: TDataSource;
    dsOrdemServico: TDataSource;
    dsOrdemServicoServSolic: TDataSource;
    dsOrdemServicoEquipe: TDataSource;
    dsOrdemServicoEquipeMObra: TDataSource;
    dsOrdemServicoEquipePecas: TDataSource;
    dsOrdemServicoEquipeRecursos: TDataSource;
    dsOrdemServicoEquipePlanoTrab: TDataSource;
    dsOrdemServicoEquipeMObraUtil: TDataSource;
    dsOrdemServicoEquipePecasUtil: TDataSource;
    dsOrdemServicoEquipeRecursosUtil: TDataSource;
    dsOrdemServicoServExec: TDataSource;
    dsOrdemServicoHistorico: TDataSource;
    dsOrdemServicoHistoricoServExec: TDataSource;
    dsOrdemServicoParalisacoes: TDataSource;
    dsOrdemServicoLocalizaMObra: TDataSource;
    dsOrdemServicoMObraExec: TDataSource;
    dsOrdemServicoMObraProg: TDataSource;
    dsOrdemServicoGerencia: TDataSource;
    qryMonitoramento: TFDQuery;
    qryMonitoramentoCODIGO: TFDAutoIncField;
    qryMonitoramentoCODEMPRESA: TStringField;
    qryMonitoramentoCODPONTOINSPECAO: TStringField;
    qryMonitoramentoCODCONTADOR: TStringField;
    qryMonitoramentoCODORDEMSERVICO: TIntegerField;
    qryMonitoramentoCODPLANOTRABALHO: TStringField;
    qryMonitoramentoDESCRICAO: TStringField;
    qryMonitoramentoTIPOPONTO: TStringField;
    qryMonitoramentoCODPONTOINSPLOC: TIntegerField;
    qryMonitoramentoEMISSAOOS: TStringField;
    qryMonitoramentoDATACADASTRO: TDateTimeField;
    qryMonitoramentoCODUSUARIOCAD: TStringField;
    qryMonitoramentoDATAULTALT: TDateTimeField;
    qryMonitoramentoCODUSUARIOALT: TStringField;
    qryMonitoramentoOBSERVACOES: TBlobField;
    qryMonitoramentoUSUARIOCAD: TStringField;
    qryMonitoramentoUSUARIOALT: TStringField;
    qryMonitoramentoPONTOINSPECAO: TStringField;
    qryMonitoramentoCONTADOR: TStringField;
    qryMonitoramentoPLANOTRABALHO: TStringField;
    qryMonitoramentoCODPROGRAMACAO: TStringField;
    qryMonitoramentoPROGRAMACAO: TStringField;
    qryMonitoramentoPONTOINSPLOC: TStringField;
    qryMonitMedicoesPtosInsp: TFDQuery;
    qryMonitMedicoesCont: TFDQuery;
    qryMonitMedicoesContCODIGO: TFDAutoIncField;
    qryMonitMedicoesContCODEMPRESA: TStringField;
    qryMonitMedicoesContCODEQUIPAMENTO: TStringField;
    qryMonitMedicoesContCODMONITORAMENTO: TIntegerField;
    qryMonitMedicoesContMATRICULA: TStringField;
    qryMonitMedicoesContDATAMEDICAO: TDateTimeField;
    qryMonitMedicoesContMEDICAO: TBCDField;
    qryMonitMedicoesContOSGERADA: TFloatField;
    qryMonitMedicoesContCONTADOR: TStringField;
    qryMonitMedicoesContEQUIPAMENTO: TStringField;
    qryMonitMedicoesContFUNCIONARIO: TStringField;
    qryMonitMedicoesContSITUACAOOS: TStringField;
    qryMonitMedicoesContManut: TFDQuery;
    qryMonitMedicoesContManutCODIGO: TStringField;
    qryMonitMedicoesContManutCODEMPRESA: TStringField;
    qryMonitMedicoesContManutCODEQUIPAMENTO: TStringField;
    qryMonitMedicoesContManutCODMANUTPROGFAMEQUIP: TStringField;
    qryMonitMedicoesContManutMANUTENCAO: TStringField;
    qryMonitMedicoesContManutDTAINICIO1: TDateTimeField;
    qryMonitMedicoesContManutFREQUENCIA2: TSmallintField;
    qryMonitMedicoesContManutLEITURA: TIntegerField;
    qryMonitMedicoesContManutREPROGRAMAR2: TStringField;
    qryMonitMedicoesContManutRELATORIO: TStringField;
    qryMonitMedicoesContManutMANUTPROGFAMEQUIP: TStringField;
    qryOrdemServicoGerencia: TFDQuery;
    qryOrdemServicoGerenciaCODIGO: TFDAutoIncField;
    qryOrdemServicoGerenciaCODEMPRESA: TStringField;
    qryOrdemServicoGerenciaDESCRICAO: TStringField;
    qryOrdemServicoGerenciaDATACADASTRO: TDateTimeField;
    qryOrdemServicoGerenciaDATAPROGINI: TDateTimeField;
    qryOrdemServicoGerenciaDATAINICIOREAL: TDateTimeField;
    qryOrdemServicoGerenciaDATAFECHAMENTO: TDateTimeField;
    qryOrdemServicoGerenciaCODMANUTENCAO: TStringField;
    qryOrdemServicoGerenciaROTAEQUIP: TStringField;
    qryOrdemServicoGerenciaSOLICTRAB: TStringField;
    qryOrdemServicoGerenciaSITUACAO: TStringField;
    qryOrdemServicoGerenciaMATRICULA: TStringField;
    qryOrdemServicoGerenciaIMPORTANCIA: TIntegerField;
    qryOrdemServicoGerenciaTEMPOPREVISTO: TBCDField;
    qryOrdemServicoGerenciaCODOFICINA: TStringField;
    qryOrdemServicoGerenciaCODEQUIPAMENTO: TStringField;
    qryOrdemServicoGerenciaEQUIPAMENTO: TStringField;
    qryOrdemServicoGerenciaTIPOMANUTENCAO: TStringField;
    qryOrdemServicoTercFora: TFDQuery;
    qryOrdemServicoTercForaCODIGO: TFDAutoIncField;
    qryOrdemServicoTercForaCODEMPRESA: TStringField;
    qryOrdemServicoTercForaCODEQUIPAMENTO: TStringField;
    qryOrdemServicoTercForaDESCRICAO: TStringField;
    qryOrdemServicoTercForaCONTRATO: TStringField;
    qryOrdemServicoTercForaNUMCONTRATO: TStringField;
    qryOrdemServicoTercForaNUMPEDIDO: TStringField;
    qryOrdemServicoTercForaPEDIDO: TStringField;
    qryOrdemServicoTercForaDATACONTRATOINI: TDateTimeField;
    qryOrdemServicoTercForaDATACONTRATOFIN: TDateTimeField;
    qryOrdemServicoTercForaTOTALSERVINI: TBCDField;
    qryOrdemServicoTercForaTOTALSERVCOMP: TBCDField;
    qryOrdemServicoTercForaTOTALSERVTERC: TBCDField;
    qryOrdemServicoTercForaTOTALGERAL: TBCDField;
    qryOrdemServicoTercForaDATACADASTRO: TDateTimeField;
    qryOrdemServicoTercForaCODUSUARIOCAD: TStringField;
    qryOrdemServicoTercForaDATAULTALT: TDateTimeField;
    qryOrdemServicoTercForaCODUSUARIOALT: TStringField;
    qryOrdemServicoTercForaOBSERVACOES: TBlobField;
    qryOrdemServicoTercForaEQUIPAMENTO: TStringField;
    qryOrdemServicoTercForaUSUARIOCAD: TStringField;
    qryOrdemServicoTercForaUSUARIOALT: TStringField;
    qryOrdemServicoTercForaOI: TFDQuery;
    qryOrdemServicoTercForaOICODIGO: TFDAutoIncField;
    qryOrdemServicoTercForaOICODEMPRESA: TStringField;
    qryOrdemServicoTercForaOICODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercForaOINUMERO: TIntegerField;
    qryOrdemServicoTercForaOIDESCRICAO: TStringField;
    qryOrdemServicoTercForaOITOTAL: TBCDField;
    qryOrdemServicoTercForaOC: TFDQuery;
    qryOrdemServicoTercForaOCCODIGO: TFDAutoIncField;
    qryOrdemServicoTercForaOCCODEMPRESA: TStringField;
    qryOrdemServicoTercForaOCCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercForaOCNUMERO: TIntegerField;
    qryOrdemServicoTercForaOCDESCRICAO: TStringField;
    qryOrdemServicoTercForaOCTOTAL: TBCDField;
    qryOrdemServicoTercForaOE: TFDQuery;
    qryOrdemServicoTercForaOECODIGO: TFDAutoIncField;
    qryOrdemServicoTercForaOECODEMPRESA: TStringField;
    qryOrdemServicoTercForaOECODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercForaOENUMERO: TIntegerField;
    qryOrdemServicoTercForaOEDESCRICAO: TStringField;
    qryOrdemServicoTercForaOETOTAL: TBCDField;
    qryOrdemServicoTercForaAditivos: TFDQuery;
    qryOrdemServicoTercForaAditivosCODIGO: TFDAutoIncField;
    qryOrdemServicoTercForaAditivosCODEMPRESA: TStringField;
    qryOrdemServicoTercForaAditivosCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercForaAditivosNOVADATAFIN: TDateTimeField;
    qryOrdemServicoTercForaAditivosNOVOVALOR: TBCDField;
    qryOrdemServicoTercForaAditivosNOVONUMPARCELAS: TIntegerField;
    qryOrdemServicoTercForaAditivosMOTIVO: TBlobField;
    qryOrdemServico: TFDQuery;
    qryOrdemServicoCODIGO: TFDAutoIncField;
    qryOrdemServicoCODEMPRESA: TStringField;
    qryOrdemServicoCODEQUIPAMENTO: TStringField;
    qryOrdemServicoCODMANUTENCAO: TStringField;
    qryOrdemServicoCODMOTIVOPARADA: TStringField;
    qryOrdemServicoCODCAUSAFALHA: TStringField;
    qryOrdemServicoCODCENTROCUSTO: TStringField;
    qryOrdemServicoCODMONITORAMENTO: TIntegerField;
    qryOrdemServicoMATRICULA: TStringField;
    qryOrdemServicoCODOFICINA: TStringField;
    qryOrdemServicoCODOSPRINCIPAL: TIntegerField;
    qryOrdemServicoCODMANUTPROGEQUIP: TStringField;
    qryOrdemServicoCODLUBRIFICPROGEQUIP: TStringField;
    qryOrdemServicoCODEQUIPAMENTOPAI: TStringField;
    qryOrdemServicoDESCRICAO: TStringField;
    qryOrdemServicoPRIORIDADEPARADA: TStringField;
    qryOrdemServicoCRITICIDADE: TStringField;
    qryOrdemServicoEQUIPPARADO: TStringField;
    qryOrdemServicoATIVO: TStringField;
    qryOrdemServicoVISIVEL: TStringField;
    qryOrdemServicoTEMPOPREVISTO: TBCDField;
    qryOrdemServicoTEMPOHOMEMHORA: TBCDField;
    qryOrdemServicoSUBORDEMSERVICO: TStringField;
    qryOrdemServicoLOCAL: TStringField;
    qryOrdemServicoRESPONSAVEL: TStringField;
    qryOrdemServicoEXECAUTONOMO: TStringField;
    qryOrdemServicoSOLICTRAB: TStringField;
    qryOrdemServicoPROGMANUAL: TStringField;
    qryOrdemServicoIMPORTANCIA: TSmallintField;
    qryOrdemServicoSITUACAO: TStringField;
    qryOrdemServicoROTAEQUIP: TStringField;
    qryOrdemServicoPARCIAL: TStringField;
    qryOrdemServicoDATAPROGINI: TDateTimeField;
    qryOrdemServicoDATAPROGFIN: TDateTimeField;
    qryOrdemServicoREPROGRAMADA: TStringField;
    qryOrdemServicoDATAREPROG: TDateTimeField;
    qryOrdemServicoQTDEREPROG: TSmallintField;
    qryOrdemServicoMOTIVOREPROG: TStringField;
    qryOrdemServicoDATAINICIO: TDateTimeField;
    qryOrdemServicoDATAINICIOREAL: TDateTimeField;
    qryOrdemServicoDATAFIM: TDateTimeField;
    qryOrdemServicoDATAFIMREAL: TDateTimeField;
    qryOrdemServicoDATAFECHAMENTO: TDateTimeField;
    qryOrdemServicoDATACANCEL: TDateTimeField;
    qryOrdemServicoTEMPOEXECUTADO: TBCDField;
    qryOrdemServicoTEMPOHOMEMHORAEXEC: TBCDField;
    qryOrdemServicoCUSTOMOBRA: TBCDField;
    qryOrdemServicoCUSTORECURSOS: TBCDField;
    qryOrdemServicoCUSTOPECAS: TBCDField;
    qryOrdemServicoCUSTOEXTRA: TBCDField;
    qryOrdemServicoCUSTOEXTRADESC: TStringField;
    qryOrdemServicoCUSTOSECUNDARIOS: TBCDField;
    qryOrdemServicoIMPPLANOTRAB: TStringField;
    qryOrdemServicoDATACADASTRO: TDateTimeField;
    qryOrdemServicoCODUSUARIOCAD: TStringField;
    qryOrdemServicoDATAULTALT: TDateTimeField;
    qryOrdemServicoCODUSUARIOALT: TStringField;
    qryOrdemServicoOBSERVACOES: TBlobField;
    qryOrdemServicoEQUIPAMENTO: TStringField;
    qryOrdemServicoAREA: TStringField;
    qryOrdemServicoCELULA: TStringField;
    qryOrdemServicoLINHA: TStringField;
    qryOrdemServicoMANUTENCAO: TStringField;
    qryOrdemServicoMOTIVOPARADA: TStringField;
    qryOrdemServicoFALHA: TStringField;
    qryOrdemServicoCENTROCUSTO: TStringField;
    qryOrdemServicoOFICINA: TStringField;
    qryOrdemServicoSOLICITANTE: TStringField;
    qryOrdemServicoMANUTPROGEQUIP: TStringField;
    qryOrdemServicoLUBRIFICPROGEQUIP: TStringField;
    qryOrdemServicoCODSOLICITACAOTRAB: TIntegerField;
    qryOrdemServicoSOLICITACAOTRAB: TStringField;
    qryOrdemServicoUSUARIOCAD: TStringField;
    qryOrdemServicoUSUARIOALT: TStringField;
    qryOrdemServicoNOMERESPONSAVEL: TStringField;
    qryOrdemServicoServSolic: TFDQuery;
    qryOrdemServicoServSolicCODIGO: TFDAutoIncField;
    qryOrdemServicoServSolicCODEMPRESA: TStringField;
    qryOrdemServicoServSolicCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoServSolicPARTE: TStringField;
    qryOrdemServicoServSolicITEM: TStringField;
    qryOrdemServicoServSolicDESCRICAO: TStringField;
    qryOrdemServicoServSolicEQUIPPARADO: TStringField;
    qryOrdemServicoServSolicTEMPOEXECUCAO: TBCDField;
    qryOrdemServicoEquipe: TFDQuery;
    qryOrdemServicoEquipeCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeCODEMPRESA: TStringField;
    qryOrdemServicoEquipeCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeCODEQUIPE: TStringField;
    qryOrdemServicoEquipeTEMPO: TBCDField;
    qryOrdemServicoEquipeMObra: TFDQuery;
    qryOrdemServicoEquipeMObraCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeMObraCODEMPRESA: TStringField;
    qryOrdemServicoEquipeMObraCODEQUIPE: TIntegerField;
    qryOrdemServicoEquipeMObraCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeMObraCODCARGO: TStringField;
    qryOrdemServicoEquipeMObraCODCALENDARIO: TStringField;
    qryOrdemServicoEquipeMObraTOTALHOMEMHORA: TBCDField;
    qryOrdemServicoEquipeMObraCARGO: TStringField;
    qryOrdemServicoEquipeMObraCALENDARIO: TStringField;
    qryOrdemServicoEquipePecas: TFDQuery;
    qryOrdemServicoEquipePecasCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipePecasCODEMPRESA: TStringField;
    qryOrdemServicoEquipePecasCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipePecasCODPECASREPOSICAO: TStringField;
    qryOrdemServicoEquipePecasQTDESOLIC: TIntegerField;
    qryOrdemServicoEquipePecasQTDERESERV: TIntegerField;
    qryOrdemServicoEquipePecasENTRADA: TDateTimeField;
    qryOrdemServicoEquipePecasREFERENCIA: TStringField;
    qryOrdemServicoEquipePecasESTOQUE: TIntegerField;
    qryOrdemServicoEquipePecasPECA: TStringField;
    qryOrdemServicoEquipeRecursos: TFDQuery;
    qryOrdemServicoEquipeRecursosCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeRecursosCODEMPRESA: TStringField;
    qryOrdemServicoEquipeRecursosCODEQUIPE: TIntegerField;
    qryOrdemServicoEquipeRecursosCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeRecursosCODRECURSO: TStringField;
    qryOrdemServicoEquipeRecursosQTDESOLIC: TIntegerField;
    qryOrdemServicoEquipeRecursosQTDERESERV: TIntegerField;
    qryOrdemServicoEquipeRecursosENTRADA: TDateTimeField;
    qryOrdemServicoEquipeRecursosRECURSO: TStringField;
    qryOrdemServicoEquipeRecursosESTOQUE: TIntegerField;
    qryOrdemServicoEquipePlanoTrab: TFDQuery;
    qryOrdemServicoEquipePlanoTrabCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipePlanoTrabCODEMPRESA: TStringField;
    qryOrdemServicoEquipePlanoTrabCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipePlanoTrabCODPLANOTRABALHO: TStringField;
    qryOrdemServicoEquipePlanoTrabIMPRIMIR: TStringField;
    qryOrdemServicoEquipePlanoTrabPLANOTRABALHO: TStringField;
    qryOrdemServicoEquipePlanoTrabDETALHES: TBlobField;
    qryOrdemServicoEquipeMObraUtil: TFDQuery;
    qryOrdemServicoEquipePecasUtil: TFDQuery;
    qryOrdemServicoEquipePecasUtilCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipePecasUtilCODEMPRESA: TStringField;
    qryOrdemServicoEquipePecasUtilCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipePecasUtilCODPECASREPOSICAO: TStringField;
    qryOrdemServicoEquipePecasUtilQTDESOLIC: TIntegerField;
    qryOrdemServicoEquipePecasUtilQTDERESERV: TIntegerField;
    qryOrdemServicoEquipePecasUtilENTRADA: TDateTimeField;
    qryOrdemServicoEquipePecasUtilPECA: TStringField;
    qryOrdemServicoEquipePecasUtilREFERENCIA: TStringField;
    qryOrdemServicoEquipePecasUtilESTOQUE: TIntegerField;
    qryOrdemServicoEquipePecasUtilPRECO: TBCDField;
    qryOrdemServicoEquipeRecursosUtil: TFDQuery;
    qryOrdemServicoEquipeRecursosUtilCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeRecursosUtilCODEMPRESA: TStringField;
    qryOrdemServicoEquipeRecursosUtilCODEQUIPE: TIntegerField;
    qryOrdemServicoEquipeRecursosUtilCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeRecursosUtilCODRECURSO: TStringField;
    qryOrdemServicoEquipeRecursosUtilQTDESOLIC: TIntegerField;
    qryOrdemServicoEquipeRecursosUtilQTDERESERV: TIntegerField;
    qryOrdemServicoEquipeRecursosUtilENTRADA: TDateTimeField;
    qryOrdemServicoEquipeRecursosUtilRECURSO: TStringField;
    qryOrdemServicoEquipeRecursosUtilESTOQUE: TIntegerField;
    qryOrdemServicoEquipeRecursosUtilPRECOHORA: TFMTBCDField;
    qryOrdemServicoServExec: TFDQuery;
    qryOrdemServicoServExecCODIGO: TFDAutoIncField;
    qryOrdemServicoServExecCODEMPRESA: TStringField;
    qryOrdemServicoServExecCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoServExecPARTE: TStringField;
    qryOrdemServicoServExecITEM: TStringField;
    qryOrdemServicoServExecDESCRICAO: TStringField;
    qryOrdemServicoServExecEQUIPPARADO: TStringField;
    qryOrdemServicoServExecTEMPOEXECUCAO: TBCDField;
    qryOrdemServicoHistorico: TFDQuery;
    qryOrdemServicoHistoricoCODIGO: TFDAutoIncField;
    qryOrdemServicoHistoricoDESCRICAO: TStringField;
    qryOrdemServicoHistoricoCODEQUIPAMENTO: TStringField;
    qryOrdemServicoHistoricoEQUIPAMENTO: TStringField;
    qryOrdemServicoHistoricoDATACADASTRO: TDateTimeField;
    qryOrdemServicoHistoricoCODAREA: TStringField;
    qryOrdemServicoHistoricoAREA: TStringField;
    qryOrdemServicoHistoricoCELULA: TStringField;
    qryOrdemServicoHistoricoCODMOTIVOPARADA: TStringField;
    qryOrdemServicoHistoricoMOTIVOPARADA: TStringField;
    qryOrdemServicoHistoricoCODMANUTENCAO: TStringField;
    qryOrdemServicoHistoricoMANUTENCAO: TStringField;
    qryOrdemServicoHistoricoCODCAUSAFALHA: TStringField;
    qryOrdemServicoHistoricoCAUSAFALHA: TStringField;
    qryOrdemServicoHistoricoCODCENTROCUSTO: TStringField;
    qryOrdemServicoHistoricoCENTROCUSTO: TStringField;
    qryOrdemServicoHistoricoOFICINA: TStringField;
    qryOrdemServicoHistoricoMATRICULA: TStringField;
    qryOrdemServicoHistoricoSOLICITANTE: TStringField;
    qryOrdemServicoHistoricoDATAINICIOREAL: TDateTimeField;
    qryOrdemServicoHistoricoDATAFIMREAL: TDateTimeField;
    qryOrdemServicoHistoricoTEMPOPREVISTO: TBCDField;
    qryOrdemServicoHistoricoTEMPOEXECUTADO: TBCDField;
    qryOrdemServicoHistoricoCUSTOTOTAL: TFMTBCDField;
    qryOrdemServicoHistoricoSITUACAO: TStringField;
    qryOrdemServicoHistoricoSOLICTRAB: TStringField;
    qryOrdemServicoHistoricoROTAEQUIP: TStringField;
    qryOrdemServicoHistoricoServExec: TFDQuery;
    qryOrdemServicoHistoricoServExecCODIGO: TFDAutoIncField;
    qryOrdemServicoHistoricoServExecCODEMPRESA: TStringField;
    qryOrdemServicoHistoricoServExecCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoHistoricoServExecPARTE: TStringField;
    qryOrdemServicoHistoricoServExecITEM: TStringField;
    qryOrdemServicoHistoricoServExecDESCRICAO: TStringField;
    qryOrdemServicoHistoricoServExecEQUIPPARADO: TStringField;
    qryOrdemServicoHistoricoServExecTEMPOEXECUCAO: TBCDField;
    qryOrdemServicoParalisacoes: TFDQuery;
    qryOrdemServicoParalisacoesCODIGO: TFDAutoIncField;
    qryOrdemServicoParalisacoesCODEMPRESA: TStringField;
    qryOrdemServicoParalisacoesCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoParalisacoesDATAPARALISACAO: TDateTimeField;
    qryOrdemServicoParalisacoesDATARETORNO: TDateTimeField;
    qryOrdemServicoParalisacoesMOTIVOPARALISACAO: TStringField;
    qryOrdemServicoLocalizaMObra: TFDQuery;
    qryOrdemServicoMObraExec: TFDQuery;
    qryOrdemServicoMObraExecCODIGO: TFDAutoIncField;
    qryOrdemServicoMObraExecCODEMPRESA: TStringField;
    qryOrdemServicoMObraExecCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoMObraExecCODEQUIPE: TIntegerField;
    qryOrdemServicoMObraExecCODCARGO: TStringField;
    qryOrdemServicoMObraExecMATRICULA: TStringField;
    qryOrdemServicoMObraExecNOME: TStringField;
    qryOrdemServicoMObraExecENTRADA: TDateTimeField;
    qryOrdemServicoMObraExecSAIDA: TDateTimeField;
    qryOrdemServicoMObraExecCARGO: TStringField;
    qryOrdemServicoMObraExecCODCALENDARIO: TStringField;
    qryOrdemServicoMObraExecCALENDARIO: TStringField;
    qryOrdemServicoMObraProg: TFDQuery;
    qryOrdemServicoMObraProgCODIGO: TFDAutoIncField;
    qryOrdemServicoMObraProgCODEMPRESA: TStringField;
    qryOrdemServicoMObraProgCODEQUIPE: TIntegerField;
    qryOrdemServicoMObraProgCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoMObraProgCODCARGO: TStringField;
    qryOrdemServicoMObraProgMATRICULA: TStringField;
    qryOrdemServicoMObraProgNOME: TStringField;
    qryOrdemServicoMObraProgTOTALHOMEMHORA: TBCDField;
    qryOrdemServicoMObraProgQTDEHENORMAL: TBCDField;
    qryOrdemServicoMObraProgQTDEHEFERIADO: TBCDField;
    qryOrdemServicoMObraProgESPECIALISTA: TStringField;
    qryOrdemServicoMObraProgCODCALENDARIO: TStringField;
    qryOrdemServicoMObraProgCALENDARIO: TStringField;
    dsOrdemServicoTercFora: TDataSource;
    dsOrdemServicoTercForaOI: TDataSource;
    dsOrdemServicoTercForaOC: TDataSource;
    dsOrdemServicoTercForaOE: TDataSource;
    dsOrdemServicoTercForaAditivos: TDataSource;
    qryOrdemServicoTercUnid: TFDQuery;
    qryOrdemServicoTercUnidCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidMATRICULA: TStringField;
    qryOrdemServicoTercUnidCODCENTROCUSTO: TStringField;
    qryOrdemServicoTercUnidDESCRICAO: TStringField;
    qryOrdemServicoTercUnidCONTRATO: TStringField;
    qryOrdemServicoTercUnidDATACONTRATOINI: TDateTimeField;
    qryOrdemServicoTercUnidDATACONTRATOFIN: TDateTimeField;
    qryOrdemServicoTercUnidDATAINICIOSERV: TDateTimeField;
    qryOrdemServicoTercUnidDATAFIMSERV: TDateTimeField;
    qryOrdemServicoTercUnidVALORCONTRATO: TBCDField;
    qryOrdemServicoTercUnidVALORFINAL: TBCDField;
    qryOrdemServicoTercUnidNUMPARCELAS: TIntegerField;
    qryOrdemServicoTercUnidRECURSOS: TStringField;
    qryOrdemServicoTercUnidMATERIAL: TStringField;
    qryOrdemServicoTercUnidEMPREITADA: TStringField;
    qryOrdemServicoTercUnidSITUACAO: TStringField;
    qryOrdemServicoTercUnidDATAFECHAMENTO: TDateTimeField;
    qryOrdemServicoTercUnidDATACADASTRO: TDateTimeField;
    qryOrdemServicoTercUnidCODUSUARIOCAD: TStringField;
    qryOrdemServicoTercUnidDATAULTALT: TDateTimeField;
    qryOrdemServicoTercUnidCODUSUARIOALT: TStringField;
    qryOrdemServicoTercUnidOBSERVACOES: TBlobField;
    qryOrdemServicoTercUnidFUNCIONARIO: TStringField;
    qryOrdemServicoTercUnidCENTROCUSTO: TStringField;
    qryOrdemServicoTercUnidUSUARIOCAD: TStringField;
    qryOrdemServicoTercUnidUSUARIOALT: TStringField;
    qryOrdemServicoTercUnidTarefas: TFDQuery;
    qryOrdemServicoTercUnidTarefasCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidTarefasCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidTarefasCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidTarefasCODCALENDARIO: TStringField;
    qryOrdemServicoTercUnidTarefasDESCRICAO: TStringField;
    qryOrdemServicoTercUnidTarefasTEMPOPREVISTO: TBCDField;
    qryOrdemServicoTercUnidTarefasDATAPROGINI: TDateTimeField;
    qryOrdemServicoTercUnidTarefasDATAPROGFIN: TDateTimeField;
    qryOrdemServicoTercUnidTarefasPREDECESSORA: TStringField;
    qryOrdemServicoTercUnidTarefasCALENDARIO: TStringField;
    qryOrdemServicoTercUnidTarefasPred: TFDQuery;
    qryOrdemServicoTercUnidTarefasPredCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidTarefasPredCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidTarefasPredCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidTarefasPredCODANTECESSORA: TIntegerField;
    qryOrdemServicoTercUnidTarefasPredCODTAREFA: TIntegerField;
    qryOrdemServicoTercUnidTarefasPredTAREFA: TStringField;
    qryOrdemServicoTercUnidTarefasPredDATAPROGINI: TDateTimeField;
    qryOrdemServicoTercUnidTarefasPredDATAPROGFIN: TDateTimeField;
    qryOrdemServicoTercUnidMedicoes: TFDQuery;
    qryOrdemServicoTercUnidMedicoesCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidMedicoesCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidMedicoesCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidMedicoesDATAMEDICAO: TDateTimeField;
    qryOrdemServicoTercUnidMedicoesLIBERADO: TStringField;
    qryOrdemServicoTercUnidMedicoesPARCELA: TIntegerField;
    qryOrdemServicoTercUnidGrafTarefas: TFDQuery;
    qryOrdemServicoTercUnidGrafTarefasCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidGrafTarefasCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidGrafTarefasCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidGrafTarefasCODCALENDARIO: TStringField;
    qryOrdemServicoTercUnidGrafTarefasDESCRICAO: TStringField;
    qryOrdemServicoTercUnidGrafTarefasTEMPOPREVISTO: TBCDField;
    qryOrdemServicoTercUnidGrafTarefasDATAPROGINI: TDateTimeField;
    qryOrdemServicoTercUnidGrafTarefasDATAPROGFIN: TDateTimeField;
    qryOrdemServicoTercUnidGrafTarefasPREDECESSORA: TStringField;
    qryOrdemServicoTercUnidGrafTarefasCALENDARIO: TStringField;
    qryOrdemServicoTercUnidAditivos: TFDQuery;
    qryOrdemServicoTercUnidAditivosCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidAditivosCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidAditivosCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidAditivosNOVADATAFIN: TDateTimeField;
    qryOrdemServicoTercUnidAditivosNOVOVALOR: TBCDField;
    qryOrdemServicoTercUnidAditivosNOVONUMPARCELAS: TIntegerField;
    qryOrdemServicoTercUnidAditivosMOTIVO: TBlobField;
    qryOrdemServicoTercUnidMateriais: TFDQuery;
    qryOrdemServicoTercUnidMateriaisCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidMateriaisCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidMateriaisCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidMateriaisDESCRICAO: TStringField;
    qryOrdemServicoTercUnidMateriaisQUANTIDADE: TIntegerField;
    qryOrdemServicoTercUnidMateriaisPRECO: TBCDField;
    qryOrdemServicoTercUnidRecurso: TFDQuery;
    qryOrdemServicoTercUnidRecursoCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidRecursoCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidRecursoCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidRecursoCODRECURSO: TStringField;
    qryOrdemServicoTercUnidRecursoQUANTIDADE: TIntegerField;
    qryOrdemServicoTercUnidRecursoRECURSO: TStringField;
    qryOrdemServicoTercUnidPecas: TFDQuery;
    qryOrdemServicoTercUnidPecasCODIGO: TFDAutoIncField;
    qryOrdemServicoTercUnidPecasCODEMPRESA: TStringField;
    qryOrdemServicoTercUnidPecasCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoTercUnidPecasCODPECAREP: TStringField;
    qryOrdemServicoTercUnidPecasQUANTIDADE: TIntegerField;
    qryOrdemServicoTercUnidPecasPECAREPOSICAO: TStringField;
    qryOrdemServicoTercUnidPecasREFERENCIA: TStringField;
    qryPecasReposicao: TFDQuery;
    qryPecasReposicaoDados: TFDQuery;
    qryPecasReposicaoHistPecas: TFDQuery;
    qryPecasReposicaoHistPecasREFERENCIA: TStringField;
    qryPecasReposicaoHistPecasPECA: TStringField;
    qryPecasReposicaoHistPecasCODORDEMSERVICO: TIntegerField;
    qryPecasReposicaoHistPecasOS: TStringField;
    qryPecasReposicaoHistPecasQTDESOLIC: TIntegerField;
    qryPecasReposicaoHistPecasENTRADA: TDateTimeField;
    qryPecasReposicaoHistPecasCODEQUIPAMENTO: TStringField;
    qryPecasReposicaoHistPecasDESCEQUIPAMENTO: TStringField;
    qryPecasReposicaoHistEquip: TFDQuery;
    qryPecasReposicaoHistEquipREFERENCIA: TStringField;
    qryPecasReposicaoHistEquipPECA: TStringField;
    qryPecasReposicaoHistEquipCODORDEMSERVICO: TIntegerField;
    qryPecasReposicaoHistEquipOS: TStringField;
    qryPecasReposicaoHistEquipQTDESOLIC: TIntegerField;
    qryPecasReposicaoHistEquipENTRADA: TDateTimeField;
    qryPecasReposicaoHistEquipCODEQUIPAMENTO: TStringField;
    qryPecasReposicaoHistEquipDESCEQUIPAMENTO: TStringField;
    qryPecasReposicaoInstPecas: TFDQuery;
    qryPecasReposicaoInstPecasCODIGO: TStringField;
    qryPecasReposicaoInstPecasREFERENCIA: TStringField;
    qryPecasReposicaoInstPecasPECA: TStringField;
    qryPecasReposicaoInstPecasQUANTIDADE: TIntegerField;
    qryPecasReposicaoInstPecasCODEQUIPAMENTO: TStringField;
    qryPecasReposicaoInstPecasEQUIPAMENTO: TStringField;
    qryPecasReposicaoInstPecasLOCALIZACAO: TStringField;
    qryPecasReposicaoInstEquip: TFDQuery;
    qryPecasReposicaoInstEquipCODIGO: TStringField;
    qryPecasReposicaoInstEquipREFERENCIA: TStringField;
    qryPecasReposicaoInstEquipPECA: TStringField;
    qryPecasReposicaoInstEquipQUANTIDADE: TIntegerField;
    qryPecasReposicaoInstEquipEQUIPAMENTO: TStringField;
    qryPecasReposicaoInstEquipLOCALIZACAO: TStringField;
    qryPlanoTrabalhoAut: TFDQuery;
    qryPlanoTrabalhoAutCODIGO: TStringField;
    qryPlanoTrabalhoAutCODEMPRESA: TStringField;
    qryPlanoTrabalhoAutDESCRICAO: TStringField;
    qryPlanoTrabalhoAutDETALHES: TBlobField;
    qryPneusDados: TFDQuery;
    qryPneusIDs: TFDQuery;
    qryPneusIDsID: TIntegerField;
    qryPneusIDsRODADOS: TIntegerField;
    qryPneusIDsINSTALADO: TDateTimeField;
    qryPneusIDsCODEQUIPAMENTO: TStringField;
    qryPneusIDsDESCEQUIPAMENTO: TStringField;
    qryPneusIDsSTATUS: TStringField;
    qryPneusIDsCODEMPRESA: TStringField;
    qryPneusIDsCODPNEU: TStringField;
    qryRecursoKit: TFDQuery;
    qryRecursoKitCODIGO: TStringField;
    qryRecursoKitCODEMPRESA: TStringField;
    qryRecursoKitDESCRICAO: TStringField;
    qryRecursoKitQUANTIDADE: TIntegerField;
    qryRecursoKitQTDERESERV: TIntegerField;
    qryRecursoKitDATACADASTRO: TDateTimeField;
    qryRecursoKitCODUSUARIOCAD: TStringField;
    qryRecursoKitDATAULTALT: TDateTimeField;
    qryRecursoKitCODUSUARIOALT: TStringField;
    qryRecursoKitUSUARIOCAD: TStringField;
    qryRecursoKitUSUARIOALT: TStringField;
    qryRecursoKitItens: TFDQuery;
    qryRecursoKitItensCODIGO: TFDAutoIncField;
    qryRecursoKitItensCODEMPRESA: TStringField;
    qryRecursoKitItensCODKIT: TStringField;
    qryRecursoKitItensCODRECURSO: TStringField;
    qryRecursoKitItensQUANTIDADE: TIntegerField;
    qryRecursoKitItensDESCRICAO: TStringField;
    qryRecursos: TFDQuery;
    qryRecursosDados: TFDQuery;
    qryPontosInspecao: TFDQuery;
    qryPontosInspecaoCODIGO: TStringField;
    qryPontosInspecaoCODEMPRESA: TStringField;
    qryPontosInspecaoDESCRICAO: TStringField;
    qryPontosInspecaoCODFAMILIAEQUIP: TStringField;
    qryPontosInspecaoDATACADASTRO: TDateTimeField;
    qryPontosInspecaoCODUSUARIOCAD: TStringField;
    qryPontosInspecaoDATAULTALT: TDateTimeField;
    qryPontosInspecaoCODUSUARIOALT: TStringField;
    qryPontosInspecaoFAMILIAEQUIP: TStringField;
    qryPontosInspecaoUSUARIOCAD: TStringField;
    qryPontosInspecaoUSUARIOALT: TStringField;
    qryPontosInspecaoLoc: TFDQuery;
    qryContadores: TFDQuery;
    qryContadoresCODIGO: TStringField;
    qryContadoresCODEMPRESA: TStringField;
    qryContadoresDESCRICAO: TStringField;
    qryContadoresCODPROGRAMACAO: TStringField;
    qryContadoresDATACADASTRO: TDateTimeField;
    qryContadoresCODUSUARIOCAD: TStringField;
    qryContadoresDATAULTALT: TDateTimeField;
    qryContadoresCODUSUARIOALT: TStringField;
    qryContadoresPROGRAMACAO: TStringField;
    qryContadoresUSUARIOCAD: TStringField;
    qryContadoresUSUARIOALT: TStringField;
    dsOrdemServicoTercUnid: TDataSource;
    dsOrdemServicoTercUnidTarefas: TDataSource;
    dsOrdemServicoTercUnidTarefasPred: TDataSource;
    dsOrdemServicoTercUnidMedicoes: TDataSource;
    dsOrdemServicoTercUnidGrafTarefas: TDataSource;
    dsOrdemServicoTercUnidAditivos: TDataSource;
    dsOrdemServicoTercUnidMateriais: TDataSource;
    dsOrdemServicoTercUnidRecurso: TDataSource;
    dsOrdemServicoTercUnidPecas: TDataSource;
    dsParadasDiariasEquip: TDataSource;
    dsParadasDiariasEquipParadas: TDataSource;
    dsPecaReposicaoKit: TDataSource;
    dsPecaReposicaoKitItens: TDataSource;
    dsPecasReposicao: TDataSource;
    dsPecasReposicaoDados: TDataSource;
    dsPecasReposicaoHistPecas: TDataSource;
    dsPecasReposicaoHistEquip: TDataSource;
    dsPecasReposicaoInstPecas: TDataSource;
    dsPecasReposicaoInstEquip: TDataSource;
    dsPermissoesAcesso: TDataSource;
    dsPermissoesAlteracao: TDataSource;
    dsPermissoesExclusao: TDataSource;
    dsPermissoesInclusao: TDataSource;
    dsPlanoTrabalho: TDataSource;
    dsPlanoTrabalhoAut: TDataSource;
    dsPneus: TDataSource;
    dsPneusDados: TDataSource;
    dsPneusIDs: TDataSource;
    dsPneusChassi: TDataSource;
    dsPneusChassiImagens: TDataSource;
    dsPneusChassiPosicoes: TDataSource;
    dsPneusChassiPneus: TDataSource;
    dsPneusChassiHistorico: TDataSource;
    dsPneusChassiAtrelamento: TDataSource;
    dsPneusChassiAtrelamentoHist: TDataSource;
    dsPneusChassiPneusHist: TDataSource;
    dsPontosInspecao: TDataSource;
    dsPontosInspecaoLoc: TDataSource;
    dsContadores: TDataSource;
    dsRecursoKit: TDataSource;
    dsRecursoKitItens: TDataSource;
    dsRecursos: TDataSource;
    dsRecursosDados: TDataSource;
    qryRelatGerencOS: TFDQuery;
    qryRelatGerencOSCODIGO: TFDAutoIncField;
    qryRelatGerencOSCODEMPRESA: TStringField;
    qryRelatGerencOSDESCRICAO: TStringField;
    qryRelatGerencOSCODEQUIPAMENTO: TStringField;
    qryRelatGerencOSDATAINICIOREAL: TDateTimeField;
    qryRelatGerencOSDATAFIMREAL: TDateTimeField;
    qryRelatGerencOSDATAFECHAMENTO: TDateTimeField;
    qryRelatGerencOSTEMPOEXECUTADO: TBCDField;
    qryRelatGerencOSTEMPOHOMEMHORAEXEC: TBCDField;
    qryRelatGerencOSCUSTOMOBRA: TBCDField;
    qryRelatGerencOSCUSTORECURSOS: TBCDField;
    qryRelatGerencOSCUSTOPECAS: TBCDField;
    qryRelatGerencOSCUSTOEXTRA: TBCDField;
    qryRelatGerencOSCUSTOSECUNDARIOS: TBCDField;
    qryRelatGerencOSEQUIPAMENTO: TStringField;
    qryRelatGerencOSCODAREA: TStringField;
    qryRelatGerencOSAREA: TStringField;
    qryRelatGerencOSDESCFAMILIAEQUIP: TStringField;
    qryRelatGerencOSCODFAMILIAEQUIP: TStringField;
    qryRelatGerencOSCODMANUTENCAO: TStringField;
    qryRelatGerencOSMANUTENCAO: TStringField;
    qryRelatGerencOSCODMOTIVOPARADA: TStringField;
    qryRelatGerencOSMOTIVOPARADA: TStringField;
    qryRelatGerencOSCODFALHA: TStringField;
    qryRelatGerencOSFALHA: TStringField;
    qryRelatGerencOSCODCENTROCUSTO: TStringField;
    qryRelatGerencOSCENTROCUSTO: TStringField;
    qryRelatGerencOSCODOFICINA: TStringField;
    qryRelatGerencOSOFICINA: TStringField;
    qryRelatGerencOSPRIORIDADEPARADA: TStringField;
    qryRelatGerencOSMATRICULA: TStringField;
    qryRelatGerencOSFUNCIONARIO: TStringField;
    qryRelatGerencProdMObra: TFDQuery;
    qryRelatGerencProdMObraTOTALHHPREV: TFMTBCDField;
    qryRelatGerencProdMObraPROD: TFMTBCDField;
    qryRelatGerencCustoPrev: TFDQuery;
    qryRelatGerencCustoPrevCUSTOTOTALEXEC: TFMTBCDField;
    qryRelatGerencCustoPrevMOBRAPREV: TFMTBCDField;
    qryRelatGerencCustoPrevPECASPREV: TFMTBCDField;
    qryRelatGerencCustoPrevRECUPREV: TFMTBCDField;
    qryRelatGerencDispEquip: TFDQuery;
    qryRelatGerencDispEquipCODIGO: TStringField;
    qryRelatGerencDispEquipDESCRICAO: TStringField;
    qryRelatGerencDispEquipHORASPARADASABERTAS: TFMTBCDField;
    qryRelatGerencDispEquipHORASPARADASFECHADAS: TFMTBCDField;
    qryRelatGerencDespEquip: TFDQuery;
    qryRelatGerencDespEquipCODIGO: TStringField;
    qryRelatGerencDespEquipDESCRICAO: TStringField;
    qryRelatGerencDespEquipCODAREA: TStringField;
    qryRelatGerencDespEquipCODFAMILIAEQUIP: TStringField;
    qryRelatGerencDespEquipDESCFAMILIAEQUIP: TStringField;
    qryRelatGerencDespEquipDESCAREA: TStringField;
    qryRelatGerencDespEquipCUSTOMOBRA: TFMTBCDField;
    qryRelatGerencDespEquipCUSTORECURSOS: TFMTBCDField;
    qryRelatGerencDespEquipCUSTOPECAS: TFMTBCDField;
    qryRelatGerencDespEquipCUSTOEXTRAS: TFMTBCDField;
    qryRelatGerencDespEquipCUSTOSECUNDARIOS: TFMTBCDField;
    qryRelatGerencNumParadas: TFDQuery;
    qryRelatGerencNumParadasTIPOMANUTENCAO: TStringField;
    qryRelatGerencNumParadasTOTALOS: TLargeintField;
    qryRelatGerencPercParadas: TFDQuery;
    qryRelatGerencPercParadasTOTALOS: TLargeintField;
    qryRelatGerencPercParadasPERCENTCORRET: TFMTBCDField;
    qryRelatGerencPercParadasPERCENTPREV: TFMTBCDField;
    qryRelatGerencPercParadasPERCENTPRED: TFMTBCDField;
    qryRelatGerencPercParadasPERCENTOUTROS: TFMTBCDField;
    qryRelatGerencHorasParadas: TFDQuery;
    qryRelatGerencHorasParadasCODIGO: TFDAutoIncField;
    qryRelatGerencHorasParadasCODEQUIPAMENTO: TStringField;
    qryRelatGerencHorasParadasTIPOMANUTENCAO: TStringField;
    qryRelatGerencHorasParadasCODAREA: TStringField;
    qryRelatGerencHorasParadasDATAINICIOREAL: TDateTimeField;
    qryRelatGerencHorasParadasDATAFIMREAL: TDateTimeField;
    qryRelatGerencHorasParadasDATAFECHAMENTO: TDateTimeField;
    qryRelatGerencHorasParadasHORASPARADAS: TFMTBCDField;
    qryRelatGerencCustos: TFDQuery;
    qryRelatGerencCustosCUSTOMOBRA: TBCDField;
    qryRelatGerencCustosCUSTORECURSOS: TBCDField;
    qryRelatGerencCustosCUSTOPECAS: TBCDField;
    qryRelatGerencCustosCUSTOEXTRA: TBCDField;
    qryRelatGerencCustosCUSTOSECUNDARIOS: TBCDField;
    qryRelatGerencCustosCODEQUIPAMENTO: TStringField;
    qryRelatGerencCustosCODAREA: TStringField;
    qryRelatGerencCustosCODCELULA: TStringField;
    qryRelatGerencCustosCODLINHA: TStringField;
    qryRelatGerencCustosSEQUENCIA: TIntegerField;
    qryRelatGerencCustosCODMANUTENCAO: TStringField;
    qryRelatGerencCustosPRIORIDADEPARADA: TStringField;
    qryRelatGerencCustosCODOFICINA: TStringField;
    qryRelatGerencCustosCODCENTROCUSTO: TStringField;
    qryRelatGerencHE: TFDQuery;
    qryRelatGerencHETOTALHE: TFMTBCDField;
    qrySolicitacaoTrab: TFDQuery;
    qryCalendarioOSProgramadas: TFDQuery;
    qryTotalFamilias: TFDQuery;
    qryTotalFamiliasTOTAL1: TLargeintField;
    qryTotalFamiliasTOTAL2: TLargeintField;
    qryTotalFamiliasTOTAL3: TLargeintField;
    qryTotalFamiliasTOTAL4: TLargeintField;
    dsRelatGerencOS: TDataSource;
    dsRelatGerencProdMObra: TDataSource;
    dsRelatGerencCustoPrev: TDataSource;
    dsRelatGerencDispEquip: TDataSource;
    dsRelatGerencDespEquip: TDataSource;
    dsRelatGerencNumParadas: TDataSource;
    dsRelatGerencPercParadas: TDataSource;
    dsRelatGerencHorasParadas: TDataSource;
    dsRelatGerencCustos: TDataSource;
    dsRelatGerencHE: TDataSource;
    dsRotaEquipVenc: TDataSource;
    dsRotaEquipVencSeq: TDataSource;
    dsRotaEquipVencSeqManut: TDataSource;
    dsRotaPeriodicas: TDataSource;
    dsRotaPeriodicasManut: TDataSource;
    dsRotaPeriodicasManutItens: TDataSource;
    dsRotaPeriodicasManutItensEsp: TDataSource;
    dsRotas: TDataSource;
    dsRotasSequencia: TDataSource;
    dsRotasSequenciaInsp: TDataSource;
    dsRotasSequenciaInspItens: TDataSource;
    dsRotasSequenciaInspItensEsp: TDataSource;
    dsSequencia: TDataSource;
    dsSolicitacaoTrab: TDataSource;
    dsCalendarioOSProgramadas: TDataSource;
    dsTipoManutencao: TDataSource;
    dsTipoProgramacao: TDataSource;
    dsTotalHomemHora: TDataSource;
    dsTotalHomemHoraSeqHora: TDataSource;
    dsTotalHomemHoraProgExec: TDataSource;
    dsTotalEquipHora: TDataSource;
    dsTotalEquipHoraSeqHora: TDataSource;
    dsTotalTabelas: TDataSource;
    dsTotalFamilias: TDataSource;
    dsViagens: TDataSource;
    dsViagensCombust: TDataSource;
    dsViagensCombustAbast: TDataSource;
    dsViagensLubrific: TDataSource;
    dsViagensLubrificAbast: TDataSource;
    dsUsuario: TDataSource;
    dsUsuarioPAcesso: TDataSource;
    dsUsuarioPAlteracao: TDataSource;
    dsUsuarioPExclusao: TDataSource;
    dsUsuarioPInclusao: TDataSource;
    dsUsuarios: TDataSource;
    dsUsuarioAcessos: TDataSource;
    dsUsuariosAtivos: TDataSource;
    dsUsuarioUnidades: TDataSource;
    dsUnidadesCorp: TDataSource;
    qryUsuarios: TFDQuery;
    qryUsuariosCODIGO: TStringField;
    qryUsuariosCODEMPRESA: TStringField;
    qryUsuariosCODGRUPO: TIntegerField;
    qryUsuariosCODEMPRESAS: TFDAutoIncField;
    qryUsuariosMATRICULA: TStringField;
    qryUsuariosNOME: TStringField;
    qryUsuariosSENHA: TStringField;
    qryUsuariosLOGADO: TStringField;
    qryUsuariosQUEDAENERGIA: TStringField;
    qryUsuariosTEMPORARIO: TStringField;
    qryUsuariosDATAFIM: TDateTimeField;
    qryUsuariosCODNIVELACESSO: TStringField;
    qryUsuariosCODPERMISSAOACESSO: TIntegerField;
    qryUsuariosCODPERMISSAOINCLUSAO: TIntegerField;
    qryUsuariosCODPERMISSAOALTERACAO: TIntegerField;
    qryUsuariosCODPERMISSAOEXCLUSAO: TIntegerField;
    qryUsuariosSENHAALTERADA: TStringField;
    qryUsuariosBLOQUEIO: TSmallintField;
    qryUsuariosDATACADASTRO: TDateField;
    qryUsuariosCODUSUARIOCAD: TStringField;
    qryUsuariosDATAULTALT: TDateField;
    qryUsuariosCODUSUARIOALT: TStringField;
    qryUsuariosUSUARIOCAD: TStringField;
    qryUsuariosUSUARIOALT: TStringField;
    qryUsuariosFUNCIONARIO: TStringField;
    qryUsuariosNIVELACESSO: TStringField;
    qryUsuarioAcessos: TFDQuery;
    qryUsuarioAcessosCODIGO: TFDAutoIncField;
    qryUsuarioAcessosCODEMPRESA: TStringField;
    qryUsuarioAcessosUSUARIO: TStringField;
    qryUsuarioAcessosMODULO: TStringField;
    qryUsuarioAcessosDATAACESSO: TDateTimeField;
    qryUsuarioAcessosDATASAIDA: TDateTimeField;
    qryUsuarioAcessosESTACAO: TStringField;
    qryUsuariosAtivos: TFDQuery;
    qryUsuarioUnidades: TFDQuery;
    qryUsuarioUnidadesCODIGO: TFDAutoIncField;
    qryUsuarioUnidadesCODEMPRESAS: TIntegerField;
    qryUsuarioUnidadesCODNIVELACESSO: TStringField;
    qryUsuarioUnidadesCODEMPRESA: TStringField;
    qryUsuarioUnidadesEMPRESA: TStringField;
    qryUsuarioUnidadesTRANSFORMACAO: TStringField;
    qryUsuarioUnidadesCODGRUPO: TIntegerField;
    qryUsuarioUnidadesGRUPO: TStringField;
    qryUnidadesCorp: TFDQuery;
    qryUnidadesCorpCODEMPRESA: TStringField;
    qryUnidadesCorpEMPRESA: TStringField;
    qryUnidadesCorpTRANSFORMACAO: TStringField;
    qryUnidadesCorpCODGRUPO: TIntegerField;
    qryUnidadesCorpGRUPO: TStringField;
    dsAuxiliar: TDataSource;
    qryMonitoramentoPlanoTrab: TFDQuery;
    dsMonitoramentoPlanoTrab: TDataSource;
    qryMonitoramentoPlanoTrabCODIGO: TStringField;
    qryMonitoramentoPlanoTrabCODEMPRESA: TStringField;
    qryMonitoramentoPlanoTrabCODFAMILIAEQUIP: TStringField;
    qryMonitoramentoPlanoTrabDESCRICAO: TStringField;
    qryMonitoramentoPlanoTrabATIVO: TStringField;
    qryMonitoramentoPlanoTrabVISIVEL: TStringField;
    qryMonitoramentoPlanoTrabAUTOMATICO: TStringField;
    qryMonitoramentoPlanoTrabDATACADASTRO: TDateTimeField;
    qryMonitoramentoPlanoTrabCODUSUARIOCAD: TStringField;
    qryMonitoramentoPlanoTrabDATAULTALT: TDateTimeField;
    qryMonitoramentoPlanoTrabCODUSUARIOALT: TStringField;
    qryMonitoramentoPlanoTrabDETALHES: TBlobField;
    qryMonitoramentoPlanoTrabOBSERVACOES: TBlobField;
    qryMonitoramentoPlanoTrabUSUARIOCAD: TStringField;
    qryMonitoramentoPlanoTrabUSUARIOALT: TStringField;
    qryManutProgEquipPlanoTrab: TFDQuery;
    dsManutProgEquipPlanoTrab: TDataSource;
    qryManutProgEquipCODORDEMSERVICO: TIntegerField;
    qryManutProgEquipC_PROXINSP: TDateTimeField;
    qryLubrificProgEquipCODORDEMSERVICO: TIntegerField;
    qryLubrificProgEquipC_PROXINSP: TDateTimeField;
    qryLubrificProgEquipPlanoTrab: TFDQuery;
    dsLubrificProgEquipPlanoTrab: TDataSource;
    qryManutVencC_DIASATRASO: TIntegerField;
    qryLubrificVencC_DIASATRASO: TIntegerField;
    qryPneusDadosCODIGO: TFDAutoIncField;
    qryPneusDadosCODEMPRESA: TStringField;
    qryPneusDadosCODFAMILIAPNEUS: TStringField;
    qryPneusDadosCODPNEU: TStringField;
    qryPneusDadosREGISTRO1: TStringField;
    qryPneusDadosREGISTRO2: TStringField;
    qryPneusDadosREGISTRO3: TStringField;
    qryPneusDadosREGISTRO4: TStringField;
    qryPneusDadosREGISTRO5: TStringField;
    qryPneusDadosREGISTRO6: TStringField;
    qryPneusDadosREGISTRO7: TStringField;
    qryPneusDadosREGISTRO8: TStringField;
    qryPneusDadosREGISTRO9: TStringField;
    qryPneusDadosREGISTRO10: TStringField;
    qryPneusDadosREGISTRO11: TStringField;
    qryPneusDadosREGISTRO12: TStringField;
    qryPneusDadosINFORMACOES: TBlobField;
    qryManutVencCODIGO: TStringField;
    qryManutVencCODEQUIPAMENTO: TStringField;
    qryManutVencDESCRICAO: TStringField;
    qryManutVencFREQUENCIA1: TSmallintField;
    qryManutVencDTAINICIO1: TDateTimeField;
    qryManutVencEQUIPAMENTO: TStringField;
    qryManutVencCODFAMILIAEQUIP: TStringField;
    qryLubrificVencCODIGO: TStringField;
    qryLubrificVencCODEQUIPAMENTO: TStringField;
    qryLubrificVencDESCRICAO: TStringField;
    qryLubrificVencFREQUENCIA1: TSmallintField;
    qryLubrificVencDTAINICIO1: TDateTimeField;
    qryLubrificVencEQUIPAMENTO: TStringField;
    qryLubrificVencCODFAMILIAEQUIP: TStringField;
    qryAcessoCODIGO: TFDAutoIncField;
    qryAcessoCODEMPRESA: TStringField;
    qryAcessoUSUARIO: TStringField;
    qryAcessoDATAACESSO: TDateTimeField;
    qryAcessoDATASAIDA: TDateTimeField;
    qryAcessoESTACAO: TStringField;
    qryAcessoATIVO: TStringField;
    qryAcessoPERIODO: TIntegerField;
    ImageListBotoes: TImageList;
    ApplicationEventsSPMP: TApplicationEvents;
    qryCalendMObraCODIGO: TStringField;
    qryCalendMObraCODEMPRESA: TStringField;
    qryCalendMObraDESCRICAO: TStringField;
    qryCalendMObraATIVO: TStringField;
    qryCalendMObraVISIVEL: TStringField;
    qryCalendMObraMAXHORAUTIL: TIntegerField;
    qryCalendMObraHENORMAL: TIntegerField;
    qryCalendMObraHEFERIADO: TIntegerField;
    qryCalendMObraHOFICIAIS: TIntegerField;
    qryCalendMObraHREAIS: TIntegerField;
    qryCalendMObraDATACADASTRO: TDateTimeField;
    qryCalendMObraCODUSUARIOCAD: TStringField;
    qryCalendMObraDATAULTALT: TDateTimeField;
    qryCalendMObraCODUSUARIOALT: TStringField;
    qryCalendMObraUSUARIOCAD: TStringField;
    qryCalendMObraUSUARIOALT: TStringField;
    qryCalendMObraSeqHoraCODIGO: TFDAutoIncField;
    qryCalendMObraSeqHoraCODEMPRESA: TStringField;
    qryCalendMObraSeqHoraCODCALENDARIO: TStringField;
    qryCalendMObraSeqHoraSEQUENCIA: TIntegerField;
    qryCalendMObraSeqHoraDATA: TDateTimeField;
    qryCalendMObraSeqHoraHORAINI1: TDateTimeField;
    qryCalendMObraSeqHoraHORAFIN1: TDateTimeField;
    qryCalendMObraSeqHoraHORAINI2: TDateTimeField;
    qryCalendMObraSeqHoraHORAFIN2: TDateTimeField;
    qryCalendMObraSeqHoraHORAINI3: TDateTimeField;
    qryCalendMObraSeqHoraHORAFIN3: TDateTimeField;
    qryCalendMObraSeqHoraHORAINI4: TDateTimeField;
    qryCalendMObraSeqHoraHORAFIN4: TDateTimeField;
    qryImagensCODIGO: TFDAutoIncField;
    qryImagensCODEMPRESA: TStringField;
    qryImagensTIPO: TStringField;
    qryImagensCODEQUIPAMENTO: TStringField;
    qryImagensCODITEMSECUNDARIO: TStringField;
    qryImagensDESCRICAO: TStringField;
    qryImagensPONTO: TStringField;
    qryImagensDATACADASTRO: TDateTimeField;
    qryImagensCODUSUARIOCAD: TStringField;
    qryImagensDATAULTALT: TDateTimeField;
    qryImagensCODUSUARIOALT: TStringField;
    qryImagensTIPOFOTO: TStringField;
    qryImagensFOTO: TBlobField;
    qryImagensOBSERVACOES: TBlobField;
    qryImagensEQUIPAMENTO: TStringField;
    qryImagensUSUARIOCAD: TStringField;
    qryImagensUSUARIOALT: TStringField;
    qryEquipamentosDadosCODIGO: TFDAutoIncField;
    qryEquipamentosDadosCODEMPRESA: TStringField;
    qryEquipamentosDadosCODFAMILIAEQUIP: TStringField;
    qryEquipamentosDadosCODEQUIPAMENTO: TStringField;
    qryEquipamentosDadosREGISTRO1: TStringField;
    qryEquipamentosDadosREGISTRO2: TStringField;
    qryEquipamentosDadosREGISTRO3: TStringField;
    qryEquipamentosDadosREGISTRO4: TStringField;
    qryEquipamentosDadosREGISTRO5: TStringField;
    qryEquipamentosDadosREGISTRO6: TStringField;
    qryEquipamentosDadosREGISTRO7: TStringField;
    qryEquipamentosDadosREGISTRO8: TStringField;
    qryEquipamentosDadosREGISTRO9: TStringField;
    qryEquipamentosDadosREGISTRO10: TStringField;
    qryEquipamentosDadosREGISTRO11: TStringField;
    qryEquipamentosDadosREGISTRO12: TStringField;
    qryEquipamentosDadosINFORMACOES: TBlobField;
    qryManutProgEquipPartes: TFDQuery;
    dsManutProgEquipPartes: TDataSource;
    qryManutProgEquipPartesCODIGO: TFDAutoIncField;
    qryManutProgEquipPartesCODEMPRESA: TStringField;
    qryManutProgEquipPartesDESCRICAO: TStringField;
    qryManutProgEquipPartesCODMANUTPROGFAMEQUIP: TStringField;
    qryManutProgEquipPartesCODFAMILIAEQUIP: TStringField;
    qryLubrificProgEquipPartes: TFDQuery;
    dsLubrificProgEquipPartes: TDataSource;
    qryLubrificProgEquipPartesCODIGO: TFDAutoIncField;
    qryLubrificProgEquipPartesCODEMPRESA: TStringField;
    qryLubrificProgEquipPartesDESCRICAO: TStringField;
    qryLubrificProgEquipPartesCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgEquipPartesCODFAMILIAEQUIP: TStringField;
    qryEquipamentosPontosInspCODIGO: TFDAutoIncField;
    qryEquipamentosPontosInspCODEMPRESA: TStringField;
    qryEquipamentosPontosInspCODEQUIPAMENTO: TStringField;
    qryEquipamentosPontosInspCODPONTOINSPECAO: TStringField;
    qryEquipamentosPontosInspEQUIPAMENTO: TStringField;
    qryEquipamentosPontosInspPONTOINSPECAO: TStringField;
    qryManutConsCODORDEMSERVICO: TIntegerField;
    qryLubrificConsCODORDEMSERVICO: TIntegerField;
    qryManutPeriodicasHistPERIODOCONSULTA: TStringField;
    qryMonitMedicoesPtosInspCODIGO: TFDAutoIncField;
    qryMonitMedicoesPtosInspCODEMPRESA: TStringField;
    qryMonitMedicoesPtosInspCODEQUIPAMENTO: TStringField;
    qryMonitMedicoesPtosInspCODMONITORAMENTO: TIntegerField;
    qryMonitMedicoesPtosInspMATRICULA: TStringField;
    qryMonitMedicoesPtosInspDATAMEDICAO: TDateTimeField;
    qryMonitMedicoesPtosInspMEDICAO: TBCDField;
    qryMonitMedicoesPtosInspOSGERADA: TFloatField;
    qryMonitMedicoesPtosInspPONTOINSP: TStringField;
    qryMonitMedicoesPtosInspPONTOINSPLOC: TStringField;
    qryMonitMedicoesPtosInspEMISSAOOS: TStringField;
    qryMonitMedicoesPtosInspUNIDMEDIDA: TStringField;
    qryMonitMedicoesPtosInspLIMINFSEG: TBCDField;
    qryMonitMedicoesPtosInspLIMINFMAX: TBCDField;
    qryMonitMedicoesPtosInspLIMSUPSEG: TBCDField;
    qryMonitMedicoesPtosInspLIMSUPMAX: TBCDField;
    qryMonitMedicoesPtosInspEQUIPAMENTO: TStringField;
    qryMonitMedicoesPtosInspFUNCIONARIO: TStringField;
    qryMonitMedicoesPtosInspSITUACAOOS: TStringField;
    qryMonitMedicoesPtosInspCODEQUIP: TStringField;
    qryMonitMedicoesContCODEQUIP: TStringField;
    qryMonitMedicoesPtosInspMAXDATA: TAggregateField;
    qryMonitMedicoesPtosInspMAXMEDICAO2: TAggregateField;
    qryMonitMedicoesContMAXDATA: TAggregateField;
    qryMonitMedicoesContMAXMEDICAO: TAggregateField;
    qryRecursosCUSTOHORA_CALC: TFloatField;
    qryAbastecimentosPERIODO: TStringField;
    qryLubrificConsPERIODO: TStringField;
    qryLubrificPeriodicasPERIODO: TStringField;
    qryManutPeriodicasItensEXECUTADO_CHK: TBooleanField;
    qryManutPeriodicasItensBOM_CHK: TBooleanField;
    qryManutPeriodicasItensREGULAR_CHK: TBooleanField;
    qryManutPeriodicasItensRUIM_CHK: TBooleanField;
    qryManutPeriodicasItensEspEXECUTADO_CHK: TBooleanField;
    qryManutPeriodicasItensEspBOM_CHK: TBooleanField;
    qryManutPeriodicasItensEspREGULAR_CHK: TBooleanField;
    qryManutPeriodicasItensEspRUIM_CHK: TBooleanField;
    qryLubrificPeriodicasItensEXECUTADO_CHK: TBooleanField;
    qryLubrificPeriodicasItensBOM_CHK: TBooleanField;
    qryLubrificPeriodicasItensREGULAR_CHK: TBooleanField;
    qryLubrificPeriodicasItensRUIM_CHK: TBooleanField;
    qryLubrificPeriodicasItensEspEXECUTADO_CHK: TBooleanField;
    qryLubrificPeriodicasItensEspBOM_CHK: TBooleanField;
    qryLubrificPeriodicasItensEspREGULAR_CHK: TBooleanField;
    qryLubrificPeriodicasItensEspRUIM_CHK: TBooleanField;
    qryManutConsPERIODO: TStringField;
    qryManutPeriodicasPERIODO: TStringField;
    qryOrdemServicoHistoricoPERIODO: TStringField;
    qryPneusChassiPERIODO: TStringField;
    qryRelatGerencDespEquipCALC_TOTAL: TFloatField;
    qryRelatGerencDispEquipDISP: TFloatField;
    qryRelatGerencDispEquipTOTALHORASPARADAS: TAggregateField;
    qryRelatGerencDispEquipTOTALHORASFECHADAS: TAggregateField;
    qryRotaPeriodicasManutItensEXECUTADO_CHK: TBooleanField;
    qryRotaPeriodicasManutItensBOM_CHK: TBooleanField;
    qryRotaPeriodicasManutItensREGULAR_CHK: TBooleanField;
    qryRotaPeriodicasManutItensRUIM_CHK: TBooleanField;
    qryRotaPeriodicasManutItensEspEXECUTADO_CHK: TBooleanField;
    qryRotaPeriodicasManutItensEspBOM_CHK: TBooleanField;
    qryRotaPeriodicasManutItensEspREGULAR_CHK: TBooleanField;
    qryRotaPeriodicasManutItensEspRUIM_CHK: TBooleanField;
    qryRotasC_PROXINSP: TDateTimeField;
    qryRotasC_CODORDEMSERVICO: TIntegerField;
    qryRecursosCODIGO: TStringField;
    qryRecursosCODEMPRESA: TStringField;
    qryRecursosCODLOCALIZACAO: TStringField;
    qryRecursosCODFABRICANTE: TStringField;
    qryRecursosCODFORNECEDOR: TStringField;
    qryRecursosCODCENTROCUSTO: TStringField;
    qryRecursosCODCLASSE: TStringField;
    qryRecursosCODFAMILIARECURSO: TStringField;
    qryRecursosDESCRICAO: TStringField;
    qryRecursosDATAFABRICACAO: TDateTimeField;
    qryRecursosDATAGARANTIA: TDateTimeField;
    qryRecursosDATAAQUISICAO: TDateTimeField;
    qryRecursosQUANTIDADE: TIntegerField;
    qryRecursosQTDERESERVADA: TIntegerField;
    qryRecursosPRECO: TBCDField;
    qryRecursosAMORTIZACAO: TBCDField;
    qryRecursosCUSTOHORA: TBCDField;
    qryRecursosKIT: TStringField;
    qryRecursosESTADO: TStringField;
    qryRecursosDATACADASTRO: TDateTimeField;
    qryRecursosCODUSUARIOCAD: TStringField;
    qryRecursosDATAULTALT: TDateTimeField;
    qryRecursosCODUSUARIOALT: TStringField;
    qryRecursosIMAGEM: TBlobField;
    qryRecursosOBSERVACOES: TBlobField;
    qryRecursosAREA: TStringField;
    qryRecursosFABRICANTE: TStringField;
    qryRecursosFORNECEDOR: TStringField;
    qryRecursosCENTROCUSTO: TStringField;
    qryRecursosCLASSE: TStringField;
    qryRecursosFAMILIARECURSO: TStringField;
    qryRecursosUSUARIOCAD: TStringField;
    qryRecursosUSUARIOALT: TStringField;
    qryPecasReposicaoCODIGO: TStringField;
    qryPecasReposicaoCODEMPRESA: TStringField;
    qryPecasReposicaoDESCRICAO: TStringField;
    qryPecasReposicaoCODFABRICANTE: TStringField;
    qryPecasReposicaoCODFORNECEDOR: TStringField;
    qryPecasReposicaoCODFAMILIAPECAREP: TStringField;
    qryPecasReposicaoESTOCAVEL: TStringField;
    qryPecasReposicaoLOCALESTOCAGEM: TStringField;
    qryPecasReposicaoREFERENCIA: TStringField;
    qryPecasReposicaoCODUNIDADE: TStringField;
    qryPecasReposicaoUNIDMEDIDA: TStringField;
    qryPecasReposicaoQUANTIDADE: TIntegerField;
    qryPecasReposicaoQTDERESERVADA: TIntegerField;
    qryPecasReposicaoPRECO: TBCDField;
    qryPecasReposicaoPESO: TBCDField;
    qryPecasReposicaoFABRICADA: TStringField;
    qryPecasReposicaoCATALOGO: TStringField;
    qryPecasReposicaoKIT: TStringField;
    qryPecasReposicaoDATACADASTRO: TDateTimeField;
    qryPecasReposicaoCODUSUARIOCAD: TStringField;
    qryPecasReposicaoDATAULTALT: TDateTimeField;
    qryPecasReposicaoCODUSUARIOALT: TStringField;
    qryPecasReposicaoIMAGEM: TBlobField;
    qryPecasReposicaoOBSERVACOES: TBlobField;
    qryPecasReposicaoFABRICANTE: TStringField;
    qryPecasReposicaoFORNECEDOR: TStringField;
    qryPecasReposicaoFAMILIAPECA: TStringField;
    qryPecasReposicaoUSUARIOCAD: TStringField;
    qryPecasReposicaoUSUARIOALT: TStringField;
    qryPecaReposicaoKitItensCODIGO: TFDAutoIncField;
    qryPecaReposicaoKitItensCODEMPRESA: TStringField;
    qryPecaReposicaoKitItensCODKIT: TStringField;
    qryPecaReposicaoKitItensCODPECAREPOSICAO: TStringField;
    qryPecaReposicaoKitItensQUANTIDADE: TIntegerField;
    qryPecaReposicaoKitItensREFERENCIA: TStringField;
    qryPecaReposicaoKitItensDESCRICAO: TStringField;
    qryOrdemServicoEquipeMObraUtilCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeMObraUtilCODEMPRESA: TStringField;
    qryOrdemServicoEquipeMObraUtilCODEQUIPE: TIntegerField;
    qryOrdemServicoEquipeMObraUtilCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeMObraUtilCODCARGO: TStringField;
    qryOrdemServicoEquipeMObraUtilCODCALENDARIO: TStringField;
    qryOrdemServicoEquipeMObraUtilMATRICULA: TStringField;
    qryOrdemServicoEquipeMObraUtilNOME: TStringField;
    qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA: TBCDField;
    qryOrdemServicoEquipeMObraUtilQTDEHENORMAL: TBCDField;
    qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO: TBCDField;
    qryOrdemServicoEquipeMObraUtilESPECIALISTA: TStringField;
    qryOrdemServicoEquipeMObraUtilFECHAMENTO: TDateTimeField;
    qryOrdemServicoEquipeMObraUtilCARGO: TStringField;
    qryOrdemServicoEquipeMObraUtilCALENDARIO: TStringField;
    qryOrdemServicoEquipeMObraUtilHOFICIAIS: TIntegerField;
    qryOrdemServicoEquipeMObraUtilHENORMAL: TIntegerField;
    qryOrdemServicoEquipeMObraUtilHEFERIADO: TIntegerField;
    qryOrdemServicoEquipeMObraUtilSALARIO: TBCDField;
    qryOrdemServicoTercUnidAditivosTOTAL: TAggregateField;
    qryOrdemServicoTercForaOISUM_TOTAL: TAggregateField;
    qryOrdemServicoTercForaOCSUM_TOTAL: TAggregateField;
    qryOrdemServicoTercForaOESUM_TOTAL: TAggregateField;
    qrySAMCODIGO: TIntegerField;
    qrySAMCHAVE: TStringField;
    qrySAMINSTALACAO: TDateField;
    qrySAMEMPRESA: TStringField;
    qrySAMUSUARIOS: TIntegerField;
    qryAbastecimentosCombustCODIGO: TFDAutoIncField;
    qryAbastecimentosCombustCODEMPRESA: TStringField;
    qryAbastecimentosCombustCODEQUIPAMENTO: TStringField;
    qryAbastecimentosCombustTIPOCOMBUSTIVEL: TStringField;
    qryAbastecimentosCombustCONSPOTENCIAL: TBCDField;
    qryAbastecimentosCombustAbastCODIGO: TFDAutoIncField;
    qryAbastecimentosCombustAbastCODEMPRESA: TStringField;
    qryAbastecimentosCombustAbastCODEQUIPAMENTO: TStringField;
    qryAbastecimentosCombustAbastCODCOMBUSTIVEL: TIntegerField;
    qryAbastecimentosCombustAbastCODROTA: TIntegerField;
    qryAbastecimentosCombustAbastDATACOMBUST: TDateTimeField;
    qryAbastecimentosCombustAbastODOMETROCOMBUST: TIntegerField;
    qryAbastecimentosCombustAbastQTDECOMBUST: TBCDField;
    qryAbastecimentosCombustAbastPRECOCOMBUST: TBCDField;
    qryAbastecimentosCombustAbastVALORCOMBUST: TBCDField;
    qryAbastecimentosCombustAbastMATRICULA: TStringField;
    qryAbastecimentosCombustAbastLEITOR: TStringField;
    qryAbastecimentosCombustAbastTROCALEITOR: TIntegerField;
    qryAbastecimentosCombustAbastCONSUMO: TBCDField;
    qryAbastecimentosCombustAbastROTA: TStringField;
    qryAbastecimentosCombustAbastNOME: TStringField;
    qryAbastecimentosCombustAbastTIPOCOMBUSTIVEL: TStringField;
    qryAbastecimentosCombustAbastCONSPOTENCIAL: TBCDField;
    qryAbastecimentosLubrificCODIGO: TFDAutoIncField;
    qryAbastecimentosLubrificCODEMPRESA: TStringField;
    qryAbastecimentosLubrificCODEQUIPAMENTO: TStringField;
    qryAbastecimentosLubrificCODLUBRIFICANTE: TStringField;
    qryAbastecimentosLubrificCONSPOTENCIAL: TBCDField;
    qryAbastecimentosLubrificLUBRIFICANTE: TStringField;
    qryAbastecimentosLubrificAbastCODIGO: TFDAutoIncField;
    qryAbastecimentosLubrificAbastCODEMPRESA: TStringField;
    qryAbastecimentosLubrificAbastCODEQUIPAMENTO: TStringField;
    qryAbastecimentosLubrificAbastCODLUBRIFICANTE: TIntegerField;
    qryAbastecimentosLubrificAbastCODROTA: TIntegerField;
    qryAbastecimentosLubrificAbastDATALUBRIFIC: TDateTimeField;
    qryAbastecimentosLubrificAbastODOMETROLUBRIFIC: TIntegerField;
    qryAbastecimentosLubrificAbastQTDELUBRIFIC: TBCDField;
    qryAbastecimentosLubrificAbastPRECOLUBRIFIC: TBCDField;
    qryAbastecimentosLubrificAbastVALORLUBRIFIC: TBCDField;
    qryAbastecimentosLubrificAbastMATRICULA: TStringField;
    qryAbastecimentosLubrificAbastLEITOR: TStringField;
    qryAbastecimentosLubrificAbastTROCALEITOR: TIntegerField;
    qryAbastecimentosLubrificAbastCONSUMO: TBCDField;
    qryAbastecimentosLubrificAbastROTA: TStringField;
    qryAbastecimentosLubrificAbastNOME: TStringField;
    qryAbastecimentosLubrificAbastLUBRIFICANTE: TStringField;
    qryAbastecimentosLubrificAbastCONSPOTENCIAL: TBCDField;
    qryAbastecimentosCombustTodos: TFDQuery;
    dsAbastecimentosCombustTodos: TDataSource;
    qryAbastecimentosCombustTodosCODIGO: TFDAutoIncField;
    qryAbastecimentosCombustTodosCODEMPRESA: TStringField;
    qryAbastecimentosCombustTodosCODEQUIPAMENTO: TStringField;
    qryAbastecimentosCombustTodosCODCOMBUSTIVEL: TIntegerField;
    qryAbastecimentosCombustTodosCODROTA: TIntegerField;
    qryAbastecimentosCombustTodosMATRICULA: TStringField;
    qryAbastecimentosCombustTodosLEITOR: TStringField;
    qryAbastecimentosCombustTodosTROCALEITOR: TIntegerField;
    qryAbastecimentosCombustTodosCONSPOTENCIAL: TBCDField;
    qryAbastecimentosCombustTodosTIPOCOMBUSTIVEL: TStringField;
    qryAbastecimentosCombustTodosDATACOMBUST: TDateTimeField;
    qryAbastecimentosCombustTodosODOMETROCOMBUST: TIntegerField;
    qryAbastecimentosCombustTodosQTDECOMBUST: TBCDField;
    qryAbastecimentosCombustTodosPRECOCOMBUST: TBCDField;
    qryAbastecimentosCombustTodosVALORCOMBUST: TBCDField;
    qryAbastecimentosCombustTodosNOME: TStringField;
    qryAbastecimentosCombustTodosROTA: TStringField;
    qryAbastecimentosCombustTodosCONSUMO: TBCDField;
    qryAbastecimentosLubrificTodos: TFDQuery;
    dsAbastecimentosLubrificTodos: TDataSource;
    qryAbastecimentosLubrificTodosCODIGO: TFDAutoIncField;
    qryAbastecimentosLubrificTodosCODEMPRESA: TStringField;
    qryAbastecimentosLubrificTodosCODEQUIPAMENTO: TStringField;
    qryAbastecimentosLubrificTodosCODLUBRIFICANTE: TIntegerField;
    qryAbastecimentosLubrificTodosCODROTA: TIntegerField;
    qryAbastecimentosLubrificTodosMATRICULA: TStringField;
    qryAbastecimentosLubrificTodosTROCALEITOR: TIntegerField;
    qryAbastecimentosLubrificTodosCONSPOTENCIAL: TBCDField;
    qryAbastecimentosLubrificTodosLEITOR: TStringField;
    qryAbastecimentosLubrificTodosLUBRIFICANTE: TStringField;
    qryAbastecimentosLubrificTodosDATALUBRIFIC: TDateTimeField;
    qryAbastecimentosLubrificTodosODOMETROLUBRIFIC: TIntegerField;
    qryAbastecimentosLubrificTodosQTDELUBRIFIC: TBCDField;
    qryAbastecimentosLubrificTodosPRECOLUBRIFIC: TBCDField;
    qryAbastecimentosLubrificTodosVALORLUBRIFIC: TBCDField;
    qryAbastecimentosLubrificTodosNOME: TStringField;
    qryAbastecimentosLubrificTodosROTA: TStringField;
    qryAbastecimentosLubrificTodosCONSUMO: TBCDField;
    qryPneusChassiPneusCODIGO: TFDAutoIncField;
    qryPneusChassiPneusCODEMPRESA: TStringField;
    qryPneusChassiPneusCODCHASSI: TIntegerField;
    qryPneusChassiPneusCODPNEU: TStringField;
    qryPneusChassiPneusID: TIntegerField;
    qryPneusChassiPneusINSTALADO: TDateTimeField;
    qryPneusChassiPneusRODADOS: TIntegerField;
    qryPneusChassiPneusPOSICAO: TStringField;
    qryPneusChassiPneusSTATUS: TStringField;
    qryPneusChassiPneusCONTADOR: TBCDField;
    qryPneusChassiPneusCUSTO: TBCDField;
    qryPneusChassiPneusCUSTOKM: TFMTBCDField;
    qryPneusChassiPneusPNEU: TStringField;
    qryPneusChassiPneusEQUIPAMENTO: TStringField;
    qryConfigs: TFDQuery;
    qryConfigsid: TFDAutoIncField;
    qryConfigstempoconsos: TSmallintField;
    qryConfigstemposenhausu: TSmallintField;
    qryConfigsqtdeminsenha: TSmallintField;
    qryConfigsqtdelogintent: TSmallintField;
    dsConfigs: TDataSource;
    qryConfigsdataultalt: TDateTimeField;
    qryConfigscodusuarioalt: TStringField;
    qryUsuariosAtivosHOST: TStringField;
    qryTotalEquipHoraCODCALENDARIOEQUIP: TStringField;
    qryUsuarioSENHAALTERADADATA: TDateTimeField;
    qryDispAdmissiveisCODIGO: TFDAutoIncField;
    qryDispAdmissiveisCODEMPRESA: TStringField;
    qryDispAdmissiveisCODITEM: TStringField;
    qryDispAdmissiveisVALITEM: TBCDField;
    qryDispAdmissiveisTIPOITEM: TStringField;
    qryDispAdmissiveisDATACADASTRO: TDateTimeField;
    qryDispAdmissiveisCODUSUARIOCAD: TStringField;
    qryDispAdmissiveisDATAULTALT: TDateTimeField;
    qryDispAdmissiveisCODUSUARIOALT: TStringField;
    qryDispAdmissiveisUSUARIOCAD: TStringField;
    qryDispAdmissiveisUSUARIOALT: TStringField;
    qryDispAdmissiveisAREA: TStringField;
    qryDispAdmissiveisCELULA: TStringField;
    qryDispAdmissiveisEQUIPAMENTO: TStringField;
    qryManutConsC_DIASATRASO: TIntegerField;
    qryLubrificConsC_DIASATRASO: TIntegerField;
    qryRotaConsC_DIASATRASO: TIntegerField;
    qryPontosInspecaoLocCODIGO: TFDAutoIncField;
    qryPontosInspecaoLocCODEMPRESA: TStringField;
    qryPontosInspecaoLocCODPONTOINSP: TStringField;
    qryPontosInspecaoLocCODTIPOPROGRAMACAO: TStringField;
    qryPontosInspecaoLocDESCRICAO: TStringField;
    qryPontosInspecaoLocEMISSAOOS: TStringField;
    qryPontosInspecaoLocUNIDMEDIDA: TStringField;
    qryPontosInspecaoLocLIMINFSEG: TBCDField;
    qryPontosInspecaoLocLIMINFMAX: TBCDField;
    qryPontosInspecaoLocLIMSUPSEG: TBCDField;
    qryPontosInspecaoLocLIMSUPMAX: TBCDField;
    qryPontosInspecaoLocTIPOPROGRAMACAO: TStringField;
    qryDespMensalFuncPerCODIGO: TFDAutoIncField;
    qryDespMensalFuncPerCODEMPRESA: TStringField;
    qryDespMensalFuncPerMES: TStringField;
    qryDespMensalFuncPerANO: TStringField;
    qryDespMensalFuncPerDATAFECHAMENTO: TDateTimeField;
    qryAbastecimentosCombustAbastMAX_DATA: TAggregateField;
    qryAbastecimentosCombustAbastMAX_ODOM: TAggregateField;
    qryAbastecimentosLubrificAbastMAX_DATA: TAggregateField;
    qryAbastecimentosLubrificAbastMAX_ODOM: TAggregateField;
    qrySolicitacaoTrabEQUIPAMENTO: TStringField;
    qrySolicitacaoTrabSOLICITANTE: TStringField;
    qrySolicitacaoTrabSITUACAO_1: TStringField;
    qrySolicitacaoTrabUSUARIOCAD: TStringField;
    qrySolicitacaoTrabUSUARIOALT: TStringField;
    qryUsuariosSENHAALTERADADATA: TDateTimeField;
    qryEquipamentosContadoresCODIGO: TFDAutoIncField;
    qryEquipamentosContadoresCODEMPRESA: TStringField;
    qryEquipamentosContadoresCODEQUIPAMENTO: TStringField;
    qryEquipamentosContadoresCODCONTADOR: TStringField;
    qryEquipamentosContadoresDESCRICAO: TStringField;
    qryEquipamentosContadoresEQUIPAMENTO: TStringField;
    qryEquipamentosContadoresCONTADOR: TStringField;
    qryEquipamentosContadoresPROGRAMACAO: TStringField;
    qryUsuariosAudit: TFDQuery;
    dsUsuariosAudit: TDataSource;
    qryUsuariosAuditCODIGO: TStringField;
    qryUsuariosAuditCODEMPRESA: TStringField;
    qryUsuariosAuditCODGRUPO: TIntegerField;
    qryUsuariosAuditCODEMPRESAS: TFDAutoIncField;
    qryUsuariosAuditMATRICULA: TStringField;
    qryUsuariosAuditNOME: TStringField;
    dsEquipamentosConf: TDataSource;
    qryEquipamentosConf: TFDQuery;
    dsEquipamentosConfOS: TDataSource;
    qryEquipamentosConfOS: TFDQuery;
    qryEquipamentosConfOSCODIGO: TFDAutoIncField;
    qryEquipamentosConfOSDESCSERVICO: TStringField;
    qryEquipamentosConfOSCODEMPRESA: TStringField;
    qryEquipamentosConfOSDATAINICIOREAL: TDateTimeField;
    qryEquipamentosConfOSDATAFIMREAL: TDateTimeField;
    qryEquipamentosConfOSDATAFECHAMENTO: TDateTimeField;
    qryEquipamentosConfOSCODEQUIPAMENTO: TStringField;
    qryEquipamentosConfOSDESCEQUIPAMENTO: TStringField;
    qryEquipamentosConfOSDATAINICIOCONF: TDateTimeField;
    qryEquipamentosConfCODIGO: TStringField;
    qryEquipamentosConfCODEMPRESA: TStringField;
    qryEquipamentosConfDESCRICAO: TStringField;
    qryEquipamentosConfCALCULARCONF: TStringField;
    qryEquipamentosConfOPERANDO: TStringField;
    qryEquipamentosConfDATAINICIOCONF: TDateTimeField;
    qryEquipamentosConfPERIODOCONF: TStringField;
    qryEquipamentosConfCALCULADACONF: TStringField;
    qryEquipamentosArvoreCODEMPRESA: TStringField;
    qryEquipamentosArvoreSecCODEMPRESA: TStringField;
    qryEquipamentosHistSUMTEMPOEXECUTADO: TAggregateField;
    qryEquipamentosHistSUMCUSTOSECUNDARIOS: TAggregateField;
    qryEquipamentosHistSUMCUSTOS: TAggregateField;
    qryFuncionariosCxaFerramInvItensCODIGO: TIntegerField;
    qryFuncionariosCxaFerramInvItensCODEMPRESA: TStringField;
    qryFuncionariosCxaFerramInvItensCODINVENTARIO: TIntegerField;
    qryFuncionariosCxaFerramInvItensMATRICULA: TStringField;
    qryFuncionariosCxaFerramInvItensKIT: TStringField;
    qryFuncionariosCxaFerramInvItensCODITEM: TStringField;
    qryFuncionariosCxaFerramInvItensDESCRICAO: TStringField;
    qryFuncionariosCxaFerramInvItensQUANTIDADE: TIntegerField;
    qryFuncionariosCxaFerramInvItensMOTIVOPERDA: TBlobField;
    qryFuncionariosCxaFerramInvItensENTREGUE: TIntegerField;
    qryEquipamentosDadosRCODIGO: TFDAutoIncField;
    qryEquipamentosDadosRCODEMPRESA: TStringField;
    qryEquipamentosDadosRCODFAMILIAEQUIP: TStringField;
    qryEquipamentosDadosRCODEQUIPAMENTO: TStringField;
    qryEquipamentosDadosRREGISTRO1: TBCDField;
    qryEquipamentosDadosRREGISTRO2: TBCDField;
    qryEquipamentosDadosRREGISTRO3: TBCDField;
    qryEquipamentosDadosRREGISTRO4: TBCDField;
    qryEquipamentosDadosRREGISTRO5: TBCDField;
    qryEquipamentosDadosRREGISTRO6: TBCDField;
    qryEquipamentosDadosRREGISTRO7: TBCDField;
    qryEquipamentosDadosRREGISTRO8: TBCDField;
    qryEquipamentosDadosRREGISTRO9: TBCDField;
    qryEquipamentosDadosRREGISTRO10: TBCDField;
    qryEquipamentosDadosRREGISTRO11: TBCDField;
    qryEquipamentosDadosRREGISTRO12: TBCDField;
    qryEquipamentosDadosRINFORMACOES: TBlobField;
    qryPecasReposicaoDadosCODIGO: TFDAutoIncField;
    qryPecasReposicaoDadosCODEMPRESA: TStringField;
    qryPecasReposicaoDadosCODFAMILIAPECASREP: TStringField;
    qryPecasReposicaoDadosCODPECAREPOSICAO: TStringField;
    qryPecasReposicaoDadosREGISTRO1: TStringField;
    qryPecasReposicaoDadosREGISTRO2: TStringField;
    qryPecasReposicaoDadosREGISTRO3: TStringField;
    qryPecasReposicaoDadosREGISTRO4: TStringField;
    qryPecasReposicaoDadosREGISTRO5: TStringField;
    qryPecasReposicaoDadosREGISTRO6: TStringField;
    qryPecasReposicaoDadosREGISTRO7: TStringField;
    qryPecasReposicaoDadosREGISTRO8: TStringField;
    qryPecasReposicaoDadosREGISTRO9: TStringField;
    qryPecasReposicaoDadosREGISTRO10: TStringField;
    qryPecasReposicaoDadosREGISTRO11: TStringField;
    qryPecasReposicaoDadosREGISTRO12: TStringField;
    qryPecasReposicaoDadosINFORMACOES: TBlobField;
    qryRecursosDadosCODIGO: TFDAutoIncField;
    qryRecursosDadosCODEMPRESA: TStringField;
    qryRecursosDadosCODFAMILIARECURSOS: TStringField;
    qryRecursosDadosCODRECURSO: TStringField;
    qryRecursosDadosREGISTRO1: TStringField;
    qryRecursosDadosREGISTRO2: TStringField;
    qryRecursosDadosREGISTRO3: TStringField;
    qryRecursosDadosREGISTRO4: TStringField;
    qryRecursosDadosREGISTRO5: TStringField;
    qryRecursosDadosREGISTRO6: TStringField;
    qryRecursosDadosREGISTRO7: TStringField;
    qryRecursosDadosREGISTRO8: TStringField;
    qryRecursosDadosREGISTRO9: TStringField;
    qryRecursosDadosREGISTRO10: TStringField;
    qryRecursosDadosREGISTRO11: TStringField;
    qryRecursosDadosREGISTRO12: TStringField;
    qryRecursosDadosINFORMACOES: TBlobField;
    qryHorasParadasEquip: TFDQuery;
    qryConfigstempomaxocioso: TIntegerField;
    qryManutPeriodicasHistItens: TFDQuery;
    dsManutPeriodicasHistItens: TDataSource;
    qryManutPeriodicasHistItensEsp: TFDQuery;
    dsManutPeriodicasHistItensEsp: TDataSource;
    qryManutPeriodicasHistItensINDICE: TFDAutoIncField;
    qryManutPeriodicasHistItensCODEMPRESA: TStringField;
    qryManutPeriodicasHistItensHISTORICO: TIntegerField;
    qryManutPeriodicasHistItensCODIGO: TIntegerField;
    qryManutPeriodicasHistItensCODMANUTPROGEQUIP: TStringField;
    qryManutPeriodicasHistItensDTAINICIO1: TDateTimeField;
    qryManutPeriodicasHistItensDATAINSPECAO: TDateTimeField;
    qryManutPeriodicasHistItensCODPARTE: TIntegerField;
    qryManutPeriodicasHistItensITEM: TStringField;
    qryManutPeriodicasHistItensDESCINSPECAO: TStringField;
    qryManutPeriodicasHistItensEQUIPPARADO: TStringField;
    qryManutPeriodicasHistItensTEMPO: TBCDField;
    qryManutPeriodicasHistItensEXECAUTONOMO: TStringField;
    qryManutPeriodicasHistItensEXECUTADO: TStringField;
    qryManutPeriodicasHistItensBOM: TStringField;
    qryManutPeriodicasHistItensREGULAR: TStringField;
    qryManutPeriodicasHistItensRUIM: TStringField;
    qryManutPeriodicasHistItensPARTE: TStringField;
    qryManutPeriodicasHistItensEXECUTADO_CHK: TBooleanField;
    qryManutPeriodicasHistItensBOM_CHK: TBooleanField;
    qryManutPeriodicasHistItensREGULAR_CHK: TBooleanField;
    qryManutPeriodicasHistItensRUIM_CHK: TBooleanField;
    qryLubrificPeriodicasHistPERIODOCONSULTA: TStringField;
    qryLubrificPeriodicasHistItens: TFDQuery;
    dsLubrificPeriodicasHistItens: TDataSource;
    qryLubrificPeriodicasHistItensEsp: TFDQuery;
    dsLubrificPeriodicasHistItensEsp: TDataSource;
    qryLubrificPeriodicasHistItensINDICE: TFDAutoIncField;
    qryLubrificPeriodicasHistItensCODEMPRESA: TStringField;
    qryLubrificPeriodicasHistItensHISTORICO: TIntegerField;
    qryLubrificPeriodicasHistItensCODIGO: TIntegerField;
    qryLubrificPeriodicasHistItensCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificPeriodicasHistItensDTAINICIO1: TDateTimeField;
    qryLubrificPeriodicasHistItensDATAINSPECAO: TDateTimeField;
    qryLubrificPeriodicasHistItensCODPARTE: TIntegerField;
    qryLubrificPeriodicasHistItensITEM: TStringField;
    qryLubrificPeriodicasHistItensDESCINSPECAO: TStringField;
    qryLubrificPeriodicasHistItensEQUIPPARADO: TStringField;
    qryLubrificPeriodicasHistItensTEMPO: TBCDField;
    qryLubrificPeriodicasHistItensEXECAUTONOMO: TStringField;
    qryLubrificPeriodicasHistItensEXECUTADO: TStringField;
    qryLubrificPeriodicasHistItensBOM: TStringField;
    qryLubrificPeriodicasHistItensREGULAR: TStringField;
    qryLubrificPeriodicasHistItensRUIM: TStringField;
    qryLubrificPeriodicasHistItensPARTE: TStringField;
    qryLubrificPeriodicasHistItensEspINDICE: TFDAutoIncField;
    qryLubrificPeriodicasHistItensEspCODEMPRESA: TStringField;
    qryLubrificPeriodicasHistItensEspHISTORICO: TIntegerField;
    qryLubrificPeriodicasHistItensEspCODIGO: TIntegerField;
    qryLubrificPeriodicasHistItensEspCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificPeriodicasHistItensEspDTAINICIO1: TDateTimeField;
    qryLubrificPeriodicasHistItensEspDATAINSPECAO: TDateTimeField;
    qryLubrificPeriodicasHistItensEspCODPARTE: TIntegerField;
    qryLubrificPeriodicasHistItensEspITEM: TStringField;
    qryLubrificPeriodicasHistItensEspDESCINSPECAO: TStringField;
    qryLubrificPeriodicasHistItensEspEQUIPPARADO: TStringField;
    qryLubrificPeriodicasHistItensEspTEMPO: TBCDField;
    qryLubrificPeriodicasHistItensEspEXECAUTONOMO: TStringField;
    qryLubrificPeriodicasHistItensEspEXECUTADO: TStringField;
    qryLubrificPeriodicasHistItensEspBOM: TStringField;
    qryLubrificPeriodicasHistItensEspREGULAR: TStringField;
    qryLubrificPeriodicasHistItensEspRUIM: TStringField;
    qryLubrificPeriodicasHistItensEspPARTE: TStringField;
    qryLubrificPeriodicasHistItensBOM_CHK: TBooleanField;
    qryLubrificPeriodicasHistItensEXECUTADO_CHK: TBooleanField;
    qryLubrificPeriodicasHistItensREGULAR_CHK: TBooleanField;
    qryLubrificPeriodicasHistItensRUIM_CHK: TBooleanField;
    qryLubrificPeriodicasHistItensEspEXECUTADO_CHK: TBooleanField;
    qryLubrificPeriodicasHistItensEspBOM_CHK: TBooleanField;
    qryLubrificPeriodicasHistItensEspREGULAR_CHK: TBooleanField;
    qryLubrificPeriodicasHistItensEspRUIM_CHK: TBooleanField;
    qryManutPeriodicasHistItensEspEXECUTADO_CHK: TBooleanField;
    qryManutPeriodicasHistItensEspBOM_CHK: TBooleanField;
    qryManutPeriodicasHistItensEspREGULAR_CHK: TBooleanField;
    qryManutPeriodicasHistItensEspRUIM_CHK: TBooleanField;
    qryManutPeriodicasHistItensEspINDICE: TFDAutoIncField;
    qryManutPeriodicasHistItensEspCODEMPRESA: TStringField;
    qryManutPeriodicasHistItensEspHISTORICO: TIntegerField;
    qryManutPeriodicasHistItensEspCODIGO: TIntegerField;
    qryManutPeriodicasHistItensEspCODMANUTPROGEQUIP: TStringField;
    qryManutPeriodicasHistItensEspDTAINICIO1: TDateTimeField;
    qryManutPeriodicasHistItensEspDATAINSPECAO: TDateTimeField;
    qryManutPeriodicasHistItensEspCODPARTE: TIntegerField;
    qryManutPeriodicasHistItensEspITEM: TStringField;
    qryManutPeriodicasHistItensEspDESCINSPECAO: TStringField;
    qryManutPeriodicasHistItensEspEQUIPPARADO: TStringField;
    qryManutPeriodicasHistItensEspTEMPO: TBCDField;
    qryManutPeriodicasHistItensEspEXECAUTONOMO: TStringField;
    qryManutPeriodicasHistItensEspEXECUTADO: TStringField;
    qryManutPeriodicasHistItensEspBOM: TStringField;
    qryManutPeriodicasHistItensEspREGULAR: TStringField;
    qryManutPeriodicasHistItensEspRUIM: TStringField;
    qryManutPeriodicasHistItensEspPARTE: TStringField;
    qryRotaConsPERIODO: TStringField;
    qryEquipamentosConfOSServ: TFDQuery;
    dsEquipamentosConfOSServ: TDataSource;
    qryEquipamentosConfOSServCODIGO: TFDAutoIncField;
    qryEquipamentosConfOSServCODEMPRESA: TStringField;
    qryEquipamentosConfOSServCODORDEMSERVICO: TIntegerField;
    qryEquipamentosConfOSServPARTE: TStringField;
    qryEquipamentosConfOSServITEM: TStringField;
    qryEquipamentosConfOSServDESCRICAO: TStringField;
    qryEquipamentosConfOSServEQUIPPARADO: TStringField;
    qryEquipamentosConfOSServTEMPOEXECUCAO: TBCDField;
    qryUsuarioSENHAALTERADA: TStringField;
    qryManutProgEquipPlanoTrabCODIGO: TFDAutoIncField;
    qryManutProgEquipPlanoTrabCODEMPRESA: TStringField;
    qryManutProgEquipPlanoTrabCODMANUTPROGFAMEQUIP: TStringField;
    qryManutProgEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    qryManutProgEquipPlanoTrabPLANOTRABALHO: TStringField;
    qryManutProgEquipPlanoTrabDETALHES: TBlobField;
    qryLubrificProgEquipPlanoTrabCODIGO: TFDAutoIncField;
    qryLubrificProgEquipPlanoTrabCODEMPRESA: TStringField;
    qryLubrificProgEquipPlanoTrabCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificProgEquipPlanoTrabCODPLANOTRABALHO: TStringField;
    qryLubrificProgEquipPlanoTrabPLANOTRABALHO: TStringField;
    qryLubrificProgEquipPlanoTrabDETALHES: TBlobField;
    qryManutConsDESCMANUTPROGFAMEQUIP: TStringField;
    qryManutConsC_PROXINSP: TDateTimeField;
    qryManutConsPROGRAMACAO2: TStringField;
    qryManutConsItens: TFDQuery;
    dsManutConsItens: TDataSource;
    qryManutConsItensCODIGO: TIntegerField;
    qryManutConsItensCODEMPRESA: TStringField;
    qryManutConsItensCODMANUTPROGFAMEQUIP: TStringField;
    qryManutConsItensCODPARTE: TIntegerField;
    qryManutConsItensITEM: TStringField;
    qryManutConsItensDESCINSPECAO: TStringField;
    qryManutConsItensEQUIPPARADO: TStringField;
    qryManutConsItensTEMPO: TBCDField;
    qryManutConsItensEXECAUTONOMO: TStringField;
    qryManutConsItensPARTE: TStringField;
    qryLubrificConsItens: TFDQuery;
    dsLubrificConsItens: TDataSource;
    qryLubrificConsItensCODIGO: TIntegerField;
    qryLubrificConsItensCODEMPRESA: TStringField;
    qryLubrificConsItensCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificConsItensCODPARTE: TIntegerField;
    qryLubrificConsItensITEM: TStringField;
    qryLubrificConsItensDESCINSPECAO: TStringField;
    qryLubrificConsItensEQUIPPARADO: TStringField;
    qryLubrificConsItensTEMPO: TBCDField;
    qryLubrificConsItensEXECAUTONOMO: TStringField;
    qryLubrificConsItensPARTE: TStringField;
    qryLubrificConsC_PROXINSP: TDateTimeField;
    qryLubrificConsDESCLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificConsPROGRAMACAO2: TStringField;
    qryManutConsItensEsp: TFDQuery;
    dsManutConsItensEsp: TDataSource;
    qryManutConsItensEspCODIGO: TFDAutoIncField;
    qryManutConsItensEspCODEMPRESA: TStringField;
    qryManutConsItensEspCODMANUTPROGEQUIP: TStringField;
    qryManutConsItensEspCODPARTE: TIntegerField;
    qryManutConsItensEspITEM: TStringField;
    qryManutConsItensEspDESCINSPECAO: TStringField;
    qryManutConsItensEspEQUIPPARADO: TStringField;
    qryManutConsItensEspTEMPO: TBCDField;
    qryManutConsItensEspEXECAUTONOMO: TStringField;
    qryManutConsItensEspEXECUTADO: TStringField;
    qryManutConsItensEspBOM: TStringField;
    qryManutConsItensEspREGULAR: TStringField;
    qryManutConsItensEspRUIM: TStringField;
    qryManutConsItensEspPARTE: TStringField;
    qryManutConsPlanoTrab: TFDQuery;
    dsManutConsPlanoTrab: TDataSource;
    qryManutConsPlanoTrabCODIGO: TFDAutoIncField;
    qryManutConsPlanoTrabCODEMPRESA: TStringField;
    qryManutConsPlanoTrabCODMANUTPROGFAMEQUIP: TStringField;
    qryManutConsPlanoTrabCODPLANOTRABALHO: TStringField;
    qryManutConsPlanoTrabPLANOTRABALHO: TStringField;
    qryManutConsPlanoTrabDETALHES: TBlobField;
    qryLubrificConsItensEsp: TFDQuery;
    dsLubrificConsItensEsp: TDataSource;
    qryLubrificConsItensEspCODIGO: TFDAutoIncField;
    qryLubrificConsItensEspCODEMPRESA: TStringField;
    qryLubrificConsItensEspCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificConsItensEspCODPARTE: TIntegerField;
    qryLubrificConsItensEspITEM: TStringField;
    qryLubrificConsItensEspDESCINSPECAO: TStringField;
    qryLubrificConsItensEspEQUIPPARADO: TStringField;
    qryLubrificConsItensEspTEMPO: TBCDField;
    qryLubrificConsItensEspEXECAUTONOMO: TStringField;
    qryLubrificConsItensEspEXECUTADO: TStringField;
    qryLubrificConsItensEspBOM: TStringField;
    qryLubrificConsItensEspREGULAR: TStringField;
    qryLubrificConsItensEspRUIM: TStringField;
    qryLubrificConsItensEspPARTE: TStringField;
    qryLubrificConsPlanoTrab: TFDQuery;
    dsLubrificConsPlanoTrab: TDataSource;
    qryLubrificConsPlanoTrabCODIGO: TFDAutoIncField;
    qryLubrificConsPlanoTrabCODEMPRESA: TStringField;
    qryLubrificConsPlanoTrabCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryLubrificConsPlanoTrabCODPLANOTRABALHO: TStringField;
    qryLubrificConsPlanoTrabPLANOTRABALHO: TStringField;
    qryLubrificConsPlanoTrabDETALHES: TBlobField;
    qryOrdemServicoMObraDisp: TFDQuery;
    qryOrdemServicoMObraDispMATRICULA: TStringField;
    qryOrdemServicoMObraDispCODEMPRESA: TStringField;
    qryOrdemServicoMObraDispNOME: TStringField;
    qryOrdemServicoMObraDispOCUPADO: TStringField;
    qryOrdemServicoMObraDispPROGRAMADO: TStringField;
    qryOrdemServicoMObraDispAPELIDO: TStringField;
    qryOrdemServicoMObraDispIMAGEM: TBlobField;
    qryOrdemServicoMObraDispCODCARGO: TStringField;
    qryOrdemServicoMObraDispCARGO: TStringField;
    qryOrdemServicoMObraDispCODCALENDARIO: TStringField;
    qryOrdemServicoMObraDispCALENDARIO: TStringField;
    qryOrdemServicoMObraDispCODEQUIPESP: TStringField;
    qryOrdemServicoMObraDispEQUIPESP: TStringField;
    dsOrdemServicoMObraDisp: TDataSource;
    qryPneusChassiAtrelamentoStatus: TFDQuery;
    dsPneusChassiAtrelamentoStatus: TDataSource;
    qryPneusChassiAtrelamentoRelat: TFDQuery;
    qryPneusChassiAtrelamentoRelatCODCAVALO: TStringField;
    qryPneusChassiAtrelamentoRelatCODEMPRESA: TStringField;
    qryPneusChassiAtrelamentoRelatDESCCAVALO: TStringField;
    qryPneusChassiAtrelamentoRelatCODCARROCERIA1: TStringField;
    qryPneusChassiAtrelamentoRelatDESCCARROCERIA1: TStringField;
    qryPneusChassiAtrelamentoRelatCODCARROCERIA2: TStringField;
    qryPneusChassiAtrelamentoRelatDESCCARROCERIA2: TStringField;
    qryPneusChassiAtrelamentoRelatCODCARROCERIA3: TStringField;
    qryPneusChassiAtrelamentoRelatDESCCARROCERIA3: TStringField;
    qryPneusChassiAtrelamentoRelatCHASSICAVALO: TStringField;
    qryPneusChassiAtrelamentoRelatCHASSICARROCERIA1: TStringField;
    qryPneusChassiAtrelamentoRelatCHASSICARROCERIA2: TStringField;
    qryPneusChassiAtrelamentoRelatCHASSICARROCERIA3: TStringField;
    dsPneusChassiAtrelamentoRelat: TDataSource;
    qryPneusChassiPneusConsertos: TFDQuery;
    qryPneusChassiPneusConsertosCODIGO: TFDAutoIncField;
    qryPneusChassiPneusConsertosCODEMPRESA: TStringField;
    qryPneusChassiPneusConsertosCODPNEU: TStringField;
    qryPneusChassiPneusConsertosCODFORNECEDOR: TStringField;
    qryPneusChassiPneusConsertosID: TIntegerField;
    qryPneusChassiPneusConsertosACAO: TStringField;
    qryPneusChassiPneusConsertosCUSTO: TBCDField;
    qryPneusChassiPneusConsertosRODAGEM: TIntegerField;
    qryPneusChassiPneusConsertosSERVICO: TStringField;
    qryPneusChassiPneusConsertosENVIO: TDateTimeField;
    qryPneusChassiPneusConsertosENTREGA: TDateTimeField;
    qryPneusChassiPneusConsertosDATACADASTRO: TDateTimeField;
    qryPneusChassiPneusConsertosCODUSUARIOCAD: TStringField;
    qryPneusChassiPneusConsertosDATAULTALT: TDateTimeField;
    qryPneusChassiPneusConsertosCODUSUARIOALT: TStringField;
    qryPneusChassiPneusConsertosOBSERVACOES: TBlobField;
    qryPneusChassiPneusConsertosFORNECEDOR: TStringField;
    qryPneusChassiPneusConsertosPNEU: TStringField;
    qryPneusChassiPneusConsertosUSUARIOCAD: TStringField;
    qryPneusChassiPneusConsertosUSUARIOALT: TStringField;
    dsPneusChassiPneusConsertos: TDataSource;
    qryPneusChassiPosicoesHist: TFDQuery;
    qryPneusChassiPosicoesHistCODIGO: TFDAutoIncField;
    qryPneusChassiPosicoesHistCODEMPRESA: TStringField;
    qryPneusChassiPosicoesHistCODCHASSI: TIntegerField;
    qryPneusChassiPosicoesHistPOSICAO: TStringField;
    qryPneusChassiPosicoesHistCODPNEU: TStringField;
    qryPneusChassiPosicoesHistID: TIntegerField;
    qryPneusChassiPosicoesHistOPERACAO: TStringField;
    qryPneusChassiPosicoesHistDATA: TDateTimeField;
    qryPneusChassiPosicoesHistRODAGEM: TIntegerField;
    qryPneusChassiPosicoesHistCUSTO: TBCDField;
    qryPneusChassiPosicoesHistCUSTOKM: TFMTBCDField;
    qryPneusChassiPosicoesHistTIPO: TStringField;
    qryPneusChassiPosicoesHistDESCEQUIPAMENTO: TStringField;
    qryPneusChassiPosicoesHistPERIODO: TStringField;
    dsPneusChassiPosicoesHist: TDataSource;
    qryPneusChassiCusto: TFDQuery;
    qryPneusChassiCustoCODEQUIPAMENTO: TStringField;
    qryPneusChassiCustoDESCEQUIPAMENTO: TStringField;
    qryPneusChassiCustoID: TIntegerField;
    qryPneusChassiCustoPOSICAO: TStringField;
    qryPneusChassiCustoMAXRODAGEM: TIntegerField;
    qryPneusChassiCustoMAXCUSTO: TBCDField;
    qryPneusChassiCustoMAXCUSTOKM: TFMTBCDField;
    qryPneusChassiCustoPERIODO: TStringField;
    qryPneusChassiCustoFILTRO: TStringField;
    dsPneusChassiCusto: TDataSource;
    qryPneusChassiIDCusto: TFDQuery;
    qryPneusChassiIDCustoID: TIntegerField;
    qryPneusChassiIDCustoMAXRODAGEM: TIntegerField;
    qryPneusChassiIDCustoMAXCUSTO: TBCDField;
    qryPneusChassiIDCustoMAXCUSTOKM: TFMTBCDField;
    qryPneusChassiIDCustoPOSICAO: TStringField;
    qryPneusChassiIDCustoCODEQUIPAMENTO: TStringField;
    qryPneusChassiIDCustoDESCEQUIPAMENTO: TStringField;
    qryPneusChassiIDCustoPERIODO: TStringField;
    dsPneusChassiIDCusto: TDataSource;
    qryRotaConsCODORDEMSERVICO: TIntegerField;
    qryRotaConsC_PROXINSP: TDateTimeField;
    qryOrdemServicoEquipeMObraMovim: TFDQuery;
    qryOrdemServicoEquipeMObraMovimCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeMObraMovimCODEMPRESA: TStringField;
    qryOrdemServicoEquipeMObraMovimCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeMObraMovimCODEQUIPE: TIntegerField;
    qryOrdemServicoEquipeMObraMovimCODCARGO: TStringField;
    qryOrdemServicoEquipeMObraMovimMATRICULA: TStringField;
    qryOrdemServicoEquipeMObraMovimNOME: TStringField;
    qryOrdemServicoEquipeMObraMovimENTRADA: TDateTimeField;
    qryOrdemServicoEquipeMObraMovimSAIDA: TDateTimeField;
    qryOrdemServicoEquipeMObraMovimEQUIPE: TStringField;
    dsOrdemServicoMObraMovim: TDataSource;
    qryOrdemServicoCustoSec: TFDQuery;
    qryOrdemServicoCustoSecCUSTOTOTALSEC: TFMTBCDField;
    dsOrdemServicoCustoSec: TDataSource;
    qryOrdemServicoEquipeLubrificantes: TFDQuery;
    qryOrdemServicoEquipeLubrificantesCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeLubrificantesCODEMPRESA: TStringField;
    qryOrdemServicoEquipeLubrificantesCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeLubrificantesCODLUBRIFICANTE: TStringField;
    qryOrdemServicoEquipeLubrificantesQTDESOLIC: TBCDField;
    qryOrdemServicoEquipeLubrificantesENTRADA: TDateTimeField;
    qryOrdemServicoEquipeLubrificantesLUBRIFICANTE: TStringField;
    qryOrdemServicoEquipeLubrificantesESTOQUE: TBCDField;
    dsOrdemServicoEquipeLubrificantes: TDataSource;
    qryOrdemServicoEquipeLubrificantesUtil: TFDQuery;
    qryOrdemServicoEquipeLubrificantesUtilCODIGO: TFDAutoIncField;
    qryOrdemServicoEquipeLubrificantesUtilCODEMPRESA: TStringField;
    qryOrdemServicoEquipeLubrificantesUtilCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoEquipeLubrificantesUtilCODLUBRIFICANTE: TStringField;
    qryOrdemServicoEquipeLubrificantesUtilQTDESOLIC: TBCDField;
    qryOrdemServicoEquipeLubrificantesUtilENTRADA: TDateTimeField;
    qryOrdemServicoEquipeLubrificantesUtilLUBRIFICANTE: TStringField;
    qryOrdemServicoEquipeLubrificantesUtilESTOQUE: TBCDField;
    qryOrdemServicoEquipeLubrificantesUtilPRECO: TBCDField;
    dsOrdemServicoEquipeLubrificantesUtil: TDataSource;
    qryOrdemServicoEquipeImagens: TFDQuery;
    FDAutoIncField5: TFDAutoIncField;
    StringField83: TStringField;
    StringField84: TStringField;
    StringField85: TStringField;
    StringField86: TStringField;
    StringField87: TStringField;
    StringField88: TStringField;
    BlobField5: TBlobField;
    dsOrdemServicoEquipeImagens: TDataSource;
    qryRotaConsSeq: TFDQuery;
    dsRotaConsSeq: TDataSource;
    qryRotaConsSeqManut: TFDQuery;
    dsRotaConsSeqManut: TDataSource;
    qryRotaConsSeqManutItens: TFDQuery;
    dsRotaConsSeqManutItens: TDataSource;
    qryRotaConsSeqManutItensEsp: TFDQuery;
    dsRotaConsSeqManutItensEsp: TDataSource;
    qryRotaConsSeqManutItensCODIGO: TIntegerField;
    qryRotaConsSeqManutItensCODEMPRESA: TStringField;
    qryRotaConsSeqManutItensCODMANUTPROGFAMEQUIP: TStringField;
    qryRotaConsSeqManutItensCODPARTE: TIntegerField;
    qryRotaConsSeqManutItensITEM: TStringField;
    qryRotaConsSeqManutItensDESCINSPECAO: TStringField;
    qryRotaConsSeqManutItensEQUIPPARADO: TStringField;
    qryRotaConsSeqManutItensTEMPO: TBCDField;
    qryRotaConsSeqManutItensEXECAUTONOMO: TStringField;
    qryRotaConsSeqManutItensPARTE: TStringField;
    qryRotaConsSeqManutItensEspCODIGO: TFDAutoIncField;
    qryRotaConsSeqManutItensEspCODEMPRESA: TStringField;
    qryRotaConsSeqManutItensEspCODMANUTPROGEQUIP: TStringField;
    qryRotaConsSeqManutItensEspCODPARTE: TIntegerField;
    qryRotaConsSeqManutItensEspITEM: TStringField;
    qryRotaConsSeqManutItensEspDESCINSPECAO: TStringField;
    qryRotaConsSeqManutItensEspEQUIPPARADO: TStringField;
    qryRotaConsSeqManutItensEspTEMPO: TBCDField;
    qryRotaConsSeqManutItensEspEXECAUTONOMO: TStringField;
    qryRotaConsSeqManutItensEspEXECUTADO: TStringField;
    qryRotaConsSeqManutItensEspBOM: TStringField;
    qryRotaConsSeqManutItensEspREGULAR: TStringField;
    qryRotaConsSeqManutItensEspRUIM: TStringField;
    qryRotaConsSeqManutItensEspPARTE: TStringField;
    qryRotaConsSeqCODIGO: TFDAutoIncField;
    qryRotaConsSeqCODEMPRESA: TStringField;
    qryRotaConsSeqCODROTA: TStringField;
    qryRotaConsSeqCODAREA: TStringField;
    qryRotaConsSeqCODCELULA: TStringField;
    qryRotaConsSeqCODLINHA: TStringField;
    qryRotaConsSeqSEQUENCIA: TIntegerField;
    qryRotaConsSeqCODFAMILIAEQUIP: TStringField;
    qryRotaConsSeqAREA: TStringField;
    qryRotaConsSeqCELULA: TStringField;
    qryRotaConsSeqLINHA: TStringField;
    qryRotaConsSeqFAMILIAEQUIP: TStringField;
    qryRotaConsSeqCODEQUIPATUAL: TStringField;
    qryRotaConsSeqEQUIPATUAL: TStringField;
    qryRotaConsSeqFREQUENCIA: TSmallintField;
    qryRotaConsSeqSEQEQUIPATUAL: TIntegerField;
    qryCalendarioOSProgramadasCODIGO: TFDAutoIncField;
    qryCalendarioOSProgramadasCODEMPRESA: TStringField;
    qryCalendarioOSProgramadasDESCRICAO: TStringField;
    qryCalendarioOSProgramadasDATAPROGINI: TDateTimeField;
    qryCalendarioOSProgramadasTEMPOPREVISTO: TBCDField;
    qryCalendarioOSProgramadasTEMPOHOMEMHORA: TBCDField;
    qryOrdemServicoGerenciaDATAFIMREAL: TDateTimeField;
    qryManutPeriodicasCODIGO: TStringField;
    qryOrdemServicoGerenciaCODMANUTPROGEQUIP: TStringField;
    qryOrdemServicoGerenciaCODLUBRIFICPROGEQUIP: TStringField;
    qryCalendarioOSProgramadasMObra: TFDQuery;
    FDAutoIncField7: TFDAutoIncField;
    StringField68: TStringField;
    IntegerField12: TIntegerField;
    StringField69: TStringField;
    StringField70: TStringField;
    BCDField4: TBCDField;
    StringField71: TStringField;
    StringField72: TStringField;
    StringField73: TStringField;
    StringField74: TStringField;
    dsCalendarioOSProgramadasMObra: TDataSource;
    qryCalendarioOSExecucao: TFDQuery;
    qryCalendarioOSExecucaoCODIGO: TFDAutoIncField;
    qryCalendarioOSExecucaoDESCRICAO: TStringField;
    qryCalendarioOSExecucaoDATAINICIOREAL: TDateTimeField;
    qryCalendarioOSExecucaoTEMPOPREVISTO: TBCDField;
    qryCalendarioOSExecucaoTEMPOHOMEMHORA: TBCDField;
    dsCalendarioOSExecucao: TDataSource;
    qryCalendarioOSExecucaoMObra: TFDQuery;
    FDAutoIncField8: TFDAutoIncField;
    StringField75: TStringField;
    IntegerField14: TIntegerField;
    StringField76: TStringField;
    StringField77: TStringField;
    BCDField5: TBCDField;
    StringField78: TStringField;
    StringField79: TStringField;
    StringField80: TStringField;
    StringField81: TStringField;
    dsCalendarioOSExecucaoMObra: TDataSource;
    qryCalendarioOSProgramadasCODEQUIPAMENTO: TStringField;
    qryCalendarioOSProgramadasDESCEQUIPAMENTO: TStringField;
    qryCalendarioOSExecucaoCODEMPRESA: TStringField;
    qryCalendarioOSExecucaoCODEQUIPAMENTO: TStringField;
    qryCalendarioOSExecucaoDESCEQUIPAMENTO: TStringField;
    qryFuncionariosTipoManutHistMANUTENCAO: TStringField;
    qryTipoManutencaoATIVO: TStringField;
    qryTipoManutencaoVISIVEL: TStringField;
    dsOrdemServicoLocalizaMObraOSProg: TDataSource;
    qryOrdemServicoLocalizaMObraOSProg: TFDQuery;
    qryOrdemServicoLocalizaMObraOSProgCODIGO: TFDAutoIncField;
    qryOrdemServicoLocalizaMObraOSProgCODEMPRESA: TStringField;
    qryOrdemServicoLocalizaMObraOSProgDESCRICAO: TStringField;
    qryOrdemServicoLocalizaMObraOSProgSOLICTRAB: TStringField;
    qryOrdemServicoLocalizaMObraOSProgPROGMANUAL: TStringField;
    qryOrdemServicoLocalizaMObraOSProgROTAEQUIP: TStringField;
    qryOrdemServicoLocalizaMObraOSProgCODMANUTPROGEQUIP: TStringField;
    qryOrdemServicoLocalizaMObraOSProgCODLUBRIFICPROGEQUIP: TStringField;
    qryOrdemServicoLocalizaMObraOSProgSOLICITANTE: TStringField;
    qryOrdemServicoLocalizaMObraOSProgSITUACAO: TStringField;
    qryOrdemServicoLocalizaMObraOSProgDATACADASTRO: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSProgDATAPROGINI: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSProgDATAINICIOREAL: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSProgDATAFIMREAL: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSProgDATAFECHAMENTO: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSProgTEMPOPREVISTO: TBCDField;
    qryOrdemServicoLocalizaMObraOSProgTEMPOEXECUTADO: TBCDField;
    qryOrdemServicoLocalizaMObraOSProgCODEQUIPAMENTO: TStringField;
    qryOrdemServicoLocalizaMObraOSProgDESCEQUIPAMENTO: TStringField;
    qryOrdemServicoLocalizaMObraOSProgCENTROCUSTO: TStringField;
    qryOrdemServicoLocalizaMObraOSProgMATRICULA: TStringField;
    qryOrdemServicoGerenciaCENTROCUSTO: TStringField;
    qryOrdemServicoGerenciaTEMPOEXECUTADO: TBCDField;
    qryCalendarioOSExecucaoMObraCODEQUIPE: TStringField;
    qryCalendarioOSProgramadasMObraCODEQUIPE: TStringField;
    qryFuncionariosTipoManutHistCODMANUTENCAO: TStringField;
    qryFuncionariosTipoManutHistSUMTOTALHOMEMHORA: TAggregateField;
    qryFuncionariosHistServicosCODIGO: TFDAutoIncField;
    qryFuncionariosHistServicosSERVICO: TStringField;
    qryFuncionariosHistServicosCODEQUIPAMENTO: TStringField;
    qryFuncionariosHistServicosDESCEQUIPAMENTO: TStringField;
    qryOrdemServicoEquipeMObraUtilOCUPADO: TStringField;
    qryOrdemServicoMObraProgOCUPADO: TStringField;
    qryOrdemServicoMObraProgPROGRAMADO: TStringField;
    qryTotalHomemHoraCODCELULA: TStringField;
    qryTotalHomemHoraDESCCELULA: TStringField;
    qryTotalHomemHoraTIPOCELULA: TStringField;
    qryCalendarioOSProgramadasMATRICULA: TStringField;
    qryCalendarioOSProgramadasNOME: TStringField;
    qryCalendarioOSProgramadasTIPOCELULA: TStringField;
    qryCalendarioOSExecucaoDATAPROGINI: TDateTimeField;
    qryCalendarioOSExecucaoMATRICULA: TStringField;
    qryCalendarioOSExecucaoNOME: TStringField;
    qryCalendarioOSExecucaoTIPOCELULA: TStringField;
    qryFuncionariosHistAREA: TStringField;
    qryFuncionariosHistCELULA: TStringField;
    qryFuncionariosHistTIPOCELULA: TStringField;
    qryFuncionariosHistPERIODOCONSULTA: TStringField;
    FDMemTRelatGerencMTBF: TFDMemTable;
    FDMemTRelatGerencMTBFCODIGO: TStringField;
    FDMemTRelatGerencMTBFDESCRICAO: TStringField;
    FDMemTRelatGerencMTBFVALOR: TFloatField;
    FDMemTRelatGerencMTBFDATA1: TStringField;
    FDMemTRelatGerencMTBFDATA2: TStringField;
    FDMemTRelatGerencMTTR: TFDMemTable;
    FDMemTRelatGerencMTTRCODIGO: TStringField;
    FDMemTRelatGerencMTTRDESCRICAO: TStringField;
    FDMemTRelatGerencMTTRVALOR: TStringField;
    FDMemTRelatGerencMTTRDATA1: TStringField;
    FDMemTRelatGerencMTTRDATA2: TStringField;
    FDMemTRelatGerencBacklog: TFDMemTable;
    FDMemTRelatGerencBacklogCODIGO: TStringField;
    FDMemTRelatGerencBacklogDESCRICAO: TStringField;
    FDMemTRelatGerencBacklogVALOR: TStringField;
    FDMemTRelatGerencBacklogDATA1: TStringField;
    FDMemTRelatGerencBacklogDATA2: TStringField;
    FDMemTCustoMesPneus: TFDMemTable;
    FDMemTCustoMesPneusCODIGO: TStringField;
    FDMemTCustoMesPneusDESCRICAO: TStringField;
    FDMemTCustoMesPneusVALOR: TStringField;
    FDMemTCustoMesPneusDATA1: TStringField;
    FDMemTCustoMesPneusDATA2: TStringField;
    qryProgramadasExecucao: TFDQuery;
    dsProgramadasExecucao: TDataSource;
    qryProgramadasExecucaoCODIGO: TIntegerField;
    qryProgramadasExecucaoCODEMPRESA: TStringField;
    qryProgramadasExecucaoDESCRICAO: TStringField;
    qryProgramadasExecucaoTEMPOPREVISTO: TBCDField;
    qryProgramadasExecucaoTEMPOHOMEMHORA: TBCDField;
    qryProgramadasExecucaoSITUACAO: TStringField;
    qryProgramadasExecucaoCODEQUIPAMENTO: TStringField;
    qryProgramadasExecucaoDESCEQUIPAMENTO: TStringField;
    qryProgramadasExecucaoTIPOCELULA: TStringField;
    qryProgramadasExecucaoDATAPROGINI: TStringField;
    qryProgramadasExecucaoDATAINICIOREAL: TStringField;
    qryProgramadasExecucaoMObra: TFDQuery;
    FDAutoIncField9: TFDAutoIncField;
    StringField82: TStringField;
    StringField89: TStringField;
    IntegerField9: TIntegerField;
    StringField90: TStringField;
    StringField91: TStringField;
    BCDField6: TBCDField;
    StringField92: TStringField;
    StringField93: TStringField;
    StringField94: TStringField;
    StringField95: TStringField;
    dsProgramadasExecucaoMObora: TDataSource;
    qryProgramadasExecucaoDATAHORAPROGINI: TDateTimeField;
    qryProgramadasExecucaoDATAHORAINICIOREAL: TDateTimeField;
    qryOrdemServicoGerenciaRelatMObraProg: TFDQuery;
    dsOrdemServicoGerenciaRelatMObraProg: TDataSource;
    qryOrdemServicoGerenciaRelatMObraUtil: TFDQuery;
    dsOrdemServicoGerenciaRelatMObraUtil: TDataSource;
    qryOrdemServicoGerenciaRelatManut: TFDQuery;
    dsOrdemServicoGerenciaRelatManut: TDataSource;
    qryOrdemServicoGerenciaRelatLubrific: TFDQuery;
    dsOrdemServicoGerenciaRelatLubrific: TDataSource;
    qryOficinasATIVO: TStringField;
    qryOficinasVISIVEL: TStringField;
    qryFuncionariosHistServicosTOTALHOMEMHORA: TBCDField;
    qryOrdemServicoJUSTIFICATIVA: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoGerenciaRelatMObraProgCALENDARIO: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgCARGO: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgMATRICULA: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgNOME: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgTOTALHOMEMHORA: TBCDField;
    qryOrdemServicoGerenciaRelatMObraUtilCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoGerenciaRelatMObraUtilCALENDARIO: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilCARGO: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilMATRICULA: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilNOME: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilTOTALHOMEMHORA: TBCDField;
    qryOrdemServicoGerenciaRelatMObraProgCODEQUIPE: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilCODEQUIPE: TStringField;
    qryOrdemServicoGerenciaRelatManutCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoGerenciaRelatManutCODIGO: TStringField;
    qryOrdemServicoGerenciaRelatManutDESCRICAO: TStringField;
    qryOrdemServicoGerenciaRelatManutFREQUENCIA1: TSmallintField;
    qryOrdemServicoGerenciaRelatManutDTAINICIO1: TDateTimeField;
    qryOrdemServicoGerenciaRelatManutREPROGRAMAR1: TStringField;
    qryOrdemServicoGerenciaRelatLubrificCODORDEMSERVICO: TIntegerField;
    qryOrdemServicoGerenciaRelatLubrificCODIGO: TStringField;
    qryOrdemServicoGerenciaRelatLubrificDESCRICAO: TStringField;
    qryOrdemServicoGerenciaRelatLubrificFREQUENCIA1: TSmallintField;
    qryOrdemServicoGerenciaRelatLubrificDTAINICIO1: TDateTimeField;
    qryOrdemServicoGerenciaRelatLubrificREPROGRAMAR1: TStringField;
    qryOrdemServicoGerenciaRelatManutDATACADASTRO: TDateTimeField;
    qryOrdemServicoGerenciaRelatLubrificDATACADASTRO: TDateTimeField;
    qryOrdemServicoGerenciaRelatManutSITUACAO: TStringField;
    qryOrdemServicoGerenciaRelatLubrificSITUACAO: TStringField;
    qryOrdemServicoGerenciaRelatManutCODFAMEQUIP: TStringField;
    qryOrdemServicoGerenciaRelatManutCODOFICINA: TStringField;
    qryOrdemServicoGerenciaRelatManutCODMANUTENCAO: TStringField;
    qryOrdemServicoGerenciaRelatLubrificCODFAMEQUIP: TStringField;
    qryOrdemServicoGerenciaRelatLubrificCODOFICINA: TStringField;
    qryOrdemServicoGerenciaRelatLubrificCODMANUTENCAO: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgSITUACAO: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgCODFAMEQUIP: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgCODOFICINA: TStringField;
    qryOrdemServicoGerenciaRelatMObraProgCODMANUTENCAO: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilSITUACAO: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilCODFAMEQUIP: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilCODOFICINA: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilCODMANUTENCAO: TStringField;
    qryOrdemServicoGerenciaRelatMObraUtilDATACADASTRO: TDateTimeField;
    qryOrdemServicoGerenciaRelatMObraProgDATACADASTRO: TDateTimeField;
    dsOrdemServicoLocalizaMObraOSExec: TDataSource;
    qryProgramadasExecucaoMObraCELULA: TStringField;
    qryProgramadasExecucaoMObraTIPOCELULA: TStringField;
    qryAltCodEquip: TFDQuery;
    qryGerarOSCODCENTROCUSTO: TStringField;
    qryMonitMedicoesContCODCENTROCUSTO: TStringField;
    qryMonitMedicoesPtosInspCODCENTROCUSTO: TStringField;
    qryManutPeriodicasCODCENTROCUSTO: TStringField;
    qryLubrificPeriodicasCODCENTROCUSTO: TStringField;
    qryRotaPeriodicasManutCODCENTROCUSTO: TStringField;
    qryManutConsCODCENTROCUSTO: TStringField;
    qryLubrificConsCODCENTROCUSTO: TStringField;
    qryManutProgEquipCODCENTROCUSTO: TStringField;
    qryLubrificProgEquipCODCENTROCUSTO: TStringField;
    qryEquipamentosConfCODCENTROCUSTO: TStringField;
    qrySolicitacaoTrabCODCENTROCUSTO: TStringField;
    qryGerarOSOBSERVACOES: TBlobField;
    qryOSGerenciaRelatObservacoes: TFDQuery;
    FDAutoIncField6: TFDAutoIncField;
    BlobField1: TBlobField;
    dsqryOSGerenciaRelatObservacoes: TDataSource;
    qryOrdemServicoHistoricoOBSERVACOES: TBlobField;
    qryOrdemServicoGerenciaRelatMObraProgOS: TFDQuery;
    IntegerField13: TIntegerField;
    StringField103: TStringField;
    StringField104: TStringField;
    StringField105: TStringField;
    StringField106: TStringField;
    StringField107: TStringField;
    BCDField3: TBCDField;
    StringField108: TStringField;
    StringField109: TStringField;
    StringField110: TStringField;
    StringField111: TStringField;
    DateTimeField15: TDateTimeField;
    dsOrdemServicoGerenciaRelatMObraProgOS: TDataSource;
    qryOrdemServicoGerenciaRelatMObraUtilOS: TFDQuery;
    IntegerField15: TIntegerField;
    StringField112: TStringField;
    StringField113: TStringField;
    StringField114: TStringField;
    StringField115: TStringField;
    StringField116: TStringField;
    BCDField7: TBCDField;
    StringField117: TStringField;
    StringField118: TStringField;
    StringField119: TStringField;
    StringField120: TStringField;
    DateTimeField16: TDateTimeField;
    dsOrdemServicoGerenciaRelatMObraUtilOS: TDataSource;
    qryOrdemServicoMObraDispHHPROG: TFMTBCDField;
    qryManutProgEquipC_REIMPRESSAO: TStringField;
    qryLubrificProgEquipC_REIMPRESSAO: TStringField;
    FDMTOrdemServicoGerenciaRelat: TFDMemTable;
    qryClonarManut: TFDQuery;
    dsClonarManut: TDataSource;
    qryClonarManutCODMANUTPROGFAMEQUIP: TStringField;
    qryClonarManutDESCRICAO: TStringField;
    qryClonarManutCRITICIDADE: TStringField;
    qryClonarManutFREQUENCIA1: TSmallintField;
    qryClonarManutREPROGRAMAR1: TStringField;
    qryManutProgEquipFAMEQUIPAMENTO: TStringField;
    qryClonarManutGRUPOINSP: TStringField;
    qryAuxiliar2: TFDQuery;
    qryClonarLubrific: TFDQuery;
    dsClonarLubrific: TDataSource;
    qryClonarLubrificCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryClonarLubrificDESCRICAO: TStringField;
    qryClonarLubrificCRITICIDADE: TStringField;
    qryClonarLubrificFREQUENCIA1: TSmallintField;
    qryClonarLubrificREPROGRAMAR1: TStringField;
    qryClonarLubrificGRUPOINSP: TStringField;
    qryOrdemServicoGerenciaOBSERVACOES: TBlobField;
    qryOrdemServicoLocalizaMObraOSExec: TFDQuery;
    qryOrdemServicoLocalizaMObraOSExecCODIGO: TIntegerField;
    qryOrdemServicoLocalizaMObraOSExecCODEMPRESA: TStringField;
    qryOrdemServicoLocalizaMObraOSExecDESCRICAO: TStringField;
    qryOrdemServicoLocalizaMObraOSExecSOLICTRAB: TStringField;
    qryOrdemServicoLocalizaMObraOSExecPROGMANUAL: TStringField;
    qryOrdemServicoLocalizaMObraOSExecROTAEQUIP: TStringField;
    qryOrdemServicoLocalizaMObraOSExecCODMANUTPROGEQUIP: TStringField;
    qryOrdemServicoLocalizaMObraOSExecCODLUBRIFICPROGEQUIP: TStringField;
    qryOrdemServicoLocalizaMObraOSExecSOLICITANTE: TStringField;
    qryOrdemServicoLocalizaMObraOSExecSITUACAO: TStringField;
    qryOrdemServicoLocalizaMObraOSExecDATACADASTRO: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSExecDATAPROGINI: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSExecDATAINICIOREAL: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSExecDATAFIMREAL: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSExecDATAFECHAMENTO: TDateTimeField;
    qryOrdemServicoLocalizaMObraOSExecTEMPOPREVISTO: TBCDField;
    qryOrdemServicoLocalizaMObraOSExecTEMPOEXECUTADO: TBCDField;
    qryOrdemServicoLocalizaMObraOSExecCODEQUIPAMENTO: TStringField;
    qryOrdemServicoLocalizaMObraOSExecDESCEQUIPAMENTO: TStringField;
    qryOrdemServicoLocalizaMObraOSExecCENTROCUSTO: TStringField;
    qryOrdemServicoLocalizaMObraOSExecMATRICULA: TStringField;
    ImgListNewButtons: TImageList;
    qryOrdemServicoGerenciaEQUIPPARADO: TStringField;
    qryManutPeriodicasHistCRITICIDADE: TStringField;
    qryManutPeriodicasHistFREQUENCIA2: TIntegerField;
    qryManutPeriodicasHistREPROGRAMAR2: TStringField;
    qryManutPeriodicasHistDESCMANUTPROGFAMEQUIP: TStringField;
    qryManutPeriodicasHistC_PROXINSP: TDateTimeField;
    qryManutPeriodicasHistC_REIMPRESSAO: TStringField;
    qryManutPeriodicasHistDTAINICIO1: TDateTimeField;
    qryManutPeriodicasHistFREQUENCIA1: TSmallintField;
    qryManutProgEquiptempototal: TFMTBCDField;
    qryLubrificProgEquiptempototal: TFMTBCDField;
    qryChecklistManut: TFDQuery;
    dsChecklistManut: TDataSource;
    qryChecklistManutPartes: TFDQuery;
    FDAutoIncField10: TFDAutoIncField;
    StringField130: TStringField;
    StringField131: TStringField;
    StringField132: TStringField;
    StringField133: TStringField;
    dsChecklistManutPartes: TDataSource;
    qryChecklistManutItens: TFDQuery;
    IntegerField18: TIntegerField;
    StringField134: TStringField;
    StringField135: TStringField;
    IntegerField19: TIntegerField;
    StringField136: TStringField;
    StringField137: TStringField;
    StringField138: TStringField;
    BCDField8: TBCDField;
    StringField139: TStringField;
    StringField140: TStringField;
    dsChecklistManutItens: TDataSource;
    qryChecklistManutItensEsp: TFDQuery;
    FDAutoIncField11: TFDAutoIncField;
    StringField141: TStringField;
    StringField142: TStringField;
    IntegerField20: TIntegerField;
    StringField143: TStringField;
    StringField144: TStringField;
    StringField145: TStringField;
    BCDField9: TBCDField;
    StringField146: TStringField;
    StringField147: TStringField;
    StringField148: TStringField;
    StringField149: TStringField;
    StringField150: TStringField;
    StringField151: TStringField;
    dsChecklistManutItensEsp: TDataSource;
    qryChecklistManutPlanoTrab: TFDQuery;
    FDAutoIncField12: TFDAutoIncField;
    StringField152: TStringField;
    StringField153: TStringField;
    StringField154: TStringField;
    StringField155: TStringField;
    BlobField3: TBlobField;
    dsChecklistManutPlanoTrab: TDataSource;
    qryChecklistManutCODIGO: TStringField;
    qryChecklistManutCODEMPRESA: TStringField;
    qryChecklistManutCODEQUIPAMENTO: TStringField;
    qryChecklistManutCODMANUTPROGFAMEQUIP: TStringField;
    qryChecklistManutCODMONITORAMENTO: TIntegerField;
    qryChecklistManutMATRICULA: TStringField;
    qryChecklistManutDESCRICAO: TStringField;
    qryChecklistManutCRITICIDADE: TStringField;
    qryChecklistManutFREQUENCIA1: TSmallintField;
    qryChecklistManutDTAINICIO1: TDateTimeField;
    qryChecklistManutREPROGRAMAR1: TStringField;
    qryChecklistManutFREQUENCIA2: TIntegerField;
    qryChecklistManutREPROGRAMAR2: TStringField;
    qryChecklistManutLEITURA: TIntegerField;
    qryChecklistManutRELATORIO: TStringField;
    qryChecklistManutGRUPOINSP: TStringField;
    qryChecklistManutDESCMANUTPROGFAMEQUIP: TStringField;
    qryChecklistManutPROGRAMACAO2: TStringField;
    qryChecklistManutEQUIPAMENTO: TStringField;
    qryChecklistManutCODCENTROCUSTO: TStringField;
    qryChecklistManutFAMEQUIPAMENTO: TStringField;
    qryChecklistManutRESPONSAVEL: TStringField;
    qryChecklistManutPROXINSP: TDateTimeField;
    qryChecklistManutREMIPRESSAO: TStringField;
    qryChecklistManutCODORDEMSERVICO: TIntegerField;
    qryChecklistLubrific: TFDQuery;
    dsChecklistLubrific: TDataSource;
    qryChecklistLubrificPartes: TFDQuery;
    FDAutoIncField13: TFDAutoIncField;
    StringField129: TStringField;
    StringField156: TStringField;
    StringField157: TStringField;
    StringField158: TStringField;
    dsChecklistLubrificPartes: TDataSource;
    qryChecklistLubrificItens: TFDQuery;
    IntegerField21: TIntegerField;
    StringField159: TStringField;
    StringField160: TStringField;
    IntegerField22: TIntegerField;
    StringField161: TStringField;
    StringField162: TStringField;
    StringField163: TStringField;
    BCDField10: TBCDField;
    StringField164: TStringField;
    StringField165: TStringField;
    dsChecklistLubrificItens: TDataSource;
    qryChecklistLubrificItensEsp: TFDQuery;
    FDAutoIncField14: TFDAutoIncField;
    StringField166: TStringField;
    StringField167: TStringField;
    IntegerField23: TIntegerField;
    StringField168: TStringField;
    StringField169: TStringField;
    StringField170: TStringField;
    BCDField11: TBCDField;
    StringField171: TStringField;
    StringField172: TStringField;
    StringField173: TStringField;
    StringField174: TStringField;
    StringField175: TStringField;
    StringField176: TStringField;
    dsChecklistLubrificItensEsp: TDataSource;
    qryChecklistLubrificPlanoTrab: TFDQuery;
    FDAutoIncField15: TFDAutoIncField;
    StringField177: TStringField;
    StringField178: TStringField;
    StringField179: TStringField;
    StringField180: TStringField;
    BlobField4: TBlobField;
    dsChecklistLubrificPlanoTrab: TDataSource;
    qryChecklistLubrificCODIGO: TStringField;
    qryChecklistLubrificCODEMPRESA: TStringField;
    qryChecklistLubrificCODEQUIPAMENTO: TStringField;
    qryChecklistLubrificCODLUBRIFICPROGFAMEQUIP: TStringField;
    qryChecklistLubrificCODMONITORAMENTO: TIntegerField;
    qryChecklistLubrificCODORDEMSERVICO: TIntegerField;
    qryChecklistLubrificMATRICULA: TStringField;
    qryChecklistLubrificDESCRICAO: TStringField;
    qryChecklistLubrificCRITICIDADE: TStringField;
    qryChecklistLubrificFREQUENCIA1: TSmallintField;
    qryChecklistLubrificDTAINICIO1: TDateTimeField;
    qryChecklistLubrificREPROGRAMAR1: TStringField;
    qryChecklistLubrificFREQUENCIA2: TIntegerField;
    qryChecklistLubrificREPROGRAMAR2: TStringField;
    qryChecklistLubrificLEITURA: TIntegerField;
    qryChecklistLubrificRELATORIO: TStringField;
    qryChecklistLubrificGRUPOINSP: TStringField;
    qryChecklistLubrificDESCLUBRIFICPROGFAMEQUIP: TStringField;
    qryChecklistLubrificPROGRAMACAO2: TStringField;
    qryChecklistLubrificEQUIPAMENTO: TStringField;
    qryChecklistLubrificCODCENTROCUSTO: TStringField;
    qryChecklistLubrificFAMEQUIPAMENTO: TStringField;
    qryChecklistLubrificRESPONSAVEL: TStringField;
    qryChecklistLubrificPROXINSP: TDateTimeField;
    qryChecklistLubrificREMIPRESSAO: TStringField;
    CDEquipamentoHist: TClientDataSet;
    CDEquipamentoHistCODIGO: TStringField;
    CDEquipamentoHistDESCRICAO: TStringField;
    CDEquipamentoHistNUMPARADAS: TStringField;
    CDEquipamentoHistHORASPARADAS: TStringField;
    CDEquipamentoHistCUSTOTERCEIROS: TStringField;
    CDEquipamentoHistCUSTOALTERACOES: TStringField;
    CDEquipamentoHistCUSTOEQUIPAMENTO: TStringField;
    CDEquipamentoHistCUSTOTOTAL: TStringField;
    CDEquipamentoHistDATACONSULTAINI: TStringField;
    CDEquipamentoHistDATACONSULTAFIN: TStringField;
    qryClonarManutDTAINICIO1: TDateTimeField;
    qryClonarLubrificDTAINICIO1: TDateTimeField;
    qryManutProgFamEquipCLONAVEL: TStringField;
    qryLubrificProgFamEquipCLONAVEL: TStringField;
    qryLubrificProgFamEquipCODOFICINA: TStringField;
    qryManutProgFamEquipCODOFICINA: TStringField;
    qryManutProgEquipCODOFICINA: TStringField;
    qryLubrificProgEquipCODOFICINA: TStringField;
    qryManutConsCODOFICINA: TStringField;
    qryLubrificProgFamEquipOFICINA: TStringField;
    qryManutProgFamEquipOFICINA: TStringField;
    qryManutProgFamEquipFREQUENCIA: TSmallintField;
    qryLubrificProgFamEquipFREQUENCIA: TSmallintField;
    qrySolicitacaoTrabOFICINA: TStringField;
    qryLubrificConsCODOFICINA: TStringField;
    qryManutVencCODOFICINA: TStringField;
    qryLubrificVencCODOFICINA: TStringField;
    qryMonitMedicoesContManutCODOFICINA: TStringField;
    qryManutProgFamEquipCODMANUTENCAO: TStringField;
    qryManutProgFamEquipMANUTENCAO: TStringField;
    qryLubrificProgFamEquipCODMANUTENCAO: TStringField;
    qryLubrificProgFamEquipMANUTENCAO: TStringField;
    qryLubrificProgEquipCODMANUTENCAO: TStringField;
    qryManutProgEquipCODMANUTENCAO: TStringField;
    qryManutConsCODMANUTENCAO: TStringField;
    qryLubrificConsCODMANUTENCAO: TStringField;
    qryGerarOSCODOFICINA: TStringField;
    qryGerarOSCODMANUTENCAO: TStringField;
    qryLubrificProgFamEquipEQUIPPARADO: TStringField;
    qryManutProgFamEquipEQUIPPARADO: TStringField;
    qryManutProgEquipEQUIPPARADO: TStringField;
    qryLubrificProgEquipEQUIPPARADO: TStringField;
    qryManutConsEQUIPPARADO: TStringField;
    qryLubrificConsEQUIPPARADO: TStringField;
    qryAltCodFamilia: TFDQuery;
    qryConfigsversion: TIntegerField;
    qryConfigsautoupdate: TBooleanField;
    qryClonarLubrificMATRICULA: TStringField;
    qryClonarManutMATRICULA: TStringField;
    qryManutProgEquipPecas: TFDQuery;
    dsManutProgEquipPecas: TDataSource;
    qryManutProgEquipRecursos: TFDQuery;
    dsManutProgEquipRecursos: TDataSource;
    qryManutProgEquipPecasCODIGO: TFDAutoIncField;
    qryManutProgEquipPecasCODEMPRESA: TStringField;
    qryManutProgEquipPecasCODMANUTPROGEQUIP: TStringField;
    qryManutProgEquipPecasCODPECAREP: TStringField;
    qryManutProgEquipPecasQUANTIDADE: TIntegerField;
    qryManutProgEquipPecasREFERENCIA: TStringField;
    qryManutProgEquipPecasESTOQUE: TIntegerField;
    qryManutProgEquipPecasPECA: TStringField;
    qryManutProgEquipRecursosCODIGO: TFDAutoIncField;
    qryManutProgEquipRecursosCODEMPRESA: TStringField;
    qryManutProgEquipRecursosCODMANUTPROGEQUIP: TStringField;
    qryManutProgEquipRecursosCODRECURSO: TStringField;
    qryManutProgEquipRecursosQUANTIDADE: TIntegerField;
    qryManutProgEquipRecursosRECURSO: TStringField;
    qryManutProgEquipRecursosESTOQUE: TIntegerField;
    qryLubrificProgEquipPecas: TFDQuery;
    dsLubrificProgEquipPecas: TDataSource;
    qryLubrificProgEquipRecursos: TFDQuery;
    dsLubrificProgEquipRecursos: TDataSource;
    qryLubrificProgEquipRecursosCODIGO: TFDAutoIncField;
    qryLubrificProgEquipRecursosCODEMPRESA: TStringField;
    qryLubrificProgEquipRecursosCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificProgEquipRecursosCODRECURSO: TStringField;
    qryLubrificProgEquipRecursosQUANTIDADE: TIntegerField;
    qryLubrificProgEquipRecursosRECURSO: TStringField;
    qryLubrificProgEquipRecursosESTOQUE: TIntegerField;
    qryLubrificProgEquipPecasCODIGO: TFDAutoIncField;
    qryLubrificProgEquipPecasCODEMPRESA: TStringField;
    qryLubrificProgEquipPecasCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificProgEquipPecasCODPECAREP: TStringField;
    qryLubrificProgEquipPecasQUANTIDADE: TIntegerField;
    qryLubrificProgEquipPecasREFERENCIA: TStringField;
    qryLubrificProgEquipPecasESTOQUE: TIntegerField;
    qryLubrificProgEquipPecasPECA: TStringField;
    qryRotasSequenciaInspFREQUENCIA: TSmallintField;
    qryManutConsPecas: TFDQuery;
    dsManutConsPecas: TDataSource;
    qryManutConsRecursos: TFDQuery;
    dsManutConsRecursos: TDataSource;
    qryLubrificConsPecas: TFDQuery;
    FDAutoIncField18: TFDAutoIncField;
    StringField98: TStringField;
    StringField99: TStringField;
    StringField100: TStringField;
    IntegerField24: TIntegerField;
    StringField101: TStringField;
    IntegerField25: TIntegerField;
    StringField102: TStringField;
    dsLubrificConsPecas: TDataSource;
    qryLubrificConsRecursos: TFDQuery;
    FDAutoIncField19: TFDAutoIncField;
    StringField121: TStringField;
    StringField122: TStringField;
    StringField123: TStringField;
    IntegerField26: TIntegerField;
    StringField124: TStringField;
    IntegerField27: TIntegerField;
    dsLubrificConsRecursos: TDataSource;
    qryManutConsRecursosCODIGO: TFDAutoIncField;
    qryManutConsRecursosCODEMPRESA: TStringField;
    qryManutConsRecursosCODMANUTPROGEQUIP: TStringField;
    qryManutConsRecursosCODRECURSO: TStringField;
    qryManutConsRecursosQUANTIDADE: TIntegerField;
    qryManutConsRecursosRECURSO: TStringField;
    qryManutConsRecursosESTOQUE: TIntegerField;
    qryManutConsPecasCODIGO: TFDAutoIncField;
    qryManutConsPecasCODEMPRESA: TStringField;
    qryManutConsPecasCODMANUTPROGEQUIP: TStringField;
    qryManutConsPecasCODPECAREP: TStringField;
    qryManutConsPecasQUANTIDADE: TIntegerField;
    qryManutConsPecasREFERENCIA: TStringField;
    qryManutConsPecasESTOQUE: TIntegerField;
    qryManutConsPecasPECA: TStringField;
    qryRotaPeriodicasManutPecas: TFDQuery;
    dsRotaPeriodicasManutPecas: TDataSource;
    qryRotaPeriodicasManutRecursos: TFDQuery;
    dsRotaPeriodicasManutRecursos: TDataSource;
    qryRotaPeriodicasManutPecasCODIGO: TFDAutoIncField;
    qryRotaPeriodicasManutPecasCODEMPRESA: TStringField;
    qryRotaPeriodicasManutPecasCODMANUTPROGEQUIP: TStringField;
    qryRotaPeriodicasManutPecasCODPECAREP: TStringField;
    qryRotaPeriodicasManutPecasQUANTIDADE: TIntegerField;
    qryRotaPeriodicasManutPecasREFERENCIA: TStringField;
    qryRotaPeriodicasManutPecasESTOQUE: TIntegerField;
    qryRotaPeriodicasManutPecasPECA: TStringField;
    qryRotaPeriodicasManutRecursosCODIGO: TFDAutoIncField;
    qryRotaPeriodicasManutRecursosCODEMPRESA: TStringField;
    qryRotaPeriodicasManutRecursosCODMANUTPROGEQUIP: TStringField;
    qryRotaPeriodicasManutRecursosCODRECURSO: TStringField;
    qryRotaPeriodicasManutRecursosQUANTIDADE: TIntegerField;
    qryRotaPeriodicasManutRecursosRECURSO: TStringField;
    qryRotaPeriodicasManutRecursosESTOQUE: TIntegerField;
    qryRotaEquipVencSeqManutPecas: TFDQuery;
    dsRotaEquipVencSeqManutPecas: TDataSource;
    qryRotaEquipVencSeqManutRecursos: TFDQuery;
    dsRotaEquipVencSeqManutRecursos: TDataSource;
    qryRotaEquipVencSeqManutPecasCODIGO: TFDAutoIncField;
    qryRotaEquipVencSeqManutPecasCODEMPRESA: TStringField;
    qryRotaEquipVencSeqManutPecasCODMANUTPROGEQUIP: TStringField;
    qryRotaEquipVencSeqManutPecasCODPECAREP: TStringField;
    qryRotaEquipVencSeqManutPecasQUANTIDADE: TIntegerField;
    qryRotaEquipVencSeqManutPecasREFERENCIA: TStringField;
    qryRotaEquipVencSeqManutPecasESTOQUE: TIntegerField;
    qryRotaEquipVencSeqManutPecasPECA: TStringField;
    qryRotaEquipVencSeqManutRecursosCODIGO: TFDAutoIncField;
    qryRotaEquipVencSeqManutRecursosCODEMPRESA: TStringField;
    qryRotaEquipVencSeqManutRecursosCODMANUTPROGEQUIP: TStringField;
    qryRotaEquipVencSeqManutRecursosCODRECURSO: TStringField;
    qryRotaEquipVencSeqManutRecursosQUANTIDADE: TIntegerField;
    qryRotaEquipVencSeqManutRecursosRECURSO: TStringField;
    qryRotaEquipVencSeqManutRecursosESTOQUE: TIntegerField;
    qryRotaConsSeqManutPecas: TFDQuery;
    dsRotaConsSeqManutPecas: TDataSource;
    qryRotaConsSeqManutRecursos: TFDQuery;
    dsRotaConsSeqManutRecursos: TDataSource;
    qryRotaConsSeqManutPecasCODIGO: TFDAutoIncField;
    qryRotaConsSeqManutPecasCODEMPRESA: TStringField;
    qryRotaConsSeqManutPecasCODMANUTPROGEQUIP: TStringField;
    qryRotaConsSeqManutPecasCODPECAREP: TStringField;
    qryRotaConsSeqManutPecasQUANTIDADE: TIntegerField;
    qryRotaConsSeqManutPecasREFERENCIA: TStringField;
    qryRotaConsSeqManutPecasESTOQUE: TIntegerField;
    qryRotaConsSeqManutPecasPECA: TStringField;
    qryRotaConsSeqManutRecursosCODIGO: TFDAutoIncField;
    qryRotaConsSeqManutRecursosCODEMPRESA: TStringField;
    qryRotaConsSeqManutRecursosCODMANUTPROGEQUIP: TStringField;
    qryRotaConsSeqManutRecursosCODRECURSO: TStringField;
    qryRotaConsSeqManutRecursosQUANTIDADE: TIntegerField;
    qryRotaConsSeqManutRecursosRECURSO: TStringField;
    qryRotaConsSeqManutRecursosESTOQUE: TIntegerField;
    qryProgramadasExecucaoMObraTOTALHOMEMHORAPROG: TBCDField;
    qryProgramadasExecucaoMObraTOTALHOMEMHORAUTIL: TBCDField;
    DSEquipamentosManutHistProgExec: TDataSource;
    qryEquipamentosManutHistProgExec: TFDQuery;
    qryEquipamentosHistCODEMPRESA: TStringField;
    qryEquipamentosManutHistProgExectotal_programados: TLargeintField;
    qryEquipamentosManutHistProgExectotal_executados: TFMTBCDField;
    qryEquipamentosManutHistProgExecCODEMPRESA: TStringField;
    qryEquipamentosManutHistProgExecCODEQUIPAMENTO: TStringField;
    dsEquipamentosLubrificHistProgExec: TDataSource;
    qryEquipamentosLubrificHistProgExec: TFDQuery;
    qryEquipamentosLubrificHistProgExectotal_programados: TLargeintField;
    qryEquipamentosLubrificHistProgExectotal_executados: TFMTBCDField;
    qryEquipamentosLubrificHistProgExecCODEMPRESA: TStringField;
    qryEquipamentosLubrificHistProgExecCODEQUIPAMENTO: TStringField;
    qryManutVencOSVenc: TFDQuery;
    qryLubrificVencOSVenc: TFDQuery;
    DSManutVencOSVenc: TDataSource;
    DSLubrificVencOSVenc: TDataSource;
    qryManutVencOSVencCODORDEMSERVICO: TFDAutoIncField;
    qryLubrificVencOSVencCODORDEMSERVICO: TFDAutoIncField;
    qryFuncionarioHistSimples: TFDQuery;
    dsFuncionarioHistSimples: TDataSource;
    qryFuncionarioHistSimplesCODORDEMSERVICO: TIntegerField;
    qryFuncionarioHistSimplesMATRICULA: TStringField;
    qryFuncionarioHistSimplesNOME: TStringField;
    qryFuncionarioHistSimplesTOTALHOMEMHORA: TFMTBCDField;
    qryFuncionarioHistSimplesDATAPROGINI: TDateTimeField;
    qryFuncionarioHistSimplesDATAFECHAMENTO: TDateTimeField;
    qryFuncionarioHistSimplesAREA: TStringField;
    qryFuncionarioHistSimplesCELULA: TStringField;
    qryManutProgEquipATIVO: TStringField;
    qryManutProgEquipVISIVEL: TStringField;
    qryLubrificProgEquipATIVO: TStringField;
    qryLubrificProgEquipVISIVEL: TStringField;
    qryOrdemServicoEMAIL: TStringField;
    qryOrdemServicoGerenciaEMAIL: TStringField;
    qrySolicitacaoTrabEMAIL: TStringField;
    qryConfigsemail: TStringField;
    qryConfigssenhaemail: TStringField;
    qryConfigsportaemail: TSmallintField;
    qryConfigssmtp: TStringField;
    qryGerarOSEMAIL: TStringField;
    qryManutProgEquipEquipe: TFDQuery;
    dsManutProgEquipEquipe: TDataSource;
    qryManutProgEquipEquipeMObra: TFDQuery;
    dsManutProgEquipEquipeMObra: TDataSource;
    qryManutProgEquipEquipeMObraCODIGO: TFDAutoIncField;
    qryManutProgEquipEquipeMObraCODEMPRESA: TStringField;
    qryManutProgEquipEquipeMObraCODEQUIPE: TIntegerField;
    qryManutProgEquipEquipeMObraCODMANUTPROGEQUIP: TStringField;
    qryManutProgEquipEquipeMObraCODCARGO: TStringField;
    qryManutProgEquipEquipeMObraTOTALHOMEMHORA: TBCDField;
    qryManutProgEquipEquipeMObraCARGO: TStringField;
    qryLubrificProgEquipEquipe: TFDQuery;
    dsLubrificProgEquipEquipe: TDataSource;
    qryLubrificProgEquipEquipeMObra: TFDQuery;
    dsLubrificProgEquipEquipeMObra: TDataSource;
    qryLubrificProgEquipEquipeMObraCODIGO: TFDAutoIncField;
    qryLubrificProgEquipEquipeMObraCODEMPRESA: TStringField;
    qryLubrificProgEquipEquipeMObraCODEQUIPE: TIntegerField;
    qryLubrificProgEquipEquipeMObraCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificProgEquipEquipeMObraCODCARGO: TStringField;
    qryLubrificProgEquipEquipeMObraTOTALHOMEMHORA: TBCDField;
    qryLubrificProgEquipEquipeMObraCARGO: TStringField;
    qryLubrificProgEquipEquipeCODIGO: TFDAutoIncField;
    qryLubrificProgEquipEquipeCODEMPRESA: TStringField;
    qryLubrificProgEquipEquipeCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificProgEquipEquipeCODEQUIPE: TStringField;
    qryLubrificProgEquipEquipeTEMPO: TBCDField;
    qryManutProgEquipEquipeCODIGO: TFDAutoIncField;
    qryManutProgEquipEquipeCODEMPRESA: TStringField;
    qryManutProgEquipEquipeCODMANUTPROGEQUIP: TStringField;
    qryManutProgEquipEquipeCODEQUIPE: TStringField;
    qryManutProgEquipEquipeTEMPO: TBCDField;
    qryManutConsEquipe: TFDQuery;
    dsManutConsEquipe: TDataSource;
    qryManutConsEquipeMObra: TFDQuery;
    dsManutConsEquipeMObra: TDataSource;
    qryManutConsEquipeCODIGO: TFDAutoIncField;
    qryManutConsEquipeCODEMPRESA: TStringField;
    qryManutConsEquipeCODMANUTPROGEQUIP: TStringField;
    qryManutConsEquipeCODEQUIPE: TStringField;
    qryManutConsEquipeTEMPO: TBCDField;
    qryManutConsEquipeMObraCODIGO: TFDAutoIncField;
    qryManutConsEquipeMObraCODEMPRESA: TStringField;
    qryManutConsEquipeMObraCODEQUIPE: TIntegerField;
    qryManutConsEquipeMObraCODMANUTPROGEQUIP: TStringField;
    qryManutConsEquipeMObraCODCARGO: TStringField;
    qryManutConsEquipeMObraTOTALHOMEMHORA: TBCDField;
    qryManutConsEquipeMObraCARGO: TStringField;
    qryLubrificConsEquipe: TFDQuery;
    dsLubrificConsEquipe: TDataSource;
    qryLubrificConsEquipeMObra: TFDQuery;
    dsLubrificConsEquipeMObra: TDataSource;
    qryLubrificConsEquipeCODIGO: TFDAutoIncField;
    qryLubrificConsEquipeCODEMPRESA: TStringField;
    qryLubrificConsEquipeCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificConsEquipeCODEQUIPE: TStringField;
    qryLubrificConsEquipeTEMPO: TBCDField;
    qryLubrificConsEquipeMObraCODIGO: TFDAutoIncField;
    qryLubrificConsEquipeMObraCODEMPRESA: TStringField;
    qryLubrificConsEquipeMObraCODEQUIPE: TIntegerField;
    qryLubrificConsEquipeMObraCODLUBRIFICPROGEQUIP: TStringField;
    qryLubrificConsEquipeMObraCODCARGO: TStringField;
    qryLubrificConsEquipeMObraTOTALHOMEMHORA: TBCDField;
    qryLubrificConsEquipeMObraCARGO: TStringField;
    qryOrdemServicoGerenciaOFICINA: TStringField;
    qrySolicitacaoTrabCODIGO: TFDAutoIncField;
    qrySolicitacaoTrabCODEMPRESA: TStringField;
    qrySolicitacaoTrabCODEQUIPAMENTO: TStringField;
    qrySolicitacaoTrabCODSOLICITANTE: TStringField;
    qrySolicitacaoTrabCODOFICINA: TStringField;
    qrySolicitacaoTrabDESCSERVICO: TStringField;
    qrySolicitacaoTrabTEMPOESTIMADO: TBCDField;
    qrySolicitacaoTrabPRAZOSOLIC: TIntegerField;
    qrySolicitacaoTrabJUSTIFICATIVA: TStringField;
    qrySolicitacaoTrabDATASOLIC: TDateTimeField;
    qrySolicitacaoTrabPRIORIDADEPARADA: TStringField;
    qrySolicitacaoTrabHORARIOSOLIC: TDateTimeField;
    qrySolicitacaoTrabVALORPROG: TBCDField;
    qrySolicitacaoTrabCODORDEMSERVICO: TIntegerField;
    qrySolicitacaoTrabSITUACAO: TStringField;
    qrySolicitacaoTrabDATACADASTRO: TDateTimeField;
    qrySolicitacaoTrabCODUSUARIOCAD: TStringField;
    qrySolicitacaoTrabDATAULTALT: TDateTimeField;
    qrySolicitacaoTrabCODUSUARIOALT: TStringField;
    qrySolicitacaoTrabOBSERVACOES: TBlobField;
    qrySolicitacaoTrabCENTROCUSTO: TStringField;
    qryManutProgEquipItensTotalHH: TAggregateField;
    qryManutProgEquipItensEspTotalHH: TAggregateField;
    qryManutProgFamEquipItensTotalHH: TAggregateField;
    qryLubrificProgEquipItensTotalHH: TAggregateField;
    qryLubrificProgEquipItensEspTotalHH: TAggregateField;
    qryChecklistLubrificItensTotalHH: TAggregateField;
    qryChecklistLubrificItensEspTotalHH: TAggregateField;
    qryChecklistManutItensEspTotalHH: TAggregateField;
    qryChecklistManutItensTotalHH: TAggregateField;
    qryOrdemServicoGerenciaTEMPOHOMEMHORA: TBCDField;
    qryOrdemServicoGerenciaHHTOTAL: TAggregateField;
    qryOrdemServicoGerenciaFUNCIONARIO: TStringField;
    dsOrdemServicoUltParalisacao: TDataSource;
    qryOrdemServicoUltParalisacao: TFDQuery;
    qryOrdemServicoUltParalisacaoMOTIVOPARALISACAO: TStringField;
    qryOrdemServicoUltParalisacaoCODIGO: TFDAutoIncField;
    qryOrdemServicoGerenciaTIPO: TStringField;
    qryOrdemServicoGerenciaDATACANCEL: TDateTimeField;
    qryManutConsItenstempototal: TAggregateField;
    qryManutConsItensEsptempototal: TAggregateField;
    qryLubrificConsItenstempototal: TAggregateField;
    qryLubrificConsItensEsptempototal: TAggregateField;
    qryLoginCODIGO: TStringField;
    qryLoginMATRICULA: TStringField;
    qryLoginNOME: TStringField;
    qryLoginSENHA: TStringField;
    qryLoginBLOQUEIO: TSmallintField;
    qryLoginSENHAALTERADA: TStringField;
    qryLoginSENHAALTERADADATA: TDateTimeField;
    qryLoginDATAFIM: TDateTimeField;
    qryLoginULTIMOACESSO: TDateTimeField;
    qryLoginNOVOACESSO: TDateTimeField;
    qryLoginDIFERENCA: TLargeintField;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP: TIdHTTP;
    qryManutProgFamEquipCons: TFDQuery;
    dsManutProgFamEquipCons: TDataSource;
    qryManutProgFamEquipConsCODEQUIPAMENTO: TStringField;
    qryManutProgFamEquipConsEQUIPAMENTO: TStringField;
    qryManutProgFamEquipConsCENTROCUSTO: TStringField;
    qryManutProgFamEquipConsCODMANUTENCAO: TStringField;
    qryManutProgFamEquipConsMANUTENCAO: TStringField;
    qryManutProgFamEquipConsDIAS: TSmallintField;
    qryManutProgFamEquipConsATIVO: TStringField;
    qryManutProgFamEquipConsPLANEJADA: TDateTimeField;
    qryManutProgFamEquipConsCODMANUTFAMILIA: TStringField;
    qryManutProgFamEquipConsDESCMANUTFAMILIA: TStringField;
    qryManutProgFamEquipConsTIPOMANUTENCAO: TStringField;
    qryManutProgFamEquipConsCODTIPOMANUTENCAO: TStringField;
    qryLubrificProgFamEquipCons: TFDQuery;
    dsLubrificProgFamEquipCons: TDataSource;
    qryLubrificProgFamEquipConsCODEQUIPAMENTO: TStringField;
    qryLubrificProgFamEquipConsEQUIPAMENTO: TStringField;
    qryLubrificProgFamEquipConsCENTROCUSTO: TStringField;
    qryLubrificProgFamEquipConsTIPOMANUTENCAO: TStringField;
    qryLubrificProgFamEquipConsCODLUBRIFICACAO: TStringField;
    qryLubrificProgFamEquipConsLUBRIFICACAO: TStringField;
    qryLubrificProgFamEquipConsDIAS: TSmallintField;
    qryLubrificProgFamEquipConsATIVO: TStringField;
    qryLubrificProgFamEquipConsPLANEJADA: TDateTimeField;
    qryLubrificProgFamEquipConsCODLUBRIFICFAMILIA: TStringField;
    qryLubrificProgFamEquipConsDESCLUBRIFICFAMILIA: TStringField;
    qryLubrificProgFamEquipConsCODTIPOMANUTENCAO: TStringField;
    qryOrdemServicoLocalizaMObraMATRICULA: TStringField;
    qryOrdemServicoLocalizaMObraNOME: TStringField;
    qryOrdemServicoLocalizaMObraCARGO: TStringField;
    qryOrdemServicoLocalizaMObraCALENDARIO: TStringField;
    qryOrdemServicoLocalizaMObraCODEMPRESA: TStringField;
    qryEquipamentoManutHistFREQUENCIA1: TSmallintField;
    qryEquipamentoLubrificHistFREQUENCIA1: TSmallintField;
    qryRotaEquipVencCODIGO: TStringField;
    qryRotaEquipVencCODEMPRESA: TStringField;
    qryRotaEquipVencDESCRICAO: TStringField;
    qryRotaEquipVencDATAINICIO: TDateTimeField;
    qryRotaEquipVencFREQUENCIA: TSmallintField;
    qryRotaEquipVencREPROGRAMAR: TStringField;
    qryRotaEquipVencRELATORIO: TStringField;
    qryRotaEquipVencDATACADASTRO: TDateTimeField;
    qryRotaEquipVencCODUSUARIOCAD: TStringField;
    qryRotaEquipVencDATAULTALT: TDateTimeField;
    qryRotaEquipVencCODUSUARIOALT: TStringField;
    qryRotaEquipVencOBSERVACOES: TBlobField;
    qryRotaEquipVencTEMPOTOTALITENS: TFMTBCDField;
    qryRotaEquipVencC_DIASATRASO: TIntegerField;
    qryRotaEquipVencSeqManutCODCENTROCUSTO: TStringField;
    qryRotaEquipVencSeqManutCODOFICINA: TStringField;
    qryRotaEquipVencSeqManutCODMANUTENCAO: TStringField;
    qryRotaEquipVencSeqManutEQUIPPARADO: TStringField;
    qryRotaConsTEMPOTOTALITENS: TFMTBCDField;
    qryRotaConsSeqManutCODIGO: TStringField;
    qryRotaConsSeqManutCODEMPRESA: TStringField;
    qryRotaConsSeqManutDESCRICAO: TStringField;
    qryRotaConsSeqManutDTAINICIO1: TDateTimeField;
    qryRotaConsSeqManutRELATORIO: TStringField;
    qryRotaConsSeqManutCODCENTROCUSTO: TStringField;
    qryRotaConsSeqManutCODOFICINA: TStringField;
    qryRotaConsSeqManutCODMANUTENCAO: TStringField;
    qryRotaConsSeqManutEQUIPPARADO: TStringField;
    qryRotaConsSeqManutFREQUENCIA1: TSmallintField;
    qryRotaConsSeqManutCODMANUTPROGFAMEQUIP: TStringField;
    qryRotaConsSeqManutCODEQUIPAMENTO: TStringField;
    qryDashboard: TFDQuery;
    procedure ApplicationEventsSPMPException(Sender: TObject; E: Exception);
    procedure qryManutVencAfterGetRecords(DataSet: TFDDataSet);
    procedure qryManutVencCalcFields(DataSet: TDataSet);
    procedure qryLubrificVencCalcFields(DataSet: TDataSet);
    procedure qryRotaEquipVencCalcFields(DataSet: TDataSet);
    procedure FDConnSPMP3Recover(ASender, AInitiator: TObject;
      AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
    procedure qryDataHoraServidorBeforeRefresh(DataSet: TDataSet);
    procedure qryManutProgEquipPartesAfterScroll(DataSet: TDataSet);
    procedure qryManutProgEquipItensEspAfterInsert(DataSet: TDataSet);
    procedure qryLubrificProgEquipPartesAfterScroll(DataSet: TDataSet);
    procedure qryLubrificProgEquipItensEspAfterInsert(DataSet: TDataSet);
    procedure qryManutProgFamEquipItensAfterInsert(DataSet: TDataSet);
    procedure qryLubrificProgFamEquipItensAfterInsert(DataSet: TDataSet);
    procedure qryMonitMedicoesPtosInspAfterScroll(DataSet: TDataSet);
    procedure qryRecursosCalcFields(DataSet: TDataSet);
    procedure qryAbastecimentosCalcFields(DataSet: TDataSet);
    procedure qryLubrificProgEquipCalcFields(DataSet: TDataSet);
    procedure qryManutProgEquipCalcFields(DataSet: TDataSet);
    procedure qryOrdemServicoHistoricoCalcFields(DataSet: TDataSet);
    procedure qryPneusChassiCalcFields(DataSet: TDataSet);
    procedure qryPneusChassiCustoCalcFields(DataSet: TDataSet);
    procedure qryPneusChassiIDCustoCalcFields(DataSet: TDataSet);
    procedure qryPneusChassiPosicoesHistCalcFields(DataSet: TDataSet);
    procedure qryRotasCalcFields(DataSet: TDataSet);
    procedure qryLubrificConsCalcFields(DataSet: TDataSet);
    procedure qryLubrificPeriodicasCalcFields(DataSet: TDataSet);
    procedure qryLubrificPeriodicasItensCalcFields(DataSet: TDataSet);
    procedure qryLubrificPeriodicasItensEspCalcFields(DataSet: TDataSet);
    procedure qryManutConsCalcFields(DataSet: TDataSet);
    procedure qryManutPeriodicasCalcFields(DataSet: TDataSet);
    procedure qryManutPeriodicasItensCalcFields(DataSet: TDataSet);
    procedure qryManutPeriodicasItensEspCalcFields(DataSet: TDataSet);
    procedure qryRelatGerencDespEquipCalcFields(DataSet: TDataSet);
    procedure qryRelatGerencDispEquipCalcFields(DataSet: TDataSet);
    procedure qryRotaPeriodicasManutItensCalcFields(DataSet: TDataSet);
    procedure qryRotaPeriodicasManutItensEspCalcFields(DataSet: TDataSet);
    procedure qryOrdemServicoServSolicAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoEquipeAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoServExecAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercUnidMedicoesAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryOrdemServicoTercUnidAditivosAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercUnidMateriaisAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercUnidPecasAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercUnidRecursoAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercForaOIAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercForaOCAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercForaOEAfterInsert(DataSet: TDataSet);
    procedure qryOrdemServicoTercForaAditivosAfterInsert(DataSet: TDataSet);
    procedure qryAbastecimentosCombustAfterInsert(DataSet: TDataSet);
    procedure qryAbastecimentosLubrificAfterInsert(DataSet: TDataSet);
    procedure qryPneusChassiPosicoesAfterScroll(DataSet: TDataSet);
    procedure qryAlertasAfterInsert(DataSet: TDataSet);
    procedure qryEquipamentosDadosAfterInsert(DataSet: TDataSet);
    procedure qryEquipamentosDadosRAfterInsert(DataSet: TDataSet);
    procedure qryPecasReposicaoDadosAfterInsert(DataSet: TDataSet);
    procedure qryRecursosDadosAfterInsert(DataSet: TDataSet);
    procedure qryPneusDadosAfterInsert(DataSet: TDataSet);
    procedure qryRecursoKitItensAfterInsert(DataSet: TDataSet);
    procedure qryPecaReposicaoKitItensAfterInsert(DataSet: TDataSet);
    procedure qryFerramentariaItensAfterInsert(DataSet: TDataSet);
    procedure qryRotaConsCalcFields(DataSet: TDataSet);
    procedure qryFuncionariosAusenciasAfterInsert(DataSet: TDataSet);
    procedure qryDespMensalTaxasAfterInsert(DataSet: TDataSet);
    procedure qryManutPeriodicasHistItensCalcFields(DataSet: TDataSet);
    procedure qryManutPeriodicasHistCalcFields(DataSet: TDataSet);
    procedure qryLubrificPeriodicasHistCalcFields(DataSet: TDataSet);
    procedure qryLubrificPeriodicasHistItensCalcFields(DataSet: TDataSet);
    procedure qryLubrificPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
    procedure qryManutPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
    procedure qryFuncionariosHistAfterScroll(DataSet: TDataSet);
    procedure qryFuncionariosHistCalcFields(DataSet: TDataSet);
    procedure qryRotasFREQUENCIAValidate(Sender: TField);
    procedure qryManutPeriodicasAfterScroll(DataSet: TDataSet);
    procedure qryLubrificPeriodicasAfterScroll(DataSet: TDataSet);
    procedure dsOrdemServicoGerenciaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    var caminhoArquivo: string;

    function GetFileVersion(const AFileName: string): String;
   // function GetFileDateTime(AFileName: String): TDateTime;
   // function GetFileDateAsInteger(AFileName: String): Integer;
    function GetFileDateAsIntegerAndBuildVersion(AFileName: String): Currency;


  public
    { Public declarations }

    FDataSetParam : TFDQuery;

    FDataSetRelat : TfrxDBDataset;

    FDataSourceParam : TDataSource;

    FPerfil, FPassword, FHost, FPort, FDatabase, FUserName, FCodUsuario,
    FNomeUsuario, FHostFTP, FPasswordFTP, FUsernameFTP, FCodEmpresa,
    FNomeEmpresa, FCodGrupo, FNomeGrupo, FAlerta, FLicenca, FTela, FCodCombo,
    FValorCombo, FCodAcesso, FCodAlteracao, FCodExclusao, FCodInclusao,
    FNivelAcesso, FEstacao, FModulo, FNomeConsulta, FServerPathExeVersion,
    FCodFamilia, FCodArea, FCodCelula, FCodLinha, FVersaoMacro, FPromptConsulta,
     _EMAIL, _SENHA, _PORTA, _SMTP, FUrlSPMPBuilder: String;

    FDataHoraServidor, FInstalacao, FDataConsultaMObra, FDataConsulta1,
    FDataConsulta2: TDateTime; FTempoNovaOS, FTempoSenhaUsu, FQtdeMinSenha,
    FQtdeLoginTent, FNumUsuarios, FCodOrdemServico, FTabela_auxiliar,
    FDiasRestantes, FTotalOS, FMinutosInativo, FTotalParadasEquip,
    FVersaoMaquina, FVersaoRepo, FVersaoBanco, FSegundosDesliga : Integer;

    FAcessoLiberado, FEmpTransf, FAlterando, FFecharForms, FAutoUpdate: Boolean;

    FParamAuxiliar: array[0..20] of String;

    FParametros : TArray<String>;

    FCustos : TArray<Real>;

    FTotalHHDisp, FTotalHorasFunc, FTotalHorasParadas : Real;

    LSolicitadas: array[1..12] of Integer;
    LFechadas: array[1..12] of Integer;
    LTipoManutencao: array[1..7] of Integer;
    LSituacaoOS: array[1..11] of Integer;


    function SecondToTime( Segundos : Cardinal ) : String;
    function GetVersionLocal(AFileName: String): string;
    function GetVersionRepo: Integer;
    function ResourceExists(const ResourceName: string): Boolean;

    procedure ResourceExtract(AResourceName, APath, AFileName: String);
    procedure CheckApplicationVersion;
    procedure DownloadNewVersion;
    procedure ExtractFile(AFile, APath: String);
    procedure CopySingleFile(AFileName: String);


    function RetornaDataHoraServidor: Boolean;
    function VerificaArquivoAberto(FileName: TFileName) : boolean;
    function IniciaServicoWin(sMachine, sService: string): boolean;
    function SenhaExpirada: Boolean;
    function Crypt(Action, Src: String): String;
    function PasswordInputBox(const ACaption, APrompt:string): string;
    function VerificaPrimeiroAcesso:Boolean;
    function GerarOS(CodUsuario, CodEmpresa, Descricao, CodEquip, Manutencao,
                     Lubrificacao, Rota, SolicTrab, Matricula, Prioridade,
                     Criticidade, CentroCusto, Observacoes, tempototal, Oficina,
                     TipoManutencao, EquipParado, Email: String): Integer;
    function CampoInputBox(const ACaption, APrompt:string): string;
    function VerificaDuplo(Valor: String): Boolean;
    function ConsultarCombo:String;
    function AplicarMascara(Campo, Mascara: TStringField; Form: TForm): Boolean;
    function HorasParadasEquipamento(CodEquipamento, Tipo, Area,
             Celula: String): Real;
    function HorasCalendario(Tipo: SmallInt; CodEquip, CodArea: String):Real;
    function DataFeriado(Hora:String):Boolean;
    function TotalHomemHoraDisp(Data: TDateTime; Matricula,
             TipoCelula: String): Real;
    function TotalEquipHoraDisp(Data: TDateTime): Real;
    function HorasFuncTotal:Real;
    function AnalisarImportancia:SmallInt;
    function JpgToBmp(cImage: String): Boolean;
    function XlsToStringGrid(xStringGrid: TStringGrid;
             xFileXLS: string): Boolean;
    function converter_ponto(valor_com_virgula: string): string;
    function AtualizarContadorSatelite(CodEquipamento, Placa: String;
                                       DataImportacao: TDateTime; Rodagem: Real;
                                       Indice: SmallInt): String;
    function LicencaExpirada: Boolean;
    function VerificarInspecoes: Boolean;
    function CalcularMTBF(codequip: String; periodo: SmallInt): Real;
    function CalcularTaxaFalha(mtbf: Real): Real;
    function IsAdmin: Boolean;

    procedure GravaLog(linha1: string = ''; linha2: string = '';
              linha3: string = '');
    procedure CriaArquivoLog(var arquivo: TextFile);
    procedure ConectaBanco(sIp: string);
    procedure ReconectaBanco;
    procedure CheckUpdateVersion;
    procedure VerificarConfiabilidade;
    procedure MSGAguarde(strTexto: String = ''; boolAguarde: Boolean = true);
    procedure HistoricoInspecoes(Tipo: SmallInt; CodEmpresa, CodEquip,
                                 Codigo: String; CodOrdemServico: Integer);
    procedure ExibeFoto(DataSet : TDataSet; BlobFieldName: String;
                        ImageExibicao: TImage);
    procedure SetJPGCompression(ACompression: integer; const AInFile: string;
              const AOutFile: string);
    procedure RegistrarMovimentacao(Operacao, CodEmpresa, CodUsuario, Modulo,
              Estacao: String);
    procedure ConsultarAlertas;
    procedure EnviarEmail(Msg, Destinario, OrdemServico: String);
    procedure CalcularDashBoard;


  end;

var
  DM: TDM;
  LTentaConexao, Conectou: Boolean;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnTelaAguarde, UnTelaConsulta, UnTelaCadAlertas, UnTelaPrincipal,
  UnDmRelatorios, UnTelaInspVenc, UnTelaCadManutProgEquipPartesItensEsp,
  UnTelaCadLubrificProgEquipPartesItensEsp, UnTelaCadMonitoramento,
  UnTelaCadAbastecimentos, UnTelaInspConsulta, UnTelaInspFechamentoHist,
  UnTelaCadOrdemServicoHistorico, UnTelaCadPneusChassiRelat,
  UnTelaCadPneusChassi, UnTelaGerenciador, UnTelaCadFuncionariosHist,
  UnTelaCadOrdemServicoFechamento, UnTelaCadOrdemServicoGerencia,
  UnTelaCadRotaProgEquip, UnTelaInspFechamento,
  idSMTP,
  idMessage,
  idText,
  idAttachmentFile,
  idExplicitTLSClientServerBase , UnTempoOcioso, UnDmAlertas, UnTelaSplash;


{$R *.dfm}

const
  SECURITY_NT_AUTHORITY: TSIDIdentifierAuthority = (Value: (0, 0, 0, 0, 0, 5));
  SECURITY_BUILTIN_DOMAIN_RID = $00000020;
  DOMAIN_ALIAS_RID_ADMINS = $00000220;


function TDM.SecondToTime( Segundos : Cardinal ) : String;
var
  Seg, Min, Hora: Cardinal;
begin
  Hora := Segundos div 3600;
  Seg := Segundos mod 3600;
  Min := Seg div 60;
  Seg := Seg mod 60;
  Result := FormatFloat(',00', Hora) + ':' +
  FormatFloat('00', Min) + ':' +
  FormatFloat('00', Seg);
end;

function TDM.GetFileVersion(const AFileName: string): String;
var
  Zero: DWORD; // set to 0 by GetFileVersionInfoSize
  VersionInfoSize: DWORD;
  PVersionData: pointer;
  PFixedFileInfo: PVSFixedFileInfo;
  FixedFileInfoLength: UINT;
  Major, Minor, Release, Build: Integer;
begin
  VersionInfoSize := GetFileVersionInfoSize(pChar(AFileName), Zero);
  if VersionInfoSize = 0 then
     exit;
  PVersionData := AllocMem(VersionInfoSize);
  try
    if GetFileVersionInfo(pChar(AFileName), 0, VersionInfoSize,
       PVersionData) = False then  exit;
    if VerQueryValue(PVersionData, '', pointer(PFixedFileInfo),
       FixedFileInfoLength) = False then exit;
    Major := PFixedFileInfo^.dwFileVersionMS shr 16;
    Minor := PFixedFileInfo^.dwFileVersionMS and $FFFF;
    Release := PFixedFileInfo^.dwFileVersionLS shr 16;
    Build := PFixedFileInfo^.dwFileVersionLS and $FFFF;
  finally
    FreeMem(PVersionData);
  end;
  if (Major or Minor or Release or Build) <> 0 then
    result := IntToStr(Major) +'.'+ IntToStr(Minor) +'.'+ IntToStr(Release)
                       +'.'+ IntToStr(Build);
end;

function TDM.GetFileDateAsIntegerAndBuildVersion(AFileName: String): Currency;
var
  LFileVersion: Currency;
begin
  try
    LFileVersion := StrToCurr(StringReplace(GetFileVersion(AFileName), '.', '',
    [rfReplaceAll]));
    Result := LFileVersion;
  except
    on E: Exception do
    begin
      GravaLog('Falha ao buscar atualização do SPMP3. DM Linha: 5799', E.ClassName, E.Message);
      Application.MessageBox('Falha ao buscar atualização do SPMP3!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TDM.CopySingleFile(AFileName: String);
var
  LSourceFolder: String;
  LTargetFolder: String;
begin
  LSourceFolder := ExtractFilePath(ParamStr(0))+'SPMP3';
  LTargetFolder := ExtractFilePath(ParamStr(0));
  CopyFile(PChar(LSourceFolder+'\'+AFileName), PChar(LTargetFolder+'\'+AFileName), False);
end;

procedure TDM.ExtractFile(AFile, APath: String);
var
  LZipFile: TZipFile;
begin
  LZipFile := TZipFile.Create;
  LZipFile.Open(AFile, zmRead);
  LZipFile.ExtractAll(APath);
  LZipFile.Close;
  FreeAndNil(LZipFile);
end;

procedure TDM.DownloadNewVersion;
var
  LFileSaveName: String;
  LMemoryStream: TMemoryStream;
  LUrl: String;
begin
  // text/html, image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, /

  LFileSaveName := ExtractFilePath(ParamStr(0))+'SPMP3.zip';
  LMemoryStream := TMemoryStream.Create;
  //Creating URL for the last version
  LUrl := 'https://github.com/masiopadilha/spmp/releases/download/'+IntToStr(GetVersionRepo)+ '/SPMP3.zip';
  //Download last update file
  IdHTTP.Get(LUrl, LMemoryStream);
  //Saving file
  LMemoryStream.SaveToFile(LFileSaveName);
  //ExtractFiles
  ExtractFile(LFileSaveName, ExtractFilePath(ParamStr(0))+'\SPMP3');
  FreeAndNil(LMemoryStream);
end;

procedure TDM.CheckApplicationVersion;
var
  LVerExec: Integer;
  LVerRepo: Integer;
begin
//  FrmTelaSplash.lblCheckUpdate.BringToFront;

  LVerExec := DM.FVersaoMaquina;
  LVerRepo := DM.FVersaoRepo;
  if DM.FVersaoMaquina < LVerRepo then
  begin
    if Application.MessageBox('Há uma nova versão disponível.' +''#13#13''+
                              'Se você clicar em SIM, o download começará e' +''#13''+
                              'a nova versão será iniciada automaticamente.'+''#13''+
                              'Então, apenas espere.' +''#13#13''+
                              'Você quer baixá-la?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then

    begin
      DM.DownloadNewVersion; //Download the New Pack version and extract it.
      DM.CopySingleFile('Updater.bat'); //Copy from the New Pack Folder to the current folder

      if DM.FNomeUsuario <> 'sam_spmp' then
      begin
        DM.RetornaDataHoraServidor;
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
      DM.qryUsuario.Close;
      DM.qryFormatoCodigo.Close;
      DM.qryUsuarioAcessos.Close;

      ShellExecute(0, 'open', PChar(ExtractFilePath(ParamStr(0))+'\Updater.bat'), nil, nil, SW_HIDE);
      Halt;
    end;
  end;
end;

procedure TDM.ResourceExtract(AResourceName, APath, AFileName: String);
var
  LResouce: TResourceStream;
begin
  LResouce := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
  LResouce.SaveToFile(APath+AFileName);
  FreeAndNil(LResouce);
end;

function TDM.ResourceExists(const ResourceName: string): Boolean;
var
  HInstance: HMODULE;
begin
  Result := False;
  HInstance := GetModuleHandle(nil);
  if HInstance <> 0 then
  begin
    if FindResource(HInstance, PChar(ResourceName), RT_RCDATA) <> 0 then
      Result := True;
  end;
end;

//procedure TDM.RunAsAdmin(const FileName: string; const Parameters: string);
//var
//  ShellExecuteInfo: TShellExecuteInfo;
//begin
//  FillChar(ShellExecuteInfo, SizeOf(ShellExecuteInfo), 0);
//  ShellExecuteInfo.cbSize := SizeOf(ShellExecuteInfo);
//  ShellExecuteInfo.lpVerb := 'runas'; // Solicita privilégios de administrador
//  ShellExecuteInfo.lpFile := PChar(FileName);
//  ShellExecuteInfo.lpParameters := PChar(Parameters);
//  ShellExecuteInfo.nShow := SW_NORMAL; // Mostrar a janela do aplicativo
//  ShellExecuteInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
//
//  if ShellExecuteEx(@ShellExecuteInfo) then
//  begin
//    // O comando foi iniciado com sucesso, você pode esperar pelo término do processo, se necessário
//    WaitForSingleObject(ShellExecuteInfo.hProcess, INFINITE);
//    CloseHandle(ShellExecuteInfo.hProcess);
//  end
//  else
//  begin
//    // Ocorreu um erro ao executar o comando com privilégios de administrador
//    ShowMessage('Erro ao executar com privilégios de administrador');
//  end;
//end;

function TDM.GetVersionRepo: Integer;
var
  LUri: TIdURI;
  LUrl: String;
  LLastBarIndex: Integer;
begin
  Result := 0;
//  IdHTTP.Request.Accept := 'text/html, image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, /';
  IdHTTP.Request.Accept := '*/*';
  IdHTTP.Request.AcceptEncoding := 'gzip, deflate';
  IdHTTP.Request.UserAgent := 'Mozilla/4.0';
  IdHTTP.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdHTTP.HandleRedirects := True;
  // Fazer solicitação HEAD para obter o URL final após redirecionamentos
  LUri := TIdURI.Create(FUrlSPMPBuilder);
  IdHTTP.Head(LUri.URI);
  LUrl := IdHTTP.Request.URL;
  // Encontra o índice da última barra na string
  LLastBarIndex := LastDelimiter('/', LUrl);
  // Verifica se encontrou a barra
  if LLastBarIndex > 0 then
    // Extrai o texto após a última barra
    Result := StrToInt(Copy(LUrl, LLastBarIndex + 1, Length(LUrl) - LLastBarIndex));
end;

function TDM.GetVersionLocal(AFileName: String): string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
  Ver: String;
begin
  Size := GetFileVersionInfoSize(PChar(AFileName), Size2);
  if Size > 0 then
    begin
      GetMem (Pt, Size);
      try
        GetFileVersionInfo(PChar(AFileName), 0, Size, Pt);
        VerQueryValue (Pt, '\', Pt2, Size2);
        with TVSFixedFileInfo (Pt2^) do
          begin
            FVersaoMacro := IntToStr (HiWord (dwFileVersionMS)) + '.' +
                            IntToStr (LoWord (dwFileVersionMS)) + '.' +
                            IntToStr (HiWord (dwFileVersionLS));

            Ver := IntToStr (HiWord (dwFileVersionMS)) + '.' +
                   IntToStr (LoWord (dwFileVersionMS)) + '.' +
                   IntToStr (HiWord (dwFileVersionLS)) + '.' +
                   IntToStr (LoWord (dwFileVersionLS));
//            Result := StringReplace(Ver, '.', '',[rfReplaceAll]);
            FVersaoMaquina := StrToInt(StringReplace(Ver, '.', '',[rfReplaceAll]));
            Result := Ver;
          end;
      finally
        FreeMem (Pt);
      end;
    end;
end;

procedure TDM.CheckUpdateVersion;
var
  LLocalDir: String;
  LLocalVersion: Currency;
  LServerVersion: Currency;
  LLocalFile, LServerFile: PWideChar;
//  Handle: TextFile;
  Handle2: HWnd;
begin
  try
    //Se a pasta local não existir, então criar.
    LLocalDir := 'c:\spmp3';
    LLocalFile := PChar(ExtractFilePath(Application.ExeName)+'UpdateVersion.bat');
    LServerFile := PChar(ExtractFilePath(DM.FServerPathExeVersion)+'UpdateVersion.bat');
    //Checar a versão do programa no servidor e comparar com a atual.
    LLocalVersion := GetFileDateAsIntegerAndBuildVersion(Application.ExeName);
    LServerVersion := GetFileDateAsIntegerAndBuildVersion(DM.FServerPathExeVersion);
    //Copiar arquivo BAT do servidor.
    CopyFile(PChar(LServerFile), PChar(LLocalDir+'\UpdateVersion.bat'), False);
    if LServerVersion > LLocalVersion then
    begin
      MessageDlg('Existe uma nova versão no servidor..' + #13 +
                   'Pressione OK para iniciar a atualização.', mtInformation, [mbOK], 0);

      ShellExecute(Handle2, 'open', LLocalFile, nil, nil, SW_SHOW);
      sleep(10000);
    end;
  except
    on E: Exception do
    begin
      GravaLog('Não foi possível buscar atualização do SPMP3. DM linha: 5864', E.ClassName, E.Message);
      Application.MessageBox('Não foi possível buscar atualização do SPMP3.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;
end;

function TDM.IsAdmin: Boolean;
var
  hAccessToken: THandle;
  ptgGroups: PTokenGroups;
  dwInfoBufferSize: DWORD;
  psidAdministrators: PSID;
  x: Integer;
  bSuccess: BOOL;
begin
  Result := False;
  bSuccess := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True, hAccessToken);

  if not bSuccess then
    begin
      if GetLastError = ERROR_NO_TOKEN then
        bSuccess := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, hAccessToken);
    end;

  if bSuccess then
    begin
      GetMem(ptgGroups, 1024);
      bSuccess := GetTokenInformation(hAccessToken, TokenGroups,
      ptgGroups, 1024, dwInfoBufferSize);
      CloseHandle(hAccessToken);

      if bSuccess then
        begin
          AllocateAndInitializeSid(SECURITY_NT_AUTHORITY, 2, SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS,
                                   0, 0, 0, 0, 0, 0, psidAdministrators);
          {$R-}
          for x := 0 to ptgGroups.GroupCount - 1 do
            if EqualSid(psidAdministrators, ptgGroups.Groups[x].Sid) then
              begin
                Result := True;
                Break;
                end;
          {$R+}
          FreeSid(psidAdministrators);
        end;
      FreeMem(ptgGroups);
    end;
end;

function TDM.RetornaDataHoraServidor: Boolean;
begin
  Result := False;
  try
    if DM.qryDataHoraServidor.Active = False then
      begin
        DM.qryDataHoraServidor.Active := True;
        DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;
      end
    else
      begin
        DM.qryDataHoraServidor.Refresh;
        DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;
      end;
    Result := True;
  except on E: Exception do
    begin
      DM.FDConnSPMP3.Rollback;
      MessageDlg('Ocorreu um erro ao buscar a data/hora do servidor.' + #13 +
                 'Caso o erro se repita, favor entrar em contato com o administrador do sistema.' + #13 +
                 'Mensagem de erro: ' + E.Message, mtError, [mbOK], 0);
    end;
  end
end;

function TDM.Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer; KeyPos : Integer; OffSet : Integer; Dest, Key : String;
SrcPos : Integer; SrcAsc : Integer; TmpSrcAsc : Integer; Range : Integer;
begin
if (Src = '') Then begin Result:= ''; Goto Fim; end;
//Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SLK3LAKDJSL9RTIKJ';
kEY := 'LDJFB2U4G98357G2GB959B259UYBG349IVY43934GB93UB395N395BU397B5935UBV95YGB3U59GB5789G3486YFV278D6Y329BDNI320DM32N90U4BV9348Y';
Dest := '';
KeyLen := Length(Key);
KeyPos := 0;
Range := 256;
if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
      begin
        Application.ProcessMessages;
        SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
        if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
        SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        Dest := Dest + Format('%1.2x',[SrcAsc]);
        OffSet := SrcAsc;
      end;
  end
Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
    repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
Result:= Dest;
Fim:
end;


procedure TDM.MSGAguarde(strTexto: String = ''; boolAguarde: Boolean = true);
begin
  if boolAguarde = True then
    begin
      Application.CreateForm(TFrmTelaAguarde, FrmTelaAguarde);
      if strTexto <> '' then
        FrmTelaAguarde.PTexto.Caption := strTexto;

      FrmTelaAguarde.Show;
      FrmTelaAguarde.Repaint;
    end
  else
    begin
      FreeAndNil(FrmTelaAguarde);
    end;
end;

function TDM.PasswordInputBox(const ACaption, APrompt:string): string;
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

procedure TDM.qryAbastecimentosCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadAbastecimentos <> nil then
  begin
    qryAbastecimentosPERIODO.AsString := FrmTelaCadAbastecimentos.CBPeriodo.Text;
  end;
end;

procedure TDM.qryAbastecimentosCombustAfterInsert(DataSet: TDataSet);
begin
  qryAbastecimentosCombustCODEMPRESA.AsString := DM.FCodEmpresa;
  qryAbastecimentosCombustCODEQUIPAMENTO.AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
end;

procedure TDM.qryAbastecimentosLubrificAfterInsert(DataSet: TDataSet);
begin
  qryAbastecimentosLubrificCODEMPRESA.AsString := DM.FCodEmpresa;
  qryAbastecimentosLubrificCODEQUIPAMENTO.AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
end;

procedure TDM.qryAlertasAfterInsert(DataSet: TDataSet);
begin
  qryAlertasCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryDataHoraServidorBeforeRefresh(DataSet: TDataSet);
begin
if qryDataHoraServidor.Active = False then
  qryDataHoraServidor.Active := True;
end;

procedure TDM.qryDespMensalTaxasAfterInsert(DataSet: TDataSet);
begin
qryDespMensalTaxasCODEMPRESA.AsString := DM.FCodEmpresa;
qryDespMensalTaxasCODDESPTAXAPER.AsInteger := qryDespMensalTaxasPerCODIGO.AsInteger;
end;

procedure TDM.qryEquipamentosDadosAfterInsert(DataSet: TDataSet);
begin
qryEquipamentosDadosCODEMPRESA.AsString := DM.FCodEmpresa;
qryEquipamentosDadosCODEQUIPAMENTO.AsString := qryEquipamentosCODIGO.AsString;
qryEquipamentosDadosCODFAMILIAEQUIP.AsString := qryEquipamentosCODFAMILIAEQUIP.AsString;
end;

procedure TDM.qryEquipamentosDadosRAfterInsert(DataSet: TDataSet);
begin
qryEquipamentosDadosCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryFerramentariaItensAfterInsert(DataSet: TDataSet);
begin
qryFerramentariaItensCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryFuncionariosAusenciasAfterInsert(DataSet: TDataSet);
begin
qryFuncionariosAusenciasCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryFuncionariosHistAfterScroll(DataSet: TDataSet);
begin
  if FrmTelaCadFuncionariosHist <> nil then
    begin
      case FrmTelaCadFuncionariosHist.CBConsSimples.ItemIndex of
        0:
          begin
            DM.qryFuncionariosTipoManutHist.Close;
            DM.qryFuncionariosTipoManutHist.SQL.Clear;
            DM.qryFuncionariosTipoManutHist.SQL.Add('SELECT `tipomanutencao`.`CODIGO` AS `CODMANUTENCAO`, `tipomanutencao`.`DESCRICAO` AS `MANUTENCAO`, COUNT(`ordemservico`.`CODIGO`) AS `TOTALOS`'
                                                    + ', SUM(`ordemservicoequipemobrautil`.`TOTALHOMEMHORA`) AS TOTALHOMEMHORA FROM `ordemservicoequipemobrautil`'
                                                    + ' INNER JOIN `funcionarios` ON (`ordemservicoequipemobrautil`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                                    + ' LEFT JOIN `celulas` ON  (`funcionarios`.`CODCELULA` = `celulas`.`CODIGO`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)        '
                                                    + ' INNER JOIN `ordemservico` ON (`ordemservicoequipemobrautil`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                                                    + ' INNER JOIN `tipomanutencao`ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)'
                                                    + ' WHERE (`ordemservicoequipemobrautil`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                                    + ' AND `ordemservicoequipemobrautil`.`MATRICULA` = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString)
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'''
                                                    + ') GROUP BY `MANUTENCAO` ORDER BY `MANUTENCAO` ASC;');
            DM.qryFuncionariosTipoManutHist.Open;
          end;
        1:
          begin
            DM.qryFuncionariosTipoManutHist.Close;
            DM.qryFuncionariosTipoManutHist.SQL.Clear;
            DM.qryFuncionariosTipoManutHist.SQL.Add('SELECT `tipomanutencao`.`CODIGO` AS `CODMANUTENCAO`, `tipomanutencao`.`DESCRICAO` AS `MANUTENCAO`, COUNT(`ordemservico`.`CODIGO`) AS `TOTALOS`'
                                                    + ', SUM(`ordemservicoequipemobrautil`.`TOTALHOMEMHORA`) AS TOTALHOMEMHORA FROM `ordemservicoequipemobrautil`'
                                                    + ' INNER JOIN `funcionarios` ON (`ordemservicoequipemobrautil`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                                    + ' LEFT JOIN `celulas` ON  (`funcionarios`.`CODCELULA` = `celulas`.`CODIGO`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)        '
                                                    + ' INNER JOIN `ordemservico` ON (`ordemservicoequipemobrautil`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                                                    + ' INNER JOIN `tipomanutencao`ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)'
                                                    + ' WHERE (`ordemservicoequipemobrautil`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                                    + ' AND `ordemservicoequipemobrautil`.`MATRICULA` = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString)
                                                    + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'''
                                                    + ' AND `celulas`.`TIPO` = ''Mecânica'''
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2)) + ',''%Y/%m/%d'') '
                                                    + ') GROUP BY `MANUTENCAO` ORDER BY `MANUTENCAO` ASC;');
            DM.qryFuncionariosTipoManutHist.Open;
          end;
        2:
          begin
            DM.qryFuncionariosTipoManutHist.Close;
            DM.qryFuncionariosTipoManutHist.SQL.Clear;
            DM.qryFuncionariosTipoManutHist.SQL.Add('SELECT `tipomanutencao`.`CODIGO` AS `CODMANUTENCAO`, `tipomanutencao`.`DESCRICAO` AS `MANUTENCAO`, COUNT(`ordemservico`.`CODIGO`) AS `TOTALOS`'
                                                    + ', SUM(`ordemservicoequipemobrautil`.`TOTALHOMEMHORA`) AS TOTALHOMEMHORA FROM `ordemservicoequipemobrautil`'
                                                    + ' INNER JOIN `funcionarios` ON (`ordemservicoequipemobrautil`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                                    + ' LEFT JOIN `celulas` ON  (`funcionarios`.`CODCELULA` = `celulas`.`CODIGO`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)        '
                                                    + ' INNER JOIN `ordemservico` ON (`ordemservicoequipemobrautil`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                                                    + ' INNER JOIN `tipomanutencao`ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)'
                                                    + ' WHERE (`ordemservicoequipemobrautil`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                                    + ' AND `ordemservicoequipemobrautil`.`MATRICULA` = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString)
                                                    + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'''
                                                    + ' AND `celulas`.`TIPO` = ''Elétrica'''
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2)) + ',''%Y/%m/%d'') '
                                                    + ') GROUP BY `MANUTENCAO` ORDER BY `MANUTENCAO` ASC;');
            DM.qryFuncionariosTipoManutHist.Open;
          end;
        3:
          begin
            DM.qryFuncionariosTipoManutHist.Close;
            DM.qryFuncionariosTipoManutHist.SQL.Clear;
            DM.qryFuncionariosTipoManutHist.SQL.Add('SELECT `tipomanutencao`.`CODIGO` AS `CODMANUTENCAO`, `tipomanutencao`.`DESCRICAO` AS `MANUTENCAO`, COUNT(`ordemservico`.`CODIGO`) AS `TOTALOS`'
                                                    + ', SUM(`ordemservicoequipemobrautil`.`TOTALHOMEMHORA`) AS TOTALHOMEMHORA FROM `ordemservicoequipemobrautil`'
                                                    + ' INNER JOIN `funcionarios` ON (`ordemservicoequipemobrautil`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                                    + ' LEFT JOIN `celulas` ON  (`funcionarios`.`CODCELULA` = `celulas`.`CODIGO`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)        '
                                                    + ' INNER JOIN `ordemservico` ON (`ordemservicoequipemobrautil`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                                                    + ' INNER JOIN `tipomanutencao`ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)'
                                                    + ' WHERE (`ordemservicoequipemobrautil`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                                    + ' AND `ordemservicoequipemobrautil`.`MATRICULA` = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString)
                                                    + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'''
                                                    + ' AND `celulas`.`TIPO` = ''Civil'''
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2)) + ',''%Y/%m/%d'') '
                                                    + ') GROUP BY `MANUTENCAO` ORDER BY `MANUTENCAO` ASC;');
            DM.qryFuncionariosTipoManutHist.Open;
          end;
        4:
          begin
            DM.qryFuncionariosTipoManutHist.Close;
            DM.qryFuncionariosTipoManutHist.SQL.Clear;
            DM.qryFuncionariosTipoManutHist.SQL.Add('SELECT `tipomanutencao`.`CODIGO` AS `CODMANUTENCAO`, `tipomanutencao`.`DESCRICAO` AS `MANUTENCAO`, COUNT(`ordemservico`.`CODIGO`) AS `TOTALOS`'
                                                    + ', SUM(`ordemservicoequipemobrautil`.`TOTALHOMEMHORA`) AS TOTALHOMEMHORA FROM `ordemservicoequipemobrautil`'
                                                    + ' INNER JOIN `funcionarios` ON (`ordemservicoequipemobrautil`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                                    + ' LEFT JOIN `celulas` ON  (`funcionarios`.`CODCELULA` = `celulas`.`CODIGO`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)        '
                                                    + ' INNER JOIN `ordemservico` ON (`ordemservicoequipemobrautil`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                                                    + ' INNER JOIN `tipomanutencao`ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)'
                                                    + ' WHERE (`ordemservicoequipemobrautil`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                                    + ' AND `ordemservicoequipemobrautil`.`MATRICULA` = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString)
                                                    + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'''
                                                    + ' AND `celulas`.`TIPO` = ''Apoio Técnico'''
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2)) + ',''%Y/%m/%d'') '
                                                    + ') GROUP BY `MANUTENCAO` ORDER BY `MANUTENCAO` ASC;');
            DM.qryFuncionariosTipoManutHist.Open;
          end;
        5:
          begin
            DM.qryFuncionariosTipoManutHist.Close;
            DM.qryFuncionariosTipoManutHist.SQL.Clear;
            DM.qryFuncionariosTipoManutHist.SQL.Add('SELECT `tipomanutencao`.`CODIGO` AS `CODMANUTENCAO`, `tipomanutencao`.`DESCRICAO` AS `MANUTENCAO`, COUNT(`ordemservico`.`CODIGO`) AS `TOTALOS`'
                                                    + ', SUM(`ordemservicoequipemobrautil`.`TOTALHOMEMHORA`) AS TOTALHOMEMHORA FROM `ordemservicoequipemobrautil`'
                                                    + ' INNER JOIN `funcionarios` ON (`ordemservicoequipemobrautil`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                                    + ' LEFT JOIN `celulas` ON  (`funcionarios`.`CODCELULA` = `celulas`.`CODIGO`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)        '
                                                    + ' INNER JOIN `ordemservico` ON (`ordemservicoequipemobrautil`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                                                    + ' INNER JOIN `tipomanutencao`ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)'
                                                    + ' WHERE (`ordemservicoequipemobrautil`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                                    + ' AND `ordemservicoequipemobrautil`.`MATRICULA` = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString)
                                                    + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'''
                                                    + ' AND `celulas`.`TIPO` = ''Produtiva'''
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2)) + ',''%Y/%m/%d'') '
                                                    + ') GROUP BY `MANUTENCAO` ORDER BY `MANUTENCAO` ASC;');
            DM.qryFuncionariosTipoManutHist.Open;
          end;
        6:
          begin
            DM.qryFuncionariosTipoManutHist.Close;
            DM.qryFuncionariosTipoManutHist.SQL.Clear;
            DM.qryFuncionariosTipoManutHist.SQL.Add('SELECT `tipomanutencao`.`CODIGO` AS `CODMANUTENCAO`, `tipomanutencao`.`DESCRICAO` AS `MANUTENCAO`, COUNT(`ordemservico`.`CODIGO`) AS `TOTALOS`'
                                                    + ', SUM(`ordemservicoequipemobrautil`.`TOTALHOMEMHORA`) AS TOTALHOMEMHORA FROM `ordemservicoequipemobrautil`'
                                                    + ' INNER JOIN `funcionarios` ON (`ordemservicoequipemobrautil`.`MATRICULA` = `funcionarios`.`MATRICULA`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                                                    + ' LEFT JOIN `celulas` ON  (`funcionarios`.`CODCELULA` = `celulas`.`CODIGO`) AND (`ordemservicoequipemobrautil`.`CODEMPRESA` = `celulas`.`CODEMPRESA`)        '
                                                    + ' INNER JOIN `ordemservico` ON (`ordemservicoequipemobrautil`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                                                    + ' INNER JOIN `tipomanutencao`ON (`ordemservico`.`CODMANUTENCAO` = `tipomanutencao`.`CODIGO`)'
                                                    + ' WHERE (`ordemservicoequipemobrautil`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                                    + ' AND `ordemservicoequipemobrautil`.`MATRICULA` = ' + QuotedStr(DM.qryFuncionariosHistMATRICULA.AsString)
                                                    + ' AND `ordemservico`.`SITUACAO` <> ''CANCELADA'''
                                                    + ' AND `celulas`.`TIPO` = ''Administrativa'''
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` >= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1)) + ',''%Y/%m/%d'') '
                                                    + ' AND `ordemservico`.`DATAFECHAMENTO` <= STR_TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2)) + ',''%Y/%m/%d'') '
                                                    + ') GROUP BY `MANUTENCAO` ORDER BY `MANUTENCAO` ASC;');
            DM.qryFuncionariosTipoManutHist.Open;
          end;
      end;

      DM.qryFuncionariosHistServicos.Close;
      DM.qryFuncionariosHistServicos.Params[0].AsString := DM.FCodEmpresa;
      DM.qryFuncionariosHistServicos.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
      DM.qryFuncionariosHistServicos.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2) + ' 23:59:59';
      DM.qryFuncionariosHistServicos.Params[3].AsString := DM.qryFuncionariosHistMATRICULA.AsString;
      DM.qryFuncionariosHistServicos.Open;
    end;
end;

procedure TDM.qryFuncionariosHistCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadFuncionariosHist <> nil then
  begin
    with FrmTelaCadFuncionariosHist do
      begin
        qryFuncionariosHistPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', EdtData1.Date) + ' a ' + FormatDateTime('dd/mm/yyyy', EdtData2.Date);
      end;
  end;
end;

procedure TDM.qryLubrificConsCalcFields(DataSet: TDataSet);
begin
qryLubrificConsC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(qryLubrificConsDTAINICIO1.AsDateTime));

//Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a lubrifica��o foi fechada ou n�o.
if DM.qryLubrificConsREPROGRAMAR1.AsString = 'Programação' then
  begin
    qryLubrificConsC_PROXINSP.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryLubrificConsFREQUENCIA1.AsInteger);
  end;
//Sendo a inspe��o reprogramada pela execu��o, definir como lubrifica��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
//a gera��o de outra lubrifica��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra lubrifica��o at� ser fechada.
if DM.qryLubrificConsREPROGRAMAR1.AsString = 'Execução' then
  begin
    if (DM.qryLubrificConsRELATORIO.AsString = 'S') then
      qryLubrificConsC_PROXINSP.AsDateTime := 0;
    if (DM.qryLubrificConsRELATORIO.AsString = 'N') then
      qryLubrificConsC_PROXINSP.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryLubrificConsFREQUENCIA1.AsInteger);
  end;

if FrmTelaInspConsulta <> nil then
  begin
    with FrmTelaInspConsulta do
      begin
        case CBPeriodo.ItemIndex of
          0: qryLubrificConsPERIODO.AsString := 'Vencidas';
          1: qryLubrificConsPERIODO.AsString := 'Próximos 7 dias';
          2: qryLubrificConsPERIODO.AsString := 'Próximos 15 dias';
          3: qryLubrificConsPERIODO.AsString := 'Próximos 30 dias';
          4: qryLubrificConsPERIODO.AsString := 'Próximos 60 dias';
          5: qryLubrificConsPERIODO.AsString := 'Próximos 90 dias';
          6: qryLubrificConsPERIODO.AsString := 'Próximos 180 dias';
          7: qryLubrificConsPERIODO.AsString := 'Próximos 365 dias';
        end;
      end;
  end;
end;

procedure TDM.qryLubrificPeriodicasAfterScroll(DataSet: TDataSet);
begin
  if FrmTelaInspFechamento <> nil then
  begin
    with FrmTelaInspFechamento do
    begin
      EdtMatricula.Clear;
      EdtResponsavel.Clear;

      if EdtMatricula.Text = '' then
        EdtMatricula.Text := qryLubrificPeriodicasMATRICULAOS.AsString;
      if EdtResponsavel.Text = '' then
        EdtResponsavel.Text := qryLubrificPeriodicasFUNCIONARIOOS.AsString;
    end;
  end;
end;

procedure TDM.qryLubrificPeriodicasCalcFields(DataSet: TDataSet);
begin
if FrmTelaInspFechamentoHist <> nil then
  begin
    qryLubrificPeriodicasPERIODO.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData2.Date)
  end;
end;

procedure TDM.qryLubrificPeriodicasHistCalcFields(DataSet: TDataSet);
begin
  if FrmTelaInspFechamentoHist <> nil then
    begin
      with FrmTelaInspFechamentoHist do
        begin
          qryLubrificPeriodicasHistPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', EdtData1.Date) + ' a ' + FormatDateTime('dd/mm/yyyy', EdtData2.Date);
        end;
    end;

end;

procedure TDM.qryLubrificPeriodicasHistItensCalcFields(DataSet: TDataSet);
begin
if qryLubrificPeriodicasHistItensEXECUTADO.AsString = 'S' then qryLubrificPeriodicasHistItensEXECUTADO_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensEXECUTADO_CHK.AsBoolean := False;
if qryLubrificPeriodicasHistItensBOM.AsString = 'S' then qryLubrificPeriodicasHistItensBOM_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensBOM_CHK.AsBoolean := False;
if qryLubrificPeriodicasHistItensREGULAR.AsString = 'S' then qryLubrificPeriodicasHistItensREGULAR_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensREGULAR_CHK.AsBoolean := False;
if qryLubrificPeriodicasHistItensRUIM.AsString = 'S' then qryLubrificPeriodicasHistItensRUIM_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryLubrificPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
begin
if qryLubrificPeriodicasHistItensEspEXECUTADO.AsString = 'S' then qryLubrificPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := False;
if qryLubrificPeriodicasHistItensEspBOM.AsString = 'S' then qryLubrificPeriodicasHistItensEspBOM_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensEspBOM_CHK.AsBoolean := False;
if qryLubrificPeriodicasHistItensEspREGULAR.AsString = 'S' then qryLubrificPeriodicasHistItensEspREGULAR_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensEspREGULAR_CHK.AsBoolean := False;
if qryLubrificPeriodicasHistItensEspRUIM.AsString = 'S' then qryLubrificPeriodicasHistItensEspRUIM_CHK.AsBoolean := True
else qryLubrificPeriodicasHistItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryLubrificPeriodicasItensCalcFields(DataSet: TDataSet);
begin
if qryLubrificPeriodicasItensEXECUTADO.AsString = 'S' then qryLubrificPeriodicasItensEXECUTADO_CHK.AsBoolean := True
else qryLubrificPeriodicasItensEXECUTADO_CHK.AsBoolean := False;
if qryLubrificPeriodicasItensBOM.AsString = 'S' then qryLubrificPeriodicasItensBOM_CHK.AsBoolean := True
else qryLubrificPeriodicasItensBOM_CHK.AsBoolean := False;
if qryLubrificPeriodicasItensREGULAR.AsString = 'S' then qryLubrificPeriodicasItensREGULAR_CHK.AsBoolean := True
else qryLubrificPeriodicasItensREGULAR_CHK.AsBoolean := False;
if qryLubrificPeriodicasItensRUIM.AsString = 'S' then qryLubrificPeriodicasItensRUIM_CHK.AsBoolean := True
else qryLubrificPeriodicasItensRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryLubrificPeriodicasItensEspCalcFields(DataSet: TDataSet);
begin
if qryLubrificPeriodicasItensEspEXECUTADO.AsString = 'S' then qryLubrificPeriodicasItensEspEXECUTADO_CHK.AsBoolean := True
else qryLubrificPeriodicasItensEspEXECUTADO_CHK.AsBoolean := False;
if qryLubrificPeriodicasItensEspBOM.AsString = 'S' then qryLubrificPeriodicasItensEspBOM_CHK.AsBoolean := True
else qryLubrificPeriodicasItensEspBOM_CHK.AsBoolean := False;
if qryLubrificPeriodicasItensEspREGULAR.AsString = 'S' then qryLubrificPeriodicasItensEspREGULAR_CHK.AsBoolean := True
else qryLubrificPeriodicasItensEspREGULAR_CHK.AsBoolean := False;
if qryLubrificPeriodicasItensEspRUIM.AsString = 'S' then qryLubrificPeriodicasItensEspRUIM_CHK.AsBoolean := True
else qryLubrificPeriodicasItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryLubrificProgEquipCalcFields(DataSet: TDataSet);
begin
if (FrmTelaInspVenc <> nil) or (FrmTelaInspConsulta <> nil) then
  begin
    qryLubrificProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
    qryLubrificProgEquipC_REIMPRESSAO.AsString    := 'N';
  end;
if qryLubrificProgEquipDTAINICIO1.AsString <> '' then
  qryLubrificProgEquipC_PROXINSP.AsDateTime := IncDay(qryLubrificProgEquipDTAINICIO1.AsDateTime, qryLubrificProgEquipFREQUENCIA1.AsInteger);

if (FrmTelaCadOrdemServicoGerencia <> nil)  then
  begin
    qryLubrificProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
    qryLubrificProgEquipC_REIMPRESSAO.AsString    := 'S';
  end;
end;

procedure TDM.qryLubrificProgEquipItensEspAfterInsert(DataSet: TDataSet);
begin
  qryLubrificProgEquipItensEspCODPARTE.AsInteger := qryLubrificProgEquipPartesCODIGO.AsInteger;
end;

procedure TDM.qryLubrificProgEquipPartesAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadLubrificProgEquipPartesItensEsp <> nil then
  begin
    DM.qryLubrificProgEquipItensEsp.Filtered := False;
    DM.qryLubrificProgEquipItensEsp.Filter := 'CODPARTE = ' + QuotedStr(DM.qryLubrificProgEquipPartesCODIGO.AsString);
    DM.qryLubrificProgEquipItensEsp.Filtered := True;
  end;
end;

procedure TDM.qryLubrificProgFamEquipItensAfterInsert(DataSet: TDataSet);
begin
  qryLubrificProgFamEquipItensCODEMPRESA.AsString := DM.FCodEmpresa;
  qryLubrificProgFamEquipItensCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificProgFamEquipCODIGO.AsString;
  qryLubrificProgFamEquipItensCODPARTE.AsInteger := qryLubrificProgFamEquipPartesCODIGO.AsInteger;
end;

procedure TDM.qryLubrificVencCalcFields(DataSet: TDataSet);
begin
 if qryLubrificVencDTAINICIO1.AsDateTime > 0 then
  qryLubrificVencC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(qryLubrificVencDTAINICIO1.AsDateTime))
else
  qryLubrificVencC_DIASATRASO.AsInteger := 0;
end;

procedure TDM.qryManutConsCalcFields(DataSet: TDataSet);
begin
qryManutConsC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(qryManutConsDTAINICIO1.AsDateTime));

//Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou n�o.
if DM.qryManutConsREPROGRAMAR1.AsString = 'Programação' then
  begin
    qryManutConsC_PROXINSP.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryManutConsFREQUENCIA1.AsInteger);
  end;
//Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
//a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o at� ser fechada.
if DM.qryManutConsREPROGRAMAR1.AsString = 'Execução' then
  begin
    if (DM.qryManutConsRELATORIO.AsString = 'S') then
      qryManutConsC_PROXINSP.AsDateTime := 0;
    if (DM.qryManutConsRELATORIO.AsString = 'N') then
      qryManutConsC_PROXINSP.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryManutConsFREQUENCIA1.AsInteger);
  end;

if FrmTelaInspConsulta <> nil then
  begin
    with FrmTelaInspConsulta do
      begin
        case CBPeriodo.ItemIndex of
          0: qryManutConsPERIODO.AsString := 'Vencidas';
          1: qryManutConsPERIODO.AsString := 'Próximos 7 dias';
          2: qryManutConsPERIODO.AsString := 'Próximos 15 dias';
          3: qryManutConsPERIODO.AsString := 'Próximos 30 dias';
          4: qryManutConsPERIODO.AsString := 'Próximos 60 dias';
          5: qryManutConsPERIODO.AsString := 'Próximos 90 dias';
          6: qryManutConsPERIODO.AsString := 'Próximos 180 dias';
          7: qryManutConsPERIODO.AsString := 'Próximos 365 dias';
        end;
      end;
  end;
end;

procedure TDM.qryManutPeriodicasAfterScroll(DataSet: TDataSet);
begin
  if FrmTelaInspFechamento <> nil then
  begin
    with FrmTelaInspFechamento do
    begin
      EdtMatricula.Clear;
      EdtResponsavel.Clear;
      if EdtMatricula.Text = '' then
        EdtMatricula.Text := qryManutPeriodicasMATRICULAOS.AsString;
      if EdtResponsavel.Text = '' then
        EdtResponsavel.Text := qryManutPeriodicasFUNCIONARIOOS.AsString;
    end;
  end;
end;

procedure TDM.qryManutPeriodicasCalcFields(DataSet: TDataSet);
begin
if FrmTelaInspFechamentoHist <> nil then
  begin
    qryManutPeriodicasPERIODO.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaInspFechamentoHist.EdtData2.Date)
  end;
end;

procedure TDM.qryManutPeriodicasHistCalcFields(DataSet: TDataSet);
begin
  if FrmTelaInspFechamentoHist <> nil then
    begin
      with FrmTelaInspFechamentoHist do
        begin
          qryManutPeriodicasHistPERIODOCONSULTA.AsString := FormatDateTime('dd/mm/yyyy', EdtData1.Date) + ' a ' + FormatDateTime('dd/mm/yyyy', EdtData2.Date);
        end;
    end;
end;

procedure TDM.qryManutPeriodicasHistItensCalcFields(DataSet: TDataSet);
begin
if qryManutPeriodicasHistItensEXECUTADO.AsString = 'S' then qryManutPeriodicasHistItensEXECUTADO_CHK.AsBoolean := True
else qryManutPeriodicasHistItensEXECUTADO_CHK.AsBoolean := False;
if qryManutPeriodicasHistItensBOM.AsString = 'S' then qryManutPeriodicasHistItensBOM_CHK.AsBoolean := True
else qryManutPeriodicasHistItensBOM_CHK.AsBoolean := False;
if qryManutPeriodicasHistItensREGULAR.AsString = 'S' then qryManutPeriodicasHistItensREGULAR_CHK.AsBoolean := True
else qryManutPeriodicasHistItensREGULAR_CHK.AsBoolean := False;
if qryManutPeriodicasHistItensRUIM.AsString = 'S' then qryManutPeriodicasHistItensRUIM_CHK.AsBoolean := True
else qryManutPeriodicasHistItensRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryManutPeriodicasHistItensEspCalcFields(DataSet: TDataSet);
begin
if qryManutPeriodicasHistItensEspEXECUTADO.AsString = 'S' then qryManutPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := True
else qryManutPeriodicasHistItensEspEXECUTADO_CHK.AsBoolean := False;
if qryManutPeriodicasHistItensEspBOM.AsString = 'S' then qryManutPeriodicasHistItensEspBOM_CHK.AsBoolean := True
else qryManutPeriodicasHistItensEspBOM_CHK.AsBoolean := False;
if qryManutPeriodicasHistItensEspREGULAR.AsString = 'S' then qryManutPeriodicasHistItensEspREGULAR_CHK.AsBoolean := True
else qryManutPeriodicasHistItensEspREGULAR_CHK.AsBoolean := False;
if qryManutPeriodicasHistItensEspRUIM.AsString = 'S' then qryManutPeriodicasHistItensEspRUIM_CHK.AsBoolean := True
else qryManutPeriodicasHistItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryManutPeriodicasItensCalcFields(DataSet: TDataSet);
begin
if qryManutPeriodicasItensEXECUTADO.AsString = 'S' then qryManutPeriodicasItensEXECUTADO_CHK.AsBoolean := True
else qryManutPeriodicasItensEXECUTADO_CHK.AsBoolean := False;
if qryManutPeriodicasItensBOM.AsString = 'S' then qryManutPeriodicasItensBOM_CHK.AsBoolean := True
else qryManutPeriodicasItensBOM_CHK.AsBoolean := False;
if qryManutPeriodicasItensREGULAR.AsString = 'S' then qryManutPeriodicasItensREGULAR_CHK.AsBoolean := True
else qryManutPeriodicasItensREGULAR_CHK.AsBoolean := False;
if qryManutPeriodicasItensRUIM.AsString = 'S' then qryManutPeriodicasItensRUIM_CHK.AsBoolean := True
else qryManutPeriodicasItensRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryManutPeriodicasItensEspCalcFields(DataSet: TDataSet);
begin
if qryManutPeriodicasItensEspEXECUTADO.AsString = 'S' then qryManutPeriodicasItensEspEXECUTADO_CHK.AsBoolean := True
else qryManutPeriodicasItensEspEXECUTADO_CHK.AsBoolean := False;
if qryManutPeriodicasItensEspBOM.AsString = 'S' then qryManutPeriodicasItensEspBOM_CHK.AsBoolean := True
else qryManutPeriodicasItensEspBOM_CHK.AsBoolean := False;
if qryManutPeriodicasItensEspREGULAR.AsString = 'S' then qryManutPeriodicasItensEspREGULAR_CHK.AsBoolean := True
else qryManutPeriodicasItensEspREGULAR_CHK.AsBoolean := False;
if qryManutPeriodicasItensEspRUIM.AsString = 'S' then qryManutPeriodicasItensEspRUIM_CHK.AsBoolean := True
else qryManutPeriodicasItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryManutProgEquipCalcFields(DataSet: TDataSet);
begin
if (FrmTelaInspVenc <> nil) or (FrmTelaInspConsulta <> nil) then
  begin
    qryManutProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
    qryManutProgEquipC_REIMPRESSAO.AsString    := 'N';
  end;
if qryManutProgEquipDTAINICIO1.AsString <> '' then
  qryManutProgEquipC_PROXINSP.AsDateTime := IncDay(qryManutProgEquipDTAINICIO1.AsDateTime, qryManutProgEquipFREQUENCIA1.AsInteger);

if (FrmTelaCadOrdemServicoGerencia <> nil)  then
  begin
    qryManutProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
    qryManutProgEquipC_REIMPRESSAO.AsString    := 'S';
  end;
end;

procedure TDM.qryManutProgEquipItensEspAfterInsert(DataSet: TDataSet);
begin
  qryManutProgEquipItensEspCODPARTE.AsInteger := qryManutProgEquipPartesCODIGO.AsInteger;
end;

procedure TDM.qryManutProgEquipPartesAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadManutProgEquipPartesItensEsp <> nil then
  begin
    DM.qryManutProgEquipItensEsp.Filtered := False;
    DM.qryManutProgEquipItensEsp.Filter := 'CODPARTE = ' + QuotedStr(DM.qryManutProgEquipPartesCODIGO.AsString);
    DM.qryManutProgEquipItensEsp.Filtered := True;
  end;
end;

procedure TDM.qryManutProgFamEquipItensAfterInsert(DataSet: TDataSet);
begin
  qryManutProgFamEquipItensCODEMPRESA.AsString := DM.FCodEmpresa;
  qryManutProgFamEquipItensCODMANUTPROGFAMEQUIP.AsString := DM.qryManutProgFamEquipCODIGO.AsString;
  qryManutProgFamEquipItensCODPARTE.AsInteger := qryManutProgFamEquipPartesCODIGO.AsInteger;
end;

procedure TDM.qryManutVencAfterGetRecords(DataSet: TFDDataSet);
begin
  if FrmTelaInspVenc <> nil then
    begin
      if DM.qryManutVenc.Active = True then
        FrmTelaInspVenc.TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutVenc.RecordCount)+')';
      //FrmTelaInspVenc.TSLubrific.Caption := 'Lubrificações ('+ IntToStr(CMWeb.CDCadLubrificVenc.RecordCount)+')';
    end;
end;

procedure TDM.qryManutVencCalcFields(DataSet: TDataSet);
begin
if qryManutVencDTAINICIO1.AsDateTime > 0 then
  qryManutVencC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(qryManutVencDTAINICIO1.AsDateTime))
else
  qryManutVencC_DIASATRASO.AsInteger := 0;
end;

procedure TDM.qryMonitMedicoesPtosInspAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadMonitoramento <> nil then
  with FrmTelaCadMonitoramento do
    begin
      if DM.qryMonitMedicoesPtosInsp.Active = True then
        begin
          if DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat > DM.qryMonitMedicoesPtosInspLIMSUPMAX.AsFloat then
            begin
              EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
              EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
              EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
              EdtLimSupMax.Color := clRed;     EdtLimSupMax.Font.Color := clWhite;
            end;

          if (DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat > DM.qryMonitMedicoesPtosInspLIMSUPSEG.AsFloat)
            and (DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat < DM.qryMonitMedicoesPtosInspLIMSUPMAX.AsFloat) then
              begin
                EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
                EdtLimInf.Color    := clBtnFace;  EdtLimInf.Font.Color := clBlack;
                EdtLimSup.Color    := clYellow; EdtLimSup.Font.Color := clRed;
                EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;
              end;

          if DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat < DM.qryMonitMedicoesPtosInspLIMINFMAX.AsFloat then
            begin
              EdtLimInfMax.Color := clRed;     EdtLimInfMax.Font.Color := clWhite;
              EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
              EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
              EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;
            end;

          if (DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat < DM.qryMonitMedicoesPtosInspLIMINFSEG.AsFloat)
            and (DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat >= DM.qryMonitMedicoesPtosInspLIMINFMAX.AsFloat) then
              begin
                EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
                EdtLimInf.Color    := clYellow;  EdtLimInf.Font.Color := clRed;
                EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
                EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;
              end;

          if (DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat < DM.qryMonitMedicoesPtosInspLIMSUPSEG.AsFloat)
            and (DM.qryMonitMedicoesPtosInspMEDICAO.AsFloat >= DM.qryMonitMedicoesPtosInspLIMINFSEG.AsFloat) then
              begin
                EdtLimInfMax.Color := clBtnFace; EdtLimInfMax.Font.Color := clBlack;
                EdtLimInf.Color    := clBtnFace; EdtLimInf.Font.Color := clBlack;
                EdtLimSup.Color    := clBtnFace; EdtLimSup.Font.Color := clBlack;
                EdtLimSupMax.Color := clBtnFace; EdtLimSupMax.Font.Color := clBlack;
              end;
        end;
    end;

end;

procedure TDM.qryOrdemServicoEquipeAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
  DM.qryOrdemServicoEquipeCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoHistoricoCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadOrdemServicoHistorico <> nil then
  begin
    qryOrdemServicoHistoricoPERIODO.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadOrdemServicoHistorico.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadOrdemServicoHistorico.EdtData2.Date)
  end;
end;

procedure TDM.qryOrdemServicoServExecAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoServExecCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
  DM.qryOrdemServicoServExecCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoServSolicAfterInsert(DataSet: TDataSet);
begin
//  DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoCODIGO.AsInteger;
  DM.qryOrdemServicoServSolicCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercForaAditivosAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercForaAditivosCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercForaOCAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercForaOCCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercForaOEAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercForaOECODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercForaOIAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercForaOICODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercUnidAditivosAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercUnidAditivosCODEMPRESA.AsString := DM.FCodEmpresa;
  DM.qryOrdemServicoTercUnidVALORFINAL.AsFloat;
end;

procedure TDM.qryOrdemServicoTercUnidMateriaisAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercUnidMateriaisCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercUnidMedicoesAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercUnidMedicoesCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercUnidPecasAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercUnidPecasCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryOrdemServicoTercUnidRecursoAfterInsert(DataSet: TDataSet);
begin
  DM.qryOrdemServicoTercUnidRecursoCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryPecaReposicaoKitItensAfterInsert(DataSet: TDataSet);
begin
qryPecaReposicaoKitItensCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryPecasReposicaoDadosAfterInsert(DataSet: TDataSet);
begin
qryPecasReposicaoDadosCODEMPRESA.AsString := DM.FCodEmpresa;
qryPecasReposicaoDadosCODPECAREPOSICAO.AsString := qryPecasReposicaoCODIGO.AsString;
qryPecasReposicaoDadosCODFAMILIAPECASREP.AsString := qryPecasReposicaoCODFAMILIAPECAREP.AsString;
end;

procedure TDM.qryPneusChassiCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassiRelat <> nil then
  begin
    qryPneusChassiPERIODO.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date)
  end;
end;

procedure TDM.qryPneusChassiCustoCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassiRelat <> nil then
  begin
    qryPneusChassiCustoPERIODO.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date);

    if FrmTelaCadPneusChassiRelat.RGTipo.ItemIndex = 1 then
      DM.qryPneusChassiCustoFILTRO.AsString := 'POSICAO'
    else
      DM.qryPneusChassiCustoFILTRO.Clear;
  end;
end;

procedure TDM.qryPneusChassiIDCustoCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassiRelat <> nil then
  begin
    qryPneusChassiIDCustoPERIODO.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date)
  end;
end;

procedure TDM.qryPneusChassiPosicoesAfterScroll(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassi <> nil then
  with FrmTelaCadPneusChassi do
    begin
      if DM.qryPneusChassiCHASSI.AsString = 'Carregadeira de Pneus' then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito'  then
            begin BtnPneu.Left := 58; BtnPneu.Top := 24; end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin BtnPneu.Left := 58; BtnPneu.Top := 126; end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito'   then
            begin BtnPneu.Left := 163; BtnPneu.Top := 24; end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo'  then
            begin BtnPneu.Left := 163; BtnPneu.Top := 126; end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Carro de Passeio C/Diferencial Duplo') or (DM.qryPneusChassiCHASSI.AsString = 'Carro de Passeio C/Diferencial Frontal') or (DM.qryPneusChassiCHASSI.AsString = 'Carro de Passeio C/Diferencial Trazeiro') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito'  then
            begin BtnPneu.Left := 25; BtnPneu.Top := 19; end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin BtnPneu.Left := 25; BtnPneu.Top := 97; end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito'   then
            begin BtnPneu.Left := 172; BtnPneu.Top := 19; end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo'  then
            begin BtnPneu.Left := 172; BtnPneu.Top := 97; end;
        end;
      if DM.qryPneusChassiCHASSI.AsString = 'Carroceria de Carreta C/ 1 Eixo' then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 98;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 33;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 89;
            end;
        end;
      if DM.qryPneusChassiCHASSI.AsString = 'Carroceria de Carreta C/ 2 Eixos' then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 98;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 33;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 89;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 98;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 33;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 89;
            end;
        end;
      if DM.qryPneusChassiCHASSI.AsString = 'Carroceria de Carreta C/ 3 Eixos' then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 98;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 33;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 124; BtnPneu.Top := 89;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 98;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 33;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 172; BtnPneu.Top := 89;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 98;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 33;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 229; BtnPneu.Top := 89;
            end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/2 Eixos C/Diferencial Frontal') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 25;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 36;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 92;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4º Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 36;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 92;
            end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/2 Eixos C/Diferencial Trazeiro') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 25;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo' then
            begin
              BtnPneu.Left := 75; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 36;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 233; BtnPneu.Top := 92;
            end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Duplo') or (DM.qryPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Frontal') or (DM.qryPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Trazeiro') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 36;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 92;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 36;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 232; BtnPneu.Top := 92;
            end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Cavalo Mecânico C/Diferencial Trazeiro') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 24;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 22; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 36;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 170; BtnPneu.Top := 92;
            end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Ônibus C/ 2 Eixos') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 20;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 100;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 21;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 31;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 86;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 95;
            end;
        end;
      if DM.qryPneusChassiCHASSI.AsString = 'Ônibus C/ 3 Eixos' then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 20;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 24; BtnPneu.Top := 100;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 21;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 31;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 86;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 215; BtnPneu.Top := 95;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 21;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 31;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 86;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 95;
            end;
        end;
      if DM.qryPneusChassiCHASSI.AsString = 'Patrol' then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 00; BtnPneu.Top := 33;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 00; BtnPneu.Top := 114;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito' then
            begin
              BtnPneu.Left := 200; BtnPneu.Top := 23;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 200; BtnPneu.Top := 124;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Traseiro Lado Direito' then
            begin
              BtnPneu.Left := 270; BtnPneu.Top := 23;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Traseiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 270; BtnPneu.Top := 124;
            end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Duplo') or (DM.qryPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Frontal') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 25;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 37;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 92;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 37;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3° Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 92;
            end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Trazeiro') then
        begin
            if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
              begin
                BtnPneu.Left := 20; BtnPneu.Top := 25;
              end;
            if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
              begin
                BtnPneu.Left := 20; BtnPneu.Top := 105;
              end;
            if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Externo' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 27;
              end;
            if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Externo' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 101;
              end;
            if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Direito Interno' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 37;
              end;
            if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Tras. Lado Esquerdo Interno' then
              begin
                BtnPneu.Left := 273; BtnPneu.Top := 92;
              end;
        end;
      if (DM.qryPneusChassiCHASSI.AsString = 'Pick-Up/Caminhão C/Diferencial Triplo') then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 25;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 20; BtnPneu.Top := 105;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2º Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2º Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2º Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 37;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2º Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 158; BtnPneu.Top := 92;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3º Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3º Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3º Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 37;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '3º Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 213; BtnPneu.Top := 92;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4º Eixo Tras. Lado Direito Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 27;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4º Eixo Tras. Lado Esquerdo Externo' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 101;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4º Eixo Tras. Lado Direito Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 37;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '4º Eixo Tras. Lado Esquerdo Interno' then
            begin
              BtnPneu.Left := 273; BtnPneu.Top := 92;
            end;
        end;
    if DM.qryPneusChassiCHASSI.AsString = 'Trator' then
        begin
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Direito' then
            begin
              BtnPneu.Left := 12; BtnPneu.Top := 32;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '1º Eixo Dianteiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 12; BtnPneu.Top := 112;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Direito' then
            begin
              BtnPneu.Left := 145; BtnPneu.Top := 21;
            end;
          if DM.qryPneusChassiPosicoesPOSICAO.AsString = '2° Eixo Traseiro Lado Esquerdo' then
            begin
              BtnPneu.Left := 145; BtnPneu.Top := 123;
            end;
        end;
    end;

end;

procedure TDM.qryPneusChassiPosicoesHistCalcFields(DataSet: TDataSet);
begin
if FrmTelaCadPneusChassi <> nil then
  begin
    qryPneusChassiPosicoesHistPERIODO.AsString := FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData1.Date) + ' - ' + FormatDateTime('dd/mm/yyyy', FrmTelaCadPneusChassiRelat.EdtData2.Date)
  end;
end;

procedure TDM.qryPneusDadosAfterInsert(DataSet: TDataSet);
begin
qryPneusDadosCODEMPRESA.AsString := DM.FCodEmpresa;
qryPneusDadosCODPNEU.AsString := qryPneusCODIGO.AsString;
qryPneusDadosCODFAMILIAPNEUS.AsString := qryPneusCODFAMILIAPNEU.AsString;
end;

procedure TDM.qryRecursoKitItensAfterInsert(DataSet: TDataSet);
begin
qryRecursoKitItensCODEMPRESA.AsString := DM.FCodEmpresa;
end;

procedure TDM.qryRecursosCalcFields(DataSet: TDataSet);
begin
if qryRecursosAMORTIZACAO.AsFloat > 0 then
  qryRecursosCUSTOHORA_CALC.AsFloat := qryRecursosPRECO.AsFloat/qryRecursosAMORTIZACAO.AsFloat;
end;

procedure TDM.qryRecursosDadosAfterInsert(DataSet: TDataSet);
begin
qryRecursosDadosCODEMPRESA.AsString := DM.FCodEmpresa;
qryRecursosDadosCODRECURSO.AsString := qryRecursosCODIGO.AsString;
qryRecursosDadosCODFAMILIARECURSOS.AsString := qryRecursosCODFAMILIARECURSO.AsString;
end;

procedure TDM.qryRelatGerencDespEquipCalcFields(DataSet: TDataSet);
begin
qryRelatGerencDespEquipCALC_TOTAL.AsFloat := qryRelatGerencDespEquipCUSTOMOBRA.AsFloat + qryRelatGerencDespEquipCUSTORECURSOS.AsFloat + qryRelatGerencDespEquipCUSTOPECAS.AsFloat + qryRelatGerencDespEquipCUSTOEXTRAS.AsFloat + qryRelatGerencDespEquipCUSTOSECUNDARIOS.AsFloat;
end;

procedure TDM.qryRelatGerencDispEquipCalcFields(DataSet: TDataSet);
begin
DM.qryTotalEquipHora.Filtered := False;
DM.qryTotalEquipHora.Filter   := 'CODIGO = ' + QuotedStr(DM.qryRelatGerencDispEquipCODIGO.AsString);
DM.qryTotalEquipHora.Filtered := True;

//if CMWeb.CDRelatGerencDispEquipCODIGO.AsString = 'ENV 05-003' then ShowMessage('J�');

DM.FTotalHorasParadas := DM.qryRelatGerencDispEquipHORASPARADASABERTAS.AsFloat + DM.qryRelatGerencDispEquipHORASPARADASFECHADAS.AsFloat;  //CMWeb.HorasParadasEquipamento(CMWeb.CDRelatGerencDispEquipCODIGO.AsString, EmptyStr, EmptyStr, EmptyStr);
DM.FTotalHorasFunc    := DM.qryTotalEquipHoraHOFICIAIS.AsFloat; //CMWeb.HorasCalendario(1, CMWeb.CDRelatGerencDispEquipCODIGO.AsString);
if DM.FTotalHorasParadas > DM.FTotalHorasFunc then
DM.FTotalHorasParadas := DM.FTotalHorasFunc;

DM.qryRelatGerencDispEquipDISP.AsFloat := 100 * (DM.FTotalHorasFunc - DM.FTotalHorasParadas)/DM.FTotalHorasFunc;
end;

procedure TDM.qryRotaConsCalcFields(DataSet: TDataSet);
begin
qryRotaConsC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(qryRotaConsDATAINICIO.AsDateTime));

//Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou n�o.
if DM.qryRotaConsREPROGRAMAR.AsString = 'Programação' then
  begin
    qryRotaConsC_PROXINSP.AsDateTime := IncDay(qryRotaConsDATAINICIO.AsDateTime, qryRotaConsFREQUENCIA.AsInteger);
  end;
//Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
//a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o at� ser fechada.
if DM.qryRotaConsREPROGRAMAR.AsString = 'Execução' then
  begin
    if (DM.qryRotaConsRELATORIO.AsString = 'S') then
      qryRotaConsC_PROXINSP.AsDateTime := 0;
    if (DM.qryRotaConsRELATORIO.AsString = 'N') then
      qryRotaConsC_PROXINSP.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryRotaConsFREQUENCIA.AsInteger);
  end;

if FrmTelaInspConsulta <> nil then
  begin
    with FrmTelaInspConsulta do
      begin
        case CBPeriodo.ItemIndex of
          0: qryRotaConsPERIODO.AsString := 'Vencidas';
          1: qryRotaConsPERIODO.AsString := 'Próximos 7 dias';
          2: qryRotaConsPERIODO.AsString := 'Próximos 15 dias';
          3: qryRotaConsPERIODO.AsString := 'Próximos 30 dias';
          4: qryRotaConsPERIODO.AsString := 'Próximos 60 dias';
          5: qryRotaConsPERIODO.AsString := 'Próximos 90 dias';
          6: qryRotaConsPERIODO.AsString := 'Próximos 180 dias';
          7: qryRotaConsPERIODO.AsString := 'Próximos 365 dias';
        end;
      end;
  end;
end;

procedure TDM.qryRotaEquipVencCalcFields(DataSet: TDataSet);
begin
if qryRotaEquipVencDATAINICIO.AsDateTime > 0 then
 qryRotaEquipVencC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(qryRotaEquipVencDATAINICIO.AsDateTime))
else
 qryRotaEquipVencC_DIASATRASO.AsInteger := 0;
end;

procedure TDM.qryRotaPeriodicasManutItensCalcFields(DataSet: TDataSet);
begin
if qryRotaPeriodicasManutItensEXECUTADO.AsString = 'S' then qryRotaPeriodicasManutItensEXECUTADO_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensEXECUTADO_CHK.AsBoolean := False;
if qryRotaPeriodicasManutItensBOM.AsString = 'S' then qryRotaPeriodicasManutItensBOM_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensBOM_CHK.AsBoolean := False;
if qryRotaPeriodicasManutItensREGULAR.AsString = 'S' then qryRotaPeriodicasManutItensREGULAR_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensREGULAR_CHK.AsBoolean := False;
if qryRotaPeriodicasManutItensRUIM.AsString = 'S' then qryRotaPeriodicasManutItensRUIM_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryRotaPeriodicasManutItensEspCalcFields(DataSet: TDataSet);
begin
if qryRotaPeriodicasManutItensEspEXECUTADO.AsString = 'S' then qryRotaPeriodicasManutItensEspEXECUTADO_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensEspEXECUTADO_CHK.AsBoolean := False;
if qryRotaPeriodicasManutItensEspBOM.AsString = 'S' then qryRotaPeriodicasManutItensEspBOM_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensEspBOM_CHK.AsBoolean := False;
if qryRotaPeriodicasManutItensEspREGULAR.AsString = 'S' then qryRotaPeriodicasManutItensEspREGULAR_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensEspREGULAR_CHK.AsBoolean := False;
if qryRotaPeriodicasManutItensEspRUIM.AsString = 'S' then qryRotaPeriodicasManutItensEspRUIM_CHK.AsBoolean := True
else qryRotaPeriodicasManutItensEspRUIM_CHK.AsBoolean := False;
end;

procedure TDM.qryRotasCalcFields(DataSet: TDataSet);
begin
if FrmTelaInspVenc <> nil then
  begin
    qryRotasC_CODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
  end;
if qryRotasDATAINICIO.AsString <> '' then
  qryRotasC_PROXINSP.AsDateTime := IncDay(qryRotasDATAINICIO.AsDateTime, qryRotasFREQUENCIA.AsInteger);
end;

procedure TDM.qryRotasFREQUENCIAValidate(Sender: TField);
begin
  if FrmTelaCadRotaProgEquip <> nil then
  begin
    DM.qryRotasSequenciaInsp.Close; DM.qryRotasSequenciaInsp.Open;
    DM.qryRotasSequenciaInspItens.Close; DM.qryRotasSequenciaInspItens.Open;
    DM.qryRotasSequenciaInspItensEsp.Close; DM.qryRotasSequenciaInspItensEsp.Open;
  end;
end;

function TDM.VerificaPrimeiroAcesso:Boolean;
var
  LSenhaAtual, LNovaSenha, LNovaSenhaConfirmacao : String;
begin
Result := False;

if DM.FNomeUsuario <> LowerCase('sam_spmp') then
  begin
    if (Trim(qryLoginSENHAALTERADA.AsString) <> 'S') then
      begin
        if Application.MessageBox('O sistema detectou que sua senha ainda não foi alterada desde o seu cadastro.'+#13+#13+'Será necessário fazê-lo agora, deseja prosseguir ?','SPMP', MB_YESNO + MB_ICONQUESTION)=IDYes then
          begin
            LSenhaAtual := PasswordInputBox('Senha temporária atual','Digite sua senha:');

            // Verificar senha informada.
            if (LSenhaAtual = EmptyStr) or (LSenhaAtual <> Crypt('D', qryLoginSENHA.AsString)) then
              begin
                MessageDlg('Senha temporária incorreta!', mtWarning, [mbOK], 0);
              end
            else
              begin // SenhaAtual foi informada corretamente.
                if LSenhaAtual = Crypt('D', qryLoginSENHA.AsString) then
                  begin
                    LNovaSenha := PasswordInputBox('Nova Senha','Digite sua nova senha.');
                    if Length(LNovaSenha) < 6 then
                      begin
                        Application.MessageBox('A senha deve conter pelo menos 6 caracteres!', 'SPMP3', MB_OK+MB_ICONSTOP);
                        DM.MSGAguarde('', False);
                      end
                    else
                      begin
                        LNovaSenhaConfirmacao := PasswordInputBox('Confirme Nova Senha','Confirme sua nova senha.');
                        if LNovaSenha <>  LNovaSenhaConfirmacao then
                          begin
                            Application.MessageBox('Senhas informadas são diferentes!', 'SPMP3', MB_OK+MB_ICONSTOP);
                            DM.MSGAguarde('', False);
                          end
                        else
                        if (LNovaSenha <> EmptyStr) and (LNovaSenhaConfirmacao <> EmptyStr) and (LNovaSenha = LNovaSenhaConfirmacao) then
                          begin
                            qryLogin.Edit;
                            qryLoginSENHA.AsString         := Crypt('C', LNovaSenha);
                            qryLoginSENHAALTERADA.AsString := 'S';
                            qryLoginBLOQUEIO.AsInteger     := 0;

                            qryLogin.Post;
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


function TDM.GerarOS(CodUsuario, CodEmpresa, Descricao, CodEquip, Manutencao,
  Lubrificacao, Rota, SolicTrab, Matricula, Prioridade,
  Criticidade, CentroCusto, Observacoes, tempototal, Oficina, TipoManutencao, EquipParado, Email: String): Integer;
begin
DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

qryGerarOS.Close;
qryGerarOS.Open;
qryGerarOS.Append;
qryGerarOSCUSTOMOBRA.AsFloat         := 0;
qryGerarOSCUSTORECURSOS.AsFloat      := 0;
qryGerarOSCUSTOPECAS.AsFloat         := 0;
qryGerarOSCUSTOEXTRA.AsFloat         := 0;
qryGerarOSCUSTOSECUNDARIOS.AsFloat   := 0;
qryGerarOSQTDEREPROG.AsFloat         := 0;
//qryGerarOSTEMPOPREVISTO.AsFloat      := 1;
qryGerarOSTEMPOHOMEMHORA.AsFloat     := 0;
qryGerarOSTEMPOHOMEMHORAEXEC.AsFloat := 0;
qryGerarOSTEMPOPREVISTO.AsFloat      := 0;
qryGerarOSTEMPOEXECUTADO.AsFloat     := 0;
qryGerarOSTEMPOHOMEMHORAEXEC.AsFloat := 0;
if EquipParado = '' then EquipParado := 'S';
if CodEquip     <> EmptyStr          then qryGerarOSCODEQUIPAMENTO.AsString       := CodEquip;
if Matricula    <> EmptyStr          then qryGerarOSMATRICULA.AsString            := Matricula;
if Manutencao   <> EmptyStr          then qryGerarOSCODMANUTPROGEQUIP.AsString    := Manutencao;
if Lubrificacao <> EmptyStr          then qryGerarOSCODLUBRIFICPROGEQUIP.AsString := Lubrificacao;
if Prioridade   <> EmptyStr          then qryGerarOSPRIORIDADEPARADA.AsString     := Prioridade;
if Criticidade  <> EmptyStr          then qryGerarOSCRITICIDADE.AsString          := Criticidade;
if Rota         <> EmptyStr          then qryGerarOSROTAEQUIP.AsString            := Rota;
if CentroCusto  <> EmptyStr          then qryGerarOSCODCENTROCUSTO.AsString       := CentroCusto;
if Observacoes  <> EmptyStr          then qryGerarOSOBSERVACOES.AsString          := Observacoes;
if tempototal   <> EmptyStr          then qryGerarOSTEMPOPREVISTO.AsFloat         := StrToFloat(tempototal);
if Oficina      <> EmptyStr          then qryGerarOSCODOFICINA.AsString           := Oficina;
if TipoManutencao <> EmptyStr        then qryGerarOSCODMANUTENCAO.AsString        := TipoManutencao;
if EquipParado  <> EmptyStr          then qryGerarOSEQUIPPARADO.AsString          := EquipParado;
if Email        <> EmptyStr          then qryGerarOSEMAIL.AsString                := Email;
qryGerarOSCODEMPRESA.AsString        := CodEmpresa;
qryGerarOSDESCRICAO.AsString         := Descricao;
qryGerarOSATIVO.AsString             := 'S';
qryGerarOSVISIVEL.AsString           := 'S';
qryGerarOSEXECAUTONOMO.AsString      := 'N';
qryGerarOSSOLICTRAB.AsString         := SolicTrab;
if SolicTrab = 'S' then qryGerarOSSITUACAO.AsString := 'SOLICITADA'
else qryGerarOSSITUACAO.AsString     := 'CADASTRADA';
qryGerarOSIMPPLANOTRAB.AsString      := 'S';
qryGerarOSREPROGRAMADA.AsString      := 'N';
qryGerarOSPARCIAL.AsString           := 'N';
qryGerarOSPARCIAL.AsString           := 'N';
qryGerarOSDATACADASTRO.AsDateTime    := qryDataHoraServidordatahoraservidor.AsDateTime;
qryGerarOSDATAULTALT.AsDateTime      := qryDataHoraServidordatahoraservidor.AsDateTime;
qryGerarOSCODUSUARIOCAD.AsString     := CodUsuario;
qryGerarOSCODUSUARIOALT.AsString     := CodUsuario;
qryGerarOS.Post;

Result := qryGerarOSCODIGO.AsInteger;

qryGerarOS.Close;
qryGerarOS.Close;
qryDataHoraServidor.Close;
end;


procedure TDM.HistoricoInspecoes(Tipo: SmallInt; CodEmpresa, CodEquip,
  Codigo: String; CodOrdemServico: Integer);
begin
  case Tipo of
    0:
      begin
        qryManutProgEquip.Close;
        qryManutProgEquip.Params[0].AsString := Codigo;
        qryManutProgEquip.Params[1].AsString := CodEmpresa;
        qryManutProgEquip.Params[2].AsString := CodEquip;
        qryManutProgEquip.Open;

        qryManutProgEquipItens.Close;
        qryManutProgEquipItens.Open;

        qryManutProgEquipItensEsp.Close;
        qryManutProgEquipItensEsp.Open;

        if qryManutProgEquip.IsEmpty = False then
          begin
            qryManutPeriodicas.Open;
            qryManutPeriodicas.Append;
            qryManutPeriodicasCODIGO.AsString               := Codigo;
            qryManutPeriodicasCODEMPRESA.AsString           := CodEmpresa;
            qryManutPeriodicasDESCRICAO.AsString            := qryManutProgEquipDESCRICAO.AsString;
            qryManutPeriodicasCODMANUTPROGFAMEQUIP.AsString := qryManutProgEquipCODMANUTPROGFAMEQUIP.AsString;
            qryManutPeriodicasREPROGRAMAR1.AsString         := qryManutProgEquipREPROGRAMAR1.AsString;
            qryManutPeriodicasFREQUENCIA1.AsString          := qryManutProgEquipFREQUENCIA1.AsString;
            qryManutPeriodicasCODEQUIPAMENTO.AsString       := qryManutProgEquipCODEQUIPAMENTO.AsString;
            qryManutPeriodicasDTAINICIO1.AsString           := qryManutProgEquipDTAINICIO1.AsString;
            qryManutPeriodicasCODORDEMSERVICO.AsInteger     := CodOrdemServico;
            qryManutPeriodicasCODMONITORAMENTO.AsString     := qryManutProgEquipCODMONITORAMENTO.AsString;
            qryManutPeriodicasSITUACAO.AsString             := 'ABERTA';
            qryManutPeriodicasREALIZADA.AsString            := 'N';
            qryManutPeriodicasGEROUOS.AsString              := 'S';
            qryManutPeriodicasGRUPOINSP.AsString            := 'N';
            qryManutPeriodicasRELATORIO.AsString            := 'S';
            qryManutPeriodicas.Post;

            qryManutPeriodicasItens.Close;
            qryManutPeriodicasItens.Open;

            qryManutPeriodicasItensEsp.Close;
            qryManutPeriodicasItensEsp.Open;

            while not qryManutProgEquipItens.Eof = True do
              begin
                qryManutPeriodicasItens.Append;
                qryManutPeriodicasItensCODEMPRESA.AsString           := qryManutProgEquipItensCODEMPRESA.AsString;
                qryManutPeriodicasItensHISTORICO.AsInteger           := qryManutPeriodicasINDICE.AsInteger;
                qryManutPeriodicasItensCODIGO.AsString               := qryManutProgEquipItensCODIGO.AsString;
                qryManutPeriodicasItensCODMANUTPROGEQUIP.AsString    := qryManutProgEquipCODIGO.AsString;
                qryManutPeriodicasItensCODPARTE.AsString             := qryManutProgEquipItensCODPARTE.AsString;
                qryManutPeriodicasItensITEM.AsString                 := qryManutProgEquipItensITEM.AsString;
                qryManutPeriodicasItensDESCINSPECAO.AsString         := qryManutProgEquipItensDESCINSPECAO.AsString;
                qryManutPeriodicasItensEQUIPPARADO.AsString          := qryManutProgEquipItensEQUIPPARADO.AsString;
                qryManutPeriodicasItensTEMPO.AsFloat                 := qryManutProgEquipItensTEMPO.AsFloat;
                qryManutPeriodicasItensEXECAUTONOMO.AsString         := qryManutProgEquipItensEXECAUTONOMO.AsString;
                qryManutPeriodicasItensEXECUTADO.AsString            := 'N';
                qryManutPeriodicasItensBOM.AsString                  := 'N';
                qryManutPeriodicasItensREGULAR.AsString              := 'N';
                qryManutPeriodicasItensRUIM.AsString                 := 'N';
                qryManutPeriodicasItens.Post;

                qryManutProgEquipItens.Next;
              end;


            while not qryManutProgEquipItensEsp.Eof = True do
              begin
                qryManutPeriodicasItensEsp.Append;
                qryManutPeriodicasItensEspCODEMPRESA.AsString           := qryManutProgEquipItensEspCODEMPRESA.AsString;
                qryManutPeriodicasItensEspHISTORICO.AsInteger           := qryManutPeriodicasINDICE.AsInteger;
                qryManutPeriodicasItensEspCODIGO.AsString               := qryManutProgEquipItensEspCODIGO.AsString;
                qryManutPeriodicasItensEspCODMANUTPROGEQUIP.AsString    := qryManutProgEquipItensEspCODMANUTPROGEQUIP.AsString;
                qryManutPeriodicasItensEspCODPARTE.AsString             := qryManutProgEquipItensEspCODPARTE.AsString;
                qryManutPeriodicasItensEspITEM.AsString                 := qryManutProgEquipItensEspITEM.AsString;
                qryManutPeriodicasItensEspDESCINSPECAO.AsString         := qryManutProgEquipItensEspDESCINSPECAO.AsString;
                qryManutPeriodicasItensEspEQUIPPARADO.AsString          := qryManutProgEquipItensEspEQUIPPARADO.AsString;
                qryManutPeriodicasItensEspTEMPO.AsFloat                 := qryManutProgEquipItensEspTEMPO.AsFloat;
                qryManutPeriodicasItensEspEXECAUTONOMO.AsString         := qryManutProgEquipItensEspEXECAUTONOMO.AsString;
                qryManutPeriodicasItensEspEXECUTADO.AsString            := 'N';
                qryManutPeriodicasItensEspBOM.AsString                  := 'N';
                qryManutPeriodicasItensEspREGULAR.AsString              := 'N';
                qryManutPeriodicasItensEspRUIM.AsString                 := 'N';
                qryManutPeriodicasItensEsp.Post;

                qryManutProgEquipItensEsp.Next;
              end;
          end;

        qryManutPeriodicas.Close;
        qryManutPeriodicasItens.Close;
        qryManutPeriodicasItensEsp.Close;
      end;
    1:
      begin
        qryLubrificProgEquip.Close;
        qryLubrificProgEquip.Params[0].AsString := Codigo;
        qryLubrificProgEquip.Params[1].AsString := CodEmpresa;
        qryLubrificProgEquip.Params[2].AsString := CodEquip;
        qryLubrificProgEquip.Open;

        qryLubrificProgEquipItens.Close;
        qryLubrificProgEquipItens.Params[0].AsString := CodEmpresa;
        qryLubrificProgEquipItens.Params[1].AsString := qryLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString;
        qryLubrificProgEquipItens.Open;

        qryLubrificProgEquipItensEsp.Close;
        qryLubrificProgEquipItensEsp.Params[0].AsString := CodEmpresa;
        qryLubrificProgEquipItensEsp.Params[1].AsString := qryLubrificProgEquipCODIGO.AsString;
        qryLubrificProgEquipItensEsp.Open;

        if qryLubrificProgEquip.IsEmpty = False then
          begin
            qryLubrificPeriodicas.Open;
            qryLubrificPeriodicas.Append;
            qryLubrificPeriodicasCODIGO.AsString               := Codigo;
            qryLubrificPeriodicasCODEMPRESA.AsString           := CodEmpresa;
            qryLubrificPeriodicasDESCRICAO.AsString            := qryLubrificProgEquipDESCRICAO.AsString;
            qryLubrificPeriodicasCODLUBRIFICPROGFAMEQUIP.AsString := qryLubrificProgEquipCODLUBRIFICPROGFAMEQUIP.AsString;
            qryLubrificPeriodicasREPROGRAMAR1.AsString         := qryLubrificProgEquipREPROGRAMAR1.AsString;
            qryLubrificPeriodicasFREQUENCIA1.AsString          := qryLubrificProgEquipFREQUENCIA1.AsString;
            qryLubrificPeriodicasCODEQUIPAMENTO.AsString       := qryLubrificProgEquipCODEQUIPAMENTO.AsString;
            qryLubrificPeriodicasDTAINICIO1.AsString           := qryLubrificProgEquipDTAINICIO1.AsString;
            qryLubrificPeriodicasCODORDEMSERVICO.AsInteger     := CodOrdemServico;
            qryLubrificPeriodicasCODMONITORAMENTO.AsString     := qryLubrificProgEquipCODMONITORAMENTO.AsString;
            qryLubrificPeriodicasSITUACAO.AsString             := 'ABERTA';
            qryLubrificPeriodicasREALIZADA.AsString            := 'N';
            qryLubrificPeriodicasGEROUOS.AsString              := 'S';
            qryLubrificPeriodicasGRUPOINSP.AsString            := 'N';
            qryLubrificPeriodicasRELATORIO.AsString            := 'S';
            qryLubrificPeriodicas.Post;

            qryLubrificPeriodicasItens.Close;
            qryLubrificPeriodicasItens.Params[0].AsString := qryLubrificPeriodicasINDICE.AsString;
            qryLubrificPeriodicasItens.Open;

            qryLubrificPeriodicasItensEsp.Close;
            qryLubrificPeriodicasItensEsp.Params[0].AsString := qryLubrificPeriodicasINDICE.AsString;
            qryLubrificPeriodicasItensEsp.Open;

            while not qryLubrificProgEquipItens.Eof = True do
              begin
                qryLubrificPeriodicasItens.Append;
                qryLubrificPeriodicasItensCODEMPRESA.AsString           := qryLubrificProgEquipItensCODEMPRESA.AsString;
                qryLubrificPeriodicasItensHISTORICO.AsInteger           := qryLubrificPeriodicasINDICE.AsInteger;
                qryLubrificPeriodicasItensCODIGO.AsString               := qryLubrificProgEquipItensCODIGO.AsString;
                qryLubrificPeriodicasItensCODLubrificPROGEQUIP.AsString    := qryLubrificProgEquipCODIGO.AsString;
                qryLubrificPeriodicasItensCODPARTE.AsString             := qryLubrificProgEquipItensCODPARTE.AsString;
                qryLubrificPeriodicasItensITEM.AsString                 := qryLubrificProgEquipItensITEM.AsString;
                qryLubrificPeriodicasItensDESCINSPECAO.AsString         := qryLubrificProgEquipItensDESCINSPECAO.AsString;
                qryLubrificPeriodicasItensEQUIPPARADO.AsString          := qryLubrificProgEquipItensEQUIPPARADO.AsString;
                qryLubrificPeriodicasItensTEMPO.AsFloat                 := qryLubrificProgEquipItensTEMPO.AsFloat;
                qryLubrificPeriodicasItensEXECAUTONOMO.AsString         := qryLubrificProgEquipItensEXECAUTONOMO.AsString;
                qryLubrificPeriodicasItensEXECUTADO.AsString            := 'N';
                qryLubrificPeriodicasItensBOM.AsString                  := 'N';
                qryLubrificPeriodicasItensREGULAR.AsString              := 'N';
                qryLubrificPeriodicasItensRUIM.AsString                 := 'N';
                qryLubrificPeriodicasItens.Post;

                qryLubrificProgEquipItens.Next;
              end;


            while not qryLubrificProgEquipItensEsp.Eof = True do
              begin
                qryLubrificPeriodicasItensEsp.Append;
                qryLubrificPeriodicasItensEspCODEMPRESA.AsString           := qryLubrificProgEquipItensEspCODEMPRESA.AsString;
                qryLubrificPeriodicasItensEspHISTORICO.AsInteger           := qryLubrificPeriodicasINDICE.AsInteger;
                qryLubrificPeriodicasItensEspCODIGO.AsString               := qryLubrificProgEquipItensEspCODIGO.AsString;
                qryLubrificPeriodicasItensEspCODLubrificPROGEQUIP.AsString    := qryLubrificProgEquipItensEspCODLubrificPROGEQUIP.AsString;
                qryLubrificPeriodicasItensEspCODPARTE.AsString             := qryLubrificProgEquipItensEspCODPARTE.AsString;
                qryLubrificPeriodicasItensEspITEM.AsString                 := qryLubrificProgEquipItensEspITEM.AsString;
                qryLubrificPeriodicasItensEspDESCINSPECAO.AsString         := qryLubrificProgEquipItensEspDESCINSPECAO.AsString;
                qryLubrificPeriodicasItensEspEQUIPPARADO.AsString          := qryLubrificProgEquipItensEspEQUIPPARADO.AsString;
                qryLubrificPeriodicasItensEspTEMPO.AsFloat                 := qryLubrificProgEquipItensEspTEMPO.AsFloat;
                qryLubrificPeriodicasItensEspEXECAUTONOMO.AsString         := qryLubrificProgEquipItensEspEXECAUTONOMO.AsString;
                qryLubrificPeriodicasItensEspEXECUTADO.AsString            := 'N';
                qryLubrificPeriodicasItensEspBOM.AsString                  := 'N';
                qryLubrificPeriodicasItensEspREGULAR.AsString              := 'N';
                qryLubrificPeriodicasItensEspRUIM.AsString                 := 'N';
                qryLubrificPeriodicasItensEsp.Post;

                qryLubrificProgEquipItensEsp.Next;
              end;
          end;

        qryLubrificPeriodicas.Close;
        qryLubrificPeriodicasItens.Close;
        qryLubrificPeriodicasItensEsp.Close;
      end;
    2:
      begin
        qryRotas.Close;
        qryRotas.Params[0].AsString := Codigo;
        qryRotas.Params[1].AsString := CodEmpresa;
        qryRotas.Open;

        qryRotasSequencia.Close;
        qryRotasSequencia.Open;

        qryRotasSequenciaInsp.Close;
        qryRotasSequenciaInsp.Open;

        qryRotasSequenciaInspItens.Close;
        qryRotasSequenciaInspItens.Open;

        qryRotasSequenciaInspItensEsp.Close;
        qryRotasSequenciaInspItensEsp.Open;

        qryManutPeriodicas.Open;

        qryManutPeriodicasItens.Close;
        qryManutPeriodicasItens.Open;

        qryManutPeriodicasItensEsp.Close;
        qryManutPeriodicasItensEsp.Open;

        while not qryRotasSequencia.Eof = True do
          begin

            while not qryRotasSequenciaInsp.Eof = True do
              begin
                qryManutPeriodicas.Append;
                qryManutPeriodicasCODIGO.AsString               := qryRotasSequenciaInspCODIGO.AsString;
                qryManutPeriodicasCODEMPRESA.AsString           := CodEmpresa;
                qryManutPeriodicasDESCRICAO.AsString            := qryRotasSequenciaInspDESCRICAO.AsString;
                qryManutPeriodicasCODMANUTPROGFAMEQUIP.AsString := qryRotasSequenciaInspCODMANUTPROGFAMEQUIP.AsString;
                qryManutPeriodicasREPROGRAMAR1.AsString         := qryRotasSequenciaInspREPROGRAMAR1.AsString;
                qryManutPeriodicasFREQUENCIA1.AsString          := qryRotasSequenciaInspFREQUENCIA.AsString;
                qryManutPeriodicasCODEQUIPAMENTO.AsString       := qryRotasSequenciaInspCODEQUIPAMENTO.AsString;
                qryManutPeriodicasDTAINICIO1.AsString           := qryRotasDATAINICIO.AsString;
                qryManutPeriodicasCODORDEMSERVICO.AsInteger     := CodOrdemServico;
                qryManutPeriodicasSITUACAO.AsString             := 'ABERTA';
                qryManutPeriodicasREALIZADA.AsString            := 'N';
                qryManutPeriodicasGEROUOS.AsString              := 'S';
                qryManutPeriodicasGRUPOINSP.AsString            := 'S';
                qryManutPeriodicasRELATORIO.AsString            := 'S';
                qryManutPeriodicas.Post;

                while not qryRotasSequenciaInspItens.Eof = True do
                  begin
                    qryManutPeriodicasItens.Append;
                    qryManutPeriodicasItensCODEMPRESA.AsString           := qryRotasSequenciaInspItensCODEMPRESA.AsString;
                    qryManutPeriodicasItensHISTORICO.AsInteger           := qryManutPeriodicasINDICE.AsInteger;
                    qryManutPeriodicasItensCODIGO.AsString               := qryRotasSequenciaInspItensCODIGO.AsString;
                    qryManutPeriodicasItensCODMANUTPROGEQUIP.AsString    := qryRotasSequenciaInspCODIGO.AsString;
                    qryManutPeriodicasItensCODPARTE.AsString             := qryRotasSequenciaInspItensCODPARTE.AsString;
                    qryManutPeriodicasItensITEM.AsString                 := qryRotasSequenciaInspItensITEM.AsString;
                    qryManutPeriodicasItensDESCINSPECAO.AsString         := qryRotasSequenciaInspItensDESCINSPECAO.AsString;
                    qryManutPeriodicasItensEQUIPPARADO.AsString          := qryRotasSequenciaInspItensEQUIPPARADO.AsString;
                    qryManutPeriodicasItensTEMPO.AsFloat                 := qryRotasSequenciaInspItensTEMPO.AsFloat;
                    qryManutPeriodicasItensEXECAUTONOMO.AsString         := qryRotasSequenciaInspItensEXECAUTONOMO.AsString;
                    qryManutPeriodicasItensEXECUTADO.AsString            := 'N';
                    qryManutPeriodicasItensBOM.AsString                  := 'N';
                    qryManutPeriodicasItensREGULAR.AsString              := 'N';
                    qryManutPeriodicasItensRUIM.AsString                 := 'N';
                    qryManutPeriodicasItens.Post;

                    qryRotasSequenciaInspItens.Next;
                  end;


                while not qryRotasSequenciaInspItensEsp.Eof = True do
                  begin
                    qryManutPeriodicasItensEsp.Append;
                    qryManutPeriodicasItensEspCODEMPRESA.AsString           := qryRotasSequenciaInspItensEspCODEMPRESA.AsString;
                    qryManutPeriodicasItensEspHISTORICO.AsInteger           := qryManutPeriodicasINDICE.AsInteger;
                    qryManutPeriodicasItensEspCODIGO.AsString               := qryRotasSequenciaInspItensEspCODIGO.AsString;
                    qryManutPeriodicasItensEspCODMANUTPROGEQUIP.AsString    := qryRotasSequenciaInspCODIGO.AsString;
                    qryManutPeriodicasItensEspCODPARTE.AsString             := qryRotasSequenciaInspItensEspCODPARTE.AsString;
                    qryManutPeriodicasItensEspITEM.AsString                 := qryRotasSequenciaInspItensEspITEM.AsString;
                    qryManutPeriodicasItensEspDESCINSPECAO.AsString         := qryRotasSequenciaInspItensEspDESCINSPECAO.AsString;
                    qryManutPeriodicasItensEspEQUIPPARADO.AsString          := qryRotasSequenciaInspItensEspEQUIPPARADO.AsString;
                    qryManutPeriodicasItensEspTEMPO.AsFloat                 := qryRotasSequenciaInspItensEspTEMPO.AsFloat;
                    qryManutPeriodicasItensEspEXECAUTONOMO.AsString         := qryRotasSequenciaInspItensEspEXECAUTONOMO.AsString;
                    qryManutPeriodicasItensEspEXECUTADO.AsString            := 'N';
                    qryManutPeriodicasItensEspBOM.AsString                  := 'N';
                    qryManutPeriodicasItensEspREGULAR.AsString              := 'N';
                    qryManutPeriodicasItensEspRUIM.AsString                 := 'N';
                    qryManutPeriodicasItensEsp.Post;

                    qryRotasSequenciaInspItensEsp.Next;
                  end;

                qryRotasSequenciaInsp.Next;
              end;

            qryRotasSequencia.Next;
          end;

        qryManutPeriodicas.Close;
        qryRotasSequencia.Close;
        qryRotasSequenciaInsp.Close;
        qryRotasSequenciaInspItens.Close;
        qryRotasSequenciaInspItensEsp.Close;

        qryManutPeriodicas.Open;
        qryManutPeriodicasItens.Close;
        qryManutPeriodicasItensEsp.Close;
      end;
  end;
end;

procedure TDM.ExibeFoto(DataSet : TDataSet; BlobFieldName: String; ImageExibicao: TImage);
var
MemoryStream: TMemoryStream;
jpg: TJpegImage;
png: TPNGImage;
begin
MemoryStream := TMemoryStream.Create;
if not(DataSet.IsEmpty) and not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
  try
    if DataSet <> DM.qryPneusChassiImagens then
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

procedure TDM.FDConnSPMP3Recover(ASender, AInitiator: TObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
var
  iRes: Integer;
begin
  iRes := Application.MessageBox(PChar('Não é possível conectar ao servidor ' + DM.FHost + #13 + 'Deseja tentar conectar novamente?'), 'SPMP3' ,MB_YESNO+MB_ICONSTOP);
  case iRes of
    mrYes: AAction := faRetry;
    mrNo:   AAction := faOfflineAbort;
//    mrCancel: AAction := faFail;
  end;
  DM.MSGAguarde('', False);
end;

function TDM.CampoInputBox(const ACaption, APrompt:string): string;
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

function TDM.VerificaDuplo(Valor: String): Boolean;
begin
Result := False;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
if DM.FTabela_auxiliar < 0 then Exit;

Try
  case DM.FTabela_auxiliar of
    1://Unidades
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, nome from empresa where `CODIGO` = '+ QuotedStr(Valor)+' and codgrupo = '+QuotedStr(DM.qryGruposCODIGO.AsString) + EmptyStr);
      end;
    2, 222://Adm. Corporativo
      begin
        case DM.FTabela_auxiliar of
//          2:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `CODIGO` = '+ QuotedStr(Valor)+' and codnivelacesso = ''ADC-00001'' OR codnivelacesso = ''USC-00001''');
//        222:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `NOME` LIKE '+ QuotedStr(Valor)+' and codnivelacesso = ''ADC-00001'' OR codnivelacesso = ''USC-00001''');
          2:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `CODIGO` = '+ QuotedStr(Valor));
        222:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `NOME` = '+ QuotedStr(Valor));
        end;
      end;
    3, 333://Adm. Unidade
      begin
        case DM.FTabela_auxiliar of
//          3:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `CODIGO` = '+ QuotedStr(Valor)+' and codnivelacesso = ''ADU-00001'' and codempresa = '+QuotedStr(DM.FParamAuxiliar[0]));
//        333:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `NOME` LIKE '+ QuotedStr(Valor)+' and codnivelacesso = ''ADU-00001'' and codempresa = '+QuotedStr(DM.FParamAuxiliar[0]));
        3:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `CODIGO` = '+ QuotedStr(Valor));
        333:DM.qryAuxiliar.SQL.Add('select codigo, nome from usuario where `NOME` = '+ QuotedStr(Valor));
        end;
      end;
    4://Centro de Custo
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from spmpma_spmp.centrocusto where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr);
      end;
    5://Classes
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from spmpma_spmp.classes where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr);
      end;
    6://Fam�lias de Equipamentos
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiaequipamento where `CODIGO` = '+ QuotedStr(Valor));
      end;
    7://Fam�lias de Pe�as
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiapecasreposicao where `CODIGO` = '+ QuotedStr(Valor));
      end;
    8://Fam�lias de Recursos
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, campo1, campo2, campo3, campo4, campo5, campo6, campo7, campo8, campo9, campo10, campo11 from familiarecursos where `CODIGO` = '+ QuotedStr(Valor));
      end;
    9://Causas de Falhas
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from causasfalha where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr);
      end;
    10://Tipos de Manuten��o
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipomanutencao from tipomanutencao where `CODIGO` = ' + QuotedStr(Valor) + EmptyStr);
      end;
    11://Motivos de Parada
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from motivoparada where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr);
      end;
    12://Tipos de Programa��o
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, tipo from tipoprogramacao where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr);
      end;
    13://Cargos
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from cargos where `CODIGO` = '+ QuotedStr(Valor) + EmptyStr);
      end;
    14://Almoxarifados
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `almoxarifado`.`CODIGO`, `almoxarifado`.`DESCRICAO`, `almoxarifado`.`MATERIAL`, `almoxarifado`.`NUMITENS`, `almoxarifado`.`AREA`, `centrocusto`.`DESCRICAO`CENTROCUSTO'
                               + ' FROM `almoxarifado` INNER JOIN `centrocusto` ON (`almoxarifado`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `almoxarifado`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `almoxarifado`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + EmptyStr);
      end;
    15://�reas
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from areas where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    16://C�lulas
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from celulas where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    17://Linhas
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from linhas where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    18://Sequ�ncias
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from sequencias where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codarea = ' + QuotedStr(DM.FParamAuxiliar[1]) + ' and codcelula = ' + QuotedStr(DM.FParamAuxiliar[2]) + ' and codlinha = ' + QuotedStr(DM.FParamAuxiliar[3]));
      end;
    19://Feriados
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, dataferiado from feriados where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    20://Oficinas
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `oficinas`.`CODIGO`, `oficinas`.`DESCRICAO`, `centrocusto`.`DESCRICAO` AS CENTROCUSTO FROM `oficinas` INNER JOIN `centrocusto`'
                               + ' ON (`oficinas`.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`) WHERE `oficinas`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `oficinas`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa));
      end;
    21://Fornecedores
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from fornecedor where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    22://Fabricantes
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from fabricante where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    23://Calend�rio de M�o de Obra
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from calendario where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    24://Calend�rio de Equipamentos
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from calendarioequip where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    25://Equipamentos
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` FAMILIAEQUIP FROM `equipamentos`'
                               + ' INNER JOIN `familiaequipamento` ON (`equipamentos`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`equipamentos`.`CODIGO` = '+ QuotedStr(Valor) +' AND `equipamentos`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ')');
      end;
    27://Disponibilidade
      begin
        DM.qryAuxiliar.SQL.Add('select coditem, codigo, tipoitem from disponibilidade where `CODITEM` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    29, 2900://Usu�rios
      begin
        case DM.FTabela_auxiliar of
          29:
            begin
              DM.qryAuxiliar.SQL.Add('SELECT `usuario`.`CODIGO`, `usuario`.`NOME`, `nivelacesso`.`DESCRICAO`NIVELACESSO FROM `usuario`'
                                     + ' INNER JOIN `nivelacesso` ON (`usuario`.`CODNIVELACESSO` = `nivelacesso`.`CODIGO`) WHERE (`usuario`.`CODIGO` = ' + QuotedStr(Valor) + ')');
            end;
        2900:
          begin
              DM.qryAuxiliar.SQL.Add('SELECT `usuario`.`CODIGO`, `usuario`.`NOME`, `nivelacesso`.`DESCRICAO`NIVELACESSO FROM `usuario`'
                                     + ' INNER JOIN `nivelacesso` ON (`usuario`.`CODNIVELACESSO` = `nivelacesso`.`CODIGO`) WHERE (`usuario`.`NOME` = ' + QuotedStr(Valor) + ')');
          end;
        end;
      end;
    30://Funcion�rios
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO` FROM funcionarios INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.`MATRICULA` = '+ QuotedStr(Valor) + ' AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ')');
      end;
    32://Manuten��es Programadas do Equipamento
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `manutprogequipamento`.`CODIGO`, `manutprogequipamento`.`DESCRICAO`, `manutprogequipamento`.`FREQUENCIA1`, `manutprogequipamento`.`FREQUENCIA2`, `manutprogfamequipamento`.`DESCRICAO` DESCMANUTPROGFAMEQUIP,'
                               + ' `equipamentos`.`DESCRICAO` EQUIPAMENTO FROM `manutprogequipamento` INNER JOIN `manutprogfamequipamento` ON (`manutprogequipamento`.`CODMANUTPROGFAMEQUIP` = `manutprogfamequipamento`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA`'
                               + ' = `manutprogfamequipamento`.`CODEMPRESA`) INNER JOIN `equipamentos` ON (`manutprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`manutprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE (`manutprogequipamento`.`CODIGO`'
                               + ' = '+ QuotedStr(Valor) + ' AND `manutprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+')');
      end;
    33://Lubrifica��es Programadas do Equipamento
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogequipamento`.`CODIGO`, `lubrificprogequipamento`.`DESCRICAO`, `lubrificprogequipamento`.`FREQUENCIA1`, `lubrificprogequipamento`.`FREQUENCIA2`, `lubrificprogfamequipamento`.`DESCRICAO` DESCLUBRIFICPROGFAMEQUIP,'
                               + ' `equipamentos`.`DESCRICAO` EQUIPAMENTO FROM `lubrificprogequipamento` INNER JOIN `lubrificprogfamequipamento` ON (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` = `lubrificprogfamequipamento`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA`'
                               + ' = `lubrificprogfamequipamento`.`CODEMPRESA`) INNER JOIN `equipamentos` ON (`lubrificprogequipamento`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`lubrificprogequipamento`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE'
                               + ' (`lubrificprogequipamento`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `lubrificprogequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+')');
      end;
    34://Manuten��o de Fam�lia de Equipamento
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `manutprogfamequipamento`.`CODIGO`, `manutprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO` FROM `manutprogfamequipamento` INNER JOIN `familiaequipamento`'
                               + ' ON (`manutprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`manutprogfamequipamento`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `manutprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ')');
      end;
    35://Lubrifica��o de Fam�lia de Equipamento
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `lubrificprogfamequipamento`.`CODIGO`, `lubrificprogfamequipamento`.`DESCRICAO`, `familiaequipamento`.`DESCRICAO` AS `FAMILIAEQUIPAMENTO` FROM `lubrificprogfamequipamento` INNER JOIN `familiaequipamento`'
                               + ' ON (`lubrificprogfamequipamento`.`CODFAMILIAEQUIP` = `familiaequipamento`.`CODIGO`) WHERE (`lubrificprogfamequipamento`.`CODIGO` = '+ QuotedStr(Valor) + ' AND `lubrificprogfamequipamento`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ')');
      end;
    36, 360://Pe�as de Reposi��o
      begin
        if DM.FParamAuxiliar[1] = 'CODIGO' then
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, referencia, quantidade Qtde from pecasreposicao where `CODIGO` = ' + QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
        if DM.FParamAuxiliar[1] = 'REFERENCIA' then
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, referencia, quantidade Qtde from pecasreposicao where `REFERENCIA` = ' + QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
        if DM.FParamAuxiliar[1] = 'DESCRICAO' then
          DM.qryAuxiliar.SQL.Add('select codigo, descricao, referencia, quantidade Qtde from pecasreposicao where `DESCRICAO` = ' + QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    39://Contadores
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `contadores`.`CODIGO`, `contadores`.`DESCRICAO`, `contadores`.`CODPROGRAMACAO`, `tipoprogramacao`.`DESCRICAO` AS `PROGRAMACAO` FROM `contadores`'
                               + ' LEFT JOIN `tipoprogramacao` ON (`contadores`.`CODPROGRAMACAO` = `tipoprogramacao`.`CODIGO`) where `contadores`.`codigo` = ' + QuotedStr(Valor) + ' and `contadores`.`codempresa` = '+QuotedStr(DM.FCodEmpresa) + ' order by `contadores`.`descricao`');
      end;
    40://Solicita��o de Trabalho
      begin
        DM.qryAuxiliar.SQL.Add('SELECT s.CODIGO, s.DESCSERVICO, e.DESCRICAO FROM solictrabalho s INNER JOIN equipamentos e ON (s.CODEQUIPAMENTO = e.CODIGO) AND (s.CODEMPRESA = e.CODEMPRESA) where s.DESCSERVICO like ' + QuotedStr(Valor) + ' and s.codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    41://Plano de Trabalho
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, detalhes from planotrabalho where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    46, 460://Recursos
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao, quantidade from recursos where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    47://Pontos de Inspe��o
      begin
        DM.qryAuxiliar.SQL.Add('select p.`CODIGO`, p.`DESCRICAO`, f.`DESCRICAO` AS `FAMILIAEQUIP` FROM `pontosinspecao` p INNER JOIN familiaequipamento f ON (p.`CODFAMILIAEQUIP` = f.`CODIGO`) WHERE p.`CODIGO` = '+ QuotedStr(Valor) + ' and p.codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    48://Contadores
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from contadores where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    50://Kit de Recursos
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from recursoskit where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    61://Ferramentaria
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from ferramentaria where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    62://Kit de Pe�as
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from pecasreposicaokit where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    64://Lubrificantes
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from lubrificantes where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
    6700://Tarefas de Ordens de Servi�os Terceirizadas
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `DESCRICAO` FROM `ordemservicotercunidtarefas` WHERE (`DESCRICAO` =  '+ QuotedStr(Valor) + '  AND `CODEMPRESA` = '+ QuotedStr(DM.FCodEmpresa)+' AND `CODORDEMSERVICO` = '+QuotedStr(DM.qryOrdemServicoTercUnidTarefasCODORDEMSERVICO.AsString)+')');
      end;
    68://Literturas T�cnicas
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnico where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
      end;
  //  69://Desenhos T�cnicos
  //    begin
  //      DM.qryAuxiliar.SQL.Add('select codigo, descricao from arquivotecnico where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa));
  //    end;
    78://Abastecimentos
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `controlecombustivel`.`CODIGO`, `equipamentos`.`CODIGO` AS `CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `EQUIPAMENTO` FROM `controlecombustivel`'
                               + ' INNER JOIN `equipamentos` ON (`controlecombustivel`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`) AND (`controlecombustivel`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`)'
                               + ' WHERE (`equipamentos`.`CODIGO` = ' + QuotedStr(Valor) + ' AND `controlecombustivel`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ')');
      end;
    80://Fam�lia de Pneus
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `familiapneus` WHERE `CODIGO` = ' + QuotedStr(Valor) + EmptyStr);
      end;
    82://Montagem de Chassi
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `pneusmontagemchassi`.`CODIGO`, `pneusmontagemchassi`.`CODEQUIPAMENTO`, `equipamentos`.`DESCRICAO` AS `EQUIPAMENTO`, `pneusmontagemchassi`.`CHASSI` FROM `pneusmontagemchassi` INNER JOIN `equipamentos` ON (`pneusmontagemchassi`.`CODEQUIPAMENTO`'
                               + ' = `equipamentos`.`CODIGO`) AND (`pneusmontagemchassi`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) WHERE (`equipamentos`.`CODIGO` = ' + QuotedStr(Valor) + ' AND `pneusmontagemchassi`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ')');
      end;
    83://Pneus
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `pneus`.`CODIGO`, `pneus`.`DESCRICAO`, `familiapneus`.`DESCRICAO` AS `FAMILIA` FROM `pneus` INNER JOIN `familiapneus`'
                               + ' ON (`pneus`.`CODFAMILIAPNEU` = `familiapneus`.`CODIGO`) WHERE (`pneus`.`CODIGO` = ' + QuotedStr(Valor) + ' AND `pneus`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ')');
      end;
    84://Rotas
      begin
        DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `DESCRICAO` FROM `rotasequipamento` WHERE `CODIGO` = ' + QuotedStr(Valor));
      end;
    86, 866://Monitoramento
      begin
        if DM.FTabela_auxiliar = 86 then
          begin
            DM.qryAuxiliar.SQL.Add('SELECT `monitoramento`.`CODIGO`, `monitoramento`.`DESCRICAO`, `contadores`.`DESCRICAO` AS `CONTADOR` FROM `monitoramento` INNER JOIN `contadores` ON (`monitoramento`.`CODEMPRESA` = `contadores`.`CODEMPRESA`)'
                                   + ' AND (`monitoramento`.`CODCONTADOR` = `contadores`.`CODIGO`) WHERE (`monitoramento`.`CODCONTADOR` = ' + QuotedStr(Valor) + ' AND `monitoramento`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ')');
          end
        else
          begin
            DM.qryAuxiliar.SQL.Add('SELECT `monitoramento`.`CODIGO`, `monitoramento`.`DESCRICAO`, `monitoramento`.`CODEMPRESA`, `pontosinspecao`.`DESCRICAO` AS `PONTO`, `pontosinspecaoloc`.`DESCRICAO` AS `LOCAL` FROM `monitoramento`'
                                   + ' INNER JOIN `pontosinspecao` ON (`monitoramento`.`CODEMPRESA` = `pontosinspecao`.`CODEMPRESA`) AND (`monitoramento`.`CODPONTOINSPECAO` = `pontosinspecao`.`CODIGO`)'
                                   + ' INNER JOIN `pontosinspecaoloc` ON (`monitoramento`.`CODPONTOINSPLOC` = `pontosinspecaoloc`.`CODIGO`) AND (`pontosinspecaoloc`.`CODPONTOINSP` = `pontosinspecao`.`CODIGO`) AND (`pontosinspecaoloc`.`CODEMPRESA` = `pontosinspecao`.`CODEMPRESA`)'
                                   + ' WHERE (`monitoramento`.`CODCONTADOR` = ' + QuotedStr(Valor) + ' AND `monitoramento`.`CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa) + ' AND `pontosinspecaoloc`.`CODIGO` = ' + QuotedStr(DM.qryMonitoramentoCODPONTOINSPLOC.AsString) + ')');
          end;
      end;
    90://Locais de Pontos de Inspe��o
      begin
        DM.qryAuxiliar.SQL.Add('select codigo, descricao from pontosinspecaoloc where `CODIGO` = '+ QuotedStr(Valor) + ' and codempresa = '+QuotedStr(DM.FCodEmpresa) + ' and codpontoinsp = '+ QuotedStr(DM.FParamAuxiliar[1]));
      end;
  end;
except
  on E: Exception do
  begin
    DM.GravaLog('Falha ao consultar registro duplicado. DM Linha: 8726', E.ClassName, E.Message);
    Application.MessageBox('Falha ao consultar registro duplicado!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
  end;
End;

DM.qryAuxiliar.Open;
if DM.qryAuxiliar.IsEmpty = False then
  Result := True;
end;

function TDM.ConsultarCombo:String;
begin
  Try
    Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
    FrmTelaAuxiliar.Caption := DM.FNomeConsulta;
    FrmTelaAuxiliar.ShowModal;
  Finally
    Result := DM.FCodCombo;
    FreeAndNil(FrmTelaAuxiliar);
  End;
end;

function TDM.AplicarMascara(Campo,Mascara:TStringField;Form:TForm):Boolean;
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

procedure TDM.GravaLog(linha1: string = ''; linha2: string = ''; linha3: string = '');
var
  DirLog: string;
  arquivo: TextFile;
begin
  try
    DirLog := ExtractFilePath(Application.ExeName) + 'SPMP3.log';
    AssignFile(arquivo, DirLog);//Cria o arquivo de Log
    if FileExists(DirLog) then //se o arquivo existe
      Append(arquivo) //adiciona linhas
    else//caso nao exista..
      Rewrite(arquivo);//cria o arquivo..

    Writeln(arquivo, '');
    Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
    if Length(linha1) > 0  then
      Writeln(arquivo, linha1);

    if Length(linha2) > 0  then
      Writeln(arquivo, linha2);

    if Length(linha3) > 0  then
      Writeln(arquivo, linha3);

    Writeln(arquivo, '<-------------------------------------------------------->');
    CloseFile(arquivo);
  except

  end;
end;

procedure TDM.CriaArquivoLog(var arquivo: TextFile);
begin
  AssignFile(arquivo, caminhoArquivo); //Cria o arquivo de Log
  if FileExists(caminhoArquivo) then //se o arquivo existe
    Append(arquivo) //adiciona linhas
  else    //caso nao exista..
    Rewrite(arquivo); //cria o arquivo..
end;

function TDM.IniciaServicoWin(sMachine, sService: string): boolean;
var
  schm,
  schs   : SC_Handle;
  ss     : TServiceStatus;
  psTemp : PChar;
  arquivo: TextFile;
begin
  schm := OpenSCManager(PChar(sMachine), Nil,SC_MANAGER_CONNECT);// connect to the service control manager
  if(schm > 0)then
  begin
    schs := OpenService(schm,PChar(sService),SERVICE_START or SERVICE_QUERY_STATUS);
    if(schs > 0)then
    begin
      QueryServiceStatus(schs,ss);//consulta o status do servico
      if (SERVICE_RUNNING <> ss.dwCurrentState) then
      begin //caso os servico nao esteja em execução, tente inicia-lo
        psTemp := Nil;
        if(StartService(schs, 0, psTemp)) then
        begin
          Sleep(3000); //espera 3 segundos, conectar e consulta o status
          if (QueryServiceStatus(schs,ss)) then
          begin     //se nao estiver iniciado ainda
            if (SERVICE_RUNNING <> ss.dwCurrentState) then
            begin
              Sleep(8000); //espera mais 8 segundos para consultar o status
              QueryServiceStatus(schs,ss);
            end;
            //verifica o status para registrar o log
            if (SERVICE_RUNNING = ss.dwCurrentState) then
            begin
              CriaArquivoLog(arquivo); //arquivo de log..
              Writeln(arquivo, '');
              Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
              Writeln(arquivo, 'Serviço do MySQL Reiniciado com Sucesso.');
              Writeln(arquivo, '<-------------------------------------------------------->');
              CloseFile(arquivo);
            end;
          end;
        end;
      end;
      CloseServiceHandle(schs); //close service handle
   end;
    CloseServiceHandle(schm);   //close service control manager handle
  end;
  Result := SERVICE_RUNNING = ss.dwCurrentState; //return TRUE if the service status is running
end;

procedure TDM.ConectaBanco(sIp: string);
var
   arquivo: TextFile;
begin
  Try
    FDConnSPMP3.Close;
    FDConnSPMP3.Connected := False;
    FDConnSPMP3.Params.Values['Database']  := DM.FDatabase;
    FDConnSPMP3.Params.Values['User_Name'] := DM.FUserName;
    FDConnSPMP3.Params.Values['Password']  := DM.FPassword;
    FDConnSPMP3.Params.Values['Server']    := DM.FHost;
    FDConnSPMP3.Params.Values['Port']      := DM.FPort;
    FDConnSPMP3.Connected := True;//realiza a conexão
    Conectou := true;

    CriaArquivoLog(arquivo); //registra o log
    Writeln(arquivo, '');
    Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
    Writeln(arquivo, 'Sucesso ao conectar com o banco de dados');
    Writeln(arquivo, '<-------------------------------------------------------->');
    CloseFile(arquivo);
  except
    On E:exception do
    begin
      CriaArquivoLog(arquivo); //registra o log
      Writeln(arquivo, '');
      Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
      Writeln(arquivo, 'Falha ao conectar com o banco de dados');
      Writeln(arquivo, 'Class: ' + E.ClassName);
      Writeln(arquivo, 'Falha: ' + E.Message);
      Writeln(arquivo, '<-------------------------------------------------------->');
      CloseFile(arquivo);
    end;
  end;
end;

procedure TDM.ReconectaBanco;
var
  sIp: string;
  arquivo: TextFile;
begin
 try
    Application.MessageBox('Falha na conexão ao Banco de Dados!','SPMP3.', MB_OK + MB_ICONEXCLAMATION);
    Conectou := false; //variavel que verifica se conectou..
    MSGAguarde('Aguarde');
    //se for um ip local e o diretorio do servidor existir é pq o banco de dados esta aqui,
    if (((sIp = '127.0.0.1') OR (UpperCase(sIp) = 'LOCALHOST')) AND (DirectoryExists(ExtractFilePath(application.ExeName) + 'servidor\'))) then //tenta iniciar o serviço mysql novamente..
      IniciaServicoWin('','mysql'); //tenta iniciar servico do mysql...

    ConectaBanco(sIp);
    if Conectou = true then //verifica se conectou
    begin
      CriaArquivoLog(arquivo);
      Writeln(arquivo, '');  //registra o log
      Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
      Writeln(arquivo, 'A conexão com o banco de dados foi restabelecida!');
      Writeln(arquivo, '<-------------------------------------------------------->');
      CloseFile(arquivo);
      Application.MessageBox('Sucesso ao restabelecer conexão!, Por favor, repita a operação. Caso persista o erro, contate o suporte.', 'SPMP3', MB_OK + MB_ICONINFORMATION);
    end else
    begin
      CriaArquivoLog(arquivo);
      Writeln(arquivo, '');  //registra o log
      Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
      Writeln(arquivo, 'Falha ao tentar restabelecer a conexão com o banco de dados!');
      Writeln(arquivo, '<-------------------------------------------------------->');
      CloseFile(arquivo);
      Application.MessageBox('Falha ao tentar restabelecer conexão!, caso persistir o erro, contate o suporte.', 'SPMP3', MB_OK + MB_ICONINFORMATION);
    end;
  except
    CriaArquivoLog(arquivo);
    Writeln(arquivo, ''); //registra o log
    Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
    Writeln(arquivo, 'Falha ao tentar restabelecer a conexão com o banco de dados!');
    Writeln(arquivo, '<-------------------------------------------------------->');
    CloseFile(arquivo);
    Application.MessageBox('Falha ao tentar restabelecer conexão!, caso persistir o erro, contate o suporte.', 'SPMP3', MB_OK + MB_ICONINFORMATION);
  end;
end;

function TDM.VerificaArquivoAberto(FileName: TFileName) : boolean;
var HFileRes: HFILE;
begin
  Result := False;
  if not FileExists(FileName) then Exit;
  HFileRes := CreateFile( PChar(FileName),
  GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING,
  FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  CloseHandle(HFileRes);
end;

procedure TDM.ApplicationEventsSPMPException(Sender: TObject; E: Exception);
var
//  Handle: TextFile;
  caminhoArquivo: string;
  arquivo: TextFile;
begin

begin
  caminhoArquivo := ExtractFilePath(Application.ExeName) + 'SPMP3.log';
  if (VerificaArquivoAberto(caminhoArquivo) = true) then
  begin
    try
      Closefile(Arquivo); // se o arquivo estava aberto, fecha...
    except

    end;
  end;
  AssignFile(arquivo, caminhoArquivo); //Cria o arquivo de Log
  if FileExists(caminhoArquivo) then //se o arquivo existe
    Append(arquivo) //adiciona linhas
  else    //caso nao exista..
    Rewrite(arquivo); //cria o arquivo..

  if ((UpperCase(E.Message) = 'MYSQL SERVER HAS GONE AWAY') OR (pos('CONNECT', UpperCase(E.Message)) > 0)) then
  begin   //se perdeu a conexão com o banco de dados
    //registra o log
    Writeln(arquivo, '');
    Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
    Writeln(arquivo, 'Falha ao conectar com o banco de dados');
    Writeln(arquivo, 'Class: ' + E.ClassName);
    Writeln(arquivo, 'Falha: ' + E.Message + ' - ' + Screen.ActiveForm.Name);
    Writeln(arquivo, '<-------------------------------------------------------->');
    CloseFile(arquivo);
    //tenta reconectar com o DB
    dm.ReconectaBanco;
  end else
  begin
    Writeln(arquivo, '');
    Writeln(arquivo, '<----------------------- ' + DateTimeToStr(now) + ' ---------------------->');
    Writeln(arquivo, 'Class: ' + E.QualifiedClassName);
    Writeln(arquivo, 'Falha: ' + E.Message + ' - ' + Screen.ActiveForm.Name);
    Writeln(arquivo, 'Sender:' + Sender.QualifiedClassName);
    Writeln(arquivo, '<-------------------------------------------------------->');
    CloseFile(arquivo);
  end;
end;
//  try
//    AssignFile(Handle, ExtractFilePath(Application.ExeName)+'\Error.log');
//    if not FileExists(ExtractFilePath(Application.ExeName)+'\Error.log') then
//      Rewrite(Handle);
//    Append(Handle);
//    WriteLn(Handle, DateTimeToStr(Now)+'> '+DM.FNomeUsuario+'> '+DM.FEstacao+'> '+ Screen.ActiveForm.Name+'> '+Screen.ActiveControl.Name+'> '+E.ClassName+' >'+E.Message);
//  finally
//    CloseFile(Handle);
//  end;
//
//  if (Pos('Access denied for user ', E.message) > 0) then
//    begin
//      MessageDlg('Conexão não autorizada com o banco de dados!', mtError, [mbOK], 0);
//    end
//  else
//  if (Pos('foreign key', E.message) > 0) or (Pos('parent row', E.message) > 0) or (Pos('constraint', E.message) > 0) then
//    begin
//      MessageDlg('Erro de chave estrangeira!', mtError, [mbOK], 0);
//    end
//  else
//  if ((Pos('Lost connection to MySQL server during query', E.Message) > 0) or (Pos('MySQL server has gone away', E.Message) > 0)) then
//     begin
//       DM.FDConnSPMP3.Rollback;
//       MessageDlg('Erro ao estabelecer conexão com o banco de dados ou conexão expirada, tente novamente.' + #13 +
//                  'Caso o erro se repita, favor entrar em contato com o administrador do sistema.', mtError, [mbOK], 0);
//
////       LTentaConexao := False;
////       //MessageDlg('Erro na comunica��o com o banco de dados, o sistema ser� fechado. Se o erro persistir, contacte o suporte', mtError, [mbOK], 0);
////       if Application.MessageBox('Erro de comunica��o com o servidor ou conex�o expirada, deseja tentar reconectar?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
////         begin
////           LTentaConexao := True;
////           while LTentaConexao = True do
////             Try
////               qryAuxiliar.Close;
////               qryAuxiliar.SQL.Add('select codigo from acessos where codigo = -1');
////               qryAuxiliar.Open;
////               MessageDlg('Comunica��o com o banco de dados restabelecida!', mtInformation, [mbOK], 0);
////               qryAuxiliar.Close;
////               LTentaConexao := False;
////             Except on E: Exception do
////               begin
////                 if Application.MessageBox('Erro na comunica��o com o banco de dados, deseja tentar novamente?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
////                   LTentaConexao := True
////                 else
////                   LTentaConexao := False;
////               end;
////             End;
////         end
////       else
////         begin
////           MessageDlg('Erro na comunica��o com o banco de dados, o sistema ser� fechado. Se o erro persistir, contacte o suporte', mtError, [mbOK], 0);
////           Application.Terminate;
////         end;
//     end
//  else
//  if (Pos('Unknown MySQL server host ', E.message) > 0) then
//    begin
//      DM.FDConnSPMP3.Rollback;
//      MessageDlg('Erro ao estabelecer conexão com o banco de dados no endereço informado.' + #13 +
//                 'Caso o erro se repita, favor entrar em contato com o administrador do sistema.', mtError, [mbOK], 0);
//    end
//  else
//  if E.ClassType = EDBEditError then
//    begin
//      MessageDlg('VALOR INVÁLIDO!'+#13+'Preencha o campo corretamente.', mtError, [mbOK], 0);
//    end
//  else
//  if E.ClassType = EConvertError then
//    begin
//      MessageDlg('VALOR INVÁLIDO!' + #13 + 'Erro de conversão, caso o erro persista contacte o suporte para solucionar o problema.', mtError, [mbOK], 0);      ;
//    end
//  else
//    begin
//      DM.FDConnSPMP3.Rollback;
//      MessageDlg('Ocorreu um erro não identificado:' + #13 + '"' + E.Message + '"' + #13 + 'Caso o problema persista contacte o suporte.', mtError, [mbOK], 0);
//    end;
//

  DM.MSGAguarde('', False);
end;

//procedure TDM.CliqueNoTitulo(Column: TColumn; Query: TClientDataSet);
//var
//  strColumn: string;
//  x: integer;
//  JaEstaEmUso: Boolean;
//  idOptions: TIndexOptions;
//  dbgrGrid: TDbGrid;
//begin
//dbgrGrid := TDbGrid(Column.Grid);
//with dbgrGrid.DataSource.DataSet do
//  begin
//    strColumn := INDICE_DEFAULT;
//
//    { Se for um campo calculado não faz nada }
//    if (Column.Field.FieldKind = fkCalculated) or (Column.Field.DataType in [ftBlob, ftMemo]) then
//      Exit;
//
//    {Verifica se o �ndice j� est� em uso}
//    JaEstaEmUso := Column.Field.FieldName = ClientDataSet.IndexName;
//
//    {Verifica a exist�ncia do �ndice e suas propriedades}
//    ClientDataSet.IndexDefs.Update;
//    for x := 0 to ClientDataSet.IndexDefs.Count - 1 do
//      begin
//        if ClientDataSet.IndexDefs.Items[x].Name = Column.Field.FieldName then
//          begin
//            strColumn := Column.Field.FieldName;
//            {Determina como deve ser criado o �ndice(ASC or DESC), inverte a condi��o ixDescending}
//            if ixDescending in ClientDataSet.IndexDefs.Items[x].Options then
//              idOptions := []
//            else
//              idOptions := [ixDescending]
//            {endif};
//          end
//        {endif};
//      end;
//
//    {Se não encontrou o �ndice ou o �ndice j� est� em uso}
//    if (strColumn = INDICE_DEFAULT ) or JaEstaEmUso then
//      begin
//        if JaEstaEmUso then
//          ClientDataSet.DeleteIndex(Column.Field.FieldName)
//        {endif};
//
//        try
//          ClientDataSet.AddIndex(Column.Field.FieldName, Column.Field.FieldName, idOptions, EmptyStr, EmptyStr, 0);
//          strColumn := Column.Field.FieldName;
//        except
//          {O �ndice est� indeterminado, ent�o � passado para o �ndice padr�o}
//          if JaEstaEmUso then
//            strColumn := INDICE_DEFAULT
//          {endif};
//        end;
//      end
//    {endif};
//
//    try
//      ClientDataSet.IndexName := strColumn;
//    except
//      ClientDataSet.IndexName := INDICE_DEFAULT;
//    end;
//
//    Column.Title.Color := GRID_COR_INDICE_TITULO;
//  end;
//
//  VoltaConfig_Titulo( dbgrGrid, Column.Index );
//end;


function TDM.HorasParadasEquipamento(CodEquipamento, Tipo, Area, Celula: String): Real;
var
//LDataInicioFechada, LDataFimFechada :TDateTime;
//I: SmallInt;
LTotal : Real;
begin
LTotal := 0;

if DateOf(DM.FDataConsulta2) = DateOf(DM.FDataHoraServidor) then
  DM.FDataConsulta2 := DM.FDataHoraServidor;

DM.qryRelatGerencHorasParadas.Close;
DM.qryRelatGerencHorasParadas.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
DM.qryRelatGerencHorasParadas.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta1);
DM.qryRelatGerencHorasParadas.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd hh:mm:ss', DM.FDataConsulta2) + ' 23:59:59';
DM.qryRelatGerencHorasParadas.Open;
DM.qryRelatGerencHorasParadas.Filtered := False;
if (CodEquipamento <> '') then
  begin
    DM.qryRelatGerencHorasParadas.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(CodEquipamento);
    DM.qryRelatGerencHorasParadas.Filtered := True;
  end
else
if (Area <> '') then
  begin
    DM.qryRelatGerencHorasParadas.Filter := 'CODAREA = ' + QuotedStr(Area);
    DM.qryRelatGerencHorasParadas.Filtered := True;
  end;

while not DM.qryRelatGerencHorasParadas.Eof = True do
  begin
    //Se j� terminou
    if (DM.qryRelatGerencHorasParadasHORASPARADAS.IsNull = False) and (DM.qryRelatGerencHorasParadasDATAINICIOREAL.AsDateTime >= DM.FDataConsulta1) then
        LTotal := LTotal + DM.qryRelatGerencHorasParadasHORASPARADAS.AsFloat;
    //Se não terminou
    if (DM.qryRelatGerencHorasParadasHORASPARADAS.IsNull = True) then
      begin
        //Se iniciou antes da data inicial da consulta
        if DM.qryRelatGerencHorasParadasDATAINICIOREAL.AsDateTime < DateOf(DM.FDataConsulta1) then
          LTotal := LTotal + MinutesBetween(DM.FDataConsulta1, DM.FDataConsulta2)/60
        else
          LTotal := LTotal + MinutesBetween(DM.qryRelatGerencHorasParadasDATAINICIOREAL.AsDateTime, DM.FDataConsulta2)/60;
      end;

    DM.qryRelatGerencHorasParadas.Next;
  end;

DM.FTotalParadasEquip := DM.qryRelatGerencHorasParadas.RecordCount;
Result := LTotal;
end;

function TDM.HorasCalendario(Tipo: SmallInt; CodEquip, CodArea: String):Real;
var
LDataConsulta : TDateTime;
LHorasReais : Real;
begin
LDataConsulta := FDataConsulta1;
LHorasReais   := 0;

case Tipo of
  0://M�o de Obra
    begin
      qryTotalHomemHora.Close;
      qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
      qryTotalHomemHora.Open;
      qryTotalHomemHoraSeqHora.Open;

      if (CodEquip <> EmptyStr) then
        begin
          qryTotalHomemHora.Filter := 'CODIGO = ' + QuotedStr(CodEquip);
          qryTotalHomemHora.Filtered := True;
        end
      else
        begin
          qryTotalHomemHora.Filter := '';
          qryTotalHomemHora.Filtered := False;
        end;

      while LDataConsulta < FDataConsulta2 do
        begin
          if DataFeriado(FormatDateTime('dd/mm/yyyy', LDataConsulta)) = False then
            LHorasReais := LHorasReais + TotalHomemHoraDisp(LDataConsulta, EmptyStr, EmptyStr);
          LDataConsulta := IncDay(LDataConsulta, 1);
        end;
    end;
  1://Equipamento
    begin
      qryTotalEquipHora.Close;
      qryTotalEquipHora.Params[0].AsString := DM.FCodEmpresa;
      qryTotalEquipHora.Open;
      qryTotalEquipHoraSeqHora.Open;

      if (CodEquip <> EmptyStr) and (CodArea <> EmptyStr) then
        begin
          qryTotalEquipHora.Filter := 'CODIGO = ' + QuotedStr(CodEquip) + ' AND CODAREA = ' + QuotedStr(CodArea);
          qryTotalEquipHora.Filtered := True;
        end
      else
      if (CodEquip <> EmptyStr) and (CodArea = EmptyStr) then
        begin
          qryTotalEquipHora.Filter := 'CODIGO = ' + QuotedStr(CodEquip);
          qryTotalEquipHora.Filtered := True;
        end
      else
      if (CodEquip = EmptyStr) and (CodArea <> EmptyStr) then
        begin
          qryTotalEquipHora.Filter := 'CODAREA = ' + QuotedStr(CodArea);
          qryTotalEquipHora.Filtered := True;
        end
      else
        begin
          qryTotalEquipHora.Filter := '';
          qryTotalEquipHora.Filtered := False;
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

function TDM.HorasFuncTotal:Real;
var
I: SmallInt;
begin
FTotalHorasFunc := 0;

with DM.qryAuxiliar do
  begin
    Close;
    DM.qryAuxiliar.SQL.Clear;
    SQL.Add('SELECT E.CODIGO CODEQUIPAMENTO, C.CODIGO CODCALENDARIOEQUIP, C.HOFICIAIS FROM `equipamentos` E, `calendarioequip` C '
             + ' WHERE E.CODCALENDARIO = C.CODIGO AND E.OPERANDO = ''S'' AND E.CODEMPRESA = :CODEMPRESA AND C.CODEMPRESA = E.CODEMPRESA ORDER BY E.CODIGO');
    Params.ParamByName('CODEMPRESA').AsString := DM.FCodEmpresa;
    Execute; Open; First;
    for I := 1 to DM.qryAuxiliar.RecordCount do
      begin
        FTotalHorasFunc := (FTotalHorasFunc + DM.qryAuxiliar.FieldByName('HOFICIAIS').AsFloat);
      end;
    Next;
  end;

FTotalHorasFunc := FTotalHorasFunc * DaysInMonth(FDataConsulta2);
Result := FTotalHorasFunc;
end;

function TDM.DataFeriado(Hora:String):Boolean;
begin
Result := False;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('select dataferiado, descricao from feriados where codempresa = '+QuotedStr(DM.FCodEmpresa) + ' order by descricao');
DM.qryAuxiliar.Open;
DM.qryAuxiliar.First;
while not DM.qryAuxiliar.Eof do
  begin
    if DM.qryAuxiliar.FieldByName('DATAFERIADO').AsString = Copy(Hora,1,5) then begin Result := True; Exit; end;
    DM.qryAuxiliar.Next;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Ini: TIniFile;
//  Handle: TextFile;
begin
  FDConnSPMP3.Connected := False;

  if FileExists(ExtractFilePath(Application.ExeName) + 'spmp.ini') then
  begin
    Ini :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'spmp.ini');

    DM.FDatabase := Ini.ReadString('Conexao', 'DataBase', '');
    DM.FHost     := Ini.ReadString('Conexao', 'HostName', '');
    DM.FUserName := Ini.ReadString('Conexao', 'User_Name', '');
    DM.FPort     := Ini.ReadString('Conexao', 'Port', '');
    DM.FPassword := Crypt('D', (Ini.ReadString( 'Conexao', 'Password', '')));

    DM.FHostFTP     := Ini.ReadString('Update', 'HostFTP', '');
    DM.FPasswordFTP := Ini.ReadString('Update', 'PasswordFTP', '');
    DM.FUsernameFTP := Ini.ReadString('Update', 'UsernameFTP', '');

//    DM.FServerPathExeVersion := Ini.ReadString( 'ARQUIVOS', 'exeRemoto', '');
    DM.FServerPathExeVersion := '\\'+DM.FHost+'\update_sam\spmp3.exe';

    FDConnSPMP3.Params.Values['Database']  := DM.FDatabase;
    FDConnSPMP3.Params.Values['User_Name'] := DM.FUserName;
    FDConnSPMP3.Params.Values['Password']  := DM.FPassword;
    FDConnSPMP3.Params.Values['Server']    := DM.FHost;
    FDConnSPMP3.Params.Values['Port']      := DM.FPort;

    Ini.Free;
  end else
  begin
    Try
      Application.CreateForm(TFrmTelaGerenciador, FrmTelaGerenciador);
      FrmTelaGerenciador.ShowModal;
    Finally
      FreeAndNil(FrmTelaGerenciador);
    End;
  end;

  //Buscar informações de configuração
  DM.qryConfigs.Close;
  DM.qryConfigs.Open;
  DM.FTempoNovaOS    := DM.qryConfigstempoconsos.AsInteger;
  DM.FTempoSenhaUsu  := DM.qryConfigstemposenhausu.AsInteger;
  DM.FQtdeMinSenha   := DM.qryConfigsqtdeminsenha.AsInteger;
  DM.FQtdeLoginTent  := DM.qryConfigsqtdelogintent.AsInteger;
  DM.FMinutosInativo := DM.qryConfigstempomaxocioso.AsInteger;
  DM.FVersaoBanco    := DM.qryConfigsversion.AsInteger;
  DM.FAutoUpdate     := DM.qryConfigsautoupdate.AsBoolean;
  DM._EMAIL          := DM.qryConfigsemail.AsString;
  DM._SENHA          := DM.qryConfigssenhaemail.AsString;
  DM._PORTA          := DM.qryConfigsportaemail.AsString;
  DM._SMTP           := DM.qryConfigssmtp.AsString;

  //Consulta as versões da máquina e no repositório
  DM.FUrlSPMPBuilder := 'https://github.com/masiopadilha/spmp/releases/latest';
  DM.GetVersionLocal(Application.ExeName);
  DM.FVersaoRepo := DM.GetVersionRepo;

//
//  if DM.FAutoUpdate = True then
//  begin
//    if DM.FVersaoBanco > DM.FVersaoMaquina then
//    begin
//      try
//        DM.CheckUpdateVersion;
//      except
//        on E: Exception do
//        begin
//          GravaLog('Falha ao buscar atualização do SPMP3. DM Linha: 8911', E.ClassName, E.Message);
//          Application.MessageBox('Falha ao buscar atualização do SPMP3!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
//        end;
//      end;
//    end else
//    if DM.FVersaoBanco < DM.FVersaoMaquina then
//    begin
//      DM.qryConfigs.Edit;
//      DM.qryConfigsversion.AsInteger := DM.FVersaoMaquina;
//      DM.qryConfigs.Post;
//      DM.FVersaoBanco := DM.FVersaoMaquina;
//    end;
//  end;
end;

procedure TDM.dsOrdemServicoGerenciaDataChange(Sender: TObject; Field: TField);
begin
  if FrmTelaCadOrdemServicoGerencia <> nil then
  begin
    with FrmTelaCadOrdemServicoGerencia do
    begin
      StatusBar1.Panels[0].Text := '';
      StatusBar1.Panels[1].Text := '';
      StatusBar1.Panels[2].Text := '';
      StatusBar1.Panels[3].Text := '';

      StatusBar1.Panels[0].Text := Format('%d of %d', [qryOrdemServicoGerencia.RecNo + 1, qryOrdemServicoGerencia.RecordCount]);

      if DM.qryOrdemServicoGerenciaHHTOTAL.Value <> Null then
        StatusBar1.Panels[1].Text := 'HH Total: ' + FormatCurr(',0.00', DM.qryOrdemServicoGerenciaHHTOTAL.Value)
      else
        StatusBar1.Panels[1].Text := 'HH Total: 0.00' ;

      if DM.qryOrdemServicoGerencia.FieldByName('FUNCIONARIO').AsString <> '' then
        StatusBar1.Panels[2].Text  := 'Solicitante: ' + DM.qryOrdemServicoGerencia.FieldByName('FUNCIONARIO').AsString
      else
        StatusBar1.Panels[2].Text  := 'Solicitante: Não informado';

      if ((qryOrdemServicoGerenciaCODMANUTPROGEQUIP.AsString <> '') or (qryOrdemServicoGerenciaCODLUBRIFICPROGEQUIP.AsString <> ''))
        and (qryOrdemServicoGerencia.FieldByName('PLANEJADA').AsDateTime > 0) then
          StatusBar1.Panels[3].Text := 'Planejada: ' + FormatDateTime('dd/mm/yyyy', DM.qryOrdemServicoGerencia.FieldByName('PLANEJADA').AsDateTime);

      if DM.qryOrdemServicoGerenciaSITUACAO.AsString      = 'CADASTRADA'    then
        StatusBar1.Panels[3].Text := 'Cadastrada: '   + FormatDateTime('dd/mm/yy hh:mm', DM.qryOrdemServicoGerencia.FieldByName('DATACADASTRO').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'SOLICITADA'    then
        StatusBar1.Panels[3].Text := 'Oficina: '      + DM.qryOrdemServicoGerencia.FieldByName('OFICINA').AsString
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'DETALHADA'     then
        StatusBar1.Panels[3].Text := 'Cadastrada: '   + FormatDateTime('dd/mm/yy hh:mm', DM.qryOrdemServicoGerencia.FieldByName('DATACADASTRO').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'PROGRAMADA'    then
        StatusBar1.Panels[3].Text := 'Programada: '   + FormatDateTime('dd/mm/yy hh:mm', DM.qryOrdemServicoGerencia.FieldByName('DATACADASTRO').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'REPROGRAMADA'  then
        StatusBar1.Panels[3].Text := 'Reprogramada: ' + FormatDateTime('dd/mm/yy hh:mm', DM.qryOrdemServicoGerencia.FieldByName('DATAPROGINI').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'DESPROGRAMADA' then
        StatusBar1.Panels[3].Text := 'Cadastrada: '   + FormatDateTime('dd/mm/yy hh:mm', DM.qryOrdemServicoGerencia.FieldByName('DATACADASTRO').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'EXECUCAO'      then
        StatusBar1.Panels[3].Text := 'Iniciada: '     + FormatDateTime('dd/mm/yy hh:mm', DM.qryOrdemServicoGerencia.FieldByName('DATAINICIOREAL').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'LIBERADA'      then
        StatusBar1.Panels[3].Text := 'Finalizada: '   + FormatDateTime('dd/mm/yy', DM.qryOrdemServicoGerencia.FieldByName('DATAFIMREAL').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'FECHADA'       then
        StatusBar1.Panels[3].Text := 'Fechamento: '   + FormatDateTime('dd/mm/yy', DM.qryOrdemServicoGerencia.FieldByName('DATAFECHAMENTO').AsDateTime)
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'PARALISADA'    then
        StatusBar1.Panels[3].Text := 'Motivo: '       + DM.qryOrdemServicoUltParalisacao.FieldByName('MOTIVOPARALISACAO').AsString
      else if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'CANCELADA'     then
      begin
        if DM.qryOrdemServicoGerencia.FieldByName('DATACANCEL').AsDateTime <> 0 then
          StatusBar1.Panels[3].Text := 'Cancelada: '    + FormatDateTime('dd/mm/yy hh:mm', DM.qryOrdemServicoGerencia.FieldByName('DATACANCEL').AsDateTime) +' - '+ DM.qryOrdemServicoGerencia.FieldByName('OBSERVACOES').AsString
        else
          StatusBar1.Panels[3].Text := 'Cancelada: '    + DM.qryOrdemServicoGerencia.FieldByName('OBSERVACOES').AsString;
      end else
      if DM.qryOrdemServicoGerenciaSITUACAO.AsString = 'VENCIDA'       then
        StatusBar1.Panels[3].Text := 'Planejada: '    + FormatDateTime('dd/mm/yy', DM.qryOrdemServicoGerencia.FieldByName('PLANEJADA').AsDateTime);
    end;
  end;

end;

function TDM.TotalHomemHoraDisp(Data: TDateTime; Matricula, TipoCelula: String): Real;
var
  LTotal: Real;
  I, LQtdDias, LSequencia : Integer;
  LDataClicada : TDateTime;
begin
  LDataClicada := Data;
  LTotal       := 0;

  if DM.qryTotalHomemHora.Active = False then
  begin
    DM.qryTotalHomemHora.Close;
    DM.qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
    DM.qryTotalHomemHora.Open;
    DM.qryTotalHomemHoraSeqHora.Open;
  end;

  if Matricula <> EmptyStr then
    begin
      qryTotalHomemHora.Filter   := 'MATRICULA = ' + QuotedStr(Matricula);
      qryTotalHomemHora.Filtered := True;
    end;

  if TipoCelula <> EmptyStr then
    begin
      DM.qryTotalHomemHora.Filter   := 'TIPOCELULA = ' + QuotedStr(TipoCelula);
      DM.qryTotalHomemHora.Filtered := True;
    end;


  for I := 1 to qryTotalHomemHora.RecordCount do
    begin
      LSequencia := 0;

      if LDataClicada > 0 then
        begin
          qryTotalHomemHoraSeqHora.First;
          while not qryTotalHomemHoraSeqHora.Eof do
            begin
              LSequencia := LSequencia + 1;
              qryTotalHomemHoraSeqHora.Next;
            end;
          LQtdDias := DaysBetween(0, LDataClicada);

          if LSequencia > 0 then
             begin
              LQtdDias := LQtdDias mod LSequencia;
              if (LQtdDias = 0) then LQtdDias := StrToInt(qryTotalHomemHoraSeqHoraSEQUENCIA.AsString);
             end;

          qryTotalHomemHoraSeqHora.Locate('SEQUENCIA', LQtdDias,[LopartiALKey,LocaseInsensitive]);
        end;

      LTotal := LTotal + ((qryTotalHomemHoraSeqHoraHHDISP1.AsFloat/60) + (qryTotalHomemHoraSeqHoraHHDISP2.AsFloat/60) + (qryTotalHomemHoraSeqHoraHHDISP3.AsFloat/60) + (qryTotalHomemHoraSeqHoraHHDISP4.AsFloat/60));

      qryTotalHomemHora.Next;
    end;


  if Matricula <> EmptyStr then
    begin
      qryTotalHomemHora.Filter   := EmptyStr;
      qryTotalHomemHora.Filtered := False;
    end;


//  DM.qryTotalHomemHora.Close;
//  DM.qryTotalHomemHoraSeqHora.Close;

  Result := LTotal;
end;

function TDM.TotalEquipHoraDisp(Data: TDateTime): Real;
var
LTotal: Real;
LQtdDias, LSequencia : Integer;
LDataClicada : TDateTime;
begin
LDataClicada := Data;
LTotal       := 0;

while not qryTotalEquipHora.Eof = True do
  begin
    LSequencia := 0;

    if LDataClicada > 0 then
      begin
        qryTotalEquipHoraSeqHora.First;
        while not qryTotalEquipHoraSeqHora.Eof do
          begin
            LSequencia := LSequencia + 1;
            qryTotalEquipHoraSeqHora.Next;
          end;
        LQtdDias   := DaysBetween(0, LDataClicada);

        if LSequencia > 0 then
           begin
            LQtdDias := LQtdDias mod LSequencia;
            if (LQtdDias = 0) then LQtdDias := StrToInt(qryTotalEquipHoraSeqHoraSEQUENCIA.AsString);
           end;

        qryTotalEquipHoraSeqHora.Locate('SEQUENCIA', LQtdDias,[LopartiALKey,LocaseInsensitive]);
      end;

    LTotal := LTotal + Round((qryTotalEquipHoraSeqHoraHHDISP1.AsFloat/60) + (qryTotalEquipHoraSeqHoraHHDISP2.AsFloat/60) + (qryTotalEquipHoraSeqHoraHHDISP3.AsFloat/60) + (qryTotalEquipHoraSeqHoraHHDISP4.AsFloat/60));

    qryTotalEquipHora.Next;
  end;

qryTotalEquipHora.First;

Result := LTotal;
end;

function TDM.AnalisarImportancia:SmallInt;
Begin
Result := 0;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Emergência' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 18;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Emergência' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 17;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Emergência' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 16;

if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 12 hs' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 15;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 12 hs' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 14;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 12 hs' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 13;

if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 72 hs' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 12;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 72 hs' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 11;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 72 hs' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 10;

if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Semana' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 9;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Semana' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 8;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Semana' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 7;

if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Mês' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 6;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Mês' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 5;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Até 1 Mês' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 4;

if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Acima de um Mês' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Fábrica' then
     Result := 3;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Acima de um Mês' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para a Área' then
     Result := 2;
if Trim(qryOrdemServico.FieldByName('PRIORIDADEPARADA').AsString) = 'Acima de um Mês' then
  if Trim(qryOrdemServico.FieldByName('CRITICIDADE').AsString) = 'Para o Equipamento' then
     Result := 1;
End;

procedure TDM.SetJPGCompression(ACompression: integer; const AInFile: string; const AOutFile: string);
var
  iCompression: integer;
  oJPG: TJPegImage;
  oBMP: TBitMap;
begin
  { Forcar a Compressi�o para a faixa entre 1..100 }
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

  { Fazer a Compress�o e salva o novo arquivo }
  oJPG.CompressionQuality := iCompression;
  oJPG.Compress;
  oJPG.SaveToFile(AOutFile);

  { Limpar }
  oJPG.Free;
  oBMP.Free;
end;

function TDM.JpgToBmp(cImage: String): Boolean;
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

procedure TDM.RegistrarMovimentacao(Operacao, CodEmpresa, CodUsuario, Modulo,
  Estacao: String);
//var
//  sWindowsDir : String;
//  Handle: TextFile;
begin
//if DM.SQLConnSPMP3Web.ConnectionState = csStateClosed then Exit;
//if (LowerCase(CMWeb.FNomeUsuario) = 'sam_spmp') then Exit;
////DM.FDataHoraServidor := DM.DataHoraServidor;
//if Operacao = 'ACESSO' then
//  begin
//    qryMovimentacaoUsuarios.First;
//    if qryMovimentacaoUsuarios.Locate('MODULO;DATASAIDA', VarArrayOf([Modulo, Null]), []) = False then
//      begin
//        qryMovimentacaoUsuarios.Append;
//        qryMovimentacaoUsuariosCODEMPRESA.AsString   := DM.FCodEmpresa;
//        qryMovimentacaoUsuariosUSUARIO.AsString      := DM.FCodUsuario;
//        qryMovimentacaoUsuariosMODULO.AsString       := Modulo;
//        qryMovimentacaoUsuariosDATAACESSO.AsDateTime := now();
//        qryMovimentacaoUsuariosESTACAO.AsString      := DM.FEstacao;
//        DM.qryMovimentacaoUsuarios.Post;
//      end;
//  end;
//if Operacao = 'SAIDA' then
//  begin
//    qryMovimentacaoUsuarios.First;
//    if qryMovimentacaoUsuarios.Locate('MODULO;DATASAIDA', VarArrayOf([Modulo, Null]), []) = True then
//      begin
//        qryMovimentacaoUsuarios.Edit;
//        qryMovimentacaoUsuariosDATASAIDA.AsDateTime := now();
//        DM.qryMovimentacaoUsuarios.Post;
//      end;
//  end;
//
//
//  sWindowsDir := GetEnvironmentVariable('LOCALAPPDATA');
//
//  ForceDirectories(sWindowsDir+'\SPMP3');
//
//  try
//    AssignFile(Handle, sWindowsDir+'\SPMP3\user.log');
//
//    if not FileExists(sWindowsDir+'\SPMP3\user.log') then
//      Rewrite(Handle);
//    Append(Handle);
//    WriteLn(Handle, Operacao+'> '+DateTimeToStr(Now)+'> '+DM.FNomeUsuario+'> '+DM.FEstacao+'> '+ Screen.ActiveForm.Caption);
//  finally
//    CloseFile(Handle);
//  end;
end;

procedure TDM.ConsultarAlertas;
var
I, LAntecipar, LProlongar: SmallInt;
LVencimento : TDateTime;
begin
if FrmTelaCadAlertas <> nil then Exit;

//if FrmTelaPrincipal <> nil then
//  begin
//    FrmTelaPrincipal.PAlertas.Font.Color := clGreen;
//    if FrmTelaPrincipal.TimerLetreiro.Enabled = False then Exit;
//  end;

qryAlertas.Close;
qryAlertas.Params[0].AsString := DM.FCodEmpresa;
qryAlertas.Open;

FAlerta := EmptyStr;
if qryAlertas.IsEmpty = False then
  begin
    for I := 1 to qryAlertas.RecordCount do
      begin
        LVencimento := DateOf(qryAlertasVENCIMENTO.AsDateTime);
        LAntecipar  := qryAlertas.FieldByName('ANTECIPAR').AsInteger;
        LProlongar  := qryAlertas.FieldByName('PROLONGAR').AsInteger;

        if (DateOf(FDataHoraServidor) >= IncDay(LVencimento, (LAntecipar * (-1)))) and (DateOf(FDataHoraServidor) <= (IncDay(LVencimento, LProlongar))) then
          begin
            if I = 1 then
              FAlerta := FAlerta + qryAlertas.FieldByName('DESCRICAO').AsString + ' em '+FormatDateTime('dd/mm/yyyy', LVencimento)
            else
              FAlerta := FAlerta + '  |  ' + qryAlertas.FieldByName('DESCRICAO').AsString + ' em '+FormatDateTime('dd/mm/yyyy', qryAlertas.FieldByName('VENCIMENTO').AsDateTime)
          end;
        qryAlertas.Next;
      end;
  end;

qryAlertasOS.Close;
qryAlertasOS.Params.ParamByName('codempresa').AsString  := FCodEmpresa;
qryAlertasOS.Params.ParamByName('data1').AsString  := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -12)) + ' 00:00:00';
qryAlertasOS.Params.ParamByName('data2').AsString  := FormatDateTime('yyyy/mm/dd', DateOf(DM.FDataHoraServidor)) + ' 23:59:59';
qryAlertasOS.Open;

if FAlerta = EmptyStr then FAlerta := 'Ordens de Serviços: CADASTRADAS = ' + FormatFloat('00', qryAlertasOSTOTALCAD.AsFloat)
else FAlerta := FAlerta + '  |  ' + 'Ordens de Serviços: CADASTRADAS = ' + FormatFloat('00', qryAlertasOSTOTALCAD.AsFloat);

if FAlerta = EmptyStr then FAlerta := 'Ordens de Serviços: PROGRAMADAS = ' + FormatFloat('00', qryAlertasOSTOTALPROG.AsFloat)
else FAlerta := FAlerta + '  |  ' + 'Ordens de Serviços: PROGRAMADAS = ' + FormatFloat('00', qryAlertasOSTOTALPROG.AsFloat);

if FAlerta = EmptyStr then FAlerta := 'Ordens de Serviços: EXECUÇÃO = ' + FormatFloat('00', qryAlertasOSTOTALEXEC.AsFloat)
else FAlerta := FAlerta + '  |  ' + 'Ordens de Serviços: EXECUÇÃO = ' + FormatFloat('00', qryAlertasOSTOTALEXEC.AsFloat);

qryAlertasRotas.Close;
qryAlertasRotas.Params[0].AsString   := FCodEmpresa;
qryAlertasRotas.Params[1].AsDateTime := DateOf(FDataHoraServidor);
qryAlertasRotas.Open;
FAlerta := FAlerta + '  |  ' + 'Rotas Vencidas = ' + FormatCurr('00', qryAlertasRotasTOTAL.AsInteger);

qryAlertasManut.Close;
qryAlertasManut.Params[0].AsString   := FCodEmpresa;
qryAlertasManut.Params[1].AsDateTime := DateOf(FDataHoraServidor);
qryAlertasManut.Open;
FAlerta := FAlerta + '  |  ' + 'Manutenções Vencidas = ' + FormatCurr('00', qryAlertasManutTOTAL.AsInteger);

qryAlertasLubrific.Close;
qryAlertasLubrific.Params[0].AsString   := FCodEmpresa;
qryAlertasLubrific.Params[1].AsDateTime := DateOf(FDataHoraServidor);
qryAlertasLubrific.Open;

FAlerta := FAlerta + '  |  ' + 'Lubrificações Vencidas = ' + FormatCurr('00', qryAlertasLubrificTOTAL.AsInteger);

if (DM.qryUsuarioCODNIVELACESSO.AsString = 'ADU-00001') then
  begin
    if DM.qryOrdemServicoGerencia.RecordCount > FTotalOS then
      begin
        Winapi.Windows.Beep(1800,100);
        Sleep(250);
        Winapi.Windows.Beep(1800,100);
        DM.FTotalOS := DM.qryOrdemServicoGerencia.RecordCount;
      end;
  end;

qryAlertas.Close;
qryAlertasOS.Close;
qryAlertasManut.Close;
qryAlertasLubrific.Close;
qryAlertasRotas.Close;
end;

function TDM.XlsToStringGrid(xStringGrid: TStringGrid; xFileXLS: string): Boolean;
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

     //Selecione aqui a aba que voc� deseja abrir primeiro - 1,2,3,4....
     XLSAplicacao.WorkSheets[1].Activate;

     //Selecione aqui a aba que voc� deseja ativar - come�ando sempre no 1
     AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(xFileXLS)].WorkSheets[1];
     AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
     // Pegar o n�mero da �ltima linha
     x := XLSAplicacao.ActiveCell.Row;
     // Pegar o n�mero da �ltima coluna
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

function TDM.converter_ponto(valor_com_virgula: string): string;
var
  i: integer;
begin
  for i := 1 to Length(valor_com_virgula) do
    if valor_com_virgula[i] = '.' then
      valor_com_virgula[i] := ',';
  result := valor_com_virgula;
end;

function TDM.AtualizarContadorSatelite(CodEquipamento, Placa: String; DataImportacao: TDateTime; Rodagem: Real; Indice: SmallInt): String;
var
I: SmallInt;
begin
if (Indice = 0) or (Indice = 1) then
  begin
    DM.qryAbastecimentos.Close;
    DM.qryAbastecimentos.Params[0].AsString := CodEquipamento;
    DM.qryAbastecimentos.Params[1].AsString := DM.FCodEmpresa;
    DM.qryAbastecimentos.Open;
    if DM.qryAbastecimentos.IsEmpty = False then
      begin
        if DataImportacao <= DM.qryAbastecimentosDATACONTADORATUAL.AsDateTime then
          begin
            Application.MessageBox('Arquivo já importado!', 'SPMP3', MB_ICONSTOP + MB_OK);
            Abort;
          end;
        if Placa <> DM.qryAbastecimentosPLACA.AsString then
          begin
            Application.MessageBox('Equipamento incorreto!', 'SPMP3', MB_ICONWARNING + MB_OK);
            Abort;
          end;

        if Rodagem > 0 then
          begin
            DM.qryAbastecimentos.Edit;
            DM.qryAbastecimentosDATACONTADORATUAL.AsDateTime := DataImportacao;
            DM.qryAbastecimentosCONTADORATUAL.AsFloat        := DM.qryAbastecimentosCONTADORATUAL.AsFloat + Rodagem;
            DM.qryAbastecimentos.Post;
            //----------------------------------------------------------------------------------------------------------------
            DM.qryAbastecimentosManutInsp.Close;
            DM.qryAbastecimentosManutInsp.Params[0].AsString := DM.FCodEmpresa;
            DM.qryAbastecimentosManutInsp.Params[1].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
            DM.qryAbastecimentosManutInsp.Params[2].AsString := DM.qryAbastecimentosCODPROGRAMACAO.AsString;
            DM.qryAbastecimentosManutInsp.Params[3].AsString := DM.qryAbastecimentosCONTADORATUAL.AsString;
            DM.qryAbastecimentosManutInsp.Open;
            DM.qryAbastecimentosManutInsp.First;
            while not DM.qryAbastecimentosManutInsp.Eof = True do
              begin
                DM.qryManutProgEquip.Close;
                DM.qryManutProgEquip.Params[0].AsString := DM.qryAbastecimentosManutInspCODIGO.AsString;
                DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
                DM.qryManutProgEquip.Params[2].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
                DM.qryManutProgEquip.Open;

                DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryManutProgEquipDESCRICAO.AsString
                                                              , DM.qryManutProgEquipEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                              , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryManutProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryManutProgEquiptempototal.AsString, DM.qryManutProgEquipCODOFICINA.AsString, DM.qryManutProgEquipCODMANUTENCAO.AsString, DM.qryManutProgEquipEQUIPPARADO.AsString, EmptyStr);

                if DM.qryManutProgEquip.IsEmpty = False then
                  DM.HistoricoInspecoes(0, DM.FCodEmpresa, DM.qryManutProgEquipCODEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, DM.FCodOrdemServico);

                DmRelatorios.frxRManutProgEquipIndividual.ShowReport();

                //Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou não.
                if DM.qryManutProgEquipREPROGRAMAR2.AsString = 'Programação' then
                  begin
                    DM.qryManutProgEquip.Edit;
                    DM.qryManutProgEquipRELATORIO.AsString    := 'N';
                    DM.qryManutProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryManutProgEquipFREQUENCIA1.AsInteger);
                    DM.qryManutProgEquipLEITURA.AsFloat       := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryManutProgEquipFREQUENCIA2.AsFloat;
                    DM.qryManutProgEquip.Post;
                  end;

                //Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto Até ser efetuado o fechamento, portanto não permitindo
                //a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o Até ser fechada.
                if DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Execução' then
                  begin
                    DM.qryManutProgEquip.Edit;
                    DM.qryManutProgEquipRELATORIO.AsString := 'S';
                    DM.qryManutProgEquipLEITURA.AsFloat    := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryManutProgEquipFREQUENCIA2.AsInteger;
                    DM.qryManutProgEquip.Post;
                  end;

                DM.qryManutProgEquip.Post;

                DM.qryManutProgEquip.Close;
                DM.qryManutProgEquipItens.Close;
                DM.qryManutProgEquipItensEsp.Close;

                DM.qryAbastecimentosManutInsp.Next;
              end;


            DM.qryAbastecimentosLubrificInsp.Close;
            DM.qryAbastecimentosLubrificInsp.Params[0].AsString := DM.FCodEmpresa;
            DM.qryAbastecimentosLubrificInsp.Params[1].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
            DM.qryAbastecimentosLubrificInsp.Params[2].AsString := DM.qryAbastecimentosCODPROGRAMACAO.AsString;
            DM.qryAbastecimentosLubrificInsp.Params[3].AsString := DM.qryAbastecimentosCONTADORATUAL.AsString;
            DM.qryAbastecimentosLubrificInsp.Open;
            DM.qryAbastecimentosLubrificInsp.First;
            while not DM.qryAbastecimentosLubrificInsp.Eof = True do
              begin
                DM.qryLubrificProgEquip.Close;
                DM.qryLubrificProgEquip.Params[0].AsString := DM.qryAbastecimentosLubrificInspCODIGO.AsString;
                DM.qryLubrificProgEquip.Params[1].AsString := DM.FCodEmpresa;
                DM.qryLubrificProgEquip.Params[2].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
                DM.qryLubrificProgEquip.Open;

                DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryLubrificProgEquipDESCRICAO.AsString
                                                              , DM.qryLubrificProgEquipEQUIPAMENTO.AsString, DM.qryLubrificProgEquipCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                              , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryLubrificProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryLubrificProgEquiptempototal.AsString, DM.qryLubrificProgEquipCODOFICINA.AsString, DM.qryLubrificProgEquipCODMANUTENCAO.AsString, DM.qryLubrificProgEquipEQUIPPARADO.AsString, EmptyStr);

                if DM.qryLubrificProgEquip.IsEmpty = False then
                  DM.HistoricoInspecoes(1, DM.FCodEmpresa, DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString, DM.qryLubrificProgEquipCODIGO.AsString, DM.FCodOrdemServico);

                DmRelatorios.frxRLubrificProgEquipIndividual.ShowReport();

                //Sendo a inspe��o reprogramada pela 'programação', programa a pr�xima inspe��o independente se a Lubrificen��o foi fechada ou não.
                if DM.qryLubrificProgEquipREPROGRAMAR2.AsString = 'Programação' then
                  begin
                    DM.qryLubrificProgEquip.Edit;
                    DM.qryLubrificProgEquipRELATORIO.AsString    := 'N';
                    DM.qryLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryLubrificProgEquipFREQUENCIA1.AsInteger);
                    DM.qryLubrificProgEquipLEITURA.AsFloat       := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryLubrificProgEquipFREQUENCIA2.AsFloat;
                    DM.qryLubrificProgEquip.Post;
                  end;

                //Sendo a inspe��o reprogramada pela execução, definir como Lubrificen��o em aberto Até ser efetuado o fechamento, portanto não permitindo
                //a gera��o de outra Lubrificação mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra Lubrificação Até ser fechada.
                if DM.qryLubrificProgEquipREPROGRAMAR1.AsString = 'Execução' then
                  begin
                    DM.qryLubrificProgEquip.Edit;
                    DM.qryLubrificProgEquipRELATORIO.AsString := 'S';
                    DM.qryLubrificProgEquipLEITURA.AsFloat    := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryLubrificProgEquipFREQUENCIA2.AsInteger;
                    DM.qryLubrificProgEquip.Post;
                  end;

                DM.qryLubrificProgEquip.Post;

                DM.qryLubrificProgEquip.Close;
                DM.qryLubrificProgEquipItens.Close;
                DM.qryLubrificProgEquipItensEsp.Close;

                DM.qryAbastecimentosLubrificInsp.Next;
              end;
            //----------------------------------------------------------------------------------------------------------------
            if Indice = 1 then
              Application.MessageBox('Dados importados com sucesso!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
          end;
      end;
  end;
if (Indice = 0) or (Indice = 2) then
  begin
    DM.qryPneusChassi.Close;
    DM.qryPneusChassi.Params[0].AsString := CodEquipamento;
    DM.qryPneusChassi.Params[1].AsString := DM.FCodEmpresa;
    DM.qryPneusChassi.Open;
    if DM.qryPneusChassi.IsEmpty = False then
      begin
        if DataImportacao <= DM.qryPneusChassiDATACONTADORATUAL.AsDateTime then
          begin
            Application.MessageBox('Arquivo já importado!', 'SPMP3', MB_ICONSTOP + MB_OK);
            Abort;
          end;
        if Placa <> DM.qryPneusChassiPLACA.AsString then
          begin
            Application.MessageBox('Equipamento incorreto!', 'SPMP3', MB_ICONWARNING + MB_OK);
            Abort;
          end;

        if Rodagem > 0 then
          begin
            DM.qryPneusChassi.Edit;
            DM.qryPneusChassiDATACONTADORATUAL.AsDateTime := DataImportacao;
            DM.qryPneusChassiCONTADOR.AsFloat             := DM.qryPneusChassiCONTADOR.AsFloat + Rodagem;
            DM.qryPneusChassi.Post;

            //AtualizarRodagemPneus
            DM.qryPneusChassiPosicoes.Close;
            DM.qryPneusChassiPosicoes.Params[0].AsString := DM.FCodEmpresa;
            DM.qryPneusChassiPosicoes.Params[1].AsString := DM.qryPneusChassiCODIGO.AsString;
            DM.qryPneusChassiPosicoes.Open;
            DM.qryPneusChassiPosicoes.First;
            DM.qryPneusChassiPneus.Close;
            DM.qryPneusChassiPneus.Params[0].AsString := DM.FCodEmpresa;
            DM.qryPneusChassiPneus.Open;
            for I := 0 to DM.qryPneusChassiPosicoes.RecordCount -1 do
              begin
                if (DM.qryPneusChassiPneus.Locate('ID', DM.qryPneusChassiPosicoesID.AsInteger, []) = True) then
                  if (DM.qryPneusChassiPneusCONTADOR.AsFloat < DM.qryPneusChassiCONTADOR.AsFloat) then
                    begin
                      DM.qryPneusChassiPneus.Edit;
                      DM.qryPneusChassiPneusRODADOS.AsInteger  := DM.qryPneusChassiPneusRODADOS.AsInteger + (DM.qryPneusChassiCONTADOR.AsInteger - DM.qryPneusChassiPneusCONTADOR.AsInteger);
                      DM.qryPneusChassiPneusCONTADOR.AsInteger := DM.qryPneusChassiCONTADOR.AsInteger;
                      DM.qryPneusChassiPneus.Post;
                    end;
                DM.qryPneusChassiPosicoes.Next;
              end;
            DM.qryPneusChassiPneus.Edit;
            DM.qryPneusChassiPneus.Post;

            Application.MessageBox('Dados importados com sucesso!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
          end;
      end;
  end;
end;

function TDM.SenhaExpirada: Boolean;
var
  //LSenhaAtual,
  LNovaSenha, LNovaSenhaConfirmacao: String;
begin
Result := False;
//Se for igual a 0, ent�o � senha não expira
if Dm.FTempoSenhaUsu > 0 then
  if DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(Dm.qryLoginSENHAALTERADADATA.AsDateTime)) >= DM.FTempoSenhaUsu  then
    begin
      LNovaSenha := DM.PasswordInputBox('Senha Expirada','Digite sua nova senha (mínimo '+ IntToStr(DM.FQtdeMinSenha) +' caracteres).');
      if (Length(LNovaSenha) < DM.FQtdeMinSenha) then
        begin
          Application.MessageBox('Acesso não permitido, senha com menos de 6 caracteres!', 'SPMP3', MB_ICONEXCLAMATION + MB_OK);
          DM.MSGAguarde('', False);
          Result := True;
        end
      else
      if LNovaSenha = '' then
        begin
          Application.MessageBox('Acesso não permitido, nova senha não informada!', 'SPMP3', MB_ICONEXCLAMATION + MB_OK);
          DM.MSGAguarde('', False);
          Result := True;
        end
      else
      if DM.FPassword = LNovaSenha then
        begin
          Application.MessageBox('Acesso não permitido, nova senha não pode ser igual a senha antiga!', 'SPMP3', MB_ICONEXCLAMATION + MB_OK);
          DM.MSGAguarde('', False);
          Result := True;
        end
      else
      if DM.FPassword = LNovaSenha then
        begin
          Application.MessageBox('Acesso não permitido, nova senha não pode ser igual a senha antiga!', 'SPMP3', MB_ICONEXCLAMATION + MB_OK);
          DM.MSGAguarde('', False);
          Result := True;
        end
      else
        begin
          LNovaSenhaConfirmacao := DM.PasswordInputBox('Confirme Nova Senha','Confirme sua nova senha.');
          if LNovaSenhaConfirmacao = '' then
            begin
              Application.MessageBox('Acesso não permitido, nova senha não confirmada!', 'SPMP3', MB_ICONEXCLAMATION + MB_OK);
              DM.MSGAguarde('', False);
              Result := True;
            end
          else
          if LNovaSenha <> LNovaSenhaConfirmacao then
            begin
              Application.MessageBox('Acesso não permitido, confirmação de nova senha não confere com a senha informada!', 'SPMP3', MB_ICONEXCLAMATION + MB_OK);
              DM.MSGAguarde('', False);
              Result := True;
            end
          else
          if DM.FPassword <> LNovaSenha then
            begin
              if (LNovaSenha <> EmptyStr) and (LNovaSenhaConfirmacao <> EmptyStr) and (LNovaSenha = LNovaSenhaConfirmacao) then
                begin
                  DM.qryLogin.Edit;
                  DM.qryLoginSENHA.AsString               := DM.Crypt('C', LNovaSenha);
                  DM.qryLoginSENHAALTERADADATA.AsDateTime := DM.FDataHoraServidor;
                  DM.qryLoginSENHAALTERADA.AsString     := 'S';
                  DM.qryLoginBLOQUEIO.AsInteger           := 0;
                  DM.qryLogin.Post;
                end
            end
        end;
    end;
end;

function TDM.LicencaExpirada: Boolean;
var
LChave, LNomeEmpresa, LUsuarios, c, LChaveInformada : String;
I : Integer;
LTexto : PChar;
begin
Result := False;
//Verificar licen�a da Unidade
DM.qrySAM.Open;
DM.FNomeEmpresa := qrySAMEMPRESA.AsString;
FDiasRestantes := 0;

if DM.qrySAM.IsEmpty = True then
  begin
    LChave := CampoInputBox('SPMP', 'Informe a chave fornecida pela SAM:');
    if LChave = EmptyStr then
      begin
        Application.Terminate;
      end
    else
      begin
        //UnFuncoesSPMP.FSenhaSystem := LChave;
        LChaveInformada := LChave;
        LChave := Crypt('D', LChave);

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
        DM.FNumUsuarios := StrToInt(LUsuarios);

        FInstalacao := DM.FDataHoraServidor;

        if (FLicenca <> 'TRIAL') and (FLicenca <> '3 MESES') and (FLicenca <> '6 MESES') and (FLicenca <> '1 ANO')
          and (FLicenca <> '2 ANOS') and (FLicenca <> '3 ANOS') and (FLicenca <> '4 ANOS')
            and (FLicenca <> '5 ANOS') and (FLicenca <> 'ILIMITADA') then
              begin
                Application.MessageBox('Chave Inválida!!!', 'SPMP3', MB_OK + MB_ICONERROR);
                Application.Terminate;
              end;

        qrySAM.Append;
        qrySAMCODIGO.AsInteger    := qrySAM.RecordCount + 1;
        qrySAMCHAVE.AsString      := LChaveInformada;
        qrySAMINSTALACAO.AsDateTime := DM.FDataHoraServidor;
        qrySAMEMPRESA.AsString    := LNomeEmpresa;
        qrySAMUSUARIOS.AsString   := LUsuarios;
        qrySAM.Post;

        DM.FInstalacao  := qrySAMINSTALACAO.AsDateTime;
      end;
  end
else
  begin
    LChave          := Crypt('D', qrySAMCHAVE.AsString);
    DM.FInstalacao  := qrySAMINSTALACAO.AsDateTime;

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
    DM.FNumUsuarios := StrToInt(LUsuarios);

    if FLicenca = 'TRIAL'     then FDiasRestantes := 7    - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = '3 MESES'   then FDiasRestantes := 90   - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = '6 MESES'   then FDiasRestantes := 180  - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = '1 ANO'     then FDiasRestantes := 365  - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = '2 ANOS'    then FDiasRestantes := 730  - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = '3 ANOS'    then FDiasRestantes := 1095 - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = '4 ANOS'    then FDiasRestantes := 7    - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = '5 ANOS'    then FDiasRestantes := 1460 - DaysBetween(DM.FDataHoraServidor, qrySAMINSTALACAO.AsDateTime) else
    if FLicenca = 'ILIMITADA' then FDiasRestantes := 36500;

    if (FDiasRestantes > 0) and (FDiasRestantes <= 7) then
      begin
        LTexto := PChar('Período de acesso se encerra em '+FormatFloat('00', FDiasRestantes)+' dias!'+#13+'Caso ainda não possua, entre em contato com o fornecedor do software para informar nova chave de acesso.'+#13+'Deseja informar nova chave agora?');
        if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYES then
          begin
            qrySAM.First;
            LChave := CampoInputBox('SPMP', 'Informe a chave fornecida pela SAM:');
            if LChave <> EmptyStr then
              begin
                if qrySAM.Locate('CHAVE', LChave, []) = False then
                  begin
                    LChaveInformada := LChave;
                    LChave       := Crypt('D', LChave);
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
                    DM.FInstalacao  := DM.FDataHoraServidor;
                    DM.FNumUsuarios := StrToInt(LUsuarios);

                    qrySAM.Append;
                    qrySAMCODIGO.AsInteger    := qrySAM.RecordCount + 1;
                    qrySAMCHAVE.AsString      := LChaveInformada;
                    qrySAMINSTALACAO.AsDateTime := DM.FDataHoraServidor;
                    qrySAMEMPRESA.AsString    := LNomeEmpresa;
                    qrySAMUSUARIOS.AsString   := LUsuarios;
                    qrySAM.Post;
                  end
                else
                  begin
                    Application.MessageBox('Chave já cadastrada, informe outra chave para continuar com a ativação!', 'SPMP3', MB_OK + MB_ICONEXCLAMATION);
                    Exit;
                  end;
              end;
          end;
      end
    else
    if FDiasRestantes <= 0 then
      begin
        Result := True;
        if Application.MessageBox('Período de acesso encerrado, deseja informar a nova chave de acesso agora?', 'SPMP3', MB_YESNO + MB_ICONERROR) = IDYes then
          begin
            LChave := CampoInputBox('SPMP', 'Informe a chave fornecida pela SAM:');
            if LChave = EmptyStr then
              begin
                Application.Terminate;
              end
            else
              begin
                if qrySAM.Locate('CHAVE', LChave, []) = False then
                  begin
                    LChaveInformada := LChave;
                    LChave          := Crypt('D', LChave);
                    LNomeEmpresa    := EmptyStr;
                    LUsuarios       := EmptyStr;
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
                    DM.FLicenca     := Copy(LChave, I + 2, Length(LChave));
                    DM.FInstalacao  := DM.FDataHoraServidor;
                    DM.FNumUsuarios := StrToInt(LUsuarios);

                    qrySAM.Append;
                    qrySAMCODIGO.AsInteger    := qrySAM.RecordCount + 1;
                    qrySAMCHAVE.AsString      := LChaveInformada;
                    qrySAMINSTALACAO.AsDateTime := DM.FDataHoraServidor;
                    qrySAMEMPRESA.AsString    := LNomeEmpresa;
                    qrySAMUSUARIOS.AsString   := LUsuarios;
                    qrySAM.Post;

                    Result := False;
                  end
                else
                  begin
                    Application.MessageBox('Chave já cadastrada, informe outra chave para continuar com a ativação!', 'SPMP3', MB_OK + MB_ICONEXCLAMATION);
                    Exit;
                  end;
              end;
          end;
      end;
  end;
DM.qrySAM.Close;
end;

function TDM.VerificarInspecoes: Boolean;
begin
Result := False;

DM.FModulo := 'Inspeções Vencidas';

qryManutVenc.Close;
qryManutVenc.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
qryManutVenc.Params.ParamByName('DATA').AsString       := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
qryManutVenc.Open;

qryLubrificVenc.Close;
qryLubrificVenc.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
qryLubrificVenc.Params.ParamByName('DATA').AsString       := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
qryLubrificVenc.Open;

if DM.FEmpTransf = True then
  begin
    qryRotaEquipVenc.Close;
    qryRotaEquipVenc.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
    qryRotaEquipVenc.Params.ParamByName('DATA').AsString       := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
    qryRotaEquipVenc.Open;
    qryRotaEquipVencSeq.Open;
    qryRotaEquipVencSeqManut.Open;
  end;
end;

procedure TDM.CalcularDashBoard;
var
  LTotalSolicitado, LTotalFechado: Real;
  LColor: TColor;
  I: Integer;
begin
  with FrmTelaPrincipal do
  begin
    for I := 1 to 12 Do
      LSolicitadas[I]:= 0;
    for I := 1 to 12 Do
      LFechadas[I]:= 0;
    for I := 1 to 7 Do
      LTipoManutencao[I]:= 0;
    for I := 1 to 11 Do
      LSituacaoOS[I]:= 0;
    //---------------------------GrafSolicTrab------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------SOLICITADAS-------------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Consultando solicitações de trabalho realizadas...';
      Application.ProcessMessages;
      Sleep(50);
    end;
    ChartSolicTrabalho.Series[0].Clear;
    ChartSolicTrabalho.Series[1].Clear;
    LTotalSolicitado := 0;
    LTotalFechado := 0;
    DM.qryDashboard.Close;
    DM.qryDashboard.SQL.Text := 'SELECT'
                                  +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
                                  + ' FROM'
                                  + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
                                  + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
                                  + ' LEFT JOIN'
                                  + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
                                  + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` <> ''CANCELADA'''
                                  + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DM.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);
    DM.qryDashboard.Open;

    while not DM.qryDashboard.Eof = True do
    begin
      LSolicitadas[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
      LTotalSolicitado := LTotalSolicitado + DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;

      DM.qryDashboard.Next;
    end;
    DM.qryDashboard.Close;

    //------------------------------FECHADAS--------------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Consultando solicitações de trabalho fechadas...';
      Application.ProcessMessages;
      Sleep(50);
    end;
    DM.qryDashboard.Close;
    DM.qryDashboard.SQL.Text := 'SELECT'
                                  +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
                                  + ' FROM'
                                  + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
                                  + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
                                  + ' LEFT JOIN'
                                  + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
                                  + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` = ''FECHADA'''
                                  + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DM.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);;
    DM.qryDashboard.Open;

    while not DM.qryDashboard.Eof = True do
    begin
      LFechadas[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
      LTotalFechado := LTotalFechado + DM.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;

      DM.qryDashboard.Next;
    end;

    DM.qryDashboard.First;
    while not DM.qryDashboard.Eof = True do
    begin
      if DM.qryDashboard.FieldByName('MES').AsString = 'Feb' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Fev');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Fev');
      end else
      if DM.qryDashboard.FieldByName('MES').AsString = 'Apr' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Abr');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Abr');
      end else
      if DM.qryDashboard.FieldByName('MES').AsString = 'May' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Mai');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Mai');
      end else
      if DM.qryDashboard.FieldByName('MES').AsString = 'Aug' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Ago');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Ago');
      end else
      if DM.qryDashboard.FieldByName('MES').AsString = 'Sep' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Set');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Set');
      end else
      if DM.qryDashboard.FieldByName('MES').AsString = 'Oct' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Out');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Out');
      end else
      if DM.qryDashboard.FieldByName('MES').AsString = 'Dec' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Dez');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DM.qryDashboard.RecNo], 'Dez');
      end else
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('MES').AsString);
        ChartSolicTrabalho.Series[1].Add(LFechadas[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('MES').AsString);
      end;

      DM.qryDashboard.Next;
    end;
    DM.qryDashboard.Close;

    if LTotalSolicitado > 0 then
      LblEficSolicTrabVal.Caption := FormatFloat('0.00%', (LTotalFechado/LTotalSolicitado) * 100)
    else
      LblEficSolicTrabVal.Caption := '0%';

    //---------------------------TIPOS DE MANUTENÇÃO------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por tipo de manutenção...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    ChartTipoManutencao.Series[0].Clear;
    DM.qryDashboard.Close;
    DM.qryDashboard.SQL.Text := 'SELECT'
                                + ' TIPO.TIPO, COUNT(o.`CODIGO`) AS TOTAL'
                                + ' FROM'
                                + ' (SELECT ''Manutenção Preventiva'' AS TIPO'
                                + ' UNION ALL SELECT ''Manutenção Corretiva'' UNION ALL SELECT ''Manutenção Preditiva'''
                                + ' UNION ALL SELECT ''Lubrificação'' UNION ALL SELECT ''Manutenção Autônoma'''
                                + ' UNION ALL SELECT ''Novos Projetos'' UNION ALL SELECT ''Outros Serviços'') AS TIPO'
                                + ' LEFT JOIN `tipomanutencao` AS t ON  TIPO.TIPO = t.`TIPOMANUTENCAO`'
                                + ' LEFT JOIN `ordemservico` AS o ON o.`CODMANUTENCAO` = t.`CODIGO`'
                                + ' AND MONTH(o.`DATACADASTRO`) = :MES AND YEAR(o.`DATACADASTRO`) = :ANO'
                                + ' GROUP BY TIPO.TIPO;';
    DM.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    DM.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
    DM.qryDashboard.Open;

    while not DM.qryDashboard.Eof = True do
    begin
      if DM.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
        LTipoManutencao[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTAL').AsInteger;

      DM.qryDashboard.Next;
    end;

    DM.qryDashboard.First;
    while not DM.qryDashboard.Eof = True do
    begin
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Cadastrada' then
        LColor := $00BBFFFF
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Solicitada' then
        LColor := $00F3F3F3
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Fechada' then
        LColor := clGray
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Detalhada' then
        LColor := clYellow
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Programada' then
        LColor := clBlue
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Reprogramada' then
        LColor := clBlue
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Desprogramada' then
        LColor := clYellow
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Execução' then
        LColor := clInfoBk
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Liberada' then
        LColor := clGreen
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Paralisada' then
        LColor := clRed
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Cancelada' then
        LColor := clBlack
      else
      if DM.qryDashboard.FieldByName('TIPO').AsString = 'Vencida' then
        LColor := $006666FF
      else
        LColor := clGray;

      if LTipoManutencao[DM.qryDashboard.RecNo] > 0 then
        ChartTipoManutencao.Series[0].Add(LTipoManutencao[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('TIPO').AsString, LColor);

      DM.qryDashboard.Next;
    end;
    DM.qryDashboard.Close;
    //----------------------------SITUAÇÃO DAS OS---------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por situação...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    ChartSituacaoOS.Series[0].Clear;
    DM.qryDashboard.Close;
    DM.qryDashboard.SQL.Text := 'SELECT'
                                + ' (CASE'
                                + ' WHEN SITUACAO.SITUACAO = ''SOLICITADA'' THEN ''Solicitada'''
                                + ' WHEN SITUACAO.SITUACAO = ''CADASTRADA'' THEN ''Cadastrada'''
                                + ' WHEN SITUACAO.SITUACAO = ''DETALHADA'' THEN ''Detalhada'''
                                + ' WHEN SITUACAO.SITUACAO = ''PROGRAMADA'' THEN ''Programada'''
                                + ' WHEN SITUACAO.SITUACAO = ''DESPROGRAMADA'' THEN ''Desprogramada'''
                                + ' WHEN SITUACAO.SITUACAO = ''REPROGRAMADA'' THEN ''Reprogramada'''
                                + ' WHEN SITUACAO.SITUACAO = ''EXECUCAO'' THEN ''Execução'''
                                + ' WHEN SITUACAO.SITUACAO = ''PARALISADA'' THEN ''Paralisada'''
                                + ' WHEN SITUACAO.SITUACAO = ''LIBERADA'' THEN ''Liberada'''
                                + ' WHEN SITUACAO.SITUACAO = ''FECHADA'' THEN ''Fechada'''
                                + ' WHEN SITUACAO.SITUACAO = ''VENCIDA'' THEN ''Vencida'''
                                + ' ELSE ''OUTRO'''
                                + ' END) AS SITUACAO'
                                +', COUNT(o.`CODIGO`) AS TOTAL'
                                + ' FROM'
                                + ' (SELECT ''SOLICITADA'' AS SITUACAO UNION ALL SELECT ''CADASTRADA'''
                                + ' UNION ALL SELECT ''DETALHADA'' UNION ALL SELECT ''PROGRAMADA'''
                                + ' UNION ALL SELECT ''DESPROGRAMADA'' UNION ALL SELECT ''REPROGRAMADA'''
                                + ' UNION ALL SELECT ''EXECUCAO'' UNION ALL SELECT ''PARALISADA'''
                                + ' UNION ALL SELECT ''LIBERADA'' UNION ALL SELECT ''FECHADA'''
                                + ' UNION ALL SELECT ''VENCIDA'') AS SITUACAO'
                                + ' LEFT JOIN `ordemservico` AS o ON o.`SITUACAO` = SITUACAO.SITUACAO'
                                + ' AND MONTH(o.`DATACADASTRO`) = :mes AND YEAR(o.`DATACADASTRO`) = :ano'
                                + ' GROUP BY SITUACAO.SITUACAO;';
    DM.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    DM.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
    DM.qryDashboard.Open;

    while not DM.qryDashboard.Eof = True do
    begin
      if DM.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
        LSituacaoOS[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTAL').AsInteger;

      DM.qryDashboard.Next;
    end;

    DM.qryDashboard.First;
    while not DM.qryDashboard.Eof = True do
    begin
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Cadastrada' then
        LColor := $00BBFFFF
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Solicitada' then
        LColor := $00F3F3F3
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Fechada' then
        LColor := clGray
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Detalhada' then
        LColor := clYellow
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Programada' then
        LColor := clBlue
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Reprogramada' then
        LColor := clBlue
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Desprogramada' then
        LColor := clYellow
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Execução' then
        LColor := clInfoBk
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Liberada' then
        LColor := clGreen
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Paralisada' then
        LColor := clRed
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Cancelada' then
        LColor := clBlack
      else
      if DM.qryDashboard.FieldByName('SITUACAO').AsString = 'Vencida' then
        LColor := $006666FF
      else
        LColor := clGray;

      if LSituacaoOS[DM.qryDashboard.RecNo] > 0 then
        ChartSituacaoOS.Series[0].Add(LSituacaoOS[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('SITUACAO').AsString, LColor);

      DM.qryDashboard.Next;
    end;
    DM.qryDashboard.Close;
    //----------------------------OFICINAS DE OS---------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por oficina...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    ChartOSOficina.Series[0].Clear;
    DM.qryDashboard.Close;

    DM.qryDashboard.SQL.Text := 'SELECT'
                                + ' of.`DESCRICAO` AS OFICINA, COUNT(os.`CODIGO`) AS TOTAL'
                                + ' FROM'
                                + ' `ordemservico` AS os'
                                + ' INNER JOIN `oficinas` AS of ON (os.`CODOFICINA` = of.`CODIGO`)'
                                + ' WHERE'
                                + ' (os.`SITUACAO` <> ''CANCELADA'' AND MONTH(os.`DATACADASTRO`) = :MES AND YEAR(os.`DATACADASTRO`) = :ANO)'
                                + ' GROUP BY OFICINA ORDER BY TOTAL DESC';

    DM.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    DM.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
    DM.qryDashboard.Open;

    while not DM.qryDashboard.Eof = True do
    begin
      if DM.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
        LSituacaoOS[DM.qryDashboard.RecNo] := DM.qryDashboard.FieldByName('TOTAL').AsInteger;

      DM.qryDashboard.Next;
    end;

    DM.qryDashboard.First;
    while not DM.qryDashboard.Eof = True do
    begin
      if LSituacaoOS[DM.qryDashboard.RecNo] > 0 then
        ChartOSOficina.Series[0].Add(LSituacaoOS[DM.qryDashboard.RecNo], DM.qryDashboard.FieldByName('OFICINA').AsString);

      DM.qryDashboard.Next;
    end;
    DM.qryDashboard.Close;
  end;
end;

function TDM.CalcularMTBF(codequip: String; periodo: SmallInt): Real;
var
  ltotalhorasdisp: Real;
begin
  DM.RetornaDataHoraServidor;

  DM.FDataConsulta1 := IncDay(DateOf(DM.FDataHoraServidor), -periodo);
  DM.FDataConsulta2 := DateOf(DM.FDataHoraServidor);

  //MTBF = Total de horas de funcionamento do equipamento pelo seu calend�rio.
  ltotalhorasdisp   := DM.HorasCalendario(1, codequip, '');
//  ltotalhorasparado :=  DM.HorasParadasEquipamento(codequip, 'Manutenção Corretiva', '', '');
  DM.HorasParadasEquipamento(codequip, 'Manutenção Corretiva', '', '');

  Result := ltotalhorasdisp/FTotalParadasEquip;
end;

function TDM.CalcularTaxaFalha(mtbf: Real): Real;
begin
  Result := 1/mtbf
end;

procedure TDM.VerificarConfiabilidade;
var
  TF, C: Real;
  OS: Integer;
begin
  DM.qryEquipamentosConf.Close;
  DM.qryEquipamentosConf.Params[0].AsString := DM.FCodEmpresa;
  DM.qryEquipamentosConf.Open;
  DM.qryEquipamentosConfOS.Open;
  DM.qryEquipamentosConfOSServ.Open;
  if DM.qryEquipamentosConf.IsEmpty = False then
    begin
      while not DM.qryEquipamentosConf.Eof = True do
        begin
          Dm.qryEquipamentosConfOS.First;
          if Dm.qryEquipamentosConfOS.IsEmpty = False then
            begin
              if DM.qryEquipamentosConfPERIODOCONF.AsString = '3 meses' then
                begin
                  if IncMonth(DateOf(DM.qryEquipamentosConfDATAINICIOCONF.AsDateTime), 3) <= DateOf(DM.FDataHoraServidor) then
                    begin
                      TF := CalcularTaxaFalha(CalcularMTBF(DM.qryEquipamentosConfCODIGO.AsString, 90));
                      C := Power(2.718, (-TF * 90));
                      C := C * 100;
                      if C < 90 then
                        begin
                          OS := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Manutenção por confiabilidade', DM.qryEquipamentosConfCODIGO.AsString,
                                            EmptyStr, EmptyStr, EmptyStr, 'N', EmptyStr, 'Até 1 Mês', 'Para o Equipamento', DM.qryEquipamentosConfCODCENTROCUSTO.AsString, EmptyStr, '0', EmptyStr, EmptyStr, EmptyStr, EmptyStr);

                          DM.qryEquipamentosConf.Edit;
                          DM.qryEquipamentosConfDATAINICIOCONF.AsDateTime := DateOf(DM.FDataHoraServidor);
                          DM.qryEquipamentosConf.Post;

                          DM.qryOrdemServicoServSolic.Open;

                          DM.qryEquipamentosConfOS.First;
                          while not DM.qryEquipamentosConfOS.Eof = True do
                            begin
                              DM.qryEquipamentosConfOSServ.First;
                              while not DM.qryEquipamentosConfOSServ.Eof = True do
                                begin
                                  DM.qryOrdemServicoServSolic.Append;
                                  DM.qryOrdemServicoServSolicCODEMPRESA.AsString       := DM.FCodEmpresa;
                                  DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := OS;
                                  DM.qryOrdemServicoServSolicPARTE.AsString            := DM.qryEquipamentosConfOSServPARTE.AsString;
                                  DM.qryOrdemServicoServSolicITEM.AsString             := DM.qryEquipamentosConfOSServITEM.AsString;
                                  DM.qryOrdemServicoServSolicDESCRICAO.AsString        := DM.qryEquipamentosConfOSServDESCRICAO.AsString;
                                  DM.qryOrdemServicoServSolicEQUIPPARADO.AsString      := DM.qryEquipamentosConfOSServEQUIPPARADO.AsString;
                                  DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsString    := DM.qryEquipamentosConfOSServTEMPOEXECUCAO.AsString;
                                  DM.qryOrdemServicoServSolic.Post;

                                  DM.qryEquipamentosConfOSServ.Next;
                                end;

                              DM.qryEquipamentosConfOS.Next;
                            end;

                          DM.qryOrdemServicoServSolic.Close;
                        end;
                    end;
                end
              else
              if DM.qryEquipamentosConfPERIODOCONF.AsString = '6 meses' then
                begin
                  if IncMonth(DateOf(DM.qryEquipamentosConfDATAINICIOCONF.AsDateTime), 6) <= DateOf(DM.FDataHoraServidor) then
                    begin
                      TF := CalcularTaxaFalha(CalcularMTBF(DM.qryEquipamentosConfCODIGO.AsString, 180));
                      C := Power(2.718, (-TF * 180));
                      C := C * 100;
                      if C < 90 then
                        begin
                          OS := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Manutenção por confiabilidade', DM.qryEquipamentosConfCODIGO.AsString,
                                            EmptyStr, EmptyStr, EmptyStr, 'N', EmptyStr, 'Até 1 Mês', 'Para o Equipamento', DM.qryEquipamentosConfCODCENTROCUSTO.AsString, EmptyStr, '0', EmptyStr, EmptyStr, EmptyStr, EmptyStr);

                          DM.qryEquipamentosConf.Edit;
                          DM.qryEquipamentosConfDATAINICIOCONF.AsDateTime := DateOf(DM.FDataHoraServidor);
                          DM.qryEquipamentosConf.Post;

                          DM.qryOrdemServicoServSolic.Open;

                          DM.qryEquipamentosConfOS.First;
                          while not DM.qryEquipamentosConfOS.Eof = True do
                            begin
                              DM.qryEquipamentosConfOSServ.First;
                              while not DM.qryEquipamentosConfOSServ.Eof = True do
                                begin
                                  DM.qryOrdemServicoServSolic.Append;
                                  DM.qryOrdemServicoServSolicCODEMPRESA.AsString       := DM.FCodEmpresa;
                                  DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := OS;
                                  DM.qryOrdemServicoServSolicPARTE.AsString            := DM.qryEquipamentosConfOSServPARTE.AsString;
                                  DM.qryOrdemServicoServSolicITEM.AsString             := DM.qryEquipamentosConfOSServITEM.AsString;
                                  DM.qryOrdemServicoServSolicDESCRICAO.AsString        := DM.qryEquipamentosConfOSServDESCRICAO.AsString;
                                  DM.qryOrdemServicoServSolicEQUIPPARADO.AsString      := DM.qryEquipamentosConfOSServEQUIPPARADO.AsString;
                                  DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsString    := DM.qryEquipamentosConfOSServTEMPOEXECUCAO.AsString;
                                  DM.qryOrdemServicoServSolic.Post;

                                  DM.qryEquipamentosConfOSServ.Next;
                                end;

                              DM.qryEquipamentosConfOS.Next;
                            end;

                          DM.qryOrdemServicoServSolic.Close;
                        end;
                    end;
                end
              else
              if DM.qryEquipamentosConfPERIODOCONF.AsString = '12 meses' then
                begin
                  if IncMonth(DateOf(DM.qryEquipamentosConfDATAINICIOCONF.AsDateTime), 12) <= DateOf(DM.FDataHoraServidor) then
                    begin
                      TF := CalcularTaxaFalha(CalcularMTBF(DM.qryEquipamentosConfCODIGO.AsString, 365));
                      C := Power(2.718, (-TF * 365));
                      C := C * 100;
                      if C < 90 then
                        begin
                          OS := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Manutenção por confiabilidade', DM.qryEquipamentosConfCODIGO.AsString,
                                            EmptyStr, EmptyStr, EmptyStr, 'N', EmptyStr, 'Até 1 Mês', 'Para o Equipamento', DM.qryEquipamentosConfCODCENTROCUSTO.AsString, EmptyStr, '0', EmptyStr, EmptyStr, EmptyStr, EmptyStr);

                          DM.qryEquipamentosConf.Edit;
                          DM.qryEquipamentosConfDATAINICIOCONF.AsDateTime := DateOf(DM.FDataHoraServidor);
                          DM.qryEquipamentosConf.Post;

                          DM.qryOrdemServicoServSolic.Open;

                          DM.qryEquipamentosConfOS.First;
                          while not DM.qryEquipamentosConfOS.Eof = True do
                            begin
                              DM.qryEquipamentosConfOSServ.First;
                              while not DM.qryEquipamentosConfOSServ.Eof = True do
                                begin
                                  DM.qryOrdemServicoServSolic.Append;
                                  DM.qryOrdemServicoServSolicCODEMPRESA.AsString       := DM.FCodEmpresa;
                                  DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := OS;
                                  DM.qryOrdemServicoServSolicPARTE.AsString            := DM.qryEquipamentosConfOSServPARTE.AsString;
                                  DM.qryOrdemServicoServSolicITEM.AsString             := DM.qryEquipamentosConfOSServITEM.AsString;
                                  DM.qryOrdemServicoServSolicDESCRICAO.AsString        := DM.qryEquipamentosConfOSServDESCRICAO.AsString;
                                  DM.qryOrdemServicoServSolicEQUIPPARADO.AsString      := DM.qryEquipamentosConfOSServEQUIPPARADO.AsString;
                                  DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsString    := DM.qryEquipamentosConfOSServTEMPOEXECUCAO.AsString;
                                  DM.qryOrdemServicoServSolic.Post;

                                  DM.qryEquipamentosConfOSServ.Next;
                                end;

                              DM.qryEquipamentosConfOS.Next;
                            end;

                          DM.qryOrdemServicoServSolic.Close;
                        end;
                    end;
                end;

              Dm.qryEquipamentosConfOS.Next
            end;

          DM.qryEquipamentosConf.Next;
        end;
    end;

  DM.qryEquipamentosConf.Close;
  DM.qryEquipamentosConfOS.Close;
  DM.qryEquipamentosConfOSServ.Close;
end;


procedure TDM.EnviarEmail(Msg, Destinario, OrdemServico: String);
const
  _SOLICITADA = 'Olá, '
                +#13+#13+'Gostaríamos de informar que recebemos a sua solicitação de serviço e em breve estaremos iniciando a análise.'
                +#13+#13+'Pedimos que aguarde novas atualizações que serão enviadas em breve. Se surgirem dúvidas ou se precisar de mais detalhes, por favor, entre em contato com a equipe de manutenção.'
                +#13+#13+'Agradecemos pela sua paciência e compreensão durante este processo.';
var
  LSMTP: TIdSMTP ;
  LMessage: TIdMessage ;
  LSocketSSL: TIdSSLIOHandlerSocketOpenSSL ;
//  LArquivoAnexo: String ;

  LTextPart: TIdText;
begin
  LSMTP := TIdSMTP.Create( nil ) ;
  LMessage := TIdMessage.Create( nil ) ;
  LSocketSSL := TIdSSLIOHandlerSocketOpenSSL.Create( nil ) ;

  // segurança
  with LSocketSSL do
  Begin
    with SSLOptions do
    BEgin
      Mode := sslmClient ;
      Method := sslvTLSv1_2 ;
    End ;

    Host := DM.qryConfigssmtp.AsString; // mail.spmp.maceio.br
    Port := DM.qryConfigsportaemail.AsInteger; // 465
  End ;

  // SMTP
  with LSMTP do
  Begin
    IOHandler := LSocketSSL ;
    HOST := DM.qryConfigssmtp.AsString;
    PORT := DM.qryConfigsportaemail.AsInteger;
    AuthType := satDefault ;
    UserName := DM.qryConfigsemail.AsString;
    Password := DM.qryConfigssenhaemail.AsString;
    UseTLS := utUseExplicitTLS ;
  End ;

  // Menssagem
  with LMessage do
  Begin
    From.Address := DM.qryConfigsemail.AsString ;
    From.Name := 'SPMP - FARMACE';
    Recipients.Add ;
    Recipients.Items[0].Address := Destinario;
    Subject := Msg;
//  Body.Add(_SOLICITADA) ;
  End;

  // here we have initiated TIdtext object for plain text message in body//
  lTextPart := TIdText.Create(lMessage.MessageParts);
  lTextPart.ContentType := 'text/plain';

  // here we have initiated another TIdtext object for HTML text message in body//
  lTextPart := TIdText.Create(lMessage.MessageParts);
  lTextPart.ContentType := 'text/html';
  //  lTextPart.Body.Text := '<html><body><b>'+_SOLICITADA+'</b><img src="c:\spmp3\sam.jpg" ></body></html>';
  if Msg = 'SOLICITAÇÃO CRIADA' then
  begin
    lTextPart.Body.Text := '<h3 style="color: #5e9ca0; text-align: center;"><span style="color: #008080;">SPMP - Sistema do Plano de Manuten&ccedil;&atilde;o Programada</span></h3>'
                        + '<p><strong>Ol&aacute;,</strong></p>'
                        + '<p><strong>Gostar&iacute;amos de informar que recebemos a sua solicita&ccedil;&atilde;o de servi&ccedil;o número: '+OrdemServico+', em breve estaremos iniciando a an&aacute;lise.</strong></p>'
                        + '<p><strong>Pedimos que aguarde novas atualiza&ccedil;&otilde;es que ser&atilde;o enviadas em breve. Se surgirem d&uacute;vidas ou se precisar de mais detalhes, por favor, entre em contato com a equipe de manuten&ccedil;&atilde;o.</strong></p>'
                        + '<p><strong>Agradecemos pela sua paci&ecirc;ncia e compreens&atilde;o durante este processo.</strong></p>'
                        + '<p>&nbsp;</p>'
                        + '<p><strong><img src="https://static.wixstatic.com/media/72e108_2b8e56da75744b8db620f790a9db3b82~mv2.png/v1/fill/w_141,h_53,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/SAM_doc.png" alt="" /></strong></p>';
  end else
  if Msg = 'SOLICITAÇÃO CONCLUÍDA' then
  begin
    lTextPart.Body.Text := '<h3 style="color: #5e9ca0; text-align: center;"><span style="color: #008080;">SPMP - Sistema do Plano de Manuten&ccedil;&atilde;o Programada</span></h3>'
                        + '<p><strong>Ol&aacute;,</strong></p>'
                        + '<p><strong>Estamos muito felizes em informar que o servi&ccedil;o que voc&ecirc; solicitou, n&uacute;mero: '+OrdemServico+', foi conclu&iacute;do com sucesso pela nossa equipe de manuten&ccedil;&atilde;o.</strong></p>'
                        + '<p><strong>Se precisar de mais alguma coisa ou tiver alguma outra solicita&ccedil;&atilde;o, por favor, n&atilde;o hesite em entrar em contato. Estamos sempre aqui para ajudar!</strong></p>'
                        + '<p><strong>Agradecemos pela sua paci&ecirc;ncia e compreens&atilde;o durante este processo.</strong></p>'
                        + '<p>&nbsp;</p>'
                        + '<p><strong><img src="https://static.wixstatic.com/media/72e108_2b8e56da75744b8db620f790a9db3b82~mv2.png/v1/fill/w_141,h_53,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/SAM_doc.png" alt="" /></strong></p>';
  end;

//  // Arquivos em anexo
//  LArquivoAnexo := Trim( edtArquivoAnexo.Text ) ;
//  if LArquivoAnexo <> EmptyStr then
//    TIdAttachmentFile.Create( LMessage.MessageParts, LArquivoAnexo ) ;

  Try
    LSMTP.Connect ;
    LSMTP.Send( LMessage ) ;

    if Msg = 'SOLICITAÇÃO CRIADA' then
      Application.MessageBox(PWideChar('Confirmação da solicitação enviada para o email: ' + Destinario), 'SPMP3', MB_OK + MB_ICONINFORMATION);
    if Msg = 'SOLICITAÇÃO CONCLUÍDA' then
      Application.MessageBox(PWideChar('Email enviado para: ' + Destinario + ' com sucesso!'), 'SPMP3', MB_OK + MB_ICONINFORMATION);
  Except
    ON E: Exception do
      Showmessage( 'Ocorreu um erro ao enviar o email para o funcionário. Mensagem de erro: ' +e.Message ) ;
  End;

end;


end.


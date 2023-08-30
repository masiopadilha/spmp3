unit UnTelaInspConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, System.DateUtils, Data.DB, Datasnap.DBClient, FireDAC.Stan.Param,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmTelaInspConsulta = class(TFrmTelaPaiOKCancel)
    PCInspecoes: TPageControl;
    TSManut: TTabSheet;
    TSLubrific: TTabSheet;
    TSRotas: TTabSheet;
    PFundoManut: TPanel;
    GrdManut: TDBGrid;
    Label1: TLabel;
    LblAreaManut: TDBText;
    Label2: TLabel;
    LblFamiliaManut: TDBText;
    Label3: TLabel;
    LblCelulaManut: TDBText;
    Label4: TLabel;
    LblLinhaManut: TDBText;
    PFundoLubrific: TPanel;
    Label5: TLabel;
    LblAreaLubrific: TDBText;
    Label6: TLabel;
    LblFamiliaLubrific: TDBText;
    Label7: TLabel;
    LblCelulaLubrific: TDBText;
    Label8: TLabel;
    LblLinhaLubrific: TDBText;
    GrdLubrific: TDBGrid;
    PFundoRota: TPanel;
    GrdRota: TDBGrid;
    BtnImprimir: TButton;
    Label9: TLabel;
    CBPeriodo: TComboBox;
    Panel1: TPanel;
    Label10: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    BtnFamiliaEquip: TButton;
    BtnArea: TButton;
    CBCriticidade: TComboBox;
    edtArea: TEdit;
    EdtFamiliaEquip: TEdit;
    FDMemTManut: TFDMemTable;
    DSMemTManut: TDataSource;
    FDMemTManutCODIGO: TStringField;
    FDMemTManutDESCRICAO: TStringField;
    FDMemTManutFREQUENCIA1: TSmallintField;
    FDMemTManutDTAINICIO1: TDateTimeField;
    FDMemTManutCODEQUIPAMENTO: TStringField;
    FDMemTManutEQUIPAMENTO: TStringField;
    FDMemTManutCODEMPRESA: TStringField;
    FDMemTManutCODMANUTPROGFAMEQUIP: TStringField;
    FDMemTManutCODMONITORAMENTO: TIntegerField;
    FDMemTManutCRITICIDADE: TStringField;
    FDMemTManutREPROGRAMAR1: TStringField;
    FDMemTManutFREQUENCIA2: TSmallintField;
    FDMemTManutLEITURA: TIntegerField;
    FDMemTManutREPROGRAMAR2: TStringField;
    FDMemTManutRELATORIO: TStringField;
    FDMemTManutSEQUENCIA: TIntegerField;
    FDMemTManutCODFAMILIAEQUIP: TStringField;
    FDMemTManutFAMILIAEQUIP: TStringField;
    FDMemTManutCODAREA: TStringField;
    FDMemTManutAREA: TStringField;
    FDMemTManutCODCELULA: TStringField;
    FDMemTManutCELULA: TStringField;
    FDMemTManutCODLINHA: TStringField;
    FDMemTManutLINHA: TStringField;
    FDMemTManutPERIODO: TStringField;
    FDMemTManutC_DIASATRASO: TIntegerField;
    DSMemTLubrific: TDataSource;
    FDMemTRota: TFDMemTable;
    chbTudo: TCheckBox;
    FDMemTManutC_PROXINSP: TDateTimeField;
    FDMemTManutPROGRAMACAO2: TStringField;
    FDMemTManutDESCMANUTPROGFAMEQUIP: TStringField;
    FDMemTManutItens: TFDMemTable;
    DSMemTManutItens: TDataSource;
    FDMemTManutItensCODIGO: TIntegerField;
    FDMemTManutItensCODEMPRESA: TStringField;
    FDMemTManutItensCODMANUTPROGFAMEQUIP: TStringField;
    FDMemTManutItensCODPARTE: TIntegerField;
    FDMemTManutItensITEM: TStringField;
    FDMemTManutItensDESCINSPECAO: TStringField;
    FDMemTManutItensEQUIPPARADO: TStringField;
    FDMemTManutItensTEMPO: TBCDField;
    FDMemTManutItensEXECAUTONOMO: TStringField;
    FDMemTManutItensPARTE: TStringField;
    FDMemTLubrificItens: TFDMemTable;
    DSMemTLubrificItens: TDataSource;
    FDMemTLubrificItensCODIGO: TIntegerField;
    FDMemTLubrificItensCODEMPRESA: TStringField;
    FDMemTLubrificItensCODLUBRIFICPROGFAMEQUIP: TStringField;
    FDMemTLubrificItensCODPARTE: TIntegerField;
    FDMemTLubrificItensITEM: TStringField;
    FDMemTLubrificItensDESCINSPECAO: TStringField;
    FDMemTLubrificItensEQUIPPARADO: TStringField;
    FDMemTLubrificItensTEMPO: TBCDField;
    FDMemTLubrificItensEXECAUTONOMO: TStringField;
    FDMemTLubrificItensPARTE: TStringField;
    FDMemTManutItensEsp: TFDMemTable;
    DSMemTManutItensEsp: TDataSource;
    FDMemTManutItensEspCODEMPRESA: TStringField;
    FDMemTManutItensEspCODMANUTPROGEQUIP: TStringField;
    FDMemTManutItensEspCODPARTE: TIntegerField;
    FDMemTManutItensEspITEM: TStringField;
    FDMemTManutItensEspDESCINSPECAO: TStringField;
    FDMemTManutItensEspEQUIPPARADO: TStringField;
    FDMemTManutItensEspTEMPO: TBCDField;
    FDMemTManutItensEspEXECAUTONOMO: TStringField;
    FDMemTManutItensEspEXECUTADO: TStringField;
    FDMemTManutItensEspBOM: TStringField;
    FDMemTManutItensEspREGULAR: TStringField;
    FDMemTManutItensEspRUIM: TStringField;
    FDMemTManutItensEspPARTE: TStringField;
    FDMemTManutPlanoTrab: TFDMemTable;
    DSMemTManutPlanoTrab: TDataSource;
    FDMemTManutPlanoTrabCODEMPRESA: TStringField;
    FDMemTManutPlanoTrabCODMANUTPROGFAMEQUIP: TStringField;
    FDMemTManutPlanoTrabCODPLANOTRABALHO: TStringField;
    FDMemTManutPlanoTrabPLANOTRABALHO: TStringField;
    FDMemTManutPlanoTrabDETALHES: TBlobField;
    FDMemTManutItensEspCODIGO: TIntegerField;
    FDMemTManutPlanoTrabCODIGO: TIntegerField;
    FDMemTLubrificItensEsp: TFDMemTable;
    FDMemTLubrificPlanoTrab: TFDMemTable;
    FDMemTLubrificItensEspCODIGO: TFDAutoIncField;
    FDMemTLubrificItensEspCODEMPRESA: TStringField;
    FDMemTLubrificItensEspCODLUBRIFICPROGEQUIP: TStringField;
    FDMemTLubrificItensEspCODPARTE: TIntegerField;
    FDMemTLubrificItensEspITEM: TStringField;
    FDMemTLubrificItensEspDESCINSPECAO: TStringField;
    FDMemTLubrificItensEspEQUIPPARADO: TStringField;
    FDMemTLubrificItensEspTEMPO: TBCDField;
    FDMemTLubrificItensEspEXECAUTONOMO: TStringField;
    FDMemTLubrificItensEspEXECUTADO: TStringField;
    FDMemTLubrificItensEspBOM: TStringField;
    FDMemTLubrificItensEspREGULAR: TStringField;
    FDMemTLubrificItensEspRUIM: TStringField;
    FDMemTLubrificItensEspPARTE: TStringField;
    FDMemTLubrificPlanoTrabCODEMPRESA: TStringField;
    FDMemTLubrificPlanoTrabCODLUBRIFICPROGFAMEQUIP: TStringField;
    FDMemTLubrificPlanoTrabCODPLANOTRABALHO: TStringField;
    FDMemTLubrificPlanoTrabPLANOTRABALHO: TStringField;
    FDMemTLubrificPlanoTrabDETALHES: TBlobField;
    FDMemTLubrificPlanoTrabCODIGO: TIntegerField;
    FDMemTRotaCODEMPRESA: TStringField;
    FDMemTRotaDESCRICAO: TStringField;
    FDMemTRotaDATAINICIO: TDateTimeField;
    FDMemTRotaREPROGRAMAR: TStringField;
    FDMemTRotaFREQUENCIA: TSmallintField;
    FDMemTRotaRELATORIO: TStringField;
    FDMemTRotaC_DIASATRASO: TIntegerField;
    FDMemTRotaC_PROXINSP: TDateTimeField;
    FDMemTRotaCODIGO: TStringField;
    FDMemTRotaPERIODO: TStringField;
    DSMemTLubrificItensEsp: TDataSource;
    DSMemTLubrificPlanoTrab: TDataSource;
    DSMemTRota: TDataSource;
    FDMemTRotaSeq: TFDMemTable;
    DSMemTRotaSeq: TDataSource;
    FDMemTRotaSeqCODEMPRESA: TStringField;
    FDMemTRotaSeqCODROTA: TStringField;
    FDMemTRotaSeqCODAREA: TStringField;
    FDMemTRotaSeqCODCELULA: TStringField;
    FDMemTRotaSeqCODLINHA: TStringField;
    FDMemTRotaSeqSEQUENCIA: TIntegerField;
    FDMemTRotaSeqCODFAMILIAEQUIP: TStringField;
    FDMemTRotaSeqAREA: TStringField;
    FDMemTRotaSeqCELULA: TStringField;
    FDMemTRotaSeqLINHA: TStringField;
    FDMemTRotaSeqFAMILIAEQUIP: TStringField;
    FDMemTRotaSeqCODEQUIPATUAL: TStringField;
    FDMemTRotaSeqEQUIPATUAL: TStringField;
    FDMemTRotaSeqFREQUENCIA: TIntegerField;
    FDMemTRotaSeqCODIGO: TStringField;
    FDMemTRotaSeqManut: TFDMemTable;
    DSMemTRotaSeqManut: TDataSource;
    FDMemTRotaSeqManutItens: TFDMemTable;
    DSMemTRotaSeqManutItens: TDataSource;
    FDMemTRotaSeqManutItensCODIGO: TIntegerField;
    FDMemTRotaSeqManutItensCODEMPRESA: TStringField;
    FDMemTRotaSeqManutItensCODPARTE: TIntegerField;
    FDMemTRotaSeqManutItensITEM: TStringField;
    FDMemTRotaSeqManutItensDESCINSPECAO: TStringField;
    FDMemTRotaSeqManutItensEQUIPPARADO: TStringField;
    FDMemTRotaSeqManutItensTEMPO: TBCDField;
    FDMemTRotaSeqManutItensEXECAUTONOMO: TStringField;
    FDMemTRotaSeqManutItensEXECUTADO: TStringField;
    FDMemTRotaSeqManutItensBOM: TStringField;
    FDMemTRotaSeqManutItensREGULAR: TStringField;
    FDMemTRotaSeqManutItensRUIM: TStringField;
    FDMemTRotaSeqManutItensPARTE: TStringField;
    FDMemTRotaSeqManutItensEsp: TFDMemTable;
    DSMemTRotaSeqManutItensEsp: TDataSource;
    FDMemTRotaSeqManutItensEspCODIGO: TIntegerField;
    FDMemTRotaSeqManutItensEspCODEMPRESA: TStringField;
    FDMemTRotaSeqManutItensEspCODMANUTPROGEQUIP: TStringField;
    FDMemTRotaSeqManutItensEspCODPARTE: TIntegerField;
    FDMemTRotaSeqManutItensEspITEM: TStringField;
    FDMemTRotaSeqManutItensEspDESCINSPECAO: TStringField;
    FDMemTRotaSeqManutItensEspEQUIPPARADO: TStringField;
    FDMemTRotaSeqManutItensEspTEMPO: TBCDField;
    FDMemTRotaSeqManutItensEspEXECAUTONOMO: TStringField;
    FDMemTRotaSeqManutItensEspEXECUTADO: TStringField;
    FDMemTRotaSeqManutItensEspBOM: TStringField;
    FDMemTRotaSeqManutItensEspREGULAR: TStringField;
    FDMemTRotaSeqManutItensEspRUIM: TStringField;
    FDMemTRotaSeqManutItensEspPARTE: TStringField;
    FDMemTRotaSeqManutItensCODMANUTPROGFAMEQUIP: TStringField;
    FDMemTRotaSeqSEQEQUIPATUAL: TIntegerField;
    FDMemTRotaSeqManutCODEMPRESA: TStringField;
    FDMemTRotaSeqManutCODMANUTPROGFAMEQUIP: TStringField;
    FDMemTRotaSeqManutDESCRICAO: TStringField;
    FDMemTRotaSeqManutDTAINICIO1: TDateTimeField;
    FDMemTRotaSeqManutRELATORIO: TStringField;
    FDMemTRotaSeqManutFREQUENCIA1: TSmallintField;
    FDMemTRotaSeqManutCODEQUIPAMENTO: TStringField;
    FDMemTRotaSeqManutCODIGO: TStringField;
    FDMemTLubrific: TFDMemTable;
    FDMemTLubrificCODIGO: TStringField;
    FDMemTLubrificDESCRICAO: TStringField;
    FDMemTLubrificFREQUENCIA1: TSmallintField;
    FDMemTLubrificDTAINICIO1: TDateTimeField;
    FDMemTLubrificCODEQUIPAMENTO: TStringField;
    FDMemTLubrificEQUIPAMENTO: TStringField;
    FDMemTLubrificCODEMPRESA: TStringField;
    FDMemTLubrificC_DIASATRASO: TIntegerField;
    FDMemTLubrificCODLUBRIFICPROGFAMEQUIP: TStringField;
    FDMemTLubrificCODMONITORAMENTO: TIntegerField;
    FDMemTLubrificCRITICIDADE: TStringField;
    FDMemTLubrificREPROGRAMAR1: TStringField;
    FDMemTLubrificFREQUENCIA2: TSmallintField;
    FDMemTLubrificLEITURA: TIntegerField;
    FDMemTLubrificREPROGRAMAR2: TStringField;
    FDMemTLubrificRELATORIO: TStringField;
    FDMemTLubrificSEQUENCIA: TIntegerField;
    FDMemTLubrificDESCLUBRIFICPROGFAMEQUIP: TStringField;
    FDMemTLubrificCODFAMILIAEQUIP: TStringField;
    FDMemTLubrificFAMILIAEQUIP: TStringField;
    FDMemTLubrificPROGRAMACAO2: TStringField;
    FDMemTLubrificCODAREA: TStringField;
    FDMemTLubrificAREA: TStringField;
    FDMemTLubrificCODCELULA: TStringField;
    FDMemTLubrificCELULA: TStringField;
    FDMemTLubrificCODLINHA: TStringField;
    FDMemTLubrificLINHA: TStringField;
    FDMemTLubrificPERIODO: TStringField;
    FDMemTLubrificC_PROXINSP: TDateTimeField;
    FDMemTManutCODORDEMSERVICO: TIntegerField;
    FDMemTLubrificCODORDEMSERVICO: TIntegerField;
    FDMemTRotaCODORDEMSERVICO: TIntegerField;
    Label12: TLabel;
    edtOficina: TEdit;
    BtnOficina: TButton;
    procedure BtnOKClick(Sender: TObject);
    procedure GrdManutDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImprimirClick(Sender: TObject);
    procedure CBPeriodoChange(Sender: TObject);
    procedure BtnAreaClick(Sender: TObject);
    procedure EdtFamiliaEquipDblClick(Sender: TObject);
    procedure BtnFamiliaEquipClick(Sender: TObject);
    procedure edtAreaDblClick(Sender: TObject);
    procedure CBCriticidadeChange(Sender: TObject);
    procedure GrdManutKeyPress(Sender: TObject; var Key: Char);
    procedure FDMemTManutCalcFields(DataSet: TDataSet);
    procedure FDMemTLubrificCalcFields(DataSet: TDataSet);
    procedure GrdLubrificKeyPress(Sender: TObject; var Key: Char);
    procedure FDMemTRotaCalcFields(DataSet: TDataSet);
    procedure PCInspecoesChange(Sender: TObject);
    procedure chbTudoClick(Sender: TObject);
    procedure FDMemTLubrific1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure edtOficinaDblClick(Sender: TObject);
    procedure BtnOficinaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaInspConsulta: TFrmTelaInspConsulta;
  LCodArea, LCodFamilia, LCodOficina: String;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM, UnTelaPrincipal;

procedure TFrmTelaInspConsulta.BtnAreaClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 150;
    DM.FNomeConsulta := '�reas';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodArea     := DM.FCodCombo;
        edtArea.Text := DM.FValorCombo;
        CBPeriodo.OnChange(Sender);
      end;
  end;
end;

procedure TFrmTelaInspConsulta.BtnFamiliaEquipClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Fam�lias de Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodFamilia          := DM.FCodCombo;
        EdtFamiliaEquip.Text := DM.FValorCombo;
        CBPeriodo.OnChange(Sender);
      end;
  end;
end;

procedure TFrmTelaInspConsulta.BtnImprimirClick(Sender: TObject);
var
  I: SmallInt;
  bmQuery : TBookmark;
begin
  inherited;
  case PCInspecoes.TabIndex of
    0:
      begin
        DM.MSGAguarde('');

        if DM.qryManutConsItens.Active = False then DM.qryManutConsItens.Open;
        if DM.qryManutConsItensEsp.Active = False then DM.qryManutConsItensEsp.Open;
        if DM.qryManutConsPlanoTrab.Active = False then DM.qryManutConsPlanoTrab.Open;

//        FDMemTManut.Close; FDMemTManut.CreateDataSet; FDMemTManut.Open;
//        FDMemTManutItens.Close; FDMemTManutItens.CreateDataSet; FDMemTManutItens.Open;
//        FDMemTManutItensEsp.Close; FDMemTManutItensEsp.CreateDataSet; FDMemTManutItensEsp.Open;
//        FDMemTManutPlanoTrab.Close; FDMemTManutPlanoTrab.CreateDataSet; FDMemTManutPlanoTrab.Open;
//
//        if GrdManut.SelectedRows.Count = 0 then
//          GrdManut.SelectedRows.CurrentRowSelected := True;
//
//        for I := 0 to GrdManut.SelectedRows.Count - 1 do
//          begin
//            GrdManut.DataSource.DataSet.GotoBookmark(GrdManut.SelectedRows.Items[i]);
//
//            if (DM.qryManutConsREPROGRAMAR1.AsString = 'Execu��o') and (DM.qryManutConsRELATORIO.AsString = 'S') then
//              begin
//                PAuxiliares.Font.Color := clRed;
//                PAuxiliares.Caption := 'EXISTE UMA '+DM.qryManutConsDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
//                Exit;
//              end;
//
//            //Carrega FdMemTable para o relat�rio
//            FDMemTManut.Append;
//            FDMemTManutCODIGO.AsString               := DM.qryManutConsCODIGO.AsString;
//            FDMemTManutDESCRICAO.AsString            := DM.qryManutConsDESCRICAO.AsString;
//            FDMemTManutFREQUENCIA1.AsInteger         := DM.qryManutConsFREQUENCIA1.AsInteger;
//            FDMemTManutDTAINICIO1.AsDateTime         := DM.qryManutConsDTAINICIO1.AsDateTime;
//            FDMemTManutCODEQUIPAMENTO.AsString       := DM.qryManutConsCODEQUIPAMENTO.AsString;
//            FDMemTManutEQUIPAMENTO.AsString          := DM.qryManutConsEQUIPAMENTO.AsString;
//            FDMemTManutCODEMPRESA.AsString           := DM.qryManutConsCODEMPRESA.AsString;
//            FDMemTManutCODMANUTPROGFAMEQUIP.AsString := DM.qryManutConsCODMANUTPROGFAMEQUIP.AsString;
//            FDMemTManutCODMONITORAMENTO.AsInteger    := DM.qryManutConsCODMONITORAMENTO.AsInteger;
//            FDMemTManutCRITICIDADE.AsString          := DM.qryManutConsCRITICIDADE.AsString;
//            FDMemTManutREPROGRAMAR1.AsString         := DM.qryManutConsREPROGRAMAR1.AsString;
//            FDMemTManutFREQUENCIA2.AsInteger         := DM.qryManutConsFREQUENCIA2.AsInteger;
//            FDMemTManutLEITURA.AsInteger             := DM.qryManutConsLEITURA.AsInteger;
//            FDMemTManutREPROGRAMAR2.AsString         := DM.qryManutConsREPROGRAMAR2.AsString;
//            FDMemTManutRELATORIO.AsString            := DM.qryManutConsRELATORIO.AsString;
//            FDMemTManutSEQUENCIA.AsInteger           := DM.qryManutConsSEQUENCIA.AsInteger;
//            FDMemTManutCODFAMILIAEQUIP.AsString      := DM.qryManutConsCODFAMILIAEQUIP.AsString;
//            FDMemTManutFAMILIAEQUIP.AsString         := DM.qryManutConsFAMILIAEQUIP.AsString;
//            FDMemTManutPROGRAMACAO2.AsString         := DM.qryManutConsPROGRAMACAO2.AsString;
//            FDMemTManutDESCMANUTPROGFAMEQUIP.AsString:= DM.qryManutConsDESCMANUTPROGFAMEQUIP.AsString;
//            FDMemTManutCODAREA.AsString              := DM.qryManutConsCODAREA.AsString;
//            FDMemTManutAREA.AsString                 := DM.qryManutConsAREA.AsString;
//            FDMemTManutCODCELULA.AsString            := DM.qryManutConsCODCELULA.AsString;
//            FDMemTManutCELULA.AsString               := DM.qryManutConsCELULA.AsString;
//            FDMemTManutCODLINHA.AsString             := DM.qryManutConsCODLINHA.AsString;
//            FDMemTManutLINHA.AsString                := DM.qryManutConsLINHA.AsString;
//            FDMemTManutCODORDEMSERVICO.AsInteger     := DM.qryManutConsCODORDEMSERVICO.AsInteger;
//            FDMemTManutPERIODO.AsString              := DM.qryManutConsPERIODO.AsString;
//            FDMemTManutC_PROXINSP.AsDateTime         := DM.qryManutConsC_PROXINSP.AsDateTime;
//            FDMemTManut.Post;
//
//            DM.qryManutConsItens.First;
//            while not DM.qryManutConsItens.Eof = True do
//              begin
//                if FDMemTManutItens.Locate('CODIGO', DM.qryManutConsItensCODIGO.AsInteger, []) = False then
//                  begin
//                    FDMemTManutItens.Append;
//                    FDMemTManutItensCODIGO.AsString               := DM.qryManutConsItensCODIGO.AsString;
//                    FDMemTManutItensCODEMPRESA.AsString           := DM.qryManutConsItensCODEMPRESA.AsString;
//                    FDMemTManutItensCODMANUTPROGFAMEQUIP.AsString := DM.qryManutConsItensCODMANUTPROGFAMEQUIP.AsString;
//                    FDMemTManutItensCODPARTE.AsString             := DM.qryManutConsItensCODPARTE.AsString;
//                    FDMemTManutItensITEM.AsString                 := DM.qryManutConsItensITEM.AsString;
//                    FDMemTManutItensDESCINSPECAO.AsString         := DM.qryManutConsItensDESCINSPECAO.AsString;
//                    FDMemTManutItensEQUIPPARADO.AsString          := DM.qryManutConsItensEQUIPPARADO.AsString;
//                    FDMemTManutItensTEMPO.AsString                := DM.qryManutConsItensTEMPO.AsString;
//                    FDMemTManutItensEXECAUTONOMO.AsString         := DM.qryManutConsItensEXECAUTONOMO.AsString;
//                    FDMemTManutItensPARTE.AsString                := DM.qryManutConsItensPARTE.AsString;
//                    FDMemTManutItens.Post;
//                  end;
//
//                DM.qryManutConsItens.Next;
//              end;
//
//            DM.qryManutConsItensEsp.First;
//            while not DM.qryManutConsItensEsp.Eof = True do
//              begin
//                if FDMemTManutItensEsp.Locate('CODIGO', DM.qryManutConsItensEspCODIGO.AsInteger, []) = False then
//                  begin
//                    FDMemTManutItensEsp.Append;
//                    FDMemTManutItensEspCODIGO.AsString            := DM.qryManutConsItensEspCODIGO.AsString;
//                    FDMemTManutItensEspCODEMPRESA.AsString        := DM.qryManutConsItensEspCODEMPRESA.AsString;
//                    FDMemTManutItensEspCODMANUTPROGEQUIP.AsString := DM.qryManutConsItensEspCODMANUTPROGEQUIP.AsString;
//                    FDMemTManutItensEspCODPARTE.AsString          := DM.qryManutConsItensEspCODPARTE.AsString;
//                    FDMemTManutItensEspITEM.AsString              := DM.qryManutConsItensEspITEM.AsString;
//                    FDMemTManutItensEspDESCINSPECAO.AsString      := DM.qryManutConsItensEspDESCINSPECAO.AsString;
//                    FDMemTManutItensEspEQUIPPARADO.AsString       := DM.qryManutConsItensEspEQUIPPARADO.AsString;
//                    FDMemTManutItensEspTEMPO.AsString             := DM.qryManutConsItensEspTEMPO.AsString;
//                    FDMemTManutItensEspEXECAUTONOMO.AsString      := DM.qryManutConsItensEspEXECAUTONOMO.AsString;
//                    FDMemTManutItensEspPARTE.AsString             := DM.qryManutConsItensEspPARTE.AsString;
//                    FDMemTManutItensEsp.Post;
//                  end;
//
//                DM.qryManutConsItensEsp.Next;
//              end;
//
//            DM.qryManutConsPlanoTrab.First;
//            while not DM.qryManutConsPlanoTrab.Eof = True do
//              begin
//                if FDMemTManutPlanoTrab.Locate('CODIGO', DM.qryManutConsPlanoTrabCODIGO.AsString, []) = False then
//                  begin
//                    FDMemTManutPlanoTrab.Append;
//                    FDMemTManutPlanoTrabCODIGO.AsString               := DM.qryManutConsPlanoTrabCODIGO.AsString;
//                    FDMemTManutPlanoTrabCODEMPRESA.AsString           := DM.qryManutConsPlanoTrabCODEMPRESA.AsString;
//                    FDMemTManutPlanoTrabCODMANUTPROGFAMEQUIP.AsString := DM.qryManutConsPlanoTrabCODMANUTPROGFAMEQUIP.AsString;
//                    FDMemTManutPlanoTrabCODPLANOTRABALHO.AsString     := DM.qryManutConsPlanoTrabCODPLANOTRABALHO.AsString;
//                    FDMemTManutPlanoTrabPLANOTRABALHO.AsString        := DM.qryManutConsPlanoTrabPLANOTRABALHO.AsString;
//                    FDMemTManutPlanoTrabDETALHES.AsString             := DM.qryManutConsPlanoTrabDETALHES.AsString;
//                    FDMemTManutPlanoTrab.Post;
//                  end;
//
//                DM.qryManutConsPlanoTrab.Next;
//              end;
//
//
//          end;
//
//        DmRelatorios.frxDBInspConsManut.DataSet :=  FDMemTManut;
//        DmRelatorios.frxDBInspConsManutItens.DataSet :=  FDMemTManutItens;
//        DmRelatorios.frxDBInspConsManutItensEsp.DataSet :=  FDMemTManutItensEsp;
//        DmRelatorios.frxDBInspConsManutPlanoTrab.DataSet :=  FDMemTManutPlanoTrab;

//        DmRelatorios.frxRInspConsManut.ShowReport();


        DmRelatorios.frxDBInspConsManut.DataSet :=  DM.qryManutCons;
        DmRelatorios.frxRInspConsManut1.ShowReport();


//        FDMemTManut.Close;
//        FDMemTManutItens.Close;
//        FDMemTManutItensEsp.Close;
//        FDMemTManutPlanoTrab.Close;

        DM.MSGAguarde('', False);

        CBPeriodo.OnChange(Sender);

        chbTudo.Checked := False;

        TSManut.Caption := 'Manutenções ('+ IntToStr(FDMemTManut.RecordCount)+')';

        chbTudo.Checked := False;
      end;
    1:
      begin
        if DM.qryLubrificConsItens.Active = False then DM.qryLubrificConsItens.Open;
        if DM.qryLubrificConsItensEsp.Active = False then DM.qryLubrificConsItensEsp.Open;
        if DM.qryLubrificConsPlanoTrab.Active = False then DM.qryLubrificConsPlanoTrab.Open;

//        FDMemTLubrific.Close; FDMemTLubrific.CreateDataSet; FDMemTLubrific.Open;
//        FDMemTLubrificItens.Close; FDMemTLubrificItens.CreateDataSet; FDMemTLubrificItens.Open;
//        FDMemTLubrificItensEsp.Close; FDMemTLubrificItensEsp.CreateDataSet; FDMemTLubrificItensEsp.Open;
//        FDMemTLubrificPlanoTrab.Close; FDMemTLubrificPlanoTrab.CreateDataSet; FDMemTLubrificPlanoTrab.Open;
//
//        if GrdLubrific.SelectedRows.Count = 0 then
//          GrdLubrific.SelectedRows.CurrentRowSelected := True;
//
//        for I := 0 to GrdLubrific.SelectedRows.Count - 1 do
//          begin
//            GrdLubrific.DataSource.DataSet.GotoBookmark(GrdLubrific.SelectedRows.Items[i]);
//
//            //Carrega FdMemTable para o relat�rio
//            FDMemTLubrific.Append;
//            FDMemTLubrificCODIGO.AsString               := DM.qryLubrificConsCODIGO.AsString;
//            FDMemTLubrificDESCRICAO.AsString            := DM.qryLubrificConsDESCRICAO.AsString;
//            FDMemTLubrificFREQUENCIA1.AsInteger         := DM.qryLubrificConsFREQUENCIA1.AsInteger;
//            FDMemTLubrificDTAINICIO1.AsDateTime         := DM.qryLubrificConsDTAINICIO1.AsDateTime;
//            FDMemTLubrificCODEQUIPAMENTO.AsString       := DM.qryLubrificConsCODEQUIPAMENTO.AsString;
//            FDMemTLubrificEQUIPAMENTO.AsString          := DM.qryLubrificConsEQUIPAMENTO.AsString;
//            FDMemTLubrificCODEMPRESA.AsString           := DM.qryLubrificConsCODEMPRESA.AsString;
//            FDMemTLubrificCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificConsCODLUBRIFICPROGFAMEQUIP.AsString;
//            FDMemTLubrificCODMONITORAMENTO.AsInteger    := DM.qryLubrificConsCODMONITORAMENTO.AsInteger;
//            FDMemTLubrificCRITICIDADE.AsString          := DM.qryLubrificConsCRITICIDADE.AsString;
//            FDMemTLubrificREPROGRAMAR1.AsString         := DM.qryLubrificConsREPROGRAMAR1.AsString;
//            FDMemTLubrificFREQUENCIA2.AsInteger         := DM.qryLubrificConsFREQUENCIA2.AsInteger;
//            FDMemTLubrificLEITURA.AsInteger             := DM.qryLubrificConsLEITURA.AsInteger;
//            FDMemTLubrificREPROGRAMAR2.AsString         := DM.qryLubrificConsREPROGRAMAR2.AsString;
//            FDMemTLubrificRELATORIO.AsString            := DM.qryLubrificConsRELATORIO.AsString;
//            FDMemTLubrificSEQUENCIA.AsInteger           := DM.qryLubrificConsSEQUENCIA.AsInteger;
//            FDMemTLubrificCODFAMILIAEQUIP.AsString      := DM.qryLubrificConsCODFAMILIAEQUIP.AsString;
//            FDMemTLubrificFAMILIAEQUIP.AsString         := DM.qryLubrificConsFAMILIAEQUIP.AsString;
//            FDMemTLubrificPROGRAMACAO2.AsString         := DM.qryLubrificConsPROGRAMACAO2.AsString;
//            FDMemTLubrificDESCLUBRIFICPROGFAMEQUIP.AsString:= DM.qryLubrificConsDESCLUBRIFICPROGFAMEQUIP.AsString;
//            FDMemTLubrificCODAREA.AsString              := DM.qryLubrificConsCODAREA.AsString;
//            FDMemTLubrificAREA.AsString                 := DM.qryLubrificConsAREA.AsString;
//            FDMemTLubrificCODCELULA.AsString            := DM.qryLubrificConsCODCELULA.AsString;
//            FDMemTLubrificCELULA.AsString               := DM.qryLubrificConsCELULA.AsString;
//            FDMemTLubrificCODLINHA.AsString             := DM.qryLubrificConsCODLINHA.AsString;
//            FDMemTLubrificLINHA.AsString                := DM.qryLubrificConsLINHA.AsString;
//            FDMemTLubrificCODORDEMSERVICO.AsInteger     := DM.qryLubrificConsCODORDEMSERVICO.AsInteger;
//            FDMemTLubrificPERIODO.AsString              := DM.qryLubrificConsPERIODO.AsString;
//            FDMemTLubrificC_PROXINSP.AsDateTime         := DM.qryLubrificConsC_PROXINSP.AsDateTime;
//            FDMemTLubrific.Post;
//
//            DM.qryLubrificConsItens.First;
//            while not DM.qryLubrificConsItens.Eof = True do
//              begin
//                FDMemTLubrificItens.Append;
//                FDMemTLubrificItensCODIGO.AsString               := DM.qryLubrificConsItensCODIGO.AsString;
//                FDMemTLubrificItensCODEMPRESA.AsString           := DM.qryLubrificConsItensCODEMPRESA.AsString;
//                FDMemTLubrificItensCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificConsItensCODLUBRIFICPROGFAMEQUIP.AsString;
//                FDMemTLubrificItensCODPARTE.AsString             := DM.qryLubrificConsItensCODPARTE.AsString;
//                FDMemTLubrificItensITEM.AsString                 := DM.qryLubrificConsItensITEM.AsString;
//                FDMemTLubrificItensDESCINSPECAO.AsString         := DM.qryLubrificConsItensDESCINSPECAO.AsString;
//                FDMemTLubrificItensEQUIPPARADO.AsString          := DM.qryLubrificConsItensEQUIPPARADO.AsString;
//                FDMemTLubrificItensTEMPO.AsString                := DM.qryLubrificConsItensTEMPO.AsString;
//                FDMemTLubrificItensEXECAUTONOMO.AsString         := DM.qryLubrificConsItensEXECAUTONOMO.AsString;
//                FDMemTLubrificItensPARTE.AsString                := DM.qryLubrificConsItensPARTE.AsString;
//                FDMemTLubrificItens.Post;
//
//                DM.qryLubrificConsItens.Next;
//              end;
//
//            DM.qryLubrificConsItensEsp.First;
//            while not DM.qryLubrificConsItensEsp.Eof = True do
//              begin
//                FDMemTLubrificItensEsp.Append;
//                FDMemTLubrificItensEspCODIGO.AsString            := DM.qryLubrificConsItensEspCODIGO.AsString;
//                FDMemTLubrificItensEspCODEMPRESA.AsString        := DM.qryLubrificConsItensEspCODEMPRESA.AsString;
//                FDMemTLubrificItensEspCODLUBRIFICPROGEQUIP.AsString := DM.qryLubrificConsItensEspCODLUBRIFICPROGEQUIP.AsString;
//                FDMemTLubrificItensEspCODPARTE.AsString          := DM.qryLubrificConsItensEspCODPARTE.AsString;
//                FDMemTLubrificItensEspITEM.AsString              := DM.qryLubrificConsItensEspITEM.AsString;
//                FDMemTLubrificItensEspDESCINSPECAO.AsString      := DM.qryLubrificConsItensEspDESCINSPECAO.AsString;
//                FDMemTLubrificItensEspEQUIPPARADO.AsString       := DM.qryLubrificConsItensEspEQUIPPARADO.AsString;
//                FDMemTLubrificItensEspTEMPO.AsString             := DM.qryLubrificConsItensEspTEMPO.AsString;
//                FDMemTLubrificItensEspEXECAUTONOMO.AsString      := DM.qryLubrificConsItensEspEXECAUTONOMO.AsString;
//                FDMemTLubrificItensEspPARTE.AsString             := DM.qryLubrificConsItensEspPARTE.AsString;
//                FDMemTLubrificItensEsp.Post;
//
//                DM.qryLubrificConsItensEsp.Next;
//              end;
//
//            DM.qryLubrificConsPlanoTrab.First;
//            while not DM.qryLubrificConsPlanoTrab.Eof = True do
//              begin
//                FDMemTLubrificPlanoTrab.Append;
//                FDMemTLubrificPlanoTrabCODIGO.AsString               := DM.qryLubrificConsPlanoTrabCODIGO.AsString;
//                FDMemTLubrificPlanoTrabCODEMPRESA.AsString           := DM.qryLubrificConsPlanoTrabCODEMPRESA.AsString;
//                FDMemTLubrificPlanoTrabCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificConsPlanoTrabCODLUBRIFICPROGFAMEQUIP.AsString;
//                FDMemTLubrificPlanoTrabCODPLANOTRABALHO.AsString     := DM.qryLubrificConsPlanoTrabCODPLANOTRABALHO.AsString;
//                FDMemTLubrificPlanoTrabPLANOTRABALHO.AsString        := DM.qryLubrificConsPlanoTrabPLANOTRABALHO.AsString;
//                FDMemTLubrificPlanoTrabDETALHES.AsString             := DM.qryLubrificConsPlanoTrabDETALHES.AsString;
//                FDMemTLubrificPlanoTrab.Post;
//
//                DM.qryLubrificConsPlanoTrab.Next;
//              end;
//
//           DM.qryLubrificCons.FreeBookMark(bmQuery);
//         end;
//
//        DmRelatorios.frxDBInspConsLubrific.DataSet :=  FDMemTLubrific;
//        DmRelatorios.frxDBInspConsLubrificItens.DataSet :=  FDMemTLubrificItens;
//        DmRelatorios.frxDBInspConsLubrificItensEsp.DataSet :=  FDMemTLubrificItensEsp;
//        DmRelatorios.frxDBInspConsLubrificPlanoTrab.DataSet :=  FDMemTLubrificPlanoTrab;

        DmRelatorios.frxDBInspConsLubrific.DataSet :=  DM.qryLubrificCons;
        DmRelatorios.frxRInspConsLubrific1.ShowReport();

//        FDMemTLubrific.Close;
//        FDMemTLubrificItens.Close;
//        FDMemTLubrificItensEsp.Close;
//        FDMemTLubrificPlanoTrab.Close;

        chbTudo.Checked := False;
      end;
    2:
      begin
        if DM.qryRotaConsSeq.Active = False then DM.qryRotaConsSeq.Open;
        if DM.qryRotaConsSeqManut.Active = False then DM.qryRotaConsSeqManut.Open;
        if DM.qryRotaConsSeqManutItens.Active = False then DM.qryRotaConsSeqManutItens.Open;
        if DM.qryRotaConsSeqManutItensEsp.Active = False then DM.qryRotaConsSeqManutItensEsp.Open;

//        FDMemTRota.Close; FDMemTRota.CreateDataSet; FDMemTRota.Open;
//        FDMemTRotaSeq.Close; FDMemTRotaSeq.CreateDataSet; FDMemTRotaSeq.Open;
//        FDMemTRotaSeqManut.Close; FDMemTRotaSeqManut.CreateDataSet; FDMemTRotaSeqManut.Open;
//        FDMemTRotaSeqManutItens.Close; FDMemTRotaSeqManutItens.CreateDataSet; FDMemTRotaSeqManutItens.Open;
//        FDMemTRotaSeqManutItensEsp.Close; FDMemTRotaSeqManutItensEsp.CreateDataSet; FDMemTRotaSeqManutItensEsp.Open;
//
//        if GrdRota.SelectedRows.Count = 0 then
//          GrdRota.SelectedRows.CurrentRowSelected := True;
//
//        for I := 0 to GrdRota.SelectedRows.Count - 1 do
//          begin
//            GrdRota.DataSource.DataSet.GotoBookmark(GrdRota.SelectedRows.Items[i]);
//
//            //Carrega FdMemTable para o relat�rio
//            FDMemTRota.Append;
//            FDMemTRotaCODIGO.AsString             := DM.qryRotaConsCODIGO.AsString;
//            FDMemTRotaDESCRICAO.AsString          := DM.qryRotaConsDESCRICAO.AsString;
//            FDMemTRotaFREQUENCIA.AsInteger        := DM.qryRotaConsFREQUENCIA.AsInteger;
//            FDMemTRotaDATAINICIO.AsDateTime       := DM.qryRotaConsDATAINICIO.AsDateTime;
//            FDMemTRotaCODEMPRESA.AsString         := DM.qryRotaConsCODEMPRESA.AsString;
//            FDMemTRotaREPROGRAMAR.AsString        := DM.qryRotaConsREPROGRAMAR.AsString;
//            FDMemTRotaRELATORIO.AsString          := DM.qryRotaConsRELATORIO.AsString;
//            FDMemTRotaCODORDEMSERVICO.AsInteger := DM.qryRotaConsCODORDEMSERVICO.AsInteger;
//            FDMemTRotaPERIODO.AsString            := DM.qryRotaConsPERIODO.AsString;
//            FDMemTRotaC_PROXINSP.AsDateTime       := DM.qryRotaConsC_PROXINSP.AsDateTime;
//            FDMemTRota.Post;
//
//            DM.qryRotaConsSeq.First;
//            while not DM.qryRotaConsSeq.Eof = True do
//              begin
//                FDMemTRotaSeq.Append;
//                FDMemTRotaSeqCODIGO.AsString          := DM.qryRotaConsSeqCODIGO.AsString;
//                FDMemTRotaSeqCODEMPRESA.AsString      := DM.qryRotaConsSeqCODEMPRESA.AsString;
//                FDMemTRotaSeqCODROTA.AsString         := DM.qryRotaConsSeqCODROTA.AsString;
//                FDMemTRotaSeqCODAREA.AsString         := DM.qryRotaConsSeqCODAREA.AsString;
//                FDMemTRotaSeqCODCELULA.AsString       := DM.qryRotaConsSeqCODCELULA.AsString;
//                FDMemTRotaSeqCODLINHA.AsString        := DM.qryRotaConsSeqCODLINHA.AsString;
//                FDMemTRotaSeqSEQUENCIA.AsString       := DM.qryRotaConsSeqSEQUENCIA.AsString;
//                FDMemTRotaSeqCODFAMILIAEQUIP.AsString := DM.qryRotaConsSeqCODFAMILIAEQUIP.AsString;
//                FDMemTRotaSeqAREA.AsString            := DM.qryRotaConsSeqAREA.AsString;
//                FDMemTRotaSeqCELULA.AsString          := DM.qryRotaConsSeqCELULA.AsString;
//                FDMemTRotaSeqLINHA.AsString           := DM.qryRotaConsSeqLINHA.AsString;
//                FDMemTRotaSeqFAMILIAEQUIP.AsString    := DM.qryRotaConsSeqFAMILIAEQUIP.AsString;
//                FDMemTRotaSeqCODEQUIPATUAL.AsString   := DM.qryRotaConsSeqCODEQUIPATUAL.AsString;
//                FDMemTRotaSeqEQUIPATUAL.AsString      := DM.qryRotaConsSeqEQUIPATUAL.AsString;
//                FDMemTRotaSeqFREQUENCIA.AsString      := DM.qryRotaConsSeqFREQUENCIA.AsString;
//                FDMemTRotaSeq.Post;
//
//                DM.qryRotaConsSeq.Next;
//              end;
//
//            DM.qryRotaConsSeqManut.First;
//            while not DM.qryRotaConsSeqManut.Eof = True do
//              begin
//                FDMemTRotaSeqManut.Append;
//                FDMemTRotaSeqManutCODIGO.AsString               := DM.qryRotaConsSeqManutCODIGO.AsString;
//                FDMemTRotaSeqManutCODEMPRESA.AsString           := DM.qryRotaConsSeqManutCODEMPRESA.AsString;
//                FDMemTRotaSeqManutCODMANUTPROGFAMEQUIP.AsString := DM.qryRotaConsSeqManutCODMANUTPROGFAMEQUIP.AsString;
//                FDMemTRotaSeqManutDESCRICAO.AsString            := DM.qryRotaConsSeqManutDESCRICAO.AsString;
//                FDMemTRotaSeqManutDTAINICIO1.AsString           := DM.qryRotaConsSeqManutDTAINICIO1.AsString;
//                FDMemTRotaSeqManutFREQUENCIA1.AsString          := DM.qryRotaConsSeqManutFREQUENCIA1.AsString;
//                FDMemTRotaSeqManutRELATORIO.AsString            := DM.qryRotaConsSeqManutRELATORIO.AsString;
//                FDMemTRotaSeqManutCODEQUIPAMENTO.AsString       := DM.qryRotaConsSeqManutCODEQUIPAMENTO.AsString;
//                FDMemTRotaSeqManut.Post;
//
//                DM.qryRotaConsSeqManut.Next;
//              end;
//
//
//            DM.qryRotaConsSeqManutItens.First;
//            while not DM.qryRotaConsSeqManutItens.Eof = True do
//              begin
//                FDMemTRotaSeqManutItens.Append;
//                FDMemTRotaSeqManutItensCODIGO.AsString               := DM.qryRotaConsSeqManutItensCODIGO.AsString;
//                FDMemTRotaSeqManutItensCODEMPRESA.AsString           := DM.qryRotaConsSeqManutItensCODEMPRESA.AsString;
//                FDMemTRotaSeqManutItensCODMANUTPROGFAMEQUIP.AsString := DM.qryRotaConsSeqManutItensCODMANUTPROGFAMEQUIP.AsString;
//                FDMemTRotaSeqManutItensCODPARTE.AsString             := DM.qryRotaConsSeqManutItensCODPARTE.AsString;
//                FDMemTRotaSeqManutItensITEM.AsString                 := DM.qryRotaConsSeqManutItensITEM.AsString;
//                FDMemTRotaSeqManutItensDESCINSPECAO.AsString         := DM.qryRotaConsSeqManutItensDESCINSPECAO.AsString;
//                FDMemTRotaSeqManutItensEQUIPPARADO.AsString          := DM.qryRotaConsSeqManutItensEQUIPPARADO.AsString;
//                FDMemTRotaSeqManutItensTEMPO.AsString                := DM.qryRotaConsSeqManutItensTEMPO.AsString;
//                FDMemTRotaSeqManutItensEXECAUTONOMO.AsString         := DM.qryRotaConsSeqManutItensEXECAUTONOMO.AsString;
//                FDMemTRotaSeqManutItensPARTE.AsString                := DM.qryRotaConsSeqManutItensPARTE.AsString;
//                FDMemTRotaSeqManutItens.Post;
//
//                DM.qryRotaConsSeqManutItens.Next;
//              end;
//
//            DM.qryRotaConsSeqManutItensEsp.First;
//            while not DM.qryRotaConsSeqManutItensEsp.Eof = True do
//              begin
//                FDMemTRotaSeqManutItensEsp.Append;
//                FDMemTRotaSeqManutItensEspCODIGO.AsString            := DM.qryRotaConsSeqManutItensEspCODIGO.AsString;
//                FDMemTRotaSeqManutItensEspCODEMPRESA.AsString        := DM.qryRotaConsSeqManutItensEspCODEMPRESA.AsString;
//                FDMemTRotaSeqManutItensEspCODMANUTPROGEQUIP.AsString := DM.qryRotaConsSeqManutItensEspCODMANUTPROGEQUIP.AsString;
//                FDMemTRotaSeqManutItensEspCODPARTE.AsString          := DM.qryRotaConsSeqManutItensEspCODPARTE.AsString;
//                FDMemTRotaSeqManutItensEspITEM.AsString              := DM.qryRotaConsSeqManutItensEspITEM.AsString;
//                FDMemTRotaSeqManutItensEspDESCINSPECAO.AsString      := DM.qryRotaConsSeqManutItensEspDESCINSPECAO.AsString;
//                FDMemTRotaSeqManutItensEspEQUIPPARADO.AsString       := DM.qryRotaConsSeqManutItensEspEQUIPPARADO.AsString;
//                FDMemTRotaSeqManutItensEspTEMPO.AsString             := DM.qryRotaConsSeqManutItensEspTEMPO.AsString;
//                FDMemTRotaSeqManutItensEspEXECAUTONOMO.AsString      := DM.qryRotaConsSeqManutItensEspEXECAUTONOMO.AsString;
//                FDMemTRotaSeqManutItensEspPARTE.AsString             := DM.qryRotaConsSeqManutItensEspPARTE.AsString;
//                FDMemTRotaSeqManutItensEsp.Post;
//
//                DM.qryRotaConsSeqManutItensEsp.Next;
//              end;
//
//            DM.qryRotaCons.FreeBookMark(bmQuery);
//          end;
//
//        DmRelatorios.frxDBInspConsRotas.DataSet :=  FDMemTRota;
//        DmRelatorios.frxDBInspConsRotasSeq.DataSet :=  FDMemTRotaSeq;
//        DmRelatorios.frxDBInspConsRotasSeqManut.DataSet :=  FDMemTRotaSeqManut;
//        DmRelatorios.frxDBInspConsRotasSeqManutItens.DataSet :=  FDMemTRotaSeqManutItens;
//        DmRelatorios.frxDBInspConsRotasSeqManutItensEsp.DataSet :=  FDMemTRotaSeqManutItensEsp;

        DmRelatorios.frxDBInspConsRotas.DataSet :=  DM.qryRotaCons;
        DmRelatorios.frxRInspConsRotas1.ShowReport();

//        FDMemTRota.Close;
//        FDMemTRotaSeq.Close;
//        FDMemTRotaSeqManut.Close;
//        FDMemTRotaSeqManutItens.Close;
//        FDMemTRotaSeqManutItensEsp.Close;

        chbTudo.Checked := False;
      end;
  end;
end;

procedure TFrmTelaInspConsulta.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodOficina     := DM.FCodCombo;
        EdtOficina.Text := DM.FValorCombo;
        CBPeriodo.OnChange(Sender);
      end;
  end;
end;

procedure TFrmTelaInspConsulta.BtnOKClick(Sender: TObject);
var
  I: SmallInt;
  LTexto: PChar;
  LInsp: String;
  bmQuery : TBookmark;
begin
  inherited;
PAuxiliares.Caption := EmptyStr;
LInsp := EmptyStr;

FrmTelaPrincipal.TimerOscioso.Enabled := False;
case PCInspecoes.TabIndex of
  0: //Manuten��es
    begin
      if DM.qryManutConsCODIGO.AsString = '' then Exit;

//      for I := 0 to GrdManut.SelectedRows.Count - 1 do
//        begin
//          DM.qryManutCons.GotoBookmark(GrdManut.SelectedRows.Items[I]);
//          LInsp := LInsp + IntToStr(DM.qryManutCons.RecNo) + '� - ' + DM.qryManutCons.FieldByName('DESCRICAO').AsString + #13;
//        end;


      LTexto := PChar('Deseja realmente executar a(s) inspeçõe(s) selecionada(s)?');

      if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.MSGAguarde('');

          if DM.qryManutConsItens.Active = False then DM.qryManutConsItens.Open;
          if DM.qryManutConsItensEsp.Active = False then DM.qryManutConsItensEsp.Open;
          if DM.qryManutConsPlanoTrab.Active = False then DM.qryManutConsPlanoTrab.Open;

          FDMemTManut.Close; FDMemTManut.CreateDataSet; FDMemTManut.Open;
          FDMemTManutItens.Close; FDMemTManutItens.CreateDataSet; FDMemTManutItens.Open;
          FDMemTManutItensEsp.Close; FDMemTManutItensEsp.CreateDataSet; FDMemTManutItensEsp.Open;
          FDMemTManutPlanoTrab.Close; FDMemTManutPlanoTrab.CreateDataSet; FDMemTManutPlanoTrab.Open;

          if GrdManut.SelectedRows.Count = 0 then
            GrdManut.SelectedRows.CurrentRowSelected := True;

          for I := 0 to GrdManut.SelectedRows.Count - 1 do
            begin
              GrdManut.DataSource.DataSet.GotoBookmark(GrdManut.SelectedRows.Items[i]);

              if (DM.qryManutConsREPROGRAMAR1.AsString = 'Execu��o') and (DM.qryManutConsRELATORIO.AsString = 'S') then
                begin
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'EXISTE UMA '+DM.qryManutConsDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
                  Exit;
                end;

              DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryManutConsDESCRICAO.AsString
                                                            , DM.qryManutConsCODEQUIPAMENTO.AsString, DM.qryManutConsCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                            , EmptyStr, 'Emerg�ncia', 'Para o Equipamento', DM.qryManutConsCODCENTROCUSTO.AsString, EmptyStr, DM.qryManutConstempototal.AsString, DM.qryManutConsCODOFICINA.AsString, DM.qryManutConsCODMANUTENCAO.AsString, DM.qryManutConsEQUIPPARADO.AsString);


              DM.HistoricoInspecoes(0, DM.FCodEmpresa, DM.qryManutConsCODEQUIPAMENTO.AsString, DM.qryManutConsCODIGO.AsString, DM.FCodOrdemServico);

              DM.qryManutCons.Edit;
              DM.qryManutConsCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;

              //Carrega FdMemTable para o relat�rio
              FDMemTManut.Append;
              FDMemTManutCODIGO.AsString               := DM.qryManutConsCODIGO.AsString;
              FDMemTManutDESCRICAO.AsString            := DM.qryManutConsDESCRICAO.AsString;
              FDMemTManutFREQUENCIA1.AsInteger         := DM.qryManutConsFREQUENCIA1.AsInteger;
              FDMemTManutDTAINICIO1.AsDateTime         := DM.qryManutConsDTAINICIO1.AsDateTime;
              FDMemTManutCODEQUIPAMENTO.AsString       := DM.qryManutConsCODEQUIPAMENTO.AsString;
              FDMemTManutEQUIPAMENTO.AsString          := DM.qryManutConsEQUIPAMENTO.AsString;
              FDMemTManutCODEMPRESA.AsString           := DM.qryManutConsCODEMPRESA.AsString;
              FDMemTManutCODMANUTPROGFAMEQUIP.AsString := DM.qryManutConsCODMANUTPROGFAMEQUIP.AsString;
              FDMemTManutCODMONITORAMENTO.AsInteger    := DM.qryManutConsCODMONITORAMENTO.AsInteger;
              FDMemTManutCRITICIDADE.AsString          := DM.qryManutConsCRITICIDADE.AsString;
              FDMemTManutREPROGRAMAR1.AsString         := DM.qryManutConsREPROGRAMAR1.AsString;
              FDMemTManutFREQUENCIA2.AsInteger         := DM.qryManutConsFREQUENCIA2.AsInteger;
              FDMemTManutLEITURA.AsInteger             := DM.qryManutConsLEITURA.AsInteger;
              FDMemTManutREPROGRAMAR2.AsString         := DM.qryManutConsREPROGRAMAR2.AsString;
              FDMemTManutRELATORIO.AsString            := DM.qryManutConsRELATORIO.AsString;
              FDMemTManutSEQUENCIA.AsInteger           := DM.qryManutConsSEQUENCIA.AsInteger;
              FDMemTManutCODFAMILIAEQUIP.AsString      := DM.qryManutConsCODFAMILIAEQUIP.AsString;
              FDMemTManutFAMILIAEQUIP.AsString         := DM.qryManutConsFAMILIAEQUIP.AsString;
              FDMemTManutPROGRAMACAO2.AsString         := DM.qryManutConsPROGRAMACAO2.AsString;
              FDMemTManutDESCMANUTPROGFAMEQUIP.AsString:= DM.qryManutConsDESCMANUTPROGFAMEQUIP.AsString;
              FDMemTManutCODAREA.AsString              := DM.qryManutConsCODAREA.AsString;
              FDMemTManutAREA.AsString                 := DM.qryManutConsAREA.AsString;
              FDMemTManutCODCELULA.AsString            := DM.qryManutConsCODCELULA.AsString;
              FDMemTManutCELULA.AsString               := DM.qryManutConsCELULA.AsString;
              FDMemTManutCODLINHA.AsString             := DM.qryManutConsCODLINHA.AsString;
              FDMemTManutLINHA.AsString                := DM.qryManutConsLINHA.AsString;
              FDMemTManutCODORDEMSERVICO.AsInteger     := DM.qryManutConsCODORDEMSERVICO.AsInteger;
              FDMemTManutPERIODO.AsString              := DM.qryManutConsPERIODO.AsString;
              FDMemTManutC_PROXINSP.AsDateTime         := DM.qryManutConsC_PROXINSP.AsDateTime;
              FDMemTManut.Post;

              DM.qryManutConsItens.First;
              while not DM.qryManutConsItens.Eof = True do
                begin
                  if FDMemTManutItens.Locate('CODIGO', DM.qryManutConsItensCODIGO.AsInteger, []) = False then
                    begin
                      FDMemTManutItens.Append;
                      FDMemTManutItensCODIGO.AsString               := DM.qryManutConsItensCODIGO.AsString;
                      FDMemTManutItensCODEMPRESA.AsString           := DM.qryManutConsItensCODEMPRESA.AsString;
                      FDMemTManutItensCODMANUTPROGFAMEQUIP.AsString := DM.qryManutConsItensCODMANUTPROGFAMEQUIP.AsString;
                      FDMemTManutItensCODPARTE.AsString             := DM.qryManutConsItensCODPARTE.AsString;
                      FDMemTManutItensITEM.AsString                 := DM.qryManutConsItensITEM.AsString;
                      FDMemTManutItensDESCINSPECAO.AsString         := DM.qryManutConsItensDESCINSPECAO.AsString;
                      FDMemTManutItensEQUIPPARADO.AsString          := DM.qryManutConsItensEQUIPPARADO.AsString;
                      FDMemTManutItensTEMPO.AsString                := DM.qryManutConsItensTEMPO.AsString;
                      FDMemTManutItensEXECAUTONOMO.AsString         := DM.qryManutConsItensEXECAUTONOMO.AsString;
                      FDMemTManutItensPARTE.AsString                := DM.qryManutConsItensPARTE.AsString;
                      FDMemTManutItens.Post;
                    end;

                  DM.qryManutConsItens.Next;
                end;

              DM.qryManutConsItensEsp.First;
              while not DM.qryManutConsItensEsp.Eof = True do
                begin
                  if FDMemTManutItensEsp.Locate('CODIGO', DM.qryManutConsItensEspCODIGO.AsInteger, []) = False then
                    begin
                      FDMemTManutItensEsp.Append;
                      FDMemTManutItensEspCODIGO.AsString            := DM.qryManutConsItensEspCODIGO.AsString;
                      FDMemTManutItensEspCODEMPRESA.AsString        := DM.qryManutConsItensEspCODEMPRESA.AsString;
                      FDMemTManutItensEspCODMANUTPROGEQUIP.AsString := DM.qryManutConsItensEspCODMANUTPROGEQUIP.AsString;
                      FDMemTManutItensEspCODPARTE.AsString          := DM.qryManutConsItensEspCODPARTE.AsString;
                      FDMemTManutItensEspITEM.AsString              := DM.qryManutConsItensEspITEM.AsString;
                      FDMemTManutItensEspDESCINSPECAO.AsString      := DM.qryManutConsItensEspDESCINSPECAO.AsString;
                      FDMemTManutItensEspEQUIPPARADO.AsString       := DM.qryManutConsItensEspEQUIPPARADO.AsString;
                      FDMemTManutItensEspTEMPO.AsString             := DM.qryManutConsItensEspTEMPO.AsString;
                      FDMemTManutItensEspEXECAUTONOMO.AsString      := DM.qryManutConsItensEspEXECAUTONOMO.AsString;
                      FDMemTManutItensEspPARTE.AsString             := DM.qryManutConsItensEspPARTE.AsString;
                      FDMemTManutItensEsp.Post;
                    end;

                  DM.qryManutConsItensEsp.Next;
                end;

              DM.qryManutConsPlanoTrab.First;
              while not DM.qryManutConsPlanoTrab.Eof = True do
                begin
                  if FDMemTManutPlanoTrab.Locate('CODIGO', DM.qryManutConsPlanoTrabCODIGO.AsString, []) = False then
                    begin
                      FDMemTManutPlanoTrab.Append;
                      FDMemTManutPlanoTrabCODIGO.AsString               := DM.qryManutConsPlanoTrabCODIGO.AsString;
                      FDMemTManutPlanoTrabCODEMPRESA.AsString           := DM.qryManutConsPlanoTrabCODEMPRESA.AsString;
                      FDMemTManutPlanoTrabCODMANUTPROGFAMEQUIP.AsString := DM.qryManutConsPlanoTrabCODMANUTPROGFAMEQUIP.AsString;
                      FDMemTManutPlanoTrabCODPLANOTRABALHO.AsString     := DM.qryManutConsPlanoTrabCODPLANOTRABALHO.AsString;
                      FDMemTManutPlanoTrabPLANOTRABALHO.AsString        := DM.qryManutConsPlanoTrabPLANOTRABALHO.AsString;
                      FDMemTManutPlanoTrabDETALHES.AsString             := DM.qryManutConsPlanoTrabDETALHES.AsString;
                      FDMemTManutPlanoTrab.Post;
                    end;

                  DM.qryManutConsPlanoTrab.Next;
                end;

              //Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou n�o.
              if DM.qryManutConsREPROGRAMAR1.AsString = 'Programa��o' then
                begin
                  DM.qryManutConsRELATORIO.AsString    := 'N';
                  if DateOf(DM.qryManutConsDTAINICIO1.AsDateTime) < DateOf(DM.FDataHoraServidor) then
                    DM.qryManutConsDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryManutConsFREQUENCIA1.AsInteger)
                  else
                    DM.qryManutConsDTAINICIO1.AsDateTime := IncDay(DateOf(DM.qryManutConsDTAINICIO1.AsDateTime), DM.qryManutConsFREQUENCIA1.AsInteger);
                  if DM.qryManutConsREPROGRAMAR2.AsString = 'Programa��o' then
                    DM.qryManutConsLEITURA.AsInteger := DM.qryManutConsLEITURA.AsInteger + DM.qryManutConsFREQUENCIA2.AsInteger;
                end;
              //Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
              //a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o at� ser fechada.
              if DM.qryManutConsREPROGRAMAR1.AsString = 'Execu��o' then
                begin
                  DM.qryManutConsRELATORIO.AsString  := 'S';
                  if (DM.qryManutConsREPROGRAMAR2.AsString = 'Programa��o') and (DM.qryManutConsRELATORIO.AsString = 'S') then
                    DM.qryManutConsLEITURA.AsInteger := DM.qryManutConsLEITURA.AsInteger + DM.qryManutConsFREQUENCIA2.AsInteger;
                end;

              DM.qryManutCons.FreeBookMark(bmQuery);
            end;

          DmRelatorios.frxDBInspConsManut.DataSet :=  FDMemTManut;
          DmRelatorios.frxDBInspConsManutItens.DataSet :=  FDMemTManutItens;
          DmRelatorios.frxDBInspConsManutItensEsp.DataSet :=  FDMemTManutItensEsp;
          DmRelatorios.frxDBInspConsManutPlanoTrab.DataSet :=  FDMemTManutPlanoTrab;

          DmRelatorios.frxRInspConsManut.ShowReport();

          DM.qryManutCons.Post;

          DM.qryManutCons.Close;
          DM.qryManutCons.Params[0].AsString := DM.FCodEmpresa;
          DM.qryManutCons.Open;

          FDMemTManut.Close;
          FDMemTManutItens.Close;
          FDMemTManutItensEsp.Close;
          FDMemTManutPlanoTrab.Close;

          DM.MSGAguarde('', False);

          CBPeriodo.OnChange(Sender);

          chbTudo.Checked := False;

          TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutCons.RecordCount)+')';
        end;
    end;
  1: //Lubrifica��es
    begin
      if DM.qryLubrificConsCODIGO.AsString = '' then Exit;

//      for I := 0 to GrdLubrific.SelectedRows.Count - 1 do
//        begin
//          DM.qryLubrificCons.GotoBookmark(GrdLubrific.SelectedRows.Items[I]);
//          LInsp := LInsp + IntToStr(DM.qryLubrificCons.RecNo) + '� - ' + DM.qryLubrificCons.FieldByName('DESCRICAO').AsString + #13;
//        end;


      LTexto := PChar('Deseja realmente executar a(s) inspe��e(s) selecionada(s)?');

      if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.MSGAguarde('');

          if DM.qryLubrificConsItens.Active = False then DM.qryLubrificConsItens.Open;
          if DM.qryLubrificConsItensEsp.Active = False then DM.qryLubrificConsItensEsp.Open;
          if DM.qryLubrificConsPlanoTrab.Active = False then DM.qryLubrificConsPlanoTrab.Open;

          FDMemTLubrific.Close; FDMemTLubrific.CreateDataSet; FDMemTLubrific.Open;
          FDMemTLubrificItens.Close; FDMemTLubrificItens.CreateDataSet; FDMemTLubrificItens.Open;
          FDMemTLubrificItensEsp.Close; FDMemTLubrificItensEsp.CreateDataSet; FDMemTLubrificItensEsp.Open;
          FDMemTLubrificPlanoTrab.Close; FDMemTLubrificPlanoTrab.CreateDataSet; FDMemTLubrificPlanoTrab.Open;

          if GrdLubrific.SelectedRows.Count = 0 then
            GrdLubrific.SelectedRows.CurrentRowSelected := True;

          for I := 0 to GrdLubrific.SelectedRows.Count - 1 do
            begin
              GrdLubrific.DataSource.DataSet.GotoBookmark(GrdLubrific.SelectedRows.Items[i]);

              if (DM.qryLubrificConsREPROGRAMAR1.AsString = 'Execu��o') and (DM.qryLubrificConsRELATORIO.AsString = 'S') then
                begin
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'EXISTE UMA '+DM.qryLubrificConsDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
                  Exit;
                end;

              DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryLubrificConsDESCRICAO.AsString
                                                            , DM.qryLubrificConsCODEQUIPAMENTO.AsString, EmptyStr, DM.qryLubrificConsCODIGO.AsString, EmptyStr, 'N'
                                                            , EmptyStr, 'Emerg�ncia', 'Para o Equipamento', DM.qryLubrificConsCODCENTROCUSTO.AsString, EmptyStr, DM.qryLubrificConstempototal.AsString, DM.qryLubrificConsCODOFICINA.AsString, DM.qryLubrificConsCODMANUTENCAO.AsString, DM.qryLubrificConsEQUIPPARADO.AsString);


              DM.HistoricoInspecoes(1, DM.FCodEmpresa, DM.qryLubrificConsCODEQUIPAMENTO.AsString, DM.qryLubrificConsCODIGO.AsString, DM.FCodOrdemServico);

              DM.qryLubrificCons.Edit;
              DM.qryLubrificConsCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;

              //Carrega FdMemTable para o relat�rio
              FDMemTLubrific.Append;
              FDMemTLubrificCODIGO.AsString               := DM.qryLubrificConsCODIGO.AsString;
              FDMemTLubrificDESCRICAO.AsString            := DM.qryLubrificConsDESCRICAO.AsString;
              FDMemTLubrificFREQUENCIA1.AsInteger         := DM.qryLubrificConsFREQUENCIA1.AsInteger;
              FDMemTLubrificDTAINICIO1.AsDateTime         := DM.qryLubrificConsDTAINICIO1.AsDateTime;
              FDMemTLubrificCODEQUIPAMENTO.AsString       := DM.qryLubrificConsCODEQUIPAMENTO.AsString;
              FDMemTLubrificEQUIPAMENTO.AsString          := DM.qryLubrificConsEQUIPAMENTO.AsString;
              FDMemTLubrificCODEMPRESA.AsString           := DM.qryLubrificConsCODEMPRESA.AsString;
              FDMemTLubrificCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificConsCODLUBRIFICPROGFAMEQUIP.AsString;
              FDMemTLubrificCODMONITORAMENTO.AsInteger    := DM.qryLubrificConsCODMONITORAMENTO.AsInteger;
              FDMemTLubrificCRITICIDADE.AsString          := DM.qryLubrificConsCRITICIDADE.AsString;
              FDMemTLubrificREPROGRAMAR1.AsString         := DM.qryLubrificConsREPROGRAMAR1.AsString;
              FDMemTLubrificFREQUENCIA2.AsInteger         := DM.qryLubrificConsFREQUENCIA2.AsInteger;
              FDMemTLubrificLEITURA.AsInteger             := DM.qryLubrificConsLEITURA.AsInteger;
              FDMemTLubrificREPROGRAMAR2.AsString         := DM.qryLubrificConsREPROGRAMAR2.AsString;
              FDMemTLubrificRELATORIO.AsString            := DM.qryLubrificConsRELATORIO.AsString;
              FDMemTLubrificSEQUENCIA.AsInteger           := DM.qryLubrificConsSEQUENCIA.AsInteger;
              FDMemTLubrificCODFAMILIAEQUIP.AsString      := DM.qryLubrificConsCODFAMILIAEQUIP.AsString;
              FDMemTLubrificFAMILIAEQUIP.AsString         := DM.qryLubrificConsFAMILIAEQUIP.AsString;
              FDMemTLubrificPROGRAMACAO2.AsString         := DM.qryLubrificConsPROGRAMACAO2.AsString;
              FDMemTLubrificDESCLUBRIFICPROGFAMEQUIP.AsString:= DM.qryLubrificConsDESCLUBRIFICPROGFAMEQUIP.AsString;
              FDMemTLubrificCODAREA.AsString              := DM.qryLubrificConsCODAREA.AsString;
              FDMemTLubrificAREA.AsString                 := DM.qryLubrificConsAREA.AsString;
              FDMemTLubrificCODCELULA.AsString            := DM.qryLubrificConsCODCELULA.AsString;
              FDMemTLubrificCELULA.AsString               := DM.qryLubrificConsCELULA.AsString;
              FDMemTLubrificCODLINHA.AsString             := DM.qryLubrificConsCODLINHA.AsString;
              FDMemTLubrificLINHA.AsString                := DM.qryLubrificConsLINHA.AsString;
              FDMemTLubrificCODORDEMSERVICO.AsInteger     := DM.qryLubrificConsCODORDEMSERVICO.AsInteger;
              FDMemTLubrificPERIODO.AsString              := DM.qryLubrificConsPERIODO.AsString;
              FDMemTLubrificC_PROXINSP.AsDateTime         := DM.qryLubrificConsC_PROXINSP.AsDateTime;
              FDMemTLubrific.Post;

              DM.qryLubrificConsItens.First;
              while not DM.qryLubrificConsItens.Eof = True do
                begin
                  if FDMemTLubrificItens.Locate('CODIGO', DM.qryLubrificConsItensCODIGO.AsInteger, []) = False then
                    begin
                      FDMemTLubrificItens.Append;
                      FDMemTLubrificItensCODIGO.AsString               := DM.qryLubrificConsItensCODIGO.AsString;
                      FDMemTLubrificItensCODEMPRESA.AsString           := DM.qryLubrificConsItensCODEMPRESA.AsString;
                      FDMemTLubrificItensCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificConsItensCODLUBRIFICPROGFAMEQUIP.AsString;
                      FDMemTLubrificItensCODPARTE.AsString             := DM.qryLubrificConsItensCODPARTE.AsString;
                      FDMemTLubrificItensITEM.AsString                 := DM.qryLubrificConsItensITEM.AsString;
                      FDMemTLubrificItensDESCINSPECAO.AsString         := DM.qryLubrificConsItensDESCINSPECAO.AsString;
                      FDMemTLubrificItensEQUIPPARADO.AsString          := DM.qryLubrificConsItensEQUIPPARADO.AsString;
                      FDMemTLubrificItensTEMPO.AsString                := DM.qryLubrificConsItensTEMPO.AsString;
                      FDMemTLubrificItensEXECAUTONOMO.AsString         := DM.qryLubrificConsItensEXECAUTONOMO.AsString;
                      FDMemTLubrificItensPARTE.AsString                := DM.qryLubrificConsItensPARTE.AsString;
                      FDMemTLubrificItens.Post;
                    end;

                  DM.qryLubrificConsItens.Next;
                end;

              DM.qryLubrificConsItensEsp.First;
              while not DM.qryLubrificConsItensEsp.Eof = True do
                begin
                  if FDMemTLubrificItensEsp.Locate('CODIGO', DM.qryLubrificConsItensEspCODIGO.AsInteger, []) = False then
                    begin
                      FDMemTLubrificItensEsp.Append;
                      FDMemTLubrificItensEspCODIGO.AsString            := DM.qryLubrificConsItensEspCODIGO.AsString;
                      FDMemTLubrificItensEspCODEMPRESA.AsString        := DM.qryLubrificConsItensEspCODEMPRESA.AsString;
                      FDMemTLubrificItensEspCODLUBRIFICPROGEQUIP.AsString := DM.qryLubrificConsItensEspCODLUBRIFICPROGEQUIP.AsString;
                      FDMemTLubrificItensEspCODPARTE.AsString          := DM.qryLubrificConsItensEspCODPARTE.AsString;
                      FDMemTLubrificItensEspITEM.AsString              := DM.qryLubrificConsItensEspITEM.AsString;
                      FDMemTLubrificItensEspDESCINSPECAO.AsString      := DM.qryLubrificConsItensEspDESCINSPECAO.AsString;
                      FDMemTLubrificItensEspEQUIPPARADO.AsString       := DM.qryLubrificConsItensEspEQUIPPARADO.AsString;
                      FDMemTLubrificItensEspTEMPO.AsString             := DM.qryLubrificConsItensEspTEMPO.AsString;
                      FDMemTLubrificItensEspEXECAUTONOMO.AsString      := DM.qryLubrificConsItensEspEXECAUTONOMO.AsString;
                      FDMemTLubrificItensEspPARTE.AsString             := DM.qryLubrificConsItensEspPARTE.AsString;
                      FDMemTLubrificItensEsp.Post;
                    end;

                  DM.qryLubrificConsItensEsp.Next;
                end;

              DM.qryLubrificConsPlanoTrab.First;
              while not DM.qryLubrificConsPlanoTrab.Eof = True do
                begin
                  if FDMemTLubrificPlanoTrab.Locate('CODIGO', DM.qryLubrificConsPlanoTrabCODIGO.AsString, []) = False then
                    begin
                      FDMemTLubrificPlanoTrab.Append;
                      FDMemTLubrificPlanoTrabCODIGO.AsString               := DM.qryLubrificConsPlanoTrabCODIGO.AsString;
                      FDMemTLubrificPlanoTrabCODEMPRESA.AsString           := DM.qryLubrificConsPlanoTrabCODEMPRESA.AsString;
                      FDMemTLubrificPlanoTrabCODLUBRIFICPROGFAMEQUIP.AsString := DM.qryLubrificConsPlanoTrabCODLUBRIFICPROGFAMEQUIP.AsString;
                      FDMemTLubrificPlanoTrabCODPLANOTRABALHO.AsString     := DM.qryLubrificConsPlanoTrabCODPLANOTRABALHO.AsString;
                      FDMemTLubrificPlanoTrabPLANOTRABALHO.AsString        := DM.qryLubrificConsPlanoTrabPLANOTRABALHO.AsString;
                      FDMemTLubrificPlanoTrabDETALHES.AsString             := DM.qryLubrificConsPlanoTrabDETALHES.AsString;
                      FDMemTLubrificPlanoTrab.Post;
                    end;

                  DM.qryLubrificConsPlanoTrab.Next;
                end;

              //Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou n�o.
              if DM.qryLubrificConsREPROGRAMAR1.AsString = 'Programa��o' then
                begin
                  DM.qryLubrificConsRELATORIO.AsString    := 'N';
                  if DateOf(DM.qryLubrificConsDTAINICIO1.AsDateTime) < DateOf(DM.FDataHoraServidor) then
                    DM.qryLubrificConsDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryLubrificConsFREQUENCIA1.AsInteger)
                  else
                    DM.qryLubrificConsDTAINICIO1.AsDateTime := IncDay(DateOf(DM.qryLubrificConsDTAINICIO1.AsDateTime), DM.qryLubrificConsFREQUENCIA1.AsInteger);
                  if DM.qryLubrificConsREPROGRAMAR2.AsString = 'Programa��o' then
                    DM.qryLubrificConsLEITURA.AsInteger := DM.qryLubrificConsLEITURA.AsInteger + DM.qryLubrificConsFREQUENCIA2.AsInteger;
                end;
              //Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
              //a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o at� ser fechada.
              if DM.qryLubrificConsREPROGRAMAR1.AsString = 'Execu��o' then
                begin
                  DM.qryLubrificConsRELATORIO.AsString    := 'S';
                  if (DM.qryLubrificConsREPROGRAMAR2.AsString = 'Programa��o') and (DM.qryLubrificConsRELATORIO.AsString = 'S') then
                    DM.qryLubrificConsLEITURA.AsInteger := DM.qryLubrificConsLEITURA.AsInteger + DM.qryLubrificConsFREQUENCIA2.AsInteger;
                end;

              DM.qryLubrificCons.FreeBookMark(bmQuery);
            end;

          DmRelatorios.frxDBInspConsLubrific.DataSet :=  FDMemTLubrific;
          DmRelatorios.frxDBInspConsLubrificItens.DataSet :=  FDMemTLubrificItens;
          DmRelatorios.frxDBInspConsLubrificItensEsp.DataSet :=  FDMemTLubrificItensEsp;
          DmRelatorios.frxDBInspConsLubrificPlanoTrab.DataSet :=  FDMemTLubrificPlanoTrab;

          DmRelatorios.frxRInspConsLubrific.ShowReport();

          DM.qryLubrificCons.Post;

          DM.qryLubrificCons.Close;
          DM.qryLubrificCons.Params[0].AsString := DM.FCodEmpresa;
          DM.qryLubrificCons.Open;

          FDMemTLubrific.Close;
          FDMemTLubrificItens.Close;
          FDMemTLubrificItensEsp.Close;
          FDMemTLubrificPlanoTrab.Close;

          DM.MSGAguarde('', False);

          CBPeriodo.OnChange(Sender);

          chbTudo.Checked := False;

          TSLubrific.Caption := 'Lubrificações ('+ IntToStr(DM.qryLubrificCons.RecordCount)+')';
        end;
    end;
  2:
    begin
      if DM.qryRotaConsCODIGO.AsString = '' then Exit;

      for I := 0 to GrdRota.SelectedRows.Count - 1 do
        begin
          DM.qryRotaCons.GotoBookmark(GrdRota.SelectedRows.Items[I]);
          LInsp := LInsp + IntToStr(DM.qryRotaCons.RecNo) + '� - ' + DM.qryRotaCons.FieldByName('DESCRICAO').AsString + #13;
        end;

      LTexto := PChar('Deseja realmente executar a(s) inspe��e(s) selecionada(s)?');

      if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.MSGAguarde('');

          FDMemTRota.Close; FDMemTRota.CreateDataSet; FDMemTRota.Open;
          FDMemTRotaSeq.Close; FDMemTRotaSeq.CreateDataSet; FDMemTRotaSeq.Open;
          FDMemTRotaSeqManut.Close; FDMemTRotaSeqManut.CreateDataSet; FDMemTRotaSeqManut.Open;
          FDMemTRotaSeqManutItens.Close; FDMemTRotaSeqManutItens.CreateDataSet; FDMemTRotaSeqManutItens.Open;
          FDMemTRotaSeqManutItensEsp.Close; FDMemTRotaSeqManutItensEsp.CreateDataSet; FDMemTRotaSeqManutItensEsp.Open;

          if DM.qryRotaConsSeq.Active = False then DM.qryRotaConsSeq.Open;
          if DM.qryRotaConsSeqManut.Active = False then DM.qryRotaConsSeqManut.Open;
          if DM.qryRotaConsSeqManutItens.Active = False then DM.qryRotaConsSeqManutItens.Open;
          if DM.qryRotaConsSeqManutItensEsp.Active = False then DM.qryRotaConsSeqManutItensEsp.Open;

          if GrdRota.SelectedRows.Count = 0 then
            GrdRota.SelectedRows.CurrentRowSelected := True;

          for I := 0 to GrdRota.SelectedRows.Count - 1 do
            begin
              bmQuery := GrdRota.SelectedRows.Items[I];

              DM.qryRotaCons.GotoBookmark(bmQuery);

              if (DM.qryRotaConsREPROGRAMAR.AsString = 'Execu��o') and (DM.qryRotaConsRELATORIO.AsString = 'S') then
                begin
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'EXISTE UMA '+DM.qryRotaConsDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
                  Exit;
                end;

              DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryRotaConsDESCRICAO.AsString
                                                            , EmptyStr, EmptyStr, EmptyStr, EmptyStr, 'N'
                                                            , EmptyStr, 'Emerg�ncia', 'Para o Equipamento', EmptyStr, EmptyStr, '0', EmptyStr, EmptyStr, EmptyStr);

              DM.HistoricoInspecoes(2, DM.FCodEmpresa, EmptyStr, DM.qryRotaConsCODIGO.AsString, DM.FCodOrdemServico);


              DM.qryRotaCons.Edit;
              DM.qryRotaConsCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;

              //Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou n�o.
              if DM.qryRotaConsREPROGRAMAR.AsString = 'Programa��o' then
                begin
                  DM.qryRotaConsRELATORIO.AsString    := 'N';
                  if DateOf(DM.qryRotaConsDATAINICIO.AsDateTime) < DateOf(DM.FDataHoraServidor) then
                    DM.qryRotaConsDATAINICIO.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryRotaConsFREQUENCIA.AsInteger)
                  else
                    DM.qryRotaConsDATAINICIO.AsDateTime := IncDay(DateOf(DM.qryRotaConsDATAINICIO.AsDateTime), DM.qryRotaConsFREQUENCIA.AsInteger);
                end;
              //Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
              //a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o at� ser fechada.
              if DM.qryRotaConsREPROGRAMAR.AsString = 'Execu��o' then
                begin
                  DM.qryRotaConsRELATORIO.AsString    := 'S';
                end;

              //Carrega FdMemTable para o relat�rio
              FDMemTRota.Append;
              FDMemTRotaCODIGO.AsString             := DM.qryRotaConsCODIGO.AsString;
              FDMemTRotaDESCRICAO.AsString          := DM.qryRotaConsDESCRICAO.AsString;
              FDMemTRotaFREQUENCIA.AsInteger        := DM.qryRotaConsFREQUENCIA.AsInteger;
              FDMemTRotaDATAINICIO.AsDateTime       := DM.qryRotaConsDATAINICIO.AsDateTime;
              FDMemTRotaCODEMPRESA.AsString         := DM.qryRotaConsCODEMPRESA.AsString;
              FDMemTRotaREPROGRAMAR.AsString        := DM.qryRotaConsREPROGRAMAR.AsString;
              FDMemTRotaRELATORIO.AsString          := DM.qryRotaConsRELATORIO.AsString;
              FDMemTRotaCODORDEMSERVICO.AsInteger := DM.qryRotaConsCODORDEMSERVICO.AsInteger;
              FDMemTRotaPERIODO.AsString            := DM.qryRotaConsPERIODO.AsString;
              FDMemTRotaC_PROXINSP.AsDateTime       := DM.qryRotaConsC_PROXINSP.AsDateTime;
              FDMemTRota.Post;

              DM.qryRotaConsSeq.First;
              while not DM.qryRotaConsSeq.Eof = True do
                begin
                  if FDMemTRotaSeq.Locate('CODIGO', DM.qryRotaConsSeqCODIGO.AsInteger, []) = False then
                    begin
                      FDMemTRotaSeq.Append;
                      FDMemTRotaSeqCODIGO.AsString          := DM.qryRotaConsSeqCODIGO.AsString;
                      FDMemTRotaSeqCODEMPRESA.AsString      := DM.qryRotaConsSeqCODEMPRESA.AsString;
                      FDMemTRotaSeqCODROTA.AsString         := DM.qryRotaConsSeqCODROTA.AsString;
                      FDMemTRotaSeqCODAREA.AsString         := DM.qryRotaConsSeqCODAREA.AsString;
                      FDMemTRotaSeqCODCELULA.AsString       := DM.qryRotaConsSeqCODCELULA.AsString;
                      FDMemTRotaSeqCODLINHA.AsString        := DM.qryRotaConsSeqCODLINHA.AsString;
                      FDMemTRotaSeqSEQUENCIA.AsString       := DM.qryRotaConsSeqSEQUENCIA.AsString;
                      FDMemTRotaSeqCODFAMILIAEQUIP.AsString := DM.qryRotaConsSeqCODFAMILIAEQUIP.AsString;
                      FDMemTRotaSeqAREA.AsString            := DM.qryRotaConsSeqAREA.AsString;
                      FDMemTRotaSeqCELULA.AsString          := DM.qryRotaConsSeqCELULA.AsString;
                      FDMemTRotaSeqLINHA.AsString           := DM.qryRotaConsSeqLINHA.AsString;
                      FDMemTRotaSeqFAMILIAEQUIP.AsString    := DM.qryRotaConsSeqFAMILIAEQUIP.AsString;
                      FDMemTRotaSeqCODEQUIPATUAL.AsString   := DM.qryRotaConsSeqCODEQUIPATUAL.AsString;
                      FDMemTRotaSeqEQUIPATUAL.AsString      := DM.qryRotaConsSeqEQUIPATUAL.AsString;
                      FDMemTRotaSeqFREQUENCIA.AsString      := DM.qryRotaConsSeqFREQUENCIA.AsString;
                      FDMemTRotaSeq.Post;
                    end;

                  DM.qryRotaConsSeq.Next;
                end;

              DM.qryRotaConsSeqManut.First;
              while not DM.qryRotaConsSeqManut.Eof = True do
                begin
                  if FDMemTRotaSeqManut.Locate('CODIGO', DM.qryRotaConsSeqManutCODIGO.AsString, []) = False then
                    begin
                      FDMemTRotaSeqManut.Append;
                      FDMemTRotaSeqManutCODIGO.AsString               := DM.qryRotaConsSeqManutCODIGO.AsString;
                      FDMemTRotaSeqManutCODEMPRESA.AsString           := DM.qryRotaConsSeqManutCODEMPRESA.AsString;
                      FDMemTRotaSeqManutCODMANUTPROGFAMEQUIP.AsString := DM.qryRotaConsSeqManutCODMANUTPROGFAMEQUIP.AsString;
                      FDMemTRotaSeqManutDESCRICAO.AsString            := DM.qryRotaConsSeqManutDESCRICAO.AsString;
                      FDMemTRotaSeqManutDTAINICIO1.AsString           := DM.qryRotaConsSeqManutDTAINICIO1.AsString;
                      FDMemTRotaSeqManutFREQUENCIA1.AsString          := DM.qryRotaConsSeqManutFREQUENCIA1.AsString;
                      FDMemTRotaSeqManutRELATORIO.AsString            := DM.qryRotaConsSeqManutRELATORIO.AsString;
                      FDMemTRotaSeqManutCODEQUIPAMENTO.AsString       := DM.qryRotaConsSeqManutCODEQUIPAMENTO.AsString;
                      FDMemTRotaSeqManut.Post;
                    end;

                  DM.qryRotaConsSeqManut.Next;
                end;


              DM.qryRotaConsSeqManutItens.First;
              while not DM.qryRotaConsSeqManutItens.Eof = True do
                begin
                  if FDMemTRotaSeqManutItens.Locate('CODIGO', DM.qryRotaConsSeqManutCODIGO.AsString, []) = False then
                    begin
                      FDMemTRotaSeqManutItens.Append;
                      FDMemTRotaSeqManutItensCODIGO.AsString               := DM.qryRotaConsSeqManutItensCODIGO.AsString;
                      FDMemTRotaSeqManutItensCODEMPRESA.AsString           := DM.qryRotaConsSeqManutItensCODEMPRESA.AsString;
                      FDMemTRotaSeqManutItensCODMANUTPROGFAMEQUIP.AsString := DM.qryRotaConsSeqManutItensCODMANUTPROGFAMEQUIP.AsString;
                      FDMemTRotaSeqManutItensCODPARTE.AsString             := DM.qryRotaConsSeqManutItensCODPARTE.AsString;
                      FDMemTRotaSeqManutItensITEM.AsString                 := DM.qryRotaConsSeqManutItensITEM.AsString;
                      FDMemTRotaSeqManutItensDESCINSPECAO.AsString         := DM.qryRotaConsSeqManutItensDESCINSPECAO.AsString;
                      FDMemTRotaSeqManutItensEQUIPPARADO.AsString          := DM.qryRotaConsSeqManutItensEQUIPPARADO.AsString;
                      FDMemTRotaSeqManutItensTEMPO.AsString                := DM.qryRotaConsSeqManutItensTEMPO.AsString;
                      FDMemTRotaSeqManutItensEXECAUTONOMO.AsString         := DM.qryRotaConsSeqManutItensEXECAUTONOMO.AsString;
                      FDMemTRotaSeqManutItensPARTE.AsString                := DM.qryRotaConsSeqManutItensPARTE.AsString;
                      FDMemTRotaSeqManutItens.Post;
                    end;

                  DM.qryRotaConsSeqManutItens.Next;
                end;

              DM.qryRotaConsSeqManutItensEsp.First;
              while not DM.qryRotaConsSeqManutItensEsp.Eof = True do
                begin
                  FDMemTRotaSeqManutItensEsp.Append;
                  FDMemTRotaSeqManutItensEspCODIGO.AsString            := DM.qryRotaConsSeqManutItensEspCODIGO.AsString;
                  FDMemTRotaSeqManutItensEspCODEMPRESA.AsString        := DM.qryRotaConsSeqManutItensEspCODEMPRESA.AsString;
                  FDMemTRotaSeqManutItensEspCODMANUTPROGEQUIP.AsString := DM.qryRotaConsSeqManutItensEspCODMANUTPROGEQUIP.AsString;
                  FDMemTRotaSeqManutItensEspCODPARTE.AsString          := DM.qryRotaConsSeqManutItensEspCODPARTE.AsString;
                  FDMemTRotaSeqManutItensEspITEM.AsString              := DM.qryRotaConsSeqManutItensEspITEM.AsString;
                  FDMemTRotaSeqManutItensEspDESCINSPECAO.AsString      := DM.qryRotaConsSeqManutItensEspDESCINSPECAO.AsString;
                  FDMemTRotaSeqManutItensEspEQUIPPARADO.AsString       := DM.qryRotaConsSeqManutItensEspEQUIPPARADO.AsString;
                  FDMemTRotaSeqManutItensEspTEMPO.AsString             := DM.qryRotaConsSeqManutItensEspTEMPO.AsString;
                  FDMemTRotaSeqManutItensEspEXECAUTONOMO.AsString      := DM.qryRotaConsSeqManutItensEspEXECAUTONOMO.AsString;
                  FDMemTRotaSeqManutItensEspPARTE.AsString             := DM.qryRotaConsSeqManutItensEspPARTE.AsString;
                  FDMemTRotaSeqManutItensEsp.Post;

                  DM.qryRotaConsSeqManutItensEsp.Next;
                end;

//              DM.qryRotaConsSeqManutlanoTrab.First;
//              while not DM.qryRotaConsSeqManutPlanoTrab.Eof = True do
//                begin
//                  FDMemTRotaSeqManutIPlanoTrab.Append;
//                  FDMemTRotaSeqManutIPlanoTrabCODIGO.AsString               := DM.qryRotaConsSeqManutPlanoTrabCODIGO.AsString;
//                  FDMemTRotaSeqManutIPlanoTrabCODEMPRESA.AsString           := DM.qryRotaConsSeqManutPlanoTrabCODEMPRESA.AsString;
//                  FDMemTRotaSeqManutIPlanoTrabCODMANUTPROGFAMEQUIP.AsString := DM.qryRotaConsSeqManutPlanoTrabCODMANUTPROGFAMEQUIP.AsString;
//                  FDMemTRotaSeqManutIPlanoTrabCODPLANOTRABALHO.AsString     := DM.qryRotaConsSeqManutPlanoTrabCODPLANOTRABALHO.AsString;
//                  FDMemTRotaSeqManutIPlanoTrabPLANOTRABALHO.AsString        := DM.qryRotaConsSeqManutPlanoTrabPLANOTRABALHO.AsString;
//                  FDMemTRotaSeqManutIPlanoTrabDETALHES.AsString             := DM.qryRotaConsSeqManutPlanoTrabDETALHES.AsString;
//                  FDMemTRotaSeqManutIPlanoTrab.Post;
//
//                  DM.qryRotaConsSeqManutPlanoTrab.Next;
//                end;

              DM.qryRotaCons.FreeBookMark(bmQuery);
            end;

          DmRelatorios.frxDBInspConsRotas.DataSet :=  FDMemTRota;
          DmRelatorios.frxDBInspConsRotasSeq.DataSet :=  FDMemTRotaSeq;
          DmRelatorios.frxDBInspConsRotasSeqManut.DataSet :=  FDMemTRotaSeqManut;
          DmRelatorios.frxDBInspConsRotasSeqManutItens.DataSet :=  FDMemTRotaSeqManutItens;
          DmRelatorios.frxDBInspConsRotasSeqManutItensEsp.DataSet :=  FDMemTRotaSeqManutItensEsp;

          DmRelatorios.frxRInspConsRotas.ShowReport();

          DM.qryRotaCons.Post;

          DM.qryRotaCons.Close;
          DM.qryRotaCons.Params[0].AsString := DM.FCodEmpresa;
          DM.qryRotaCons.Open;

          FDMemTRota.Close;
          FDMemTRotaSeq.Close;
          FDMemTRotaSeqManut.Close;
          FDMemTRotaSeqManutItens.Close;
          FDMemTRotaSeqManutItensEsp.Close;

          DM.MSGAguarde('', False);

          CBPeriodo.OnChange(Sender);

          chbTudo.Checked := False;

          TSRotas.Caption := 'Rotas ('+ IntToStr(FDMemTRota.RecordCount)+')';
        end;
    end;
end;
FrmTelaPrincipal.TimerOscioso.Enabled := True;
DM.MSGAguarde('', False);
end;

procedure TFrmTelaInspConsulta.CBCriticidadeChange(Sender: TObject);
begin
  inherited;
  CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInspConsulta.CBPeriodoChange(Sender: TObject);
var
	i: Integer;
  LDataInicial, LDataMaxima: TDateTime;
begin
  inherited;
  PAuxiliares.Caption := EmptyStr;

  LDataMaxima := 0;

  Case CBPeriodo.ItemIndex of
    0: //Vencidas
      Begin
        GrdManut.DataSource.DataSet.Filtered := False;
        GrdManut.DataSource.DataSet.Filter   := EmptyStr;
        GrdManut.DataSource.DataSet.Filter   := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));

        case CBCriticidade.ItemIndex of
          0: GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CRITICIDADE = ''Para a F�brica''';
          1: GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CRITICIDADE = ''Para o Equipamento''';
          2: GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CRITICIDADE = ''Para a �rea''';
        end;

        if EdtFamiliaEquip.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = EmptyStr then
              GrdManut.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
          end;

        if edtArea.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = '' then
              GrdManut.DataSource.DataSet.Filter := 'CODAREA = '+ QuotedStr(LCodArea)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODAREA = '+ QuotedStr(LCodArea);
          end;

        if edtOficina.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = '' then
              GrdManut.DataSource.DataSet.Filter := 'CODOFICINA = '+ QuotedStr(LCodOficina)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODOFICINA = '+ QuotedStr(LCodOficina);
          end;

        GrdManut.DataSource.DataSet.Filtered := True;

        TSManut.Caption := 'Manutenções ('+ IntToStr(GrdManut.DataSource.DataSet.RecordCount)+')';

        //---------------------------------------------------------------------------------------------------------------------------------------

        GrdLubrific.DataSource.DataSet.Filtered := False;
        GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;
        GrdLubrific.DataSource.DataSet.Filter   := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));

        case CBCriticidade.ItemIndex of
          0: GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CRITICIDADE = ''Para a F�brica''';
          1: GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CRITICIDADE = ''Para o Equipamento''';
          2: GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CRITICIDADE = ''Para a �rea''';
        end;

        if EdtFamiliaEquip.Text <> '' then
          begin
            if GrdLubrific.DataSource.DataSet.Filter = EmptyStr then
              GrdLubrific.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
          end;

        if edtArea.Text <> '' then
          begin
            if GrdLubrific.DataSource.DataSet.Filter = '' then
              GrdLubrific.DataSource.DataSet.Filter := 'CODAREA = '+ QuotedStr(LCodArea)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODAREA = '+ QuotedStr(LCodArea);
          end;

        if edtOficina.Text <> '' then
          begin
            if GrdLubrific.DataSource.DataSet.Filter = '' then
              GrdLubrific.DataSource.DataSet.Filter := 'CODOFICINA = '+ QuotedStr(LCodOficina)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODOFICINA = '+ QuotedStr(LCodOficina);
          end;

        GrdLubrific.DataSource.DataSet.Filtered := True;
        GrdLubrific.DataSource.DataSet.First;

        TSLubrific.Caption := 'Lubrificações ('+ IntToStr(GrdLubrific.DataSource.DataSet.RecordCount)+')';

        //---------------------------------------------------------------------------------------------------------------------------------------

        if GrdRota.DataSource.DataSet.Active = True then
          begin
            GrdRota.DataSource.DataSet.Filtered := False;
            GrdRota.DataSource.DataSet.Filter   := EmptyStr;
            GrdRota.DataSource.DataSet.Filter   := 'DATAINICIO <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));

            GrdRota.DataSource.DataSet.Filtered := True;

            TSRotas.Caption := 'Rotas ('+ IntToStr(GrdRota.DataSource.DataSet.RecordCount)+')';
          end;
      End;

    //---------------------------------------------------------------------------------------------------------------------------------------
    1,2,3,4,5,6,7: //Futuras
      Begin
        DM.MSGAguarde();

        GrdManut.DataSource.DataSet.Filtered := False;
        GrdManut.DataSource.DataSet.Filter   := EmptyStr;

        case CBPeriodo.ItemIndex of
          1: LDataMaxima := IncDay(DateOf(DM.FDataHoraServidor), 7);
          2: LDataMaxima := IncDay(DateOf(DM.FDataHoraServidor), 15);
          3: LDataMaxima := IncDay(DateOf(DM.FDataHoraServidor), 30);
          4: LDataMaxima := IncDay(DateOf(DM.FDataHoraServidor), 60);
          5: LDataMaxima := IncDay(DateOf(DM.FDataHoraServidor), 90);
          6: LDataMaxima := IncDay(DateOf(DM.FDataHoraServidor), 180);
          7: LDataMaxima := IncDay(DateOf(DM.FDataHoraServidor), 365);
        end;

        DM.qryManutCons.First;

        case CBCriticidade.ItemIndex of
          0: GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + 'CRITICIDADE = ''Para a F�brica''';
          1: GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + 'CRITICIDADE = ''Para o Equipamento''';
          2: GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + 'CRITICIDADE = ''Para a �rea''';
        end;

        if EdtFamiliaEquip.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = EmptyStr then
              GrdManut.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
          end;

        if edtArea.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = '' then
              GrdManut.DataSource.DataSet.Filter := 'CODAREA = '+ QuotedStr(LCodArea)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODAREA = '+ QuotedStr(LCodArea);
          end;

        if edtOficina.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = '' then
              GrdManut.DataSource.DataSet.Filter := 'CODOFICINA = '+ QuotedStr(LCodOficina)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODOFICINA = '+ QuotedStr(LCodOficina);
          end;

        if GrdManut.DataSource.DataSet.Filter = '' then
          GrdManut.DataSource.DataSet.Filter := 'DTAINICIO1 <= '+ QuotedStr(FormatDateTime('dd/mm/yyyy', LDataMaxima))
        else
          GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND DTAINICIO1 <= '+ QuotedStr(FormatDateTime('dd/mm/yyyy', LDataMaxima));

        GrdManut.DataSource.DataSet.Filtered := True;

        GrdManut.DataSource.DataSet.First;

        TSManut.Caption := 'Manutenções ('+ IntToStr(GrdManut.DataSource.DataSet.RecordCount)+')';

        //---------------------------------------------------------------------------------------------------------------------------------------

        GrdLubrific.DataSource.DataSet.Filtered := False;
        GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;

        case CBCriticidade.ItemIndex of
          0: GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + 'CRITICIDADE = ''Para a F�brica''';
          1: GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + 'CRITICIDADE = ''Para o Equipamento''';
          2: GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + 'CRITICIDADE = ''Para a �rea''';
        end;

        if EdtFamiliaEquip.Text <> '' then
          begin
            if GrdLubrific.DataSource.DataSet.Filter = EmptyStr then
              GrdLubrific.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
          end;

        if edtArea.Text <> '' then
          begin
            if GrdLubrific.DataSource.DataSet.Filter = '' then
              GrdLubrific.DataSource.DataSet.Filter := 'CODAREA = '+ QuotedStr(LCodArea)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODAREA = '+ QuotedStr(LCodArea);
          end;

         if edtOficina.Text <> '' then
          begin
            if GrdLubrific.DataSource.DataSet.Filter = '' then
              GrdLubrific.DataSource.DataSet.Filter := 'CODOFICINA = '+ QuotedStr(LCodOficina)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODOFICINA = '+ QuotedStr(LCodOficina);
          end;
                 if GrdLubrific.DataSource.DataSet.Filter = '' then
          GrdLubrific.DataSource.DataSet.Filter := 'DTAINICIO1 <= '+ QuotedStr(FormatDateTime('dd/mm/yyyy', LDataMaxima))
        else
          GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND DTAINICIO1 <= '+ QuotedStr(FormatDateTime('dd/mm/yyyy', LDataMaxima));

        GrdLubrific.DataSource.DataSet.Filtered := True;

        GrdLubrific.DataSource.DataSet.First;

        TSLubrific.Caption := 'Lubrificações ('+ IntToStr(GrdLubrific.DataSource.DataSet.RecordCount)+')';

        //---------------------------------------------------------------------------------------------------------------------------------------
//        if DM.qryRotaCons.Active = False then exit;
//
//        FDMemTRota.Close;
//        FDMemTRota.CopyDataSet(DM.qryRotaCons, [coRestart, coAppend]);

        GrdRota.DataSource.DataSet.Filtered := False;
        GrdRota.DataSource.DataSet.Filter   := EmptyStr;

        DM.qryRotaCons.First;

        if DM.qryRotaCons.Filter = '' then
          DM.qryRotaCons.Filter := 'DATAINICIO <= '+ QuotedStr(FormatDateTime('dd/mm/yyyy', LDataMaxima))
        else
          DM.qryRotaCons.Filter := DM.qryRotaCons.Filter + ' AND DATAINICIO <= '+ QuotedStr(FormatDateTime('dd/mm/yyyy', LDataMaxima));

        GrdRota.DataSource.DataSet.Filtered := True;

        GrdRota.DataSource.DataSet.First;

        TSRotas.Caption := 'Rotas ('+ IntToStr(GrdRota.DataSource.DataSet.RecordCount)+')';

        DM.MSGAguarde('', False);
      End;
  End;
end;

procedure TFrmTelaInspConsulta.chbTudoClick(Sender: TObject);
var
  vlLinha: Integer;
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
      begin
        if chbTudo.Checked = True then
          begin
            with GrdManut.DataSource.DataSet do
              begin
                First;
                for vlLinha := 0 to RecordCount - 1 do
                  begin
                    GrdManut.SelectedRows.CurrentRowSelected := True;
                    Next;
                  end;
                chbTudo.Caption := 'Desmarcar todas';
                chbTudo.Width := 126;
                First;
              end;
            GrdManut.SelectedRows.Refresh;
          end
        else
          begin
            with GrdManut.DataSource.DataSet do
              begin
                First;
                for vlLinha := 0 to RecordCount - 1 do
                  begin
                    GrdManut.SelectedRows.CurrentRowSelected := False;
                    Next;
                  end;
                chbTudo.Caption := 'Marcar todas';
                chbTudo.Width := 105;
                First;
              end;
            GrdManut.SelectedRows.Refresh;
          end;
      end;
  end;
end;

procedure TFrmTelaInspConsulta.edtAreaDblClick(Sender: TObject);
begin
  inherited;
  LCodArea := '';
  edtArea.Text := '';

  GrdManut.DataSource.DataSet.Filtered    := False;
  GrdManut.DataSource.DataSet.Filter      := EmptyStr;
  GrdLubrific.DataSource.DataSet.Filtered := False;
  GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;

  CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInspConsulta.EdtFamiliaEquipDblClick(Sender: TObject);
begin
  inherited;
  LCodFamilia := '';
  EdtFamiliaEquip.Text := '';

  GrdManut.DataSource.DataSet.Filtered    := False;
  GrdManut.DataSource.DataSet.Filter      := EmptyStr;
  GrdLubrific.DataSource.DataSet.Filtered := False;
  GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;

  CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInspConsulta.edtOficinaDblClick(Sender: TObject);
begin
  inherited;
  LCodOficina := '';
  edtOficina.Text := '';

  GrdManut.DataSource.DataSet.Filtered    := False;
  GrdManut.DataSource.DataSet.Filter      := EmptyStr;
  GrdLubrific.DataSource.DataSet.Filtered := False;
  GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;

  CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInspConsulta.FDMemTLubrific1CalcFields(DataSet: TDataSet);
begin
  inherited;
FDMemTLubrificC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(FDMemTLubrificDTAINICIO1.AsDateTime));
  if FrmTelaInspConsulta <> nil then
    begin
      case CBPeriodo.ItemIndex of
        0: FDMemTLubrificPERIODO.AsString := 'Vencidas';
        1: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 7 dias';
        2: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 15 dias';
        3: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 30 dias';
        4: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 60 dias';
        5: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 90 dias';
        6: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 180 dias';
        7: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 365 dias';
      end;
    end;
end;

procedure TFrmTelaInspConsulta.FDMemTLubrificCalcFields(DataSet: TDataSet);
begin
  inherited;
FDMemTLubrificC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(FDMemTLubrificDTAINICIO1.AsDateTime));
  if FrmTelaInspConsulta <> nil then
    begin
      case CBPeriodo.ItemIndex of
        0: FDMemTLubrificPERIODO.AsString := 'Vencidas';
        1: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 7 dias';
        2: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 15 dias';
        3: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 30 dias';
        4: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 60 dias';
        5: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 90 dias';
        6: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 180 dias';
        7: FDMemTLubrificPERIODO.AsString := 'Pr�ximos 365 dias';
      end;
    end;
end;

procedure TFrmTelaInspConsulta.FDMemTManutCalcFields(DataSet: TDataSet);
begin
  inherited;

FDMemTManutC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(FDMemTManutDTAINICIO1.AsDateTime));
  if FrmTelaInspConsulta <> nil then
    begin
      case CBPeriodo.ItemIndex of
        0: FDMemTManutPERIODO.AsString := 'Vencidas';
        1: FDMemTManutPERIODO.AsString := 'Pr�ximos 7 dias';
        2: FDMemTManutPERIODO.AsString := 'Pr�ximos 15 dias';
        3: FDMemTManutPERIODO.AsString := 'Pr�ximos 30 dias';
        4: FDMemTManutPERIODO.AsString := 'Pr�ximos 60 dias';
        5: FDMemTManutPERIODO.AsString := 'Pr�ximos 90 dias';
        6: FDMemTManutPERIODO.AsString := 'Pr�ximos 180 dias';
        7: FDMemTManutPERIODO.AsString := 'Pr�ximos 365 dias';
      end;
    end;
end;

procedure TFrmTelaInspConsulta.FDMemTRotaCalcFields(DataSet: TDataSet);
begin
  inherited;
FDMemTRotaC_DIASATRASO.AsInteger := DaysBetween(DateOf(DM.FDataHoraServidor), DateOf(FDMemTRotaDATAINICIO.AsDateTime));
  if FrmTelaInspConsulta <> nil then
    begin
      case CBPeriodo.ItemIndex of
        0: FDMemTRotaPERIODO.AsString := 'Vencidas';
        1: FDMemTRotaPERIODO.AsString := 'Pr�ximos 7 dias';
        2: FDMemTRotaPERIODO.AsString := 'Pr�ximos 15 dias';
        3: FDMemTRotaPERIODO.AsString := 'Pr�ximos 30 dias';
        4: FDMemTRotaPERIODO.AsString := 'Pr�ximos 60 dias';
        5: FDMemTRotaPERIODO.AsString := 'Pr�ximos 90 dias';
        6: FDMemTRotaPERIODO.AsString := 'Pr�ximos 180 dias';
        7: FDMemTRotaPERIODO.AsString := 'Pr�ximos 365 dias';
      end;
    end;
end;

procedure TFrmTelaInspConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qryManutCons.Close;
DM.qryManutConsItens.Close;
DM.qryManutConsItensEsp.Close;
DM.qryManutConsPlanoTrab.Close;

DM.qryLubrificCons.Close;
DM.qryLubrificConsItens.Close;
DM.qryLubrificConsItensEsp.Close;
DM.qryLubrificConsPlanoTrab.Close;

DM.qryRotaCons.Close;
DM.qryRotaConsSeq.Close;
DM.qryRotaConsSeqManut.Close;
DM.qryRotaConsSeqManutItens.Close;
DM.qryRotaConsSeqManutItensEsp.Close;
//DM.qryRotaConsPlanoTrab.Close;
end;

procedure TFrmTelaInspConsulta.FormShow(Sender: TObject);
begin
  inherited;
  DM.qryManutCons.Close;
  DM.qryManutCons.Params[0].AsString := DM.FCodEmpresa;
  DM.qryManutCons.Open;
//  DM.qryManutConsItens.Open;
//  DM.qryManutConsItensEsp.Open;
//  DM.qryManutConsPlanoTrab.Open;

  DM.qryLubrificCons.Close;
  DM.qryLubrificCons.Params[0].AsString := DM.FCodEmpresa;
  DM.qryLubrificCons.Open;
//  DM.qryLubrificConsItens.Open;
//  DM.qryLubrificConsItensEsp.Open;
//  DM.qryLubrificConsPlanoTrab.Open;

//  if DM.FEmpTransf = True then
//    begin
      DM.qryRotaCons.Close;
      DM.qryRotaCons.Params[0].AsString := DM.FCodEmpresa;
      DM.qryRotaCons.Open;
//      DM.qryRotaConsSeq.Open;
//      DM.qryRotaConsSeqManut.Open;
//      DM.qryRotaConsSeqManutItens.Open;
//      DM.qryRotaConsSeqManutItensEsp.Open;
//    end;

  CBPeriodo.OnChange(Sender);
end;

procedure TFrmTelaInspConsulta.GrdLubrificKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) and ((GrdLubrific.SelectedIndex = 3) or (GrdLubrific.SelectedIndex = 4)) then
    begin
      DM.FTabela_auxiliar := 250;
      DM.FNomeConsulta    := 'Equipamentos';
      if (GrdLubrific.SelectedIndex = 3) then
        DM.FParamAuxiliar[1] := 'CODIGO';
      if (GrdLubrific.SelectedIndex = 4) then
        DM.FParamAuxiliar[1] := 'DESCRICAO';
      if DM.ConsultarCombo <> EmptyStr then
        begin
          CBPeriodo.OnChange(Sender);
          if GrdLubrific.DataSource.DataSet.Filter <> '' then
            GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + 'AND CODEQUIPAMENTO = ' + QuotedStr(DM.FCodCombo)
          else
            GrdLubrific.DataSource.DataSet.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(DM.FCodCombo);

          GrdLubrific.DataSource.DataSet.Filtered := True;
        end
      else
        CBPeriodo.OnChange(Sender);
    end;

end;

procedure TFrmTelaInspConsulta.GrdManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
      Begin
        GrdManut.Columns[0].Title.Font.Size := 9;
        GrdManut.Columns[0].Title.Caption   := 'Descrição';
        GrdManut.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 35;
        GrdManut.Columns[1].Title.Alignment := taCenter;
        GrdManut.Columns[1].Title.Font.Size := 9;
        GrdManut.Columns[1].Title.Caption   := 'Freq. (d)';
        GrdManut.DataSource.DataSet.FieldByName('FREQUENCIA1').DisplayWidth := 10;
        GrdManut.Columns[2].Title.Alignment := taCenter;
        GrdManut.Columns[2].Title.Font.Size := 9;
        GrdManut.Columns[2].Title.Caption   := 'Vencimento';
        GrdManut.DataSource.DataSet.FieldByName('DTAINICIO1').DisplayWidth := 12;
        GrdManut.Columns[3].Title.Font.Size := 9;
        GrdManut.Columns[3].Title.Caption   := 'Cód. Equip.';
        GrdManut.DataSource.DataSet.FieldByName('CODEQUIPAMENTO').DisplayWidth := 15;
        GrdManut.Columns[3].Title.Alignment := taCenter;
        GrdManut.Columns[3].Alignment := taCenter;
        GrdManut.Columns[3].Title.Font.Size := 9;
        GrdManut.Columns[3].Title.Font.Style := [fsbold];
        GrdManut.Columns[4].Title.Caption   := 'Equipamento';
        GrdManut.DataSource.DataSet.FieldByName('EQUIPAMENTO').DisplayWidth := 50;
        GrdManut.Columns[4].Title.Font.Size := 9;
        GrdManut.Columns[4].Title.Font.Style := [fsbold];
        GrdManut.Columns[5].Title.Caption   := 'Atraso (d)';
        GrdManut.Columns[5].Title.Alignment := taCenter;
        GrdManut.Columns[5].Title.Font.Size := 9;


        if (Column.Field.FieldName = 'DTAINICIO1') then
          begin
            if Column.Field.IsNull = False then
              if GrdManut.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime < DateOf(DM.FDataHoraServidor) then
                begin
                  if DM.qryManutVencC_DIASATRASO.AsInteger < 5 then
                    begin
                      GrdManut.Canvas.Brush.Color := clYellow;
                      GrdManut.Canvas.Font.Color  := clRed;
                    end
                  else
                    begin
                      GrdManut.Canvas.Brush.Color := clRed;
                      GrdManut.Canvas.Font.Color  := clWhite;
                    end;
                end
              else
              if GrdManut.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime > DateOf(DM.FDataHoraServidor) then
                begin
                  if GrdManut.DataSource.DataSet.FieldByName('C_DIASATRASO').AsInteger > 6 then
                    begin
                      GrdManut.Canvas.Brush.Color := clBlue;
                      GrdManut.Canvas.Font.Color  := clWhite;
                    end;
                end
              else
              if GrdManut.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime = DateOf(DM.FDataHoraServidor) then
                begin
                  GrdManut.Canvas.Brush.Color := clWhite;
                  GrdManut.Canvas.Font.Color  := clBlack;
                end;
          end;


//        if not odd(GrdManut.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'DTAINICIO1') then
//          if not (gdSelected in State) then
//            begin
//              GrdManut.Canvas.Brush.Color := $00F7F8F9;
//            end;

        GrdManut.Canvas.FillRect(Rect);
        GrdManut.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      End;
    1:
      Begin
        GrdLubrific.Columns[0].Title.Font.Size := 9;
        GrdLubrific.Columns[0].Title.Caption   := 'Descrição';
        GrdLubrific.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 35;
        GrdLubrific.Columns[1].Title.Alignment := taCenter;
        GrdLubrific.Columns[1].Title.Font.Size := 9;
        GrdLubrific.Columns[1].Title.Caption   := 'Freq. (d)';
        GrdLubrific.DataSource.DataSet.FieldByName('FREQUENCIA1').DisplayWidth := 10;
        GrdLubrific.Columns[2].Title.Alignment := taCenter;
        GrdLubrific.Columns[2].Title.Font.Size := 9;
        GrdLubrific.Columns[2].Title.Caption   := 'Vencimento';
        GrdLubrific.DataSource.DataSet.FieldByName('DTAINICIO1').DisplayWidth := 12;
        GrdLubrific.Columns[3].Title.Font.Size := 9;
        GrdLubrific.Columns[3].Title.Caption   := 'Cód. Equip.';
        GrdLubrific.DataSource.DataSet.FieldByName('CODEQUIPAMENTO').DisplayWidth := 15;
        GrdLubrific.Columns[3].Title.Alignment := taCenter;
        GrdLubrific.Columns[3].Alignment := taCenter;
        GrdLubrific.Columns[3].Title.Font.Size := 9;
        GrdLubrific.Columns[3].Title.Font.Style := [fsbold];
        GrdLubrific.Columns[4].Title.Caption   := 'Equipamento';
        GrdLubrific.DataSource.DataSet.FieldByName('EQUIPAMENTO').DisplayWidth := 50;
        GrdLubrific.Columns[4].Title.Font.Size := 9;
        GrdLubrific.Columns[4].Title.Font.Style := [fsbold];
        GrdLubrific.Columns[5].Title.Caption   := 'Atraso (d)';
        GrdLubrific.Columns[5].Title.Alignment := taCenter;
        GrdLubrific.Columns[5].Title.Font.Size := 9;


        if (Column.Field.FieldName = 'DTAINICIO1') then
          begin
            if Column.Field.IsNull = False then
              if GrdLubrific.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime < DateOf(DM.FDataHoraServidor) then
                begin
                  if DM.qryLubrificVencC_DIASATRASO.AsInteger < 5 then
                    begin
                      GrdLubrific.Canvas.Brush.Color := clYellow;
                      GrdLubrific.Canvas.Font.Color  := clRed;
                    end
                  else
                    begin
                      GrdLubrific.Canvas.Brush.Color := clRed;
                      GrdLubrific.Canvas.Font.Color  := clWhite;
                    end;
                end;
              if GrdLubrific.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime > DateOf(DM.FDataHoraServidor) then
                begin
                  if GrdLubrific.DataSource.DataSet.FieldByName('C_DIASATRASO').AsInteger > 6 then
                    begin
                      GrdLubrific.Canvas.Brush.Color := clBlue;
                      GrdLubrific.Canvas.Font.Color  := clWhite;
                    end;
                end;
          end;


        if not odd(GrdLubrific.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'DTAINICIO1') then
          if not (gdSelected in State) then
            begin
              GrdLubrific.Canvas.Brush.Color := $00F7F8F9;
            end;

        GrdLubrific.Canvas.FillRect(Rect);
        GrdLubrific.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      End;
    2:
      Begin
        GrdRota.Columns[0].Title.Font.Size := 9;
        GrdRota.Columns[0].Title.Caption   := 'Descrição';
        GrdRota.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 35;
        GrdRota.Columns[1].Title.Alignment := taCenter;
        GrdRota.Columns[1].Title.Font.Size := 9;
        GrdRota.Columns[1].Title.Caption   := 'Freq. (d)';
        GrdRota.DataSource.DataSet.FieldByName('FREQUENCIA').DisplayWidth := 10;
        GrdRota.Columns[2].Title.Alignment := taCenter;
        GrdRota.Columns[2].Title.Font.Size := 9;
        GrdRota.Columns[2].Title.Caption   := 'Vencimento';
        GrdRota.DataSource.DataSet.FieldByName('DATAINICIO').DisplayWidth := 12;
        GrdRota.Columns[3].Title.Caption   := 'Atraso (d)';
        GrdRota.Columns[3].Title.Alignment := taCenter;
        GrdRota.Columns[3].Title.Font.Size := 9;

        if (Column.Field.FieldName = 'DATAINICIO') then
          begin
            if Column.Field.IsNull = False then
              if GrdRota.DataSource.DataSet.FieldByName('DATAINICIO').AsDateTime < DateOf(DM.FDataHoraServidor) then
                begin
                  if DM.qryRotaEquipVencC_DIASATRASO.AsInteger < 5 then
                    begin
                      GrdRota.Canvas.Brush.Color := clYellow;
                      GrdRota.Canvas.Font.Color  := clRed;
                    end
                  else
                    begin
                      GrdRota.Canvas.Brush.Color := clRed;
                      GrdRota.Canvas.Font.Color  := clWhite;
                    end;
                end;
              if GrdRota.DataSource.DataSet.FieldByName('DATAINICIO').AsDateTime > DateOf(DM.FDataHoraServidor) then
                begin
                  if GrdRota.DataSource.DataSet.FieldByName('C_DIASATRASO').AsInteger > 6 then
                    begin
                      GrdRota.Canvas.Brush.Color := clBlue;
                      GrdRota.Canvas.Font.Color  := clWhite;
                    end;
                end;
          end;


        if not odd(GrdRota.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'DATAINICIO') then
          if not (gdSelected in State) then
            begin
              GrdRota.Canvas.Brush.Color := $00F7F8F9;
            end;

        GrdRota.Canvas.FillRect(Rect);
        GrdRota.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      End;
  end;
end;

procedure TFrmTelaInspConsulta.GrdManutKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if (Key = #13) and ((GrdManut.SelectedIndex = 3) or (GrdManut.SelectedIndex = 4)) then
    begin
      DM.FTabela_auxiliar := 250;
      DM.FNomeConsulta    := 'Equipamentos';
      if (GrdManut.SelectedIndex = 3) then
        DM.FParamAuxiliar[1] := 'CODIGO';
      if (GrdManut.SelectedIndex = 4) then
        DM.FParamAuxiliar[1] := 'DESCRICAO';
      if DM.ConsultarCombo <> EmptyStr then
        begin
          CBPeriodo.OnChange(Sender);
          if GrdManut.DataSource.DataSet.Filter <> '' then
            GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + 'AND CODEQUIPAMENTO = ' + QuotedStr(DM.FCodCombo)
          else
            GrdManut.DataSource.DataSet.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(DM.FCodCombo);

          GrdManut.DataSource.DataSet.Filtered := True;
          GrdManut.SelectedIndex := 0;
        end
      else
        CBPeriodo.OnChange(Sender);
    end;
end;

procedure TFrmTelaInspConsulta.PCInspecoesChange(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0, 1:
      begin
        EdtFamiliaEquip.Font.Color := clBlack;
        BtnFamiliaEquip.Enabled    := True;
        edtArea.Font.Color         := clBlack;
        BtnArea.Enabled            := True;
      end;
    2:
      begin
        EdtFamiliaEquip.Font.Color := clGrayText;
        BtnFamiliaEquip.Enabled    := False;
        edtArea.Font.Color         := clGrayText;
        BtnArea.Enabled            := False;
      end;
  end;
end;

end.

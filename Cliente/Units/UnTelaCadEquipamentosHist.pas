unit UnTelaCadEquipamentosHist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.DBClient, Vcl.ImgList, Vcl.ComCtrls, System.DateUtils,
  System.ImageList, FireDAC.Stan.Param, JvExComCtrls, JvDateTimePicker;

type
  TFrmTelaCadEquipamentosHist = class(TFrmTelaPaiOKCancel)
    PFundo: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LblHorasParadas: TLabel;
    LblCustoTerc: TLabel;
    LblTotalParadas: TLabel;
    Label13: TLabel;
    ImageList1: TImageList;
    PCInspecoes: TPageControl;
    TSManutencoes: TTabSheet;
    TSLubrificacoes: TTabSheet;
    GrdManutencoes: TDBGrid;
    GrdInspecoes: TDBGrid;
    GrdManutencoes2: TDBGrid;
    GrdLubrificacoes: TDBGrid;
    CDTipoManut: TClientDataSet;
    DSTipoManut: TDataSource;
    CDTipoManutTIPO: TStringField;
    CDTipoManutTOTAL: TIntegerField;
    CDTipoManutCUSTO: TFloatField;
    CDTipoLubrific: TClientDataSet;
    DSTipoLubrific: TDataSource;
    CDTipoLubrificTIPO: TStringField;
    CDTipoLubrificTOTAL: TIntegerField;
    CDTipoLubrificCUSTO: TFloatField;
    GrdItensManut: TDBGrid;
    CDAuxiliar: TClientDataSet;
    CDEquipEAuxiliares: TClientDataSet;
    CDEquipEAuxiliaresCODIGO: TStringField;
    CDEquipEAuxiliaresDESCRICAO: TStringField;
    Label1: TLabel;
    LblCustoTotal: TLabel;
    Label9: TLabel;
    LblCustoAlt: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lblCodigo: TDBText;
    LblDescricao: TDBText;
    BtnConsultar: TButton;
    LblCusto: TDBText;
    CDAuxiliarCODIGO: TWideStringField;
    CDAuxiliarDESCRICAO: TWideStringField;
    BtnImprimir: TButton;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label5: TLabel;
    EdtData2: TJvDateTimePicker;
    lblTotalManutProg: TLabel;
    lblDBTotalManutProg: TLabel;
    lblTotalManutExec: TLabel;
    lblDBTotalManutExec: TLabel;
    lblTotalLubrificProg: TLabel;
    lblDBTotalLubrificProg: TLabel;
    lblTotalLubrificExec: TLabel;
    lblDBTotalLubrificExec: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBPeriodoChange(Sender: TObject);
    procedure GrdManutencoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdInspecoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdLubrificacoesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure CustosAuxilares;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentosHist: TFrmTelaCadEquipamentosHist;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadEquipamentosHist.CustosAuxilares;
var
  Tempai: Boolean;
  CodEquipPrim: String;
  LTotalCustoMObra, LTotalCustoRecursos, LTotalCustoPecas, LTotalCustoExtras, LTotalCustoSecundarios,
  LTotalCustoMObraA, LTotalCustoRecursosA, LTotalCustoPecasA, LTotalCustoExtrasA, LTotalCustoSecundariosA: Real;
begin
LTotalCustoMObraA := 0;
LTotalCustoRecursosA := 0;
LTotalCustoPecasA := 0;
LTotalCustoExtrasA := 0;
LTotalCustoSecundariosA := 0;

  with DM do
    begin
      //-------------------------------------------------Verifica se o equipamento possui auxiliares para ser contabilizados os custos---------------------------------------
      DM.MSGAguarde('');

      DM.qryEquipamentosArvore.Close;
      DM.qryEquipamentosArvore.Params[0].AsString := DM.FCodEmpresa;
      DM.qryEquipamentosArvore.Open;
      DM.qryEquipamentosArvore.First;
      DM.qryEquipamentosArvore.Filtered := False;

      DM.qryEquipamentosArvore.Filter   := '';
      DM.qryEquipamentosArvore.Filtered := False;
      DM.qryEquipamentosArvore.Filter   := 'CODIGO = ' + QuotedStr(DM.qryEquipamentosCODIGO.AsString);
      DM.qryEquipamentosArvore.Filtered := True;

      DM.qryEquipamentosArvoreSec.Close;
      DM.qryEquipamentosArvoreSec.Params[0].AsString := DM.qryEquipamentosArvoreCODIGO.AsString;
      DM.qryEquipamentosArvoreSec.Params[1].AsString := DM.FCodEmpresa;
      DM.qryEquipamentosArvoreSec.Open; DM.qryEquipamentosArvoreSec.First;

      CDAuxiliar.Close;
      CDAuxiliar.CreateDataSet;
      CDAuxiliar.Append;
      CDAuxiliarCODIGO.AsString    := DM.qryEquipamentosArvoreCODIGO.AsString;
      CDAuxiliarDESCRICAO.AsString := DM.qryEquipamentosArvoreDESCRICAO.AsString;
      CDAuxiliar.Post;
      while not DM.qryEquipamentosArvoreSec.Eof = True do
        begin
          CDAuxiliar.Append;
          CDAuxiliarCODIGO.AsString    := DM.qryEquipamentosArvoreSecCODIGO.AsString;
          CDAuxiliarDESCRICAO.AsString := DM.qryEquipamentosArvoreSecDESCRICAO.AsString;
          CDAuxiliar.Post;

          DM.qryEquipamentosArvoreSec.Next;
        end;

      CDEquipEAuxiliares.Close; CDEquipEAuxiliares.CreateDataSet;

      tempai := True;

      CDAuxiliar.First;
      while not CDAuxiliar.Eof = True do
        begin
          if CDEquipEAuxiliares.Locate('CODIGO', CDAuxiliarCODIGO.AsString, []) = True then
            tempai := True;

          while tempai = true do
            begin
              CodEquipPrim := CDAuxiliarCODIGO.AsString;
              DM.qryEquipamentosArvore.Filter   := '';
              DM.qryEquipamentosArvore.Filtered := False;
              DM.qryEquipamentosArvore.Filter   := 'CODIGO = ' + QuotedStr(CodEquipPrim);
              DM.qryEquipamentosArvore.Filtered := True;

              DM.qryEquipamentosArvoreSec.Close;
              DM.qryEquipamentosArvoreSec.Params[0].AsString := CodEquipPrim;
              DM.qryEquipamentosArvoreSec.Params[1].AsString := DM.FCodEmpresa;
              DM.qryEquipamentosArvoreSec.Open; DM.qryEquipamentosArvoreSec.First;

              if DM.qryEquipamentosArvoreSec.IsEmpty = False then
                begin
                  while not DM.qryEquipamentosArvoreSec.Eof = True do
                    begin
                      if CDEquipEAuxiliares.Locate('CODIGO', DM.qryEquipamentosArvoreSecCODIGO.AsString, []) = True = False then
                        begin
                          CDEquipEAuxiliares.Append;
                          CDEquipEAuxiliaresCODIGO.AsString    := DM.qryEquipamentosArvoreSecCODIGO.AsString;
                          CDEquipEAuxiliaresDESCRICAO.AsString := DM.qryEquipamentosArvoreSecDESCRICAO.AsString;
                          CDEquipEAuxiliares.Post;
                        end
                      else
                        tempai := False;
                      DM.qryEquipamentosArvoreSec.Next;
                    end;
                end
              else
                tempai := False;
            end;
          CDAuxiliar.Next;
        end;

      CDEquipEAuxiliares.Append;
      CDEquipEAuxiliaresCODIGO.AsString    := DM.qryEquipamentosCODIGO.AsString;
      CDEquipEAuxiliaresDESCRICAO.AsString := DM.qryEquipamentosDESCRICAO.AsString;
      CDEquipEAuxiliares.Post;

      if CDEquipEAuxiliares.RecordCount = 1 then
        begin
          LTotalCustoMObra       := 0;
          LTotalCustoRecursos    := 0;
          LTotalCustoPecas       := 0;
          LTotalCustoExtras      := 0;
          LTotalCustoSecundarios := 0;

          DM.qryEquipamentosHist.Close;
          DM.qryEquipamentosHist.Params[0].AsString := DM.FCodEmpresa;
          DM.qryEquipamentosHist.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
          DM.qryEquipamentosHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
          DM.qryEquipamentosHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
          DM.qryEquipamentosHist.Open;

          DM.qryEquipamentosHist.Filtered := False;
          DM.qryEquipamentosHist.Filter   := 'TIPOMANUTENCAO <> ' + QuotedStr('Alterações de Projetos');
          DM.qryEquipamentosHist.Filtered := True;

          DM.qryEquipamentosHist.First;
          while not DM.qryEquipamentosHist.Eof = True do
            begin
              LTotalCustoMObra       := DM.qryEquipamentosHistCUSTOMOBRA.AsFloat;
              LTotalCustoRecursos    := DM.qryEquipamentosHistCUSTORECURSOS.AsFloat;
              LTotalCustoPecas       := DM.qryEquipamentosHistCUSTOPECAS.AsFloat;
              LTotalCustoExtras      := DM.qryEquipamentosHistCUSTOEXTRA.AsFloat;
              LTotalCustoSecundarios := DM.qryEquipamentosHistCUSTOSECUNDARIOS.AsFloat;

              DM.qryEquipamentosHist.Next;
            end;

          //LblCusto.Caption := FormatFloat('R$ ,0.00', LTotalCustoMObra + LTotalCustoRecursos + LTotalCustoPecas + LTotalCustoExtras + LTotalCustoSecundarios);
          LblCustoTotal.Caption := FormatFloat('R$ ,0.00', LTotalCustoMObra + LTotalCustoRecursos + LTotalCustoPecas + LTotalCustoExtras + LTotalCustoSecundarios);

          LTotalCustoMObra       := 0;
          LTotalCustoRecursos    := 0;
          LTotalCustoPecas       := 0;
          LTotalCustoExtras      := 0;
          LTotalCustoSecundarios := 0;

          DM.qryEquipamentosHist.Filtered := False;
          DM.qryEquipamentosHist.Filter   := 'TIPOMANUTENCAO = ' + QuotedStr('Alterações de Projetos');
          DM.qryEquipamentosHist.Filtered := True;
          DM.qryEquipamentosHist.First;

          DM.qryEquipamentosHist.First;
          while not DM.qryEquipamentosHist.Eof = True do
            begin
              LTotalCustoMObra       := LTotalCustoMObra + DM.qryEquipamentosHistCUSTOMOBRA.AsFloat;
              LTotalCustoRecursos    := LTotalCustoRecursos + DM.qryEquipamentosHistCUSTORECURSOS.AsFloat;
              LTotalCustoPecas       := LTotalCustoPecas + DM.qryEquipamentosHistCUSTOPECAS.AsFloat;
              LTotalCustoExtras      := LTotalCustoExtras + DM.qryEquipamentosHistCUSTOEXTRA.AsFloat;
              LTotalCustoSecundarios := LTotalCustoSecundarios + DM.qryEquipamentosHistCUSTOSECUNDARIOS.AsFloat;

              DM.qryEquipamentosHist.Next;
            end;

          LblCustoAlt.Caption   := FormatFloat('R$ ,0.00', LTotalCustoMObra + LTotalCustoRecursos + LTotalCustoPecas + LTotalCustoExtras + LTotalCustoSecundarios);
        end
      else
        begin
          CDEquipEAuxiliares.First;

          while not CDEquipEAuxiliares.Eof  = True do
            begin
              DM.qryEquipamentosHist.Close;
              DM.qryEquipamentosHist.Params[0].AsString := DM.FCodEmpresa;
              DM.qryEquipamentosHist.Params[1].AsString := CDEquipEAuxiliaresCODIGO.AsString;
              DM.qryEquipamentosHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
              DM.qryEquipamentosHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
              DM.qryEquipamentosHist.Open;

              if CDEquipEAuxiliaresCODIGO.AsString <> DM.qryEquipamentosCODIGO.AsString then
                begin
                  LTotalCustoMObraA := 0; LTotalCustoRecursosA := 0;  LTotalCustoPecasA := 0; LTotalCustoExtrasA := 0; LTotalCustoSecundariosA := 0;

                  DM.qryEquipamentosHist.First;
                  while not DM.qryEquipamentosHist.Eof = True do
                    begin
                      LTotalCustoMObraA       := LTotalCustoMObraA + DM.qryEquipamentosHistCUSTOMOBRA.AsFloat;
                      LTotalCustoRecursosA    := LTotalCustoRecursosA + DM.qryEquipamentosHistCUSTORECURSOS.AsFloat;
                      LTotalCustoPecasA       := LTotalCustoPecasA + DM.qryEquipamentosHistCUSTOPECAS.AsFloat;
                      LTotalCustoExtrasA      := LTotalCustoExtrasA + DM.qryEquipamentosHistCUSTOEXTRA.AsFloat;
                      LTotalCustoSecundariosA := LTotalCustoSecundariosA + DM.qryEquipamentosHistCUSTOSECUNDARIOS.AsFloat;

                      DM.qryEquipamentosHist.Next;
                    end;

                end;

              if CDEquipEAuxiliaresCODIGO.AsString = DM.qryEquipamentosCODIGO.AsString then
                begin
                  //-----------------------------------------------------------------------------------------------------------------------------------------------------
                  LTotalCustoMObra := 0; LTotalCustoRecursos := 0; LTotalCustoPecas := 0; LTotalCustoExtras := 0; LTotalCustoSecundarios := 0;

                  DM.qryEquipamentosHist.Filtered := False;
                  DM.qryEquipamentosHist.Filter   := 'TIPOMANUTENCAO = ' + QuotedStr('Alterações de Projetos');
                  DM.qryEquipamentosHist.Filtered := True;

                  DM.qryEquipamentosHist.First;
                  while not DM.qryEquipamentosHist.Eof = True do
                    begin
                      LTotalCustoMObra       := LTotalCustoMObra + DM.qryEquipamentosHistCUSTOMOBRA.AsFloat;
                      LTotalCustoRecursos    := LTotalCustoRecursos + DM.qryEquipamentosHistCUSTORECURSOS.AsFloat;
                      LTotalCustoPecas       := LTotalCustoPecas + DM.qryEquipamentosHistCUSTOPECAS.AsFloat;
                      LTotalCustoExtras      := LTotalCustoExtras + DM.qryEquipamentosHistCUSTOEXTRA.AsFloat;
                      LTotalCustoSecundarios := LTotalCustoSecundarios + DM.qryEquipamentosHistCUSTOSECUNDARIOS.AsFloat;

                      DM.qryEquipamentosHist.Next;
                    end;

                  LblCustoAlt.Caption := FormatFloat('R$ ,0.00', LTotalCustoMObra + LTotalCustoRecursos + LTotalCustoPecas + LTotalCustoExtras + LTotalCustoSecundarios);
                  //-----------------------------------------------------------------------------------------------------------------------------------------------------
                  LTotalCustoMObra := 0; LTotalCustoRecursos := 0; LTotalCustoPecas := 0; LTotalCustoExtras := 0; LTotalCustoSecundarios := 0;

                  DM.qryEquipamentosHist.Filtered := False;
                  DM.qryEquipamentosHist.Filter   := 'TIPOMANUTENCAO <> ' + QuotedStr('Alterações de Projetos');
                  DM.qryEquipamentosHist.Filtered := True;

                  DM.qryEquipamentosHist.First;
                  while not DM.qryEquipamentosHist.Eof = True do
                    begin
                      LTotalCustoMObra       := LTotalCustoMObra + DM.qryEquipamentosHistCUSTOMOBRA.AsFloat;
                      LTotalCustoRecursos    := LTotalCustoRecursos + DM.qryEquipamentosHistCUSTORECURSOS.AsFloat;
                      LTotalCustoPecas       := LTotalCustoPecas + DM.qryEquipamentosHistCUSTOPECAS.AsFloat;
                      LTotalCustoExtras      := LTotalCustoExtras + DM.qryEquipamentosHistCUSTOEXTRA.AsFloat;
                      LTotalCustoSecundarios := LTotalCustoSecundarios + DM.qryEquipamentosHistCUSTOSECUNDARIOS.AsFloat;

                      DM.qryEquipamentosHist.Next;
                    end;

                  //LblCusto.Caption := FormatFloat('R$ ,0.00', LTotalCustoMObra + LTotalCustoRecursos + LTotalCustoPecas + LTotalCustoExtras + LTotalCustoSecundarios);
                  LblCustoTotal.Caption := FormatFloat(',0.00', LTotalCustoMObra + LTotalCustoRecursos + LTotalCustoPecas + LTotalCustoExtras + LTotalCustoSecundarios
                                                        + LTotalCustoMObraA + LTotalCustoRecursosA + LTotalCustoPecasA + LTotalCustoExtrasA + LTotalCustoSecundariosA);
                end;

              CDEquipEAuxiliares.Next;
            end;
        end;
      DM.qryEquipamentosHist.Filtered := False;
      DM.MSGAguarde('', False);
      //---------------------------------------------------------------------------------------------------------------------------------------------------------------------

    end;
end;

procedure TFrmTelaCadEquipamentosHist.BtnConsultarClick(Sender: TObject);
var
  Tempai: Boolean;
  CodEquipPrim: String;
  LCustoTotal, LTotalCustoMObra, LTotalCustoRecursos, LTotalCustoPecas, LTotalCustoExtras, LTotalCustoSecundarios,
  LTotalCustoMObraA, LTotalCustoRecursosA, LTotalCustoPecasA, LTotalCustoExtrasA, LTotalCustoSecundariosA: Real;
begin
  inherited;
if EdtData1.Date > EdtData2.Date then Exit;

DM.FDataConsulta1 := EdtData1.Date;
DM.FDataConsulta2 := EdtData2.Date;

DM.MSGAguarde('');

DM.qryEquipamentosHist.Close;
DM.qryEquipamentosHist.Params[0].AsString := DM.FCodEmpresa;
DM.qryEquipamentosHist.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentosHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryEquipamentosHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryEquipamentosHist.Open;

LblTotalParadas.Caption := FormatFloat('00', DM.qryEquipamentosHist.RecordCount);

//----------------------------------------------------------------------------------------------------------
//DM.qryEquipamentosHistNumParadas.Close;
//DM.qryEquipamentosHistNumParadas.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentosHistNumParadas.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
//DM.qryEquipamentosHistNumParadas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentosHistNumParadas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentosHistNumParadas.Open;

//----------------------------------------------------------------------------------------------------------
if DM.qryEquipamentosHistSUMTEMPOEXECUTADO.IsNull = False then
  LblHorasParadas.Caption := DM.qryEquipamentosHistSUMTEMPOEXECUTADO.AsString
else
  LblHorasParadas.Caption := 'R$ 0.00';

  //-------------------------------------------------------------------------------------------------------------
DM.qryEquipamentosHistTercFora.Close;
DM.qryEquipamentosHistTercFora.Params[0].AsString := DM.FCodEmpresa;
DM.qryEquipamentosHistTercFora.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentosHistTercFora.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryEquipamentosHistTercFora.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryEquipamentosHistTercFora.Open;
LblCustoTerc.Caption := FormatFloat('R$ ,0.00', DM.qryEquipamentosHistTercForaTOTAL.AsFloat);
//-------------------------------------------------------------------------------------------------------------
//DM.qryEquipamentosHist.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(DM.qryEquipamentosCODIGO.AsString)
//                                    + ' AND TIPOMANUTENCAO = ''Outros Serviços''';
DM.qryEquipamentosHist.Filter := 'TIPOMANUTENCAO = ''Outros Serviços''';
DM.qryEquipamentosHist.Filtered := True;
if DM.qryEquipamentosHistSUMCUSTOS.IsNull = False then
  LblCustoAlt.Caption := CurrToStrF(DM.qryEquipamentosHistSUMCUSTOS.Value, ffCurrency, 2)
else
  LblCustoAlt.Caption := 'R$ 0,00';
//-------------------------------------------------------------------------------------------------------------
DM.qryEquipamentosHist.Filter := '';
DM.qryEquipamentosHist.Filtered := False;
if DM.qryEquipamentosHistSUMCUSTOS.IsNull = False then
  LblCusto.Caption := CurrToStrF(DM.qryEquipamentosHistSUMCUSTOS.Value, ffCurrency, 2)
else
  LblCusto.Caption := 'R$ 0,00';
//-------------------------------------------------------------------------------------------------------------
if DM.qryEquipamentosHistSUMCUSTOSECUNDARIOS.IsNull = False then
  begin
    LblCustoTotal.Caption := CurrToStrF(DM.qryEquipamentosHistSUMCUSTOSECUNDARIOS.Value, ffCurrency, 2);
    LCustoTotal := DM.qryEquipamentosHistSUMCUSTOSECUNDARIOS.Value;
  end
else
  LblCustoTotal.Caption := 'R$ 0.00';
//--------------------------------------------------------------------------------------------------------------
DM.qryEquipamentoTipoManutHist.Close;
DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryEquipamentoTipoManutHist.Open;
//--------------------------------------------------------------------------------------------------------------
DM.qryEquipamentoManutHist.Close;
DM.qryEquipamentoManutHist.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryEquipamentoManutHist.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryEquipamentoManutHist.Params[2].AsString := DM.FCodEmpresa;
DM.qryEquipamentoManutHist.Params[3].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentoManutHist.Open;

DM.qryEquipamentoLubrificHist.Close;
DM.qryEquipamentoLubrificHist.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryEquipamentoLubrificHist.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryEquipamentoLubrificHist.Params[2].AsString := DM.FCodEmpresa;
DM.qryEquipamentoLubrificHist.Params[3].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentoLubrificHist.Open;
//--------------------------------------------------------------------------------------------------------------
DM.qryEquipamentosManutHistProgExec.Close;
DM.qryEquipamentosManutHistProgExec.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryEquipamentosManutHistProgExec.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryEquipamentosManutHistProgExec.Params[2].AsString := DM.FCodEmpresa;
DM.qryEquipamentosManutHistProgExec.Params[3].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentosManutHistProgExec.Open;
lblDBTotalManutProg.Caption := FormatFloat('00', DM.qryEquipamentosManutHistProgExectotal_programados.AsFloat);
lblDBTotalManutExec.Caption := FormatFloat('00', DM.qryEquipamentosManutHistProgExectotal_executados.AsFloat);

DM.qryEquipamentosLubrificHistProgExec.Close;
DM.qryEquipamentosLubrificHistProgExec.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryEquipamentosLubrificHistProgExec.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryEquipamentosLubrificHistProgExec.Params[2].AsString := DM.FCodEmpresa;
DM.qryEquipamentosLubrificHistProgExec.Params[3].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentosLubrificHistProgExec.Open;
lblDBTotalLubrificProg.Caption := FormatFloat('00', DM.qryEquipamentosLubrificHistProgExectotal_programados.AsFloat);
lblDBTotalLubrificExec.Caption := FormatFloat('00', DM.qryEquipamentosLubrificHistProgExectotal_executados.AsFloat);

//-------------------------------------------------Verifica se o equipamento possui auxiliares para ser contabilizados os custos---------------------------------------

DM.qryEquipamentosArvore.Close;
DM.qryEquipamentosArvore.SQL.Clear;
DM.qryEquipamentosArvore.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`CODEMPRESA`, `equipamentos`.`DESCRICAO`, `equipamentos`.`CODEQUIPAMENTOPAI`, `equipamentos_1`.`DESCRICAO` AS `DESCEQUIPAMENTOPAI`, `equipamentos`.`SEQUENCIA`, `equipamentos`.`CODLOCALIZACAO` AS `CODAREA`'
                                  + ' FROM `equipamentos`'
                                  + ' LEFT JOIN `equipamentos` AS `equipamentos_1` ON (`equipamentos`.`CODEMPRESA` = `equipamentos_1`.`CODEMPRESA`) AND (`equipamentos`.`CODEQUIPAMENTOPAI` = `equipamentos_1`.`CODIGO`)'
                                  + ' WHERE `equipamentos`.`CODEMPRESA` = :codempresa AND `equipamentos`.`OPERANDO` = ''S''');
DM.qryEquipamentosArvore.SQL.Add(' AND `equipamentos`.`CODIGO` = :codigo');
DM.qryEquipamentosArvore.SQL.Add(' ORDER BY `equipamentos_1`.`DESCRICAO` ASC, `equipamentos`.`SEQUENCIA` ASC, `equipamentos`.`DESCRICAO` ASC');
DM.qryEquipamentosArvore.Params[0].AsString := DM.FCodEmpresa;
DM.qryEquipamentosArvore.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
DM.qryEquipamentosArvore.Open;
DM.qryEquipamentosArvoreSec.Open;

CDAuxiliar.Close;
CDAuxiliar.CreateDataSet;
CDAuxiliar.Append;
CDAuxiliarCODIGO.AsString    := DM.qryEquipamentosArvoreCODIGO.AsString;
CDAuxiliarDESCRICAO.AsString := DM.qryEquipamentosArvoreDESCRICAO.AsString;
CDAuxiliar.Post;
while not DM.qryEquipamentosArvoreSec.Eof = True do
  begin
    CDAuxiliar.Append;
    CDAuxiliarCODIGO.AsString    := DM.qryEquipamentosArvoreSecCODIGO.AsString;
    CDAuxiliarDESCRICAO.AsString := DM.qryEquipamentosArvoreSecDESCRICAO.AsString;
    CDAuxiliar.Post;

    DM.qryEquipamentosArvoreSec.Next;
  end;

CDEquipEAuxiliares.Close; CDEquipEAuxiliares.CreateDataSet;

tempai := True;

CDAuxiliar.First;
while not CDAuxiliar.Eof = True do
  begin
    if CDEquipEAuxiliares.Locate('CODIGO', CDAuxiliarCODIGO.AsString, []) = True then
      tempai := True;

    while tempai = true do
      begin
        CodEquipPrim := CDAuxiliarCODIGO.AsString;
        DM.qryEquipamentosArvore.Filter   := '';
        DM.qryEquipamentosArvore.Filtered := False;
        DM.qryEquipamentosArvore.Filter   := 'CODIGO = ' + QuotedStr(CodEquipPrim);
        DM.qryEquipamentosArvore.Filtered := True;

//        DM.qryEquipamentosArvoreSec.Close;
//        DM.qryEquipamentosArvoreSec.Params[0].AsString := CodEquipPrim;
//        DM.qryEquipamentosArvoreSec.Params[1].AsString := DM.FCodEmpresa;
        DM.qryEquipamentosArvoreSec.Open;
        DM.qryEquipamentosArvoreSec.First;

        if DM.qryEquipamentosArvoreSec.IsEmpty = False then
          begin
            while not DM.qryEquipamentosArvoreSec.Eof = True do
              begin
                if CDEquipEAuxiliares.Locate('CODIGO', DM.qryEquipamentosArvoreSecCODIGO.AsString, []) = True = False then
                  begin
                    CDEquipEAuxiliares.Append;
                    CDEquipEAuxiliaresCODIGO.AsString    := DM.qryEquipamentosArvoreSecCODIGO.AsString;
                    CDEquipEAuxiliaresDESCRICAO.AsString := DM.qryEquipamentosArvoreSecDESCRICAO.AsString;
                    CDEquipEAuxiliares.Post;
                  end
                else
                  tempai := False;
                DM.qryEquipamentosArvoreSec.Next;
              end;
          end
        else
          tempai := False;
      end;
    CDAuxiliar.Next;
  end;

CDEquipEAuxiliares.Append;
CDEquipEAuxiliaresCODIGO.AsString    := DM.qryEquipamentosCODIGO.AsString;
CDEquipEAuxiliaresDESCRICAO.AsString := DM.qryEquipamentosDESCRICAO.AsString;
CDEquipEAuxiliares.Post;

if CDEquipEAuxiliares.RecordCount > 1 then
  begin
    LTotalCustoMObra       := 0;
    LTotalCustoRecursos    := 0;
    LTotalCustoPecas       := 0;
    LTotalCustoExtras      := 0;
    LTotalCustoSecundarios := 0;

    CDEquipEAuxiliares.First;
    while not CDEquipEAuxiliares.Eof = True do
      begin
        DM.qryEquipamentosHist.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(CDEquipEAuxiliaresCODIGO.AsString);
        DM.qryEquipamentosHist.Filtered := True;

        LTotalCustoMObra       := LTotalCustoMObra       + DM.qryEquipamentosHistCUSTOMOBRA.AsFloat;
        LTotalCustoRecursos    := LTotalCustoRecursos    + DM.qryEquipamentosHistCUSTORECURSOS.AsFloat;
        LTotalCustoPecas       := LTotalCustoPecas       + DM.qryEquipamentosHistCUSTOPECAS.AsFloat;
        LTotalCustoExtras      := LTotalCustoExtras      + DM.qryEquipamentosHistCUSTOEXTRA.AsFloat;
        LTotalCustoSecundarios := LTotalCustoSecundarios + DM.qryEquipamentosHistCUSTOSECUNDARIOS.AsFloat;

        CDEquipEAuxiliares.Next;
      end;

    LblCustoTotal.Caption := FormatFloat('R$ ,0.00', LCustoTotal + LTotalCustoMObra + LTotalCustoRecursos + LTotalCustoPecas + LTotalCustoExtras + LTotalCustoSecundarios);
  end;
//DM.qryEquipamentosHist.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(DM.qryEquipamentosCODIGO.AsString)
//                                    + ' AND TIPOMANUTENCAO = ''Manutenção Corretiva''';
DM.qryEquipamentosHist.Filter := 'TIPOMANUTENCAO = ''Manutenção Corretiva''';
DM.qryEquipamentosHist.Filtered := True;

DM.qryEquipamentosArvore.Close;
DM.qryEquipamentosArvoreSec.Close;

DM.MSGAguarde('', False);
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------

end;

procedure TFrmTelaCadEquipamentosHist.BtnImprimirClick(Sender: TObject);
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
  inherited;
  with DM do
  begin
    CDEquipamentoHist.Close;
    CDEquipamentoHist.CreateDataSet;
    CDEquipamentoHist.Append;
    CDEquipamentoHistCODIGO.AsString           := lblCodigo.Caption;
    CDEquipamentoHistDESCRICAO.AsString        := LblDescricao.Caption;
    CDEquipamentoHistNUMPARADAS.AsString       := LblTotalParadas.Caption;
    CDEquipamentoHistHORASPARADAS.AsString     := LblHorasParadas.Caption;
    CDEquipamentoHistCUSTOTERCEIROS.AsString   := LblCustoTerc.Caption;
    CDEquipamentoHistCUSTOALTERACOES.AsString  := LblCustoAlt.Caption;
    CDEquipamentoHistCUSTOEQUIPAMENTO.AsString := LblCusto.Caption;
    CDEquipamentoHistCUSTOTOTAL.AsString       := LblCustoTotal.Caption;
    CDEquipamentoHistDATACONSULTAINI.AsString  := FormatDateTime('dd/mm/yyyy', EdtData1.DateTime);
    CDEquipamentoHistDATACONSULTAFIN.AsString  := FormatDateTime('dd/mm/yyyy', EdtData2.DateTime);
    CDEquipamentoHist.Post;
  end;

  DmRelatorios.frxREquipamentosHist.ShowReport();
end;

procedure TFrmTelaCadEquipamentosHist.CBPeriodoChange(Sender: TObject);
begin
  inherited;
//if EdtData1.Date > EdtData2.Date then Exit;
//
//DM.MSGAguarde('');
//
//DM.FDataConsulta1 := EdtData1.Date;
//DM.FDataConsulta2 := EdtData2.Date;
//
//LblHorasParadas.Caption := FormatFloat(',0.00', DM.HorasParadasEquipamento(DM.FParamAuxiliar[0], EmptyStr, EmptyStr, EmptyStr));
//
//DM.qryEquipamentosHistNumParadas.Close;
//DM.qryEquipamentosHistNumParadas.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentosHistNumParadas.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
//DM.qryEquipamentosHistNumParadas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentosHistNumParadas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentosHistNumParadas.Open;
//LblTotalParadas.Caption := FormatFloat('00', DM.qryEquipamentosHistNumParadasNUMPARADAS.AsFloat);
////-------------------------------------------------------------------------------------------------------------
//
//CDTipoManut.Close;
//CDTipoManut.CreateDataSet;
//CDTipoManut.Append;
//CDTipoManutTIPO.AsString   := 'Manutenção Autônoma';
//
//CDTipoLubrific.Close;
//CDTipoLubrific.CreateDataSet;
//CDTipoLubrific.Append;
//CDTipoLubrificTIPO.AsString   := 'Manutenção Autônoma';
//
//DM.qryEquipamentoTipoManutHist.Close;
//DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoTipoManutHist.Params[4].AsString := CDTipoManutTIPO.AsString;
//DM.qryEquipamentoTipoManutHist.Open;
//
//CDTipoManutTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoManutCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoManut.Post;
//
//CDTipoLubrificTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoLubrificCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoLubrific.Post;
////-------------------------------------------------------------------------------------------------------------
//CDTipoManut.Append;
//CDTipoManutTIPO.AsString := 'Manutenção Corretiva';
//
//CDTipoLubrific.Append;
//CDTipoLubrificTIPO.AsString   := 'Manutenção Corretiva';
//
//DM.qryEquipamentoTipoManutHist.Close;
//DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoTipoManutHist.Params[4].AsString := CDTipoManutTIPO.AsString;
//DM.qryEquipamentoTipoManutHist.Open;
//
//CDTipoManutTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoManutCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoManut.Post;
//
//CDTipoLubrificTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoLubrificCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoLubrific.Post;
////-------------------------------------------------------------------------------------------------------------
//CDTipoManut.Append;
//CDTipoManutTIPO.AsString := 'Manutenção Preventiva';
//
//CDTipoLubrific.Append;
//CDTipoLubrificTIPO.AsString   := 'Manutenção Preventiva';
//
//DM.qryEquipamentoTipoManutHist.Close;
//DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoTipoManutHist.Params[4].AsString := CDTipoManutTIPO.AsString;
//DM.qryEquipamentoTipoManutHist.Open;
//
//CDTipoManutTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoManutCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoManut.Post;
//
//CDTipoLubrificTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoLubrificCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoLubrific.Post;
////-------------------------------------------------------------------------------------------------------------
//CDTipoManut.Append;
//CDTipoManutTIPO.AsString := 'Manutenção Preditiva';
//
//CDTipoLubrific.Append;
//CDTipoLubrificTIPO.AsString   := 'Manutenção Preditiva';
//
//DM.qryEquipamentoTipoManutHist.Close;
//DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoTipoManutHist.Params[4].AsString := CDTipoManutTIPO.AsString;
//DM.qryEquipamentoTipoManutHist.Open;
//
//CDTipoManutTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoManutCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoManut.Post;
//
//CDTipoLubrificTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoLubrificCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoLubrific.Post;
////-------------------------------------------------------------------------------------------------------------
//CDTipoManut.Append;
//CDTipoManutTIPO.AsString := 'Novos Projetos';
//
//CDTipoLubrific.Append;
//CDTipoLubrificTIPO.AsString   := 'Novos Projetos';
//
//DM.qryEquipamentoTipoManutHist.Close;
//DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoTipoManutHist.Params[4].AsString := CDTipoManutTIPO.AsString;
//DM.qryEquipamentoTipoManutHist.Open;
//
//CDTipoManutTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoManutCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoManut.Post;
//
//CDTipoLubrificTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoLubrificCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoLubrific.Post;
////-------------------------------------------------------------------------------------------------------------
//CDTipoManut.Append;
//CDTipoManutTIPO.AsString := 'Alterações de Projetos';
//
//CDTipoLubrific.Append;
//CDTipoLubrificTIPO.AsString   := 'Alterações de Projetos';
//
//DM.qryEquipamentoTipoManutHist.Close;
//DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoTipoManutHist.Params[4].AsString := CDTipoManutTIPO.AsString;
//DM.qryEquipamentoTipoManutHist.Open;
//
//CDTipoManutTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoManutCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoManut.Post;
//
//CDTipoLubrificTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoLubrificCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoLubrific.Post;
////-------------------------------------------------------------------------------------------------------------
//CDTipoManut.Append;
//CDTipoManutTIPO.AsString := 'Outros Serviços';
//
//CDTipoLubrific.Append;
//CDTipoLubrificTIPO.AsString   := 'Outros Serviços';
//
//DM.qryEquipamentoTipoManutHist.Close;
//DM.qryEquipamentoTipoManutHist.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoTipoManutHist.Params[1].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoTipoManutHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoTipoManutHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoTipoManutHist.Params[4].AsString := CDTipoManutTIPO.AsString;
//DM.qryEquipamentoTipoManutHist.Open;
//
//CDTipoManutTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoManutCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoManut.Post;
//
//CDTipoLubrificTOTAL.AsInteger := DM.qryEquipamentoTipoManutHistTOTAL.AsInteger;
//CDTipoLubrificCUSTO.AsFloat   := DM.qryEquipamentoTipoManutHistCUSTOTOTAL.AsFloat;
//CDTipoLubrific.Post;
////-------------------------------------------------------------------------------------------------------------
//DM.qryEquipamentosHistTercFora.Close;
//DM.qryEquipamentosHistTercFora.Params[0].AsString := DM.FCodEmpresa;
//DM.qryEquipamentosHistTercFora.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
//DM.qryEquipamentosHistTercFora.Params[2].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentosHistTercFora.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentosHistTercFora.Open;
//LblCustoTerc.Caption := FormatFloat('R$ ,0.00', DM.qryEquipamentosHistTercForaTOTAL.AsFloat);
////-------------------------------------------------------------------------------------------------------------
//
//DM.qryEquipamentoTipoManutHist.Close;
//
//DM.qryEquipamentoManutHist.Close;
//DM.qryEquipamentoManutHist.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoManutHist.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoManutHist.Params[2].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoManutHist.Params[3].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoManutHist.Open;
//
//DM.qryEquipamentoLubrificHist.Close;
//DM.qryEquipamentoLubrificHist.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
//DM.qryEquipamentoLubrificHist.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
//DM.qryEquipamentoLubrificHist.Params[2].AsString := DM.FCodEmpresa;
//DM.qryEquipamentoLubrificHist.Params[3].AsString := DM.FParamAuxiliar[0];
//DM.qryEquipamentoLubrificHist.Open;
//
//DM.qryEquipamentosArvore.Close;
//DM.qryEquipamentosArvoreSec.Close;
//CDAuxiliar.Close;
//CDEquipEAuxiliares.Close;
//DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadEquipamentosHist.GrdLubrificacoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdLubrificacoes.Columns[0].Title.Font.Size := 9; GrdLubrificacoes.Columns[1].Title.Font.Size := 9;
GrdLubrificacoes.Columns[2].Title.Font.Size := 9; GrdLubrificacoes.Columns[3].Title.Font.Size := 9;
GrdLubrificacoes.Columns[4].Title.Font.Size := 9;

GrdLubrificacoes.Columns[1].Title.Alignment := taCenter;
GrdLubrificacoes.Columns[2].Title.Alignment := taCenter;
GrdLubrificacoes.Columns[2].Alignment       := taCenter;
GrdLubrificacoes.Columns[3].Title.Alignment := taCenter;
GrdLubrificacoes.Columns[3].Alignment       := taCenter;
GrdLubrificacoes.Columns[4].Title.Alignment := taCenter;
GrdLubrificacoes.Columns[4].Alignment       := taCenter;


//if gdSelected in State then
//  begin
//    if GrdLubrificacoes.Fields[4].AsString = EmptyStr then
//        GrdLubrificacoes.Canvas.Brush.Color := clMaroon
//    else
//        GrdLubrificacoes.Canvas.Brush.Color := clHighlight;
//    GrdLubrificacoes.Canvas.Font.Color := clHighlightText;
//  end
//else
//  begin
    if GrdLubrificacoes.Fields[4].AsString = EmptyStr then
        GrdLubrificacoes.Canvas.Font.Color := clRed
    else
        GrdLubrificacoes.Canvas.Font.Color := clBlack;
//  end;
GrdLubrificacoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrmTelaCadEquipamentosHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryEquipamentosHist.Close;
DM.qryEquipamentoTipoManutHist.Close;
DM.qryEquipamentoManutHist.Close;
end;

procedure TFrmTelaCadEquipamentosHist.FormCreate(Sender: TObject);
begin
  inherited;
EdtData1.Date := IncDay(DateOf(DM.FDataHoraServidor), -30);
EdtData2.Date := DateOf(DM.FDataHoraServidor);
end;

procedure TFrmTelaCadEquipamentosHist.GrdInspecoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdInspecoes.Columns[0].Title.Font.Size := 9; GrdInspecoes.Columns[1].Title.Font.Size := 9;
GrdInspecoes.Columns[2].Title.Font.Size := 9; GrdInspecoes.Columns[3].Title.Font.Size := 9;
GrdInspecoes.Columns[4].Title.Font.Size := 9;

GrdInspecoes.Columns[1].Title.Alignment := taCenter;
GrdInspecoes.Columns[2].Title.Alignment := taCenter;
GrdInspecoes.Columns[2].Alignment       := taCenter;
GrdInspecoes.Columns[3].Title.Alignment := taCenter;
GrdInspecoes.Columns[3].Alignment       := taCenter;
GrdInspecoes.Columns[4].Title.Alignment := taCenter;
GrdInspecoes.Columns[4].Alignment       := taCenter;


//if gdSelected in State then
//  begin
//    if GrdInspecoes.Fields[4].AsString = EmptyStr then
//        GrdInspecoes.Canvas.Brush.Color := clMaroon
//    else
//        GrdInspecoes.Canvas.Brush.Color := clHighlight;
//    GrdInspecoes.Canvas.Font.Color := clHighlightText;
//  end
//else
//  begin
    if GrdInspecoes.Fields[4].AsString = EmptyStr then
        GrdInspecoes.Canvas.Font.Color := clRed
    else
        GrdInspecoes.Canvas.Font.Color := clBlack;
//  end;
GrdInspecoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmTelaCadEquipamentosHist.GrdManutencoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  Exit;
GrdManutencoes.Columns[0].Title.Font.Size := 7;
GrdManutencoes.Columns[1].Title.Font.Size := 7;
GrdManutencoes.Columns[2].Title.Font.Size := 7;

GrdManutencoes.Columns[0].Title.Alignment := taCenter;
GrdManutencoes.Columns[1].Title.Alignment := taCenter;
GrdManutencoes.Columns[2].Title.Alignment := taCenter;

GrdManutencoes2.Columns[0].Title.Font.Size := 7;
GrdManutencoes2.Columns[1].Title.Font.Size := 7;
GrdManutencoes2.Columns[2].Title.Font.Size := 7;

GrdManutencoes2.Columns[0].Title.Alignment := taCenter;
GrdManutencoes2.Columns[1].Title.Alignment := taCenter;
GrdManutencoes2.Columns[2].Title.Alignment := taCenter;
end;

end.

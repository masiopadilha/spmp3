unit UnTelaCustosMes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.DateUtils, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, frxClass, frxDBSet, FireDAC.Stan.Param;

type
  TFrmTelaCustosMes = class(TFrmTelaPaiOkCancel)
    CDCustos: TClientDataSet;
    CDCustosMObra: TFloatField;
    CDCustosPecas: TFloatField;
    CDCustosRecursos: TFloatField;
    CDCustosTotal: TFloatField;
    DSCustos: TDataSource;
    CDCustosPneus: TFloatField;
    CDCustosExtras: TFloatField;
    PFundo: TPanel;
    CBMes: TComboBox;
    CBAno: TComboBox;
    BtnConsultar: TButton;
    frxDBCustoMes: TfrxDBDataset;
    frxRCustoMes: TfrxReport;
    CDCustosMES: TStringField;
    CDCustosANO: TStringField;
    CDCustosTercUnid: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCustosMes: TFrmTelaCustosMes;
  LDataIniMes, LDataFimMes: TDateTime;
  LCustoMObra, LCustoPecas, LCustoRecursos, LCustoExtras, LCustoPneusNovos, LCustoPneusUsados, LCustoTercUnid: Real;

implementation

{$R *.dfm}

uses UnDM, UnDmRelatorios;

procedure TFrmTelaCustosMes.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

LDataIniMes := StrToDateTime('01/' + IntToStr(CBMes.ItemIndex + 1) + '/' + CBAno.Text);
LDataFimMes := StrToDateTime(IntToStr(DaysInAMonth(StrToInt(CBAno.Text), CBMes.ItemIndex + 1)) + '/' + IntToStr(CBMes.ItemIndex + 1) + '/' + CBAno.Text + ' 23:59:59');

CDCustos.Close; CDCustos.CreateDataSet; CDCustos.Append;

LCustoMObra := 0; LCustoPecas := 0; LCustoRecursos := 0; LCustoExtras := 0; LCustoPneusNovos := 0; LCustoPneusUsados := 0;

DM.qryCustosMesMObra.Close;
DM.qryCustosMesMObra.Params[0].AsString := DM.FCodEmpresa;
DM.qryCustosMesMObra.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LDataIniMes);
//DM.qryCustosMesMObra.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LDataFimMes) + ' 23:59:59';
DM.qryCustosMesMObra.Open;

while not DM.qryCustosMesMObra.Eof = True do
  begin
    if DM.qryCustosMesMObraSITUACAO.AsString <> 'FECHADA' then
      begin
        if DM.qryCustosMesMObraHORASUTIL.IsNull = False then //Se a mão de obra foi liberada antes do fim do mês consultado
          LCustoMObra := LCustoMObra + ((DM.qryCustosMesMObraSALARIO.AsFloat/DM.qryCustosMesMObraHOFICIAIS.AsFloat) + DM.qryCustosMesMObraHORASUTIL.AsFloat)
        else
          begin
            if DM.qryCustosMesMObraSAIDA.IsNull = True then
              LCustoMObra := LCustoMObra + ((DM.qryCustosMesMObraSALARIO.AsFloat/DM.qryCustosMesMObraHOFICIAIS.AsFloat) + (MinutesBetween(DM.qryCustosMesMObraENTRADA.AsDateTime, IncMinute(LDataFimMes, 1440))/60))
            else
            if DM.qryCustosMesMObraENTRADA.IsNull = True then
              LCustoMObra := LCustoMObra + ((DM.qryCustosMesMObraSALARIO.AsFloat/DM.qryCustosMesMObraHOFICIAIS.AsFloat) + (MinutesBetween(LDataIniMes, DM.qryCustosMesMObraSAIDA.AsDateTime)/60))
          end;
      end
    else
      begin
        LCustoMObra := LCustoMObra + ((DM.qryOrdemServicoEquipeMObraUtilSALARIO.AsFloat/DM.qryCustosMesMObraHOFICIAIS.AsFloat) * DM.qryCustosMesMObraTEMPOHOMEMHORAEXEC.AsFloat);
      end;

    DM.qryCustosMesMObra.Next;
  end;

DM.qryCustosMesPecas.Close;
DM.qryCustosMesPecas.Params[0].AsString := DM.FCodEmpresa;
DM.qryCustosMesPecas.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LDataIniMes);
DM.qryCustosMesPecas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LDataFimMes) + ' 23:59:59';
DM.qryCustosMesPecas.Open;
LCustoPecas :=  DM.qryCustosMesPecasTOTALPECAS.AsFloat;

DM.qryCustosMesRecursos.Close;
DM.qryCustosMesRecursos.Params[0].AsString := DM.FCodEmpresa;
DM.qryCustosMesRecursos.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LDataIniMes);
DM.qryCustosMesRecursos.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LDataFimMes) + ' 23:59:59';
DM.qryCustosMesRecursos.Open;
LCustoRecursos :=  DM.qryCustosMesRecursosTOTALRECURSOS.AsFloat;

DM.qryCustosMesExtras.Close;
DM.qryCustosMesExtras.Params[0].AsString := DM.FCodEmpresa;
DM.qryCustosMesExtras.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LDataIniMes);
DM.qryCustosMesExtras.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LDataFimMes) + ' 23:59:59';
DM.qryCustosMesExtras.Open;
LCustoExtras :=  DM.qryCustosMesExtrasTOTALEXTRAS.AsFloat;

DM.qryCustosMesPneusNovos.Close;
DM.qryCustosMesPneusNovos.Params[0].AsString := DM.FCodEmpresa;
DM.qryCustosMesPneusNovos.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LDataIniMes);
DM.qryCustosMesPneusNovos.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LDataFimMes) + ' 23:59:59';
DM.qryCustosMesPneusNovos.Open;
LCustoPneusNovos :=  DM.qryCustosMesPneusNovosCUSTOPNEUSNOVOS.AsFloat;

DM.qryCustosMesPneusUsados.Close;
DM.qryCustosMesPneusUsados.Params[0].AsString := DM.FCodEmpresa;
DM.qryCustosMesPneusUsados.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LDataIniMes);
DM.qryCustosMesPneusUsados.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LDataFimMes) + ' 23:59:59';
DM.qryCustosMesPneusUsados.Open;
LCustoPneusUsados :=  DM.qryCustosMesPneusUsadosCONSERTOS.AsFloat;

DM.qryCustosMesTercUnid.Close;
DM.qryCustosMesTercUnid.Params[0].AsString := DM.FCodEmpresa;
DM.qryCustosMesTercUnid.Params[1].AsString := FormatDateTime('yyyy/mm/dd', LDataIniMes);
DM.qryCustosMesTercUnid.Params[2].AsString := FormatDateTime('yyyy/mm/dd', LDataFimMes) + ' 23:59:59';
DM.qryCustosMesTercUnid.Open;
LCustoTercUnid :=  DM.qryCustosMesTercUnidTOTALTERCUNID.AsFloat;

CDCustosMES.AsString     := CBMes.Text + ' de ';
CDCustosANO.AsString     := CBAno.Text;
CDCustosMObra.AsFloat    := LCustoMObra;
CDCustosPecas.AsFloat    := LCustoPecas;
CDCustosRecursos.AsFloat := LCustoRecursos;
CDCustosExtras.AsFloat   := LCustoExtras;
CDCustosPneus.AsFloat    := LCustoPneusNovos + LCustoPneusUsados;
CDCustosTotal.AsFloat    := CDCustosMObra.AsFloat + CDCustosPecas.AsFloat + CDCustosRecursos.AsFloat + CDCustosExtras.AsFloat + CDCustosPneus.AsFloat + LCustoTercUnid;
CDCustos.Post;

frxRCustoMes.ShowReport();
end;

procedure TFrmTelaCustosMes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryCustosMesMObra.Close;
DM.qryCustosMesPecas.Close;
DM.qryCustosMesRecursos.Close;
DM.qryCustosMesExtras.Close;
end;

procedure TFrmTelaCustosMes.FormCreate(Sender: TObject);
begin
  inherited;
CBMes.ItemIndex := MonthOf(DM.FDataHoraServidor) - 1;
CBAno.ItemIndex := CBAno.Items.IndexOf(IntToStr(YearOf(DM.FDataHoraServidor)));
end;

end.

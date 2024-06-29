unit UnTelaConsultaPeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.DateUtils, Data.DB,
  Datasnap.DBClient, FireDAC.Stan.Param, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTelaConsultaPeriodo = class(TFrmTelaPaiOkCancel)
    CBMes: TComboBox;
    CBAno: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaConsultaPeriodo: TFrmTelaConsultaPeriodo;

implementation

{$R *.dfm}

uses UnTelaPrincipal, UnDmRelatorios, UnDM, UnDMDashboard;

procedure TFrmTelaConsultaPeriodo.BtnOKClick(Sender: TObject);
var
LNumParadasCorret, LTotalHorasEquipDisp, LTotalHorasEquipPar, LTotalHHPrev, LTotalHHDisp: Real;
begin
  inherited;
DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

DM.FDataConsulta1 := StrToDateTime('01' + FormatFloat('/00/', CBMes.ItemIndex + 1) + CBAno.Text);
DM.FDataConsulta2 := IncMinute(StrToDateTime(FormatFloat('00', DaysInMonth(DM.FDataConsulta1)) + FormatFloat('/00/', CBMes.ItemIndex + 1) + CBAno.Text), 1439);
if DM.FDataConsulta2 > DM.FDataHoraServidor then
   DM.FDataConsulta2 := DM.FDataHoraServidor;

if (MonthOf(DM.FDataConsulta1) = MonthOf(DM.FDataHoraServidor)) and (YearOf(DM.FDataConsulta1) = YearOf(DM.FDataHoraServidor)) then
  begin
    Application.MessageBox('Mês ainda em aberto!', 'SPMP3', MB_OK + MB_ICONSTOP);
    Abort;
  end;

if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

  case FrmTelaPrincipal.Tag of
    1:
      begin
        DM.MSGAguarde('');

        DM.qryRelatGerencOS.Filtered := False;
        DM.qryRelatGerencOS.Close;
        DM.qryRelatGerencOS.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        //DM.qryRelatGerencOS.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', IncDay((DateOf(DM.FDataHoraServidor)), -30));
        //DM.qryRelatGerencOS.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
        DM.qryRelatGerencOS.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
        DM.qryRelatGerencOS.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
        DM.qryRelatGerencOS.Open; DM.qryRelatGerencOS.First;

        if DM.FTabela_auxiliar = 100 then
          begin
            DM.qryRelatGerencOS.Filtered := False;
            DM.qryRelatGerencOS.Filter   := 'CODMANUTENCAO = ' + QuotedStr(DM.FCodCombo);
            DM.qryRelatGerencOS.Filtered := True;
          end;

        if DM.FTabela_auxiliar = 110 then
          begin
            DM.qryRelatGerencOS.Filtered := False;
            DM.qryRelatGerencOS.Filter   := 'CODMOTIVOPARADA = ' + QuotedStr(DM.FCodCombo);
            DM.qryRelatGerencOS.Filtered := True;
          end;

        if DM.FTabela_auxiliar = 400 then
          begin
            DM.qryRelatGerencOS.Filtered := False;
            DM.qryRelatGerencOS.Filter   := 'CODCENTROCUSTO = ' + QuotedStr(DM.FCodCombo);
            DM.qryRelatGerencOS.Filtered := True;
          end;

        if DM.FTabela_auxiliar = 200 then
          begin
            DM.qryRelatGerencOS.Filtered := False;
            DM.qryRelatGerencOS.Filter   := 'CODOFICINA = ' + QuotedStr(DM.FCodCombo);
            DM.qryRelatGerencOS.Filtered := True;
          end;

        if DM.FTabela_auxiliar = 150 then
          begin
            DM.qryRelatGerencOS.Filtered := False;
            DM.qryRelatGerencOS.Filter   := 'CODAREA = ' + QuotedStr(DM.FCodCombo);
            DM.qryRelatGerencOS.Filtered := True;
          end;

        if DM.FTabela_auxiliar = 800 then
          begin
            DM.qryRelatGerencOS.Filtered := False;
            DM.qryRelatGerencOS.Filter   := 'CODFAMILIAEQUIP = ' + QuotedStr(DM.FCodCombo);
            DM.qryRelatGerencOS.Filtered := True;
          end;

        while not DM.qryRelatGerencOS.Eof = True do
          begin
            DM.qryRelatGerencOS.Edit;
            if DM.qryRelatGerencOSOFICINA.AsString = EmptyStr then
              begin
                DM.qryRelatGerencOSOFICINA.AsString := 'Local';
              end;
            DM.qryRelatGerencOS.Post;

            DM.qryRelatGerencOS.Next;
          end;

        DM.MSGAguarde('', False);
        if DM.qryRelatGerencOS.IsEmpty = False then
          DmRelatorios.frxRRelatGerencOS.ShowReport()
        else
          begin
            Application.MessageBox('NENHUMA INFORMAÇÃO NO PERÍODO!', 'SPMP3', MB_OK + MB_ICONEXCLAMATION);
          end;

        DM.qryRelatGerencOS.Close;
      end;
    2:
      begin
        DM.MSGAguarde('');

        DM.qryTotalEquipHora.Close;
        DM.qryTotalEquipHora.Params[0].AsString := DM.FCodEmpresa;
        DM.qryTotalEquipHora.Open;
        DM.qryTotalHomemHoraSeqHora.Open;

        DM.qryRelatGerencDispEquip.Filtered := False;
        DM.qryRelatGerencDispEquip.Close;
        DM.qryRelatGerencDispEquip.Params.ParamByName('CODEMPRESA').AsString := DM.FCodEmpresa;
        DM.qryRelatGerencDispEquip.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
        DM.qryRelatGerencDispEquip.Params.ParamByName('data2').AsString := FormatDateTime('yyyy/mm/dd hh:mm', DM.FDataConsulta2);
        DM.qryRelatGerencDispEquip.Open; DM.qryRelatGerencDispEquip.First;

        DM.MSGAguarde('', False);
        DmRelatorios.frxRRelatGerencDispEquip.ShowReport();
        DM.qryRelatGerencDispEquip.Close;
        DM.qryTotalEquipHora.Close;
        DM.qryTotalHomemHoraSeqHora.Close;
      end;
    3:
      begin
        DM.MSGAguarde('');

        DM.qryRelatGerencDespEquip.Filtered := False;
        DM.qryRelatGerencDespEquip.Close;
        DM.qryRelatGerencDespEquip.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        DM.qryRelatGerencDespEquip.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
        DM.qryRelatGerencDespEquip.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
        DM.qryRelatGerencDespEquip.Open;

        if DM.FTabela_auxiliar = 150 then
          begin
            DM.qryRelatGerencDespEquip.Filtered := False;
            DM.qryRelatGerencDespEquip.Filter   := 'CODAREA = ' + QuotedStr(DM.FCodCombo);
            DM.qryRelatGerencDespEquip.Filtered := True;
          end;

        DM.MSGAguarde('', False);
        DmRelatorios.frxRRelatGerencDespEquip.ShowReport();
        DM.qryRelatGerencDespEquip.Close;
      end;
    4:
      begin
        DMDashboard.qryMTBFEquipamentos.Close;
        DMDashboard.qryMTBFEquipamentos.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        DMDashboard.qryMTBFEquipamentos.Params.ParamByName('data1').AsString    := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
        DMDashboard.qryMTBFEquipamentos.Params.ParamByName('data2').AsString    := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
        DMDashboard.qryMTBFEquipamentos.Open;

        DmRelatorios.frxRRelatGerencMTBF.ShowReport();
        DMDashboard.qryMTBFEquipamentos.Close;
      end;
    5:
      begin
        DMDashboard.qryMTTREquipamentos.Close;
        DMDashboard.qryMTTREquipamentos.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        DMDashboard.qryMTTREquipamentos.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
        DMDashboard.qryMTTREquipamentos.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
        DMDashboard.qryMTTREquipamentos.Open;
        DmRelatorios.frxRRelatGerencMTTR.ShowReport();
        DMDashboard.qryMTTREquipamentos.Close;

      end;
    6:
      begin
        DM.MSGAguarde('');

        DM.qryTotalHomemHoraProgExec.Close;
        DM.qryTotalHomemHoraProgExec.Params[0].AsString := DM.FCodEmpresa;
        DM.qryTotalHomemHoraProgExec.Open;

//        DM.qryTotalHomemHora.Close;
//        DM.qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
//        DM.qryTotalHomemHora.Open;
//        DM.qryTotalHomemHoraSeqHora.Open;

        LTotalHHPrev := DM.qryTotalHomemHoraProgExecTOTALHHPROG.AsFloat;// - CDCadTotalHomemHoraProgExecTOTALHHEXEC.AsFloat; //Total de homem/hora programado
        //LTotalHHDisp := DM.qryTotalHomemHoraSUMHOFICIAIS.AsFloat;//DM.HorasCalendario(0, EmptyStr);
        LTotalHHDisp := Round(DM.TotalHomemHoraDisp(DM.FDataHoraServidor, EmptyStr, EmptyStr));

        if LTotalHHDisp < 1 then LTotalHHDisp := 1;

        DM.FDMemTRelatGerencBacklog.Close; DM.FDMemTRelatGerencBacklog.CreateDataSet;
        DM.FDMemTRelatGerencBacklog.Append;
        DM.FDMemTRelatGerencBacklogCODIGO.AsString    := DM.FCodCombo;
        DM.FDMemTRelatGerencBacklogDESCRICAO.AsString := DM.FValorCombo;
        DM.FDMemTRelatGerencBacklogVALOR.AsString     := FormatFloat('0.000', LTotalHHPrev/(LTotalHHDisp)) + ' Dias';
        DM.FDMemTRelatGerencBacklogDATA1.AsString     := FormatDateTime('dd/mm/yyyy', DM.FDataConsulta1);
        DM.FDMemTRelatGerencBacklogDATA2.AsString     := FormatDateTime('dd/mm/yyyy', DM.FDataConsulta2);
        DM.FDMemTRelatGerencBacklog.Post;

        DM.MSGAguarde('', False);
        DmRelatorios.frxRRelatGerencBacklog.ShowReport();
        DM.FDMemTRelatGerencBacklog.Close;

//        DM.qryTotalHomemHora.Close;
//        DM.qryTotalHomemHoraSeqHora.Close;
        DM.qryTotalHomemHoraProgExec.Close;
      end;
  end;
end;

procedure TFrmTelaConsultaPeriodo.FormCreate(Sender: TObject);
begin
  inherited;
CBMes.ItemIndex := MonthOf(DM.FDataHoraServidor) - 2;
CBAno.ItemIndex := CBAno.Items.IndexOf(IntToStr(YearOf(DM.FDataHoraServidor)));
end;

end.

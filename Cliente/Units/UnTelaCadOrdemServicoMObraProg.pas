unit UnTelaCadOrdemServicoMObraProg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, System.DateUtils, Vcl.DBCtrls, Data.DB, FireDAC.Stan.Param,
  JvExComCtrls, JvDateTimePicker;

type
  TFrmTelaCadOrdemServicoMObraProg = class(TFrmTelaPaiOkCancel)
    PBase: TPanel;
    GrdEquipeMObra: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    EdtHoraProgIni: TDateTimePicker;
    GrdEquipeMObraFunc: TDBGrid;
    BtnDesprogramar: TButton;
    BtnProgramar: TButton;
    GrdEquipe: TDBGrid;
    EdtHoraProgFin: TDateTimePicker;
    Label3: TLabel;
    LblTempoPrevisto: TLabel;
    EdtDataProgIni: TJvDateTimePicker;
    EdtDataProgFin: TJvDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdEquipeMObraKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKClick(Sender: TObject);
    procedure GrdEquipeMObraFuncKeyPress(Sender: TObject; var Key: Char);
    procedure BtnProgramarClick(Sender: TObject);
    procedure EdtDataProgIniiChange(Sender: TObject);
    procedure BtnDesprogramarClick(Sender: TObject);
    procedure GrdEquipeMObraFuncDblClick(Sender: TObject);
    procedure GrdEquipeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDataProgFinChange(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FrmTelaCadOrdemServicoMObraProg: TFrmTelaCadOrdemServicoMObraProg;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServicoMObraProgHHDisp,
  UnTelaCadOrdemServicoMObraExecDisp, UnDM, UnTelaCadOrdemServico;

procedure TFrmTelaCadOrdemServicoMObraProg.BtnDesprogramarClick(Sender: TObject);
begin
  inherited;
  if (DM.qryOrdemServicoSITUACAO.AsString <> 'PROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'REPROGRAMADA') then Exit;

  if Application.MessageBox('Deseja realmente desprogramar a O.S.?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    DM.qryOrdemServicoEquipe.First;
    while not DM.qryOrdemServicoEquipe.Eof = True do
      begin
        DM.qryOrdemServicoEquipeMObra.First;
        while not DM.qryOrdemServicoEquipeMObra.Eof = True do
        begin
          DM.qryOrdemServicoMObraDisp.Filtered := False;
          DM.qryOrdemServicoMObraProg.First;
          while not DM.qryOrdemServicoMObraProg.Eof = True do
          begin
            if DM.qryOrdemServicoMObraDisp.Locate('MATRICULA', DM.qryOrdemServicoMObraProgMATRICULA.AsString, []) = True then
            begin
              //Verifica se a mão de obra não está programada em outra OS, se não estiver define status de Programada = NÃO
              DM.qryAuxiliar.Close;
              DM.qryAuxiliar.SQL.Clear;
              DM.qryAuxiliar.SQL.Add('SELECT OMF.MATRICULA FROM `ordemservico` O, `ordemservicoequipemobrafunc` OMF WHERE OMF.CODORDEMSERVICO = O.CODIGO'
                                     + ' AND O.SITUACAO = ''PROGRAMADA'' AND O.CODEMPRESA = :CODEMPRESA AND OMF.MATRICULA = :MATRICULA AND O.CODIGO <> :CODORDEMSERVICO');
              DM.qryAuxiliar.Params.ParamByName('CODEMPRESA').AsString      := DM.FCodEmpresa;
              DM.qryAuxiliar.Params.ParamByName('MATRICULA').AsString       := DM.qryOrdemServicoMObraProgMATRICULA.AsString;
              DM.qryAuxiliar.Params.ParamByName('CODORDEMSERVICO').AsString := DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsString;
              DM.qryAuxiliar.Open;
              DM.qryOrdemServicoMObraDisp.Edit;
              if DM.qryAuxiliar.IsEmpty = True then
                DM.qryOrdemServicoMObraDispPROGRAMADO.AsString := 'N';
              DM.qryOrdemServicoMObraDisp.Post;
            end;
            DM.qryOrdemServicoMObraProg.Next;
          end;
        DM.qryOrdemServicoEquipeMObra.Next;
        end;
        DM.qryOrdemServicoEquipe.Next;
      end;

    DM.qryOrdemServico.Edit;
    DM.qryOrdemServicoSITUACAO.AsString := 'DESPROGRAMADA';
    DM.qryOrdemServicoDATAPROGINI.Clear;
    DM.qryOrdemServicoDATAPROGFIN.Clear;
    DM.qryOrdemServicoQTDEREPROG.AsInteger := DM.qryOrdemServicoQTDEREPROG.AsInteger + 1;
    DM.qryOrdemServico.Post;

    DM.qryOrdemServicoGerencia.Edit;
    DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'DESPROGRAMADA';
    DM.qryOrdemServicoGerencia.Post;

    DM.qryAuxiliar.Close;
  end;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.BtnFecharClick(Sender: TObject);
var
  LDataConsultaIni, LDataConsultaFin : String;
begin
  inherited;
  if (DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA') or (DM.qryOrdemServicoSITUACAO.AsString = 'REPROGRAMADA') then
  begin
    LDataConsultaIni := FormatDateTime('dd/mm/yyyy', EdtDataProgIni.Date);
    LDataConsultaIni := LDataConsultaIni + ' ' + TimeToStr(EdtHoraProgIni.Time);
    LDataConsultaFin := FormatDateTime('dd/mm/yyyy', EdtDataProgFin.Date);
    LDataConsultaFin := LDataConsultaFin + ' ' + TimeToStr(EdtHoraProgFin.Time);
    if (StrToDateTime(LDataConsultaIni)) <> (DM.qryOrdemServicoDATAPROGINI.AsDateTime) then
      if StrToDateTime(LDataConsultaIni) < DM.FDataHoraServidor then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption    := 'DATA INFERIOR A DATA ATUAL!';
        EdtDataProgIni.SetFocus;
        Exit;
      end;

    //Verifica o tempo previsto da OS para calcular o data programada para finalizar o serviço
    DM.qryOrdemServico.Edit;
    if DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA' then
      DM.qryOrdemServicoSITUACAO.AsString := 'REPROGRAMADA'
    else
      DM.qryOrdemServicoSITUACAO.AsString    := 'PROGRAMADA';
    DM.qryOrdemServicoDATAPROGINI.AsString := LDataConsultaIni;
    DM.qryOrdemServicoDATAPROGFIN.AsString := LDataConsultaFin;
    DM.qryOrdemServico.Post;

    if DM.qryOrdemServicoGerencia.Locate('CODIGO', DM.qryOrdemServicoCODIGO.AsInteger,[]) = True then
    begin
      DM.qryOrdemServicoGerencia.Edit;
      DM.qryOrdemServicoGerenciaDATAPROGINI.AsString := LDataConsultaIni;
      DM.qryOrdemServicoGerencia.Post;
    end;
  end;

end;

procedure TFrmTelaCadOrdemServicoMObraProg.BtnOKClick(Sender: TObject);
begin
  inherited;
  if EdtDataProgIni.Date = 0 then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'ORDEM DE SERVIÇO NÃO PROGRAMADA!';
    BtnProgramar.SetFocus;
    Exit;
  end;
  if DM.qryOrdemServicoDATAPROGFIN.AsDateTime < DM.qryOrdemServicoDATAPROGINI.AsDateTime then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption    := 'DATA INFERIOR A DATA INICIAL!';
    EdtDataProgFin.SetFocus;
    Exit;
  end;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.BtnProgramarClick(Sender: TObject);
var
  LDataConsultaIni, LDataConsultaFin : String;
  LTotalHHNec, LTotalHHDisp, LTotalHorasProg : Real;
begin
  inherited;
  Try
    PAuxiliares.Caption := '';
    LTotalHorasProg := 0;
    if (DM.qryOrdemServicoSITUACAO.AsString = 'PROGRAMADA') or (DM.qryOrdemServicoSITUACAO.AsString = 'REPROGRAMADA') then Exit;

    LDataConsultaIni := FormatDateTime('dd/mm/yyyy', EdtDataProgIni.Date);
    LDataConsultaIni := LDataConsultaIni + ' ' + TimeToStr(EdtHoraProgIni.Time);
    LDataConsultaFin := FormatDateTime('dd/mm/yyyy', EdtDataProgFin.Date);
    LDataConsultaFin := LDataConsultaFin + ' ' + TimeToStr(EdtHoraProgFin.Time);

    if StrToDateTime(LDataConsultaIni) < DM.FDataHoraServidor then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption    := 'DATA INFERIOR A DATA ATUAL!';
      EdtDataProgIni.SetFocus;
      Exit;
    end;

    DM.FDataConsultaMObra := StrToDateTime(LDataConsultaIni);

    //Calcula homem/hora total da OS e o homem/hora total disponível
    DM.qryOrdemServicoEquipeMObra.First;
    while not DM.qryOrdemServicoEquipeMObra.Eof = True do
    begin
      LTotalHHNec  := DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;
      LTotalHHDisp := 0;

      if DM.qryOrdemServicoEquipeMObraCODCALENDARIO.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'CALENDÁRIO NÃO DEFINIDO!';
        GrdEquipeMObra.SetFocus; GrdEquipeMObra.SelectedIndex := 3;
        Exit;
      end;

     if DM.qryOrdemServicoMObraProg.IsEmpty = True then
     begin
       PAuxiliares.Font.Color := clRed;
       PAuxiliares.Caption := 'MÃO DE OBRA NÃO CADASTRADA!';
       GrdEquipeMObraFunc.SetFocus; GrdEquipeMObraFunc.SelectedIndex := 0;
       Exit;
     end;

     DM.qryOrdemServicoMObraProg.First;
     while not DM.qryOrdemServicoMObraProg.Eof = True do
     begin
        LTotalHHDisp := LTotalHHDisp + DM.qryOrdemServicoMObraProgTOTALHOMEMHORA.AsFloat + DM.qryOrdemServicoMObraProgQTDEHENORMAL.AsFloat + DM.qryOrdemServicoMObraProgQTDEHEFERIADO.AsFloat;
        if DM.qryOrdemServicoMObraProgMATRICULA.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'MÃO DE OBRA NÃO CADASTRADA!';
          GrdEquipeMObraFunc.SetFocus; GrdEquipeMObraFunc.SelectedIndex := 0;
          Exit;
        end;

        DM.qryOrdemServicoMObraProg.Next
      end;

      if LTotalHHNec > LTotalHHDisp then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'TOTAL HOMEM/HORA NÃO PREENCHIDO!';
        GrdEquipeMObraFunc.SetFocus; GrdEquipeMObraFunc.SelectedIndex := 2;
        Exit;
      end;

      DM.qryOrdemServicoEquipeMObra.Next;
    end;

    //Verifica o tempo previsto da OS para calcular o data programada para finalizar o serviço
    DM.qryOrdemServico.Edit;
    if DM.qryOrdemServicoSITUACAO.AsString = 'DESPROGRAMADA' then
      DM.qryOrdemServicoSITUACAO.AsString := 'REPROGRAMADA'
    else
      DM.qryOrdemServicoSITUACAO.AsString    := 'PROGRAMADA';
    DM.qryOrdemServicoDATAPROGINI.AsString   := LDataConsultaIni;
    DM.qryOrdemServicoDATAPROGFIN.AsDateTime := IncMinute(StrToDateTime(LDataConsultaIni), Round(DM.qryOrdemServicoTEMPOPREVISTO.AsFloat * 60));
    DM.qryOrdemServico.Post;

    DM.FTotalHHDisp := Round(DM.TotalHomemHoraDisp(DM.qryOrdemServicoDATAPROGINI.AsDateTime, EmptyStr, EmptyStr));

    DM.qryCalendarioOSProgramadas.Close;
    DM.qryCalendarioOSProgramadas.Params[0].AsString := DM.FCodEmpresa;
    DM.qryCalendarioOSProgramadas.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.qryOrdemServicoDATAPROGINI.AsDateTime);
    DM.qryCalendarioOSProgramadas.Params[2].AsString := FormatDateTime('yyyy/mm/dd hh:mm', DM.qryOrdemServicoDATAPROGINI.AsDateTime) + ' 23:59';
    DM.qryCalendarioOSProgramadas.Open;
    while not DM.qryCalendarioOSProgramadas.Eof = True do
    begin
      LTotalHorasProg := LTotalHorasProg + DM.qryCalendarioOSProgramadasTEMPOPREVISTO.AsFloat;
      DM.qryCalendarioOSProgramadas.Next;
    end;

    if LTotalHorasProg > DM.FTotalHHDisp then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption := 'HORAS PROGRAMADA PARA ESSA DATA ACIMA DO PERMITIDO!';
      Exit;
    end;

    DM.qryOrdemServicoGerencia.Edit;
    if (DM.qryOrdemServicoGerenciaSITUACAO.AsString <> 'PROGRAMADA') and ((DM.qryOrdemServicoGerenciaSITUACAO.AsString <> 'REPROGRAMADA')) then
      DM.qryOrdemServicoGerenciaSITUACAO.AsString    := 'PROGRAMADA';
    DM.qryOrdemServicoGerenciaDATAPROGINI.AsString := DM.qryOrdemServicoDATAPROGINI.AsString;
    DM.qryOrdemServicoGerencia.Post;
    if FrmTelaCadOrdemServico <> nil then
      begin
        FrmTelaCadOrdemServico.PSituacao.Caption    := DM.qryOrdemServicoSITUACAO.AsString;
        FrmTelaCadOrdemServico.PSituacao.Color      := clBlue;
        FrmTelaCadOrdemServico.PSituacao.Font.Color := clWhite;
      end;
    EdtDataProgFin.Date := DM.qryOrdemServicoDATAPROGFIN.AsDateTime;
    EdtHoraProgFin.Time := DM.qryOrdemServicoDATAPROGFIN.AsDateTime;
    PAuxiliares.Font.Color := clBlue;
    PAuxiliares.Caption := 'PROGRAMAÇÃO REALIZADA!';
  Except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao realizar a programação. ' + Screen.ActiveForm.Name + ' ', E.ClassName, E.Message);
      Application.MessageBox('Falha ao realizar a programação, por favor, repita a operação. Caso persista o erro, contate o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  End;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.EdtDataProgFinChange(
  Sender: TObject);
var
  LDataConsultaIni, LDataConsultaFin: String;
begin
  inherited;
  PAuxiliares.Font.Color := clGray;
  PAuxiliares.Caption := EmptyStr;
  LDataConsultaIni := FormatDateTime('dd/mm/yyyy', EdtDataProgIni.Date);
  LDataConsultaIni := LDataConsultaIni + ' ' + TimeToStr(EdtHoraProgIni.Time);
  LDataConsultaFin := FormatDateTime('dd/mm/yyyy', EdtDataProgFin.Date);
  LDataConsultaFin := LDataConsultaFin + ' ' + TimeToStr(EdtHoraProgFin.Time);
  if MinutesBetween(StrToDateTime(LDataConsultaIni), StrToDateTime(LDataConsultaFin)) < (Round(DM.qryOrdemServicoGerenciaTEMPOPREVISTO.AsFloat * 60)) then
  begin
    EdtDataProgFin.Date := DateOf(IncMinute(StrToDateTime(LDataConsultaIni),  Round(DM.qryOrdemServicoGerenciaTEMPOPREVISTO.AsFloat * 60)));
    EdtHoraProgFin.Time := TimeOf(IncMinute(StrToDateTime(LDataConsultaIni),  Round(DM.qryOrdemServicoGerenciaTEMPOPREVISTO.AsFloat * 60)));
  end;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.EdtDataProgIniiChange(
  Sender: TObject);
var
  LDataConsultaIni: String;
begin
  inherited;
  PAuxiliares.Font.Color := clGray;
  PAuxiliares.Caption := EmptyStr;
  LDataConsultaIni := FormatDateTime('dd/mm/yyyy', EdtDataProgIni.Date);
  LDataConsultaIni := LDataConsultaIni + ' ' + TimeToStr(EdtHoraProgIni.Time);
  EdtDataProgFin.Date := DateOf(IncMinute(StrToDateTime(LDataConsultaIni),  Round(DM.qryOrdemServicoGerenciaTEMPOPREVISTO.AsFloat * 60)));
  EdtHoraProgFin.Time := TimeOf(IncMinute(StrToDateTime(LDataConsultaIni),  Round(DM.qryOrdemServicoGerenciaTEMPOPREVISTO.AsFloat * 60)));
end;

procedure TFrmTelaCadOrdemServicoMObraProg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
  DM.qryOrdemServicoMObraDisp.Close;
  DM.qryOrdemServicoMObraProg.Close;
  DM.qryOrdemServicoEquipeMObra.Close;
  DM.qryOrdemServicoEquipe.Close;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.FormCreate(Sender: TObject);
var
  LDataConsultaIni: String;
begin
  inherited;
  DM.qryOrdemServicoEquipe.Open;
  DM.qryOrdemServicoEquipeMObra.Open;
  DM.qryOrdemServicoMObraProg.Open;

  DM.qryOrdemServicoMObraDisp.Close;
  DM.qryOrdemServicoMObraDisp.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
  DM.qryOrdemServicoMObraDisp.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
  DM.qryOrdemServicoMObraDisp.Params[2].AsString := DM.FCodEmpresa;
  if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
    DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'AUTÔNOMA'
  else
    DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'OPERACIONAL';
  DM.qryOrdemServicoMObraDisp.Open;

  if DM.qryOrdemServicoDATAPROGINI.AsDateTime = 0 then
  begin
    LDataConsultaIni := FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor);
    LDataConsultaIni := LDataConsultaIni + ' ' + FormatDateTime('hh:mm', DM.FDataHoraServidor);
    EdtDataProgIni.MinDate := DateOf(StrToDateTime(LDataConsultaIni));
    EdtHoraProgIni.MinDate := TimeOf(StrToDateTime(LDataConsultaIni));
    EdtDataProgIni.Date    := StrToDateTime(LDataConsultaIni);
    EdtHoraProgIni.Time    := StrToDateTime(LDataConsultaIni);
    EdtDataProgFin.Date := DateOf(IncMinute(StrToDateTime(LDataConsultaIni),  Round(DM.qryOrdemServicoGerenciaTEMPOPREVISTO.AsFloat * 60)));
    EdtHoraProgFin.Time := TimeOf(IncMinute(StrToDateTime(LDataConsultaIni),  Round(DM.qryOrdemServicoGerenciaTEMPOPREVISTO.AsFloat * 60)));
  end else
  begin
    EdtDataProgIni.Date    := DM.qryOrdemServicoDATAPROGINI.AsDateTime;
    EdtHoraProgIni.Time    := DM.qryOrdemServicoDATAPROGINI.AsDateTime;
    EdtDataProgIni.MinDate := DateOf(DM.qryOrdemServicoDATAPROGINI.AsDateTime);
    EdtHoraProgIni.MinDate := TimeOf(DM.qryOrdemServicoDATAPROGINI.AsDateTime);
    EdtDataProgFin.Date    := DM.qryOrdemServicoDATAPROGFIN.AsDateTime;
    EdtHoraProgFin.Time    := DM.qryOrdemServicoDATAPROGFIN.AsDateTime;
    EdtDataProgFin.MinDate := DateOf(DM.qryOrdemServicoDATAPROGFIN.AsDateTime);
    EdtHoraProgFin.MinDate := TimeOf(DM.qryOrdemServicoDATAPROGFIN.AsDateTime);
  end;

  LblTempoPrevisto.Caption := FormatFloat(',0.00', DM.qryOrdemServicoTEMPOPREVISTO.AsFloat) + ' hora(s)';
end;

procedure TFrmTelaCadOrdemServicoMObraProg.GrdEquipeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.GrdEquipeMObraFuncDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryOrdemServicoMObraProg.IsEmpty = False then
    DM.qryOrdemServicoMObraProg.Delete;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.GrdEquipeMObraFuncKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if ((GrdEquipeMObraFunc.SelectedIndex = 0) or (GrdEquipeMObraFunc.SelectedIndex = 1)
    or (GrdEquipeMObraFunc.SelectedIndex = 5)) and (Key <> #13) then
    begin
      Key := #0;
      Exit;
    end;

  if ((GrdEquipeMObraFunc.SelectedIndex = 2) or (GrdEquipeMObraFunc.SelectedIndex = 3)
    or (GrdEquipeMObraFunc.SelectedIndex = 4)) and (DM.qryOrdemServicoMObraProgMATRICULA.AsString = EmptyStr)
      and (Key <> #13) then
      begin
        Key := #0;
        Exit;
      end;

  if ((GrdEquipeMObraFunc.SelectedIndex = 0) or (GrdEquipeMObraFunc.SelectedIndex = 1)) and (Key = #13) then
  begin
    if DM.qryOrdemServicoEquipeMObraCODCALENDARIO.AsString = EmptyStr then
    begin
      GrdEquipeMObra.SetFocus;
      GrdEquipeMObra.SelectedIndex := 2;
      Exit;
    end;

    DM.qryOrdemServicoMObraDisp.Filtered := False;
    DM.qryOrdemServicoMObraDisp.Filter   := 'CODCARGO = '+ QuotedStr(DM.qryOrdemServicoEquipeMObraCODCARGO.AsString) + ' AND CODCALENDARIO = ' + QuotedStr(DM.qryOrdemServicoEquipeMObraCODCALENDARIO.AsString);
    DM.qryOrdemServicoMObraDisp.Filtered := True;

    Try
      Application.CreateForm(TFrmTelaCadOrdemServicoMObraDisp, FrmTelaCadOrdemServicoMObraDisp);
      FrmTelaCadOrdemServicoMObraDisp.ShowModal;
    Finally
      DM.qryOrdemServicoMObraProg.Edit;
      if FrmTelaCadOrdemServicoMObraDisp.ModalResult = 2 then
        if DM.qryOrdemServicoMObraDispMATRICULA.AsString <> EmptyStr then
        begin
          if DM.qryOrdemServicoMObraProg.Locate('MATRICULA', DM.qryOrdemServicoMObraDispMATRICULA.AsString, []) = False then
          begin
            DM.qryOrdemServicoMObraProg.Append;
            DM.qryOrdemServicoMObraProgCODEMPRESA.AsString       := DM.FCodEmpresa;
            DM.qryOrdemServicoMObraProgCODEQUIPE.AsString        := DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsString;
            DM.qryOrdemServicoMObraProgCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger;
            DM.qryOrdemServicoMObraProgCODCARGO.AsString         := DM.qryOrdemServicoEquipeMObraCODCARGO.AsString;
            DM.qryOrdemServicoMObraProgTOTALHOMEMHORA.AsFloat    := DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;
            DM.qryOrdemServicoMObraProgQTDEHENORMAL.AsFloat      := 0;
            DM.qryOrdemServicoMObraProgQTDEHEFERIADO.AsFloat     := 0;
            if DM.qryOrdemServicoMObraDispEQUIPESP.AsString = DM.qryOrdemServicoEQUIPAMENTO.AsString then
              DM.qryOrdemServicoMObraProgESPECIALISTA.AsString   := 'S'
            else
              DM.qryOrdemServicoMObraProgESPECIALISTA.AsString   := 'N';
            DM.qryOrdemServicoMObraProgMATRICULA.AsString        := DM.qryOrdemServicoMObraDispMATRICULA.AsString;
            DM.qryOrdemServicoMObraProgNOME.AsString             := DM.qryOrdemServicoMObraDispNOME.AsString;
            DM.qryOrdemServicoMObraProg.Post;

            DM.qryOrdemServicoMObraDisp.Edit;
            DM.qryOrdemServicoMObraDispPROGRAMADO.AsString := 'S';
            DM.qryOrdemServicoMObraDisp.Post;

            GrdEquipeMObraFunc.SelectedIndex := 2;
          end;
        end;
      FreeAndNil(FrmTelaCadOrdemServicoMObraDisp);
    End;
  end;
end;

procedure TFrmTelaCadOrdemServicoMObraProg.GrdEquipeMObraKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if ((GrdEquipeMObra.SelectedIndex = 1) or (GrdEquipeMObra.SelectedIndex = 2) and (Key <> #9) and (Key <> #13)) then
  begin
    Key := #0;
    Exit;
  end;

  if ((GrdEquipeMObra.SelectedIndex = 1) or (GrdEquipeMObra.SelectedIndex = 2) and (Key <> #9) and (Key <> #13)) then
  begin
    Key := #0;
    Exit;
  end;

  if (GrdEquipeMObra.SelectedIndex = 2) and (DM.qryOrdemServicoMObraProg.IsEmpty = True) and (Key = #13) then
  begin
    if DM.qryOrdemServicoEquipeMObraCODCARGO.AsString = '' then Exit;
    DM.FTabela_auxiliar := 230;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      if DM.FCodCombo <> EmptyStr then
        begin
          DM.qryOrdemServicoEquipeMObra.Edit;
          DM.qryOrdemServicoEquipeMObraCODCALENDARIO.AsString := DM.FCodCombo;
          DM.qryOrdemServicoEquipeMObraCALENDARIO.AsString    := DM.FValorCombo;
          DM.qryOrdemServicoEquipeMObra.Post;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;


end.

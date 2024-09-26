unit UnTelaCadOrdemServicoMObraExec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Data.DB, System.DateUtils,
  Vcl.DBCtrls, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoMObraExec = class(TFrmTelaPaiOkCancel)
    GrdEquipe: TDBGrid;
    GrdEquipeMObraUtil: TDBGrid;
    GrdEquipeMObra: TDBGrid;
    GrdMovimen: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdEquipeMObraKeyPress(Sender: TObject; var Key: Char);
    procedure GrdEquipeMObraDblClick(Sender: TObject);
    procedure GrdMovimenDblClick(Sender: TObject);
    procedure GrdEquipeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdMovimenKeyPress(Sender: TObject; var Key: Char);
    procedure GrdEquipeMObraUtilDblClick(Sender: TObject);
    procedure GrdEquipeMObraUtilKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoMObraExec: TFrmTelaCadOrdemServicoMObraExec;

implementation

{$R *.dfm}

uses UnTelaCadOrdemServicoMObraExecDisp, UnTelaConsulta,
  UnTelaCadOrdemServicoMObraProgHHDisp, UnDM;

procedure TFrmTelaCadOrdemServicoMObraExec.GrdEquipeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TFrmTelaCadOrdemServicoMObraExec.GrdEquipeMObraDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryOrdemServicoEquipeMObra.IsEmpty = False then
  begin
    DM.qryOrdemServicoEquipeMObra.Delete;
  end;
end;

procedure TFrmTelaCadOrdemServicoMObraExec.GrdEquipeMObraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  PAuxiliares.Font.Color := clGray;
  PAuxiliares.Caption := EmptyStr;

  if ((GrdEquipeMObra.SelectedIndex = 0) or (GrdEquipeMObra.SelectedIndex = 2)) and (Key <> #13) or (DM.qryOrdemServicoEquipe.IsEmpty = True) then
  begin
    Key := #0;
    Exit;
  end;

  if (Key = #13) and (GrdEquipeMObra.SelectedIndex = 0) then
  begin
    DM.qryOrdemServicoEquipe.Edit;
    DM.qryOrdemServicoEquipe.Post;

    DM.FTabela_auxiliar := 130;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryOrdemServicoEquipeMObra.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoEquipeMObra.Locate('CODCARGO', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoEquipe.Edit;
              DM.qryOrdemServicoEquipe.Post;

              DM.qryOrdemServicoEquipeMObra.Append;
//              DM.qryOrdemServicoEquipeMObraCODIGO.AsInteger          := DM.qryOrdemServicoEquipeMObra.RecordCount + 1;
              DM.qryOrdemServicoEquipeMObraCODEMPRESA.AsString       := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger;
              DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsInteger       := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
              DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat    := DM.qryOrdemServicoEquipeTEMPO.AsFloat;
              DM.qryOrdemServicoEquipeMObraCODCARGO.AsString         := DM.FCodCombo;
              DM.qryOrdemServicoEquipeMObraCARGO.AsString            := DM.FValorCombo;
              DM.qryOrdemServicoEquipeMObra.Post;

              GrdEquipeMObra.SelectedIndex := 1;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;

  if (GrdEquipeMObra.SelectedIndex = 2) // and (DM.qryOrdemServicoEquipeMObraUtil.IsEmpty = True)
    and (Key = #13) and (DM.qryOrdemServicoEquipeMObraCODCARGO.AsString <> EmptyStr) then
    begin
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

          if DM.qryOrdemServicoEquipeMObraUtil.IsEmpty = False then
          begin
            DM.qryOrdemServicoEquipeMObraUtil.First;
            while not DM.qryOrdemServicoEquipeMObraUtil.IsEmpty = True do
              DM.qryOrdemServicoEquipeMObraUtil.Delete;
          end;
        end;
        FreeAndNil(FrmTelaAuxiliar);
      End;
    end;
end;

procedure TFrmTelaCadOrdemServicoMObraExec.GrdEquipeMObraUtilDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryOrdemServicoEquipeMObraUtil.IsEmpty = False then
  begin
    DM.qryOrdemServicoEquipeMObraUtil.Delete;
  end;
end;

procedure TFrmTelaCadOrdemServicoMObraExec.GrdEquipeMObraUtilKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if ((GrdEquipeMObraUtil.SelectedIndex = 0) or (GrdEquipeMObraUtil.SelectedIndex = 1)) and (Key <> #13) then
  begin
    Key := #0;
    Exit;
  end;

if ((GrdEquipeMObraUtil.SelectedIndex = 2) or (GrdEquipeMObraUtil.SelectedIndex = 3) or (GrdEquipeMObraUtil.SelectedIndex = 4))
     and (DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString = EmptyStr)
       and (Key <> #13) then
         begin
           Key := #0;
           Exit;
         end;

if ((GrdEquipeMObraUtil.SelectedIndex = 0) or (GrdEquipeMObraUtil.SelectedIndex = 1)) and (Key = #13) then
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
      if FrmTelaCadOrdemServicoMObraDisp.ModalResult = 2 then
        if DM.qryOrdemServicoMObraDispMATRICULA.AsString <> EmptyStr then
          begin
            if DM.qryOrdemServicoEquipeMObraUtil.Locate('MATRICULA', DM.qryOrdemServicoMObraDispMATRICULA.AsString, []) = False then
              begin
                DM.qryOrdemServicoEquipeMObraUtil.Append;
                DM.qryOrdemServicoEquipeMObraUtilCODEMPRESA.AsString       := DM.FCodEmpresa;
                DM.qryOrdemServicoEquipeMObraUtilCODEQUIPE.AsString        := DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsString;
                DM.qryOrdemServicoEquipeMObraUtilCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger;
                DM.qryOrdemServicoEquipeMObraUtilCODCARGO.AsString         := DM.qryOrdemServicoEquipeMObraCODCARGO.AsString;
                DM.qryOrdemServicoEquipeMObraUtilCODCALENDARIO.AsString    := DM.qryOrdemServicoEquipeMObraCODCALENDARIO.AsString;
                DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat    := DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;
                DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat      := 0;
                DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat     := 0;
                if (DM.qryOrdemServicoMObraDispEQUIPESP.AsString = DM.qryOrdemServicoEQUIPAMENTO.AsString) and (DM.qryOrdemServicoMObraDispEQUIPESP.AsString <> '') then
                  DM.qryOrdemServicoEquipeMObraUtilESPECIALISTA.AsString   := 'S'
                else
                  DM.qryOrdemServicoEquipeMObraUtilESPECIALISTA.AsString   := 'N';
                DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString        := DM.qryOrdemServicoMObraDispMATRICULA.AsString;
                DM.qryOrdemServicoEquipeMObraUtilNOME.AsString             := DM.qryOrdemServicoMObraDispNOME.AsString;
                DM.qryOrdemServicoEquipeMObraUtil.Post;

                //Incluir primeira entrada automáticamente

                DM.qryDataHoraServidor.Refresh;
                DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

                DM.qryOrdemServicoEquipeMObraMovim.Append;
                DM.qryOrdemServicoEquipeMObraMovimCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger;
                DM.qryOrdemServicoEquipeMObraMovimCODEQUIPE.AsString        := DM.qryOrdemServicoEquipeCODIGO.AsString;
                DM.qryOrdemServicoEquipeMObraMovimCODCARGO.AsString         := DM.qryOrdemServicoEquipeMObraCODCARGO.AsString;
                DM.qryOrdemServicoEquipeMObraMovimMATRICULA.AsString        := DM.qryOrdemServicoMObraDispMATRICULA.AsString;
                DM.qryOrdemServicoEquipeMObraMovimNOME.AsString             := DM.qryOrdemServicoMObraDispNOME.AsString;
                DM.qryOrdemServicoEquipeMObraMovimENTRADA.AsDateTime        := DM.FDataHoraServidor;
                DM.qryOrdemServicoEquipeMObraMovimEQUIPE.AsString           := DM.qryOrdemServicoEquipeCODEQUIPE.AsString;
                DM.qryOrdemServicoEquipeMObraMovimCODEMPRESA.AsString       := DM.FCodEmpresa;
                DM.qryOrdemServicoEquipeMObraMovim.Post;

                DM.qryOrdemServicoMObraDisp.Edit;
                DM.qryOrdemServicoMObraDispOCUPADO.AsString := 'S';
                DM.qryOrdemServicoMObraDisp.Post;

                GrdEquipeMObraUtil.SelectedIndex := 2;
              end;
          end;
      FreeAndNil(FrmTelaCadOrdemServicoMObraDisp);
    End;
  end;

end;

procedure TFrmTelaCadOrdemServicoMObraExec.BtnFecharClick(Sender: TObject);
begin
  inherited;
  DM.qryOrdemServico.Edit;
  DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat := 0;

  DM.qryOrdemServicoEquipe.First;
  if DM.qryOrdemServicoEquipe.IsEmpty = False then
  begin
    while not DM.qryOrdemServicoEquipe.Eof = True do
    begin
      if DM.qryOrdemServicoEquipeMObra.IsEmpty = False then
      begin
        DM.qryOrdemServicoEquipeMObra.First;
        while not DM.qryOrdemServicoEquipeMObra.Eof = True do
        begin
          if DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat < DM.qryOrdemServicoEquipeTEMPO.AsFloat then
          begin
            DM.qryOrdemServicoEquipeMObra.Edit;
            DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat := DM.qryOrdemServicoEquipeTEMPO.AsFloat;
            DM.qryOrdemServicoEquipeMObra.Post;
          end;

          DM.qryOrdemServicoEquipeMObraUtil.First;
          while not DM.qryOrdemServicoEquipeMObraUtil.Eof = True do
          begin
            if DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat > DM.qryOrdemServicoEquipeTEMPO.AsFloat then
            begin
              DM.qryOrdemServicoEquipeMObraUtil.Edit;
              DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat := DM.qryOrdemServicoEquipeTEMPO.AsFloat;
              DM.qryOrdemServicoEquipeMObraUtil.Post;
            end;

            DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat := DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat + DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat;
            DM.qryOrdemServicoEquipeMObraUtil.Next
          end;
          DM.qryOrdemServicoEquipeMObra.Next;
        end;
      end else
      begin
        DM.qryOrdemServicoTEMPOHOMEMHORA.AsFloat := 0;
      end;

      DM.qryOrdemServicoEquipe.Next;
    end;
  end;

end;

procedure TFrmTelaCadOrdemServicoMObraExec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryOrdemServicoEquipe.Close;
  DM.qryOrdemServicoEquipeMObra.Close;
  DM.qryOrdemServicoEquipeMObraUtil.Close;
  DM.qryOrdemServicoEquipeMObraMovim.Close;
  DM.qryOrdemServicoMObraDisp.Close;
//  DM.qryTotalHomemHora.Close;
//  DM.qryTotalHomemHoraSeqHora.Close;
end;

procedure TFrmTelaCadOrdemServicoMObraExec.FormCreate(Sender: TObject);
begin
  inherited;
//DM.qryTotalHomemHora.Close;
//DM.qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
//DM.qryTotalHomemHora.Open;
//if DM.qryTotalHomemHoraSeqHora.Active = False then DM.qryTotalHomemHoraSeqHora.Open;

DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeMObra.Open;
DM.qryOrdemServicoEquipeMObraUtil.Open;
DM.qryOrdemServicoEquipeMObraMovim.Open;

DM.qryOrdemServicoMObraDisp.Close;
DM.qryOrdemServicoMObraDisp.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
DM.qryOrdemServicoMObraDisp.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
DM.qryOrdemServicoMObraDisp.Params[2].AsString := DM.FCodEmpresa;
if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
  DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'AUTÔNOMA'
else
  DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'OPERACIONAL';
DM.qryOrdemServicoMObraDisp.Open;
end;

procedure TFrmTelaCadOrdemServicoMObraExec.GrdMovimenDblClick(Sender: TObject);
var
LTempoExec : Real;
LDataConsulta : TDateTime;
begin
LTempoExec := 0;
if DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString = '' then Exit;
if DM.qryOrdemServicoEquipeMObraMovimENTRADA.IsNull = True then Exit;
if DM.qryOrdemServicoEquipeMObraMovimSAIDA.IsNull = False then Exit;

if (Application.MessageBox('Deseja realmente liberar a mão de obra da O.S.?','SPMP', MB_YESNO + MB_ICONQUESTION))= IDYes then
  begin
    DM.qryDataHoraServidor.Refresh;
    DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

    DM.qryOrdemServicoEquipeMObraMovim.Edit;
    DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDateTime := DM.FDataHoraServidor;
    DM.qryOrdemServicoEquipeMObraMovim.Post;

    LDataConsulta := DM.qryOrdemServicoEquipeMObraMovimENTRADA.AsDatetime;
    //Calcula a hora útil trabalhada
    while LDataConsulta <= DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDatetime do
      begin
        LTempoExec    := DM.TotalHomemHoraDisp(LDataConsulta, DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString, EmptyStr);
        LDataConsulta := IncMinute(LDataConsulta, 1);
      end;

    LTempoExec := (LTempoExec/60) + DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;

    DM.qryOrdemServicoEquipeMObraUtil.Edit;
    DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat := DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat + LTempoExec;
    DM.qryOrdemServicoEquipeMObraUtil.Post;

    if DM.qryOrdemServicoMObraDisp.Locate('MATRICULA', DM.qryOrdemServicoEquipeMObraMovimMATRICULA.AsString, []) = True then
      begin
        DM.qryOrdemServicoMObraDisp.Edit;
        DM.qryOrdemServicoMObraDispOCUPADO.AsString := 'N';
        DM.qryOrdemServicoMObraDisp.Post;
      end;
  end;
end;

procedure TFrmTelaCadOrdemServicoMObraExec.GrdMovimenKeyPress(Sender: TObject;
  var Key: Char);
var
LTexto: PChar;
LTempoExec: Real;
LDataConsulta: TDateTime;
begin
  inherited;
if (Key = #13) and (GrdMovimen.SelectedIndex = 0) then
  begin
    if DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString <> EmptyStr then
      begin
        if DM.qryOrdemServicoEquipeMObraMovimENTRADA.IsNull = False then Exit;

        LTexto := PChar('Deseja incluir a entrada da mão de obra: '+DM.qryOrdemServicoEquipeMObraUtilNOME.AsString+' na O.S. ?');
        if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONWARNING)=IDNO then Exit;

        DM.qryOrdemServicoEquipeMObraUtil.Edit;
        DM.qryOrdemServicoEquipeMObraUtil.Post;

        DM.qryDataHoraServidor.Refresh;
        DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

        //Adicionar entrada da mão de obra.
        DM.qryOrdemServicoEquipeMObraMovim.Append;
        DM.qryOrdemServicoEquipeMObraMovimCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger;
        DM.qryOrdemServicoEquipeMObraMovimCODEQUIPE.AsString        := DM.qryOrdemServicoEquipeCODIGO.AsString;
        DM.qryOrdemServicoEquipeMObraMovimCODCARGO.AsString         := DM.qryOrdemServicoEquipeMObraCODCARGO.AsString;
        DM.qryOrdemServicoEquipeMObraMovimMATRICULA.AsString        := DM.qryOrdemServicoMObraDispMATRICULA.AsString;
        DM.qryOrdemServicoEquipeMObraMovimNOME.AsString             := DM.qryOrdemServicoMObraDispNOME.AsString;
        DM.qryOrdemServicoEquipeMObraMovimENTRADA.AsDateTime        := DM.FDataHoraServidor;
        DM.qryOrdemServicoEquipeMObraMovimCODEMPRESA.AsString       := DM.FCodEmpresa;
        DM.qryOrdemServicoEquipeMObraMovim.Post;

        DM.qryOrdemServicoMObraDisp.Close;
        DM.qryOrdemServicoMObraDisp.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
        DM.qryOrdemServicoMObraDisp.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
        DM.qryOrdemServicoMObraDisp.Params[2].AsString := DM.FCodEmpresa;
        if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
          DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'AUTÔNOMA'
        else
          DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'OPERACIONAL';
        DM.qryOrdemServicoMObraDisp.Open;
        if DM.qryOrdemServicoMObraDisp.Locate('MATRICULA', DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString, []) = True then
          begin
            DM.qryOrdemServicoMObraDisp.Edit;
            DM.qryOrdemServicoMObraDispOCUPADO.AsString := 'S';
            DM.qryOrdemServicoMObraDisp.Post;
          end;
      end;
  end
else
if (Key = #13) and (GrdMovimen.SelectedIndex = 1) then
  begin
    LTempoExec := 0;
    if DM.qryOrdemServicoEquipeMObraUtil.IsEmpty then Exit;
    if DM.qryOrdemServicoEquipeMObraMovimSAIDA.IsNull = False then Exit;

    LTexto := PChar('Deseja realmente liberar a mão de obra: '+DM.qryOrdemServicoEquipeMObraUtilNOME.AsString+' ?');
    if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONWARNING)=IDNO then Exit;

    DM.qryOrdemServicoEquipeMObraUtil.Edit;
    DM.qryOrdemServicoEquipeMObraUtil.Post;

    DM.qryDataHoraServidor.Refresh;
    DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

    DM.qryOrdemServicoEquipeMObraMovim.Edit;
    DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDateTime := DM.FDataHoraServidor;
    DM.qryOrdemServicoEquipeMObraMovim.Post;

    LDataConsulta := DM.qryOrdemServicoEquipeMObraMovimENTRADA.AsDatetime;
    //Calcula a hora útil trabalhada
    while LDataConsulta <= DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDatetime do
      begin
        LTempoExec    := DM.TotalHomemHoraDisp(LDataConsulta, DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString, EmptyStr);
        LDataConsulta := IncMinute(LDataConsulta, 1);
      end;

    LTempoExec := (LTempoExec/60) + DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;

    DM.qryOrdemServicoEquipeMObraUtil.Edit;
    DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat := DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat + LTempoExec;
    DM.qryOrdemServicoEquipeMObraUtil.Post;

    if DM.qryOrdemServicoMObraDisp.Locate('MATRICULA', DM.qryOrdemServicoEquipeMObraMovimMATRICULA.AsString, []) = True then
      begin
        DM.qryOrdemServicoMObraDisp.Edit;
        DM.qryOrdemServicoMObraDispOCUPADO.AsString := 'N';
        DM.qryOrdemServicoMObraDisp.Post;
      end;
  end;
end;

end.

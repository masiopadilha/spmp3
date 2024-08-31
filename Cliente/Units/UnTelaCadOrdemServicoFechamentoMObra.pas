unit UnTelaCadOrdemServicoFechamentoMObra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UnTelaPaiOkCancel, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.DBCtrls, Data.DB, FireDAC.Stan.Param,
  System.DateUtils;

type
  TFrmTelaCadOrdemServicoFechamentoMObra = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    GrdEquipe: TDBGrid;
    GrdEquipeMObraUtil: TDBGrid;
    GrdEquipeMObra: TDBGrid;
    procedure GrdEquipeMObraKeyPress(Sender: TObject; var Key: Char);
    procedure GrdEquipeMObraUtilKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure GrdEquipeMObraUtilDblClick(Sender: TObject);
    procedure GrdEquipeMObraDblClick(Sender: TObject);
    procedure GrdEquipeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdEquipeDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoFechamentoMObra: TFrmTelaCadOrdemServicoFechamentoMObra;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServicoMObraExecDisp,
  UnTelaCadOrdemServicoFechamento, UnDM;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  LSalario, LHOficiais, LHomemHora, LHENormal, LHEFeriado, LPercHENormal, LPercHEFeriado, LCusto, LTotalHH : Real;
  a,b,c: Real;
begin
  inherited;
  FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);


  if DM.qryOrdemServicoEquipeMObra.Active = True then
  begin
    LTotalHH := 0;
    LCusto   := 0;

    DM.qryOrdemServicoEquipe.First;
    while not DM.qryOrdemServicoEquipe.Eof = True do
    begin
      DM.qryOrdemServicoEquipeMObra.First;
      while (not DM.qryOrdemServicoEquipeMObra.Eof = True) do
      begin
        DM.qryOrdemServicoEquipeMObraUtil.First;
        while not (DM.qryOrdemServicoEquipeMObraUtil.Eof  = True) and (DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString <> EmptyStr) do
        begin
          LSalario       := DM.qryOrdemServicoEquipeMObraUtilSALARIO.AsFloat;
          LHomemHora     := DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat;
          LHOficiais     := DM.qryOrdemServicoEquipeMObraUtilHOFICIAIS.AsFloat;
          LHENormal      := DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat;
          LHEFeriado     := DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;
          LPercHENormal  := DM.qryOrdemServicoEquipeMObraUtilHENORMAL.AsFloat/100;
          LPercHEFeriado := DM.qryOrdemServicoEquipeMObraUtilHEFERIADO.AsFloat/100;

          LTotalHH := LTotalHH + DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;

          a := ((LSalario/LHOficiais) * LHomemHora);
          b := ((LSalario/LHOficiais) * (LHENormal * (1 + LPercHENormal)));
          c := ((LSalario/LHOficiais) * (LHEFeriado * (1 + LPercHEFeriado)));
          LCusto   := LCusto + a + b + c;

          DM.qryOrdemServicoEquipeMObraUtil.Next;
        end;

        DM.qryOrdemServicoEquipeMObra.Next;
      end;

      DM.qryOrdemServicoEquipe.Next;
    end;

    DM.qryOrdemServico.Edit;
    DM.qryOrdemServicoTEMPOHOMEMHORAEXEC.AsFloat := LTotalHH;
    DM.qryOrdemServicoCUSTOMOBRA.AsFloat := LCusto;
    DM.qryOrdemServico.Post;

    // Consulta o primeiro funcionário cadastrado e copia a matrícula para o fechamento da inspeção (caso seja uma)

    if (DM.qryOrdemServicoCODMANUTPROGEQUIP.AsString <> '') or ((DM.qryOrdemServicoCODLUBRIFICPROGEQUIP.AsString <> '')) then
    begin
      DM.qryOrdemServicoEquipe.First;
      DM.qryOrdemServicoEquipeMObra.First;
      DM.qryOrdemServicoEquipeMObraUtil.First;
      if DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString <> '' then
      begin
        with DM.qryAuxiliar do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE manutprogequipamentohist SET MATRICULA = :matricula WHERE CODORDEMSERVICO = :codordemservico AND CODEMPRESA = :codempresa AND (MATRICULA IS NULL OR MATRICULA <> '');');
          SQL.Add('UPDATE lubrificprogequipamentohist SET MATRICULA = :matricula WHERE CODORDEMSERVICO = :codordemservico AND CODEMPRESA = :codempresa AND (MATRICULA IS NULL OR MATRICULA <> '');');
          Params.ParamByName('matricula').AsString := DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString;
          Params.ParamByName('codordemservico').AsString := DM.qryOrdemServicoCODIGO.AsString;
          Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
          Execute;
        end;
      end;
    end;
  end;

  DM.qryTotalHomemHoraSeqHora.Close;
  DM.qryOrdemServicoEquipe.Close;
  DM.qryOrdemServicoEquipeMObra.Close;
  DM.qryOrdemServicoEquipeMObraMovim.Close;
  DM.qryOrdemServicoEquipeMObraUtil.Close;
  DM.qryOrdemServicoMObraDisp.Close;
end;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.FormCreate(Sender: TObject);
var
  LTempoExecutado, LTotalHH: Real;
begin
  inherited;
  if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    GrdEquipe.ReadOnly := True;
    GrdEquipeMObra.ReadOnly := True;
    GrdEquipeMObraUtil.ReadOnly := True;
    Exit;
  end;

  if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    GrdEquipe.ReadOnly := True;
    GrdEquipeMObra.ReadOnly := True;
    GrdEquipeMObraUtil.ReadOnly := True;
    DM.MSGAguarde('', False);
    Exit;
  end;

  DM.qryOrdemServicoEquipe.Open;
  DM.qryOrdemServicoEquipeMObra.Open;
  DM.qryOrdemServicoEquipeMObraMovim.Open;
  DM.qryOrdemServicoEquipeMObraUtil.Open;
  DM.qryOrdemServicoMObraDisp.Close;
  DM.qryOrdemServicoMObraDisp.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
  DM.qryOrdemServicoMObraDisp.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
  DM.qryOrdemServicoMObraDisp.Params[2].AsString := DM.FCodEmpresa;
  if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
    DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'AUTÔNOMA'
  else
    DM.qryOrdemServicoMObraDisp.Params[3].AsString := 'OPERACIONAL';
  DM.qryOrdemServicoMObraDisp.Open;

  LTempoExecutado := (MinutesBetween(DM.qryOrdemServicoDATAINICIOREAL.AsDateTime, DM.qryOrdemServicoDATAFIMREAL.AsDateTime))/60;
  LTotalHH := 0;
  DM.qryOrdemServicoEquipeMObra.First;
  while not DM.qryOrdemServicoEquipeMObra.Eof = True do
  begin
    LTotalHH := DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;

    if LTotalHH < LTempoExecutado then
    begin
      DM.qryOrdemServicoEquipeMObra.Edit;
      DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat := LTempoExecutado;
      DM.qryOrdemServicoEquipeMObra.Post;
    end;

    DM.qryOrdemServicoEquipeMObraUtil.First;
    while not DM.qryOrdemServicoEquipeMObraUtil.Eof = True do
    begin
      LTotalHH := DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat;

      if LTotalHH < LTempoExecutado then
      begin
        DM.qryOrdemServicoEquipeMObraUtil.Edit;
        DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat := LTempoExecutado;
        DM.qryOrdemServicoEquipeMObraUtil.Post;
      end;

      DM.qryOrdemServicoEquipeMObraUtil.Next;
    end;

    DM.qryOrdemServicoEquipeMObra.Next;
  end;

  DM.qryOrdemServicoEquipeMObra.Edit;
  DM.qryOrdemServicoEquipeMObraUtil.Edit;
end;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.GrdEquipeDblClick(
  Sender: TObject);
begin
  inherited;
if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    DM.qryOrdemServicoEquipeMObra.First;
    while not DM.qryOrdemServicoEquipeMObra.Eof = True do
      DM.qryOrdemServicoEquipeMObra.Delete;
    DM.qryOrdemServicoEquipe.Delete;
  end;
end;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.GrdEquipeKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.GrdEquipeMObraDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoEquipeMObraUtil.IsEmpty = True then
  DM.qryOrdemServicoEquipeMObra.Delete;
end;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.GrdEquipeMObraKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if ((GrdEquipeMObra.SelectedIndex = 0) or (GrdEquipeMObra.SelectedIndex = 2)) and (Key <> #13) or (DM.qryOrdemServicoEquipe.IsEmpty = True) then
  begin
    Key := #0;
    Exit;
  end;

if ((Key = #13) and (GrdEquipeMObra.SelectedIndex = 2)) and (DM.qryOrdemServicoEquipeMObraCODCARGO.AsString = '') then
  begin
    Key := #0;
    GrdEquipeMObra.SelectedIndex := 0;
    Exit;
  end;

if (Key = #13) and (GrdEquipeMObra.SelectedIndex = 0) then
  begin
    if DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString = '' then
      begin
        DM.FTabela_auxiliar := 130;

        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          if DM.FCodCombo <> EmptyStr then
            begin
              if DM.qryOrdemServicoEquipeMObra.Locate('CODCARGO', DM.FCodCombo, []) = False then
                begin
                  DM.qryOrdemServicoEquipe.Edit;
                  DM.qryOrdemServicoEquipe.Post;
                  DM.qryOrdemServicoEquipe.Edit;

                  DM.qryOrdemServicoEquipeMObra.Append;
                  DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsInteger      := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
                  DM.qryOrdemServicoEquipeMObraCODEMPRESA.AsString      := DM.FCodEmpresa;
                  DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsString := DM.FParamAuxiliar[0];
                  DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat   := DM.qryOrdemServicoEquipeTEMPO.AsFloat;
                  DM.qryOrdemServicoEquipeMObraCODCARGO.AsString        := DM.FCodCombo;
                  DM.qryOrdemServicoEquipeMObraCARGO.AsString           := DM.FValorCombo;
                  DM.qryOrdemServicoEquipeMObra.Post;

                  GrdEquipeMObra.SelectedIndex := 1;
                end;
            end;
        End;
      end
    else
      begin
        Application.MessageBox('Existem funcionários cadastrados nessa função!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  end;

if ((Key = #13) and (GrdEquipeMObra.SelectedIndex = 2)) and (DM.qryOrdemServicoEquipeMObraCODCARGO.AsString <> '') then
  begin
    if DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString = '' then
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
            end;
        End;
      end
    else
      begin
        Application.MessageBox('Existem funcionários cadastrados nesse calendário!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  end;
end;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.GrdEquipeMObraUtilDblClick(
  Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if DM.qryOrdemServicoEquipeMObraUtil.IsEmpty = False then
  begin
    if DM.qryOrdemServicoEquipeMObraMovim.IsEmpty = True then
      begin
        if Application.MessageBox('Deseja realmente excluir o funcionário?', 'SPMP3', MB_ICONQUESTION + MB_YESNO) = IDYEs then
          DM.qryOrdemServicoEquipeMObraUtil.Delete
      end
    else
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'EXISTEM ENTRADAS CADASTRADAS DESSE FUNCIONÁRIO!';
      end;
  end;
end;

procedure TFrmTelaCadOrdemServicoFechamentoMObra.GrdEquipeMObraUtilKeyPress(
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

if ((GrdEquipeMObraUtil.SelectedIndex = 2) or (GrdEquipeMObraUtil.SelectedIndex = 3)
     or (GrdEquipeMObraUtil.SelectedIndex = 4)) and (DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString = EmptyStr)
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
                //DM.qryOrdemServicoEquipeMObraUtilCODIGO.AsInteger          := DM.qryOrdemServicoEquipeMObraUtil.RecordCount + 1;
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
                DM.qryOrdemServicoEquipeMObraUtil.Refresh;

                FrmTelaCadOrdemServicoFechamento.BtnSalvar.ImageIndex := 115;
                FrmTelaCadOrdemServicoFechamento.PAuxiliares.Font.Color := clRed;
                FrmTelaCadOrdemServicoFechamento.PAuxiliares.Caption := 'GRAVE O REGISTRO PARA RECALCULAR O CUSTO DA MÃO DE OBRA!!!';

                GrdEquipeMObraUtil.SelectedIndex := 2;
              end;
          end;
      FreeAndNil(FrmTelaCadOrdemServicoMObraDisp);
    End;
  end;
end;

end.

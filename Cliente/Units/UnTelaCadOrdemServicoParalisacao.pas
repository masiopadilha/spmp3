unit UnTelaCadOrdemServicoParalisacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, System.DateUtils, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoParalisacao = class(TFrmTelaPaiOkCancel)
    GrdParalisacao: TDBGrid;
    MMotivo: TDBMemo;
    procedure GrdParalisacaoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure LiberarTotal;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoParalisacao: TFrmTelaCadOrdemServicoParalisacao;
  LProcesso : SmallInt;

implementation

{$R *.dfm}

uses UnTelaCadOrdemServicoMObraExec, UnDM;

procedure TFrmTelaCadOrdemServicoParalisacao.BtnOKClick(Sender: TObject);
begin
  inherited;
  case LProcesso of
    0:
      begin
        DM.qryOrdemServicoEquipeMObraMovim.Post;
        DM.qryOrdemServicoEquipeMObraUtil.Post;
        DM.qryOrdemServicoMObraDisp.Post;
        DM.qryOrdemServicoServExec.Post;
      end;
  end;
  //Localiza e atualiza o status da Solic. de Trab
  if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
     DM.qrySolicitacaoTrab.Post;

  DM.qryOrdemServicoParalisacoes.Post;
end;

procedure TFrmTelaCadOrdemServicoParalisacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//DM.qryOrdemServicoEquipe.Close;
//DM.qryOrdemServicoEquipeMObra.Close;
//DM.qryOrdemServicoEquipeRecursos.Close;
//DM.qryOrdemServicoEquipeMObraUtil.Close;
//DM.qryOrdemServicoEquipeMObraMovim.Close;
//DM.qryOrdemServicoServSolic.Close;
DM.qryOrdemServicoServExec.Close;
DM.qryOrdemServicoMObraDisp.Close;
//DM.qryTotalHomemHora.Close;
//DM.qryTotalHomemHoraSeqHora.Close;
DM.qrySolicitacaoTrab.Close;
DM.qryOrdemServico.Close;
DM.qryOrdemServicoParalisacoes.Close;
end;

procedure TFrmTelaCadOrdemServicoParalisacao.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoParalisacoes.Open;
DM.qryOrdemServicoParalisacoes.Edit;
LProcesso := -1;
end;

procedure TFrmTelaCadOrdemServicoParalisacao.GrdParalisacaoDblClick(
  Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
DM.MSGAguarde();

if GrdParalisacao.SelectedIndex = 0 then
  begin
    if ((DM.qryOrdemServicoParalisacoesDATAPARALISACAO.IsNull = True) or ((DM.qryOrdemServicoParalisacoesDATAPARALISACAO.IsNull = False) and (DM.qryOrdemServicoParalisacoesDATARETORNO.IsNull = False))) then
      begin
        DM.qryOrdemServicoParalisacoes.Append;
        //DM.qryOrdemServicoParalisacoesCODIGO.AsInteger   := DM.qryOrdemServicoParalisacoes.RecordCount + 1;
        DM.qryOrdemServicoParalisacoesCODEMPRESA.AsString:= DM.FCodEmpresa;
        DM.qryOrdemServicoParalisacoesCODORDEMSERVICO.AsInteger  := DM.qryOrdemServicoCODIGO.AsInteger;
        DM.qryOrdemServicoParalisacoesDATAPARALISACAO.AsDateTime := DM.FDataHoraServidor;
        DM.qryOrdemServicoParalisacoes.Post;
        DM.qryOrdemServicoParalisacoes.Edit;

        DM.qryOrdemServico.Edit;
        DM.qryOrdemServicoSITUACAO.AsString := 'PARALISADA';
        DM.qryOrdemServico.Post;

        DM.qryOrdemServicoGerencia.Edit;
        DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'PARALISADA';
        DM.qryOrdemServicoGerencia.Post;

        //Localiza e atualiza o status da Solic. de Trab
        if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
          begin
            DM.qrySolicitacaoTrab.Close;
            DM.qrySolicitacaoTrab.Params[0].AsString := DM.qryOrdemServicoCODSOLICITACAOTRAB.AsString;
            DM.qrySolicitacaoTrab.Params[1].AsString := DM.FCodEmpresa;
            DM.qrySolicitacaoTrab.Open;
            if DM.qrySolicitacaoTrab.IsEmpty = False then
              begin
                DM.qrySolicitacaoTrab.Edit;
                DM.qrySolicitacaoTrabSITUACAO.AsString := 'PARALISADA';
                DM.qrySolicitacaoTrab.Post;
                DM.qrySolicitacaoTrab.Close;
              end;
          end;

        LiberarTotal;

        LProcesso := 0;

        DM.qrySolicitacaoTrab.Close;
      end;
  end;

if GrdParalisacao.SelectedIndex = 1 then
  begin
    if (DM.qryOrdemServicoParalisacoesDATARETORNO.IsNull = True) then
      if (DM.qryOrdemServicoParalisacoesMOTIVOPARALISACAO.IsNull = True) then
        begin
          PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O MOTIVO DA PARALISAÇÃO!'; Exit;
          DM.MSGAguarde('', False);
        end
      else
        begin
          DM.qryOrdemServicoParalisacoes.Edit;
          DM.qryOrdemServicoParalisacoesDATARETORNO.AsDateTime := DM.FDataHoraServidor;
          DM.qryOrdemServicoParalisacoes.Post;
          DM.qryOrdemServicoParalisacoes.Edit;


          DM.qryOrdemServico.Edit;
          DM.qryOrdemServicoSITUACAO.AsString := 'EXECUCAO';
          DM.qryOrdemServico.Post;

          DM.qryOrdemServicoGerencia.Edit;
          DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'EXECUCAO';
          DM.qryOrdemServicoGerencia.Post;

          //Localiza e atualiza o status da Solic. de Trab
          if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
            begin
              DM.qrySolicitacaoTrab.Close;
              DM.qrySolicitacaoTrab.Params[0].AsString := DM.qryOrdemServicoCODSOLICITACAOTRAB.AsString;
              DM.qrySolicitacaoTrab.Params[1].AsString := DM.FCodEmpresa;
              DM.qrySolicitacaoTrab.Open;
              if DM.qrySolicitacaoTrab.IsEmpty = False then
                begin
                  DM.qrySolicitacaoTrab.Edit;
                  DM.qrySolicitacaoTrabSITUACAO.AsString := 'EXECUCAO';
                  DM.qrySolicitacaoTrab.Post;
                end;
            end;

          LProcesso := 1;

//          Try
//            Application.CreateForm(TFrmTelaCadOrdemServicoMObraExec, FrmTelaCadOrdemServicoMObraExec);
//            FrmTelaCadOrdemServicoMObraExec.ShowModal;
//          Finally
//            if FrmTelaCadOrdemServicoMObraExec.ModalResult = mrOk then
//              begin
//                DM.qryOrdemServicoParalisacoes.Edit;
//                DM.qryOrdemServicoParalisacoesDATARETORNO.AsDateTime := DM.FDataHoraServidor;
//                DM.qryOrdemServicoParalisacoes.Post;
//                DM.qryOrdemServicoParalisacoes.Edit;
//
//
//                DM.qryOrdemServico.Edit;
//                DM.qryOrdemServicoSITUACAO.AsString := 'EXECUCAO';
//                DM.qryOrdemServico.Post;
//
//                DM.qryOrdemServicoGerencia.Edit;
//                DM.qryOrdemServicoGerenciaSITUACAO.AsString := 'EXECUCAO';
//                DM.qryOrdemServicoGerencia.Post;
//
//                //Localiza e atualiza o status da Solic. de Trab
//                if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
//                  begin
//                    DM.qrySolicitacaoTrab.Close;
//                    DM.qrySolicitacaoTrab.Params[0].AsString := DM.qryOrdemServicoCODSOLICITACAOTRAB.AsString;
//                    DM.qrySolicitacaoTrab.Params[1].AsString := DM.FCodEmpresa;
//                    DM.qrySolicitacaoTrab.Open;
//                    if DM.qrySolicitacaoTrab.IsEmpty = False then
//                      begin
//                        DM.qrySolicitacaoTrab.Edit;
//                        DM.qrySolicitacaoTrabSITUACAO.AsString := 'EXECUCAO';
//                        DM.qrySolicitacaoTrab.Post;
//                      end;
//                  end;
//
//                LProcesso := 1;
//              end;
//            FreeAndNil(FrmTelaCadOrdemServicoMObraExec);
//          End;
        end;
  end;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadOrdemServicoParalisacao.LiberarTotal;
var
LTempoExec: Real;
LDataConsulta: TDateTime;
begin
DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

DM.qryOrdemServicoMObraDisp.Close;
DM.qryOrdemServicoMObraDisp.Params[0].AsString := DM.FCodEmpresa;
if DM.qryOrdemServicoEXECAUTONOMO.AsString = 'S' then
  DM.qryOrdemServicoMObraDisp.Params[1].AsString := 'AUTÔNOMA'
else
  DM.qryOrdemServicoMObraDisp.Params[1].AsString := 'OPERACIONAL';
DM.qryOrdemServicoMObraDisp.Open;

//DM.qryTotalHomemHora.Close;
//DM.qryTotalHomemHora.Params[0].AsString := DM.FCodEmpresa;
//DM.qryTotalHomemHora.Open;
//DM.qryTotalHomemHoraSeqHora.Open;

DM.qryOrdemServicoEquipe.Open;
DM.qryOrdemServicoEquipeMObra.Open;
DM.qryOrdemServicoEquipeMObraUtil.Open;
DM.qryOrdemServicoEquipeMObraMovim.Open;

while not DM.qryOrdemServicoEquipe.Eof do
  begin
    while not DM.qryOrdemServicoEquipeMObra.Eof do
      begin
        while not DM.qryOrdemServicoEquipeMObraUtil.Eof do
          begin
            LTempoExec := 0;
            while not DM.qryOrdemServicoEquipeMObraMovim.Eof do
              begin
                if DM.qryOrdemServicoEquipeMObraMovimSAIDA.IsNull = True then
                  begin
                    DM.qryOrdemServicoEquipeMObraMovim.Edit;
                    DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDateTime := DM.FDataHoraServidor;
                    DM.qryOrdemServicoEquipeMObraMovim.Post;
                  end;

                LDataConsulta := DM.qryOrdemServicoEquipeMObraMovimENTRADA.AsDatetime;
                //Calcula a hora útil trabalhada
                while LDataConsulta <= DM.qryOrdemServicoEquipeMObraMovimSAIDA.AsDatetime do
                  begin
                    if DM.TotalHomemHoraDisp(LDataConsulta, DM.qryOrdemServicoEquipeMObraUtilMATRICULA.AsString, EmptyStr) > 0 then
                      LTempoExec := LTempoExec + 1;

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

                DM.qryOrdemServicoEquipeMObraMovim.Next;
              end;

          DM.qryOrdemServico.Edit;
          DM.qryOrdemServicoTEMPOHOMEMHORAEXEC.AsFloat := DM.qryOrdemServicoTEMPOHOMEMHORAEXEC.AsFloat + DM.qryOrdemServicoEquipeMObraUtilTOTALHOMEMHORA.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHENORMAL.AsFloat + DM.qryOrdemServicoEquipeMObraUtilQTDEHEFERIADO.AsFloat;
          DM.qryOrdemServicoTEMPOEXECUTADO.AsFloat     := (MinutesBetween(DM.qryOrdemServicoDATAINICIOREAL.AsDateTime, DM.qryOrdemServicoDATAFIMREAL.AsDateTime)) DIV 60;
          DM.qryOrdemServico.Post;

          DM.qryOrdemServicoEquipeMObraUtil.Next;
        end;

        DM.qryOrdemServicoEquipeMObra.Next;
      end;
    DM.qryOrdemServicoEquipe.Next;
  end;

//Localiza e atualiza o status da Solic. de Trab
if DM.qryOrdemServicoSOLICTRAB.AsString = 'S' then
  begin
    DM.qrySolicitacaoTrab.Close;
    DM.qrySolicitacaoTrab.Params[0].AsString := DM.qryOrdemServicoCODSOLICITACAOTRAB.AsString;
    DM.qrySolicitacaoTrab.Params[1].AsString := DM.FCodEmpresa;
    DM.qrySolicitacaoTrab.Open;
    if DM.qrySolicitacaoTrab.IsEmpty = False then
      begin
        DM.qrySolicitacaoTrab.Edit;
        DM.qrySolicitacaoTrabSITUACAO.AsString := 'PARALISADA';
        DM.qrySolicitacaoTrab.Post;
      end;
  end;

 while not DM.qryOrdemServicoServSolic.Eof do
   begin
     DM.qryOrdemServicoServExec.Append;
     DM.qryOrdemServicoServExecCODIGO.AsInteger  := DM.qryOrdemServicoServSolicCODIGO.AsInteger;
     DM.qryOrdemServicoServExecCODEMPRESA.AsString       := DM.FCodEmpresa;
     DM.qryOrdemServicoServExecCODORDEMSERVICO.AsInteger := DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger;
     DM.qryOrdemServicoServExecPARTE.AsString    := DM.qryOrdemServicoServSolicPARTE.AsString;
     DM.qryOrdemServicoServExecITEM.AsString     := DM.qryOrdemServicoServSolicITEM.AsString;
     DM.qryOrdemServicoServExecDESCRICAO.AsString:= DM.qryOrdemServicoServSolicDESCRICAO.AsString;
     DM.qryOrdemServicoServExecEQUIPPARADO.AsString      := DM.qryOrdemServicoServSolicEQUIPPARADO.AsString;
     DM.qryOrdemServicoServExecTEMPOEXECUCAO.AsFloat     := DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsFloat;
     DM.qryOrdemServicoServExec.Post;

     DM.qryOrdemServicoServSolic.Next;
   end;

DM.qryOrdemServicoMObraDisp.Close;
//DM.qryTotalHomemHora.Close;
DM.qryOrdemServicoEquipe.Close;
DM.qryOrdemServicoEquipeMObra.Close;
DM.qryOrdemServicoEquipeMObraUtil.Close;
DM.qryOrdemServicoEquipeMObraMovim.Close;
end;

end.

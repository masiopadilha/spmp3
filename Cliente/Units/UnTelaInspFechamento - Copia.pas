unit UnTelaInspFechamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, JvExMask, JvToolEdit, JvDBControls, Data.DB, System.DateUtils,
  Vcl.ImgList, Datasnap.DBClient, Vcl.ComCtrls, System.ImageList;

type
  TFrmTelaInspFechamento = class(TFrmTelaPaiOkCancel)
    PBase: TPanel;
    BtnLimpar: TButton;
    RGFiltro: TRadioGroup;
    ImageList1: TImageList;
    Label11: TLabel;
    Label2: TLabel;
    CDItensProb: TClientDataSet;
    CDItensProbCODITEM: TFloatField;
    CDItensProbCODPARTE: TFloatField;
    CDItensProbDESCPARTE: TWideStringField;
    CDItensProbITEM: TWideStringField;
    CDItensProbDESCINSPECAO: TWideStringField;
    CDItensProbTEMPO: TFloatField;
    CDItensProbEQUIPPARADO: TWideStringField;
    CDItensProbEXECUTADO: TWideStringField;
    CDItensProbBOM: TWideStringField;
    CDItensProbREGULAR: TWideStringField;
    CDItensProbRUIM: TWideStringField;
    CDItensProbCODEMPRESA: TWideStringField;
    CDItensProbHISTORICO: TFloatField;
    DSItensProb: TDataSource;
    PCInspecoes: TPageControl;
    TSManut: TTabSheet;
    TSLubrific: TTabSheet;
    GrdManutencao: TDBGrid;
    GrdItensManut: TDBGrid;
    GrdItensEspManut: TDBGrid;
    GrdLubrificacao: TDBGrid;
    GrdItensLubrific: TDBGrid;
    GrdItensEspLubrific: TDBGrid;
    TSRota: TTabSheet;
    GrdRota: TDBGrid;
    GrdRotaManut: TDBGrid;
    GrdRotaManutItens: TDBGrid;
    GrdRotaManutItensEsp: TDBGrid;
    Button6: TButton;
    BtnFuncionario: TButton;
    EdtExecucao: TJvDateEdit;
    EdtMatricula: TEdit;
    EdtResponsavel: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGFiltroClick(Sender: TObject);
    procedure ConfigurarFiltros;
    procedure GrdManutencaoTitleClick(Column: TColumn);
    procedure GrdManutencaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdItensManutDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdItensEspManutDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdItensManutCellClick(Column: TColumn);
    procedure GrdItensManutDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure GrdItensEspManutDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure GrdItensEspManutCellClick(Column: TColumn);
    procedure BtnOKClick(Sender: TObject);
    procedure GrdManutencaoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdLubrificacaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdLubrificacaoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdLubrificacaoTitleClick(Column: TColumn);
    procedure GrdItensLubrificDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdItensLubrificCellClick(Column: TColumn);
    procedure GrdItensLubrificDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure GrdItensEspLubrificCellClick(Column: TColumn);
    procedure GrdItensEspLubrificDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GrdItensEspLubrificDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure GrdRotaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdRotaManutItensCellClick(Column: TColumn);
    procedure GrdRotaManutItensDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure GrdRotaManutItensEspCellClick(Column: TColumn);
    procedure GrdRotaManutItensEspDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure GrdRotaKeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure GrdRotaManutDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdRotaManutItensDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GrdRotaManutItensEspDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BtnFuncionarioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaInspFechamento: TFrmTelaInspFechamento;

implementation

{$R *.dfm}

uses UnCMWeb, UnTelaConsulta, UnTelaCadOrdemServicoGerencia,
  UnTelaInspFechamentoHist, UnTelaCadFuncionarios;

procedure TFrmTelaInspFechamento.BtnOKClick(Sender: TObject);
var
LTexto: PChar;
LCodOrdemServico: Integer;
begin
//  inherited;
if (CMWeb.CDUsuarioPAlteracaoCADFECHAMANUT.AsString <> 'S') or (LowerCase(CMWeb.FNomeUsuario) = 'sam_spmp') then Exit;

PAuxiliares.Caption := EmptyStr;
    Case PCInspecoes.ActivePageIndex of
      0:
        begin
          if CMWeb.CDManutPeriodicas.IsEmpty = True then Exit;

          LTexto := PChar('Deseja realmente efetuar o fechamento da manutenção: ' + CMWeb.CDManutPeriodicasDESCRICAO.AsString);
          if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
            begin
              if CMWeb.CDManutPeriodicasSITUACAOOS.AsString <> 'FECHADA' then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'ORDEM DE SERVIÇO NÃO FECHADA!';
                  Exit;
                end;
              if EdtExecucao.Date = 0 then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DATA DE EXECUÇÃO!';
                  EdtExecucao.SetFocus;
                  Exit;
                end;

              if EdtResponsavel.Text = '' then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FUNCIONÁRIO!';
                  EdtResponsavel.SetFocus;
                  Exit;
                end;

              CMWeb.CDManutPeriodicas.Edit;
              CMWeb.CDManutPeriodicasSITUACAO.AsString         := 'FECHADA';
              CMWeb.CDManutPeriodicasREALIZADA.AsString        := 'S';
              CMWeb.CDManutPeriodicasDATAFECHAMENTO.AsDateTime := DateOf(CMWeb.FDataHoraServidor);
              CMWeb.CDManutPeriodicasDATAEXECUCAO.AsDateTime   := EdtExecucao.Date;
              CMWeb.CDManutPeriodicasMATRICULA.AsString        := EdtMatricula.Text;
              CMWeb.CDManutPeriodicas.Post;

              CMWeb.CDManutPeriodicasItens.First; CMWeb.CDManutPeriodicasItensEsp.First;

              //Habilita a manutenção para ser programada novamente
              if CMWeb.CDManutPeriodicasREPROGRAMAR1.AsString = 'Execução' then
                begin
                  CMWeb.CDCadManutProgEquip.Close;
                  CMWeb.CDCadManutProgEquip.Params[0].AsString := CMWeb.CDManutPeriodicasCODIGO.AsString;
                  CMWeb.CDCadManutProgEquip.Params[1].AsString := CMWeb.FCodEmpresa;
                  CMWeb.CDCadManutProgEquip.Params[2].AsString := CMWeb.CDManutPeriodicasCODEQUIPAMENTO.AsString;
                  CMWeb.CDCadManutProgEquip.Open;
                  if CMWeb.CDCadManutProgEquip.IsEmpty = False then
                    begin
                      CMWeb.CDCadManutProgEquip.Edit;
                      CMWeb.CDCadManutProgEquipRELATORIO.AsString    := 'N';
                      CMWeb.CDCadManutProgEquipDTAINICIO1.AsDateTime := IncDay(CMWeb.CDCadManutProgEquipDTAINICIO1.AsDateTime, CMWeb.CDCadManutProgEquipFREQUENCIA1.AsInteger);
                      CMWeb.CDCadManutProgEquip.Post;
                    end;
                end;

              //Verifica itens problemáticos detectados após a manutenção
              CDItensProb.Close; CDItensProb.CreateDataSet; CDItensProb.Open; CDItensProb.EmptyDataSet; CDItensProb.Edit;
              CMWeb.CDManutPeriodicasItens.First;
              while not CMWeb.CDManutPeriodicasItens.Eof = True do
                begin
                  if (CMWeb.CDManutPeriodicasItensRUIM.AsString = 'S') or (CMWeb.CDManutPeriodicasItensREGULAR.AsString = 'S') then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := CMWeb.CDManutPeriodicasItensCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := CMWeb.CDManutPeriodicasItensCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := CMWeb.CDManutPeriodicasItensPARTE.AsString;
                      CDItensProbITEM.AsString         := CMWeb.CDManutPeriodicasItensITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := CMWeb.CDManutPeriodicasItensDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := CMWeb.CDManutPeriodicasItensTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := CMWeb.CDManutPeriodicasItensEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := CMWeb.CDManutPeriodicasItensEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := CMWeb.CDManutPeriodicasItensBOM.AsString;
                      CDItensProbREGULAR.AsString      := CMWeb.CDManutPeriodicasItensREGULAR.AsString;
                      CDItensProbRUIM.AsString         := CMWeb.CDManutPeriodicasItensRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := CMWeb.CDManutPeriodicasItensCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := CMWeb.CDManutPeriodicasItensHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  CMWeb.CDManutPeriodicasItens.Next;
                end;

              CMWeb.CDManutPeriodicasItensEsp.First;
              while not CMWeb.CDManutPeriodicasItensEsp.Eof = True do
                begin
                  if CMWeb.CDManutPeriodicasItensEspRUIM.AsString = 'S' then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := CMWeb.CDManutPeriodicasItensEspCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := CMWeb.CDManutPeriodicasItensEspCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := CMWeb.CDManutPeriodicasItensEspPARTE.AsString;
                      CDItensProbITEM.AsString         := CMWeb.CDManutPeriodicasItensEspITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := CMWeb.CDManutPeriodicasItensEspDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := CMWeb.CDManutPeriodicasItensEspTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := CMWeb.CDManutPeriodicasItensEspEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := CMWeb.CDManutPeriodicasItensEspBOM.AsString;
                      CDItensProbREGULAR.AsString      := CMWeb.CDManutPeriodicasItensEspREGULAR.AsString;
                      CDItensProbRUIM.AsString         := CMWeb.CDManutPeriodicasItensEspRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := CMWeb.CDManutPeriodicasItensEspCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := CMWeb.CDManutPeriodicasItensEspHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  CMWeb.CDManutPeriodicasItensEsp.Next;
                end;

            //Gerar OS com itens problemáticos
            if CDItensProb.RecordCount > 0 then
              begin
                LCodOrdemServico := CMWeb.SMClient.GerarOS(CMWeb.FCodUsuario, CMWeb.FCodEmpresa, CMWeb.CDManutPeriodicasDESCRICAO.AsString + ' (Retorno)'
                                                              , CMWeb.CDManutPeriodicasCODEQUIPAMENTO.AsString, CMWeb.CDManutPeriodicasCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                              , EmptyStr, 'Emergência', 'Para o Equipamento');


                CMWeb.CDOrdemServicoGerencia.Append;
                CMWeb.CDOrdemServicoGerenciaCODIGO.AsInteger        := LCodOrdemServico;
                CMWeb.CDOrdemServicoGerenciaCODEMPRESA.AsString     := CMWeb.FCodEmpresa;
                CMWeb.CDOrdemServicoGerenciaDESCRICAO.AsString      := CMWeb.CDManutPeriodicasDESCRICAO.AsString + ' (Retorno)';
                CMWeb.CDOrdemServicoGerenciaDATACADASTRO.AsDateTime := CMWeb.FDataHoraServidor;
                CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString       := 'CADASTRADA';
                CMWeb.CDOrdemServicoGerenciaCODMANUTENCAO.AsString  := CMWeb.CDManutPeriodicasCODIGO.AsString;
                CMWeb.CDOrdemServicoGerenciaEQUIPAMENTO.AsString    := CMWeb.CDManutPeriodicasEQUIPAMENTO.AsString;
                CMWeb.CDOrdemServicoGerenciaSOLICTRAB.AsString      := 'N';
                CMWeb.CDOrdemServicoGerenciaCODEQUIPAMENTO.AsString := CMWeb.CDManutPeriodicasCODEQUIPAMENTO.AsString;
                CMWeb.CDOrdemServicoGerencia.Post;

                CMWeb.CDManutPeriodicas.Edit;
                CMWeb.CDManutPeriodicasGEROUOS.AsString          := 'S';
                //CMWeb.CDManutPeriodicasCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                CMWeb.CDManutPeriodicas.Post;

                CMWeb.CDCadOrdemServicoServSolic.Close;
                CMWeb.CDCadOrdemServicoServSolic.Params[0].AsString  := CMWeb.FCodEmpresa;
                CMWeb.CDCadOrdemServicoServSolic.Params[1].AsInteger := LCodOrdemServico;
                CMWeb.CDCadOrdemServicoServSolic.Open;
                CDItensProb.First;
                while not CDItensProb.Eof = True do
                  begin
                    CMWeb.CDCadOrdemServicoServSolic.Append;
                    //CMWeb.CDCadOrdemServicoServSolicCODIGO.AsInteger          := CMWeb.SMWebClient.GerarSequencia('ORDEMSERVICOSERVSOLIC_S');
                    CMWeb.CDCadOrdemServicoServSolicCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                    CMWeb.CDCadOrdemServicoServSolicCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
                    CMWeb.CDCadOrdemServicoServSolicITEM.AsString             := CDItensProbITEM.AsString;
                    CMWeb.CDCadOrdemServicoServSolicDESCRICAO.AsString        := CDItensProbDESCINSPECAO.AsString;
                    CMWeb.CDCadOrdemServicoServSolicEQUIPPARADO.AsString      := CDItensProbEQUIPPARADO.AsString;
                    CMWeb.CDCadOrdemServicoServSolicTEMPOEXECUCAO.AsString    := CDItensProbTEMPO.AsString;
                    CMWeb.CDCadOrdemServicoServSolicPARTE.AsString            := CDItensProbDESCPARTE.AsString;
                    CMWeb.CDCadOrdemServicoServSolic.Post;

                    CDItensProb.Next;
                  end;
              end;
              CMWeb.CDManutPeriodicas.Edit; CMWeb.CDManutPeriodicas.ApplyUpdates(0); CMWeb.CDManutPeriodicas.Refresh;
              if CMWeb.CDManutPeriodicasItens.IsEmpty = False then
                begin
                  CMWeb.CDManutPeriodicasItens.Edit; CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
                end;
              if CMWeb.CDManutPeriodicasItensEsp.IsEmpty = False then
                begin
                  CMWeb.CDManutPeriodicasItensEsp.Edit; CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
                end;
              if CMWeb.CDCadManutProgEquip.Active = True then
                begin
                  CMWeb.CDCadManutProgEquip.Edit;
                  CMWeb.CDCadManutProgEquip.ApplyUpdates(0);
                end;
              if CMWeb.CDCadOrdemServicoServSolic.Active = True then
                begin
                  CMWeb.CDCadOrdemServicoServSolic.Edit;
                  CMWeb.CDCadOrdemServicoServSolic.ApplyUpdates(0);
                end;
              CDItensProb.Close;
            end;
        end;
      1:
        begin
          if CMWeb.CDLubrificPeriodicas.IsEmpty = True then Exit;

          if CMWeb.CDLubrificPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

          LTexto := PChar('Deseja realmente efetuar o fechamento da Lubrificação: ' + CMWeb.CDLubrificPeriodicasDESCRICAO.AsString);
          if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
            begin
              if CMWeb.CDLubrificPeriodicasSITUACAOOS.AsString <> 'FECHADA' then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'ORDEM DE SERVIÇO NÃO FECHADA!';
                  Exit;
                end;
              if EdtExecucao.Date = 0 then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DATA DE EXECUÇÃO!';
                  EdtExecucao.SetFocus;
                  Exit;
                end;

              if EdtResponsavel.Text = '' then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FUNCIONÁRIO!';
                  EdtResponsavel.SetFocus;
                  Exit;
                end;

              CMWeb.CDLubrificPeriodicas.Edit;
              CMWeb.CDLubrificPeriodicasSITUACAO.AsString         := 'FECHADA';
              CMWeb.CDLubrificPeriodicasREALIZADA.AsString        := 'S';
              CMWeb.CDLubrificPeriodicasDATAFECHAMENTO.AsDateTime := DateOf(CMWeb.FDataHoraServidor);
              CMWeb.CDLubrificPeriodicasDATAEXECUCAO.AsDateTime   := EdtExecucao.Date;
              CMWeb.CDLubrificPeriodicasMATRICULA.AsString        := EdtMatricula.Text;
              CMWeb.CDLubrificPeriodicas.Post;

              CMWeb.CDLubrificPeriodicasItens.First; CMWeb.CDLubrificPeriodicasItensEsp.First;

              //Habilita a Lubrificenção para ser programada novamente
              if CMWeb.CDLubrificPeriodicasREPROGRAMAR1.AsString = 'Execução' then
                begin
                  CMWeb.CDCadLubrificProgEquip.Close;
                  CMWeb.CDCadLubrificProgEquip.Params[0].AsString := CMWeb.CDLubrificPeriodicasCODIGO.AsString;
                  CMWeb.CDCadLubrificProgEquip.Params[1].AsString := CMWeb.FCodEmpresa;
                  CMWeb.CDCadLubrificProgEquip.Params[2].AsString := CMWeb.CDLubrificPeriodicasCODEQUIPAMENTO.AsString;
                  CMWeb.CDCadLubrificProgEquip.Open;
                  if CMWeb.CDCadLubrificProgEquip.IsEmpty = False then
                    begin
                      CMWeb.CDCadLubrificProgEquip.Edit;
                      CMWeb.CDCadLubrificProgEquipRELATORIO.AsString    := 'N';
                      CMWeb.CDCadLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(CMWeb.CDCadLubrificProgEquipDTAINICIO1.AsDateTime, CMWeb.CDCadLubrificProgEquipFREQUENCIA1.AsInteger);
                      CMWeb.CDCadLubrificProgEquip.Post;
                    end;
                end;

              //Verifica itens problemáticos detectados após a Lubrificenção
              CDItensProb.Close; CDItensProb.CreateDataSet; CDItensProb.Open; CDItensProb.EmptyDataSet; CDItensProb.Edit;
              CMWeb.CDLubrificPeriodicasItens.First;
              while not CMWeb.CDLubrificPeriodicasItens.Eof = True do
                begin
                  if (CMWeb.CDLubrificPeriodicasItensRUIM.AsString = 'S') or (CMWeb.CDLubrificPeriodicasItensREGULAR.AsString = 'S') then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := CMWeb.CDLubrificPeriodicasItensCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := CMWeb.CDLubrificPeriodicasItensCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := CMWeb.CDLubrificPeriodicasItensPARTE.AsString;
                      CDItensProbITEM.AsString         := CMWeb.CDLubrificPeriodicasItensITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := CMWeb.CDLubrificPeriodicasItensDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := CMWeb.CDLubrificPeriodicasItensTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := CMWeb.CDLubrificPeriodicasItensEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := CMWeb.CDLubrificPeriodicasItensBOM.AsString;
                      CDItensProbREGULAR.AsString      := CMWeb.CDLubrificPeriodicasItensREGULAR.AsString;
                      CDItensProbRUIM.AsString         := CMWeb.CDLubrificPeriodicasItensRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := CMWeb.CDLubrificPeriodicasItensCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := CMWeb.CDLubrificPeriodicasItensHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  CMWeb.CDLubrificPeriodicasItens.Next;
                end;

              CMWeb.CDLubrificPeriodicasItensEsp.First;
              while not CMWeb.CDLubrificPeriodicasItensEsp.Eof = True do
                begin
                  if CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString = 'S' then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := CMWeb.CDLubrificPeriodicasItensEspCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := CMWeb.CDLubrificPeriodicasItensEspCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := CMWeb.CDLubrificPeriodicasItensEspPARTE.AsString;
                      CDItensProbITEM.AsString         := CMWeb.CDLubrificPeriodicasItensEspITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := CMWeb.CDLubrificPeriodicasItensEspDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := CMWeb.CDLubrificPeriodicasItensEspTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := CMWeb.CDLubrificPeriodicasItensEspEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := CMWeb.CDLubrificPeriodicasItensEspBOM.AsString;
                      CDItensProbREGULAR.AsString      := CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString;
                      CDItensProbRUIM.AsString         := CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := CMWeb.CDLubrificPeriodicasItensEspCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := CMWeb.CDLubrificPeriodicasItensEspHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  CMWeb.CDLubrificPeriodicasItensEsp.Next;
                end;

            //Gerar OS com itens problemáticos
            if CDItensProb.RecordCount > 0 then
              begin
                LCodOrdemServico := CMWeb.SMClient.GerarOS(CMWeb.FCodUsuario, CMWeb.FCodEmpresa, CMWeb.CDLubrificPeriodicasDESCRICAO.AsString + ' (Retorno)'
                                                              , CMWeb.CDLubrificPeriodicasCODEQUIPAMENTO.AsString, CMWeb.CDLubrificPeriodicasCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                              , EmptyStr, 'Emergência', 'Para o Equipamento');

                CMWeb.CDOrdemServicoGerencia.Append;
                CMWeb.CDOrdemServicoGerenciaCODIGO.AsInteger        := LCodOrdemServico;
                CMWeb.CDOrdemServicoGerenciaCODEMPRESA.AsString     := CMWeb.FCodEmpresa;
                CMWeb.CDOrdemServicoGerenciaDESCRICAO.AsString      := CMWeb.CDLubrificPeriodicasDESCRICAO.AsString + ' (Retorno)';
                CMWeb.CDOrdemServicoGerenciaDATACADASTRO.AsDateTime   := CMWeb.FDataHoraServidor;
                CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString       := 'CADASTRADA';
                CMWeb.CDOrdemServicoGerenciaCODMANUTENCAO.AsString  := CMWeb.CDLubrificPeriodicasCODIGO.AsString;
                CMWeb.CDOrdemServicoGerenciaEQUIPAMENTO.AsString    := CMWeb.CDLubrificPeriodicasEQUIPAMENTO.AsString;
                CMWeb.CDOrdemServicoGerenciaSOLICTRAB.AsString      := 'N';
                CMWeb.CDOrdemServicoGerenciaCODEQUIPAMENTO.AsString := CMWeb.CDLubrificPeriodicasCODEQUIPAMENTO.AsString;
                CMWeb.CDOrdemServicoGerencia.Post;

                CMWeb.CDLubrificPeriodicas.Edit;
                CMWeb.CDLubrificPeriodicasGEROUOS.AsString          := 'S';
                //CMWeb.CDLubrificPeriodicasCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                CMWeb.CDLubrificPeriodicas.Post;

                CMWeb.CDCadOrdemServicoServSolic.Close;
                CMWeb.CDCadOrdemServicoServSolic.Params[0].AsString  := CMWeb.FCodEmpresa;
                CMWeb.CDCadOrdemServicoServSolic.Params[1].AsInteger := LCodOrdemServico;
                CMWeb.CDCadOrdemServicoServSolic.Open;
                CDItensProb.First;
                while not CDItensProb.Eof = True do
                  begin
                    CMWeb.CDCadOrdemServicoServSolic.Append;
                    //CMWeb.CDCadOrdemServicoServSolicCODIGO.AsInteger          := CMWeb.SMWebClient.GerarSequencia('ORDEMSERVICOSERVSOLIC_S');
                    CMWeb.CDCadOrdemServicoServSolicCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                    CMWeb.CDCadOrdemServicoServSolicCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
                    CMWeb.CDCadOrdemServicoServSolicITEM.AsString             := CDItensProbITEM.AsString;
                    CMWeb.CDCadOrdemServicoServSolicDESCRICAO.AsString        := CDItensProbDESCINSPECAO.AsString;
                    CMWeb.CDCadOrdemServicoServSolicEQUIPPARADO.AsString      := CDItensProbEQUIPPARADO.AsString;
                    CMWeb.CDCadOrdemServicoServSolicTEMPOEXECUCAO.AsString    := CDItensProbTEMPO.AsString;
                    CMWeb.CDCadOrdemServicoServSolicPARTE.AsString            := CDItensProbDESCPARTE.AsString;
                    CMWeb.CDCadOrdemServicoServSolic.Post;

                    CDItensProb.Next;
                  end;
              end;
              CMWeb.CDLubrificPeriodicas.Edit; CMWeb.CDLubrificPeriodicas.ApplyUpdates(0); CMWeb.CDLubrificPeriodicas.Refresh;
              if CMWeb.CDLubrificPeriodicasItens.IsEmpty = False then
                begin
                  CMWeb.CDLubrificPeriodicasItens.Edit; CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
                end;
              if CMWeb.CDLubrificPeriodicasItensEsp.IsEmpty = False then
                begin
                  CMWeb.CDLubrificPeriodicasItensEsp.Edit; CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
                end;
              if CMWeb.CDCadLubrificProgEquip.Active = True then
                begin
                  CMWeb.CDCadLubrificProgEquip.Edit;
                  CMWeb.CDCadLubrificProgEquip.ApplyUpdates(0);
                end;
              if CMWeb.CDCadOrdemServicoServSolic.Active = True then
                begin
                  CMWeb.CDCadOrdemServicoServSolic.Edit;
                  CMWeb.CDCadOrdemServicoServSolic.ApplyUpdates(0);
                end;
              CDItensProb.Close;
            end;
        end;
      2:
        begin
          if CMWeb.CDRotaPeriodicas.IsEmpty = True then Exit;

          if CMWeb.CDRotaPeriodicasManutSITUACAO.AsString = 'FECHADA' then Exit;

          LTexto := PChar('Deseja realmente efetuar o fechamento da rota: ' + CMWeb.CDManutPeriodicasDESCRICAO.AsString);
          if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
            begin
              if CMWeb.CDRotaPeriodicasSITUACAOOS.AsString <> 'FECHADA' then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'ORDEM DE SERVIÇO NÃO FECHADA!';
                  Exit;
                end;
              if EdtExecucao.Date = 0 then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DATA DE EXECUÇÃO!';
                  EdtExecucao.SetFocus;
                  Exit;
                end;

              if EdtResponsavel.Text = '' then
                begin
                  PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FUNCIONÁRIO!';
                  EdtResponsavel.SetFocus;
                  Exit;
                end;

              CMWeb.CDRotaPeriodicasManut.Edit;
              CMWeb.CDRotaPeriodicasManutSITUACAO.AsString         := 'FECHADA';
              CMWeb.CDRotaPeriodicasManutREALIZADA.AsString        := 'S';
              CMWeb.CDRotaPeriodicasManutDATAFECHAMENTO.AsDateTime := DateOf(CMWeb.FDataHoraServidor);
              CMWeb.CDRotaPeriodicasManutDATAEXECUCAO.AsDateTime   := EdtExecucao.Date;
              CMWeb.CDRotaPeriodicasManutMATRICULA.AsString        := EdtMatricula.Text;
              CMWeb.CDRotaPeriodicasManut.Post;

              //Habilita a rota para ser programada novamente
              if CMWeb.CDRotaPeriodicasREPROGRAMAR.AsString = 'Execução' then
                begin
                  CMWeb.CDRotaPeriodicas.Edit;
                  CMWeb.CDRotaPeriodicasRELATORIO.AsString    := 'N';
                  CMWeb.CDRotaPeriodicasDTAINICIO1.AsDateTime := IncDay(CMWeb.CDRotaPeriodicasDTAINICIO1.AsDateTime, CMWeb.CDRotaPeriodicasFREQUENCIA.AsInteger);
                  CMWeb.CDRotaPeriodicas.Post;
                end;

              CMWeb.CDRotaPeriodicasManut.First;
              while not CMWeb.CDRotaPeriodicasManut.Eof do
                begin
                  CMWeb.CDRotaPeriodicasManutItens.First; CMWeb.CDRotaPeriodicasManutItensEsp.First;

                  //Habilita a manutenção para ser programada novamente
                  if CMWeb.CDRotaPeriodicasManutREPROGRAMAR1.AsString = 'Execução' then
                    begin
                      CMWeb.CDCadManutProgEquip.Close;
                      CMWeb.CDCadManutProgEquip.Params[0].AsString := CMWeb.CDRotaPeriodicasManutCODIGO.AsString;
                      CMWeb.CDCadManutProgEquip.Params[1].AsString := CMWeb.FCodEmpresa;
                      CMWeb.CDCadManutProgEquip.Params[2].AsString := CMWeb.CDRotaPeriodicasManutCODEQUIPAMENTO.AsString;
                      CMWeb.CDCadManutProgEquip.Open;
                      if CMWeb.CDCadManutProgEquip.IsEmpty = False then
                        begin
                          CMWeb.CDCadManutProgEquip.Edit;
                          CMWeb.CDCadManutProgEquipRELATORIO.AsString    := 'N';
                          CMWeb.CDCadManutProgEquipDTAINICIO1.AsDateTime := IncDay(CMWeb.CDCadManutProgEquipDTAINICIO1.AsDateTime, CMWeb.CDCadManutProgEquipFREQUENCIA1.AsInteger);
                          CMWeb.CDCadManutProgEquip.Post;
                        end;
                    end;

                  //Verifica itens problemáticos detectados após a manutenção
                  CDItensProb.Close; CDItensProb.CreateDataSet; CDItensProb.Open; CDItensProb.EmptyDataSet; CDItensProb.Edit;
                  while not CMWeb.CDRotaPeriodicasManutItens.Eof = True do
                    begin
                      if (CMWeb.CDRotaPeriodicasManutItensRUIM.AsString = 'S') or (CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString = 'S') then
                        begin
                          CDItensProb.Append;
                          CDItensProbCODITEM.AsString      := CMWeb.CDRotaPeriodicasManutItensCODIGO.AsString;
                          CDItensProbCODPARTE.AsString     := CMWeb.CDRotaPeriodicasManutItensCODPARTE.AsString;
                          CDItensProbDESCPARTE.AsString    := CMWeb.CDRotaPeriodicasManutItensPARTE.AsString;
                          CDItensProbITEM.AsString         := CMWeb.CDRotaPeriodicasManutItensITEM.AsString;
                          CDItensProbDESCINSPECAO.AsString := CMWeb.CDRotaPeriodicasManutItensDESCINSPECAO.AsString;
                          CDItensProbTEMPO.AsString        := CMWeb.CDRotaPeriodicasManutItensTEMPO.AsString;
                          CDItensProbEQUIPPARADO.AsString  := CMWeb.CDRotaPeriodicasManutItensEQUIPPARADO.AsString;
                          CDItensProbEXECUTADO.AsString    := CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString;
                          CDItensProbBOM.AsString          := CMWeb.CDRotaPeriodicasManutItensBOM.AsString;
                          CDItensProbREGULAR.AsString      := CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString;
                          CDItensProbRUIM.AsString         := CMWeb.CDRotaPeriodicasManutItensRUIM.AsString;
                          CDItensProbCODEMPRESA.AsString   := CMWeb.CDRotaPeriodicasManutItensCODEMPRESA.AsString;
                          CDItensProbHISTORICO.AsString    := CMWeb.CDRotaPeriodicasManutItensHISTORICO.AsString;
                          CDItensProb.Post;
                        end;
                      CMWeb.CDRotaPeriodicasManutItens.Next;
                    end;

                  while not CMWeb.CDRotaPeriodicasManutItensEsp.Eof = True do
                    begin
                      if CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString = 'S' then
                        begin
                          CDItensProb.Append;
                          CDItensProbCODITEM.AsString      := CMWeb.CDRotaPeriodicasManutItensEspCODIGO.AsString;
                          CDItensProbCODPARTE.AsString     := CMWeb.CDRotaPeriodicasManutItensEspCODPARTE.AsString;
                          CDItensProbDESCPARTE.AsString    := CMWeb.CDRotaPeriodicasManutItensEspPARTE.AsString;
                          CDItensProbITEM.AsString         := CMWeb.CDRotaPeriodicasManutItensEspITEM.AsString;
                          CDItensProbDESCINSPECAO.AsString := CMWeb.CDRotaPeriodicasManutItensEspDESCINSPECAO.AsString;
                          CDItensProbTEMPO.AsString        := CMWeb.CDRotaPeriodicasManutItensEspTEMPO.AsString;
                          CDItensProbEQUIPPARADO.AsString  := CMWeb.CDRotaPeriodicasManutItensEspEQUIPPARADO.AsString;
                          CDItensProbEXECUTADO.AsString    := CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString;
                          CDItensProbBOM.AsString          := CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString;
                          CDItensProbREGULAR.AsString      := CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString;
                          CDItensProbRUIM.AsString         := CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString;
                          CDItensProbCODEMPRESA.AsString   := CMWeb.CDRotaPeriodicasManutItensEspCODEMPRESA.AsString;
                          CDItensProbHISTORICO.AsString    := CMWeb.CDRotaPeriodicasManutItensEspHISTORICO.AsString;
                          CDItensProb.Post;
                        end;
                      CMWeb.CDRotaPeriodicasManutItensEsp.Next;
                    end;

                  CMWeb.CDRotaPeriodicasManut.Next;
                end;

              //Gerar OS com itens problemáticos
              if CDItensProb.RecordCount > 0 then
                begin
                  LCodOrdemServico := CMWeb.SMClient.GerarOS(CMWeb.FCodUsuario, CMWeb.FCodEmpresa, CMWeb.CDRotaPeriodicasDESCRICAO.AsString + ' (Retorno)'
                                                                , CMWeb.CDRotaPeriodicasManutCODEQUIPAMENTO.AsString, CMWeb.CDRotaPeriodicasCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                                , EmptyStr, 'Emergência', 'Para o Equipamento');


                  CMWeb.CDOrdemServicoGerencia.Append;
                  CMWeb.CDOrdemServicoGerenciaCODIGO.AsInteger        := LCodOrdemServico;
                  CMWeb.CDOrdemServicoGerenciaCODEMPRESA.AsString     := CMWeb.FCodEmpresa;
                  CMWeb.CDOrdemServicoGerenciaDESCRICAO.AsString      := CMWeb.CDRotaPeriodicasManutDESCRICAO.AsString + ' (Retorno)';
                  CMWeb.CDOrdemServicoGerenciaDATACADASTRO.AsDateTime := CMWeb.FDataHoraServidor;
                  CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString       := 'CADASTRADA';
                  CMWeb.CDOrdemServicoGerenciaCODMANUTENCAO.AsString  := CMWeb.CDRotaPeriodicasManutCODIGO.AsString;
                  CMWeb.CDOrdemServicoGerenciaEQUIPAMENTO.AsString    := CMWeb.CDRotaPeriodicasManutEQUIPAMENTO.AsString;
                  CMWeb.CDOrdemServicoGerenciaSOLICTRAB.AsString      := 'N';
                  CMWeb.CDOrdemServicoGerenciaCODEQUIPAMENTO.AsString := CMWeb.CDRotaPeriodicasManutCODEQUIPAMENTO.AsString;
                  CMWeb.CDOrdemServicoGerencia.Post;

                  CMWeb.CDRotaPeriodicasManut.Edit;
                  CMWeb.CDRotaPeriodicasManutGEROUOS.AsString          := 'S';
                  //CMWeb.CDRotaPeriodicasManutCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                  CMWeb.CDRotaPeriodicasManut.Post;

                  CMWeb.CDCadOrdemServicoServSolic.Close;
                  CMWeb.CDCadOrdemServicoServSolic.Params[0].AsString  := CMWeb.FCodEmpresa;
                  CMWeb.CDCadOrdemServicoServSolic.Params[1].AsInteger := LCodOrdemServico;
                  CMWeb.CDCadOrdemServicoServSolic.Open;
                  CDItensProb.First;
                  while not CDItensProb.Eof = True do
                    begin
                      CMWeb.CDCadOrdemServicoServSolic.Append;
                      //CMWeb.CDCadOrdemServicoServSolicCODIGO.AsInteger          := CMWeb.SMWebClient.GerarSequencia('ORDEMSERVICOSERVSOLIC_S');
                      CMWeb.CDCadOrdemServicoServSolicCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                      CMWeb.CDCadOrdemServicoServSolicCODEMPRESA.AsString       := CMWeb.FCodEmpresa;
                      CMWeb.CDCadOrdemServicoServSolicITEM.AsString             := CDItensProbITEM.AsString;
                      CMWeb.CDCadOrdemServicoServSolicDESCRICAO.AsString        := CDItensProbDESCINSPECAO.AsString;
                      CMWeb.CDCadOrdemServicoServSolicEQUIPPARADO.AsString      := CDItensProbEQUIPPARADO.AsString;
                      CMWeb.CDCadOrdemServicoServSolicTEMPOEXECUCAO.AsString    := CDItensProbTEMPO.AsString;
                      CMWeb.CDCadOrdemServicoServSolicPARTE.AsString            := CDItensProbDESCPARTE.AsString;
                      CMWeb.CDCadOrdemServicoServSolic.Post;

                      CDItensProb.Next;
                    end;
                end;

              CMWeb.CDRotaPeriodicas.Edit; CMWeb.CDRotaPeriodicas.ApplyUpdates(0); CMWeb.CDRotaPeriodicas.Refresh;
              CMWeb.CDRotaPeriodicasManut.Edit; CMWeb.CDRotaPeriodicasManut.ApplyUpdates(0);
              if CMWeb.CDRotaPeriodicasManutItens.IsEmpty = False then
                begin
                  CMWeb.CDRotaPeriodicasManutItens.Edit; CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
                end;
              if CMWeb.CDRotaPeriodicasManutItensEsp.IsEmpty = False then
                begin
                  CMWeb.CDRotaPeriodicasManutItensEsp.Edit; CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
                end;
              if CMWeb.CDCadManutProgEquip.Active = True then
                begin
                  CMWeb.CDCadManutProgEquip.Edit;
                  CMWeb.CDCadManutProgEquip.ApplyUpdates(0);
                end;
              if CMWeb.CDCadOrdemServicoServSolic.Active = True then
                begin
                  CMWeb.CDCadOrdemServicoServSolic.Edit; CMWeb.CDCadOrdemServicoServSolic.ApplyUpdates(0);
                end;
              CDItensProb.Close;
            end;
        end;
    End;
end;

procedure TFrmTelaInspFechamento.BtnFuncionarioClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    CMWeb.FTabela_auxiliar := 300;
    CMWeb.FNomeConsulta := 'Funcionários';
    CMWeb.FParamAuxiliar[1] := 'NOME';
    if CMWeb.ConsultarCombo <> EmptyStr then
      begin
        EdtMatricula.Text   := CMWeb.FCodCombo;
        EdtResponsavel.Text := CMWeb.FValorCombo;
      end;
  end
else
  begin
    Try
      if (CMWeb.CDUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(CMWeb.FNomeUsuario) <> 'sam_spmp') then Exit;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
CMWeb.FParamAuxiliar[1] := EmptyStr;
end;

procedure TFrmTelaInspFechamento.Button6Click(Sender: TObject);
begin
  inherited;
  Try
    if (CMWeb.CDUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(CMWeb.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaInspFechamentoHist, FrmTelaInspFechamentoHist);
    FrmTelaInspFechamentoHist.Caption := CMWeb.FValorCombo;
    FrmTelaInspFechamentoHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaInspFechamentoHist);
  End;
end;

procedure TFrmTelaInspFechamento.ConfigurarFiltros;
begin
CMWeb.CDManutPeriodicas.Filtered := False;
CMWeb.CDManutPeriodicas.Filter := EmptyStr;
  case PCInspecoes.ActivePageIndex of
    0://Manutenções
      begin
        case RGFiltro.ItemIndex of
          0:
            begin
              if CMWeb.CDManutPeriodicas.Filter = EmptyStr then
                CMWeb.CDManutPeriodicas.Filter := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
              else
                CMWeb.CDManutPeriodicas.Filter := CMWeb.CDManutPeriodicas.Filter + ' AND DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
            end;
          1:
            begin
              if CMWeb.CDManutPeriodicas.Filter = EmptyStr then
                CMWeb.CDManutPeriodicas.Filter := 'DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
              else
                CMWeb.CDManutPeriodicas.Filter := CMWeb.CDManutPeriodicas.Filter + ' AND DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
            end;
        end;

        if CMWeb.CDManutPeriodicas.Filter <> EmptyStr then
          CMWeb.CDManutPeriodicas.Filtered := True;
      end;
    1://Lubrificações
      begin
        case RGFiltro.ItemIndex of
          0:
            begin
              if CMWeb.CDLubrificPeriodicas.Filter = EmptyStr then
                CMWeb.CDLubrificPeriodicas.Filter := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
              else
                CMWeb.CDLubrificPeriodicas.Filter := CMWeb.CDLubrificPeriodicas.Filter + ' AND DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
            end;
          1:
            begin
              if CMWeb.CDLubrificPeriodicas.Filter = EmptyStr then
                CMWeb.CDLubrificPeriodicas.Filter := 'DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
              else
                CMWeb.CDLubrificPeriodicas.Filter := CMWeb.CDLubrificPeriodicas.Filter + ' AND DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', CMWeb.FDataHoraServidor))
            end;
        end;

        if CMWeb.CDLubrificPeriodicas.Filter <> EmptyStr then
          CMWeb.CDLubrificPeriodicas.Filtered := True;
      end;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensLubrificCellClick(Column: TColumn);
begin
  inherited;
if CMWeb.CDLubrificPeriodicasItens.IsEmpty then Exit;
if CMWeb.CDLubrificPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

if (GrdItensLubrific.SelectedIndex = 14) and (CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensLubrific.SelectedIndex = 14) and ((CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString = 'N') or (CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'S';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensLubrific.SelectedIndex = 15) and (Trim(CMWeb.CDLubrificPeriodicasItensBOM.AsString) = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensLubrific.SelectedIndex = 15) and ((Trim(CMWeb.CDLubrificPeriodicasItensBOM.AsString) = 'N') or (CMWeb.CDLubrificPeriodicasItensBOM.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'S';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensLubrific.SelectedIndex = 16) and (Trim(CMWeb.CDLubrificPeriodicasItensREGULAR.AsString) = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensLubrific.SelectedIndex = 16) and ((Trim(CMWeb.CDLubrificPeriodicasItensREGULAR.AsString) = 'N') or (CMWeb.CDLubrificPeriodicasItensREGULAR.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'S';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensLubrific.SelectedIndex = 17) and (Trim(CMWeb.CDLubrificPeriodicasItensRUIM.AsString) = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensLubrific.SelectedIndex = 17) and ((Trim(CMWeb.CDLubrificPeriodicasItensRUIM.AsString) = 'N') or (CMWeb.CDLubrificPeriodicasItensRUIM.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItens.Edit;
    CMWeb.CDLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensRUIM.AsString      := 'S';
    CMWeb.CDLubrificPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensLubrificDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdItensLubrific.Columns[Column.Index].Title.Font.Size := 7;

GrdItensLubrific.Columns[0].Visible  := False;  GrdItensLubrific.Columns[1].Visible  := False;
GrdItensLubrific.Columns[2].Visible  := False;  GrdItensLubrific.Columns[3].Visible  := False;
GrdItensLubrific.Columns[4].Visible  := False;  GrdItensLubrific.Columns[5].Visible  := False;
GrdItensLubrific.Columns[6].Visible  := False;  GrdItensLubrific.Columns[7].Visible  := False;
GrdItensLubrific.Columns[11].Visible  := False; GrdItensLubrific.Columns[13].Visible  := False;
GrdItensLubrific.Columns[18].Visible  := False; GrdItensLubrific.Columns[19].Visible  := False;
GrdItensLubrific.Columns[20].Visible  := False; GrdItensLubrific.Columns[21].Visible  := False;

GrdItensLubrific.Columns[8].Title.Caption   := 'Parte';
CMWeb.CDLubrificPeriodicasItens.Fields[8].DisplayWidth := 30;
GrdItensLubrific.Columns[9].Title.Caption   := 'Item';
CMWeb.CDLubrificPeriodicasItens.Fields[9].DisplayWidth := 30;
GrdItensLubrific.Columns[10].Title.Caption   := 'Inspeção';
CMWeb.CDLubrificPeriodicasItens.Fields[10].DisplayWidth := 45;
GrdItensLubrific.Columns[12].Title.Caption   := 'Tempo';
GrdItensLubrific.Columns[12].Title.Alignment := taCenter;
CMWeb.CDLubrificPeriodicasItens.Fields[12].DisplayWidth := 5;
GrdItensLubrific.Columns[14].Title.Caption   := 'Executado';
GrdItensLubrific.Columns[14].Title.Alignment := taCenter;
GrdItensLubrific.Columns[14].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItens.Fields[14].DisplayWidth := 5;
GrdItensLubrific.Columns[15].Title.Caption   := 'Bom';
GrdItensLubrific.Columns[15].Title.Alignment := taCenter;
GrdItensLubrific.Columns[15].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItens.Fields[14].DisplayWidth := 5;
GrdItensLubrific.Columns[16].Title.Caption   := 'Regular';
GrdItensLubrific.Columns[16].Title.Alignment := taCenter;
GrdItensLubrific.Columns[16].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItens.Fields[16].DisplayWidth := 5;
GrdItensLubrific.Columns[17].Title.Caption   := 'Ruim';
GrdItensLubrific.Columns[17].Title.Alignment := taCenter;
GrdItensLubrific.Columns[17].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItens.Fields[17].DisplayWidth := 5;
end;

procedure TFrmTelaInspFechamento.GrdItensLubrificDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if (Trim(Field.FieldName) = 'EXECUTADO') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 16, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'EXECUTADO') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 16, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'BOM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 4, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'BOM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 4, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'REGULAR') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 10, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'REGULAR') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 10, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'RUIM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 6, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'RUIM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 6, Rect.Top, 1);
   end;
end;

procedure TFrmTelaInspFechamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(CMWeb.FParamAuxiliar, SizeOf(CMWeb.FParamAuxiliar), #0);
CMWeb.CDLubrificPeriodicas.Close;
CMWeb.CDLubrificPeriodicasItens.Close;
CMWeb.CDCadLubrificProgEquip.Close;
CMWeb.CDManutPeriodicas.Close;
CMWeb.CDManutPeriodicasItens.Close;
CMWeb.CDCadManutProgEquip.Close;
CMWeb.CDRotaPeriodicasManut.Close;
CMWeb.CDRotaPeriodicasManutItens.Close;
CMWeb.CDRotaPeriodicasManutItensEsp.Close;
CMWeb.CDRotaPeriodicas.Close;
CMWeb.CDCadOrdemServicoServSolic.Close;
FillChar(CMWeb.FParamAuxiliar, SizeOf(CMWeb.FParamAuxiliar), #0);
end;

procedure TFrmTelaInspFechamento.FormCreate(Sender: TObject);
begin
  inherited;
CMWeb.CDManutPeriodicas.Close;
CMWeb.CDManutPeriodicas.Params[0].AsString := CMWeb.FCodEmpresa;
CMWeb.CDManutPeriodicas.Params[1].AsString := 'ABERTA';
//CMWeb.CDManutPeriodicas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
//CMWeb.CDManutPeriodicas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
CMWeb.CDManutPeriodicas.Open;
CMWeb.CDManutPeriodicasItens.Open;
CMWeb.CDManutPeriodicasItensEsp.Open;
TSManut.Caption := 'Manutenções ('+IntToStr(CMWeb.CDManutPeriodicas.RecordCount)+')';

CMWeb.CDLubrificPeriodicas.Close;
CMWeb.CDLubrificPeriodicas.Params[0].AsString := CMWeb.FCodEmpresa;
CMWeb.CDLubrificPeriodicas.Params[1].AsString := 'ABERTA';
//CMWeb.CDLubrificPeriodicas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
//CMWeb.CDLubrificPeriodicas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
CMWeb.CDLubrificPeriodicas.Open;
CMWeb.CDLubrificPeriodicasItens.Open;
CMWeb.CDLubrificPeriodicasItensEsp.Open;
TSLubrific.Caption := 'Lubrificações ('+IntToStr(CMWeb.CDLubrificPeriodicas.RecordCount)+')';

GrdManutencao.SelectedRows.CurrentRowSelected    := True;
GrdLubrificacao.SelectedRows.CurrentRowSelected := True;
if CMWeb.FEmpTransf = False then PCInspecoes.Pages[2].TabVisible := False
else
  begin
    CMWeb.CDRotaPeriodicas.Close;
    CMWeb.CDRotaPeriodicas.Params[0].AsString := CMWeb.FCodEmpresa;
    CMWeb.CDRotaPeriodicas.Open;
    CMWeb.CDRotaPeriodicasManut.Open;
    CMWeb.CDRotaPeriodicasManutItens.Open;
    CMWeb.CDRotaPeriodicasManutItensEsp.Open;
    TSRota.Caption := 'Rotas ('+IntToStr(CMWeb.CDRotaPeriodicas.RecordCount)+')';
    GrdRota.SelectedRows.CurrentRowSelected  := True;
  end;
end;

procedure TFrmTelaInspFechamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if Key = 116 then
  begin
    case PCInspecoes.ActivePageIndex of
      0:
        begin
          if (CMWeb.CDUsuarioPAcessoCADMANUTPROG.AsString = 'S') or (LowerCase(CMWeb.FNomeUsuario) = 'sam_spmp') then
            begin
              CMWEb.MSGAguarde();

              CMWeb.CDManutPeriodicas.Close;
              CMWeb.CDManutPeriodicasItens.Close;
              CMWeb.CDManutPeriodicasItensEsp.Close;
              CMWeb.CDManutPeriodicas.Params[0].AsString := CMWeb.FCodEmpresa;
              CMWeb.CDManutPeriodicas.Params[1].AsString := 'ABERTA';
              CMWeb.CDManutPeriodicas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(CMWeb.FDataHoraServidor, -18));
              CMWeb.CDManutPeriodicas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
              CMWeb.CDManutPeriodicas.Open;
              CMWeb.CDManutPeriodicasItens.Open;
              CMWeb.CDManutPeriodicasItensEsp.Open;
              TSManut.Caption := 'Manutenções ('+IntToStr(CMWeb.CDManutPeriodicas.RecordCount)+')';
              GrdManutencao.SelectedRows.CurrentRowSelected    := True;

              CMWeb.MSGAguarde('', False);
            end;
        end;
      1:
        begin
          if (CMWeb.CDUsuarioPAcessoCADMANUTPROG.AsString <> 'S') or (LowerCase(CMWeb.FNomeUsuario) = 'sam_spmp') then
            begin
              CMWEb.MSGAguarde();

              CMWeb.CDLubrificPeriodicas.Close;
              CMWeb.CDLubrificPeriodicasItens.Close;
              CMWeb.CDLubrificPeriodicasItensEsp.Close;
              CMWeb.CDLubrificPeriodicas.Params[0].AsString := CMWeb.FCodEmpresa;
              CMWeb.CDLubrificPeriodicas.Params[1].AsString := 'ABERTA';
              CMWeb.CDLubrificPeriodicas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(CMWeb.FDataHoraServidor, -18));
              CMWeb.CDLubrificPeriodicas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', CMWeb.FDataHoraServidor);
              CMWeb.CDLubrificPeriodicas.Open;
              CMWeb.CDLubrificPeriodicasItens.Open;
              CMWeb.CDLubrificPeriodicasItensEsp.Open;
              TSLubrific.Caption := 'Lubrificações ('+IntToStr(CMWeb.CDLubrificPeriodicas.RecordCount)+')';
              GrdLubrificacao.SelectedRows.CurrentRowSelected := True;

              CMWeb.MSGAguarde('', False);
            end;
        end;
      2:
        begin
          if (CMWeb.CDUsuarioPAcessoCADMANUTPROG.AsString <> 'S') or (LowerCase(CMWeb.FNomeUsuario) = 'sam_spmp') then
            begin
              CMWEb.MSGAguarde();

              if CMWeb.FEmpTransf = False then PCInspecoes.Pages[2].TabVisible := False
              else
                begin
                  CMWeb.CDRotaPeriodicas.Close;
                  CMWeb.CDRotaPeriodicasManut.Close;
                  CMWeb.CDRotaPeriodicasManutItens.Close;
                  CMWeb.CDRotaPeriodicasManutItensEsp.Close;
                  CMWeb.CDRotaPeriodicas.Params[0].AsString := CMWeb.FCodEmpresa;
                  CMWeb.CDRotaPeriodicas.Open;
                  CMWeb.CDRotaPeriodicasManut.Open;
                  CMWeb.CDRotaPeriodicasManutItens.Open;
                  CMWeb.CDRotaPeriodicasManutItensEsp.Open;
                  TSRota.Caption := 'Rotas ('+IntToStr(CMWeb.CDRotaPeriodicas.RecordCount)+')';
                  GrdRota.SelectedRows.CurrentRowSelected  := True;
                end;

              CMWeb.MSGAguarde('', False);
            end;
        end;
    end;
  end;
end;

procedure TFrmTelaInspFechamento.GrdManutencaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
GrdManutencao.Columns[Column.Index].Title.Font.Size := 7;

GrdManutencao.Columns[0].Visible := False;  GrdManutencao.Columns[1].Visible := False;
GrdManutencao.Columns[2].Visible := False;  GrdManutencao.Columns[3].Visible := False;
GrdManutencao.Columns[4].Visible := False;  GrdManutencao.Columns[6].Visible := False;
GrdManutencao.Columns[10].Visible := False; GrdManutencao.Columns[11].Visible := False;
GrdManutencao.Columns[12].Visible := False; GrdManutencao.Columns[13].Visible := False;
GrdManutencao.Columns[14].Visible := False; GrdManutencao.Columns[15].Visible := False;
GrdManutencao.Columns[16].Visible := False; GrdManutencao.Columns[17].Visible := False;
GrdManutencao.Columns[18].Visible := False; GrdManutencao.Columns[19].Visible := False;
GrdManutencao.Columns[20].Visible := False; GrdManutencao.Columns[21].Visible := False;
GrdManutencao.Columns[25].Visible := False; GrdManutencao.Columns[26].Visible := False;
GrdManutencao.Columns[27].Visible := False; GrdManutencao.Columns[28].Visible := False;

GrdManutencao.Columns[5].Title.Font.Style:= [fsBold];
GrdManutencao.Columns[5].Title.Caption   := 'OS';
GrdManutencao.Columns[5].Title.Alignment := taCenter;
GrdManutencao.Columns[5].Alignment       := taCenter;
GrdManutencao.Columns[7].Title.Caption   := 'Inspeção';
CMWeb.CDManutPeriodicas.Fields[7].DisplayWidth := 35;
GrdManutencao.Columns[8].Title.Caption   := 'Freq.';
GrdManutencao.Columns[8].Title.Alignment := taCenter;
GrdManutencao.Columns[8].Alignment       := taCenter;
CMWeb.CDManutPeriodicas.Fields[8].DisplayWidth := 8;
GrdManutencao.Columns[9].Title.Caption   := 'Vencida';
GrdManutencao.Columns[9].Title.Alignment := taCenter;
GrdManutencao.Columns[9].Alignment       := taCenter;
CMWeb.CDManutPeriodicas.Fields[9].DisplayWidth := 10;
GrdManutencao.Columns[22].Title.Caption   := 'Código';
GrdManutencao.Columns[22].Title.Alignment := taCenter;
GrdManutencao.Columns[22].Alignment       := taCenter;
CMWeb.CDManutPeriodicas.Fields[22].DisplayWidth := 12;
GrdManutencao.Columns[23].Title.Font.Style:= [fsBold];
GrdManutencao.Columns[23].Title.Caption   := 'Equipamento';
CMWeb.CDManutPeriodicas.Fields[23].DisplayWidth := 43;
GrdManutencao.Columns[24].Title.Caption   := 'Situação';
GrdManutencao.Columns[24].Title.Alignment := taCenter;
GrdManutencao.Columns[24].Alignment       := taCenter;
CMWeb.CDManutPeriodicas.Fields[24].DisplayWidth := 18;

if (Column.Field.FieldName = 'SITUACAOOS') then
  begin
    if GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'FECHADA' then
      begin
         GrdManutencao.Canvas.Brush.Color := clGray; GrdManutencao.Canvas.Font.Color:= clBlack;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'CADASTRADA') then
      begin
        if GrdManutencao.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> EmptyStr then
          begin GrdManutencao.Canvas.Brush.Color := clYellow; GrdManutencao.Canvas.Font.Color := clRed end
        else
          begin GrdManutencao.Canvas.Brush.Color := $00BBFFFF; GrdManutencao.Canvas.Font.Color := clRed end;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'PROGRAMADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clBlue; GrdManutencao.Canvas.Font.Color := clWhite;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'REPROGRAMADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clBlue; GrdManutencao.Canvas.Font.Color := clYellow;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'DESPROGRAMADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clYellow; GrdManutencao.Canvas.Font.Color := clBlue;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'REALIZADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clBlack; GrdManutencao.Canvas.Font.Color := clYellow;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'EXECUCAO')then
      begin
        GrdManutencao.Canvas.Brush.Color := clInfoBk; GrdManutencao.Canvas.Font.Color := clGreen;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'LIBERADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clGreen; GrdManutencao.Canvas.Font.Color := clWhite;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'FECHADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clGray; GrdManutencao.Canvas.Font.Color := clBlack;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'PARALISADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clRed; GrdManutencao.Canvas.Font.Color  := clYellow;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'CANCELADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clBlack; GrdManutencao.Canvas.Font.Color  := $00FF8000;
      end;

    GrdManutencao.Canvas.FillRect(Rect);
    GrdManutencao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;


procedure TFrmTelaInspFechamento.GrdManutencaoKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
if (Key = #13) and (GrdManutencao.SelectedIndex = 5) then
  begin
    LCampo :=CMWeb.CampoInputBox('SPMPWeb', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
        if GrdManutencao.DataSource.DataSet.Locate('CODORDEMSERVICO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
          Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
      end;

    {Try
      if (CMWeb.CDUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(CMWeb.FNomeUsuario) <> 'sam_spmp') then Exit;
      Application.CreateForm(TFrmTelaCadOrdemServicoGerencia, FrmTelaCadOrdemServicoGerencia);
      CMWeb.CDOrdemServicoGerencia.Locate('CODIGO', GrdManutencao.DataSource.DataSet.FieldByName('CODORDEMSERVICO').AsString, []);
      FrmTelaCadOrdemServicoGerencia.ShowModal;
    Finally
      if CMWeb.CDOrdemServicoGerenciaCODIGO.AsInteger = GrdManutencao.DataSource.DataSet.FieldByName('CODORDEMSERVICO').AsInteger then
        if ((CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString <> GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString)
          or (CMWeb.CDOrdemServicoGerenciaMATRICULA.AsString <> GrdManutencao.DataSource.DataSet.FieldByName('MATRICULAOS').AsString)) then
            begin
              GrdManutencao.DataSource.DataSet.Edit;
              GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString := CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString;
              GrdManutencao.DataSource.DataSet.FieldByName('MATRICULA').AsString  := CMWeb.CDOrdemServicoGerenciaMATRICULA.AsString;
              GrdManutencao.DataSource.DataSet.Post;
              GrdManutencao.Refresh;
            end;
      FreeAndNil(FrmTelaCadOrdemServicoGerencia);
    End;}
  end;
if (Key = #13) and (GrdManutencao.SelectedIndex = 23) then
  begin
    CMWeb.FTabela_auxiliar := 250;
    CMWeb.FNomeConsulta    := 'Equipamentos';
    CMWeb.FParamAuxiliar[1] := 'DESCRICAO';
    if CMWeb.ConsultarCombo <> EmptyStr then
      begin
        CMWeb.CDManutPeriodicas.Locate('EQUIPAMENTO', CMWeb.FValorCombo, []);
      end;
  end;
end;

procedure TFrmTelaInspFechamento.GrdManutencaoTitleClick(Column: TColumn);
begin
  inherited;
CMWeb.CDManutPeriodicas.IndexFieldNames := Column.FieldName;
end;

procedure TFrmTelaInspFechamento.GrdRotaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdRota.Columns[Column.Index].Title.Font.Size := 7;

GrdRota.Columns[0].Visible := False;
GrdRota.Columns[1].Visible := False;
GrdRota.Columns[5].Visible := False;
GrdRota.Columns[6].Visible := False;
GrdRota.Columns[9].Visible := False;
GrdRota.Columns[10].Visible := False;

GrdRota.Columns[2].Title.Font.Style:= [fsBold];
GrdRota.Columns[2].Title.Caption   := 'OS';
GrdRota.Columns[2].Title.Alignment := taCenter;
GrdRota.Columns[2].Alignment       := taCenter;
GrdRota.Columns[3].Title.Caption   := 'Rota';
CMWeb.CDRotaPeriodicas.Fields[3].DisplayWidth := 25;
GrdRota.Columns[4].Title.Caption   := 'Freq.';
GrdRota.Columns[4].Title.Alignment := taCenter;
GrdRota.Columns[4].Alignment       := taCenter;
CMWeb.CDRotaPeriodicas.Fields[4].DisplayWidth := 8;
GrdRota.Columns[7].Title.Caption   := 'Vencida';
GrdRota.Columns[7].Title.Alignment := taCenter;
GrdRota.Columns[7].Alignment       := taCenter;
CMWeb.CDRotaPeriodicas.Fields[7].DisplayWidth := 10;
GrdRota.Columns[8].Title.Caption   := 'Situação';
GrdRota.Columns[8].Title.Alignment := taCenter;
GrdRota.Columns[8].Alignment       := taCenter;
CMWeb.CDRotaPeriodicas.Fields[8].DisplayWidth := 18;

if (Column.Field.FieldName = 'SITUACAOOS') then
  begin
    if GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'FECHADA' then
      begin
         GrdRota.Canvas.Brush.Color := clGray; GrdRota.Canvas.Font.Color:= clBlack;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'CADASTRADA') then
      begin
        if GrdRota.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> EmptyStr then
          begin GrdRota.Canvas.Brush.Color := clYellow; GrdRota.Canvas.Font.Color := clRed end
        else
          begin GrdRota.Canvas.Brush.Color := $00BBFFFF; GrdRota.Canvas.Font.Color := clRed end;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'PROGRAMADA')then
      begin
        GrdRota.Canvas.Brush.Color := clBlue; GrdRota.Canvas.Font.Color := clWhite;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'REPROGRAMADA')then
      begin
        GrdRota.Canvas.Brush.Color := clBlue; GrdRota.Canvas.Font.Color := clYellow;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'DESPROGRAMADA')then
      begin
        GrdRota.Canvas.Brush.Color := clYellow; GrdRota.Canvas.Font.Color := clBlue;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'REALIZADA')then
      begin
        GrdRota.Canvas.Brush.Color := clBlack; GrdRota.Canvas.Font.Color := clYellow;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'EXECUCAO')then
      begin
        GrdRota.Canvas.Brush.Color := clInfoBk; GrdRota.Canvas.Font.Color := clGreen;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'LIBERADA')then
      begin
        GrdRota.Canvas.Brush.Color := clGreen; GrdRota.Canvas.Font.Color := clWhite;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'FECHADA')then
      begin
        GrdRota.Canvas.Brush.Color := clGray; GrdRota.Canvas.Font.Color := clBlack;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'PARALISADA')then
      begin
        GrdRota.Canvas.Brush.Color := clRed; GrdRota.Canvas.Font.Color  := clYellow;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'CANCELADA')then
      begin
        GrdRota.Canvas.Brush.Color := clBlack; GrdRota.Canvas.Font.Color  := $00FF8000;
      end;

    GrdRota.Canvas.FillRect(Rect);
    GrdRota.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TFrmTelaInspFechamento.GrdRotaKeyPress(Sender: TObject;
  var Key: Char);
//var
//LCampo : String;
begin
  inherited;
if (Key = #13) and (GrdRota.SelectedIndex = 2) then
  begin
    {LCampo := CMWeb.CampoInputBox('SPMPWeb', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
        if GrdManutencao.DataSource.DataSet.Locate('CODORDEMSERVICO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
          Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
      end;

    Try
      if (CMWeb.CDUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(CMWeb.FNomeUsuario) <> 'sam_spmp') then Exit;
      Application.CreateForm(TFrmTelaCadOrdemServicoGerencia, FrmTelaCadOrdemServicoGerencia);
      CMWeb.CDOrdemServicoGerencia.Locate('CODIGO', GrdRota.DataSource.DataSet.FieldByName('CODORDEMSERVICO').AsString, []);
      FrmTelaCadOrdemServicoGerencia.ShowModal;
    Finally
      if CMWeb.CDOrdemServicoGerenciaCODIGO.AsInteger = GrdRota.DataSource.DataSet.FieldByName('CODORDEMSERVICO').AsInteger then
        if ((CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString <> GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString)
          or (CMWeb.CDOrdemServicoGerenciaMATRICULA.AsString <> GrdRota.DataSource.DataSet.FieldByName('MATRICULAOS').AsString)) then
            begin
              GrdRota.DataSource.DataSet.Edit;
              GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString := CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString;
              GrdRota.DataSource.DataSet.FieldByName('MATRICULA').AsString  := CMWeb.CDOrdemServicoGerenciaMATRICULA.AsString;
              GrdRota.DataSource.DataSet.Post;
            end;
      FreeAndNil(FrmTelaCadOrdemServicoGerencia);
    End;}
  end;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdRotaManut.Columns[Column.Index].Title.Font.Size := 7;

GrdRotaManut.Columns[0].Visible := False;
GrdRotaManut.Columns[1].Visible := False;
GrdRotaManut.Columns[2].Visible := False;
GrdRotaManut.Columns[3].Visible := False;
GrdRotaManut.Columns[4].Visible := False;
GrdRotaManut.Columns[6].Visible := False;
GrdRotaManut.Columns[7].Visible := False;
GrdRotaManut.Columns[8].Visible := False;
GrdRotaManut.Columns[9].Visible := False;
GrdRotaManut.Columns[10].Visible := False;
GrdRotaManut.Columns[11].Visible := False;
GrdRotaManut.Columns[12].Visible := False;
GrdRotaManut.Columns[13].Visible := False;
GrdRotaManut.Columns[14].Visible := False;
GrdRotaManut.Columns[15].Visible := False;
GrdRotaManut.Columns[18].Visible := False;
GrdRotaManut.Columns[19].Visible := False;

GrdRotaManut.Columns[5].Title.Caption   := 'Inspeção';
CMWeb.CDRotaPeriodicasManut.Fields[5].DisplayWidth := 20;
GrdRotaManut.Columns[16].Title.Caption   := 'Código';
GrdRotaManut.Columns[16].Title.Alignment := taCenter;
GrdRotaManut.Columns[16].Alignment       := taCenter;
CMWeb.CDRotaPeriodicasManut.Fields[16].DisplayWidth := 12;
GrdRotaManut.Columns[17].Title.Font.Style:= [fsBold];
GrdRotaManut.Columns[17].Title.Caption   := 'Equipamento';
CMWeb.CDRotaPeriodicasManut.Fields[17].DisplayWidth := 30;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensCellClick(Column: TColumn);
begin
  inherited;
if CMWeb.CDRotaPeriodicasManutItens.IsEmpty then Exit;
if CMWeb.CDRotaPeriodicasManutSITUACAO.AsString = 'FECHADA' then Exit;

if (GrdRotaManutItens.SelectedIndex = 14) and (CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItens.SelectedIndex = 14) and ((CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString = 'N') or (CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'S';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItens.SelectedIndex = 15) and (Trim(CMWeb.CDRotaPeriodicasManutItensBOM.AsString) = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItens.SelectedIndex = 15) and ((Trim(CMWeb.CDRotaPeriodicasManutItensBOM.AsString) = 'N') or (CMWeb.CDRotaPeriodicasManutItensBOM.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'S';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItens.SelectedIndex = 16) and (Trim(CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString) = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItens.SelectedIndex = 16) and ((Trim(CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString) = 'N') or (CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'S';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItens.SelectedIndex = 17) and (Trim(CMWeb.CDRotaPeriodicasManutItensRUIM.AsString) = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItens.SelectedIndex = 17) and ((Trim(CMWeb.CDRotaPeriodicasManutItensRUIM.AsString) = 'N') or (CMWeb.CDRotaPeriodicasManutItensRUIM.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItens.Edit;
    CMWeb.CDRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensRUIM.AsString      := 'S';
    CMWeb.CDRotaPeriodicasManutItens.ApplyUpdates(0);
    Exit;
  end;

end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdRotaManutItens.Columns[Column.Index].Title.Font.Size := 7;

GrdRotaManutItens.Columns[0].Visible  := False;  GrdRotaManutItens.Columns[1].Visible  := False;
GrdRotaManutItens.Columns[2].Visible  := False;  GrdRotaManutItens.Columns[3].Visible  := False;
GrdRotaManutItens.Columns[4].Visible  := False;  GrdRotaManutItens.Columns[5].Visible  := False;
GrdRotaManutItens.Columns[6].Visible  := False;  GrdRotaManutItens.Columns[7].Visible  := False;
GrdRotaManutItens.Columns[11].Visible  := False; GrdRotaManutItens.Columns[13].Visible  := False;

GrdRotaManutItens.Columns[8].Title.Caption   := 'Parte';
CMWeb.CDRotaPeriodicasManutItens.Fields[8].DisplayWidth := 30;
GrdRotaManutItens.Columns[9].Title.Caption   := 'Item';
CMWeb.CDRotaPeriodicasManutItens.Fields[9].DisplayWidth := 30;
GrdRotaManutItens.Columns[10].Title.Caption   := 'Inspeção';
CMWeb.CDRotaPeriodicasManutItens.Fields[10].DisplayWidth := 45;
GrdRotaManutItens.Columns[12].Title.Caption   := 'Tempo';
GrdRotaManutItens.Columns[12].Title.Alignment := taCenter;
CMWeb.CDRotaPeriodicasManutItens.Fields[12].DisplayWidth := 5;
GrdRotaManutItens.Columns[14].Title.Caption   := 'Executado';
GrdRotaManutItens.Columns[14].Title.Alignment := taCenter;
GrdRotaManutItens.Columns[14].Alignment       := taCenter;
CMWeb.CDRotaPeriodicasManutItens.Fields[14].DisplayWidth := 5;
GrdRotaManutItens.Columns[15].Title.Caption   := 'Bom';
GrdRotaManutItens.Columns[15].Title.Alignment := taCenter;
GrdRotaManutItens.Columns[15].Alignment       := taCenter;
CMWeb.CDRotaPeriodicasManutItens.Fields[14].DisplayWidth := 5;
GrdRotaManutItens.Columns[16].Title.Caption   := 'Regular';
GrdRotaManutItens.Columns[16].Title.Alignment := taCenter;
GrdRotaManutItens.Columns[16].Alignment       := taCenter;
CMWeb.CDRotaPeriodicasManutItens.Fields[16].DisplayWidth := 5;
GrdRotaManutItens.Columns[17].Title.Caption   := 'Ruim';
GrdRotaManutItens.Columns[17].Title.Alignment := taCenter;
GrdRotaManutItens.Columns[17].Alignment       := taCenter;
CMWeb.CDRotaPeriodicasManutItens.Fields[17].DisplayWidth := 5;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if (Trim(Field.FieldName) = 'EXECUTADO') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 16, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'EXECUTADO') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 16, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'BOM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 4, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'BOM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 4, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'REGULAR') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 10, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'REGULAR') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 10, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'RUIM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 6, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'RUIM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 6, Rect.Top, 1);
   end;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensEspCellClick(Column: TColumn);
begin
  inherited;
if CMWeb.CDRotaPeriodicasManutItensEsp.IsEmpty then Exit;
if CMWeb.CDRotaPeriodicasManutSITUACAO.AsString = 'FECHADA' then Exit;

if (GrdRotaManutItensEsp.SelectedIndex = 14) and (CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItensEsp.SelectedIndex = 14) and ((CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString = 'N') or (CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'S';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItensEsp.SelectedIndex = 15) and (Trim(CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString) = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItensEsp.SelectedIndex = 15) and ((Trim(CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString) = 'N') or (CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'S';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItensEsp.SelectedIndex = 16) and (Trim(CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString) = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItensEsp.SelectedIndex = 16) and ((Trim(CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString) = 'N') or (CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'S';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItensEsp.SelectedIndex = 17) and (Trim(CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString) = 'S') then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdRotaManutItensEsp.SelectedIndex = 17) and ((Trim(CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString) = 'N') or (CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString = EmptyStr)) then
  begin
    CMWeb.CDRotaPeriodicasManutItensEsp.Edit;
    CMWeb.CDRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    CMWeb.CDRotaPeriodicasManutItensEspRUIM.AsString      := 'S';
    CMWeb.CDRotaPeriodicasManutItensEsp.ApplyUpdates(0);
    Exit;
  end;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensEspDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdRotaManutItensEsp.Columns[Column.Index].Title.Font.Size := 7;

GrdRotaManutItensEsp.Columns[0].Visible  := False;  GrdRotaManutItensEsp.Columns[1].Visible  := False;
GrdRotaManutItensEsp.Columns[2].Visible  := False;  GrdRotaManutItensEsp.Columns[3].Visible  := False;
GrdRotaManutItensEsp.Columns[4].Visible  := False;  GrdRotaManutItensEsp.Columns[5].Visible  := False;
GrdRotaManutItensEsp.Columns[6].Visible  := False;  GrdRotaManutItensEsp.Columns[7].Visible  := False;
GrdRotaManutItensEsp.Columns[11].Visible  := False; GrdRotaManutItensEsp.Columns[13].Visible  := False;
GrdRotaManutItensEsp.Columns[18].Visible  := False; GrdRotaManutItensEsp.Columns[19].Visible  := False;
GrdRotaManutItensEsp.Columns[20].Visible  := False; GrdRotaManutItensEsp.Columns[21].Visible  := False;

GrdRotaManutItensEsp.Columns[8].Title.Caption   := 'Parte';
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[8].DisplayWidth := 30;
GrdRotaManutItensEsp.Columns[9].Title.Caption   := 'Item';
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[9].DisplayWidth := 30;
GrdRotaManutItensEsp.Columns[10].Title.Caption   := 'Inspeção';
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[10].DisplayWidth := 45;
GrdRotaManutItensEsp.Columns[12].Title.Caption   := 'Tempo';
GrdRotaManutItensEsp.Columns[12].Title.Alignment := taCenter;
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[12].DisplayWidth := 5;
GrdRotaManutItensEsp.Columns[14].Title.Caption   := 'Executado';
GrdRotaManutItensEsp.Columns[14].Title.Alignment := taCenter;
GrdRotaManutItensEsp.Columns[14].Alignment       := taCenter;
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[14].DisplayWidth := 5;
GrdRotaManutItensEsp.Columns[15].Title.Caption   := 'Bom';
GrdRotaManutItensEsp.Columns[15].Title.Alignment := taCenter;
GrdRotaManutItensEsp.Columns[15].Alignment       := taCenter;
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[14].DisplayWidth := 5;
GrdRotaManutItensEsp.Columns[16].Title.Caption   := 'Regular';
GrdRotaManutItensEsp.Columns[16].Title.Alignment := taCenter;
GrdRotaManutItensEsp.Columns[16].Alignment       := taCenter;
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[16].DisplayWidth := 5;
GrdRotaManutItensEsp.Columns[17].Title.Caption   := 'Ruim';
GrdRotaManutItensEsp.Columns[17].Title.Alignment := taCenter;
GrdRotaManutItensEsp.Columns[17].Alignment       := taCenter;
CMWeb.CDCadRotasSequenciaInspItensEsp.Fields[17].DisplayWidth := 5;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensEspDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if (Trim(Field.FieldName) = 'EXECUTADO') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 16, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'EXECUTADO') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 16, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'BOM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 4, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'BOM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 4, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'REGULAR') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 10, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'REGULAR') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 10, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'RUIM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 6, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'RUIM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 6, Rect.Top, 1);
   end;

end;

procedure TFrmTelaInspFechamento.GrdItensManutCellClick(Column: TColumn);
begin
  inherited;
if CMWeb.CDManutPeriodicasItens.IsEmpty then Exit;
if CMWeb.CDManutPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

if (GrdItensManut.SelectedIndex = 14) and (CMWeb.CDManutPeriodicasItensEXECUTADO.AsString = 'S') then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensManut.SelectedIndex = 14) and ((CMWeb.CDManutPeriodicasItensEXECUTADO.AsString = 'N') or (CMWeb.CDManutPeriodicasItensEXECUTADO.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'S';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensManut.SelectedIndex = 15) and (Trim(CMWeb.CDManutPeriodicasItensBOM.AsString) = 'S') then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensManut.SelectedIndex = 15) and ((Trim(CMWeb.CDManutPeriodicasItensBOM.AsString) = 'N') or (CMWeb.CDManutPeriodicasItensBOM.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'S';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensManut.SelectedIndex = 16) and (Trim(CMWeb.CDManutPeriodicasItensREGULAR.AsString) = 'S') then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensManut.SelectedIndex = 16) and ((Trim(CMWeb.CDManutPeriodicasItensREGULAR.AsString) = 'N') or (CMWeb.CDManutPeriodicasItensREGULAR.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'S';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensManut.SelectedIndex = 17) and (Trim(CMWeb.CDManutPeriodicasItensRUIM.AsString) = 'S') then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensManut.SelectedIndex = 17) and ((Trim(CMWeb.CDManutPeriodicasItensRUIM.AsString) = 'N') or (CMWeb.CDManutPeriodicasItensRUIM.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItens.Edit;
    CMWeb.CDManutPeriodicasItensEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensRUIM.AsString      := 'S';
    CMWeb.CDManutPeriodicasItens.ApplyUpdates(0);
    Exit;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdItensManut.Columns[Column.Index].Title.Font.Size := 7;

GrdItensManut.Columns[0].Visible  := False;  GrdItensManut.Columns[1].Visible  := False;
GrdItensManut.Columns[2].Visible  := False;  GrdItensManut.Columns[3].Visible  := False;
GrdItensManut.Columns[4].Visible  := False;  GrdItensManut.Columns[5].Visible  := False;
GrdItensManut.Columns[6].Visible  := False;  GrdItensManut.Columns[7].Visible  := False;
GrdItensManut.Columns[11].Visible  := False; GrdItensManut.Columns[13].Visible  := False;
GrdItensManut.Columns[18].Visible  := False; GrdItensManut.Columns[19].Visible  := False;
GrdItensManut.Columns[20].Visible  := False; GrdItensManut.Columns[21].Visible  := False;

GrdItensManut.Columns[8].Title.Caption    := 'Parte';     CMWeb.CDManutPeriodicasItens.Fields[8].DisplayWidth  := 30;
GrdItensManut.Columns[9].Title.Caption    := 'Item';      CMWeb.CDManutPeriodicasItens.Fields[9].DisplayWidth  := 30;
GrdItensManut.Columns[10].Title.Caption   := 'Inspeção';  CMWeb.CDManutPeriodicasItens.Fields[10].DisplayWidth := 45;
GrdItensManut.Columns[12].Title.Caption   := 'Tempo';     CMWeb.CDManutPeriodicasItens.Fields[12].DisplayWidth := 5;  GrdItensManut.Columns[12].Title.Alignment := taCenter;
GrdItensManut.Columns[14].Title.Caption   := 'Executado'; CMWeb.CDManutPeriodicasItens.Fields[14].DisplayWidth := 5;  GrdItensManut.Columns[14].Title.Alignment := taCenter;
GrdItensManut.Columns[15].Title.Caption   := 'Bom';       CMWeb.CDManutPeriodicasItens.Fields[15].DisplayWidth := 5;  GrdItensManut.Columns[15].Title.Alignment := taCenter;
GrdItensManut.Columns[16].Title.Caption   := 'Regular';   CMWeb.CDManutPeriodicasItens.Fields[16].DisplayWidth := 5;  GrdItensManut.Columns[16].Title.Alignment := taCenter;
GrdItensManut.Columns[17].Title.Caption   := 'Ruim';      CMWeb.CDManutPeriodicasItens.Fields[17].DisplayWidth := 5;  GrdItensManut.Columns[17].Title.Alignment := taCenter;
end;

procedure TFrmTelaInspFechamento.GrdItensManutDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if (Trim(Field.FieldName) = 'EXECUTADO') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 16, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'EXECUTADO') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 16, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'BOM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 4, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'BOM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 4, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'REGULAR') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 10, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'REGULAR') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 10, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'RUIM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 6, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'RUIM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 6, Rect.Top, 1);
   end;
end;

procedure TFrmTelaInspFechamento.GrdLubrificacaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdLubrificacao.Columns[Column.Index].Title.Font.Size := 7;

GrdLubrificacao.Columns[0].Visible := False;  GrdLubrificacao.Columns[1].Visible := False;
GrdLubrificacao.Columns[2].Visible := False;  GrdLubrificacao.Columns[3].Visible := False;
GrdLubrificacao.Columns[4].Visible := False;  GrdLubrificacao.Columns[6].Visible := False;
GrdLubrificacao.Columns[10].Visible := False; GrdLubrificacao.Columns[11].Visible := False;
GrdLubrificacao.Columns[12].Visible := False; GrdLubrificacao.Columns[13].Visible := False;
GrdLubrificacao.Columns[14].Visible := False; GrdLubrificacao.Columns[15].Visible := False;
GrdLubrificacao.Columns[16].Visible := False; GrdLubrificacao.Columns[17].Visible := False;
GrdLubrificacao.Columns[18].Visible := False; GrdLubrificacao.Columns[19].Visible := False;
GrdLubrificacao.Columns[20].Visible := False; GrdLubrificacao.Columns[21].Visible := False;
GrdLubrificacao.Columns[25].Visible := False; GrdLubrificacao.Columns[26].Visible := False;
GrdLubrificacao.Columns[27].Visible := False; GrdLubrificacao.Columns[28].Visible := False;

GrdLubrificacao.Columns[5].Title.Font.Style:= [fsBold];
GrdLubrificacao.Columns[5].Title.Caption   := 'OS';
GrdLubrificacao.Columns[5].Title.Alignment := taCenter;
GrdLubrificacao.Columns[5].Alignment       := taCenter;
GrdLubrificacao.Columns[7].Title.Caption   := 'Inspeção';
CMWeb.CDLubrificPeriodicas.Fields[7].DisplayWidth := 35;
GrdLubrificacao.Columns[8].Title.Caption   := 'Freq.';
GrdLubrificacao.Columns[8].Title.Alignment := taCenter;
GrdLubrificacao.Columns[8].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicas.Fields[8].DisplayWidth := 8;
GrdLubrificacao.Columns[9].Title.Caption   := 'Vencida';
GrdLubrificacao.Columns[9].Title.Alignment := taCenter;
GrdLubrificacao.Columns[9].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicas.Fields[9].DisplayWidth := 10;
GrdLubrificacao.Columns[22].Title.Caption   := 'Código';
GrdLubrificacao.Columns[22].Title.Alignment := taCenter;
GrdLubrificacao.Columns[22].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicas.Fields[22].DisplayWidth := 12;
GrdLubrificacao.Columns[23].Title.Font.Style:= [fsBold];
GrdLubrificacao.Columns[23].Title.Caption   := 'Equipamento';
CMWeb.CDLubrificPeriodicas.Fields[23].DisplayWidth := 43;
GrdLubrificacao.Columns[24].Title.Caption   := 'Situação';
GrdLubrificacao.Columns[24].Title.Alignment := taCenter;
GrdLubrificacao.Columns[24].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicas.Fields[24].DisplayWidth := 18;

if (Column.Field.FieldName = 'SITUACAOOS') then
  begin
    if GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'FECHADA' then
      begin
         GrdLubrificacao.Canvas.Brush.Color := clGray; GrdLubrificacao.Canvas.Font.Color:= clBlack;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'CADASTRADA') then
      begin
        if GrdLubrificacao.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> EmptyStr then
          begin GrdLubrificacao.Canvas.Brush.Color := clYellow; GrdLubrificacao.Canvas.Font.Color := clRed end
        else
          begin GrdLubrificacao.Canvas.Brush.Color := $00BBFFFF; GrdLubrificacao.Canvas.Font.Color := clRed end;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'PROGRAMADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clBlue; GrdLubrificacao.Canvas.Font.Color := clWhite;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'REPROGRAMADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clBlue; GrdLubrificacao.Canvas.Font.Color := clYellow;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'DESPROGRAMADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clYellow; GrdLubrificacao.Canvas.Font.Color := clBlue;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'REALIZADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clBlack; GrdLubrificacao.Canvas.Font.Color := clYellow;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'EXECUCAO')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clInfoBk; GrdLubrificacao.Canvas.Font.Color := clGreen;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'LIBERADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clGreen; GrdLubrificacao.Canvas.Font.Color := clWhite;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'FECHADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clGray; GrdLubrificacao.Canvas.Font.Color := clBlack;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'PARALISADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clRed; GrdLubrificacao.Canvas.Font.Color  := clYellow;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'CANCELADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clBlack; GrdLubrificacao.Canvas.Font.Color  := $00FF8000;
      end;

    GrdLubrificacao.Canvas.FillRect(Rect);
    GrdLubrificacao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TFrmTelaInspFechamento.GrdLubrificacaoKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
if (Key = #13) and (GrdLubrificacao.SelectedIndex = 5) then
  begin
    LCampo :=CMWeb.CampoInputBox('SPMPWeb', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
        if GrdLubrificacao.DataSource.DataSet.Locate('CODORDEMSERVICO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
          Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
      end;

    {Try
      if (CMWeb.CDUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(CMWeb.FNomeUsuario) <> 'sam_spmp') then Exit;
      Application.CreateForm(TFrmTelaCadOrdemServicoGerencia, FrmTelaCadOrdemServicoGerencia);
      CMWeb.CDOrdemServicoGerencia.Locate('CODIGO', GrdLubrificacao.DataSource.DataSet.FieldByName('CODORDEMSERVICO').AsString, []);
      FrmTelaCadOrdemServicoGerencia.ShowModal;
    Finally
      if CMWeb.CDOrdemServicoGerenciaCODIGO.AsInteger = GrdLubrificacao.DataSource.DataSet.FieldByName('CODORDEMSERVICO').AsInteger then
        if ((CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString <> GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString)
          or (CMWeb.CDOrdemServicoGerenciaMATRICULA.AsString <> GrdLubrificacao.DataSource.DataSet.FieldByName('MATRICULAOS').AsString)) then
            begin
              GrdLubrificacao.DataSource.DataSet.Edit;
              GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString := CMWeb.CDOrdemServicoGerenciaSITUACAO.AsString;
              GrdLubrificacao.DataSource.DataSet.FieldByName('MATRICULA').AsString  := CMWeb.CDOrdemServicoGerenciaMATRICULA.AsString;
              GrdLubrificacao.DataSource.DataSet.Post;
            end;
      FreeAndNil(FrmTelaCadOrdemServicoGerencia);
    End;}
  end;
if (Key = #13) and (GrdLubrificacao.SelectedIndex = 23) then
  begin
    CMWeb.FTabela_auxiliar := 250;
    CMWeb.FParamAuxiliar[1] := 'DESCRICAO';
    CMWeb.FNomeConsulta    := 'Equipamentos';
    if CMWeb.ConsultarCombo <> EmptyStr then
      begin
        CMWeb.CDLubrificPeriodicas.Locate('EQUIPAMENTO', CMWeb.FValorCombo, []);
      end;
  end;
end;

procedure TFrmTelaInspFechamento.GrdLubrificacaoTitleClick(Column: TColumn);
begin
  inherited;
CMWeb.CDLubrificPeriodicas.IndexFieldNames := Column.FieldName;
end;

procedure TFrmTelaInspFechamento.GrdItensEspLubrificCellClick(Column: TColumn);
begin
  inherited;
if CMWeb.CDLubrificPeriodicasItensEsp.IsEmpty then Exit;
if CMWeb.CDLubrificPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

if (GrdItensEspLubrific.SelectedIndex = 14) and (CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspLubrific.SelectedIndex = 14) and ((CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString = 'N') or (CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'S';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspLubrific.SelectedIndex = 15) and (Trim(CMWeb.CDLubrificPeriodicasItensEspBOM.AsString) = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspLubrific.SelectedIndex = 15) and ((Trim(CMWeb.CDLubrificPeriodicasItensEspBOM.AsString) = 'N') or (CMWeb.CDLubrificPeriodicasItensEspBOM.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'S';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspLubrific.SelectedIndex = 16) and (Trim(CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString) = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspLubrific.SelectedIndex = 16) and ((Trim(CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString) = 'N') or (CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'S';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspLubrific.SelectedIndex = 17) and (Trim(CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString) = 'S') then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspLubrific.SelectedIndex = 17) and ((Trim(CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString) = 'N') or (CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString = EmptyStr)) then
  begin
    CMWeb.CDLubrificPeriodicasItensEsp.Edit;
    CMWeb.CDLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDLubrificPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDLubrificPeriodicasItensEspRUIM.AsString      := 'S';
    CMWeb.CDLubrificPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensEspLubrificDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
GrdItensEspLubrific.Columns[Column.Index].Title.Font.Size := 7;

GrdItensEspLubrific.Columns[0].Visible  := False;  GrdItensEspLubrific.Columns[1].Visible  := False;
GrdItensEspLubrific.Columns[2].Visible  := False;  GrdItensEspLubrific.Columns[3].Visible  := False;
GrdItensEspLubrific.Columns[4].Visible  := False;  GrdItensEspLubrific.Columns[5].Visible  := False;
GrdItensEspLubrific.Columns[6].Visible  := False;  GrdItensEspLubrific.Columns[7].Visible  := False;
GrdItensEspLubrific.Columns[11].Visible  := False; GrdItensEspLubrific.Columns[13].Visible  := False;
GrdItensEspLubrific.Columns[18].Visible  := False; GrdItensEspLubrific.Columns[19].Visible  := False;
GrdItensEspLubrific.Columns[20].Visible  := False; GrdItensEspLubrific.Columns[21].Visible  := False;

GrdItensEspLubrific.Columns[8].Title.Caption   := 'Parte';
CMWeb.CDLubrificPeriodicasItensEsp.Fields[8].DisplayWidth := 30;
GrdItensEspLubrific.Columns[9].Title.Caption   := 'Item';
CMWeb.CDLubrificPeriodicasItensEsp.Fields[9].DisplayWidth := 30;
GrdItensEspLubrific.Columns[10].Title.Caption   := 'Inspeção';
CMWeb.CDLubrificPeriodicasItensEsp.Fields[10].DisplayWidth := 45;
GrdItensEspLubrific.Columns[12].Title.Caption   := 'Tempo';
GrdItensEspLubrific.Columns[12].Title.Alignment := taCenter;
CMWeb.CDLubrificPeriodicasItensEsp.Fields[12].DisplayWidth := 5;
GrdItensEspLubrific.Columns[14].Title.Caption   := 'Executado';
GrdItensEspLubrific.Columns[14].Title.Alignment := taCenter;
GrdItensEspLubrific.Columns[14].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItensEsp.Fields[14].DisplayWidth := 5;
GrdItensEspLubrific.Columns[15].Title.Caption   := 'Bom';
GrdItensEspLubrific.Columns[15].Title.Alignment := taCenter;
GrdItensEspLubrific.Columns[15].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItensEsp.Fields[14].DisplayWidth := 5;
GrdItensEspLubrific.Columns[16].Title.Caption   := 'Regular';
GrdItensEspLubrific.Columns[16].Title.Alignment := taCenter;
GrdItensEspLubrific.Columns[16].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItensEsp.Fields[16].DisplayWidth := 5;
GrdItensEspLubrific.Columns[17].Title.Caption   := 'Ruim';
GrdItensEspLubrific.Columns[17].Title.Alignment := taCenter;
GrdItensEspLubrific.Columns[17].Alignment       := taCenter;
CMWeb.CDLubrificPeriodicasItensEsp.Fields[17].DisplayWidth := 5;
end;

procedure TFrmTelaInspFechamento.GrdItensEspLubrificDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if (Trim(Field.FieldName) = 'EXECUTADO') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 16, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'EXECUTADO') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 16, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'BOM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 4, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'BOM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 4, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'REGULAR') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 10, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'REGULAR') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 10, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'RUIM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 6, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'RUIM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 6, Rect.Top, 1);
   end;
end;

procedure TFrmTelaInspFechamento.GrdItensEspManutCellClick(Column: TColumn);
begin
  inherited;
if CMWeb.CDManutPeriodicasItensEsp.IsEmpty then Exit;
if CMWeb.CDManutPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

if (GrdItensEspManut.SelectedIndex = 14) and (CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString = 'S') then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspManut.SelectedIndex = 14) and ((CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString = 'N') or (CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'S';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspManut.SelectedIndex = 15) and (Trim(CMWeb.CDManutPeriodicasItensEspBOM.AsString) = 'S') then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspManut.SelectedIndex = 15) and ((Trim(CMWeb.CDManutPeriodicasItensEspBOM.AsString) = 'N') or (CMWeb.CDManutPeriodicasItensEspBOM.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'S';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspManut.SelectedIndex = 16) and (Trim(CMWeb.CDManutPeriodicasItensEspREGULAR.AsString) = 'S') then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspManut.SelectedIndex = 16) and ((Trim(CMWeb.CDManutPeriodicasItensEspREGULAR.AsString) = 'N') or (CMWeb.CDManutPeriodicasItensEspREGULAR.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'S';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspManut.SelectedIndex = 17) and (Trim(CMWeb.CDManutPeriodicasItensEspRUIM.AsString) = 'S') then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'N';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
if (GrdItensEspManut.SelectedIndex = 17) and ((Trim(CMWeb.CDManutPeriodicasItensEspRUIM.AsString) = 'N') or (CMWeb.CDManutPeriodicasItensEspRUIM.AsString = EmptyStr)) then
  begin
    CMWeb.CDManutPeriodicasItensEsp.Edit;
    CMWeb.CDManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    CMWeb.CDManutPeriodicasItensEspBOM.AsString       := 'N';
    CMWeb.CDManutPeriodicasItensEspREGULAR.AsString   := 'N';
    CMWeb.CDManutPeriodicasItensEspRUIM.AsString      := 'S';
    CMWeb.CDManutPeriodicasItensEsp.ApplyUpdates(0);
    Exit;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensEspManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdItensEspManut.Columns[Column.Index].Title.Font.Size := 7;

GrdItensEspManut.Columns[0].Visible  := False;  GrdItensEspManut.Columns[1].Visible  := False;
GrdItensEspManut.Columns[2].Visible  := False;  GrdItensEspManut.Columns[3].Visible  := False;
GrdItensEspManut.Columns[4].Visible  := False;  GrdItensEspManut.Columns[5].Visible  := False;
GrdItensEspManut.Columns[6].Visible  := False;  GrdItensEspManut.Columns[7].Visible  := False;
GrdItensEspManut.Columns[11].Visible  := False; GrdItensEspManut.Columns[13].Visible  := False;
GrdItensEspManut.Columns[18].Visible  := False; GrdItensEspManut.Columns[19].Visible  := False;
GrdItensEspManut.Columns[20].Visible  := False; GrdItensEspManut.Columns[21].Visible  := False;

GrdItensEspManut.Columns[8].Title.Caption   := 'Parte';
CMWeb.CDManutPeriodicasItensEsp.Fields[8].DisplayWidth := 30;
GrdItensEspManut.Columns[9].Title.Caption   := 'Item';
CMWeb.CDManutPeriodicasItensEsp.Fields[9].DisplayWidth := 30;
GrdItensEspManut.Columns[10].Title.Caption   := 'Inspeção';
CMWeb.CDManutPeriodicasItensEsp.Fields[10].DisplayWidth := 45;
GrdItensEspManut.Columns[12].Title.Caption   := 'Tempo';
GrdItensEspManut.Columns[12].Title.Alignment := taCenter;
CMWeb.CDManutPeriodicasItensEsp.Fields[12].DisplayWidth := 5;
GrdItensEspManut.Columns[14].Title.Caption   := 'Executado';
GrdItensEspManut.Columns[14].Title.Alignment := taCenter;
GrdItensEspManut.Columns[14].Alignment       := taCenter;
CMWeb.CDManutPeriodicasItensEsp.Fields[14].DisplayWidth := 5;
GrdItensEspManut.Columns[15].Title.Caption   := 'Bom';
GrdItensEspManut.Columns[15].Title.Alignment := taCenter;
GrdItensEspManut.Columns[15].Alignment       := taCenter;
CMWeb.CDManutPeriodicasItensEsp.Fields[14].DisplayWidth := 5;
GrdItensEspManut.Columns[16].Title.Caption   := 'Regular';
GrdItensEspManut.Columns[16].Title.Alignment := taCenter;
GrdItensEspManut.Columns[16].Alignment       := taCenter;
CMWeb.CDManutPeriodicasItensEsp.Fields[16].DisplayWidth := 5;
GrdItensEspManut.Columns[17].Title.Caption   := 'Ruim';
GrdItensEspManut.Columns[17].Title.Alignment := taCenter;
GrdItensEspManut.Columns[17].Alignment       := taCenter;
CMWeb.CDManutPeriodicasItensEsp.Fields[17].DisplayWidth := 5;
end;

procedure TFrmTelaInspFechamento.GrdItensEspManutDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  inherited;
if (Trim(Field.FieldName) = 'EXECUTADO') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 16, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'EXECUTADO') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 16, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'BOM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 4, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'BOM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 4, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'REGULAR') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 10, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'REGULAR') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 10, Rect.Top, 1);
   end;

if (Trim(Field.FieldName) = 'RUIM') and (Trim(Field.AsString) = 'S') then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 6, Rect.Top, 0);
   end;
if (Trim(Field.FieldName) = 'RUIM') and ((Trim(Field.AsString) = 'N') or (Trim(Field.AsString) = EmptyStr)) then
   begin
     GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 6, Rect.Top, 1);
   end;
end;

procedure TFrmTelaInspFechamento.RGFiltroClick(Sender: TObject);
begin
  inherited;
ConfigurarFiltros;
end;

end.


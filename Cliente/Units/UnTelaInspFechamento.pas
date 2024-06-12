unit UnTelaInspFechamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, JvExMask, JvToolEdit, JvDBControls, Data.DB, System.DateUtils,
  Vcl.ImgList, Datasnap.DBClient, Vcl.ComCtrls, System.ImageList, FireDAC.Stan.Param,
  Vcl.Menus, JvExDBGrids, JvDBGrid;

type
  TFrmTelaInspFechamento = class(TFrmTelaPaiOkCancel)
    PBase: TPanel;
    BtnLimpar: TButton;
    RGFiltro: TRadioGroup;
    ImageList1: TImageList;
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
    TSRota: TTabSheet;
    Button6: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label11: TLabel;
    EdtExecucao: TJvDateEdit;
    Label2: TLabel;
    EdtMatricula: TEdit;
    EdtResponsavel: TEdit;
    BtnFuncionario: TButton;
    rgStatus: TRadioGroup;
    PopupMenuItens: TPopupMenu;
    Marcartodos1: TMenuItem;
    Desmarcartodos1: TMenuItem;
    PopupMenuItensEsp: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    BtnMaodeObra: TButton;
    GrdManutencao: TJvDBGrid;
    GrdItensManut: TJvDBGrid;
    GrdItensEspManut: TJvDBGrid;
    GrdLubrificacao: TJvDBGrid;
    GrdItensLubrific: TJvDBGrid;
    GrdItensEspLubrific: TJvDBGrid;
    GrdRota: TJvDBGrid;
    GrdRotaManut: TJvDBGrid;
    GrdRotaManutItens: TJvDBGrid;
    GrdRotaManutItensEsp: TJvDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGFiltroClick(Sender: TObject);
    procedure ConfigurarFiltros;
    procedure BtnOKClick(Sender: TObject);
    procedure GrdRotaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdRotaManutItensEspCellClick(Column: TColumn);
    procedure GrdRotaKeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure BtnFuncionarioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgStatusClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EdtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure PCInspecoesChange(Sender: TObject);
    procedure Marcartodos1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Desmarcartodos1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure BtnMaodeObraClick(Sender: TObject);
    procedure GrdManutencaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdManutencaoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdManutencaoTitleClick(Column: TColumn);
    procedure GrdItensManutCellClick(Column: TColumn);
    procedure GrdItensManutDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdItensEspManutCellClick(Column: TColumn);
    procedure GrdItensEspManutDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdLubrificacaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdItensLubrificCellClick(Column: TColumn);
    procedure GrdItensLubrificDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdLubrificacaoKeyPress(Sender: TObject; var Key: Char);
    procedure GrdItensEspLubrificCellClick(Column: TColumn);
    procedure GrdItensEspLubrificDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GrdRotaManutKeyPress(Sender: TObject; var Key: Char);
    procedure GrdRotaManutItensCellClick(Column: TColumn);
    procedure GrdRotaManutItensDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure GrdRotaManutItensEspDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    hora_futura: TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaInspFechamento: TFrmTelaInspFechamento;


implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServicoGerencia,
  UnTelaInspFechamentoHist, UnTelaCadFuncionarios, UnTelaCadOrdemServicoFechamento,
  UnDM;

procedure TFrmTelaInspFechamento.BtnOKClick(Sender: TObject);
var
LTexto: PChar;
LCodOrdemServico: Integer;
i: INteger;
begin
//  inherited;
if (DM.qryUsuarioPAlteracaoCADFECHAMANUT.AsString <> 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then Exit;

PAuxiliares.Caption := EmptyStr;
PAuxiliares.Font.Color := clBlack;

    Case PCInspecoes.ActivePageIndex of
      0:
        begin
          if DM.qryManutPeriodicas.IsEmpty = True then Exit;

          if DM.qryManutPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

          if DM.qryManutPeriodicasSITUACAOOS.AsString <> 'FECHADA' then
            begin
              PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'ORDEM DE SERVIÇO NÃO FECHADA!';
              Exit;
            end;

          LTexto := PChar('Deseja realmente efetuar o fechamento da manutenção: ' + DM.qryManutPeriodicasDESCRICAO.AsString);
          if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
            Begin
              if DM.qryManutPeriodicasSITUACAOOS.AsString <> 'FECHADA' then
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

              Timer1.Enabled := False;

              DM.qryDataHoraServidor.Refresh;
              DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

              DM.qryManutPeriodicas.Edit;
              DM.qryManutPeriodicasSITUACAO.AsString         := 'FECHADA';
              DM.qryManutPeriodicasREALIZADA.AsString        := 'S';
              DM.qryManutPeriodicasDATAFECHAMENTO.AsDateTime := DateOf(DM.FDataHoraServidor);
              DM.qryManutPeriodicasDATAEXECUCAO.AsDateTime   := EdtExecucao.Date;
              DM.qryManutPeriodicasMATRICULA.AsString        := EdtMatricula.Text;
              DM.qryManutPeriodicas.Post;

              DM.qryManutPeriodicasItens.First; DM.qryManutPeriodicasItensEsp.First;

              //Habilita a manutenção para ser programada novamente
              if DM.qryManutPeriodicasREPROGRAMAR1.AsString = 'Execução' then
                begin
                  DM.qryManutProgEquip.Close;
                  DM.qryManutProgEquip.Params[0].AsString := DM.qryManutPeriodicasCODIGO.AsString;
                  DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
                  DM.qryManutProgEquip.Params[2].AsString := DM.qryManutPeriodicasCODEQUIPAMENTO.AsString;
                  DM.qryManutProgEquip.Open;
                  if DM.qryManutProgEquip.IsEmpty = False then
                    begin
                      DM.qryManutProgEquip.Edit;
                      DM.qryManutProgEquipRELATORIO.AsString    := 'N';
                      DM.qryManutProgEquipDTAINICIO1.AsDateTime := IncDay(DM.qryManutPeriodicasDATAEXECUCAO.AsDateTime, DM.qryManutProgEquipFREQUENCIA1.AsInteger);
                      DM.qryManutProgEquip.Post;
                    end;
                end;

              //Verifica itens problemáticos detectados após a manutenção
              CDItensProb.Close; CDItensProb.CreateDataSet; CDItensProb.Open; CDItensProb.EmptyDataSet; CDItensProb.Edit;
              DM.qryManutPeriodicasItens.First;
              while not DM.qryManutPeriodicasItens.Eof = True do
                begin
                  if (DM.qryManutPeriodicasItensRUIM.AsString = 'S') or (DM.qryManutPeriodicasItensREGULAR.AsString = 'S') then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := DM.qryManutPeriodicasItensCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := DM.qryManutPeriodicasItensCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := DM.qryManutPeriodicasItensPARTE.AsString;
                      CDItensProbITEM.AsString         := DM.qryManutPeriodicasItensITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := DM.qryManutPeriodicasItensDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := DM.qryManutPeriodicasItensTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := DM.qryManutPeriodicasItensEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := DM.qryManutPeriodicasItensEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := DM.qryManutPeriodicasItensBOM.AsString;
                      CDItensProbREGULAR.AsString      := DM.qryManutPeriodicasItensREGULAR.AsString;
                      CDItensProbRUIM.AsString         := DM.qryManutPeriodicasItensRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := DM.qryManutPeriodicasItensCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := DM.qryManutPeriodicasItensHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  DM.qryManutPeriodicasItens.Next;
                end;

              DM.qryManutPeriodicasItensEsp.First;
              while not DM.qryManutPeriodicasItensEsp.Eof = True do
                begin
                  if DM.qryManutPeriodicasItensEspRUIM.AsString = 'S' then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := DM.qryManutPeriodicasItensEspCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := DM.qryManutPeriodicasItensEspCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := DM.qryManutPeriodicasItensEspPARTE.AsString;
                      CDItensProbITEM.AsString         := DM.qryManutPeriodicasItensEspITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := DM.qryManutPeriodicasItensEspDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := DM.qryManutPeriodicasItensEspTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := DM.qryManutPeriodicasItensEspEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := DM.qryManutPeriodicasItensEspEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := DM.qryManutPeriodicasItensEspBOM.AsString;
                      CDItensProbREGULAR.AsString      := DM.qryManutPeriodicasItensEspREGULAR.AsString;
                      CDItensProbRUIM.AsString         := DM.qryManutPeriodicasItensEspRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := DM.qryManutPeriodicasItensEspCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := DM.qryManutPeriodicasItensEspHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  DM.qryManutPeriodicasItensEsp.Next;
                end;

              //Gerar OS com itens problemáticos
              if CDItensProb.RecordCount > 0 then
                begin
                  LCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryManutPeriodicasDESCRICAO.AsString + ' (CORRETIVA)'
                                                                , DM.qryManutPeriodicasCODEQUIPAMENTO.AsString, DM.qryManutPeriodicasCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                                , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryManutPeriodicasCODCENTROCUSTO.AsString, EmptyStr, '0', DM.qryManutProgEquipCODOFICINA.AsString, EmptyStr, DM.qryManutProgEquipEQUIPPARADO.AsString, EmptyStr);


                  DM.qryManutPeriodicas.Edit;
                  DM.qryManutPeriodicasGEROUOS.AsString          := 'S';
                  //DM.qryManutPeriodicasCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                  DM.qryManutPeriodicas.Post;

                  DM.qryOrdemServicoServSolic.Close;
  //                DM.qryOrdemServicoServSolic.Params[0].AsString  := DM.FCodEmpresa;
                  DM.qryOrdemServicoServSolic.Params[0].AsInteger := LCodOrdemServico;
                  DM.qryOrdemServicoServSolic.Open;
                  CDItensProb.First;
                  while not CDItensProb.Eof = True do
                    begin
                      DM.qryOrdemServicoServSolic.Append;
                      //DM.qryOrdemServicoServSolicCODIGO.AsInteger          := DM.SMWebClient.GerarSequencia('ORDEMSERVICOSERVSOLIC_S');
                      DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                      DM.qryOrdemServicoServSolicCODEMPRESA.AsString       := DM.FCodEmpresa;
                      DM.qryOrdemServicoServSolicITEM.AsString             := CDItensProbITEM.AsString;
                      DM.qryOrdemServicoServSolicDESCRICAO.AsString        := CDItensProbDESCINSPECAO.AsString;
                      DM.qryOrdemServicoServSolicEQUIPPARADO.AsString      := CDItensProbEQUIPPARADO.AsString;
                      DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsString    := CDItensProbTEMPO.AsString;
                      DM.qryOrdemServicoServSolicPARTE.AsString            := CDItensProbDESCPARTE.AsString;
                      DM.qryOrdemServicoServSolic.Post;

                      CDItensProb.Next;
                    end;
                  CDItensProb.Close;
                end;

              DM.qryManutPeriodicas.Edit;
              DM.qryManutPeriodicas.Post;
              DM.qryManutPeriodicas.Refresh;
              // DM.qryManutPeriodicas.Delete;
              TSManut.Caption := 'Manutenções ('+IntToStr(DM.qryManutPeriodicas.RecordCount)+')';
            End;

          Timer1.Enabled := True;
          hora_futura := IncMinute(Now, 5);
        end;
      1:
        begin
          if DM.qryLubrificPeriodicas.IsEmpty = True then Exit;

          if DM.qryLubrificPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

          if DM.qryLubrificPeriodicasSITUACAOOS.AsString <> 'FECHADA' then
            begin
              PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'ORDEM DE SERVIÇO NÃO FECHADA!';
              Exit;
            end;

          LTexto := PChar('Deseja realmente efetuar o fechamento da Lubrificação: ' + DM.qryLubrificPeriodicasDESCRICAO.AsString);
          if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
            Begin

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

              Timer1.Enabled := False;

              DM.qryLubrificPeriodicas.Edit;
              DM.qryLubrificPeriodicasSITUACAO.AsString         := 'FECHADA';
              DM.qryLubrificPeriodicasREALIZADA.AsString        := 'S';
              DM.qryLubrificPeriodicasDATAFECHAMENTO.AsDateTime := DateOf(DM.FDataHoraServidor);
              DM.qryLubrificPeriodicasDATAEXECUCAO.AsDateTime   := EdtExecucao.Date;
              DM.qryLubrificPeriodicasMATRICULA.AsString        := EdtMatricula.Text;
              DM.qryLubrificPeriodicas.Post;

              DM.qryLubrificPeriodicasItens.First; DM.qryLubrificPeriodicasItensEsp.First;

              //Habilita a Lubrificação para ser programada novamente
              if DM.qryLubrificPeriodicasREPROGRAMAR1.AsString = 'Execução' then
                begin
                  DM.qryLubrificProgEquip.Close;
                  DM.qryLubrificProgEquip.Params[0].AsString := DM.qryLubrificPeriodicasCODIGO.AsString;
                  DM.qryLubrificProgEquip.Params[1].AsString := DM.FCodEmpresa;
                  DM.qryLubrificProgEquip.Params[2].AsString := DM.qryLubrificPeriodicasCODEQUIPAMENTO.AsString;
                  DM.qryLubrificProgEquip.Open;
                  if DM.qryLubrificProgEquip.IsEmpty = False then
                    begin
                      DM.qryLubrificProgEquip.Edit;
                      DM.qryLubrificProgEquipRELATORIO.AsString    := 'N';
                      //DM.qryLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(DM.qryLubrificProgEquipDTAINICIO1.AsDateTime, DM.qryLubrificProgEquipFREQUENCIA1.AsInteger);
                      DM.qryLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(DM.qryLubrificPeriodicasDATAEXECUCAO.AsDateTime, DM.qryLubrificProgEquipFREQUENCIA1.AsInteger);
                      DM.qryLubrificProgEquip.Post;
                    end;
                end;

              //Verifica itens problemáticos detectados após a Lubrificação
              CDItensProb.Close; CDItensProb.CreateDataSet; CDItensProb.Open; CDItensProb.EmptyDataSet; CDItensProb.Edit;
              DM.qryLubrificPeriodicasItens.First;
              while not DM.qryLubrificPeriodicasItens.Eof = True do
                begin
                  if (DM.qryLubrificPeriodicasItensRUIM.AsString = 'S') or (DM.qryLubrificPeriodicasItensREGULAR.AsString = 'S') then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := DM.qryLubrificPeriodicasItensCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := DM.qryLubrificPeriodicasItensCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := DM.qryLubrificPeriodicasItensPARTE.AsString;
                      CDItensProbITEM.AsString         := DM.qryLubrificPeriodicasItensITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := DM.qryLubrificPeriodicasItensDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := DM.qryLubrificPeriodicasItensTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := DM.qryLubrificPeriodicasItensEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := DM.qryLubrificPeriodicasItensEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := DM.qryLubrificPeriodicasItensBOM.AsString;
                      CDItensProbREGULAR.AsString      := DM.qryLubrificPeriodicasItensREGULAR.AsString;
                      CDItensProbRUIM.AsString         := DM.qryLubrificPeriodicasItensRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := DM.qryLubrificPeriodicasItensCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := DM.qryLubrificPeriodicasItensHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  DM.qryLubrificPeriodicasItens.Next;
                end;

              DM.qryLubrificPeriodicasItensEsp.First;
              while not DM.qryLubrificPeriodicasItensEsp.Eof = True do
                begin
                  if DM.qryLubrificPeriodicasItensEspRUIM.AsString = 'S' then
                    begin
                      CDItensProb.Append;
                      CDItensProbCODITEM.AsString      := DM.qryLubrificPeriodicasItensEspCODIGO.AsString;
                      CDItensProbCODPARTE.AsString     := DM.qryLubrificPeriodicasItensEspCODPARTE.AsString;
                      CDItensProbDESCPARTE.AsString    := DM.qryLubrificPeriodicasItensEspPARTE.AsString;
                      CDItensProbITEM.AsString         := DM.qryLubrificPeriodicasItensEspITEM.AsString;
                      CDItensProbDESCINSPECAO.AsString := DM.qryLubrificPeriodicasItensEspDESCINSPECAO.AsString;
                      CDItensProbTEMPO.AsString        := DM.qryLubrificPeriodicasItensEspTEMPO.AsString;
                      CDItensProbEQUIPPARADO.AsString  := DM.qryLubrificPeriodicasItensEspEQUIPPARADO.AsString;
                      CDItensProbEXECUTADO.AsString    := DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString;
                      CDItensProbBOM.AsString          := DM.qryLubrificPeriodicasItensEspBOM.AsString;
                      CDItensProbREGULAR.AsString      := DM.qryLubrificPeriodicasItensEspREGULAR.AsString;
                      CDItensProbRUIM.AsString         := DM.qryLubrificPeriodicasItensEspRUIM.AsString;
                      CDItensProbCODEMPRESA.AsString   := DM.qryLubrificPeriodicasItensEspCODEMPRESA.AsString;
                      CDItensProbHISTORICO.AsString    := DM.qryLubrificPeriodicasItensEspHISTORICO.AsString;
                      CDItensProb.Post;
                    end;
                  DM.qryLubrificPeriodicasItensEsp.Next;
                end;

            //Gerar OS com itens problemáticos
            if CDItensProb.RecordCount > 0 then
              begin
                LCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryLubrificPeriodicasDESCRICAO.AsString + ' (CORRETIVA)'
                                                              , DM.qryLubrificPeriodicasCODEQUIPAMENTO.AsString, DM.qryLubrificPeriodicasCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                              , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryLubrificPeriodicasCODCENTROCUSTO.AsString, EmptyStr, '0', DM.qryLubrificProgEquipCODOFICINA.AsString, EmptyStr, DM.qryLubrificProgEquipEQUIPPARADO.AsString, EmptyStr);

                DM.qryLubrificPeriodicas.Edit;
                DM.qryLubrificPeriodicasGEROUOS.AsString          := 'S';
                //DM.qryLubrificPeriodicasCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                DM.qryLubrificPeriodicas.Post;

                DM.qryOrdemServicoServSolic.Close;
//                DM.qryOrdemServicoServSolic.Params[0].AsString  := DM.FCodEmpresa;
                DM.qryOrdemServicoServSolic.Params[0].AsInteger := LCodOrdemServico;
                DM.qryOrdemServicoServSolic.Open;
                CDItensProb.First;
                while not CDItensProb.Eof = True do
                  begin
                    DM.qryOrdemServicoServSolic.Append;
                    //DM.qryOrdemServicoServSolicCODIGO.AsInteger          := DM.SMWebClient.GerarSequencia('ORDEMSERVICOSERVSOLIC_S');
                    DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                    DM.qryOrdemServicoServSolicCODEMPRESA.AsString       := DM.FCodEmpresa;
                    DM.qryOrdemServicoServSolicITEM.AsString             := CDItensProbITEM.AsString;
                    DM.qryOrdemServicoServSolicDESCRICAO.AsString        := CDItensProbDESCINSPECAO.AsString;
                    DM.qryOrdemServicoServSolicEQUIPPARADO.AsString      := CDItensProbEQUIPPARADO.AsString;
                    DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsString    := CDItensProbTEMPO.AsString;
                    DM.qryOrdemServicoServSolicPARTE.AsString            := CDItensProbDESCPARTE.AsString;
                    DM.qryOrdemServicoServSolic.Post;

                    CDItensProb.Next;
                  end;

                CDItensProb.Close;
              end;

              DM.qryLubrificPeriodicas.Edit;
              DM.qryLubrificPeriodicas.Post;
              DM.qryLubrificPeriodicas.Refresh;
              //DM.qryLubrificPeriodicas.Delete;
              TSLubrific.Caption := 'Lubrificações ('+IntToStr(DM.qryLubrificPeriodicas.RecordCount)+')';
            End;

           Timer1.Enabled := True;
           hora_futura := IncMinute(Now, 5);
        end;
      2:
        begin
          if DM.qryRotaPeriodicas.IsEmpty = True then Exit;

          if DM.qryRotaPeriodicasManutSITUACAO.AsString = 'FECHADA' then Exit;

          if DM.qryRotaPeriodicasSITUACAOOS.AsString <> 'FECHADA' then
            begin
              PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'ORDEM DE SERVIÇO NÃO FECHADA!';
              Exit;
            end;

          LTexto := PChar('Deseja realmente efetuar o fechamento da rota: ' + DM.qryRotaPeriodicasDESCRICAO.AsString);
          if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
            Begin

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

              Timer1.Enabled := False;

              DM.qryRotaPeriodicasManut.First;
              For i := 0 to DM.qryRotaPeriodicasManut.RecordCount -1 do
                begin
                  DM.qryRotaPeriodicasManut.Edit;
                  DM.qryRotaPeriodicasManutSITUACAO.AsString         := 'FECHADA';
                  DM.qryRotaPeriodicasManutREALIZADA.AsString        := 'S';
                  DM.qryRotaPeriodicasManutDATAFECHAMENTO.AsDateTime := DateOf(DM.FDataHoraServidor);
                  DM.qryRotaPeriodicasManutDATAEXECUCAO.AsDateTime   := EdtExecucao.Date;
                  DM.qryRotaPeriodicasManutMATRICULA.AsString        := EdtMatricula.Text;
                  DM.qryRotaPeriodicasManut.Post;

                  DM.qryRotaPeriodicasManutItens.First; DM.qryRotaPeriodicasManutItensEsp.First;

                  //Habilita a manutenção para ser programada novamente
                  if DM.qryRotaPeriodicasManutREPROGRAMAR1.AsString = 'Execução' then
                    begin
                      DM.qryManutProgEquip.Close;
                      DM.qryManutProgEquip.Params[0].AsString := DM.qryRotaPeriodicasManutCODIGO.AsString;
                      DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
                      DM.qryManutProgEquip.Params[2].AsString := DM.qryRotaPeriodicasManutCODEQUIPAMENTO.AsString;
                      DM.qryManutProgEquip.Open;
                      if DM.qryManutProgEquip.IsEmpty = False then
                        begin
                          DM.qryManutProgEquip.Edit;
                          DM.qryManutProgEquipRELATORIO.AsString    := 'N';
                          DM.qryManutProgEquipDTAINICIO1.AsDateTime := IncDay(DM.qryRotaPeriodicasManutDATAEXECUCAO.AsDateTime, DM.qryManutProgEquipFREQUENCIA1.AsInteger);
                          DM.qryManutProgEquip.Post;
                        end;

                      DM.qryRotas.Close;
                      DM.qryRotas.Params[0].AsString := DM.qryRotaPeriodicasCODIGO.AsString;
                      DM.qryRotas.Params[1].AsString := DM.FCodEmpresa;
                      DM.qryRotas.Open;
                      if DM.qryRotas.IsEmpty = False then
                        begin
                          DM.qryRotas.Edit;
                          DM.qryRotasRELATORIO.AsString    := 'N';
                          DM.qryRotasDATAINICIO.AsDateTime := IncDay(DM.FDataHoraServidor, DM.qryRotasFREQUENCIA.AsInteger);
                          DM.qryRotas.Post;
                        end;
                    end;

                  //Verifica itens problemáticos detectados após a manutenção
                  CDItensProb.Close; CDItensProb.CreateDataSet; CDItensProb.Open; CDItensProb.EmptyDataSet; CDItensProb.Edit;
                  DM.qryRotaPeriodicasManutItens.First;
                  while not DM.qryRotaPeriodicasManutItens.Eof do
                    begin
                      if (DM.qryRotaPeriodicasManutItensRUIM.AsString = 'S') or (DM.qryRotaPeriodicasManutItensREGULAR.AsString = 'S') then
                        begin
                          CDItensProb.Append;
                          CDItensProbCODITEM.AsString      := DM.qryRotaPeriodicasManutItensCODIGO.AsString;
                          CDItensProbCODPARTE.AsString     := DM.qryRotaPeriodicasManutItensCODPARTE.AsString;
                          CDItensProbDESCPARTE.AsString    := DM.qryRotaPeriodicasManutItensPARTE.AsString;
                          CDItensProbITEM.AsString         := DM.qryRotaPeriodicasManutItensITEM.AsString;
                          CDItensProbDESCINSPECAO.AsString := DM.qryRotaPeriodicasManutItensDESCINSPECAO.AsString;
                          CDItensProbTEMPO.AsString        := DM.qryRotaPeriodicasManutItensTEMPO.AsString;
                          CDItensProbEQUIPPARADO.AsString  := DM.qryRotaPeriodicasManutItensEQUIPPARADO.AsString;
                          CDItensProbEXECUTADO.AsString    := DM.qryRotaPeriodicasManutItensEXECUTADO.AsString;
                          CDItensProbBOM.AsString          := DM.qryRotaPeriodicasManutItensBOM.AsString;
                          CDItensProbREGULAR.AsString      := DM.qryRotaPeriodicasManutItensREGULAR.AsString;
                          CDItensProbRUIM.AsString         := DM.qryRotaPeriodicasManutItensRUIM.AsString;
                          CDItensProbCODEMPRESA.AsString   := DM.qryRotaPeriodicasManutItensCODEMPRESA.AsString;
                          CDItensProbHISTORICO.AsString    := DM.qryRotaPeriodicasManutItensHISTORICO.AsString;
                          CDItensProb.Post;
                        end;
                      DM.qryRotaPeriodicasManutItens.Next;
                    end;

                  DM.qryRotaPeriodicasManutItensEsp.First;
                  while not DM.qryRotaPeriodicasManutItensEsp.Eof do
                    begin
                      if DM.qryRotaPeriodicasManutItensEspRUIM.AsString = 'S' then
                        begin
                          CDItensProb.Append;
                          CDItensProbCODITEM.AsString      := DM.qryRotaPeriodicasManutItensEspCODIGO.AsString;
                          CDItensProbCODPARTE.AsString     := DM.qryRotaPeriodicasManutItensEspCODPARTE.AsString;
                          CDItensProbDESCPARTE.AsString    := DM.qryRotaPeriodicasManutItensEspPARTE.AsString;
                          CDItensProbITEM.AsString         := DM.qryRotaPeriodicasManutItensEspITEM.AsString;
                          CDItensProbDESCINSPECAO.AsString := DM.qryRotaPeriodicasManutItensEspDESCINSPECAO.AsString;
                          CDItensProbTEMPO.AsString        := DM.qryRotaPeriodicasManutItensEspTEMPO.AsString;
                          CDItensProbEQUIPPARADO.AsString  := DM.qryRotaPeriodicasManutItensEspEQUIPPARADO.AsString;
                          CDItensProbEXECUTADO.AsString    := DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString;
                          CDItensProbBOM.AsString          := DM.qryRotaPeriodicasManutItensEspBOM.AsString;
                          CDItensProbREGULAR.AsString      := DM.qryRotaPeriodicasManutItensEspREGULAR.AsString;
                          CDItensProbRUIM.AsString         := DM.qryRotaPeriodicasManutItensEspRUIM.AsString;
                          CDItensProbCODEMPRESA.AsString   := DM.qryRotaPeriodicasManutItensEspCODEMPRESA.AsString;
                          CDItensProbHISTORICO.AsString    := DM.qryRotaPeriodicasManutItensEspHISTORICO.AsString;
                          CDItensProb.Post;
                        end;
                      DM.qryRotaPeriodicasManutItensEsp.Next;
                    end;

                  //Gerar OS com itens problemáticos
                  if CDItensProb.RecordCount > 0 then
                    begin
                      LCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryRotaPeriodicasManutDESCRICAO.AsString + ' (CORRETIVA)'
                                                                    , DM.qryRotaPeriodicasManutCODEQUIPAMENTO.AsString, DM.qryRotaPeriodicasManutCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                                    , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryRotaPeriodicasManutCODCENTROCUSTO.AsString, EmptyStr, '0', DM.qryManutProgEquipCODOFICINA.AsString, EmptyStr, DM.qryManutProgEquipEQUIPPARADO.AsString, EmptyStr);


                      DM.qryRotaPeriodicasManut.Edit;
                      DM.qryRotaPeriodicasManutGEROUOS.AsString          := 'S';
                      DM.qryRotaPeriodicasManutCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                      DM.qryRotaPeriodicasManut.Post;

                      DM.qryOrdemServicoServSolic.Close;
//                      DM.qryOrdemServicoServSolic.Params[0].AsString  := DM.FCodEmpresa;
                      DM.qryOrdemServicoServSolic.Params[0].AsInteger := LCodOrdemServico;
                      DM.qryOrdemServicoServSolic.Open;
                      CDItensProb.First;
                      while not CDItensProb.Eof do
                        begin
                          DM.qryOrdemServicoServSolic.Append;
                          //DM.qryOrdemServicoServSolicCODIGO.AsInteger          := DM.SMWebClient.GerarSequencia('ORDEMSERVICOSERVSOLIC_S');
                          DM.qryOrdemServicoServSolicCODORDEMSERVICO.AsInteger := LCodOrdemServico;
                          DM.qryOrdemServicoServSolicCODEMPRESA.AsString       := DM.FCodEmpresa;
                          DM.qryOrdemServicoServSolicITEM.AsString             := CDItensProbITEM.AsString;
                          DM.qryOrdemServicoServSolicDESCRICAO.AsString        := CDItensProbDESCINSPECAO.AsString;
                          DM.qryOrdemServicoServSolicEQUIPPARADO.AsString      := CDItensProbEQUIPPARADO.AsString;
                          DM.qryOrdemServicoServSolicTEMPOEXECUCAO.AsString    := CDItensProbTEMPO.AsString;
                          DM.qryOrdemServicoServSolicPARTE.AsString            := CDItensProbDESCPARTE.AsString;
                          DM.qryOrdemServicoServSolic.Post;

                          CDItensProb.Next;
                        end;
                      CDItensProb.Close;
                    end;

                  DM.qryRotaPeriodicasManut.Edit;
                  DM.qryRotaPeriodicasManut.Post;
                  DM.qryRotaPeriodicas.Refresh;
                  //DM.qryRotaPeriodicasManut.Delete;
                  TSRota.Caption := 'Rotas ('+IntToStr(DM.qryRotaPeriodicasManut.RecordCount)+')';

                  Timer1.Enabled := True;
                  hora_futura := IncMinute(Now, 5);

                  DM.qryRotaPeriodicasManut.Next;
                end;
            End;
        end;
    End;
end;

procedure TFrmTelaInspFechamento.BtnFuncionarioClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        EdtMatricula.Text   := DM.FCodCombo;
        EdtResponsavel.Text := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
DM.FParamAuxiliar[1] := EmptyStr;
end;

procedure TFrmTelaInspFechamento.BtnMaodeObraClick(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
      begin
        if DM.qryManutPeriodicasMATRICULAOS.AsString = '' then
        begin
          Application.MessageBox('Mão de obra da O.S. não localizada!', 'SPMP3', MB_OK+MB_ICONEXCLAMATION);
          Exit;
        end;
        EdtMatricula.Text := DM.qryManutPeriodicasMATRICULAOS.AsString;
        EdtResponsavel.Text := DM.qryManutPeriodicasFUNCIONARIOOS.AsString;
      end;
    1:
      begin
        if DM.qryLubrificPeriodicasMATRICULAOS.AsString = '' then
        begin
          Application.MessageBox('Mão de obra da O.S. não localizada!', 'SPMP3', MB_OK+MB_ICONEXCLAMATION);
          Exit;
        end;
        EdtMatricula.Text := DM.qryLubrificPeriodicasMATRICULAOS.AsString;
        EdtResponsavel.Text := DM.qryLubrificPeriodicasFUNCIONARIOOS.AsString;
      end;
    2:
      begin
        EdtMatricula.Clear;
        EdtResponsavel.Clear;
      end;
  end;

end;

procedure TFrmTelaInspFechamento.Button6Click(Sender: TObject);
begin
  inherited;
  Try
    if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaInspFechamentoHist, FrmTelaInspFechamentoHist);
    FrmTelaInspFechamentoHist.Caption := DM.FValorCombo;
    FrmTelaInspFechamentoHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaInspFechamentoHist);
  End;
end;

procedure TFrmTelaInspFechamento.ConfigurarFiltros;
begin
DM.qryManutPeriodicas.Filtered := False;
DM.qryManutPeriodicas.Filter := EmptyStr;
  case PCInspecoes.ActivePageIndex of
    0://Manutenções
      begin
        case RGFiltro.ItemIndex of
          0:
            begin
              if DM.qryManutPeriodicas.Filter = EmptyStr then
                DM.qryManutPeriodicas.Filter := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
              else
                DM.qryManutPeriodicas.Filter := DM.qryManutPeriodicas.Filter + ' AND DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
            end;
          1:
            begin
              if DM.qryManutPeriodicas.Filter = EmptyStr then
                DM.qryManutPeriodicas.Filter := 'DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
              else
                DM.qryManutPeriodicas.Filter := DM.qryManutPeriodicas.Filter + ' AND DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
            end;
        end;

        if DM.qryManutPeriodicas.Filter <> EmptyStr then
          DM.qryManutPeriodicas.Filtered := True;
      end;
    1://Lubrificações
      begin
        case RGFiltro.ItemIndex of
          0:
            begin
              if DM.qryLubrificPeriodicas.Filter = EmptyStr then
                DM.qryLubrificPeriodicas.Filter := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
              else
                DM.qryLubrificPeriodicas.Filter := DM.qryLubrificPeriodicas.Filter + ' AND DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
            end;
          1:
            begin
              if DM.qryLubrificPeriodicas.Filter = EmptyStr then
                DM.qryLubrificPeriodicas.Filter := 'DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
              else
                DM.qryLubrificPeriodicas.Filter := DM.qryLubrificPeriodicas.Filter + ' AND DTAINICIO1 > '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor))
            end;
        end;

        if DM.qryLubrificPeriodicas.Filter <> EmptyStr then
          DM.qryLubrificPeriodicas.Filtered := True;
      end;
  end;
end;

procedure TFrmTelaInspFechamento.Desmarcartodos1Click(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
    begin
      if GrdItensManut.SelectedIndex in [14, 15,16,17] then
      begin
        DM.qryManutPeriodicasItens.First;
        while not  DM.qryManutPeriodicasItens.Eof = True do
        begin
          DM.qryManutPeriodicasItens.Edit;
          if GrdItensManut.SelectedIndex = 14 then
          begin
            DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 15 then
          begin
            DM.qryManutPeriodicasItensBOM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 16 then
          begin
            DM.qryManutPeriodicasItensREGULAR.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 17 then
          begin
            DM.qryManutPeriodicasItensRUIM.AsString := 'N';
          end;
          DM.qryManutPeriodicasItens.Post;

          DM.qryManutPeriodicasItens.Next;
        end;
      end;
    end;
    1:
    begin
      if GrdItensLubrific.SelectedIndex in [14, 15,16,17] then
      begin
        DM.qryLubrificPeriodicasItens.First;
        while not  DM.qryLubrificPeriodicasItens.Eof = True do
        begin
          DM.qryLubrificPeriodicasItens.Edit;
          if GrdItensLubrific.SelectedIndex = 14 then
          begin
            DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
          end
          else if GrdItensLubrific.SelectedIndex = 15 then
          begin
            DM.qryLubrificPeriodicasItensBOM.AsString := 'N';
          end
          else if GrdItensLubrific.SelectedIndex = 16 then
          begin
            DM.qryLubrificPeriodicasItensREGULAR.AsString := 'N';
          end
          else if GrdItensLubrific.SelectedIndex = 17 then
          begin
            DM.qryLubrificPeriodicasItensRUIM.AsString := 'N';
          end;
          DM.qryLubrificPeriodicasItens.Post;

          DM.qryLubrificPeriodicasItens.Next;
        end;
      end;
    end;
    2:
    begin
      if GrdRotaManutItens.SelectedIndex in [14, 15,16,17] then
      begin
        DM.qryRotaPeriodicasManutItens.First;
        while not  DM.qryRotaPeriodicasManutItens.Eof = True do
        begin
          DM.qryRotaPeriodicasManutItens.Edit;
          if GrdItensManut.SelectedIndex = 14 then
          begin
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'S';
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'N';
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 15 then
          begin
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'N';
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 16 then
          begin
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 17 then
          begin
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'N';
          end;
          DM.qryRotaPeriodicasManutItens.Post;

          DM.qryRotaPeriodicasManutItens.Next;
        end;
      end;
    end;
  end;

end;

procedure TFrmTelaInspFechamento.EdtMatriculaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Key = #13 then
  begin
    if EdtMatricula.Text <> '' then
      begin
        DM.qryAuxiliar.Close;
        DM.qryAuxiliar.SQL.Clear;
        DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO` FROM funcionarios '
                               + 'INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.`MATRICULA` = :matricula AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `funcionarios`.nome');
        DM.qryAuxiliar.Params[0].AsString := EdtMatricula.Text;
        DM.qryAuxiliar.Open;

        EdtMatricula.Text   := DM.qryAuxiliar.FieldByName('MATRICULA').AsString;
        EdtResponsavel.Text := DM.qryAuxiliar.FieldByName('NOME').AsString;

        DM.qryAuxiliar.Close;
        DM.qryAuxiliar.SQL.Clear;
      end;
  end;
end;

procedure TFrmTelaInspFechamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qryLubrificPeriodicas.Close;
DM.qryLubrificPeriodicasItens.Close;
DM.qryLubrificProgEquip.Close;

DM.qryManutPeriodicas.Close;
DM.qryManutPeriodicasItens.Close;
DM.qryManutPeriodicasItensEsp.Close;
DM.qryManutProgEquip.Close;

DM.qryRotaPeriodicasManut.Close;
DM.qryRotaPeriodicasManutItens.Close;
DM.qryRotaPeriodicasManutItensEsp.Close;
DM.qryRotaPeriodicas.Close;

if FrmTelaCadOrdemServicoGerencia = nil then
  DM.qryOrdemServicoServSolic.Close;

DM.qryManutPeriodicas.Filtered := False;
DM.qryLubrificPeriodicas.Filtered := False;
end;

procedure TFrmTelaInspFechamento.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryManutPeriodicas.Close;
  DM.qryManutPeriodicas.Params[0].AsString := DM.FCodEmpresa;
  DM.qryManutPeriodicas.Params[1].AsString := 'ABERTA';
  DM.qryManutPeriodicas.Open;
  DM.qryManutPeriodicasItens.Open;
  DM.qryManutPeriodicasItensEsp.Open;

  DM.qryLubrificPeriodicas.Close;
  DM.qryLubrificPeriodicas.Params[0].AsString := DM.FCodEmpresa;
  DM.qryLubrificPeriodicas.Params[1].AsString := 'ABERTA';
  DM.qryLubrificPeriodicas.Open;
  DM.qryLubrificPeriodicasItens.Open;
  DM.qryLubrificPeriodicasItensEsp.Open;

  if DM.FEmpTransf = True then
    begin
      DM.qryRotaPeriodicas.Close;
      DM.qryRotaPeriodicas.Params[0].AsString := DM.FCodEmpresa;
      DM.qryRotaPeriodicas.Params[1].AsString := 'ABERTA';
      DM.qryRotaPeriodicas.Open;
      DM.qryRotaPeriodicasManut.Open;
      DM.qryRotaPeriodicasManutItens.Open;
      DM.qryRotaPeriodicasManutItensEsp.Open;
    end;

TSManut.Caption := 'Manutenções ('+IntToStr(DM.qryManutPeriodicas.RecordCount)+')';
TSLubrific.Caption := 'Lubrificações ('+IntToStr(DM.qryLubrificPeriodicas.RecordCount)+')';
if PCInspecoes.Pages[2].TabVisible = True then
  TSRota.Caption := 'Rotas ('+IntToStr(DM.qryRotaPeriodicas.RecordCount)+')';

//hora_futura := IncMinute(Now, 5);

EdtMatricula.Text := DM.qryManutPeriodicasMATRICULAOS.AsString;
EdtResponsavel.Text := DM.qryManutPeriodicasFUNCIONARIOOS.AsString;
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
//          TThread.CreateAnonymousThread(
//                                        procedure
//                                        begin
                                          if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString = 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
                                            begin
                                              DM.MSGAguarde();

                                              DM.qryManutPeriodicas.Close;
                                              DM.qryManutPeriodicasItens.Close;
                                              DM.qryManutPeriodicasItensEsp.Close;
                                              DM.qryManutPeriodicas.Params[0].AsString := DM.FCodEmpresa;
                                              DM.qryManutPeriodicas.Params[1].AsString := 'ABERTA';
//                                              DM.qryManutPeriodicas.Params[2].AsString := 'FECHADA';

                                              //DM.qryManutPeriodicas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -18));
                                              //DM.qryManutPeriodicas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
                                              DM.qryManutPeriodicas.Open;
                                              DM.qryManutPeriodicasItens.Open;
                                              DM.qryManutPeriodicasItensEsp.Open;
                                              TSManut.Caption := 'Manutenções ('+IntToStr(DM.qryManutPeriodicas.RecordCount)+')';
                                              GrdManutencao.SelectedRows.CurrentRowSelected := True;

//                                              Application.ProcessMessages;

                                              DM.MSGAguarde('', False);
                                            end;

//                                        end
//                                       ).Start;


        end;
      1:
        begin
          if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
            begin
              DM.MSGAguarde();

              DM.qryLubrificPeriodicas.Close;
              DM.qryLubrificPeriodicasItens.Close;
              DM.qryLubrificPeriodicasItensEsp.Close;
              DM.qryLubrificPeriodicas.Params[0].AsString := DM.FCodEmpresa;
              DM.qryLubrificPeriodicas.Params[1].AsString := 'ABERTA';
              //DM.qryLubrificPeriodicas.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -18));
              //DM.qryLubrificPeriodicas.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
              DM.qryLubrificPeriodicas.Open;
              DM.qryLubrificPeriodicasItens.Open;
              DM.qryLubrificPeriodicasItensEsp.Open;
              TSLubrific.Caption := 'Lubrificações ('+IntToStr(DM.qryLubrificPeriodicas.RecordCount)+')';
              GrdLubrificacao.SelectedRows.CurrentRowSelected := True;

              DM.MSGAguarde('', False);
            end;
        end;
      2:
        begin
          if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
            begin
              DM.MSGAguarde();

              if DM.FEmpTransf = False then
                PCInspecoes.Pages[2].TabVisible := False
              else
                begin
                  DM.qryRotaPeriodicas.Close;
                  DM.qryRotaPeriodicasManut.Close;
                  DM.qryRotaPeriodicasManutItens.Close;
                  DM.qryRotaPeriodicasManutItensEsp.Close;
                  DM.qryRotaPeriodicas.Params[0].AsString := DM.FCodEmpresa;
                  DM.qryRotaPeriodicas.Open;
                  DM.qryRotaPeriodicasManut.Open;
                  DM.qryRotaPeriodicasManutItens.Open;
                  DM.qryRotaPeriodicasManutItensEsp.Open;
                  TSRota.Caption := 'Rotas ('+IntToStr(DM.qryRotaPeriodicas.RecordCount)+')';
                  GrdRota.SelectedRows.CurrentRowSelected  := True;
                end;

              DM.MSGAguarde('', False);
            end;
        end;
    end;
  end;
end;

procedure TFrmTelaInspFechamento.GrdManutencaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
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
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'SOLICITADA') then
      begin
        if GrdManutencao.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> EmptyStr then
          begin GrdManutencao.Canvas.Brush.Color := clYellow; GrdManutencao.Canvas.Font.Color := clRed end
        else
          begin GrdManutencao.Canvas.Brush.Color := $00BBFFFF; GrdManutencao.Canvas.Font.Color := clRed end;
      end;
    if (GrdManutencao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'DETALHADA')then
      begin
        GrdManutencao.Canvas.Brush.Color := clYellow; GrdManutencao.Canvas.Font.Color := clGreen;
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
  end;

  GrdManutencao.Canvas.FillRect(Rect);
  GrdManutencao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmTelaInspFechamento.GrdManutencaoKeyPress(Sender: TObject;
  var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (GrdManutencao.SelectedIndex = 0) then
  begin
    LCampo :=DM.CampoInputBox('SPMPWeb', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
    begin
      if GrdManutencao.DataSource.DataSet.Locate('CODORDEMSERVICO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
        Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
    end;
  end;

  if (Key = #13) and (GrdManutencao.SelectedIndex = 6) then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta    := 'Equipamentos';
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    if DM.ConsultarCombo <> EmptyStr then
    begin
      DM.qryManutPeriodicas.Filtered := False;
      DM.qryManutPeriodicas.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(DM.FCodCombo);
      DM.qryManutPeriodicas.Filtered := True;
    end else
      DM.qryManutPeriodicas.Filtered := False;
  end;
end;

procedure TFrmTelaInspFechamento.GrdManutencaoTitleClick(Column: TColumn);
begin
  inherited;
  DM.qryManutPeriodicas.IndexFieldNames := Column.FieldName;
end;

procedure TFrmTelaInspFechamento.GrdRotaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
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
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'SOLICITADA') then
      begin
        if GrdRota.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> EmptyStr then
          begin GrdRota.Canvas.Brush.Color := clYellow; GrdRota.Canvas.Font.Color := clRed end
        else
          begin GrdRota.Canvas.Brush.Color := $00BBFFFF; GrdRota.Canvas.Font.Color := clRed end;
      end;
    if (GrdRota.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'DETALHADA')then
      begin
        GrdRota.Canvas.Brush.Color := clYellow; GrdRota.Canvas.Font.Color := clGreen;
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
var
LCampo : String;
begin
  inherited;
if (Key = #13) and (GrdRota.SelectedIndex = 0) then
  begin
    LCampo := DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
        if GrdRota.DataSource.DataSet.Locate('CODORDEMSERVICO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
          Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
      end;
  end;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensEspCellClick(Column: TColumn);
begin
  inherited;
  if DM.qryRotaPeriodicasManutItensEsp.IsEmpty = True then Exit;
  if DM.qryRotaPeriodicasManutSITUACAO.AsString = 'FECHADA' then Exit;

  if (Column.FieldName = 'EXECUTADO') and (DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString = 'S') then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end else
  if (Column.FieldName = 'EXECUTADO') and ((DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString = 'N') or (DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'S';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end else
  if (Column.FieldName = 'BOM') and (Trim(DM.qryRotaPeriodicasManutItensEspBOM.AsString) = 'S') then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end else
  if (Column.FieldName = 'BOM') and ((Trim(DM.qryRotaPeriodicasManutItensEspBOM.AsString) = 'N') or (DM.qryRotaPeriodicasManutItensEspBOM.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'S';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end else
  if (Column.FieldName = 'REGULAR') and (Trim(DM.qryRotaPeriodicasManutItensEspREGULAR.AsString) = 'S') then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end else
  if (Column.FieldName = 'REGULAR') and ((Trim(DM.qryRotaPeriodicasManutItensEspREGULAR.AsString) = 'N') or (DM.qryRotaPeriodicasManutItensEspREGULAR.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'S';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end else
  if (Column.FieldName = 'RUIM') and (Trim(DM.qryRotaPeriodicasManutItensEspRUIM.AsString) = 'S') then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end else
  if (Column.FieldName = 'RUIM') and ((Trim(DM.qryRotaPeriodicasManutItensEspRUIM.AsString) = 'N') or (DM.qryRotaPeriodicasManutItensEspRUIM.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItensEsp.Edit;
    DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensEspBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensEspREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensEspRUIM.AsString      := 'S';
    DM.qryRotaPeriodicasManutItensEsp.Post;
  end;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensEspDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 22, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 22, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'BOM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'BOM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'REGULAR') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 17, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'REGULAR') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 17, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'RUIM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'RUIM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdRotaManutItensEsp.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItensEsp.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) and (GrdRotaManut.SelectedIndex = 2) then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta    := 'Equipamentos';
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    if DM.ConsultarCombo <> EmptyStr then
    begin
      DM.qryRotaPeriodicasManut.Filtered := False;
      DM.qryRotaPeriodicasManut.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(DM.FCodCombo);
      DM.qryRotaPeriodicasManut.Filtered := True;
    end else
      DM.qryRotaPeriodicasManut.Filtered := False;
  end;

end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensCellClick(Column: TColumn);
begin
  inherited;
  if DM.qryRotaPeriodicasManutItens.IsEmpty then Exit;
  if DM.qryRotaPeriodicasManutSITUACAO.AsString = 'FECHADA' then Exit;

  if (Column.FieldName = 'EXECUTADO') and (DM.qryRotaPeriodicasManutItensEXECUTADO.AsString = 'S') then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItens.Post;
  end else
  if (Column.FieldName = 'EXECUTADO') and ((DM.qryRotaPeriodicasManutItensEXECUTADO.AsString = 'N') or (DM.qryRotaPeriodicasManutItensEXECUTADO.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'S';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItens.Post;
  end else
  if (Column.FieldName = 'BOM') and (Trim(DM.qryRotaPeriodicasManutItensBOM.AsString) = 'S') then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItens.Post;
  end else
  if (Column.FieldName = 'BOM') and ((Trim(DM.qryRotaPeriodicasManutItensBOM.AsString) = 'N') or (DM.qryRotaPeriodicasManutItensBOM.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'S';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItens.Post;
  end else
  if (Column.FieldName = 'REGULAR') and (Trim(DM.qryRotaPeriodicasManutItensREGULAR.AsString) = 'S') then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItens.Post;
  end else
  if (Column.FieldName = 'REGULAR') and ((Trim(DM.qryRotaPeriodicasManutItensREGULAR.AsString) = 'N') or (DM.qryRotaPeriodicasManutItensREGULAR.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'S';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItens.Post;
  end else
  if (Column.FieldName = 'RUIM') and (Trim(DM.qryRotaPeriodicasManutItensRUIM.AsString) = 'S') then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'N';
    DM.qryRotaPeriodicasManutItens.Post;
  end else
  if (Column.FieldName = 'RUIM') and ((Trim(DM.qryRotaPeriodicasManutItensRUIM.AsString) = 'N') or (DM.qryRotaPeriodicasManutItensRUIM.AsString = EmptyStr)) then
  begin
    DM.qryRotaPeriodicasManutItens.Edit;
    DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
    DM.qryRotaPeriodicasManutItensBOM.AsString       := 'N';
    DM.qryRotaPeriodicasManutItensREGULAR.AsString   := 'N';
    DM.qryRotaPeriodicasManutItensRUIM.AsString      := 'S';
    DM.qryRotaPeriodicasManutItens.Post;
  end;
end;

procedure TFrmTelaInspFechamento.GrdRotaManutItensDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and (Trim(Column.Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 22, Rect.Top, 0);
   end;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 22, Rect.Top, 1);
   end;

  if (Trim(Column.Field.FieldName) = 'BOM') and (Trim(Column.Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 12, Rect.Top, 0);
   end;
  if (Trim(Column.Field.FieldName) = 'BOM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 12, Rect.Top, 1);
   end;

  if (Trim(Column.Field.FieldName) = 'REGULAR') and (Trim(Column.Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 17, Rect.Top, 0);
   end;
  if (Trim(Column.Field.FieldName) = 'REGULAR') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 17, Rect.Top, 1);
   end;

  if (Trim(Column.Field.FieldName) = 'RUIM') and (Trim(Column.Field.AsString) = 'S') then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 12, Rect.Top, 0);
   end;
  if (Trim(Column.Field.FieldName) = 'RUIM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
   begin
     GrdRotaManutItens.Canvas.FillRect(Rect); ImageList1.Draw(GrdRotaManutItens.Canvas, Rect.Left + 12, Rect.Top, 1);
   end;
end;

procedure TFrmTelaInspFechamento.GrdItensEspLubrificCellClick(Column: TColumn);
begin
  inherited;
  if DM.qryLubrificPeriodicasItensEsp.IsEmpty then Exit;
  if DM.qryManutPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

  if (Column.FieldName = 'EXECUTADO') and (DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString = 'S') then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'EXECUTADO') and ((DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString = 'N') or (DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'S';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'BOM') and (Trim(DM.qryLubrificPeriodicasItensEspBOM.AsString) = 'S') then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end;
  if (Column.FieldName = 'BOM') and ((Trim(DM.qryLubrificPeriodicasItensEspBOM.AsString) = 'N') or (DM.qryLubrificPeriodicasItensEspBOM.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'S';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'REGULAR') and (Trim(DM.qryLubrificPeriodicasItensEspREGULAR.AsString) = 'S') then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'REGULAR') and ((Trim(DM.qryLubrificPeriodicasItensEspREGULAR.AsString) = 'N') or (DM.qryLubrificPeriodicasItensEspREGULAR.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'S';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'RUIM') and (Trim(DM.qryLubrificPeriodicasItensEspRUIM.AsString) = 'S') then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'RUIM') and ((Trim(DM.qryLubrificPeriodicasItensEspRUIM.AsString) = 'N') or (DM.qryLubrificPeriodicasItensEspRUIM.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItensEsp.Edit;
    DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensEspRUIM.AsString      := 'S';
    DM.qryLubrificPeriodicasItensEsp.Post;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensEspLubrificDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 22, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 22, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'BOM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'BOM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'REGULAR') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 17, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'REGULAR') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 17, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'RUIM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'RUIM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspLubrific.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensEspManutCellClick(Column: TColumn);
begin
  inherited;
  if DM.qryManutPeriodicasItensEsp.IsEmpty then Exit;
  if DM.qryManutPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

  if (Column.FieldName = 'EXECUTADO') and (DM.qryManutPeriodicasItensEspEXECUTADO.AsString = 'S') then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'EXECUTADO') and ((DM.qryManutPeriodicasItensEspEXECUTADO.AsString = 'N') or (DM.qryManutPeriodicasItensEspEXECUTADO.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'S';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'BOM') and (Trim(DM.qryManutPeriodicasItensEspBOM.AsString) = 'S') then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItensEsp.Post;
  end;
  if (Column.FieldName = 'BOM') and ((Trim(DM.qryManutPeriodicasItensEspBOM.AsString) = 'N') or (DM.qryManutPeriodicasItensEspBOM.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'S';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'REGULAR') and (Trim(DM.qryManutPeriodicasItensEspREGULAR.AsString) = 'S') then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'REGULAR') and ((Trim(DM.qryManutPeriodicasItensEspREGULAR.AsString) = 'N') or (DM.qryManutPeriodicasItensEspREGULAR.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'S';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'RUIM') and (Trim(DM.qryManutPeriodicasItensEspRUIM.AsString) = 'S') then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItensEsp.Post;
  end else
  if (Column.FieldName = 'RUIM') and ((Trim(DM.qryManutPeriodicasItensEspRUIM.AsString) = 'N') or (DM.qryManutPeriodicasItensEspRUIM.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItensEsp.Edit;
    DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensEspBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensEspREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensEspRUIM.AsString      := 'S';
    DM.qryManutPeriodicasItensEsp.Post;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensEspManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 22, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 22, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'BOM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'BOM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'REGULAR') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 17, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'REGULAR') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 17, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'RUIM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'RUIM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensEspManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensEspManut.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensLubrificCellClick(Column: TColumn);
begin
  inherited;
  if DM.qryLubrificPeriodicasItens.IsEmpty then Exit;
  if DM.qryManutPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

  if (Column.FieldName = 'EXECUTADO') and (DM.qryLubrificPeriodicasItensEXECUTADO.AsString = 'S') then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'EXECUTADO') and ((DM.qryLubrificPeriodicasItensEXECUTADO.AsString = 'N') or (DM.qryLubrificPeriodicasItensEXECUTADO.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'S';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'BOM') and (Trim(DM.qryLubrificPeriodicasItensBOM.AsString) = 'S') then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'BOM') and ((Trim(DM.qryLubrificPeriodicasItensBOM.AsString) = 'N') or (DM.qryLubrificPeriodicasItensBOM.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'S';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'REGULAR') and (Trim(DM.qryLubrificPeriodicasItensREGULAR.AsString) = 'S') then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'REGULAR') and ((Trim(DM.qryLubrificPeriodicasItensREGULAR.AsString) = 'N') or (DM.qryLubrificPeriodicasItensREGULAR.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'S';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'RUIM') and (Trim(DM.qryLubrificPeriodicasItensRUIM.AsString) = 'S') then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'N';
    DM.qryLubrificPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'RUIM') and ((Trim(DM.qryLubrificPeriodicasItensRUIM.AsString) = 'N') or (DM.qryLubrificPeriodicasItensRUIM.AsString = EmptyStr)) then
  begin
    DM.qryLubrificPeriodicasItens.Edit;
    DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryLubrificPeriodicasItensBOM.AsString       := 'N';
    DM.qryLubrificPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryLubrificPeriodicasItensRUIM.AsString      := 'S';
    DM.qryLubrificPeriodicasItens.Post;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensLubrificDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 22, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 22, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'BOM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'BOM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'REGULAR') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 17, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'REGULAR') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 17, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'RUIM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'RUIM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensLubrific.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensLubrific.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensManutCellClick(Column: TColumn);
begin
  inherited;
  if DM.qryManutPeriodicasItens.IsEmpty then Exit;
  if DM.qryManutPeriodicasSITUACAO.AsString = 'FECHADA' then Exit;

  if (Column.FieldName = 'EXECUTADO') and (DM.qryManutPeriodicasItensEXECUTADO.AsString = 'S') then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'EXECUTADO') and ((DM.qryManutPeriodicasItensEXECUTADO.AsString = 'N') or (DM.qryManutPeriodicasItensEXECUTADO.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'S';
    DM.qryManutPeriodicasItensBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'BOM') and (Trim(DM.qryManutPeriodicasItensBOM.AsString) = 'S') then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'BOM') and ((Trim(DM.qryManutPeriodicasItensBOM.AsString) = 'N') or (DM.qryManutPeriodicasItensBOM.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensBOM.AsString       := 'S';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'REGULAR') and (Trim(DM.qryManutPeriodicasItensREGULAR.AsString) = 'S') then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'REGULAR') and ((Trim(DM.qryManutPeriodicasItensREGULAR.AsString) = 'N') or (DM.qryManutPeriodicasItensREGULAR.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'S';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'RUIM') and (Trim(DM.qryManutPeriodicasItensRUIM.AsString) = 'S') then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'N';
    DM.qryManutPeriodicasItens.Post;
  end else
  if (Column.FieldName = 'RUIM') and ((Trim(DM.qryManutPeriodicasItensRUIM.AsString) = 'N') or (DM.qryManutPeriodicasItensRUIM.AsString = EmptyStr)) then
  begin
    DM.qryManutPeriodicasItens.Edit;
    DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
    DM.qryManutPeriodicasItensBOM.AsString       := 'N';
    DM.qryManutPeriodicasItensREGULAR.AsString   := 'N';
    DM.qryManutPeriodicasItensRUIM.AsString      := 'S';
    DM.qryManutPeriodicasItens.Post;
  end;
end;

procedure TFrmTelaInspFechamento.GrdItensManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 22, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'EXECUTADO') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 22, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'BOM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'BOM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'REGULAR') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 17, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'REGULAR') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 17, Rect.Top, 1);
  end;

  if (Trim(Column.Field.FieldName) = 'RUIM') and (Trim(Column.Field.AsString) = 'S') then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 12, Rect.Top, 0);
  end;
  if (Trim(Column.Field.FieldName) = 'RUIM') and ((Trim(Column.Field.AsString) = 'N') or (Trim(Column.Field.AsString) = EmptyStr)) then
  begin
    GrdItensManut.Canvas.FillRect(Rect); ImageList1.Draw(GrdItensManut.Canvas, Rect.Left + 12, Rect.Top, 1);
  end;
end;

procedure TFrmTelaInspFechamento.GrdLubrificacaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
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
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'SOLICITADA') then
      begin
        if GrdLubrificacao.DataSource.DataSet.FieldByName('CODMANUTENCAO').AsString <> EmptyStr then
          begin GrdLubrificacao.Canvas.Brush.Color := clYellow; GrdLubrificacao.Canvas.Font.Color := clRed end
        else
          begin GrdLubrificacao.Canvas.Brush.Color := $00BBFFFF; GrdLubrificacao.Canvas.Font.Color := clRed end;
      end;
    if (GrdLubrificacao.DataSource.DataSet.FieldByName('SITUACAOOS').AsString = 'DETALHADA')then
      begin
        GrdLubrificacao.Canvas.Brush.Color := clYellow; GrdLubrificacao.Canvas.Font.Color := clGreen;
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
  end;

  GrdLubrificacao.Canvas.FillRect(Rect);
  GrdLubrificacao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmTelaInspFechamento.GrdLubrificacaoKeyPress(Sender: TObject;
  var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (GrdLubrificacao.SelectedIndex = 0) then
  begin
    LCampo := DM.CampoInputBox('SPMPWeb', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
    begin
      if GrdLubrificacao.DataSource.DataSet.Locate('CODORDEMSERVICO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
        Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
    end;
  end;

  if (Key = #13) and (GrdLubrificacao.SelectedIndex = 6) then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta    := 'Equipamentos';
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    if DM.ConsultarCombo <> EmptyStr then
    begin
      DM.qryLubrificPeriodicas.Filtered := False;
      DM.qryLubrificPeriodicas.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(DM.FCodCombo);
      DM.qryLubrificPeriodicas.Filtered := True;
    end else
      DM.qryLubrificPeriodicas.Filtered := False;
  end;
end;

procedure TFrmTelaInspFechamento.Marcartodos1Click(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
    begin
      if GrdItensManut.SelectedIndex in [4, 5, 6, 7] then
      begin
        DM.qryManutPeriodicasItens.First;
        while not  DM.qryManutPeriodicasItens.Eof = True do
        begin
          DM.qryManutPeriodicasItens.Edit;
          if GrdItensManut.SelectedIndex = 4 then
          begin
            DM.qryManutPeriodicasItensEXECUTADO.AsString := 'S';
            DM.qryManutPeriodicasItensBOM.AsString := 'N';
            DM.qryManutPeriodicasItensREGULAR.AsString := 'N';
            DM.qryManutPeriodicasItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 5 then
          begin
            DM.qryManutPeriodicasItensBOM.AsString := 'S';
            DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
            DM.qryManutPeriodicasItensREGULAR.AsString := 'N';
            DM.qryManutPeriodicasItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 6 then
          begin
            DM.qryManutPeriodicasItensREGULAR.AsString := 'S';
            DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
            DM.qryManutPeriodicasItensBOM.AsString := 'N';
            DM.qryManutPeriodicasItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 7 then
          begin
            DM.qryManutPeriodicasItensRUIM.AsString := 'S';
            DM.qryManutPeriodicasItensEXECUTADO.AsString := 'N';
            DM.qryManutPeriodicasItensBOM.AsString := 'N';
            DM.qryManutPeriodicasItensREGULAR.AsString := 'N';
          end;
          DM.qryManutPeriodicasItens.Post;

          DM.qryManutPeriodicasItens.Next;
        end;
      end;
    end;
    1:
    begin
      if GrdItensLubrific.SelectedIndex in [4, 5,6,7] then
      begin
        DM.qryLubrificPeriodicasItens.First;
        while not  DM.qryLubrificPeriodicasItens.Eof = True do
        begin
          DM.qryLubrificPeriodicasItens.Edit;
          if GrdItensLubrific.SelectedIndex = 4 then
          begin
            DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'S';
            DM.qryLubrificPeriodicasItensBOM.AsString := 'N';
            DM.qryLubrificPeriodicasItensREGULAR.AsString := 'N';
            DM.qryLubrificPeriodicasItensRUIM.AsString := 'N';
          end
          else if GrdItensLubrific.SelectedIndex = 5 then
          begin
            DM.qryLubrificPeriodicasItensBOM.AsString := 'S';
            DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
            DM.qryLubrificPeriodicasItensREGULAR.AsString := 'N';
            DM.qryLubrificPeriodicasItensRUIM.AsString := 'N';
          end
          else if GrdItensLubrific.SelectedIndex = 6 then
          begin
            DM.qryLubrificPeriodicasItensREGULAR.AsString := 'S';
            DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
            DM.qryLubrificPeriodicasItensBOM.AsString := 'N';
            DM.qryLubrificPeriodicasItensRUIM.AsString := 'N';
          end
          else if GrdItensLubrific.SelectedIndex = 7 then
          begin
            DM.qryLubrificPeriodicasItensRUIM.AsString := 'S';
            DM.qryLubrificPeriodicasItensEXECUTADO.AsString := 'N';
            DM.qryLubrificPeriodicasItensBOM.AsString := 'N';
            DM.qryLubrificPeriodicasItensREGULAR.AsString := 'N';
          end;
          DM.qryLubrificPeriodicasItens.Post;

          DM.qryLubrificPeriodicasItens.Next;
        end;
      end;
    end;
    2:
    begin
      if GrdRotaManutItens.SelectedIndex in [4, 5, 6, 7] then
      begin
        DM.qryRotaPeriodicasManutItens.First;
        while not  DM.qryRotaPeriodicasManutItens.Eof = True do
        begin
          DM.qryRotaPeriodicasManutItens.Edit;
          if GrdItensManut.SelectedIndex = 4 then
          begin
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'S';
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'N';
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 5 then
          begin
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'N';
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 6 then
          begin
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'N';
          end
          else if GrdItensManut.SelectedIndex = 7 then
          begin
            DM.qryRotaPeriodicasManutItensRUIM.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensREGULAR.AsString := 'N';
          end;
          DM.qryRotaPeriodicasManutItens.Post;

          DM.qryRotaPeriodicasManutItens.Next;
        end;
      end;
    end;
  end;
end;

procedure TFrmTelaInspFechamento.MenuItem1Click(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
    begin
      if GrdItensEspManut.SelectedIndex in [4, 5, 6, 7] then
      begin
        DM.qryManutPeriodicasItensEsp.First;
        while not  DM.qryManutPeriodicasItensEsp.Eof = True do
        begin
          DM.qryManutPeriodicasItensEsp.Edit;
          if GrdItensEspManut.SelectedIndex = 4 then
          begin
            DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'S';
            DM.qryManutPeriodicasItensEspBOM.AsString := 'N';
            DM.qryManutPeriodicasItensEspREGULAR.AsString := 'N';
            DM.qryManutPeriodicasItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 5 then
          begin
            DM.qryManutPeriodicasItensEspBOM.AsString := 'S';
            DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
            DM.qryManutPeriodicasItensEspREGULAR.AsString := 'N';
            DM.qryManutPeriodicasItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 6 then
          begin
            DM.qryManutPeriodicasItensEspREGULAR.AsString := 'S';
            DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
            DM.qryManutPeriodicasItensEspBOM.AsString := 'N';
            DM.qryManutPeriodicasItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 7 then
          begin
            DM.qryManutPeriodicasItensEspRUIM.AsString := 'S';
            DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
            DM.qryManutPeriodicasItensEspBOM.AsString := 'N';
            DM.qryManutPeriodicasItensEspREGULAR.AsString := 'N';
          end;
          DM.qryManutPeriodicasItensEsp.Post;

          DM.qryManutPeriodicasItensEsp.Next;
        end;
      end;
    end;
    1:
    begin
      if GrdItensEspLubrific.SelectedIndex in [4, 5, 6, 7] then
      begin
        DM.qryLubrificPeriodicasItensEsp.First;
        while not  DM.qryLubrificPeriodicasItensEsp.Eof = True do
        begin
          DM.qryLubrificPeriodicasItensEsp.Edit;
          if GrdItensEspLubrific.SelectedIndex = 4 then
          begin
            DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'S';
            DM.qryLubrificPeriodicasItensEspBOM.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspREGULAR.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspLubrific.SelectedIndex = 5 then
          begin
            DM.qryLubrificPeriodicasItensEspBOM.AsString := 'S';
            DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspREGULAR.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspLubrific.SelectedIndex = 6 then
          begin
            DM.qryLubrificPeriodicasItensEspREGULAR.AsString := 'S';
            DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspBOM.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspLubrific.SelectedIndex = 7 then
          begin
            DM.qryLubrificPeriodicasItensEspRUIM.AsString := 'S';
            DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspBOM.AsString := 'N';
            DM.qryLubrificPeriodicasItensEspREGULAR.AsString := 'N';
          end;
          DM.qryLubrificPeriodicasItensEsp.Post;

          DM.qryLubrificPeriodicasItensEsp.Next;
        end;
      end;
    end;
    2:
    begin
      if GrdRotaManutItensEsp.SelectedIndex in [4, 5, 6, 7] then
      begin
        DM.qryRotaPeriodicasManutItensEsp.First;
        while not  DM.qryRotaPeriodicasManutItensEsp.Eof = True do
        begin
          DM.qryRotaPeriodicasManutItensEsp.Edit;
          if GrdItensEspManut.SelectedIndex = 4 then
          begin
            DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEspBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspREGULAR.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 5 then
          begin
            DM.qryRotaPeriodicasManutItensEspBOM.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspREGULAR.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 6 then
          begin
            DM.qryRotaPeriodicasManutItensEspREGULAR.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspRUIM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 7 then
          begin
            DM.qryRotaPeriodicasManutItensEspRUIM.AsString := 'S';
            DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspBOM.AsString := 'N';
            DM.qryRotaPeriodicasManutItensEspREGULAR.AsString := 'N';
          end;
          DM.qryRotaPeriodicasManutItensEsp.Post;

          DM.qryRotaPeriodicasManutItensEsp.Next;
        end;
      end;
    end;
  end;
end;

procedure TFrmTelaInspFechamento.MenuItem2Click(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
    begin
      if GrdItensEspManut.SelectedIndex in [4, 5, 6, 7] then
      begin
        DM.qryManutPeriodicasItensEsp.First;
        while not  DM.qryManutPeriodicasItensEsp.Eof = True do
        begin
          DM.qryManutPeriodicasItensEsp.Edit;
          if GrdItensEspManut.SelectedIndex = 4 then
          begin
            DM.qryManutPeriodicasItensEspEXECUTADO.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 5 then
          begin
            DM.qryManutPeriodicasItensEspBOM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 6 then
          begin
            DM.qryManutPeriodicasItensEspREGULAR.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 7 then
          begin
            DM.qryManutPeriodicasItensEspRUIM.AsString := 'N';
          end;
          DM.qryManutPeriodicasItensEsp.Post;

          DM.qryManutPeriodicasItensEsp.Next;
        end;
      end;
    end;
    1:
    begin
      if GrdItensEspLubrific.SelectedIndex in [14, 15,16,17] then
      begin
        DM.qryLubrificPeriodicasItensEsp.First;
        while not  DM.qryLubrificPeriodicasItensEsp.Eof = True do
        begin
          DM.qryLubrificPeriodicasItensEsp.Edit;
          if GrdItensEspLubrific.SelectedIndex = 14 then
          begin
            DM.qryLubrificPeriodicasItensEspEXECUTADO.AsString := 'N';
          end
          else if GrdItensEspLubrific.SelectedIndex = 15 then
          begin
            DM.qryLubrificPeriodicasItensEspBOM.AsString := 'N';
          end
          else if GrdItensEspLubrific.SelectedIndex = 16 then
          begin
            DM.qryLubrificPeriodicasItensEspREGULAR.AsString := 'N';
          end
          else if GrdItensEspLubrific.SelectedIndex = 17 then
          begin
            DM.qryLubrificPeriodicasItensEspRUIM.AsString := 'N';
          end;
          DM.qryLubrificPeriodicasItensEsp.Post;

          DM.qryLubrificPeriodicasItensEsp.Next;
        end;
      end;
    end;
    2:
    begin
      if GrdRotaManutItensEsp.SelectedIndex in [4, 5, 6, 7] then
      begin
        DM.qryRotaPeriodicasManutItensEsp.First;
        while not  DM.qryRotaPeriodicasManutItensEsp.Eof = True do
        begin
          DM.qryRotaPeriodicasManutItensEsp.Edit;
          if GrdItensEspManut.SelectedIndex = 4 then
          begin
            DM.qryRotaPeriodicasManutItensEspEXECUTADO.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 5 then
          begin
            DM.qryRotaPeriodicasManutItensEspBOM.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 6 then
          begin
            DM.qryRotaPeriodicasManutItensEspREGULAR.AsString := 'N';
          end
          else if GrdItensEspManut.SelectedIndex = 7 then
          begin
            DM.qryRotaPeriodicasManutItensEspRUIM.AsString := 'N';
          end;
          DM.qryRotaPeriodicasManutItensEsp.Post;

          DM.qryRotaPeriodicasManutItensEsp.Next;
        end;
      end;
    end;
  end;
end;

procedure TFrmTelaInspFechamento.PCInspecoesChange(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
      begin
        BtnMaodeObra.Visible := True;
      end;
    1:
      begin
        BtnMaodeObra.Visible := True;
      end;
    2:
      begin
        BtnMaodeObra.Visible := False;
      end;
  end;
end;

procedure TFrmTelaInspFechamento.RGFiltroClick(Sender: TObject);
begin
  inherited;
  ConfigurarFiltros;
end;

procedure TFrmTelaInspFechamento.rgStatusClick(Sender: TObject);
begin
  inherited;
  case rgStatus.ItemIndex of
    0:
      begin
        DM.qryManutPeriodicas.Filtered := False;
        DM.qryLubrificPeriodicas.Filtered := False;
        DM.qryManutPeriodicas.Close;
        DM.qryManutPeriodicas.Params[0].AsString := DM.FCodEmpresa;
        DM.qryManutPeriodicas.Params[1].AsString := 'ABERTA';
//        DM.qryManutPeriodicas.Params[2].AsString := 'LIBERADA';
        DM.qryManutPeriodicas.Open;
      end;
    1:
      begin
        DM.qryManutPeriodicas.Filtered := False;
        DM.qryManutPeriodicas.Filter   := 'SITUACAOOS = ' + QuotedStr('FECHADA');
        DM.qryManutPeriodicas.Filtered := True;

        DM.qryLubrificPeriodicas.Filtered := False;
        DM.qryLubrificPeriodicas.Filter   := 'SITUACAOOS = ' + QuotedStr('FECHADA');
        DM.qryLubrificPeriodicas.Filtered := True;
      end;
  end;

  TSManut.Caption := 'Manutenções ('+IntToStr(DM.qryManutPeriodicas.RecordCount)+')';
  TSLubrific.Caption := 'Lubrificações ('+IntToStr(DM.qryLubrificPeriodicas.RecordCount)+')';
  //RGFiltro.OnClick(Sender);
end;

procedure TFrmTelaInspFechamento.Timer1Timer(Sender: TObject);
var
  hora_atual, diferenca: TDateTime;
  df_hr: TTime;
  dt_ini, dt_final: TDate;
  LTemp:Integer;
begin
  inherited;
  TThread.CreateAnonymousThread(
                                procedure
                                begin
                                  hora_atual := Now;

                                  if (hora_atual < hora_futura) then
                                      begin
                                          dt_ini := DateOf(hora_atual);
                                          dt_final := DateOf(hora_futura);

                                          diferenca := hora_futura - hora_atual;
                                          df_hr := TimeOf(diferenca);

//                                          label1.Caption := 'Atualiza em ' +FormatDateTime('nn:ss', diferenca);
//                                          Application.Title := Label1.Caption;

                                          Application.ProcessMessages;
                                      end
                                  else
                                    begin
                                      TThread.Synchronize(TThread.CurrentThread,
                                              procedure
                                              begin
                                                if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString = 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
                                                  begin
                                                    DM.MSGAguarde('ATUALIZANDO');
                                                    BtnOK.Enabled := False;

                                                    Try
                                                      LTemp :=  DM.FSegundosDesliga;

                                                      DM.qryManutPeriodicas.Close;
                                                      DM.qryManutPeriodicasItens.Close;
                                                      DM.qryManutPeriodicasItensEsp.Close;
                                                      DM.qryManutPeriodicas.Params[0].AsString := DM.FCodEmpresa;
                                                      DM.qryManutPeriodicas.Params[1].AsString := 'ABERTA';
//                                                      DM.qryManutPeriodicas.Params[2].AsString := 'FECHADA';
                                                      DM.qryManutPeriodicas.Open;
                                                      DM.qryManutPeriodicasItens.Open;
                                                      DM.qryManutPeriodicasItensEsp.Open;

                                                      TSManut.Caption := 'Manutenções ('+IntToStr(DM.qryManutPeriodicas.RecordCount)+')';
                                                      GrdManutencao.SelectedRows.CurrentRowSelected := True;
                                                      hora_futura := IncMinute(Now, 5);
                                                    Except
                                                      DM.MSGAguarde('', False);
                                                      BtnOK.Enabled := True;
                                                      Abort;
                                                    End;

                                                    Application.ProcessMessages;

                                                    DM.MSGAguarde('', False);
                                                    BtnOK.Enabled := True;
                                                    DM.FSegundosDesliga := LTemp;
                                                  end;

                                              end);
                                    end;
                                end
                               ).Start;
end;

end.


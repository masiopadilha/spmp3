unit UnTelaCadOrdemServicoHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, System.DateUtils, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, Datasnap.DBClient, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoHistorico = class(TFrmTelaPaiOKCancel)
    GrdConsulta: TDBGrid;
    EdtData1: TDateTimePicker;
    Label1: TLabel;
    EdtData2: TDateTimePicker;
    BtnConsultar: TButton;
    BtnImprimir: TButton;
    LEdtServico: TLabeledEdit;
    Label2: TLabel;
    PopupMenuRelat: TPopupMenu;
    Relatorio: TMenuItem;
    Consultar: TMenuItem;
    CDResumoConsulta: TClientDataSet;
    CDResumoConsultaCODIGO: TIntegerField;
    CDResumoConsultaDESCRICAO: TStringField;
    CDResumoConsultaAREA: TStringField;
    CDResumoConsultaCELULA: TStringField;
    CDResumoConsultaMANUTENCAO: TStringField;
    CDResumoConsultaMOTIVO: TStringField;
    CDResumoConsultaOFICINA: TStringField;
    CDResumoConsultaCENTROCUSTO: TStringField;
    CDResumoConsultaCODEQUIPAMENTO: TStringField;
    CDResumoConsultaEQUIPAMENTO: TStringField;
    CDResumoConsultaDATACADASTRO: TDateTimeField;
    CDResumoConsultaDATAINICIOREAL: TDateTimeField;
    CDResumoConsultaDATAFIMREAL: TDateTimeField;
    CDResumoConsultaCADASTRO: TStringField;
    CDResumoConsultaSITUACAO: TStringField;
    CDResumoConsultaSERVICO: TStringField;
    CDResumoConsultaTOTALOS: TIntegerField;
    CBSituacao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure ConfigurarFiltros;
    procedure GrdConsultaDblClick(Sender: TObject);
    procedure GrdConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImprimirClick(Sender: TObject);
    procedure LEdtServicoKeyPress(Sender: TObject; var Key: Char);
    procedure RelatorioClick(Sender: TObject);
    procedure ConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoHistorico: TFrmTelaCadOrdemServicoHistorico;
  LCodSolicitante, LEquipamento, LCodEquipamento, LCodArea, LCodManutencao, LCodMotivoParada, LCodCentroCusto: String;


implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadOrdemServicoFechamento, UnDmRelatorios,
  UnTelaCadOrdemServico, UnDM;

procedure TFrmTelaCadOrdemServicoHistorico.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if EdtData1.Date > EdtData2.Date then
  begin
    EdtData1.SetFocus;
    Exit;
  end;

DM.MSGAguarde('');


DM.qryOrdemServicoHistorico.Close;
DM.qryOrdemServicoHistorico.Params[0].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date);
DM.qryOrdemServicoHistorico.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date);
case CBSituacao.ItemIndex of
  0:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 0;
  1:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 1;
  2:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 2;
  3:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 3;
  4:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 4;
  5:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 5;
  6:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 6;
  7:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 7;
  8:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 8;
  9:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 9;
  10:DM.qryOrdemServicoHistorico.Params[2].AsInteger := 10;
end;
DM.qryOrdemServicoHistorico.Open;
DM.qryOrdemServicoHistorico.Filter   := '';
DM.qryOrdemServicoHistorico.Filtered := False;
LCodSolicitante := ''; LEquipamento := ''; LCodEquipamento := ''; LCodArea := ''; LCodManutencao := ''; LCodMotivoParada := ''; LCodCentroCusto := '';
DM.qryOrdemServicoHistoricoServExec.Open;
ConfigurarFiltros;

GrdConsulta.Hint := 'Total de ' + IntToStr(DM.qryOrdemServicoHistorico.RecordCount);

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadOrdemServicoHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryOrdemServicoHistorico.Close;
//DM.qryOrdemServicoHistoricoServExec.Close;
//DM.qryOrdemServico.Close;
//DM.qryOrdemServicoEquipe.Close;
//DM.qryOrdemServicoEquipeMObra.Close;
//DM.qryOrdemServicoEquipeRecursosUtil.Close;
//DM.qryOrdemServicoEquipePecasUtil.Close;
//DM.qryOrdemServicoEquipePlanoTrab.Close;
end;

procedure TFrmTelaCadOrdemServicoHistorico.FormCreate(Sender: TObject);
begin
  inherited;
EdtData1.Date := IncDay(DM.FDataHoraServidor, -30);
EdtData2.Date := DM.FDataHoraServidor;
end;

procedure TFrmTelaCadOrdemServicoHistorico.GrdConsultaDblClick(Sender: TObject);
begin
  inherited;
  with DM.qryOrdemServico do
    begin
      Close;
      Params[0].AsString  := DM.FCodEmpresa;
      Params[1].AsInteger := DM.qryOrdemServicoHistoricoCODIGO.AsInteger;
      Open;
      Edit;
    end;

  Try
    Application.CreateForm(TFrmTelaCadOrdemServico, FrmTelaCadOrdemServico);
    FrmTelaCadOrdemServico.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOrdemServico);
  End;
end;

procedure TFrmTelaCadOrdemServicoHistorico.GrdConsultaKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
if (Key = #13) then
  begin
    case GrdConsulta.SelectedIndex of
      1:
        begin
          LCodSolicitante := '';
          DM.FTabela_auxiliar := 300;
          DM.FNomeConsulta := 'Funcionários';
          DM.FParamAuxiliar[1] := 'NOME';
        end;
      2:
        begin
          LCampo :=DM.CampoInputBox('SPMPWeb', 'Informe o código da ordem de serviço:');
          if LCampo <> EmptyStr then
            begin
              if GrdConsulta.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
                Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
            end;
        end;
      4:
        begin
          LCodEquipamento := '';
          DM.FTabela_auxiliar := 250;
          DM.FNomeConsulta := 'Equipamentos';
          DM.FParamAuxiliar[1] := 'DESCRICAO';
        end;
      5:
        begin
          LCodArea := '';
          DM.FTabela_auxiliar := 150;
          DM.FNomeConsulta := 'Áreas';
        end;
      6:
        begin
          LCodManutencao := '';
          DM.FTabela_auxiliar := 100;
          DM.FNomeConsulta := 'Tipos de Manutenção';
        end;
      7:
        begin
          LCodMotivoParada := '';
          DM.FTabela_auxiliar := 110;
          DM.FNomeConsulta := 'Motivos de Paradas';
        end;
      8:
        begin
          LCodCentroCusto := '';
          DM.FNomeConsulta := 'Centros de Custos';
          DM.FTabela_auxiliar := 400;
        end;
    end;

    if (GrdConsulta.SelectedIndex <> 0) and (GrdConsulta.SelectedIndex <> 2) and (GrdConsulta.SelectedIndex <> 3) then
      Try
        Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
        FrmTelaAuxiliar.ShowModal;
      Finally
        if DM.FCodCombo <> EmptyStr then
          begin
            case GrdConsulta.SelectedIndex of
              1:
                begin
                  LCodSolicitante := DM.FCodCombo;
                  GrdConsulta.Columns[1].Title.Font.Color := clBlue;
                end;
              4:
                begin
                  LCodEquipamento := DM.FCodCombo;
                  GrdConsulta.Columns[4].Title.Font.Color := clBlue;
                end;
              5:
                begin
                  LCodArea := DM.FCodCombo;
                  GrdConsulta.Columns[5].Title.Font.Color := clBlue;
                end;
              6:
                begin
                  LCodManutencao := DM.FCodCombo;
                  GrdConsulta.Columns[6].Title.Font.Color := clBlue;
                end;
              7:
                begin
                  LCodMotivoParada := DM.FCodCombo;
                  GrdConsulta.Columns[7].Title.Font.Color := clBlue;
                end;
              8:
                begin
                  LCodCentroCusto := DM.FCodCombo;
                  GrdConsulta.Columns[8].Title.Font.Color := clBlue;
                end;
            end;
          end
        else
          begin
            case GrdConsulta.SelectedIndex of
              1:
                begin
                  LCodSolicitante := EmptyStr;
                  GrdConsulta.Columns[1].Title.Font.Color := clBlack;
                end;
              4:
                begin
                  LCodEquipamento := EmptyStr;
                  GrdConsulta.Columns[4].Title.Font.Color := clBlack;
                end;
              5:
                begin
                  LCodArea := EmptyStr;
                  GrdConsulta.Columns[5].Title.Font.Color := clBlack;
                end;
              6:
                begin
                  LCodManutencao := EmptyStr;
                  GrdConsulta.Columns[6].Title.Font.Color := clBlack;
                end;
              7:
                begin
                  LCodMotivoParada := EmptyStr;
                  GrdConsulta.Columns[7].Title.Font.Color := clBlack;
                end;
              8:
                begin
                  LCodCentroCusto := EmptyStr;
                  GrdConsulta.Columns[8].Title.Font.Color := clBlack;
                end;
            end;
          end;
        ConfigurarFiltros;
        GrdConsulta.Hint := 'Total de ' + IntToStr(DM.qryOrdemServicoHistorico.RecordCount);
        FreeAndNil(FrmTelaAuxiliar);
      End;
  end;
end;

procedure TFrmTelaCadOrdemServicoHistorico.ConfigurarFiltros;
begin
DM.qryOrdemServicoHistorico.Filtered := False;
DM.qryOrdemServicoHistorico.Filter := '';
if LEdtServico.Text <> '' then
  begin
    DM.qryOrdemServicoHistorico.Filter   := 'LOWER(DESCRICAO) LIKE ' + LowerCase(QuotedStr('%' + LEdtServico.Text + '%'));

    if LCodSolicitante <> '' then
      DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND MATRICULA = ' + QuotedStr(LCodSolicitante);

    if LCodEquipamento <> '' then
      DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento);

    if LCodArea <> '' then
      DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODAREA = ' + QuotedStr(LCodArea);

    if LCodManutencao <> '' then
      DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODMANUTENCAO = ' + QuotedStr(LCodManutencao);

    if LCodMotivoParada <> '' then
      DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODMOTIVOPARADA = ' + QuotedStr(LCodMotivoParada);

    if LCodCentroCusto <> '' then
      DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODCENTROCUSTO = ' + QuotedStr(LCodCentroCusto);

    DM.qryOrdemServicoHistorico.Filtered := True;
  end
else
  begin
    if LCodSolicitante <> '' then
      DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' MATRICULA = ' + QuotedStr(LCodSolicitante);

    if LCodEquipamento <> '' then
      if DM.qryOrdemServicoHistorico.Filter = '' then
        DM.qryOrdemServicoHistorico.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento)
    else
        DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento);

    if LCodArea <> '' then
      if DM.qryOrdemServicoHistorico.Filter = '' then
        DM.qryOrdemServicoHistorico.Filter := 'CODAREA = ' + QuotedStr(LCodArea)
      else
        DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODAREA = ' + QuotedStr(LCodArea);

    if LCodManutencao <> '' then
      if DM.qryOrdemServicoHistorico.Filter = '' then
        DM.qryOrdemServicoHistorico.Filter := 'CODMANUTENCAO = ' + QuotedStr(LCodManutencao)
      else
        DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODMANUTENCAO = ' + QuotedStr(LCodManutencao);

    if LCodMotivoParada <> '' then
      if DM.qryOrdemServicoHistorico.Filter = '' then
        DM.qryOrdemServicoHistorico.Filter := 'CODMOTIVOPARADA = ' + QuotedStr(LCodMotivoParada)
      else
        DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODMOTIVOPARADA = ' + QuotedStr(LCodMotivoParada);

    if LCodCentroCusto <> '' then
      if DM.qryOrdemServicoHistorico.Filter = '' then
        DM.qryOrdemServicoHistorico.Filter := 'CODCENTROCUSTO = ' + QuotedStr(LCodCentroCusto)
      else
        DM.qryOrdemServicoHistorico.Filter := DM.qryOrdemServicoHistorico.Filter + ' AND CODCENTROCUSTO = ' + QuotedStr(LCodCentroCusto);

    if DM.qryOrdemServicoHistorico.Filter <> '' then
      DM.qryOrdemServicoHistorico.Filtered := True;
  end;
end;

procedure TFrmTelaCadOrdemServicoHistorico.LEdtServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if Key = #13 then
  begin
    Key := #0;
    ConfigurarFiltros;
  end;
end;

procedure TFrmTelaCadOrdemServicoHistorico.RelatorioClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxROrdemServicoHistorico.ShowReport();
end;

procedure TFrmTelaCadOrdemServicoHistorico.BtnImprimirClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.qryOrdemServicoHistorico.IsEmpty then Exit;
DmRelatorios.frxROrdemServicoHistorico.ShowReport();

//PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadOrdemServicoHistorico.ConsultarClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
  CDResumoConsulta.Close; CDResumoConsulta.CreateDataSet; CDResumoConsulta.Open;
  DM.qryOrdemServicoHistorico.First;
  while not DM.qryOrdemServicoHistorico.Eof = True do
    begin
      CDResumoConsulta.Append;
      CDResumoConsultaCODIGO.AsInteger          := DM.qryOrdemServicoHistoricoCODIGO.AsInteger;
      CDResumoConsultaDESCRICAO.AsString        := DM.qryOrdemServicoHistoricoDESCRICAO.AsString;
      CDResumoConsultaAREA.AsString             := DM.qryOrdemServicoHistoricoAREA.AsString;
      CDResumoConsultaCELULA.AsString           := DM.qryOrdemServicoHistoricoCELULA.AsString;
      CDResumoConsultaMANUTENCAO.AsString       := DM.qryOrdemServicoHistoricoMANUTENCAO.AsString;
      CDResumoConsultaMOTIVO.AsString           := DM.qryOrdemServicoHistoricoMOTIVOPARADA.AsString;
      CDResumoConsultaOFICINA.AsString          := DM.qryOrdemServicoHistoricoOFICINA.AsString;
      CDResumoConsultaCENTROCUSTO.AsString      := DM.qryOrdemServicoHistoricoCENTROCUSTO.AsString;
      CDResumoConsultaCODEQUIPAMENTO.AsString   := DM.qryOrdemServicoHistoricoCODEQUIPAMENTO.AsString;
      CDResumoConsultaEQUIPAMENTO.AsString      := DM.qryOrdemServicoHistoricoEQUIPAMENTO.AsString;
      CDResumoConsultaDATACADASTRO.AsDateTime   := DM.qryOrdemServicoHistoricoDATACADASTRO.AsDateTime;
      if DM.qryOrdemServicoHistoricoDATAINICIOREAL.IsNull = False then CDResumoConsultaDATAINICIOREAL.AsDateTime := DM.qryOrdemServicoHistoricoDATAINICIOREAL.AsDateTime;
      if DM.qryOrdemServicoHistoricoDATAFIMREAL.IsNull = False    then CDResumoConsultaDATAFIMREAL.AsDateTime    := DM.qryOrdemServicoHistoricoDATAFIMREAL.AsDateTime;
      CDResumoConsultaCADASTRO.AsString         := FormatDateTime('dd/mm/yyyy', EdtData1.Date) + ' a ' + FormatDateTime('dd/mm/yyyy',EdtData2.Date);
      CDResumoConsultaSITUACAO.AsString         := DM.qryOrdemServicoHistoricoSITUACAO.AsString;
      CDResumoConsultaSERVICO.AsString          := LEdtServico.Text;
      CDResumoConsultaTOTALOS.AsInteger         := DM.qryOrdemServicoHistorico.RecordCount;
      CDResumoConsulta.Append;

      DM.qryOrdemServicoHistorico.Next;
    end;
  DM.qryOrdemServicoHistorico.First;

  DmRelatorios.frxROrdemServicoResumoHistorico.ShowReport();
end;

end.


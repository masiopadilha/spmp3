unit UnTelaInspFechamentoHist;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, System.DateUtils,
  Vcl.Menus, Data.DB, FireDAC.Stan.Param, JvExComCtrls, JvDateTimePicker;

type
  TFrmTelaInspFechamentoHist = class(TFrmTelaPaiOkCancel)
    GrdLubrificacaoHist: TDBGrid;
    BtnImprimir: TButton;
    GrdManutencaoHist: TDBGrid;
    PopupMenuRelat: TPopupMenu;
    Manutencoes1: TMenuItem;
    Lubrificacoes1: TMenuItem;
    Panel1: TPanel;
    Label6: TLabel;
    Button1: TButton;
    EdtFamiliaEquip: TEdit;
    CBConsSimples: TComboBox;
    Label2: TLabel;
    Label1: TLabel;
    BtnConsultar: TButton;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    EdtData2: TJvDateTimePicker;
    Individual1: TMenuItem;
    Completo1: TMenuItem;
    Individual2: TMenuItem;
    Completo2: TMenuItem;
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure GrdManutencaoHistKeyPress(Sender: TObject; var Key: Char);
    procedure GrdLubrificacaoHistKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFamiliaEquipDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBConsSimplesChange(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo2Click(Sender: TObject);
    procedure Individual2Click(Sender: TObject);
  private
    procedure ConfigurarFiltros;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaInspFechamentoHist: TFrmTelaInspFechamentoHist;
  LCodEquipamento, LCodFamilia: String;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnTelaConsulta, UnDM;

procedure TFrmTelaInspFechamentoHist.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  if EdtData1.Date > EdtData2.Date then
    begin
      EdtData1.SetFocus;
      Exit;
    end;
  DM.MSGAguarde('');

  DM.qryManutPeriodicasHist.Close;
  DM.qryManutPeriodicasHist.Params[0].AsString := DM.FCodEmpresa;
  case CBConsSimples.ItemIndex of
    0:DM.qryManutPeriodicasHist.Params[1].AsString := 'ABERTA';
    1:DM.qryManutPeriodicasHist.Params[1].AsString := 'FECHADA';
    2:DM.qryManutPeriodicasHist.Params[1].AsString := 'CANCELADA';
    3:DM.qryManutPeriodicasHist.Params[1].AsString := 'VENCIDA';
  end;
  DM.qryManutPeriodicasHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date);
  DM.qryManutPeriodicasHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date);
  DM.qryManutPeriodicasHist.Open;
  DM.qryManutPeriodicasHistItens.Open;
  DM.qryManutPeriodicasHistItensEsp.Open;

  DM.qryLubrificPeriodicasHist.Close;
  DM.qryLubrificPeriodicasHist.Params[0].AsString := DM.FCodEmpresa;
  case CBConsSimples.ItemIndex of
    0:DM.qryLubrificPeriodicasHist.Params[1].AsString := 'ABERTA';
    1:DM.qryLubrificPeriodicasHist.Params[1].AsString := 'FECHADA';
    2:DM.qryLubrificPeriodicasHist.Params[1].AsString := 'CANCELADA';
    3:DM.qryLubrificPeriodicasHist.Params[1].AsString := 'VENCIDA';
  end;
  DM.qryLubrificPeriodicasHist.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date);
  DM.qryLubrificPeriodicasHist.Params[3].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date);
  DM.qryLubrificPeriodicasHist.Open;
  DM.qryLubrificPeriodicasHistItens.Open;
  DM.qryLubrificPeriodicasHistItensEsp.Open;

  ConfigurarFiltros;

  DM.MSGAguarde('', False);
end;

procedure TFrmTelaInspFechamentoHist.BtnImprimirClick(Sender: TObject);
begin
  inherited;
PopupMenuRelat.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaInspFechamentoHist.Button1Click(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodFamilia          := DM.FCodCombo;
        EdtFamiliaEquip.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
  end;
end;

procedure TFrmTelaInspFechamentoHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryManutPeriodicasHist.Close;
DM.qryManutPeriodicasHistItens.Close;
DM.qryManutPeriodicasHistItensEsp.Close;
DM.qryLubrificPeriodicasHist.Close;
//DM.qryLubrificPeriodicasHistItens.Close;
//DM.qryLubrificPeriodicasHistItensEsp.Close;
end;

procedure TFrmTelaInspFechamentoHist.FormCreate(Sender: TObject);
begin
  inherited;
EdtData1.Date := IncMonth(DM.FDataHoraServidor, -1);
EdtData2.Date := DM.FDataHoraServidor;
end;

procedure TFrmTelaInspFechamentoHist.GrdLubrificacaoHistKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (Key = #13) then
  begin
    case GrdLubrificacaoHist.SelectedIndex of
      3:
        begin
          DM.FTabela_auxiliar := 250;
          DM.FNomeConsulta := 'Equipamentos';
          DM.FParamAuxiliar[1] := 'DESCRICAO';
        end;
    end;

    if (GrdLubrificacaoHist.SelectedIndex = 3) then
      Try
        Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
        FrmTelaAuxiliar.ShowModal;
      Finally
        if DM.FCodCombo <> EmptyStr then
          begin
            case GrdLubrificacaoHist.SelectedIndex of
              3:
                begin
                  LCodEquipamento := DM.FCodCombo;
                  GrdLubrificacaoHist.Columns[3].Title.Font.Color := clBlue;
                end;
            end;
          end
        else
          begin
            case GrdLubrificacaoHist.SelectedIndex of
              3:
                begin
                  LCodEquipamento := EmptyStr;
                  GrdLubrificacaoHist.Columns[3].Title.Font.Color := clBlack;
                  DM.qryLubrificPeriodicas.Filtered := False;
                end;
            end;
          end;
        GrdLubrificacaoHist.SetFocus;
        ConfigurarFiltros;
        FreeAndNil(FrmTelaAuxiliar);
      End;
  end;
end;

procedure TFrmTelaInspFechamentoHist.GrdManutencaoHistKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (Key = #13) then
  begin
    case GrdManutencaoHist.SelectedIndex of
      3:
        begin
          DM.FTabela_auxiliar := 250;
          DM.FNomeConsulta := 'Equipamentos';
          DM.FParamAuxiliar[1] := 'DESCRICAO';
        end;
    end;

    if (GrdManutencaoHist.SelectedIndex = 3) then
      Try
        Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
        FrmTelaAuxiliar.ShowModal;
      Finally
        if DM.FCodCombo <> EmptyStr then
          begin
            case GrdManutencaoHist.SelectedIndex of
              3:
                begin
                  LCodEquipamento := DM.FCodCombo;
                  GrdManutencaoHist.Columns[3].Title.Font.Color := clBlue;
                end;
            end;
          end
        else
          begin
            case GrdManutencaoHist.SelectedIndex of
              3:
                begin
                  LCodEquipamento := EmptyStr;
                  GrdManutencaoHist.Columns[3].Title.Font.Color := clBlack;
                  DM.qryManutPeriodicas.Filtered := False;
                end;
            end;
          end;
        GrdManutencaoHist.SetFocus;
        ConfigurarFiltros;
        FreeAndNil(FrmTelaAuxiliar);
      End;

  end;
end;

procedure TFrmTelaInspFechamentoHist.Individual1Click(Sender: TObject);
begin
  inherited;
    if not Assigned(DmRelatorios) then
      Application.CreateForm(TDmRelatorios, DmRelatorios);

    DM.qryChecklistManut.Close;
    DM.qryChecklistManut.Params[0].AsString := DM.qryManutPeriodicasHist.FieldByName('CODORDEMSERVICO').AsString;
    DM.qryChecklistManut.Open;
    if DM.qryChecklistManut.IsEmpty = False then
    begin
      DmRelatorios.frxRChecklistManutProgEquip.ShowReport();
      DM.qryChecklistManut.Close;
      DM.qryChecklistManutPartes.Close;
      DM.qryChecklistManutItens.Close;
      DM.qryChecklistManutItensEsp.Close;
      DM.qryChecklistManutMObra.Close;
    end;
end;

procedure TFrmTelaInspFechamentoHist.Individual2Click(Sender: TObject);
begin
  inherited;
   if not Assigned(DmRelatorios) then
     Application.CreateForm(TDmRelatorios, DmRelatorios);

    DM.qryChecklistLubrific.Close;
    DM.qryChecklistLubrific.Params[0].AsString := DM.qryLubrificPeriodicasHist.FieldByName('CODORDEMSERVICO').AsString;
    DM.qryChecklistLubrific.Open;

    if DM.qryChecklistLubrific.IsEmpty = False then
    begin
      DmRelatorios.frxRChecklistLubrificProgEquip.ShowReport();
      DM.qryChecklistLubrific.Close;
      DM.qryChecklistLubrificPartes.Close;
      DM.qryChecklistLubrificItens.Close;
      DM.qryChecklistLubrificItensEsp.Close;
      DM.qryChecklistLubrificMObra.Close;
    end;
end;

procedure TFrmTelaInspFechamentoHist.CBConsSimplesChange(Sender: TObject);
begin
  inherited;
  BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaInspFechamentoHist.Completo1Click(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if LCodEquipamento <> '' then
  if DM.qryManutPeriodicasHist.Filter = '' then
    begin
      DM.qryManutPeriodicasHist.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento);
      DM.qryManutPeriodicasHist.Filtered := True;
    end;

DmRelatorios.frxRManutPeriodicas.ShowReport();
end;

procedure TFrmTelaInspFechamentoHist.Completo2Click(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if LCodEquipamento <> '' then
  if DM.qryLubrificPeriodicas.Filter = '' then
    begin
      DM.qryLubrificPeriodicas.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento);
      DM.qryLubrificPeriodicas.Filtered := True;
    end;

DmRelatorios.frxRLubrificPeriodicas.ShowReport();
end;

procedure TFrmTelaInspFechamentoHist.ConfigurarFiltros;
begin
DM.qryManutPeriodicas.Filtered := False;
DM.qryManutPeriodicas.Filter   := '';
DM.qryLubrificPeriodicas.Filtered := False;
DM.qryLubrificPeriodicas.Filter   := '';

if LCodEquipamento <> '' then
  if DM.qryManutPeriodicasHist.Filter = '' then
    DM.qryManutPeriodicasHist.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento)
else
    DM.qryManutPeriodicasHist.Filter := DM.qryManutPeriodicasHist.Filter + ' AND CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento);

if EdtFamiliaEquip.Text <> '' then
  begin
    if DM.qryManutPeriodicasHist.Filter = EmptyStr then
      DM.qryManutPeriodicasHist.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
    else
      DM.qryManutPeriodicasHist.Filter := DM.qryManutPeriodicasHist.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
  end;

  DM.qryManutPeriodicasHist.Filtered := True;

if LCodEquipamento <> '' then
  if DM.qryLubrificPeriodicasHist.Filter = '' then
    DM.qryLubrificPeriodicasHist.Filter := 'CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento)
else
    DM.qryLubrificPeriodicasHist.Filter := DM.qryLubrificPeriodicasHist.Filter + ' AND CODEQUIPAMENTO = ' + QuotedStr(LCodEquipamento);

if EdtFamiliaEquip.Text <> '' then
  begin
    if DM.qryLubrificPeriodicasHist.Filter = EmptyStr then
      DM.qryLubrificPeriodicasHist.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
    else
      DM.qryLubrificPeriodicasHist.Filter := DM.qryLubrificPeriodicasHist.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
  end;

DM.qryLubrificPeriodicasHist.Filtered := True;
end;

procedure TFrmTelaInspFechamentoHist.EdtFamiliaEquipDblClick(Sender: TObject);
begin
  inherited;
  LCodFamilia := '';
  EdtFamiliaEquip.Text := '';
  ConfigurarFiltros;
end;

end.

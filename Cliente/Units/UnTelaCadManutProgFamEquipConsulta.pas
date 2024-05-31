unit UnTelaCadManutProgFamEquipConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker,
  JvComponentBase, JvDBGridExport, JvBaseDlg, JvProgressDialog;

type
  TFrmTelaCadManutProgFamEquipConsulta = class(TFrmTelaPaiOKCancel)
    DBGrid: TJvDBGrid;
    PFiltros2: TPanel;
    Label6: TLabel;
    BtnTipoManutencao: TButton;
    EdtTipoManutencao: TEdit;
    chkProgramada: TCheckBox;
    chkAtivas: TCheckBox;
    BtnConsultar: TButton;
    JvProgressDialog1: TJvProgressDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkProgramadaClick(Sender: TObject);
    procedure chkAtivasClick(Sender: TObject);
    procedure BtnTipoManutencaoClick(Sender: TObject);
    procedure EdtTipoManutencaoDblClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    LEquipamento, LTipoManutencao, LProgramadas,  LAtivas: String;

    procedure SaveDoc(AExportClass: TJvCustomDBGridExportClass; const Filename: string);
    procedure DoExportProgress(Sender: TObject; Min, Max,
      Position: Cardinal; const AText: string; var AContinue: Boolean);
    procedure ConfigurarFiltros;
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgFamEquipConsulta: TFrmTelaCadManutProgFamEquipConsulta;

implementation

{$R *.dfm}

uses UnDM, UnTelaConsulta;


procedure TFrmTelaCadManutProgFamEquipConsulta.DBGridKeyPress(Sender: TObject;
  var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (DBGrid.SelectedIndex = 1) then
  begin
    LEquipamento := EmptyStr;
    DM.FTabela_auxiliar := 250;
    DM.FParamAuxiliar[1] := 'DESCRICAO';
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.FParamAuxiliar[0] := DM.FCodCombo;
      LEquipamento         := DM.FValorCombo;
      FreeAndNil(FrmTelaAuxiliar);
      ConfigurarFiltros;
    End;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.DoExportProgress(Sender: TObject; Min, Max,
  Position: Cardinal; const AText: string; var AContinue: Boolean);
begin
  JvProgressDialog1.Min := Min;
  JvProgressDialog1.Max := Max;
  JvProgressDialog1.Position := Position;
  JvProgressDialog1.Caption := AText;
  if Max > 0 then
    JvProgressDialog1.Text := Format('Exportando (%d%% finalizado)', [round(Position / Max * 100)]);
  AContinue := not JvProgressDialog1.Cancelled;
  if not AContinue or (Position >= Max) then
    JvProgressDialog1.Hide;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.SaveDoc(AExportClass: TJvCustomDBGridExportClass; const Filename: string);
var
  AExporter: TJvCustomDBGridExport;
begin
  AExporter := AExportClass.Create(self);
  try
    AExporter.Grid := DBGrid;
    if AExporter is TJvDBGridCSVExport then
      TJvDBGridCSVExport(AExporter).ExportSeparator := esComma; // this to be compatible with JvCsvData
    AExporter.Filename := Filename;
    AExporter.OnProgress := DoExportProgress;
    JvProgressDialog1.Caption := AExporter.Caption;
    JvProgressDialog1.Show;
    AExporter.ExportGrid;
  finally
    AExporter.Free;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.ConfigurarFiltros;
begin
  DBGrid.DataSource.DataSet.Filtered := False;
  DBGrid.DataSource.DataSet.Filter := EmptyStr;
  DM.qryManutProgFamEquipCons.IndexDefs.Clear;

  LProgramadas := ''; LAtivas := '';

  if EdtTipoManutencao.Text <> '' then
    begin
      if DBGrid.DataSource.DataSet.Filter = EmptyStr then
        DBGrid.DataSource.DataSet.Filter := 'CODTIPOMANUTENCAO = ' + QuotedStr(LTipoManutencao)
      else
        DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND CODTIPOMANUTENCAO = '+QuotedStr(LTipoManutencao);
    end;

  if (chkProgramada.Checked = True) then
    if DBGrid.DataSource.DataSet.Filter = '' then
      LProgramadas   := ' (PLANEJADA IS NULL)'
    else
      LProgramadas   := ' AND (PLANEJADA IS NULL)';
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LProgramadas;


  if (chkAtivas.Checked = True) then
  begin
    if DBGrid.DataSource.DataSet.Filter = '' then
      LAtivas   := ' (ATIVO = ''S'')'
    else
      LAtivas   := ' AND (ATIVO = ''S'')';
  end else
  begin
    if DBGrid.DataSource.DataSet.Filter = '' then
      LAtivas   := ' (ATIVO <> ''S'')'
    else
      LAtivas   := ' AND (ATIVO <> ''S'')';
  end;
  DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + LAtivas;

  if LEquipamento <> EmptyStr then
  begin
    if DBGrid.DataSource.DataSet.Filter = EmptyStr then
      DBGrid.DataSource.DataSet.Filter := 'CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0])
    else
      DBGrid.DataSource.DataSet.Filter := DBGrid.DataSource.DataSet.Filter + ' AND CODEQUIPAMENTO = '+QuotedStr(DM.FParamAuxiliar[0]);
  end;

  if DBGrid.DataSource.DataSet.Filter <> EmptyStr then
    DBGrid.DataSource.DataSet.Filtered := True;

  DM.qryManutProgFamEquipCons.First;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.BtnConsultarClick(
  Sender: TObject);
begin
  inherited;
  SaveDialog1.Filename := 'Consulta de Manutenções.'+FormatDateTime('dd.mm.yyyy.hh.sss', now)+'.csv';
  if SaveDialog1.Execute then
    SaveDoc(TJvDBGridCSVExport, SaveDialog1.Filename);
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.BtnTipoManutencaoClick(
  Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 100;
    DM.FNomeConsulta := 'Tipos de Manutenção';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LTipoManutencao        := DM.FCodCombo;
        EdtTipoManutencao.Text := DM.FValorCombo;
        ConfigurarFiltros;
      end;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.chkAtivasClick(Sender: TObject);
begin
  inherited;
  ConfigurarFiltros;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.chkProgramadaClick(
  Sender: TObject);
begin
  inherited;
  ConfigurarFiltros;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.EdtTipoManutencaoDblClick(
  Sender: TObject);
begin
  inherited;
  LTipoManutencao := '';
  EdtTipoManutencao.Text := '';
  ConfigurarFiltros;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryManutProgFamEquipCons.Close;
end;

procedure TFrmTelaCadManutProgFamEquipConsulta.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryManutProgFamEquipCons.Close;
  DM.qryManutProgFamEquipCons.Params[0].AsString := DM.FCodEmpresa;
  DM.qryManutProgFamEquipCons.Open;
  ConfigurarFiltros;
end;

end.

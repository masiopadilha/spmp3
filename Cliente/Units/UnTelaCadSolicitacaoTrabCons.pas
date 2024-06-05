unit UnTelaCadSolicitacaoTrabCons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvExComCtrls,
  JvDateTimePicker;

type
  TFrmTelaCadSolicitacaoTrabCons = class(TFrmTelaPaiOKCancel)
    DBGrid: TJvDBGrid;
    Chart1: TChart;
    Series2: TBarSeries;
    Series1: TBarSeries;
    Chart2: TChart;
    Series3: THorizBarSeries;
    PFiltros2: TPanel;
    Label6: TLabel;
    Label13: TLabel;
    BtnSolicitante: TButton;
    edtServico: TEdit;
    EdtFamiliaEquip: TEdit;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label4: TLabel;
    EdtData2: TJvDateTimePicker;
    BtnConsultar: TButton;
    Button1: TButton;
    EdtMatricula: TEdit;
    procedure BtnSolicitanteClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadSolicitacaoTrabCons: TFrmTelaCadSolicitacaoTrabCons;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadSolicitacaoTrabCons.BtnSolicitanteClick(Sender: TObject);
begin
  inherited;
  DM.FParamAuxiliar[2] := EdtMatricula.Text;

  DM.qryAuxiliar.Close;
  DM.qryAuxiliar.Fields.Clear;
  DM.qryAuxiliar.Indexes.Clear;
  DM.qryAuxiliar.SQL.Clear;
  DM.qryAuxiliar.SQL.Add('SELECT `solictrabalho`.`CODORDEMSERVICO`, `solictrabalho`.`DESCSERVICO`, `solictrabalho`.`DATACADASTRO`, `funcionarios`.`NOME` AS `SOLICITANTE`, `solictrabalho`.`CODEQUIPAMENTO`'
                          +', `equipamentos`.`DESCRICAO` AS `DESCEQUIPAMENTO`, `solictrabalho`.`CODIGO`, `ordemservico`.`SITUACAO`'
                          + ' FROM `solictrabalho` INNER JOIN `funcionarios` ON (`solictrabalho`.`CODSOLICITANTE` = `funcionarios`.`MATRICULA`) AND (`solictrabalho`.`CODEMPRESA` = `funcionarios`.`CODEMPRESA`)'
                          + ' LEFT JOIN `equipamentos` ON (`solictrabalho`.`CODEQUIPAMENTO` = `equipamentos`.`CODIGO`)  AND (`solictrabalho`.`CODEMPRESA` = `equipamentos`.`CODEMPRESA`) '
                          + ' INNER JOIN `ordemservico` ON (`solictrabalho`.`CODORDEMSERVICO` = `ordemservico`.`CODIGO`)'
                          + ' WHERE (`solictrabalho`.`DESCSERVICO` LIKE :descricao ');
                          if DM.FParamAuxiliar[2] <> '' then
                            DM.qryAuxiliar.SQL.Add('AND `solictrabalho`.`CODSOLICITANTE` = ' + DM.FParamAuxiliar[2]);
                          DM.qryAuxiliar.SQL.Add(' AND `solictrabalho`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+') ORDER BY `solictrabalho`.`DATACADASTRO` DESC');
  DM.qryAuxiliar.Params[0].AsString := '%' + edtServico.Text + '%';
  DM.qryAuxiliar.Open;

  DM.qryAuxiliar.Fields[0].DisplayLabel := 'OS';
  DBGrid.Columns[0].Title.Alignment     := taCenter;
  DBGrid.Columns[0].Title.Font.Style    := [fsBold];
  DM.qryAuxiliar.Fields[0].Alignment := taCenter;
  DM.qryAuxiliar.Fields[0].DisplayWidth := 8;
  DM.qryAuxiliar.Fields[1].DisplayWidth := 10;
  DM.qryAuxiliar.Fields[1].DisplayLabel := 'Serviço';
  DM.qryAuxiliar.Fields[1].DisplayWidth := 50;
  DBGrid.Columns[2].Title.Alignment  := taCenter;
  DM.qryAuxiliar.Fields[2].Alignment    := taCenter;
  DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cadastro';
  TDateTimeField(DM.qryAuxiliar.FieldByName('DATACADASTRO')).DisplayFormat := 'dd/mm/yy hh:mm';
  TDateTimeField(DM.qryAuxiliar.FieldByName('DATACADASTRO')).DisplayWidth  := 12;
  DM.qryAuxiliar.Fields[2].DisplayLabel := 'Cadastro';
  DM.qryAuxiliar.Fields[3].DisplayLabel := 'Solicitante';
  DM.qryAuxiliar.Fields[3].DisplayWidth := 22;
  DBGrid.Columns[4].Title.Alignment  := taCenter;
  DM.qryAuxiliar.Fields[4].Alignment    := taCenter;
  DM.qryAuxiliar.Fields[4].DisplayLabel := 'Cód. Equip.';
  DM.qryAuxiliar.Fields[4].DisplayWidth := 10;
  DM.qryAuxiliar.Fields[5].DisplayLabel := 'Equipamento';
  DBGrid.Columns[5].Title.Font.Style    := [fsBold];
  DM.qryAuxiliar.Fields[5].DisplayWidth := 38;
  DM.qryAuxiliar.Fields[7].DisplayLabel := 'Situação';
  DBGrid.Columns[7].Title.Alignment  := taCenter;
  DM.qryAuxiliar.Fields[7].Alignment    := taCenter;
  DM.qryAuxiliar.Fields[7].DisplayWidth := 14;
  DM.qryAuxiliar.Fields[6].Visible := False;

  DM.FParamAuxiliar[2] := '';
end;

procedure TFrmTelaCadSolicitacaoTrabCons.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'SITUACAO') then
  begin
    DBGrid.Canvas.Font.Style := [fsBold];
    DBGrid.Canvas.Font.Size := 10;
    DBGrid.Canvas.Font.Name := 'Calibri';
    if DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'SOLICITADA' then
    begin
      DBGrid.Canvas.Brush.Color := clWhite;
      DBGrid.Canvas.Font.Color:= clBlack;
    end;
    if DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA' then
    begin
       DBGrid.Canvas.Brush.Color := clGray;
       DBGrid.Canvas.Font.Color:= clBlack;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CADASTRADA') then
    begin
      DBGrid.Canvas.Brush.Color := clYellow;
      DBGrid.Canvas.Font.Color := clRed
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DETALHADA')then
    begin
      DBGrid.Canvas.Brush.Color := clYellow; DBGrid.Canvas.Font.Color := clGreen;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PROGRAMADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlue; DBGrid.Canvas.Font.Color := clWhite;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REPROGRAMADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlue; DBGrid.Canvas.Font.Color := clYellow;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'DESPROGRAMADA')then
    begin
      DBGrid.Canvas.Brush.Color := clYellow; DBGrid.Canvas.Font.Color := clBlue;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'REALIZADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlack; DBGrid.Canvas.Font.Color := clYellow;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'EXECUCAO')then
    begin
      DBGrid.Canvas.Brush.Color := clInfoBk; DBGrid.Canvas.Font.Color := clGreen;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'LIBERADA')then
    begin
      DBGrid.Canvas.Brush.Color := clGreen; DBGrid.Canvas.Font.Color := clWhite;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'FECHADA')then
    begin
      DBGrid.Canvas.Brush.Color := clGray; DBGrid.Canvas.Font.Color := clBlack;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'PARALISADA')then
    begin
      DBGrid.Canvas.Brush.Color := clRed; DBGrid.Canvas.Font.Color  := clYellow;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'CANCELADA')then
    begin
      DBGrid.Canvas.Brush.Color := clBlack; DBGrid.Canvas.Font.Color  := $00FF8000;
    end;
    if (DBGrid.DataSource.DataSet.FieldByName('SITUACAO').AsString = 'VENCIDA')then
    begin
      DBGrid.Canvas.Brush.Color := clRed; DBGrid.Canvas.Font.Color := clWhite;
    end;
  end;

  DBGrid.Canvas.FillRect(Rect);
  DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

unit UnTelaCadCalendarioOSServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB;

type
  TFrmTelaCadCalendarioOSServicos = class(TFrmTelaPaiOkCancel)
    GBProgramadas: TGroupBox;
    GrdOrdemServicoProgMObra: TDBGrid;
    GrdOrdemServicoExecucao: TDBGrid;
    GBExecução: TGroupBox;
    GrdOrdemServicoProgramadas: TDBGrid;
    GrdOrdemServicoExecMObra: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure GrdOrdemServicoProgramadasKeyPress(Sender: TObject; var Key: Char);
    procedure GrdOrdemServicoProgMObraKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadCalendarioOSServicos: TFrmTelaCadCalendarioOSServicos;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadCalendarioOSServicos.GrdOrdemServicoProgMObraKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
//if (Key = #13) and ((GrdOrdemServicoProgMObra.SelectedIndex = 3) or (GrdOrdemServicoProgMObra.SelectedIndex = 4)) then
//  begin
//    DM.FTabela_auxiliar  := 300;
//    DM.FNomeConsulta     := 'Funcionários';
//    if GrdOrdemServicoProgMObra.SelectedIndex = 0 then
//      DM.FParamAuxiliar[1] := 'MATRICULA';
//    if GrdOrdemServicoProgMObra.SelectedIndex = 1 then
//      DM.FParamAuxiliar[1] := 'NOME';
//    if DM.ConsultarCombo <> EmptyStr then
//      begin
//        if DM.FCodCombo <> '' then
//          begin
//            GrdOrdemServicoProgMObra.DataSource.DataSet.Filter := '';
//            GrdOrdemServicoProgMObra.DataSource.DataSet.Filter := 'MATRICULA = ' + QuotedStr(DM.FCodCombo);
//            GrdOrdemServicoProgMObra.DataSource.DataSet.Filtered := True;
//          end
//        else
//          begin
//            GrdOrdemServicoProgMObra.DataSource.DataSet.Filter := '';
//            GrdOrdemServicoProgMObra.DataSource.DataSet.Filtered := False;
//          end
//      end
//    else
//      begin
//        GrdOrdemServicoProgMObra.DataSource.DataSet.Filter := '';
//        GrdOrdemServicoProgMObra.DataSource.DataSet.Filtered := False;
//      end
//  end;
end;

procedure TFrmTelaCadCalendarioOSServicos.GrdOrdemServicoProgramadasKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
if (Key = #13) and (GrdOrdemServicoProgramadas.SelectedIndex = 0) then
  begin
    LCampo :=DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
        if GrdOrdemServicoProgramadas.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
          Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
      end;
  end;

if (Key = #13) and (GrdOrdemServicoProgramadas.SelectedIndex = 1) then
  begin
    LCampo :=DM.CampoInputBox('SPMP3', 'Informe a descrição da ordem de serviço:');
    if LCampo <> EmptyStr then
      begin
        if GrdOrdemServicoProgramadas.DataSource.DataSet.Filter = '' then
          GrdOrdemServicoProgramadas.DataSource.DataSet.Filter := 'DESCRICAO LIKE ' + QuotedStr('%' + LCampo + '%')
        else
          begin
            GrdOrdemServicoProgramadas.DataSource.DataSet.Filter := GrdOrdemServicoProgramadas.DataSource.DataSet.Filter + ' AND DESCRICAO LIKE ' + QuotedStr('%' + LCampo + '%');
          end;
        GrdOrdemServicoProgramadas.DataSource.DataSet.Filtered := True;
      end;
  end;

//if (Key = #13) and (GrdOrdemServicoProgramadas.SelectedIndex = 2) then
//  begin
//    LEquipamento := EmptyStr;
//    DM.FTabela_auxiliar := 250;
//    DM.FParamAuxiliar[1] := 'DESCRICAO';
//    Try
//      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
//      FrmTelaAuxiliar.ShowModal;
//    Finally
//      DM.FParamAuxiliar[0] := DM.FCodCombo;
//      LEquipamento            := DM.FValorCombo;
//      FreeAndNil(FrmTelaAuxiliar);
//      ConfigurarFiltros;
//    End;
//  end;
end;

procedure TFrmTelaCadCalendarioOSServicos.FormCreate(Sender: TObject);
begin
  inherited;
  //GBGrids.Caption := 'Serviços da data: '+FormatDateTime('dd/mm/yyyy', StrToDateTime(LData1));
  DM.qryCalendarioOSProgramadasMObra.Open;
  DM.qryCalendarioOSExecucaoMObra.Open;
end;

end.

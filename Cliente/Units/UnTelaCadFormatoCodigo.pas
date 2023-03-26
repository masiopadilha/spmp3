unit UnTelaCadFormatoCodigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadFormatoCodigo = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtUsuario: TDBEdit;
    Label1: TLabel;
    EdtEmpresa: TDBEdit;
    Label3: TLabel;
    EdtCentroCusto: TDBEdit;
    Label4: TLabel;
    EdtClasse: TDBEdit;
    Label5: TLabel;
    EdtFamiliaEquip: TDBEdit;
    Label6: TLabel;
    EdtFamiliaPecas: TDBEdit;
    Label7: TLabel;
    EdtFamiliaRec: TDBEdit;
    Label8: TLabel;
    EdtCausaFalha: TDBEdit;
    Label9: TLabel;
    EdtTipoManutencao: TDBEdit;
    Label10: TLabel;
    EdtMotivoParada: TDBEdit;
    Label11: TLabel;
    EdtTipoProgramacao: TDBEdit;
    Label12: TLabel;
    EdtCargo: TDBEdit;
    Label13: TLabel;
    EdtOficina: TDBEdit;
    Label35: TLabel;
    EdtAlmoxarifado: TDBEdit;
    Label15: TLabel;
    EdtArea: TDBEdit;
    Label16: TLabel;
    EdtFeriado: TDBEdit;
    Label17: TLabel;
    EdtCalendarioMObra: TDBEdit;
    Label18: TLabel;
    EdtCalendarioEquip: TDBEdit;
    Label19: TLabel;
    EdtFornecedor: TDBEdit;
    Label20: TLabel;
    EdtFabricante: TDBEdit;
    Label21: TLabel;
    EdtEquipamento: TDBEdit;
    Label22: TLabel;
    EdtManutFamEquip: TDBEdit;
    Label23: TLabel;
    EdtLubrificFamEquip: TDBEdit;
    Label24: TLabel;
    EdtManutProgEquip: TDBEdit;
    Label14: TLabel;
    EdtLubrificProgEquip: TDBEdit;
    Label25: TLabel;
    EdtArquivoTec: TDBEdit;
    Label26: TLabel;
    EdtPlanoTrabalho: TDBEdit;
    Label27: TLabel;
    EdtPecaReposicao: TDBEdit;
    Label28: TLabel;
    EdtRecurso: TDBEdit;
    Label29: TLabel;
    EdtKitPeca: TDBEdit;
    Label30: TLabel;
    EdtKitRecurso: TDBEdit;
    Label31: TLabel;
    EdtPontoInspecao: TDBEdit;
    Label32: TLabel;
    EdtFamiliaPneu: TDBEdit;
    Label33: TLabel;
    EdtContPneu: TDBEdit;
    Label36: TLabel;
    EdtLubrificante: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFormatoCodigo: TFrmTelaCadFormatoCodigo;
  StrLFormatoCodigo : TStringList;
implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadFormatoCodigo.BtnCancelarClick(Sender: TObject);
begin
  inherited;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadFormatoCodigo.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 0;
  inherited;
end;

procedure TFrmTelaCadFormatoCodigo.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
PControle.SetFocus;
DM.FDataSetParam.Edit;
DM.FDataSetParam.Post;
DM.FDataSetParam.Edit;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadFormatoCodigo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
end;

procedure TFrmTelaCadFormatoCodigo.FormCreate(Sender: TObject);
begin
DM.FDataSetParam := DM.qryFormatoCodigo;
DM.FDataSetParam.Open;
if DM.FDataSetParam.IsEmpty = True then DM.FDataSetParam.Append
else DM.FDataSetParam.Edit;
DM.FTela := 'CADFORMATOCODIGO';
  inherited;
DM.qryTotalTabelas.Close;
DM.qryTotalTabelas.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
DM.qryTotalTabelas.Params.ParamByName('codigo').AsString := DM.FCodGrupo;
DM.qryTotalTabelas.Open;

if DM.qryTotalTabelasTOTAL1.AsInteger > 0  then EdtUsuario.Enabled := False;
if DM.qryTotalTabelasTOTAL2.AsInteger > 0  then EdtEmpresa.Enabled := False;
if DM.qryTotalTabelasTOTAL3.AsInteger > 0  then EdtAlmoxarifado.Enabled := False;
if DM.qryTotalTabelasTOTAL4.AsInteger > 0  then EdtArea.Enabled := False;
if DM.qryTotalTabelasTOTAL5.AsInteger > 0  then EdtArquivoTec.Enabled := False;
if DM.qryTotalTabelasTOTAL6.AsInteger > 0  then EdtCalendarioEquip.Enabled := False;
if DM.qryTotalTabelasTOTAL7.AsInteger > 0  then EdtCalendarioMObra.Enabled := False;
if DM.qryTotalTabelasTOTAL8.AsInteger > 0  then EdtCargo.Enabled := False;
if DM.qryTotalTabelasTOTAL9.AsInteger > 0  then EdtCausaFalha.Enabled := False;
if DM.qryTotalTabelasTOTAL10.AsInteger > 0 then EdtCentroCusto.Enabled := False;
if DM.qryTotalTabelasTOTAL11.AsInteger > 0 then EdtClasse.Enabled := False;
if DM.qryTotalTabelasTOTAL12.AsInteger > 0 then EdtContPneu.Enabled := False;
if DM.qryTotalTabelasTOTAL13.AsInteger > 0 then EdtEquipamento.Enabled := False;
if DM.qryTotalTabelasTOTAL14.AsInteger > 0 then EdtFamiliaEquip.Enabled := False;
if DM.qryTotalTabelasTOTAL15.AsInteger > 0 then EdtFamiliaPecas.Enabled := False;
if DM.qryTotalTabelasTOTAL16.AsInteger > 0 then EdtFamiliaPneu.Enabled := False;
if DM.qryTotalTabelasTOTAL17.AsInteger > 0 then EdtFamiliaRec.Enabled := False;
if DM.qryTotalTabelasTOTAL18.AsInteger > 0 then EdtFabricante.Enabled := False;
if DM.qryTotalTabelasTOTAL19.AsInteger > 0 then EdtFornecedor.Enabled := False;
if DM.qryTotalTabelasTOTAL20.AsInteger > 0 then EdtFeriado.Enabled := False;
if DM.qryTotalTabelasTOTAL21.AsInteger > 0 then EdtKitPeca.Enabled := False;
if DM.qryTotalTabelasTOTAL22.AsInteger > 0 then EdtKitRecurso.Enabled := False;
if DM.qryTotalTabelasTOTAL23.AsInteger > 0 then EdtLubrificFamEquip.Enabled := False;
if DM.qryTotalTabelasTOTAL24.AsInteger > 0 then EdtLubrificProgEquip.Enabled := False;
if DM.qryTotalTabelasTOTAL25.AsInteger > 0 then EdtManutFamEquip.Enabled := False;
if DM.qryTotalTabelasTOTAL26.AsInteger > 0 then EdtManutProgEquip.Enabled := False;
if DM.qryTotalTabelasTOTAL27.AsInteger > 0 then EdtMotivoParada.Enabled := False;
if DM.qryTotalTabelasTOTAL28.AsInteger > 0 then EdtOficina.Enabled := False;
if DM.qryTotalTabelasTOTAL29.AsInteger > 0 then EdtPecaReposicao.Enabled := False;
if DM.qryTotalTabelasTOTAL30.AsInteger > 0 then EdtPlanoTrabalho.Enabled := False;
if DM.qryTotalTabelasTOTAL31.AsInteger > 0 then EdtPontoInspecao.Enabled := False;
if DM.qryTotalTabelasTOTAL32.AsInteger > 0 then EdtRecurso.Enabled := False;
if DM.qryTotalTabelasTOTAL33.AsInteger > 0 then EdtTipoManutencao.Enabled := False;
if DM.qryTotalTabelasTOTAL34.AsInteger > 0 then EdtPecaReposicao.Enabled := False;
if DM.qryTotalTabelasTOTAL35.AsInteger > 0 then EdtTipoProgramacao.Enabled := False;
if DM.qryTotalTabelasTOTAL36.AsInteger > 0 then EdtLubrificante.Enabled := False;

DM.qryTotalTabelas.Close;
BtnSalvar.Enabled := True;
BtnCancelar.Enabled := True;
end;

end.

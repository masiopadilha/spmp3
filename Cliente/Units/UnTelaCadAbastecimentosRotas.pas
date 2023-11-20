unit UnTelaCadAbastecimentosRotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param,
  Vcl.Buttons;

type
  TFrmTelaCadAbastecimentosRotas = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtDescricao: TDBEdit;
    Label4: TLabel;
    EdtPercentual: TDBEdit;
    Label5: TLabel;
    EdtDistancia: TDBEdit;
    Label6: TLabel;
    Label1: TLabel;
    CBTipo: TDBComboBox;
    MObservacoes: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadAbastecimentosRotas: TFrmTelaCadAbastecimentosRotas;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadAbastecimentosRotas.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 79;
  inherited;
end;

procedure TFrmTelaCadAbastecimentosRotas.BtnNovoClick(Sender: TObject);
begin
//if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryAbastecimentosRotas.Close;
DM.qryAbastecimentosRotas.Open();
DM.qryAbastecimentosRotas.Append();

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;

//DM.qryAbastecimentosRotasCODIGO.AsInteger := DM.qryAbastecimentosRotas.RecordCount + 1;
DM.qryAbastecimentosRotasCODEMPRESA.AsString := DM.FCodEmpresa;

EdtDescricao.SetFocus;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadAbastecimentosRotas.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
//if DM.qryAbastecimentosRotasCODIGO.AsString = EmptyStr then
  //begin
    //DM.qryAbastecimentosRotasCODIGO.AsInteger := DM.SMWebClient.GerarSequencia('CONTROLECOMBUSTROTA_S');
  //end;
if DM.qryAbastecimentosRotasDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryAbastecimentosRotasTIPO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O TIPO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryAbastecimentosRotasPORCENTAGEM.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O PERCENTUAL DO REGISTRO!';
    CBTipo.SetFocus;
    Exit;
  end;
if DM.qryAbastecimentosRotasDISTANCIA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DISTÂNCIA DO REGISTRO!';
    EdtDistancia.SetFocus;
    Exit;
  end;

if DM.qryAbastecimentosRotas.IsEmpty = True then Exit;

DM.qryAbastecimentosRotas.Post;
DM.qryAbastecimentosRotas.Edit;

DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';

DM.qryAbastecimentosRotas.Params[0].AsString  := DM.FCodEmpresa;
DM.qryAbastecimentosRotas.Params[1].AsInteger := DM.qryAbastecimentosRotasCODIGO.AsInteger;

DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadAbastecimentosRotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryAbastecimentosRotas.Close;
end;

procedure TFrmTelaCadAbastecimentosRotas.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryAbastecimentosRotas;
DM.FDataSourceParam := DM.dsAbastecimentosRotas;
DM.FTela := 'CADCONTROLEPNEUS';
end;

end.

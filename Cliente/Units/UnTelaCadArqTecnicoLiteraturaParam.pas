unit UnTelaCadArqTecnicoLiteraturaParam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns;

type
  TFrmTelaCadArqTecnicoLiteraturaParam = class(TFrmTelaPaiParametros)
    Label4: TLabel;
    EdtDescricao: TDBEdit;
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
  FrmTelaCadArqTecnicoLiteraturaParam: TFrmTelaCadArqTecnicoLiteraturaParam;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadArqTecnicoLiteraturaParam.BtnConsultarClick(
  Sender: TObject);
begin
DM.FTabela_auxiliar := 70;
  inherited;
end;

procedure TFrmTelaCadArqTecnicoLiteraturaParam.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryArquivoTecnicoParamCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryArquivoTecnicoParamTIPO.AsString            := DM.FParamAuxiliar[1];
DM.qryArquivoTecnicoParamDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryArquivoTecnicoParamDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryArquivoTecnicoParamCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryArquivoTecnicoParamCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtDescricao.SetFocus;
end;

procedure TFrmTelaCadArqTecnicoLiteraturaParam.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryArquivoTecnicoParamDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

  inherited;
end;

procedure TFrmTelaCadArqTecnicoLiteraturaParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryArquivoTecnicoParam.Close;
end;

procedure TFrmTelaCadArqTecnicoLiteraturaParam.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryArquivoTecnicoParam;
DM.FDataSourceParam := DM.dsArquivoTecnicoParam;
DM.FTela := 'CADARQUIVOTECNICO';
end;

end.

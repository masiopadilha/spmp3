unit UnTelaCadCentroCusto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Datasnap.DBClient, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadCentroCusto = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnCentroCustoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadCentroCusto: TFrmTelaCadCentroCusto;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM, UnTelaCadFuncionarios;

procedure TFrmTelaCadCentroCusto.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadCentroCusto.BtnCentroCustoClick(Sender: TObject);
begin
  inherited;
//if DM.qryCentroCusto.Active = False then Exit;
//if DM.qryCentroCusto.IsEmpty = True then Exit;
//if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
//  begin
//    DM.FTabela_auxiliar := 300;
//    DM.FNomeConsulta := 'Funcionários';
//    DM.qryOrdemServico.Edit;
//    DM.FParamAuxiliar[1] := 'NOME';
//    DM.FParamAuxiliar[5] := '';
//    if DM.ConsultarCombo <> EmptyStr then
//    begin
////      if DM.FParamAuxiliar[5] <> '' then
//      begin
//        DM.qryCentroCustoRESPONSAVEL.AsString   := DM.FCodCombo;
//        DM.qryCentroCustoNOMERESPONSAVEL.AsString := DM.FValorCombo;
////      end else
////      begin
////        Application.MessageBox('O responsável não é usuario do sistema, não será possível aprovar a ordem de serviço!', 'SPMP3', MB_OK);
//      end;
//    end;
//  end
//else
//  begin
//    Try
//      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
//      begin
//        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
//        Exit;
//      end;
//      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
//      FrmTelaCadFuncionarios.ShowModal;
//    Finally
//      FreeAndNil(FrmTelaCadFuncionarios);
//    End;
//  end;
//DM.FDataSetParam    := DM.qryCentroCusto;
//DM.FDataSourceParam := DM.dsCentroCusto;
//DM.FTela := 'CADCENTROCUSTO';
//DM.FTabela_auxiliar := 4;
end;

procedure TFrmTelaCadCentroCusto.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 4;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBCentroCusto;
end;

procedure TFrmTelaCadCentroCusto.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryCentroCustoATIVO.AsString           := 'S';
DM.qryCentroCustoVISIVEL.AsString         := 'S';

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadCentroCusto.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryCentroCustoCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
    EdtCodigo.SetFocus;
    Exit;
  end;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryCentroCustoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
  inherited;

EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadCentroCusto.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryCentroCusto.Close;
end;

procedure TFrmTelaCadCentroCusto.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryCentroCusto;
DM.FDataSourceParam := DM.dsCentroCusto;
DM.FTela := 'CADCENTROCUSTO';
DM.FTabela_auxiliar := 4;
end;

end.

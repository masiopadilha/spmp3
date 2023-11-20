unit UnTelaCadPneusChassiPneusConsertos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls, System.DateUtils, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadPneusChassiPneusConsertos = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    Label3: TLabel;
    EdtID: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtCusto: TDBEdit;
    Label7: TLabel;
    EdtServico: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    EdtFornecedor: TDBEdit;
    BtnFornecedor: TButton;
    CBAcao: TDBComboBox;
    EdtEnvio: TJvDBDateEdit;
    EdtEntrega: TJvDBDateEdit;
    Label10: TLabel;
    MObservacoes: TDBMemo;
    BtnPneu: TButton;
    LblRodagem: TDBText;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPneuClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFornecedorClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassiPneusConsertos: TFrmTelaCadPneusChassiPneusConsertos;

implementation

{$R *.dfm}

uses UnTelaCadFornecedores, UnTelaCadPneus, UnDmRelatorios, UnDM;

procedure TFrmTelaCadPneusChassiPneusConsertos.BtnConsultarClick(
  Sender: TObject);
begin
DM.FTabela_auxiliar := 92;
  inherited;

end;

procedure TFrmTelaCadPneusChassiPneusConsertos.BtnFornecedorClick(
  Sender: TObject);
begin
  inherited;
if DM.qryPneusChassiPneusConsertos.Active = False then Exit;
if DM.qryPneusChassiPneusConsertos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    if DM.qryPneusChassiPneusConsertos.Active = False then Exit;
    if DM.qryPneusChassiPneusConsertos.IsEmpty = True then Exit;
    DM.FTabela_auxiliar := 210;
    DM.FNomeConsulta := 'Fornecedores';
    DM.qryPneusChassiPneusConsertos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPneusChassiPneusConsertosCODFORNECEDOR.AsString := DM.FCodCombo;
        DM.qryPneusChassiPneusConsertosFORNECEDOR.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFORNECEDORES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryFornecedoresCODIGO, DM.qryFormatoCodigoFORNECEDOR, FrmTelaCadFornecedores) = False then exit;
      Application.CreateForm(TFrmTelaCadFornecedores, FrmTelaCadFornecedores);
      FrmTelaCadFornecedores.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFornecedores);
      DM.FDataSetParam    := DM.qryPneusChassiPneusConsertos;
      DM.FDataSourceParam := DM.dsPneusChassiPneusConsertos;
    End;
  end;
DM.FDataSetParam    := DM.qryPneusChassiPneusConsertos;
DM.FDataSourceParam := DM.dsPneusChassiPneusConsertos;
DM.FTela            := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 92;
end;

procedure TFrmTelaCadPneusChassiPneusConsertos.BtnImprimirClick(
  Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBPneusChassiPneusConsertos;
end;

procedure TFrmTelaCadPneusChassiPneusConsertos.BtnNovoClick(Sender: TObject);
begin
  inherited;
DM.qryPneusChassiPneusConsertosCODEMPRESA.AsString := DM.FCodEmpresa;
DM.qryPneusChassiPneusConsertosACAO.AsString       := 'Conserto';
DM.qryPneusChassiPneusConsertosCUSTO.AsFloat       := 0;
EdtID.SetFocus;
end;

procedure TFrmTelaCadPneusChassiPneusConsertos.BtnPneuClick(Sender: TObject);
begin
  inherited;
if DM.qryPneusChassiPneusConsertos.Active = False then Exit;
if DM.qryPneusChassiPneusConsertos.IsEmpty = True then Exit;
if DM.qryPneusChassiPneusConsertos.Active = False then Exit;
if DM.qryPneusChassiPneusConsertos.IsEmpty = True then Exit;
DM.FTabela_auxiliar := 93;
DM.FNomeConsulta := 'ID';
DM.qryPneusChassiPneusConsertos.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryPneusChassiPneusConsertosID.AsString      := DM.FCodCombo;
    DM.qryPneusChassiPneusConsertosRODAGEM.AsString := DM.FParamAuxiliar[2];
    DM.qryPneusChassiPneusConsertosCODPNEU.AsString := DM.FParamAuxiliar[3];
  end;
DM.FDataSetParam    := DM.qryPneusChassiPneusConsertos;
DM.FDataSourceParam := DM.dsPneusChassiPneusConsertos;
DM.FTela            := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 92;
end;

procedure TFrmTelaCadPneusChassiPneusConsertos.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if DM.qryPneusChassiPneusConsertosID.AsInteger = 0 then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O ID DO PNEU!';
    EdtID.SetFocus;
    Exit;
  end;
if DM.qryPneusChassiPneusConsertosCUSTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CUSTO!';
    EdtCusto.SetFocus;
    Exit;
  end;
if DM.qryPneusChassiPneusConsertosCODFORNECEDOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O FORNECEDOR!';
    EdtFornecedor.SetFocus;
    Exit;
  end;
if DM.qryPneusChassiPneusConsertosSERVICO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O SERVIÇO!';
    EdtServico.SetFocus;
    Exit;
  end;
if DM.qryPneusChassiPneusConsertosENVIO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DATA DE ENVIO!';
    EdtEnvio.SetFocus;
    Exit;
  end;
if DM.qryPneusChassiPneusConsertosENTREGA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DATA DE ENTREGA!';
    EdtEntrega.SetFocus;
    Exit;
  end;

if DM.qryPneusChassiPneusConsertosACAO.AsString <> 'Descarte' then
  begin
    if DateOf(DM.qryPneusChassiPneusConsertosENTREGA.AsDateTime) <= DateOf(DM.FDataHoraServidor) then
      begin
        if DM.qryPneusChassiPneus.Locate('ID', DM.qryPneusChassiPneusConsertosID.AsInteger, []) = True then
          begin
            DM.qryPneusChassiPneus.Edit;
            DM.qryPneusChassiPneusSTATUS.AsString := 'USADO';
            DM.qryPneusChassiPneus.Post;
          end;
      end;
  end
else
  begin
    DM.qryPneusChassiPneus.Edit;
    DM.qryPneusChassiPneusSTATUS.AsString  := 'EXCLUIDO';
    DM.qryPneusChassiPneus.ApplyUpdates(0);

    DM.qryPneusChassiPneusHist.Append;
    DM.qryPneusChassiPneusHistID.AsInteger      := DM.qryPneusChassiPosicoesID.AsInteger;
    DM.qryPneusChassiPneusHistPOSICAO.AsString  := DM.qryPneusChassiPosicoesPOSICAO.AsString;
    DM.qryPneusChassiPneusHistCODPNEU.AsString  := DM.qryPneusChassiPosicoesCODPNEU.AsString;
    DM.qryPneusChassiPneusHistDATA.AsString     := DM.qryPneusChassiPosicoesINSTALADO.AsString;
    DM.qryPneusChassiPneusHistCONTADOR.AsString := DM.qryPneusChassiCONTADOR.AsString;
    DM.qryPneusChassiPneusHistRODAGEM.AsString  := DM.qryPneusChassiPneusRODADOS.AsString;
    DM.qryPneusChassiPneusHistMOTIVO.AsString   := 'Descartado';
    DM.qryPneusChassiPneusHistOPERACAO.AsString := 'EXCLUIDO';
    DM.qryPneusChassiPneusHist.POst;
  end;

if DM.qryPneusChassiPneusConsertosCODIGO.AsInteger <= 0 then
  begin
    if DM.qryPneusChassiPneusConsertosACAO.AsString <> 'Descarte' then
      begin
        DM.qryPneus.Close;
        DM.qryPneus.Params[0].AsString := DM.qryPneusChassiPneusConsertosCODPNEU.AsString;
        DM.qryPneus.Params[1].AsString := DM.FCodEmpresa;
        DM.qryPneus.Open;
        DM.qryPneus.Edit;
        DM.qryPneusQUANTIDADE.AsInteger := DM.qryPneusQUANTIDADE.AsInteger + 1;
        DM.qryPneus.Post;
        DM.qryPneus.Close;
      end;

    if DM.qryPneusChassiPneus.Locate('ID', DM.qryPneusChassiPneusConsertosID.AsInteger, []) = True then
      begin
        DM.qryPneusChassiPneus.Edit;
        DM.qryPneusChassiPneusCUSTO.AsFloat := DM.qryPneusChassiPneusCUSTO.AsFloat + DM.qryPneusChassiPneusConsertosCUSTO.AsFloat;
        DM.qryPneusChassiPneus.Post;
      end;
  end;

  inherited;
DM.qryPneusChassiPneusConsertos.Params[0].AsInteger := DM.qryPneusChassiPneusConsertosCODIGO.AsInteger;
DM.qryPneusChassiPneusConsertos.Params[1].AsString  := DM.FCodEmpresa;


if DM.qryPneusChassiPneus.Locate('ID', DM.qryPneusChassiPneusConsertosID.AsInteger, []) = True then
  begin
    DM.qryPneusChassiPneus.Edit;
    DM.qryPneusChassiPneusCODPNEU.AsString := DM.qryPneusChassiPneusConsertosCODPNEU.AsString;
    DM.qryPneusChassiPneus.Post;
  end;

EdtID.ReadOnly := True;
end;

procedure TFrmTelaCadPneusChassiPneusConsertos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryPneusChassiPneusConsertos.Close;
DM.qryPneusChassiPneus.Close;
end;

procedure TFrmTelaCadPneusChassiPneusConsertos.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryPneusChassiPneusConsertos;
DM.FDataSourceParam := DM.dsPneusChassiPneusConsertos;
DM.FTela := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 92;

DM.qryPneusChassiPneus.Close;
DM.qryPneusChassiPneus.Params[0].AsString := DM.FCodEmpresa;
DM.qryPneusChassiPneus.Open;
end;

end.

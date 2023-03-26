unit UnTelaCadControleMultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, JvMaskEdit,
  JvDBControls, JvExMask, JvToolEdit, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadControleMultas = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    Label5: TLabel;
    EdtCodMotorista: TDBEdit;
    EdtDescMatricula: TDBEdit;
    BtnMotorista: TButton;
    Label18: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    Label6: TLabel;
    Label11: TLabel;
    EdtData: TJvDBDateEdit;
    Label7: TLabel;
    Label12: TLabel;
    EdtHorario: TJvDBMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    EdtVencimento: TJvDBDateEdit;
    Label10: TLabel;
    Label13: TLabel;
    EdtNotificacao: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    EdtLocal: TDBEdit;
    Label16: TLabel;
    Label22: TLabel;
    EdtPagamento: TJvDBDateEdit;
    Label17: TLabel;
    EdtMotivo: TDBEdit;
    Label19: TLabel;
    ChbResponsavel: TDBCheckBox;
    Label20: TLabel;
    EdtValor: TDBEdit;
    Label21: TLabel;
    Label23: TLabel;
    MOficial: TDBMemo;
    Label30: TLabel;
    Label24: TLabel;
    MMotorista: TDBMemo;
    GrdHistorico: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnEquipamentoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnMotoristaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadControleMultas: TFrmTelaCadControleMultas;

implementation

{$R *.dfm}

uses UnCMWeb, UnTelaCadEquipamentos, UnTelaCadFuncionarios;

procedure TFrmTelaCadControleMultas.BtnConsultarClick(Sender: TObject);
begin
CMWeb.FTabela_auxiliar := 91;
  inherited;
end;

procedure TFrmTelaCadControleMultas.BtnEquipamentoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
if CMWeb.CDCadControleMultas.Active = False then Exit;
if CMWeb.CDCadControleMultas.IsEmpty = True then Exit;
if (Shift = [ssleft]) then
  begin
    CMWeb.FTabela_auxiliar := 250;
    CMWeb.FNomeConsulta := 'Equipamentos';
    CMWeb.CDCadControleMultas.Edit;
    if CMWeb.ConsultarCombo <> EmptyStr then
      begin
        CMWeb.CDCadControleMultasCODEQUIPAMENTO.AsString := CMWeb.FCodCombo;
        CMWeb.CDCadControleMultasEQUIPAMENTO.AsString    := CMWeb.FValorCombo;
      end;
  end
else
if (Shift = [ssCtrl, ssleft]) then
  begin
    Try
      if (CMWeb.CDUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(CMWeb.FNomeUsuario) <> 'sam_spmp') then Exit;
      if CMWeb.AplicarMascara(CMWeb.CDCadEquipamentoCODIGO, CMWeb.CDCadFormatoCodigoEQUIPAMENTOS, FrmTelaCadEquipamentos) = False then exit;
      Application.CreateForm(TFrmTelaCadEquipamentos, FrmTelaCadEquipamentos);
      FrmTelaCadEquipamentos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadEquipamentos);
    End;
  end;
CMWeb.FDataSetParam    := CMWeb.CDCadControleMultas;
CMWeb.FDataSourceParam := CMWeb.DSCadControleMultas;
CMWeb.FTela            := 'CADCONTROLEPNEUS';
CMWeb.FTabela_auxiliar := 45;
end;

procedure TFrmTelaCadControleMultas.BtnMotoristaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
if CMWeb.CDCadControleMultas.Active = False then Exit;
if CMWeb.CDCadControleMultas.IsEmpty = True then Exit;
if (Shift = [ssleft]) then
  begin
    CMWeb.FTabela_auxiliar := 300;
    CMWeb.FNomeConsulta := 'Funcionários';
    CMWeb.CDCadControleMultas.Edit;
    CMWeb.FParamAuxiliar[1] := 'NOME';
    if CMWeb.ConsultarCombo <> EmptyStr then
      begin
        CMWeb.CDCadControleMultasMATRICULA.AsString := CMWeb.FCodCombo;
        CMWeb.CDCadControleMultasFUNCIONARIO.AsString    := CMWeb.FValorCombo;
      end;
  end
else
if (Shift = [ssCtrl, ssleft]) then
  begin
    Try
      if (CMWeb.CDUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(CMWeb.FNomeUsuario) <> 'sam_spmp') then Exit;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
CMWeb.FDataSetParam    := CMWeb.CDCadControleMultas;
CMWeb.FDataSourceParam := CMWeb.DSCadControleMultas;
CMWeb.FTela            := 'CADCONTROLEPNEUS';
CMWeb.FTabela_auxiliar := 45;
CMWeb.FParamAuxiliar[1] := EmptyStr;
end;

procedure TFrmTelaCadControleMultas.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (CMWeb.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

CMWeb.CDCadControleMultasCODEMPRESA.AsString      := CMWeb.FCodEmpresa;
CMWeb.CDCadControleMultasDATACADASTRO.AsDateTime  := CMWeb.FDataHoraServidor;
CMWeb.CDCadControleMultasDATAULTALT.AsDateTime    := CMWeb.FDataHoraServidor;
CMWeb.CDCadControleMultasCODUSUARIOCAD.AsString   := CMWeb.FCodUsuario;
CMWeb.CDCadControleMultasCODUSUARIOALT.AsString   := CMWeb.FCodUsuario;

EdtDescEquipamento.SetFocus;
end;

procedure TFrmTelaCadControleMultas.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (CMWeb.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if CMWeb.FDataSetParam.IsEmpty = True then Exit;
if CMWeb.CDCadControleMultasCODEQUIPAMENTO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O EQUIPAMENTO!';
    EdtDescEquipamento.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasMATRICULA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O MOTORISTA!';
    EdtDescMatricula.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasLOCAL.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O LOCAL DO MULTA!';
    EdtLocal.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasMOTIVO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O MOTIVO DA MULTA!';
    EdtMotivo.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasDATANOTIFICCAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DATA DA MULTA!';
    EdtData.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasHORANOTIFICACAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A HORA DA MULTA!';
    EdtHorario.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasDATAPAGAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DATA DO PAGAMENTO DA MULTA!';
    EdtData.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasVALOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O VALOR DA MULTA!';
    EdtValor.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasDATAVENCIMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O VENCIMENTO DA MULTA!';
    EdtMotivo.SetFocus;
    Exit;
  end;
if CMWeb.CDCadControleMultasNOTIFICACAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O NOTIFICAÇÂO DA MULTA!';
    EdtNotificacao.SetFocus;
    Exit;
  end;

if CMWeb.CDCadControleMultasCODIGO.IsNull = True then
  begin
    CMWeb.CDAutoInc.Close;
    CMWeb.CDAutoInc.Params[0].AsString := 'controlemultas';
    CMWeb.CDAutoInc.Open;

    CMWeb.CDCadControleMultas.Params[0].AsString := CMWeb.CDAutoIncAUTO_INCREMENT.AsString;
    CMWeb.CDCadControleMultas.Params[1].AsString := CMWeb.FCodEmpresa;
  end;
  inherited;

if CMWeb.CDCadControleMultasHist.IsEmpty = False then
  begin
    if CMWeb.CDCadControleMultasHist.Locate('AUTOINFRACAO', CMWeb.CDCadControleMultasNOTIFICACAO.AsString, []) = False then
      begin
        CMWeb.CDAutoInc.Close;
        CMWeb.CDAutoInc.Params[0].AsString := 'controlemultashist';
        CMWeb.CDAutoInc.Open;

        CMWeb.CDCadControleMultasHist.Append;
        CMWeb.CDCadControleMultasHistCODIGO.AsInteger        := CMWeb.CDAutoIncAUTO_INCREMENT.AsInteger;
        CMWeb.CDCadControleMultasHistCODEMPRESA.AsString     := CMWeb.FCodEmpresa;
        CMWeb.CDCadControleMultasHistCODEQUIPAMENTO.AsString := CMWeb.CDCadControleMultasCODEQUIPAMENTO.AsString;
        CMWeb.CDCadControleMultasHistMATRICULA.AsString      := CMWeb.CDCadControleMultasMATRICULA.AsString;
        CMWeb.CDCadControleMultasHistAUTOINFRACAO.AsString   := CMWeb.CDCadControleMultasNOTIFICACAO.AsString;
        CMWeb.CDCadControleMultasHistDATAINFRACAO.AsString   := CMWeb.CDCadControleMultasDATANOTIFICCAO.AsString;
        CMWeb.CDCadControleMultasHistHORA.AsString           := CMWeb.CDCadControleMultasHORANOTIFICACAO.AsString;
        CMWeb.CDCadControleMultasHistLOCAL.AsString          := CMWeb.CDCadControleMultasLOCAL.AsString;
        CMWeb.CDCadControleMultasHistMOTIVO.AsString         := CMWeb.CDCadControleMultasMOTIVO.AsString;
        CMWeb.CDCadControleMultasHistDATAPAGAMENTO.AsString  := CMWeb.CDCadControleMultasDATAPAGAMENTO.AsString;
        CMWeb.CDCadControleMultasHistVALOR.AsString          := CMWeb.CDCadControleMultasVALOR.AsString;
        CMWeb.CDCadControleMultasHistEQUIPAMENTO.AsString    := CMWeb.CDCadControleMultasEQUIPAMENTO.AsString;
        CMWeb.CDCadControleMultasHistMOTORISTA.AsString      := CMWeb.CDCadControleMultasFUNCIONARIO.AsString;
        CMWeb.CDCadControleMultasHist.ApplyUpdates(0);

        CMWeb.CDAutoInc.Close;
      end;
  end
else
  begin
    CMWeb.CDAutoInc.Close;
    CMWeb.CDAutoInc.Params[0].AsString := 'controlemultashist';
    CMWeb.CDAutoInc.Open;

    CMWeb.CDCadControleMultasHist.Append;
    CMWeb.CDCadControleMultasHistCODIGO.AsInteger        := CMWeb.CDAutoIncAUTO_INCREMENT.AsInteger;
    CMWeb.CDCadControleMultasHistCODEMPRESA.AsString     := CMWeb.FCodEmpresa;
    CMWeb.CDCadControleMultasHistCODEQUIPAMENTO.AsString := CMWeb.CDCadControleMultasCODEQUIPAMENTO.AsString;
    CMWeb.CDCadControleMultasHistMATRICULA.AsString      := CMWeb.CDCadControleMultasMATRICULA.AsString;
    CMWeb.CDCadControleMultasHistAUTOINFRACAO.AsString   := CMWeb.CDCadControleMultasNOTIFICACAO.AsString;
    CMWeb.CDCadControleMultasHistDATAINFRACAO.AsString   := CMWeb.CDCadControleMultasDATANOTIFICCAO.AsString;
    CMWeb.CDCadControleMultasHistHORA.AsString           := CMWeb.CDCadControleMultasHORANOTIFICACAO.AsString;
    CMWeb.CDCadControleMultasHistLOCAL.AsString          := CMWeb.CDCadControleMultasLOCAL.AsString;
    CMWeb.CDCadControleMultasHistMOTIVO.AsString         := CMWeb.CDCadControleMultasMOTIVO.AsString;
    CMWeb.CDCadControleMultasHistDATAPAGAMENTO.AsString  := CMWeb.CDCadControleMultasDATAPAGAMENTO.AsString;
    CMWeb.CDCadControleMultasHistVALOR.AsString          := CMWeb.CDCadControleMultasVALOR.AsString;
    CMWeb.CDCadControleMultasHistEQUIPAMENTO.AsString    := CMWeb.CDCadControleMultasEQUIPAMENTO.AsString;
    CMWeb.CDCadControleMultasHistMOTORISTA.AsString      := CMWeb.CDCadControleMultasFUNCIONARIO.AsString;
    CMWeb.CDCadControleMultasHist.ApplyUpdates(0);

    CMWeb.CDAutoInc.Close;
  end;
end;

procedure TFrmTelaCadControleMultas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(CMWeb.FParamAuxiliar, SizeOf(CMWeb.FParamAuxiliar), #0);
CMWeb.CDCadControleMultas.Close;
CMWeb.CDCadControleMultasHist.Close;
end;

procedure TFrmTelaCadControleMultas.FormCreate(Sender: TObject);
begin
  inherited;
CMWeb.FDataSetParam     := CMWeb.CDCadControleMultas;
CMWeb.FDataSourceParam  := CMWeb.DSCadControleMultas;
//CMWeb.CDCadControleMultasHist.Open;
CMWeb.FTela := 'CADCONTROLEPNEUS';
CMWeb.FTabela_auxiliar := 91;
CMWeb.CDCadControleMultasHist.Open;
end;

end.

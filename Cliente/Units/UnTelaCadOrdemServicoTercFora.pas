unit UnTelaCadOrdemServicoTercFora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvDBControls, Vcl.Grids, Vcl.DBGrids, Data.DB, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadOrdemServicoTercFora = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    Label19: TLabel;
    Label5: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    Label20: TLabel;
    ChbContrato: TDBCheckBox;
    ChbPedido: TDBCheckBox;
    EdtContrato: TDBEdit;
    EdtPedido: TDBEdit;
    Label11: TLabel;
    EdtDataContratoIni: TJvDBDateEdit;
    EdtDataContratoFin: TJvDBDateEdit;
    Label6: TLabel;
    Label8: TLabel;
    GrdOI: TDBGrid;
    LblTotalOI: TDBText;
    Label7: TLabel;
    LblTotalOC: TDBText;
    Label9: TLabel;
    LblTotalOE: TDBText;
    Label10: TLabel;
    GrdAditivos: TDBGrid;
    GrdOC: TDBGrid;
    GrdOE: TDBGrid;
    MMotivo: TDBMemo;
    Label12: TLabel;
    Label13: TLabel;
    PopupMenuCons: TPopupMenu;
    Codigo1: TMenuItem;
    Descricao1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercFora: TFrmTelaCadOrdemServicoTercFora;

implementation

{$R *.dfm}

uses UnTelaCadEquipamentos, UnDmRelatorios, UnDM;

procedure TFrmTelaCadOrdemServicoTercFora.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 65;
  inherited;
if DM.qryOrdemServicoTercForaCODIGO.AsString <> EmptyStr then
  begin
    DM.qryOrdemServicoTercForaOI.Close;
    DM.qryOrdemServicoTercForaOI.Params[0].AsString := DM.qryOrdemServicoTercForaCODIGO.AsString;
    DM.qryOrdemServicoTercForaOI.Open;

    DM.qryOrdemServicoTercForaOC.Close;
    DM.qryOrdemServicoTercForaOC.Params[0].AsString := DM.qryOrdemServicoTercForaCODIGO.AsString;;
    DM.qryOrdemServicoTercForaOC.Open;

    DM.qryOrdemServicoTercForaOE.Close;
    DM.qryOrdemServicoTercForaOE.Params[0].AsString := DM.qryOrdemServicoTercForaCODIGO.AsString;;
    DM.qryOrdemServicoTercForaOE.Open;

    DM.qryOrdemServicoTercForaAditivos.Close;
    DM.qryOrdemServicoTercForaAditivos.Params[0].AsString := DM.qryOrdemServicoTercForaCODIGO.AsString;;
    DM.qryOrdemServicoTercForaAditivos.Open;
  end;
end;

procedure TFrmTelaCadOrdemServicoTercFora.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercFora.Active = False then Exit;
if DM.qryOrdemServicoTercFora.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    DM.qryOrdemServicoTercFora.Edit;
    if DM.FParamAuxiliar[1] = '' then
      begin
        PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        Exit;
      end
    else
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryOrdemServicoTercForaCODEQUIPAMENTO.AsString := DM.FCodCombo;
        DM.qryOrdemServicoTercForaEQUIPAMENTO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      if DM.AplicarMascara(DM.qryEquipamentosCODIGO, DM.qryFormatoCodigoEQUIPAMENTOS, FrmTelaCadEquipamentos) = False then exit;
      Application.CreateForm(TFrmTelaCadEquipamentos, FrmTelaCadEquipamentos);
      FrmTelaCadEquipamentos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadEquipamentos);
    End;
  end;
DM.FParamAuxiliar[1] := '';
DM.FDataSetParam    := DM.qryOrdemServicoTercFora;
DM.FDataSourceParam := DM.dsOrdemServicoTercFora;
DM.FTela            := 'CADTERCEIRIZADAS';
DM.FTabela_auxiliar := 65;
end;

procedure TFrmTelaCadOrdemServicoTercFora.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if DM.qryOrdemServicoTercFora.IsEmpty = True then
    begin
      DM.qryOrdemServicoTercForaOI.Close;
      DM.qryOrdemServicoTercForaOC.Close;
      DM.qryOrdemServicoTercForaOE.Close;
      DM.qryOrdemServicoTercForaAditivos.Close;
    end;
end;

procedure TFrmTelaCadOrdemServicoTercFora.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryOrdemServicoTercForaCONTRATO.AsString        := 'S';
DM.qryOrdemServicoTercForaPEDIDO.AsString          := 'N';
DM.qryOrdemServicoTercForaTOTALSERVINI.AsFloat     := 0;
DM.qryOrdemServicoTercForaTOTALSERVCOMP.AsFloat    := 0;
DM.qryOrdemServicoTercForaTOTALSERVTERC.AsFloat    := 0;
DM.qryOrdemServicoTercForaTOTALGERAL.AsFloat       := 0;
DM.qryOrdemServicoTercForaCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryOrdemServicoTercForaDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryOrdemServicoTercForaDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryOrdemServicoTercForaCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryOrdemServicoTercForaCODUSUARIOALT.AsString   := DM.FCodUsuario;

DM.qryOrdemServicoTercForaOI.Open;
DM.qryOrdemServicoTercForaOC.Open;
DM.qryOrdemServicoTercForaOE.Open;
DM.qryOrdemServicoTercForaAditivos.Open;

//DM.qryOrdemServicoTercForaOI.Append;
//DM.qryOrdemServicoTercForaOC.Append;
//DM.qryOrdemServicoTercForaOE.Append;
//DM.qryOrdemServicoTercForaAditivos.Append;

EdtDescricao.ReadOnly := False;
EdtDescricao.SetFocus;
end;

procedure TFrmTelaCadOrdemServicoTercFora.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if DM.FDataSetParam.IsEmpty = True then Exit;

if DM.qryOrdemServicoTercForaDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DA O.S.!'; EdtDescricao.SetFocus; Exit;
  end;
if DM.qryOrdemServicoTercForaCODEQUIPAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O EQUIPAMENTO DA O.S.!'; EdtDescEquipamento.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercForaDATACONTRATOINI.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O INÍCIO DO CONTRATO!'; EdtDataContratoIni.SetFocus; Exit;
  end;

if DM.qryOrdemServicoTercForaDATACONTRATOFIN.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O FIM DO CONTRATO!'; EdtDataContratoFin.SetFocus; Exit;
  end;

if Trim(DM.qryOrdemServicoTercForaCONTRATO.AsString) = 'S' then
  begin
    if DM.qryOrdemServicoTercForaNUMCONTRATO.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O NÚMERO DO CONTRATO!'; EdtContrato.SetFocus; Exit;
      end;
  end
else DM.qryOrdemServicoTercForaNUMCONTRATO.AsString := 'N';

if DM.qryOrdemServicoTercForaPEDIDO.AsString = 'S' then
  begin
    if DM.qryOrdemServicoTercForaNUMPEDIDO.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O NÚMERO DO PEDIDO!'; EdtPedido.SetFocus; Exit;
      end;
  end
else DM.qryOrdemServicoTercForaPEDIDO.AsString := 'N';


  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

  DM.qryOrdemServicoTercForaOI.First;
  while not DM.qryOrdemServicoTercForaOI.Eof = True do
    begin
      DM.qryOrdemServicoTercForaOI.Edit;
      DM.qryOrdemServicoTercForaOICODORDEMSERVICO.AsString  := DM.qryOrdemServicoTercForaCODIGO.AsString;
      DM.qryOrdemServicoTercForaOI.Post;

      DM.qryOrdemServicoTercForaOI.Next;
    end;

  DM.qryOrdemServicoTercForaOC.First;
  while not DM.qryOrdemServicoTercForaOC.Eof = True do
    begin
      DM.qryOrdemServicoTercForaOC.Edit;
      DM.qryOrdemServicoTercForaOCCODORDEMSERVICO.AsString  := DM.qryOrdemServicoTercForaCODIGO.AsString;
      DM.qryOrdemServicoTercForaOC.Post;

      DM.qryOrdemServicoTercForaOC.Next;
    end;

  DM.qryOrdemServicoTercForaOE.First;
  while not DM.qryOrdemServicoTercForaOE.Eof = True do
    begin
      DM.qryOrdemServicoTercForaOE.Edit;
      DM.qryOrdemServicoTercForaOECODORDEMSERVICO.AsString  := DM.qryOrdemServicoTercForaCODIGO.AsString;
      DM.qryOrdemServicoTercForaOE.Post;

      DM.qryOrdemServicoTercForaOE.Next;
    end;

  DM.qryOrdemServicoTercForaAditivos.First;
  while not DM.qryOrdemServicoTercForaAditivos.Eof = True do
    begin
      DM.qryOrdemServicoTercForaAditivos.Edit;
      DM.qryOrdemServicoTercForaAditivosCODORDEMSERVICO.AsString  := DM.qryOrdemServicoTercForaCODIGO.AsString;
      DM.qryOrdemServicoTercForaAditivos.Post;

      DM.qryOrdemServicoTercForaAditivos.Next;
    end;

DM.qryOrdemServicoTercFora.Edit;
DM.qryOrdemServicoTercForaTOTALSERVINI.AsString  := DM.qryOrdemServicoTercForaOISUM_TOTAL.AsString;
DM.qryOrdemServicoTercForaTOTALSERVCOMP.AsString := DM.qryOrdemServicoTercForaOCSUM_TOTAL.AsString;
DM.qryOrdemServicoTercForaTOTALSERVTERC.AsString := DM.qryOrdemServicoTercForaOESUM_TOTAL.AsString;
DM.qryOrdemServicoTercForaTOTALGERAL.AsFloat    := DM.qryOrdemServicoTercForaTOTALSERVINI.AsFloat + DM.qryOrdemServicoTercForaTOTALSERVCOMP.AsFloat + DM.qryOrdemServicoTercForaTOTALSERVTERC.AsFloat;
DM.qryOrdemServicoTercFora.Post;
end;

procedure TFrmTelaCadOrdemServicoTercFora.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadOrdemServicoTercFora.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBOrdemServicoTercFora;
DM.FTabela_auxiliar := 65;
  inherited;

end;

procedure TFrmTelaCadOrdemServicoTercFora.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadOrdemServicoTercFora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryOrdemServicoTercFora.Close;
DM.qryOrdemServicoTercForaOI.Close;
DM.qryOrdemServicoTercForaOC.Close;
DM.qryOrdemServicoTercForaOE.Close;
DM.qryOrdemServicoTercForaAditivos.Close;
end;

procedure TFrmTelaCadOrdemServicoTercFora.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryOrdemServicoTercFora;
DM.FDataSourceParam := DM.dsOrdemServicoTercFora;
DM.FTela := 'CADTERCEIRIZADAS';
end;

procedure TFrmTelaCadOrdemServicoTercFora.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBOrdemServicoTercFora;
DM.FTabela_auxiliar := 651;
  inherited;

end;

end.

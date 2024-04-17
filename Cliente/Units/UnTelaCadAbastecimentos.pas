unit UnTelaCadAbastecimentos;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, System.DateUtils, System.Actions, Vcl.ActnList,
  Vcl.ExtActns, JvExMask, JvToolEdit, FireDAC.Stan.Param, Vcl.Buttons;
type
  TFrmTelaCadAbastecimentos = class(TFrmTelaPaiCadastros)
    Label5: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    Label20: TLabel;
    Label4: TLabel;
    CBTipo: TDBComboBox;
    Label19: TLabel;
    Label8: TLabel;
    EdtMedidor: TDBEdit;
    BtnContador: TButton;
    Label21: TLabel;
    Label11: TLabel;
    EdtValor: TDBEdit;
    OpenDialog1: TOpenDialog;
    GrdAbastCombust: TDBGrid;
    GrdAbastLubrific: TDBGrid;
    StringGrid1: TStringGrid;
    Label12: TLabel;
    EdtPlaca: TDBEdit;
    CBPeriodo: TComboBox;
    PopupMenuCons: TPopupMenu;
    Descricao1: TMenuItem;
    PopupMenuConsEquip: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Label6: TLabel;
    EdtTanque: TDBEdit;
    Label7: TLabel;
    aaaaaa1: TMenuItem;
    Placa1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure CBTipoChange(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdAbastCombustDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdAbastCombustKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Individual1Click(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure BtnContadorClick(Sender: TObject);
    procedure GrdAbastLubrificDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBPeriodoChange(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
    procedure Codigo1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure aaaaaa1Click(Sender: TObject);
    procedure Placa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadAbastecimentos: TFrmTelaCadAbastecimentos;
  LOdometro: Integer;
implementation
{$R *.dfm}
uses UnTelaCadAbastecimentosCombustivel,
  UnTelaCadAbastecimentosLubrificante, UnTelaCadContadores,
  UnTelaCadEquipamentos, UnTelaCadAbastecimentosRotas, UnDmRelatorios,
  UnTelaCadAbastecimentosViagens, UnDM;
procedure TFrmTelaCadAbastecimentos.aaaaaa1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnConsultar.OnClick(Sender);
end;
procedure TFrmTelaCadAbastecimentos.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryAbastecimentosCombustAbast.Active = True then DM.qryAbastecimentosCombustAbast.Cancel;
if DM.qryAbastecimentosCombust.Active = True then DM.qryAbastecimentosCombust.Cancel;
if DM.qryAbastecimentosLubrificAbast.Active = True then DM.qryAbastecimentosLubrificAbast.Cancel;
if DM.qryAbastecimentosLubrific.Active = True then DM.qryAbastecimentosLubrific.Cancel;
if DM.qryAbastecimentos.Active = True then
  begin
    DM.qryAbastecimentos.Cancel;
    DM.qryAbastecimentos.Edit;
    LOdometro := DM.qryAbastecimentosCONTADORATUAL.AsInteger;
  end;
end;
procedure TFrmTelaCadAbastecimentos.BtnConsultarClick(Sender: TObject);
begin
if DM.FParamAuxiliar[1] = '' then
  begin
    PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
    Exit;
  end
else
DM.FTabela_auxiliar := 78;
  inherited;
if DM.qryAbastecimentosCODEQUIPAMENTO.AsString <> EmptyStr then
  begin
    DM.qryAbastecimentosCombustTodos.Close;
    DM.qryAbastecimentosCombustTodos.Open;
    DM.qryAbastecimentosLubrificTodos.Close;
    DM.qryAbastecimentosLubrificTodos.Open;

    DM.qryAbastecimentosCombust.Open;
    DM.qryAbastecimentosCombustAbast.Close;
//    DM.qryAbastecimentosCombustAbast.Params[0].AsString := DM.qryAbastecimentosCombustCODEQUIPAMENTO.AsString;
//    DM.qryAbastecimentosCombustAbast.Params[0].AsString := DM.qryAbastecimentosCombustCODIGO.AsString;
//    DM.qryAbastecimentosCombustAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -12));
//    DM.qryAbastecimentosCombustAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
    DM.qryAbastecimentosCombustAbast.Open;
//

    DM.qryAbastecimentosLubrific.Open;
    DM.qryAbastecimentosLubrificAbast.Close;
//    DM.qryAbastecimentosLubrificAbast.Params[0].AsString := DM.qryAbastecimentosLubrificCODEQUIPAMENTO.AsString;
    DM.qryAbastecimentosLubrificAbast.Params[0].AsInteger := DM.qryAbastecimentosLubrificCODIGO.AsInteger;
//    DM.qryAbastecimentosLubrificAbast.Params[2].AsString := FormatDateTime('yyyy/mm/dd', IncMonth(DM.FDataHoraServidor, -12));
//    DM.qryAbastecimentosLubrificAbast.Params[3].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor) + ' 23:59:59';
    DM.qryAbastecimentosLubrificAbast.Open;

    LOdometro := DM.qryAbastecimentosCONTADORATUAL.AsInteger;
    CBPeriodo.OnChange(Sender);
  end;
DM.FParamAuxiliar[1] := '';
end;
procedure TFrmTelaCadAbastecimentos.BtnContadorClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
if DM.qryAbastecimentos.Active = False then Exit;
if DM.qryAbastecimentos.IsEmpty = True then Exit;
if DM.qryAbastecimentosCODEQUIPAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O EQUIPAMENTO!'; EdtDescEquipamento.SetFocus; Exit;
  end;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 480;
    DM.FParamAuxiliar[2] := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
    DM.FNomeConsulta := 'Medidores do ' + DM.qryAbastecimentosEQUIPAMENTO.AsString;
    DM.qryAbastecimentos.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryAbastecimentosCODCONTADOR.AsString    := DM.FCodCombo;
        DM.qryAbastecimentosCONTADOR.AsString       := DM.FValorCombo;
        DM.qryAbastecimentosCODPROGRAMACAO.AsString := DM.FParamAuxiliar[2];
        DM.qryAbastecimentosPROGRAMACAO.AsString    := DM.FParamAuxiliar[3];
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFERIADOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryContadoresCODIGO, DM.qryFormatoCodigoPONTOSINSPECAO, FrmTelaCadContadores) = False then exit;
      Application.CreateForm(TFrmTelaCadContadores, FrmTelaCadContadores);
      FrmTelaCadContadores.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadContadores);
    End;
  end;
DM.FDataSetParam    := DM.qryAbastecimentos;
DM.FDataSourceParam := DM.dsAbastecimentos;
DM.FTela            := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 78;
end;
procedure TFrmTelaCadAbastecimentos.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if DM.qryAbastecimentos.Active = False then Exit;
if DM.qryAbastecimentos.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    DM.qryAbastecimentos.Edit;
    if DM.FParamAuxiliar[1] = '' then
      begin
        PopupMenuConsEquip.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        Exit;
      end
    else
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryAbastecimentosCODEQUIPAMENTO.AsString := DM.FCodCombo;
        DM.qryAbastecimentosEQUIPAMENTO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryEquipamentosCODIGO, DM.qryFormatoCodigoEQUIPAMENTOS, FrmTelaCadEquipamentos) = False then exit;
      Application.CreateForm(TFrmTelaCadEquipamentos, FrmTelaCadEquipamentos);
      FrmTelaCadEquipamentos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadEquipamentos);
    End;
  end;
DM.FParamAuxiliar[1] := '';
DM.FDataSetParam    := DM.qryAbastecimentos;
DM.FDataSourceParam := DM.dsAbastecimentos;
DM.FTela            := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 78;
end;
procedure TFrmTelaCadAbastecimentos.BtnExcluirClick(Sender: TObject);
begin
  inherited;
LOdometro := DM.qryAbastecimentosCONTADORATUAL.AsInteger;
end;
procedure TFrmTelaCadAbastecimentos.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
DM.qryAbastecimentosCombust.Open;
DM.qryAbastecimentosCombustAbast.Open;
DM.qryAbastecimentosLubrific.Open;
DM.qryAbastecimentosLubrificAbast.Open;
DM.qryAbastecimentosCombustTodos.Open;
DM.qryAbastecimentosLubrificTodos.Open;
DM.qryAbastecimentosCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryAbastecimentosDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryAbastecimentosDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryAbastecimentosCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryAbastecimentosCODUSUARIOALT.AsString  := DM.FCodUsuario;
DM.qryAbastecimentosVOLUMETANQUE.AsFloat    := 0;
DM.qryAbastecimentosURBANO.AsFloat          := 0;
DM.qryAbastecimentosRODOVIARIO.AsFloat      := 0;
DM.qryAbastecimentosCARREGADO.AsFloat       := 0;
DM.qryAbastecimentosCONTADORATUAL.AsFloat   := 0;
LOdometro := 0;
EdtDescEquipamento.SetFocus;
end;
procedure TFrmTelaCadAbastecimentos.BtnSalvarClick(Sender: TObject);
begin
if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryAbastecimentosCODEQUIPAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O EQUIPAMENTO!'; EdtDescEquipamento.SetFocus; Exit;
  end;
if DM.qryAbastecimentosTIPO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO EQUIPAMENTO!'; CBTipo.SetFocus; Exit;
  end;
if DM.qryAbastecimentosCODCONTADOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONTADOR DO EQUIPAMENTO!'; EdtMedidor.SetFocus; Exit;
  end;
if DM.qryAbastecimentosVOLUMETANQUE.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O VOLUME DO TANQUE DO EQUIPAMENTO!'; EdtTanque.SetFocus; Exit;
  end;
DM.FTabela_auxiliar := 78;
if (DM.VerificaDuplo(DM.qryAbastecimentosCODEQUIPAMENTO.AsString) = True) and (DM.FAlterando = False) then
  begin
    EdtDescEquipamento.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR J� CADASTRADO!!!';
    Exit;
  end;
DM.MSGAguarde('');
if DM.qryAbastecimentosCONTADORATUAL.AsInteger < LOdometro then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'CONTADOR DO EQUIPAMENTO INFERIOR PREVIAMENTE CADASTRADO!'; EdtValor.SetFocus; Exit;
  end;
//Sempre checar se tem inspe��o programada com o contador atual
//if LOdometro < DM.qryAbastecimentosCONTADORATUAL.AsInteger then
  begin
    DM.qryAbastecimentosManutInsp.Close;
    DM.qryAbastecimentosManutInsp.Params[0].AsString := DM.FCodEmpresa;
    DM.qryAbastecimentosManutInsp.Params[1].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
    DM.qryAbastecimentosManutInsp.Params[2].AsString := DM.qryAbastecimentosCODPROGRAMACAO.AsString;
    DM.qryAbastecimentosManutInsp.Params[3].AsString := DM.qryAbastecimentosCONTADORATUAL.AsString;
    DM.qryAbastecimentosManutInsp.Open;
    DM.qryAbastecimentosManutInsp.First;
    while not DM.qryAbastecimentosManutInsp.Eof = True do
      begin
        DM.qryManutProgEquip.Close;
        DM.qryManutProgEquip.Params[0].AsString := DM.qryAbastecimentosManutInspCODIGO.AsString;
        DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
        DM.qryManutProgEquip.Params[2].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
        DM.qryManutProgEquip.Open;
        DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryManutProgEquipDESCRICAO.AsString
                                                      , DM.qryManutProgEquipCODEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                      , EmptyStr, 'Emerg�ncia', 'Para o Equipamento', DM.qryManutProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryManutProgEquiptempototal.AsString, DM.qryManutProgEquipCODOFICINA.AsString, DM.qryManutProgEquipCODMANUTENCAO.AsString, DM.qryManutProgEquipEQUIPPARADO.AsString, EmptyStr);
        if DM.qryManutProgEquip.IsEmpty = False then
          DM.HistoricoInspecoes(0, DM.FCodEmpresa, DM.qryManutProgEquipCODEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, DM.FCodOrdemServico);
        DmRelatorios.frxRManutProgEquipIndividual.ShowReport();
        //Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou n�o.
        if DM.qryManutProgEquipREPROGRAMAR2.AsString = 'Programa��o' then
          begin
            DM.qryManutProgEquip.Edit;
            DM.qryManutProgEquipRELATORIO.AsString    := 'N';
            DM.qryManutProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryManutProgEquipFREQUENCIA1.AsInteger);
            DM.qryManutProgEquipLEITURA.AsFloat       := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryManutProgEquipFREQUENCIA2.AsFloat;
            DM.qryManutProgEquip.Post;
          end;
        //Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
        //a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o at� ser fechada.
        if DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Execu��o' then
          begin
            DM.qryManutProgEquip.Edit;
            DM.qryManutProgEquipRELATORIO.AsString := 'S';
            DM.qryManutProgEquipLEITURA.AsFloat    := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryManutProgEquipFREQUENCIA2.AsInteger;
            DM.qryManutProgEquip.Post;
          end;
        DM.qryManutProgEquip.Post;
        DM.qryManutProgEquip.Close;
        DM.qryManutProgEquipItens.Close;
        DM.qryManutProgEquipItensEsp.Close;
        DM.qryManutProgEquipPlanoTrab.Close;
        DM.qryAbastecimentosManutInsp.Next;
      end;
    DM.qryAbastecimentosManutInsp.Close;

    DM.qryAbastecimentosLubrificInsp.Close;
    DM.qryAbastecimentosLubrificInsp.Params[0].AsString := DM.FCodEmpresa;
    DM.qryAbastecimentosLubrificInsp.Params[1].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
    DM.qryAbastecimentosLubrificInsp.Params[2].AsString := DM.qryAbastecimentosCODPROGRAMACAO.AsString;
    DM.qryAbastecimentosLubrificInsp.Params[3].AsString := DM.qryAbastecimentosCONTADORATUAL.AsString;
    DM.qryAbastecimentosLubrificInsp.Open;
    DM.qryAbastecimentosLubrificInsp.First;
    while not DM.qryAbastecimentosLubrificInsp.Eof = True do
      begin
        DM.qryLubrificProgEquip.Close;
        DM.qryLubrificProgEquip.Params[0].AsString := DM.qryAbastecimentosLubrificInspCODIGO.AsString;
        DM.qryLubrificProgEquip.Params[1].AsString := DM.FCodEmpresa;
        DM.qryLubrificProgEquip.Params[2].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
        DM.qryLubrificProgEquip.Open;
        DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryLubrificProgEquipDESCRICAO.AsString
                                                      , DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString, EmptyStr, DM.qryLubrificProgEquipCODIGO.AsString, EmptyStr, 'N'
                                                      , EmptyStr, 'Emerg�ncia', 'Para o Equipamento', DM.qryLubrificProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryLubrificProgEquiptempototal.AsString, DM.qryLubrificProgEquipCODOFICINA.AsString, DM.qryLubrificProgEquipCODMANUTENCAO.AsString, DM.qryLubrificProgEquipEQUIPPARADO.AsString, EmptyStr);
        if DM.qryLubrificProgEquip.IsEmpty = False then
          DM.HistoricoInspecoes(1, DM.FCodEmpresa, DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString, DM.qryLubrificProgEquipCODIGO.AsString, DM.FCodOrdemServico);
        DmRelatorios.frxRLubrificProgEquipIndividual.ShowReport();
        //Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a Lubrificen��o foi fechada ou n�o.
        if DM.qryLubrificProgEquipREPROGRAMAR2.AsString = 'Programa��o' then
          begin
            DM.qryLubrificProgEquip.Edit;
            DM.qryLubrificProgEquipRELATORIO.AsString    := 'N';
            DM.qryLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryLubrificProgEquipFREQUENCIA1.AsInteger);
            DM.qryLubrificProgEquipLEITURA.AsFloat       := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryLubrificProgEquipFREQUENCIA2.AsFloat;
            DM.qryLubrificProgEquip.Post;
          end;
        //Sendo a inspe��o reprogramada pela execu��o, definir como Lubrificen��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
        //a gera��o de outra Lubrifica��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra Lubrifica��o at� ser fechada.
        if DM.qryLubrificProgEquipREPROGRAMAR1.AsString = 'Execu��o' then
          begin
            DM.qryLubrificProgEquip.Edit;
            DM.qryLubrificProgEquipRELATORIO.AsString := 'S';
            DM.qryLubrificProgEquipLEITURA.AsFloat    := DM.qryAbastecimentosCONTADORATUAL.AsFloat + DM.qryLubrificProgEquipFREQUENCIA2.AsInteger;
            DM.qryLubrificProgEquip.Post;
          end;
        DM.qryLubrificProgEquip.Post;
        DM.qryLubrificProgEquip.Close;
        DM.qryLubrificProgEquipItens.Close;
        DM.qryLubrificProgEquipItensEsp.Close;
        DM.qryAbastecimentosLubrificInsp.Next;
      end;
    DM.qryAbastecimentosLubrificInsp.Close;
  end;
if DM.qryAbastecimentosCODIGO.AsInteger = 0 then
  begin
    DM.qryAbastecimentos.Params[0].AsString := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
    DM.qryAbastecimentos.Params[1].AsString := DM.FCodEmpresa;
  end;
  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;
LOdometro := DM.qryAbastecimentosCONTADORATUAL.AsInteger;
DM.MSGAguarde('', False);
end;
procedure TFrmTelaCadAbastecimentos.Button1Click(Sender: TObject);
begin
  inherited;
  DM.FParamAuxiliar[0] := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
  if DM.FParamAuxiliar[0] = '' then BtnConsultar.OnClick(Sender);
  if DM.FParamAuxiliar[0] = '' then Exit;
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadAbastecimentosCombustivel, FrmTelaCadAbastecimentosCombustivel);
    FrmTelaCadAbastecimentosCombustivel.Caption := 'Abastecimentos do: '+ DM.qryAbastecimentosEQUIPAMENTO.AsString;
    FrmTelaCadAbastecimentosCombustivel.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAbastecimentosCombustivel);
    DM.FDataSetParam    := DM.qryAbastecimentos;
    DM.FDataSourceParam := DM.dsAbastecimentos;
    DM.FTela            := 'CADCONTROLEPNEUS';
    DM.FTabela_auxiliar := 78;
    DM.qryAbastecimentosCombustAbast.First;
    if DM.qryAbastecimentosCombustAbastODOMETROCOMBUST.AsFloat > DM.qryAbastecimentosCONTADORATUAL.AsFloat then
      begin
        if Application.MessageBox('Contador superior ao �ltimo valor cadastrado, deseja substituir', 'SPMP3', MB_ICONQUESTION + MB_YESNO) = IDYes then
          begin
            DM.qryAbastecimentos.Edit;
            DM.qryAbastecimentosCONTADORATUAL.AsFloat := DM.qryAbastecimentosCombustAbastODOMETROCOMBUST.AsFloat;
            DM.qryAbastecimentos.Post;
            DM.qryAbastecimentos.Edit;
            BtnSalvar.OnClick(Sender);
          end;
      end;
    DM.qryAbastecimentosCombustAbast.Close;
    DM.qryAbastecimentosCombust.Close;
    DM.qryAbastecimentosCombustTodos.Close;
    DM.qryAbastecimentosCombustTodos.Open;
    CBPeriodo.OnChange(Sender);
  End;
DM.FDataSetParam    := DM.qryAbastecimentos;
DM.FDataSourceParam := DM.dsAbastecimentos;
DM.FTela := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 78;
end;
procedure TFrmTelaCadAbastecimentos.Button2Click(Sender: TObject);
begin
  inherited;
  DM.FParamAuxiliar[0] := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
  if DM.FParamAuxiliar[0] = '' then BtnConsultar.OnClick(Sender);;
  if DM.FParamAuxiliar[0] = '' then Exit;
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso n�o permitido, contacte o setor respons�vel para solicitar a libera��o', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadAbastecimentosLubrificante, FrmTelaCadAbastecimentosLubrificante);
    FrmTelaCadAbastecimentosLubrificante.Caption := 'Lubrifica��es do: '+ DM.qryAbastecimentosEQUIPAMENTO.AsString;
    FrmTelaCadAbastecimentosLubrificante.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAbastecimentosCombustivel);
    DM.FDataSetParam    := DM.qryAbastecimentos;
    DM.FDataSourceParam := DM.dsAbastecimentos;
    DM.FTela            := 'CADCONTROLEPNEUS';
    DM.FTabela_auxiliar := 78;
    DM.qryAbastecimentosLubrificAbast.First;
    if DM.qryAbastecimentosLubrificAbastODOMETROLubrific.AsFloat > DM.qryAbastecimentosCONTADORATUAL.AsFloat then
      begin
        if Application.MessageBox('Contador superior ao �ltimo valor cadastrado, deseja substituir', 'SPMP3', MB_ICONQUESTION + MB_YESNO) = IDYes then
          begin
            DM.qryAbastecimentos.Edit;
            DM.qryAbastecimentosCONTADORATUAL.AsFloat := DM.qryAbastecimentosLubrificAbastODOMETROLUBRIFIC.AsFloat;
            DM.qryAbastecimentos.Post;
            DM.qryAbastecimentos.Edit;
            FrmTelaCadAbastecimentos.BtnSalvar.OnClick(Sender);
          end;
      end;
    DM.qryAbastecimentosLubrificAbast.Close;
    DM.qryAbastecimentosLubrific.Close;
    DM.qryAbastecimentosLubrificTodos.Close;
    DM.qryAbastecimentosLubrificTodos.Open;
    CBPeriodo.OnChange(Sender);
  End;
DM.FDataSetParam    := DM.qryAbastecimentos;
DM.FDataSourceParam := DM.dsAbastecimentos;
DM.FTela := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 78;
end;
procedure TFrmTelaCadAbastecimentos.Button3Click(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryAbastecimentosCombustAbast.IsEmpty = True then Exit;
if Application.MessageBox('Deseja realmente efetuar a troca do medidor?', 'SPMP3', MB_YESNO + MB_ICONINFORMATION) = IDNo then Exit;
DM.qryAbastecimentosLeitor.Close;
DM.qryAbastecimentosLeitor.Params.ParamByName('ULTLEITURACOMBUST').AsString  := DM.qryAbastecimentosCombustAbastMAX_ODOM.AsString;
DM.qryAbastecimentosLeitor.Params.ParamByName('ULTLEITURALUBRIFIC').AsString := DM.qryAbastecimentosLubrificAbastMAX_ODOM.AsString;
DM.qryAbastecimentosLeitor.Params.ParamByName('CODEQUIPAMENTO').AsString     := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
DM.qryAbastecimentosLeitor.Params.ParamByName('CODEMPRESA').AsString         := DM.FCodEmpresa;
DM.qryAbastecimentosLeitor.Execute;
PAuxiliares.Font.Color := clGreen; PAuxiliares.Caption := 'TROCA DO MEDIDOR EFETUADA!';
DM.qryAbastecimentosLeitor.Close;
DM.qryAbastecimentosCombustAbast.Close;
DM.qryAbastecimentosCombustAbast.Open;
DM.qryAbastecimentosLubrificAbast.Close;
DM.qryAbastecimentosLubrificAbast.Open;
end;
procedure TFrmTelaCadAbastecimentos.Button4Click(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

  DM.FParamAuxiliar[0] := DM.qryAbastecimentosCODEQUIPAMENTO.AsString;
  if DM.FParamAuxiliar[0] = '' then BtnConsultar.OnClick(Sender);
  if DM.FParamAuxiliar[0] = '' then Exit;
  Try
    if (DM.qryUsuarioPAcessoCADCONTROLEPNEUS.AsString <> 'S') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadAbastecimentosViagens,FrmTelaCadAbastecimentosViagens);
    FrmTelaCadAbastecimentosViagens.Position := poScreenCenter;
    FrmTelaCadAbastecimentosViagens.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAbastecimentosViagens);
  End;
DM.FDataSetParam    := DM.qryAbastecimentos;
DM.FDataSourceParam := DM.dsAbastecimentos;
DM.FTela := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 78;
end;
procedure TFrmTelaCadAbastecimentos.CBPeriodoChange(Sender: TObject);
begin
  inherited;
DM.qryAbastecimentosCombustAbast.Filtered := False;
DM.qryAbastecimentosCombustAbast.Filter := EmptyStr;
case CBPeriodo.ItemIndex of
  0: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST = '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));
  1: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -7)));
  2: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -15)));
  3: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -30)));
  4: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -60)));
  5: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -90)));
  6: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -180)));
  7: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -270)));
  8: DM.qryAbastecimentosCombustAbast.Filter := 'DATACOMBUST >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -365)));
end;
DM.qryAbastecimentosCombustAbast.Filtered := True;
DM.qryAbastecimentosLubrificAbast.Filtered := False;
DM.qryAbastecimentosLubrificAbast.Filter := EmptyStr;
case CBPeriodo.ItemIndex of
  0: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC = '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));
  1: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -7)));
  2: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -15)));
  3: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -30)));
  4: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -60)));
  5: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -90)));
  6: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -180)));
  7: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -270)));
  8: DM.qryAbastecimentosLubrificAbast.Filter := 'DATALUBRIFIC >= '+QuotedStr(FormatDateTime('dd/mm/yyyy', IncDay(DM.FDataHoraServidor, -365)));
end;
DM.qryAbastecimentosLubrificAbast.Filtered := True;
end;
procedure TFrmTelaCadAbastecimentos.CBTipoChange(Sender: TObject);
begin
  inherited;
if CBTipo.Text = 'Equipamento' then
  begin
    GrdAbastCombust.Columns[5].Title.Caption := 'Hor�metro';
    GrdAbastCombust.Columns[8].Title.Caption := 'l/h';
    GrdAbastLubrific.Columns[5].Title.Caption := 'Hor�metro';
    GrdAbastLubrific.Columns[8].Title.Caption := 'l/h';
  end
else
if CBTipo.Text = 'Ve�culo' then
  begin
    GrdAbastCombust.Columns[5].Title.Caption := 'Od�metro';
    GrdAbastCombust.Columns[8].Title.Caption := 'km/l';
    GrdAbastLubrific.Columns[5].Title.Caption := 'Od�metro';
    GrdAbastLubrific.Columns[8].Title.Caption := 'l/km';
  end;
end;
procedure TFrmTelaCadAbastecimentos.Codigo1AdvancedDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;
procedure TFrmTelaCadAbastecimentos.Completo1Click(Sender: TObject);
begin
DM.FParamAuxiliar[1] := 'DESCRICAO';
DM.FDataSetRelat     := DmRelatorios.frxDBAbastecimentosGeral;
DM.FTabela_auxiliar  := 78;
  inherited;
end;
procedure TFrmTelaCadAbastecimentos.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnConsultar.OnClick(Sender);
end;
procedure TFrmTelaCadAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryAbastecimentosCombustAbast.Close;
DM.qryAbastecimentosCombust.Close;
DM.qryAbastecimentosLubrificAbast.Close;
DM.qryAbastecimentosLubrific.Close;
DM.qryAbastecimentos.Close;
end;
procedure TFrmTelaCadAbastecimentos.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryAbastecimentos;
DM.FDataSourceParam := DM.dsAbastecimentos;
DM.FTela := 'CADCONTROLEPNEUS';
DM.FTabela_auxiliar := 78;
end;
procedure TFrmTelaCadAbastecimentos.GrdAbastCombustDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
with GrdAbastCombust do
  begin
    GrdAbastCombust.Columns[0].Visible := False;
    GrdAbastCombust.Columns[1].Visible := False;
    GrdAbastCombust.Columns[2].Visible := False;
    GrdAbastCombust.Columns[3].Visible := False;
    GrdAbastCombust.Columns[4].Visible := False;
    GrdAbastCombust.Columns[5].Visible := False;
    GrdAbastCombust.Columns[6].Visible := False;
    GrdAbastCombust.Columns[7].Visible := False;
    GrdAbastCombust.Columns[8].Visible := False;
    GrdAbastCombust.Columns[9].Title.Caption    := 'Combustível';
    GrdAbastCombust.Columns[10].Title.Caption   := 'Data';
    GrdAbastCombust.Columns[10].Title.Alignment := taCenter;
    if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
      begin
        GrdAbastCombust.Columns[11].Title.Caption   := 'Horímetro';
        GrdAbastCombust.Columns[11].Title.Alignment := taCenter;
//        GrdAbastCombust.Columns[].Title.Caption := 'l/h';
      end
    else
    if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
      begin
        GrdAbastCombust.Columns[11].Title.Caption   := 'Odômetro';
        GrdAbastCombust.Columns[11].Title.Alignment := taCenter;
//        GrdAbastCombust.Columns[].Title.Caption := 'km/l';
      end;
    GrdAbastCombust.Columns[12].Title.Caption   := 'Qtde.';
    GrdAbastCombust.Columns[12].Title.Alignment := taCenter;
    GrdAbastCombust.Columns[13].Title.Caption   := 'Preço';
    GrdAbastCombust.Columns[13].Title.Alignment := taCenter;
    GrdAbastCombust.Columns[14].Title.Caption   := 'Total';
    GrdAbastCombust.Columns[14].Title.Alignment := taCenter;
    GrdAbastCombust.Columns[15].Title.Caption   := 'Funcionário';
    GrdAbastCombust.Columns[16].Title.Caption   := 'Rota';
    GrdAbastCombust.Columns[17].Title.Caption   := 'Consumo';
    GrdAbastCombust.Columns[17].Title.Alignment := taCenter;
    if (Column.Field.FieldName = 'CONSUMO') then
      begin
        if DM.qryAbastecimentosCombustTodosCONSUMO.AsFloat > DM.qryAbastecimentosCombustCONSPOTENCIAL.AsFloat then
          begin
             GrdAbastCombust.Canvas.Brush.Color := clRed; GrdAbastCombust.Canvas.Font.Color:= clWhite;
             GrdAbastCombust.Canvas.FillRect(Rect);
             GrdAbastCombust.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;
      end;
  end;
end;
procedure TFrmTelaCadAbastecimentos.GrdAbastCombustKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if (Shift = [ssCtrl]) and (Key = 46) then
  Key := 0;
end;
procedure TFrmTelaCadAbastecimentos.GrdAbastLubrificDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
with GrdAbastLubrific do
  begin
    GrdAbastLubrific.Columns[0].Visible := False;
    GrdAbastLubrific.Columns[1].Visible := False;
    GrdAbastLubrific.Columns[2].Visible := False;
    GrdAbastLubrific.Columns[3].Visible := False;
    GrdAbastLubrific.Columns[4].Visible := False;
    GrdAbastLubrific.Columns[5].Visible := False;
    GrdAbastLubrific.Columns[6].Visible := False;
    GrdAbastLubrific.Columns[7].Visible := False;
    GrdAbastLubrific.Columns[8].Visible := False;
    GrdAbastLubrific.Columns[9].Title.Caption    := 'Lubrificante';
    GrdAbastLubrific.Columns[10].Title.Caption   := 'Data';
    GrdAbastLubrific.Columns[10].Title.Alignment := taCenter;
    if DM.qryAbastecimentosTIPO.AsString = 'Equipamento' then
      begin
        GrdAbastLubrific.Columns[11].Title.Caption   := 'Horímetro';
        GrdAbastLubrific.Columns[11].Title.Alignment := taCenter;
//        GrdAbastLubrific.Columns[].Title.Caption := 'l/h';
      end
    else
    if DM.qryAbastecimentosTIPO.AsString = 'Veículo' then
      begin
        GrdAbastLubrific.Columns[11].Title.Caption   := 'Odímetro';
        GrdAbastLubrific.Columns[11].Title.Alignment := taCenter;
//        GrdAbastLubrific.Columns[].Title.Caption := 'km/l';
      end;
    GrdAbastLubrific.Columns[12].Title.Caption   := 'Qtde.';
    GrdAbastLubrific.Columns[12].Title.Alignment := taCenter;
    GrdAbastLubrific.Columns[13].Title.Caption   := 'Preço';
    GrdAbastLubrific.Columns[13].Title.Alignment := taCenter;
    GrdAbastLubrific.Columns[14].Title.Caption   := 'Total';
    GrdAbastLubrific.Columns[14].Title.Alignment := taCenter;
    GrdAbastLubrific.Columns[15].Title.Caption   := 'Funcionário';
    GrdAbastLubrific.Columns[16].Title.Caption   := 'Rota';
    GrdAbastLubrific.Columns[17].Title.Caption   := 'Consumo';
    GrdAbastLubrific.Columns[17].Title.Alignment := taCenter;
    if (Column.Field.FieldName = 'CONSUMO') then
      begin
        if DM.qryAbastecimentosLubrificTodosCONSUMO.AsFloat > DM.qryAbastecimentosLubrificCONSPOTENCIAL.AsFloat then
          begin
             GrdAbastLubrific.Canvas.Brush.Color := clRed; GrdAbastLubrific.Canvas.Font.Color:= clWhite;
             GrdAbastLubrific.Canvas.FillRect(Rect);
             GrdAbastLubrific.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;
      end;
  end;
end;
procedure TFrmTelaCadAbastecimentos.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBAbastecimentosIndividual;
DM.FTabela_auxiliar := 781;
  inherited;
end;
procedure TFrmTelaCadAbastecimentos.MenuItem1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;
procedure TFrmTelaCadAbastecimentos.MenuItem2Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnEquipamento.OnClick(Sender);
end;
procedure TFrmTelaCadAbastecimentos.Placa1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'PLACA';
BtnConsultar.OnClick(Sender);

end;

end.


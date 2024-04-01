unit UnTelaCadPneusChassi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.Imaging.Jpeg, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Buttons, System.DateUtils, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadPneusChassi = class(TFrmTelaPaiCadastros)
    Label5: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    Label20: TLabel;
    Label6: TLabel;
    CBTipo: TDBComboBox;
    Label4: TLabel;
    Label8: TLabel;
    CBStatus: TDBComboBox;
    Label7: TLabel;
    EdtContador: TDBEdit;
    EdtChassi: TDBEdit;
    BtnChassi: TButton;
    Label9: TLabel;
    GrdPneus: TDBGrid;
    Label10: TLabel;
    ImgChassi: TImage;
    PopupMenuID: TPopupMenu;
    Instalar1: TMenuItem;
    Remover1: TMenuItem;
    Desinstalar1: TMenuItem;
    Descartar1: TMenuItem;
    Cancelar1: TMenuItem;
    CDPneusCad: TClientDataSet;
    CDPneusCadID: TIntegerField;
    Label11: TLabel;
    BtnPneu: TSpeedButton;
    CDPneusCadSTATUS: TStringField;
    OpenDialog1: TOpenDialog;
    StringGrid1: TStringGrid;
    Label12: TLabel;
    EdtPlaca: TDBEdit;
    PopupMenuCons: TPopupMenu;
    Codigo1: TMenuItem;
    Descricao1: TMenuItem;
    procedure BuscarPneus(Chassi:String);
    function  MotivoRetiradaInputBox(const ACaption, APrompt:string): string;
    procedure CBChassiChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure GrdPneusKeyPress(Sender: TObject; var Key: Char);
    procedure Desinstalar1Click(Sender: TObject);
    procedure Descartar1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure BtnPneuClick(Sender: TObject);
    procedure AlimentaHistorico(Operacao:string);
    procedure Instalar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GrdPneusDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure GrdPneusDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure BtnChassiClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
  private
    FMotivo: String;
    { Private declarations }
  public
    FIDPneu: Integer;
    LOdometro: Integer;
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassi: TFrmTelaCadPneusChassi;

implementation

{$R *.dfm}

uses UnTelaCadPneusChassiPneus, UnTelaCadPneusChassiAtrelamento,
  UnTelaCadEquipamentos, UnDmRelatorios, UnTelaCadPneusChassiPneusHist,
  UnTelaCadPneusChassiRelat, UnDM;

procedure TFrmTelaCadPneusChassi.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryPneusChassiCODEQUIPAMENTO.AsString = EmptyStr then
  begin
    ImgChassi.Picture := nil;
    BtnPneu.Visible := False;
  end;

if DM.qryPneusChassiPosicoes.Active = True then
  DM.qryPneusChassiPosicoes.Cancel;
DM.qryPneusChassiPneus.Cancel;
LOdometro := DM.qryPneusChassiCONTADOR.AsInteger;
end;

procedure TFrmTelaCadPneusChassi.BtnChassiClick(Sender: TObject);
begin
  inherited;
if DM.qryPneusChassi.Active = False then Exit;
if DM.qryPneusChassi.IsEmpty = True then Exit;

if (DM.FAlterando = False) or (DM.qryPneusChassiCODIGO.AsInteger <= 0) then
  begin
    if Application.MessageBox('Para cadastrar o chassi, o registro deverá ser gravado, deseja continuar?', 'SPMP3', MB_ICONQUESTION + MB_YESNO) = IDYes then
      begin
        if DM.qryPneusChassiCODEQUIPAMENTO.IsNull = True then
          begin
            PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O EQUIPAMENTO!'; EdtDescEquipamento.SetFocus; Exit;
          end;
        if (DM.VerificaDuplo(EdtCodEquipamento.Text) = True) and (DM.FAlterando = False) then
          begin
            EdtDescEquipamento.SetFocus; PAuxiliares.Font.Color := clBlack; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
          end;
        if DM.qryPneusChassiTIPO.IsNull = True then
          begin
            PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO REGISTRO!'; CBTipo.SetFocus; Exit;
          end;
        if DM.qryPneusChassiCONTADOR.IsNull = True then
          begin
            PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONTADOR DO REGISTRO!'; EdtContador.SetFocus; Exit;
          end;

        DM.qryPneusChassi.Post;
        DM.qryPneusChassi.Params[0].AsString := DM.qryPneusChassiCODEQUIPAMENTO.AsString;
        DM.qryPneusChassi.Params[1].AsString := DM.FCodEmpresa;

        DM.FAlterando := True;
      end
    else
      Exit;
  end;

  if DM.qryPneusChassiPosicoes.Active = False then
  begin
    DM.qryPneusChassiPosicoes.Close;
//    DM.qryPneusChassiPosicoes.Params[0].AsString := DM.FCodEmpresa;
//    DM.qryPneusChassiPosicoes.Params[1].AsString := DM.qryPneusChassiCODIGO.AsString;
    DM.qryPneusChassiPosicoes.Open;
  end;
if DM.qryPneusChassiPosicoes.IsEmpty = False then
  begin
    DM.qryPneusChassiPosicoes.First;
    while not DM.qryPneusChassiPosicoes.Eof = True do
      begin
        if DM.qryPneusChassiPosicoesID.AsInteger <> 0 then
          begin
            GrdPneus.SelectedIndex := 2;
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'PNEU INSTALADO NO CHASSI!';
            Exit;
          end;
        DM.qryPneusChassiPosicoes.Next;
      end;

    DM.qryPneusChassiPosicoes.EmptyDataSet;
  end;

DM.FTabela_auxiliar := 8100;
DM.FNomeConsulta := 'Chassis';
DM.qryPneusChassi.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    BtnPneu.Visible := True;

    DM.qryPneusChassiImagens.Close;
    DM.qryPneusChassiImagens.Params[0].AsString := DM.FValorCombo;
    DM.qryPneusChassiImagens.Open;

    DM.qryPneusChassiCHASSI.AsString := DM.FValorCombo;
    DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgChassi);
    BuscarPneus(DM.qryPneusChassiCHASSI.AsString);
    DM.qryPneusChassiPosicoes.Edit;
  end;
DM.FDataSetParam    := DM.qryPneusChassi;
DM.FDataSourceParam := DM.dsPneusChassi;
DM.FTabela_auxiliar := 82;
DM.FTela            := 'CADCONTROLEPNEUS';
end;

procedure TFrmTelaCadPneusChassi.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.IsEmpty = False then
  begin
    BtnPneu.Visible := True;
    DM.qryPneusChassiPosicoes.Close;
//    DM.qryPneusChassiPosicoes.Params[0].AsString := DM.FCodEmpresa;
//    DM.qryPneusChassiPosicoes.Params[1].AsString := DM.qryPneusChassiCODIGO.AsString;
    DM.qryPneusChassiPosicoes.Open;

    DM.qryPneusChassiImagens.Close;
    DM.qryPneusChassiImagens.Params[0].AsString := DM.qryPneusChassiCHASSI.AsString;
    DM.qryPneusChassiImagens.Open;

    DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgChassi);
    DM.qryPneusChassiPosicoes.Open;
    DM.qryPneusChassiPosicoes.Last;
    DM.qryPneusChassiPosicoes.First;
    DM.qryPneusChassiPosicoes.Edit;

    LOdometro := DM.qryPneusChassiCONTADOR.AsInteger;
  end;
end;

procedure TFrmTelaCadPneusChassi.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if DM.qryPneusChassi.Active = False then Exit;
if DM.qryPneusChassi.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    DM.qryPneusChassi.Edit;
    if DM.FParamAuxiliar[1] = '' then
      begin
        PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        Exit;
      end
    else
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPneusChassiCODEQUIPAMENTO.AsString := DM.FCodCombo;
        DM.qryPneusChassiEQUIPAMENTO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
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
DM.FDataSetParam    := DM.qryPneusChassi;
DM.FDataSourceParam := DM.dsPneusChassi;
DM.FTabela_auxiliar := 82;
DM.FTela            := 'CADCONTROLEPNEUS';
end;

procedure TFrmTelaCadPneusChassi.BtnExcluirClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString = 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    ImgChassi.Picture := nil;
    BtnPneu.Visible   := False;
    DM.qryPneusChassiPosicoes.Close;
    DM.qryPneusChassiPosicoes.Open;
  end;
end;

procedure TFrmTelaCadPneusChassi.BtnImprimirClick(Sender: TObject);
begin
//  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.qryPneusChassi.IsEmpty = False then
  DmRelatorios.frxRPneusChassi.ShowReport();
end;

procedure TFrmTelaCadPneusChassi.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryPneusChassiCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryPneusChassiDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryPneusChassiDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryPneusChassiCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryPneusChassiCODUSUARIOALT.AsString  := DM.FCodUsuario;
DM.qryPneusChassiSTATUS.AsString         := 'ATIVO';

DM.qryPneusChassiPosicoes.Close;

ImgChassi.Picture := nil;
BtnPneu.Visible   := False;
LOdometro         := 0;
EdtDescEquipamento.SetFocus;
end;

procedure TFrmTelaCadPneusChassi.BtnPneuClick(Sender: TObject);
begin
  inherited;
if DM.qryPneusChassiPosicoesID.AsInteger = 0 then Exit;
  Try
    Application.CreateForm(TFrmTelaCadPneusChassiPneusHist, FrmTelaCadPneusChassiPneusHist);
    DM.qryPneusChassiPneusHist.Filtered := False;
    DM.qryPneusChassiPneusHist.Filter   := 'ID = ' + QuotedStr(DM.qryPneusChassiPosicoesID.AsString);
    DM.qryPneusChassiPneusHist.Filtered := True;
    FrmTelaCadPneusChassiPneusHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPneusChassiPneusHist);
    DM.qryPneusChassiPneusHist.Filtered := False;
  End;
end;

procedure TFrmTelaCadPneusChassi.BtnSalvarClick(Sender: TObject);
var
I:SmallInt;
begin
if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    DM.MSGAguarde('', False);
    Exit;
  end;

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

if DM.qryPneusChassiCODEQUIPAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O EQUIPAMENTO!'; EdtDescEquipamento.SetFocus; Abort;
  end;
DM.FTabela_auxiliar := 82;
if (DM.VerificaDuplo(EdtCodEquipamento.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtDescEquipamento.SetFocus; PAuxiliares.Font.Color := clBlack; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Abort;
  end;
if DM.qryPneusChassiTIPO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O TIPO DO REGISTRO!'; CBTipo.SetFocus; Abort;
  end;
if DM.qryPneusChassiCONTADOR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CONTADOR DO REGISTRO!'; EdtContador.SetFocus; Abort;
  end;
if DM.qryPneusChassiCHASSI.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CHASSI DO REGISTRO!'; EdtChassi.SetFocus; Abort;
  end;

DM.MSGAguarde('');

if LOdometro > DM.qryPneusChassiCONTADOR.AsInteger then
  begin
    DM.MSGAguarde('', False);
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'CONTADOR INFORMADO INFERIOR A LEITURA ANTERIOR!'; EdtContador.SetFocus; Exit;
  end
else
if LOdometro < DM.qryPneusChassiCONTADOR.AsInteger then
  begin
    //AtualizarRodagemPneus
    DM.qryPneusChassiPosicoes.First;
    for I := 0 to DM.qryPneusChassiPosicoes.RecordCount -1 do
      begin
        if DM.qryPneusChassiPneus.Locate('ID', DM.qryPneusChassiPosicoesID.AsInteger, []) = True then
          begin
            DM.qryPneusChassiPneus.Edit;
            DM.qryPneusChassiPneusRODADOS.AsInteger := DM.qryPneusChassiPneusRODADOS.AsInteger + (DM.qryPneusChassiCONTADOR.AsInteger - DM.qryPneusChassiPneusCONTADOR.AsInteger);
            DM.qryPneusChassiPneusCONTADOR.AsInteger := DM.qryPneusChassiCONTADOR.AsInteger;
            DM.qryPneusChassiPneus.Post;
          end;
        DM.qryPneusChassiPosicoes.Next;
      end;
//    DM.qryPneusChassiPneus.Edit;
//    DM.qryPneusChassiPneus.Post;
  end;

LOdometro := DM.qryPneusChassiCONTADOR.AsInteger;

inherited;
DM.qryPneusChassi.Params[0].AsString := DM.qryPneusChassiCODEQUIPAMENTO.AsString;
DM.qryPneusChassi.Params[1].AsString := DM.FCodEmpresa;

if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

DM.qryPneusChassiPosicoes.Edit;
DM.qryPneusChassiPosicoes.Post;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadPneusChassi.Button1Click(Sender: TObject);
var
Texto: PChar;
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

  Try
    if (DM.qryPneusChassiCHASSI.AsString <> 'Cavalo Mecânico C/Diferencial Frontal') and (DM.qryPneusChassiCHASSI.AsString <> 'Cavalo Mecânico C/Diferencial Trazeiro') and (DM.qryPneusChassiCHASSI.AsString <> 'Cavalo Mecânico C/Diferencial Duplo') then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'NÃO É UM CAVALO MECÂNICO!';
        Exit;
      end;

    DM.FParamAuxiliar[0] := DM.qryPneusChassiCODIGO.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);

    Texto := PChar('Deseja confirmar o contador '+QuotedStr(DM.qryPneusChassiCONTADOR.AsString)+' do ' + CBTipo.Text + ' ?');
    if Application.MessageBox(Texto,'SPMPWeb', MB_YESNO + MB_ICONWARNING) = IDNo then Exit;

    Application.CreateForm(TFrmTelaCadPneusChassiAtrelamento, FrmTelaCadPneusChassiAtrelamento);
    FrmTelaCadPneusChassiAtrelamento.Caption := 'Atrelamentos de: '+ DM.qryPneusChassiEQUIPAMENTO.AsString;
    FrmTelaCadPneusChassiAtrelamento.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadPneusChassiAtrelamento);
  End;
DM.FDataSetParam    := DM.qryPneusChassi;
DM.FDataSourceParam := DM.dsPneusChassi;
DM.FTabela_auxiliar := 82;
end;

procedure TFrmTelaCadPneusChassi.Button2Click(Sender: TObject);
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

try
  DM.qryPneusChassiPneus.Filtered := False;
  Application.CreateForm(TFrmTelaCadPneusChassiPneus, FrmTelaCadPneusChassiPneus);
  FrmTelaCadPneusChassiPneus.ShowModal;
finally
  FreeAndNil(FrmTelaCadPneusChassiPneus);
  DM.qryPneusChassiPneus.Filtered := False;
end;
end;

procedure TFrmTelaCadPneusChassi.Button3Click(Sender: TObject);
begin
  inherited;
Try
  Application.CreateForm(TFrmTelaCadPneusChassiPneusHist, FrmTelaCadPneusChassiPneusHist);
  FrmTelaCadPneusChassiPneusHist.ShowModal;
Finally
  FreeAndNil(FrmTelaCadPneusChassiPneusHist);
End;
end;

procedure TFrmTelaCadPneusChassi.Cancelar1Click(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption    := EmptyStr;
DM.qryPneusChassiPosicoes.Cancel;
DM.qryPneusChassiPneus.Cancel;
end;

procedure TFrmTelaCadPneusChassi.CBChassiChange(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.IsEmpty = True then Exit;
end;

procedure TFrmTelaCadPneusChassi.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadPneusChassi.Descartar1Click(Sender: TObject);
var
Texto : Pchar;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
Texto := PChar('CONFIRMA O CONTADOR: '+QuotedStr(DM.qryPneusChassiCONTADOR.AsString)+' DO ' + CBTipo.Text + ' ?');
if Application.MessageBox(Texto,'SPMPWeb', MB_YESNO + MB_ICONWARNING) = IDNo then Exit;
FMotivo := MotivoRetiradaInputBox('Movimentação do Pneu', 'Informe o motivo da exclusão:');
if FMotivo = EmptyStr then Exit;

DM.MSGAguarde('');

if DM.qryPneusChassiPneus.Locate('CODCHASSI;ID', VarArrayOf([DM.qryPneusChassiCODIGO.AsString, DM.qryPneusChassiPosicoesID.AsInteger]), []) = True then
  begin
    AlimentaHistorico('DESCARTADO');

    DM.qryPneusChassiPneus.Edit;
    DM.qryPneusChassiPneusCODCHASSI.Clear;
    DM.qryPneusChassiPneusINSTALADO.Clear;
    DM.qryPneusChassiPneusPOSICAO.Clear;
    DM.qryPneusChassiPneusCONTADOR.Clear;
    //DM.qryPneusChassiPneusRODADOS.AsFloat  := DM.qryPneusChassiPneusRODADOS.AsFloat + (DM.qryPneusChassiCONTADOR.AsFloat - DM.qryPneusChassiPneusCONTADOR.AsFloat);
    DM.qryPneusChassiPneusSTATUS.AsString  := 'EXCLUIDO';
    DM.qryPneusChassiPneus.Edit;
    DM.qryPneusChassiPneus.Post;

    DM.qryPneusChassiPosicoes.Edit;
    DM.qryPneusChassiPosicoesCODPNEU.Clear;
    DM.qryPneusChassiPosicoesTIPO.Clear;
    DM.qryPneusChassiPosicoesSTATUS.Clear;
    DM.qryPneusChassiPosicoesID.Clear;
    DM.qryPneusChassiPosicoesINSTALADO.Clear;
    DM.qryPneusChassiPosicoes.Post;


    PAuxiliares.Font.Color := clGreen;
    PAuxiliares.Caption := 'PNEU EXCLUÍDO COM SUCESSO!';
  end;


DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadPneusChassi.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadPneusChassi.Desinstalar1Click(Sender: TObject);
var
Texto : Pchar;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
Texto := PChar('CONFIRMA O CONTADOR: '+QuotedStr(DM.qryPneusChassiCONTADOR.AsString)+' DO ' + CBTipo.Text + ' ?');
if Application.MessageBox(Texto,'SPMPWeb', MB_YESNO + MB_ICONWARNING) = IDNo then Exit;
FMotivo := MotivoRetiradaInputBox('Movimentação do Pneu', 'Informe o motivo da desinstalação:');
if FMotivo = EmptyStr then Exit;

DM.MSGAguarde('');

if DM.qryPneusChassiPneus.Locate('ID', DM.qryPneusChassiPosicoesID.AsInteger, []) = True then
  begin
    AlimentaHistorico('DESINSTALADO');

    DM.qryPneusChassiPneus.Edit;
    DM.qryPneusChassiPneusCODCHASSI.Clear;
    DM.qryPneusChassiPneusINSTALADO.Clear;
    DM.qryPneusChassiPneusPOSICAO.Clear;

    if (FMotivo = 'Troca') then
      DM.qryPneusChassiPneusSTATUS.AsString := 'USADO';
    if (FMotivo = 'Desgaste') or (FMotivo = 'Defeito') or (FMotivo = 'Furo') or (FMotivo = 'Estouro') then
      DM.qryPneusChassiPneusSTATUS.AsString := 'REPARO';
    if (FMotivo = 'Fim da vida útil') then
      DM.qryPneusChassiPneusSTATUS.AsString := 'EXCLUIDO';
    DM.qryPneusChassiPneus.Edit;
    DM.qryPneusChassiPneus.Post;

    DM.qryPneusChassiPosicoes.Edit;
    DM.qryPneusChassiPosicoesID.Clear;
    DM.qryPneusChassiPosicoesINSTALADO.Clear;
    DM.qryPneusChassiPosicoes.Post;

    DM.qryPneusChassiPneus.Close;
    DM.qryPneusChassiPneus.Params[0].AsString := DM.FCodEmpresa;
    DM.qryPneusChassiPneus.Open;

    PAuxiliares.Font.Color := clGreen;
    PAuxiliares.Caption := 'PNEU DESINSTALADO COM SUCESSO!';
  end
else
  begin
    DM.qryPneusChassiPosicoes.Edit;
    DM.qryPneusChassiPosicoesCODPNEU.Clear;
    DM.qryPneusChassiPosicoesTIPO.Clear;
    DM.qryPneusChassiPosicoesSTATUS.Clear;
    DM.qryPneusChassiPosicoesID.Clear;
    DM.qryPneusChassiPosicoesINSTALADO.Clear;
    DM.qryPneusChassiPosicoes.Post;
  end;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadPneusChassi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.qryPneusChassiPosicoes.Active = True then
  begin
    if DM.qryPneusChassiSTATUS.AsString = 'PARADO' then Exit;

    DM.qryPneusChassiPosicoes.First;
    while not DM.qryPneusChassiPosicoes.Eof = True do
      begin
        if (DM.qryPneusChassiPosicoesTIPO.AsString <> '') then
          begin
            if (DM.qryPneusChassiPosicoesID.AsInteger = 0) then
              begin
                PAuxiliares.Font.Color := clRed;
                PAuxiliares.Caption := 'INFORME O ID DO PNEU!';
                GrdPneus.SelectedIndex := 3;
                GrdPneus.SetFocus;
                Abort;
              end;
          end;

        DM.qryPneusChassiPosicoes.Next;
      end;
  end;

  inherited;
if LOdometro < DM.qryPneusChassiCONTADOR.AsInteger then
  begin
    BtnSalvar.OnClick(Sender);
  end;

DM.qryPneusChassiAtrelamento.Close;
DM.qryPneusChassiPosicoes.Close;
DM.qryPneusChassiPneus.Close;
DM.qryPneusChassiImagens.Close;
DM.qryPneusChassi.Close;
DM.qryPneus.Close;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
end;

procedure TFrmTelaCadPneusChassi.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryPneusChassi;
DM.FDataSourceParam := DM.dsPneusChassi;
DM.FTabela_auxiliar := 82;
DM.FTela := 'CADCONTROLEPNEUS';
DM.qryPneusChassiPneus.Close;
DM.qryPneusChassiPneus.Params[0].AsString := DM.FCodEmpresa;
DM.qryPneusChassiPneus.Open;

CDPneusCad.Close; CDPneusCad.CreateDataSet;
while not DM.qryPneusChassiPneus.Eof = True do
  begin
    CDPneusCad.Append;
    CDPneusCadID.AsString := DM.qryPneusChassiPneusID.AsString;
    CDPneusCadSTATUS.AsString := DM.qryPneusChassiPneusSTATUS.AsString;
    CDPneusCad.Post;

    DM.qryPneusChassiPneus.Next;
  end;


DM.qryPneusChassiPneusHist.Close;
DM.qryPneusChassiPneusHist.Params[0].AsString := DM.FCodEmpresa;
DM.qryPneusChassiPneusHist.Open;
end;

procedure TFrmTelaCadPneusChassi.GrdPneusDblClick(Sender: TObject);
begin
  inherited;
if (GrdPneus.SelectedIndex = 1) and (DM.qryPneusChassiPosicoesID.AsInteger <> Null) then
  begin
    DM.qryPneusChassiPosicoes.Edit;
    DM.qryPneusChassiPosicoesTIPO.Clear;
    DM.qryPneusChassiPosicoesSTATUS.Clear;
    DM.qryPneusChassiPosicoes.Post;
  end;
end;

procedure TFrmTelaCadPneusChassi.GrdPneusDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdPneus.Columns[0].Title.Font.Size := 9;
GrdPneus.Columns[1].Title.Font.Size := 9;
GrdPneus.Columns[2].Title.Font.Size := 9;
GrdPneus.Columns[3].Title.Font.Size := 9;
GrdPneus.Columns[4].Title.Font.Size := 9;
GrdPneus.Columns[5].Title.Font.Size := 9;

GrdPneus.Columns[1].Title.Font.Style := [fsbold];
GrdPneus.Columns[2].Title.Alignment := taCenter;
GrdPneus.Columns[3].Title.Alignment := taCenter;
GrdPneus.Columns[3].Title.Font.Style := [fsbold];
GrdPneus.Columns[4].Title.Alignment := taCenter;
GrdPneus.Columns[5].Title.Alignment := taCenter;

if (Column.Field.FieldName = 'POSICAO') then
  begin
    if Column.Field.IsNull = False then
      GrdPneus.Canvas.Brush.Color := $00DFDFDF;
  end;
if (Column.Field.FieldName = 'STATUS') then
  begin
    if Column.Field.IsNull = False then
      GrdPneus.Canvas.Brush.Color := $00DFDFDF;
  end;
if (Column.Field.FieldName = 'INSTALADO') then
  begin
    if Column.Field.IsNull = False then
      GrdPneus.Canvas.Brush.Color := $00DFDFDF;
  end;

if (Column.Field.FieldName = 'LIMRODAGEM') then
  begin
    if Column.Field.IsNull = False then
      begin
        if GrdPneus.DataSource.DataSet.FieldByName('LIMRODAGEM').AsFloat <= 0 then
          begin
            GrdPneus.Canvas.Brush.Color := clYellow;
            GrdPneus.Canvas.Font.Color  := clRed;
          end;
        if (DM.qryPneusChassiPosicoesTIPO.AsString <> '') and (DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat > 0) then
          begin
            if DM.qryPneusChassiPosicoesRODADOS.AsFloat > DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat then
              begin
                GrdPneus.Canvas.Brush.Color := clRed;
                GrdPneus.Canvas.Font.Color  := clWhite;
              end;
          end;

      end;
  end;

GrdPneus.Canvas.FillRect(Rect);
GrdPneus.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmTelaCadPneusChassi.GrdPneusKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if (GrdPneus.SelectedIndex = 1) and (Key = #13) then
  begin
    if DM.qryPneusChassiPosicoes.IsEmpty = True then Exit;
    if DM.FAlterando = False then
      begin
        BtnSalvar.OnClick(Sender);
        Abort;
      end;

    DM.FTabela_auxiliar  := 8300;
    DM.FNomeConsulta := 'Pneus';
    DM.FParamAuxiliar[1] := DM.qryPneusChassiTIPO.AsString;
    DM.qryPneusChassiPosicoes.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPneus.Close;
        DM.qryPneus.Params[0].AsString := DM.FCodCombo;
        DM.qryPneus.Params[1].AsString := DM.FCodEmpresa;
        DM.qryPneus.Open;

        if DM.qryPneusQUANTIDADE.AsInteger > 0 then
          begin
            DM.qryPneusChassiPosicoesCODPNEU.AsString := DM.FCodCombo;
            DM.qryPneusChassiPosicoesTIPO.AsString    := DM.FValorCombo;
            DM.qryPneusChassiPosicoesSTATUS.AsString  := DM.FParamAuxiliar[2];
          end
        else
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'PNEU NÃO DISPONÍVEL NO ESTOQUE!';
          end
      end;
  end
else
if (GrdPneus.SelectedIndex = 3) and (Key <> #13) and (Key <> #9) then
  begin
    Key := #0;
  end
else
if (GrdPneus.SelectedIndex = 3) and (Key = #13) then
  begin
    if DM.qryPneusChassiPosicoesID.AsInteger = 0 then
      begin
        Instalar1.Enabled := True;
        Remover1.Enabled  := False;
        Cancelar1.Enabled := False;
      end
    else
      begin
        Instalar1.Enabled := False;
        Remover1.Enabled  := True;
        Cancelar1.Enabled := True;
      end;

    PopupMenuID.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TFrmTelaCadPneusChassi.Instalar1Click(Sender: TObject);
var
Texto: Pchar;
//num: integer;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if DM.qryPneusChassiPosicoesTIPO.AsString = '' then
  begin
    GrdPneus.SelectedIndex := 1;
    Exit;
  end;

Texto := PChar('CONFIRMA O CONTADOR: '+QuotedStr(DM.qryPneusChassiCONTADOR.AsString)+' DO ' + CBTipo.Text + ' ?');
if Application.MessageBox(Texto,'SPMPWeb', MB_YESNO + MB_ICONWARNING) = IDNo then Exit;

DM.MSGAguarde('');

DM.qryPneusChassiPneus.Filter   := 'CODPNEU = '+QuotedStr(DM.qryPneusChassiPosicoesCODPNEU.AsString) + ' AND POSICAO = NULL';
DM.qryPneusChassiPneus.Filtered := True;

Try
  Application.CreateForm(TFrmTelaCadPneusChassiPneus, FrmTelaCadPneusChassiPneus);
  FrmTelaCadPneusChassiPneus.ShowModal;
Finally
  if FrmTelaCadPneusChassiPneus.ModalResult = mrOk then
    begin
      if (DM.qryPneusChassiPneus.IsEmpty = False) and (FrmTelaCadPneusChassiPneus.EdtConsulta.Text = '') then
        FrmTelaCadPneusChassiPneus.EdtConsulta.Text := DM.qryPneusChassiPneusID.AsString;

      CDPneusCad.first;

      if (DM.qryPneusChassiPneusSTATUS.AsString = 'REPARO') or (DM.qryPneusChassiPneusSTATUS.AsString = 'EXCLUIDO') then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'PNEU NÃO DISPONÍVEL: ' + QuotedStr(DM.qryPneusChassiPneusSTATUS.AsString);
        end
      else
      //Foi informado um ID na tela de pneus que não existe (Pneu Novo)
      if CDPneusCad.Locate('ID', FrmTelaCadPneusChassiPneus.EdtConsulta.Text, []) = False then
        begin
          DM.qryPneus.Close;
          DM.qryPneus.Params[0].AsString := DM.qryPneusChassiPosicoesCODPNEU.AsString;
          DM.qryPneus.Params[1].AsString := DM.FCodEmpresa;
          DM.qryPneus.Open;
          DM.qryPneus.Edit;
          DM.qryPneusQUANTIDADE.AsInteger := DM.qryPneusQUANTIDADE.AsInteger - 1;
          DM.qryPneus.Post;

          DM.qryPneusChassiPosicoes.Edit;
          DM.qryPneusChassiPosicoesID.AsInteger         := FIDPneu;
          DM.qryPneusChassiPosicoesINSTALADO.AsDateTime := DM.FDataHoraServidor;
          DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat   := 0;
          DM.qryPneusChassiPosicoes.Post;

//          randomize;
//          num := Round(random(99999)); // 99999 é o limite do numero randomico
//          DM.qryPneusChassiPneusCODIGO.AsInteger     := num;

          DM.qryPneusChassiPneus.Append;
//          DM.qryPneusChassiPneusCODIGO.AsInteger    := DM.RetornaProximoIndice('pneusmontagemchassipneus');
          DM.qryPneusChassiPneusCODEMPRESA.AsString := DM.qryPneusChassiPosicoesCODEMPRESA.AsString;
          DM.qryPneusChassiPneusCODCHASSI.AsString  := DM.qryPneusChassiPosicoesCODCHASSI.AsString;
          DM.qryPneusChassiPneusCODPNEU.AsString    := DM.qryPneusChassiPosicoesCODPNEU.AsString;
          DM.qryPneusChassiPneusID.AsInteger        := DM.qryPneusChassiPosicoesID.AsInteger;
          DM.qryPneusChassiPneusRODADOS.AsInteger   := 0;
          DM.qryPneusChassiPneusPOSICAO.AsString    := DM.qryPneusChassiPosicoesPOSICAO.AsString;
          DM.qryPneusChassiPneusSTATUS.AsString     := 'NOVO';
          DM.qryPneusChassiPneusCONTADOR.AsString   := DM.qryPneusChassiCONTADOR.AsString;
          DM.qryPneusChassiPneusCUSTO.AsFloat       := DM.qryPneusPRECO.AsFloat;
          DM.qryPneusChassiPneusINSTALADO.AsString  := DM.qryPneusChassiPosicoesINSTALADO.AsString;
          DM.qryPneusChassiPneusPNEU.AsString       := DM.qryPneusChassiPosicoesTIPO.AsString;
          DM.qryPneusChassiPneusEQUIPAMENTO.AsString:= DM.qryPneusChassiEQUIPAMENTO.AsString;
          DM.qryPneusChassiPneus.Post;

          DM.qryPneusChassiPneus.Filtered := False;

          AlimentaHistorico('INSTALADO');

          CDPneusCad.Append;
          CDPneusCadID.AsString := DM.qryPneusChassiPneusID.AsString;
          CDPneusCadSTATUS.AsString := DM.qryPneusChassiPneusSTATUS.AsString;
          CDPneusCad.Post;

          GrdPneus.SelectedIndex := 5;
          DM.qryPneus.Close;
        end
      else
      if CDPneusCad.Locate('ID;STATUS', VarArrayOf([FrmTelaCadPneusChassiPneus.EdtConsulta.Text, 'NOVO']), []) = True then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'PNEU JÁ EXISTENTE!';
        end
      else
      if (DM.qryPneusChassiPneusPNEU.AsString <> '') and (DM.qryPneusChassiPneusPNEU.AsString <> DM.qryPneusChassiPosicoesTIPO.AsString) or (DM.qryPneusChassiPneusPNEU.AsString = '' ) then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'TIPO DE PNEU INCOMPATÍVEL!';
        end
      //Foi informado um ID de um pneu usado
      else
        begin
          if DM.qryPneusChassiPneusEQUIPAMENTO.AsString <> '' then
            begin
              PAuxiliares.Font.Color := clRed;
              PAuxiliares.Caption := 'PNEU JÁ INSTALADO: '+ DM.qryPneusChassiPneusEQUIPAMENTO.AsString;
            end
          else
            begin
              DM.qryPneusChassiPosicoes.Edit;
              DM.qryPneusChassiPosicoesID.AsInteger         := FIDPneu;
              DM.qryPneusChassiPosicoesINSTALADO.AsDateTime := DM.FDataHoraServidor;
              DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat   := 0;
              DM.qryPneusChassiPosicoes.Post;

              DM.qryPneusChassiPneus.Filtered := False;

              DM.qryPneusChassiPneus.Edit;
              DM.qryPneusChassiPneusPOSICAO.AsString   := DM.qryPneusChassiPosicoesPOSICAO.AsString;
              DM.qryPneusChassiPneusCONTADOR.AsString  := DM.qryPneusChassiCONTADOR.AsString;
              DM.qryPneusChassiPneusINSTALADO.AsString := DM.qryPneusChassiPosicoesINSTALADO.AsString;
              DM.qryPneusChassiPneus.Post;

              AlimentaHistorico('INSTALADO');

              GrdPneus.SelectedIndex := 5;
            end;
        end;
    end;

    FreeAndNil(FrmTelaCadPneusChassiPneus);
    DM.qryPneusChassiPneus.Filtered := False;
    //DM.qryPneusChassiPneus.Close;
    //DM.qryPneusChassiPneus.Open;
    DM.MSGAguarde('', False);
  end;
end;

procedure TFrmTelaCadPneusChassi.BuscarPneus(Chassi:String);
var
I:SmallInt;
begin
while not DM.qryPneusChassiPosicoes.IsEmpty = True do
  DM.qryPneusChassiPosicoes.Delete;

if (Chassi = 'Pick-Up/Caminhão C/Diferencial Frontal') or (Chassi = 'Pick-Up/Caminhão C/Diferencial Duplo')
  or (Chassi = 'Cavalo Mecânico C/Diferencial Frontal') or (Chassi = 'Cavalo Mecânico C/Diferencial Duplo')
    or (Chassi = 'Ônibus C/ 3 Eixos') or (Chassi = 'Pick-Up/Caminhão C/Diferencial Triplo')
      or (Chassi = 'Cavalo Mecânico C/2 Eixos C/Diferencial Frontal') or (Chassi = 'Cavalo Mecânico C/2 Eixos C/Diferencial Trazeiro') then
        begin
          if DM.qryPneusChassiPosicoes.RecordCount < 4 then
            begin
              for I := 1 to 14 do
                begin
                  if I = 1 then DM.qryPneusChassiPosicoes.Edit
                  else DM.qryPneusChassiPosicoes.Append;
                  DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//                  DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
                  DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

                  if I = 1  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Direito';
                  if I = 2  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Esquerdo';

                  if (Chassi = 'Cavalo Mecânico C/2 Eixos C/Diferencial Frontal') or (Chassi = 'Cavalo Mecânico C/2 Eixos C/Diferencial Trazeiro') then
                    begin
                      if I = 3  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito';
                      if I = 4  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo';
                      if I = 5  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Direito Externo';
                      if I = 6  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Esquerdo Externo';
                      if I = 7  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Direito Interno';
                      if I = 8 then DM.qryPneusChassiPosicoesPOSICAO.AsString  := '3° Eixo Tras. Lado Esquerdo Interno';
                      if (Chassi = 'Cavalo Mecânico C/2 Eixos C/Diferencial Frontal') then
                        begin
                          if I = 9 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Direito Externo';
                          if I = 10 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Esquerdo Externo';
                          if I = 11 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Direito Interno';
                          if I = 12 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Esquerdo Interno';
                        end;
                    end
                  else
                    begin
                      if I = 3  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Externo';
                      if I = 4  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Externo';
                      if I = 5  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Interno';
                      if I = 6  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Interno';
                      if I = 7  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Direito Externo';
                      if I = 8  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Esquerdo Externo';
                      if I = 9  then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Direito Interno';
                      if I = 10 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Esquerdo Interno';
                    end;

                  if (Chassi = 'Pick-Up/Caminhão C/Diferencial Triplo') then
                    begin
                      if I = 11 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Direito Externo';
                      if I = 12 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Esquerdo Externo';
                      if I = 13 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Direito Interno';
                      if I = 14 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '4° Eixo Tras. Lado Esquerdo Interno';
                    end;

                  DM.qryPneusChassiSTATUS.AsString := 'ATIVO';

                  if DM.qryPneusChassiPosicoesPOSICAO.AsString = '' then DM.qryPneusChassiPosicoes.Cancel
                  else DM.qryPneusChassiPosicoes.Post;
                end;
            end;
        end;

if (Chassi = 'Pick-Up/Caminhão C/Diferencial Trazeiro') or (Chassi = 'Cavalo Mecânico C/Diferencial Trazeiro') or (Chassi = 'Ônibus C/ 2 Eixos') then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 6 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Direito';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Esquerdo';

            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Externo';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Externo';
            if I = 5 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Interno';
            if I = 6 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Interno';

            DM.qryPneusChassiSTATUS.AsString := 'ATIVO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;

if Chassi = 'Carregadeira de Pneus' then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 4 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Direito';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Esquerdo';

            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Direito';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Esquerdo';

            DM.qryPneusChassiSTATUS.AsString := 'ATIVO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;

if (Chassi = 'Carro de Passeio C/Diferencial Frontal') or (Chassi = 'Carro de Passeio C/Diferencial Trazeiro') or (Chassi = 'Carro de Passeio C/Diferencial Duplo') then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 4 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Direito';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Esquerdo';

            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Direito';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Esquerdo';

            DM.qryPneusChassiSTATUS.AsString := 'ATIVO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;

if (Chassi = 'Carroceria de Carreta C/ 1 Eixo') then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 4 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            DM.qryPneusChassiCONTADOR.AsInteger          := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Direito Externo';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Esquerdo Externo';
            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Direito Interno';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Esquerdo Interno';

            DM.qryPneusChassiSTATUS.AsString := 'PARADO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;

if (Chassi = 'Carroceria de Carreta C/ 2 Eixos') then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 8 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            DM.qryPneusChassiCONTADOR.AsInteger          := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Direito Externo';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Esquerdo Externo';
            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Direito Interno';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Esquerdo Interno';

            if I = 5 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Externo';
            if I = 6 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Externo';
            if I = 7 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Interno';
            if I = 8 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Interno';

            DM.qryPneusChassiSTATUS.AsString := 'PARADO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;

if (Chassi = 'Carroceria de Carreta C/ 3 Eixos') then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 12 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            DM.qryPneusChassiCONTADOR.AsInteger          := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Direito Externo';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Esquerdo Externo';
            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Direito Interno';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1° Eixo Tras. Lado Esquerdo Interno';

            if I = 5 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Externo';
            if I = 6 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Externo';
            if I = 7 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Direito Interno';
            if I = 8 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Tras. Lado Esquerdo Interno';

            if I = 9 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Direito Externo';
            if I = 10 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Esquerdo Externo';
            if I = 11 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Direito Interno';
            if I = 12 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Tras. Lado Esquerdo Interno';

            DM.qryPneusChassiSTATUS.AsString := 'PARADO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;

if (Chassi = 'Patrol') then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 6 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Direito';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Esquerdo';

            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Direito';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Esquerdo';

            if I = 5 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Traseiro Lado Direito';
            if I = 6 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '3° Eixo Traseiro Lado Esquerdo';

            DM.qryPneusChassiSTATUS.AsString := 'ATIVO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;

if (Chassi = 'Trator') then
  begin
    if DM.qryPneusChassiPosicoes.RecordCount < 4 then
      begin
        for I := 1 to 4 do
          begin
            if I = 1 then DM.qryPneusChassiPosicoes.Edit
            else DM.qryPneusChassiPosicoes.Append;
            DM.qryPneusChassiPosicoesCODEMPRESA.AsString := DM.FCodEmpresa;
//            DM.qryPneusChassiPosicoesCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
            DM.qryPneusChassiPosicoesLIMRODAGEM.AsFloat  := 0;

            if I = 1 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Direito';
            if I = 2 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '1º Eixo Dianteiro Lado Esquerdo';

            if I = 3 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Direito';
            if I = 4 then DM.qryPneusChassiPosicoesPOSICAO.AsString := '2° Eixo Traseiro Lado Esquerdo';

            DM.qryPneusChassiSTATUS.AsString := 'ATIVO';

            DM.qryPneusChassiPosicoes.Post;
          end;
      end;
  end;
DM.qryPneusChassiPosicoes.First;
end;

function TFrmTelaCadPneusChassi.MotivoRetiradaInputBox(const ACaption, APrompt:string): string;
var
Form: TForm; Prompt: TLabel; Combobox: TComboBox; DialogUnits: TPoint; ButtonTop, ButtonWidth, ButtonHeight: Integer;
Value: string; I: Integer; Buffer: array[0..51] of Char;
begin
  Result := EmptyStr; Form := TForm.Create(Application);
  with Form do
    Try
      Canvas.Font := Font;
      For I := 0 to 25 do Buffer[I] := Chr(I + Ord('A')); For I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits)); DialogUnits.X := DialogUnits.X div 52; BorderStyle := bsDialog;
      Caption := ACaption; ClientWidth := MulDiv(180, DialogUnits.X, 4); ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter; Prompt := TLabel.Create(Form);
      with Prompt do
        begin
         Parent := Form; AutoSize := True; Left := MulDiv(8, DialogUnits.X, 4);
         Top := MulDiv(8, DialogUnits.Y, 8); Caption := APrompt;
        end;
      Combobox := TComboBox.Create(Form);
      with Combobox do
        begin
         Parent := Form; Left := Prompt.Left; Top := MulDiv(19, DialogUnits.Y, 8); Width := MulDiv(164, DialogUnits.X, 4);
         Combobox.Items.Add('Troca'); Combobox.Items.Add('Desgaste'); Combobox.Items.Add('Defeito'); Combobox.Items.Add('Furo');
         Combobox.Items.Add('Estouro'); Combobox.Items.Add('Fim da vida útil');
         Combobox.Style := csDropDownList; Combobox.ItemIndex := 0;
         //SelectAll;
        end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8); ButtonWidth := MulDiv(50, DialogUnits.X, 4); ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
        begin
         Parent := Form; Caption := 'OK'; ModalResult := mrOk; Default := True;
         SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      with TButton.Create(Form) do
        begin
         Parent := Form; Caption := 'Cancel'; ModalResult := mrCancel; Cancel := True;
         SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
        end;
      if ShowModal = mrOk then
        begin
         Value  := Combobox.Text; Result := Value;
        end;
    Finally
      FreeAndNil(Form);
    End;
end;

procedure TFrmTelaCadPneusChassi.AlimentaHistorico(Operacao:string);
begin
//DM.qryPneusChassiPneusHist.Open;
DM.qryPneusChassiPneusHist.Append;
DM.qryPneusChassiPneusHistCODCHASSI.AsInteger  := DM.qryPneusChassiCODIGO.AsInteger;
DM.qryPneusChassiPneusHistCODEMPRESA.AsString  := DM.FCodEmpresa;
DM.qryPneusChassiPneusHistEQUIPAMENTO.AsString := DM.qryPneusChassiEQUIPAMENTO.AsString;
DM.qryPneusChassiPneusHistPOSICAO.AsString     := DM.qryPneusChassiPosicoesPOSICAO.AsString;
DM.qryPneusChassiPneusHistCODPNEU.AsString     := DM.qryPneusChassiPosicoesCODPNEU.AsString;
DM.qryPneusChassiPneusHistCODEMPRESA.AsString  := DM.FCodEmpresa;
DM.qryPneusChassiPneusHistID.AsInteger         := DM.qryPneusChassiPosicoesID.AsInteger;
DM.qryPneusChassiPneusHistPOSICAO.AsString     := DM.qryPneusChassiPosicoesPOSICAO.AsString;
DM.qryPneusChassiPneusHistCODPNEU.AsString     := DM.qryPneusChassiPosicoesCODPNEU.AsString;
DM.qryPneusChassiPneusHistDATA.AsDateTime      := DateOf(DM.FDataHoraServidor);
if DM.qryPneusChassiCONTADOR.AsInteger > DM.qryPneusChassiPneusCONTADOR.AsInteger then
  begin
    DM.qryPneusChassiPneus.Edit;
    DM.qryPneusChassiPneusRODADOS.AsInteger   := DM.qryPneusChassiPneusRODADOS.AsInteger + (DM.qryPneusChassiCONTADOR.AsInteger - DM.qryPneusChassiPneusCONTADOR.AsInteger);
    DM.qryPneusChassiPneusCONTADOR.AsInteger  := DM.qryPneusChassiCONTADOR.AsInteger;
    DM.qryPneusChassiPneus.Post;
  end;
DM.qryPneusChassiPneusHistRODAGEM.AsInteger   := DM.qryPneusChassiPneusRODADOS.AsInteger;
DM.qryPneusChassiPneusHistCONTADOR.AsString   := DM.qryPneusChassiCONTADOR.AsString;
DM.qryPneusChassiPneusHistMOTIVO.AsString     := FMotivo;
DM.qryPneusChassiPneusHistOPERACAO.AsString   := Operacao;
DM.qryPneusChassiPneusHistSTATUS.AsString     := DM.qryPneusChassiPneusSTATUS.AsString;
DM.qryPneusChassiPneusHistCUSTO.AsFloat       := DM.qryPneusChassiPneusCUSTO.AsFloat;
DM.qryPneusChassiPneusHist.Post;
DM.qryPneusChassi.Edit;
DM.qryPneusChassi.Post;
DM.qryPneusChassi.Edit;
//DM.qryPneusChassiPneusHist.Close;
end;

end.








































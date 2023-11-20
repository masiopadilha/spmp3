unit UnTelaCadPontoInspecao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadPontoInspecao = class(TFrmTelaPaiParametros)
    PCPontos: TPageControl;
    TSPontos: TTabSheet;
    TSLocais: TTabSheet;
    BtnFamiliaEquip: TButton;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    EdtFamiliaEquip: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    EdtDescLocal: TDBEdit;
    Label4: TLabel;
    EdtProgramacao: TDBEdit;
    BtnProgramacao: TButton;
    Label5: TLabel;
    CBLeitura: TDBComboBox;
    Label15: TLabel;
    EdtUnidade: TDBEdit;
    Label16: TLabel;
    EdtLimInfMax: TDBEdit;
    Label17: TLabel;
    EdtLimInfSeg: TDBEdit;
    Label18: TLabel;
    EdtLimSupSeg: TDBEdit;
    Label19: TLabel;
    EdtLimSupMax: TDBEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PCPontosChange(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnFamiliaEquipClick(Sender: TObject);
    procedure BtnProgramacaoClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPontoInspecao: TFrmTelaCadPontoInspecao;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnTelaCadFamiliaEquipamento, UnDM;

procedure TFrmTelaCadPontoInspecao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadPontoInspecao.BtnConsultarClick(Sender: TObject);
begin
case PCPontos.TabIndex of
  0:
    begin
      DM.FDataSetParam    := DM.qryPontosInspecao;
      DM.FDataSourceParam := DM.dsPontosInspecao;
      DM.FTabela_auxiliar := 47;
    end;
  1:
    begin
      DM.FDataSetParam    := DM.qryPontosInspecaoLoc;
      DM.FDataSourceParam := DM.dsPontosInspecaoLoc;
      DM.FParamAuxiliar[1] := DM.qryPontosInspecaoCODIGO.AsString;
      DM.FTabela_auxiliar := 90;
      if DM.qryPontosInspecaoCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUM PONTO DE INSPEÇÃO SELECIONADO!!!';
          Exit;
        end;
    end;
end;
  inherited;
end;

procedure TFrmTelaCadPontoInspecao.BtnExcluirClick(Sender: TObject);
begin
case PCPontos.ActivePageIndex of
  0: inherited;
  1:
  begin
    if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
        Exit;
      end;
  end;
end;
end;

procedure TFrmTelaCadPontoInspecao.BtnFamiliaEquipClick(Sender: TObject);
begin
  inherited;
if DM.qryPontosInspecao.Active = False then Exit;
if DM.qryPontosInspecao.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    DM.qryPontosInspecao.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPontosInspecaoCODFAMILIAEQUIP.AsString := DM.FCodCombo;
        DM.qryPontosInspecaoFAMILIAEQUIP.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFamiliaEquipamento,FrmTelaCadFamiliaEquipamento);
      FrmTelaCadFamiliaEquipamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFamiliaEquipamento);
    End;
  end;
DM.FDataSetParam    := DM.qryPontosInspecao;
DM.FDataSourceParam := DM.dsPontosInspecao;
DM.FTela            := 'CADPONTOSINSPECAO';
DM.FTabela_auxiliar := 47;
end;

procedure TFrmTelaCadPontoInspecao.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 47;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBPontosInspecao;
end;

procedure TFrmTelaCadPontoInspecao.BtnNovoClick(Sender: TObject);
begin
//  inherited;
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

case PCPontos.TabIndex of
  0: DM.FDataSetParam := DM.qryPontosInspecao;
  1: DM.FDataSetParam := DM.qryPontosInspecaoLoc;
end;

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

case PCPontos.TabIndex of
  0:
    begin
      DM.FTabela_auxiliar := 47;

      DM.FDataSetParam.Open;
      DM.FDataSetParam.Append();

      DM.qryPontosInspecaoCODEMPRESA.AsString      := DM.FCodEmpresa;
      DM.qryPontosInspecaoDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
      DM.qryPontosInspecaoDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
      DM.qryPontosInspecaoCODUSUARIOCAD.AsString   := DM.FCodUsuario;
      DM.qryPontosInspecaoCODUSUARIOALT.AsString   := DM.FCodUsuario;

      EdtCodigo.ReadOnly := False;
      EdtCodigo.SetFocus;

      PAuxiliares.Font.Color := clBlue;
      PAuxiliares.Caption := 'NOVO REGISTRO';
      DM.FAlterando := False;
      ControleBotoes(1);
      BtnSalvar.ImageName := 'Operacional\salvar';
    end;
  1:
    begin
      DM.FTabela_auxiliar := 90;
      if DM.qryPontosInspecaoCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'ESCOLHA O PONTO DE INSPEÇÃO!';
          Exit;
        end;

      DM.FDataSetParam.Open;
      DM.FDataSetParam.Append();

//      DM.qryPontosInspecaoLocCODIGO.AsInteger      := DM.qryPontosInspecaoLoc.RecordCount + 1;
      DM.qryPontosInspecaoLocCODPONTOINSP.AsString := DM.qryPontosInspecaoCODIGO.AsString;
      DM.qryPontosInspecaoLocCODEMPRESA.AsString   := DM.FCodEmpresa;

      EdtDescLocal.ReadOnly := False;
      EdtDescLocal.SetFocus;

      PAuxiliares.Font.Color := clBlue;
      PAuxiliares.Caption := 'NOVO REGISTRO';
      DM.FAlterando := False;
      ControleBotoes(1);
      BtnSalvar.ImageName := 'Operacional\salvar';
    end;
end;
end;

procedure TFrmTelaCadPontoInspecao.BtnProgramacaoClick(Sender: TObject);
begin
  inherited;
if DM.qryPontosInspecaoLoc.Active = False then Exit;
if DM.qryPontosInspecaoLoc.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 120;
    DM.FNomeConsulta := 'Tipos de Programação';
    DM.qryPontosInspecaoLoc.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryPontosInspecaoLocCODTIPOPROGRAMACAO.AsString := DM.FCodCombo;
        DM.qryPontosInspecaoLocTIPOPROGRAMACAO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFamiliaEquipamento,FrmTelaCadFamiliaEquipamento);
      FrmTelaCadFamiliaEquipamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFamiliaEquipamento);
    End;
  end;
DM.FDataSetParam    := DM.qryPontosInspecao;
DM.FDataSourceParam := DM.dsPontosInspecao;
DM.FTela            := 'CADPONTOSINSPECAO';
DM.FTabela_auxiliar := 47;
end;

procedure TFrmTelaCadPontoInspecao.BtnSalvarClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';
PControle.SetFocus;

if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    Exit;
  end;

case PCPontos.TabIndex of
  0:
    begin
      if DM.qryPontosInspecaoCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
          EdtCodigo.SetFocus;
          Exit;
        end;
        DM.FTabela_auxiliar := 47;
        if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
          begin
            EdtCodigo.SetFocus;
            PAuxiliares.Font.Color := clBlack;
            PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
            Exit;
          end;
      if DM.qryPontosInspecaoDESCRICAO.IsNull = True then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
          EdtDescricao.SetFocus;
          Exit;
        end;
      if DM.qryPontosInspecaoCODFAMILIAEQUIP.IsNull = True then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME A FAMÍLIA DO REGISTRO!';
          EdtDescricao.SetFocus;
          Exit;
        end;

      DM.MSGAguarde('');

      DM.qryPontosInspecao.Params[0].AsString := DM.qryPontosInspecaoCODIGO.AsString;
      DM.qryPontosInspecao.Params[1].AsString := DM.FCodEmpresa;

      DM.qryPontosInspecaoDATAULTALT.AsDateTime  := DM.FDataHoraServidor;
      DM.qryPontosInspecaoCODUSUARIOALT.AsString := DM.FCodUsuario;
      DM.qryPontosInspecaoUSUARIOALT.AsString    := DM.FNomeUsuario;
      DM.qryPontosInspecao.Post;
      DM.qryPontosInspecao.Edit;

      DM.MSGAguarde('', False);

      PAuxiliares.Font.Color := clGreen;
      PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
      DM.FAlterando := True;
      ControleBotoes(2);
      BtnSalvar.ImageName := 'Operacional\salvar';
    end;
  1:
    begin
      if DM.qryPontosInspecaoLoc.IsEmpty = True then Exit;

      if DM.qryPontosInspecaoLocDESCRICAO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
          EdtDescLocal.SetFocus;
          Exit;
        end;

      if DM.qryPontosInspecaoLocCODTIPOPROGRAMACAO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME A PROGRAMAÇÃO DO REGISTRO!';
          EdtProgramacao.SetFocus;
          Exit;
        end;

      if DM.qryPontosInspecaoLocEMISSAOOS.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME A LEITURA DO REGISTRO!';
          CBLeitura.SetFocus;
          Exit;
        end;

      if DM.qryPontosInspecaoLocUNIDMEDIDA.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME A UNIDADE DO REGISTRO!';
          EdtUnidade.SetFocus;
          Exit;
        end;

      if (DM.qryPontosInspecaoLocLIMINFSEG.AsFloat < DM.qryPontosInspecaoLocLIMINFMAX.AsFloat) then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := '''Limite Inferior Máximo'' superior ao limite inferior de segurança!';
          EdtLimInfMax.SetFocus;
          Exit;
        end;
      if (DM.qryPontosInspecaoLocLIMINFMAX.AsFloat > DM.qryPontosInspecaoLocLIMINFSEG.AsFloat) then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := '''Limite Inferior de Segurança'' inferior ao limite inferior máximo!';
          EdtLimInfMax.SetFocus;
          Exit;
        end;
      if (DM.qryPontosInspecaoLocLIMSUPSEG.AsFloat < DM.qryPontosInspecaoLocLIMINFMAX.AsFloat) then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := '''Limite Superior de Segurança'' inferior ao limite superior mínimo!';
          EdtLimInfMax.SetFocus;
          Exit;
        end;
      if (DM.qryPontosInspecaoLocLIMSUPMAX.AsFloat < DM.qryPontosInspecaoLocLIMSUPSEG.AsFloat) then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := '''Limite Superior Máximo'' inferior ao limite superior de segurança!';
          EdtLimInfMax.SetFocus;
          Exit;
        end;

      DM.MSGAguarde('');

      DM.qryPontosInspecaoLoc.Post;
      DM.qryPontosInspecaoLoc.Edit;

      DM.qryPontosInspecaoLoc.Params[0].AsInteger := DM.qryPontosInspecaoLocCODIGO.AsInteger;
      DM.qryPontosInspecaoLoc.Params[1].AsString := DM.FCodEmpresa;
      DM.qryPontosInspecaoLoc.Params[2].AsString := DM.qryPontosInspecaoCODIGO.AsString;

      DM.MSGAguarde('', False);

      PAuxiliares.Font.Color := clGreen;
      PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
      DM.FAlterando := True;
      ControleBotoes(2);
      BtnSalvar.ImageName := 'Operacional\salvar';
    end;
end;
end;

procedure TFrmTelaCadPontoInspecao.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 47;
  inherited;

end;

procedure TFrmTelaCadPontoInspecao.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBPontosInspecao;
end;

procedure TFrmTelaCadPontoInspecao.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadPontoInspecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryPontosInspecao.Close;
DM.qryPontosInspecaoLoc.Close;
end;

procedure TFrmTelaCadPontoInspecao.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryPontosInspecao;
DM.FDataSourceParam := DM.dsPontosInspecao;
DM.FTela := 'CADPONTOSINSPECAO';
end;

procedure TFrmTelaCadPontoInspecao.PCPontosChange(Sender: TObject);
begin
  inherited;
case PCPontos.TabIndex of
  0:
    begin
      DM.FDataSetParam := DM.qryPontosInspecao;
    end;
  1:
    begin
      DM.FDataSetParam := DM.qryPontosInspecaoLoc;
    end;
end;
end;

end.


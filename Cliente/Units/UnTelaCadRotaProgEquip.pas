unit UnTelaCadRotaProgEquip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvDBControls, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadRotaProgEquip = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodRota: TDBEdit;
    EdtDescricao: TDBEdit;
    Label17: TLabel;
    Label8: TLabel;
    EdtDias: TDBEdit;
    Label15: TLabel;
    Label5: TLabel;
    EdtInicio: TJvDBDateEdit;
    Label9: TLabel;
    CBReprogramacao: TDBComboBox;
    Label19: TLabel;
    GrdSequencia: TDBGrid;
    CDValidaEquip: TClientDataSet;
    CDValidaEquipCODAREA: TStringField;
    CDValidaEquipCODCELULA: TStringField;
    CDValidaEquipCODLINHA: TStringField;
    CDValidaEquipSEQUENCIA: TIntegerField;
    CDValidaEquipID: TIntegerField;
    GrdInspecoes: TDBGrid;
    DBGrid1: TDBGrid;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdSequenciaKeyPress(Sender: TObject; var Key: Char);
    procedure GrdSequenciaDblClick(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodRotaExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadRotaProgEquip: TFrmTelaCadRotaProgEquip;
  LDataProgIni : TDateTime;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadRotaProgEquip.BtnCancelarClick(Sender: TObject);
begin
EdtCodRota.ReadOnly := True;
DM.qryRotasSequencia.Cancel;
  inherited;
end;

procedure TFrmTelaCadRotaProgEquip.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if DM.qryRotasCODIGO.AsString = '' then Exit;

DM.qryRotasSequencia.Open;
DM.qryRotasSequenciaInsp.Open;
DM.qryRotasSequenciaInspItens.Open;
DM.qryRotasSequenciaInspItensEsp.Open;

if DM.qryRotasDATAINICIO.AsString <> EmptyStr then
  begin
    LDataProgIni := DM.qryRotasDATAINICIO.AsDateTime;
    DM.qryRotasRELATORIO.AsString := 'N';
  end;

CDValidaEquip.Close; CDValidaEquip.CreateDataSet;
while not DM.qryRotasSequencia.Eof = True do
  begin
    CDValidaEquip.Append;
    CDValidaEquipID.AsInteger       := CDValidaEquip.RecordCount + 1;
    CDValidaEquipCODAREA.AsString   := DM.qryRotasSequenciaCODAREA.AsString;
    CDValidaEquipCODCELULA.AsString := DM.qryRotasSequenciaCODCELULA.AsString;
    CDValidaEquipCODLINHA.AsString  := DM.qryRotasSequenciaCODLINHA.AsString;
    CDValidaEquipSEQUENCIA.AsString := DM.qryRotasSequenciaSEQUENCIA.AsString;
    CDValidaEquip.Post;

    DM.qryRotasSequencia.Next;
  end;
DM.qryRotasSequencia.First;
end;

procedure TFrmTelaCadRotaProgEquip.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryRotasSequencia.First;
while not DM.qryRotasSequencia.Eof = True do
  begin
    if (DM.qryRotasSequenciaCODAREA.AsString <> '') and (DM.qryRotasSequenciaCODCELULA.AsString <> '')
      and (DM.qryRotasSequenciaCODCELULA.AsString <> '') and (DM.qryRotasSequenciaSEQUENCIA.AsString <> '') then
        begin
          DM.qryRotasSequenciaInsp.First;
          while not DM.qryRotasSequenciaInsp.Eof = True do
            begin
              if DM.qryRotasSequenciaInspGRUPOINSP.AsString = 'N' then
                begin
                  DM.qryRotasSequenciaInsp.Edit;
                  DM.qryRotasSequenciaInspGRUPOINSP.AsString    := 'N';
                  DM.qryRotasSequenciaInspRELATORIO.AsString    := 'N';
                  DM.qryRotasSequenciaInsp.Post;
                end;
              DM.qryRotasSequenciaInsp.Next;
            end;
        end
    else
      begin
        DM.qryRotasSequencia.Delete;
      end;
    DM.qryRotasSequencia.Next;
  end;

if DM.qryRotas.IsEmpty = True then
  begin
    DM.qryRotasSequencia.Close;
    DM.qryRotasSequenciaInsp.Close;
    DM.qryRotasSequenciaInspItens.Close;
    DM.qryRotasSequenciaInspItensEsp.Close;
  end;
end;

procedure TFrmTelaCadRotaProgEquip.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryRotasCODEMPRESA.AsString     := DM.FCodEmpresa;
DM.qryRotasDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
DM.qryRotasDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
DM.qryRotasCODUSUARIOCAD.AsString  := DM.FCodUsuario;
DM.qryRotasCODUSUARIOALT.AsString  := DM.FCodUsuario;
DM.qryRotasRELATORIO.AsString      := 'N';

if DM.qryRotasSequencia.Active = False then DM.qryRotasSequencia.Open;
if DM.qryRotasSequenciaInsp.Active = False then DM.qryRotasSequenciaInsp.Open;
if DM.qryRotasSequenciaInspItens.Active = False then DM.qryRotasSequenciaInspItens.Open;
if DM.qryRotasSequenciaInspItensEsp.Active = False then DM.qryRotasSequenciaInspItensEsp.Open;

EdtCodRota.ReadOnly := False;
EdtCodRota.SetFocus;
end;

procedure TFrmTelaCadRotaProgEquip.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryRotasCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodRota.SetFocus; Exit;
  end;
if (DM.VerificaDuplo(EdtCodRota.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodRota.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryRotasDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if (DM.qryRotasFREQUENCIA.IsNull = True) or (DM.qryRotasFREQUENCIA.AsInteger <= 0) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FREQUÊNCIA DO REGISTRO!'; EdtDias.SetFocus; Exit;
  end;
if DM.qryRotasREPROGRAMAR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A REPROGRAMAÇÃO DO REGISTRO!'; CBReprogramacao.SetFocus; Exit;
  end;
if DM.qryRotasSequencia.IsEmpty = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME UM EQUIPAMENTO NA ROTA!'; GrdSequencia.SetFocus; Exit;
  end;

//Se alterar a data de início
if LDataProgIni <> 0 then
  begin
    if LDataProgIni <> DM.qryRotasDATAINICIO.AsDateTime then
      begin
        DM.qryRotas.Edit;
        DM.qryRotasRELATORIO.AsString := 'N';

//        if DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Programação' then //Processo normal, irá vencer na data informada independente de qualquer coisa
//          begin
//            DM.qryManutProgEquip.Edit;
//            DM.qryManutProgEquipRELATORIO.AsString := 'N'
//          end;
//        if DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Execução' then
//          begin
//            if DM.qryManutProgEquipRELATORIO.AsString = 'S' then
//              Application.MessageBox('A manutenção será reprogramada apenas após o fechamento de todas as manutenções anteriores a essa ainda não fechadas!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
//          end;
      end;
  end;


EdtCodRota.ReadOnly := True;

DM.MSGAguarde('');

DM.qryRotas.Params[0].AsString := EdtCodRota.Text;
DM.qryRotas.Params[1].AsString := DM.FCodEmpresa;

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

DM.qryRotasSequencia.First;
while not DM.qryRotasSequencia.Eof = True do
  begin
    if (DM.qryRotasSequenciaCODAREA.AsString <> '') and (DM.qryRotasSequenciaCODCELULA.AsString <> '')
      and (DM.qryRotasSequenciaCODCELULA.AsString <> '') and (DM.qryRotasSequenciaSEQUENCIA.AsString <> '') then
        begin
          DM.qryRotasSequenciaInsp.First;
          while not DM.qryRotasSequenciaInsp.Eof = True do
            begin
              if DM.qryRotasSequenciaInspGRUPOINSP.AsString = 'N' then
                begin
                  DM.qryRotasSequenciaInsp.Edit;
                  DM.qryRotasSequenciaInspGRUPOINSP.AsString    := 'S';
                  DM.qryRotasSequenciaInspREPROGRAMAR1.AsString := DM.qryRotasREPROGRAMAR.AsString;
                  DM.qryRotasSequenciaInspDTAINICIO1.AsString   := DM.qryRotasDATAINICIO.AsString;
                  DM.qryRotasSequenciaInspRELATORIO.AsString    := DM.qryRotasRELATORIO.AsString;
                  DM.qryRotasSequenciaInsp.Post;
                end;
              DM.qryRotasSequenciaInsp.Next;
            end;
        end
    else
      begin
        DM.qryRotasSequencia.Delete;
      end;
    DM.qryRotasSequencia.Next;
  end;
DM.qryRotasSequencia.Edit;
DM.qryRotasSequencia.Post;
DM.qryRotasSequencia.First;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadRotaProgEquip.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBRotaGeral;
DM.FTabela_auxiliar := 84;
  inherited;

end;

procedure TFrmTelaCadRotaProgEquip.EdtCodRotaExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadRotaProgEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryRotasSequenciaInspItensEsp.Close;
DM.qryRotasSequenciaInspItens.Close;
DM.qryRotasSequenciaInsp.Close;
DM.qryRotasSequencia.Close;
DM.qryRotas.Close;
end;

procedure TFrmTelaCadRotaProgEquip.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryRotas;
DM.FDataSourceParam := DM.dsRotas;
DM.FTela := 'CADMANUTPROGEQUIP';
DM.FTabela_auxiliar := 84;
end;

procedure TFrmTelaCadRotaProgEquip.GrdSequenciaDblClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

if DM.qryRotas.IsEmpty = True then Exit;
if DM.qryRotasSequencia.IsEmpty = True then Exit;

if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
  begin
    DM.qryRotasSequencia.Delete;
    if DM.qryRotasSequenciaCODAREA.AsString = '' then Exit;
    if DM.qryRotasSequenciaCODCELULA.AsString = '' then Exit;
    if DM.qryRotasSequenciaCODLINHA.AsString = '' then Exit;
    if DM.qryRotasSequenciaSEQUENCIA.AsString = '' then Exit;
    if CDValidaEquip.Locate('CODAREA;CODCELULA;CODLINHA;SEQUENCIA', VarArrayOf([DM.qryRotasSequenciaCODAREA.AsString, DM.qryRotasSequenciaCODCELULA.AsString, DM.qryRotasSequenciaCODLINHA.AsString, DM.qryRotasSequenciaSEQUENCIA.AsString]), []) = True then CDValidaEquip.Delete;
  end;
end;

procedure TFrmTelaCadRotaProgEquip.GrdSequenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryRotasCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!'; EdtCodRota.SetFocus; Exit;
  end;
if (DM.VerificaDuplo(EdtCodRota.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodRota.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryRotasDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!'; EdtDescricao.SetFocus; Exit;
  end;
if (DM.qryRotasFREQUENCIA.IsNull = True) or (DM.qryRotasFREQUENCIA.AsInteger <= 0) then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A FREQUÊNCIA DO REGISTRO!'; EdtDias.SetFocus; Exit;
  end;
if DM.qryRotasREPROGRAMAR.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME A REPROGRAMAÇÃO DO REGISTRO!'; CBReprogramacao.SetFocus; Exit;
  end;

DM.qryRotas.Post;
DM.qryRotas.Edit;
DM.FAlterando := True;

if (GrdSequencia.SelectedIndex = 0) and (Key = #13) then
  begin
    if DM.qryRotas.IsEmpty = True then Exit;

    DM.FTabela_auxiliar  := 150;
    DM.FNomeConsulta := 'Áreas';
    DM.qryRotasSequencia.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRotasSequenciaCODEMPRESA.AsString := DM.FCodEmpresa;
        DM.qryRotasSequenciaCODAREA.AsString    := DM.FCodCombo;
        DM.qryRotasSequenciaAREA.AsString       := DM.FValorCombo;
        DM.qryRotasSequenciaCODCELULA.Clear;
        DM.qryRotasSequenciaCELULA.Clear;
        DM.qryRotasSequenciaCODLINHA.Clear;
        DM.qryRotasSequenciaLINHA.Clear;
        DM.qryRotasSequenciaSEQUENCIA.Clear;
        DM.qryRotasSequenciaEQUIPATUAL.Clear;
        DM.qryRotasSequencia.Post;
      end
    else
      DM.qryRotasSequencia.Cancel;
  end
else
if (GrdSequencia.SelectedIndex = 1) and (Key = #13) then
  begin
    if DM.qryRotas.IsEmpty = True then Exit;

    DM.FTabela_auxiliar  := 160;
    DM.FNomeConsulta := 'Células';
    DM.FParamAuxiliar[1] := DM.qryRotasSequenciaCODAREA.AsString;
    DM.qryRotasSequencia.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRotasSequenciaCODCELULA.AsString := DM.FCodCombo;
        DM.qryRotasSequenciaCELULA.AsString    := DM.FValorCombo;
        DM.qryRotasSequenciaCODLINHA.Clear;
        DM.qryRotasSequenciaLINHA.Clear;
        DM.qryRotasSequenciaSEQUENCIA.Clear;
        DM.qryRotasSequenciaEQUIPATUAL.Clear;
        DM.qryRotasSequencia.Post;
      end;
  end
else
if (GrdSequencia.SelectedIndex = 2) and (Key = #13) then
  begin
    if DM.qryRotas.IsEmpty = True then Exit;

    DM.FTabela_auxiliar  := 170;
    DM.FNomeConsulta := 'Linhas';
    DM.FParamAuxiliar[1] := DM.qryRotasSequenciaCODAREA.AsString;
    DM.FParamAuxiliar[2] := DM.qryRotasSequenciaCODCELULA.AsString;
    DM.qryRotasSequencia.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryRotasSequenciaCODLINHA.AsString := DM.FCodCombo;
        DM.qryRotasSequenciaLINHA.AsString    := DM.FValorCombo;
        DM.qryRotasSequenciaSEQUENCIA.Clear;
        DM.qryRotasSequenciaEQUIPATUAL.Clear;
        DM.qryRotasSequencia.Post;
      end;
  end
else
if (GrdSequencia.SelectedIndex = 3) and (Key = #13) then
  begin
    if DM.qryRotas.IsEmpty = True then Exit;

    DM.FTabela_auxiliar  := 180;
    DM.FNomeConsulta := 'Sequências';
    DM.FParamAuxiliar[1] := DM.qryRotasSequenciaCODAREA.AsString;
    DM.FParamAuxiliar[2] := DM.qryRotasSequenciaCODCELULA.AsString;
    DM.FParamAuxiliar[3] := DM.qryRotasSequenciaCODLINHA.AsString;
    DM.qryRotasSequencia.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        if CDValidaEquip.Active = False then
          begin
            CDValidaEquip.Close;
            CDValidaEquip.CreateDataSet;
          end;
        if CDValidaEquip.Locate('CODAREA;CODCELULA;CODLINHA;SEQUENCIA', VarArrayOf([DM.qryRotasSequenciaCODAREA.AsString, DM.qryRotasSequenciaCODCELULA.AsString, DM.qryRotasSequenciaCODLINHA.AsString, DM.FCodCombo]), []) = False then
          begin
            DM.qryRotasSequenciaSEQUENCIA.AsString  := DM.FCodCombo;
            DM.qryRotasSequenciaCODEQUIPATUAL.AsString := DM.FParamAuxiliar[4];;
            DM.qryRotasSequenciaEQUIPATUAL.AsString := DM.FValorCombo;

            CDValidaEquip.Append;
            CDValidaEquipCODAREA.AsString   := DM.qryRotasSequenciaCODAREA.AsString;
            CDValidaEquipCODCELULA.AsString := DM.qryRotasSequenciaCODCELULA.AsString;
            CDValidaEquipCODLINHA.AsString  := DM.qryRotasSequenciaCODLINHA.AsString;
            CDValidaEquipSEQUENCIA.AsString := DM.qryRotasSequenciaSEQUENCIA.AsString;
            CDValidaEquip.Post;
          end;
        DM.qryRotasSequencia.Post;
//        DM.qryRotasSequenciaInsp.Close;
//        DM.qryRotasSequenciaInsp.Open;
      end;
  end;

DM.FDataSetParam    := DM.qryRotas;
DM.FDataSourceParam := DM.dsRotas;
DM.FDataSetRelat    := DmRelatorios.frxDBRotaGeral;
DM.FTela            := 'CADMANUTPROGEQUIP';
DM.FTabela_auxiliar := 84;
end;

procedure TFrmTelaCadRotaProgEquip.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBRotaIndividual;
DM.FTabela_auxiliar := 841;
  inherited;

end;

end.

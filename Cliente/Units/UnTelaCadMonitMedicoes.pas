unit UnTelaCadMonitMedicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, Datasnap.DBClient, Vcl.ComCtrls, System.DateUtils, FireDAC.Stan.Param;

type
  TFrmTelaCadMonitMedicoes = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    GrdCadastro: TDBGrid;
    Label7: TLabel;
    EdtFuncionario: TEdit;
    EdtData: TDateTimePicker;
    BtnCadastrar: TButton;
    BtnEquipamento: TButton;
    EdtMedicao: TEdit;
    edtCodEquip: TEdit;
    edtDescEquip: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure EdtMedicaoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadMonitMedicoes: TFrmTelaCadMonitMedicoes;
  LCodFuncionario, LFuncionario, LData, LMedicao: String;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadMonitMedicoes.BtnCadastrarClick(Sender: TObject);
var
  LMaxData: TDateTime;
  LMaxValue: Real;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if EdtFuncionario.Text = EmptyStr then
  begin
    EdtFuncionario.SetFocus;
    Exit;
  end;

if DateOf(EdtData.Date) > DateOf(DM.FDataHoraServidor) then
  begin
   EdtData.SetFocus;
   PAuxiliares.Font.Color := clRed;
   PAuxiliares.Caption := 'DATA INFORMADA SUPERIOR A DATA ATUAL!';
   Exit;
 end;

if GrdCadastro.DataSource.DataSet.IsEmpty = False then
  if DateOf(EdtData.Date) < GrdCadastro.DataSource.DataSet.FieldByName('MAXDATA').Value then
   begin
     EdtData.SetFocus;
     PAuxiliares.Font.Color := clRed;
     PAuxiliares.Caption := 'DATA INFORMADA INFERIOR A DATA J� INFORMADA!';
     Exit;
   end;

if EdtMedicao.Text = EmptyStr then
  begin
    EdtMedicao.SetFocus;
    Exit;
  end;

 try
   StrToFloat(EdtMedicao.Text);
 except
   EdtMedicao.SetFocus;
   PAuxiliares.Font.Color := clRed;
   PAuxiliares.Caption := 'VALOR INV�LIDO!';
   Exit;
 end;

if DM.FDataSetParam.FieldByName('MAXDATA').Value <> Null then
  LMaxData := DM.FDataSetParam.FieldByName('MAXDATA').Value
else
  LMaxData := 0;
if DM.FDataSetParam.FieldByName('MAXMEDICAO').Value <> Null then
  LMaxValue := DM.FDataSetParam.FieldByName('MAXMEDICAO').Value
else
  LMaxValue := 0;

DM.FDataSetParam.Append;
DM.FDataSetParam.FieldByName('CODEMPRESA').AsString       := DM.FCodEmpresa;
DM.FDataSetParam.FieldByName('CODMONITORAMENTO').AsString := DM.qryMonitoramentoCODIGO.AsString;
DM.FDataSetParam.FieldByName('MATRICULA').AsString        := LCodFuncionario;
DM.FDataSetParam.FieldByName('FUNCIONARIO').AsString      := LFuncionario;
DM.FDataSetParam.FieldByName('DATAMEDICAO').AsString      := FormatDateTime('dd/mm/yyyy', EdtData.Date);
DM.FDataSetParam.FieldByName('MEDICAO').AsString          := EdtMedicao.Text;
DM.FDataSetParam.FieldByName('CODEQUIPAMENTO').AsString   := DM.qryMonitEquipamentosCODIGO.AsString;
DM.FDataSetParam.FieldByName('CODEQUIP').AsString         := DM.qryMonitEquipamentosCODIGO.AsString;
DM.FDataSetParam.FieldByName('EQUIPAMENTO').AsString      := DM.qryMonitEquipamentosDESCRICAO.AsString;
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspe��o' then
  begin
    DM.FDataSetParam.FieldByName('PONTOINSP').AsString    := DM.qryMonitoramentoPONTOINSPECAO.AsString;
    DM.FDataSetParam.FieldByName('PONTOINSPLOC').AsString := DM.qryMonitoramentoPONTOINSPLOC.AsString;
    DM.FDataSetParam.FieldByName('LIMINFSEG').AsString    := DM.qryMonitEquipamentosLIMINFSEG.AsString;
    DM.FDataSetParam.FieldByName('LIMINFMAX').AsString    := DM.qryMonitEquipamentosLIMINFMAX.AsString;
    DM.FDataSetParam.FieldByName('LIMSUPSEG').AsString    := DM.qryMonitEquipamentosLIMSUPSEG.AsString;
    DM.FDataSetParam.FieldByName('LIMSUPMAX').AsString    := DM.qryMonitEquipamentosLIMSUPMAX.AsString;

    if DM.FDataSetParam.FieldByName('MEDICAO').AsFloat < DM.FDataSetParam.FieldByName('LIMINFSEG').AsFloat then
      begin
        if Application.MessageBox('Ser� gerada uma ordem de servi�o para verifica��o do equipamento, confirma a inclus�o?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
          begin
            if DM.FDataSetParam.FieldByName('MEDICAO').AsFloat < DM.FDataSetParam.FieldByName('LIMINFMAX').AsFloat then
              begin
                DM.FDataSetParam.FieldByName('OSGERADA').AsInteger := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Verificar '+DM.FDataSetParam.FieldByName('PONTOINSP').AsString + ': '+EdtMedicao.Text
                                                                                 , DM.FDataSetParam.FieldByName('CODEQUIPAMENTO').AsString, EmptyStr, EmptyStr, EmptyStr, 'N'
                                                                                 , DM.FDataSetParam.FieldByName('MATRICULA').AsString, 'Emerg�ncia', 'Para o Equipamento', DM.qryMonitEquipamentosCODCENTROCUSTO.AsString, EmptyStr, '1', EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr);
              end
            else
              begin
                DM.FDataSetParam.FieldByName('OSGERADA').AsInteger := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Verificar '+DM.FDataSetParam.FieldByName('PONTOINSP').AsString + ': '+EdtMedicao.Text
                                                                                 , DM.FDataSetParam.FieldByName('CODEQUIPAMENTO').AsString, EmptyStr, EmptyStr, EmptyStr, 'N'
                                                                                 , DM.FDataSetParam.FieldByName('MATRICULA').AsString, 'At� 1 M�s', 'Para o Equipamento', DM.qryMonitEquipamentosCODCENTROCUSTO.AsString, EmptyStr, '1', EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr);
              end;

            DM.FDataSetParam.FieldByName('SITUACAOOS').AsString := 'CADASTRADA';
          end
        else
          begin
            DM.FDataSetParam.Cancel;
            Exit;
          end;
      end
    else
    if DM.FDataSetParam.FieldByName('MEDICAO').AsFloat > DM.FDataSetParam.FieldByName('LIMSUPSEG').AsFloat then
      begin
        if DM.FDataSetParam.FieldByName('MEDICAO').AsFloat > DM.FDataSetParam.FieldByName('LIMSUPMAX').AsFloat then
          begin
            DM.FDataSetParam.FieldByName('OSGERADA').AsInteger := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Verificar '+DM.FDataSetParam.FieldByName('PONTOINSP').AsString + ': '+EdtMedicao.Text
                                                                        , DM.FDataSetParam.FieldByName('CODEQUIPAMENTO').AsString, EmptyStr, EmptyStr, EmptyStr, 'N'
                                                                        , DM.FDataSetParam.FieldByName('MATRICULA').AsString, 'Emerg�ncia', 'Para o Equipamento', DM.qryMonitEquipamentosCODCENTROCUSTO.AsString, EmptyStr, '1', EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr);
          end
        else
          begin
            DM.FDataSetParam.FieldByName('OSGERADA').AsInteger := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Verificar '+DM.FDataSetParam.FieldByName('PONTOINSP').AsString + ': '+EdtMedicao.Text
                                                                        , DM.FDataSetParam.FieldByName('CODEQUIPAMENTO').AsString, EmptyStr, EmptyStr, EmptyStr, 'N'
                                                                        , DM.FDataSetParam.FieldByName('MATRICULA').AsString, 'At� 1 M�s', 'Para o Equipamento', DM.qryMonitEquipamentosCODCENTROCUSTO.AsString, EmptyStr, '1', EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr);
          end;

        DM.FDataSetParam.FieldByName('SITUACAOOS').AsString := 'CADASTRADA';
      end;
  end
else
  if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
    begin
      if (DateOf(EdtData.Date) <= LMaxData) and (DM.qryMonitMedicoesCont.RecordCount > 1) then
        begin
          EdtData.SetFocus;
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'VALOR IGUAL OU MAIOR J� CADASTRADO!';
          DM.qryMonitMedicoesCont.Cancel;
          Exit;
        end;

      if StrToFloat(EdtMedicao.Text) <= LMaxValue then
        begin
          EdtMedicao.SetFocus;
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'VALOR IGUAL OU MAIOR J� CADASTRADO!';
          DM.qryMonitMedicoesCont.Cancel;
          Exit;
        end;

      {if (DM.qryMonitMedicoesCont.IsEmpty = False) and (DM.qryMonitMedicoesCont.RecordCount > 1) then
        begin
          LMaxHorasPossivel := DaysBetween(DM.qryMonitMedicoesContMAXDATA.Value,  EdtData.Date) * 24;

          if (StrToFloat(EdtMedicao.Text) - (DM.qryMonitMedicoesContMAXMEDICAO.Value)) > LMaxHorasPossivel then
            begin
              EdtMedicao.SetFocus;
              PAuxiliares.Font.Color := clRed;
              PAuxiliares.Caption := 'INTERVALO ENTRE �LTIMA MEDICAO E MEDI��O INFOMADA INV�LIDO!';
              DM.qryMonitMedicoesCont.Cancel;
              Abort;
            end;
        end;}

      DM.FDataSetParam.FieldByName('CONTADOR').AsString := DM.qryMonitoramentoCONTADOR.AsString;

      DM.qryMonitMedicoesContManut.Close;
      DM.qryMonitMedicoesContManut.Params[0].AsString := DM.FCodEmpresa;
      DM.qryMonitMedicoesContManut.Params[1].AsString := DM.FDataSetParam.FieldByName('CODEQUIPAMENTO').AsString;
      DM.qryMonitMedicoesContManut.Params[2].AsString := DM.qryMonitoramentoCODPROGRAMACAO.AsString;
      DM.qryMonitMedicoesContManut.Open;
      DM.qryMonitMedicoesContManut.First;
      while not DM.qryMonitMedicoesContManut.Eof do
        begin
      if ((DM.qryMonitMedicoesContMEDICAO.AsFloat >= DM.qryMonitMedicoesContManutLEITURA.AsFloat) and (DM.qryMonitMedicoesContManutREPROGRAMAR2.AsString = 'Programa��o'))
        or ((DM.qryMonitMedicoesContMEDICAO.AsFloat >= DM.qryMonitMedicoesContManutLEITURA.AsFloat) and (DM.qryMonitMedicoesContManutREPROGRAMAR2.AsString = 'Execu��o') and ((DM.qryMonitMedicoesContManutRELATORIO.AsString = 'N') or (DM.qryMonitMedicoesContManutRELATORIO.AsString = EmptyStr))) then
          begin
            DM.qryMonitMedicoesContOSGERADA.AsInteger := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, 'Verificar '+DM.qryMonitMedicoesContManutMANUTENCAO.AsString
                                                                    , DM.qryMonitMedicoesContCODEQUIPAMENTO.AsString, DM.qryMonitMedicoesContManutCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                                    , DM.qryMonitMedicoesContMATRICULA.AsString, 'Emerg�ncia', 'Para o Equipamento', DM.qryMonitEquipamentosCODCENTROCUSTO.AsString, EmptyStr, '1', EmptyStr, EmptyStr, EmptyStr, EmptyStr, EmptyStr);
            DM.FDataSetParam.FieldByName('SITUACAOOS').AsString := 'CADASTRADA';

            DM.qryManutProgEquip.Close;
            DM.qryManutProgEquip.Params[0].AsString := DM.qryMonitMedicoesContManutCODIGO.AsString;
            DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
            DM.qryManutProgEquip.Params[2].AsString := DM.qryMonitEquipamentosCODIGO.AsString;
            DM.qryManutProgEquip.Open;

            //Sendo a inspe��o reprogramada pela 'programa��o', programa a pr�xima inspe��o independente se a manuten��o foi fechada ou n�o.
            if DM.qryManutProgEquipREPROGRAMAR2.AsString = 'Programa��o' then
              begin
                DM.qryManutProgEquip.Edit;
                DM.qryManutProgEquipRELATORIO.AsString    := 'N';
//                DM.qryManutProgEquipLEITURA.AsInteger     := DM.qryManutProgEquipLEITURA.AsInteger + DM.qryManutProgEquipFREQUENCIA2.AsInteger;
                DM.qryManutProgEquipLEITURA.AsInteger     := DM.qryMonitMedicoesContMEDICAO.AsInteger + DM.qryManutProgEquipFREQUENCIA2.AsInteger;
                DM.qryManutProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryManutProgEquipFREQUENCIA1.AsInteger);
                DM.qryManutProgEquip.Post;
              end;

            //Sendo a inspe��o reprogramada pela execu��o, definir como manuten��o em aberto at� ser efetuado o fechamento, portanto n�o permitindo
            //a gera��o de outra manuten��o mesmo que o per�odo ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manuten��o at� ser fechada.
            if DM.qryManutProgEquipREPROGRAMAR2.AsString = 'Execu��o' then
              begin
                DM.qryManutProgEquip.Edit;
                DM.qryManutProgEquipRELATORIO.AsString    := 'S';
                DM.qryManutProgEquip.Post;
              end;

            DM.HistoricoInspecoes(0, DM.FCodEmpresa, DM.qryMonitMedicoesContManutCODEQUIPAMENTO.AsString, DM.qryMonitMedicoesContManutCODIGO.AsString, DM.qryMonitMedicoesContOSGERADA.AsInteger);
          end;


          DM.qryMonitMedicoesContManut.Next;
        end;
    end;

DM.FDataSetParam.Post;

if DM.FDataSetParam.RecordCount = 1 then
  begin
    LMaxData := DM.FDataSetParam.FieldByName('DATAMEDICAO').AsDateTime;
    LMaxValue := DM.FDataSetParam.FieldByName('MEDICAO').AsFloat;
  end;
end;

procedure TFrmTelaCadMonitMedicoes.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
DM.FTabela_auxiliar  := 300;
DM.FParamAuxiliar[9] := 'NOME';

Try
  Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
  FrmTelaAuxiliar.ShowModal;
Finally
  if DM.FCodCombo <> EmptyStr then
    begin
      LCodFuncionario     := DM.FCodCombo;
      LFuncionario        := DM.FValorCombo;
      EdtFuncionario.Text := DM.FValorCombo;
    end;
  FreeAndNil(FrmTelaAuxiliar);
End;
end;

procedure TFrmTelaCadMonitMedicoes.EdtMedicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', ',', #8 , #9, #13]) then
    Key := #0
end;

procedure TFrmTelaCadMonitMedicoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryMonitMedicoesContManut.Close;
DM.qryManutProgEquip.Close;
end;

procedure TFrmTelaCadMonitMedicoes.FormCreate(Sender: TObject);
begin
  inherited;
EdtData.Date      := DM.FDataHoraServidor;
edtCodEquip.Text  := DM.qryMonitEquipamentosCODIGO.AsString;
edtDescEquip.Text := DM.qryMonitEquipamentosDESCRICAO.AsString;

if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspe��o' then
  begin
    DM.FDataSetParam    := DM.qryMonitMedicoesPtosInsp;
    DM.FDataSourceParam := DM.DSMonitMedicoesPtosInsp;
  end
else
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
  begin
    DM.FDataSetParam    := DM.qryMonitMedicoesCont;
    DM.FDataSourceParam := DM.DSMonitMedicoesCont;
  end;
GrdCadastro.DataSource := DM.FDataSourceParam;
end;

procedure TFrmTelaCadMonitMedicoes.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := '';

if GrdCadastro.DataSource.DataSet.FieldByName('MEDICAO').AsString = '' then Exit;

if GrdCadastro.DataSource.DataSet.RecNo <> 1 then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'APENAS O �LTIMO REGISTRO PODE SER EXCLU�DO!';
    Abort;
  end;

if GrdCadastro.DataSource.DataSet.FieldByName('OSGERADA').AsString <> '' then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'UMA ORDEM DE SERVI�O FOI GERADA, N�O FOI POSS�VEL A EXCLUS�O!';
    Abort;
  end;

if DM.qryMonitoramentoTIPOPONTO.AsString = 'Ponto de Inspe��o' then
  begin
    DM.qryMonitMedicoesPtosInsp.Delete;
  end
else
if DM.qryMonitoramentoTIPOPONTO.AsString = 'Contador' then
  begin
    DM.qryMonitMedicoesCont.Delete;
  end;

end;

procedure TFrmTelaCadMonitMedicoes.GrdCadastroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
GrdCadastro.Columns[1].Title.Alignment := taCenter;
GrdCadastro.Columns[2].Title.Alignment := taCenter;
end;

end.

unit UnTelaCadAreas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, JvExControls,
  JvGradientHeaderPanel, FireDAC.Stan.Param;

type
  TFrmTelaCadAreas = class(TFrmTelaPaiParametros)
    PCAreas: TPageControl;
    TSAreas: TTabSheet;
    TSCelulas: TTabSheet;
    TSLinhas: TTabSheet;
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    Label1: TLabel;
    EdtFtrMarcha: TDBEdit;
    Label3: TLabel;
    EdtCodCelula: TDBEdit;
    Label5: TLabel;
    EdtDescCelula: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdtFtrMarchaCel: TDBEdit;
    CBTipo: TDBComboBox;
    Label8: TLabel;
    EdtCodLinha: TDBEdit;
    Label9: TLabel;
    EdtDescLinha: TDBEdit;
    procedure PCAreasChange(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure EdtCodCelulaExit(Sender: TObject);
    procedure EdtCodLinhaExit(Sender: TObject);
    procedure MmNovoClick(Sender: TObject);
    procedure MmSalvarClick(Sender: TObject);
    procedure MmCancelarClick(Sender: TObject);
    procedure MmExcluirClick(Sender: TObject);
    procedure MmConsultarClick(Sender: TObject);
    procedure MmRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadAreas: TFrmTelaCadAreas;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadAreas.BtnCancelarClick(Sender: TObject);
begin
case  PCAreas.TabIndex of
  0:
    begin
      EdtCodigo.ReadOnly := True;
    end;
  1:
    begin
      EdtCodCelula.ReadOnly := True;
      DM.qryCelulas.Cancel;
    end;
  2:
    begin
      EdtCodLinha.ReadOnly := True;
      DM.qryLinhas.Cancel;
    end;
end;
  inherited;
end;

procedure TFrmTelaCadAreas.BtnConsultarClick(Sender: TObject);
begin
case PCAreas.TabIndex of
  0:
    begin
      DM.FTabela_auxiliar := 15;
      DM.qryCelulas.Close;
      DM.qryLinhas.Close;
    end;
  1:
    begin
      if DM.qryAreasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA ÁREA SELECIONADA!!!';
          Exit;
        end;
      DM.FParamAuxiliar[1] := DM.qryAreasCODIGO.AsString;
      DM.FTabela_auxiliar := 16;
      DM.qryLinhas.Close;
    end;
  2:
    begin
      if DM.qryAreasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA ÁREA SELECIONADA!!!';
          Exit;
        end;
      if DM.qryCelulasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA CÉLULA SELECIONADA!!!';
          Exit;
        end;
      DM.FParamAuxiliar[1] := DM.qryAreasCODIGO.AsString;
      DM.FParamAuxiliar[2] := DM.qryCelulasCODIGO.AsString;
      DM.FTabela_auxiliar := 17;
    end;
  3:
    begin
      if DM.qryAreasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA ÁREA SELECIONADA!!!';
          Exit;
        end;
      if DM.qryCelulasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA CÉLULA SELECIONADA!!!';
          Exit;
        end;
      if DM.qryLinhasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA LINHA SELECIONADA!!!';
          Exit;
        end;
      DM.FParamAuxiliar[1] := DM.qryAreasCODIGO.AsString;
      DM.FParamAuxiliar[2] := DM.qryCelulasCODIGO.AsString;
      DM.FParamAuxiliar[3] := DM.qryLinhasCODIGO.AsString;
      DM.FTabela_auxiliar := 18;
    end;
end;
  inherited;
end;

procedure TFrmTelaCadAreas.BtnExcluirClick(Sender: TObject);
begin
//  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

case  PCAreas.TabIndex of
  0:
    begin
      {if DM.SMWebClient.VerificaTabelaVazia('CELULAS', 'CODIGO',EmptyStr) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM CÉLULAS CADASTRADAS NA ÁREA!!!';
          Exit;
        end;
      if DM.SMWebClient.VerificaCadastroDependente('EQUIPAMENTOS', 'CODIGO', 'CODLOCALIZACAO', DM.qryAreasCODIGO.AsString, DM.FCodEmpresa) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM EQUIPAMENTOS CADASTRADOS NA ÁREA!!!';
          Exit;
        end;
      if DM.SMWebClient.VerificaCadastroDependente('FUNCIONARIOS', 'MATRICULA', 'CODAREA', DM.qryAreasCODIGO.AsString, DM.FCodEmpresa) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM FUNCIONÁRIOS CADASTRADOS NA ÁREA!!!';
          Exit;
        end;}
      if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.qryCelulas.Close;
          DM.qryLinhas.Close;

          DM.qryAreas.Delete;
          ControleBotoes(0);
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'REGISTRO EXCLUÍDO COM SUCESSO!!!';
        end;
    end;
  1:
    begin
      {if DM.SMWebClient.VerificaTabelaVazia('LINHAS', 'CODIGO',EmptyStr) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM LINHAS CADASTRADAS NA CÉLULA!!!';
          Exit;
        end;
      if DM.SMWebClient.VerificaCadastroDependente('EQUIPAMENTOS', 'CODIGO', 'CODCELULA', DM.qryCelulasCODIGO.AsString, DM.FCodEmpresa) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM EQUIPAMENTOS CADASTRADOS NA CÉLULA!!!';
          Exit;
        end;
      if DM.SMWebClient.VerificaCadastroDependente('FUNCIONARIOS', 'MATRICULA', 'CODCELULA', DM.qryCelulasCODIGO.AsString, DM.FCodEmpresa) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM FUNCIONÁRIOS CADASTRADOS NA CÉLULA!!!';
          Exit;
        end;}
      if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.qryCelulas.Delete;

          DM.qryLinhas.Close;

          ControleBotoes(0);
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'REGISTRO EXCLUÍDO COM SUCESSO!!!';
        end;
    end;
  2:
    begin
      {if DM.SMWebClient.VerificaTabelaVazia('SEQUENCIAS', 'CODIGO',EmptyStr) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM SEQUÊNCIAS CADASTRADAS NA LINHA!!!';
          Exit;
        end;
      if DM.SMWebClient.VerificaCadastroDependente('EQUIPAMENTOS', 'CODIGO', 'CODLINHA', DM.qryLinhasCODIGO.AsString, DM.FCodEmpresa) > 0 then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'EXISTEM EQUIPAMENTOS CADASTRADOS NA LINHA!!!';
          Exit;
        end;}
      if Application.MessageBox('Deseja realmente excluir o registro?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.qryLinhas.Delete;

          ControleBotoes(0);
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'REGISTRO EXCLUÍDO COM SUCESSO!!!';
        end;
    end;
end;
end;

procedure TFrmTelaCadAreas.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 151;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBAreas;

end;

procedure TFrmTelaCadAreas.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

case  PCAreas.TabIndex of
  0:
    begin
      DM.qryCelulas.Close;
      DM.qryLinhas.Close;

      DM.FTabela_auxiliar := 15;
      DM.qryAreasATIVO.AsString          := 'S';
      DM.qryAreasVISIVEL.AsString        := 'S';
      DM.qryAreasCODEMPRESA.AsString     := DM.FCodEmpresa;
      LblUsuCad.Caption                       := DM.FNomeUsuario;

      EdtCodigo.ReadOnly := False;
      EdtCodigo.SetFocus;
    end;
  1:
    begin
      DM.qryLinhas.Close;

      DM.FTabela_auxiliar := 16;
      {if DM.SMWebClient.VerificaTabelaVazia('AREAS', 'CODIGO', EmptyStr) = 0 then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'NENHUMA ÁREA CADASTRADA!';
          Exit;
        end;}

      if DM.qryAreasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'ESCOLHA A ÁREA!';
          Exit;
        end;

      DM.qryCelulasCODAREA.AsString         := DM.qryAreasCODIGO.AsString;
      DM.qryCelulasCODEMPRESA.AsString      := DM.FCodEmpresa;
      LblUsuCad.Caption                       := DM.FNomeUsuario;

      EdtCodCelula.ReadOnly := False;
      EdtCodCelula.SetFocus;
    end;
  2:
    begin
      DM.FTabela_auxiliar := 17;
      {if DM.SMWebClient.VerificaTabelaVazia('CELULAS', 'CODIGO', EmptyStr) = 0 then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'NENHUMA CÉLULA CADASTRADA!';
          Exit;
        end;}

      if DM.qryCelulasCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'ESCOLHA A CÉLULA!';
          Exit;
        end;

      DM.qryLinhasCODAREA.AsString         := DM.qryAreasCODIGO.AsString;
      DM.qryLinhasCODCELULA.AsString       := DM.qryCelulasCODIGO.AsString;
      DM.qryLinhasCODEMPRESA.AsString      := DM.FCodEmpresa;
      DM.qryLinhasDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
      DM.qryLinhasCODUSUARIOCAD.AsString   := DM.FCodUsuario;
      LblUsuCad.Caption                    := DM.FNomeUsuario;

      EdtCodLinha.ReadOnly := False;
      EdtCodLinha.SetFocus;
    end;
end;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadAreas.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if DM.RetornaDataHoraServidor = True then
  begin
    case  PCAreas.TabIndex of
      0:
        begin
          with DM.qryAreas do
            begin
              if DM.qryAreas.IsEmpty = True then Exit;
              if DM.qryAreasCODIGO.AsString = EmptyStr then
                begin
                  EdtCodigo.SetFocus;
                  Exit;
                end;
              DM.FTabela_auxiliar := 15;
              if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
                begin
                  EdtCodigo.SetFocus;
                  PAuxiliares.Font.Color := clBlack;
                  PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
                  Exit;
                end;
              if DM.qryAreasDESCRICAO.AsString = EmptyStr then
                begin
                  EdtDescricao.SetFocus;
                  Exit;
                end;

              DM.qryAreas.Params[0].AsString := DM.qryAreasCODIGO.AsString;
              DM.qryAreas.Params[1].AsString := DM.FCodEmpresa;

              if DM.qryAreasDATACADASTRO.IsNull = True then DM.qryAreasDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
              if DM.qryAreasCODUSUARIOCAD.IsNull = True then DM.qryAreasCODUSUARIOCAD.AsString  := DM.FCodUsuario;
              DM.qryAreasDATAULTALT.AsDateTime  := DM.FDataHoraServidor;
              DM.qryAreasCODUSUARIOALT.AsString := DM.FCodUsuario;
              DM.qryAreasUSUARIOALT.AsString    := DM.FNomeUsuario;
              DM.qryAreasCODEMPRESA.AsString    := DM.FCodEmpresa;
              DM.qryAreas.Post;
              DM.qryAreas.Edit;
            end;
          PAuxiliares.Font.Color := clGreen;
          PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
          ControleBotoes(2);
          BtnSalvar.ImageIndex := 2;
        end;
      1:
        begin
          with DM.qryCelulas do
            begin
              if DM.qryCelulas.IsEmpty = True then Exit;
              if DM.qryCelulasCODIGO.AsString = EmptyStr then
                begin
                  EdtCodCelula.SetFocus;
                  Exit;
                end;
              DM.FTabela_auxiliar  := 16;
              DM.FParamAuxiliar[1] := DM.qryAreasCODIGO.AsString;
              if (DM.VerificaDuplo(EdtCodCelula.Text) = True) and (DM.FAlterando = False) then
                begin
                  EdtCodCelula.SetFocus;
                  PAuxiliares.Font.Color := clBlack;
                  PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
                  Exit;
                end;
              if DM.qryCelulasDESCRICAO.AsString = EmptyStr then
                begin
                  EdtDescCelula.SetFocus;
                  Exit;
                end;

              DM.qryCelulas.Params[0].AsString := DM.qryCelulasCODIGO.AsString;
              DM.qryCelulas.Params[1].AsString := DM.FCodEmpresa;
              DM.qryCelulas.Params[2].AsString := DM.qryAreasCODIGO.AsString;

              DM.qryCelulasCODAREA.AsString       := DM.qryAreasCODIGO.AsString;
              DM.qryCelulasCODEMPRESA.AsString    := DM.FCodEmpresa;
              if DM.qryCelulasDATACADASTRO.IsNull = True then DM.qryCelulasDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
              if DM.qryCelulasCODUSUARIOCAD.IsNull = True then DM.qryCelulasCODUSUARIOCAD.AsString   := DM.FCodUsuario;
              DM.qryCelulasCODUSUARIOALT.AsString := DM.FCodUsuario;
              DM.qryCelulasDATAULTALT.AsDateTime  := DM.FDataHoraServidor;
              DM.qryCelulasCODUSUARIOALT.AsString := DM.FCodUsuario;
              DM.qryCelulasUSUARIOALT.AsString    := DM.FNomeUsuario;
              DM.qryCelulas.Post;
              DM.qryCelulas.Edit;
            end;
          PAuxiliares.Font.Color := clGreen;
          PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
          ControleBotoes(2);
          BtnSalvar.ImageIndex := 2;
        end;
      2:
        begin
          with DM.qryLinhas do
            begin
              if DM.qryLinhas.IsEmpty = True then Exit;
              if DM.qryLinhasCODIGO.AsString = EmptyStr then
                begin
                  EdtCodLinha.SetFocus;
                  Exit;
                end;
              DM.FTabela_auxiliar := 17;
              DM.FParamAuxiliar[1] := DM.qryAreasCODIGO.AsString;
              DM.FParamAuxiliar[2] := DM.qryCelulasCODIGO.AsString;
              if (DM.VerificaDuplo(EdtCodLinha.Text) = True) and (DM.FAlterando = False) then
                begin
                  EdtCodLinha.SetFocus;
                  PAuxiliares.Font.Color := clBlack;
                  PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
                  Exit;
                end;
              if DM.qryLinhasDESCRICAO.AsString = EmptyStr then
                begin
                  EdtDescLinha.SetFocus;
                  Exit;
                end;

              DM.qryLinhas.Params[0].AsString := DM.qryLinhasCODIGO.AsString;
              DM.qryLinhas.Params[1].AsString := DM.FCodEmpresa;
              DM.qryLinhas.Params[2].AsString := DM.qryAreasCODIGO.AsString;
              DM.qryLinhas.Params[3].AsString := DM.qryCelulasCODIGO.AsString;

              DM.qryLinhasDATAULTALT.AsDateTime  := DM.FDataHoraServidor;
              DM.qryLinhasCODUSUARIOALT.AsString := DM.FCodUsuario;
              DM.qryLinhasUSUARIOALT.AsString    := DM.FNomeUsuario;
              DM.qryLinhasCODEMPRESA.AsString      := DM.FCodEmpresa;
              DM.qryLinhas.Post;
              DM.qryLinhas.Edit;
            end;
          PAuxiliares.Font.Color := clGreen;
          PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
          ControleBotoes(2);
          BtnSalvar.ImageIndex := 2;
        end;
    end;
  end;
DM.MSGAguarde('', False);
DM.FAlterando := True;
end;

procedure TFrmTelaCadAreas.EdtCodCelulaExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadAreas.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadAreas.EdtCodLinhaExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadAreas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryLinhas.Close;
DM.qryCelulas.Close;
DM.qryAreas.Close;
end;

procedure TFrmTelaCadAreas.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryAreas;
DM.FDataSourceParam := DM.dsAreas;
DM.FTela := 'CADAREAS';
if DM.FEmpTransf = False then
  PCAreas.Pages[2].TabVisible := False;
end;

procedure TFrmTelaCadAreas.MmCancelarClick(Sender: TObject);
begin
//  inherited;
BtnCancelar.OnClick(Sender);
end;

procedure TFrmTelaCadAreas.MmConsultarClick(Sender: TObject);
begin
//  inherited;
BtnConsultar.OnClick(Sender);
end;

procedure TFrmTelaCadAreas.MmExcluirClick(Sender: TObject);
begin
//  inherited;
BtnExcluir.OnClick(Sender);
end;

procedure TFrmTelaCadAreas.MmNovoClick(Sender: TObject);
begin
//  inherited;
BtnNovo.OnClick(Sender);
end;

procedure TFrmTelaCadAreas.MmRelatorioClick(Sender: TObject);
begin
//  inherited;
BtnImprimir.OnClick(Sender);
end;

procedure TFrmTelaCadAreas.MmSalvarClick(Sender: TObject);
begin
//  inherited;
BtnSalvar.OnClick(Sender);
end;

procedure TFrmTelaCadAreas.PCAreasChange(Sender: TObject);
begin
  inherited;
PAuxiliares.Caption := '';
case PCAreas.TabIndex of
  0:
    begin
      DM.FDataSetParam := DM.qryAreas;
      LblDataCad.DataSource := DM.dsAreas;
      LblUsuCad.DataSource := DM.dsAreas;
      LblDataAlt.DataSource := DM.dsAreas;
      LblUsuAlt.DataSource := DM.dsAreas;
    end;
  1:
    begin
      DM.FDataSetParam := DM.qryCelulas;
      LblDataCad.DataSource := DM.dsCelulas;
      LblUsuCad.DataSource := DM.dsCelulas;
      LblDataAlt.DataSource := DM.dsCelulas;
      LblUsuAlt.DataSource := DM.dsCelulas;
    end;
  2:
    begin
      DM.FDataSetParam := DM.qryLinhas;
      LblDataCad.DataSource := DM.dsLinhas;
      LblUsuCad.DataSource := DM.dsLinhas;
      LblDataAlt.DataSource := DM.dsLinhas;
      LblUsuAlt.DataSource := DM.dsLinhas;
    end;
end;
end;

end.

unit UnTelaCadArqTecnicoLiteratura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadArqTecnicoLiteratura = class(TFrmTelaPaiParametros)
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    Label3: TLabel;
    EdtAutor: TDBEdit;
    Label6: TLabel;
    EdtLiteratura: TDBEdit;
    BtnLiteratura: TButton;
    Label2: TLabel;
    EdtTema: TDBEdit;
    BtnTema: TButton;
    Label4: TLabel;
    EdtAssunto: TDBEdit;
    BtnAssunto: TButton;
    Label8: TLabel;
    EdtEditora: TDBEdit;
    BtnEditora: TButton;
    Label15: TLabel;
    EdtEstante: TDBEdit;
    Label14: TLabel;
    EdtPrateleria: TDBEdit;
    EdtGaveta: TDBEdit;
    EdtPasta: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnLiteraturaClick(Sender: TObject);
    procedure BtnAssuntoClick(Sender: TObject);
    procedure BtnTemaClick(Sender: TObject);
    procedure BtnEditoraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadArqTecnicoLiteratura: TFrmTelaCadArqTecnicoLiteratura;

implementation

{$R *.dfm}

uses UnTelaCadArqTecnicoLiteraturaParam, UnDmRelatorios, UnDM;

procedure TFrmTelaCadArqTecnicoLiteratura.BtnAssuntoClick(Sender: TObject);
begin
  inherited;
if DM.qryArquivoTecnico.Active = False then Exit;
if DM.qryArquivoTecnico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar  := 7000;
    DM.FNomeConsulta := 'Assuntos';
    DM.FParamAuxiliar[1] := 'ASSUNTO';
    DM.qryArquivoTecnico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryArquivoTecnicoCODASSUNTO.AsString := DM.FCodCombo;
        DM.qryArquivoTecnicoASSUNTO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
      DM.FParamAuxiliar[1] := 'ASSUNTO';
      FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Assunto';
      FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
    End;
  end;
DM.FDataSetParam    := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela            := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 68;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.BtnLiteraturaClick(Sender: TObject);
begin
  inherited;
if DM.qryArquivoTecnico.Active = False then Exit;
if DM.qryArquivoTecnico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar  := 7000;
    DM.FNomeConsulta := 'Literaturas';
    DM.FParamAuxiliar[1] := 'LITERATURA';
    DM.qryArquivoTecnico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryArquivoTecnicoCODLITERATURA.AsString := DM.FCodCombo;
        DM.qryArquivoTecnicoLITERATURA.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
      DM.FParamAuxiliar[1] := 'LITERATURA';
      FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Literatura';
      FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
    End;
  end;
DM.FDataSetParam    := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela            := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 68;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryArquivoTecnicoTIPO.AsString            := 'Literatura';
DM.qryArquivoTecnicoCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryArquivoTecnicoDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryArquivoTecnicoDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryArquivoTecnicoCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryArquivoTecnicoCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryArquivoTecnicoCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
    EdtCodigo.SetFocus;
    Exit;
  end;
DM.FTabela_auxiliar := 68;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryArquivoTecnicoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

EdtCodigo.ReadOnly := True;
DM.qryArquivoTecnico.Params[0].AsString := DM.qryArquivoTecnicoCODIGO.AsString;
DM.qryArquivoTecnico.Params[1].AsString := DM.FCodEmpresa;
DM.qryArquivoTecnico.Params[2].AsString := 'Literatura';
  inherited;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.BtnTemaClick(Sender: TObject);
begin
  inherited;
if DM.qryArquivoTecnico.Active = False then Exit;
if DM.qryArquivoTecnico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar  := 7000;
    DM.FNomeConsulta := 'Temas';
    DM.FParamAuxiliar[1] := 'TEMA';
    DM.qryArquivoTecnico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryArquivoTecnicoCODTEMA.AsString := DM.FCodCombo;
        DM.qryArquivoTecnicoTEMA.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
      DM.FParamAuxiliar[1] := 'TEMA';
      FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Tema';
      FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
    End;
  end;
DM.FDataSetParam    := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela            := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 68;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBArqTecnicoGeral;
DM.FTabela_auxiliar := 68;
  inherited;

end;

procedure TFrmTelaCadArqTecnicoLiteratura.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.BtnEditoraClick(Sender: TObject);
begin
  inherited;
if DM.qryArquivoTecnico.Active = False then Exit;
if DM.qryArquivoTecnico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar  := 7000;
    DM.FNomeConsulta := 'Editoras';
    DM.FParamAuxiliar[1] := 'EDITORA';
    DM.qryArquivoTecnico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryArquivoTecnicoCODEDITORA.AsString := DM.FCodCombo;
        DM.qryArquivoTecnicoEDITORA.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
      DM.FParamAuxiliar[1] := 'EDITORA';
      FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Editora';
      FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
    End;
  end;
DM.FDataSetParam    := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela            := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 68;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryArquivoTecnico.Close;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 68;
end;

procedure TFrmTelaCadArqTecnicoLiteratura.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBArqTecnicoIndividual;
DM.FTabela_auxiliar := 681;
  inherited;

end;

end.

unit UnTelaCadArqTecnicoDesenho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, System.Actions,
  Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadArqTecnicoDesenho = class(TFrmTelaPaiParametros)
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    Label3: TLabel;
    EdtConjunto: TDBEdit;
    Label6: TLabel;
    EdtProjeto: TDBEdit;
    BtnProjeto: TButton;
    Label15: TLabel;
    EdtNumero: TDBEdit;
    Label5: TLabel;
    EdtMapoteca: TDBEdit;
    Label14: TLabel;
    EdtGaveta: TDBEdit;
    Label7: TLabel;
    EdtPasta: TDBEdit;
    Label10: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    Label12: TLabel;
    Label8: TLabel;
    EdtArquivo: TDBEdit;
    EdtEstacao: TDBEdit;
    PopupMenuCons: TPopupMenu;
    Codigo1: TMenuItem;
    Descricao1: TMenuItem;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure BtnProjetoClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadArqTecnicoDesenho: TFrmTelaCadArqTecnicoDesenho;

implementation

{$R *.dfm}

uses UnTelaCadEquipamentos, UnTelaCadArqTecnicoLiteraturaParam,
  UnDmRelatorios, UnDM;

procedure TFrmTelaCadArqTecnicoDesenho.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadArqTecnicoDesenho.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if DM.qryArquivoTecnico.Active = False then Exit;
if DM.qryArquivoTecnico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    DM.qryArquivoTecnico.Edit;
    if DM.FParamAuxiliar[1] = '' then
      begin
        PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        Exit;
      end
    else
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryArquivoTecnicoCODEQUIPAMENTO.AsString := DM.FCodCombo;
        DM.qryArquivoTecnicoEQUIPAMENTO.AsString := DM.FValorCombo;
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
DM.FDataSetParam    := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela            := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 69;
end;

procedure TFrmTelaCadArqTecnicoDesenho.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryArquivoTecnicoTIPO.AsString            := 'Desenho';
DM.qryArquivoTecnicoCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryArquivoTecnicoDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryArquivoTecnicoDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryArquivoTecnicoCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryArquivoTecnicoCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadArqTecnicoDesenho.BtnProjetoClick(Sender: TObject);
begin
  inherited;
if DM.qryArquivoTecnico.Active = False then Exit;
if DM.qryArquivoTecnico.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar  := 7000;
    DM.FNomeConsulta := 'Projetos';
    DM.FParamAuxiliar[1] := 'PROJETO';
    DM.qryArquivoTecnico.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryArquivoTecnicoCODPROJETO.AsString := DM.FCodCombo;
        DM.qryArquivoTecnicoPROJETO.AsString := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADARQUIVOTECNICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
      Application.CreateForm(TFrmTelaCadArqTecnicoLiteraturaParam, FrmTelaCadArqTecnicoLiteraturaParam);
      DM.FParamAuxiliar[1] := 'PROJETO';
      FrmTelaCadArqTecnicoLiteraturaParam.Caption := 'Projeto';
      FrmTelaCadArqTecnicoLiteraturaParam.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadArqTecnicoLiteraturaParam);
    End;
  end;
DM.FDataSetParam    := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela            := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 69;
end;

procedure TFrmTelaCadArqTecnicoDesenho.BtnSalvarClick(Sender: TObject);
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
DM.qryArquivoTecnico.Params[2].AsString := 'Desenho';

  inherited;
end;

procedure TFrmTelaCadArqTecnicoDesenho.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadArqTecnicoDesenho.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDesTecnicoGeral;
DM.FTabela_auxiliar := 69;
  inherited;

end;

procedure TFrmTelaCadArqTecnicoDesenho.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadArqTecnicoDesenho.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadArqTecnicoDesenho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryArquivoTecnico.Close;
end;

procedure TFrmTelaCadArqTecnicoDesenho.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryArquivoTecnico;
DM.FDataSourceParam := DM.dsArquivoTecnico;
DM.FTela := 'CADARQUIVOTECNICO';
DM.FTabela_auxiliar := 69;
end;

procedure TFrmTelaCadArqTecnicoDesenho.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBDesTecnicoIndividual;
DM.FTabela_auxiliar := 691;
  inherited;

end;

end.

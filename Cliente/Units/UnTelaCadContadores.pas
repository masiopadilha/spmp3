unit UnTelaCadContadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

type
  TFrmTelaCadContadores = class(TFrmTelaPaiParametros)
    Label6: TLabel;
    EdtProgramacao: TDBEdit;
    BtnProgramacao: TButton;
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    Label4: TLabel;
    EdtDescricao: TDBEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnProgramacaoClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadContadores: TFrmTelaCadContadores;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnTelaCadFamiliaEquipamento,
  UnTelaCadTipoProgramacao, UnDM;

procedure TFrmTelaCadContadores.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadContadores.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 39;
  inherited;

end;

procedure TFrmTelaCadContadores.BtnImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat := DmRelatorios.frxDBContadores;
end;

procedure TFrmTelaCadContadores.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryContadoresCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryContadoresDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryContadoresDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryContadoresCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryContadoresCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadContadores.BtnProgramacaoClick(Sender: TObject);
begin
  inherited;
if DM.qryContadores.Active = False then Exit;
if DM.qryContadores.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 120;
    DM.FNomeConsulta := 'Tipos de Programação';
    DM.qryContadores.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryContadoresCODPROGRAMACAO.AsString := DM.FCodCombo;
        DM.qryContadoresPROGRAMACAO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADTIPOPROGRAMACAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadTipoProgramacao, FrmTelaCadTipoProgramacao);
      FrmTelaCadTipoProgramacao.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadTipoProgramacao);
    End;
  end;
DM.FDataSetParam    := DM.qryContadores;
DM.FDataSourceParam := DM.dsContadores;
DM.FTela            := 'CADPONTOSINSPECAO';
DM.FTabela_auxiliar := 39;
end;

procedure TFrmTelaCadContadores.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryContadoresCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
    EdtCodigo.SetFocus;
    Exit;
  end;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryContadoresDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;
if DM.qryContadoresCODPROGRAMACAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O TIPO DE PROGRAMAÇÃO DO REGISTRO!';
    EdtProgramacao.SetFocus;
    Exit;
  end;
DM.qryContadores.Params[0].AsString := EdtCodigo.Text;
DM.qryContadores.Params[1].AsString := DM.FCodEmpresa;
  inherited;
end;

procedure TFrmTelaCadContadores.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 39;
  inherited;

end;

procedure TFrmTelaCadContadores.butImprimirClick(Sender: TObject);
begin
  inherited;
DM.FDataSetRelat := DmRelatorios.frxDBContadores;
end;

procedure TFrmTelaCadContadores.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadContadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryContadores.Close;
end;

procedure TFrmTelaCadContadores.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryContadores;
DM.FTela := 'CADPONTOSINSPECAO';
end;

end.

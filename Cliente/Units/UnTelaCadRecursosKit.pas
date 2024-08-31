unit UnTelaCadRecursosKit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, Data.DB, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadRecursosKit = class(TFrmTelaPaiParametros)
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    Label2: TLabel;
    EdtDescricao: TDBEdit;
    Label4: TLabel;
    EdtQtde: TDBEdit;
    GrdItens: TDBGrid;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdItensKeyPress(Sender: TObject; var Key: Char);
    procedure GrdItensDblClick(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadRecursosKit: TFrmTelaCadRecursosKit;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadRecursos, UnDmRelatorios, UnDM;

procedure TFrmTelaCadRecursosKit.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursoKitItens.Active = True then
 DM.qryRecursoKitItens.Cancel;
if DM.qryRecursos.Active = True then
 DM.qryRecursos.Cancel;
if DM.qryRecursoKit.IsEmpty = True then
  DM.qryRecursoKitItens.Close;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadRecursosKit.BtnConsultarClick(Sender: TObject);
begin
  inherited;
DM.qryRecursoKitItens.Open;
end;

procedure TFrmTelaCadRecursosKit.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if DM.qryRecursoKit.IsEmpty = True then
    DM.qryRecursoKitItens.Close;
end;

procedure TFrmTelaCadRecursosKit.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryRecursoKitItens.Open;

DM.qryRecursoKitCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryRecursoKitDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryRecursoKitDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryRecursoKitCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryRecursoKitCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadRecursosKit.BtnSalvarClick(Sender: TObject);
begin
  if (DM.qryUsuarioPAlteracaoCADRECURSOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      Application.MessageBox('Alteração não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryRecursoKitCODIGO.AsString = EmptyStr then
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
if DM.qryRecursoKitDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

  if DM.qryRecursos.Active = True then
  begin
   DM.qryRecursos.Edit;
   DM.qryRecursos.Post;
  end;

DM.qryRecursoKit.Params[0].AsString := DM.FCodEmpresa;
DM.qryRecursoKit.Params[1].AsString :=DM.qryRecursoKitCODIGO.AsString;

EdtCodigo.ReadOnly := True;
  inherited;
DM.qryRecursoKitItens.Edit;
DM.qryRecursoKitItens.Post;
end;

procedure TFrmTelaCadRecursosKit.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBRecursosKitGeral;
DM.FTabela_auxiliar := 50;
  inherited;

end;

procedure TFrmTelaCadRecursosKit.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadRecursosKit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
if DM.qryRecursoKitItens.Active = True then
 DM.qryRecursoKitItens.Close;
if DM.qryRecursoKit.Active = True then
 DM.qryRecursoKit.Close;
if (DM.qryRecursos.Active = True) and (FrmTelaCadRecursos = nil) then
 DM.qryRecursos.Close;
end;

procedure TFrmTelaCadRecursosKit.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryRecursoKit;
DM.FDataSourceParam := DM.dsRecursoKit;
DM.FTela := 'CADRECURSOSKIT';
DM.FTabela_auxiliar := 50;
end;

procedure TFrmTelaCadRecursosKit.GrdItensDblClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursoKitItens.IsEmpty = False then
 DM.qryRecursoKitItens.Delete;
end;

procedure TFrmTelaCadRecursosKit.GrdItensKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if DM.qryRecursoKitCODIGO.AsString = '' then Exit;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 50;

    if DM.qryRecursoKitCODIGO.AsString = EmptyStr then
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
    if DM.qryRecursoKitDESCRICAO.IsNull = True then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
        EdtDescricao.SetFocus;
        Exit;
      end;

    DM.qryRecursoKit.Edit;
    DM.qryRecursoKit.Post;
    DM.qryRecursoKit.Edit;

    DM.FAlterando := True;

    DM.FTabela_auxiliar := 460;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuxiliar);
    End;
    if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryRecursoKitItens.Locate('CODRECURSO', DM.FCodCombo, []) = False then
          begin
            LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade do recurso:');
            if LCampo <> EmptyStr then
              begin
                try
                  StrToInt(LCampo)
                except
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                  Exit;
                end;

               DM.qryRecursos.Close;
               DM.qryRecursos.Params[0].AsString := DM.FCodCombo;
               DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
               DM.qryRecursos.Open;
                if DM.qryRecursosQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                  begin
                   DM.qryRecursos.Edit;
                   DM.qryRecursosQUANTIDADE.AsInteger :=DM.qryRecursosQUANTIDADE.AsInteger - StrToInt(LCampo);
                   DM.qryRecursos.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end
            else Exit;

           DM.qryRecursoKitItens.Append;
            //DM.qryRecursoKitItensCODIGO.AsInteger     :=DM.qryRecursoKitItens.RecordCount + 1;
           DM.qryRecursoKitItensCODEMPRESA.AsString  := DM.FCodEmpresa;
           DM.qryRecursoKitItensCODKIT.AsString      :=DM.qryRecursoKitCODIGO.AsString;
           DM.qryRecursoKitItensCODRECURSO.AsString  := DM.FCodCombo;
           DM.qryRecursoKitItensQUANTIDADE.AsInteger := StrToInt(LCampo);
           DM.qryRecursoKitItensDESCRICAO.AsString   := DM.FValorCombo;
           DM.qryRecursoKitItens.Post;
          end;
      end;
    DM.FDataSetParam    :=DM.qryRecursoKit;
    DM.FDataSourceParam := DM.dsRecursoKit;
    DM.FTela            := 'CADRECURSOSKIT';
    DM.FTabela_auxiliar := 50;
  end;
end;

procedure TFrmTelaCadRecursosKit.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBRecursosKitIndividual;
DM.FTabela_auxiliar := 501;
  inherited;

end;

end.

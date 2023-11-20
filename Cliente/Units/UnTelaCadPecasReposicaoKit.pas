unit UnTelaCadPecasReposicaoKit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Data.DB, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadPecasReposicaoKit = class(TFrmTelaPaiParametros)
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
    procedure GrdItensDblClick(Sender: TObject);
    procedure GrdItensKeyPress(Sender: TObject; var Key: Char);
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
  FrmTelaCadPecasReposicaoKit: TFrmTelaCadPecasReposicaoKit;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaCadPecasReposicao, UnDmRelatorios, UnDM;

procedure TFrmTelaCadPecasReposicaoKit.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryPecaReposicaoKitItens.Active = True then
  DM.qryPecaReposicaoKitItens.Cancel;
if DM.qryPecasReposicao.Active = True then
  DM.qryPecasReposicao.Cancel;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadPecasReposicaoKit.BtnConsultarClick(Sender: TObject);
begin
  inherited;
DM.qryPecaReposicaoKitItens.Open;
end;

procedure TFrmTelaCadPecasReposicaoKit.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.qryPecaReposicaoKitItens.Close;
end;

procedure TFrmTelaCadPecasReposicaoKit.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryPecaReposicaoKitCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryPecaReposicaoKitDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryPecaReposicaoKitDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryPecaReposicaoKitCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryPecaReposicaoKitCODUSUARIOALT.AsString   := DM.FCodUsuario;

DM.qryPecaReposicaoKitItens.Open;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadPecasReposicaoKit.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryPecaReposicaoKitCODIGO.AsString = EmptyStr then
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
if DM.qryPecaReposicaoKitDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

if DM.qryPecasReposicao.Active = True then
  begin
    DM.qryPecasReposicao.Edit;
    DM.qryPecasReposicao.Post;
  end;
DM.qryPecaReposicaoKit.Params[0].AsString := DM.FCodEmpresa;
DM.qryPecaReposicaoKit.Params[1].AsString := DM.qryPecaReposicaoKitCODIGO.AsString;
EdtCodigo.ReadOnly := True;
  inherited;
DM.qryPecaReposicaoKitItens.Edit;
DM.qryPecaReposicaoKitItens.Post;
end;

procedure TFrmTelaCadPecasReposicaoKit.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBPecasRepKitGeral;
DM.FTabela_auxiliar := 62;
  inherited;
end;

procedure TFrmTelaCadPecasReposicaoKit.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadPecasReposicaoKit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
if DM.qryPecaReposicaoKitItens.Active = True then
  DM.qryPecaReposicaoKitItens.Close;
if DM.qryPecaReposicaoKit.Active = True then
  DM.qryPecaReposicaoKit.Close;
if (DM.qryPecasReposicao.Active = True) and (FrmTelaCadPecasReposicao = nil)then
  DM.qryPecasReposicao.Close;
end;

procedure TFrmTelaCadPecasReposicaoKit.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryPecaReposicaoKit;
DM.FDataSourceParam := DM.dsPecaReposicaoKit;
DM.FTela := 'CADPECASREPKIT';
DM.FTabela_auxiliar := 62;
end;

procedure TFrmTelaCadPecasReposicaoKit.GrdItensDblClick(Sender: TObject);
begin
  inherited;
if DM.qryPecaReposicaoKitItens.IsEmpty = False then
  DM.qryPecaReposicaoKitItens.Delete;
end;

procedure TFrmTelaCadPecasReposicaoKit.GrdItensKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if DM.qryPecaReposicaoKitCODIGO.AsString = '' then Exit;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 62;

    if DM.qryPecaReposicaoKitCODIGO.AsString = EmptyStr then
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
    if DM.qryPecaReposicaoKitDESCRICAO.IsNull = True then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
        EdtDescricao.SetFocus;
        Exit;
      end;

    DM.qryPecaReposicaoKit.Edit;
    DM.qryPecaReposicaoKit.Post;
    DM.qryPecaReposicaoKit.Edit;

    DM.FAlterando := True;

    DM.FTabela_auxiliar := 360;

    if (GrdItens.SelectedIndex = 1) then
      begin
        DM.FParamAuxiliar[1] := 'REFERENCIA';
      end
    else
    if (GrdItens.SelectedIndex = 2) then
      begin
        DM.FParamAuxiliar[1] := 'DESCRICAO';
      end
    else
      Exit;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuxiliar);
    End;
    if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryPecaReposicaoKitItens.Locate('CODPECAREPOSICAO', DM.FCodCombo, []) = False then
          begin
            LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade da peça:');
            if LCampo <> EmptyStr then
              begin
                try
                  StrToInt(LCampo)
                except
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                  Exit;
                end;

                DM.qryPecasReposicao.Close;
                DM.qryPecasReposicao.Params[0].AsString := DM.FCodCombo;
                DM.qryPecasReposicao.Params[1].AsString := DM.FCodEmpresa;
                DM.qryPecasReposicao.Open;
                if DM.qryPecasReposicaoQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                  begin
                    DM.qryPecasReposicao.Edit;
                    DM.qryPecasReposicaoQUANTIDADE.AsInteger := DM.qryPecasReposicaoQUANTIDADE.AsInteger - StrToInt(LCampo);
                    DM.qryPecasReposicao.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end
            else Exit;

            DM.qryPecaReposicaoKitItens.Append;
            //DM.qryPecaReposicaoKitItensCODIGO.AsInteger     := DM.qryPecaReposicaoKitItens.RecordCount + 1;
            DM.qryPecaReposicaoKitItensCODEMPRESA.AsString  := DM.FCodEmpresa;
            DM.qryPecaReposicaoKitItensCODKIT.AsString      := DM.qryPecaReposicaoKitCODIGO.AsString;
            DM.qryPecaReposicaoKitItensCODPECAREPOSICAO.AsString  := DM.FCodCombo;
            DM.qryPecaReposicaoKitItensQUANTIDADE.AsInteger := StrToInt(LCampo);
            DM.qryPecaReposicaoKitItensDESCRICAO.AsString   := DM.FValorCombo;
            DM.qryPecaReposicaoKitItensREFERENCIA.AsString  := DM.FParamAuxiliar[2];
            DM.qryPecaReposicaoKitItens.Post;
          end;
      end;
    DM.FDataSetParam    := DM.qryPecaReposicaoKit;
    DM.FDataSourceParam := DM.dsPecaReposicaoKit;
    DM.FTela            := 'CADPECASREPKIT';
    DM.FTabela_auxiliar := 62;
  end;
end;

procedure TFrmTelaCadPecasReposicaoKit.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBPecasRepIndividual;
DM.FTabela_auxiliar := 621;
  inherited;

end;

end.

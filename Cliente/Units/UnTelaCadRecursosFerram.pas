unit UnTelaCadRecursosFerram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Data.DB, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadRecursosFerram = class(TFrmTelaPaiParametros)
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    Label2: TLabel;
    EdtDescricao: TDBEdit;
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
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadRecursosFerram: TFrmTelaCadRecursosFerram;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDmRelatorios, UnDM;

procedure TFrmTelaCadRecursosFerram.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryFerramentariaItens.Active = True then
  DM.qryFerramentariaItens.Cancel;
if DM.qryFerramentaria.Active = True then
  DM.qryFerramentaria.Cancel;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadRecursosFerram.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  DM.qryFerramentariaItens.Open;
end;

procedure TFrmTelaCadRecursosFerram.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryFerramentariaItens.Open;

DM.qryFerramentariaCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryFerramentariaDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryFerramentariaDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryFerramentariaCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryFerramentariaCODUSUARIOALT.AsString   := DM.FCodUsuario;

EdtCodigo.ReadOnly := False;
EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadRecursosFerram.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryFerramentariaCODIGO.AsString = EmptyStr then
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
if DM.qryFerramentariaDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

if DM.qryFerramentaria.Active = True then
  begin
    DM.qryRecursos.Edit;
    DM.qryRecursos.Post;
  end;

DM.qryFerramentaria.Params[0].AsString := DM.qryFerramentariaCODIGO.AsString;
DM.qryFerramentaria.Params[1].AsString := DM.FCodEmpresa;

EdtCodigo.ReadOnly := True;
  inherited;

DM.qryFerramentariaItens.Edit;
DM.qryFerramentariaItens.Post;
end;

procedure TFrmTelaCadRecursosFerram.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBFerramentariaGeral;
DM.FTabela_auxiliar := 61;
  inherited;

end;

procedure TFrmTelaCadRecursosFerram.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadRecursosFerram.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFerramentariaItens.Close;
if DM.qryFerramentaria.Active = True then
  DM.qryFerramentaria.Close;
end;

procedure TFrmTelaCadRecursosFerram.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryFerramentaria;
DM.FDataSourceParam := DM.dsFerramentaria;
DM.FTela := 'CADFERRAMENTARIA';
DM.FTabela_auxiliar := 61;
end;

procedure TFrmTelaCadRecursosFerram.GrdItensDblClick(Sender: TObject);
begin
  inherited;
if DM.qryFerramentariaItens.IsEmpty = False then
  DM.qryFerramentariaItens.Delete;
end;

procedure TFrmTelaCadRecursosFerram.GrdItensKeyPress(Sender: TObject;
  var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if DM.qryFerramentariaCODIGO.AsString = '' then Exit;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 61;

    if DM.qryFerramentariaCODIGO.AsString = EmptyStr then
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
    if DM.qryFerramentariaDESCRICAO.IsNull = True then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
        EdtDescricao.SetFocus;
        Exit;
      end;

    DM.qryFerramentaria.Edit;
    DM.qryFerramentaria.Post;
    DM.qryFerramentaria.Edit;

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
          if DM.qryFerramentariaItens.Locate('CODRECURSO', DM.FCodCombo, []) = False then
            begin
              LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade da ferramenta:');
              if LCampo <> EmptyStr then
                begin
                  try
                    StrToInt(LCampo)
                  except
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                    DM.qryFerramentariaItens.Cancel;
                    DM.qryFerramentariaItens.Edit;
                    Exit;
                  end;

                  DM.qryRecursos.Close;
                  DM.qryRecursos.Params[0].AsString := DM.FCodCombo;
                  DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
                  DM.qryRecursos.Open;
                  if DM.qryRecursosQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                    begin
                      DM.qryRecursos.Edit;
                      DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger - StrToInt(LCampo);
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

              DM.qryFerramentariaItens.Append;
//              DM.qryFerramentariaItensCODIGO.AsInteger     := DM.qryFerramentariaItens.RecordCount + 1;
              DM.qryFerramentariaItensCODEMPRESA.AsString  := DM.FCodEmpresa;
              DM.qryFerramentariaItensCODFERRAMEM.AsString := DM.qryFerramentariaCODIGO.AsString;
              DM.qryFerramentariaItensCODRECURSO.AsString  := DM.FCodCombo;
              DM.qryFerramentariaItensQUANTIDADE.AsInteger := StrToInt(LCampo);
              DM.qryFerramentariaItensRECURSO.AsString     := DM.FValorCombo;
              DM.qryFerramentariaItens.Post;
            end
          else
            begin
              LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade da ferramenta:');
              if LCampo <> EmptyStr then
                begin
                  try
                    StrToInt(LCampo)
                  except
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                    DM.qryFerramentariaItens.Cancel;
                    DM.qryFerramentariaItens.Edit;
                    Exit;
                  end;

                  DM.qryRecursos.Close;
                  DM.qryRecursos.Params[0].AsString := DM.FCodCombo;
                  DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
                  DM.qryRecursos.Open;
                  if DM.qryRecursosQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                    begin
                      DM.qryFerramentariaItens.Edit;
                      DM.qryFerramentariaItensQUANTIDADE.AsInteger := StrToInt(LCampo);
                      DM.qryFerramentariaItens.Post;

                      DM.qryRecursos.Edit;
                      DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger - StrToInt(LCampo);
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
            end;
        end;
    DM.FDataSetParam := DM.qryFerramentaria;
    DM.FDataSourceParam := DM.dsFerramentaria;
    DM.FTela := 'CADFERRAMENTARIA';
    DM.FTabela_auxiliar := 61;
  end;
end;

procedure TFrmTelaCadRecursosFerram.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBFerramentariaIndividual;
DM.FTabela_auxiliar := 611;
  inherited;

end;

end.

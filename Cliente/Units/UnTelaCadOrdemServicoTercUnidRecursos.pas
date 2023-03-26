unit UnTelaCadOrdemServicoTercUnidRecursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadOrdemServicoTercUnidRecursos = class(TFrmTelaPaiOkCancel)
    GrdRecursos: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdRecursosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdRecursosDblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercUnidRecursos: TFrmTelaCadOrdemServicoTercUnidRecursos;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadOrdemServicoTercUnidRecursos.BtnFecharClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnidRecurso.IsEmpty then Exit;

DM.qryOrdemServicoTercUnidRecurso.Edit;
DM.qryOrdemServicoTercUnidRecurso.Post;
end;

procedure TFrmTelaCadOrdemServicoTercUnidRecursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryOrdemServicoTercUnidRecurso.Close;
end;

procedure TFrmTelaCadOrdemServicoTercUnidRecursos.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoTercUnidRecurso.Open;
end;

procedure TFrmTelaCadOrdemServicoTercUnidRecursos.GrdRecursosDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnidRecurso.IsEmpty = True then Exit;
if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then Exit;

DM.qryOrdemServicoTercUnidRecurso.Delete;
end;

procedure TFrmTelaCadOrdemServicoTercUnidRecursos.GrdRecursosKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then Exit;
if ((GrdRecursos.SelectedIndex = 0) and (Key <> #13)) then
  begin
    Key := #0;
    Exit;
  end;

if (Key = #13) and (GrdRecursos.SelectedIndex = 0) then
  begin
    DM.FTabela_auxiliar := 460;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryOrdemServicoTercUnidRecurso.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoTercUnidRecurso.Locate('CODRECURSO', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoTercUnidRecurso.Edit;
//              DM.qryOrdemServicoTercUnidRecursoCODIGO.AsInteger           := DM.qryOrdemServicoTercUnidRecurso.RecordCount + 1;
              DM.qryOrdemServicoTercUnidRecursoCODEMPRESA.AsString       := DM.FCodEmpresa;
              DM.qryOrdemServicoTercUnidRecursoCODORDEMSERVICO.AsString  := DM.FParamAuxiliar[0];
              DM.qryOrdemServicoTercUnidRecursoQUANTIDADE.AsFloat        := 0;
              DM.qryOrdemServicoTercUnidRecursoCODRECURSO.AsString       := DM.FCodCombo;
              DM.qryOrdemServicoTercUnidRecursoRECURSO.AsString          := DM.FValorCombo;
              DM.qryOrdemServicoTercUnidRecurso.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

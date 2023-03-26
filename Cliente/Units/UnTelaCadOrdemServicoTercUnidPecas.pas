unit UnTelaCadOrdemServicoTercUnidPecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmTelaCadOrdemServicoTercUnidPecas = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoTercUnidPecas: TFrmTelaCadOrdemServicoTercUnidPecas;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadOrdemServicoTercUnidPecas.BtnFecharClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnidPecas.IsEmpty then Exit;

DM.qryOrdemServicoTercUnidPecas.Edit;
DM.qryOrdemServicoTercUnidPecas.Post;
end;

procedure TFrmTelaCadOrdemServicoTercUnidPecas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryOrdemServicoTercUnidPecas.Close;
end;

procedure TFrmTelaCadOrdemServicoTercUnidPecas.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryOrdemServicoTercUnidPecas.Open;
end;

procedure TFrmTelaCadOrdemServicoTercUnidPecas.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoTercUnidPecas.IsEmpty = True then Exit;
if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then Exit;


DM.qryOrdemServicoTercUnidPecas.Delete;
end;

procedure TFrmTelaCadOrdemServicoTercUnidPecas.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if DM.qryOrdemServicoTercUnidSITUACAO.AsString = 'FECHADA' then Exit;
if (GrdCadastro.SelectedIndex = 3) then
  begin
    if DM.qryOrdemServicoTercUnidPecasCODPECAREP.AsString = EmptyStr then
      Key := #0;
  end;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 360;

    if (GrdCadastro.SelectedIndex = 1) then
      begin
        DM.FParamAuxiliar[1] := 'REFERENCIA';
      end
    else
    if (GrdCadastro.SelectedIndex = 2) then
      begin
        DM.FParamAuxiliar[1] := 'DESCRICAO';
      end
    else
      Exit;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryOrdemServicoTercUnidPecas.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoTercUnidPecas.Locate('CODPECAREP', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoTercUnidPecas.Edit;
//              DM.qryOrdemServicoTercUnidPecasCODIGO.AsInteger           := DM.qryOrdemServicoTercUnidPecas.RecordCount + 1;
              DM.qryOrdemServicoTercUnidPecasCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryOrdemServicoTercUnidPecasCODORDEMSERVICO.AsString   := DM.FParamAuxiliar[0];
              DM.qryOrdemServicoTercUnidPecasREFERENCIA.AsString        := DM.FParamAuxiliar[2];
              DM.qryOrdemServicoTercUnidPecasCODPECAREP.AsString        := DM.FCodCombo;
              DM.qryOrdemServicoTercUnidPecasQUANTIDADE.AsInteger       := 0;
              DM.qryOrdemServicoTercUnidPecasPECAREPOSICAO.AsString     := DM.FValorCombo;
              DM.qryOrdemServicoTercUnidPecas.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

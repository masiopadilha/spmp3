unit UnTelaCadEquipamentosPontosInsp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadEquipamentosPontosInsp = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCadastroDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentosPontosInsp: TFrmTelaCadEquipamentosPontosInsp;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadEquipamentosPontosInsp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
if DM.qryEquipamentosPontosInsp.Active = True then
  begin
    DM.qryEquipamentosPontosInsp.Close;
  end;
end;

procedure TFrmTelaCadEquipamentosPontosInsp.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosPontosInsp.Close;
DM.qryEquipamentosPontosInsp.Open;
DM.qryEquipamentosPontosInsp.Edit;
end;

procedure TFrmTelaCadEquipamentosPontosInsp.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryEquipamentosPontosInsp.IsEmpty = True then Exit;
DM.qryEquipamentosPontosInsp.Delete;
end;

procedure TFrmTelaCadEquipamentosPontosInsp.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 380;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryEquipamentosPontosInsp.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryEquipamentosPontosInsp.Locate('CODPONTOINSPECAO', DM.FCodCombo, []) = False then
            begin
              DM.qryEquipamentosPontosInsp.Append;
              DM.qryEquipamentosPontosInspCODEMPRESA.AsString       := DM.FCodEmpresa;
              DM.qryEquipamentosPontosInspCODEQUIPAMENTO.AsString   := DM.FParamAuxiliar[0];
              DM.qryEquipamentosPontosInspCODPONTOINSPECAO.AsString := DM.FCodCombo;
              DM.qryEquipamentosPontosInspPONTOINSPECAO.AsString    := DM.FValorCombo;
              DM.qryEquipamentosPontosInsp.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

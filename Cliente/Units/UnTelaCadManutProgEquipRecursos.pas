unit UnTelaCadManutProgEquipRecursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, UnDM;

type
  TFrmTelaCadManutProgEquipRecursos = class(TFrmTelaPaiOKCancel)
    GrdCadastro: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgEquipRecursos: TFrmTelaCadManutProgEquipRecursos;

implementation

{$R *.dfm}

uses UnTelaConsulta;

procedure TFrmTelaCadManutProgEquipRecursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
  DM.qryManutProgEquipRecursos.Close;
end;

procedure TFrmTelaCadManutProgEquipRecursos.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryManutProgEquipRecursos.Open;
end;

procedure TFrmTelaCadManutProgEquipRecursos.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryManutProgEquipRecursos.IsEmpty = True then Exit;

  DM.qryManutProgEquipRecursos.Delete;
end;

procedure TFrmTelaCadManutProgEquipRecursos.GrdCadastroKeyPress(Sender: TObject;
var Key: Char);
begin
  inherited;
  if (GrdCadastro.SelectedIndex = 2) then
    begin
      if DM.qryManutProgEquipRecursosCODRECURSO.AsString = EmptyStr then
        Key := #0;
    end;
if (Key = #13) and (GrdCadastro.SelectedIndex = 1) then
  begin
    DM.FTabela_auxiliar := 460;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryManutProgEquipRecursos.Locate('CODRECURSO', DM.FCodCombo, []) = False then
            begin
              DM.qryManutProgEquipRecursos.Append;
              DM.qryManutProgEquipRecursosCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryManutProgEquipRecursosCODMANUTPROGEQUIP.AsString := DM.FParamAuxiliar[0];
              DM.qryManutProgEquipRecursosQUANTIDADE.AsFloat         := 1;
              DM.qryManutProgEquipRecursosCODRECURSO.AsString        := DM.FCodCombo;
              DM.qryManutProgEquipRecursosRECURSO.AsString           := DM.FValorCombo;
              DM.qryManutProgEquipRecursos.Post;
              GrdCadastro.SelectedIndex := 1;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

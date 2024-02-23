unit UnTelaCadLubrificProgEquipRecursos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UnDM, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadLubrificProgEquipRecursos = class(TFrmTelaPaiOKCancel)
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
  FrmTelaCadLubrificProgEquipRecursos: TFrmTelaCadLubrificProgEquipRecursos;

implementation

{$R *.dfm}

uses UnTelaConsulta;

procedure TFrmTelaCadLubrificProgEquipRecursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
  DM.qryLubrificProgEquipRecursos.Close;
end;

procedure TFrmTelaCadLubrificProgEquipRecursos.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryLubrificProgEquipRecursos.Open;
end;

procedure TFrmTelaCadLubrificProgEquipRecursos.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryLubrificProgEquipRecursos.IsEmpty = True then Exit;

  DM.qryLubrificProgEquipRecursos.Delete;
end;

procedure TFrmTelaCadLubrificProgEquipRecursos.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if (GrdCadastro.SelectedIndex = 2) then
    begin
      if DM.qryLubrificProgEquipRecursosCODRECURSO.AsString = EmptyStr then
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
          if DM.qryLubrificProgEquipRecursos.Locate('CODRECURSO', DM.FCodCombo, []) = False then
            begin
              DM.qryLubrificProgEquipRecursos.Append;
              DM.qryLubrificProgEquipRecursosCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryLubrificProgEquipRecursosCODLUBRIFICPROGEQUIP.AsString := DM.FParamAuxiliar[0];
              DM.qryLubrificProgEquipRecursosQUANTIDADE.AsFloat         := 1;
              DM.qryLubrificProgEquipRecursosCODRECURSO.AsString        := DM.FCodCombo;
              DM.qryLubrificProgEquipRecursosRECURSO.AsString           := DM.FValorCombo;
              DM.qryLubrificProgEquipRecursos.Post;
              GrdCadastro.SelectedIndex := 1;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

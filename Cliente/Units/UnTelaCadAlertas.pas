unit UnTelaCadAlertas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, System.DateUtils, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadAlertas = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure GrdCadastroDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadAlertas: TFrmTelaCadAlertas;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadAlertas.BtnOKClick(Sender: TObject);
begin
DM.qryAlertas.Edit;
DM.qryAlertas.Post;
DM.ConsultarAlertas;
  inherited;
end;

procedure TFrmTelaCadAlertas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryAlertas.Close;
end;

procedure TFrmTelaCadAlertas.FormCreate(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPInclusaoCADRELATORIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    GrdCadastro.ReadOnly := True;
    DM.MSGAguarde('', False);
    Exit;
  end;

if (DM.qryUsuarioPAlteracaoCADRELATORIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    GrdCadastro.ReadOnly := True;
    DM.MSGAguarde('', False);
    Exit;
  end;

DM.FDataSetParam := DM.qryAlertas;
DM.FDataSourceParam := DM.dsAlertas;

DM.qryAlertas.Close;
DM.qryAlertas.Params[0].AsString := DM.FCodEmpresa;
DM.qryAlertas.Open;

end;

procedure TFrmTelaCadAlertas.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName('CADORDEMSERVICO').AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

DM.qryAlertas.Delete;
end;

end.

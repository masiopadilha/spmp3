unit UnTelaCadEquipamentosPecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadEquipamentosPecas = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentosPecas: TFrmTelaCadEquipamentosPecas;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadEquipamentosPecas.BtnOKClick(Sender: TObject);
begin
  inherited;
  DM.qryEquipamentosPecas.Post;
end;

procedure TFrmTelaCadEquipamentosPecas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
if DM.qryEquipamentosPecas.Active = True then
  begin
    DM.qryEquipamentosPecas.Close;
  end;
end;

procedure TFrmTelaCadEquipamentosPecas.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosPecas.Close;
DM.qryEquipamentosPecas.Open;
DM.qryEquipamentosPecas.Edit;
end;

procedure TFrmTelaCadEquipamentosPecas.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

DM.qryEquipamentosPecas.Delete;
end;

procedure TFrmTelaCadEquipamentosPecas.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (GrdCadastro.SelectedIndex = 3) or (GrdCadastro.SelectedIndex = 4) then
  begin
    if DM.qryEquipamentosPecasCODPECAREP.AsString = EmptyStr then
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
      DM.qryEquipamentosPecas.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryEquipamentosPecas.Locate('CODPECAREP', DM.FCodCombo, []) = False then
            begin
              DM.qryEquipamentosPecas.Append;
              DM.qryEquipamentosPecasCODEMPRESA.AsString     := DM.FCodEmpresa;
              DM.qryEquipamentosPecasCODEQUIPAMENTO.AsString := DM.FParamAuxiliar[0];
              DM.qryEquipamentosPecasREFERENCIA.AsString     := DM.FParamAuxiliar[2];
              DM.qryEquipamentosPecasCODPECAREP.AsString     := DM.FCodCombo;
              DM.qryEquipamentosPecasQUANTIDADE.AsInteger    := 1;
              DM.qryEquipamentosPecasDESCRICAO.AsString      := DM.FValorCombo;
              DM.qryEquipamentosPecasPECA.AsString           := DM.FValorCombo;
              DM.qryEquipamentosPecas.Post;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

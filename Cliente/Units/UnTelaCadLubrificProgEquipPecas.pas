unit UnTelaCadLubrificProgEquipPecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UnDM, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadLubrificProgEquipPecas = class(TFrmTelaPaiOKCancel)
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
  FrmTelaCadLubrificProgEquipPecas: TFrmTelaCadLubrificProgEquipPecas;

implementation

{$R *.dfm}

uses UnTelaConsulta;

procedure TFrmTelaCadLubrificProgEquipPecas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
  DM.qryLubrificProgEquipPecas.Close;
end;

procedure TFrmTelaCadLubrificProgEquipPecas.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryLubrificProgEquipPecas.Open;
end;

procedure TFrmTelaCadLubrificProgEquipPecas.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
  if DM.qryLubrificProgEquipPecas.IsEmpty = True then Exit;

  DM.qryLubrificProgEquipPecas.Delete;
end;

procedure TFrmTelaCadLubrificProgEquipPecas.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (GrdCadastro.SelectedIndex = 3) then
    begin
      if DM.qryLubrificProgEquipPecasCODPECAREP.AsString = EmptyStr then
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
        if DM.FCodCombo <> EmptyStr then
          begin
            if DM.qryLubrificProgEquipPecas.Locate('CODPECAREP', DM.FCodCombo, []) = False then
              begin
                DM.qryLubrificProgEquipPecas.Append;
                DM.qryLubrificProgEquipPecasCODEMPRESA.AsString        := DM.FCodEmpresa;
                DM.qryLubrificProgEquipPecasCODLUBRIFICPROGEQUIP.AsString := DM.FParamAuxiliar[0];
                DM.qryLubrificProgEquipPecasREFERENCIA.AsString        := DM.FParamAuxiliar[2];
                DM.qryLubrificProgEquipPecasCODPECAREP.AsString        := DM.FCodCombo;
                DM.qryLubrificProgEquipPecasQUANTIDADE.AsInteger       := 1;
                DM.qryLubrificProgEquipPecasPECA.AsString              := DM.FValorCombo;
                DM.qryLubrificProgEquipPecas.Post;
                GrdCadastro.SelectedIndex := 3;
              end;
          end;
        FreeAndNil(FrmTelaAuxiliar);
      End;
    end;
end;

end.

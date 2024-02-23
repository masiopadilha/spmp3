unit UnTelaCadManutProgEquipPecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadManutProgEquipPecas = class(TFrmTelaPaiOKCancel)
    GrdCadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgEquipPecas: TFrmTelaCadManutProgEquipPecas;

implementation

{$R *.dfm}

uses UnDM, UnTelaConsulta;

procedure TFrmTelaCadManutProgEquipPecas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
  DM.qryManutProgEquipPecas.Close;
end;

procedure TFrmTelaCadManutProgEquipPecas.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryManutProgEquipPecas.Open;
end;

procedure TFrmTelaCadManutProgEquipPecas.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
  if DM.qryManutProgEquipPecas.IsEmpty = True then Exit;

  DM.qryManutProgEquipPecas.Delete;
end;

procedure TFrmTelaCadManutProgEquipPecas.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (GrdCadastro.SelectedIndex = 3) then
    begin
      if DM.qryManutProgEquipPecasCODPECAREP.AsString = EmptyStr then
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
            if DM.qryManutProgEquipPecas.Locate('CODPECAREP', DM.FCodCombo, []) = False then
              begin
                DM.qryManutProgEquipPecas.Append;
                DM.qryManutProgEquipPecasCODEMPRESA.AsString        := DM.FCodEmpresa;
                DM.qryManutProgEquipPecasCODMANUTPROGEQUIP.AsString := DM.FParamAuxiliar[0];
                DM.qryManutProgEquipPecasREFERENCIA.AsString        := DM.FParamAuxiliar[2];
                DM.qryManutProgEquipPecasCODPECAREP.AsString        := DM.FCodCombo;
                DM.qryManutProgEquipPecasQUANTIDADE.AsInteger       := 1;
                DM.qryManutProgEquipPecasPECA.AsString              := DM.FValorCombo;
                DM.qryManutProgEquipPecas.Post;
                GrdCadastro.SelectedIndex := 3;
              end;
          end;
        FreeAndNil(FrmTelaAuxiliar);
      End;
    end;

end;

end.

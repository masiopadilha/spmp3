unit UnTelaCadEquipamentosContadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadEquipamentosContadores = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
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
  FrmTelaCadEquipamentosContadores: TFrmTelaCadEquipamentosContadores;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadEquipamentosContadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
if DM.qryEquipamentosContadores.Active = True then
  begin
    DM.qryEquipamentosContadores.Close;
  end;
end;

procedure TFrmTelaCadEquipamentosContadores.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryEquipamentosContadores.Close;
DM.qryEquipamentosContadores.Open;
DM.qryEquipamentosContadores.Edit;
end;

procedure TFrmTelaCadEquipamentosContadores.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryEquipamentosContadores.IsEmpty = True then Exit;
DM.qryEquipamentosContadores.Delete;
end;

procedure TFrmTelaCadEquipamentosContadores.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (Key = #13) then
  begin
    if GrdCadastro.SelectedIndex = 1 then
      begin
        DM.FTabela_auxiliar := 390;
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          DM.qryEquipamentosContadores.Edit;
          if DM.FCodCombo <> EmptyStr then
            begin
              if DM.qryEquipamentosContadores.Locate('CODCONTADOR', DM.FCodCombo, []) = False then
                begin
                  DM.qryEquipamentosContadores.Append;
                  //if DM.qryEquipamentosContadoresCODIGO.IsNull = True then
                     //DM.qryEquipamentosContadoresCODIGO.AsInteger       := DM.SMWebClient.GerarSequencia('EQUIPAMENTOSCONT_S');
                  DM.qryEquipamentosContadoresCODEMPRESA.AsString     := DM.FCodEmpresa;
                  DM.qryEquipamentosContadoresCODEQUIPAMENTO.AsString := DM.FParamAuxiliar[0];
                  DM.qryEquipamentosContadoresCODCONTADOR.AsString    := DM.FCodCombo;
                  DM.qryEquipamentosContadoresDESCRICAO.AsString      := DM.FValorCombo;
                  DM.qryEquipamentosContadoresCONTADOR.AsString       := DM.FValorCombo;
                  DM.qryEquipamentosContadoresPROGRAMACAO.AsString    := DM.FParamAuxiliar[3];
                  DM.qryEquipamentosContadores.Post;
                end;
            end;
          FreeAndNil(FrmTelaAuxiliar);
        End;
      end;
  end;
end;

end.

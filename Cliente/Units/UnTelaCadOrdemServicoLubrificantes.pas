unit UnTelaCadOrdemServicoLubrificantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTelaCadOrdemServicoLubrificantes = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    procedure BtnOKClick(Sender: TObject);
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
  FrmTelaCadOrdemServicoLubrificantes: TFrmTelaCadOrdemServicoLubrificantes;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadOrdemServicoLubrificantes.BtnOKClick(Sender: TObject);
begin
PAuxiliares.Font.Color    := clGreen;
PAuxiliares.Caption       := EmptyStr;
DM.qryOrdemServicoEquipeLubrificantes.First;
while not DM.qryOrdemServicoEquipeLubrificantes.Eof = True do
  begin
    if DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsInteger <= 0 then
      begin
        PAuxiliares.Font.Color    := clRed;
        PAuxiliares.Caption       := 'QUANTIDADE INVÁLIDA!';
        GrdCadastro.SelectedIndex := 2;
        GrdCadastro.SetFocus;
        Exit;;
      end;
    DM.qryOrdemServicoEquipeLubrificantes.Next;
   end;
  inherited;

end;

procedure TFrmTelaCadOrdemServicoLubrificantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

DM.qryOrdemServicoEquipeLubrificantes.Close;
end;

procedure TFrmTelaCadOrdemServicoLubrificantes.FormCreate(Sender: TObject);
begin
  inherited;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA')
  and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'PROGRAMADA') then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption    := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
      GrdCadastro.ReadOnly   := True;
    end;

DM.qryOrdemServicoEquipeLubrificantes.Open;
end;

procedure TFrmTelaCadOrdemServicoLubrificantes.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoEquipePecas.IsEmpty = True then Exit;

if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA')
  and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA')  and (DM.qryOrdemServicoSITUACAO.AsString <> 'PROGRAMADA') then
    begin
      PAuxiliares.Font.Color  := clRed;
      PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    end
else
  DM.qryOrdemServicoEquipeLubrificantes.Delete;
end;

procedure TFrmTelaCadOrdemServicoLubrificantes.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA')  and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    GrdCadastro.ReadOnly      := True;
    Exit;
  end;

if (GrdCadastro.SelectedIndex = 3) then
  begin
    if DM.qryOrdemServicoEquipeLubrificantesCODLUBRIFICANTE.AsString = EmptyStr then
      Key := #0;
  end;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 6400;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      DM.qryOrdemServicoEquipeLubrificantes.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoEquipeLubrificantes.Locate('CODLUBRIFICANTE', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoEquipeLubrificantes.Append;
              DM.qryOrdemServicoEquipeLubrificantesCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipeLubrificantesCODORDEMSERVICO.AsString   := DM.FParamAuxiliar[0];
              DM.qryOrdemServicoEquipeLubrificantesCODLUBRIFICANTE.AsString   := DM.FCodCombo;
              DM.qryOrdemServicoEquipeLubrificantesQTDESOLIC.AsInteger        := 0;
              DM.qryOrdemServicoEquipeLubrificantesLUBRIFICANTE.AsString      := DM.FValorCombo;
              DM.qryOrdemServicoEquipeLubrificantesENTRADA.AsDateTime         := DM.FDataHoraServidor;
              DM.qryOrdemServicoEquipeLubrificantes.Post;

              GrdCadastro.SelectedIndex := 2;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

unit UnTelaCadOrdemServicoPecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.DateUtils, Data.DB;

type
  TFrmTelaCadOrdemServicoPecas = class(TFrmTelaPaiOKCancel)
    GrdCadastro: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKClick(Sender: TObject);
    procedure GrdCadastroDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoPecas: TFrmTelaCadOrdemServicoPecas;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDM;

procedure TFrmTelaCadOrdemServicoPecas.BtnOKClick(Sender: TObject);
begin
PAuxiliares.Font.Color    := clGreen;
PAuxiliares.Caption       := EmptyStr;
DM.qryOrdemServicoEquipePecas.First;
while not DM.qryOrdemServicoEquipePecas.Eof = True do
  begin
    if DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger <= 0 then
      begin
        PAuxiliares.Font.Color    := clRed;
        PAuxiliares.Caption       := 'QUANTIDADE INVÁLIDA!';
        GrdCadastro.SelectedIndex := 3;
        GrdCadastro.SetFocus;
        Exit;
      end;
    DM.qryOrdemServicoEquipePecas.Next;
   end;

  DM.qryOrdemServicoEquipePecas.Close;
  inherited;
end;

procedure TFrmTelaCadOrdemServicoPecas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
//DM.qryOrdemServicoEquipePecas.Close;
end;

procedure TFrmTelaCadOrdemServicoPecas.FormCreate(Sender: TObject);
begin
  inherited;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA')
  and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA')and (DM.qryOrdemServicoSITUACAO.AsString <> 'PROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
    begin
      PAuxiliares.Font.Color := clRed;
      PAuxiliares.Caption    := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
      GrdCadastro.ReadOnly   := True;
    end;

DM.qryOrdemServicoEquipePecas.Open;
end;

procedure TFrmTelaCadOrdemServicoPecas.GrdCadastroDblClick(Sender: TObject);
begin
  inherited;
if DM.qryOrdemServicoEquipePecas.IsEmpty = True then Exit;

if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA')
  and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'PROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
    begin
      PAuxiliares.Font.Color  := clRed;
      PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    end
else
  DM.qryOrdemServicoEquipePecas.Delete;
end;

procedure TFrmTelaCadOrdemServicoPecas.GrdCadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (DM.qryOrdemServicoSITUACAO.AsString <> 'CADASTRADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'SOLICITADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DESPROGRAMADA') and (DM.qryOrdemServicoSITUACAO.AsString <> 'DETALHADA') then
  begin
    PAuxiliares.Font.Color  := clRed;
    PAuxiliares.Caption     := 'ORDEM DE SERVIÇO: '+DM.qryOrdemServicoSITUACAO.AsString+', ALTERAÇÕES NÃO PERMITIDAS!';
    GrdCadastro.ReadOnly      := True;
    Exit;
  end;

if (GrdCadastro.SelectedIndex = 3) then
  begin
    if DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString = EmptyStr then
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
      DM.qryOrdemServicoEquipePecas.Edit;
      if DM.FCodCombo <> EmptyStr then
        begin
          if DM.qryOrdemServicoEquipePecas.Locate('CODPECASREPOSICAO', DM.FCodCombo, []) = False then
            begin
              DM.qryOrdemServicoEquipePecas.Append;
              DM.qryOrdemServicoEquipePecasCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipePecasCODORDEMSERVICO.AsString   := DM.FParamAuxiliar[0];
              DM.qryOrdemServicoEquipePecasREFERENCIA.AsString        := DM.FParamAuxiliar[2];
              DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString := DM.FCodCombo;
              DM.qryOrdemServicoEquipePecasQTDESOLIC.AsInteger        := 1;
              DM.qryOrdemServicoEquipePecasPECA.AsString              := DM.FValorCombo;
              DM.qryOrdemServicoEquipePecasENTRADA.AsDateTime         := DM.FDataHoraServidor;
              DM.qryOrdemServicoEquipePecas.Post;

              GrdCadastro.SelectedIndex := 3;
            end;
        end;
      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

end.

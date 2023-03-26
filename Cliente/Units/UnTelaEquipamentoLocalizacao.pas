unit UnTelaEquipamentoLocalizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Data.DB;

type
  TFrmTelaEquipamentoLocalizacao = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtCodArea: TEdit;
    EdtArea: TEdit;
    EdtCodCelula: TEdit;
    EdtCelula: TEdit;
    BtnArea: TButton;
    BtnCelula: TButton;
    EdtCodLinha: TEdit;
    EdtLinha: TEdit;
    BtnLinha: TButton;
    EdtCodSequencia: TEdit;
    EdtSequencia: TEdit;
    BtnSequencia: TButton;
    LblCodigo: TDBText;
    LblDescricao: TDBText;
    procedure BtnAreaClick(Sender: TObject);
    procedure BtnCelulaClick(Sender: TObject);
    procedure BtnLinhaClick(Sender: TObject);
    procedure BtnSequenciaClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaEquipamentoLocalizacao: TFrmTelaEquipamentoLocalizacao;
  LCodArea, LCodCelula, LCodLinha, LCodSequencia : String;
implementation

{$R *.dfm}

uses UnCMWeb, UnTelaCadEquipamentoReserva;

procedure TFrmTelaEquipamentoLocalizacao.BtnAreaClick(Sender: TObject);
begin
  inherited;
CMWeb.FTabela_auxiliar := 150;
if CMWeb.ConsultarCombo <> '' then
  begin
    LCodArea        := CMWeb.FCodCombo;
    EdtCodArea.Text := CMWeb.FCodCombo;
    EdtArea.Text    := CMWeb.FValorCombo;
    CMWeb.CDEquipamentoLocal.Close;
  end;
end;

procedure TFrmTelaEquipamentoLocalizacao.BtnCelulaClick(Sender: TObject);
begin
  inherited;
if EdtCodArea.Text = '' then
  begin
    EdtArea.SetFocus;
    Exit;
  end;

CMWeb.FTabela_auxiliar := 160;
CMWeb.FParamAuxiliar[1] := EdtCodArea.Text;
if CMWeb.ConsultarCombo <> '' then
  begin
    LCodCelula        := CMWeb.FCodCombo;
    EdtCodCelula.Text := CMWeb.FCodCombo;
    EdtCelula.Text    := CMWeb.FValorCombo;
    CMWeb.CDEquipamentoLocal.Close;
  end;
end;

procedure TFrmTelaEquipamentoLocalizacao.BtnFecharClick(Sender: TObject);
begin
CMWeb.CDEquipamentoLocal.Close;
  inherited;
end;

procedure TFrmTelaEquipamentoLocalizacao.BtnLinhaClick(Sender: TObject);
begin
  inherited;
if EdtCodCelula.Text = '' then
  begin
    EdtCelula.SetFocus;
    Exit;
  end;

CMWeb.FTabela_auxiliar := 170;
CMWeb.FParamAuxiliar[1] := EdtCodArea.Text;
CMWeb.FParamAuxiliar[2] := EdtCodCelula.Text;
if CMWeb.ConsultarCombo <> '' then
  begin
    LCodLinha        := CMWeb.FCodCombo;
    EdtCodLinha.Text := CMWeb.FCodCombo;
    EdtLinha.Text    := CMWeb.FValorCombo;
    CMWeb.CDEquipamentoLocal.Close;
  end;
end;

procedure TFrmTelaEquipamentoLocalizacao.BtnSequenciaClick(Sender: TObject);
begin
  inherited;
if EdtCodLinha.Text = '' then
  begin
    EdtLinha.SetFocus;
    Exit;
  end;

CMWeb.FTabela_auxiliar := 85;
CMWeb.FParamAuxiliar[1] := EdtCodArea.Text;
CMWeb.FParamAuxiliar[2] := EdtCodCelula.Text;
CMWeb.FParamAuxiliar[3] := EdtCodLinha.Text;
if CMWeb.ConsultarCombo <> '' then
  begin
    LCodSequencia := CMWeb.FCodCombo;
    CMWeb.CDEquipamentoLocal.Close;
    CMWeb.CDEquipamentoLocal.Params[0].AsString := CMWeb.FCodEmpresa;
    CMWeb.CDEquipamentoLocal.Params[1].AsString := CMWeb.FParamAuxiliar[6];
    CMWeb.CDEquipamentoLocal.Open;
    EdtCodSequencia.Text := CMWeb.FCodCombo;
    EdtSequencia.Text    := CMWeb.FValorCombo;
    if CMWeb.CDEquipamentoLocalRESERVA.AsString = 'S' then
      begin
        LblCodigo.Font.Color := clGreen;
        LblDescricao.Font.Color := clGreen;
      end
    else
      begin
        LblCodigo.Font.Color := clRed;
        LblDescricao.Font.Color := clRed;
      end;

    if FrmTelaCadEquipamentoReserva <> nil then
      begin
        if CMWeb.CDEquipamentoLocalDados.IsEmpty = False then
          begin
            with FrmTelaCadEquipamentoReserva do
              begin
                SGrdDadosEquip.Cells[0, 0] := CMWeb.CDEquipamentoLocalDadosCAMPO1.AsString;
                SGrdDadosEquip.Cells[0, 1] := CMWeb.CDEquipamentoLocalDadosCAMPO2.AsString;
                SGrdDadosEquip.Cells[0, 2] := CMWeb.CDEquipamentoLocalDadosCAMPO3.AsString;
                SGrdDadosEquip.Cells[0, 3] := CMWeb.CDEquipamentoLocalDadosCAMPO4.AsString;
                SGrdDadosEquip.Cells[0, 4] := CMWeb.CDEquipamentoLocalDadosCAMPO5.AsString;
                SGrdDadosEquip.Cells[0, 5] := CMWeb.CDEquipamentoLocalDadosCAMPO6.AsString;
                SGrdDadosEquip.Cells[0, 6] := CMWeb.CDEquipamentoLocalDadosCAMPO7.AsString;
                SGrdDadosEquip.Cells[0, 7] := CMWeb.CDEquipamentoLocalDadosCAMPO8.AsString;
                SGrdDadosEquip.Cells[0, 8] := CMWeb.CDEquipamentoLocalDadosCAMPO9.AsString;
                SGrdDadosEquip.Cells[0, 9] := CMWeb.CDEquipamentoLocalDadosCAMPO10.AsString;
                SGrdDadosEquip.Cells[0, 10] := CMWeb.CDEquipamentoLocalDadosCAMPO11.AsString;

                SGrdDadosEquip.Cells[1, 0] := CMWeb.CDEquipamentoLocalDadosREGISTRO1.AsString;
                SGrdDadosEquip.Cells[1, 1] := CMWeb.CDEquipamentoLocalDadosREGISTRO2.AsString;
                SGrdDadosEquip.Cells[1, 2] := CMWeb.CDEquipamentoLocalDadosREGISTRO3.AsString;
                SGrdDadosEquip.Cells[1, 3] := CMWeb.CDEquipamentoLocalDadosREGISTRO4.AsString;
                SGrdDadosEquip.Cells[1, 4] := CMWeb.CDEquipamentoLocalDadosREGISTRO5.AsString;
                SGrdDadosEquip.Cells[1, 5] := CMWeb.CDEquipamentoLocalDadosREGISTRO6.AsString;
                SGrdDadosEquip.Cells[1, 6] := CMWeb.CDEquipamentoLocalDadosREGISTRO7.AsString;
                SGrdDadosEquip.Cells[1, 7] := CMWeb.CDEquipamentoLocalDadosREGISTRO8.AsString;
                SGrdDadosEquip.Cells[1, 8] := CMWeb.CDEquipamentoLocalDadosREGISTRO9.AsString;
                SGrdDadosEquip.Cells[1, 9] := CMWeb.CDEquipamentoLocalDadosREGISTRO10.AsString;
                SGrdDadosEquip.Cells[1, 10] := CMWeb.CDEquipamentoLocalDadosREGISTRO11.AsString;
              end;
          end;

      end;
  end;

end;

procedure TFrmTelaEquipamentoLocalizacao.FormCreate(Sender: TObject);
begin
  inherited;
CMWeb.CDEquipamentoLocal.Close;
end;

end.

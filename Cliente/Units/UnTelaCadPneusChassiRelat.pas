unit UnTelaCadPneusChassiRelat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, System.DateUtils, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadPneusChassiRelat = class(TFrmTelaPaiOkCancel)
    RGTipo: TRadioGroup;
    EdtData1: TDateTimePicker;
    Label1: TLabel;
    EdtData2: TDateTimePicker;
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassiRelat: TFrmTelaCadPneusChassiRelat;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDmRelatorios, UnTelaCadPneusChassi,
  UnTelaCadPneusChassiPneus, UnDM;

procedure TFrmTelaCadPneusChassiRelat.BtnOKClick(Sender: TObject);
begin
  inherited;
if EdtData1.Date > EdtData2.Date then Exit;

case RGTipo.ItemIndex of
  0:
    begin
      Try
        DM.FTabela_auxiliar := 8201;
        Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
        FrmTelaAuxiliar.ShowModal;
      Finally
        FreeAndNil(FrmTelaAuxiliar);
        if DM.FCodCombo <> '' then
          begin
            DM.qryPneusChassiCusto.Close;
            DM.qryPneusChassiCusto.Params[0].AsString := DM.FCodEmpresa;
            DM.qryPneusChassiCusto.Params[1].AsString := DM.FCodCombo;
            DM.qryPneusChassiCusto.Params[2].AsString := FormatDateTime('dd/mm/yyyy', EdtData1.Date);
            DM.qryPneusChassiCusto.Params[3].AsString := FormatDateTime('dd/mm/yyyy', EdtData2.Date);
            DM.qryPneusChassiCusto.Open;
            if DM.qryPneusChassiCusto.IsEmpty = False then
              DmRelatorios.frxRPneusChassiCusto.ShowReport()
            else
              begin
                Application.MessageBox('Nenhum custo encontrado!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
              end;
          end;
      End;
    end;
  1:
    begin
      Try
        DM.FTabela_auxiliar := 8201;
        Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
        FrmTelaAuxiliar.ShowModal;
      Finally
        FreeAndNil(FrmTelaAuxiliar);
      End;

      if DM.FCodCombo <> '' then
        begin
          DM.qryPneusChassiCusto.Close;
          DM.qryPneusChassiCusto.Params[0].AsString := DM.FCodEmpresa;
          DM.qryPneusChassiCusto.Params[1].AsString := DM.FCodCombo;
          DM.qryPneusChassiCusto.Params[2].AsString := FormatDateTime('dd/mm/yyyy', EdtData1.Date);
          DM.qryPneusChassiCusto.Params[3].AsString := FormatDateTime('dd/mm/yyyy', EdtData2.Date);
          DM.qryPneusChassiCusto.Open;

          DM.FParamAuxiliar[1] := DM.FCodCombo;
          Try
            DM.FTabela_auxiliar := 94;
            Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
            FrmTelaAuxiliar.ShowModal;
          Finally
            FreeAndNil(FrmTelaAuxiliar);
            if DM.FCodCombo <> '' then
              begin
                DM.qryPneusChassiCusto.Filtered := False;
                DM.qryPneusChassiCusto.Filter := 'POSICAO = ' + QuotedStr(DM.FParamAuxiliar[2]);
                DM.qryPneusChassiCusto.Filtered := True;
                if DM.qryPneusChassiCusto.IsEmpty = False then
                  DmRelatorios.frxRPneusChassiCusto.ShowReport()
                else
                  begin
                    Application.MessageBox('Nenhum custo encontrado!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
                  end;
                DM.qryPneusChassiCusto.Filtered := False;
              end;            
          End;
        end;
    end;
  2:
    begin
      Try
        DM.FTabela_auxiliar := 93;
        Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
        FrmTelaAuxiliar.ShowModal;
      Finally
        FreeAndNil(FrmTelaAuxiliar);
        if DM.FCodCombo <> '' then
          begin
            DM.qryPneusChassiIDCusto.Close;
            DM.qryPneusChassiIDCusto.Params[0].AsString := DM.FCodEmpresa;
            DM.qryPneusChassiIDCusto.Params[1].AsString := DM.FCodCombo;
            DM.qryPneusChassiIDCusto.Params[2].AsString := FormatDateTime('dd/mm/yyyy', EdtData1.Date);
            DM.qryPneusChassiIDCusto.Params[3].AsString := FormatDateTime('dd/mm/yyyy', EdtData2.Date);
            DM.qryPneusChassiIDCusto.Open;
            if DM.qryPneusChassiIDCusto.IsEmpty = False then
              DmRelatorios.frxRPneusChassiIDCusto.ShowReport()
            else
              begin
                Application.MessageBox('Nenhum custo encontrado!', 'SPMP3', MB_OK + MB_ICONINFORMATION);
              end;
          end;
      End;
    end;
end;
end;

procedure TFrmTelaCadPneusChassiRelat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.FParamAuxiliar[1] := '';
DM.FParamAuxiliar[2] := '';
DM.qryPneusChassiCusto.Close;
end;

procedure TFrmTelaCadPneusChassiRelat.FormCreate(Sender: TObject);
begin
  inherited;
EdtData1.Date := IncDay(DateOf(DM.FDataHoraServidor), -30);
EdtData2.Date := DateOf(DM.FDataHoraServidor);
end;

end.



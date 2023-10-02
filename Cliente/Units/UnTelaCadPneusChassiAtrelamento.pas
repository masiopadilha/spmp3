unit UnTelaCadPneusChassiAtrelamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Menus,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB,
  Vcl.Grids, Vcl.DBGrids, System.DateUtils, FireDAC.Stan.Param;

type
  TFrmTelaCadPneusChassiAtrelamento = class(TFrmTelaPaiOkCancel)
    Panel1: TPanel;
    ImgCavalo: TImage;
    ImgCarroceria1: TImage;
    ImgCarroceria2: TImage;
    ImgCarroceria3: TImage;
    Label4: TLabel;
    EdtDescCarroceria1: TDBEdit;
    BtnCarroceria1: TButton;
    Label6: TLabel;
    EdtDescCarroceria2: TDBEdit;
    BtnCarroceria2: TButton;
    Label7: TLabel;
    EdtDescCarroceria3: TDBEdit;
    BtnCarroceria3: TButton;
    PopupMenuCarroc: TPopupMenu;
    Instalar1: TMenuItem;
    Remover1: TMenuItem;
    Cancelar1: TMenuItem;
    BtnImprimir: TButton;
    procedure Instalar1Click(Sender: TObject);
    procedure Remover1Click(Sender: TObject);
    procedure AlimentaHistorico(Operacao:string);
    procedure BtnCarroceria1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPneusChassiAtrelamento: TFrmTelaCadPneusChassiAtrelamento;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadPneusChassiAtrelamento.BtnCarroceria1Click(
  Sender: TObject);
begin
  inherited;
PopupMenuCarroc.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadPneusChassiAtrelamento.BtnImprimirClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.qryPneusChassiAtrelamentoRelat.Params[0].AsString := DM.FCodEmpresa;
DM.qryPneusChassiAtrelamentoRelat.Open;

DmRelatorios.frxDBPneusChassiAtrelamento.Open;
DmRelatorios.frxRPneusChassiAtrelamento.ShowReport();
DmRelatorios.frxDBPneusChassiAtrelamento.Close;

DM.qryPneusChassiAtrelamentoRelat.Close;
end;

procedure TFrmTelaCadPneusChassiAtrelamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryPneusChassiAtrelamento.Close;
DM.qryPneusChassiAtrelamentoHist.Close;
DM.qryPneusChassiPneus.Filtered := False;
end;

procedure TFrmTelaCadPneusChassiAtrelamento.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryPneusChassiAtrelamento.Open;
DM.qryPneusChassiAtrelamentoHist.Open;

if DM.qryPneusChassiAtrelamento.IsEmpty = True then
  begin
    DM.qryPneusChassiAtrelamento.Append;
    DM.qryPneusChassiAtrelamentoCODEMPRESA.AsString := DM.FCodEmpresa;
    DM.qryPneusChassiAtrelamentoCODCHASSI.AsInteger := DM.qryPneusChassiCODIGO.AsInteger;
    DM.qryPneusChassiAtrelamento.Post;
  end;

DM.qryPneusChassiImagens.Close;
DM.qryPneusChassiImagens.Params[0].AsString := DM.qryPneusChassiCHASSI.AsString;
DM.qryPneusChassiImagens.Open;
DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgCavalo);

if DM.qryPneusChassiAtrelamentoCHASSICARROCEIRA1.AsString <> '' then
  begin
    DM.qryPneusChassiImagens.Close;
    DM.qryPneusChassiImagens.Params[0].AsString := DM.qryPneusChassiAtrelamentoCHASSICARROCEIRA1.AsString;
    DM.qryPneusChassiImagens.Open;
    DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgCarroceria1);
  end;

if DM.qryPneusChassiAtrelamentoCHASSICARROCEIRA2.AsString <> '' then
  begin
    DM.qryPneusChassiImagens.Close;
    DM.qryPneusChassiImagens.Params[0].AsString := DM.qryPneusChassiAtrelamentoCHASSICARROCEIRA2.AsString;
    DM.qryPneusChassiImagens.Open;
    DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgCarroceria2);
  end;

if DM.qryPneusChassiAtrelamentoCHASSICARROCEIRA3.AsString <> '' then
  begin
    DM.qryPneusChassiImagens.Close;
    DM.qryPneusChassiImagens.Params[0].AsString := DM.qryPneusChassiAtrelamentoCHASSICARROCEIRA3.AsString;
    DM.qryPneusChassiImagens.Open;
    DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgCarroceria3);
  end;
end;

procedure TFrmTelaCadPneusChassiAtrelamento.Instalar1Click(Sender: TObject);
begin
  inherited;
DM.qryPneusChassi.Edit;
DM.qryPneusChassi.Post;

if BtnCarroceria1.Focused = True then
  begin
    DM.FTabela_auxiliar := 8200;
    DM.FNomeConsulta := 'Carrocerias';
    DM.qryPneusChassiAtrelamento.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        if DM.FCodCombo = DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString then
          begin
            EdtDescCarroceria2.SetFocus; PAuxiliares.Font.Color := clGreen; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
          end;
        if DM.FCodCombo = DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString then
          begin
            EdtDescCarroceria3.SetFocus; PAuxiliares.Font.Color := clGreen; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
          end;
        DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString       := DM.FCodCombo;
        DM.qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA1.AsString := DM.FValorCombo;

        DM.qryPneusChassiAtrelamentoStatus.Close;
        DM.qryPneusChassiAtrelamentoStatus.Params[0].AsString := 'ATIVO';
        DM.qryPneusChassiAtrelamentoStatus.Params[1].AsString := DM.qryPneusChassiCONTADOR.AsString;
        DM.qryPneusChassiAtrelamentoStatus.Params[2].AsString := DM.FCodEmpresa;
        DM.qryPneusChassiAtrelamentoStatus.Params[3].AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString;
        DM.qryPneusChassiAtrelamentoStatus.Execute;

        DM.qryPneusChassiAtrelamento.Post;
        DM.qryPneusChassiAtrelamento.Close;
        DM.qryPneusChassiAtrelamento.Params[0].AsString := DM.FCodEmpresa;
        DM.qryPneusChassiAtrelamento.Params[1].AsString := DM.qryPneusChassiCODIGO.AsString;
        DM.qryPneusChassiAtrelamento.Open;

        DM.qryPneusChassiImagens.Close;
        DM.qryPneusChassiImagens.Params[0].AsString := DM.FParamAuxiliar[2];
        DM.qryPneusChassiImagens.Open;

        DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgCarroceria1);

        AlimentaHistorico('INSTALADO');
      end;
  end;
if BtnCarroceria2.Focused = True then
  begin
    DM.FTabela_auxiliar := 8200;
    DM.FNomeConsulta := 'Carrocerias';
    DM.qryPneusChassiAtrelamento.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        if DM.FCodCombo = DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString then
          begin
            EdtDescCarroceria2.SetFocus; PAuxiliares.Font.Color := clGreen; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
          end;
        if DM.FCodCombo = DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString then
          begin
            EdtDescCarroceria3.SetFocus; PAuxiliares.Font.Color := clGreen; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
          end;
        DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString       := DM.FCodCombo;
        DM.qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA2.AsString := DM.FValorCombo;

        DM.qryPneusChassiAtrelamentoStatus.Close;
        DM.qryPneusChassiAtrelamentoStatus.Params[0].AsString := 'ATIVO';
        DM.qryPneusChassiAtrelamentoStatus.Params[1].AsString := DM.qryPneusChassiCONTADOR.AsString;
        DM.qryPneusChassiAtrelamentoStatus.Params[2].AsString := DM.FCodEmpresa;
        DM.qryPneusChassiAtrelamentoStatus.Params[3].AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString;
        DM.qryPneusChassiAtrelamentoStatus.Execute;

        DM.qryPneusChassiAtrelamento.Post;
        DM.qryPneusChassiAtrelamento.Close;
        DM.qryPneusChassiAtrelamento.Params[0].AsString := DM.FCodEmpresa;
        DM.qryPneusChassiAtrelamento.Params[1].AsString := DM.qryPneusChassiCODIGO.AsString;
        DM.qryPneusChassiAtrelamento.Open;

        DM.qryPneusChassiImagens.Close;
        DM.qryPneusChassiImagens.Params[0].AsString := DM.FParamAuxiliar[2];
        DM.qryPneusChassiImagens.Open;

        DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgCarroceria2);

        AlimentaHistorico('INSTALADO');
      end;
  end;
if BtnCarroceria3.Focused = True then
  begin
    DM.FTabela_auxiliar := 8200;
    DM.FNomeConsulta := 'Carrocerias';
    DM.qryPneusChassiAtrelamento.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        if DM.FCodCombo = DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString then
          begin
            EdtDescCarroceria2.SetFocus; PAuxiliares.Font.Color := clGreen; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
          end;
        if DM.FCodCombo = DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString then
          begin
            EdtDescCarroceria3.SetFocus; PAuxiliares.Font.Color := clGreen; PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!'; Exit;
          end;
        DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString       := DM.FCodCombo;
        DM.qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA3.AsString := DM.FValorCombo;

        DM.qryPneusChassiAtrelamentoStatus.Close;
        DM.qryPneusChassiAtrelamentoStatus.Params[0].AsString := 'ATIVO';
        DM.qryPneusChassiAtrelamentoStatus.Params[1].AsString := DM.qryPneusChassiCONTADOR.AsString;
        DM.qryPneusChassiAtrelamentoStatus.Params[2].AsString := DM.FCodEmpresa;
        DM.qryPneusChassiAtrelamentoStatus.Params[3].AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString;
        DM.qryPneusChassiAtrelamentoStatus.Execute;

        DM.qryPneusChassiAtrelamento.Post;
        DM.qryPneusChassiAtrelamento.Close;
        DM.qryPneusChassiAtrelamento.Params[0].AsString := DM.FCodEmpresa;
        DM.qryPneusChassiAtrelamento.Params[1].AsString := DM.qryPneusChassiCODIGO.AsString;
        DM.qryPneusChassiAtrelamento.Open;

        DM.qryPneusChassiImagens.Close;
        DM.qryPneusChassiImagens.Params[0].AsString := DM.FParamAuxiliar[2];
        DM.qryPneusChassiImagens.Open;

        DM.ExibeFoto(DM.qryPneusChassiImagens, 'IMAGEM', ImgCarroceria3);

        AlimentaHistorico('INSTALADO');
      end;
  end;
end;

procedure TFrmTelaCadPneusChassiAtrelamento.Remover1Click(Sender: TObject);
begin
  inherited;
DM.qryPneusChassi.Edit;
DM.qryPneusChassi.Post;

if BtnCarroceria1.Focused = True then
  begin
    if DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString = EmptyStr then Exit;
    if DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString <> EmptyStr then
      begin
        BtnCarroceria3.SetFocus;
        Exit;
      end;
    if DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString <> EmptyStr then
      begin
        BtnCarroceria2.SetFocus;
        Exit;
      end;

    DM.qryPneusChassiPneus.Filtered := False;
    DM.qryPneusChassiPneus.Filter   := 'CODCHASSI = '+ QuotedStr(DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString);
    DM.qryPneusChassiPneus.Filtered := True;

    DM.qryPneusChassiPneus.First;
    while not DM.qryPneusChassiPneus.Eof = True do
      begin
        DM.qryPneusChassiPneus.Edit;
        DM.qryPneusChassiPneusRODADOS.AsFloat  := DM.qryPneusChassiPneusRODADOS.AsFloat + (DM.qryPneusChassiCONTADOR.AsFloat - DM.qryPneusChassiPneusCONTADOR.AsFloat);
        DM.qryPneusChassiPneusCONTADOR.AsFloat := 0;
        DM.qryPneusChassiPneus.Post;

        DM.qryPneusChassiPneus.Next;
      end;

    DM.qryPneusChassiAtrelamentoStatus.Close;
    DM.qryPneusChassiAtrelamentoStatus.Params[0].AsString := 'PARADO';
    DM.qryPneusChassiAtrelamentoStatus.Params[1].AsString := '0';
    DM.qryPneusChassiAtrelamentoStatus.Params[2].AsString := DM.FCodEmpresa;
    DM.qryPneusChassiAtrelamentoStatus.Params[3].AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString;
    DM.qryPneusChassiAtrelamentoStatus.Execute;

    DM.qryPneusChassiAtrelamento.Edit;
    DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString       := EmptyStr;
    DM.qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA1.AsString := EmptyStr;
    DM.qryPneusChassiAtrelamento.Post;

    ImgCarroceria1.Picture.Assign(nil);
    DM.qryPneusChassiPneus.Filtered := False;
  end;

if BtnCarroceria2.Focused = True then
  begin
    if DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString = EmptyStr then Exit;
    if DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString <> EmptyStr then
      begin
        BtnCarroceria3.SetFocus;
        Exit;
      end;

    DM.qryPneusChassiPneus.Filtered := False;
    DM.qryPneusChassiPneus.Filter   := 'CODCHASSI = '+ QuotedStr(DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString);
    DM.qryPneusChassiPneus.Filtered := True;

    DM.qryPneusChassiPneus.First;
    while not DM.qryPneusChassiPneus.Eof = True do
      begin
        DM.qryPneusChassiPneus.Edit;
        DM.qryPneusChassiPneusRODADOS.AsFloat  := DM.qryPneusChassiPneusRODADOS.AsFloat + (DM.qryPneusChassiCONTADOR.AsFloat - DM.qryPneusChassiPneusCONTADOR.AsFloat);
        DM.qryPneusChassiPneusCONTADOR.AsFloat := 0;
        DM.qryPneusChassiPneus.Post;

        DM.qryPneusChassiPneus.Next;
      end;

    DM.qryPneusChassiAtrelamentoStatus.Close;
    DM.qryPneusChassiAtrelamentoStatus.Params[0].AsString := 'PARADO';
    DM.qryPneusChassiAtrelamentoStatus.Params[1].AsString := '0';
    DM.qryPneusChassiAtrelamentoStatus.Params[2].AsString := DM.FCodEmpresa;
    DM.qryPneusChassiAtrelamentoStatus.Params[3].AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString;
    DM.qryPneusChassiAtrelamentoStatus.Execute;

    DM.qryPneusChassiAtrelamento.Edit;
    DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString       := EmptyStr;
    DM.qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA2.AsString := EmptyStr;
    DM.qryPneusChassiAtrelamento.Post;
    DM.qryPneusChassiAtrelamento.Refresh;

    ImgCarroceria2.Picture.Assign(nil);
    DM.qryPneusChassiPneus.Filtered := False;
  end;

if BtnCarroceria3.Focused = True then
  begin
    if DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString = EmptyStr then Exit;

    DM.qryPneusChassiPneus.Filtered := False;
    DM.qryPneusChassiPneus.Filter   := 'CODCHASSI = '+ QuotedStr(DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString);
    DM.qryPneusChassiPneus.Filtered := True;

    DM.qryPneusChassiPneus.First;
    while not DM.qryPneusChassiPneus.Eof = True do
      begin
        DM.qryPneusChassiPneus.Edit;
        DM.qryPneusChassiPneusRODADOS.AsFloat  := DM.qryPneusChassiPneusRODADOS.AsFloat + (DM.qryPneusChassiCONTADOR.AsFloat - DM.qryPneusChassiPneusCONTADOR.AsFloat);
        DM.qryPneusChassiPneusCONTADOR.AsFloat := 0;
        DM.qryPneusChassiPneus.Post;

        DM.qryPneusChassiPneus.Next;
      end;

    DM.qryPneusChassiAtrelamentoStatus.Close;
    DM.qryPneusChassiAtrelamentoStatus.Params[0].AsString := 'PARADO';
    DM.qryPneusChassiAtrelamentoStatus.Params[1].AsString := '0';
    DM.qryPneusChassiAtrelamentoStatus.Params[2].AsString := DM.FCodEmpresa;
    DM.qryPneusChassiAtrelamentoStatus.Params[3].AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString;
    DM.qryPneusChassiAtrelamentoStatus.Execute;

    DM.qryPneusChassiAtrelamento.Edit;
    DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString       := EmptyStr;
    DM.qryPneusChassiAtrelamentoDESCEQUIPCARROCEIRA3.AsString := EmptyStr;
    DM.qryPneusChassiAtrelamento.Post;
    DM.qryPneusChassiAtrelamento.Refresh;

    ImgCarroceria3.Picture.Assign(nil);
    DM.qryPneusChassiPneus.Filtered := False;
  end;
AlimentaHistorico('REMOVIDO');
end;

procedure TFrmTelaCadPneusChassiAtrelamento.AlimentaHistorico(Operacao:string);
begin
DM.qryPneusChassiAtrelamentoHist.Append;
if BtnCarroceria1.Focused = True then
  begin
    DM.qryPneusChassiAtrelamentoHistPOSICAO.AsString       := '1° Carroceria';
    DM.qryPneusChassiAtrelamentoHistCODCARROCERIA.AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA1.AsString;
  end;
if BtnCarroceria2.Focused = True then
  begin
    DM.qryPneusChassiAtrelamentoHistPOSICAO.AsString  := '2° Carroceria';
    DM.qryPneusChassiAtrelamentoHistCODCARROCERIA.AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA2.AsString;
  end;
if BtnCarroceria3.Focused = True then
  begin
    DM.qryPneusChassiAtrelamentoHistPOSICAO.AsString  := '3° Carroceria';
    DM.qryPneusChassiAtrelamentoHistCODCARROCERIA.AsString := DM.qryPneusChassiAtrelamentoCODCARROCERIA3.AsString;
  end;
DM.qryPneusChassiAtrelamentoHistDATA.AsDateTime   := DateOf(DM.FDataHoraServidor);
DM.qryPneusChassiAtrelamentoHistCONTADOR.AsString := DM.qryPneusChassiCONTADOR.AsString;
DM.qryPneusChassiAtrelamentoHistRODAGEM.AsString  := DM.qryPneusChassiPneusRODADOS.AsString;
DM.qryPneusChassiAtrelamentoHistOPERACAO.AsString := Operacao;
DM.qryPneusChassiAtrelamentoHist.Post;
end;

end.

unit UnTelaCadFuncionariosFerramentaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, System.DateUtils, Data.DB,
  Vcl.Menus, FireDAC.Stan.Param;

type
  TFrmTelaCadFuncionariosFerramentaria = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    BtnImprimir: TButton;
    PopupMenuInventario: TPopupMenu;
    Funcionario1: TMenuItem;
    Ferramenta1: TMenuItem;
    odos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImprimirClick(Sender: TObject);
    procedure Funcionario1Click(Sender: TObject);
    procedure Ferramenta1Click(Sender: TObject);
    procedure odos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFuncionariosFerramentaria: TFrmTelaCadFuncionariosFerramentaria;
  LMatricula, LNome: String;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDmRelatorios, UnDM;

procedure TFrmTelaCadFuncionariosFerramentaria.BtnImprimirClick(
  Sender: TObject);
begin
  inherited;
PopupMenuInventario.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadFuncionariosFerramentaria.Ferramenta1Click(
  Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.FTabela_auxiliar := 460;
DM.FNomeConsulta := 'Recursos';
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryFuncionariosFerramentaria.Filtered := False;
    DM.qryFuncionariosFerramentaria.Filter   := 'CODFERRAMENTARIAITEM = ' + QuotedStr(DM.FCodCombo);
    DM.qryFuncionariosFerramentaria.Filtered := True;
    if DM.qryFuncionariosFerramentaria.IsEmpty = False then
      DmRelatorios.frxRFuncionariosFerramentaria.ShowReport();
  end
else
  DM.qryFuncionariosFerramentaria.Filtered := False;

end;

procedure TFrmTelaCadFuncionariosFerramentaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryFerramentariaItens.Close;
DM.qryFerramentaria.Close;
DM.qryFuncionariosFerramentaria.Close;
end;

procedure TFrmTelaCadFuncionariosFerramentaria.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADFUNCIONARIOS';
LMatricula := DM.FParamAuxiliar[0];
LNome      := DM.FParamAuxiliar[1];

DM.qryFuncionariosFerramentaria.Close;
DM.qryFuncionariosFerramentaria.Params[0].AsString := DM.FCodEmpresa;
DM.qryFuncionariosFerramentaria.Params[1].AsString := LMatricula;
DM.qryFuncionariosFerramentaria.Open;
end;

procedure TFrmTelaCadFuncionariosFerramentaria.Funcionario1Click(
  Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
if DM.qryFerramentariaItens.Active = True then
  begin
    DM.qryFerramentariaItens.Edit;
    DM.qryFerramentariaItens.Post;
    DM.qryFuncionariosFerramentaria.Edit;
    DM.qryFuncionariosFerramentaria.Post;
  end;

DM.FTabela_auxiliar := 300;
DM.FNomeConsulta := 'Funcionários';
DM.FParamAuxiliar[1] := 'NOME';
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryFuncionariosFerramentaria.Filtered := False;
    DM.qryFuncionariosFerramentaria.Filter   := 'MATRICULA = ' + QuotedStr(DM.FCodCombo);
    DM.qryFuncionariosFerramentaria.Filtered := True;
    if DM.qryFuncionariosFerramentaria.IsEmpty = False then
      DmRelatorios.frxRFuncionariosFerramentaria.ShowReport();
  end
else
  DM.qryFuncionariosFerramentaria.Filtered := False;

end;

procedure TFrmTelaCadFuncionariosFerramentaria.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;

if (Key = #13) then
  begin
    if (GrdCadastro.SelectedIndex = 3) and (DM.FParamAuxiliar[0] <> EmptyStr) then
      begin
        DM.FTabela_auxiliar  := 77;
        Try
          Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
          FrmTelaAuxiliar.ShowModal;
        Finally
          if DM.FCodCombo <> EmptyStr then
            begin
              LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade da ferramenta:');
              if LCampo <> EmptyStr then
                begin
                  try
                    StrToInt(LCampo)
                  except
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                  end;

                  DM.qryFerramentaria.Close;
                  DM.qryFerramentaria.Params[0].AsString := DM.FCodCombo;
                  DM.qryFerramentaria.Params[1].AsString := DM.FCodEmpresa;
                  DM.qryFerramentaria.Open;
                  DM.qryFerramentariaItens.Open;
                  DM.qryFerramentaria.Locate('CODIGO', DM.FCodCombo, []);

                  if DM.qryFerramentariaItens.Locate('CODRECURSO', DM.FParamAuxiliar[2], []) = True then
                    begin
                      if DM.qryFerramentariaItensQUANTIDADE.AsInteger < StrToInt(LCampo) then
                        begin
                          PAuxiliares.Font.Color := clRed;
                          PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                        end
                      else
                        begin
                          if (DM.qryFuncionariosFerramentaria.Locate('CODFERRAMENTARIAITEM', DM.FParamAuxiliar[2], []) = False) then
                            begin
                              DM.qryFuncionariosFerramentaria.Append;
                           //   DM.qryFuncionariosFerramentariaCODIGO.AsInteger              := DM.qryFuncionariosFerramentaria.RecordCount + 1;
                              DM.qryFuncionariosFerramentariaCODEMPRESA.AsString           := DM.FCodEmpresa;
                              DM.qryFuncionariosFerramentariaCODFERRAMENTARIA.AsString     := DM.FCodCombo;
                              DM.qryFuncionariosFerramentariaFERRAMENTARIA.AsString        := DM.FValorCombo;
                              DM.qryFuncionariosFerramentariaCODFERRAMENTARIAITEM.AsString := DM.FParamAuxiliar[2];
                              DM.qryFuncionariosFerramentariaMATRICULA.AsString            := LMatricula;
                              DM.qryFuncionariosFerramentariaNOME.AsString                 := LNome;
                              DM.qryFuncionariosFerramentariaITEM.AsString                 := DM.FParamAuxiliar[3];
                              DM.qryFuncionariosFerramentariaQUANTIDADE.AsString           := LCampo;
                              DM.qryFuncionariosFerramentariaDATAEMPRESTIMO.AsDateTime     := DateOf(DM.FDataHoraServidor);
                              DM.qryFuncionariosFerramentaria.Post;

                              DM.qryFerramentariaItens.Edit;
                              DM.qryFerramentariaItensQUANTIDADE.AsInteger := DM.qryFerramentariaItensQUANTIDADE.AsInteger - StrToInt(LCampo);
                              DM.qryFerramentariaItens.Post;
                            end;
                        end;
                    end;
                end;
            end;
          FreeAndNil(FrmTelaAuxiliar);
        End;
      end
    else
    if (GrdCadastro.SelectedIndex = 6) and (DM.qryFuncionariosFerramentariaDATAEMPRESTIMO.AsString <> EmptyStr) and (DM.qryFuncionariosFerramentariaDATADEVOLUCAO.AsString = EmptyStr) then
      begin
        DM.qryFerramentaria.Close;
        DM.qryFerramentaria.Params[0].AsString := DM.qryFuncionariosFerramentariaCODFERRAMENTARIA.AsString;
        DM.qryFerramentaria.Params[1].AsString := DM.FCodEmpresa;
        DM.qryFerramentaria.Open;
        DM.qryFerramentariaItens.Open;
        DM.qryFerramentaria.Locate('CODIGO', DM.FCodCombo, []);

        if DM.qryFerramentariaItens.Locate('CODRECURSO', DM.qryFuncionariosFerramentariaCODFERRAMENTARIAITEM.AsString, []) = True then
          begin
            DM.qryFuncionariosFerramentaria.Edit;
            DM.qryFuncionariosFerramentariaDATADEVOLUCAO.AsDateTime := DateOf(DM.FDataHoraServidor);
            DM.qryFuncionariosFerramentaria.Post;


            DM.qryFerramentariaItens.Edit;
            DM.qryFerramentariaItensQUANTIDADE.AsInteger := DM.qryFerramentariaItensQUANTIDADE.AsInteger + DM.qryFuncionariosFerramentariaQUANTIDADE.AsInteger;
            DM.qryFerramentariaItens.Post;
          end;
      end;
  end;
end;

procedure TFrmTelaCadFuncionariosFerramentaria.odos1Click(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DM.qryFuncionariosFerramentaria.Filtered := False;
if DM.qryFuncionariosFerramentaria.IsEmpty = False then
  DmRelatorios.frxRFuncionariosFerramentaria.ShowReport();
end;

end.

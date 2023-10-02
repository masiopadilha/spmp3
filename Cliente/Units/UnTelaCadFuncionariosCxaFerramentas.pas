unit UnTelaCadFuncionariosCxaFerramentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Data.DB,
  Datasnap.DBClient, FireDAC.Stan.Param;

type
  TFrmTelaCadFuncionariosCxaFerramentas = class(TFrmTelaPaiOkCancel)
    GrdCadastro: TDBGrid;
    CDItem: TClientDataSet;
    CDItemCODITEM: TStringField;
    CDItemKIT: TStringField;
    BtnImprimir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure GrdCadastroDblClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFuncionariosCxaFerramentas: TFrmTelaCadFuncionariosCxaFerramentas;

implementation

{$R *.dfm}

uses UnTelaConsulta, UnDmRelatorios, UnDM;

procedure TFrmTelaCadFuncionariosCxaFerramentas.BtnFecharClick(Sender: TObject);
begin
DM.qryFuncionariosCxaFerram.Cancel;
  inherited;

end;

procedure TFrmTelaCadFuncionariosCxaFerramentas.BtnImprimirClick(
  Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxRFuncionarioscxaFerram.ShowReport();
end;

procedure TFrmTelaCadFuncionariosCxaFerramentas.BtnOKClick(Sender: TObject);
begin
  inherited;
if DM.qryRecursos.Active = False then Exit;

if (DM.qryFuncionariosCxaFerramKIT.AsString = 'N') then
  begin
    DM.qryRecursos.Edit;
    DM.qryRecursos.Post;
  end;

if DM.qryFuncionariosCxaFerramKIT.AsString = 'S' then
  begin
    DM.qryRecursoKit.Edit;
    DM.qryRecursoKit.Post;
  end;
end;

procedure TFrmTelaCadFuncionariosCxaFerramentas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryFuncionariosCxaFerram.Close;
DM.qryRecursos.Close;
DM.qryRecursoKit.Close;
CDItem.Close;
end;

procedure TFrmTelaCadFuncionariosCxaFerramentas.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADFUNCIONARIOS';
DM.qryFuncionariosCxaFerram.Close;
DM.qryFuncionariosCxaFerram.Open;

CDItem.Close; CDItem.CreateDataSet;
while not DM.qryFuncionariosCxaFerram.Eof = True do
  begin
    CDItem.Append;
    CDItemCODITEM.AsString := DM.qryFuncionariosCxaFerramCODITEM.AsString;
    CDItemKIT.AsString     := DM.qryFuncionariosCxaFerramKIT.AsString;
    CDItem.Post;

    DM.qryFuncionariosCxaFerram.Next;
  end;

DM.qryFuncionariosCxaFerram.Edit;
end;

procedure TFrmTelaCadFuncionariosCxaFerramentas.GrdCadastroDblClick(
  Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;

PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;
if DM.qryFuncionariosCxaFerramCODITEM.AsString = EmptyStr then Exit;

if DM.qryFuncionariosCxaFerramKIT.AsString = 'N' then
  begin
    DM.qryRecursos.Close;
    DM.qryRecursos.Params[0].AsString := DM.qryFuncionariosCxaFerramCODITEM.AsString;
    DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
    DM.qryRecursos.Open;
    DM.qryRecursos.Edit;
    DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger + DM.qryFuncionariosCxaFerramQUANTIDADE.AsInteger;
    DM.qryRecursos.Post;
  end
else
  begin
    DM.qryRecursoKit.Close;
    DM.qryRecursoKit.Params[0].AsString := DM.FCodEmpresa;
    DM.qryRecursoKit.Params[1].AsString := DM.qryFuncionariosCxaFerramCODITEM.AsString;
    DM.qryRecursoKit.Open;
    DM.qryRecursoKit.Edit;
    DM.qryRecursoKitQUANTIDADE.AsInteger := DM.qryRecursoKitQUANTIDADE.AsInteger + DM.qryFuncionariosCxaFerramQUANTIDADE.AsInteger;
    DM.qryRecursoKit.Post;
  end;

DM.qryFuncionariosCxaFerram.Delete;
DM.qryFuncionariosCxaFerram.Edit;
end;

procedure TFrmTelaCadFuncionariosCxaFerramentas.GrdCadastroKeyPress(
  Sender: TObject; var Key: Char);
var
LCampo : String;
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption := EmptyStr;

if (GrdCadastro.SelectedIndex = 0) and (Key <> #13) and (Key <> #9) then
  begin
    Key := #0;
  end;

if DM.qryFuncionariosCxaFerramKIT.AsString = EmptyStr then
  DM.qryFuncionariosCxaFerramKIT.AsString := 'N';

if (Key = #13) then
  begin
    if DM.qryFuncionariosCxaFerramKIT.AsString = 'N' then
      DM.FTabela_auxiliar := 460
    else
    if DM.qryFuncionariosCxaFerramKIT.AsString = 'S' then
      DM.FTabela_auxiliar := 5000
    else
      begin
        GrdCadastro.SelectedIndex := 0;
        Exit;
      end;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuxiliar);
    End;

    if DM.FCodCombo <> EmptyStr then
      begin
        if CDItem.Locate('CODITEM;KIT', VarArrayOf([DM.FCodCombo, DM.qryFuncionariosCxaFerramKIT.AsString]), []) = True then Exit;

        LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade do item:');
        if LCampo <> EmptyStr then
          begin
            try
              StrToInt(LCampo)
            except
              PAuxiliares.Font.Color := clRed;
              PAuxiliares.Caption := 'VALOR INVÁLIDO!';
              Exit;
            end;

            if DM.qryFuncionariosCxaFerramKIT.AsString = 'N' then
              begin
                DM.qryRecursos.Close;
                DM.qryRecursos.Params[0].AsString := DM.FCodCombo;
                DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
                DM.qryRecursos.Open;
                if DM.qryRecursosQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                  begin
                    DM.qryRecursos.Edit;
                    DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger - DM.qryFuncionariosCxaFerramQUANTIDADE.AsInteger;
                    DM.qryRecursos.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end;

            if DM.qryFuncionariosCxaFerramKIT.AsString = 'S' then
              begin
                DM.qryRecursoKit.Close;
                DM.qryRecursoKit.Params[0].AsString := DM.FCodEmpresa;
                DM.qryRecursoKit.Params[1].AsString := DM.FCodCombo;
                DM.qryRecursoKit.Open;
                if DM.qryRecursoKitQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                  begin
                    DM.qryRecursoKit.Edit;
                    DM.qryRecursoKitQUANTIDADE.AsInteger := DM.qryRecursoKitQUANTIDADE.AsInteger - DM.qryFuncionariosCxaFerramQUANTIDADE.AsInteger;
                    DM.qryRecursoKit.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end;
          end
        else Exit;

        if DM.qryFuncionariosCxaFerramDESCRICAO.AsString = EmptyStr then
          DM.qryFuncionariosCxaFerram.Edit
        else
          DM.qryFuncionariosCxaFerram.Append;
//        DM.qryFuncionariosCxaFerramCODIGO.AsInteger       := DM.qryFuncionariosCxaFerram.RecordCount + 1;
        DM.qryFuncionariosCxaFerramCODEMPRESA.AsString    := DM.FCodEmpresa;
        DM.qryFuncionariosCxaFerramMATRICULA.AsString     := DM.FParamAuxiliar[0];
        DM.qryFuncionariosCxaFerramQUANTIDADE.AsFloat     := StrToInt(LCampo);
        DM.qryFuncionariosCxaFerramDATAENTREGA.AsDateTime := DM.FDataHoraServidor;
        DM.qryFuncionariosCxaFerramCODITEM.AsString       := DM.FCodCombo;
        DM.qryFuncionariosCxaFerramDESCRICAO.AsString     := DM.FValorCombo;
        DM.qryFuncionariosCxaFerramKIT.AsString           := 'N';
        DM.qryFuncionariosCxaFerram.Post;
        DM.qryFuncionariosCxaFerram.Edit;

        CDItem.Append;
        CDItemCODITEM.AsString := DM.qryFuncionariosCxaFerramCODITEM.AsString;
        CDItemKIT.AsString     := DM.qryFuncionariosCxaFerramKIT.AsString;
        CDItem.Post;
      end;
  end;
end;

end.

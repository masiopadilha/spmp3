unit UnTelaCadPlanoTrabalho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, JvExStdCtrls,
  JvRichEdit, JvDBRichEdit, Data.DB, System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TFrmTelaCadPlanoTrabalho = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    ChbAtivo: TDBCheckBox;
    ChbVisivel: TDBCheckBox;
    Formatar1: TMenuItem;
    Fontes1: TMenuItem;
    Alinhamento1: TMenuItem;
    Esquerda1: TMenuItem;
    Direita1: TMenuItem;
    Centro1: TMenuItem;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    Label17: TLabel;
    MDetalhes: TDBMemo;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Fontes1Click(Sender: TObject);
    procedure Esquerda1Click(Sender: TObject);
    procedure Direita1Click(Sender: TObject);
    procedure Centro1Click(Sender: TObject);
    procedure REDetalhesKeyPress(Sender: TObject; var Key: Char);
    procedure Completo1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure TabNextTab1AfterTabChange(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadPlanoTrabalho: TFrmTelaCadPlanoTrabalho;
  i:Integer;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadPlanoTrabalho.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtCodigo.ReadOnly := True;
DM.qryPlanoTrabalho.Cancel;
end;

procedure TFrmTelaCadPlanoTrabalho.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryPlanoTrabalhoAUTOMATICO.AsString      := 'S';
DM.qryPlanoTrabalhoATIVO.AsString           := 'S';
DM.qryPlanoTrabalhoVISIVEL.AsString         := 'S';
DM.qryPlanoTrabalhoCODEMPRESA.AsString      := DM.FCodEmpresa;

EdtCodigo.SetFocus;
end;

procedure TFrmTelaCadPlanoTrabalho.BtnSalvarClick(Sender: TObject);
begin
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryPlanoTrabalhoCODIGO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CÓDIGO DO REGISTRO!';
    EdtCodigo.SetFocus;
    Exit;
  end;
DM.FTabela_auxiliar := 41;
if (DM.VerificaDuplo(EdtCodigo.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodigo.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryPlanoTrabalhoDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

DM.FDataSetParam.Params[0].AsString := EdtCodigo.Text;
DM.FDataSetParam.Params[1].AsString := DM.FCodEmpresa;

DM.MSGAguarde('');

  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;
EdtCodigo.ReadOnly := True;
end;

procedure TFrmTelaCadPlanoTrabalho.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 41;
  inherited;

end;

procedure TFrmTelaCadPlanoTrabalho.Centro1Click(Sender: TObject);
begin
  inherited;
//REDetalhes.Paragraph.Alignment := paCenter;
end;

procedure TFrmTelaCadPlanoTrabalho.Completo1Click(Sender: TObject);
begin
DM.FParamAuxiliar[1] := 'NOME';
DM.FDataSetRelat    := DmRelatorios.frxDBPlanoTrabalhoGeral;
DM.FTabela_auxiliar := 41;
  inherited;
end;

procedure TFrmTelaCadPlanoTrabalho.Direita1Click(Sender: TObject);
begin
  inherited;
//REDetalhes.Paragraph.Alignment := paRightJustify;
end;

procedure TFrmTelaCadPlanoTrabalho.EdtCodigoExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

procedure TFrmTelaCadPlanoTrabalho.Esquerda1Click(Sender: TObject);
begin
  inherited;
//REDetalhes.Paragraph.Alignment := paLeftJustify;
end;

procedure TFrmTelaCadPlanoTrabalho.Fontes1Click(Sender: TObject);
begin
  inherited;
//FontDialog1.Font.Assign(REDetalhes.SelAttributes);
//if (FontDialog1.Execute) then REDetalhes.SelAttributes.Assign(FontDialog1.Font);
end;

procedure TFrmTelaCadPlanoTrabalho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryPlanoTrabalho.Close;
end;

procedure TFrmTelaCadPlanoTrabalho.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryPlanoTrabalho;
DM.FDataSourceParam := DM.dsPlanoTrabalho;
DM.FTela := 'CADPLANOTRAB';
i := 0;
end;

procedure TFrmTelaCadPlanoTrabalho.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBPlanoTrabalhoIndividual;
DM.FTabela_auxiliar := 411;
  inherited;

end;

procedure TFrmTelaCadPlanoTrabalho.REDetalhesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  i := i + 1;
  if (Key = '[') or (Key = ']') then Key := #0;

end;

procedure TFrmTelaCadPlanoTrabalho.TabNextTab1AfterTabChange(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageName := 'Operacional\naosalvo'
else BtnSalvar.ImageName := 'Operacional\salvar';
end;

end.

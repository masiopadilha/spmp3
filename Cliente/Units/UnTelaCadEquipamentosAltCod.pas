unit UnTelaCadEquipamentosAltCod;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Mask, FireDAC.Stan.Param;
type
  TFrmTelaCadEquipamentosAltCod = class(TFrmTelaPaiOKCancel)
    pBase: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtCodAntigo: TMaskEdit;
    edtNovoAntigo: TMaskEdit;
    MaskEdit1: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure edtCodAntigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadEquipamentosAltCod: TFrmTelaCadEquipamentosAltCod;
implementation
{$R *.dfm}
uses UnDM;
procedure TFrmTelaCadEquipamentosAltCod.BtnOKClick(Sender: TObject);
var
 Mensagem: PChar;
begin
  inherited;
  if edtCodAntigo.Text = MaskEdit1.Text then
  begin
    edtCodAntigo.SetFocus;
    Exit;
  end;
  if edtNovoAntigo.Text = MaskEdit1.Text then
  begin
    edtNovoAntigo.SetFocus;
    Exit;
  end;
  DM.qryAuxiliar2.Close;
  DM.qryAuxiliar2.SQL.Clear;
  DM.qryAuxiliar2.SQL.Text := 'SELECT CODIGO FROM `equipamentos` WHERE CODEMPRESA = :codempresa AND CODIGO = :antigocodequipamento';
  DM.qryAuxiliar2.Params[0].AsString := DM.FCodEmpresa;
  DM.qryAuxiliar2.Params[1].AsString := edtCodAntigo.Text;
  DM.qryAuxiliar2.Open;
  if DM.qryAuxiliar2.IsEmpty = True then
  begin
    Mensagem := PChar('Equipamento antigo não identificado!');
    Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONINFORMATION);
    DM.qryAuxiliar2.Close;
    Exit;
  end;

  DM.qryAuxiliar2.Close;
  DM.qryAuxiliar2.SQL.Clear;
  DM.qryAuxiliar2.SQL.Text := 'SELECT CODIGO FROM `equipamentos` WHERE CODEMPRESA = :codempresa AND CODIGO = :novocodequipamento';
  DM.qryAuxiliar2.Params[0].AsString := DM.FCodEmpresa;
  DM.qryAuxiliar2.Params[1].AsString := edtNovoAntigo.Text;
  DM.qryAuxiliar2.Open;
  if DM.qryAuxiliar2.IsEmpty = False then
  begin
    Mensagem := PChar('Novo código já cadastrado!');
    Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONINFORMATION);
    DM.qryAuxiliar2.Close;
    Exit;
  end;

  try
    DM.qryAltCodEquip.Close;
    DM.qryAltCodEquip.Params.ParamByName('NEWCODE').AsString := edtNovoAntigo.Text;
    DM.qryAltCodEquip.Params.ParamByName('OLDCODE').AsString := edtCodAntigo.Text;;
    DM.qryAltCodEquip.Execute();
    Mensagem := PChar('Alteração realizada com sucesso!');
    Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONINFORMATION);
  except
    on E: Exception do
    begin
      Mensagem := PChar('Não foi possível realizar a alteração!' + #13 + 'Erro: ' + E.Message);
      Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;
end;
procedure TFrmTelaCadEquipamentosAltCod.edtCodAntigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
If Key = #13 Then
  Try
    Begin
      Key := #0;
      SelectNext(ActiveControl, True, True);
    End;
  Except
    Begin
      Application.MessageBox('Não foi possível identificar esse valor, por favor verifique o valor informado.','SPMP',MB_OK + MB_ICONERROR);
    End;
  End
end;
procedure TFrmTelaCadEquipamentosAltCod.FormShow(Sender: TObject);
begin
  inherited;
  edtCodAntigo.EditMask  := DM.qryFormatoCodigoEQUIPAMENTOS.AsString;
  edtNovoAntigo.EditMask := DM.qryFormatoCodigoEQUIPAMENTOS.AsString;
  MaskEdit1.EditMask     := DM.qryFormatoCodigoEQUIPAMENTOS.AsString;
end;
end.

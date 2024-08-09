unit UnTelaCadEquipamentosAltFamiliaCod;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Mask, Vcl.DBCtrls, FireDac.Stan.Param;
type
  TFrmTelaCadEquipamentosAltFamiliaCod = class(TFrmTelaPaiOKCancel)
    pBase: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtCodAntigo: TMaskEdit;
    edtNovoAntigo: TMaskEdit;
    Label5: TLabel;
    EdtCodEquipamento: TDBEdit;
    EdtDescEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    MaskEdit1: TMaskEdit;
    procedure BtnOKClick(Sender: TObject);
    procedure edtCodAntigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmTelaCadEquipamentosAltFamiliaCod: TFrmTelaCadEquipamentosAltFamiliaCod;
implementation
{$R *.dfm}
uses UnDM;
procedure TFrmTelaCadEquipamentosAltFamiliaCod.BtnEquipamentoClick(
  Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    DM.FNomeConsulta := 'Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        EdtCodEquipamento.Text := DM.FCodCombo;
        EdtDescEquipamento.Text := DM.FValorCombo;
        edtCodAntigo.Text := DM.FParamAuxiliar[2];
        edtNovoAntigo.SetFocus;
      end;
  end
end;
procedure TFrmTelaCadEquipamentosAltFamiliaCod.BtnOKClick(Sender: TObject);
var
 Mensagem: PChar;
begin
//  inherited;
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

  if DM.FCodCombo = '' then Exit;

  DM.qryAuxiliar2.Close;
  DM.qryAuxiliar2.SQL.Clear;
  DM.qryAuxiliar2.SQL.Text := 'SELECT CODIGO FROM `familiaequipamento` WHERE CODIGO = :antigocodfamilia';
  DM.qryAuxiliar2.Params[0].AsString := edtNovoAntigo.Text;
  DM.qryAuxiliar2.Open;
  if DM.qryAuxiliar2.IsEmpty = True then
  begin
    Mensagem := PChar('Código da Famíla não localizado!');
    Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONINFORMATION);
    DM.qryAuxiliar2.Close;
    Exit;
  end;


  DM.qryAuxiliar2.Close;
  try
    DM.qryAltCodFamilia.Close;
    DM.qryAltCodFamilia.Params.ParamByName('NEWCODE').AsString := edtNovoAntigo.Text;
    DM.qryAltCodFamilia.Params.ParamByName('OLDCODE').AsString := edtCodAntigo.Text;
    DM.qryAltCodFamilia.Params.ParamByName('CODEQUIP').AsString := EdtCodEquipamento.Text;
    DM.qryAltCodFamilia.Execute();
    Mensagem := PChar('Alteração realizada com sucesso!');
    Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONINFORMATION);
  except
    on E: Exception do
    begin
      Mensagem := PChar('Não foi possível realizar a alteração!' + #13 + 'Erro: ' + E.Message);
      Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;

  DM.qryAuxiliar2.Close;
  DM.qryAuxiliar2.SQL.Clear;

  Close;
end;
procedure TFrmTelaCadEquipamentosAltFamiliaCod.edtCodAntigoKeyPress(
  Sender: TObject; var Key: Char);
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
procedure TFrmTelaCadEquipamentosAltFamiliaCod.FormShow(Sender: TObject);
begin
  inherited;
  edtCodAntigo.EditMask  := DM.qryFormatoCodigoFAMILIAEQUIPAMENTO.AsString;
  edtNovoAntigo.EditMask := DM.qryFormatoCodigoFAMILIAEQUIPAMENTO.AsString;
  MaskEdit1.EditMask     := DM.qryFormatoCodigoFAMILIAEQUIPAMENTO.AsString;
end;
end.

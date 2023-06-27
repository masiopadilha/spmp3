unit UnTelaCadEquipamentosAltCod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Mask;

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
  if edtCodAntigo.Text = MaskEdit1.Text then Exit;
  if edtNovoAntigo.Text = MaskEdit1.Text then Exit;

  try
    DM.FDQuery1.Close;
    DM.FDQuery1.Params.ParamByName('NEWCODE').AsString := edtNovoAntigo.Text;
    DM.FDQuery1.Params.ParamByName('OLDCODE').AsString := edtCodAntigo.Text;;
    DM.FDQuery1.Execute();
    Mensagem := PChar('Altera��o realizada com sucesso!');
    Application.MessageBox(Mensagem, 'SPMP3', MB_OK + MB_ICONINFORMATION);
  except
    on E: Exception do
    begin
      Mensagem := PChar('N�o foi poss�vel realizar a altera��o!' + #13 + 'Erro: ' + E.Message);
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
      Application.MessageBox('N�o foi poss�vel identificar esse valor, por favor verifique o valor informado.','SPMP',MB_OK + MB_ICONERROR);
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
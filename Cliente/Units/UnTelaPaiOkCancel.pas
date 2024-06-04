unit UnTelaPaiOkCancel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Datasnap.DBClient;

type
  TFrmTelaPaiOKCancel = class(TForm)
    PTop: TPanel;
    Image1: TImage;
    PCentro: TPanel;
    RGTelas: TRadioGroup;
    PAuxiliares: TPanel;
    PBotoes: TPanel;
    BtnOK: TButton;
    BtnFechar: TButton;
    BtnAjuda: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAjudaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    //LDataEntrada, LDataSaida: TDateTime;
  public
    { Public declarations }
  end;

var
  FrmTelaPaiOKCancel: TFrmTelaPaiOKCancel;

implementation

{$R *.dfm}

uses UnDM, UnTelaPrincipal, UnTempoOcioso;


procedure TFrmTelaPaiOKCancel.BtnAjudaClick(Sender: TObject);
begin
HtmlHelp(0, Pchar(ExtractFilePath(Application.ExeName) + 'Ajuda.chm' + '::/C/SPMP-Fontes/SPMP3/Manual/HTML/'+Screen.ActiveForm.Name+'/'+Screen.ActiveForm.Name+'.html'), $0000,0);
end;

procedure TFrmTelaPaiOKCancel.FormActivate(Sender: TObject);
begin
DM.FModulo     := Screen.ActiveForm.Caption;
//DM.RegistrarMovimentacao('ACESSO', DM.FCodEmpresa, DM.FCodUsuario, DM.FModulo, DM.FEstacao);
end;

procedure TFrmTelaPaiOKCancel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DM.FModulo     := Screen.ActiveForm.Caption;
//DM.RegistrarMovimentacao('SAIDA', DM.FCodEmpresa, DM.FCodUsuario, DM.FModulo, DM.FEstacao);
DM.MSGAguarde('', False);
end;

procedure TFrmTelaPaiOKCancel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = 27 then
  begin
    if Application.MessageBox('Deseja realmente sair?', 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
      Close;
  end;
end;

end.

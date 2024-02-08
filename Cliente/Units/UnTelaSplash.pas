unit UnTelaSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.DateUtils, Vcl.ComCtrls, FireDAC.Stan.Param;

type
  TFrmTelaSplash = class(TForm)
    Image1: TImage;
    LblRegistro: TLabel;
    LblVersao: TLabel;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaSplash: TFrmTelaSplash;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaSplash.FormCreate(Sender: TObject);
var
LDiasRestantes : SmallInt;
begin
if DM.FLicenca = 'TRIAL' then
  begin
    LDiasRestantes      := 7 - DaysBetween(DM.FDataHoraServidor, DM.FInstalacao);
    LblRegistro.Caption := IntToStr(LDiasRestantes) + ' Dias Restantes';
  end
else
  begin
    LblRegistro.Caption := 'Registrado';
  end;
//LblVersao.Caption := DM.GetVersion(Application.ExeName);
LblVersao.Caption := DM.FVersaoMacro + ' beta';
end;

procedure TFrmTelaSplash.Timer1Timer(Sender: TObject);
begin
AlphaBlendValue := AlphaBlendValue + 5;
if AlphaBlendValue = 255 then
  begin
    Timer1.Enabled := False;
    ProgressBar1.Visible := True;

    DM.qryFormatoCodigo.Open;

    if DM.FNomeUsuario <> 'sam_spmp' then
      begin
        DM.qryUsuarioPAcesso.Params[0].AsString := DM.FCodAcesso;
        DM.qryUsuarioPAcesso.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;

        DM.qryUsuarioPAlteracao.Params[0].AsString := DM.FCodAlteracao;
        DM.qryUsuarioPAlteracao.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;

        DM.qryUsuarioPInclusao.Params[0].AsString := DM.FCodInclusao;
        DM.qryUsuarioPInclusao.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;

        DM.qryUsuarioPExclusao.Params[0].AsString := DM.FCodExclusao;
        DM.qryUsuarioPExclusao.Open;
        ProgressBar1.Position := ProgressBar1.Position + 1;


        if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
          begin
            ProgressBar1.Position := ProgressBar1.Position + 1;
          end
        else
          ProgressBar1.Position := ProgressBar1.Position + 4;
      end;
    Close;
  end;
end;

end.

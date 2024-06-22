unit UnTelaSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.DateUtils, Vcl.ComCtrls, FireDAC.Stan.Param, IdURI,
  IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, System.Zip, Winapi.ShellAPI,
  JvExControls, JvWaitingGradient, JvProgressBar;

type
  TFrmTelaSplash = class(TForm)
    Image1: TImage;
    LblRegistro: TLabel;
    LblVersao: TLabel;
    Timer1: TTimer;
    LblProcesso: TLabel;
    JvGradientProgressBar1: TJvGradientProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

    function ResourceExists(const ResourceName: string): Boolean;

  public
    { Public declarations }
  end;

var
  FrmTelaSplash: TFrmTelaSplash;

implementation

{$R *.dfm}

uses UnDM, UnTelaPrincipal;


function TFrmTelaSplash.ResourceExists(const ResourceName: string): Boolean;
var
  HInstance: HMODULE;
begin
  Result := False;
  HInstance := GetModuleHandle(nil);
  if HInstance <> 0 then
  begin
    if FindResource(HInstance, PChar(ResourceName), RT_RCDATA) <> 0 then
      Result := True;
  end;
end;

procedure TFrmTelaSplash.FormCreate(Sender: TObject);
var
  LDiasRestantes : SmallInt;
begin
  if DM.FLicenca = 'TRIAL' then
  begin
    LDiasRestantes      := 7 - DaysBetween(DM.FDataHoraServidor, DM.FInstalacao);
    LblRegistro.Caption := IntToStr(LDiasRestantes) + ' Dias Restantes';
  end else
  begin
    LblRegistro.Caption := 'Registrado';
  end;

  //LblVersao.Caption := DM.GetVersion(Application.ExeName);
  //LblVersao.Caption := DM.FVersaoMacro + ' beta';
  LblVersao.Caption := DM.FVersaoMacro;
end;

procedure TFrmTelaSplash.Timer1Timer(Sender: TObject);
begin
AlphaBlendValue := AlphaBlendValue + 5;

if AlphaBlendValue = 255 then
  begin
    Timer1.Enabled := False;

    DM.qryFormatoCodigo.Open;
    JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
    LblProcesso.Caption := 'Carregando máscaras de códigos...';
    Application.ProcessMessages;
    Sleep(100);

    if DM.FNomeUsuario <> 'sam_spmp' then
    begin
      JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
      LblProcesso.Caption := 'Carregando permissões de acesso...';
      Application.ProcessMessages;
      Sleep(100);
      DM.qryUsuarioPAcesso.Params[0].AsString := DM.FCodAcesso;
      DM.qryUsuarioPAcesso.Open;

      JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
      LblProcesso.Caption := 'Carregando permissões de alterações...';
      Application.ProcessMessages;
      Sleep(100);
      DM.qryUsuarioPAlteracao.Params[0].AsString := DM.FCodAlteracao;
      DM.qryUsuarioPAlteracao.Open;

      JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
      LblProcesso.Caption := 'Carregando permissões de inclusão...';
      Application.ProcessMessages;
      Sleep(100);
      DM.qryUsuarioPInclusao.Params[0].AsString := DM.FCodInclusao;
      DM.qryUsuarioPInclusao.Open;

      JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
      LblProcesso.Caption := 'Carregando permissões de exclusão...';
      Application.ProcessMessages;
      Sleep(100);
      DM.qryUsuarioPExclusao.Params[0].AsString := DM.FCodExclusao;
      DM.qryUsuarioPExclusao.Open;

      if (DM.qryUsuarioNIVELACESSO.AsString = 'Administrador de Unidade') or (DM.qryUsuarioNIVELACESSO.AsString = 'Controlador de Manutenção')
        or (DM.qryUsuarioNIVELACESSO.AsString = 'Executante de Trabalho A') or (LowerCase(DM.FNomeUsuario) = 'sam_spmp') then
        begin
          JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
          LblProcesso.Caption := 'Consultando manutenções vencidas...';
          Application.ProcessMessages;
          Sleep(100);
          DM.VerificarInspecoes;

          JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
          LblProcesso.Caption := 'Consultando dados de confiabilidade...';
          Application.ProcessMessages;
          Sleep(100);
          DM.VerificarConfiabilidade;

          JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
          LblProcesso.Caption := 'Carregando dados do dashboard...';
          Application.ProcessMessages;
          Sleep(100);
          DM.CalcularDashboard;
        end else
        begin
          JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 8;
          Application.ProcessMessages;
          Sleep(100);
        end;
    end;
    Close;
  end;
end;

end.

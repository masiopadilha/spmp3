unit UnDmAlertas;
interface
uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.DateUtils,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;
type
  TDMAlertas = class(TDataModule)
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    GerencOrdemServico: TMenuItem;
    FechamInsp: TMenuItem;
    MaodeObraServ: TMenuItem;
    N1: TMenuItem;
    UsuariosAtivos: TMenuItem;
    Auditoria: TMenuItem;
    Opcoes: TMenuItem;
    N2: TMenuItem;
    Sair: TMenuItem;
    qryOrdemServico: TFDQuery;
    Timer1: TTimer;
    qryOrdemServicoTOTALOS: TLargeintField;
    procedure FechamInspClick(Sender: TObject);
    procedure GerencOrdemServicoClick(Sender: TObject);
    procedure MaodeObraServClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure UsuariosAtivosClick(Sender: TObject);
    procedure AuditoriaClick(Sender: TObject);
    procedure OpcoesClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    ftotalosatual, ftotalosnovo: integer;
  public
    { Public declarations }
  end;
var
  DMAlertas: TDMAlertas;
implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}
uses UnDM, UnTelaCadOrdemServicoGerencia, UnTelaInspFechamento,
  UnTelaCadOrdemServicoLocalizaMObra, UnTelaPrincipal, UnTelaUsuariosAtivos,
  UnTelaAuditoria, UnTelaOpcoes;
{$R *.dfm}
procedure TDMAlertas.AuditoriaClick(Sender: TObject);
begin
  if (DM.qryUsuarioPAcessoCADPERMISSOES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  if FrmTelaAuditoria = nil then
    Try
      Application.CreateForm(TFrmTelaAuditoria, FrmTelaAuditoria);
      FrmTelaAuditoria.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuditoria);
    End;
end;
procedure TDMAlertas.FechamInspClick(Sender: TObject);
begin
  if (DM.qryUsuarioPAcessoCADMANUTPROG.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  if FrmTelaInspFechamento = nil then
    Try
      Application.CreateForm(TFrmTelaInspFechamento, FrmTelaInspFechamento);
      FrmTelaInspFechamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaInspFechamento);
    End;
end;
procedure TDMAlertas.GerencOrdemServicoClick(Sender: TObject);
begin
  if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  if FrmTelaCadOrdemServicoGerencia = nil then
    Try
      Application.CreateForm(TFrmTelaCadOrdemServicoGerencia, FrmTelaCadOrdemServicoGerencia);
      FrmTelaCadOrdemServicoGerencia.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadOrdemServicoGerencia);
    End;
end;
procedure TDMAlertas.MaodeObraServClick(Sender: TObject);
begin
  if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString <> 'S') and  (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  if FrmTelaCadOrdemServicoLocalizaMObra = nil then
    Try
      Application.CreateForm(TFrmTelaCadOrdemServicoLocalizaMObra, FrmTelaCadOrdemServicoLocalizaMObra);
      FrmTelaCadOrdemServicoLocalizaMObra.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadOrdemServicoLocalizaMObra);
    End;
end;
procedure TDMAlertas.OpcoesClick(Sender: TObject);
begin
  if (DM.qryUsuarioPAcessoCADPERMISSOES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  if FrmTelaOpcoes = nil then
    Try
      Application.CreateForm(TFrmTelaOpcoes, FrmTelaOpcoes);
      FrmTelaOpcoes.ShowModal;
    Finally
      FreeAndNil(FrmTelaOpcoes);
    End;
end;
procedure TDMAlertas.SairClick(Sender: TObject);
var
  X: Integer;
begin
  if DM.FFecharForms = True then
    begin
      for X := 0 to Application.ComponentCount-1 do
      if Application.Components[X] is TForm then
        if not(TForm(Application.Components[X]) = Application.MainForm) then
          if TForm(Application.Components[X]).Showing then TForm(Application.Components[X]).Close;
    end;
  FrmTelaPrincipal.Close;
end;
procedure TDMAlertas.Timer1Timer(Sender: TObject);
var
  hora_atual, diferenca: TDateTime;
  df_hr: TTime;
  dt_ini, dt_final: TDate;
  codos: Integer;
begin
  inherited;
  TThread.CreateAnonymousThread(
                                procedure
                                begin
                                  TThread.Synchronize(TThread.CurrentThread,
                                          procedure
                                          begin
                                             if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario <> 'sam_spmp') then
                                               begin
                                                 Try
                                                   if not (DMAlertas.qryOrdemServico.State in [dsBrowse]) then
                                                     DMAlertas.qryOrdemServico.Cancel;
                                                   DMAlertas.qryOrdemServico.Refresh;
                                                   ftotalosnovo := DMAlertas.qryOrdemServicoTOTALOS.AsInteger;
                                                   if ftotalosatual < ftotalosnovo then
                                                      begin
                                                        TrayIcon1.BalloonHint := 'Novas OS cadastradas!';
                                                      end;
                                                 Except
                                                   Abort;
                                                 End;
                                              end;
                                          end);
                                end
                               ).Start;
end;
procedure TDMAlertas.TrayIcon1DblClick(Sender: TObject);
begin
if FrmTelaPrincipal.WindowState <> TWindowState.wsMinimized then
  FrmTelaPrincipal.WindowState := wsMinimized
else
  FrmTelaPrincipal.WindowState := wsNormal;
Application.ProcessMessages;
//SetWindowPos(FrmTelaPrincipal.Handle,HWND_TOP,0,0,0,0,SWP_NOSIZE);
end;
procedure TDMAlertas.UsuariosAtivosClick(Sender: TObject);
begin
  if FrmTelaUsuariosAtivos = nil then
    Try
      Application.CreateForm(TFrmTelaUsuariosAtivos, FrmTelaUsuariosAtivos);
      FrmTelaUsuariosAtivos.ShowModal;
    Finally
      FreeAndNil(FrmTelaUsuariosAtivos);
    End;
end;
end.

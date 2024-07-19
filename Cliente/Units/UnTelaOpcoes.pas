unit UnTelaOpcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmTelaOpcoes = class(TFrmTelaPaiOKCancel)
    PFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edttempoconsos: TDBEdit;
    edttemposenhausu: TDBEdit;
    edtqtdeminsenha: TDBEdit;
    edtqtdelogintent: TDBEdit;
    Label5: TLabel;
    edttempoociosoA: TDBEdit;
    Label6: TLabel;
    edttempoociosoB: TDBEdit;
    GBDashboard: TGroupBox;
    chbSolicTrab: TDBCheckBox;
    chbOficinas: TDBCheckBox;
    chbSituacaoOS: TDBCheckBox;
    chbOSTipoManut: TDBCheckBox;
    chbMTBF: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaOpcoes: TFrmTelaOpcoes;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaOpcoes.BtnFecharClick(Sender: TObject);
begin
  inherited;
DM.qryConfigs.Cancel;
end;

procedure TFrmTelaOpcoes.BtnOKClick(Sender: TObject);
begin
DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

DM.qryConfigsdataultalt.AsDateTime  := DM.FDataHoraServidor;
DM.qryConfigscodusuarioalt.AsString := DM.FCodUsuario;
DM.qryConfigs.Post;

DM.FTempoNovaOS   := DM.qryConfigstempoconsos.AsInteger;
DM.FTempoSenhaUsu := DM.qryConfigstemposenhausu.AsInteger;
DM.FQtdeMinSenha  := DM.qryConfigsqtdeminsenha.AsInteger;
DM.FQtdeLoginTent := DM.qryConfigsqtdelogintent.AsInteger;

Application.MessageBox('Será necessário reiniciar o sistema para que as alterações tenham efeito.', 'SPMP3', MB_OK + MB_ICONINFORMATION);
  inherited;
end;

procedure TFrmTelaOpcoes.FormActivate(Sender: TObject);
begin
  inherited;
  if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
    begin
      PFundo.Enabled := False;
    end;
end;

procedure TFrmTelaOpcoes.FormCreate(Sender: TObject);
begin
  inherited;
if  (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
begin
  edttemposenhausu.Enabled := False;
  edtqtdeminsenha.Enabled := False;
  edtqtdelogintent.Enabled := False;
  edtqtdelogintent.Enabled := False;
end;

 DM.qryConfigs.Edit;
end;

end.

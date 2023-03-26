unit UnTelaUsuarioAcessos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, System.DateUtils,
  Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaUsuarioAcessos = class(TFrmTelaPaiOkCancel)
    Label9: TLabel;
    CBPeriodo: TComboBox;
    DBGrid1: TDBGrid;
    procedure CBPeriodoSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaUsuarioAcessos: TFrmTelaUsuarioAcessos;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaUsuarioAcessos.CBPeriodoSelect(Sender: TObject);
begin
  inherited;
DM.MSGAguarde('');

//DM.qryMovimentacaoUsuarios.Edit;
//DM.qryMovimentacaoUsuarios.Post;

DM.qryUsuarioAcessos.Close;
DM.qryUsuarioAcessos.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
//DM.qryUsuarioAcessos.Params.ParamByName('usuario').AsString    := DM.FNomeUsuario;
case CBPeriodo.ItemIndex of
  0://Hoje
    DM.qryUsuarioAcessos.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd hh:mm:ss', DateOf(DM.FDataHoraServidor));
  1://Últimos 07 dias
    DM.qryUsuarioAcessos.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd hh:mm:ss', IncDay(DateOf(DM.FDataHoraServidor), -7));
  2://Últimos 15 dias
    DM.qryUsuarioAcessos.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd hh:mm:ss', IncDay(DateOf(DM.FDataHoraServidor), -15));
  3://Últimos 30 dias
    DM.qryUsuarioAcessos.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd hh:mm:ss', IncDay(DateOf(DM.FDataHoraServidor), -30));
  4://Últimos 60 dias
    DM.qryUsuarioAcessos.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd hh:mm:ss', IncDay(DateOf(DM.FDataHoraServidor), -60));
end;
DM.qryUsuarioAcessos.Params.ParamByName('data2').AsString := FormatDateTime('yyyy/mm/dd', DateOf(DM.FDataHoraServidor)) + ' 23:59:59';
DM.qryUsuarioAcessos.Open;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaUsuarioAcessos.FormCreate(Sender: TObject);
begin
  inherited;
CBPeriodo.OnSelect(Sender);
end;

end.

unit UnTelaCadUltIndDesempenho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.DBCtrls, System.DateUtils, Data.DB;

type
  TFrmTelaCadIndDesempenho = class(TFrmTelaPaiParametros)
    LblGravAcidMenM: TDBText;
    Label19: TLabel;
    LblFreqAcidMenM: TDBText;
    Label18: TLabel;
    LblHorasExtrasM: TDBText;
    Label17: TLabel;
    LblDispEquip: TDBText;
    Label4: TLabel;
    GBManutencao: TGroupBox;
    Label7: TLabel;
    LblManutCorret: TDBText;
    Label5: TLabel;
    LblManutPrev: TDBText;
    Label6: TLabel;
    LblManutPred: TDBText;
    Label8: TLabel;
    LblOutros: TDBText;
    Label9: TLabel;
    LblNaoConf: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    LblHorasExtrasE: TDBText;
    LblFreqAcidMenE: TDBText;
    LblGravAcidMenE: TDBText;
    LblHorasExtrasC: TDBText;
    LblHorasExtrasA: TDBText;
    LblFreqAcidMenC: TDBText;
    LblFreqAcidMenA: TDBText;
    LblGravAcidMenC: TDBText;
    LblGravAcidMenA: TDBText;
    Label11: TLabel;
    CBMes: TDBComboBox;
    Label12: TLabel;
    CBAno: TDBComboBox;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    LTotalHorasParadas, LTotalHorasFunc, LDisp : Real;

  public
    { Public declarations }
  end;

var
  FrmTelaCadIndDesempenho: TFrmTelaCadIndDesempenho;

implementation

{$R *.dfm}

uses UnCMWeb;

procedure TFrmTelaCadIndDesempenho.BtnConsultarClick(Sender: TObject);
begin
CMWeb.FTabela_auxiliar := 75;
  inherited;

end;

procedure TFrmTelaCadIndDesempenho.BtnSalvarClick(Sender: TObject);
begin
CMWeb.FDataConsulta1 := StrToDateTime('01/'+CMWeb.CDCadIndDesempenhoMES.AsString+'/'+CMWeb.CDCadIndDesempenhoANO.AsString);
CMWeb.FDataConsulta2 := IncMonth(CMWeb.FDataConsulta1);

LTotalHorasParadas   := CMWeb.HorasParadasEquipamento('', '');
LTotalHorasFunc      := CMWeb.HorasFuncTotal;
LDisp                := 100 * (StrToFloat(LTotalHorasFunc) - StrToFloat(LTotalHorasParadas))/StrToFloat(LTotalHorasFunc);


//  inherited;
end;

procedure TFrmTelaCadIndDesempenho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
CMWeb.CDCadIndDesempenho.Close;
end;

procedure TFrmTelaCadIndDesempenho.FormCreate(Sender: TObject);
begin
  inherited;
CMWeb.FDataSetParam    := CMWeb.CDCadIndDesempenho;
CMWeb.FDataSourceParam := CMWeb.DSCadIndDesempenho;
end;

end.

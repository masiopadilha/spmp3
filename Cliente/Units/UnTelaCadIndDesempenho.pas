unit UnTelaCadIndDesempenho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.DBCtrls, System.DateUtils, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

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
    Label7: TLabel;
    LblManutCorret: TDBText;
    Label5: TLabel;
    LblManutPrev: TDBText;
    Label6: TLabel;
    LblManutPred: TDBText;
    Label8: TLabel;
    LblOutros: TDBText;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure ButConsultarClick(Sender: TObject);
  private
    { Private declarations }
    LTotalHorasParadasEquip, LTotalHorasTrabMObra, LTotalHorasTrabEquip, LDisp : Real;

  public
    { Public declarations }
  end;

var
  FrmTelaCadIndDesempenho: TFrmTelaCadIndDesempenho;

implementation

{$R *.dfm}

uses UnDM;

procedure TFrmTelaCadIndDesempenho.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 75;
  inherited;

end;

procedure TFrmTelaCadIndDesempenho.BtnNovoClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

DM.FDataSetParam.Close;
DM.FDataSetParam.Open;
DM.FDataSetParam.EmptyDataSet;
DM.FDataSetParam.Append;
DM.qryIndDesempenhoMES.AsString           := FormatFloat('00', MonthOf(DM.FDataHoraServidor));
DM.qryIndDesempenhoANO.AsFloat            := YearOf(DM.FDataHoraServidor);
DM.qryIndDesempenhoCODEMPRESA.AsString    := DM.FCodEmpresa;
DM.qryIndDesempenhoMANUTCORRET.AsFloat    := 0;
DM.qryIndDesempenhoMANUTPREV.AsFloat      := 0;
DM.qryIndDesempenhoMANUTPRED.AsFloat      := 0;
DM.qryIndDesempenhoOUTROSSERV.AsFloat     := 0;
DM.qryIndDesempenhoDISPEQUIP.AsFloat      := 0;
DM.qryIndDesempenhoHORAEXTRAMEC.AsFloat   := 0;
DM.qryIndDesempenhoHORAEXTRAELE.AsFloat   := 0;
DM.qryIndDesempenhoHORAEXTRACIV.AsFloat   := 0;
DM.qryIndDesempenhoHORAEXTRAAPTEC.AsFloat := 0;
DM.qryIndDesempenhoFREQACIDMEC.AsFloat    := 0;
DM.qryIndDesempenhoFREQACIDELE.AsFloat    := 0;
DM.qryIndDesempenhoFREQACIDCIV.AsFloat    := 0;
DM.qryIndDesempenhoFREQACIDAPTEC.AsFloat  := 0;
DM.qryIndDesempenhoGRAVACIDMEC.AsFloat    := 0;
DM.qryIndDesempenhoGRAVACIDELE.AsFloat    := 0;
DM.qryIndDesempenhoGRAVACIDCIV.AsFloat    := 0;
DM.qryIndDesempenhoGRAVACIDAPTEC.AsFloat  := 0;

PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption := 'NOVO REGISTRO';
DM.FAlterando := False;
ControleBotoes(1);
BtnSalvar.ImageName := 'Operacional\salvar';

CBMes.SetFocus;
end;

procedure TFrmTelaCadIndDesempenho.BtnSalvarClick(Sender: TObject);
begin
PAuxiliares.Font.Color := clBlue;
PAuxiliares.Caption    := '';
PControle.SetFocus;

if DM.FDataSetParam.IsEmpty = True then Exit;

if (DM.qryUsuarioPInclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA INCLUSÃO!';
    Exit;
  end;

if (DM.qryUsuarioPAlteracao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    DM.FDataSetParam.Cancel;
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA ALTERAÇÃO!';
    Exit;
  end;

if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

if DM.FDataSetParam.IsEmpty = True then Exit;

if DM.qryIndDesempenhoMES.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O MÊS CALCULADO!'; CBMes.SetFocus; Exit;
  end;
if DM.qryIndDesempenhoANO.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed; PAuxiliares.Caption := 'INFORME O ANO CALCULADO!'; CBAno.SetFocus; Exit;
  end;

DM.MSGAguarde('');


DM.FDataConsulta1 := StrToDateTime('01/'+DM.qryIndDesempenhoMES.AsString+'/'+DM.qryIndDesempenhoANO.AsString);
DM.FDataConsulta2 := IncMonth(DM.FDataConsulta1);

LTotalHorasParadasEquip := 0;
LTotalHorasTrabEquip := 0;
LDisp := 0;

LTotalHorasTrabEquip := DM.HorasCalendario(1, EmptyStr, EmptyStr);

DM.qryRelatGerencDispEquip.Filtered := False;
DM.qryRelatGerencDispEquip.Close;
DM.qryRelatGerencDispEquip.Params.ParamByName('CODEMPRESA').AsString := DM.FCodEmpresa;
DM.qryRelatGerencDispEquip.Params.ParamByName('data1').AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryRelatGerencDispEquip.Params.ParamByName('data2').AsString := FormatDateTime('yyyy/mm/dd hh:mm', DM.FDataConsulta2);
DM.qryRelatGerencDispEquip.Open; DM.qryRelatGerencDispEquip.First;
while not DM.qryRelatGerencDispEquip.Eof = True  do
  begin
    LTotalHorasParadasEquip   := LTotalHorasParadasEquip + DM.qryRelatGerencDispEquipHORASPARADASABERTAS.AsFloat + DM.qryRelatGerencDispEquipHORASPARADASFECHADAS.AsFloat;//DM.HorasParadasEquipamento(EmptyStr, EmptyStr, EmptyStr, EmptyStr);
    DM.qryRelatGerencDispEquip.Next;
  end;
LDisp := 100 * (LTotalHorasTrabEquip - LTotalHorasParadasEquip)/LTotalHorasTrabEquip;

DM.qryRelatGerencDispEquip.Close;
DM.qryTotalEquipHora.Close;

DM.qryIndDesempenho.Edit;
DM.qryIndDesempenhoDISPEQUIP.AsFloat := LDisp;


DM.qryIndDesempPercParadas.Close;
DM.qryIndDesempPercParadas.Params[0].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
DM.qryIndDesempPercParadas.Params[1].AsString := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
DM.qryIndDesempPercParadas.Params[2].AsString := DM.FCodEmpresa;
DM.qryIndDesempPercParadas.Open;
DM.qryIndDesempenho.Edit;
DM.qryIndDesempenhoMANUTCORRET.AsFloat := DM.qryIndDesempPercParadasPERCENTCORRET.AsFloat;
DM.qryIndDesempenhoMANUTPREV.AsFloat   := DM.qryIndDesempPercParadasPERCENTPREV.AsFloat;
DM.qryIndDesempenhoMANUTPRED.AsFloat   := DM.qryIndDesempPercParadasPERCENTPRED.AsFloat;
DM.qryIndDesempenhoOUTROSSERV.AsFloat  := DM.qryIndDesempPercParadasPERCENTOUTROS.AsFloat;
DM.qryIndDesempenhoNAOCONFORM.AsFloat  := DM.qryIndDesempPercParadasPERCENTOUTROS.AsFloat;


LTotalHorasTrabMObra := DM.HorasCalendario(0, EmptyStr, EmptyStr);
DM.qryIndDesempTotalHE.Close;
DM.qryIndDesempTotalHE.Params.ParamByName('data1').AsDateTime    := DM.FDataConsulta1;
DM.qryIndDesempTotalHE.Params.ParamByName('data2').AsDateTime    := DM.FDataConsulta1;
DM.qryIndDesempTotalHE.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
DM.qryIndDesempTotalHE.Open;
DM.qryIndDesempenho.Edit;
DM.qryIndDesempenhoHORAEXTRAMEC.AsFloat   := 100 * (DM.qryIndDesempTotalHEHORAEXTRAMEC.AsFloat/LTotalHorasTrabMObra);
DM.qryIndDesempenhoHORAEXTRAELE.AsFloat   := 100 * (DM.qryIndDesempTotalHEHORAEXTRAELE.AsFloat/LTotalHorasTrabMObra);
DM.qryIndDesempenhoHORAEXTRACIV.AsFloat   := 100 * (DM.qryIndDesempTotalHEHORAEXTRACIV.AsFloat/LTotalHorasTrabMObra);
DM.qryIndDesempenhoHORAEXTRAAPTEC.AsFloat := 100 * (DM.qryIndDesempTotalHEHORAEXTRAAPT.AsFloat/LTotalHorasTrabMObra);

DM.qryIndDesempenho.Post;
DM.qryIndDesempenho.Edit;

DM.FDataSetParam.Params[0].AsInteger := DM.qryIndDesempenhoCODIGO.AsInteger;


DM.MSGAguarde('', False);

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
DM.FAlterando := True;
ControleBotoes(2);
BtnSalvar.ImageName := 'Operacional\salvar';
//  inherited;
end;

procedure TFrmTelaCadIndDesempenho.ButConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 75;
  inherited;

end;

procedure TFrmTelaCadIndDesempenho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryIndDesempenho.Close;
end;

procedure TFrmTelaCadIndDesempenho.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryIndDesempenho;
DM.FDataSourceParam := DM.dsIndDesempenho;
DM.FTela := 'CADINDDESEMPENHO';
end;

end.

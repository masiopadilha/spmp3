unit UnTelaCadEquipamentosConf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.Mask, System.DateUtils, FireDAC.Stan.Param;

type
  TFrmTelaCadEquipamentosConf = class(TFrmTelaPaiOkCancel)
    ChbAtivado: TDBCheckBox;
    GBEmissaoOS: TGroupBox;
    EdtEmissaoOS: TDBEdit;
    GroupBox1: TGroupBox;
    EdtFtrMarcha: TDBEdit;
    GroupBox2: TGroupBox;
    LblParada1: TDBText;
    Label28: TLabel;
    LblUltParada: TDBText;
    RGPeriodo: TRadioGroup;
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RGPeriodoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGPeriodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadEquipamentosConf: TFrmTelaCadEquipamentosConf;

implementation

{$R *.dfm}

uses UnTelaCadEquipamentos, UnDM;

procedure TFrmTelaCadEquipamentosConf.BtnFecharClick(Sender: TObject);
begin
DM.qryEquipamentos.Cancel;
  inherited;
end;

procedure TFrmTelaCadEquipamentosConf.BtnOKClick(Sender: TObject);
begin
  inherited;
  with DM do
    begin
      qryEquipamentos.Edit;
      if (qryEquipamentosDATAINIFUNC.AsString <> EmptyStr) and (ChbAtivado.Checked = False) then
        begin
          if Application.MessageBox('Se desativada a manutenção por confiabilidade deste equpamento, o período de consulta será zerado, deseja continuar?', 'SPMP3', MB_YESNO + MB_ICONWARNING) = mrYes then
            begin
              qryEquipamentosDATAINICIOCONF.Clear;
              LblUltParada.Caption := EmptyStr;
           end;
        end
      else
        begin
          if qryEquipamentosPERIODOCONF.AsString = '3 meses' then
          begin
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 90))
          end
          else
          if qryEquipamentosPERIODOCONF.AsString = '6 meses' then
          begin
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 180))
          end
          else
          begin
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 365));
          end;
          qryEquipamentosDATAINICIOCONF.AsDateTime := DateOf(DM.FDataHoraServidor);
        end;
      qryEquipamentos.Post;
    end;
  Close;
end;

procedure TFrmTelaCadEquipamentosConf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
if FrmTelaCadEquipamentos = nil then
  DM.qryEquipamentos.Close;
end;

procedure TFrmTelaCadEquipamentosConf.FormCreate(Sender: TObject);
begin
  inherited;
  with DM do
    begin
      qryEquipamentos.Edit;
      qryEquipamentosDATAINICIOCONF.AsDateTime := DateOf(DM.FDataHoraServidor);
      if Trim(qryEquipamentosCALCULARCONF.AsString) <> 'N' then
        begin
          if qryEquipamentosPERIODOCONF.AsString = '3 meses' then
          begin
            RGPeriodo.ItemIndex := 0;
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 90))
          end
          else
          if qryEquipamentosPERIODOCONF.AsString = '6 meses' then
          begin
            RGPeriodo.ItemIndex := 1;
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 180))
          end
          else
          begin
            RGPeriodo.ItemIndex := 2;
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 365));
          end;
        end;
    end;
end;

procedure TFrmTelaCadEquipamentosConf.RGPeriodoClick(Sender: TObject);
begin
  inherited;
      case RGPeriodo.ItemIndex of
        0:
          begin
            DM.qryEquipamentos.Edit;
            DM.qryEquipamentosPERIODOCONF.AsString := '3 meses';
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(DM.qryEquipamentosDATAINICIOCONF.AsDateTime, 90));
          end;
        1:
          begin
            DM.qryEquipamentos.Edit;
            DM.qryEquipamentosPERIODOCONF.AsString := '6 meses';
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(DM.qryEquipamentosDATAINICIOCONF.AsDateTime, 180));
          end;
        2:
          begin
            DM.qryEquipamentos.Edit;
            DM.qryEquipamentosPERIODOCONF.AsString := '12 meses';
            LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(DM.qryEquipamentosDATAINICIOCONF.AsDateTime, 365));
          end;
      end;
end;

procedure TFrmTelaCadEquipamentosConf.RGPeriodoChange(Sender: TObject);
begin
  inherited;
  with DM do
    begin
      case RGPeriodo.ItemIndex of
        0: LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 90));
        1: LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 180));
        2: LblUltParada.Caption := FormatDateTime('dd/mm/yyyy', IncDay(qryEquipamentosDATAINICIOCONF.AsDateTime, 365));
      end;
    end;
end;

end.

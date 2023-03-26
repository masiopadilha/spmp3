unit UnTelaCadDisponibilidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadDisponibilidade = class(TFrmTelaPaiParametros)
    Label6: TLabel;
    EdtItem: TDBEdit;
    BtnItem: TButton;
    Label5: TLabel;
    EdtValor: TDBEdit;
    RGTipo: TDBRadioGroup;
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure RGTipoChange(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadDisponibilidade: TFrmTelaCadDisponibilidade;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnDM;

procedure TFrmTelaCadDisponibilidade.BtnConsultarClick(Sender: TObject);
begin
  inherited;
if DM.FParamAuxiliar[0] = 'Área' then EdtItem.DataField := 'AREA';
if DM.FParamAuxiliar[0] = 'Célula' then EdtItem.DataField := 'CELULA';
if DM.FParamAuxiliar[0] = 'Equipamento' then EdtItem.DataField := 'EQUIPAMENTO';
end;

procedure TFrmTelaCadDisponibilidade.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 27;
  inherited;

end;

procedure TFrmTelaCadDisponibilidade.BtnItemClick(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption    := EmptyStr;
if DM.qryDispAdmissiveis.Active = False then Exit;
if RGTipo.ItemIndex < 0 then
  begin
    RGTipo.SetFocus;
    Exit;
  end;

case RGTipo.ItemIndex of
  0:
    begin
      DM.FTabela_auxiliar := 150;
      DM.FNomeConsulta := 'Áreas';
      EdtItem.DataField := 'AREA';
    end;
  1:
    begin
      DM.FTabela_auxiliar := 150;
      DM.FNomeConsulta := 'Áreas';

      if DM.ConsultarCombo <> EmptyStr then
        begin
          DM.FParamAuxiliar[1] := DM.FCodCombo;
        end;

      if DM.FParamAuxiliar[1] = EmptyStr then
        begin
          PAuxiliares.Font.Color := clRed;
          PAuxiliares.Caption := 'INFORME A ÁREA DA CÉLULA!';
          Exit;
        end;

      DM.FTabela_auxiliar := 160;
      DM.FNomeConsulta := 'Células';
      EdtItem.DataField := 'CELULA';
    end;
  2:
    begin
      DM.FTabela_auxiliar := 250;
      DM.FNomeConsulta := 'Equipamentos';
      EdtItem.DataField := 'EQUIPAMENTO';
    end;
end;

DM.qryDispAdmissiveis.Edit;
if DM.ConsultarCombo <> EmptyStr then
  begin
    DM.qryDispAdmissiveisCODITEM.AsString := DM.FCodCombo;
    if DM.FTabela_auxiliar = 150 then
      DM.qryDispAdmissiveisAREA.AsString := DM.FValorCombo;
    if DM.FTabela_auxiliar = 160 then
      DM.qryDispAdmissiveisCELULA.AsString := DM.FValorCombo;
    if DM.FTabela_auxiliar = 250 then
      DM.qryDispAdmissiveisEQUIPAMENTO.AsString := DM.FValorCombo;

    case RGTipo.ItemIndex of
      0: DM.qryDispAdmissiveisTIPOITEM.AsString := 'Área';
      1: DM.qryDispAdmissiveisTIPOITEM.AsString := 'Célula';
      2: DM.qryDispAdmissiveisTIPOITEM.AsString := 'Equipamento';
    end;
  end;
end;

procedure TFrmTelaCadDisponibilidade.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryDispAdmissiveisCODEMPRESA.AsString := DM.FCodEmpresa;

EdtItem.SetFocus;
end;

procedure TFrmTelaCadDisponibilidade.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;

if DM.qryDispAdmissiveisTIPOITEM.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O TIPO DO REGISTRO!';
    RGTipo.SetFocus;
    Exit;
  end;
if DM.qryDispAdmissiveisCODITEM.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O ÍTEM DO REGISTRO!';
    EdtItem.SetFocus;
    Exit;
  end;
if DM.qryDispAdmissiveisVALITEM.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O VALOR DO REGISTRO!';
    EdtValor.SetFocus;
    Exit;
  end;
DM.FTabela_auxiliar := 27;
if (DM.VerificaDuplo(DM.qryDispAdmissiveisCODITEM.AsString) = True) and (DM.FAlterando = False) then
  begin
    EdtItem.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;

  inherited;

  if DM.qryDispAdmissiveisCODIGO.IsNull= True then
    begin
      DM.qryDispAdmissiveis.Params[0].AsInteger := DM.qryDispAdmissiveisCODIGO.AsInteger;
      DM.qryDispAdmissiveis.Params[1].AsString := DM.FCodEmpresa;
    end;
end;

procedure TFrmTelaCadDisponibilidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryDispAdmissiveis.Close;
end;

procedure TFrmTelaCadDisponibilidade.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryDispAdmissiveis;
DM.FDataSourceParam := DM.dsDispAdmissiveis;
DM.FDataSetRelat    := DmRelatorios.frxDBDispAdmissiveis;
DM.FTela := 'CADDISPONIBILIDADE';
DM.FTabela_auxiliar := 27;
end;

procedure TFrmTelaCadDisponibilidade.RGTipoChange(Sender: TObject);
begin
  inherited;
case RGTipo.ItemIndex of
  0:
    begin
      EdtItem.DataField := 'AREA';
      DM.qryDispAdmissiveis.Edit;
      DM.qryDispAdmissiveisTIPOITEM.AsString := 'Área';
    end;
  1:
    begin
      EdtItem.DataField := 'CELULA';
      DM.qryDispAdmissiveis.Edit;
      DM.qryDispAdmissiveisTIPOITEM.AsString := 'Célula';
    end;
  2:
    begin
      EdtItem.DataField := 'EQUIPAMENTO';
      DM.qryDispAdmissiveis.Edit;
      DM.qryDispAdmissiveisTIPOITEM.AsString := 'Equipamento';
    end;
end;
end;

end.

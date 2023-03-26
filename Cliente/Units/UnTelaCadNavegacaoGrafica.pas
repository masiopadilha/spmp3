unit UnTelaCadNavegacaoGrafica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, JvExComCtrls, JvComCtrls,
  Data.DB, Datasnap.DBClient, Winapi.Commctrl, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet;

type
  TFrmTelaCadNavegacaoGrafica = class(TFrmTelaPaiOkCancel)
    PLista: TPanel;
    TVArvore: TJvTreeView;
    EdtConsulta: TEdit;
    BtnConsultar: TButton;
    CBTipo: TComboBox;
    CDArvore: TClientDataSet;
    CDArvoreCODIGO: TWideStringField;
    CDArvoreCODEMPRESA: TWideStringField;
    CDArvoreDESCRICAO: TWideStringField;
    CDArvoreCODPAI: TWideStringField;
    CDArvoreDESCPAI: TWideStringField;
    FDMemTPrim: TFDMemTable;
    DataSource1: TDataSource;
    FDMemTPrimCODIGO: TStringField;
    FDMemTPrimCODEMPRESA: TStringField;
    FDMemTPrimCODLOCALIZACAO: TStringField;
    FDMemTPrimCODCELULA: TStringField;
    FDMemTPrimCODLINHA: TStringField;
    FDMemTPrimSEQUENCIA: TIntegerField;
    FDMemTPrimCODEQUIPAMENTOPAI: TStringField;
    FDMemTPrimDESCRICAO: TStringField;
    FDMemTPrimSECUNDARIO: TStringField;
    FDMemTSec: TFDMemTable;
    DataSource2: TDataSource;
    FDMemTSecCODIGO: TStringField;
    FDMemTSecCODEMPRESA: TStringField;
    FDMemTSecCODLOCALIZACAO: TStringField;
    FDMemTSecCODCELULA: TStringField;
    FDMemTSecCODLINHA: TStringField;
    FDMemTSecSEQUENCIA: TIntegerField;
    FDMemTSecCODEQUIPAMENTOPAI: TStringField;
    FDMemTSecDESCRICAO: TStringField;
    FDMemTSecSECUNDARIO: TStringField;
    FDMemTSecDESCEQUIPAMENTOPAI: TStringField;
    FDMemTSecPrim: TFDMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    IntegerField1: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    DataSource3: TDataSource;
    BtnConsultar1: TButton;
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function LocalizaNoNivel(NomeBusca:String):Boolean;
    procedure CBTipoChange(Sender: TObject);
    procedure TVArvoreDblClick(Sender: TObject);
    procedure BtnConsultar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadNavegacaoGrafica: TFrmTelaCadNavegacaoGrafica;
  LNoEquipPrim, LNoUnidade : TTreeNode;
implementation

{$R *.dfm}

uses UnTelaConsulta, UnTelaConsultaPeriodo, UnTelaCadEquipamentos,
  UnDM;


procedure TFrmTelaCadNavegacaoGrafica.BtnConsultarClick(Sender: TObject);
var
CodEquipPrim, CodEquipInicial, CodArea:String;
tempai:Boolean;
begin
DM.MSGAguarde('');
tempai := False;

TVArvore.Items.Clear;

CDArvore.Close; CDArvore.CreateDataSet; CDArvore.Open;

DM.qryEquipamentosArvore.Close;
DM.qryEquipamentosArvore.SQL.Clear;
DM.qryEquipamentosArvore.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`CODEMPRESA`, `equipamentos`.`DESCRICAO`, `equipamentos`.`CODEQUIPAMENTOPAI`, `equipamentos_1`.`DESCRICAO` AS `DESCEQUIPAMENTOPAI`, `equipamentos`.`SEQUENCIA`, `equipamentos`.`CODLOCALIZACAO` AS `CODAREA`'
                                  + ' FROM `equipamentos`'
                                  + ' LEFT JOIN `equipamentos` AS `equipamentos_1` ON (`equipamentos`.`CODEMPRESA` = `equipamentos_1`.`CODEMPRESA`) AND (`equipamentos`.`CODEQUIPAMENTOPAI` = `equipamentos_1`.`CODIGO`)'
                                  + ' WHERE `equipamentos`.`CODEMPRESA` = :codempresa AND `equipamentos`.`OPERANDO` = ''S''');
DM.qryEquipamentosArvore.Params[0].AsString := DM.FCodEmpresa;

case CBTipo.ItemIndex of
  0: //Individual
    begin
      DM.qryEquipamentosArvore.SQL.Add(' AND `equipamentos`.`CODIGO` = :codigo');
      DM.qryEquipamentosArvore.Params[1].AsString := DM.qryEquipamentosCODIGO.AsString;
      EdtConsulta.Text := DM.qryEquipamentosCODIGO.AsString;
    end;
  1: //Área
    begin
      DM.FTabela_auxiliar := 150;
      if DM.ConsultarCombo <> 'Áreas' then
        begin
          CodArea := DM.FCodCombo;
          EdtConsulta.Text := DM.FValorCombo;
          DM.qryEquipamentosArvore.SQL.Add(' AND `equipamentos`.`CODLOCALIZACAO` = :codarea');
          DM.qryEquipamentosArvore.Params[1].AsString := DM.FCodCombo;
        end;
    end;
end;
DM.qryEquipamentosArvore.SQL.Add(' ORDER BY `equipamentos_1`.`DESCRICAO` ASC, `equipamentos`.`SEQUENCIA` ASC, `equipamentos`.`DESCRICAO` ASC');
DM.qryEquipamentosArvore.Open;
DM.qryEquipamentosArvoreSec.Open;

with TVArvore.Items.AddFirst(nil, DM.FNomeEmpresa) do
  begin
    DM.qryEquipamentosArvore.First;
    while not DM.qryEquipamentosArvore.Eof = True do
      begin
        MakeVisible;
        Selected := True;
        LNoUnidade := TVArvore.Items.GetNode(HTreeItem(TVArvore.Selected.ItemId));
        CodEquipInicial := DM.qryEquipamentosArvoreCODIGO.AsString;

        DM.qryEquipamentosArvoreSec.First;

        CDArvore.Close; CDArvore.CreateDataSet;
        CDArvore.Append;
        CDArvoreCODIGO.AsString    := DM.qryEquipamentosArvoreCODIGO.AsString;
        CDArvoreDESCRICAO.AsString := DM.qryEquipamentosArvoreDESCRICAO.AsString;
        CDArvoreCODPAI.AsString    := DM.qryEquipamentosArvoreCODEQUIPAMENTOPAI.AsString;
        CDArvoreDESCPAI.AsString   := DM.qryEquipamentosArvoreDESCEQUIPAMENTOPAI.AsString;
        CDArvore.Post;
        while not DM.qryEquipamentosArvoreSec.Eof = True do
          begin
            CDArvore.Append;
            CDArvoreCODIGO.AsString    := DM.qryEquipamentosArvoreSecCODIGO.AsString;
            CDArvoreDESCRICAO.AsString := DM.qryEquipamentosArvoreSecDESCRICAO.AsString;
            CDArvoreCODPAI.AsString    := DM.qryEquipamentosArvoreSecCODEQUIPAMENTOPAI.AsString;
            CDArvoreDESCPAI.AsString   := DM.qryEquipamentosArvoreSecDESCEQUIPAMENTOPAI.AsString;
            CDArvore.Post;

            DM.qryEquipamentosArvoreSec.Next;
          end;

        if LocalizaNoNivel(DM.qryEquipamentosArvoreCODIGO.AsString + ' - ' + DM.qryEquipamentosArvoreDESCRICAO.AsString) = False then
          begin
            with TVArvore.Items.AddChild(LNoUnidade, DM.qryEquipamentosArvoreCODIGO.AsString + ' - ' + DM.qryEquipamentosArvoreDESCRICAO.AsString) do
              begin
                MakeVisible;
                Selected := True;
                LNoUnidade := TVArvore.Items.GetNode(HTreeItem(TVArvore.Selected.ItemId));
                tempai := True;
              end;
          end;

        CDArvore.First;
        while not CDArvore.Eof = True do
          begin
            if LocalizaNoNivel(CDArvoreCODIGO.AsString + ' - ' + CDArvoreDESCRICAO.AsString) = True then
              begin
                LNoUnidade := TVArvore.Items.GetNode(HTreeItem(TVArvore.Selected.ItemId));
                tempai := True;
              end;

            while tempai = true do
              begin
                CodEquipPrim := CDArvoreCODIGO.AsString;
                DM.qryEquipamentosArvore.Filter   := '';
                DM.qryEquipamentosArvore.Filtered := False;
                DM.qryEquipamentosArvore.Filter   := 'CODIGO = ' + QuotedStr(CodEquipPrim);
                DM.qryEquipamentosArvore.Filtered := True;

                DM.qryEquipamentosArvoreSec.First;

                if DM.qryEquipamentosArvoreSec.IsEmpty = False then
                  begin
                    while not DM.qryEquipamentosArvoreSec.Eof = True do
                      begin
                        if LocalizaNoNivel(DM.qryEquipamentosArvoreSecCODIGO.AsString + ' - ' + DM.qryEquipamentosArvoreSecDESCRICAO.AsString) = False then
                          begin
                            with TVArvore.Items.AddChild(LNoUnidade, DM.qryEquipamentosArvoreSecCODIGO.AsString + ' - ' + DM.qryEquipamentosArvoreSecDESCRICAO.AsString) do
                              begin
                                MakeVisible;
                                Selected := True;

                              end;
                          end
                        else
                          tempai := False;
                        DM.qryEquipamentosArvoreSec.Next;
                      end;
                  end
                else
                  tempai := False;
              end;
            CDArvore.Next;
          end;

        case CBTipo.ItemIndex of
         1:
           begin
             DM.qryEquipamentosArvore.Filter   := 'CODAREA = ' + QuotedStr(CodArea);
             DM.qryEquipamentosArvore.Filtered := True;
             DM.qryEquipamentosArvore.Locate('CODIGO', CodEquipPrim, []);
           end;
         2:
           begin
             //if DM.qryEquipamentoArvore.Eof = False then
               begin
                 DM.qryEquipamentosArvore.Filtered := False;
                 DM.qryEquipamentosArvore.Locate('CODIGO', CodEquipInicial, []);
               end;
           end;
        end;

        DM.qryEquipamentosArvore.Next;
      end;
  end;

CDArvore.Close;
DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadNavegacaoGrafica.BtnConsultar1Click(Sender: TObject);
Var
  ItemUltiimoCurso, ItemUltimaUnidade, ItemUltimaTurma: TTreeNode;
  xUnidadeAnt, xCursoAnt, xTurmaAnt: String;
begin
  inherited;
DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
DM.qryAuxiliar.SQL.Add('SELECT `CODIGO`, `CODEMPRESA`, `CODLOCALIZACAO`, `CODCELULA`, `CODLINHA`, `SEQUENCIA`, `CODEQUIPAMENTOPAI`, `DESCRICAO`, `SECUNDARIO`, `OPERANDO` FROM `equipamentos` WHERE (`SECUNDARIO` = ''N'') ORDER BY `DESCRICAO` ASC');
DM.qryAuxiliar.Open;

FDMemTPrim.Close; FDMemTPrim.CreateDataSet; FDMemTPrim.Open;
FDMemTPrim.CopyDataSet(DM.qryAuxiliar, [coRestart, coAppend]);

DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;

DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Add('SELECT `equipamentos`.`CODIGO`, `equipamentos`.`CODEMPRESA`, `equipamentos`.`CODLOCALIZACAO`, `equipamentos`.`CODCELULA`, `equipamentos`.`CODLINHA`, `equipamentos`.`SEQUENCIA`, `equipamentos`.`CODEQUIPAMENTOPAI`'
                        + ' , `equipamentos`.`DESCRICAO`, `equipamentos`.`SECUNDARIO`, `equipamentos`.`OPERANDO`, `equipamentos_1`.`DESCRICAO` AS `DESCEQUIPAMENTOPAI`, `equipamentos`.`CODEQUIPAMENTOPAI`'
                        + ' FROM `equipamentos`'
                        + ' INNER JOIN `equipamentos` AS `equipamentos_1` ON (`equipamentos`.`CODEQUIPAMENTOPAI` = `equipamentos_1`.`CODIGO`) AND (`equipamentos`.`CODEMPRESA` = `equipamentos_1`.`CODEMPRESA`)'
                        + ' WHERE (`equipamentos`.`OPERANDO` = ''S'' AND `equipamentos`.`SECUNDARIO` = ''S'') ORDER BY `equipamentos`.`DESCRICAO`, `equipamentos`.`SEQUENCIA` ASC;');

DM.qryAuxiliar.Open;

FDMemTSec.Close; FDMemTSec.CreateDataSet; FDMemTSec.Open;
FDMemTSecPrim.Close; FDMemTSecPrim.CreateDataSet; FDMemTSecPrim.Open;
FDMemTSec.CopyDataSet(DM.qryAuxiliar, [coRestart, coAppend]);
FDMemTSecPrim.CopyDataSet(DM.qryAuxiliar, [coRestart, coAppend]);

with TVArvore.Items.AddFirst(nil, DM.FNomeEmpresa) do
  begin
    MakeVisible;
    Selected := True;
    LNoUnidade := TVArvore.Items.GetNode(HTreeItem(TVArvore.Selected.ItemId));

    FDMemTPrim.First;
    while not FDMemTPrim.Eof do
      begin
        TVArvore.Items.AddChild(LNoUnidade, FDMemTPrim.FieldByName('CODIGO').AsString + ' | ' + FDMemTPrim.FieldByName('DESCRICAO').AsString);

    //    if xUnidadeAnt <> FDMemTPrim.FieldByName('CODIGO').AsString then
    //      begin
    //        ItemUltimaUnidade := TVArvore.Items.AddChild(Nil, FDMemTPrim.FieldByName('CODIGO').AsString + ' - ' + FDMemTPrim.FieldByName('DESCRICAO').AsString);
    //      end;
    //
    //    if xCursoAnt <> FDMemTPrim.FieldByName('CODEQUIPAMENTOPAI').AsString then
    //      begin
    //        ItemUltiimoCurso := TVArvore.Items.AddChild(ItemUltimaUnidade, FDMemTPrim.FieldByName('DESCRICAO').AsString);
    //      end;
    //
    //    xUnidadeAnt := FDMemTPrim.FieldByName('CODIGO').AsString;
    //    xCursoAnt := FDMemTPrim.FieldByName('CODEQUIPAMENTOPAI').AsString;

        FDMemTPrim.Next;
      end;


    FDMemTSec.First;
    while not FDMemTSec.Eof do
      begin
        if LocalizaNoNivel(FDMemTSec.FieldByName('CODEQUIPAMENTOPAI').AsString + ' | ' + FDMemTSec.FieldByName('DESCEQUIPAMENTOPAI').AsString) = True then
          begin
            LNoUnidade := TVArvore.Items.GetNode(HTreeItem(TVArvore.Selected.ItemId));
            TVArvore.Items.AddChild(LNoUnidade, FDMemTSec.FieldByName('CODIGO').AsString + ' | ' + FDMemTSec.FieldByName('DESCRICAO').AsString);

            FDMemTSec.Delete;
            FDMemTSec.First;
          end;

        if (FDMemTSec.RecordCount = 1) then
          begin
            if LocalizaNoNivel(FDMemTSec.FieldByName('CODEQUIPAMENTOPAI').AsString + ' | ' + FDMemTSec.FieldByName('DESCEQUIPAMENTOPAI').AsString) = True then
              begin
                LNoUnidade := TVArvore.Items.GetNode(HTreeItem(TVArvore.Selected.ItemId));
                TVArvore.Items.AddChild(LNoUnidade, FDMemTSec.FieldByName('CODIGO').AsString + ' | ' + FDMemTSec.FieldByName('DESCRICAO').AsString);

                FDMemTSec.Delete;
              end;
          end
        else
          FDMemTSec.Next;
      end;
  end;

TVArvore.FullExpand;
TVArvore.TopItem := TVArvore.Items.Item[0];

if DM.qryEquipamentosCODIGO.AsString <> '' then
  begin
    LocalizaNoNivel(DM.qryEquipamentosCODIGO.AsString + ' | ' + DM.qryEquipamentosDESCRICAO.AsString)
  end;

DM.qryAuxiliar.Close;
DM.qryAuxiliar.SQL.Clear;
end;

procedure TFrmTelaCadNavegacaoGrafica.CBTipoChange(Sender: TObject);
begin
  inherited;
case CBTipo.ItemIndex of
  0:
    begin
      EdtConsulta.Color := clWhite;
      EdtConsulta.Text := DM.qryEquipamentosDESCRICAO.AsString;
      TVArvore.Items.Clear;
    end;
  1:
    begin
      EdtConsulta.Color := $00DFDFDF;
      EdtConsulta.Clear;
      TVArvore.Items.Clear;
    end;
  2:
    begin
      EdtConsulta.Color := $00DFDFDF;
      EdtConsulta.Clear;
      TVArvore.Items.Clear;
    end;
end;
end;

procedure TFrmTelaCadNavegacaoGrafica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryAuxiliar.Close;
if FrmTelaCadEquipamentos = nil then
  DM.qryEquipamentos.Close;
DM.qryEquipamentosArvore.Close;
DM.qryEquipamentosArvoreSec.Close;
end;

procedure TFrmTelaCadNavegacaoGrafica.FormCreate(Sender: TObject);
begin
  inherited;
//EdtConsulta.Text := DM.qryEquipamentosDESCRICAO.AsString;
//DM.FCodCombo  := DM.qryEquipamentosCODIGO.AsString;
//if DM.FCodCombo = '' then
//  begin
//    DM.FCodCombo   := DM.FParamAuxiliar[0];
//    EdtConsulta.Text  := DM.FValorCombo;
//  end;
end;


procedure TFrmTelaCadNavegacaoGrafica.FormShow(Sender: TObject);
begin
  inherited;
BtnConsultar1.OnClick(Sender);
end;

function TFrmTelaCadNavegacaoGrafica.LocalizaNoNivel(NomeBusca:String):Boolean;
var x:Integer;
begin
Result := False;
 for x := 0 to TVArvore.Items.Count - 1 do
   begin
     if (TVArvore.Items[x].Text = NomeBusca) then
       begin
         TVArvore.Items.Item[x].Selected := True;
         TVArvore.Items.Item[x].MakeVisible;
         LNoUnidade := TVArvore.Items.GetNode(HTreeItem(TVArvore.Selected.ItemId));

         TVArvore.SetFocus;
         TVArvore.Select(TVArvore.Items[x]);

         Result := True;

         Break;
       end;
   end;
end;

procedure TFrmTelaCadNavegacaoGrafica.TVArvoreDblClick(Sender: TObject);
var
I : SmallInt;
c, LCodigo : String;
begin
  inherited;
if (TVArvore.Items[TVArvore.ItemIndex].Text =  '') //or (Copy(TVArvore.Items[TVArvore.ItemIndex].Text,1,1) <> '>')
then Exit;

for I := 1 to Length(TVArvore.Items[TVArvore.ItemIndex].Text) do
  begin
    c := Copy(TVArvore.Items[TVArvore.ItemIndex].Text, I, 1);
    LCodigo := LCodigo + c;
    if c = '|' then
      begin
        LCodigo := Copy(LCodigo, 0, Length(LCodigo) - 2);
        with DM.dsEquipamentos.DataSet as TFDQuery do
          begin
            Close;
            Params[0].AsString := LCodigo;
            Params[1].AsString := DM.FCodEmpresa;
            Open;
            Edit;
          end;
      end;
  end;
end;

end.

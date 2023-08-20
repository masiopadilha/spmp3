unit UnTelaInspVenc;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, System.DateUtils, Data.DB,
  Vcl.ComCtrls, FireDAC.Stan.Param, FireDAC.Comp.Client, FireDAC.Stan.Intf;
type
  TFrmTelaInspVenc = class(TFrmTelaPaiOkCancel)
    PCInspecoes: TPageControl;
    TSManut: TTabSheet;
    TSLubrific: TTabSheet;
    TSRotas: TTabSheet;
    GrdManut: TDBGrid;
    GrdLubrific: TDBGrid;
    GrdRotas: TDBGrid;
    Panel1: TPanel;
    Label6: TLabel;
    BtnFamiliaEquip: TButton;
    EdtFamiliaEquip: TEdit;
    Label13: TLabel;
    edtOficina: TEdit;
    BtnOficina: TButton;
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdManutDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnFamiliaEquipClick(Sender: TObject);
    procedure EdtFamiliaEquipDblClick(Sender: TObject);
    procedure edtOficinaDblClick(Sender: TObject);
    procedure BtnOficinaClick(Sender: TObject);
    procedure GrdManutTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure CliqueNoTitulo(Column: TColumn; FDQuery: TFDQuery; IndiceDefault: String; Grid:TDBgrid);
  public
    { Public declarations }
  end;
var
  FrmTelaInspVenc: TFrmTelaInspVenc;
  LCodFamilia, LCodOficina: String;
  ManutExec, LubrificExec, RotaExec : Boolean;
implementation
{$R *.dfm}
uses UnDmRelatorios, FireDAC.Comp.DataSet, UnDM;
procedure TFrmTelaInspVenc.CliqueNoTitulo(Column: TColumn; FDQuery: TFDQuery; IndiceDefault: String; Grid:TDBgrid);
var
  sIndexName: string;
  oOrdenacao: TFDSortOption;
  i: smallint;
begin
  // retira a formatação em negrito de todas as colunas
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Title.Font.Style := [];

  // configura a ordenação ascendente ou descendente
  if TFDQuery(Grid.DataSource.DataSet).IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    oOrdenacao := soDescending;
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    oOrdenacao := soNoCase;
  end ;

  // adiciona a ordenação no DataSet, caso não exista
  if not Assigned(TFDQuery(Grid.DataSource.DataSet).Indexes.FindIndex(sIndexName)) then
    TFDQuery(Grid.DataSource.DataSet).AddIndex(sIndexName, Column.FieldName, EmptyStr, [oOrdenacao]);

  // formata o título da coluna em negrito
  Column.Title.Font.Style := [fsBold];

  // atribui a ordenação selecionada
  TFDQuery(Grid.DataSource.DataSet).IndexName := sIndexName;

  TFDQuery(Grid.DataSource.DataSet).First;
end;
procedure TFrmTelaInspVenc.BtnFamiliaEquipClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 600;
    DM.FNomeConsulta := 'Famílias de Equipamentos';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodFamilia                             := DM.FCodCombo;
        EdtFamiliaEquip.Text                    := DM.FValorCombo;
        GrdManut.DataSource.DataSet.Filtered    := False;
        GrdManut.DataSource.DataSet.Filter      := EmptyStr;
        GrdLubrific.DataSource.DataSet.Filtered := False;
        GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;
        if EdtFamiliaEquip.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = EmptyStr then
              GrdManut.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
            if GrdManut.DataSource.DataSet.Filter <> EmptyStr then
              GrdManut.DataSource.DataSet.Filtered := True;
            if GrdLubrific.DataSource.DataSet.Filter = EmptyStr then
              GrdLubrific.DataSource.DataSet.Filter := 'CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODFAMILIAEQUIP = '+QuotedStr(LCodFamilia);
            if GrdLubrific.DataSource.DataSet.Filter <> EmptyStr then
              GrdLubrific.DataSource.DataSet.Filtered := True;
          end;
      end
    else
      begin
        GrdManut.DataSource.DataSet.Filtered    := False;
        GrdLubrific.DataSource.DataSet.Filtered := False;
        LCodFamilia                             := '';
        EdtFamiliaEquip.Text                    := '';
      end;
    TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutVenc.RecordCount)+')';
    TSLubrific.Caption := 'Lubrificações ('+ IntToStr(DM.qryLubrificVenc.RecordCount)+')';
  end;
end;
procedure TFrmTelaInspVenc.BtnOficinaClick(Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 200;
    DM.FNomeConsulta := 'Oficinas';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        LCodFamilia                             := DM.FCodCombo;
        edtOficina.Text                         := DM.FValorCombo;
        GrdManut.DataSource.DataSet.Filtered    := False;
        GrdManut.DataSource.DataSet.Filter      := EmptyStr;
        GrdLubrific.DataSource.DataSet.Filtered := False;
        GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;
        if edtOficina.Text <> '' then
          begin
            if GrdManut.DataSource.DataSet.Filter = EmptyStr then
              GrdManut.DataSource.DataSet.Filter := 'CODOFICINA = '+QuotedStr(LCodOficina)
            else
              GrdManut.DataSource.DataSet.Filter := GrdManut.DataSource.DataSet.Filter + ' AND CODOFICINA = '+QuotedStr(LCodOficina);
            if GrdManut.DataSource.DataSet.Filter <> EmptyStr then
              GrdManut.DataSource.DataSet.Filtered := True;
            if GrdLubrific.DataSource.DataSet.Filter = EmptyStr then
              GrdLubrific.DataSource.DataSet.Filter := 'CODOFICINA = '+QuotedStr(LCodOficina)
            else
              GrdLubrific.DataSource.DataSet.Filter := GrdLubrific.DataSource.DataSet.Filter + ' AND CODOFICINA = '+QuotedStr(LCodOficina);
            if GrdLubrific.DataSource.DataSet.Filter <> EmptyStr then
              GrdLubrific.DataSource.DataSet.Filtered := True;
          end;
      end
    else
      begin
        GrdManut.DataSource.DataSet.Filtered    := False;
        GrdLubrific.DataSource.DataSet.Filtered := False;
        LCodOficina                             := '';
        edtOficina.Text                    := '';
      end;
    TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutVenc.RecordCount)+')';
    TSLubrific.Caption := 'Lubrificações ('+ IntToStr(DM.qryLubrificVenc.RecordCount)+')';
  end;

end;

procedure TFrmTelaInspVenc.BtnOKClick(Sender: TObject);
var
  I: SmallInt;
  LInsp: String;
  LTexto: PChar;
begin
LInsp := EmptyStr;
case PCInspecoes.ActivePageIndex of
  0:
    Begin
      if DM.qryManutVenc.IsEmpty = True then Exit;
      for I := 0 to GrdManut.SelectedRows.Count - 1 do
        begin
          DM.qryManutVenc.GotoBookmark(GrdManut.SelectedRows.Items[I]);
          LInsp := LInsp + IntToStr(DM.qryManutVenc.RecNo) + 'º - ' + DM.qryManutVenc.FieldByName('DESCRICAO').AsString + #13;
        end;
      LTexto := PChar('Deseja realmente executar a(s) inspeçõe(s) selecionada(s)?' + #13 + LInsp);
      if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.MSGAguarde('');
          for I := 0 to GrdManut.SelectedRows.Count - 1 do
            begin
              DM.qryManutVenc.GotoBookmark(GrdManut.SelectedRows.Items[I]);
              DM.qryManutProgEquip.Close;
              DM.qryManutProgEquip.Params[0].AsString := DM.qryManutVencCODIGO.AsString;
              DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
              DM.qryManutProgEquip.Params[2].AsString := DM.qryManutVencCODEQUIPAMENTO.AsString;
              DM.qryManutProgEquip.Open;

              if (DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Execução') and (DM.qryManutProgEquipRELATORIO.AsString = 'S') then
                begin
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'EXISTE UMA '+DM.qryManutProgEquipDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
                  Exit;
                end;

              DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryManutProgEquipDESCRICAO.AsString
                                                                , DM.qryManutProgEquipCODEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                                , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryManutProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryManutProgEquiptempototal.AsString, DM.qryManutProgEquipCODOFICINA.AsString, DM.qryManutProgEquipCODMANUTENCAO.AsString);

              if DM.qryManutProgEquip.IsEmpty = False then
                DM.HistoricoInspecoes(0, DM.FCodEmpresa, DM.qryManutProgEquipCODEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, DM.FCodOrdemServico);

              DM.qryManutProgEquip.Edit;
              DM.qryManutProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
              DM.qryManutProgEquip.Post;
              DmRelatorios.frxRManutProgEquipIndividual.ShowReport();
              //Sendo a inspeção reprogramada pela 'programação', programa a próxima inspeção independente se a manutenção foi fechada ou não.
              if DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Programação' then
                begin
                  DM.qryManutProgEquip.Edit;
                  DM.qryManutProgEquipRELATORIO.AsString    := 'N';
                  if DateOf(DM.qryManutProgEquipDTAINICIO1.AsDateTime) < DateOf(DM.FDataHoraServidor) then
                    DM.qryManutProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryManutProgEquipFREQUENCIA1.AsInteger)
                  else
                    DM.qryManutProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.qryManutProgEquipDTAINICIO1.AsDateTime), DM.qryManutProgEquipFREQUENCIA1.AsInteger);
                  if DM.qryManutProgEquipREPROGRAMAR2.AsString = 'Programação' then
                    DM.qryManutProgEquipLEITURA.AsInteger := DM.qryManutProgEquipLEITURA.AsInteger + DM.qryManutProgEquipFREQUENCIA2.AsInteger;
                  DM.qryManutProgEquip.Post;
                  DM.qryManutVenc.Edit;
                  DM.qryManutVencDTAINICIO1.AsDateTime := DM.qryManutProgEquipDTAINICIO1.AsDateTime;
                  DM.qryManutVenc.Post;
                end;
              //Sendo a inspeção reprogramada pela execução, definir como manutenção em aberto até ser efetuado o fechamento, portanto não permitindo
              //a geração de outra manutenção mesmo que o período vença novamente. Define a coluna 'RELATORIO = S' para impedir a geração de outra manutenção até ser fechada.
              if DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Execução' then
                begin
                  DM.qryManutProgEquip.Edit;
                  DM.qryManutProgEquipRELATORIO.AsString    := 'S';
                  if (DM.qryManutProgEquipREPROGRAMAR2.AsString = 'Programação') and (DM.qryManutProgEquipRELATORIO.AsString = 'S') then
                    DM.qryManutProgEquipLEITURA.AsInteger := DM.qryManutProgEquipLEITURA.AsInteger + DM.qryManutProgEquipFREQUENCIA2.AsInteger;
                  DM.qryManutProgEquip.Post;
                end;
            end;
          DM.qryManutProgEquip.Close;
          DM.qryManutVenc.Refresh;
          TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutVenc.RecordCount)+')';
          DM.MSGAguarde('', False);
          ManutExec := True;
        end;
    End;
 1:
    Begin
      if DM.qryLubrificVenc.IsEmpty = True then Exit;
      for I := 0 to GrdLubrific.SelectedRows.Count - 1 do
        begin
          DM.qryLubrificVenc.GotoBookmark(GrdLubrific.SelectedRows.Items[I]);
          LInsp := LInsp + IntToStr(DM.qryLubrificVenc.RecNo) + 'º - ' + DM.qryLubrificVenc.FieldByName('DESCRICAO').AsString + #13;
        end;
      LTexto := PChar('Deseja realmente executar a(s) inspeçõe(s) selecionada(s)?' + #13 + LInsp);
      if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.MSGAguarde('');
          for I := 0 to GrdLubrific.SelectedRows.Count - 1 do
            begin
              DM.qryLubrificVenc.GotoBookmark(GrdLubrific.SelectedRows.Items[I]);
              DM.qryLubrificProgEquip.Close;
              DM.qryLubrificProgEquip.Params[0].AsString := DM.qryLubrificVencCODIGO.AsString;
              DM.qryLubrificProgEquip.Params[1].AsString := DM.FCodEmpresa;
              DM.qryLubrificProgEquip.Params[2].AsString := DM.qryLubrificVencCODEQUIPAMENTO.AsString;
              DM.qryLubrificProgEquip.Open;

              if (DM.qryLubrificProgEquipREPROGRAMAR1.AsString = 'Execução') and (DM.qryLubrificProgEquipRELATORIO.AsString = 'S') then
                begin
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'EXISTE UMA '+DM.qryLubrificProgEquipDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
                  Exit;
                end;

              DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryLubrificProgEquipDESCRICAO.AsString
                                                                , DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString, EmptyStr, DM.qryLubrificProgEquipCODIGO.AsString, EmptyStr, 'N'
                                                                , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryLubrificProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryLubrificProgEquiptempototal.AsString, DM.qryLubrificProgEquipCODOFICINA.AsString, DM.qryLubrificProgEquipCODMANUTENCAO.AsString);

              if DM.qryLubrificProgEquip.IsEmpty = False then
                DM.HistoricoInspecoes(1, DM.FCodEmpresa, DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString, DM.qryLubrificProgEquipCODIGO.AsString, DM.FCodOrdemServico);
              DM.qryLubrificProgEquip.Edit;
              DM.qryLubrificProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
              DM.qryLubrificProgEquip.Post;
              DmRelatorios.frxRLubrificProgEquipIndividual.ShowReport();
              //Sendo a inspeção reprogramada pela 'programação', programa a próxima inspeção independente se a Lubrificenção foi fechada ou não.
              if DM.qryLubrificProgEquipREPROGRAMAR1.AsString = 'Programação' then
                begin
                  DM.qryLubrificProgEquip.Edit;
                  DM.qryLubrificProgEquipRELATORIO.AsString    := 'N';
                  if DateOf(DM.qryLubrificProgEquipDTAINICIO1.AsDateTime) < DateOf(DM.FDataHoraServidor) then
                    DM.qryLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryLubrificProgEquipFREQUENCIA1.AsInteger)
                  else
                    DM.qryLubrificProgEquipDTAINICIO1.AsDateTime := IncDay(DateOf(DM.qryLubrificProgEquipDTAINICIO1.AsDateTime), DM.qryLubrificProgEquipFREQUENCIA1.AsInteger);
                  if DM.qryLubrificProgEquipREPROGRAMAR2.AsString = 'Programação' then
                    DM.qryLubrificProgEquipLEITURA.AsInteger := DM.qryLubrificProgEquipLEITURA.AsInteger + DM.qryLubrificProgEquipFREQUENCIA2.AsInteger;
                  DM.qryLubrificProgEquip.Post;
                  DM.qryLubrificVenc.Edit;
                  DM.qryLubrificVencDTAINICIO1.AsDateTime := DM.qryLubrificProgEquipDTAINICIO1.AsDateTime;
                  DM.qryLubrificVenc.Post;
                end;
              //Sendo a inspeção reprogramada pela execução, definir como Lubrificenção em aberto até ser efetuado o fechamento, portanto não permitindo
              //a geração de outra Lubrificenção mesmo que o período vença novamente. Define a coluna 'RELATORIO = S' para impedir a geração de outra Lubrificenção até ser fechada.
              if DM.qryLubrificProgEquipREPROGRAMAR1.AsString = 'Execução' then
                begin
                  DM.qryLubrificProgEquip.Edit;
                  DM.qryLubrificProgEquipRELATORIO.AsString    := 'S';
                  if (DM.qryLubrificProgEquipREPROGRAMAR2.AsString = 'Programação') and (DM.qryLubrificProgEquipRELATORIO.AsString = 'S') then
                    DM.qryLubrificProgEquipLEITURA.AsInteger := DM.qryLubrificProgEquipLEITURA.AsInteger + DM.qryLubrificProgEquipFREQUENCIA2.AsInteger;
                  DM.qryLubrificProgEquip.Post;
                end;
            end;
          DM.qryLubrificProgEquip.Close;
          DM.qryLubrificVenc.Refresh;
          TSLubrific.Caption := 'Lubrificações ('+ IntToStr(DM.qryLubrificVenc.RecordCount)+')';
          DM.MSGAguarde('', False);
          LubrificExec := True;
        end;
    End;
 2:
    Begin
      if DM.qryRotaEquipVenc.IsEmpty = True then Exit;
      for I := 0 to GrdRotas.SelectedRows.Count - 1 do
        begin
          DM.qryRotaEquipVenc.GotoBookmark(GrdRotas.SelectedRows.Items[I]);
          LInsp := LInsp + IntToStr(DM.qryRotaEquipVenc.RecNo) + 'º - ' + DM.qryRotaEquipVenc.FieldByName('DESCRICAO').AsString + #13;
        end;
      LTexto := PChar('Deseja realmente executar a(s) inspeçõe(s) selecionada(s)?' + #13 + LInsp);
     if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
        begin
          DM.MSGAguarde('');
         for I := 0 to GrdRotas.SelectedRows.Count - 1 do
           begin
             DM.qryRotaEquipVenc.GotoBookmark(GrdRotas.SelectedRows.Items[I]);
             DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryRotaEquipVencDESCRICAO.AsString
                                                               , EmptyStr, EmptyStr, EmptyStr, 'S', 'N'
                                                               , EmptyStr, 'Emergência', 'Para o Equipamento', EmptyStr, EmptyStr, '0', EmptyStr, EmptyStr);
             if DM.qryRotaEquipVenc.IsEmpty = False then
               DM.HistoricoInspecoes(2, DM.FCodEmpresa, EmptyStr, DM.qryRotaEquipVencCODIGO.AsString, DM.FCodOrdemServico);
             DmRelatorios.frxRRotaIndividual.ShowReport();
             //Sendo a inspeção reprogramada pela execução, definir como manutenção em aberto até ser efetuado o fechamento, portanto não permitindo
             //a geração de outra manutenção mesmo que o período vença novamente. Define a coluna 'RELATORIO = S' para impedir a geração de outra manutenção até ser fechada.
             if (DM.qryRotaEquipVencREPROGRAMAR.AsString = 'Execução') and (DM.qryRotaEquipVencRELATORIO.AsString = 'S') then
               begin
                 PAuxiliares.Font.Color := clRed;
                 PAuxiliares.Caption := 'EXISTE UMA ROTA: '+DM.qryRotaEquipVencDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
                 DM.MSGAguarde('', False);
                 Exit;
               end;
             if (DM.qryRotaEquipVencREPROGRAMAR.AsString = 'Execução') and (DM.qryRotaEquipVencRELATORIO.AsString = 'N') then
               begin
                 DM.qryRotaEquipVenc.Edit;
                 DM.qryRotaEquipVencRELATORIO.AsString    := 'S';
                 DM.qryRotaEquipVenc.Post;
               end;
             //Sendo a inspeção reprogramada pela 'programação', programa a próxima inspeção independente se a rota foi fechada ou não.
             if DM.qryRotaEquipVencREPROGRAMAR.AsString = 'Programação' then
               begin
                 DM.qryRotaEquipVenc.Edit;
                 DM.qryRotaEquipVencRELATORIO.AsString    := 'N';
                 if DateOf(DM.qryRotaEquipVencDATAINICIO.AsDateTime) < DateOf(DM.FDataHoraServidor) then
                   DM.qryRotaEquipVencDATAINICIO.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryRotaEquipVencFREQUENCIA.AsInteger)
                 else
                   DM.qryRotaEquipVencDATAINICIO.AsDateTime := IncDay(DateOf(DM.qryRotaEquipVencDATAINICIO.AsDateTime), DM.qryRotaEquipVencFREQUENCIA.AsInteger);
                 DM.qryRotaEquipVenc.Post;
               end;
             DM.qryRotaEquipVenc.Close;
             DM.qryRotaEquipVenc.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
             DM.qryRotaEquipVenc.Params.ParamByName('DATA').AsString       := FormatDateTime('yyyy/mm/dd', DM.FDataHoraServidor);
             DM.qryRotaEquipVenc.Open;
             TSRotas.Caption := 'Rotas ('+ IntToStr(DM.qryRotaEquipVenc.RecordCount)+')';
             DM.qryRotasSequencia.Close;
             DM.qryRotasSequenciaInsp.Close;
             DM.qryRotasSequenciaInspItens.Close;
             DM.qryRotasSequenciaInspItensEsp.Close;
             DM.qryRotas.Close;
             DM.MSGAguarde('', False);
             RotaExec := True;
           end;
        end;
    End;
end;
  inherited;
end;
procedure TFrmTelaInspVenc.EdtFamiliaEquipDblClick(Sender: TObject);
begin
  inherited;
  LCodFamilia := '';
  EdtFamiliaEquip.Text := '';
  GrdManut.DataSource.DataSet.Filtered    := False;
  GrdManut.DataSource.DataSet.Filter      := EmptyStr;
  GrdLubrific.DataSource.DataSet.Filtered := False;
  GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;
  TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutVenc.RecordCount)+')';
  TSLubrific.Caption := 'Lubrificações ('+ IntToStr(DM.qryLubrificVenc.RecordCount)+')';
end;
procedure TFrmTelaInspVenc.edtOficinaDblClick(Sender: TObject);
begin
  inherited;
  LCodOficina := '';
  EdtOficina.Text := '';
  GrdManut.DataSource.DataSet.Filtered    := False;
  GrdManut.DataSource.DataSet.Filter      := EmptyStr;
  GrdLubrific.DataSource.DataSet.Filtered := False;
  GrdLubrific.DataSource.DataSet.Filter   := EmptyStr;
  TSManut.Caption := 'Manutenções ('+ IntToStr(DM.qryManutVenc.RecordCount)+')';
  TSLubrific.Caption := 'Lubrificações ('+ IntToStr(DM.qryLubrificVenc.RecordCount)+')';
end;

procedure TFrmTelaInspVenc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryManutVenc.Close;
DM.qryManutProgEquip.Close;
DM.qryLubrificVenc.Close;
DM.qryLubrificProgEquip.Close;
DM.qryRotasSequenciaInspItensEsp.Close;
DM.qryRotasSequenciaInspItens.Close;
DM.qryRotasSequenciaInsp.Close;
DM.qryRotasSequencia.Close;
DM.qryRotas.Close;
end;
procedure TFrmTelaInspVenc.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryManutVenc.Filtered := False;
DM.qryManutVenc.Filter   := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));
DM.qryManutVenc.Filtered := True;
DM.qryLubrificVenc.Filtered := False;
DM.qryLubrificVenc.Filter   := 'DTAINICIO1 <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));
DM.qryLubrificVenc.Filtered := True;
if DM.FEmpTransf = True then
  begin
    DM.qryRotaEquipVenc.Filtered := False;
    DM.qryRotaEquipVenc.Filter   := 'DATAINICIO <= '+QuotedStr(FormatDateTime('dd/mm/yyyy', DM.FDataHoraServidor));
    DM.qryRotaEquipVenc.Filtered := True;
  end;
//if DM.FEmpTransf = True then
//  begin
//    if DM.qryRotaEquipVencSeqManut.IsEmpty = False then
//      GrdRotas.SelectedRows.CurrentRowSelected := True
//    else
//      PCInspecoes.Pages[2].TabVisible := False;
//  end;
ManutExec := False;
LubrificExec := False;
RotaExec := False;
end;
procedure TFrmTelaInspVenc.GrdManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
case PCInspecoes.ActivePageIndex of
  0:
    Begin
      GrdManut.Columns[0].Title.Font.Size := 9;
      GrdManut.Columns[0].Title.Caption   := 'Descrição';
      GrdManut.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 30;
      GrdManut.Columns[1].Title.Alignment := taCenter;
      GrdManut.Columns[1].Title.Font.Size := 9;
      GrdManut.Columns[1].Title.Caption   := 'Freq. (d)';
      GrdManut.DataSource.DataSet.FieldByName('FREQUENCIA1').DisplayWidth := 10;
      GrdManut.Columns[2].Title.Alignment := taCenter;
      GrdManut.Columns[2].Title.Font.Size := 9;
      GrdManut.Columns[2].Title.Caption   := 'Vencimento';
      GrdManut.DataSource.DataSet.FieldByName('DTAINICIO1').DisplayWidth := 12;
      GrdManut.Columns[3].Title.Font.Size := 9;
      GrdManut.Columns[3].Title.Caption   := 'Cód. Equip.';
      GrdManut.DataSource.DataSet.FieldByName('CODEQUIPAMENTO').DisplayWidth := 15;
      GrdManut.Columns[3].Title.Alignment := taCenter;
      GrdManut.Columns[3].Alignment := taCenter;
      GrdManut.Columns[3].Title.Font.Size := 9;
      //GrdManut.Columns[3].Title.Font.Style := [fsbold];
      GrdManut.Columns[4].Title.Caption   := 'Equipamento';
      GrdManut.DataSource.DataSet.FieldByName('EQUIPAMENTO').DisplayWidth := 42;
      GrdManut.Columns[4].Title.Font.Size := 9;
      GrdManut.Columns[5].Title.Alignment := taCenter;
      GrdManut.Columns[5].Title.Font.Size := 9;

      if (Column.Field.FieldName = 'DTAINICIO1') then
        begin
          if Column.Field.IsNull = False then
            if GrdManut.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime < DateOf(DM.FDataHoraServidor) then
              begin
                if DM.qryManutVencC_DIASATRASO.AsInteger < 5 then
                  begin
                    GrdManut.Canvas.Brush.Color := clYellow;
                    GrdManut.Canvas.Font.Color  := clRed;
                  end
                else
                  begin
                    GrdManut.Canvas.Brush.Color := clRed;
                    GrdManut.Canvas.Font.Color  := clWhite;
                  end;
              end;
        end;
      if not odd(GrdManut.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'DTAINICIO1') then
            if not (gdSelected in State) then
              begin
                GrdManut.Canvas.Brush.Color := $00F7F8F9;
    //          GrdOrdemServico.Canvas.FillRect(Rect);
    //          GrdOrdemServico.DefaultDrawDataCell(rect,Column.Field,state);
            end;
      GrdManut.Canvas.FillRect(Rect);
      GrdManut.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    End;
  1:
    Begin
      GrdLubrific.Columns[0].Title.Font.Size := 9;
      GrdLubrific.Columns[0].Title.Caption   := 'Descrição';
      GrdLubrific.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 30;
      GrdLubrific.Columns[1].Title.Alignment := taCenter;
      GrdLubrific.Columns[1].Title.Font.Size := 9;
      GrdLubrific.Columns[1].Title.Caption   := 'Freq. (d)';
      GrdLubrific.DataSource.DataSet.FieldByName('FREQUENCIA1').DisplayWidth := 10;
      GrdLubrific.Columns[2].Title.Alignment := taCenter;
      GrdLubrific.Columns[2].Title.Font.Size := 9;
      GrdLubrific.Columns[2].Title.Caption   := 'Vencimento';
      GrdLubrific.DataSource.DataSet.FieldByName('DTAINICIO1').DisplayWidth := 12;
      GrdLubrific.Columns[3].Title.Font.Size := 9;
      GrdLubrific.Columns[3].Title.Caption   := 'Cód. Equip.';
      GrdLubrific.DataSource.DataSet.FieldByName('CODEQUIPAMENTO').DisplayWidth := 15;
      GrdLubrific.Columns[3].Title.Alignment := taCenter;
      GrdLubrific.Columns[3].Alignment := taCenter;
      GrdLubrific.Columns[3].Title.Font.Size := 9;
      //GrdLubrific.Columns[3].Title.Font.Style := [fsbold];
      GrdLubrific.Columns[4].Title.Caption   := 'Equipamento';
      GrdLubrific.DataSource.DataSet.FieldByName('EQUIPAMENTO').DisplayWidth := 42;
      GrdLubrific.Columns[4].Title.Font.Size := 9;
      GrdLubrific.Columns[5].Title.Alignment := taCenter;
      GrdLubrific.Columns[5].Title.Font.Size := 9;

      if (Column.Field.FieldName = 'DTAINICIO1') then
        begin
          if Column.Field.IsNull = False then
            if GrdLubrific.DataSource.DataSet.FieldByName('DTAINICIO1').AsDateTime < DateOf(DM.FDataHoraServidor) then
              begin
                if DM.qryLubrificVencC_DIASATRASO.AsInteger < 5 then
                  begin
                    GrdLubrific.Canvas.Brush.Color := clYellow;
                    GrdLubrific.Canvas.Font.Color  := clRed;
                  end
                else
                  begin
                    GrdLubrific.Canvas.Brush.Color := clRed;
                    GrdLubrific.Canvas.Font.Color  := clWhite;
                  end;
              end;
        end;
      if not odd(GrdLubrific.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'DTAINICIO1') then
            if not (gdSelected in State) then
              begin
                GrdManut.Canvas.Brush.Color := $00F7F8F9;
    //          GrdOrdemServico.Canvas.FillRect(Rect);
    //          GrdOrdemServico.DefaultDrawDataCell(rect,Column.Field,state);
            end;
      GrdLubrific.Canvas.FillRect(Rect);
      GrdLubrific.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    End;
  2:
    Begin
      GrdRotas.Columns[0].Title.Font.Size := 9;
      GrdRotas.Columns[0].Title.Caption   := 'Descrição';
      GrdRotas.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 40;
      GrdRotas.Columns[1].Title.Alignment := taCenter;
      GrdRotas.Columns[1].Title.Font.Size := 9;
      GrdRotas.Columns[1].Title.Caption   := 'Freq. (d)';
      GrdRotas.DataSource.DataSet.FieldByName('FREQUENCIA').DisplayWidth := 10;
      GrdRotas.Columns[2].Title.Alignment := taCenter;
      GrdRotas.Columns[2].Title.Font.Size := 9;
      GrdRotas.Columns[2].Title.Caption   := 'Vencimento';
      GrdRotas.DataSource.DataSet.FieldByName('DATAINICIO').DisplayWidth := 12;
      GrdRotas.Columns[3].Title.Font.Size := 9;
      GrdRotas.Columns[3].Title.Alignment := taCenter;
//      GrdRotas.Columns[3].Title.Font.Style := [fsbold];
      if (Column.Field.FieldName = 'DATAINICIO') then
        begin
          if Column.Field.IsNull = False then
            if GrdRotas.DataSource.DataSet.FieldByName('DATAINICIO').AsDateTime < DateOf(DM.FDataHoraServidor) then
              begin
                if DM.qryRotaEquipVencC_DIASATRASO.AsInteger < 5 then
                  begin
                    GrdRotas.Canvas.Brush.Color := clYellow;
                    GrdRotas.Canvas.Font.Color  := clRed;
                  end
                else
                  begin
                    GrdRotas.Canvas.Brush.Color := clRed;
                    GrdRotas.Canvas.Font.Color  := clWhite;
                  end;
              end;
        end;
      if not odd(GrdRotas.DataSource.DataSet.RecNo) and (Column.Field.FieldName <> 'DATAINICIO') then
            if not (gdSelected in State) then
              begin
                GrdManut.Canvas.Brush.Color := $00F7F8F9;
    //          GrdOrdemServico.Canvas.FillRect(Rect);
    //          GrdOrdemServico.DefaultDrawDataCell(rect,Column.Field,state);
            end;
      GrdRotas.Canvas.FillRect(Rect);
      GrdRotas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    End;
end;
end;
procedure TFrmTelaInspVenc.GrdManutTitleClick(Column: TColumn);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
    0:
    begin
      if GrdManut.Columns[Column.Index].FieldName = 'C_DIASATRASO' then Exit;
      CliqueNoTitulo(Column, TFDquery(GrdManut.DataSource.DataSet), GrdManut.DataSource.DataSet.Fields[1].Name, GrdManut);
    end;
    1:
    begin
      if GrdLubrific.Columns[Column.Index].FieldName = 'C_DIASATRASO' then Exit;
      CliqueNoTitulo(Column, TFDquery(GrdLubrific.DataSource.DataSet), GrdLubrific.DataSource.DataSet.Fields[1].Name, GrdLubrific);
    end;
    2:
    begin
      if GrdRotas.Columns[Column.Index].FieldName = 'C_DIASATRASO' then Exit;
      CliqueNoTitulo(Column, TFDquery(GrdRotas.DataSource.DataSet), GrdRotas.DataSource.DataSet.Fields[1].Name, GrdRotas);
    end;
  end;
end;

end.

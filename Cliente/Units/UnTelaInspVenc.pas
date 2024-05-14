unit UnTelaInspVenc;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, System.DateUtils, Data.DB,
  Vcl.ComCtrls, FireDAC.Stan.Param, FireDAC.Comp.Client, FireDAC.Stan.Intf;
type
  TFrmTelaInspVenc = class(TFrmTelaPaiOKCancel)
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
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    chbTodos: TCheckBox;
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
    procedure FormShow(Sender: TObject);
    procedure chbTodosClick(Sender: TObject);
    procedure PCInspecoesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure PCInspecoesChange(Sender: TObject);
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
  // retira a formata��o em negrito de todas as colunas
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Title.Font.Style := [];

  // configura a ordena��o ascendente ou descendente
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

  // adiciona a ordena��o no DataSet, caso n�o exista
  if not Assigned(TFDQuery(Grid.DataSource.DataSet).Indexes.FindIndex(sIndexName)) then
    TFDQuery(Grid.DataSource.DataSet).AddIndex(sIndexName, Column.FieldName, EmptyStr, [oOrdenacao]);

  // formata o t�tulo da coluna em negrito
  Column.Title.Font.Style := [fsBold];

  // atribui a ordena��o selecionada
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
  LInsp, Pasta: String;
  LTexto: PChar;
begin
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);

LInsp := EmptyStr;
case PCInspecoes.ActivePageIndex of
  0:
    Begin
      if DM.qryManutVenc.IsEmpty = True then Exit;

      GrdManut.SetFocus;

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
          GrdManut.SelectedRows.CurrentRowSelected := True;

          DM.qryManutVenc.GotoBookmark(GrdManut.SelectedRows.Items[I]);
          DM.qryManutProgEquip.Close;
          DM.qryManutProgEquip.Params[0].AsString := DM.qryManutVencCODIGO.AsString;
          DM.qryManutProgEquip.Params[1].AsString := DM.FCodEmpresa;
          DM.qryManutProgEquip.Params[2].AsString := DM.qryManutVencCODEQUIPAMENTO.AsString;
          DM.qryManutProgEquip.Open;
          DM.qryManutProgEquipPecas.Open;
          DM.qryManutProgEquipRecursos.Open;
          DM.qryManutProgEquipEquipe.Open;
          DM.qryManutProgEquipEquipeMObra.Open;

          if (DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Execução') and (DM.qryManutProgEquipRELATORIO.AsString = 'S') then
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'EXISTE UMA '+DM.qryManutProgEquipDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
            Exit;
          end;

          DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryManutProgEquipDESCRICAO.AsString
                                                            , DM.qryManutProgEquipCODEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, EmptyStr, EmptyStr, 'N'
                                                            , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryManutProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryManutProgEquiptempototal.AsString, DM.qryManutProgEquipCODOFICINA.AsString, DM.qryManutProgEquipCODMANUTENCAO.AsString, DM.qryManutProgEquipEQUIPPARADO.AsString, EmptyStr);

          //Verifica se existe mão de obra cadastrada na manutenção
          if DM.qryManutProgEquipEquipe.IsEmpty = False then
          begin
            DM.qryOrdemServico.Close;
            DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
            DM.qryOrdemServico.Params[1].AsInteger := DM.FCodOrdemServico;
            DM.qryOrdemServico.Open;
            if DM.qryOrdemServico.IsEmpty = False then
            begin
              DM.qryOrdemServico.Edit;
              DM.qryOrdemServicoSITUACAO.AsString := 'DETALHADA';
              DM.qryOrdemServico.Post;

              DM.qryOrdemServicoEquipe.Open;
              DM.qryOrdemServicoEquipeMObra.Open;

              DM.qryManutProgEquipEquipe.First;
              while not DM.qryManutProgEquipEquipe.Eof = True do
              begin
                DM.qryOrdemServicoEquipe.Append;
                DM.qryOrdemServicoEquipeCODEMPRESA.AsString       := DM.FCodEmpresa;
                DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                DM.qryOrdemServicoEquipeCODEQUIPE.AsString        := DM.qryManutProgEquipEquipeCODEQUIPE.AsString;
                DM.qryOrdemServicoEquipeTEMPO.AsFloat             := DM.qryManutProgEquipEquipeTEMPO.AsFloat;
                DM.qryOrdemServicoEquipe.Post;

                DM.qryManutProgEquipEquipeMObra.First;
                while not DM.qryManutProgEquipEquipeMObra.Eof = True do
                begin
                  DM.qryOrdemServicoEquipeMObra.Append;
                  DM.qryOrdemServicoEquipeMObraCODEMPRESA.AsString       := DM.FCodEmpresa;
                  DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsInteger       := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
                  DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                  DM.qryOrdemServicoEquipeMObraCODCARGO.AsString         := DM.qryManutProgEquipEquipeMObraCODCARGO.AsString;
                  DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat    := DM.qryManutProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat;
                  DM.qryOrdemServicoEquipeMObra.Post;

                  DM.qryManutProgEquipEquipeMObra.Next;
                end;

                DM.qryManutProgEquipEquipe.Next;
              end;
              DM.qryOrdemServicoEquipe.Close;
              DM.qryOrdemServicoEquipeMObra.Close;
            end;
            DM.qryOrdemServico.Close;
          end else
          begin //Se não existir mão de obra cadastrada, questionar se o usuário quer cadastrar a última mão de obra lançada na manutenção
            DM.qryAuxiliar.Close;
            DM.qryAuxiliar.SQL.Text := 'SELECT MAX(`CODIGO`) AS `CODIGO` FROM `ordemservico` WHERE `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                       + ' AND (`CODMANUTPROGEQUIP` = ' + QuotedStr(DM.qryManutVencCODIGO.AsString) + ') AND `SITUACAO` = ''FECHADA''';
            DM.qryAuxiliar.Open;
            if DM.qryAuxiliar.FieldByName('CODIGO').AsInteger > 0 then
            begin
              if Application.MessageBox('Mão de obra da manutenção não cadastrada, deseja importar a última mão de obra utilizada?', 'SPMP3', MB_YESNO) = IDYes then
              begin
                //Cadastrar mão de obra da última OS no cadastro da mão de obra da manutenção
                DM.qryOrdemServico.Close;
                DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
                DM.qryOrdemServico.Params[1].AsInteger := DM.qryAuxiliar.FieldByName('CODIGO').AsInteger;
                DM.qryOrdemServico.Open;
                if DM.qryOrdemServico.IsEmpty = False then
                begin
                  DM.qryOrdemServicoEquipe.Open;
                  DM.qryOrdemServicoEquipeMObra.Open;

                  DM.qryOrdemServicoEquipe.First;
                  while not DM.qryOrdemServicoEquipe.Eof = True do
                  begin
                    DM.qryManutProgEquipEquipe.Append;
                    DM.qryManutProgEquipEquipeCODEMPRESA.AsString        := DM.FCodEmpresa;
                    DM.qryManutProgEquipEquipeCODEQUIPE.AsString         := DM.qryOrdemServicoEquipeCODEQUIPE.AsString;
                    DM.qryManutProgEquipEquipeCODMANUTPROGEQUIP.AsString := DM.qryManutVencCODIGO.AsString;
                    DM.qryManutProgEquipEquipeTEMPO.AsFloat              := DM.qryOrdemServicoEquipeTEMPO.AsFloat;
                    DM.qryManutProgEquipEquipe.Post;

                    DM.qryOrdemServicoEquipeMObra.First;
                    while not DM.qryOrdemServicoEquipeMObra.Eof = True do
                    begin
                      DM.qryManutProgEquipEquipeMObra.Append;
                      DM.qryManutProgEquipEquipeMObraCODEMPRESA.AsString        := DM.FCodEmpresa;
                      DM.qryManutProgEquipEquipeMObraCODEQUIPE.AsInteger        := DM.qryManutProgEquipEquipeCODIGO.AsInteger;
                      DM.qryManutProgEquipEquipeMObraCODMANUTPROGEQUIP.AsString := DM.qryManutVencCODIGO.AsString;
                      DM.qryManutProgEquipEquipeMObraCODCARGO.AsString          := DM.qryOrdemServicoEquipeMObraCODCARGO.AsString;
                      DM.qryManutProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat     := DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;
                      DM.qryManutProgEquipEquipeMObra.Post;

                      DM.qryOrdemServicoEquipeMObra.Next;
                    end;

                    DM.qryOrdemServicoEquipe.Next;
                  end;
                  DM.qryOrdemServicoEquipe.Close;
                  DM.qryOrdemServicoEquipeMObra.Close;
                end;
                DM.qryOrdemServico.Close;

                //Cadastrar mão de obra da manutenção na nova OS
                DM.qryOrdemServico.Close;
                DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
                DM.qryOrdemServico.Params[1].AsInteger := DM.FCodOrdemServico;
                DM.qryOrdemServico.Open;
                if DM.qryOrdemServico.IsEmpty = False then
                begin
                  DM.qryOrdemServico.Edit;
                  DM.qryOrdemServicoSITUACAO.AsString := 'DETALHADA';
                  DM.qryOrdemServico.Post;

                  DM.qryOrdemServicoEquipe.Open;
                  DM.qryOrdemServicoEquipeMObra.Open;

                  DM.qryManutProgEquipEquipe.First;
                  while not DM.qryManutProgEquipEquipe.Eof = True do
                  begin
                    DM.qryOrdemServicoEquipe.Append;
                    DM.qryOrdemServicoEquipeCODEMPRESA.AsString       := DM.FCodEmpresa;
                    DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                    DM.qryOrdemServicoEquipeCODEQUIPE.AsString        := DM.qryManutProgEquipEquipeCODEQUIPE.AsString;
                    DM.qryOrdemServicoEquipeTEMPO.AsFloat             := DM.qryManutProgEquipEquipeTEMPO.AsFloat;
                    DM.qryOrdemServicoEquipe.Post;

                    DM.qryManutProgEquipEquipeMObra.First;
                    while not DM.qryManutProgEquipEquipeMObra.Eof = True do
                    begin
                      DM.qryOrdemServicoEquipeMObra.Append;
                      DM.qryOrdemServicoEquipeMObraCODEMPRESA.AsString       := DM.FCodEmpresa;
                      DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsInteger       := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
                      DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                      DM.qryOrdemServicoEquipeMObraCODCARGO.AsString         := DM.qryManutProgEquipEquipeMObraCODCARGO.AsString;
                      DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat    := DM.qryManutProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat;
                      DM.qryOrdemServicoEquipeMObra.Post;

                      DM.qryManutProgEquipEquipeMObra.Next;
                    end;

                    DM.qryManutProgEquipEquipe.Next;
                  end;
                  DM.qryOrdemServicoEquipe.Close;
                  DM.qryOrdemServicoEquipeMObra.Close;
                end;
                DM.qryOrdemServico.Close;
              end;
            end;
          end;


          if DM.qryManutProgEquip.IsEmpty = False then
            DM.HistoricoInspecoes(0, DM.FCodEmpresa, DM.qryManutProgEquipCODEQUIPAMENTO.AsString, DM.qryManutProgEquipCODIGO.AsString, DM.FCodOrdemServico);

          if DM.qryManutProgEquipPecas.IsEmpty = False then
          begin
            DM.qryOrdemServicoEquipePecas.Open;

            DM.qryManutProgEquipPecas.First;
            while not DM.qryManutProgEquipPecas.Eof do
            begin
              DM.qryOrdemServicoEquipePecas.Append;
              DM.qryOrdemServicoEquipePecasCODEMPRESA.AsString := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipePecasCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
              DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString := DM.qryManutProgEquipPecasCODPECAREP.AsString;
              DM.qryOrdemServicoEquipePecasQTDESOLIC.AsString := DM.qryManutProgEquipPecasQUANTIDADE.AsString;
              DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString := DM.qryManutProgEquipPecasCODPECAREP.AsString;
              DM.qryOrdemServicoEquipePecas.Post;

              DM.qryManutProgEquipPecas.Next;
            end;

            DM.qryOrdemServicoEquipePecas.Close;
          end;

          if DM.qryManutProgEquipRecursos.IsEmpty = False then
          begin
            DM.qryOrdemServicoEquipe.Open;
            DM.qryOrdemServicoEquipe.Append;
            DM.qryOrdemServicoEquipeCODEQUIPE.AsInteger := 1;
            DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
            DM.qryOrdemServicoEquipe.Post;

            DM.qryOrdemServicoEquipeRecursos.Open;
            DM.qryManutProgEquipRecursos.First;
            while not DM.qryManutProgEquipRecursos.Eof do
            begin
              DM.qryOrdemServicoEquipeRecursos.Append;
              DM.qryOrdemServicoEquipeRecursosCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipeRecursosCODEQUIPE.AsInteger        := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
              DM.qryOrdemServicoEquipeRecursosCODORDEMSERVICO.AsInteger  := DM.FCodOrdemServico;
              DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsFloat          := DM.qryManutProgEquipRecursosQUANTIDADE.AsFloat;
              DM.qryOrdemServicoEquipeRecursosCODRECURSO.AsString        := DM.qryManutProgEquipRecursosCODRECURSO.AsString;
              DM.qryOrdemServicoEquipeRecursos.Post;


              DM.qryManutProgEquipRecursos.Next;
            end;
            DM.qryOrdemServicoEquipeRecursos.Close;
          end;

          DM.qryManutProgEquip.Edit;
          DM.qryManutProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
          DM.qryManutProgEquip.Post;

          DmRelatorios.frxRManutProgEquipIndividual.ShowReport();

//          DmRelatorios.frxPDFExport1.DefaultPath := ExtractFilePath(Application.ExeName)+'Relatórios';
//          DmRelatorios.frxPDFExport1.FileName    := DM.qryManutProgEquipCODORDEMSERVICO.AsString +'_'+DM.qryManutVencDESCRICAO.AsString +'.PDF';
//          DmRelatorios.frxPDFExport1.ShowDialog  := False;
//          DmRelatorios.frxRManutProgEquipIndividual.PrepareReport();
//          DmRelatorios.frxRManutProgEquipIndividual.Export(DmRelatorios.frxPDFExport1);

          //Sendo a inspeção reprogramada pela 'programação', programa a pr�xima inspeção independente se a manutenção foi fechada ou n�o.
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

          //Sendo a inspeção reprogramada pela execu��o, definir como manutenção em aberto at� ser efetuado o fechamento, portanto n�o permitindo
          //a geração de outra manutenção mesmo que o período ven�a novamente. Define a coluna 'RELATORIO = S' para impedir a gera��o de outra manutenção at� ser fechada.
          if DM.qryManutProgEquipREPROGRAMAR1.AsString = 'Execução' then
          begin
            DM.qryManutProgEquip.Edit;
            DM.qryManutProgEquipRELATORIO.AsString    := 'S';
            if (DM.qryManutProgEquipREPROGRAMAR2.AsString = 'programação') and (DM.qryManutProgEquipRELATORIO.AsString = 'S') then
              DM.qryManutProgEquipLEITURA.AsInteger := DM.qryManutProgEquipLEITURA.AsInteger + DM.qryManutProgEquipFREQUENCIA2.AsInteger;
            DM.qryManutProgEquip.Post;
          end;
        end;

        DM.qryManutProgEquip.Close;
        DM.qryManutProgEquipPecas.Close;
        DM.qryManutProgEquipRecursos.Close;
        DM.qryManutProgEquipEquipe.Close;
        DM.qryManutProgEquipEquipeMObra.Close;

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
          GrdLubrific.SelectedRows.CurrentRowSelected := True;
          DM.qryLubrificVenc.GotoBookmark(GrdLubrific.SelectedRows.Items[I]);

          DM.qryLubrificProgEquip.Close;
          DM.qryLubrificProgEquip.Params[0].AsString := DM.qryLubrificVencCODIGO.AsString;
          DM.qryLubrificProgEquip.Params[1].AsString := DM.FCodEmpresa;
          DM.qryLubrificProgEquip.Params[2].AsString := DM.qryLubrificVencCODEQUIPAMENTO.AsString;
          DM.qryLubrificProgEquip.Open;
          DM.qryLubrificProgEquipPecas.Open;
          DM.qryLubrificProgEquipRecursos.Open;
          DM.qryLubrificProgEquipEquipe.Open;
          DM.qryLubrificProgEquipEquipeMObra.Open;

          if (DM.qryLubrificProgEquipREPROGRAMAR1.AsString = 'Execução') and (DM.qryLubrificProgEquipRELATORIO.AsString = 'S') then
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'EXISTE UMA '+DM.qryLubrificProgEquipDESCRICAO.AsString+' QUE PRECISA SER FECHADA ANTES DE SER PROGRAMADA NOVAMENTE!';
            Exit;
          end;


          DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryLubrificProgEquipDESCRICAO.AsString
                                                            , DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString, EmptyStr, DM.qryLubrificProgEquipCODIGO.AsString, EmptyStr, 'N'
                                                            , EmptyStr, 'Emergência', 'Para o Equipamento', DM.qryLubrificProgEquipCODCENTROCUSTO.AsString, EmptyStr, DM.qryLubrificProgEquiptempototal.AsString, DM.qryLubrificProgEquipCODOFICINA.AsString, DM.qryLubrificProgEquipCODMANUTENCAO.AsString, DM.qryLubrificProgEquipEQUIPPARADO.AsString, EmptyStr);

          //Verifica se existe mão de obra cadastrada na manutenção
          if DM.qryLubrificProgEquipEquipe.IsEmpty = False then
          begin
            DM.qryOrdemServico.Close;
            DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
            DM.qryOrdemServico.Params[1].AsInteger := DM.FCodOrdemServico;
            DM.qryOrdemServico.Open;
            if DM.qryOrdemServico.IsEmpty = False then
            begin
              DM.qryOrdemServico.Edit;
              DM.qryOrdemServicoSITUACAO.AsString := 'DETALHADA';
              DM.qryOrdemServico.Post;

              DM.qryOrdemServicoEquipe.Open;
              DM.qryOrdemServicoEquipeMObra.Open;

              DM.qryLubrificProgEquipEquipe.First;
              while not DM.qryLubrificProgEquipEquipe.Eof = True do
              begin
                DM.qryOrdemServicoEquipe.Append;
                DM.qryOrdemServicoEquipeCODEMPRESA.AsString       := DM.FCodEmpresa;
                DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                DM.qryOrdemServicoEquipeCODEQUIPE.AsString        := DM.qryLubrificProgEquipEquipeCODEQUIPE.AsString;
                DM.qryOrdemServicoEquipeTEMPO.AsFloat             := DM.qryLubrificProgEquipEquipeTEMPO.AsFloat;
                DM.qryOrdemServicoEquipe.Post;

                DM.qryLubrificProgEquipEquipeMObra.First;
                while not DM.qryLubrificProgEquipEquipeMObra.Eof = True do
                begin
                  DM.qryOrdemServicoEquipeMObra.Append;
                  DM.qryOrdemServicoEquipeMObraCODEMPRESA.AsString       := DM.FCodEmpresa;
                  DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsInteger       := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
                  DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                  DM.qryOrdemServicoEquipeMObraCODCARGO.AsString         := DM.qryLubrificProgEquipEquipeMObraCODCARGO.AsString;
                  DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat    := DM.qryLubrificProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat;
                  DM.qryOrdemServicoEquipeMObra.Post;

                  DM.qryLubrificProgEquipEquipeMObra.Next;
                end;
                DM.qryLubrificProgEquipEquipe.Next;
              end;
              DM.qryOrdemServicoEquipe.Close;
              DM.qryOrdemServicoEquipeMObra.Close;
            end;
            DM.qryOrdemServico.Close;
          end else
          begin //Se não existir mão de obra cadastrada, questionar se o usuário quer cadastrar a última mão de obra lançada na lubrificação
            DM.qryAuxiliar.Close;
            DM.qryAuxiliar.SQL.Text := 'SELECT MAX(`CODIGO`) AS `CODIGO` FROM `ordemservico` WHERE `CODEMPRESA` = ' + QuotedStr(DM.FCodEmpresa)
                                       + ' AND (`CODLUBRIFICPROGEQUIP` = ' + QuotedStr(DM.qryLubrificVencCODIGO.AsString) + ') AND `SITUACAO` = ''FECHADA''';
            DM.qryAuxiliar.Open;
            if DM.qryAuxiliar.FieldByName('CODIGO').AsInteger > 0 then
            begin
              if Application.MessageBox('Mão de obra da lubrificação não cadastrada, deseja importar a última mão de obra utilizada?', 'SPMP3', MB_YESNO) = IDYes then
              begin
                //Cadastrar mão de obra da última OS no cadastro da mão de obra da lubrificação
                DM.qryOrdemServico.Close;
                DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
                DM.qryOrdemServico.Params[1].AsInteger := DM.qryAuxiliar.FieldByName('CODIGO').AsInteger;
                DM.qryOrdemServico.Open;
                if DM.qryOrdemServico.IsEmpty = False then
                begin
                  DM.qryOrdemServicoEquipe.Open;
                  DM.qryOrdemServicoEquipeMObra.Open;

                  DM.qryOrdemServicoEquipe.First;
                  while not DM.qryOrdemServicoEquipe.Eof = True do
                  begin
                    DM.qryLubrificProgEquipEquipe.Append;
                    DM.qryLubrificProgEquipEquipeCODEMPRESA.AsString        := DM.FCodEmpresa;
                    DM.qryLubrificProgEquipEquipeCODEQUIPE.AsString         := DM.qryOrdemServicoEquipeCODEQUIPE.AsString;
                    DM.qryLubrificProgEquipEquipeCODLUBRIFICPROGEQUIP.AsString := DM.qryLubrificVencCODIGO.AsString;
                    DM.qryLubrificProgEquipEquipeTEMPO.AsFloat              := DM.qryOrdemServicoEquipeTEMPO.AsFloat;
                    DM.qryLubrificProgEquipEquipe.Post;

                    DM.qryOrdemServicoEquipeMObra.First;
                    while not DM.qryOrdemServicoEquipeMObra.Eof = True do
                    begin
                      DM.qryLubrificProgEquipEquipeMObra.Append;
                      DM.qryLubrificProgEquipEquipeMObraCODEMPRESA.AsString        := DM.FCodEmpresa;
                      DM.qryLubrificProgEquipEquipeMObraCODEQUIPE.AsInteger        := DM.qryLubrificProgEquipEquipeCODIGO.AsInteger;
                      DM.qryLubrificProgEquipEquipeMObraCODLUBRIFICPROGEQUIP.AsString := DM.qryLubrificVencCODIGO.AsString;
                      DM.qryLubrificProgEquipEquipeMObraCODCARGO.AsString          := DM.qryOrdemServicoEquipeMObraCODCARGO.AsString;
                      DM.qryLubrificProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat     := DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat;
                      DM.qryLubrificProgEquipEquipeMObra.Post;

                      DM.qryOrdemServicoEquipeMObra.Next;
                    end;

                    DM.qryOrdemServicoEquipe.Next;
                  end;
                  DM.qryOrdemServicoEquipe.Close;
                  DM.qryOrdemServicoEquipeMObra.Close;
                end;
                DM.qryOrdemServico.Close;

                //Cadastrar mão de obra da lubrificação na nova OS
                DM.qryOrdemServico.Close;
                DM.qryOrdemServico.Params[0].AsString  := DM.FCodEmpresa;
                DM.qryOrdemServico.Params[1].AsInteger := DM.FCodOrdemServico;
                DM.qryOrdemServico.Open;
                if DM.qryOrdemServico.IsEmpty = False then
                begin
                  DM.qryOrdemServico.Edit;
                  DM.qryOrdemServicoSITUACAO.AsString := 'DETALHADA';
                  DM.qryOrdemServico.Post;

                  DM.qryOrdemServicoEquipe.Open;
                  DM.qryOrdemServicoEquipeMObra.Open;

                  DM.qryLubrificProgEquipEquipe.First;
                  while not DM.qryLubrificProgEquipEquipe.Eof = True do
                  begin
                    DM.qryOrdemServicoEquipe.Append;
                    DM.qryOrdemServicoEquipeCODEMPRESA.AsString       := DM.FCodEmpresa;
                    DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                    DM.qryOrdemServicoEquipeCODEQUIPE.AsString        := DM.qryLubrificProgEquipEquipeCODEQUIPE.AsString;
                    DM.qryOrdemServicoEquipeTEMPO.AsFloat             := DM.qryLubrificProgEquipEquipeTEMPO.AsFloat;
                    DM.qryOrdemServicoEquipe.Post;

                    DM.qryLubrificProgEquipEquipeMObra.First;
                    while not DM.qryLubrificProgEquipEquipeMObra.Eof = True do
                    begin
                      DM.qryOrdemServicoEquipeMObra.Append;
                      DM.qryOrdemServicoEquipeMObraCODEMPRESA.AsString       := DM.FCodEmpresa;
                      DM.qryOrdemServicoEquipeMObraCODEQUIPE.AsInteger       := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
                      DM.qryOrdemServicoEquipeMObraCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
                      DM.qryOrdemServicoEquipeMObraCODCARGO.AsString         := DM.qryLubrificProgEquipEquipeMObraCODCARGO.AsString;
                      DM.qryOrdemServicoEquipeMObraTOTALHOMEMHORA.AsFloat    := DM.qryLubrificProgEquipEquipeMObraTOTALHOMEMHORA.AsFloat;
                      DM.qryOrdemServicoEquipeMObra.Post;

                      DM.qryLubrificProgEquipEquipeMObra.Next;
                    end;

                    DM.qryLubrificProgEquipEquipe.Next;
                  end;
                  DM.qryOrdemServicoEquipe.Close;
                  DM.qryOrdemServicoEquipeMObra.Close;
                end;
                DM.qryOrdemServico.Close;
              end;
            end;
          end;

          if DM.qryLubrificProgEquip.IsEmpty = False then
            DM.HistoricoInspecoes(1, DM.FCodEmpresa, DM.qryLubrificProgEquipCODEQUIPAMENTO.AsString, DM.qryLubrificProgEquipCODIGO.AsString, DM.FCodOrdemServico);

          if DM.qryLubrificProgEquipPecas.IsEmpty = False then
          begin
            DM.qryOrdemServicoEquipePecas.Open;

            DM.qryLubrificProgEquipPecas.First;
            while not DM.qryLubrificProgEquipPecas.Eof do
            begin
              DM.qryOrdemServicoEquipePecas.Append;
              DM.qryOrdemServicoEquipePecasCODEMPRESA.AsString := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipePecasCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
              DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString := DM.qryLubrificProgEquipPecasCODPECAREP.AsString;
              DM.qryOrdemServicoEquipePecasQTDESOLIC.AsString := DM.qryLubrificProgEquipPecasQUANTIDADE.AsString;
              DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString := DM.qryLubrificProgEquipPecasCODPECAREP.AsString;
              DM.qryOrdemServicoEquipePecas.Post;

              DM.qryLubrificProgEquipPecas.Next;
            end;

            DM.qryOrdemServicoEquipePecas.Close;
          end;

          if DM.qryLubrificProgEquipRecursos.IsEmpty = False then
          begin
            DM.qryOrdemServicoEquipe.Open;
            DM.qryOrdemServicoEquipe.Append;
            DM.qryOrdemServicoEquipeCODEQUIPE.AsInteger := 1;
            DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
            DM.qryOrdemServicoEquipe.Post;

            DM.qryOrdemServicoEquipeRecursos.Open;
            DM.qryLubrificProgEquipRecursos.First;
            while not DM.qryLubrificProgEquipRecursos.Eof do
            begin
              DM.qryOrdemServicoEquipeRecursos.Append;
              DM.qryOrdemServicoEquipeRecursosCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipeRecursosCODEQUIPE.AsInteger        := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
              DM.qryOrdemServicoEquipeRecursosCODORDEMSERVICO.AsInteger  := DM.FCodOrdemServico;
              DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsFloat          := DM.qryLubrificProgEquipRecursosQUANTIDADE.AsFloat;
              DM.qryOrdemServicoEquipeRecursosCODRECURSO.AsString        := DM.qryLubrificProgEquipRecursosCODRECURSO.AsString;
              DM.qryOrdemServicoEquipeRecursos.Post;


              DM.qryLubrificProgEquipRecursos.Next;
            end;

            DM.qryOrdemServicoEquipeRecursos.Close;
          end;

          DM.qryLubrificProgEquip.Edit;
          DM.qryLubrificProgEquipCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
          DM.qryLubrificProgEquip.Post;

          DmRelatorios.frxRLubrificProgEquipIndividual.ShowReport();

          //Sendo a inspeção reprogramada pela 'programação', programa a próxima inspeção independente se a manutenção foi fechada ou n�o.
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

          //Sendo a inspeção reprogramada pela execução, definir como manutenção em aberto até ser efetuado o fechamento, portanto não permitindo
          //a geração de outra manutenção mesmo que o período vença novamente. Define a coluna 'RELATORIO = S' para impedir a geração de outra manutenção até ser fechada.
          if DM.qryLubrificProgEquipREPROGRAMAR1.AsString = 'Execução' then
          begin
            DM.qryLubrificProgEquip.Edit;
            DM.qryLubrificProgEquipRELATORIO.AsString    := 'S';
            if (DM.qryLubrificProgEquipREPROGRAMAR2.AsString = 'programação') and (DM.qryLubrificProgEquipRELATORIO.AsString = 'S') then
              DM.qryLubrificProgEquipLEITURA.AsInteger := DM.qryLubrificProgEquipLEITURA.AsInteger + DM.qryLubrificProgEquipFREQUENCIA2.AsInteger;
            DM.qryLubrificProgEquip.Post;
          end;
        end;

        DM.qryLubrificProgEquip.Close;
        DM.qryLubrificProgEquipPecas.Close;
        DM.qryLubrificProgEquipRecursos.Close;
        DM.qryLubrificProgEquipEquipe.Close;
        DM.qryLubrificProgEquipEquipeMObra.Close;

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
          GrdRotas.SelectedRows.CurrentRowSelected := True;
          DM.qryRotaEquipVenc.GotoBookmark(GrdRotas.SelectedRows.Items[I]);
          DM.FCodOrdemServico := DM.GerarOS(DM.FCodUsuario, DM.FCodEmpresa, DM.qryRotaEquipVencDESCRICAO.AsString
                                            , EmptyStr, EmptyStr, EmptyStr, 'S', 'N'
                                            , EmptyStr, 'Emergência', 'Para o Equipamento', EmptyStr, EmptyStr, '0', EmptyStr, EmptyStr, EmptyStr, EmptyStr);

          if DM.qryRotaEquipVenc.IsEmpty = False then
            DM.HistoricoInspecoes(2, DM.FCodEmpresa, EmptyStr, DM.qryRotaEquipVencCODIGO.AsString, DM.FCodOrdemServico);

          if DM.qryRotaEquipVencSeqManutPecas.IsEmpty = False then
          begin
            DM.qryOrdemServicoEquipePecas.Open;

            DM.qryRotaEquipVencSeqManutPecas.First;
            while not DM.qryManutProgEquipPecas.Eof do
            begin
              DM.qryOrdemServicoEquipePecas.Append;
              DM.qryOrdemServicoEquipePecasCODEMPRESA.AsString := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipePecasCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
              DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString := DM.qryRotaEquipVencSeqManutPecasCODPECAREP.AsString;
              DM.qryOrdemServicoEquipePecasQTDESOLIC.AsString := DM.qryRotaEquipVencSeqManutPecasQUANTIDADE.AsString;
              DM.qryOrdemServicoEquipePecasCODPECASREPOSICAO.AsString := DM.qryRotaEquipVencSeqManutPecasCODPECAREP.AsString;
              DM.qryOrdemServicoEquipePecas.Post;

              DM.qryRotaEquipVencSeqManutPecas.Next;
            end;

            DM.qryOrdemServicoEquipePecas.Close;
          end;

          if DM.qryRotaEquipVencSeqManutRecursos.IsEmpty = False then
          begin
            DM.qryOrdemServicoEquipe.Open;
            DM.qryOrdemServicoEquipe.Append;
            DM.qryOrdemServicoEquipeCODEQUIPE.AsInteger := 1;
            DM.qryOrdemServicoEquipeCODORDEMSERVICO.AsInteger := DM.FCodOrdemServico;
            DM.qryOrdemServicoEquipe.Post;

            DM.qryOrdemServicoEquipeRecursos.Open;
            DM.qryRotaEquipVencSeqManutRecursos.First;
            while not DM.qryRotaEquipVencSeqManutRecursos.Eof do
            begin
              DM.qryOrdemServicoEquipeRecursos.Append;
              DM.qryOrdemServicoEquipeRecursosCODEMPRESA.AsString        := DM.FCodEmpresa;
              DM.qryOrdemServicoEquipeRecursosCODEQUIPE.AsInteger        := DM.qryOrdemServicoEquipeCODIGO.AsInteger;
              DM.qryOrdemServicoEquipeRecursosCODORDEMSERVICO.AsInteger  := DM.FCodOrdemServico;
              DM.qryOrdemServicoEquipeRecursosQTDESOLIC.AsFloat          := DM.qryRotaEquipVencSeqManutRecursosQUANTIDADE.AsFloat;
              DM.qryOrdemServicoEquipeRecursosCODRECURSO.AsString        := DM.qryRotaEquipVencSeqManutRecursosCODRECURSO.AsString;
              DM.qryOrdemServicoEquipeRecursos.Post;


              DM.qryRotaEquipVencSeqManutRecursos.Next;
            end;
            DM.qryOrdemServicoEquipeRecursos.Close;
          end;

          DmRelatorios.frxRRotaIndividual.ShowReport();

          //Sendo a inspeção reprogramada pela 'programação', programa a próxima inspeção independente se a manutenção foi fechada ou n�o.
          if DM.qryRotaEquipVencREPROGRAMAR.AsString = 'Programação' then
          begin
            DM.qryRotaEquipVenc.Edit;
            DM.qryRotaEquipVencRELATORIO.AsString  := 'N';
            if DateOf(DM.qryRotaEquipVencDATAINICIO.AsDateTime) < DateOf(DM.FDataHoraServidor) then
              DM.qryRotaEquipVencDATAINICIO.AsDateTime := IncDay(DateOf(DM.FDataHoraServidor), DM.qryRotaEquipVencFREQUENCIA.AsInteger)
            else
              DM.qryRotaEquipVencDATAINICIO.AsDateTime := IncDay(DateOf(DM.qryRotaEquipVencDATAINICIO.AsDateTime), DM.qryRotaEquipVencFREQUENCIA.AsInteger);
            DM.qryRotaEquipVenc.Post;

            DM.qryRotaEquipVencSeq.First;
            while not DM.qryRotaEquipVencSeq.Eof = True do
            begin
              DM.qryRotaEquipVencSeqManut.First;
              while not DM.qryRotaEquipVencSeqManut.Eof = True do
              begin
                DM.qryRotaEquipVencSeqManut.Edit;
                DM.qryRotaEquipVencSeqManutDTAINICIO1.AsDateTime := DM.qryRotaEquipVencDATAINICIO.AsDateTime;
                DM.qryRotaEquipVencSeqManutRELATORIO.AsString    := 'N';
                DM.qryRotaEquipVencSeqManut.Post;

                DM.qryRotaEquipVencSeqManut.Next;
              end;

             DM.qryRotaEquipVencSeq.Next;
            end;
          end;

          //Sendo a inspeção reprogramada pela execução, definir como manutenção em aberto até ser efetuado o fechamento, portanto não permitindo
          //a geração de outra manutenção mesmo que o per�odo vença novamente. Define a coluna 'RELATORIO = S' para impedir a geração de outra manutenção até ser fechada.
          if DM.qryRotaEquipVencREPROGRAMAR.AsString = 'Execução' then
          begin
            DM.qryRotaEquipVenc.Edit;
            DM.qryRotaEquipVencRELATORIO.AsString := 'S';
            DM.qryRotaEquipVenc.Post;

            DM.qryRotaEquipVencSeq.First;
            while not DM.qryRotaEquipVencSeq.Eof = True do
            begin
              DM.qryRotaEquipVencSeqManut.First;
              while not DM.qryRotaEquipVencSeqManut.Eof = True do
              begin
                DM.qryRotaEquipVencSeqManut.Edit;
                DM.qryRotaEquipVencSeqManutRELATORIO.AsString := 'S';
                DM.qryRotaEquipVencSeqManut.Post;

                DM.qryRotaEquipVencSeqManut.Next;
              end;

              DM.qryRotaEquipVencSeq.Next;
            end;
          end;

          DM.qryRotaEquipVenc.Refresh;
          DM.qryRotaEquipVencSeq.Close;
          DM.qryRotaEquipVencSeqManut.Close;
          DM.qryRotaEquipVencSeqManutPecas.Close;
          DM.qryRotaEquipVencSeqManutRecursos.Close;

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

procedure TFrmTelaInspVenc.chbTodosClick(Sender: TObject);
begin
  inherited;
  case PCInspecoes.TabIndex of
    0:
      begin
        DM.qryManutVenc.First;
        while not DM.qryManutVenc.Eof = True do
        begin
          GrdManut.DataSource.DataSet.RecNo := DM.qryManutVenc.RecNo;

          if chbTodos.Checked = True then
            GrdManut.SelectedRows.CurrentRowSelected := True
          else
            GrdManut.SelectedRows.CurrentRowSelected := False;

          DM.qryManutVenc.Next;
        end;
        DM.qryManutVenc.First;
      end;
    1:
      begin
        DM.qryLubrificVenc.First;
        while not DM.qryLubrificVenc.Eof = True do
        begin
          GrdLubrific.DataSource.DataSet.RecNo := DM.qryLubrificVenc.RecNo;

          if chbTodos.Checked = True then
            GrdLubrific.SelectedRows.CurrentRowSelected := True
          else
            GrdLubrific.SelectedRows.CurrentRowSelected := False;

          DM.qryLubrificVenc.Next;
        end;
        DM.qryLubrificVenc.First;
      end;
    2:
      begin
        DM.qryRotaEquipVenc.First;
        while not DM.qryRotaEquipVenc.Eof = True do
        begin
          GrdRotas.DataSource.DataSet.RecNo := DM.qryRotaEquipVenc.RecNo;

          if chbTodos.Checked = True then
            GrdRotas.SelectedRows.CurrentRowSelected := True
          else
            GrdRotas.SelectedRows.CurrentRowSelected := False;

          DM.qryRotaEquipVenc.Next;
        end;
        DM.qryRotaEquipVenc.First;
      end;
  end;
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

  ManutExec := False;
  LubrificExec := False;
  RotaExec := False;
end;
procedure TFrmTelaInspVenc.FormShow(Sender: TObject);
begin
  inherited;
GrdManut.SetFocus;
GrdManut.SelectedRows.CurrentRowSelected := True;
end;

procedure TFrmTelaInspVenc.GrdManutDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
case PCInspecoes.ActivePageIndex of
  0:
    Begin
      GrdManut.Columns[0].Title.Font.Size := 8;
      GrdManut.Columns[0].Title.Caption   := 'Descrição';
      GrdManut.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 45;
      GrdManut.Columns[1].Title.Alignment := taCenter;
      GrdManut.Columns[1].Title.Font.Size := 8;
      GrdManut.Columns[1].Title.Caption   := 'Freq. (d)';
      GrdManut.DataSource.DataSet.FieldByName('FREQUENCIA1').DisplayWidth := 7;
      GrdManut.Columns[2].Title.Alignment := taCenter;
      GrdManut.Columns[2].Title.Font.Size := 8;
      GrdManut.Columns[2].Title.Caption   := 'Vencimento';
      GrdManut.DataSource.DataSet.FieldByName('DTAINICIO1').DisplayWidth := 10;
      GrdManut.Columns[3].Title.Font.Size := 8;
      GrdManut.Columns[3].Title.Caption   := 'Cód. Equip.';
      GrdManut.DataSource.DataSet.FieldByName('CODEQUIPAMENTO').DisplayWidth := 12;
      GrdManut.Columns[3].Title.Alignment := taCenter;
      GrdManut.Columns[3].Alignment := taCenter;
      GrdManut.Columns[3].Title.Font.Size := 8;
      //GrdManut.Columns[3].Title.Font.Style := [fsbold];
      GrdManut.Columns[4].Title.Caption   := 'Equipamento';
      GrdManut.DataSource.DataSet.FieldByName('EQUIPAMENTO').DisplayWidth := 35;
      GrdManut.Columns[4].Title.Font.Size := 8;
      GrdManut.Columns[5].Title.Alignment := taCenter;
      GrdManut.Columns[5].Title.Font.Size := 8;

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
      GrdLubrific.Columns[0].Title.Font.Size := 8;
      GrdLubrific.Columns[0].Title.Caption   := 'Descrição';
      GrdLubrific.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 45;
      GrdLubrific.Columns[1].Title.Alignment := taCenter;
      GrdLubrific.Columns[1].Title.Font.Size := 8;
      GrdLubrific.Columns[1].Title.Caption   := 'Freq. (d)';
      GrdLubrific.DataSource.DataSet.FieldByName('FREQUENCIA1').DisplayWidth := 7;
      GrdLubrific.Columns[2].Title.Alignment := taCenter;
      GrdLubrific.Columns[2].Title.Font.Size := 8;
      GrdLubrific.Columns[2].Title.Caption   := 'Vencimento';
      GrdLubrific.DataSource.DataSet.FieldByName('DTAINICIO1').DisplayWidth := 10;
      GrdLubrific.Columns[3].Title.Font.Size := 8;
      GrdLubrific.Columns[3].Title.Caption   := 'Cód. Equip.';
      GrdLubrific.DataSource.DataSet.FieldByName('CODEQUIPAMENTO').DisplayWidth := 12;
      GrdLubrific.Columns[3].Title.Alignment := taCenter;
      GrdLubrific.Columns[3].Alignment := taCenter;
      GrdLubrific.Columns[3].Title.Font.Size := 8;
      //GrdLubrific.Columns[3].Title.Font.Style := [fsbold];
      GrdLubrific.Columns[4].Title.Caption   := 'Equipamento';
      GrdLubrific.DataSource.DataSet.FieldByName('EQUIPAMENTO').DisplayWidth := 35;
      GrdLubrific.Columns[4].Title.Font.Size := 8;
      GrdLubrific.Columns[5].Title.Alignment := taCenter;
      GrdLubrific.Columns[5].Title.Font.Size := 8;

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
      GrdRotas.Columns[0].Title.Font.Size := 8;
      GrdRotas.Columns[0].Title.Caption   := 'Descrição';
      GrdRotas.DataSource.DataSet.FieldByName('DESCRICAO').DisplayWidth := 40;
      GrdRotas.Columns[1].Title.Alignment := taCenter;
      GrdRotas.Columns[1].Title.Font.Size := 8;
      GrdRotas.Columns[1].Title.Caption   := 'Freq. (d)';
      GrdRotas.DataSource.DataSet.FieldByName('FREQUENCIA').DisplayWidth := 10;
      GrdRotas.Columns[2].Title.Alignment := taCenter;
      GrdRotas.Columns[2].Title.Font.Size := 8;
      GrdRotas.Columns[2].Title.Caption   := 'Vencimento';
      GrdRotas.DataSource.DataSet.FieldByName('DATAINICIO').DisplayWidth := 12;
      GrdRotas.Columns[3].Title.Font.Size := 8;
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



procedure TFrmTelaInspVenc.PCInspecoesChange(Sender: TObject);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
   0:
   begin
    GrdManut.SetFocus;
    GrdManut.SelectedRows.CurrentRowSelected := True;
   end;
   1:
   begin
     GrdLubrific.SetFocus;
     GrdLubrific.SelectedRows.CurrentRowSelected := True;
     chbTodos.Checked := False;
   end;
   2:
   begin
     GrdRotas.SetFocus;
     GrdRotas.SelectedRows.CurrentRowSelected := True;
     chbTodos.Checked := False;
   end;
  end;
end;

procedure TFrmTelaInspVenc.PCInspecoesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  case PCInspecoes.ActivePageIndex of
   0:
   begin
    GrdManut.DataSource.DataSet.DisableControls;
    GrdManut.SelectedRows.Clear;
    GrdManut.DataSource.DataSet.EnableControls;

    GrdManut.SetFocus;
    GrdManut.SelectedRows.CurrentRowSelected := True;
   end;
   1:
   begin
     GrdLubrific.DataSource.DataSet.DisableControls;
     GrdLubrific.SelectedRows.Clear;
     GrdLubrific.DataSource.DataSet.EnableControls;

     GrdLubrific.SetFocus;
     GrdLubrific.SelectedRows.CurrentRowSelected := True;
     chbTodos.Checked := False;
   end;
   2:
   begin
     GrdRotas.DataSource.DataSet.DisableControls;
     GrdRotas.SelectedRows.Clear;
     GrdRotas.DataSource.DataSet.EnableControls;

     GrdRotas.SetFocus;
     GrdRotas.SelectedRows.CurrentRowSelected := True;
     chbTodos.Checked := False;
   end;
  end;

end;

end.


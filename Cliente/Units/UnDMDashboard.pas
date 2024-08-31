unit UnDMDashboard;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Graphics, Vcl.Forms,
  System.DateUtils;

type
  TDMDashboard = class(TDataModule)
    qryDashboard: TFDQuery;
    qryMTBFMedio: TFDQuery;
    qryMTBFEquipamentos: TFDQuery;
    qryMTTRMedio: TFDQuery;
    qryMTTREquipamentos: TFDQuery;
    qryMTTREquipamentosMTTR_MEDIA: TFMTBCDField;
    qryMTTREquipamentosMTTR_MEDIA_FORMAT: TStringField;
    qryMTTREquipamentosDATA1: TDateField;
    qryMTTREquipamentosDATA2: TDateField;
    qryHorasExtrasMedia: TFDQuery;
    qryHorasExtrasFunc: TFDQuery;
    qryMTBFMedioMTBF_MEDIA: TFMTBCDField;
    qryMTBFMedioMTBF_MEDIA_FORMAT: TStringField;
    qryMTBFMedioDATA1: TDateField;
    qryMTBFMedioDATA2: TDateField;
    qryMTBFEquipamentosCODEQUIPAMENTO: TStringField;
    qryMTBFEquipamentosEQUIPAMENTO: TStringField;
    qryMTBFEquipamentosMTBF_MEDIA: TFMTBCDField;
    qryMTBFEquipamentosMTBF_MEDIA_FORMAT: TStringField;
    qryMTTRMedioMTTR_MEDIA: TFMTBCDField;
    qryMTTRMedioMTTR_MEDIA_FORMAT: TStringField;
    qryMTTRMedioDATA1: TDateField;
    qryMTTRMedioDATA2: TDateField;
    qryHorasExtrasFuncCODORDEMSERVICO: TIntegerField;
    qryHorasExtrasFuncDATAFECHAMENTO: TDateTimeField;
    qryHorasExtrasFuncMATRICULA: TStringField;
    qryHorasExtrasFuncFUNCIONARIO: TStringField;
    qryHorasExtrasFuncHORASTRABALHADAS: TFMTBCDField;
    qryHorasExtrasFuncHORASEXTRAS: TFMTBCDField;
    qryHorasExtrasFuncPERCENTUAL: TStringField;
    qryHorasExtrasFuncDATA1: TDateField;
    qryHorasExtrasFuncDATA2: TDateField;
    qryHorasExtrasMediaDATAFECHAMENTO: TDateTimeField;
    qryHorasExtrasMediaHORASTRABALHADAS: TFMTBCDField;
    qryHorasExtrasMediaHORASEXTRAS: TFMTBCDField;
    qryHorasExtrasMediaPERCENTUAL: TStringField;
    qryMTBFEquipamentosDATA1: TDateField;
    qryMTBFEquipamentosDATA2: TDateField;
    qryMTTREquipamentosCODEQUIPAMENTO: TStringField;
    qryMTTREquipamentosEQUIPAMENTO: TStringField;
    qryOficinas5: TFDQuery;
    qryOficinas5OFICINA: TStringField;
    qryOficinas5TOTAL: TFMTBCDField;
    qryOficinasIndiv: TFDQuery;
    qryOficinasIndivOFICINA: TStringField;
    qryOficinasIndivTOTAL: TLargeintField;
    qryMTBFMedioOficina: TFDQuery;
    qryMTBFMedioOficinaCODEQUIPAMENTO: TStringField;
    qryMTBFMedioOficinaEQUIPAMENTO: TStringField;
    qryMTBFMedioOficinaMTBF_MEDIA: TFMTBCDField;
    qryMTBFMedioOficinaMTBF_MEDIA_FORMAT: TStringField;
    qryMTBFMedioOficinaDATA1: TDateField;
    qryMTBFMedioOficinaDATA2: TDateField;
    qryMTTRMedioOficina: TFDQuery;
    qryMTTRMedioOficinaMTTR_MEDIA: TFMTBCDField;
    qryMTTRMedioOficinaMTTR_MEDIA_FORMAT: TStringField;
    qryMTTRMedioOficinaDATA1: TDateField;
    qryMTTRMedioOficinaDATA2: TDateField;
    qryOficinasManut: TFDQuery;
    qryMTBFMedioManut: TFDQuery;
    qryMTTRMedioManut: TFDQuery;
    qryMTTRMedioManutMTTR_MEDIA: TFMTBCDField;
    qryMTTRMedioManutMTTR_MEDIA_FORMAT: TStringField;
    qryMTTRMedioManutDATA1: TDateField;
    qryMTTRMedioManutDATA2: TDateField;
    qryMTBFMedioManutCODEQUIPAMENTO: TStringField;
    qryMTBFMedioManutEQUIPAMENTO: TStringField;
    qryMTBFMedioManutMTBF_MEDIA: TFMTBCDField;
    qryMTBFMedioManutMTBF_MEDIA_FORMAT: TStringField;
    qryMTBFMedioManutDATA1: TDateField;
    qryMTBFMedioManutDATA2: TDateField;
    qryOficinasManutOFICINA: TStringField;
    qryOficinasManutTOTAL: TLargeintField;
  private
    { Private declarations }

    LSolicitadas: array[1..12] of Integer;
    LFechadas: array[1..12] of Integer;
    LTipoManutencao: array[1..9] of Integer;
    LTipoManutencaoFechadas: array[1..9] of Integer;
    LSituacaoOS: array[1..11] of Integer;

  public
    { Public declarations }

    procedure CalcularDashBoard;
  end;

var
  DMDashboard: TDMDashboard;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnDM, UnTelaPrincipal, UnTelaSplash;

{$R *.dfm}

procedure TDMDashboard.CalcularDashBoard;
var
  LTotalSolicitado, LTotalFechado,
  LTotalHorasParadasEquip, LTotalHorasTrabEquip,
  LMTBF, LMTTR: Real;
  LColor: TColor;
  I,LNOficina, LOutrasOficinas: SmallInt;
begin
  with FrmTelaPrincipal do
  begin
    for I := 1 to 12 Do
      LSolicitadas[I]:= 0;
    for I := 1 to 12 Do
      LFechadas[I]:= 0;
    for I := 1 to 7 Do
      LTipoManutencao[I]:= 0;
    for I := 1 to 11 Do
      LSituacaoOS[I]:= 0;
    //---------------------------GrafSolicTrab------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------SOLICITADAS-------------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Consultando solicitações de trabalho realizadas...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    if FrmTelaPrincipal <> nil then
    begin
      with FrmTelaPrincipal do
      begin
        JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
        Application.ProcessMessages;
        Sleep(50);
      end;
    end;

    ChartSolicTrabalho.Series[0].Clear;
    ChartSolicTrabalho.Series[1].Clear;

    if chbAtivarDBSolicTrab.Checked = True then
    begin
      LSolicitadas[1] := 0; LFechadas[1] := 0;
      LSolicitadas[2] := 0; LFechadas[2] := 0;
      LSolicitadas[3] := 0; LFechadas[3] := 0;
      LSolicitadas[4] := 0; LFechadas[4] := 0;
      LSolicitadas[5] := 0; LFechadas[5] := 0;
      LSolicitadas[6] := 0; LFechadas[6] := 0;
      LSolicitadas[7] := 0; LFechadas[7] := 0;
      LSolicitadas[8] := 0; LFechadas[8] := 0;
      LSolicitadas[9] := 0; LFechadas[9] := 0;
      LSolicitadas[10] := 0; LFechadas[10] := 0;
      LSolicitadas[11] := 0; LFechadas[11] := 0;
      LSolicitadas[12] := 0; LFechadas[12] := 0;

      LTotalSolicitado := 0;
      LTotalFechado := 0;
      DMDashboard.qryDashboard.Close;
      DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                    +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
                                    + ' FROM'
                                    + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
                                    + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
                                    + ' LEFT JOIN'
                                    + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
                                    + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` <> ''CANCELADA''';

      if memFiltrosMATRICULA.AsString <> '' then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`MATRICULA` = '+QuotedStr(memFiltrosMATRICULA.AsString);

      if memFiltrosCODOFICINA.AsString <> '' then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

      if cbManutencao.ItemIndex > 0 then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + 'LEFT JOIN `tipomanutencao` t ON (t.`CODIGO` = s.`CODMANUTENCAO`) WHERE (t.`TIPOMANUTENCAO`) = :tipomanutencao';

      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY MES'
                                    + ' ORDER BY'
                                    + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
      DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);
      case cbManutencao.ItemIndex of
//        0: DMDashboard.qryDashboard.Params[1].AsString := '%%';
        1: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Autônoma';
        2: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Corretiva';
        3: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preventiva';
        4: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preditiva';
        5: DMDashboard.qryDashboard.Params[1].AsString := 'Lubrificação';
        6: DMDashboard.qryDashboard.Params[1].AsString := 'Novos Projetos';
        7: DMDashboard.qryDashboard.Params[1].AsString := 'Alterações';
        8: DMDashboard.qryDashboard.Params[1].AsString := 'Outras';
      end;
      DMDashboard.qryDashboard.Open;

      while not DMDashboard.qryDashboard.Eof = True do
      begin
        LSolicitadas[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
        LTotalSolicitado := LTotalSolicitado + DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;

        DMDashboard.qryDashboard.Next;
      end;
      DMDashboard.qryDashboard.Close;
    end;

    //------------------------------FECHADAS--------------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Consultando solicitações de trabalho fechadas...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    if FrmTelaPrincipal <> nil then
    begin
      with FrmTelaPrincipal do
      begin
        JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
        Application.ProcessMessages;
        Sleep(50);
      end;
    end;

    if chbAtivarDBSolicTrab.Checked = True then
    begin
      DMDashboard.qryDashboard.Close;
      DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                    +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
                                    + ' FROM'
                                    + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
                                    + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
                                    + ' LEFT JOIN'
                                    + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
                                    + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` = ''FECHADA''';

      if memFiltrosMATRICULA.AsString <> '' then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`MATRICULA` = '+QuotedStr(memFiltrosMATRICULA.AsString);

      if memFiltrosCODOFICINA.AsString <> '' then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

      if cbManutencao.ItemIndex > 0 then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + 'LEFT JOIN `tipomanutencao` t ON (t.`CODIGO` = s.`CODMANUTENCAO`) WHERE (t.`TIPOMANUTENCAO`) = :tipomanutencao';

      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY MES'
                                    + ' ORDER BY'
                                    + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
      DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);;
      case cbManutencao.ItemIndex of
//        0: DMDashboard.qryDashboard.Params[1].AsString := '%%';
        1: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Autônoma';
        2: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Corretiva';
        3: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preventiva';
        4: DMDashboard.qryDashboard.Params[1].AsString := 'Manutenção Preditiva';
        5: DMDashboard.qryDashboard.Params[1].AsString := 'Lubrificação';
        6: DMDashboard.qryDashboard.Params[1].AsString := 'Novos Projetos';
        7: DMDashboard.qryDashboard.Params[1].AsString := 'Alterações';
        8: DMDashboard.qryDashboard.Params[1].AsString := 'Outras';
      end;
      DMDashboard.qryDashboard.Open;

      while not DMDashboard.qryDashboard.Eof = True do
      begin
        LFechadas[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;
        LTotalFechado := LTotalFechado + DMDashboard.qryDashboard.FieldByName('TOTALSOLIC').AsInteger;

        DMDashboard.qryDashboard.Next;
      end;

      DMDashboard.qryDashboard.First;
//      while not DMDashboard.qryDashboard.Eof = True do
     for I := 1 to 12 do
      begin
        if I = 1 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Jan');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Jan');
        end else
        if I = 2 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Fev');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Fev');
        end else
        if I = 3 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Mar');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Mar');
        end else
        if I = 4 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Abr');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Abr');
        end else
        if I = 5 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Mai');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Mai');
        end else
        if I = 6 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Jun');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Jun');
        end else
        if I = 7 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Jul');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Jul');
        end else
        if I = 8 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Ago');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Ago');
        end else
        if I = 9 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Set');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Set');
        end else
        if I = 10 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Out');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Out');
        end else
        if I = 11 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Nov');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Nov');
        end else
        if I = 12 then
        begin
          ChartSolicTrabalho.Series[0].Add(LSolicitadas[I], 'Dez');
          ChartSolicTrabalho.Series[1].Add(LFechadas[I], 'Dez');
        end else

        DMDashboard.qryDashboard.Next;
      end;
      DMDashboard.qryDashboard.Close;
    end;

    if LTotalSolicitado > 0 then
      LblEficSolicTrabVal.Caption := FormatFloat('0.00%', (LTotalFechado/LTotalSolicitado) * 100)
    else
      LblEficSolicTrabVal.Caption := '0%';

    //---------------------------TIPOS DE MANUTENÇÃO------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por tipo de manutenção...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    if FrmTelaPrincipal <> nil then
    begin
      with FrmTelaPrincipal do
      begin
        JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
        Application.ProcessMessages;
        Sleep(50);
      end;
    end;

    ChartTipoManutencao.Series[0].Clear;
    ChartTipoManutencao.Series[1].Clear;

    if chbAtivarDBTipoManutOS.Checked = True then
    begin
      DMDashboard.qryDashboard.Close;

      DMDashboard.qryDashboard.SQL.Text := 'SELECT '
                              + ' TIPO.TIPO, COUNT(o.CODIGO) AS TOTAL, COUNT(o2.`CODIGO`) AS TOTALFECHADAS,'
                              + ' IFNULL(100 * (COUNT(o2.`CODIGO`) / COUNT(o.`CODIGO`)), 0) PERCENTUALFECHADAS   '
                              + ' FROM (SELECT '
                              + ' ''Manutenção Preventiva'' AS TIPO UNION ALL SELECT ''Manutenção Corretiva'' '
                              + ' UNION ALL SELECT ''Manutenção Preditiva'' UNION ALL SELECT ''Lubrificação'' '
                              + ' UNION ALL SELECT ''Manutenção Autônoma'' UNION ALL SELECT ''Novos Projetos'' '
                              + ' UNION ALL SELECT ''Outros Serviços'' UNION ALL SELECT ''Alterações de Projetos'' '
                              + ' UNION ALL SELECT ''Não especificado'') AS TIPO'
                              + ' LEFT JOIN (SELECT IFNULL(t.TIPOMANUTENCAO, ''Não especificado'') AS TIPO_MANUTENCAO,'
                              + ' o.CODIGO, o.DATACADASTRO, o.SITUACAO'
                              + ' FROM `ordemservico` o'
                              + ' LEFT JOIN `tipomanutencao` t ON o.CODMANUTENCAO = t.CODIGO'
                              + ' WHERE o.`CODEMPRESA` = :codempresa and MONTH(o.DATACADASTRO) = :MES AND YEAR(o.DATACADASTRO) = :ANO';
      if cbManutencao.ItemIndex > 0 then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND (t.`TIPOMANUTENCAO`) LIKE :tipomanutencao';

      if memFiltrosCODOFICINA.AsString <> '' then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND o.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ') AS o '
                                                                               + ' ON TIPO.TIPO = o.TIPO_MANUTENCAO'
                                                                               + ' LEFT JOIN `ordemservico` AS o2 ON (o.`CODIGO` = o2.`CODIGO`) AND (o.`SITUACAO` = ''FECHADA'') '
                                                                               + ' GROUP BY TIPO.TIPO ORDER BY TIPO.TIPO;';

      DMDashboard.qryDashboard.Params[0].AsString := DM.FCodEmpresa;
      DMDashboard.qryDashboard.Params[1].AsInteger := cbMes.ItemIndex + 1;
      DMDashboard.qryDashboard.Params[2].AsInteger := StrToInt(cbAno.Text);
      if cbManutencao.ItemIndex > 0 then
      begin
        case cbManutencao.ItemIndex of
          0: DMDashboard.qryDashboard.Params[3].AsString := '%%';
          1: DMDashboard.qryDashboard.Params[3].AsString := 'Manutenção Autônoma';
          2: DMDashboard.qryDashboard.Params[3].AsString := 'Manutenção Corretiva';
          3: DMDashboard.qryDashboard.Params[3].AsString := 'Manutenção Preventiva';
          4: DMDashboard.qryDashboard.Params[3].AsString := 'Manutenção Preditiva';
          5: DMDashboard.qryDashboard.Params[3].AsString := 'Lubrificação';
          6: DMDashboard.qryDashboard.Params[3].AsString := 'Novos Projetos';
          7: DMDashboard.qryDashboard.Params[3].AsString := 'Alterações';
          8: DMDashboard.qryDashboard.Params[3].AsString := 'Outras';
        end;
      end;
      DMDashboard.qryDashboard.Open;

      if DMDashboard.qryDashboard.IsEmpty = False then
      begin
        while not DMDashboard.qryDashboard.Eof = True do
        begin
        //  if DMDashboard.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
          begin
            LTipoManutencao[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTAL').AsInteger;
            LTipoManutencaoFechadas[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTALFECHADAS').AsInteger;
          end;

          DMDashboard.qryDashboard.Next;
        end;

        DMDashboard.qryDashboard.First;
        while not DMDashboard.qryDashboard.Eof = True do
        begin
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Lubrificação' then
            LColor := $AA520
          else
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manutenção Autônoma' then
            LColor := $00CACACA
          else
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manutenção Corretiva' then
            LColor := clRed
          else
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manutenção Preditiva' then
            LColor := $00BFFF
          else
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manutenção Preventiva' then
            LColor := clBlue
          else
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Outros Serviços' then
            LColor := $007A7A7A
          else
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Novos Projetos' then
            LColor := $B0082
          else
          if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Alterações de Projetos' then
            LColor := $008D55C6
          else
            LColor := clWhite;

          if LTipoManutencao[DMDashboard.qryDashboard.RecNo] > 0 then
          begin
            ChartTipoManutencao.Series[0].Add(LTipoManutencao[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('TIPO').AsString, LColor);
            ChartTipoManutencao.Series[1].Add(LTipoManutencaoFechadas[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('TIPO').AsString, LColor);
          end;

          DMDashboard.qryDashboard.Next;
        end;
        DMDashboard.qryDashboard.Close;
      end;
    end;
    //----------------------------SITUAÇÃO DAS OS---------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por situação...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    if FrmTelaPrincipal <> nil then
    begin
      with FrmTelaPrincipal do
      begin
        JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
        Application.ProcessMessages;
        Sleep(50);
      end;
    end;

    ChartSituacaoOS.Series[0].Clear;

    if chbAtivarDBSituacaoOS.Checked = True then
    begin
      DMDashboard.qryDashboard.Close;
      DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                  + ' (CASE'
                                  + ' WHEN SITUACAO.SITUACAO = ''SOLICITADA'' THEN ''Solicitada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''CADASTRADA'' THEN ''Cadastrada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''DETALHADA'' THEN ''Detalhada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''PROGRAMADA'' THEN ''Programada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''DESPROGRAMADA'' THEN ''Desprogramada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''REPROGRAMADA'' THEN ''Reprogramada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''EXECUCAO'' THEN ''Execução'''
                                  + ' WHEN SITUACAO.SITUACAO = ''PARALISADA'' THEN ''Paralisada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''LIBERADA'' THEN ''Liberada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''FECHADA'' THEN ''Fechada'''
                                  + ' WHEN SITUACAO.SITUACAO = ''VENCIDA'' THEN ''Vencida'''
                                  + ' ELSE ''OUTRO'''
                                  + ' END) AS SITUACAO'
                                  +', COUNT(o.`CODIGO`) AS TOTAL'
                                  + ' FROM'
                                  + ' (SELECT ''SOLICITADA'' AS SITUACAO UNION ALL SELECT ''CADASTRADA'''
                                  + ' UNION ALL SELECT ''DETALHADA'' UNION ALL SELECT ''PROGRAMADA'''
                                  + ' UNION ALL SELECT ''DESPROGRAMADA'' UNION ALL SELECT ''REPROGRAMADA'''
                                  + ' UNION ALL SELECT ''EXECUCAO'' UNION ALL SELECT ''PARALISADA'''
                                  + ' UNION ALL SELECT ''LIBERADA'' UNION ALL SELECT ''FECHADA'''
                                  + ' UNION ALL SELECT ''VENCIDA'') AS SITUACAO'
                                  + ' LEFT JOIN `ordemservico` AS o ON o.`SITUACAO` = SITUACAO.SITUACAO'
                                  + ' AND MONTH(o.`DATACADASTRO`) = :mes AND YEAR(o.`DATACADASTRO`) = :ano AND o.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa)+'';

      if cbManutencao.ItemIndex > 0 then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' LEFT JOIN `tipomanutencao` AS t ON t.`CODIGO` = o.`CODMANUTENCAO` WHERE t.`TIPOMANUTENCAO` LIKE :tipomanutencao';

      if memFiltrosCODOFICINA.AsString <> '' then
        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND o.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

        DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY SITUACAO.SITUACAO;';

      DMDashboard.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
      DMDashboard.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
      if cbManutencao.ItemIndex > 0 then
      begin
        case cbManutencao.ItemIndex of
          0: DMDashboard.qryDashboard.Params[2].AsString := '%%';
          1: DMDashboard.qryDashboard.Params[2].AsString := 'Manutenção Autônoma';
          2: DMDashboard.qryDashboard.Params[2].AsString := 'Manutenção Corretiva';
          3: DMDashboard.qryDashboard.Params[2].AsString := 'Manutenção Preventiva';
          4: DMDashboard.qryDashboard.Params[2].AsString := 'Manutenção Preditiva';
          5: DMDashboard.qryDashboard.Params[2].AsString := 'Lubrificação';
          6: DMDashboard.qryDashboard.Params[2].AsString := 'Novos Projetos';
          7: DMDashboard.qryDashboard.Params[2].AsString := 'Alterações';
          8: DMDashboard.qryDashboard.Params[2].AsString := 'Outras';
        end;
      end;


      DMDashboard.qryDashboard.Open;

      if DMDashboard.qryDashboard.IsEmpty = False then
      begin
        while not DMDashboard.qryDashboard.Eof = True do
        begin
          if DMDashboard.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
            LSituacaoOS[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTAL').AsInteger;

          DMDashboard.qryDashboard.Next;
        end;

        DMDashboard.qryDashboard.First;
        while not DMDashboard.qryDashboard.Eof = True do
        begin
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Cadastrada' then
            LColor := $00BBFFFF
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Solicitada' then
            LColor := $00F3F3F3
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Fechada' then
            LColor := clGray
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Detalhada' then
            LColor := clYellow
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Programada' then
            LColor := clBlue
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Reprogramada' then
            LColor := clBlue
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Desprogramada' then
            LColor := clYellow
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Execução' then
            LColor := clInfoBk
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Liberada' then
            LColor := clGreen
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Paralisada' then
            LColor := clRed
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Cancelada' then
            LColor := clBlack
          else
          if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Vencida' then
            LColor := $006666FF
          else
            LColor := clGray;

          if LSituacaoOS[DMDashboard.qryDashboard.RecNo] > 0 then
            ChartSituacaoOS.Series[0].Add(LSituacaoOS[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString, LColor);

          DMDashboard.qryDashboard.Next;
        end;
        DMDashboard.qryDashboard.Close;
      end;
    end;
    //----------------------------OFICINAS DE OS---------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por oficina...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    if FrmTelaPrincipal <> nil then
    begin
      with FrmTelaPrincipal do
      begin
        JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
        Application.ProcessMessages;
        Sleep(50);
      end;
    end;

    ChartOSOficina.Series[0].Clear;
    ChartOSOficina.Series[0].Legend.Visible := True;

    if chbAtivarDBOficinas.Checked = True then
    begin
      DMDashboard.qryOficinas5.Close;
      if cbManutencao.ItemIndex > 0 then
        DMDashboard.qryOficinas5.Params.ParamByName('CALCMANUT').AsBoolean := True
      else
        DMDashboard.qryOficinas5.Params.ParamByName('CALCMANUT').AsBoolean := False;
      if memFiltrosCODOFICINA.AsString <> '' then
        DMDashboard.qryOficinas5.Params.ParamByName('CALCOFICINA').AsBoolean := True
      else
        DMDashboard.qryOficinas5.Params.ParamByName('CALCOFICINA').AsBoolean := False;
      DMDashboard.qryOficinas5.Params.ParamByName('MES').AsInteger := cbMes.ItemIndex + 1;
      DMDashboard.qryOficinas5.Params.ParamByName('ANO').AsInteger := StrToInt(cbAno.Text);
      if cbManutencao.ItemIndex > 0 then
      begin
        case cbManutencao.ItemIndex of
          0: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := '%%';
          1: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Manutenção Autônoma';
          2: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Manutenção Corretiva';
          3: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Manutenção Preventiva';
          4: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Manutenção Preditiva';
          5: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Lubrificação';
          6: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Novos Projetos';
          7: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Alterações';
          8: DMDashboard.qryOficinas5.Params.ParamByName('TIPOMANUTENCAO').AsString := 'Outras';
        end;
      end;
      if memFiltrosCODOFICINA.AsString <> '' then
        DMDashboard.qryOficinas5.Params.ParamByName('CODOFICINA').AsString := memFiltrosCODOFICINA.AsString;
      DMDashboard.qryOficinas5.Open;

      LNOficina := 0;
      LOutrasOficinas := 0;

      DMDashboard.qryOficinas5.First;
      while not DMDashboard.qryOficinas5.Eof = True do
      begin
        ChartOSOficina.Series[0].Add(DMDashboard.qryOficinas5.FieldByName('TOTAL').AsInteger, DMDashboard.qryOficinas5.FieldByName('OFICINA').AsString);

        DMDashboard.qryOficinas5.Next;
      end;

      if (DMDashboard.qryOficinas5.RecordCount = 1) and (DMDashboard.qryOficinas5.FieldByName('TOTAL').AsInteger = 0) then
      begin
        ChartOSOficina.Series[0].Legend.Visible := False;
        ChartOSOficina.Series[0].Add(0);
      end;
      //----------------------------MTBF--------------------------------------------------------------------------------------------------------------------------------
      if FrmTelaSplash <> nil then
      begin
        FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
        FrmTelaSplash.LblProcesso.Caption := 'Calculando o MTBF médio dos equipamentos...';
        Application.ProcessMessages;
        Sleep(50);
      end;

      if FrmTelaPrincipal <> nil then
      begin
        with FrmTelaPrincipal do
        begin
          JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
          Application.ProcessMessages;
          Sleep(50);
        end;
      end;

      if chbAtivarDBMTBFTRDisp.Checked = True then
      begin
        DM.FDataConsulta1 := StrToDateTime('01/' + IntToStr(cbMes.ItemIndex + 1) + '/' + cbAno.Text);
        DM.FDataConsulta2 := EndOfTheMonth(DateOf(DM.FDataConsulta1));

        DMDashboard.qryMTBFMedio.Close;
        DMDashboard.qryMTBFMedio.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
        DMDashboard.qryMTBFMedio.Params.ParamByName('data1').AsString    := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
        DMDashboard.qryMTBFMedio.Params.ParamByName('data2').AsString    := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
        if cbManutencao.ItemIndex > 0 then
          DMDashboard.qryMTBFMedio.Params.ParamByName('CALCMANUT').AsBoolean := True
        else
          DMDashboard.qryMTBFMedio.Params.ParamByName('CALCMANUT').AsBoolean := False;
        if memFiltrosCODOFICINA.AsString <> '' then
          DMDashboard.qryMTBFMedio.Params.ParamByName('CALCOFICINA').AsBoolean := True
        else
          DMDashboard.qryMTBFMedio.Params.ParamByName('CALCOFICINA').AsBoolean := False;

        DMDashboard.qryMTBFMedio.Open;

        LMTBF := 0;
        if DMDashboard.qryMTBFMedio.IsEmpty = False then
        begin
          LMTBF := DMDashboard.qryMTBFMedioMTBF_MEDIA.AsFloat;
          lblMTBFVal.Caption := DMDashboard.qryMTBFMedioMTBF_MEDIA_FORMAT.AsString;
        end;
        DMDashboard.qryMTBFMedio.Close;
      end;
    end;
    //----------------------------MTTR--------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Calculando o MTTR médio dos equipamentos...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    if FrmTelaPrincipal <> nil then
    begin
      with FrmTelaPrincipal do
      begin
        JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
        Application.ProcessMessages;
        Sleep(50);
      end;
    end;

    if chbAtivarDBMTBFTRDisp.Checked = True then
    begin
      DM.FDataConsulta1 := StrToDateTime('01/' + IntToStr(cbMes.ItemIndex + 1) + '/' + cbAno.Text);
      DM.FDataConsulta2 := EndOfTheMonth(DateOf(DM.FDataConsulta1));

      DMDashboard.qryMTTRMedio.Close;
      DMDashboard.qryMTTRMedio.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
      DMDashboard.qryMTTRMedio.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
      DMDashboard.qryMTTRMedio.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
      if cbManutencao.ItemIndex > 0 then
        DMDashboard.qryMTTRMedio.Params.ParamByName('CALCMANUT').AsBoolean := True
      else
        DMDashboard.qryMTTRMedio.Params.ParamByName('CALCMANUT').AsBoolean := False;
      if memFiltrosCODOFICINA.AsString <> '' then
        DMDashboard.qryMTTRMedio.Params.ParamByName('CALCOFICINA').AsBoolean := True
      else
        DMDashboard.qryMTTRMedio.Params.ParamByName('CALCOFICINA').AsBoolean := False;
      DMDashboard.qryMTTRMedio.Open;

      if DMDashboard.qryMTTRMedio.IsEmpty = False then
      begin
        LMTTR := DMDashboard.qryMTTRMedioMTTR_MEDIA.AsFloat;
        lblMTTRVal.Caption := DMDashboard.qryMTTRMedioMTTR_MEDIA_FORMAT.AsString;
      end;

      DMDashboard.qryMTBFMedio.Close;
    end;
    //-------------------------Disponibilidade------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Calculando a Disponibilidade média dos equipamentos...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    if FrmTelaPrincipal <> nil then
    begin
      with FrmTelaPrincipal do
      begin
        JvGradientProgressBar1.Position := JvGradientProgressBar1.Position + 1;
        Application.ProcessMessages;
        Sleep(50);
      end;
    end;

    if (LMTBF + LMTTR) > 0 then
      lblDisponibilidadeVal.Caption := FormatFloat(',0.00%', 100 * (LMTBF/(LMTBF + LMTTR)))
    else
      lblDisponibilidadeVal.Caption := '100%';
  end;

  if FrmTelaPrincipal <> nil then
    FrmTelaPrincipal.JvGradientProgressBar1.Visible := False;

end;

end.

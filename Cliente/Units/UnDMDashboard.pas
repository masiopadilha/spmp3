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
    ChartSolicTrabalho.Series[0].Clear;

    ChartSolicTrabalho.Series[1].Clear;
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

    if memFiltrosCODOFICINA.AsString <> '' then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + 'LEFT JOIN `tipomanutencao` t ON (t.`CODIGO` = s.`CODMANUTENCAO`) AND (t.`TIPOMANUTENCAO`) LIKE :tipomanutencao';

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);
    case cbManutencao.ItemIndex of
      0: DMDashboard.qryDashboard.Params[1].AsString := '%%';
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

    //------------------------------FECHADAS--------------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Consultando solicitações de trabalho fechadas...';
      Application.ProcessMessages;
      Sleep(50);
    end;
    DMDashboard.qryDashboard.Close;
    DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                  +' DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%b'') AS MES, COALESCE(COUNT(s.`CODIGO`), 0) AS TOTALSOLIC'
                                  + ' FROM'
                                  + ' (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL'
                                  + ' SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11) AS n'
                                  + ' LEFT JOIN'
                                  + ' `ordemservico` s ON DATE_FORMAT(s.DATACADASTRO, ''%Y-%m'') = DATE_FORMAT(DATE_ADD(CONCAT(:ANO, ''-01-01''), INTERVAL n.n MONTH), ''%Y-%m'')'
                                  + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` = ''FECHADA''';

    if memFiltrosCODOFICINA.AsString <> '' then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND s.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + 'LEFT JOIN `tipomanutencao` t ON (t.`CODIGO` = s.`CODMANUTENCAO`) AND (t.`TIPOMANUTENCAO`) LIKE :tipomanutencao';

    DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);;
    case cbManutencao.ItemIndex of
      0: DMDashboard.qryDashboard.Params[1].AsString := '%%';
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
    while not DMDashboard.qryDashboard.Eof = True do
    begin
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Feb' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Fev');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Fev');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Apr' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Abr');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Abr');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'May' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Mai');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Mai');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Aug' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Ago');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Ago');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Sep' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Set');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Set');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Oct' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Out');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Out');
      end else
      if DMDashboard.qryDashboard.FieldByName('MES').AsString = 'Dec' then
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Dez');
        ChartSolicTrabalho.Series[1].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], 'Dez');
      end else
      begin
        ChartSolicTrabalho.Series[0].Add(LSolicitadas[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('MES').AsString);
        ChartSolicTrabalho.Series[1].Add(LFechadas[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('MES').AsString);
      end;

      DMDashboard.qryDashboard.Next;
    end;
    DMDashboard.qryDashboard.Close;

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

    ChartTipoManutencao.Series[0].Clear;
    ChartTipoManutencao.Series[1].Clear;

    DMDashboard.qryDashboard.Close;

    DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                            + ' TIPO.TIPO, COUNT(o.`CODIGO`) AS TOTAL, COUNT(o2.`CODIGO`) AS TOTALFECHADAS,'
                            + ' IFNULL(100 * (COUNT(o2.`CODIGO`) / COUNT(o.`CODIGO`)), 0) PERCENTUALFECHADAS'
                            + ' FROM'
                            + ' (SELECT ''Manutenção Preventiva'' AS TIPO'
                            + ' UNION ALL SELECT ''Manutenção Corretiva'' UNION ALL SELECT ''Manutenção Preditiva'''
                            + ' UNION ALL SELECT ''Lubrificação'' UNION ALL SELECT ''Manutenção Autônoma'''
                            + ' UNION ALL SELECT ''Novos Projetos'' UNION ALL SELECT ''Outros Serviços'''
                            + ' UNION ALL SELECT ''Alterações de Projetos'' UNION ALL SELECT ''Não especificado'') AS TIPO'
                            + ' LEFT JOIN `tipomanutencao` AS t ON TIPO.TIPO = t.`TIPOMANUTENCAO`'
                            + ' LEFT JOIN `ordemservico` AS o ON (o.`CODMANUTENCAO` = t.`CODIGO` OR (TIPO.TIPO = ''Não especificado'' AND o.`CODMANUTENCAO` IS NULL))'
                            + ' AND MONTH(o.`DATACADASTRO`) = :MES AND YEAR(o.`DATACADASTRO`) = :ANO AND o.`CODEMPRESA` = :codempresa';

    if cbManutencao.ItemIndex > 0 then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND (t.`TIPOMANUTENCAO`) LIKE :tipomanutencao';

    if memFiltrosCODOFICINA.AsString <> '' then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND o.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' LEFT JOIN `ordemservico` AS o2 ON (o.`CODIGO` = o2.`CODIGO`)  AND (o.`SITUACAO` = ''FECHADA'') GROUP BY TIPO.TIPO ORDER BY TIPO.TIPO;';

    DMDashboard.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    DMDashboard.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
    DMDashboard.qryDashboard.Params[2].AsString := DM.FCodEmpresa;
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
    //----------------------------SITUAÇÃO DAS OS---------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por situação...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    ChartSituacaoOS.Series[0].Clear;
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
                                + ' AND MONTH(o.`DATACADASTRO`) = :mes AND YEAR(o.`DATACADASTRO`) = :ano';

    if cbManutencao.ItemIndex > 0 then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' LEFT JOIN `tipomanutencao` AS t ON t.`CODIGO` = o.`CODMANUTENCAO` WHERE t.`TIPOMANUTENCAO` LIKE :tipomanutencao';

    if memFiltrosCODOFICINA.AsString <> '' then
      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' AND o.`CODOFICINA` = '+QuotedStr(memFiltrosCODOFICINA.AsString);

      DMDashboard.qryDashboard.SQL.Text := DMDashboard.qryDashboard.SQL.Text + ' GROUP BY SITUACAO.SITUACAO;';

    DMDashboard.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    if cbManutencao.ItemIndex > 0 then
    begin
      DMDashboard.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
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
    //----------------------------OFICINAS DE OS---------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por oficina...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    ChartOSOficina.Series[0].Clear;
    ChartOSOficina.Series[0].Legend.Visible := True;

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


    //----------------------------MTTR--------------------------------------------------------------------------------------------------------------------------------
    if (memFiltrosCODOFICINA.AsString = '') and (cbManutencao.ItemIndex > 0) then
    begin
      if FrmTelaSplash <> nil then
      begin
        FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
        FrmTelaSplash.LblProcesso.Caption := 'Calculando o MTTR médio dos equipamentos...';
        Application.ProcessMessages;
        Sleep(50);
      end;

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
    if (memFiltrosCODOFICINA.AsString = '') and (memFiltrosCODMANUTENCAO.AsString = '') then
    begin
      if FrmTelaSplash <> nil then
      begin
        FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
        FrmTelaSplash.LblProcesso.Caption := 'Calculando a Disponibilidade média dos equipamentos...';
        Application.ProcessMessages;
        Sleep(50);
      end;

      if (LMTBF + LMTTR) > 0 then
        lblDisponibilidadeVal.Caption := FormatFloat(',0.00%', 100 * (LMTBF/(LMTBF + LMTTR)))
      else
        lblDisponibilidadeVal.Caption := '100%';
    end;
  end;
end;

end.

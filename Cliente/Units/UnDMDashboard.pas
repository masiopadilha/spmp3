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
    FDQuery1: TFDQuery;
  private
    { Private declarations }

    LSolicitadas: array[1..12] of Integer;
    LFechadas: array[1..12] of Integer;
    LTipoManutencao: array[1..7] of Integer;
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
  LTotalHorasParadasEquip, LTotalHorasTrabEquip, LMTBF, LMTTR: Real;
  LColor: TColor;
  I: SmallInt;
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
      FrmTelaSplash.LblProcesso.Caption := 'Consultando solicita��es de trabalho realizadas...';
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
                                  + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` <> ''CANCELADA'''
                                  + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);
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
      FrmTelaSplash.LblProcesso.Caption := 'Consultando solicita��es de trabalho fechadas...';
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
                                  + ' AND s.`SOLICTRAB` = ''S'' AND s.`SITUACAO` = ''FECHADA'''
                                  + ' GROUP BY MES'
                                  + ' ORDER BY'
                                  + ' FIELD(MES, ''Jan'', ''Feb'', ''Mar'', ''Apr'', ''May'', ''Jun'', ''Jul'', ''Aug'', ''Sep'', ''Oct'', ''Nov'', ''Dec'');';
    DMDashboard.qryDashboard.Params[0].AsInteger := StrToInt(cbAno.Text);;
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

    //---------------------------TIPOS DE MANUTEN��O------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por tipo de manuten��o...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    ChartTipoManutencao.Series[0].Clear;
    DMDashboard.qryDashboard.Close;
    DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                + ' TIPO.TIPO, COUNT(o.`CODIGO`) AS TOTAL, COUNT(o2.`CODIGO`) AS TOTALFECHADAS '
                                + ' , IFNULL(100 * (COUNT(o2.`CODIGO`)/COUNT(o.`CODIGO`)), 0)PERCENTUALFECHADAS'
                                + ' FROM'
                                + ' (SELECT ''Manuten��o Preventiva'' AS TIPO'
                                + ' UNION ALL SELECT ''Manuten��o Corretiva'' UNION ALL SELECT ''Manuten��o Preditiva'''
                                + ' UNION ALL SELECT ''Lubrifica��o'' UNION ALL SELECT ''Manuten��o Aut�noma'''
                                + ' UNION ALL SELECT ''Novos Projetos'' UNION ALL SELECT ''Outros Servi�os'') AS TIPO'
                                + ' LEFT JOIN `tipomanutencao` AS t ON  TIPO.TIPO = t.`TIPOMANUTENCAO`'
                                + ' LEFT JOIN `ordemservico` AS o ON o.`CODMANUTENCAO` = t.`CODIGO`'
                                + ' AND MONTH(o.`DATACADASTRO`) = :MES AND YEAR(o.`DATACADASTRO`) = :ANO'
                                + ' LEFT JOIN `ordemservico` AS o2 ON o.`CODIGO` = o2.`CODIGO` AND o2.`SITUACAO` = ''FECHADA'''
                                + ' GROUP BY TIPO.TIPO ORDER BY TIPO.TIPO;';
    DMDashboard.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    DMDashboard.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
    DMDashboard.qryDashboard.Open;

    if DMDashboard.qryDashboard.IsEmpty = False then
    begin
      while not DMDashboard.qryDashboard.Eof = True do
      begin
        if DMDashboard.qryDashboard.FieldByName('TOTAL').AsInteger > 0 then
          LTipoManutencao[DMDashboard.qryDashboard.RecNo] := DMDashboard.qryDashboard.FieldByName('TOTAL').AsInteger;

        DMDashboard.qryDashboard.Next;
      end;

      DMDashboard.qryDashboard.First;
      while not DMDashboard.qryDashboard.Eof = True do
      begin
        if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Lubrifica��o' then
          LColor := $AA520
        else
        if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manuten��o Aut�noma' then
          LColor := $00CACACA
        else
        if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manuten��o Corretiva' then
          LColor := clRed
        else
        if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manuten��o Preditiva' then
          LColor := $00BFFF
        else
        if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Manuten��o Preventiva' then
          LColor := clBlue
        else
        if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Outros Servi�os' then
          LColor := $007A7A7A
        else
        if DMDashboard.qryDashboard.FieldByName('TIPO').AsString = 'Novos Projetos' then
          LColor := $B0082
        else
          LColor := clGray;

        if LTipoManutencao[DMDashboard.qryDashboard.RecNo] > 0 then
          ChartTipoManutencao.Series[0].Add(LTipoManutencao[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('TIPO').AsString, LColor);

        DMDashboard.qryDashboard.Next;
      end;
      DMDashboard.qryDashboard.Close;
    end;
    //----------------------------SITUA��O DAS OS---------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Agrupando O.S por situa��o...';
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
                                + ' WHEN SITUACAO.SITUACAO = ''EXECUCAO'' THEN ''Execu��o'''
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
                                + ' AND MONTH(o.`DATACADASTRO`) = :mes AND YEAR(o.`DATACADASTRO`) = :ano'
                                + ' GROUP BY SITUACAO.SITUACAO;';
    DMDashboard.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    DMDashboard.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
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
        if DMDashboard.qryDashboard.FieldByName('SITUACAO').AsString = 'Execu��o' then
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
    DMDashboard.qryDashboard.Close;

    DMDashboard.qryDashboard.SQL.Text := 'SELECT'
                                + ' of.`DESCRICAO` AS OFICINA, COUNT(os.`CODIGO`) AS TOTAL'
                                + ' FROM'
                                + ' `ordemservico` AS os'
                                + ' INNER JOIN `oficinas` AS of ON (os.`CODOFICINA` = of.`CODIGO`)'
                                + ' WHERE'
                                + ' (os.`SITUACAO` <> ''CANCELADA'' AND MONTH(os.`DATACADASTRO`) = :MES AND YEAR(os.`DATACADASTRO`) = :ANO)'
                                + ' GROUP BY OFICINA ORDER BY TOTAL DESC';

    DMDashboard.qryDashboard.Params[0].AsInteger := cbMes.ItemIndex + 1;
    DMDashboard.qryDashboard.Params[1].AsInteger := StrToInt(cbAno.Text);
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
        if LSituacaoOS[DMDashboard.qryDashboard.RecNo] > 0 then
          ChartOSOficina.Series[0].Add(LSituacaoOS[DMDashboard.qryDashboard.RecNo], DMDashboard.qryDashboard.FieldByName('OFICINA').AsString);

        DMDashboard.qryDashboard.Next;
      end;
    end;
    DMDashboard.qryDashboard.Close;
    //----------------------------MTBF--------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Calculando o MTBF m�dio dos equipamentos...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    DM.FDataConsulta1 := StrToDateTime('01/' + IntToStr(cbMes.ItemIndex + 1) + '/' + cbAno.Text);
    DM.FDataConsulta2 := EndOfTheMonth(DateOf(DM.FDataConsulta1));

    DMDashboard.qryMTBFMedio.Close;
    DMDashboard.qryMTBFMedio.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
    DMDashboard.qryMTBFMedio.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
    DMDashboard.qryMTBFMedio.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
    DMDashboard.qryMTBFMedio.Open;

    if DMDashboard.qryDashboard.IsEmpty = False then
    begin
      LMTBF := DMDashboard.qryMTBFMedioMTBF_MEDIA.AsFloat;
      lblMTBFVal.Caption := DMDashboard.qryMTBFMedioMTBF_MEDIA_FORMAT.AsString;
    end;
    DMDashboard.qryMTBFMedio.Close;

    //----------------------------MTTR--------------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Calculando o MTTR m�dio dos equipamentos...';
      Application.ProcessMessages;
      Sleep(50);
    end;

    DM.FDataConsulta1 := StrToDateTime('01/' + IntToStr(cbMes.ItemIndex + 1) + '/' + cbAno.Text);
    DM.FDataConsulta2 := EndOfTheMonth(DateOf(DM.FDataConsulta1));

    DMDashboard.qryMTTRMedio.Close;
    DMDashboard.qryMTTRMedio.Params.ParamByName('codempresa').AsString := DM.FCodEmpresa;
    DMDashboard.qryMTTRMedio.Params.ParamByName('data1').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta1);
    DMDashboard.qryMTTRMedio.Params.ParamByName('data2').AsString      := FormatDateTime('yyyy/mm/dd', DM.FDataConsulta2);
    DMDashboard.qryMTTRMedio.Open;

    if DMDashboard.qryDashboard.IsEmpty = False then
    begin
      LMTTR := DMDashboard.qryMTTRMedioMTTR_MEDIA.AsFloat;
      lblMTTRVal.Caption := DMDashboard.qryMTTRMedioMTTR_MEDIA_FORMAT.AsString;
    end;

    DMDashboard.qryMTBFMedio.Close;
    //-------------------------Disponibilidade------------------------------------------------------------------------------------------------------------------------
    if FrmTelaSplash <> nil then
    begin
      FrmTelaSplash.JvGradientProgressBar1.Position := FrmTelaSplash.JvGradientProgressBar1.Position + 1;
      FrmTelaSplash.LblProcesso.Caption := 'Calculando a Disponibilidade m�dia dos equipamentos...';
      Application.ProcessMessages;
      Sleep(50);
    end;


    if (LMTBF + LMTTR) > 0 then
      lblDisponibilidadeVal.Caption := FormatFloat(',0.00%', 100 * (LMTBF/(LMTBF + LMTTR)))
    else
      lblDisponibilidadeVal.Caption := '100%';

    DMDashboard.qryMTBFMedio.Close;
  end;
end;

end.

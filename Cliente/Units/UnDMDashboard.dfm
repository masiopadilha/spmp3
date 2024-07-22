object DMDashboard: TDMDashboard
  Height = 438
  Width = 320
  object qryDashboard: TFDQuery
    Connection = DM.FDConnSPMP3
    Left = 48
    Top = 8
  end
  object qryMTBFMedio: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      'SET @tipomanutencao := :calcmanut;'
      'SET @oficina := :calcoficina;'
      ''
      ''
      '-- C'#225'lculo de MTBF M'#233'dio (TESTADA)'
      'SELECT'
      '    AVG(fmt.MTBF)MTBF_MEDIA       '
      '    , IFNULL(CONCAT('
      
        '                    FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTBF *' +
        ' 3600))) / 3600), '#39':'#39','
      
        '                    LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.' +
        'MTBF * 3600))) % 3600) / 60), 2, '#39'0'#39')'
      '                    ), '#39'00:00'#39
      '             ) AS MTBF_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , sub2.TOTALPARADAS'
      '        , sub2.HORASPARADAS'
      '        , sub2.HOFICIAIS'#9'    '
      
        '        , ((sub2.HOFICIAIS - sub2.HORASPARADAS)/sub2.TOTALPARADA' +
        'S)MTBF        '
      '    FROM             '
      '        (SELECT        '
      #9'    sub1.CODEQUIPAMENTO'
      #9'    , sub1.DATAFECHAMENTO'
      '            , sub1.EQUIPAMENTO            '
      #9'    , IFNULL(SUM(sub1.TOTALPARADAAS), 0) TOTALPARADAS'
      #9'    , IFNULL(SUM(sub1.HORASPARADAS), 0) HORASPARADAS'
      #9'    , ((HOFICIAIS)) HOFICIAIS'#9'    '
      #9' FROM'
      #9'    (SELECT'
      #9'        os.`CODEQUIPAMENTO`'
      #9#9', os.`DATAFECHAMENTO`'
      #9#9', e.`DESCRICAO` EQUIPAMENTO            '
      #9#9', COUNT(*)TOTALPARADAAS'
      
        #9#9', ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(os.`DATAI' +
        'NICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 DAY)), -'
      
        #9#9'    /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.`DATAFECH' +
        'AMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY)), os.`D' +
        'ATAFIMREAL`),'
      
        #9#9'    /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIOREAL`, os.`' +
        'DATAFIMREAL`))/60), 2) HORASPARADAS'
      #9#9', (IFNULL(c.`HOFICIAIS`, 720)) HOFICIAIS'#9#9'     '
      #9'     FROM '
      #9'        `ordemservico` AS os'
      #9#9'INNER JOIN `equipamentos` AS e'
      
        #9#9'    ON (e.`CODIGO` = os.`CODEQUIPAMENTO`) AND (e.`OPERANDO` = ' +
        #39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39') AND (e.`CALCINDIC` = '#39'S'#39')'
      #9#9'INNER JOIN `calendarioequip` c'
      
        #9'            ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPR' +
        'ESA` = e.CODEMPRESA)'
      '                INNER JOIN `tipomanutencao` AS t '
      
        #9'           ON (os.`CODMANUTENCAO` = t.`CODIGO`) AND (t.`TIPOMAN' +
        'UTENCAO` = '#39'Manuten'#231#227'o Corretiva'#39')'
      ''
      '             WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'         AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAFE' +
        'CHAMENTO` <= DATE(:data2)'
      
        #9#9' AND os.`DATAFIMREAL` >= DATE(DATE_SUB(os.`DATAFECHAMENTO`, IN' +
        'TERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY))'
      #9#9' AND os.`SITUACAO` = '#39'FECHADA'#39
      #9#9' AND os.`EQUIPPARADO` = '#39'S'#39' '#9#9' '#9#9' '
      
        '                                 AND (IF(@tipomanutencao, t.`TIP' +
        'OMANUTENCAO` = '#39'Manuten'#231#227'o Corretiva'#39', t.`TIPOMANUTENCAO` LIKE '#39 +
        '%%'#39'))'
      
        '                                 AND (IF(@oficina, os.`CODOFICIN' +
        'A` = :codoficina, os.`CODOFICINA` LIKE '#39'%%'#39'))'#9#9'                 ' +
        '           '
      '                            )'
      #9'     GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      #9'     ORDER BY os.`CODEQUIPAMENTO`'
      #9'     ) AS sub1'
      #9'    GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9'    ORDER BY sub1.EQUIPAMENTO'
      #9'    ) AS sub2'#9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt')
    Left = 48
    Top = 63
    ParamData = <
      item
        Name = 'CALCMANUT'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'CALCOFICINA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryMTBFMedioMTBF_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA'
      Origin = 'MTBF_MEDIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 54
      Size = 10
    end
    object qryMTBFMedioMTBF_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA_FORMAT'
      Origin = 'MTBF_MEDIA_FORMAT'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryMTBFMedioDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryMTBFMedioDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryMTBFEquipamentos: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- C'#225'lculo de MTBF Equipamentos (TESTADO)'
      'SELECT'
      '    fmt.CODEQUIPAMENTO'
      '    , fmt.EQUIPAMENTO            '
      '    , ROUND(fmt.MTBF, 2)MTBF_MEDIA'
      '    , IFNULL(CAST(CONCAT('
      
        '                  FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTBF * 3' +
        '600))) / 3600), '#39':'#39','
      
        '                  LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MT' +
        'BF * 3600))) % 3600) / 60), 2, '#39'0'#39')'
      '                  ) AS CHAR'
      '           ), '#39'00:00'#39') AS MTBF_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      ''
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , sub2.TOTALPARADAS'
      '        , sub2.HORASPARADAS'
      '        , sub2.HOFICIAIS'#9'    '
      
        '        , IFNULL(((sub2.HOFICIAIS - sub2.HORASPARADAS)/sub2.TOTA' +
        'LPARADAS), 0)MTBF        '
      '    FROM                 '
      '        (SELECT        '
      #9'    sub1.CODEQUIPAMENTO'
      #9'    , sub1.DATAFECHAMENTO'
      #9'    , sub1.EQUIPAMENTO            '
      #9'    , IFNULL(SUM(sub1.TOTALPARADAAS), 0) TOTALPARADAS'
      #9'    , IFNULL(SUM(sub1.HORASPARADAS), 0) HORASPARADAS'
      #9'    , sub1.HOFICIAIS'
      #9'    '
      #9' FROM'
      #9'     (SELECT'
      #9'         os.`CODEQUIPAMENTO`'
      #9#9' , os.`DATAFECHAMENTO`'
      #9#9' , e.`DESCRICAO` EQUIPAMENTO            '
      #9#9' , COUNT(*)TOTALPARADAAS'
      
        #9#9' , ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(os.`DATA' +
        'INICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 DAY)), '
      
        #9#9'     /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.`DATAFEC' +
        'HAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY)), os.`' +
        'DATAFIMREAL`),'
      
        #9#9'     /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIOREAL`, os.' +
        '`DATAFIMREAL`))/60), 2) HORASPARADAS'
      #9#9' , (IFNULL(c.`HOFICIAIS`, 720)) HOFICIAIS'
      #9'      FROM '
      '                  `ordemservico` AS os'
      #9#9'   INNER JOIN `equipamentos` AS e'
      
        #9'               ON (e.`CODIGO` = `CODEQUIPAMENTO`) AND (e.`OPERA' +
        'NDO` = '#39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39')'
      #9#9'   INNER JOIN `calendarioequip` c'
      
        #9#9'       ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPRESA`' +
        ' = e.CODEMPRESA )'
      #9'      WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'          AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAF' +
        'ECHAMENTO` <= DATE(:data2)'
      
        #9#9'  AND os.`DATAFIMREAL` >= DATE(DATE_SUB(os.`DATAFECHAMENTO`, I' +
        'NTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY))'
      #9#9'  AND os.`SITUACAO` <> '#39'CANCELADA'#39
      #9#9'  AND os.`EQUIPPARADO` = '#39'S'#39
      '                                  AND e.`CALCINDIC` = '#39'S'#39')'
      #9'      GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      '              ORDER BY os.`CODEQUIPAMENTO`'
      #9'      ) AS sub1'
      #9' GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9' ORDER BY sub1.EQUIPAMENTO'
      #9' ) AS sub2'#9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt  '
      '  GROUP BY fmt.CODEQUIPAMENTO'
      '  ORDER BY fmt.EQUIPAMENTO')
    Left = 48
    Top = 118
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryMTBFEquipamentosCODEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODEQUIPAMENTO'
    end
    object qryMTBFEquipamentosEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPAMENTO'
      Origin = 'EQUIPAMENTO'
      Size = 200
    end
    object qryMTBFEquipamentosMTBF_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA'
      Origin = 'MTBF_MEDIA'
      Precision = 47
      Size = 2
    end
    object qryMTBFEquipamentosMTBF_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA_FORMAT'
      Origin = 'MTBF_MEDIA_FORMAT'
      Size = 15
    end
    object qryMTBFEquipamentosDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
    end
    object qryMTBFEquipamentosDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
    end
  end
  object qryMTTRMedio: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      'SET @tipomanutencao := :calcmanut;'
      'SET @oficina := :calcoficina;'
      ''
      '-- C'#225'lculo de MTTR M'#233'dio (TESTADO)'
      'SELECT'
      '    ROUND(AVG(fmt.MTTR), 2)MTTR_MEDIA       '
      '    , IFNULL(CONCAT('
      
        '           FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 3600))) ' +
        '/ 3600), '#39':'#39','
      
        '           LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 36' +
        '00))) % 3600) / 60), 2, '#39'0'#39')'
      '       ), '#39'00:00'#39') AS MTTR_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , SUM(sub2.TOTALPARADAS)TOTALPARADAS'
      '        , SUM(sub2.HORASPARADAS)HORASPARADAS'
      '        , (SUM(sub2.HORASPARADAS)/SUM(sub2.TOTALPARADAS))MTTR'
      '    FROM               '
      '        (SELECT        '
      #9'     sub1.CODEQUIPAMENTO'
      #9'     , sub1.DATAFECHAMENTO'
      #9'     , sub1.EQUIPAMENTO            '
      #9'     , SUM(sub1.TOTALPARADAAS) TOTALPARADAS'
      #9'     , SUM(sub1.HORASPARADAS) HORASPARADAS'
      #9'    '
      #9' FROM'
      #9'     (SELECT'
      #9'          os.`CODEQUIPAMENTO`'#9#9'    '
      #9'          , os.`DATAFECHAMENTO`'
      #9'          , e.`DESCRICAO` EQUIPAMENTO            '
      #9'          , IFNULL(COUNT(*), 0)TOTALPARADAAS'
      
        #9'          , ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(' +
        'os.`DATAINICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 ' +
        'DAY)), '
      
        #9'              /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.' +
        '`DATAFECHAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY' +
        ')), os.`DATAFIMREAL`),'
      
        #9'              /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIORE' +
        'AL`, os.`DATAFIMREAL`))/60), 2) HORASPARADAS'#9'     '
      #9'      FROM '
      #9'          `ordemservico` AS os'
      #9'          INNER JOIN `equipamentos` AS e'
      
        #9#9'      ON (e.`CODIGO` = os.`CODEQUIPAMENTO`) AND (e.`OPERANDO` ' +
        '= '#39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39')'
      #9'          INNER JOIN `calendarioequip` c'
      
        #9#9'      ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPRESA` ' +
        '= e.CODEMPRESA )    '
      '                          LEFT JOIN `tipomanutencao` AS t '
      #9'                   ON (os.`CODMANUTENCAO` = t.`CODIGO`)'
      #9'      WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'          AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAF' +
        'ECHAMENTO` <= DATE(:data2)'
      
        '                           AND os.`DATAFIMREAL` >= DATE(DATE_SUB' +
        '(os.`DATAFECHAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1' +
        ' DAY))'
      
        #9'          AND os.`SITUACAO` <> '#39'CANCELADA'#39'  AND os.`EQUIPPARADO' +
        '` = '#39'S'#39'  AND e.`CALCINDIC` = '#39'S'#39
      
        '                          AND (IF(@tipomanutencao, t.`TIPOMANUTE' +
        'NCAO` = '#39'Manuten'#231#227'o Corretiva'#39', t.`TIPOMANUTENCAO` LIKE '#39'%%'#39'))'
      
        '                          AND (IF(@oficina, os.`CODOFICINA` = :c' +
        'odoficina, os.`CODOFICINA` LIKE '#39'%%'#39'))'#9#9'                        ' +
        '    '
      '                          )'
      '              GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      #9'      ORDER BY os.`CODEQUIPAMENTO`'
      #9'      ) AS sub1'
      '         GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9' ORDER BY sub1.EQUIPAMENTO'
      '         ) AS sub2'
      #9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt  ')
    Left = 48
    Top = 173
    ParamData = <
      item
        Name = 'CALCMANUT'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'CALCOFICINA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryMTTRMedioMTTR_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA'
      Origin = 'MTTR_MEDIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 58
      Size = 2
    end
    object qryMTTRMedioMTTR_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA_FORMAT'
      Origin = 'MTTR_MEDIA_FORMAT'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryMTTRMedioDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryMTTRMedioDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryMTTREquipamentos: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- C'#225'lculo de MTTR M'#233'dio (TESTADO)'
      'SELECT'
      '    fmt.CODEQUIPAMENTO'
      '    , fmt.EQUIPAMENTO'
      '    , ROUND(AVG(fmt.MTTR), 2)MTTR_MEDIA       '
      '    , IFNULL(CONCAT('
      
        '           FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 3600))) ' +
        '/ 3600), '#39':'#39','
      
        '           LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 36' +
        '00))) % 3600) / 60), 2, '#39'0'#39')'
      '       ), '#39'00:00'#39') AS MTTR_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , SUM(sub2.TOTALPARADAS)TOTALPARADAS'
      '        , SUM(sub2.HORASPARADAS)HORASPARADAS'
      '        , (SUM(sub2.HORASPARADAS)/SUM(sub2.TOTALPARADAS))MTTR'
      '    FROM               '
      '        (SELECT        '
      #9'     sub1.CODEQUIPAMENTO'
      #9'     , sub1.DATAFECHAMENTO'
      #9'     , sub1.EQUIPAMENTO            '
      #9'     , SUM(sub1.TOTALPARADAAS) TOTALPARADAS'
      #9'     , SUM(sub1.HORASPARADAS) HORASPARADAS'
      #9'    '
      #9' FROM'
      #9'     (SELECT'
      #9'          os.`CODEQUIPAMENTO`'#9#9'    '
      #9'          , os.`DATAFECHAMENTO`'
      #9'          , e.`DESCRICAO` EQUIPAMENTO            '
      #9'          , IFNULL(COUNT(*), 0)TOTALPARADAAS'
      
        #9'          , ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(' +
        'os.`DATAINICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 ' +
        'DAY)), '
      
        #9'              /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.' +
        '`DATAFECHAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY' +
        ')), os.`DATAFIMREAL`),'
      
        #9'              /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIORE' +
        'AL`, os.`DATAFIMREAL`))/60), 2) HORASPARADAS'#9'     '
      #9'      FROM '
      #9'          `ordemservico` AS os'
      #9'          INNER JOIN `equipamentos` AS e'
      
        #9#9'      ON (e.`CODIGO` = os.`CODEQUIPAMENTO`) AND (e.`OPERANDO` ' +
        '= '#39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39')'
      #9'          INNER JOIN `calendarioequip` c'
      
        #9#9'      ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPRESA` ' +
        '= e.CODEMPRESA )    '
      #9'      WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'          AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAF' +
        'ECHAMENTO` <= DATE(:data2)'
      
        #9'          AND os.`DATAFIMREAL` >= DATE(DATE_SUB(os.`DATAFECHAME' +
        'NTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY))'
      #9'          AND os.`SITUACAO` <> '#39'CANCELADA'#39
      #9'          AND os.`EQUIPPARADO` = '#39'S'#39
      '                          AND e.`CALCINDIC` = '#39'S'#39')'#9'         '
      '              GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      #9'      ORDER BY os.`CODEQUIPAMENTO`'
      #9'      ) AS sub1'
      '         GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9' ORDER BY sub1.EQUIPAMENTO'
      '         ) AS sub2'
      '    '
      '    GROUP BY sub2.DATAFECHAMENTO, sub2.EQUIPAMENTO'#9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt  '
      '  GROUP BY fmt.CODEQUIPAMENTO'
      '  ORDER BY fmt.EQUIPAMENTO')
    Left = 48
    Top = 228
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryMTTREquipamentosCODEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODEQUIPAMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryMTTREquipamentosEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPAMENTO'
      Origin = 'EQUIPAMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryMTTREquipamentosMTTR_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA'
      Origin = 'MTTR_MEDIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 64
      Size = 10
    end
    object qryMTTREquipamentosMTTR_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA_FORMAT'
      Origin = 'MTTR_MEDIA_FORMAT'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryMTTREquipamentosDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryMTTREquipamentosDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryHorasExtrasMedia: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- Horas Extras M'#233'dia (TESTADO)'
      'SELECT '
      '    sub1.DATAFECHAMENTO'
      '    , SUM(sub1.HORASTRABALHADAS) HORASTRABALHADAS'
      
        '    , (SUM(sub1.QTDEHENORMAL) + SUM(sub1.QTDEHEFERIADO)) HORASEX' +
        'TRAS    '
      
        '    , CONCAT(ROUND(((SUM(sub1.QTDEHENORMAL) + SUM(sub1.QTDEHEFER' +
        'IADO))/(SUM(sub1.HORASTRABALHADAS))) * 100, 2), '#39'%'#39') PERCENTUAL ' +
        '   '
      'FROM'
      '   '
      '    (SELECT'
      '         os.`CODIGO` CODORDEMSERVICO'
      '         , os.`DATAFECHAMENTO`'
      '         , osm.`MATRICULA`'
      '         , f.`NOME` FUNCIONARIO'
      '         , osm.`TOTALHOMEMHORA` HORASTRABALHADAS '
      '         , osm.`QTDEHENORMAL` '
      '         , osm.`QTDEHEFERIADO`  '
      '     '
      '     FROM'
      '         `ordemservicoequipemobrautil` AS osm '
      '        '
      '         INNER JOIN `ordemservico` AS os'
      '             ON (os.`CODIGO` = osm.`CODORDEMSERVICO`)'
      ''
      '         INNER JOIN `funcionarios` AS f'
      
        #9'     ON (f.`MATRICULA` = osm.`MATRICULA`) AND (f.`MOBRA` = '#39'OPE' +
        'RACIONAL'#39' ) AND (f.`ATIVO` = '#39'S'#39')'
      ''
      '         INNER JOIN `areas` a'
      
        '             ON (a.`CODIGO` = f.`CODAREA`) AND (a.`CODEMPRESA` =' +
        ' f.CODEMPRESA )'
      '             '
      '     WHERE (os.`CODEMPRESA` = :codempresa'
      
        '         AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAFEC' +
        'HAMENTO` <= DATE(:data2)'
      '         AND os.`SITUACAO` <> '#39'CANCELADA'#39'        '
      '         )'
      '         '
      '     GROUP BY os.`CODIGO`'
      '     ) AS sub1   ')
    Left = 48
    Top = 283
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryHorasExtrasMediaDATAFECHAMENTO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DATAFECHAMENTO'
      Origin = 'DATAFECHAMENTO'
    end
    object qryHorasExtrasMediaHORASTRABALHADAS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'HORASTRABALHADAS'
      Origin = 'HORASTRABALHADAS'
      Precision = 38
      Size = 2
    end
    object qryHorasExtrasMediaHORASEXTRAS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'HORASEXTRAS'
      Origin = 'HORASEXTRAS'
      Precision = 39
      Size = 2
    end
    object qryHorasExtrasMediaPERCENTUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Size = 48
    end
  end
  object qryHorasExtrasFunc: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- Horas Extras Funcion'#225'rios (TESTADO)'
      'SELECT'
      '    sub1.CODORDEMSERVICO '
      '    , sub1.DATAFECHAMENTO'
      '    , sub1.MATRICULA'
      '    , sub1.FUNCIONARIO'
      '    , SUM(sub1.HORASTRABALHADAS) HORASTRABALHADAS'
      
        '    , (SUM(sub1.QTDEHENORMAL) + SUM(sub1.QTDEHEFERIADO)) HORASEX' +
        'TRAS    '
      
        '    , CONCAT(ROUND(((SUM(sub1.QTDEHENORMAL) + SUM(sub1.QTDEHEFER' +
        'IADO))/(SUM(sub1.HORASTRABALHADAS))) * 100, 2), '#39'%'#39') PERCENTUAL'
      
        '    , CAST(DATE(DATE_SUB(sub1.`DATAFECHAMENTO`, INTERVAL DAYOFMO' +
        'NTH(sub1.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(sub1.`DATAFECHAMENTO`, INTERVA' +
        'L DAYOFMONTH(sub1.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2  ' +
        '  '
      '    '
      'FROM'
      ''
      '    (SELECT'
      '         os.`CODIGO` CODORDEMSERVICO'
      '         , os.`DATAFECHAMENTO`'
      '         , osm.`MATRICULA`'
      '         , f.`NOME` FUNCIONARIO'
      '         , osm. `TOTALHOMEMHORA` HORASTRABALHADAS'
      '         , osm.`QTDEHENORMAL` '
      '         , osm.`QTDEHEFERIADO`  '
      '     '
      '     FROM'
      '         `ordemservicoequipemobrautil` AS osm '
      '        '
      '         INNER JOIN `ordemservico` AS os'
      '             ON (os.`CODIGO` = osm.`CODORDEMSERVICO`)'
      ''
      '         INNER JOIN `funcionarios` AS f'
      
        #9'     ON (f.`MATRICULA` = osm.`MATRICULA`) AND (f.`MOBRA` = '#39'OPE' +
        'RACIONAL'#39' ) AND (f.`ATIVO` = '#39'S'#39')'
      ''
      '         INNER JOIN `areas` a'
      
        '             ON (a.`CODIGO` = f.`CODAREA`) AND (a.`CODEMPRESA` =' +
        ' f.CODEMPRESA )'
      '             '
      '     WHERE (os.`CODEMPRESA` = :codempresa'
      
        '         AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAFEC' +
        'HAMENTO` <= DATE(:data2)'
      '         AND os.`SITUACAO` <> '#39'CANCELADA'#39'        '
      '         )'
      '         '
      '     GROUP BY CODORDEMSERVICO'
      '     ) AS sub1  '
      'GROUP BY sub1.MATRICULA ')
    Left = 48
    Top = 338
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryHorasExtrasFuncCODORDEMSERVICO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODORDEMSERVICO'
      Origin = 'CODORDEMSERVICO'
    end
    object qryHorasExtrasFuncDATAFECHAMENTO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DATAFECHAMENTO'
      Origin = 'DATAFECHAMENTO'
    end
    object qryHorasExtrasFuncMATRICULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MATRICULA'
      Origin = 'MATRICULA'
      Size = 9
    end
    object qryHorasExtrasFuncFUNCIONARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
      Size = 200
    end
    object qryHorasExtrasFuncHORASTRABALHADAS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'HORASTRABALHADAS'
      Origin = 'HORASTRABALHADAS'
      Precision = 38
      Size = 2
    end
    object qryHorasExtrasFuncHORASEXTRAS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'HORASEXTRAS'
      Origin = 'HORASEXTRAS'
      Precision = 39
      Size = 2
    end
    object qryHorasExtrasFuncPERCENTUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      Size = 48
    end
    object qryHorasExtrasFuncDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
    end
    object qryHorasExtrasFuncDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
    end
  end
  object qryOficinas5: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      'SET @row_number := 0;'
      'SET @row_number1 := 0;'
      'SET @tipomanutencao := :calcmanut;'
      'SET @oficina := :calcoficina;'
      ''
      '-- Subconsulta para gerar a numera'#231#227'o de linha'
      'SELECT'
      '    OFICINA,'
      '    TOTAL'
      'FROM ('
      '    SELECT'
      '        ofc.`DESCRICAO` AS OFICINA,'
      '        COUNT(os.`CODIGO`) AS TOTAL,'
      '        (@row_number := @row_number + 1) AS RN'
      '    FROM'
      '        `ordemservico` AS os'
      
        '        INNER JOIN `oficinas` AS ofc ON (os.`CODOFICINA` = ofc.`' +
        'CODIGO`)        '
      
        '        LEFT JOIN `tipomanutencao` AS t ON (os.`CODMANUTENCAO` =' +
        ' t.`CODIGO`)'
      '    WHERE'
      '        os.`SITUACAO` <> '#39'CANCELADA'#39
      '        AND MONTH(os.`DATACADASTRO`) = :MES'
      '        AND YEAR(os.`DATACADASTRO`) = :ANO'
      
        '        AND (IF(@tipomanutencao, t.`TIPOMANUTENCAO` = :tipomanut' +
        'encao, t.`TIPOMANUTENCAO` LIKE '#39'%%'#39'))'
      
        '        AND (IF(@oficina, os.`CODOFICINA` = :codoficina, os.`COD' +
        'OFICINA` LIKE '#39'%%'#39'))'
      '        '
      '    GROUP BY ofc.`DESCRICAO`'
      '    ORDER BY TOTAL DESC'
      ') AS T1'
      'WHERE RN <= 5'
      ''
      'UNION ALL'
      ''
      '-- Subconsulta para agrupar as demais oficinas como "Outras"'
      'SELECT'
      '    '#39'Outras'#39' AS OFICINA,'
      '    SUM(TOTAL) AS TOTAL'
      'FROM ('
      '    SELECT'
      '        COUNT(os.`CODIGO`) AS TOTAL,'
      '        (@row_number1 := @row_number1 + 1) AS RN'
      '    FROM'
      '        `ordemservico` AS os'
      
        '        INNER JOIN `oficinas` AS ofc ON (os.`CODOFICINA` = ofc.`' +
        'CODIGO`)'
      
        '        LEFT JOIN `tipomanutencao` AS t ON (os.`CODMANUTENCAO` =' +
        ' t.`CODIGO`)'
      '    WHERE'
      '        os.`SITUACAO` <> '#39'CANCELADA'#39
      '        AND MONTH(os.`DATACADASTRO`) = :MES'
      '        AND YEAR(os.`DATACADASTRO`) = :ANO'
      
        '        AND (IF(@tipomanutencao, t.`TIPOMANUTENCAO` = :tipomanut' +
        'encao, t.`TIPOMANUTENCAO` LIKE '#39'%%'#39'))'
      
        '        AND (IF(@oficina, os.`CODOFICINA` = :codoficina, os.`COD' +
        'OFICINA` LIKE '#39'%%'#39'))'
      '    GROUP BY ofc.`DESCRICAO`'
      '    ORDER BY TOTAL DESC'
      ') AS T2'
      'WHERE RN > 5;')
    Left = 160
    Top = 8
    ParamData = <
      item
        Name = 'CALCMANUT'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'CALCOFICINA'
        DataType = ftBoolean
        ParamType = ptInput
      end
      item
        Name = 'MES'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ANO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TIPOMANUTENCAO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryOficinas5OFICINA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OFICINA'
      Origin = 'OFICINA'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryOficinas5TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 42
      Size = 0
    end
  end
  object qryOficinasIndiv: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      'SELECT'
      '    ofc.`DESCRICAO` AS OFICINA'
      '    , COUNT(os.`CODIGO`) AS TOTAL'
      'FROM'
      '    `ordemservico` AS os'
      
        '    INNER JOIN `oficinas` AS ofc ON (os.`CODOFICINA` = ofc.`CODI' +
        'GO`)'
      'WHERE'
      '    (os.`SITUACAO` <> '#39'CANCELADA'#39' '
      
        '    AND MONTH(os.`DATACADASTRO`) = :MES AND YEAR(os.`DATACADASTR' +
        'O`) = :ANO'
      '    AND os.`CODEMPRESA` = :codempresa'
      '    AND ofc.`CODIGO` = :codoficina'
      '   )')
    Left = 160
    Top = 63
    ParamData = <
      item
        Name = 'MES'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ANO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryOficinasIndivOFICINA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OFICINA'
      Origin = 'OFICINA'
      Size = 80
    end
    object qryOficinasIndivTOTAL: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
  end
  object qryMTBFMedioOficina: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- C'#225'lculo de MTBF Equipamentos (TESTADO)'
      'SELECT'
      '    fmt.CODEQUIPAMENTO'
      '    , fmt.EQUIPAMENTO            '
      '    , ROUND(fmt.MTBF, 2)MTBF_MEDIA'
      '    , IFNULL(CAST(CONCAT('
      
        '                  FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTBF * 3' +
        '600))) / 3600), '#39':'#39','
      
        '                  LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MT' +
        'BF * 3600))) % 3600) / 60), 2, '#39'0'#39')'
      '                  ) AS CHAR'
      '           ), '#39'00:00'#39') AS MTBF_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      ''
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , sub2.TOTALPARADAS'
      '        , sub2.HORASPARADAS'
      '        , sub2.HOFICIAIS'#9'    '
      
        '        , IFNULL(((sub2.HOFICIAIS - sub2.HORASPARADAS)/sub2.TOTA' +
        'LPARADAS), 0)MTBF        '
      '    FROM                 '
      '        (SELECT        '
      #9'    sub1.CODEQUIPAMENTO'
      #9'    , sub1.DATAFECHAMENTO'
      #9'    , sub1.EQUIPAMENTO            '
      #9'    , IFNULL(SUM(sub1.TOTALPARADAAS), 0) TOTALPARADAS'
      #9'    , IFNULL(SUM(sub1.HORASPARADAS), 0) HORASPARADAS'
      #9'    , sub1.HOFICIAIS'
      #9'    '
      #9' FROM'
      #9'     (SELECT'
      #9'         os.`CODEQUIPAMENTO`'
      #9#9' , os.`DATAFECHAMENTO`'
      #9#9' , e.`DESCRICAO` EQUIPAMENTO            '
      #9#9' , COUNT(*)TOTALPARADAAS'
      
        #9#9' , ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(os.`DATA' +
        'INICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 DAY)), '
      
        #9#9'     /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.`DATAFEC' +
        'HAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY)), os.`' +
        'DATAFIMREAL`),'
      
        #9#9'     /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIOREAL`, os.' +
        '`DATAFIMREAL`))/60), 2) HORASPARADAS'
      #9#9' , (IFNULL(c.`HOFICIAIS`, 720)) HOFICIAIS'
      #9'      FROM '
      '                  `ordemservico` AS os'
      #9#9'   INNER JOIN `equipamentos` AS e'
      
        #9'               ON (e.`CODIGO` = `CODEQUIPAMENTO`) AND (e.`OPERA' +
        'NDO` = '#39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39')'
      #9#9'   INNER JOIN `calendarioequip` c'
      
        #9#9'       ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPRESA`' +
        ' = e.CODEMPRESA )'
      #9'      WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'          AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAF' +
        'ECHAMENTO` <= DATE(:data2)'
      
        #9#9'  AND os.`DATAFIMREAL` >= DATE(DATE_SUB(os.`DATAFECHAMENTO`, I' +
        'NTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY))'
      
        #9#9'  AND os.`SITUACAO` <> '#39'CANCELADA'#39' AND os.`CODOFICINA` = :codo' +
        'ficina'
      #9#9'  AND os.`EQUIPPARADO` = '#39'S'#39
      '                                  AND e.`CALCINDIC` = '#39'S'#39')'
      #9'      GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      '              ORDER BY os.`CODEQUIPAMENTO`'
      #9'      ) AS sub1'
      #9' GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9' ORDER BY sub1.EQUIPAMENTO'
      #9' ) AS sub2'#9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt  ')
    Left = 160
    Top = 118
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryMTBFMedioOficinaCODEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODEQUIPAMENTO'
    end
    object qryMTBFMedioOficinaEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPAMENTO'
      Origin = 'EQUIPAMENTO'
      Size = 200
    end
    object qryMTBFMedioOficinaMTBF_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA'
      Origin = 'MTBF_MEDIA'
      Precision = 47
      Size = 2
    end
    object qryMTBFMedioOficinaMTBF_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA_FORMAT'
      Origin = 'MTBF_MEDIA_FORMAT'
      Size = 24
    end
    object qryMTBFMedioOficinaDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
    end
    object qryMTBFMedioOficinaDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
    end
  end
  object qryMTTRMedioOficina: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- C'#225'lculo de MTTR M'#233'dio (TESTADO)'
      'SELECT'
      '    ROUND(AVG(fmt.MTTR), 2)MTTR_MEDIA       '
      '    , IFNULL(CONCAT('
      
        '           FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 3600))) ' +
        '/ 3600), '#39':'#39','
      
        '           LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 36' +
        '00))) % 3600) / 60), 2, '#39'0'#39')'
      '       ), '#39'00:00'#39') AS MTTR_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , SUM(sub2.TOTALPARADAS)TOTALPARADAS'
      '        , SUM(sub2.HORASPARADAS)HORASPARADAS'
      '        , (SUM(sub2.HORASPARADAS)/SUM(sub2.TOTALPARADAS))MTTR'
      '    FROM               '
      '        (SELECT        '
      #9'     sub1.CODEQUIPAMENTO'
      #9'     , sub1.DATAFECHAMENTO'
      #9'     , sub1.EQUIPAMENTO            '
      #9'     , SUM(sub1.TOTALPARADAAS) TOTALPARADAS'
      #9'     , SUM(sub1.HORASPARADAS) HORASPARADAS'
      #9'    '
      #9' FROM'
      #9'     (SELECT'
      #9'          os.`CODEQUIPAMENTO`'#9#9'    '
      #9'          , os.`DATAFECHAMENTO`'
      #9'          , e.`DESCRICAO` EQUIPAMENTO            '
      #9'          , IFNULL(COUNT(*), 0)TOTALPARADAAS'
      
        #9'          , ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(' +
        'os.`DATAINICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 ' +
        'DAY)), '
      
        #9'              /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.' +
        '`DATAFECHAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY' +
        ')), os.`DATAFIMREAL`),'
      
        #9'              /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIORE' +
        'AL`, os.`DATAFIMREAL`))/60), 2) HORASPARADAS'#9'     '
      #9'      FROM '
      #9'          `ordemservico` AS os'
      #9'          INNER JOIN `equipamentos` AS e'
      
        #9#9'      ON (e.`CODIGO` = os.`CODEQUIPAMENTO`) AND (e.`OPERANDO` ' +
        '= '#39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39')'
      #9'          INNER JOIN `calendarioequip` c'
      
        #9#9'      ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPRESA` ' +
        '= e.CODEMPRESA )    '
      #9'      WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'          AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAF' +
        'ECHAMENTO` <= DATE(:data2)'
      
        '                           AND os.`DATAFIMREAL` >= DATE(DATE_SUB' +
        '(os.`DATAFECHAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1' +
        ' DAY))'
      
        #9'          AND os.`SITUACAO` <> '#39'CANCELADA'#39'  AND os.`CODOFICINA`' +
        ' = :codoficina'
      #9'          AND os.`EQUIPPARADO` = '#39'S'#39
      '                          AND e.`CALCINDIC` = '#39'S'#39')'#9'         '
      '              GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      #9'      ORDER BY os.`CODEQUIPAMENTO`'
      #9'      ) AS sub1'
      '         GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9' ORDER BY sub1.EQUIPAMENTO'
      '         ) AS sub2'
      #9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt  ')
    Left = 160
    Top = 173
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryMTTRMedioOficinaMTTR_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA'
      Origin = 'MTTR_MEDIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 58
      Size = 2
    end
    object qryMTTRMedioOficinaMTTR_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA_FORMAT'
      Origin = 'MTTR_MEDIA_FORMAT'
      ProviderFlags = []
      ReadOnly = True
      Size = 24
    end
    object qryMTTRMedioOficinaDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryMTTRMedioOficinaDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryOficinasManut: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      'SELECT'
      '    ofc.`DESCRICAO` AS OFICINA'
      '    , COUNT(os.`CODIGO`) AS TOTAL'
      'FROM'
      '    `ordemservico` AS os'
      
        '    INNER JOIN `oficinas` AS ofc ON (os.`CODOFICINA` = ofc.`CODI' +
        'GO`)'
      
        '     LEFT JOIN `tipomanutencao` t    ON (t.`CODIGO` = os.`CODMAN' +
        'UTENCAO`)'
      'WHERE'
      '    (os.`SITUACAO` <> '#39'CANCELADA'#39' '
      
        '    AND MONTH(os.`DATACADASTRO`) = :MES AND YEAR(os.`DATACADASTR' +
        'O`) = :ANO'
      '    AND os.`CODEMPRESA` = :codempresa   '
      '    AND os.`CODOFICINA` LIKE :codoficina '
      '    AND t.`TIPOMANUTENCAO` LIKE :tipomanutencao'
      '   )')
    Left = 160
    Top = 228
    ParamData = <
      item
        Name = 'MES'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ANO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TIPOMANUTENCAO'
        ParamType = ptInput
      end>
    object qryOficinasManutOFICINA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OFICINA'
      Origin = 'OFICINA'
      Size = 80
    end
    object qryOficinasManutTOTAL: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
  end
  object qryMTBFMedioManut: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- C'#225'lculo de MTBF Equipamentos (TESTADO)'
      'SELECT'
      '    fmt.CODEQUIPAMENTO'
      '    , fmt.EQUIPAMENTO            '
      '    , ROUND(fmt.MTBF, 2)MTBF_MEDIA'
      '    , IFNULL(CAST(CONCAT('
      
        '                  FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTBF * 3' +
        '600))) / 3600), '#39':'#39','
      
        '                  LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MT' +
        'BF * 3600))) % 3600) / 60), 2, '#39'0'#39')'
      '                  ) AS CHAR'
      '           ), '#39'00:00'#39') AS MTBF_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      ''
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , sub2.TOTALPARADAS'
      '        , sub2.HORASPARADAS'
      '        , sub2.HOFICIAIS'#9'    '
      
        '        , IFNULL(((sub2.HOFICIAIS - sub2.HORASPARADAS)/sub2.TOTA' +
        'LPARADAS), 0)MTBF        '
      '    FROM                 '
      '        (SELECT        '
      #9'    sub1.CODEQUIPAMENTO'
      #9'    , sub1.DATAFECHAMENTO'
      #9'    , sub1.EQUIPAMENTO            '
      #9'    , IFNULL(SUM(sub1.TOTALPARADAAS), 0) TOTALPARADAS'
      #9'    , IFNULL(SUM(sub1.HORASPARADAS), 0) HORASPARADAS'
      #9'    , sub1.HOFICIAIS'
      #9'    '
      #9' FROM'
      #9'     (SELECT'
      #9'         os.`CODEQUIPAMENTO`'
      #9#9' , os.`DATAFECHAMENTO`'
      #9#9' , e.`DESCRICAO` EQUIPAMENTO            '
      #9#9' , COUNT(*)TOTALPARADAAS'
      
        #9#9' , ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(os.`DATA' +
        'INICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 DAY)), '
      
        #9#9'     /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.`DATAFEC' +
        'HAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY)), os.`' +
        'DATAFIMREAL`),'
      
        #9#9'     /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIOREAL`, os.' +
        '`DATAFIMREAL`))/60), 2) HORASPARADAS'
      #9#9' , (IFNULL(c.`HOFICIAIS`, 720)) HOFICIAIS'
      #9'      FROM '
      '                  `ordemservico` AS os'
      #9#9'   INNER JOIN `equipamentos` AS e'
      
        #9'               ON (e.`CODIGO` = `CODEQUIPAMENTO`) AND (e.`OPERA' +
        'NDO` = '#39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39')'
      #9#9'   INNER JOIN `calendarioequip` c'
      
        #9#9'       ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPRESA`' +
        ' = e.CODEMPRESA )'
      '                                   LEFT JOIN `tipomanutencao` t'
      #9#9'       ON (t.`CODIGO` = os.`CODMANUTENCAO`)'
      #9'      WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'          AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAF' +
        'ECHAMENTO` <= DATE(:data2)'
      
        #9#9'  AND os.`DATAFIMREAL` >= DATE(DATE_SUB(os.`DATAFECHAMENTO`, I' +
        'NTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY))'
      #9#9'  AND os.`SITUACAO` <> '#39'CANCELADA'#39' '
      
        '                                  AND os.`CODOFICINA` LIKE :codo' +
        'ficina '
      
        '                                  AND t.`TIPOMANUTENCAO` LIKE :t' +
        'ipomanutencao'
      #9#9'  AND os.`EQUIPPARADO` = '#39'S'#39
      '                                  AND e.`CALCINDIC` = '#39'S'#39')'
      #9'      GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      '              ORDER BY os.`CODEQUIPAMENTO`'
      #9'      ) AS sub1'
      #9' GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9' ORDER BY sub1.EQUIPAMENTO'
      #9' ) AS sub2'#9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt  ')
    Left = 160
    Top = 283
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TIPOMANUTENCAO'
        ParamType = ptInput
      end>
    object qryMTBFMedioManutCODEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODEQUIPAMENTO'
    end
    object qryMTBFMedioManutEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPAMENTO'
      Origin = 'EQUIPAMENTO'
      Size = 200
    end
    object qryMTBFMedioManutMTBF_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA'
      Origin = 'MTBF_MEDIA'
      Precision = 47
      Size = 2
    end
    object qryMTBFMedioManutMTBF_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTBF_MEDIA_FORMAT'
      Origin = 'MTBF_MEDIA_FORMAT'
      Size = 24
    end
    object qryMTBFMedioManutDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
    end
    object qryMTBFMedioManutDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
    end
  end
  object qryMTTRMedioManut: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      '-- C'#225'lculo de MTTR M'#233'dio (TESTADO)'
      'SELECT'
      '    ROUND(AVG(fmt.MTTR), 2)MTTR_MEDIA       '
      '    , IFNULL(CONCAT('
      
        '           FLOOR(AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 3600))) ' +
        '/ 3600), '#39':'#39','
      
        '           LPAD(FLOOR((AVG(TIME_TO_SEC(SEC_TO_TIME(fmt.MTTR * 36' +
        '00))) % 3600) / 60), 2, '#39'0'#39')'
      '       ), '#39'00:00'#39') AS MTTR_MEDIA_FORMAT'
      
        '    , CAST(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL DAYOFMON' +
        'TH(fmt.`DATAFECHAMENTO`)-1 DAY)) AS DATE) AS DATA1'
      
        '    , CAST(LAST_DAY(DATE(DATE_SUB(fmt.`DATAFECHAMENTO`, INTERVAL' +
        ' DAYOFMONTH(fmt.`DATAFECHAMENTO`)-1 DAY))) AS DATE) AS DATA2'
      'FROM'
      '    (SELECT'
      '        sub2.CODEQUIPAMENTO'
      '        , sub2.DATAFECHAMENTO'
      '        , sub2.EQUIPAMENTO            '
      '        , SUM(sub2.TOTALPARADAS)TOTALPARADAS'
      '        , SUM(sub2.HORASPARADAS)HORASPARADAS'
      '        , (SUM(sub2.HORASPARADAS)/SUM(sub2.TOTALPARADAS))MTTR'
      '    FROM               '
      '        (SELECT        '
      #9'     sub1.CODEQUIPAMENTO'
      #9'     , sub1.DATAFECHAMENTO'
      #9'     , sub1.EQUIPAMENTO            '
      #9'     , SUM(sub1.TOTALPARADAAS) TOTALPARADAS'
      #9'     , SUM(sub1.HORASPARADAS) HORASPARADAS'
      #9'    '
      #9' FROM'
      #9'     (SELECT'
      #9'          os.`CODEQUIPAMENTO`'#9#9'    '
      #9'          , os.`DATAFECHAMENTO`'
      #9'          , e.`DESCRICAO` EQUIPAMENTO            '
      #9'          , IFNULL(COUNT(*), 0)TOTALPARADAAS'
      
        #9'          , ROUND((IF(MIN(os.`DATAINICIOREAL`) < DATE(DATE_SUB(' +
        'os.`DATAINICIOREAL`, INTERVAL DAYOFMONTH(os.`DATAINICIOREAL`)-1 ' +
        'DAY)), '
      
        #9'              /*true*/  TIMESTAMPDIFF(MINUTE, DATE(DATE_SUB(os.' +
        '`DATAFECHAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1 DAY' +
        ')), os.`DATAFIMREAL`),'
      
        #9'              /*false*/  TIMESTAMPDIFF(MINUTE, os.`DATAINICIORE' +
        'AL`, os.`DATAFIMREAL`))/60), 2) HORASPARADAS'#9'     '
      #9'      FROM '
      #9'          `ordemservico` AS os'
      #9'          INNER JOIN `equipamentos` AS e'
      
        #9#9'      ON (e.`CODIGO` = os.`CODEQUIPAMENTO`) AND (e.`OPERANDO` ' +
        '= '#39'S'#39' ) AND (e.`SECUNDARIO` = '#39'N'#39')'
      #9'          INNER JOIN `calendarioequip` c'
      
        #9#9'      ON (c.`CODIGO` = e.`CODCALENDARIO`) AND (c.`CODEMPRESA` ' +
        '= e.CODEMPRESA )    '
      '                          LEFT JOIN `tipomanutencao` t'
      #9#9'       ON (t.`CODIGO` = os.`CODMANUTENCAO`)'
      #9'      WHERE (os.`CODEMPRESA` = :codempresa'
      
        #9'          AND os.`DATAFECHAMENTO` >= DATE(:data1) AND os.`DATAF' +
        'ECHAMENTO` <= DATE(:data2)'
      
        '                           AND os.`DATAFIMREAL` >= DATE(DATE_SUB' +
        '(os.`DATAFECHAMENTO`, INTERVAL DAYOFMONTH(os.`DATAFECHAMENTO`)-1' +
        ' DAY))'
      #9'          AND os.`SITUACAO` <> '#39'CANCELADA'#39'  '
      '                          AND os.`CODOFICINA` LIKE :codoficina '
      
        '                          AND t.`TIPOMANUTENCAO` LIKE :tipomanut' +
        'encao'
      #9'          AND os.`EQUIPPARADO` = '#39'S'#39
      '                          AND e.`CALCINDIC` = '#39'S'#39')'#9'         '
      '              GROUP BY os.`CODEQUIPAMENTO`, os.`CODIGO`'
      #9'      ORDER BY os.`CODEQUIPAMENTO`'
      #9'      ) AS sub1'
      '         GROUP BY sub1.DATAFECHAMENTO, sub1.EQUIPAMENTO'
      #9' ORDER BY sub1.EQUIPAMENTO'
      '         ) AS sub2'
      #9
      '    ORDER BY sub2.EQUIPAMENTO'
      '    ) AS fmt  ')
    Left = 160
    Top = 338
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DATA2'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODOFICINA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'TIPOMANUTENCAO'
        ParamType = ptInput
      end>
    object qryMTTRMedioManutMTTR_MEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA'
      Origin = 'MTTR_MEDIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 58
      Size = 2
    end
    object qryMTTRMedioManutMTTR_MEDIA_FORMAT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MTTR_MEDIA_FORMAT'
      Origin = 'MTTR_MEDIA_FORMAT'
      ProviderFlags = []
      ReadOnly = True
      Size = 24
    end
    object qryMTTRMedioManutDATA1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA1'
      Origin = 'DATA1'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryMTTRMedioManutDATA2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA2'
      Origin = 'DATA2'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
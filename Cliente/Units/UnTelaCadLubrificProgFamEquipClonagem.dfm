inherited FrmTelaCadLubrificProgFamEquipClonagem: TFrmTelaCadLubrificProgFamEquipClonagem
  Caption = 'Criar Lubrifica'#231#245'es nos Equipamentos da Fam'#237'lia'
  ClientHeight = 514
  ClientWidth = 953
  Constraints.MaxHeight = 550
  Constraints.MaxWidth = 965
  Constraints.MinHeight = 517
  OnCreate = FormCreate
  ExplicitWidth = 965
  ExplicitHeight = 550
  TextHeight = 16
  inherited PTop: TPanel
    Width = 949
    ExplicitWidth = 945
    inherited BtnAjuda: TButton
      Left = 916
      Visible = False
      ExplicitLeft = 912
    end
  end
  inherited PCentro: TPanel
    Width = 947
    Height = 375
    ExplicitWidth = 943
    ExplicitHeight = 339
    object Label7: TLabel [0]
      Left = 210
      Top = 313
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'Criticidade:'
    end
    object Label9: TLabel [1]
      Left = 9
      Top = 313
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Reprogramar:'
    end
    object Label2: TLabel [2]
      Left = 14
      Top = 340
      Width = 76
      Height = 16
      Caption = 'Respons'#225'vel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited RGTelas: TRadioGroup
      Top = 307
      Width = 945
      Height = 0
      Align = alNone
      TabOrder = 1
      ExplicitTop = 307
      ExplicitWidth = 945
      ExplicitHeight = 0
    end
    object gbEquipamentosFamilia: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 939
      Height = 300
      Align = alTop
      Caption = 'Equipamentos da Fam'#237'lia: '
      TabOrder = 0
      object gridEquip: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 929
        Height = 274
        Hint = 
          'Selecionar os equipamentos para a cria'#231#227'o do plano de lubrifica'#231 +
          #227'o.'
        Align = alClient
        DataSource = dsEquipamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 228
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'OPERANDO'
            Title.Alignment = taCenter
            Title.Caption = 'Operando'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'centrocusto'
            Title.Caption = 'Centro de Custo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AREA'
            Title.Caption = #193'rea'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 132
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'celula'
            Title.Caption = 'C'#233'lula'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'linha'
            Title.Caption = 'Linha'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 125
            Visible = True
          end>
      end
    end
    object chbTodos: TCheckBox
      Left = 817
      Top = 308
      Width = 121
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Selecionar todos'
      TabOrder = 7
      OnClick = chbTodosClick
    end
    object cbCriticidade: TComboBox
      Left = 280
      Top = 310
      Width = 144
      Height = 24
      Style = csDropDownList
      ItemIndex = 2
      TabOrder = 3
      Text = 'Para o Equipamento'
      Items.Strings = (
        'Para a F'#225'brica'
        'Para a '#193'rea'
        'Para o Equipamento'
        'Outra')
    end
    object cbReprogramacao: TComboBox
      Left = 96
      Top = 310
      Width = 103
      Height = 24
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'Programa'#231#227'o'
      Items.Strings = (
        'Programa'#231#227'o'
        'Execu'#231#227'o')
    end
    object BitBtn2: TBitBtn
      Left = 801
      Top = 337
      Width = 137
      Height = 30
      Caption = 'Criar Inspe'#231#245'es'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8AC9EB988
        4BB98029C7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7
        C3BDC7C3BDC7C3BDB98029B9874CB8AB9EB8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6C38C45D79532DB9834F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECDB9834D79633C38C46B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6D79532DB9834DB9834F1F0ECF1F0ECF1F0ECF1F0EC
        F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECDB9834DB9834D796
        33B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6DB9834DB9834DB9834F1F0ECF1
        F0ECC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDC7C3BDF1F0ECF1F0EC
        DB9834DB9834DB9834B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6DB9834DB98
        34DB9834F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1
        F0ECF1F0ECF1F0ECDB9834DB9834DB9834B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6DB9834DB9834DB9834F1F0ECF1F0ECC7C3BDC7C3BDC7C3BDC7C3BDC7C3
        BDC7C3BDC7C3BDC7C3BDF1F0ECF1F0ECDB9834DB9834DB9834B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6DB9834DB9834DB9834EFE7D8F1F0ECF1F0ECF1F0EC
        F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECEFE6D7DB9834DB9834DB98
        34B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6DB9834DB9834DB9834E1B269EE
        E7D9F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECF1F0ECEFE7D8E1B169
        DB9834DB9834DB9834B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834DB9834B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6DB9834DB9834DB9834DB9834DB9834DB9834DB9834
        DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB98
        34B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6DB9834DB9834DB9834DB9834DB
        9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834
        DB9834DB9834DB9834B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6DB9834DB98
        34DB9834D19131BD832AB98029B98029B98029B98029B98029B98029B98029B9
        8029BD822AD19131DB9834DB9834DB9834B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6DB9834DB9834DB9834BD832AC9A061EBE4D6F1F0ECF1F0ECF1F0ECF1F0
        ECF1F0ECF1F0ECEBE4D6C9A060BD822ADB9834DB9834DB9834B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6DB9834DB9834DB9834B98029EBE4D6B8B6AAA6A595
        A6A595B8B7A9F1F0ECF1F0ECF1F0ECF1F0ECEBE4D6B98029DB9834DB9834DB98
        34B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6DB9834DB9834DB9834B98029F1
        F0ECA6A595A6A595A6A595A6A595F1F0ECF1F0ECF1F0ECF1F0ECF1F0ECB98029
        DB9834DB9834CBA885B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6D89B50DB98
        34DB9834B98029F1F0ECA6A595A6A595A6A595A6A595F1F0ECF1F0ECF1F0ECF1
        F0ECF1F0ECB98029DB9834CAA988B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6C2B19DD89C4FDB9834B98029F1F0ECC7C3BDC7C3BDC7C3BDC7C3BDF1F0
        ECF1F0ECF1F0ECF1F0ECF1F0ECB98029CAA988B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6
        B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9
        B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8
        B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6B8B9B6}
      TabOrder = 8
      OnClick = BitBtn2Click
    end
    object EdtMatricula: TEdit
      Left = 96
      Top = 338
      Width = 103
      Height = 24
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      StyleElements = [seFont, seClient]
      OnKeyPress = EdtMatriculaKeyPress
    end
    object EdtResponsavel: TEdit
      Left = 203
      Top = 338
      Width = 221
      Height = 24
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seFont, seClient]
    end
    object BtnFuncionario: TButton
      Left = 429
      Top = 337
      Width = 26
      Height = 26
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BtnFuncionarioClick
    end
  end
  inherited PAuxiliares: TPanel
    Top = 447
    Width = 949
    ExplicitTop = 411
    ExplicitWidth = 945
  end
  inherited PBotoes: TPanel
    Top = 474
    Width = 949
    ExplicitTop = 438
    ExplicitWidth = 945
    inherited BtnOK: TButton
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 437
      ExplicitLeft = 437
    end
  end
  object qryEquipamentos: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      'SELECT '
      '    e1.`CODIGO`'
      '    , e1.`DESCRICAO`'
      '    , e1.`OPERANDO`'
      '    , `centrocusto`.`DESCRICAO` AS centrocusto'
      '    , `areas`.`DESCRICAO` AS AREA'
      '    , `celulas`.`DESCRICAO` AS celula'
      '    , `linhas`.`DESCRICAO` AS linha'
      'FROM `equipamentos` AS e1'
      '    LEFT JOIN `centrocusto` '
      '        ON (e1.`CODCENTROCUSTO` = `centrocusto`.`CODIGO`)'
      '    LEFT JOIN `areas` '
      
        '        ON (e1.`CODEMPRESA` = `areas`.`CODEMPRESA`) AND (e1.`COD' +
        'LOCALIZACAO` = `areas`.`CODIGO`)'
      '    LEFT JOIN `celulas`'
      
        '        ON (`celulas`.`CODEMPRESA` = `areas`.`CODEMPRESA`) AND (' +
        '`celulas`.`CODIGO` = e1.`CODCELULA`)'
      '   LEFT JOIN `linhas`'
      
        '        ON (`linhas`.`CODEMPRESA` = `celulas`.`CODEMPRESA`) AND ' +
        '(`linhas`.`CODIGO` = e1.`CODLINHA`)WHERE e1.`CODIGO` NOT IN (SEL' +
        'ECT '
      '                              e2.`CODIGO` '
      '                          FROM '
      '                              `equipamentos` AS e2'
      
        '                              INNER JOIN `lubrificprogequipament' +
        'o`'
      
        '                                  ON (e2.`CODIGO` = `lubrificpro' +
        'gequipamento`.`CODEQUIPAMENTO`) AND (`lubrificprogequipamento`.`' +
        'CODEMPRESA` = e2.`CODEMPRESA`)'
      
        #9#9#9'  WHERE (`lubrificprogequipamento`.`CODLUBRIFICPROGFAMEQUIP` ' +
        '= :codlubrificprogfamequip'
      
        #9#9#9'      AND `lubrificprogequipamento`.`CODEMPRESA` = e1.`CODEMP' +
        'RESA`)'
      #9#9#9'  GROUP BY e2.`CODIGO`)'
      'AND e1.`CODEMPRESA` = :codempresa'
      'AND e1.`CODFAMILIAEQUIP` = :codfamiliaequip'
      'GROUP BY '
      '    e1.`CODIGO`'
      'ORDER BY'
      '    e1.`DESCRICAO`')
    Left = 643
    Top = 11
    ParamData = <
      item
        Name = 'CODLUBRIFICPROGFAMEQUIP'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'CODFAMILIAEQUIP'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryEquipamentosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEquipamentosDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryEquipamentosOPERANDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OPERANDO'
      Origin = 'OPERANDO'
      Size = 1
    end
    object qryEquipamentoscentrocusto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'centrocusto'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryEquipamentosAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryEquipamentoscelula: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celula'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryEquipamentoslinha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'linha'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
  end
  object dsEquipamentos: TDataSource
    DataSet = qryEquipamentos
    Left = 755
    Top = 11
  end
end

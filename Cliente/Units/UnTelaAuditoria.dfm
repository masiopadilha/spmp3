inherited FrmTelaAuditoria: TFrmTelaAuditoria
  Caption = 'Auditoria'
  ClientHeight = 638
  ClientWidth = 1004
  Constraints.MaxHeight = 0
  Constraints.MaxWidth = 0
  Constraints.MinHeight = 0
  Constraints.MinWidth = 0
  OnCreate = FormCreate
  ExplicitWidth = 1016
  ExplicitHeight = 674
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1000
    ExplicitWidth = 996
    inherited BtnAjuda: TButton
      Left = 958
      Top = 16
      Height = 30
      ExplicitLeft = 954
      ExplicitTop = 16
      ExplicitHeight = 30
    end
    object BtnImprimir: TButton
      Left = 925
      Top = 16
      Width = 30
      Height = 30
      Hint = 'Imprimir'
      Anchors = [akTop, akRight]
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnImprimirClick
      ExplicitLeft = 921
    end
  end
  inherited PCentro: TPanel
    Top = 153
    Width = 998
    Height = 413
    OnResize = PCentroResize
    ExplicitTop = 153
    ExplicitWidth = 994
    ExplicitHeight = 410
    inherited RGTelas: TRadioGroup
      Left = 499
      Width = 0
      Height = 411
      ExplicitLeft = 499
      ExplicitWidth = 0
      ExplicitHeight = 408
    end
    object PGrid: TPanel
      Left = 1
      Top = 1
      Width = 498
      Height = 411
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 408
      object JvDBGridLista: TJvDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 2
        Width = 492
        Height = 405
        Hint = 'Tecle ENTER na coluna ID para filtrar o registro.'
        Margins.Top = 1
        Margins.Right = 1
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = True
        DataSource = dsAuditoria
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowFrame
        TitleFont.Height = -16
        TitleFont.Name = 'Roboto Cn'
        TitleFont.Style = []
        TitleFont.Quality = fqDraft
        OnDrawColumnCell = JvDBGridListaDrawColumnCell
        OnKeyPress = JvDBGridListaKeyPress
        BevelEdges = []
        BevelInner = bvNone
        BevelKind = bkTile
        AlternateRowColor = 16055512
        AlternateRowFontColor = clBlack
        TitleArrow = True
        AutoSizeColumns = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        CanDelete = False
        EditControls = <>
        RowsHeight = 19
        TitleRowHeight = 23
      end
    end
    object PMemos: TPanel
      Left = 499
      Top = 1
      Width = 498
      Height = 411
      Align = alRight
      TabOrder = 2
      OnResize = PMemosResize
      ExplicitLeft = 495
      ExplicitHeight = 408
      object PAntes: TPanel
        Left = 1
        Top = 1
        Width = 496
        Height = 225
        Align = alTop
        Caption = 'PAntes'
        TabOrder = 0
        object Label5: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 488
          Height = 15
          Align = alTop
          Caption = 'Antes'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6579300
          Font.Height = -13
          Font.Name = 'Roboto Lt'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 38
        end
        object mAntes: TDBMemo
          AlignWithMargins = True
          Left = 4
          Top = 25
          Width = 488
          Height = 196
          Align = alClient
          DataField = 'ANTESORG'
          DataSource = dsAuditoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -15
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object PDepois: TPanel
        Left = 1
        Top = 185
        Width = 496
        Height = 225
        Align = alBottom
        Caption = 'PDepois'
        TabOrder = 1
        ExplicitTop = 182
        object Label6: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 488
          Height = 15
          Align = alTop
          Caption = 'Depois'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6579300
          Font.Height = -13
          Font.Name = 'Roboto Lt'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 46
        end
        object mDepois: TDBMemo
          AlignWithMargins = True
          Left = 4
          Top = 25
          Width = 488
          Height = 196
          Align = alClient
          DataField = 'DEPOISORG'
          DataSource = dsAuditoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -15
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 571
    Width = 1000
    ExplicitTop = 568
    ExplicitWidth = 996
  end
  inherited PBotoes: TPanel
    Top = 598
    Width = 1000
    ExplicitTop = 595
    ExplicitWidth = 996
    inherited BtnOK: TButton
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
  object pSearchBox: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 67
    Width = 998
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 994
    object PConsulta: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 6
      Width = 992
      Height = 71
      Margins.Top = 6
      Align = alClient
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 988
      object LblAcao: TLabel
        AlignWithMargins = True
        Left = 358
        Top = 10
        Width = 38
        Height = 18
        Alignment = taRightJustify
        Caption = 'A'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'Roboto Bk'
        Font.Style = []
        ParentFont = False
      end
      object LblEstacao: TLabel
        AlignWithMargins = True
        Left = 528
        Top = 10
        Width = 57
        Height = 18
        Margins.Left = 8
        Alignment = taRightJustify
        Caption = 'Esta'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'Roboto Bk'
        Font.Style = []
        ParentFont = False
      end
      object lblUsuario: TLabel
        AlignWithMargins = True
        Left = 718
        Top = 10
        Width = 55
        Height = 18
        Margins.Left = 8
        Alignment = taRightJustify
        Caption = 'Usu'#225'rio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'Roboto Bk'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        AlignWithMargins = True
        Left = 7
        Top = 39
        Width = 55
        Height = 18
        Margins.Left = 8
        Alignment = taRightJustify
        Caption = 'Per'#237'odo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'Roboto Bk'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 14
        Top = 10
        Width = 48
        Height = 18
        Alignment = taRightJustify
        Caption = 'Tabela:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'Roboto Bk'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 187
        Top = 39
        Width = 8
        Height = 18
        Margins.Left = 8
        Alignment = taRightJustify
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGrayText
        Font.Height = -15
        Font.Name = 'Roboto Bk'
        Font.Style = []
        ParentFont = False
      end
      object BtnConsultar: TButton
        AlignWithMargins = True
        Left = 319
        Top = 34
        Width = 30
        Height = 30
        Hint = 'Consultar'
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = BtnConsultarClick
      end
      object cbTabelaNome: TDBComboBox
        Left = 67
        Top = 8
        Width = 281
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'TABELA'
        DataSource = dsFDMemTConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        Items.Strings = (
          ''
          'Abastecimento'
          'Aditivos de Servi'#231'os Terceirizados Fora da Unidade'
          'Aditivos de Servi'#231'os Terceirizados na Unidade'
          'Almoxarifados'
          #193'reas'
          'Arquivos T'#233'cnicos de Equipamentos'
          'Arquivos T'#233'cnicos'
          'Atrelamento de Carregadeiras'
          'Aus'#234'ncia de M'#227'o de Obra'
          'Caixa de Ferramentas'
          'Calend'#225'rio de Equipamentos'
          'Calend'#225'rio de M'#227'o de Obra'
          'Cargos'
          'Causas de Falha'
          'C'#233'lulas'
          'Centros de Custos'
          'Classes de Equipamentos'
          'Combust'#237'vel'
          'Conserto de Pneus'
          'Contadores'
          'Contadores de Equipamentos'
          'Controle de Abastecimentos'
          'Dados da Fam'#237'lia de Equipamentos'
          'Dados da Fam'#237'lia de Equipamentos (N)'
          'Dados da Fam'#237'lia de Pe'#231'as de Reposi'#231#227'o'
          'Dados de Fam'#237'lia de Pneus'
          'Dados de Fam'#237'lia de Recursos'
          'Despesas Mensais da Manuten'#231#227'o'
          'Disponibilidades'
          'Empresas'
          'Empr'#233'stimo de Arquivos T'#233'cnicos'
          'Empr'#233'stimo de Itens da Ferramentaria'
          'Entradas de M'#227'o de Obra na Ordem de Servi'#231'o'
          'Equipamentos'
          'Equipe de Ordem de Servi'#231'o'
          'Fabricantes'
          'Fam'#237'lia de Equipamentos'
          'Fam'#237'lia de Pe'#231'as de Reposi'#231#227'o'
          'Fam'#237'lia de Pneus'
          'Fam'#237'lia de Recursos'
          'Feramentaria'
          'Feriados'
          'Formato de C'#243'digos'
          'Fornecedores'
          'Funcion'#225'rio de Ordem de Servi'#231'o'
          'Grupo Industrial'
          'Hora do Calend'#225'rio de Equipamentos'
          'Hora do Calend'#225'rio de M'#227'o de Obra'
          'Imagens'
          'Indicadores de Desempenho'
          'Informa'#231#245'es de Funcion'#225'rios'
          'Informa'#231#245'es Diversas'
          'Invent'#225'rio de Ferramentas'
          'Itens da Ferramentaria'
          'Itens da Lubrifica'#231#227'o Programada de Fam'#237'lia'
          'Itens da Manuten'#231#227'o Programada de Fam'#237'lia'
          'Itens da Manuten'#231#227'o Programada do Equipamento'
          'Itens Espec. da Manuten'#231#227'o Programada do Equipamento'
          'Kit de Pe'#231'as'
          'Kit de Pe'#231'as do Equipamento'
          'Kit de Recursos'
          'Linhas'
          'Locais de Pontos de Inspe'#231#227'o'
          'Lubrifica'#231#227'o'
          'Lubrifica'#231#227'o Programada de Fam'#237'lia'
          'Lubrifica'#231#227'o Programada do Equipamento'
          'Lubrificante'
          'Lubrificantes'
          'Lubrificantes da Ordem de Servi'#231'o'
          'Lubrificantes Utilizados na Ordem de Servi'#231'o'
          'Manuten'#231#227'o Programada de Fam'#237'lia'
          'Manuten'#231#227'o Programada do Equipamento'
          'M'#227'o de Obra'
          'M'#227'o de Obra de Ordem de Servi'#231'o'
          'M'#227'o de Obra Especializada'
          'M'#227'o de Obra Utilizada na Ordem de Servi'#231'o'
          'Materiais de Servi'#231'os Terceirizados na Unidade'
          'Medi'#231#245'es de Monitoramento de Condi'#231#245'es Operacionais'
          'Medi'#231#245'es de Servi'#231'os Terceirizados na Unidade'
          'Monitoramento de Condi'#231#245'es Operacionais'
          'Montagem de Pneus'
          'Motivos de Paradas'
          'Motoristas'
          'Oficinas'
          'Or'#231'amento Complementar de Servi'#231'os Terc. Fora da Unidade'
          'Or'#231'amento Extra de Servi'#231'os Terceirizados Fora da Unidade'
          'Or'#231'amento Inicial de Servi'#231'os Terc. Fora da Unidade'
          'Ordem de Servi'#231'o'
          'Paralisa'#231#245'es da Ordem de Servi'#231'o'
          'Par'#226'metro de Arquivos T'#233'cnicos'
          'Partes da Lubrifica'#231#227'o Programada de Fam'#237'lia'
          'Partes da Manuten'#231#227'o Programada de Fam'#237'lia'
          'Pe'#231'as da Ordem de Servi'#231'o'
          'Pe'#231'as de Reposi'#231#227'o'
          'Pe'#231'as de Servi'#231'os Terceirizados na Unidade'
          'Pe'#231'as do Equipamento'
          'Pe'#231'as Utilizadas na Ordem de Servi'#231'o'
          'Per'#237'odo de Informa'#231#245'es de Funcion'#225'rios'
          'Per'#237'odo de Taxas'
          'Plano de Trabalho'
          'Planos de Trabalho da Lubrific. Progr. de Fam'#237'lia'
          'Planos de Trabalho da Manuten'#231#227'o Progr. de Fam'#237'lia'
          'Planos de Trabalho da Ordem de Servi'#231'o'
          'Planos de Trabalho Utilizados na Ordem de Servi'#231'o'
          'Pneus'
          'Pneus do Chassi'
          'Pneus Novos'
          'Pontos de Inspe'#231#227'o'
          'Pontos de Inspe'#231#227'o do Equipamento'
          'Posi'#231#227'o de Pneus'
          'Produ'#231#227'o Mensal'
          'Recursos'
          'Recursos de Servi'#231'os Terceirizados na Unidade'
          'Rotas de Equipamentos'
          'Rotas de Vi'#225'gens'
          'Sequ'#234'ncias de Rotas de Equipamentos'
          'Servi'#231'os Executados na Ordem de Servi'#231'o'
          'Servi'#231'os Solicitados na Ordem de Servi'#231'o'
          'Servi'#231'os Terceirizados Fora da Unidade'
          'Servi'#231'os Terceirizados na Unidade'
          'Solicita'#231#227'o de Trabalho'
          'Tarefas de Servi'#231'os Terceirizados na Unidade'
          'Tarefas Predecessoras de Servi'#231'os Terc. na Unidade'
          'Taxas'
          'Tipos de Manuten'#231#245'es'
          'Tipos de Programa'#231#227'o'
          'Usu'#225'rios'
          'Vi'#225'gens')
        ParentFont = False
        TabOrder = 0
      end
      object cbAcao: TDBComboBox
        Left = 401
        Top = 8
        Width = 115
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'ACAO'
        DataSource = dsFDMemTConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        Items.Strings = (
          ''
          'Inserir'
          'Alterar'
          'Excluir')
        ParentFont = False
        TabOrder = 1
      end
      object edtEstacao: TDBEdit
        Left = 590
        Top = 8
        Width = 115
        Height = 23
        DataField = 'ESTACAO'
        DataSource = dsFDMemTConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dedtDataCons1: TJvDBDateEdit
        Left = 67
        Top = 37
        Width = 112
        Height = 23
        DataField = 'DATA1'
        DataSource = dsFDMemTConsulta
        DefaultToday = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ShowNullDate = False
        TabOrder = 4
      end
      object dedtDataCons2: TJvDBDateEdit
        Left = 203
        Top = 37
        Width = 112
        Height = 23
        DataField = 'DATA2'
        DataSource = dsFDMemTConsulta
        DefaultToday = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ShowNullDate = False
        TabOrder = 5
      end
      object cbUsuario: TDBLookupComboBox
        Left = 776
        Top = 8
        Width = 145
        Height = 23
        DataField = 'CODUSUARIO'
        DataSource = dsFDMemTConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        KeyField = 'CODIGO'
        ListField = 'NOME'
        ListSource = DM.dsUsuariosAudit
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object FDConnSPMP3Audit: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evRowsetSize]
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 144
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnSPMP3Audit
    Left = 216
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\SPMP3\libmysql.dll'
    Left = 392
    Top = 16
  end
  object qryAuditoria: TFDQuery
    AfterScroll = qryAuditoriaAfterScroll
    OnCalcFields = qryAuditoriaCalcFields
    Connection = FDConnSPMP3Audit
    SQL.Strings = (
      'SELECT '
      '    `id`, '
      '    `id_registro`, '
      '    `id_empresa`, '
      '    `tabela`,'
      '    `acao`, '
      '    `estacao`, '
      '    `usuario`, '
      '    `data_hora`, '
      '    `antes`, '
      '    `depois` '
      'FROM `spmpma_spmp.backups`.`auditoria` '
      'ORDER BY `data_hora` DESC')
    Left = 514
    Top = 18
    object qryAuditoriaid: TFDAutoIncField
      Alignment = taCenter
      DisplayLabel = 'ID'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryAuditoriaid_registro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'id_registro'
      Origin = 'id_registro'
    end
    object qryAuditoriaid_empresa: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
      Size = 9
    end
    object qryAuditoriatabela: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tabela'
      FieldName = 'tabela'
      Origin = 'tabela'
      Visible = False
      Size = 40
    end
    object qryAuditoriaTABELANOME: TStringField
      FieldKind = fkCalculated
      FieldName = 'TABELANOME'
      Size = 200
      Calculated = True
    end
    object qryAuditoriaacao: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'A'#231#227'o'
      FieldName = 'acao'
      Origin = 'acao'
      Size = 10
    end
    object qryAuditoriaestacao: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'Esta'#231#227'o'
      FieldName = 'estacao'
      Origin = 'estacao'
      Size = 80
    end
    object qryAuditoriausuario: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 40
    end
    object qryAuditoriadata_hora: TDateTimeField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data/Hora'
      FieldName = 'data_hora'
      Origin = 'data_hora'
    end
    object qryAuditoriaantes: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Antes'
      FieldName = 'antes'
      Origin = 'antes'
      Size = 4000
    end
    object qryAuditoriadepois: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Depois'
      FieldName = 'depois'
      Origin = 'depois'
      Size = 4000
    end
    object qryAuditoriaANTESORG: TStringField
      FieldKind = fkCalculated
      FieldName = 'ANTESORG'
      Size = 4000
      Calculated = True
    end
    object qryAuditoriaDEPOISORG: TStringField
      FieldKind = fkCalculated
      FieldName = 'DEPOISORG'
      Size = 4000
      Calculated = True
    end
  end
  object dsAuditoria: TDataSource
    DataSet = qryAuditoria
    Left = 578
    Top = 18
  end
  object qryUsuarios: TFDQuery
    Connection = DM.FDConnSPMP3
    SQL.Strings = (
      'SELECT'
      '    `CODIGO`'
      '    , `CODEMPRESA`'
      '    , `MATRICULA`'
      '    , `NOME`'
      '    , `SENHA`'
      'FROM'
      '    `usuario`'
      'WHERE `CODEMPRESA` = :codempresa')
    Left = 676
    Top = 21
    ParamData = <
      item
        Name = 'CODEMPRESA'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryUsuariosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object qryUsuariosCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object qryUsuariosMATRICULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MATRICULA'
      Origin = 'MATRICULA'
      Size = 9
    end
    object qryUsuariosNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object qryUsuariosSENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 30
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 769
    Top = 432
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=ID'
      'id_registro=id_registro'
      'id_empresa=id_empresa'
      'tabela=TABELA'
      'acao=ACAO'
      'estacao=ESTACAO'
      'usuario=USUARIO'
      'data_hora=DATA_HORA'
      'antes=ANTES'
      'depois=DEPOIS'
      'TABELANOME=TABELANOME'
      'ANTESORG=ANTESORG'
      'DEPOISORG=DEPOISORG')
    DataSource = dsAuditoria
    BCDToCurrency = False
    Left = 769
    Top = 383
  end
  object frxReport1: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44263.566961446760000000
    ReportOptions.LastChange = 44627.525760312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure MasterData1OnBeforePrint_inherited(Sender: TfrxCompone' +
        'nt);'
      'begin'
      '  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 769
    Top = 335
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 430.866420000000000000
          Top = 18.897650000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'AUDITORIA')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 965.740570000000000000
          Top = 15.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Time: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 965.740570000000000000
          Top = 35.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = [ftTop]
        Height = 98.267780000000000000
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint_inherited'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object frxDBDataset1TABELA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 187.078850000000000000
          Width = 411.630143390000000000
          Height = 18.897637800000000000
          DataField = 'TABELANOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."TABELANOME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1ACAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 651.480768990000000000
          Width = 65.464916000000000000
          Height = 18.897637800000000000
          AutoWidth = True
          DataField = 'ACAO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ACAO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1ESTACAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 829.804255390000000000
          Width = 217.125554610000000000
          Height = 18.897637795275590000
          AutoWidth = True
          DataField = 'ESTACAO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ESTACAO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1USUARIO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 68.236654990000000000
          Top = 21.236240000000000000
          Width = 86.590790400000000000
          Height = 18.897637800000000000
          AutoWidth = True
          DataField = 'USUARIO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1DATA_HORA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 829.804255390000000000
          Top = 22.677180000000000000
          Width = 103.739654610000000000
          Height = 18.897637795275590000
          AutoWidth = True
          DataField = 'DATA_HORA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_HORA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1ANTES: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 62.692950000000000000
          Width = 519.685039370000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          DataField = 'ANTESORG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ANTESORG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 47.795263390000000000
          Width = 57.031576610000000000
          Height = 18.897637800000000000
          AutoWidth = True
          DataField = 'id_registro'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."id_registro"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 522.882190000000000000
          Top = 46.795300000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Depois:')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1DEPOIS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 522.882190000000000000
          Top = 62.692950000000000000
          Width = 519.685039370000000000
          Height = 22.677180000000000000
          StretchMode = smActualHeight
          DataField = 'DEPOISORG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DEPOISORG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 46.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Antes:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.440940000000000000
          Width = 41.574793390000000000
          Height = 18.897637795275590000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'ID:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 127.606333390000000000
          Width = 56.692835280000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Tabela:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 604.331060160000000000
          Width = 43.464549840000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'A'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 754.016038510000000000
          Width = 73.700775200000000000
          Height = 18.897637795275590000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Esta'#231#227'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.440940000000000000
          Top = 21.236240000000000000
          Width = 62.362175430000000000
          Height = 18.897637795275590000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Usu'#225'rio:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 754.015652850000000000
          Top = 22.677180000000000000
          Width = 73.701160860000000000
          Height = 18.897637795275590000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Data/Hora:')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 98.267780000000000000
        Visible = False
        Width = 1046.929810000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 340.157700000000000000
        Width = 1046.929810000000000000
        object Page: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 908.945425000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 989.606525000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'de')
          ParentFont = False
          VAlign = vaCenter
        end
        object TotalPages: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1011.567565000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object FDMemTConsulta: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 619
    Top = 243
    object FDMemTConsultaTABELA: TStringField
      FieldName = 'TABELA'
      Size = 200
    end
    object FDMemTConsultaACAO: TStringField
      FieldName = 'ACAO'
      Size = 10
    end
    object FDMemTConsultaESTACAO: TStringField
      FieldName = 'ESTACAO'
      Size = 80
    end
    object FDMemTConsultaCODUSUARIO: TStringField
      FieldName = 'CODUSUARIO'
      Size = 9
    end
    object FDMemTConsultaLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 100
    end
    object FDMemTConsultaDATA1: TDateTimeField
      FieldName = 'DATA1'
    end
    object FDMemTConsultaDATA2: TDateTimeField
      FieldName = 'DATA2'
    end
  end
  object dsFDMemTConsulta: TDataSource
    DataSet = FDMemTConsulta
    Left = 619
    Top = 291
  end
end

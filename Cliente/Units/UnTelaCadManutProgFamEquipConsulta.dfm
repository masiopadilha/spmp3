inherited FrmTelaCadManutProgFamEquipConsulta: TFrmTelaCadManutProgFamEquipConsulta
  Caption = 'Consulta das Manuten'#231#245'es'
  ClientHeight = 641
  ClientWidth = 1008
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 995
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1004
    ExplicitWidth = 1004
    inherited BtnAjuda: TButton
      Left = 979
      ExplicitLeft = 975
    end
    object BtnConsultar: TButton
      Left = 942
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Exportar para planilha'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 102
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnConsultarClick
    end
  end
  inherited PCentro: TPanel
    Width = 1002
    Height = 502
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Top = 43
      Width = 1004
      Height = 461
      ExplicitTop = 43
      ExplicitWidth = 1000
      ExplicitHeight = 458
    end
    object PFiltros2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 39
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 994
      object Label6: TLabel
        Left = 7
        Top = 11
        Width = 101
        Height = 13
        Caption = 'Tipo de Manuten'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BtnTipoManutencao: TButton
        Left = 319
        Top = 7
        Width = 25
        Height = 25
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BtnTipoManutencaoClick
      end
      object EdtTipoManutencao: TEdit
        Left = 128
        Top = 9
        Width = 185
        Height = 21
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        StyleElements = [seFont, seClient]
        OnDblClick = EdtTipoManutencaoDblClick
      end
      object chkProgramada: TCheckBox
        Left = 352
        Top = 10
        Width = 104
        Height = 18
        Alignment = taLeftJustify
        Caption = 'Programadas:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = chkProgramadaClick
      end
      object chkAtivas: TCheckBox
        Left = 465
        Top = 10
        Width = 67
        Height = 18
        Alignment = taLeftJustify
        Caption = 'Ativas:'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 3
        OnClick = chkAtivasClick
      end
    end
    object DBGrid: TJvDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 46
      Width = 998
      Height = 455
      Align = alClient
      DataSource = DM.dsManutProgFamEquipCons
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyPress = DBGridKeyPress
      TitleButtons = True
      BevelInner = bvNone
      BevelOuter = bvNone
      AlternateRowColor = 16055512
      SortedField = 'CODIGO'
      TitleArrow = True
      SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODEQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Equip.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Caption = 'Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Width = 256
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CENTROCUSTO'
          Title.Caption = 'Centro de Custo'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOMANUTENCAO'
          Title.Caption = 'Tipo de Manuten'#231#227'o'
          Width = 121
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODMANUTENCAO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Manut.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANUTENCAO'
          Title.Caption = 'Manuten'#231#227'o'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS'
          Title.Alignment = taCenter
          Title.Caption = 'Dias (d)'
          Width = 48
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ATIVO'
          Title.Alignment = taCenter
          Title.Caption = 'Ativo'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PLANEJADA'
          Title.Alignment = taCenter
          Title.Caption = 'Programada'
          Width = 77
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODMANUTFAMILIA'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Manut. Fam.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCMANUTFAMILIA'
          Title.Caption = 'Manuten'#231#227'o de Fam'#237'lia'
          Width = 305
          Visible = True
        end>
    end
    object grid: TJvStringGrid
      Left = 886
      Top = 432
      Width = 116
      Height = 73
      FixedRows = 0
      TabOrder = 3
      Visible = False
      Alignment = taLeftJustify
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -12
      FixedFont.Name = 'Segoe UI'
      FixedFont.Style = []
      RowHeights = (
        24
        21
        24
        24
        24)
    end
  end
  inherited PAuxiliares: TPanel
    Top = 574
    Width = 1004
    ExplicitTop = 574
    ExplicitWidth = 1004
  end
  inherited PBotoes: TPanel
    Top = 601
    Width = 1004
    ExplicitTop = 601
    ExplicitWidth = 1004
    inherited BtnOK: TButton
      Left = 0
      Visible = False
      ExplicitLeft = 0
    end
    inherited BtnFechar: TButton
      Left = 467
      ExplicitLeft = 467
    end
  end
  object JvProgressDialog1: TJvProgressDialog
    Image.Data = {
      07544269746D61702C040000424D2C0400000000000000000000280000003100
      0000310000000100040002000000B6030000C40E0000C40E0000000000000000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF0031C00000300C0100000031C00000020C2C0000030C0000000AC00008C8FF
      77841FC00000020C0800024F06FF0004F778180000030C0000000AC0027F0CFF
      0004F77015C00000020C080012FF0004F7780E0000030C0000000AC016FF0006
      F0C778000BC00000020C0800027F14FF028804FF0280060000030C0000000CC0
      0004C87710FF02CF04FF027009C00000020C0E00000608887F0008FF0004F88F
      04FF0270060000030C00000010C0000AC788C0C8770004FF0004F87F04FF0270
      09C00000020C0E00028F04FF000C78800488748F04FF0280060000030C000000
      10C00AFF0008F788C08F04FF028009C00000020C0E000004FFF70CFF027F04FF
      080000030C0000000EC0000CC8FF70C0C87F0CFF0BC00000020C0C0000080FFF
      804004000004088706FF02F7080000030C0000000EC00008CFFF8F7808C00008
      C488FFF80BC00000020C0C00000C8FF78F78F7780600000608FFF00008000003
      0C0000000EC00004FFF004C8027F04FF000A7884C7FFF0000BC00000020C0C00
      0006FFF080000600000C87FFF70FFF70080000030C0000000CC0000CC8FF88F7
      C78008C00004CFFF0DC00000020C0A00000407FF048000087FFFF78804000004
      7FFF0A0000030C0000000CC00004CFFF06C00004C87F04FF000680FFF8000DC0
      0000020C0A0000088FF73F800600000A088708FFF8000A0000030C0000000CC0
      000C7FF8CF78FF7806C00006C8FFF0000DC00000020C0A00000A7FF000087700
      04FF000A78800FFF70000A0000030C0000000CC00004FFF008C0000C77FFF8CF
      FF800DC00000020C0A00000AFF74F7488000080000048FFF0C0000030C000000
      0AC00010C8FF80787FFFF78804C000047FFF0FC00000020C0800000608FF8000
      04000004887F04FF0006807FF8000C0000030C0000000AC00008C8FFC77006C0
      000AC88770FFF8000FC00000020C0800000C07FF0FF8F78808000004FFF00C00
      00030C0000000AC00004C8FF04C0027F04FF000A7784C8FFF0000FC00000020C
      0800000408FF0600000E08877FFF38FF70000C0000030C0000000AC00006C8FF
      78000AC004C80004FF700FC00000020C0A0006FF000477800600000608FF7000
      0C0000030C0000000CC0028F0AFF000A78C0C8FF80000FC00000020C0C00027F
      0CFF000A7FFF70788000080000030C00000012C002770CFF027004FF02F009C0
      0000020C14000004087F06FF0008F07FFFF0060000030C0000001AC0000EC487
      FFF8CFFF700009C00000020C1E00040802F7080000030C00000031C00000020C
      2C0000030C00000031C00000300C0100000031C000000001}
    ShowCancel = False
    ScreenPosition = poScreenCenter
    Left = 128
    Top = 184
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV (*.csv;*.txt)|*.csv;*.txt'
    InitialDir = 'C:\SPMP3\Planilhas'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 48
    Top = 184
  end
  object FDMemTManutencaoExcel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 675
    Top = 347
  end
  object DSManutencaoExcel: TDataSource
    DataSet = FDMemTManutencaoExcel
    Left = 755
    Top = 347
  end
end

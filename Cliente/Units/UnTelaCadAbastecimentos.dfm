inherited FrmTelaCadAbastecimentos: TFrmTelaCadAbastecimentos
  Caption = 'Controle de Abastecimentos'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LblDataCad: TDBText
      DataSource = DM.dsAbastecimentos
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsAbastecimentos
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsAbastecimentos
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsAbastecimentos
    end
  end
  inherited PIdentificacao: TPanel
    object Label5: TLabel
      Left = 45
      Top = 33
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label20: TLabel
      Left = 555
      Top = 34
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 639
      Top = 30
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object Label19: TLabel
      Left = 802
      Top = 34
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 67
      Top = 62
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Medidor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 377
      Top = 65
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 612
      Top = 65
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Contador:'
    end
    object Label12: TLabel
      Left = 829
      Top = 30
      Width = 35
      Height = 16
      Caption = 'Placa:'
    end
    object Label6: TLabel
      Left = 395
      Top = 62
      Width = 48
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tanque:'
    end
    object Label7: TLabel
      Left = 528
      Top = 63
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtCodEquipamento: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      DataSource = DM.dsAbastecimentos
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 254
      Top = 30
      Width = 270
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsAbastecimentos
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 525
      Top = 27
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnEquipamentoClick
    end
    object CBTipo: TDBComboBox
      Left = 673
      Top = 30
      Width = 125
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPO'
      DataSource = DM.dsAbastecimentos
      Items.Strings = (
        'Ve'#237'culo'
        'Equipamento')
      TabOrder = 3
      OnChange = CBTipoChange
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtMedidor: TDBEdit
      Left = 127
      Top = 60
      Width = 218
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CONTADOR'
      DataSource = DM.dsAbastecimentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnContador: TButton
      Left = 347
      Top = 58
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BtnContadorClick
    end
    object EdtValor: TDBEdit
      Left = 673
      Top = 63
      Width = 125
      Height = 24
      DataField = 'CONTADORATUAL'
      DataSource = DM.dsAbastecimentos
      MaxLength = 14
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPlaca: TDBEdit
      Left = 868
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'PLACA'
      DataSource = DM.dsAbastecimentos
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBPeriodo: TComboBox
      Left = 868
      Top = 66
      Width = 125
      Height = 22
      Style = csOwnerDrawFixed
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 3
      MaxLength = 14
      ParentFont = False
      TabOrder = 9
      Text = #218'ltimos 30 dias'
      OnChange = CBPeriodoChange
      Items.Strings = (
        'Hoje'
        #218'ltimos 07 dias'
        #218'ltimos 15 dias'
        #218'ltimos 30 dias'
        #218'ltimos 60 dias'
        #218'ltimos 90 dias'
        #218'ltimos 180 dias'
        #218'ltimos 270 dias'
        #218'ltimos 365 dias')
    end
    object EdtTanque: TDBEdit
      Left = 448
      Top = 60
      Width = 76
      Height = 24
      DataField = 'VOLUMETANQUE'
      DataSource = DM.dsAbastecimentos
      MaxLength = 14
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PProgramacao: TPanel
    Height = 194
    ExplicitHeight = 194
    inherited Label2: TLabel
      Width = 153
      Caption = 'ABASTECIMENTOS'
      ExplicitWidth = 153
    end
    object GrdAbastCombust: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 25
      Width = 996
      Height = 165
      Margins.Top = 24
      Align = alClient
      Color = 14671839
      DataSource = DM.dsAbastecimentosCombustTodos
      DrawingStyle = gdsClassic
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = GrdAbastCombustDrawColumnCell
      OnKeyDown = GrdAbastCombustKeyDown
    end
  end
  inherited PDiversos: TPanel
    Top = 349
    Height = 193
    ExplicitTop = 349
    ExplicitHeight = 193
    inherited Label3: TLabel
      Width = 133
      Caption = 'LUBRIFICA'#199#213'ES'
      ExplicitWidth = 133
    end
    object GrdAbastLubrific: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 25
      Width = 996
      Height = 164
      Margins.Top = 24
      Align = alClient
      Color = 14671839
      DataSource = DM.dsAbastecimentosLubrificTodos
      DrawingStyle = gdsClassic
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = GrdAbastLubrificDrawColumnCell
      OnKeyDown = FormKeyDown
    end
  end
  inherited PBase: TPanel
    inherited Button1: TButton
      Hint = 'Abastecimentos'
      DisabledImageIndex = 110
      ImageIndex = 110
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Hint = 'Lubrifica'#231#245'es'
      DisabledImageIndex = 111
      ImageIndex = 111
      OnClick = Button2Click
    end
    inherited Button3: TButton
      Hint = 'Troca de medidor'
      DisabledImageIndex = 112
      ImageIndex = 112
      OnClick = Button3Click
    end
    inherited Button4: TButton
      Hint = 'Viagens'
      DisabledImageIndex = 119
      ImageIndex = 119
      OnClick = Button4Click
    end
    inherited Button5: TButton
      Visible = False
    end
    inherited Button6: TButton
      Visible = False
    end
  end
  object StringGrid1: TStringGrid [7]
    Left = 909
    Top = 172
    Width = 86
    Height = 56
    DefaultColWidth = 200
    DrawingStyle = gdsClassic
    FixedCols = 0
    FixedRows = 0
    TabOrder = 7
    Visible = False
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 140
    Top = 40
  end
  inherited ActionList1: TActionList
    Left = 442
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.XLSX'
    Filter = 'Arquivo do Excel(*.XLSX)|*.XLSX|Arquivo do Excel(*.XLS)|*.XLS'
    Left = 232
    Top = 40
  end
  object PopupMenuCons: TPopupMenu
    Left = 178
    Top = 51
    object Descricao1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Descricao1Click
    end
    object aaaaaa1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = aaaaaa1Click
    end
  end
  object PopupMenuConsEquip: TPopupMenu
    Left = 418
    Top = 67
    object MenuItem1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = MenuItem2Click
    end
  end
end

inherited FrmTelaCadPneusChassi: TFrmTelaCadPneusChassi
  Caption = 'Montagem de Chassi'
  ClientHeight = 621
  ClientWidth = 1008
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1004
    ExplicitWidth = 1008
    inherited LCadastro: TLabel
      ExplicitLeft = 467
    end
    inherited LCadastroPor: TLabel
      ExplicitLeft = 431
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsPneusChassi
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsPneusChassi
    end
    inherited LAlteracao: TLabel
      ExplicitLeft = 626
    end
    inherited LAlteradoPor: TLabel
      ExplicitLeft = 610
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsPneusChassi
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsPneusChassi
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1004
    object Label5: TLabel
      Left = 45
      Top = 33
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label20: TLabel
      Left = 517
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
    object Label6: TLabel
      Left = 92
      Top = 62
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object Label4: TLabel
      Left = 588
      Top = 62
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'Chassi:'
    end
    object Label8: TLabel
      Left = 313
      Top = 62
      Width = 41
      Height = 16
      Alignment = taRightJustify
      Caption = 'Status:'
    end
    object Label7: TLabel
      Left = 570
      Top = 33
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Od'#244'metro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 992
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
    object Label10: TLabel
      Left = 255
      Top = 62
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
      Left = 763
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
    object Label12: TLabel
      Left = 827
      Top = 33
      Width = 35
      Height = 16
      Caption = 'Placa:'
    end
    object EdtCodEquipamento: TDBEdit
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      DataSource = DM.dsPneusChassi
      ReadOnly = True
      TabOrder = 0
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsPneusChassi
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 486
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
      Left = 127
      Top = 61
      Width = 125
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPO'
      DataSource = DM.dsPneusChassi
      Items.Strings = (
        'Equipamento'
        'Ve'#237'culo')
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBStatus: TDBComboBox
      Left = 359
      Top = 61
      Width = 125
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'STATUS'
      DataSource = DM.dsPneusChassi
      Items.Strings = (
        'ATIVO'
        'PARADO')
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtContador: TDBEdit
      Left = 634
      Top = 30
      Width = 125
      Height = 21
      DataField = 'CONTADOR'
      DataSource = DM.dsPneusChassi
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtChassi: TDBEdit
      Left = 634
      Top = 61
      Width = 324
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CHASSI'
      DataSource = DM.dsPneusChassi
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 7
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnChassi: TButton
      Left = 961
      Top = 58
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BtnChassiClick
    end
    object EdtPlaca: TDBEdit
      Left = 866
      Top = 30
      Width = 123
      Height = 24
      CharCase = ecUpperCase
      DataField = 'PLACA'
      DataSource = DM.dsPneusChassi
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PProgramacao: TPanel
    Width = 1004
    inherited Label2: TLabel
      Width = 62
      Caption = 'CHASSI'
      ExplicitWidth = 62
    end
    object ImgChassi: TImage
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 1000
      Height = 165
      Margins.Top = 20
      Align = alClient
      ExplicitTop = 144
      ExplicitWidth = 772
      ExplicitHeight = 3
    end
    object BtnPneu: TSpeedButton
      Left = 453
      Top = 80
      Width = 23
      Height = 18
      Hint = 'Hist'#243'rico'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = BtnPneuClick
    end
  end
  inherited PDiversos: TPanel
    Width = 1004
    Height = 197
    inherited Label3: TLabel
      Width = 55
      Caption = 'PNEUS'
      ExplicitWidth = 55
    end
    object GrdPneus: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 1000
      Height = 175
      Hint = 'Tecle ENTER nas colunas em negrito para as op'#231#245'es de cadastro.'
      Margins.Top = 20
      Align = alClient
      Color = clWhite
      DataSource = DM.dsPneusChassiPosicoes
      DrawingStyle = gdsGradient
      FixedColor = clWhite
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = GrdPneusDrawColumnCell
      OnDblClick = GrdPneusDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = GrdPneusKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 602
    Width = 1008
  end
  inherited PAlertas: TPanel
    Top = 586
    Width = 1008
  end
  inherited PBase: TPanel
    Top = 546
    Width = 1004
    inherited Button1: TButton
      Hint = 'Atrelamento de Carrocerias'
      ImageIndex = 84
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Hint = 'Pneus'
      DisabledImageIndex = 81
      ImageIndex = 80
      OnClick = Button2Click
    end
    inherited Button3: TButton
      Hint = 'Hist'#243'rico'
      DisabledImageIndex = 57
      ImageIndex = 58
      OnClick = Button3Click
    end
  end
  object StringGrid1: TStringGrid [7]
    Left = 659
    Top = 169
    Width = 86
    Height = 56
    DefaultColWidth = 200
    DrawingStyle = gdsClassic
    FixedCols = 0
    FixedRows = 0
    TabOrder = 7
    Visible = False
  end
  inherited TimerAlertas: TTimer
    Left = 434
    Top = 65534
  end
  object PopupMenuID: TPopupMenu
    Left = 640
    Top = 376
    object Instalar1: TMenuItem
      Caption = 'Instalar'
      OnClick = Instalar1Click
    end
    object Remover1: TMenuItem
      Caption = 'Remover'
      object Desinstalar1: TMenuItem
        Caption = 'Desinstalar'
        OnClick = Desinstalar1Click
      end
      object Descartar1: TMenuItem
        Caption = 'Descartar'
        OnClick = Descartar1Click
      end
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      OnClick = Cancelar1Click
    end
  end
  object CDPneusCad: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 34
    Top = 418
    object CDPneusCadID: TIntegerField
      FieldName = 'ID'
    end
    object CDPneusCadSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 15
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.XLSX'
    Filter = 'Arquivo do Excel(*.XLS)|*.XLS|Arquivo do Excel(*.XLSX)|*.XLSX'
    Left = 616
    Top = 144
  end
  object PopupMenuCons: TPopupMenu
    Left = 410
    Top = 59
    object Codigo1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Codigo1Click
    end
    object Descricao1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = Descricao1Click
    end
  end
end

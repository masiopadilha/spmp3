inherited FrmTelaCadSolicitacaoTrab: TFrmTelaCadSolicitacaoTrab
  Caption = 'Solicita'#231#227'o de Trabalho'
  ClientHeight = 614
  ClientWidth = 1012
  OnShow = FormShow
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited LblDataCad: TDBText
      DataSource = DM.dsSolicitacaoTrab
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsSolicitacaoTrab
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsSolicitacaoTrab
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsSolicitacaoTrab
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    ExplicitWidth = 998
    object Label5: TLabel
      Left = 57
      Top = 32
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = 'Solicitante:'
    end
    object Label4: TLabel
      Left = 42
      Top = 62
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label6: TLabel
      Left = 616
      Top = 32
      Width = 108
      Height = 16
      Alignment = taRightJustify
      Caption = 'Ordem de Servi'#231'o:'
    end
    object Label7: TLabel
      Left = 670
      Top = 62
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
    end
    object LblCodOrdemServico: TDBText
      Left = 728
      Top = 32
      Width = 117
      Height = 13
      AutoSize = True
      DataField = 'CODORDEMSERVICO'
      DataSource = DM.dsSolicitacaoTrab
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 516
      Top = 37
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
    object Label14: TLabel
      Left = 516
      Top = 67
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
    object EdtCodSolicitante: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODSOLICITANTE'
      DataSource = DM.dsSolicitacaoTrab
      ReadOnly = True
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescSolicitante: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'SOLICITANTE'
      DataSource = DM.dsSolicitacaoTrab
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnSolicitante: TButton
      Left = 485
      Top = 29
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 2
      OnClick = BtnSolicitanteClick
    end
    object EdtCodEquipamento: TDBEdit
      Tag = 555
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      DataSource = DM.dsSolicitacaoTrab
      ReadOnly = True
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsSolicitacaoTrab
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 485
      Top = 59
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 5
      OnClick = BtnEquipamentoClick
    end
    object PSituacao: TPanel
      Left = 728
      Top = 60
      Width = 155
      Height = 25
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      StyleElements = []
    end
  end
  inherited PProgramacao: TPanel
    Width = 1008
    Height = 150
    ExplicitWidth = 998
    ExplicitHeight = 150
    inherited Label2: TLabel
      Width = 132
      Caption = 'PROGRAMA'#199#195'O'
      ExplicitWidth = 132
    end
    object Label8: TLabel
      Left = 55
      Top = 32
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'Solicita'#231#227'o:'
    end
    object Label11: TLabel
      Left = 654
      Top = 61
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Justificativa:'
    end
    object Label18: TLabel
      Left = 516
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
    object lblCaracteres: TLabel
      Left = 992
      Top = 131
      Width = 3
      Height = 13
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 661
      Top = 32
      Width = 63
      Height = 16
      Alignment = taRightJustify
      Caption = 'Prioridade:'
    end
    object Label19: TLabel
      Left = 889
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
    object EdtServico: TDBEdit
      Left = 127
      Top = 30
      Width = 386
      Height = 24
      DataField = 'DESCSERVICO'
      DataSource = DM.dsSolicitacaoTrab
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object MJustificativa: TDBMemo
      Left = 728
      Top = 59
      Width = 267
      Height = 71
      DataField = 'JUSTIFICATIVA'
      DataSource = DM.dsSolicitacaoTrab
      MaxLength = 250
      TabOrder = 3
      OnChange = MJustificativaChange
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 55
      Top = 60
      Width = 470
      Height = 84
      Caption = 'Sugest'#245'es:'
      TabOrder = 1
      object Label9: TLabel
        Left = 315
        Top = 24
        Width = 72
        Height = 16
        Alignment = taRightJustify
        Caption = 'Tempo (hs):'
      end
      object Label10: TLabel
        Left = 9
        Top = 54
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'Prazo (d):'
      end
      object Label12: TLabel
        Left = 197
        Top = 24
        Width = 32
        Height = 16
        Alignment = taRightJustify
        Caption = 'Hora:'
      end
      object Label13: TLabel
        Left = 165
        Top = 54
        Width = 64
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor (R$):'
      end
      object Label16: TLabel
        Left = 36
        Top = 24
        Width = 31
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EdtTempo: TDBEdit
        Left = 393
        Top = 22
        Width = 65
        Height = 24
        DataField = 'TEMPOESTIMADO'
        DataSource = DM.dsSolicitacaoTrab
        MaxLength = 9
        TabOrder = 2
        OnExit = TabNextTab1AfterTabChange
        OnKeyPress = FormKeyPress
        OnMouseMove = PIdentificacaoMouseMove
      end
      object EdtPrazo: TDBEdit
        Left = 73
        Top = 52
        Width = 78
        Height = 24
        DataField = 'PRAZOSOLIC'
        DataSource = DM.dsSolicitacaoTrab
        MaxLength = 9
        TabOrder = 3
        OnExit = TabNextTab1AfterTabChange
        OnKeyPress = FormKeyPress
        OnMouseMove = PIdentificacaoMouseMove
      end
      object EdtHorario: TJvDBMaskEdit
        Left = 235
        Top = 22
        Width = 65
        Height = 24
        DataField = 'HORARIOSOLIC'
        DataSource = DM.dsSolicitacaoTrab
        MaxLength = 8
        TabOrder = 1
        EditMask = '!90:00:00;1;_'
        OnExit = TabNextTab1AfterTabChange
        OnKeyPress = FormKeyPress
        OnMouseMove = PIdentificacaoMouseMove
      end
      object EdtValor: TDBEdit
        Left = 235
        Top = 52
        Width = 65
        Height = 24
        DataField = 'VALORPROG'
        DataSource = DM.dsSolicitacaoTrab
        MaxLength = 16
        TabOrder = 4
        OnExit = TabNextTab1AfterTabChange
        OnKeyPress = FormKeyPress
        OnMouseMove = PIdentificacaoMouseMove
      end
      object EdtAquisicao: TJvDBDateEdit
        Left = 73
        Top = 22
        Width = 106
        Height = 24
        DataField = 'DATASOLIC'
        DataSource = DM.dsSolicitacaoTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ButtonWidth = 27
        ParentFont = False
        ShowNullDate = False
        TabOrder = 0
        OnExit = TabNextTab1AfterTabChange
        OnKeyPress = FormKeyPress
      end
    end
    object CBPrioridade: TDBComboBox
      Left = 728
      Top = 30
      Width = 155
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'PRIORIDADEPARADA'
      DataSource = DM.dsSolicitacaoTrab
      Items.Strings = (
        'Emerg'#234'ncia'
        'At'#233' 12 hs'
        'At'#233' 72 hs'
        'At'#233' 1 Semana'
        'At'#233' 1 M'#234's'
        'Acima de um m'#234's')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited PDiversos: TPanel
    Top = 305
    Width = 1008
    Height = 230
    ExplicitTop = 305
    ExplicitWidth = 998
    ExplicitHeight = 210
    inherited Label3: TLabel
      Width = 75
      Caption = 'GR'#193'FICO'
      ExplicitWidth = 75
    end
    object Chart1: TChart
      AlignWithMargins = True
      Left = 5
      Top = 28
      Width = 998
      Height = 197
      Margins.Left = 4
      Margins.Top = 27
      Margins.Right = 4
      Margins.Bottom = 4
      AllowPanning = pmNone
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = 13224338
      Gradient.Visible = True
      LeftWall.Color = clYellow
      LeftWall.Pen.Color = 8421440
      Legend.Alignment = laTop
      Legend.Color = 8421440
      Legend.ColorWidth = 10
      Legend.Shadow.HorizSize = 1
      Legend.Shadow.VertSize = 1
      Legend.Symbol.Width = 10
      Legend.TopPos = 0
      MarginBottom = 1
      MarginLeft = 1
      MarginRight = 1
      Title.Text.Strings = (
        'Gr'#225'fico das Homens/Horas Programadas')
      Title.Visible = False
      Title.AdjustFrame = False
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Axis.SmallSpace = 1
      BottomAxis.GridCentered = True
      BottomAxis.Increment = 1.000000000000000000
      BottomAxis.Maximum = 31.000000000000000000
      BottomAxis.Minimum = 1.000000000000000000
      BottomAxis.StartPosition = 2.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.ExactDateTime = False
      LeftAxis.Grid.Color = -1
      LeftAxis.Grid.Style = psDashDotDot
      LeftAxis.Grid.SmallDots = True
      LeftAxis.GridCentered = True
      LeftAxis.LabelsMultiLine = True
      LeftAxis.Maximum = 872.500000000000000000
      LeftAxis.MinorTickCount = 0
      LeftAxis.MinorTickLength = 0
      LeftAxis.TickLength = 0
      LeftAxis.Title.Caption = 'H/H Dispon'#237'veis'
      View3D = False
      Zoom.Pen.Mode = pmNotXor
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 988
      ExplicitHeight = 177
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TBarSeries
        HoverElement = []
        BarBrush.Color = 8421440
        Marks.Visible = False
        SeriesColor = clBlue
        Title = 'Programado'
        TickLines.Color = clDefault
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series2: TBarSeries
        HoverElement = []
        Marks.Visible = False
        SeriesColor = clGreen
        Title = 'Execu'#231#227'o'
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 595
    Width = 1012
    ExplicitTop = 575
    ExplicitWidth = 1002
  end
  inherited PAlertas: TPanel
    Top = 579
    Width = 1012
    ExplicitTop = 559
    ExplicitWidth = 1002
  end
  inherited PBase: TPanel
    Top = 539
    Width = 1008
    ExplicitTop = 519
    ExplicitWidth = 998
  end
  inherited TimerAlertas: TTimer
    Left = 362
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 176
  end
  object PopupMenuCons: TPopupMenu
    Left = 386
    Top = 83
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

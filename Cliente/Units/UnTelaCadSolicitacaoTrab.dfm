inherited FrmTelaCadSolicitacaoTrab: TFrmTelaCadSolicitacaoTrab
  Caption = 'Solicita'#231#227'o de Trabalho'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
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
    Height = 128
    ExplicitHeight = 128
    inherited Label2: TLabel
      Width = 132
      Caption = 'PROGRAMA'#199#195'O'
      ExplicitWidth = 132
    end
    object Label8: TLabel
      Left = 74
      Top = 32
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Servi'#231'o:'
    end
    object Label9: TLabel
      Left = 49
      Top = 64
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tempo (hs):'
    end
    object Label10: TLabel
      Left = 63
      Top = 95
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Prazo (d):'
    end
    object Label11: TLabel
      Left = 654
      Top = 32
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Justificativa:'
    end
    object Label12: TLabel
      Left = 590
      Top = 64
      Width = 134
      Height = 16
      Alignment = taRightJustify
      Caption = 'Hor'#225'rio para execu'#231#227'o:'
    end
    object Label13: TLabel
      Left = 586
      Top = 95
      Width = 138
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor programado (R$):'
    end
    object Label18: TLabel
      Left = 485
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
      Width = 356
      Height = 24
      DataField = 'DESCSERVICO'
      DataSource = DM.dsSolicitacaoTrab
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtTempo: TDBEdit
      Left = 127
      Top = 61
      Width = 125
      Height = 24
      DataField = 'TEMPOESTIMADO'
      DataSource = DM.dsSolicitacaoTrab
      MaxLength = 9
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtPrazo: TDBEdit
      Left = 127
      Top = 92
      Width = 125
      Height = 24
      DataField = 'PRAZOSOLIC'
      DataSource = DM.dsSolicitacaoTrab
      MaxLength = 9
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtJustificativa: TDBEdit
      Left = 728
      Top = 30
      Width = 267
      Height = 24
      DataField = 'JUSTIFICATIVA'
      DataSource = DM.dsSolicitacaoTrab
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtHorario: TJvDBMaskEdit
      Left = 728
      Top = 61
      Width = 100
      Height = 24
      DataField = 'HORARIOSOLIC'
      DataSource = DM.dsSolicitacaoTrab
      MaxLength = 8
      TabOrder = 4
      EditMask = '!90:00:00;1;_'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtValor: TDBEdit
      Left = 728
      Top = 92
      Width = 100
      Height = 24
      DataField = 'VALORPROG'
      DataSource = DM.dsSolicitacaoTrab
      MaxLength = 16
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
  end
  inherited PDiversos: TPanel
    Top = 283
    Height = 259
    ExplicitTop = 283
    ExplicitHeight = 259
    inherited Label3: TLabel
      Width = 75
      Caption = 'GR'#193'FICO'
      ExplicitWidth = 75
    end
    object Chart1: TChart
      AlignWithMargins = True
      Left = 5
      Top = 28
      Width = 994
      Height = 226
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
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TBarSeries
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

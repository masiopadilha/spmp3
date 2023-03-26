inherited FrmTelaCadCalendarioOS: TFrmTelaCadCalendarioOS
  Caption = 'Calend'#225'rio de Ordem de Servi'#231'o'
  ClientHeight = 641
  ClientWidth = 1008
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 680
  PixelsPerInch = 96
  TextHeight = 16
  object LblDataConsulta: TLabel [0]
    Left = 344
    Top = 270
    Width = 91
    Height = 16
    Alignment = taCenter
    Caption = 'LblDataConsulta'
  end
  inherited PTop: TPanel
    Width = 1004
    ExplicitWidth = 1004
    object Label1: TLabel [1]
      Left = 128
      Top = 36
      Width = 79
      Height = 16
      Caption = 'M'#227'o de Obra:'
    end
    inherited BtnAjuda: TButton
      Left = 969
      ExplicitLeft = 969
    end
    object CBConsSimples: TComboBox
      Left = 212
      Top = 34
      Width = 108
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 1
      Text = 'Geral'
      OnChange = CBConsSimplesChange
      Items.Strings = (
        'Geral'
        'Mec'#226'nica'
        'El'#233'trica'
        'Civil'
        'Apoio T'#233'cnico'
        'Produtiva'
        'Administrativa'
        'Utilidades')
    end
    object BtnImprimir: TButton
      Left = 941
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnImprimirClick
    end
  end
  inherited PCentro: TPanel
    Width = 1002
    Height = 502
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Width = 1000
      Height = 321
      ExplicitWidth = 1000
      ExplicitHeight = 321
    end
    object Chart1: TChart
      AlignWithMargins = True
      Left = 4
      Top = 325
      Width = 994
      Height = 173
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
      MarginTop = 2
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
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TBarSeries
        BarBrush.Color = 8421440
        Marks.Font.Height = -8
        Marks.Frame.SmallSpace = 1
        Marks.BackColor = 16764622
        Marks.Callout.Distance = 2
        Marks.Callout.Length = 10
        Marks.Color = 16764622
        SeriesColor = clBlue
        Title = 'Programado'
        TickLines.Color = clDefault
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series2: TBarSeries
        Marks.Font.Height = -8
        Marks.BackColor = 13434828
        Marks.Callout.Length = 10
        Marks.Color = 13434828
        SeriesColor = clGreen
        Title = 'Execu'#231#227'o'
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
    object GBTotalHomemHora: TGroupBox
      AlignWithMargins = True
      Left = 1
      Top = 3
      Width = 1000
      Height = 319
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Total Homem/Hora Programada e em Execu'#231#227'o para:'
      TabOrder = 2
      object CalendarGrid: TStringGrid
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 990
        Height = 275
        Hint = 'Efetue duplo-clique na data para visualizar os servi'#231'os do dia.'
        Margins.Bottom = 21
        Align = alClient
        Color = clWhite
        ColCount = 7
        Ctl3D = True
        DefaultColWidth = 140
        DefaultRowHeight = 32
        DefaultDrawing = False
        FixedCols = 0
        RowCount = 8
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedHorzLine]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ScrollBars = ssNone
        ShowHint = True
        TabOrder = 0
        OnClick = CalendarGridClick
        OnDblClick = CalendarGridDblClick
        OnDrawCell = CalendarGridDrawCell
      end
      object PPeriodo: TPanel
        Left = 398
        Top = 299
        Width = 206
        Height = 18
        BevelOuter = bvNone
        Caption = 'm'#234's de ano'
        Color = 14671839
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object BtnAntMes: TButton
          Left = 0
          Top = 0
          Width = 18
          Height = 18
          Hint = 'M'#234's Anterior'
          Align = alLeft
          DisabledImageIndex = 11
          ImageAlignment = iaCenter
          ImageIndex = 11
          Images = DM.ImageListBotoes
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BtnAntMesClick
        end
        object BtnProxMes: TButton
          Left = 188
          Top = 0
          Width = 18
          Height = 18
          Hint = 'M'#234's Posterior'
          Align = alRight
          DisabledImageIndex = 12
          ImageAlignment = iaCenter
          ImageIndex = 12
          Images = DM.ImageListBotoes
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BtnProxMesClick
        end
      end
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
      Left = 316
      Visible = False
      ExplicitLeft = 316
    end
    inherited BtnFechar: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
end

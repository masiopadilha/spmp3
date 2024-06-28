inherited FrmTelaCadCalendarioOS: TFrmTelaCadCalendarioOS
  Caption = 'Calend'#225'rio de Ordem de Servi'#231'o'
  ClientHeight = 644
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 680
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
    Width = 1008
    ExplicitWidth = 1004
    object Label1: TLabel [1]
      Left = 128
      Top = 36
      Width = 79
      Height = 16
      Caption = 'M'#227'o de Obra:'
    end
    inherited BtnAjuda: TButton
      Left = 971
      ExplicitLeft = 967
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
      Left = 937
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
    Width = 1006
    Height = 505
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Width = 1004
      Height = 503
      ExplicitWidth = 1000
      ExplicitHeight = 323
    end
    object GBTotalHomemHora: TGroupBox
      AlignWithMargins = True
      Left = 1
      Top = 3
      Width = 1004
      Height = 501
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Caption = 'Total Homem/Hora Programada e em Execu'#231#227'o para:'
      TabOrder = 1
      ExplicitWidth = 1000
      ExplicitHeight = 321
      object CalendarGrid: TStringGrid
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 994
        Height = 278
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
        ExplicitWidth = 990
        ExplicitHeight = 277
      end
      object PPeriodo: TPanel
        Left = 398
        Top = 302
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
      object Chart1: TChart
        AlignWithMargins = True
        Left = 5
        Top = 323
        Width = 994
        Height = 173
        AllowPanning = pmNone
        Border.Color = 7766572
        Border.Width = 0
        Border.Fill.Gradient.EndColor = 7766572
        Border.Fill.Gradient.MidColor = 527860268
        Border.Fill.Gradient.StartColor = 7766572
        Border.Visible = True
        BorderRound = 15
        BottomWall.Pen.Visible = False
        BottomWall.Visible = False
        Gradient.Colors = <
          item
            Color = 7766572
          end
          item
            Color = 8754226
            Offset = 1.000000000000000000
          end
          item
            Color = 9412405
            Offset = 1.000000000000000000
          end>
        Gradient.EndColor = 9412405
        Gradient.MidColor = 8754226
        Gradient.StartColor = 7766572
        LeftWall.Visible = False
        Legend.Alignment = laTop
        Legend.Color = 15657170
        Legend.ColorWidth = 0
        Legend.Font.Color = clWhite
        Legend.Font.Name = 'Segoe UI'
        Legend.Font.Style = [fsBold]
        Legend.FontSeriesColor = True
        Legend.Frame.Color = 15657170
        Legend.RoundSize = 8
        Legend.Shadow.Visible = False
        Legend.ShapeStyle = fosRoundRectangle
        Legend.Symbol.Width = 0
        Legend.TextStyle = ltsXAndValue
        Legend.Title.Alignment = taCenter
        Legend.Title.Font.Color = 9875024
        Legend.Title.Font.Height = -13
        Legend.Title.Font.Name = 'Segoe UI Semibold'
        Legend.Title.Font.Style = []
        Legend.Title.Frame.Color = clWhite
        Legend.Title.Margins.Left = 8
        Legend.Title.Text.Strings = (
          'Execu'#231#227'o')
        Legend.Title.TextAlignment = taRightJustify
        Legend.TopPos = 0
        Legend.Visible = False
        MarginBottom = 0
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 5
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clGray
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'Programadas x Execu'#231#227'o (HH)')
        Title.VertMargin = 2
        BottomAxis.Axis.Color = 545292416
        BottomAxis.Axis.Style = psDash
        BottomAxis.Axis.Width = 1
        BottomAxis.Grid.Visible = False
        BottomAxis.LabelsFormat.Font.Color = 10724259
        BottomAxis.LabelsFormat.Font.Height = -13
        BottomAxis.LabelsFormat.Font.Name = 'Segoe UI'
        BottomAxis.LabelsFormat.Font.Style = [fsBold]
        BottomAxis.LabelsFormat.Frame.Visible = False
        Hover.Visible = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Axis.Color = clGray
        LeftAxis.Axis.Visible = False
        LeftAxis.AxisValuesFormat = '0'
        LeftAxis.Grid.Color = 2009120960
        LeftAxis.LabelsFormat.Font.Color = 8421440
        LeftAxis.LabelsFormat.Font.Name = 'Segoe UI'
        LeftAxis.LabelsFormat.Font.Style = [fsBold]
        LeftAxis.LabelsFormat.Frame.Color = clDefault
        LeftAxis.Maximum = 28.000000000000000000
        LeftAxis.TickLength = 5
        LeftAxis.Title.Caption = 'HH Dispon'#237'vel'
        LeftAxis.Title.Font.Color = 10724259
        LeftAxis.Title.Font.Height = -12
        LeftAxis.Title.Font.Name = 'Segoe UI'
        LeftAxis.Title.Font.Style = [fsBold]
        Panning.MouseWheel = pmwNone
        RightAxis.Title.Visible = False
        RightAxis.Visible = False
        Shadow.Visible = False
        TopAxis.Axis.Visible = False
        TopAxis.Title.Visible = False
        TopAxis.Visible = False
        View3D = False
        View3DWalls = False
        Zoom.Allow = False
        Align = alBottom
        BevelOuter = bvNone
        Color = 16249832
        TabOrder = 2
        ExplicitTop = 322
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          43
          15
          43)
        ColorPaletteIndex = 20
        object BarSeries1: TBarSeries
          HoverElement = []
          Legend.Visible = False
          BarPen.Color = clSilver
          Marks.Font.Color = clGray
          Marks.Font.Name = 'Segoe UI'
          Marks.Font.Style = [fsBold]
          Marks.Frame.Visible = False
          Marks.Shadow.Color = 12303291
          Marks.Shadow.HorizSize = 2
          Marks.Shadow.VertSize = 2
          Marks.Transparency = 1
          Marks.Transparent = True
          Marks.Margins.Left = 3
          Marks.Margins.Right = 3
          Marks.Margins.Bottom = 0
          Marks.Style = smsValue
          Marks.Arrow.Width = 0
          Marks.Arrow.Visible = False
          Marks.BackColor = 15461334
          Marks.Callout.Arrow.Width = 0
          Marks.Callout.Arrow.Visible = False
          Marks.Callout.Length = 8
          Marks.SoftClip = True
          Marks.Symbol.Shadow.Visible = False
          Marks.TextAlign = taLeftJustify
          Marks.Color = 15461334
          RoundSize = 5
          SeriesColor = 10384222
          ShowInLegend = False
          Title = 'Programadas'
          BarStyle = bsRoundRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            041E0000000000000000003C40FF01000000310000000000002440FF01000000
            320000000000002240FF01000000330000000000003740FF0100000034000000
            0000003240FF01000000350000000000002440FF01000000360000000000002C
            40FF01000000370000000000002240FF01000000380000000000002840FF0100
            0000390000000000001840FF0200000031300000000000001440FF0200000031
            310000000000001C40FF0200000031320000000000000000FF02000000313300
            00000000000000FF0200000031340000000000000000FF020000003135000000
            0000000000FF0200000031360000000000000000FF0200000031370000000000
            000000FF0200000031380000000000000000FF02000000313900000000000000
            00FF0200000032300000000000000000FF0200000032310000000000000000FF
            0200000032310000000000000000FF0200000032330000000000000000FF0200
            000032340000000000000000FF0200000032350000000000000000FF02000000
            32360000000000000000FF0200000032370000000000000000FF020000003238
            0000000000000000FF0200000032390000000000000000FF020000003330}
          Detail = {0000000000}
        end
        object Series1: TBarSeries
          HoverElement = []
          Legend.Visible = False
          BarPen.Color = clSilver
          Marks.Font.Color = clGray
          Marks.Font.Name = 'Segoe UI'
          Marks.Font.Style = [fsBold]
          Marks.Frame.Visible = False
          Marks.Shadow.Color = 12303291
          Marks.Shadow.HorizSize = 2
          Marks.Shadow.VertSize = 2
          Marks.Transparency = 1
          Marks.Transparent = True
          Marks.Margins.Left = 3
          Marks.Margins.Right = 3
          Marks.Margins.Bottom = 0
          Marks.TextAlignment = taRightJustify
          Marks.Style = smsValue
          Marks.Arrow.Width = 0
          Marks.Arrow.Visible = False
          Marks.BackColor = 15461334
          Marks.Callout.Arrow.Width = 0
          Marks.Callout.Arrow.Visible = False
          Marks.Callout.Length = 8
          Marks.SoftClip = True
          Marks.Symbol.Shadow.Visible = False
          Marks.TextAlign = taRightJustify
          Marks.Color = 15461334
          RoundSize = 5
          SeriesColor = 9875024
          ShowInLegend = False
          Title = 'Execu'#231#227'o'
          BarStyle = bsRoundRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            061E0000000000000000003C4000000020FF0100000031000000000000244000
            000020FF0100000032000000000000224000000020FF01000000330000000000
            00374000000020FF0100000034000000000000324000000020FF010000003500
            0000000000244000000020FF01000000360000000000002C4000000020FF0100
            000037000000000000224000000020FF01000000380000000000002840000000
            20FF0100000039000000000000184000000020FF020000003130000000000000
            144000000020FF0200000031310000000000001C4000000020FF020000003132
            00000000000000005E739E00FF02000000313300000000000000005E739E00FF
            02000000313400000000000000005E739E00FF02000000313500000000000000
            005E739E00FF02000000313600000000000000005E739E00FF02000000313700
            000000000000005E739E00FF02000000313800000000000000005E739E00FF02
            000000313900000000000000005E739E00FF0200000032300000000000000000
            5E739E00FF02000000323100000000000000005E739E00FF0200000032310000
            0000000000005E739E00FF02000000323300000000000000005E739E00FF0200
            0000323400000000000000005E739E00FF02000000323500000000000000005E
            739E00FF02000000323600000000000000005E739E00FF020000003237000000
            00000000005E739E00FF02000000323800000000000000005E739E00FF020000
            00323900000000000000005E739E00FF020000003330}
        end
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 577
    Width = 1008
    ExplicitTop = 574
    ExplicitWidth = 1004
  end
  inherited PBotoes: TPanel
    Top = 604
    Width = 1008
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

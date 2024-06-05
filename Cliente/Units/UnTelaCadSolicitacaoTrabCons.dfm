inherited FrmTelaCadSolicitacaoTrabCons: TFrmTelaCadSolicitacaoTrabCons
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Caption = 'Consulta de Solicita'#231#227'o de Trabalho'
  ClientHeight = 644
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1004
    object Label3: TLabel [1]
      Left = 127
      Top = 35
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cadastro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [2]
      Left = 294
      Top = 35
      Width = 7
      Height = 16
      Caption = 'a'
    end
    inherited BtnAjuda: TButton
      Left = 969
      ExplicitLeft = 969
    end
    object EdtData1: TJvDateTimePicker
      Left = 185
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 1
      DropDownDate = 44778.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 306
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 2
      DropDownDate = 44771.000000000000000000
    end
    object BtnConsultar: TButton
      Left = 413
      Top = 27
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  inherited PCentro: TPanel
    Top = 108
    Width = 1006
    Height = 464
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Left = 707
      Width = 298
      Height = 246
      ExplicitLeft = 707
      ExplicitWidth = 294
      ExplicitHeight = 213
    end
    object DBGrid: TJvDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 250
      Width = 998
      Height = 210
      Align = alBottom
      DataSource = DM.dsAuxiliar
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridDrawColumnCell
      TitleButtons = True
      BevelInner = bvNone
      BevelOuter = bvNone
      AlternateRowColor = 15727296
      SortedField = 'CODIGO'
      TitleArrow = True
      SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
    end
    object Chart1: TChart
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 702
      Height = 242
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      AllowPanning = pmNone
      BottomWall.Pen.Visible = False
      BottomWall.Visible = False
      LeftWall.Visible = False
      Legend.Alignment = laTop
      Legend.Color = 16513523
      Legend.ColorWidth = 30
      Legend.Font.Color = 8421440
      Legend.Font.Height = -13
      Legend.Font.Name = 'Segoe UI'
      Legend.Font.Style = [fsBold]
      Legend.Frame.Color = clGray
      Legend.Frame.Visible = False
      Legend.Shadow.Visible = False
      Legend.Symbol.Height = 90
      Legend.Symbol.Width = 30
      MarginBottom = 3
      MarginLeft = 0
      MarginRight = 0
      MarginTop = 3
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Name = 'Segoe UI'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      BottomAxis.Axis.Visible = False
      BottomAxis.Grid.Visible = False
      BottomAxis.LabelsFormat.Font.Color = clGray
      BottomAxis.LabelsFormat.Font.Height = -13
      BottomAxis.LabelsFormat.Font.Name = 'Segoe UI'
      BottomAxis.LabelsFormat.Font.Style = [fsBold]
      BottomAxis.LabelsFormat.Frame.Visible = False
      Hover.Visible = False
      LeftAxis.Axis.Color = clGray
      LeftAxis.AxisValuesFormat = '0'
      LeftAxis.Grid.Visible = False
      LeftAxis.LabelsFormat.Font.Color = 8421440
      LeftAxis.LabelsFormat.Font.Name = 'Segoe UI'
      LeftAxis.LabelsFormat.Font.Style = [fsBold]
      LeftAxis.LabelsFormat.Frame.Color = clDefault
      LeftAxis.TickLength = 5
      LeftAxis.Title.Visible = False
      LeftAxis.Visible = False
      RightAxis.Title.Visible = False
      RightAxis.Visible = False
      Shadow.Visible = False
      TopAxis.Title.Visible = False
      TopAxis.Visible = False
      View3D = False
      View3DWalls = False
      Zoom.Allow = False
      Align = alLeft
      BevelOuter = bvNone
      Color = 16513523
      TabOrder = 2
      ExplicitHeight = 209
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        39
        15
        39)
      ColorPaletteIndex = 19
      object Series1: TBarSeries
        HoverElement = []
        BarPen.Color = clSilver
        Marks.Font.Name = 'Segoe UI'
        Marks.Font.Style = [fsBold]
        Marks.Frame.Visible = False
        Marks.Shadow.Color = 12303291
        Marks.Shadow.HorizSize = 2
        Marks.Shadow.VertSize = 2
        Marks.Margins.Left = 0
        Marks.Margins.Top = 15
        Marks.Margins.Right = 5
        Marks.Style = smsValue
        Marks.Arrow.Width = 0
        Marks.Arrow.Visible = False
        Marks.BackColor = 15461334
        Marks.Callout.Arrow.Width = 0
        Marks.Callout.Arrow.Visible = False
        Marks.Callout.Length = 10
        Marks.Symbol.Shadow.Visible = False
        Marks.Color = 15461334
        RoundSize = 5
        SeriesColor = clWhite
        Title = 'Solicitadas'
        BarStyle = bsRoundRectangle
        OffsetPercent = -10
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
        Data = {
          040C0000000000000000002840FF030000004A616E0000000000002440FF0300
          00004665760000000000002240FF030000004D61720000000000003740FF0300
          00004162720000000000003240FF030000004D61690000000000002440FF0300
          00004A756E0000000000002C40FF030000004A756C0000000000002240FF0300
          000041676F0000000000002840FF030000005365740000000000001840FF0300
          00004F75740000000000001440FF030000004E6F760000000000001C40FF0300
          000044657A}
        Detail = {0000000000}
      end
      object Series2: TBarSeries
        HoverElement = []
        Marks.Font.Name = 'Segoe UI'
        Marks.Font.Style = [fsBold]
        Marks.Frame.Visible = False
        Marks.Shadow.Color = 12303291
        Marks.Shadow.HorizSize = 2
        Marks.Shadow.VertSize = 2
        Marks.Margins.Left = 0
        Marks.Margins.Top = 15
        Marks.Margins.Right = 5
        Marks.Style = smsValue
        Marks.Arrow.Width = 0
        Marks.Arrow.Visible = False
        Marks.BackColor = 15461334
        Marks.Callout.Arrow.Width = 0
        Marks.Callout.Arrow.Visible = False
        Marks.Callout.Length = 10
        Marks.Symbol.Shadow.Visible = False
        Marks.Color = 15461334
        RoundSize = 5
        SeriesColor = clGray
        Title = 'Realizadas'
        BarStyle = bsRoundRectangle
        OffsetPercent = 10
        Sides = 28
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
        Data = {
          040C0000000000000000002240FF030000004A616E0000000000002040FF0300
          00004665760000000000001040FF030000004D61720000000000003540FF0300
          00004162720000000000002E40FF030000004D61690000000000001840FF0300
          00004A756E0000000000002440FF030000004A756C0000000000001840FF0300
          000041676F0000000000002040FF030000005365740000000000001840FF0300
          00004F75740000000000000840FF030000004E6F760000000000001440FF0300
          000044657A}
        Detail = {0000000000}
      end
    end
    object Chart2: TChart
      AlignWithMargins = True
      Left = 712
      Top = 8
      Width = 288
      Height = 237
      Margins.Left = 5
      Margins.Top = 7
      Margins.Right = 5
      Margins.Bottom = 2
      AllowPanning = pmNone
      BottomWall.Pen.Visible = False
      BottomWall.Visible = False
      LeftWall.Visible = False
      Legend.Alignment = laTop
      Legend.Color = 16513523
      Legend.ColorWidth = 30
      Legend.Font.Color = 8421440
      Legend.Font.Height = -13
      Legend.Font.Name = 'Segoe UI'
      Legend.Font.Style = [fsBold]
      Legend.Frame.Color = clGray
      Legend.Frame.Visible = False
      Legend.Shadow.Visible = False
      Legend.Symbol.Height = 90
      Legend.Symbol.Width = 30
      Legend.Visible = False
      MarginBottom = 3
      MarginLeft = 0
      MarginTop = 3
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Color = 8421440
      Title.Font.Height = -13
      Title.Font.Name = 'Segoe UI'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Situa'#231#227'o')
      BottomAxis.Axis.Visible = False
      BottomAxis.Grid.Visible = False
      BottomAxis.LabelsFormat.Font.Color = clGray
      BottomAxis.LabelsFormat.Font.Height = -13
      BottomAxis.LabelsFormat.Font.Name = 'Segoe UI'
      BottomAxis.LabelsFormat.Font.Style = [fsBold]
      BottomAxis.LabelsFormat.Frame.Visible = False
      BottomAxis.Visible = False
      Hover.Visible = False
      LeftAxis.Axis.Color = clGray
      LeftAxis.Axis.Width = 1
      LeftAxis.Axis.Visible = False
      LeftAxis.AxisValuesFormat = '0'
      LeftAxis.Grid.Visible = False
      LeftAxis.LabelsFormat.Font.Color = 8421440
      LeftAxis.LabelsFormat.Font.Name = 'Segoe UI'
      LeftAxis.LabelsFormat.Font.Style = [fsBold]
      LeftAxis.LabelsFormat.Frame.Color = clDefault
      LeftAxis.TickLength = 6
      LeftAxis.Title.Visible = False
      RightAxis.Title.Visible = False
      RightAxis.Visible = False
      Shadow.Visible = False
      TopAxis.Title.Visible = False
      TopAxis.Visible = False
      View3D = False
      View3DWalls = False
      Zoom.Allow = False
      Align = alClient
      BevelOuter = bvNone
      Color = 16513523
      TabOrder = 3
      ExplicitWidth = 284
      ExplicitHeight = 204
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        39
        15
        39)
      ColorPaletteIndex = 19
      object Series3: THorizBarSeries
        HoverElement = []
        Legend.Text = 'Situa'#231#227'o'
        Legend.Visible = False
        LegendTitle = 'Situa'#231#227'o'
        BarBrush.Gradient.Direction = gdLeftRight
        Marks.Font.Name = 'Segoe UI'
        Marks.Font.Style = [fsBold]
        Marks.Frame.Visible = False
        Marks.Shadow.Color = 12303291
        Marks.Shadow.HorizSize = 2
        Marks.Shadow.VertSize = 2
        Marks.Margins.Left = 0
        Marks.Margins.Top = 15
        Marks.Margins.Right = 5
        Marks.Style = smsValue
        Marks.Arrow.Visible = False
        Marks.BackColor = 15395798
        Marks.Callout.Arrow.Visible = False
        Marks.Callout.Length = 10
        Marks.Color = 15395798
        RoundSize = 5
        SeriesColor = clGray
        ShowInLegend = False
        Title = 'Status'
        BarStyle = bsRoundRectangle
        Gradient.Direction = gdLeftRight
        XValues.Name = 'Bar'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
        Data = {
          04060000000000000000000840FF0A000000534F4C4943495441444100000000
          00000040FF09000000444554414C484144410000000000000040FF0A00000050
          524F4752414D414441000000000000F03FFF080000004558454355C7C34F0000
          00000000F03FFF080000004C494245524144410000000000000040FF07000000
          46454348414441}
        Detail = {0000000000}
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
      Left = 425
      ExplicitLeft = 425
    end
    inherited BtnFechar: TButton
      Left = 508
      ExplicitLeft = 508
    end
  end
  object PFiltros2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 66
    Width = 1006
    Height = 39
    Margins.Top = 2
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    ExplicitLeft = 4
    ExplicitTop = 72
    ExplicitWidth = 996
    object Label6: TLabel
      Left = 7
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Solicitante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 393
      Top = 12
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Servi'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BtnSolicitante: TButton
      Left = 342
      Top = 8
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
      OnClick = BtnSolicitanteClick
    end
    object edtServico: TEdit
      Left = 437
      Top = 8
      Width = 530
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir o filtro.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
    end
    object EdtFamiliaEquip: TEdit
      Left = 143
      Top = 8
      Width = 195
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir o filtro.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      StyleElements = [seFont, seClient]
    end
    object Button1: TButton
      Left = 970
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object EdtMatricula: TEdit
      Left = 66
      Top = 8
      Width = 76
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
    end
  end
end

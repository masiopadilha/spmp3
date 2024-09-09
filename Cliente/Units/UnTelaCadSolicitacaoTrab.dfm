inherited FrmTelaCadSolicitacaoTrab: TFrmTelaCadSolicitacaoTrab
  Caption = 'Solicita'#231#227'o de Trabalho'
  OnShow = FormShow
  TextHeight = 16
  inherited PControle: TPanel
    ExplicitWidth = 1008
    inherited pAlteracao: TPanel
      inherited LblDataAlt: TDBText
        DataSource = DM.dsSolicitacaoTrab
        ExplicitLeft = 936
      end
      inherited LAlteradoPor: TLabel
        ExplicitLeft = 872
      end
      inherited LblDataCad: TDBText
        DataSource = DM.dsSolicitacaoTrab
        ExplicitLeft = 785
      end
    end
    inherited pCadastro: TPanel
      inherited LblUsuCad: TDBText
        DataSource = DM.dsSolicitacaoTrab
        ExplicitLeft = 785
      end
      inherited LAlteracao: TLabel
        ExplicitLeft = 898
      end
      inherited LblUsuAlt: TDBText
        DataSource = DM.dsSolicitacaoTrab
        ExplicitLeft = 936
      end
    end
  end
  inherited PIdentificacao: TPanel
    ExplicitWidth = 1008
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
      Left = 519
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
      Left = 519
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
      StyleElements = [seFont, seClient]
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
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnSolicitante: TButton
      Left = 488
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
      StyleElements = [seFont, seClient]
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
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 488
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
    Height = 186
    ExplicitWidth = 1008
    ExplicitHeight = 186
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
      Left = 517
      Top = 115
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Justificativa:'
    end
    object Label18: TLabel
      Left = 490
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
      Left = 879
      Top = 163
      Width = 121
      Height = 13
      Alignment = taRightJustify
      Caption = '200 caracteres restantes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 59
      Top = 66
      Width = 63
      Height = 16
      Alignment = taRightJustify
      Caption = 'Prioridade:'
    end
    object Label19: TLabel
      Left = 297
      Top = 71
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
    object Label20: TLabel
      Left = 80
      Top = 138
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'Oficina:'
    end
    object Label28: TLabel
      Left = 330
      Top = 140
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
    object Label21: TLabel
      Left = 26
      Top = 102
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object EdtServico: TDBEdit
      Left = 127
      Top = 30
      Width = 357
      Height = 24
      DataField = 'DESCSERVICO'
      DataSource = DM.dsSolicitacaoTrab
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object MJustificativa: TDBMemo
      Left = 591
      Top = 115
      Width = 409
      Height = 45
      DataField = 'JUSTIFICATIVA'
      DataSource = DM.dsSolicitacaoTrab
      MaxLength = 250
      TabOrder = 7
      OnChange = MJustificativaChange
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 517
      Top = 21
      Width = 483
      Height = 86
      Caption = 'Sugest'#245'es:'
      TabOrder = 6
      object Label9: TLabel
        Left = 323
        Top = 22
        Width = 72
        Height = 16
        Alignment = taRightJustify
        Caption = 'Tempo (hs):'
      end
      object Label10: TLabel
        Left = 10
        Top = 49
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'Prazo (d):'
      end
      object Label12: TLabel
        Left = 195
        Top = 22
        Width = 32
        Height = 16
        Alignment = taRightJustify
        Caption = 'Hora:'
      end
      object Label13: TLabel
        Left = 163
        Top = 49
        Width = 64
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor (R$):'
      end
      object Label16: TLabel
        Left = 37
        Top = 22
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
        Left = 401
        Top = 20
        Width = 67
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
        Left = 74
        Top = 47
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
        Left = 233
        Top = 20
        Width = 77
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
        Left = 233
        Top = 47
        Width = 77
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
        Left = 74
        Top = 20
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
      Left = 127
      Top = 65
      Width = 165
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
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtOficina: TDBEdit
      Left = 127
      Top = 136
      Width = 165
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'OFICINA'
      DataSource = DM.dsSolicitacaoTrab
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnOficina: TButton
      Left = 297
      Top = 134
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnOficinaClick
    end
    object EdtCentroCusto: TDBEdit
      Left = 128
      Top = 100
      Width = 165
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsSolicitacaoTrab
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCentroCusto: TButton
      Left = 297
      Top = 98
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnCentroCustoClick
    end
  end
  inherited PDiversos: TPanel
    Top = 341
    Height = 204
    ExplicitTop = 341
    ExplicitWidth = 1008
    ExplicitHeight = 215
    inherited Label3: TLabel
      Width = 75
      Caption = 'GR'#193'FICO'
      ExplicitWidth = 75
    end
    object Chart1: TChart
      AlignWithMargins = True
      Left = 4
      Top = 20
      Width = 1000
      Height = 191
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
      TabOrder = 0
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
  inherited StatusBar1: TStatusBar
    Top = 547
    ExplicitTop = 560
    ExplicitWidth = 1012
  end
  inherited PAlertas: TPanel
    ExplicitTop = 563
    ExplicitWidth = 1012
  end
  inherited PBase: TPanel
    Top = 568
    ExplicitTop = 581
    ExplicitWidth = 1008
  end
  inherited MainMenuPadrao: TMainMenu
    Top = 31
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 208
    object Matricula1: TMenuItem
      Caption = 'Matr'#237'cula'
      OnClick = Matricula1Click
    end
  end
  inherited ActionList1: TActionList
    Top = 31
  end
  object PopupMenuCons: TPopupMenu
    Left = 162
    Top = 48
    object MenuItem1: TMenuItem
      Caption = 'Ordem de Servi'#231'o'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Matr'#237'cula'
      OnClick = MenuItem2Click
    end
  end
end

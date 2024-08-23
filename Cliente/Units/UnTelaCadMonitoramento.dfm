inherited FrmTelaCadMonitoramento: TFrmTelaCadMonitoramento
  Caption = 'Monitoramento'
  ClientHeight = 619
  ClientWidth = 1012
  KeyPreview = False
  OnShow = FormShow
  TextHeight = 16
  object Label9: TLabel [0]
    Left = 33
    Top = 59
    Width = 46
    Height = 16
    Alignment = taRightJustify
    Caption = 'Fam'#237'lia:'
  end
  inherited PControle: TPanel
    Width = 1008
    inherited pAlteracao: TPanel
      ExplicitLeft = 652
      inherited LCadastro: TLabel
        Height = 14
      end
      inherited LblDataAlt: TDBText
        DataSource = DM.dsMonitoramento
      end
      inherited LblDataCad: TDBText
        DataSource = DM.dsMonitoramento
      end
    end
    inherited pCadastro: TPanel
      ExplicitLeft = 652
      inherited LCadastroPor: TLabel
        Height = 14
      end
      inherited LblUsuCad: TDBText
        DataSource = DM.dsMonitoramento
      end
      inherited LblUsuAlt: TDBText
        DataSource = DM.dsMonitoramento
      end
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    Height = 119
    ExplicitWidth = 1008
    ExplicitHeight = 119
    object Label4: TLabel
      Left = 62
      Top = 59
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 494
      Top = 59
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
      Left = 92
      Top = 33
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 278
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
      Left = 517
      Top = 33
      Width = 87
      Height = 16
      Alignment = taRightJustify
      Caption = 'Ponto de Insp.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 781
      Top = 33
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '**'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 808
      Top = 33
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 872
      Top = 59
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '**'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 546
      Top = 59
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Contador:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 522
      Top = 86
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Programa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblProgramacao: TDBText
      Left = 608
      Top = 86
      Width = 104
      Height = 16
      AutoSize = True
      DataField = 'PROGRAMACAO'
      DataSource = DM.dsMonitoramento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 13
      Top = 87
      Width = 109
      Height = 16
      Alignment = taRightJustify
      Caption = 'Plano de Trabalho:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtDescricao: TDBEdit
      Left = 127
      Top = 56
      Width = 362
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsMonitoramento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBTipo: TDBComboBox
      Left = 127
      Top = 30
      Width = 147
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPOPONTO'
      DataSource = DM.dsMonitoramento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Ponto de Inspe'#231#227'o'
        'Contador')
      ParentFont = False
      TabOrder = 0
      OnChange = CBTipoChange
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtDescPonto: TDBEdit
      Left = 608
      Top = 30
      Width = 140
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'PONTOINSPECAO'
      DataSource = DM.dsMonitoramento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnPonto: TButton
      Left = 750
      Top = 28
      Width = 28
      Height = 28
      DisabledImageIndex = 7
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 3
      OnClick = BtnPontoClick
    end
    object EdtDescLocal: TDBEdit
      Left = 840
      Top = 30
      Width = 130
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'PONTOINSPLOC'
      DataSource = DM.dsMonitoramento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnPontoLocal: TButton
      Left = 972
      Top = 28
      Width = 28
      Height = 28
      DisabledImageIndex = 7
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 5
      OnClick = BtnPontoLocalClick
    end
    object BtnContador: TButton
      Left = 840
      Top = 54
      Width = 28
      Height = 28
      DisabledImageIndex = 7
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 7
      OnClick = BtnContadorClick
    end
    object EdtDescContador: TDBEdit
      Left = 608
      Top = 56
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CONTADOR'
      DataSource = DM.dsMonitoramento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object edtPlanoTrab: TDBEdit
      Left = 127
      Top = 84
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'PLANOTRABALHO'
      DataSource = DM.dsMonitoramento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      OnDblClick = edtPlanoTrabDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnPlanoTrab: TButton
      Left = 359
      Top = 82
      Width = 28
      Height = 28
      DisabledImageIndex = 7
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 9
      OnClick = BtnPlanoTrabClick
    end
  end
  inherited PProgramacao: TPanel
    Top = 174
    Width = 1008
    Height = 212
    ExplicitTop = 174
    ExplicitWidth = 1008
    ExplicitHeight = 212
    inherited Label2: TLabel
      Width = 86
      Caption = 'MEDI'#199#213'ES'
      ExplicitWidth = 86
    end
    object Label21: TLabel
      Left = 477
      Top = 8
      Width = 78
      Height = 16
      Alignment = taRightJustify
      Caption = 'Inferior M'#225'x.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 477
      Top = 60
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Inferior:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 477
      Top = 112
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Superior:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 477
      Top = 164
      Width = 85
      Height = 16
      Alignment = taRightJustify
      Caption = 'Superior M'#225'x.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 568
      Top = 5
      Width = 435
      Height = 202
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Color = clBtnFace
      DataSource = DM.dsMonitMedicoesPtosInsp
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdCadastroDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyDown = GrdCadastroKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'DATAMEDICAO'
          Title.Alignment = taCenter
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDICAO'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OSGERADA'
          Title.Alignment = taCenter
          Title.Caption = 'O.S.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FUNCIONARIO'
          Width = 141
          Visible = True
        end>
    end
    object EdtLimInfMax: TEdit
      Left = 477
      Top = 30
      Width = 65
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      StyleElements = [seBorder]
    end
    object EdtLimInf: TEdit
      Left = 477
      Top = 81
      Width = 65
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      StyleElements = [seBorder]
    end
    object EdtLimSup: TEdit
      Left = 477
      Top = 132
      Width = 65
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seBorder]
    end
    object EdtLimSupMax: TEdit
      Left = 477
      Top = 183
      Width = 65
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seBorder]
    end
    object GridEquipamentos: TDBGrid
      Left = 7
      Top = 29
      Width = 460
      Height = 178
      Color = clBtnFace
      DataSource = DM.dsMonitEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      StyleElements = [seFont, seBorder]
      OnKeyPress = GridEquipamentosKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 341
          Visible = True
        end>
    end
  end
  inherited PDiversos: TPanel
    Top = 390
    Width = 1008
    Height = 166
    ExplicitTop = 371
    ExplicitWidth = 1008
    ExplicitHeight = 185
    inherited Label3: TLabel
      Width = 75
      Caption = 'GR'#193'FICO'
      ExplicitWidth = 75
    end
    object Chart: TChart
      AlignWithMargins = True
      Left = 4
      Top = 26
      Width = 1000
      Height = 136
      Margins.Top = 25
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
      MarginTop = 18
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Color = clGray
      Title.Font.Height = -15
      Title.Font.Name = 'Segoe UI'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
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
      LeftAxis.Title.Visible = False
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
      Align = alClient
      BevelOuter = bvNone
      Color = 16249832
      TabOrder = 0
      ExplicitTop = 29
      ExplicitHeight = 160
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        43
        15
        43)
      ColorPaletteIndex = 20
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
        Data = {0000000000}
        Detail = {0000000000}
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 600
    Width = 1012
    ExplicitTop = 589
    ExplicitWidth = 1006
  end
  inherited PAlertas: TPanel
    Top = 558
    Width = 1012
    ExplicitTop = 547
    ExplicitWidth = 1006
  end
  inherited PBase: TPanel
    Top = 560
    Width = 1008
    ExplicitTop = 549
    ExplicitWidth = 1002
    inherited Button1: TButton
      Hint = 'Cadastrar leituras'
      DisabledImageIndex = 97
      ImageIndex = 96
      OnClick = Button1Click
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 336
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 212
    Top = 16
  end
  inherited ActionList1: TActionList
    Top = 11
  end
end

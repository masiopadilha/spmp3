inherited FrmTelaCadMonitoramento: TFrmTelaCadMonitoramento
  Caption = 'Monitoramento'
  PixelsPerInch = 96
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
    inherited LblDataCad: TDBText
      DataSource = DM.dsMonitoramento
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsMonitoramento
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsMonitoramento
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsMonitoramento
    end
  end
  inherited PIdentificacao: TPanel
    Height = 129
    ExplicitHeight = 129
    object Label4: TLabel
      Left = 62
      Top = 62
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
      Top = 62
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
      Top = 62
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
      Top = 93
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
      Top = 93
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
      Top = 94
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
      Top = 59
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
      Top = 57
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
      Top = 59
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
      Top = 91
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
      Top = 89
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
    Top = 184
    Height = 160
    ExplicitTop = 184
    ExplicitHeight = 160
    inherited Label2: TLabel
      Width = 86
      Caption = 'MEDI'#199#213'ES'
      ExplicitWidth = 86
    end
    object Label7: TLabel
      Left = 45
      Top = 32
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label20: TLabel
      Left = 48
      Top = 66
      Width = 50
      Height = 16
      Caption = 'Limites:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 56
      Top = 86
      Width = 95
      Height = 16
      Alignment = taRightJustify
      Caption = 'Inferior M'#225'ximo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 104
      Top = 116
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
      Left = 310
      Top = 86
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
      Left = 261
      Top = 116
      Width = 103
      Height = 16
      Alignment = taRightJustify
      Caption = 'Superior m'#225'ximo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BtnEquipamento: TButton
      Left = 439
      Top = 30
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 2
      OnClick = BtnEquipamentoClick
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 504
      Top = 5
      Width = 495
      Height = 150
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Color = clBtnFace
      DataSource = DM.dsMonitMedicoesPtosInsp
      DrawingStyle = gdsClassic
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdCadastroDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyDown = GrdCadastroKeyDown
      OnTitleClick = GrdCadastroTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DATAMEDICAO'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDICAO'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OSGERADA'
          Title.Alignment = taCenter
          Title.Caption = 'O.S.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FUNCIONARIO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 178
          Visible = True
        end>
    end
    object edtCodEquip: TEdit
      Left = 127
      Top = 32
      Width = 98
      Height = 24
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtDescEquip: TEdit
      Left = 226
      Top = 32
      Width = 212
      Height = 24
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object EdtLimInfMax: TEdit
      Left = 155
      Top = 85
      Width = 70
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seBorder]
    end
    object EdtLimInf: TEdit
      Left = 155
      Top = 115
      Width = 70
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      StyleElements = [seBorder]
    end
    object EdtLimSup: TEdit
      Left = 368
      Top = 85
      Width = 70
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seBorder]
    end
    object EdtLimSupMax: TEdit
      Left = 368
      Top = 115
      Width = 70
      Height = 24
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      StyleElements = [seBorder]
    end
  end
  inherited PDiversos: TPanel
    Top = 348
    Height = 194
    ExplicitTop = 348
    ExplicitHeight = 194
    inherited Label3: TLabel
      Width = 75
      Caption = 'GR'#193'FICO'
      ExplicitWidth = 75
    end
    object GrafMonit: TDBChart
      AlignWithMargins = True
      Left = 5
      Top = 26
      Width = 994
      Height = 163
      Margins.Left = 4
      Margins.Top = 25
      Margins.Right = 4
      Margins.Bottom = 4
      AllowPanning = pmNone
      BackWall.Pen.Visible = False
      BottomWall.Brush.Gradient.EndColor = clSilver
      BottomWall.Brush.Gradient.StartColor = clGray
      BottomWall.Brush.Gradient.Visible = True
      BottomWall.Pen.Color = clGray
      BottomWall.Size = 4
      Gradient.Direction = gdFromTopLeft
      Gradient.EndColor = 13619104
      Gradient.Visible = True
      LeftWall.Brush.Gradient.EndColor = clSilver
      LeftWall.Brush.Gradient.StartColor = clGray
      LeftWall.Brush.Gradient.Visible = True
      LeftWall.Color = clWhite
      LeftWall.Pen.Color = clGray
      LeftWall.Size = 4
      MarginBottom = 0
      MarginLeft = 1
      MarginRight = 1
      MarginTop = 5
      Title.Font.Height = -12
      Title.Font.Shadow.Color = clGray
      Title.Font.Shadow.HorizSize = 1
      Title.Font.Shadow.SmoothBlur = 2
      Title.Font.Shadow.VertSize = 1
      Title.Font.Shadow.Visible = False
      Title.Text.Strings = (
        'TDBChart')
      Title.Visible = False
      BottomAxis.Grid.Color = 14540253
      BottomAxis.LabelsFormat.Font.Color = clGray
      BottomAxis.LabelsFormat.Font.Height = -9
      BottomAxis.LabelStyle = talText
      Chart3DPercent = 100
      ClipPoints = False
      Frame.Visible = False
      LeftAxis.Grid.Color = 11184810
      LeftAxis.Grid.Width = 0
      LeftAxis.Grid.SmallSpace = 1
      LeftAxis.GridCentered = True
      LeftAxis.LabelsFormat.Font.Color = clGray
      LeftAxis.LabelsFormat.Font.Height = -9
      LeftAxis.LabelStyle = talValue
      Legend.Visible = False
      View3D = False
      View3DOptions.Elevation = 350
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 55
      View3DOptions.Zoom = 90
      Zoom.Animated = True
      Zoom.Pen.Mode = pmNotXor
      Align = alClient
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        39
        15
        39)
      ColorPaletteIndex = 13
      object Series1: TBarSeries
        Marks.Visible = False
        SeriesColor = 4227072
        MultiBar = mbStacked
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
    end
  end
  inherited PBase: TPanel
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
  inherited TimerLetreiro: TTimer
    Left = 378
  end
  inherited TimerAlertas: TTimer
    Left = 418
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 212
    Top = 16
  end
  inherited ActionList1: TActionList
    Top = 11
  end
  object PopupMenuCons: TPopupMenu
    Left = 458
    Top = 251
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

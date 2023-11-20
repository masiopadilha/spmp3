inherited FrmTelaCadOrdemServicoTercUnid: TFrmTelaCadOrdemServicoTercUnid
  Caption = 'Servi'#231'os Terceirizados na Unidade'
  ClientHeight = 664
  ClientWidth = 1012
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited LblDataCad: TDBText
      DataSource = DM.dsOrdemServicoTercUnid
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsOrdemServicoTercUnid
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsOrdemServicoTercUnid
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsOrdemServicoTercUnid
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    object Label4: TLabel
      Left = 93
      Top = 32
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'O.S.:'
    end
    object Label19: TLabel
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
    object Label5: TLabel
      Left = 26
      Top = 62
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object Label20: TLabel
      Left = 517
      Top = 64
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
    object Label16: TLabel
      Left = 548
      Top = 62
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
    end
    object Label11: TLabel
      Left = 548
      Top = 32
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Contrato:'
    end
    object EdtCodigo: TDBEdit
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODIGO'
      DataSource = DM.dsOrdemServicoTercUnid
      ReadOnly = True
      TabOrder = 0
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsOrdemServicoTercUnid
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodCentroCusto: TDBEdit
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODCENTROCUSTO'
      DataSource = DM.dsOrdemServicoTercUnid
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescCentroCusto: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      TabStop = False
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsOrdemServicoTercUnid
      ParentCtl3D = False
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCentroCusto: TButton
      Left = 485
      Top = 57
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnCentroCustoClick
    end
    object PSituacao: TPanel
      Left = 606
      Top = 60
      Width = 155
      Height = 25
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      StyleElements = []
    end
    object EdtContrato: TDBEdit
      Left = 606
      Top = 30
      Width = 285
      Height = 24
      Ctl3D = True
      DataField = 'CONTRATO'
      DataSource = DM.dsOrdemServicoTercUnid
      ParentCtl3D = False
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object btnFechar: TButton
      Left = 762
      Top = 57
      Width = 28
      Height = 28
      Hint = 'Fechar Ordem de Servi'#231'o'
      DisabledImageIndex = 75
      ImageAlignment = iaCenter
      ImageIndex = 74
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnFecharClick
    end
  end
  inherited PProgramacao: TPanel
    Width = 1008
    Height = 211
    ExplicitHeight = 211
    object Chart1: TChart
      AlignWithMargins = True
      Left = 4
      Top = 26
      Width = 1000
      Height = 181
      Margins.Top = 25
      Legend.CheckBoxesStyle = cbsRadio
      Legend.DividingLines.Visible = True
      Legend.Shadow.HorizSize = 2
      Legend.VertSpacing = -1
      Legend.Visible = False
      Title.Text.Strings = (
        'Tarefas Cadastradas')
      View3D = False
      Zoom.Pen.Mode = pmNotXor
      Align = alClient
      BevelOuter = bvNone
      Color = 16446959
      TabOrder = 0
      ExplicitWidth = 996
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        39
        15
        39)
      ColorPaletteIndex = 13
      object Series1: TGanttSeries
        HoverElement = [heCurrent]
        ClickableLine = False
        Pointer.Brush.Gradient.EndColor = 10708548
        Pointer.Gradient.EndColor = 10708548
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        Pointer.VertSize = 3
        XValues.Name = 'Start'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
        Callout.Style = psRightTriangle
        Callout.Arrow.Visible = False
        StartValues.Name = 'Start'
        StartValues.Order = loAscending
        EndValues.Name = 'End'
        EndValues.Order = loNone
        NextTask.Name = 'NextTask'
        NextTask.Order = loNone
        Data = {0000000000}
      end
    end
  end
  inherited PDiversos: TPanel
    Top = 402
    Width = 1008
    Height = 183
    ExplicitTop = 402
    ExplicitHeight = 180
    inherited Label3: TLabel
      Width = 93
      Caption = 'CONTRATO'
      ExplicitWidth = 93
    end
    object Label6: TLabel
      Left = 56
      Top = 38
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Vig'#234'ncia:'
    end
    object Label7: TLabel
      Left = 242
      Top = 38
      Width = 7
      Height = 16
      Alignment = taRightJustify
      Caption = 'a'
    end
    object Label10: TLabel
      Left = 519
      Top = 38
      Width = 76
      Height = 16
      Alignment = taRightJustify
      Caption = 'Respons'#225'vel:'
    end
    object Label24: TLabel
      Left = 990
      Top = 40
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
      Left = 38
      Top = 68
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Inicial:'
    end
    object Label13: TLabel
      Left = 242
      Top = 73
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
    object Label9: TLabel
      Left = 43
      Top = 99
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor Final:'
    end
    object Label12: TLabel
      Left = 57
      Top = 130
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Parcelas:'
    end
    object Label14: TLabel
      Left = 242
      Top = 134
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
    object EdtDataContratoIni: TJvDBDateEdit
      Left = 254
      Top = 36
      Width = 125
      Height = 24
      DataField = 'DATACONTRATOINI'
      DataSource = DM.dsOrdemServicoTercUnid
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDataContratoFin: TJvDBDateEdit
      Left = 112
      Top = 36
      Width = 125
      Height = 24
      DataField = 'DATACONTRATOFIN'
      DataSource = DM.dsOrdemServicoTercUnid
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtResponsavel: TDBEdit
      Left = 728
      Top = 36
      Width = 230
      Height = 24
      TabStop = False
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FUNCIONARIO'
      DataSource = DM.dsOrdemServicoTercUnid
      ParentCtl3D = False
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnResponsavel: TButton
      Left = 959
      Top = 34
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnResponsavelClick
    end
    object EdtValorInicial: TDBEdit
      Left = 112
      Top = 67
      Width = 125
      Height = 24
      DataField = 'VALORCONTRATO'
      DataSource = DM.dsOrdemServicoTercUnid
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtValorFinal: TDBEdit
      Left = 112
      Top = 98
      Width = 125
      Height = 24
      Color = clBtnFace
      DataField = 'VALORFINAL'
      DataSource = DM.dsOrdemServicoTercUnid
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seBorder]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtParcelas: TDBEdit
      Left = 112
      Top = 129
      Width = 125
      Height = 24
      DataField = 'NUMPARCELAS'
      DataSource = DM.dsOrdemServicoTercUnid
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbParado: TDBCheckBox
      Left = 450
      Top = 68
      Width = 168
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Recursos da contratada?'
      DataField = 'RECURSOS'
      DataSource = DM.dsOrdemServicoTercUnid
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbAutonomo: TDBCheckBox
      Left = 456
      Top = 99
      Width = 162
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Material da contratada?'
      DataField = 'MATERIAL'
      DataSource = DM.dsOrdemServicoTercUnid
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtMatricula: TDBEdit
      Left = 601
      Top = 36
      Width = 125
      Height = 24
      TabStop = False
      Color = clBtnFace
      Ctl3D = True
      DataField = 'MATRICULA'
      DataSource = DM.dsOrdemServicoTercUnid
      ParentCtl3D = False
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 645
    Width = 1012
  end
  inherited PAlertas: TPanel
    Top = 629
    Width = 1012
  end
  inherited PBase: TPanel
    Top = 589
    Width = 1008
    inherited Button1: TButton
      Left = 853
      Hint = 'Tarefas'
      DisabledImageIndex = 50
      ImageIndex = 49
      OnClick = Button1Click
      ExplicitLeft = 853
    end
    inherited Button2: TButton
      Left = 883
      Hint = 'Aditivos'
      DisabledImageIndex = 42
      ImageIndex = 41
      OnClick = Button2Click
      ExplicitLeft = 883
    end
    inherited Button3: TButton
      Left = 913
      Hint = 'Materiais'
      DisabledImageIndex = 71
      ImageIndex = 70
      OnClick = Button3Click
      ExplicitLeft = 913
    end
    inherited Button4: TButton
      Left = 943
      Hint = 'Pe'#231'as de Reposi'#231#227'o'
      DisabledImageIndex = 81
      ImageIndex = 80
      OnClick = Button4Click
      ExplicitLeft = 943
    end
    inherited Button5: TButton
      Left = 973
      Hint = 'Recursos'
      DisabledImageIndex = 38
      ImageIndex = 37
      OnClick = Button5Click
      ExplicitLeft = 973
    end
    inherited Button6: TButton
      Left = 823
      Hint = 'Medi'#231#245'es'
      ImageIndex = 116
      OnClick = Button6Click
      ExplicitLeft = 823
    end
  end
  inherited TimerAlertas: TTimer
    Left = 338
  end
end

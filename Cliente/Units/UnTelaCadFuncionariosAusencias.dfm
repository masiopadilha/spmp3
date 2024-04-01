inherited FrmTelaCadFuncionariosAusencias: TFrmTelaCadFuncionariosAusencias
  Caption = 'Aus'#234'ncias do Funcion'#225'rio'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 506
      ExplicitLeft = 502
    end
    inherited LAlteradoPor: TLabel
      Left = 528
      ExplicitLeft = 524
    end
    inherited LblDataAlt: TDBText
      Left = 568
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LblDataCad: TDBText
      Left = 440
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LblUsuAlt: TDBText
      Left = 568
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LblUsuCad: TDBText
      Left = 440
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LCadastro: TLabel
      Left = 400
      ExplicitLeft = 396
    end
    inherited LCadastroPor: TLabel
      Left = 362
      ExplicitLeft = 358
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object LblDataConsulta: TLabel
      Left = 387
      Top = 235
      Width = 91
      Height = 16
      Alignment = taCenter
      Caption = 'LblDataConsulta'
      Visible = False
    end
    object Label2: TLabel
      Left = 99
      Top = 90
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'Motivo:'
    end
    object Label1: TLabel
      Left = 106
      Top = 119
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
    end
    object Label3: TLabel
      Left = 115
      Top = 151
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fim:'
    end
    object PPeriodo: TPanel
      Left = 387
      Top = 215
      Width = 194
      Height = 18
      Align = alCustom
      BevelOuter = bvNone
      Caption = 'm'#234's de ano'
      Color = 14671839
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object BtnAntMes: TButton
        Left = -1
        Top = 0
        Width = 18
        Height = 18
        Hint = 'M'#234's Anterior'
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
        Left = 175
        Top = 0
        Width = 18
        Height = 18
        Hint = 'M'#234's Posterior'
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
    object CalendarGrid: TStringGrid
      Left = 386
      Top = 88
      Width = 193
      Height = 125
      BorderStyle = bsNone
      ColCount = 7
      Ctl3D = True
      DefaultColWidth = 27
      DefaultRowHeight = 17
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedHorzLine]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssNone
      ShowHint = True
      TabOrder = 1
      OnClick = CalendarGridClick
      OnDrawCell = CalendarGridDrawCell
      ColWidths = (
        27
        27
        27
        27
        27
        27
        27)
    end
    object EdtDescricao: TDBEdit
      Left = 145
      Top = 88
      Width = 230
      Height = 24
      DataField = 'MOTIVO'
      DataSource = DM.dsFuncionariosAusencias
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtInicio: TJvDBDateEdit
      Left = 145
      Top = 119
      Width = 101
      Height = 24
      DataField = 'INICIO'
      DataSource = DM.dsFuncionariosAusencias
      ShowNullDate = False
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtFim: TJvDBDateEdit
      Left = 145
      Top = 150
      Width = 101
      Height = 24
      DataField = 'FIM'
      DataSource = DM.dsFuncionariosAusencias
      ShowNullDate = False
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 405
    Width = 628
  end
  inherited PAuxiliares: TPanel
    Top = 378
    Width = 624
  end
end

inherited FrmTelaCadFuncionariosAusencias: TFrmTelaCadFuncionariosAusencias
  Caption = 'Aus'#234'ncias do Funcion'#225'rio'
  ClientHeight = 374
  ClientWidth = 788
  TextHeight = 16
  inherited PControle: TPanel
    Width = 784
    inherited LAlteracao: TLabel
      Left = 655
      ExplicitLeft = 655
    end
    inherited LAlteradoPor: TLabel
      Left = 677
      ExplicitLeft = 677
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsFuncionariosAusencias
    end
    inherited LCadastro: TLabel
      Left = 553
      ExplicitLeft = 553
    end
    inherited LCadastroPor: TLabel
      Left = 515
      ExplicitLeft = 515
    end
  end
  inherited PCentro: TPanel
    Width = 784
    Height = 251
    object LblDataConsulta: TLabel
      Left = 311
      Top = 225
      Width = 91
      Height = 16
      Alignment = taCenter
      Caption = 'LblDataConsulta'
      Visible = False
    end
    object Label2: TLabel
      Left = 64
      Top = 78
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'Motivo:'
    end
    object Label1: TLabel
      Left = 64
      Top = 125
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
    end
    object Label3: TLabel
      Left = 171
      Top = 125
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fim:'
    end
    object PPeriodo: TPanel
      Left = 311
      Top = 205
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
      Left = 310
      Top = 78
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
      Left = 64
      Top = 95
      Width = 230
      Height = 24
      DataField = 'MOTIVO'
      DataSource = DM.dsFuncionariosAusencias
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtInicio: TJvDBDateEdit
      Left = 64
      Top = 142
      Width = 101
      Height = 24
      DataField = 'INICIO'
      DataSource = DM.dsFuncionariosAusencias
      ShowNullDate = False
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtFim: TJvDBDateEdit
      Left = 171
      Top = 142
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
    Top = 355
    Width = 788
  end
  inherited PAuxiliares: TPanel
    Top = 328
    Width = 784
  end
end

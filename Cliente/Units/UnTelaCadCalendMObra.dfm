inherited FrmTelaCadCalendMObra: TFrmTelaCadCalendMObra
  Caption = 'Calend'#225'rios de M'#227'o de Obra'
  ClientHeight = 421
  ClientWidth = 624
  TextHeight = 16
  inherited PControle: TPanel
    Width = 620
    inherited LAlteracao: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LblDataAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCalendMObra
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCalendMObra
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCalendMObra
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCalendMObra
    end
    inherited LCadastro: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    Width = 620
    Height = 320
    object Label3: TLabel
      Left = 234
      Top = 114
      Width = 77
      Height = 16
      Caption = '%HE Normal:'
    end
    object Label5: TLabel
      Left = 399
      Top = 114
      Width = 79
      Height = 16
      Caption = '%HE Feriado:'
    end
    object LblDataConsulta: TLabel
      Left = 350
      Top = 272
      Width = 91
      Height = 16
      Alignment = taCenter
      Caption = 'LblDataConsulta'
    end
    object Label2: TLabel
      Left = 97
      Top = 52
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 81
      Top = 82
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label6: TLabel
      Left = 80
      Top = 113
      Width = 61
      Height = 16
      Alignment = taRightJustify
      Caption = 'Oficial (h):'
    end
    object Label1: TLabel
      Left = 271
      Top = 84
      Width = 32
      Height = 13
      Caption = 'Horas:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblHorasReais: TDBText
      Left = 308
      Top = 84
      Width = 67
      Height = 13
      AutoSize = True
      DataField = 'HREAIS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtHENormal: TDBEdit
      Left = 315
      Top = 112
      Width = 60
      Height = 24
      DataField = 'HENORMAL'
      DataSource = DM.dsCalendMObra
      MaxLength = 9
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtHEFeriado: TDBEdit
      Left = 482
      Top = 112
      Width = 60
      Height = 24
      DataField = 'HEFERIADO'
      DataSource = DM.dsCalendMObra
      MaxLength = 9
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 145
      Top = 50
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsCalendMObra
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 145
      Top = 80
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsCalendMObra
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtHOficiais: TDBEdit
      Left = 145
      Top = 112
      Width = 60
      Height = 24
      DataField = 'HOFICIAIS'
      DataSource = DM.dsCalendMObra
      MaxLength = 9
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 401
      Top = 82
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsCalendMObra
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 477
      Top = 82
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsCalendMObra
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object CalendarGrid: TStringGrid
      Left = 145
      Top = 145
      Width = 193
      Height = 124
      Hint = 'Clique na data para visualizar o hor'#225'rio de trabalho.'
      Align = alCustom
      BorderStyle = bsNone
      Color = clWhite
      ColCount = 7
      Ctl3D = True
      DefaultColWidth = 27
      DefaultRowHeight = 17
      DefaultDrawing = False
      FixedCols = 0
      RowCount = 8
      Font.Charset = ANSI_CHARSET
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
      TabOrder = 7
      OnClick = CalendarGridClick
      OnDrawCell = CalendarGridDrawCell
    end
    object PPeriodo: TPanel
      Left = 145
      Top = 272
      Width = 193
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
      TabOrder = 8
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
    object GBHorario: TGroupBox
      Left = 348
      Top = 142
      Width = 163
      Height = 127
      Caption = 'Hor'#225'rio de Trabalho:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      object Label7: TLabel
        Left = 8
        Top = 22
        Width = 20
        Height = 16
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 74
        Width = 20
        Height = 16
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 86
        Top = 22
        Width = 24
        Height = 16
        Caption = 'At'#233':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 86
        Top = 74
        Width = 24
        Height = 16
        Caption = 'At'#233':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 86
        Top = 47
        Width = 24
        Height = 16
        Caption = 'At'#233':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 86
        Top = 100
        Width = 24
        Height = 16
        Caption = 'At'#233':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 47
        Width = 20
        Height = 16
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 8
        Top = 100
        Width = 20
        Height = 16
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EdtHoraIni1: TJvDBMaskEdit
        Left = 34
        Top = 19
        Width = 45
        Height = 24
        DataField = 'HORAINI1'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 0
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
        OnKeyPress = FormKeyPress
      end
      object EdtHoraFin1: TJvDBMaskEdit
        Left = 114
        Top = 19
        Width = 45
        Height = 24
        DataField = 'HORAFIN1'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 1
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
      end
      object EdtHoraIni2: TJvDBMaskEdit
        Left = 34
        Top = 44
        Width = 45
        Height = 24
        DataField = 'HORAINI2'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 2
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
      end
      object EdtHoraFin2: TJvDBMaskEdit
        Left = 114
        Top = 44
        Width = 45
        Height = 24
        DataField = 'HORAFIN2'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 3
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
      end
      object EdtHoraIni3: TJvDBMaskEdit
        Left = 34
        Top = 71
        Width = 45
        Height = 24
        DataField = 'HORAINI3'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 4
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
      end
      object EdtHoraFin3: TJvDBMaskEdit
        Left = 114
        Top = 71
        Width = 45
        Height = 24
        DataField = 'HORAFIN3'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 5
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
      end
      object EdtHoraIni4: TJvDBMaskEdit
        Left = 34
        Top = 97
        Width = 45
        Height = 24
        DataField = 'HORAINI4'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 6
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
      end
      object EdtHoraFin4: TJvDBMaskEdit
        Left = 114
        Top = 97
        Width = 45
        Height = 24
        DataField = 'HORAFIN4'
        DataSource = DM.dsCalendMObraSeqHora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 7
        EditMask = '!99:99;1;_'
        OnExit = TabNextTab1AfterTabChange
      end
    end
    object BtnNovoHorario: TButton
      Left = 514
      Top = 145
      Width = 28
      Height = 28
      Hint = 'Novo hor'#225'rio'
      DisabledImageIndex = 1
      ImageAlignment = iaCenter
      ImageIndex = 0
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BtnNovoHorarioClick
    end
    object BtnSalvarHorario: TButton
      Left = 514
      Top = 175
      Width = 28
      Height = 28
      Hint = 'Salvar hor'#225'rio'
      DisabledImageIndex = 3
      ImageAlignment = iaCenter
      ImageIndex = 2
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BtnSalvarHorarioClick
    end
    object BtnCancelarHorario: TButton
      Left = 514
      Top = 205
      Width = 28
      Height = 28
      Hint = 'Cancelar hor'#225'rio'
      DisabledImageIndex = 7
      ImageAlignment = iaCenter
      ImageIndex = 6
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = BtnCancelarHorarioClick
    end
    object BtnExcluirHorario: TButton
      Left = 514
      Top = 235
      Width = 28
      Height = 28
      Hint = 'Excluir hor'#225'rio'
      DisabledImageIndex = 9
      ImageAlignment = iaCenter
      ImageIndex = 8
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = BtnExcluirHorarioClick
    end
    object PHHDisponivel: TPanel
      Left = 145
      Top = 289
      Width = 193
      Height = 18
      Align = alCustom
      BevelOuter = bvNone
      Caption = 'H/H Dispon'#237'vel'
      Color = 14671839
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 14
      Visible = False
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 402
    Width = 624
  end
  inherited PAuxiliares: TPanel
    Top = 375
    Width = 620
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 358
    Top = 68
  end
end

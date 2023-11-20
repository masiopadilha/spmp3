inherited FrmTelaCadOrdemServicoMObraProg: TFrmTelaCadOrdemServicoMObraProg
  Caption = 'Programa'#231#227'o da O.S.'
  ClientHeight = 444
  ClientWidth = 546
  Constraints.MaxHeight = 480
  Constraints.MaxWidth = 558
  Constraints.MinHeight = 480
  Constraints.MinWidth = 558
  OnCreate = FormCreate
  ExplicitWidth = 558
  ExplicitHeight = 480
  TextHeight = 16
  inherited PTop: TPanel
    Width = 542
    ExplicitWidth = 538
    object Label3: TLabel [1]
      Left = 123
      Top = 39
      Width = 105
      Height = 16
      Caption = 'Tempo Previsto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblTempoPrevisto: TLabel [2]
      Left = 233
      Top = 39
      Width = 4
      Height = 16
    end
    inherited BtnAjuda: TButton
      Left = 506
      ExplicitLeft = 506
    end
  end
  inherited PCentro: TPanel
    Width = 540
    Height = 305
    ExplicitWidth = 536
    ExplicitHeight = 302
    inherited RGTelas: TRadioGroup
      Width = 538
      Height = 303
      ExplicitWidth = 534
      ExplicitHeight = 300
    end
    object PBase: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 532
      Height = 297
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 528
      ExplicitHeight = 294
      object Label1: TLabel
        Left = 16
        Top = 9
        Width = 35
        Height = 16
        Alignment = taRightJustify
        Caption = 'In'#237'cio:'
      end
      object Label2: TLabel
        Left = 251
        Top = 9
        Width = 26
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fim:'
      end
      object GrdEquipeMObra: TDBGrid
        AlignWithMargins = True
        Left = 159
        Top = 37
        Width = 363
        Height = 95
        Hint = 
          'Tecle ENTER na(s) coluna(s) em negrito para incluir um calend'#225'ri' +
          'o.'
        Margins.Top = 30
        Margins.Bottom = 1
        Ctl3D = False
        DataSource = DM.dsOrdemServicoEquipeMObra
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GrdEquipeKeyDown
        OnKeyPress = GrdEquipeMObraKeyPress
        Columns = <
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'CARGO'
            Title.Caption = 'Cargo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 127
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = 'Homem/Hora'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 79
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'CALENDARIO'
            Title.Caption = 'Calend'#225'rio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 122
            Visible = True
          end>
      end
      object EdtHoraProgIni: TDateTimePicker
        Left = 159
        Top = 8
        Width = 76
        Height = 25
        Date = 44790.000000000000000000
        Time = 0.709735254633415000
        Kind = dtkTime
        TabOrder = 1
        OnChange = EdtDataProgIniiChange
      end
      object GrdEquipeMObraFunc: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 134
        Width = 517
        Height = 124
        Hint = 
          'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
          'ou efetue o duplo-clique para exclu'#237'-lo'
        Margins.Top = 1
        Ctl3D = False
        DataSource = DM.dsOrdemServicoMObraProg
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GrdEquipeMObraFuncDblClick
        OnKeyDown = GrdEquipeKeyDown
        OnKeyPress = GrdEquipeMObraFuncKeyPress
        Columns = <
          item
            Alignment = taCenter
            Color = clBtnFace
            Expanded = False
            FieldName = 'MATRICULA'
            Title.Alignment = taCenter
            Title.Caption = 'Matr'#237'cula'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 62
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 159
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = 'Homem/Hora'
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
            FieldName = 'QTDEHENORMAL'
            Title.Alignment = taCenter
            Title.Caption = 'HE Normal'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDEHEFERIADO'
            Title.Alignment = taCenter
            Title.Caption = 'HE Feriado'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 65
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'ESPECIALISTA'
            Title.Alignment = taCenter
            Title.Caption = 'Esp.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 46
            Visible = True
          end>
      end
      object BtnDesprogramar: TButton
        Left = 332
        Top = 264
        Width = 98
        Height = 25
        Caption = 'Desprogramar'
        DisabledImageIndex = 101
        ImageIndex = 101
        TabOrder = 7
        OnClick = BtnDesprogramarClick
      end
      object BtnProgramar: TButton
        Left = 434
        Top = 264
        Width = 89
        Height = 25
        Caption = 'Programar'
        DisabledImageIndex = 40
        ImageIndex = 39
        TabOrder = 8
        OnClick = BtnProgramarClick
      end
      object GrdEquipe: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 152
        Height = 95
        Margins.Top = 30
        Margins.Bottom = 1
        Ctl3D = False
        DataSource = DM.dsOrdemServicoEquipe
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GrdEquipeKeyDown
        Columns = <
          item
            Alignment = taCenter
            Color = clBtnFace
            Expanded = False
            FieldName = 'CODEQUIPE'
            ReadOnly = False
            Title.Alignment = taCenter
            Title.Caption = 'Equipe'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 63
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'TEMPO'
            ReadOnly = False
            Title.Alignment = taCenter
            Title.Caption = 'Tempo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 54
            Visible = True
          end>
      end
      object EdtHoraProgFin: TDateTimePicker
        Left = 387
        Top = 8
        Width = 76
        Height = 24
        Date = 41925.000000000000000000
        Time = 41925.000000000000000000
        Kind = dtkTime
        TabOrder = 3
        OnChange = EdtDataProgFinChange
      end
      object EdtDataProgIni: TJvDateTimePicker
        Left = 54
        Top = 8
        Width = 103
        Height = 24
        Date = 44790.000000000000000000
        Time = 0.515031701390398700
        TabOrder = 0
        DropDownDate = 44790.000000000000000000
      end
      object EdtDataProgFin: TJvDateTimePicker
        Left = 282
        Top = 8
        Width = 103
        Height = 24
        Date = 44790.000000000000000000
        Time = 0.515031701390398700
        TabOrder = 2
        DropDownDate = 44771.000000000000000000
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 377
    Width = 542
    ExplicitTop = 374
    ExplicitWidth = 538
  end
  inherited PBotoes: TPanel
    Top = 404
    Width = 542
    ExplicitTop = 401
    ExplicitWidth = 538
    inherited BtnOK: TButton
      Left = 100
      ModalResult = 0
      Visible = False
      OnClick = BtnOKClick
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 234
      OnClick = BtnFecharClick
      ExplicitLeft = 234
    end
  end
end

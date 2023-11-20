inherited FrmTelaCadPlanoTrabalho: TFrmTelaCadPlanoTrabalho
  Hint = 'Next|Go to the next tab'
  Caption = 'Plano de Trabalho'
  ClientHeight = 624
  ClientWidth = 1012
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited LblDataCad: TDBText
      DataSource = DM.dsPlanoTrabalho
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsPlanoTrabalho
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsPlanoTrabalho
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsPlanoTrabalho
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    Height = 63
    ExplicitHeight = 63
    object Label4: TLabel
      Left = 64
      Top = 32
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label17: TLabel
      Left = 489
      Top = 33
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
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 127
      Top = 29
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsPlanoTrabalho
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 29
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsPlanoTrabalho
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object DBCheckBox1: TDBCheckBox
      Left = 656
      Top = 32
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Autom'#225'tico:'
      DataField = 'AUTOMATICO'
      DataSource = DM.dsPlanoTrabalho
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbAtivo: TDBCheckBox
      Left = 785
      Top = 32
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsPlanoTrabalho
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivel: TDBCheckBox
      Left = 854
      Top = 32
      Width = 69
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsPlanoTrabalho
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited PProgramacao: TPanel
    Top = 118
    Width = 1008
    Height = 424
    ExplicitTop = 118
    ExplicitHeight = 424
    inherited Label2: TLabel
      Width = 107
      Caption = 'INSTRU'#199#213'ES'
      ExplicitWidth = 107
    end
    object MDetalhes: TDBMemo
      AlignWithMargins = True
      Left = 5
      Top = 21
      Width = 998
      Height = 398
      Margins.Left = 4
      Margins.Top = 20
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      DataField = 'DETALHES'
      DataSource = DM.dsPlanoTrabalho
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 994
    end
  end
  inherited PDiversos: TPanel
    Width = 300
    Height = 0
    Align = alNone
    ExplicitWidth = 300
    ExplicitHeight = 0
  end
  inherited StatusBar1: TStatusBar
    Top = 605
    Width = 1012
  end
  inherited PAlertas: TPanel
    Top = 589
    Width = 1012
  end
  inherited PBase: TPanel
    Top = 549
    Width = 1008
  end
  inherited MainMenuPadrao: TMainMenu
    object Formatar1: TMenuItem
      Caption = 'Formatar'
      object Fontes1: TMenuItem
        Caption = 'Fontes'
        OnClick = Fontes1Click
      end
      object Alinhamento1: TMenuItem
        Caption = 'Alinhamento'
        object Esquerda1: TMenuItem
          Caption = 'Esquerda'
          OnClick = Esquerda1Click
        end
        object Direita1: TMenuItem
          Caption = 'Direita'
          OnClick = Direita1Click
        end
        object Centro1: TMenuItem
          Caption = 'Centro'
          OnClick = Centro1Click
        end
      end
    end
  end
  object ColorDialog1: TColorDialog [11]
    Left = 696
    Top = 4
  end
  object FontDialog1: TFontDialog [12]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 664
    Top = 5
  end
end

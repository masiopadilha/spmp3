inherited FrmTelaCadPecasReposicaoKit: TFrmTelaCadPecasReposicaoKit
  Caption = 'Kit de Pe'#231'as de Reposi'#231#227'o'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
    ExplicitWidth = 784
    inherited LblDataAlt: TDBText
      DataSource = DM.dsPecaReposicaoKit
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsPecaReposicaoKit
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsPecaReposicaoKit
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsPecaReposicaoKit
    end
  end
  inherited PCentro: TPanel
    Width = 780
    Height = 248
    ExplicitWidth = 784
    ExplicitHeight = 251
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label2: TLabel
      Left = 168
      Top = 9
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label4: TLabel
      Left = 525
      Top = 9
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 58
      Top = 6
      Width = 101
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsPecaReposicaoKit
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 230
      Top = 7
      Width = 283
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsPecaReposicaoKit
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtQtde: TDBEdit
      Left = 562
      Top = 7
      Width = 51
      Height = 24
      DataField = 'QUANTIDADE'
      DataSource = DM.dsPecaReposicaoKit
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object GrdItens: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 36
      Width = 776
      Height = 211
      Hint = 
        'Tecle ENTER na(s) coluna(s) para incluir um registro ou efetue o' +
        ' duplo-clique para exclu'#237'-lo'
      Margins.Top = 35
      Align = alClient
      Ctl3D = False
      DataSource = DM.dsPecaReposicaoKitItens
      DrawingStyle = gdsClassic
      FixedColor = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdItensDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = GrdItensKeyPress
      Columns = <
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'CODPECAREPOSICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'REFERENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 130
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DESCRICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 304
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Width = 73
          Visible = True
        end>
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 352
    Width = 784
    ExplicitTop = 355
    ExplicitWidth = 788
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
    ExplicitTop = 328
    ExplicitWidth = 784
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 382
    Top = 140
  end
end

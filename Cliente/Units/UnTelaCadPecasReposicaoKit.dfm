inherited FrmTelaCadPecasReposicaoKit: TFrmTelaCadPecasReposicaoKit
  Caption = 'Kit de Pe'#231'as de Reposi'#231#227'o'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 513
    end
    inherited LAlteradoPor: TLabel
      Left = 535
    end
    inherited LblDataAlt: TDBText
      Left = 568
      DataSource = DM.dsPecaReposicaoKit
    end
    inherited LblDataCad: TDBText
      Left = 440
      DataSource = DM.dsPecaReposicaoKit
    end
    inherited LblUsuAlt: TDBText
      Left = 568
      DataSource = DM.dsPecaReposicaoKit
    end
    inherited LblUsuCad: TDBText
      Left = 440
      DataSource = DM.dsPecaReposicaoKit
    end
    inherited LCadastro: TLabel
      Left = 407
    end
    inherited LCadastroPor: TLabel
      Left = 369
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
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
      Width = 616
      Height = 283
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
    Top = 405
    Width = 628
    Panels = <
      item
        Text = ' Usu'#225'rio:'
        Width = 105
      end
      item
        Width = 135
      end
      item
        Text = ' Empresa:'
        Width = 165
      end
      item
        Text = ' Grupo:'
        Width = 190
      end>
  end
  inherited PAuxiliares: TPanel
    Top = 378
    Width = 624
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 382
    Top = 140
  end
end

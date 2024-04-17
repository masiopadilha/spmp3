inherited FrmTelaCadRecursosKit: TFrmTelaCadRecursosKit
  Caption = 'Kit de Recursos'
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
      DataSource = DM.dsRecursoKit
    end
    inherited LblDataCad: TDBText
      Left = 440
      DataSource = DM.dsRecursoKit
    end
    inherited LblUsuAlt: TDBText
      Left = 568
      DataSource = DM.dsRecursoKit
    end
    inherited LblUsuCad: TDBText
      Left = 440
      DataSource = DM.dsRecursoKit
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
      Top = 10
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label2: TLabel
      Left = 175
      Top = 10
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label4: TLabel
      Left = 528
      Top = 9
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 58
      Top = 7
      Width = 106
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsRecursoKit
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 237
      Top = 8
      Width = 278
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsRecursoKit
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtQtde: TDBEdit
      Left = 564
      Top = 7
      Width = 52
      Height = 24
      DataField = 'QUANTIDADE'
      DataSource = DM.dsRecursoKit
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
      DataSource = DM.dsRecursoKitItens
      DrawingStyle = gdsClassic
      FixedColor = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          FieldName = 'CODRECURSO'
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
          Color = clBtnFace
          Expanded = False
          FieldName = 'DESCRICAO'
          ReadOnly = True
          Title.Caption = 'Recurso'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 430
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 72
          Visible = True
        end>
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
  inherited MainMenuPadrao: TMainMenu
    Left = 406
    Top = 260
  end
end

inherited FrmTelaCadRecursosFerram: TFrmTelaCadRecursosFerram
  Caption = 'Ferramentarias'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
    ExplicitWidth = 784
    inherited LAlteracao: TLabel
      Left = 661
    end
    inherited LAlteradoPor: TLabel
      Left = 683
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsFerramentaria
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsFerramentaria
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsFerramentaria
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsFerramentaria
    end
    inherited LCadastro: TLabel
      Left = 558
    end
    inherited LCadastroPor: TLabel
      Left = 520
    end
  end
  inherited PCentro: TPanel
    Width = 780
    Height = 248
    ExplicitWidth = 784
    ExplicitHeight = 251
    object Label1: TLabel
      Left = 10
      Top = 9
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label2: TLabel
      Left = 175
      Top = 9
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 58
      Top = 6
      Width = 101
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsFerramentaria
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 239
      Top = 7
      Width = 377
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsFerramentaria
      TabOrder = 1
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
      DataSource = DM.dsFerramentariaItens
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
      TabOrder = 2
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
          FieldName = 'RECURSO'
          ReadOnly = True
          Title.Caption = 'Ferramenta'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 457
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
          Width = 50
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
end

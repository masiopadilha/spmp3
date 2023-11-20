inherited FrmTelaCadFuncionariosCxaFerramInv: TFrmTelaCadFuncionariosCxaFerramInv
  Caption = 'Invent'#225'rio de Caixa de Ferramentas'
  ClientHeight = 304
  ClientWidth = 608
  Constraints.MaxWidth = 620
  Constraints.MinWidth = 620
  OnCreate = FormCreate
  ExplicitWidth = 620
  TextHeight = 16
  inherited PTop: TPanel
    Width = 604
    ExplicitWidth = 600
    inherited BtnAjuda: TButton
      Left = 571
      ExplicitLeft = 567
    end
    object BtnImprimir: TButton
      Left = 538
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnImprimirClick
    end
  end
  inherited PCentro: TPanel
    Width = 602
    Height = 165
    ExplicitWidth = 602
    inherited RGTelas: TRadioGroup
      Left = 216
      Width = 0
      ExplicitLeft = 216
      ExplicitWidth = 0
    end
    object GrdEquipe: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 209
      Height = 157
      Hint = 'D'#234' duplo-clique para as op'#231#245'es.'
      Align = alLeft
      Ctl3D = False
      DataSource = DM.dsFuncionariosCxaFerramInv
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
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdEquipeDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATACADASTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Abertura'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAFECHAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Fechamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 85
          Visible = True
        end>
    end
    object GrdEquipeRecursos: TDBGrid
      AlignWithMargins = True
      Left = 219
      Top = 4
      Width = 379
      Height = 157
      Align = alRight
      Ctl3D = False
      DataSource = DM.dsFuncionariosCxaFerramInvItens
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
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = GrdEquipeRecursosKeyDown
      OnKeyPress = GrdEquipeRecursosKeyPress
      Columns = <
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'CODITEM'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 74
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DESCRICAO'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 148
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'ENTREGUE'
          Title.Alignment = taCenter
          Title.Caption = 'Entregue'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 84
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 604
    ExplicitWidth = 604
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 604
    ExplicitWidth = 604
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 263
      ExplicitLeft = 263
    end
  end
  object PopupMenuInventario: TPopupMenu
    Left = 64
    Top = 120
    object Abrir1: TMenuItem
      Caption = 'Novo'
      OnClick = Abrir1Click
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      OnClick = Fechar1Click
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end

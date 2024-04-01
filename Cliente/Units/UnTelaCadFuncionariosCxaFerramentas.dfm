inherited FrmTelaCadFuncionariosCxaFerramentas: TFrmTelaCadFuncionariosCxaFerramentas
  Caption = 'Caixa de Ferramentas'
  ClientHeight = 304
  ClientWidth = 528
  Constraints.MaxWidth = 540
  Constraints.MinWidth = 540
  OnCreate = FormCreate
  ExplicitWidth = 540
  TextHeight = 16
  inherited PTop: TPanel
    Width = 524
    ExplicitWidth = 520
    inherited BtnAjuda: TButton
      Left = 493
      ExplicitLeft = 489
    end
    object BtnImprimir: TButton
      Left = 456
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Imprimir'
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
    Width = 522
    Height = 165
    ExplicitWidth = 522
    inherited RGTelas: TRadioGroup
      Width = 520
      ExplicitWidth = 520
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 514
      Height = 157
      Hint = 
        'Tecle ENTER para incluir um registro ou efetue o duplo-clique pa' +
        'ra exclu'#237'-lo'
      Align = alClient
      DataSource = DM.dsFuncionariosCxaFerram
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdCadastroDblClick
      OnKeyPress = GrdCadastroKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'KIT'
          PickList.Strings = (
            'N'
            'S')
          Title.Alignment = taCenter
          Title.Caption = 'Kit'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 33
          Visible = True
        end
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
          Width = 83
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
          Width = 207
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'QUANTIDADE'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 45
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'DATAENTREGA'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Entrega'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 102
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 524
    ExplicitWidth = 524
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 524
    ExplicitWidth = 524
    inherited BtnOK: TButton
      Left = 182
      OnClick = BtnOKClick
      ExplicitLeft = 182
    end
    inherited BtnFechar: TButton
      Left = 264
      OnClick = BtnFecharClick
      ExplicitLeft = 264
    end
  end
  object CDItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 322
    Top = 18
    object CDItemCODITEM: TStringField
      FieldName = 'CODITEM'
      Size = 9
    end
    object CDItemKIT: TStringField
      FieldName = 'KIT'
      Size = 1
    end
  end
end

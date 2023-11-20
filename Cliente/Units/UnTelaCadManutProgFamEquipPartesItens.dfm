inherited FrmTelaCadManutProgFamEquipPartesItens: TFrmTelaCadManutProgFamEquipPartesItens
  Caption = 'Itens a Inspecionar'
  ClientWidth = 784
  Constraints.MaxWidth = 800
  Constraints.MinWidth = 800
  OnCreate = FormCreate
  ExplicitWidth = 800
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited BtnAjuda: TButton
      Left = 747
      ExplicitLeft = 747
    end
  end
  inherited PCentro: TPanel
    Width = 778
    ExplicitWidth = 778
    inherited RGTelas: TRadioGroup
      Height = 0
      Align = alNone
      ExplicitHeight = 0
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 200
      Height = 154
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alLeft
      Color = clBtnFace
      Ctl3D = False
      DataSource = DM.dsManutProgFamEquipPartes
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
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = GrdCadastroKeyDown
      OnTitleClick = GrdCadastroTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Parte'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 159
          Visible = True
        end>
    end
    object GrdItens: TDBGrid
      AlignWithMargins = True
      Left = 205
      Top = 4
      Width = 569
      Height = 154
      Hint = 'D'#234' duplo-clique para excluir o registro.'
      Align = alRight
      DataSource = DM.dsManutProgFamEquipItens
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdItensDblClick
      OnKeyDown = GrdCadastroKeyDown
      OnKeyPress = GrdItensKeyPress
      OnTitleClick = GrdItensTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ITEM'
          Title.Caption = 'Item'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCINSPECAO'
          Title.Caption = 'Inspe'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 262
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EQUIPPARADO'
          PickList.Strings = (
            'S'
            'N')
          Title.Alignment = taCenter
          Title.Caption = 'Parado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEMPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo (hs)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 72
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EXECAUTONOMO'
          PickList.Strings = (
            'S'
            'N')
          Title.Alignment = taCenter
          Title.Caption = 'Aut'#244'nomo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Width = 780
    ExplicitWidth = 780
  end
  inherited PBotoes: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 352
      OnClick = BtnFecharClick
      ExplicitLeft = 352
    end
  end
end

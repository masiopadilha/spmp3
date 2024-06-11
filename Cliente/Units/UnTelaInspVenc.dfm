inherited FrmTelaInspVenc: TFrmTelaInspVenc
  BorderIcons = []
  Caption = 'Inspe'#231#245'es Vencidas'
  ClientHeight = 564
  ClientWidth = 928
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 940
  Constraints.MinHeight = 600
  Constraints.MinWidth = 940
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 940
  ExplicitHeight = 600
  TextHeight = 16
  inherited PTop: TPanel
    Width = 924
    TabOrder = 1
    ExplicitWidth = 920
    inherited BtnAjuda: TButton
      Left = 887
      Visible = False
      ExplicitLeft = 883
    end
  end
  inherited PCentro: TPanel
    Width = 922
    Height = 425
    TabOrder = 2
    ExplicitWidth = 918
    ExplicitHeight = 422
    inherited RGTelas: TRadioGroup
      Top = 40
      Width = 920
      Height = 384
      ExplicitTop = 40
      ExplicitWidth = 916
      ExplicitHeight = 381
    end
    object PCInspecoes: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 43
      Width = 914
      Height = 378
      ActivePage = TSManut
      Align = alClient
      TabOrder = 1
      OnChange = PCInspecoesChange
      OnChanging = PCInspecoesChanging
      ExplicitWidth = 910
      ExplicitHeight = 375
      object TSManut: TTabSheet
        Caption = 'Manuten'#231#245'es'
        object GrdManut: TJvDBGrid
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 904
          Height = 345
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          DataSource = DM.dsManutVenc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          StyleElements = [seFont, seBorder]
          OnDrawColumnCell = GrdManutDrawColumnCell
          OnKeyPress = GrdManutKeyPress
          OnTitleClick = GrdManutTitleClick
          MultiSelect = True
          TitleButtons = True
          BevelInner = bvNone
          BevelOuter = bvNone
          AlternateRowColor = 16055512
          SortedField = 'CODIGO'
          TitleArrow = True
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FREQUENCIA1'
              Title.Alignment = taCenter
              Title.Caption = 'Freq. (d)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTAINICIO1'
              Title.Alignment = taCenter
              Title.Caption = 'Programada'
              Width = 88
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODEQUIPAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Equip.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EQUIPAMENTO'
              Title.Caption = 'Equipamento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 259
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'C_DIASATRASO'
              Title.Alignment = taCenter
              Visible = True
            end>
        end
      end
      object TSLubrific: TTabSheet
        Caption = 'Lubrifica'#231#245'es'
        ImageIndex = 1
        object GrdLubrific: TJvDBGrid
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 904
          Height = 345
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          DataSource = DM.dsLubrificVenc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          StyleElements = [seFont, seBorder]
          OnDrawColumnCell = GrdManutDrawColumnCell
          OnKeyPress = GrdLubrificKeyPress
          OnTitleClick = GrdManutTitleClick
          MultiSelect = True
          TitleButtons = True
          BevelInner = bvNone
          BevelOuter = bvNone
          AlternateRowColor = 16055512
          SortedField = 'CODIGO'
          TitleArrow = True
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FREQUENCIA1'
              Title.Alignment = taCenter
              Title.Caption = 'Freq. (d)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTAINICIO1'
              Title.Alignment = taCenter
              Title.Caption = 'Programada'
              Width = 88
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODEQUIPAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Equip.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EQUIPAMENTO'
              Title.Caption = 'Equipamento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 259
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'C_DIASATRASO'
              Title.Alignment = taCenter
              Visible = True
            end>
        end
      end
      object TSRotas: TTabSheet
        Caption = 'Rotas'
        ImageIndex = 2
        object Panel2: TPanel
          Left = 0
          Top = 130
          Width = 906
          Height = 217
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object GrdRotasEquip: TJvDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 3
            Width = 450
            Height = 213
            Margins.Left = 1
            Margins.Bottom = 1
            Align = alLeft
            Color = clBtnFace
            DataSource = DM.dsRotaEquipVencSeq
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            StyleElements = [seFont, seBorder]
            OnTitleClick = GrdManutTitleClick
            TitleButtons = True
            BevelInner = bvNone
            BevelOuter = bvNone
            AlternateRowColor = 16055512
            SortedField = 'CODIGO'
            TitleArrow = True
            SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
            EditControls = <>
            RowsHeight = 19
            TitleRowHeight = 19
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CODEQUIPATUAL'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'd. Equip.'
                Width = 93
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EQUIPATUAL'
                Title.Caption = 'Equipamento'
                Width = 318
                Visible = True
              end>
          end
          object GrdRotasEquipSeq: TJvDBGrid
            AlignWithMargins = True
            Left = 457
            Top = 3
            Width = 446
            Height = 213
            Margins.Left = 1
            Margins.Bottom = 1
            Align = alRight
            Color = clBtnFace
            DataSource = DM.dsRotaEquipVencSeqManut
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            StyleElements = [seFont, seBorder]
            OnTitleClick = GrdManutTitleClick
            TitleButtons = True
            BevelInner = bvNone
            BevelOuter = bvNone
            AlternateRowColor = 16055512
            SortedField = 'CODIGO'
            TitleArrow = True
            SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
            EditControls = <>
            RowsHeight = 19
            TitleRowHeight = 19
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CODIGO'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Manuten'#231#227'o'
                Width = 349
                Visible = True
              end>
          end
        end
        object GrdRotas: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 902
          Height = 126
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alTop
          DataSource = DM.dsRotaEquipVenc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          StyleElements = [seFont, seBorder]
          OnDrawColumnCell = GrdManutDrawColumnCell
          OnTitleClick = GrdManutTitleClick
          TitleButtons = True
          BevelInner = bvNone
          BevelOuter = bvNone
          AlternateRowColor = 16055512
          SortedField = 'CODIGO'
          TitleArrow = True
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 430
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FREQUENCIA'
              Title.Alignment = taCenter
              Title.Caption = 'Freq. (d)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAINICIO'
              Title.Alignment = taCenter
              Title.Caption = 'Programada'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'C_DIASATRASO'
              Title.Alignment = taCenter
              Width = 59
              Visible = True
            end>
        end
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 914
      Height = 37
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitWidth = 910
      object Label6: TLabel
        Left = 7
        Top = 9
        Width = 142
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fam'#237'lia de Equipamento:'
      end
      object Label13: TLabel
        Left = 442
        Top = 9
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'Oficina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BtnFamiliaEquip: TButton
        Left = 385
        Top = 4
        Width = 28
        Height = 28
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BtnFamiliaEquipClick
      end
      object EdtFamiliaEquip: TEdit
        Left = 154
        Top = 6
        Width = 225
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        StyleElements = [seFont, seClient]
        OnDblClick = EdtFamiliaEquipDblClick
      end
      object edtOficina: TEdit
        Left = 492
        Top = 6
        Width = 225
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        StyleElements = [seFont, seClient]
        OnDblClick = edtOficinaDblClick
      end
      object BtnOficina: TButton
        Left = 723
        Top = 4
        Width = 28
        Height = 29
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnOficinaClick
      end
    end
    object chbTodos: TCheckBox
      Left = 793
      Top = 46
      Width = 118
      Height = 17
      Caption = 'Selecionar todos'
      TabOrder = 3
      OnClick = chbTodosClick
    end
  end
  inherited PAuxiliares: TPanel
    Top = 497
    Width = 924
    TabOrder = 3
    ExplicitTop = 494
    ExplicitWidth = 920
  end
  inherited PBotoes: TPanel
    Top = 524
    Width = 924
    TabOrder = 0
    ExplicitTop = 521
    ExplicitWidth = 920
    inherited BtnOK: TButton
      Left = 382
      Caption = 'Executar'
      ModalResult = 0
      TabOrder = 1
      OnClick = BtnOKClick
      ExplicitLeft = 382
    end
    inherited BtnFechar: TButton
      Left = 466
      TabOrder = 0
      ExplicitLeft = 466
    end
  end
end

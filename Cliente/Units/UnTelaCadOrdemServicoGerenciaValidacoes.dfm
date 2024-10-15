inherited FrmTelaCadOrdemServicoGerenciaValidacoes: TFrmTelaCadOrdemServicoGerenciaValidacoes
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Aprova'#231#245'es de Ordens de Servi'#231'o'
  ClientHeight = 464
  ClientWidth = 1012
  Constraints.MaxHeight = 0
  Constraints.MaxWidth = 0
  Constraints.MinHeight = 500
  Constraints.MinWidth = 1024
  WindowState = wsMaximized
  OnResize = FormResize
  OnShow = FormShow
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 1024
  ExplicitHeight = 500
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1002
    object Label3: TLabel [1]
      Left = 127
      Top = 35
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cadastro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [2]
      Left = 294
      Top = 35
      Width = 7
      Height = 16
      Caption = 'a'
    end
    inherited BtnAjuda: TButton
      Left = 971
      ExplicitLeft = 965
    end
    object EdtData1: TJvDateTimePicker
      Left = 185
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 1
      DropDownDate = 44778.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 306
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 2
      DropDownDate = 44771.000000000000000000
    end
    object BtnConsultar: TButton
      Left = 413
      Top = 27
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnConsultarClick
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 348
    ExplicitWidth = 1000
    ExplicitHeight = 337
    inherited RGTelas: TRadioGroup
      Width = 1004
      Height = 346
      ExplicitWidth = 998
      ExplicitHeight = 335
    end
    object PCOrdensServico: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 340
      ActivePage = TSPreventivas
      Align = alClient
      TabOrder = 1
      OnChange = PCOrdensServicoChange
      ExplicitWidth = 992
      ExplicitHeight = 329
      object TSCorretivas: TTabSheet
        Caption = 'Corretivas'
        object DBGridCorret: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 984
          Height = 303
          Align = alClient
          DataSource = DM.dsOrdemServicoGerencia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGridCorretCellClick
          OnDrawColumnCell = DBGridCorretDrawColumnCell
          OnKeyPress = DBGridCorretKeyPress
          TitleButtons = True
          BevelInner = bvNone
          BevelOuter = bvNone
          AlternateRowColor = 16055512
          SortedField = 'CODIGO'
          TitleArrow = True
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'ORIGEM'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -9
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 6
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODIGO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'OS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 43
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODEQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Equip.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Equipamento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OFICINA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Oficina'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSAVEL'
              Title.Caption = 'Respons'#225'vel:'
              Width = 136
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 1'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNCIONARIO'
              Title.Caption = 'Solicitante'
              Width = 140
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 2'
              Width = 53
              Visible = True
            end>
        end
      end
      object TSPreventivas: TTabSheet
        Caption = 'Preventivas'
        ImageIndex = 1
        object DBGridPrev: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 984
          Height = 303
          Hint = 'D'#234' duplo-clique para visualizar mais informa'#231#245'es.'
          Align = alClient
          DataSource = DM.dsOrdemServicoGerencia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGridPrevCellClick
          OnDrawColumnCell = DBGridPrevDrawColumnCell
          OnDblClick = DBGridPrevDblClick
          OnKeyPress = DBGridPrevKeyPress
          TitleButtons = True
          BevelInner = bvNone
          BevelOuter = bvNone
          AlternateRowColor = 16055512
          SortedField = 'CODIGO'
          TitleArrow = True
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'ORIGEM'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -9
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 6
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODIGO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'OS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 43
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODEQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Equip.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Equipamento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OFICINA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Oficina'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSAVEL'
              Title.Caption = 'Respons'#225'vel:'
              Width = 136
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 1'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNCIONARIO'
              Title.Caption = 'Solicitante'
              Width = 140
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 2'
              Width = 53
              Visible = True
            end>
        end
      end
      object TSSolicitacoes: TTabSheet
        Caption = 'Solicita'#231#245'es'
        ImageIndex = 2
        object DBGridSolic: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 984
          Height = 303
          Align = alClient
          DataSource = DM.dsOrdemServicoGerencia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGridSolicCellClick
          OnDrawColumnCell = DBGridSolicDrawColumnCell
          OnKeyPress = DBGridSolicKeyPress
          TitleButtons = True
          BevelInner = bvNone
          BevelOuter = bvNone
          AlternateRowColor = 16055512
          SortedField = 'CODIGO'
          TitleArrow = True
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'ORIGEM'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -9
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 6
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODIGO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'OS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 43
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODEQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Equip.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Equipamento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OFICINA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Oficina'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSAVEL'
              Title.Caption = 'Respons'#225'vel:'
              Width = 136
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 1'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNCIONARIO'
              Title.Caption = 'Solicitante'
              Width = 140
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 2'
              Width = 53
              Visible = True
            end>
        end
      end
      object TSOutras: TTabSheet
        Caption = 'Outras'
        ImageIndex = 3
        object DBGridOutras: TJvDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 984
          Height = 303
          Align = alClient
          DataSource = DM.dsOrdemServicoGerencia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGridOutrasCellClick
          OnDrawColumnCell = DBGridOutrasDrawColumnCell
          OnKeyPress = DBGridOutrasKeyPress
          TitleButtons = True
          BevelInner = bvNone
          BevelOuter = bvNone
          AlternateRowColor = 16055512
          SortedField = 'CODIGO'
          TitleArrow = True
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 19
          Columns = <
            item
              Expanded = False
              FieldName = 'ORIGEM'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -9
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 6
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODIGO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'OS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 43
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CODEQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Equip.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EQUIPAMENTO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Equipamento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OFICINA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Caption = 'Oficina'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESPONSAVEL'
              Title.Caption = 'Respons'#225'vel:'
              Width = 136
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 1'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FUNCIONARIO'
              Title.Caption = 'Solicitante'
              Width = 140
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Status 2'
              Width = 53
              Visible = True
            end>
        end
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 420
    Width = 1008
    Height = 0
    ExplicitTop = 409
    ExplicitWidth = 1002
    ExplicitHeight = 0
  end
  inherited PBotoes: TPanel
    Top = 424
    Width = 1008
    ExplicitTop = 413
    ExplicitWidth = 1002
    inherited BtnOK: TButton
      Left = 0
      Visible = False
      ExplicitLeft = 0
    end
    inherited BtnFechar: TButton
      Left = 467
      OnClick = BtnFecharClick
      ExplicitLeft = 467
    end
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'icons8-0-por-cento'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000320000003208060000001E3F88
              B1000000097048597300000B1300000B1301009A9C1800000A4F694343505068
              6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
              DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
              114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
              7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
              11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
              07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
              801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
              7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
              450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
              305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
              99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
              99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
              BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
              EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
              E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
              814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
              582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
              00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
              6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
              44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
              801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
              3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
              21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
              46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
              74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
              6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
              128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
              51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
              37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
              DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
              E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
              B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
              DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
              197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
              0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
              E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
              C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
              D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
              744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
              AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
              53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
              4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
              35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
              8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
              4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
              6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
              A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
              67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
              DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
              1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
              9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
              D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
              EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
              7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
              F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
              0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
              D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
              C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
              17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
              8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
              91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
              31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
              C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
              2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
              B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
              6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
              1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
              66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
              CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
              61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
              FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
              D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
              F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
              625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
              F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
              E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
              9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
              DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
              D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
              058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
              AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
              1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
              D0A7FB93199393FF040398F3FC63332DDB000000206348524D00007A25000080
              830000F9FF000080E9000075300000EA6000003A980000176F925FC546000003
              DB4944415478DAEC9ACF6F134714C73FA7B8972290E534F2C5EEFF5281903098
              1B823F0035FC10E23FA08A239B75905051FF10206A178144E0822A4EB19D384E
              4FD09EB0EC6537D06426BBEE658C3693593BB6D766B1BAD2F7E4D1CC7C3CEFCD
              7BF366E8F57ACC83983B9018BE33C025C002D68126D0010E943AC0B6FACD526D
              4F4F3A685C2029E01AF0077008F446D421F03B7055F5357390EF80BBC03F634C
              3E4A7F037754DF3301390FFC152380AE5DE05C6C20819447A4FEA9DF064DE2C7
              7CBE562997ED46ADB6E1394EC317A21348290329A52F44C7739C46A356DBA894
              CB763E97AB0F017A04A40CF3181F04F801781B31E0C7076B6BF6BF7B7BBB8194
              BD51F4D9F35A55CBB2818F117DFF092CC60202E4D572EB8388AA65D9EA5FEF4D
              225F884EA55CB6016118A705E42702512B710C626969A9E9394E6352005D9EE3
              343299CC4E04CCE25820CA278E99D3E562F15520E55EDC1021ED5D2E165F4598
              596A1C90638E7DEBC68DE78194FE1421FAF26F2E2FBF30C0FC3A2AC8F9889598
              05C417988B85C26B03CCD99382A48023769A4EA7777D21BC19427C313383CFEC
              8683E62090BBFAEE340DC73EA9DC6EB70E486D4EB78781A4F4B4A36A59F6D782
              E86BB554B23590F77DC78F02B9A607BB38E2440C71A60DB8DADCAE0C023942FE
              606DEDABAF465F2A608641D6A340CEE8A9F83869C7B4F4C9759B1A88044E9940
              8A7A02981488BEB2D9EC960653308154C38D2AE5B29D341083D3DF37813C0D37
              6AD46A1B4903A96F6EBED4409E98405AE1469EE36C270DC4739C8606D23481B4
              C38D7C21DA4903393C38F8A0817C30811C841B0552EE270D2490725F03D99F6B
              90B931AD9D6FD0D9B7E765FB7D6C02B1921E104B2B2BCF34908A09E452B8513E
              97AB273045D9D6402E98404EEB49E367CF6B25386914514923AA189DA843D580
              34FEE9A0F3C8D5041FACBC510E562955154F94D3FF72EF9EBE1AEF808561C587
              3BDF40F1E1D649CB41CD0497835AE18AE3B002DDB90414E8A4A14017003F8D5A
              327DA4C3DC5C5E7E312318F9F3F5EBA692E9C3716ABF2955383ED2D9C542E1F5
              34CDCC17C28B2895BEE93BF838D70A8BFAC911E865329996DBEDD6A7E1D8E974
              BA6580D80132715CF4983A97ABA5921D47BAEF0BD1565BAC8C80C8C575F5B668
              323325B76A59F627D76D8E9376A888ED45F4FDA6BF12B180A80E52EA7E22F202
              339BCD6EAD964AE1CBD0B63A69EEFB42B4DD6EB75EDFDC7C595A5979664800F5
              DDE921B030F165E880EF6C84A9C5A5A6BEC54EF3C1404A95F6DFC708F04E45EC
              915E40C4F5846341256FEB118E3A4C5265B1574C5BEB2C41C2DF29A000DC079E
              A80734EDD0A39A36B0053C062AC005E0FBD81FD5FCFF5E2B21FA6F0006B67AB1
              D57B15C80000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-cancelar'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C180000030D49444154789C
              ED59CB6A1441146D7C2D5CFA58F9F8005742CFBD4E5603556D70E1765074E9DA
              756202060D64B23761227E82A80B134105FF41D10F30BA328968AA66E8711E25
              B7706674A693AEEAAEEE1E612E140C74D1734ED57D9C7BDBF3A636B5A9A53655
              AD1E6D7298910C1724C36792C327C9E1BBE0F88B16FD961C3FEA670C171A0196
              D59277C42BDA9AB3A50B82E3AAE0F0557254364B70F82218D61A153C9F3BF0FD
              6B97CF0A068F05C3962DF031220C5B82637DBFE29FC905BC08E09664B09716F8
              D862B82BD8959B990157BE7F5C707CE21C381F73AD0DFA2FB7E0AFFB2705C757
              59839743125BF49F2E4F3E37F072E8526F55F5D289D404F2701B79E04D603D25
              78B85D1478392051BA9108FC4F0EA725C79DA20948067B89522CE5F9C2C1F341
              3CAC5B81A7EA6855A482B26ADEBD630C48EF0DCAE66EC4B0D50CFC8BE6A7CF71
              D5067CFBF5A652DDAE0A6B4BB1FBC387F794EA7454FBDD1B2567676C48D48CC0
              93C8229D6205BE6F3124FAE0FBD6B620417A8B44632C01AD2A2D5CE16F40DA3A
              1D152E2F8E835F5E8CDCDBB470BD06F331968096C41601163E981F07367213A3
              273FD8B372DF2E98039837F1FFE7562F8D21E10C3CA7054FE36F801A0FEB171F
              40A2D7D560DD8047AA091F0C5C28B9548E24E10A3CD76B27DE855236299AC4E8
              A9EBDBE8A505AF04C3307B02E4F39104CCEA844C4B20950B45056C446067EA42
              3269104781EFF5A2833829096610C489D2E821A9D2A44E48A769D4B69019E479
              672418CCC512A0A1D3C44A095E023331C7703BB1983B24558EDE449BC4DC5533
              592D187E369EE691744D24A70DF27C9F840D78A909C08A11F8096D68C2062B9F
              3326A06F8163DD2AC0325DF0C8B3B51FB3E55393D1D4E36EE2B929CD2A8B2620
              185613811F90E0B051A0EBAC79698DFA50C1E145FE270F9BAA5239969AC070B8
              0B5B39BACD4B67C3DD91216F0E9909D69C9D7C94D1AC3293ECC4F05BEA80B59A
              9B325CA702E3C05D42CAF394B6BDBC8DAA23C90E63EDF42FF06D9207D615360B
              23914543279ADB9066A7C6833A3BFD018F2489EEF2E0FD9F6773A42A27E233EB
              D4A6E6FDFFF61B700B24C2B356A0020000000049454E44AE426082}
          end>
      end
      item
        Name = 'icons8-ok'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000097048597300000B1300000B1301009A9C18000002EB49444154789C
              ED99CF6B534110C71FFE3A78F4C7C91FFF8458EC293729ECCACE3B3C947A51D1
              9EA5102DBDE4D67A105BA8252DFE07296F0652F5A2E0D196F6A2288237B527FB
              E3DC08F5C96C5F030D2FC96EDEBE4D840C0CA40DC9FB7C67776667274130B4A1
              0D2DB745B5E8A4441815A4A625A958207C95087B92D41FED087B02E18B7E8FD4
              F4AD38BC51A9544E04FD3645EA8A44782611B6244162E7EA9720353B168797BD
              838FD5A28B926059906AD8831F7741AA214855655D5EF0022F498D4B52BB79C1
              3384EC8838BC5318F8B5E589D302E1956B70D92A0461899FE5145ED6E55941EA
              6DD1F0F2C811DEF033DD45DE273C3545BC8B6AD199DC027C6C1BD93E2FAAF9E0
              E3F06EBFE065D3D5ED9EE001E1BC40D81E0001BB3D9558AEF33E41EFBD1F6FBF
              951016ADE0F97474714899FAE4C707C9DAC18B64FEFB64BB5C68C8BABC6A1E7D
              6E0F3CC36F26F3DA3B88983582E7268BFB141FF0E5B547C9FAC15C139E9DFFBE
              9FB59D10B6B8693489FE683F22BF99C2B3A80EB930D255C0614B5C2CFC93F587
              99912F77804F5761CA64057020E1490B58E9BE02FAE23180F0A4057CEEBE0216
              AD72A7DA6D9AB06553F8C31CD836C901A3FAFFFCDB636380DC91A7E60AEC3B11
              C0F0A620CEE0C95040B72DC435DA14C8293C996E218324CEAAE11B7FE792A98D
              89C2E0A571121B96D14E220A8127D3326A7190B5AB2C59FF6351B9E049F7434F
              BB0AE0A193CD9766AD84F3C853EA7178DDA89913083F5D8870092F107E184FF3
              B875B57D40AB08A79127763513147DA13912E11C1E615FAC8A4BC602D255A8F6
              F2304E5617092B8F477F21B0B59BB5E8DC205CEA05A99D9EE7A63CABECBB000C
              A39EE09B221096FA18FD97415EE37BA84020FF02D4EBD287D2A9C085F1A0550F
              5CFD457ED5D970B765C85BF5B16D4AAE229F653CAB2CA63AA9DFB913D6726EBA
              C8074C6E70E4EF500B5CB603DFC6A723B71DB6BD93DE2AFA336AC6FA842DC2D2
              067084E736DCB3F3C5836F76E90F780DFD1AE113BFC72D31779503F133EBD086
              16FCFFF60F9F8B1573DDA257B50000000049454E44AE426082}
          end>
      end>
    Left = 523
    Top = 178
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'icons8-0-por-cento'
        Name = 'icons8-0-por-cento'
      end
      item
        CollectionIndex = 1
        CollectionName = 'icons8-cancelar'
        Name = 'icons8-cancelar'
      end
      item
        CollectionIndex = 2
        CollectionName = 'icons8-ok'
        Name = 'icons8-ok'
      end>
    ImageCollection = ImageCollection1
    Left = 659
    Top = 186
  end
  object PopupMenu: TPopupMenu
    Left = 792
    Top = 175
    object Aprovar1: TMenuItem
      Caption = 'Aprovar'
      ImageIndex = 0
      OnClick = Aprovar1Click
    end
    object Reprovar1: TMenuItem
      Caption = 'Reprovar'
      ImageIndex = 1
      OnClick = Reprovar1Click
    end
  end
end

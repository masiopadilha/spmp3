inherited FrmTelaAuxiliar: TFrmTelaAuxiliar
  Caption = 'Consulta'
  ClientHeight = 644
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Left = 4
    Top = 4
    Width = 1004
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 4
    ExplicitWidth = 998
    inherited Image1: TImage
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnAjuda: TButton
      Left = 971
      Margins.Right = 4
      ExplicitLeft = 965
    end
  end
  inherited PCentro: TPanel
    Left = 4
    Top = 147
    Width = 1004
    Height = 416
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 2
    ExplicitLeft = 4
    ExplicitTop = 147
    ExplicitWidth = 998
    ExplicitHeight = 405
    inherited RGTelas: TRadioGroup
      Top = 0
      Height = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alNone
      TabOrder = 2
      ExplicitTop = 0
      ExplicitWidth = 500
      ExplicitHeight = 0
    end
    object EdtConsulta: TEdit
      Left = 5
      Top = 6
      Width = 918
      Height = 24
      Hint = 'Informe a descri'#231#227'o e tecle ENTER para realizar a consulta.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = EdtConsultaKeyPress
    end
    object BtnConsultar: TButton
      AlignWithMargins = True
      Left = 929
      Top = 6
      Width = 70
      Height = 24
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = BtnConsultarClick
    end
    object GrdAuxiliar: TJvDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 35
      Width = 994
      Height = 376
      Hint = 'D'#234' duplo-clique para confirmar a consulta'
      Margins.Left = 4
      Margins.Top = 34
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      DataSource = DM.dsAuxiliar
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = GrdAuxiliarDblClick
      OnTitleClick = GrdAuxiliarTitleClick
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
    end
  end
  inherited PAuxiliares: TPanel
    Left = 4
    Top = 571
    Width = 1004
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 3
    ExplicitLeft = 4
    ExplicitTop = 560
    ExplicitWidth = 998
  end
  inherited PBotoes: TPanel
    Left = 4
    Top = 602
    Width = 1004
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 4
    ExplicitLeft = 4
    ExplicitTop = 591
    ExplicitWidth = 998
    inherited BtnOK: TButton
      Left = 423
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnClick = GrdAuxiliarDblClick
      ExplicitLeft = 423
    end
    inherited BtnFechar: TButton
      Left = 506
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnClick = BtnFecharClick
      ExplicitLeft = 506
    end
  end
  object PFiltroEquip: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 72
    Width = 1004
    Height = 67
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 1
    Visible = False
    ExplicitWidth = 998
    object Label6: TLabel
      Left = 15
      Top = 8
      Width = 142
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fam'#237'lia de Equipamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 571
      Top = 8
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = #193'rea:'
    end
    object Label1: TLabel
      Left = 568
      Top = 38
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'Linha:'
    end
    object Label2: TLabel
      Left = 117
      Top = 40
      Width = 40
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#233'lula:'
    end
    object EdtFamiliaEquip: TEdit
      Left = 163
      Top = 6
      Width = 355
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir o filtro.'
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      StyleElements = [seBorder]
      OnDblClick = EdtFamiliaEquipDblClick
    end
    object BtnFamiliaEquip: TButton
      Left = 522
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
      TabOrder = 1
      OnClick = BtnFamiliaEquipClick
    end
    object edtArea: TEdit
      Left = 612
      Top = 6
      Width = 355
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir o filtro.'
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      StyleElements = [seBorder]
      OnDblClick = edtAreaDblClick
    end
    object BtnArea: TButton
      Left = 971
      Top = 4
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnAreaClick
    end
    object edtLinha: TEdit
      Left = 612
      Top = 36
      Width = 355
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir o filtro.'
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
      StyleElements = [seBorder]
      OnDblClick = edtLinhaDblClick
    end
    object BtnLinha: TButton
      Left = 971
      Top = 34
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BtnLinhaClick
    end
    object EdtCelula: TEdit
      Left = 163
      Top = 38
      Width = 355
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir o filtro.'
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
      StyleElements = [seBorder]
      OnDblClick = EdtCelulaDblClick
    end
    object BtnCelula: TButton
      Left = 522
      Top = 36
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnCelulaClick
    end
  end
end

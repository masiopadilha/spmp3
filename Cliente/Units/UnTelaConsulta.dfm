inherited FrmTelaAuxiliar: TFrmTelaAuxiliar
  Caption = 'Consulta'
  ClientHeight = 564
  ClientWidth = 788
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ExplicitWidth = 800
  ExplicitHeight = 600
  TextHeight = 16
  inherited PTop: TPanel
    Left = 4
    Top = 4
    Width = 780
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 4
    ExplicitWidth = 776
    inherited Image1: TImage
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnAjuda: TButton
      Left = 740
      ExplicitLeft = 740
    end
  end
  inherited PCentro: TPanel
    Left = 4
    Top = 147
    Width = 780
    Height = 336
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 2
    ExplicitLeft = 4
    ExplicitTop = 147
    ExplicitWidth = 776
    ExplicitHeight = 333
    inherited RGTelas: TRadioGroup
      Top = 0
      Height = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alNone
      TabOrder = 3
      ExplicitTop = 0
      ExplicitWidth = 500
      ExplicitHeight = 0
    end
    object EdtConsulta: TEdit
      Left = 5
      Top = 6
      Width = 692
      Height = 24
      Hint = 'Informe a descri'#231#227'o e tecle ENTER para realizar a consulta.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = EdtConsultaKeyPress
    end
    object BtnConsultar: TButton
      AlignWithMargins = True
      Left = 705
      Top = 5
      Width = 70
      Height = 24
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = BtnConsultarClick
    end
    object GrdAuxiliar: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 35
      Width = 770
      Height = 296
      Hint = 'D'#234' duplo-clique para confirmar a consulta'
      Margins.Left = 4
      Margins.Top = 34
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      DataSource = DM.dsAuxiliar
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = GrdAuxiliarDrawColumnCell
      OnDblClick = GrdAuxiliarDblClick
      OnTitleClick = GrdAuxiliarTitleClick
    end
  end
  inherited PAuxiliares: TPanel
    Left = 4
    Top = 491
    Width = 780
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 3
    ExplicitLeft = 4
    ExplicitTop = 488
    ExplicitWidth = 776
  end
  inherited PBotoes: TPanel
    Left = 4
    Top = 522
    Width = 780
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 4
    ExplicitLeft = 4
    ExplicitTop = 519
    ExplicitWidth = 776
    inherited BtnOK: TButton
      Left = 310
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnClick = GrdAuxiliarDblClick
      ExplicitLeft = 310
    end
    inherited BtnFechar: TButton
      Left = 390
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnClick = BtnFecharClick
      ExplicitLeft = 390
    end
  end
  object PFiltroEquip: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 72
    Width = 780
    Height = 67
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    TabOrder = 1
    Visible = False
    ExplicitWidth = 776
    object Label6: TLabel
      Left = 17
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
      Left = 449
      Top = 8
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = #193'rea:'
    end
    object Label1: TLabel
      Left = 449
      Top = 38
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'Linha:'
    end
    object Label2: TLabel
      Left = 119
      Top = 40
      Width = 40
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#233'lula:'
    end
    object EdtFamiliaEquip: TEdit
      Left = 163
      Top = 6
      Width = 230
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
      Left = 395
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
      Left = 485
      Top = 6
      Width = 230
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
      Left = 717
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
      Left = 485
      Top = 36
      Width = 230
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
      Left = 717
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
      Width = 230
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
      Left = 395
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

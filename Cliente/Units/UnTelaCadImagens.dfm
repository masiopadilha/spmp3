inherited FrmTelaCadImagens: TFrmTelaCadImagens
  Caption = 'Imagens'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 661
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
      Left = 683
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LblDataAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
    end
    inherited LCadastro: TLabel
      Left = 557
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 553
    end
    inherited LCadastroPor: TLabel
      Left = 519
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 515
    end
  end
  inherited PCentro: TPanel
    object Label2: TLabel
      Left = 44
      Top = 54
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label6: TLabel
      Left = 44
      Top = 101
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object EdtDescricao: TDBEdit
      Left = 44
      Top = 74
      Width = 227
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsImagens
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEquipamento: TDBEdit
      Left = 44
      Top = 121
      Width = 197
      Height = 24
      Color = clBtnFace
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsImagens
      ReadOnly = True
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 243
      Top = 118
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnEquipamentoClick
    end
    object EdtPontoInspecao: TDBEdit
      Left = 44
      Top = 174
      Width = 197
      Height = 24
      Color = clBtnFace
      DataField = 'PONTO'
      DataSource = DM.dsImagens
      ReadOnly = True
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnPontoInspecao: TButton
      Left = 243
      Top = 171
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnPontoInspecaoClick
    end
    object PProgramacao: TPanel
      Left = 315
      Top = 23
      Width = 293
      Height = 211
      BevelInner = bvLowered
      Color = 14671839
      ParentBackground = False
      TabOrder = 5
      object Label3: TLabel
        Left = 5
        Top = 6
        Width = 52
        Height = 16
        Caption = 'IMAGEM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object ImgFotoEquip: TImage
        AlignWithMargins = True
        Left = 3
        Top = 24
        Width = 287
        Height = 184
        Margins.Left = 1
        Margins.Top = 22
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        AutoSize = True
        Center = True
        Proportional = True
        ExplicitLeft = 48
        ExplicitTop = 101
        ExplicitWidth = 129
        ExplicitHeight = 110
      end
    end
    object ChbTipo: TDBCheckBox
      Left = 44
      Top = 153
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'Ponto:'
      DataField = 'TIPO'
      DataSource = DM.dsImagens
      ParentBiDiMode = False
      TabOrder = 6
      ValueChecked = 'Ponto'
      ValueUnchecked = 'Equip'
      OnExit = TabNextTab1AfterTabChange
    end
    object BtnProcurar: TBitBtn
      Left = 375
      Top = 256
      Width = 84
      Height = 25
      Hint = 'Procurar foto no computador (Ctrl + P)'
      Caption = 'Anexar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BtnProcurarClick
      OnExit = TabNextTab1AfterTabChange
    end
    object BtnLimparEquip: TBitBtn
      Left = 465
      Top = 256
      Width = 84
      Height = 25
      Hint = 'Limpar foto (Ctrl + L)'
      Caption = 'Limpar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BtnLimparEquipClick
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 302
    Top = 52
  end
  object SPDFoto: TSavePictureDialog
    Filter = '.jpg;*.jpeg;'
    Left = 652
    Top = 117
  end
  object PopupMenuCons: TPopupMenu
    Left = 242
    Top = 51
    object Codigo1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Codigo1Click
    end
    object Descricao1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = Descricao1Click
    end
  end
  object PopupMenuCons2: TPopupMenu
    Left = 242
    Top = 107
    object MenuItem1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = MenuItem2Click
    end
  end
  object OPDFoto: TJvOpenDialog
    Filter = 'JPGl image files (*.jpg,*.jpeg)|*.JPG'
    Height = 0
    Width = 0
    Left = 708
    Top = 128
  end
end

inherited FrmTelaCadImagens: TFrmTelaCadImagens
  Caption = 'Imagens'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 502
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
      Left = 524
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LblDataAlt: TDBText
      Width = 75
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
      ExplicitWidth = 75
    end
    inherited LblDataCad: TDBText
      Width = 77
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
      ExplicitWidth = 77
    end
    inherited LblUsuAlt: TDBText
      Width = 75
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
      ExplicitWidth = 75
    end
    inherited LblUsuCad: TDBText
      Width = 77
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsImagens
      ExplicitWidth = 77
    end
    inherited LCadastro: TLabel
      Left = 396
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Left = 358
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label2: TLabel
      Left = 44
      Top = 73
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label6: TLabel
      Left = 44
      Top = 120
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object EdtDescricao: TDBEdit
      Left = 44
      Top = 93
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
      Top = 140
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
      Top = 137
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
      Top = 193
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
      Top = 190
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
      Top = 42
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
      Top = 172
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
  inherited StatusBar1: TStatusBar
    Top = 405
    Width = 628
  end
  inherited PAuxiliares: TPanel
    Top = 378
    Width = 624
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 350
    Top = 124
  end
  object SPDFoto: TSavePictureDialog
    Filter = '.jpg;*.jpeg;'
    Left = 476
    Top = 93
  end
  object PopupMenuCons: TPopupMenu
    Left = 282
    Top = 123
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
    Left = 282
    Top = 171
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
    Left = 484
    Top = 160
  end
end

inherited FrmTelaCadPneusChassiAtrelamento: TFrmTelaCadPneusChassiAtrelamento
  Caption = 'Atrelamentos'
  ClientHeight = 309
  ClientWidth = 788
  Constraints.MaxHeight = 345
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 345
  Constraints.MinWidth = 800
  OnCreate = FormCreate
  ExplicitWidth = 800
  ExplicitHeight = 345
  TextHeight = 16
  inherited PTop: TPanel
    Width = 784
    ExplicitWidth = 780
    inherited BtnAjuda: TButton
      Left = 751
      ExplicitLeft = 747
    end
    object BtnImprimir: TButton
      Left = 717
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
      Visible = False
      OnClick = BtnImprimirClick
    end
  end
  inherited PCentro: TPanel
    Width = 782
    Height = 170
    ExplicitWidth = 778
    ExplicitHeight = 167
    inherited RGTelas: TRadioGroup
      Width = 780
      Height = 168
      ExplicitWidth = 776
      ExplicitHeight = 165
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 774
      Height = 162
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 770
      ExplicitHeight = 159
      object ImgCavalo: TImage
        Left = 1
        Top = 54
        Width = 312
        Height = 99
        ParentShowHint = False
        Proportional = True
        ShowHint = True
      end
      object ImgCarroceria1: TImage
        Left = 198
        Top = 60
        Width = 288
        Height = 93
        ParentShowHint = False
        Proportional = True
        ShowHint = True
      end
      object ImgCarroceria2: TImage
        Left = 346
        Top = 60
        Width = 288
        Height = 93
        ParentShowHint = False
        Proportional = True
        ShowHint = True
      end
      object ImgCarroceria3: TImage
        Left = 482
        Top = 60
        Width = 286
        Height = 93
        ParentShowHint = False
        Proportional = True
        ShowHint = True
      end
      object Label4: TLabel
        Left = 5
        Top = 6
        Width = 82
        Height = 16
        Alignment = taRightJustify
        Caption = '1'#186' Carroceria:'
      end
      object Label6: TLabel
        Left = 265
        Top = 6
        Width = 82
        Height = 16
        Alignment = taRightJustify
        Caption = '2'#186' Carroceria:'
      end
      object Label7: TLabel
        Left = 517
        Top = 6
        Width = 82
        Height = 16
        Alignment = taRightJustify
        Caption = '3'#186' Carroceria:'
      end
      object EdtDescCarroceria1: TDBEdit
        Left = 5
        Top = 25
        Width = 220
        Height = 24
        Color = clBtnFace
        Ctl3D = True
        DataField = 'DESCEQUIPCARROCEIRA1'
        DataSource = DM.dsPneusChassiAtrelamento
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        StyleElements = [seFont, seClient]
      end
      object BtnCarroceria1: TButton
        Left = 227
        Top = 22
        Width = 28
        Height = 28
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        TabOrder = 1
        OnClick = BtnCarroceria1Click
      end
      object EdtDescCarroceria2: TDBEdit
        Left = 265
        Top = 25
        Width = 220
        Height = 24
        Color = clBtnFace
        Ctl3D = True
        DataField = 'DESCEQUIPCARROCEIRA2'
        DataSource = DM.dsPneusChassiAtrelamento
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        StyleElements = [seFont, seClient]
      end
      object BtnCarroceria2: TButton
        Left = 487
        Top = 23
        Width = 28
        Height = 28
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        TabOrder = 3
        OnClick = BtnCarroceria1Click
      end
      object EdtDescCarroceria3: TDBEdit
        Left = 517
        Top = 25
        Width = 220
        Height = 24
        Color = clBtnFace
        Ctl3D = True
        DataField = 'DESCEQUIPCARROCEIRA3'
        DataSource = DM.dsPneusChassiAtrelamento
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
        StyleElements = [seFont, seClient]
      end
      object BtnCarroceria3: TButton
        Left = 739
        Top = 23
        Width = 28
        Height = 28
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        TabOrder = 5
        OnClick = BtnCarroceria1Click
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 242
    Width = 784
    ExplicitTop = 239
    ExplicitWidth = 780
  end
  inherited PBotoes: TPanel
    Top = 269
    Width = 784
    ExplicitTop = 266
    ExplicitWidth = 780
    inherited BtnOK: TButton
      Left = 218
      Visible = False
      ExplicitLeft = 218
    end
    inherited BtnFechar: TButton
      Left = 353
      ExplicitLeft = 353
    end
  end
  object PopupMenuCarroc: TPopupMenu
    Left = 296
    Top = 18
    object Instalar1: TMenuItem
      Caption = 'Instalar'
      OnClick = Instalar1Click
    end
    object Remover1: TMenuItem
      Caption = 'Remover'
      OnClick = Remover1Click
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
    end
  end
end

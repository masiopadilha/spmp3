inherited FrmTelaCadEquipamentosImagens: TFrmTelaCadEquipamentosImagens
  Caption = 'Imagens do Equipamento'
  ClientHeight = 464
  ClientWidth = 548
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 560
  Constraints.MinHeight = 500
  Constraints.MinWidth = 560
  OnCreate = FormCreate
  ExplicitWidth = 560
  ExplicitHeight = 500
  TextHeight = 16
  inherited PTop: TPanel
    Width = 544
    ExplicitWidth = 540
    inherited BtnAjuda: TButton
      Left = 509
      Visible = False
      ExplicitLeft = 509
    end
  end
  inherited PCentro: TPanel
    Width = 542
    Height = 325
    ExplicitWidth = 538
    ExplicitHeight = 322
    inherited RGTelas: TRadioGroup
      Width = 540
      Height = 323
      Caption = 'Imagens do Equipamento:'
      ExplicitWidth = 536
      ExplicitHeight = 320
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 534
      Height = 317
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 530
      ExplicitHeight = 314
      object ImgFotoEquip: TImage
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 524
        Height = 243
        Margins.Top = 35
        Margins.Bottom = 35
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
        ExplicitLeft = 0
        ExplicitTop = -4
        ExplicitWidth = 440
        ExplicitHeight = 252
      end
      object Label1: TLabel
        Left = 6
        Top = 4
        Width = 60
        Height = 16
        Caption = 'Descri'#231#227'o:'
      end
      object lblDescricao: TDBText
        Left = 70
        Top = 4
        Width = 77
        Height = 16
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = DM.dsEquipamentosImagens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 29
        Top = 19
        Width = 37
        Height = 16
        Caption = 'Ponto:'
      end
      object lblPontoInsp: TDBText
        Left = 70
        Top = 19
        Width = 80
        Height = 16
        AutoSize = True
        DataField = 'DESCSECUNDARIO'
        DataSource = DM.dsEquipamentosImagens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBNavigator1: TDBNavigator
        Left = 153
        Top = 284
        Width = 224
        Height = 25
        DataSource = DM.dsEquipamentosImagens
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
        OnClick = DBNavigator1Click
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 397
    Width = 544
    ExplicitTop = 394
    ExplicitWidth = 540
  end
  inherited PBotoes: TPanel
    Top = 424
    Width = 544
    ExplicitTop = 421
    ExplicitWidth = 540
    inherited BtnOK: TButton
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 234
      ExplicitLeft = 234
    end
  end
end

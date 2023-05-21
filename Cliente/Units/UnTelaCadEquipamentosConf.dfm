inherited FrmTelaCadEquipamentosConf: TFrmTelaCadEquipamentosConf
  Caption = 'Confiabilidade do Equipamento'
  ClientHeight = 341
  ClientWidth = 364
  Constraints.MaxHeight = 380
  Constraints.MaxWidth = 380
  Constraints.MinHeight = 380
  Constraints.MinWidth = 380
  OnCreate = FormCreate
  ExplicitWidth = 380
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Left = 3
    Top = 3
    Width = 358
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 358
    inherited Image1: TImage
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnAjuda: TButton
      Left = 324
      ExplicitLeft = 324
    end
  end
  inherited PCentro: TPanel
    Left = 4
    Top = 70
    Width = 356
    Height = 194
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 70
    ExplicitWidth = 356
    ExplicitHeight = 194
    inherited RGTelas: TRadioGroup
      Width = 354
      Height = 192
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      TabOrder = 4
      ExplicitWidth = 354
      ExplicitHeight = 192
    end
    object ChbAtivado: TDBCheckBox
      Left = 39
      Top = 10
      Width = 68
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'CALCULARCONF'
      DataSource = DM.dsEquipamentos
      TabOrder = 0
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object RGPeriodo: TDBRadioGroup
      Left = 39
      Top = 33
      Width = 290
      Height = 56
      Caption = 'Per'#237'odo:'
      Columns = 3
      DataField = 'PERIODOCONF'
      DataSource = DM.dsEquipamentos
      Items.Strings = (
        '3 meses '
        '6 meses'
        '12 meses')
      TabOrder = 1
      Values.Strings = (
        '6 meses'
        '12 meses')
      OnChange = RGPeriodoChange
    end
    object GBEmissaoOS: TGroupBox
      Left = 39
      Top = 87
      Width = 103
      Height = 50
      Caption = 'Emitir OS (d):'
      TabOrder = 3
      object EdtEmissaoOS: TDBEdit
        Left = 9
        Top = 19
        Width = 78
        Height = 24
        DataField = 'DIASEMISSAOOS'
        DataSource = DM.dsEquipamentos
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 144
      Top = 87
      Width = 185
      Height = 50
      Caption = 'Fator de marcha admiss'#237'vel:'
      TabOrder = 2
      object EdtFtrMarcha: TDBEdit
        Left = 9
        Top = 19
        Width = 97
        Height = 24
        DataField = 'FATORMARCHAADM'
        DataSource = DM.dsEquipamentos
        MaxLength = 14
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 39
      Top = 137
      Width = 290
      Height = 50
      Caption = 'Per'#237'odo:'
      TabOrder = 5
      object LblParada1: TDBText
        Left = 62
        Top = 21
        Width = 72
        Height = 16
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'DATAINICIOCONF'
        DataSource = DM.dsEquipamentos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = [seFont, seBorder]
      end
      object Label28: TLabel
        Left = 141
        Top = 21
        Width = 8
        Height = 16
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblUltParada: TDBText
        Left = 155
        Top = 21
        Width = 81
        Height = 16
        AutoSize = True
        DataSource = DM.dsEquipamentos
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        StyleElements = [seFont, seBorder]
      end
    end
  end
  inherited PAuxiliares: TPanel
    Left = 3
    Top = 271
    Width = 358
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitLeft = 3
    ExplicitTop = 271
    ExplicitWidth = 358
  end
  inherited PBotoes: TPanel
    Left = 3
    Top = 300
    Width = 358
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitLeft = 3
    ExplicitTop = 300
    ExplicitWidth = 358
    inherited BtnOK: TButton
      Left = 106
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnClick = BtnOKClick
      ExplicitLeft = 106
    end
    inherited BtnFechar: TButton
      Left = 187
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      OnClick = BtnFecharClick
      ExplicitLeft = 187
    end
  end
end

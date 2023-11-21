inherited FrmTelaConsultaPeriodo: TFrmTelaConsultaPeriodo
  BorderStyle = bsDialog
  Caption = 'Per'#237'odo de Consulta'
  ClientHeight = 164
  ClientWidth = 328
  Constraints.MaxHeight = 200
  Constraints.MaxWidth = 340
  Constraints.MinHeight = 200
  Constraints.MinWidth = 340
  OnCreate = FormCreate
  ExplicitWidth = 340
  ExplicitHeight = 200
  TextHeight = 16
  inherited PTop: TPanel
    Width = 324
    ExplicitWidth = 320
    inherited BtnAjuda: TButton
      Left = 288
      Visible = False
      ExplicitLeft = 288
    end
  end
  inherited PCentro: TPanel
    Width = 322
    Height = 48
    ExplicitWidth = 318
    ExplicitHeight = 45
    inherited RGTelas: TRadioGroup
      Width = 320
      Height = 46
      ExplicitWidth = 316
      ExplicitHeight = 43
    end
    object CBMes: TComboBox
      Left = 85
      Top = 16
      Width = 89
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 10
      TabOrder = 1
      Text = 'Novembro'
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object CBAno: TComboBox
      Left = 176
      Top = 16
      Width = 64
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 2
      Items.Strings = (
        '2013'
        '2014'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020'
        '2021'
        '2022'
        '2023'
        '2024'
        '2025'
        '2026'
        '2027'
        '2028'
        '2029'
        '2030')
    end
  end
  inherited PAuxiliares: TPanel
    Top = 120
    Width = 324
    Height = 0
    ExplicitTop = 117
    ExplicitWidth = 320
    ExplicitHeight = 0
  end
  inherited PBotoes: TPanel
    Top = 124
    Width = 324
    ExplicitTop = 121
    ExplicitWidth = 320
    inherited BtnOK: TButton
      Left = 86
      OnClick = BtnOKClick
      ExplicitLeft = 86
    end
    inherited BtnFechar: TButton
      Left = 167
      ExplicitLeft = 167
    end
  end
end

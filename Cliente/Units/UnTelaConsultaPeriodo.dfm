inherited FrmTelaConsultaPeriodo: TFrmTelaConsultaPeriodo
  BorderStyle = bsDialog
  Caption = 'Per'#237'odo de Consulta'
  ClientHeight = 161
  ClientWidth = 324
  Constraints.MaxHeight = 200
  Constraints.MaxWidth = 340
  Constraints.MinHeight = 200
  Constraints.MinWidth = 340
  OnCreate = FormCreate
  ExplicitWidth = 340
  ExplicitHeight = 200
  TextHeight = 16
  inherited PTop: TPanel
    Width = 320
    ExplicitWidth = 330
    inherited BtnAjuda: TButton
      Visible = False
    end
  end
  inherited PCentro: TPanel
    Width = 318
    Height = 45
    ExplicitWidth = 328
    ExplicitHeight = 55
    inherited RGTelas: TRadioGroup
      Width = 320
      Height = 46
      ExplicitWidth = 326
      ExplicitHeight = 53
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
    Top = 117
    Width = 320
    Height = 0
    ExplicitTop = 127
    ExplicitWidth = 330
    ExplicitHeight = 0
  end
  inherited PBotoes: TPanel
    Top = 121
    Width = 320
    ExplicitTop = 131
    ExplicitWidth = 330
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

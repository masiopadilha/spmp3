inherited FrmTelaCadPneusChassiRelat: TFrmTelaCadPneusChassiRelat
  Caption = 'Custo de Pneus'
  ClientHeight = 241
  ClientWidth = 404
  Constraints.MaxHeight = 280
  Constraints.MaxWidth = 420
  Constraints.MinHeight = 280
  Constraints.MinWidth = 420
  OnCreate = FormCreate
  ExplicitWidth = 420
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 400
    ExplicitWidth = 400
    object Label1: TLabel [1]
      Left = 218
      Top = 36
      Width = 7
      Height = 16
      Caption = 'a'
    end
    inherited BtnAjuda: TButton
      Left = 363
      TabOrder = 2
      ExplicitLeft = 363
    end
    object EdtData1: TDateTimePicker
      Left = 124
      Top = 33
      Width = 90
      Height = 21
      Date = 44771.000000000000000000
      Time = 0.494387384256697300
      TabOrder = 0
    end
    object EdtData2: TDateTimePicker
      Left = 229
      Top = 33
      Width = 90
      Height = 21
      Date = 44771.000000000000000000
      Time = 0.494387384256697300
      TabOrder = 1
    end
  end
  inherited PCentro: TPanel
    Width = 398
    Height = 102
    ExplicitWidth = 398
    ExplicitHeight = 102
    inherited RGTelas: TRadioGroup
      Width = 396
      Height = 100
      ExplicitWidth = 396
      ExplicitHeight = 100
    end
    object RGTipo: TRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 390
      Height = 81
      Margins.Bottom = 16
      Align = alClient
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Equipamento'
        'Posi'#231#227'o'
        'ID')
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited PAuxiliares: TPanel
    Top = 174
    Width = 400
    ExplicitTop = 174
    ExplicitWidth = 400
  end
  inherited PBotoes: TPanel
    Top = 201
    Width = 400
    ExplicitTop = 201
    ExplicitWidth = 400
    inherited BtnOK: TButton
      Left = 122
      OnClick = BtnOKClick
      ExplicitLeft = 122
    end
    inherited BtnFechar: TButton
      Left = 203
      ExplicitLeft = 203
    end
  end
end

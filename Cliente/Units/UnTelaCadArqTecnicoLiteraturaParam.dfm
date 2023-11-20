inherited FrmTelaCadArqTecnicoLiteraturaParam: TFrmTelaCadArqTecnicoLiteraturaParam
  Caption = 'Par'#226'metro'
  ClientHeight = 181
  Constraints.MaxHeight = 240
  Constraints.MinHeight = 240
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LblDataAlt: TDBText
      DataSource = DM.dsArquivoTecnicoParam
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsArquivoTecnicoParam
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsArquivoTecnicoParam
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsArquivoTecnicoParam
    end
  end
  inherited PCentro: TPanel
    Height = 80
    ExplicitHeight = 80
    object Label4: TLabel
      Left = 190
      Top = 31
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object EdtDescricao: TDBEdit
      Left = 253
      Top = 29
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsArquivoTecnicoParam
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 162
    ExplicitTop = 162
  end
  inherited PAuxiliares: TPanel
    Top = 135
    ExplicitTop = 135
  end
end

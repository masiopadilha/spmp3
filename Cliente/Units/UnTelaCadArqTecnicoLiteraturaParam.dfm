inherited FrmTelaCadArqTecnicoLiteraturaParam: TFrmTelaCadArqTecnicoLiteraturaParam
  Caption = 'Par'#226'metro'
  ClientHeight = 219
  Constraints.MaxHeight = 300
  Constraints.MinHeight = 240
  ExplicitHeight = 275
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
    Height = 96
    ExplicitHeight = 58
    object Label4: TLabel
      Left = 64
      Top = 29
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object EdtDescricao: TDBEdit
      Left = 64
      Top = 47
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
    Top = 200
    ExplicitTop = 162
  end
  inherited PAuxiliares: TPanel
    Top = 173
    ExplicitTop = 135
  end
end

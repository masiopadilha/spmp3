inherited FrmTelaCadArqTecnicoLiteraturaParam: TFrmTelaCadArqTecnicoLiteraturaParam
  Caption = 'Par'#226'metro'
  ClientHeight = 184
  ClientWidth = 628
  Constraints.MaxHeight = 240
  Constraints.MinHeight = 240
  ExplicitHeight = 240
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 517
    end
    inherited LAlteradoPor: TLabel
      Left = 539
    end
    inherited LblDataAlt: TDBText
      Left = 572
      DataSource = DM.dsArquivoTecnicoParam
    end
    inherited LblDataCad: TDBText
      Left = 444
      DataSource = DM.dsArquivoTecnicoParam
    end
    inherited LblUsuAlt: TDBText
      Left = 572
      DataSource = DM.dsArquivoTecnicoParam
    end
    inherited LblUsuCad: TDBText
      Left = 444
      DataSource = DM.dsArquivoTecnicoParam
    end
    inherited LCadastro: TLabel
      Left = 411
    end
    inherited LCadastroPor: TLabel
      Left = 373
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 83
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
    Top = 165
    Width = 628
    ExplicitTop = 162
  end
  inherited PAuxiliares: TPanel
    Top = 138
    Width = 624
    ExplicitTop = 135
  end
end

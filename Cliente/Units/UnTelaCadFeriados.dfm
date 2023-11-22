inherited FrmTelaCadFeriados: TFrmTelaCadFeriados
  Caption = 'Feriados'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 505
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 505
    end
    inherited LAlteradoPor: TLabel
      Left = 527
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 527
    end
    inherited LblDataAlt: TDBText
      Left = 560
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFeriados
      ExplicitLeft = 560
    end
    inherited LblDataCad: TDBText
      Left = 432
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFeriados
      ExplicitLeft = 432
    end
    inherited LblUsuAlt: TDBText
      Left = 560
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFeriados
      ExplicitLeft = 560
    end
    inherited LblUsuCad: TDBText
      Left = 432
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFeriados
      ExplicitLeft = 432
    end
    inherited LCadastro: TLabel
      Left = 399
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 399
    end
    inherited LCadastroPor: TLabel
      Left = 361
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 361
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label2: TLabel
      Left = 182
      Top = 90
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 166
      Top = 120
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label1: TLabel
      Left = 195
      Top = 151
      Width = 31
      Height = 16
      Alignment = taRightJustify
      Caption = 'Data:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 230
      Top = 88
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsFeriados
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 230
      Top = 119
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsFeriados
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtData: TJvDBMaskEdit
      Left = 230
      Top = 150
      Width = 125
      Height = 24
      DataField = 'DATAFERIADO'
      DataSource = DM.dsFeriados
      MaxLength = 5
      TabOrder = 2
      EditMask = '!00/00;1;_'
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
end

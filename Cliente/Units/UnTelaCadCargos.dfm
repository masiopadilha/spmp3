inherited FrmTelaCadCargos: TFrmTelaCadCargos
  Caption = 'Cargos'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 511
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 511
    end
    inherited LAlteradoPor: TLabel
      Left = 533
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 533
    end
    inherited LblDataAlt: TDBText
      Left = 566
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCargos
      ExplicitLeft = 566
    end
    inherited LblDataCad: TDBText
      Left = 448
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCargos
    end
    inherited LblUsuAlt: TDBText
      Left = 566
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCargos
      ExplicitLeft = 566
    end
    inherited LblUsuCad: TDBText
      Left = 448
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCargos
    end
    inherited LCadastro: TLabel
      Left = 415
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Left = 377
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label2: TLabel
      Left = 190
      Top = 90
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 174
      Top = 120
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 238
      Top = 88
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsCargos
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 238
      Top = 119
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsCargos
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
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

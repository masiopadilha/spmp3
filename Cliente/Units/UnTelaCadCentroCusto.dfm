inherited FrmTelaCadCentroCusto: TFrmTelaCadCentroCusto
  Caption = 'Centro de Custo'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 514
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 510
    end
    inherited LAlteradoPor: TLabel
      Left = 536
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 532
    end
    inherited LblDataAlt: TDBText
      Left = 569
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCentroCusto
      ExplicitLeft = 565
    end
    inherited LblDataCad: TDBText
      Left = 445
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCentroCusto
      ExplicitLeft = 445
    end
    inherited LblUsuAlt: TDBText
      Left = 569
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCentroCusto
      ExplicitLeft = 565
    end
    inherited LblUsuCad: TDBText
      Left = 445
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsCentroCusto
      ExplicitLeft = 445
    end
    inherited LCadastro: TLabel
      Left = 412
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 412
    end
    inherited LCadastroPor: TLabel
      Left = 374
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 374
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label2: TLabel
      Left = 190
      Top = 92
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 174
      Top = 122
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 238
      Top = 90
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsCentroCusto
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 238
      Top = 121
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsCentroCusto
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 196
      Top = 153
      Width = 57
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsCentroCusto
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 297
      Top = 153
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsCentroCusto
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
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
  inherited MainMenuPadrao: TMainMenu
    Left = 246
    Top = 76
  end
end

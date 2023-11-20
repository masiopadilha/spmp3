inherited FrmTelaCadTipoManutencao: TFrmTelaCadTipoManutencao
  Caption = 'Tipos de Manuten'#231#227'o'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 504
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 500
    end
    inherited LAlteradoPor: TLabel
      Left = 526
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 522
    end
    inherited LblDataAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsTipoManutencao
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsTipoManutencao
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsTipoManutencao
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsTipoManutencao
    end
    inherited LCadastro: TLabel
      Left = 398
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 394
    end
    inherited LCadastroPor: TLabel
      Left = 360
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 356
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label4: TLabel
      Left = 170
      Top = 123
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label2: TLabel
      Left = 186
      Top = 92
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label1: TLabel
      Left = 200
      Top = 154
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 234
      Top = 90
      Width = 131
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsTipoManutencao
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 234
      Top = 121
      Width = 227
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsTipoManutencao
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBTipo: TDBComboBox
      Left = 234
      Top = 152
      Width = 167
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPOMANUTENCAO'
      DataSource = DM.dsTipoManutencao
      Items.Strings = (
        'Manuten'#231#227'o Aut'#244'noma'
        'Manuten'#231#227'o Corretiva'
        'Manuten'#231#227'o Preventiva'
        'Manuten'#231#227'o Preditiva'
        'Lubrifica'#231#227'o'
        'Novos Projetos'
        'Altera'#231#245'es de Projetos'
        'Outros Servi'#231'os')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbConf: TDBCheckBox
      Left = 143
      Top = 183
      Width = 108
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Confiabilidade:'
      DataField = 'CONFIABILIDADE'
      DataSource = DM.dsTipoManutencao
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 194
      Top = 212
      Width = 57
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsTipoManutencao
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 295
      Top = 212
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsTipoManutencao
      TabOrder = 5
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
end

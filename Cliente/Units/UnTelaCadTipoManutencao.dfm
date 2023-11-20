inherited FrmTelaCadTipoManutencao: TFrmTelaCadTipoManutencao
  Caption = 'Tipos de Manuten'#231#227'o'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 661
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
      Left = 683
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      Left = 558
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Left = 520
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    object Label1: TLabel
      Left = 432
      Top = 89
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object Label2: TLabel
      Left = 64
      Top = 89
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 195
      Top = 89
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object CBTipo: TDBComboBox
      Left = 432
      Top = 107
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
      Left = 217
      Top = 140
      Width = 108
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Confiabilidade:'
      DataField = 'CONFIABILIDADE'
      DataSource = DM.dsTipoManutencao
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 106
      Width = 125
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
      Left = 195
      Top = 106
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsTipoManutencao
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 64
      Top = 140
      Width = 63
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsTipoManutencao
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 140
      Top = 140
      Width = 71
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsTipoManutencao
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
  end
end

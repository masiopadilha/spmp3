inherited FrmTelaCadTipoProgramacao: TFrmTelaCadTipoProgramacao
  Caption = 'Tipos de Programa'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
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
      DataSource = DM.dsTipoProgramacao
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsTipoProgramacao
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsTipoProgramacao
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsTipoProgramacao
    end
    inherited LCadastro: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    object Label2: TLabel
      Left = 186
      Top = 92
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 170
      Top = 123
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label1: TLabel
      Left = 200
      Top = 153
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
      DataSource = DM.dsTipoProgramacao
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
      DataSource = DM.dsTipoProgramacao
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 194
      Top = 178
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsTipoProgramacao
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 300
      Top = 178
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsTipoProgramacao
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object CBTipo: TDBComboBox
      Left = 234
      Top = 152
      Width = 131
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPO'
      DataSource = DM.dsTipoProgramacao
      Items.Strings = (
        'Data'
        'Num'#233'rico')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
    end
  end
end

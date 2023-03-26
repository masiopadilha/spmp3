inherited FrmTelaCadMotivoParada: TFrmTelaCadMotivoParada
  Caption = 'Motivos de Paradas'
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
      DataSource = DM.dsMotivoParada
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsMotivoParada
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsMotivoParada
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsMotivoParada
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
      DataSource = DM.dsMotivoParada
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
      DataSource = DM.dsMotivoParada
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 198
      Top = 150
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsMotivoParada
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 298
      Top = 150
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsMotivoParada
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
  end
end

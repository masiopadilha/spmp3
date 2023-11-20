inherited FrmTelaCadFeriados: TFrmTelaCadFeriados
  Caption = 'Feriados'
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
      DataSource = DM.dsFeriados
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFeriados
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFeriados
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFeriados
    end
    inherited LCadastro: TLabel
      Left = 557
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 553
    end
    inherited LCadastroPor: TLabel
      Left = 519
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 515
    end
  end
  inherited PCentro: TPanel
    object Label1: TLabel
      Left = 430
      Top = 96
      Width = 31
      Height = 16
      Alignment = taRightJustify
      Caption = 'Data:'
    end
    object Label2: TLabel
      Left = 64
      Top = 96
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 195
      Top = 96
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object EdtData: TJvDBMaskEdit
      Left = 430
      Top = 113
      Width = 125
      Height = 24
      DataField = 'DATAFERIADO'
      DataSource = DM.dsFeriados
      MaxLength = 5
      TabOrder = 2
      EditMask = '!00/00;1;_'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 113
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
      Left = 195
      Top = 113
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsFeriados
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
end

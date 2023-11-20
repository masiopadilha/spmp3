inherited FrmTelaCadFabricantes: TFrmTelaCadFabricantes
  Caption = 'Fabricantes'
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
      DataSource = DM.dsFabricantes
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFabricantes
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFabricantes
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFabricantes
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
    object Label2: TLabel
      Left = 64
      Top = 72
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label1: TLabel
      Left = 193
      Top = 72
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label3: TLabel
      Left = 427
      Top = 72
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'CNPJ:'
      FocusControl = EdtCNPJ
    end
    object Label6: TLabel
      Left = 540
      Top = 72
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fone:'
    end
    object Label4: TLabel
      Left = 64
      Top = 118
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Endere'#231'o:'
      FocusControl = EdtEndereco
    end
    object Label5: TLabel
      Left = 279
      Top = 118
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'Email:'
      FocusControl = EdtEmail
    end
    object Label7: TLabel
      Left = 470
      Top = 118
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Contato:'
      FocusControl = EdtContato
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 89
      Width = 121
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsFabricantes
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 193
      Top = 89
      Width = 229
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsFabricantes
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCNPJ: TDBEdit
      Left = 427
      Top = 89
      Width = 109
      Height = 24
      DataField = 'ID'
      DataSource = DM.dsFabricantes
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtFone: TJvDBMaskEdit
      Left = 540
      Top = 89
      Width = 100
      Height = 24
      DataField = 'FONE'
      DataSource = DM.dsFabricantes
      MaxLength = 15
      TabOrder = 3
      EditMask = '!(99) 99999-9999;1;_'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEndereco: TDBEdit
      Left = 64
      Top = 135
      Width = 210
      Height = 24
      DataField = 'ENDERECO'
      DataSource = DM.dsFabricantes
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEmail: TDBEdit
      Left = 279
      Top = 135
      Width = 186
      Height = 24
      CharCase = ecLowerCase
      DataField = 'EMAIL'
      DataSource = DM.dsFabricantes
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtContato: TDBEdit
      Left = 470
      Top = 135
      Width = 170
      Height = 24
      DataField = 'CONTATO'
      DataSource = DM.dsFabricantes
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 63
      Top = 167
      Width = 57
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsFabricantes
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 128
      Top = 167
      Width = 63
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsFabricantes
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
end

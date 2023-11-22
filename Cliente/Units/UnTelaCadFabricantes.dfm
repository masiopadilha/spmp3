inherited FrmTelaCadFabricantes: TFrmTelaCadFabricantes
  Caption = 'Fabricantes'
  TextHeight = 16
  inherited PControle: TPanel
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
      DataSource = DM.dsFabricantes
      ExplicitLeft = 556
    end
    inherited LblDataCad: TDBText
      Left = 432
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFabricantes
      ExplicitLeft = 428
    end
    inherited LblUsuAlt: TDBText
      Left = 560
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFabricantes
      ExplicitLeft = 556
    end
    inherited LblUsuCad: TDBText
      Left = 432
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFabricantes
      ExplicitLeft = 428
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
    Caption = 'DM.dsFornecedores'
    object Label1: TLabel
      Left = 188
      Top = 60
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label2: TLabel
      Left = 172
      Top = 91
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
      FocusControl = EdtDescricao
    end
    object Label3: TLabel
      Left = 199
      Top = 123
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'CNPJ:'
      FocusControl = EdtCNPJ
    end
    object Label4: TLabel
      Left = 174
      Top = 155
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Endere'#231'o:'
      FocusControl = EdtEndereco
    end
    object Label5: TLabel
      Left = 196
      Top = 187
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'Email:'
      FocusControl = EdtEmail
    end
    object Label6: TLabel
      Left = 199
      Top = 219
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fone:'
    end
    object Label7: TLabel
      Left = 183
      Top = 251
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Contato:'
      FocusControl = EdtContato
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 238
      Top = 58
      Width = 121
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsFabricantes
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 237
      Top = 90
      Width = 226
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsFabricantes
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCNPJ: TDBEdit
      Left = 237
      Top = 122
      Width = 121
      Height = 24
      DataField = 'ID'
      DataSource = DM.dsFabricantes
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEndereco: TDBEdit
      Left = 237
      Top = 154
      Width = 226
      Height = 24
      DataField = 'ENDERECO'
      DataSource = DM.dsFabricantes
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEmail: TDBEdit
      Left = 237
      Top = 186
      Width = 226
      Height = 24
      CharCase = ecLowerCase
      DataField = 'EMAIL'
      DataSource = DM.dsFabricantes
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtFone: TJvDBMaskEdit
      Left = 237
      Top = 218
      Width = 123
      Height = 24
      DataField = 'FONE'
      DataSource = DM.dsFabricantes
      MaxLength = 15
      TabOrder = 5
      EditMask = '!(99) 99999-9999;1;_'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtContato: TDBEdit
      Left = 237
      Top = 250
      Width = 228
      Height = 24
      DataField = 'CONTATO'
      DataSource = DM.dsFabricantes
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 196
      Top = 280
      Width = 59
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
      Left = 304
      Top = 280
      Width = 65
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

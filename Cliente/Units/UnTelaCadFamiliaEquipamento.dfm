inherited FrmTelaCadFamiliaEquipamento: TFrmTelaCadFamiliaEquipamento
  Caption = 'Fam'#237'lias de Equipamentos'
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
      DataSource = DM.dsFamEquipamento
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFamEquipamento
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFamEquipamento
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsFamEquipamento
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
      Left = 79
      Top = 60
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 316
      Top = 60
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label35: TLabel
      Left = 71
      Top = 90
      Width = 52
      Height = 16
      Caption = 'Campo1:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 324
      Top = 90
      Width = 52
      Height = 16
      Caption = 'Campo2:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 71
      Top = 121
      Width = 52
      Height = 16
      Caption = 'Campo3:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 324
      Top = 121
      Width = 52
      Height = 16
      Caption = 'Campo4:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 71
      Top = 152
      Width = 52
      Height = 16
      Caption = 'Campo5:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 324
      Top = 152
      Width = 52
      Height = 16
      Caption = 'Campo6:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 71
      Top = 183
      Width = 52
      Height = 16
      Caption = 'Campo7:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 324
      Top = 183
      Width = 52
      Height = 16
      Caption = 'Campo8:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 71
      Top = 214
      Width = 52
      Height = 16
      Caption = 'Campo9:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 317
      Top = 214
      Width = 59
      Height = 16
      Caption = 'Campo10:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 64
      Top = 245
      Width = 59
      Height = 16
      Caption = 'Campo11:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 317
      Top = 245
      Width = 59
      Height = 16
      Caption = 'Campo12:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ChbCampo1: TDBCheckBox
      Left = 290
      Top = 93
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N1'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo3: TDBCheckBox
      Left = 290
      Top = 124
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N3'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo5: TDBCheckBox
      Left = 290
      Top = 155
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N5'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo7: TDBCheckBox
      Left = 290
      Top = 186
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N7'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo9: TDBCheckBox
      Left = 290
      Top = 217
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N9'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo11: TDBCheckBox
      Left = 290
      Top = 248
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N11'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo2: TDBCheckBox
      Left = 548
      Top = 93
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N2'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo4: TDBCheckBox
      Left = 548
      Top = 124
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N4'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object ChbCampo6: TDBCheckBox
      Left = 548
      Top = 155
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N6'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo8: TDBCheckBox
      Left = 548
      Top = 186
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N8'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo10: TDBCheckBox
      Left = 548
      Top = 217
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N10'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbCampo12: TDBCheckBox
      Left = 548
      Top = 248
      Width = 16
      Height = 17
      Hint = 'Campo num'#233'rico?'
      DataField = 'N12'
      DataSource = DM.dsFamEquipamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 127
      Top = 58
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsFamEquipamento
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 380
      Top = 58
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsFamEquipamento
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo1: TDBEdit
      Left = 127
      Top = 89
      Width = 160
      Height = 24
      DataField = 'CAMPO1'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo2: TDBEdit
      Left = 380
      Top = 89
      Width = 160
      Height = 24
      DataField = 'CAMPO2'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo3: TDBEdit
      Left = 127
      Top = 120
      Width = 160
      Height = 24
      DataField = 'CAMPO3'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo4: TDBEdit
      Left = 380
      Top = 120
      Width = 160
      Height = 24
      DataField = 'CAMPO4'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo5: TDBEdit
      Left = 127
      Top = 151
      Width = 160
      Height = 24
      DataField = 'CAMPO5'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo6: TDBEdit
      Left = 380
      Top = 151
      Width = 160
      Height = 24
      DataField = 'CAMPO6'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 12
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo7: TDBEdit
      Left = 127
      Top = 182
      Width = 160
      Height = 24
      DataField = 'CAMPO7'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 14
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo8: TDBEdit
      Left = 380
      Top = 182
      Width = 160
      Height = 24
      DataField = 'CAMPO8'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 16
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo9: TDBEdit
      Left = 127
      Top = 213
      Width = 160
      Height = 24
      DataField = 'CAMPO9'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 18
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo10: TDBEdit
      Left = 380
      Top = 213
      Width = 160
      Height = 24
      DataField = 'CAMPO10'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 20
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo11: TDBEdit
      Left = 127
      Top = 244
      Width = 160
      Height = 24
      DataField = 'CAMPO11'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 22
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo12: TDBEdit
      Left = 380
      Top = 244
      Width = 160
      Height = 24
      DataField = 'CAMPO12'
      DataSource = DM.dsFamEquipamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 24
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 87
      Top = 273
      Width = 58
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsFamEquipamento
      TabOrder = 26
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 157
      Top = 273
      Width = 67
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsFamEquipamento
      TabOrder = 27
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 166
    Top = 44
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 180
    Top = 96
  end
end

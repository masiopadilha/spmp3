inherited FrmTelaCadFamiliaPneus: TFrmTelaCadFamiliaPneus
  Caption = 'Familia de Pneus'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 506
      ExplicitLeft = 502
    end
    inherited LAlteradoPor: TLabel
      Left = 528
      ExplicitLeft = 524
    end
    inherited LblDataAlt: TDBText
      Left = 562
      DataSource = DM.dsFamPneus
      ExplicitLeft = 562
    end
    inherited LblDataCad: TDBText
      Left = 434
      DataSource = DM.dsFamPneus
      ExplicitLeft = 434
    end
    inherited LblUsuAlt: TDBText
      Left = 562
      DataSource = DM.dsFamPneus
      ExplicitLeft = 562
    end
    inherited LblUsuCad: TDBText
      Left = 434
      DataSource = DM.dsFamPneus
      ExplicitLeft = 434
    end
    inherited LCadastro: TLabel
      Left = 400
      ExplicitLeft = 396
    end
    inherited LCadastroPor: TLabel
      Left = 362
      ExplicitLeft = 358
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
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
    object Label10: TLabel
      Left = 309
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
    object Label11: TLabel
      Left = 309
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
    object Label12: TLabel
      Left = 302
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
    object Label13: TLabel
      Left = 302
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
    object Label2: TLabel
      Left = 79
      Top = 60
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
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
    object Label4: TLabel
      Left = 301
      Top = 60
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
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
    object Label8: TLabel
      Left = 309
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
    object Label9: TLabel
      Left = 309
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
    object ChbAtivoNF: TDBCheckBox
      Left = 87
      Top = 273
      Width = 58
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsFamPneus
      TabOrder = 14
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
      DataSource = DM.dsFamPneus
      TabOrder = 15
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtCampo1: TDBEdit
      Left = 127
      Top = 89
      Width = 160
      Height = 24
      DataField = 'CAMPO1'
      DataSource = DM.dsFamPneus
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
    object EdtCampo10: TDBEdit
      Left = 365
      Top = 213
      Width = 160
      Height = 24
      DataField = 'CAMPO10'
      DataSource = DM.dsFamPneus
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 11
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo11: TDBEdit
      Left = 127
      Top = 244
      Width = 160
      Height = 24
      DataField = 'CAMPO11'
      DataSource = DM.dsFamPneus
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
    object EdtCampo12: TDBEdit
      Left = 365
      Top = 244
      Width = 160
      Height = 24
      DataField = 'CAMPO12'
      DataSource = DM.dsFamPneus
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 13
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo2: TDBEdit
      Left = 365
      Top = 89
      Width = 160
      Height = 24
      DataField = 'CAMPO2'
      DataSource = DM.dsFamPneus
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo3: TDBEdit
      Left = 127
      Top = 120
      Width = 160
      Height = 24
      DataField = 'CAMPO3'
      DataSource = DM.dsFamPneus
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
    object EdtCampo4: TDBEdit
      Left = 365
      Top = 120
      Width = 160
      Height = 24
      DataField = 'CAMPO4'
      DataSource = DM.dsFamPneus
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo5: TDBEdit
      Left = 127
      Top = 151
      Width = 160
      Height = 24
      DataField = 'CAMPO5'
      DataSource = DM.dsFamPneus
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
    object EdtCampo6: TDBEdit
      Left = 365
      Top = 151
      Width = 160
      Height = 24
      DataField = 'CAMPO6'
      DataSource = DM.dsFamPneus
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo7: TDBEdit
      Left = 127
      Top = 182
      Width = 160
      Height = 24
      DataField = 'CAMPO7'
      DataSource = DM.dsFamPneus
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
    object EdtCampo8: TDBEdit
      Left = 365
      Top = 182
      Width = 160
      Height = 24
      DataField = 'CAMPO8'
      DataSource = DM.dsFamPneus
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCampo9: TDBEdit
      Left = 127
      Top = 213
      Width = 160
      Height = 24
      DataField = 'CAMPO9'
      DataSource = DM.dsFamPneus
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
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 127
      Top = 58
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsFamPneus
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 365
      Top = 58
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsFamPneus
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

inherited FrmTelaCadAlmoxarifados: TFrmTelaCadAlmoxarifados
  Caption = 'Almoxarifados'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LblDataAlt: TDBText
      DataSource = DM.dsAlmoxarifado
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsAlmoxarifado
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsAlmoxarifado
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsAlmoxarifado
    end
  end
  inherited PCentro: TPanel
    object Label1: TLabel
      Left = 190
      Top = 60
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label2: TLabel
      Left = 174
      Top = 91
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label3: TLabel
      Left = 180
      Top = 122
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Materias:'
      FocusControl = EdtDescricao
    end
    object Label4: TLabel
      Left = 170
      Top = 153
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde Itens:'
      FocusControl = EdtMateriais
    end
    object Label5: TLabel
      Left = 170
      Top = 184
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = #193'rea (m2):'
      FocusControl = EdtQtdeItens
    end
    object Label6: TLabel
      Left = 137
      Top = 215
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
      FocusControl = EdtArea
    end
    object BtnCentroCusto: TButton
      Left = 469
      Top = 212
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BtnCentroCustoClick
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 199
      Top = 245
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsAlmoxarifado
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 298
      Top = 245
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsAlmoxarifado
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtArea: TDBEdit
      Left = 238
      Top = 183
      Width = 125
      Height = 24
      DataField = 'AREA'
      DataSource = DM.dsAlmoxarifado
      MaxLength = 9
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCentroCusto: TDBEdit
      Left = 238
      Top = 214
      Width = 230
      Height = 24
      Color = clBtnFace
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsAlmoxarifado
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 238
      Top = 59
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsAlmoxarifado
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 238
      Top = 90
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsAlmoxarifado
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtMateriais: TDBEdit
      Left = 238
      Top = 121
      Width = 230
      Height = 24
      DataField = 'MATERIAL'
      DataSource = DM.dsAlmoxarifado
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtQtdeItens: TDBEdit
      Left = 238
      Top = 152
      Width = 125
      Height = 24
      DataField = 'NUMITENS'
      DataSource = DM.dsAlmoxarifado
      MaxLength = 9
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
  end
end

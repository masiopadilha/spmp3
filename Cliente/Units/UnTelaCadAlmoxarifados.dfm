inherited FrmTelaCadAlmoxarifados: TFrmTelaCadAlmoxarifados
  Caption = 'Almoxarifados'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
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
    Width = 780
    Height = 248
    object Label1: TLabel
      Left = 64
      Top = 73
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label2: TLabel
      Left = 194
      Top = 73
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label3: TLabel
      Left = 429
      Top = 73
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Materias:'
      FocusControl = EdtDescricao
    end
    object Label4: TLabel
      Left = 64
      Top = 120
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde Itens:'
      FocusControl = EdtMateriais
    end
    object Label5: TLabel
      Left = 194
      Top = 120
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = #193'rea (m2):'
      FocusControl = EdtQtdeItens
    end
    object Label6: TLabel
      Left = 325
      Top = 120
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
      FocusControl = EdtArea
    end
    object BtnCentroCusto: TButton
      Left = 560
      Top = 135
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
      Left = 599
      Top = 141
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
      Left = 668
      Top = 141
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
      Left = 194
      Top = 137
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
      Left = 325
      Top = 137
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
      Left = 64
      Top = 90
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
      Left = 194
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
      Left = 429
      Top = 90
      Width = 230
      Height = 24
      DataField = 'MATERIAL'
      DataSource = DM.dsAlmoxarifado
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtQtdeItens: TDBEdit
      Left = 64
      Top = 137
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
    Top = 352
    Width = 784
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
  end
end

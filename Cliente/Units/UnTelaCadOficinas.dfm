inherited FrmTelaCadOficinas: TFrmTelaCadOficinas
  Caption = 'Oficinas'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 513
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 513
    end
    inherited LAlteradoPor: TLabel
      Left = 535
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 535
    end
    inherited LblDataAlt: TDBText
      Left = 568
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsOficinas
      ExplicitLeft = 568
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsOficinas
      ExplicitLeft = 440
    end
    inherited LblUsuAlt: TDBText
      Left = 568
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsOficinas
      ExplicitLeft = 568
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsOficinas
      ExplicitLeft = 440
    end
    inherited LCadastro: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 407
    end
    inherited LCadastroPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 369
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label2: TLabel
      Left = 190
      Top = 92
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 174
      Top = 122
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label1: TLabel
      Left = 137
      Top = 153
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 238
      Top = 90
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsOficinas
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 238
      Top = 121
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsOficinas
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCentroCusto: TDBEdit
      Left = 239
      Top = 152
      Width = 230
      Height = 24
      Color = clBtnFace
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsOficinas
      ReadOnly = True
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCentroCusto: TButton
      Left = 470
      Top = 151
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnCentroCustoClick
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 196
      Top = 183
      Width = 57
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsOficinas
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 297
      Top = 183
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsOficinas
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
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

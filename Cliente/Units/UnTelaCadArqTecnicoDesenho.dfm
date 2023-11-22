inherited FrmTelaCadArqTecnicoDesenho: TFrmTelaCadArqTecnicoDesenho
  Caption = 'Desenho T'#233'cnico'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      ExplicitLeft = 505
    end
    inherited LAlteradoPor: TLabel
      ExplicitLeft = 527
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsArquivoTecnico
      ExplicitLeft = 560
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsArquivoTecnico
      ExplicitLeft = 432
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsArquivoTecnico
      ExplicitLeft = 560
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsArquivoTecnico
      ExplicitLeft = 432
    end
    inherited LCadastro: TLabel
      ExplicitLeft = 399
    end
    inherited LCadastroPor: TLabel
      ExplicitLeft = 361
    end
  end
  inherited PCentro: TPanel
    object Label1: TLabel
      Left = 40
      Top = 67
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label3: TLabel
      Left = 327
      Top = 129
      Width = 56
      Height = 16
      Alignment = taRightJustify
      Caption = 'Conjunto:'
      FocusControl = EdtDescricao
    end
    object Label6: TLabel
      Left = 36
      Top = 129
      Width = 46
      Height = 16
      Alignment = taRightJustify
      Caption = 'Projeto:'
    end
    object Label15: TLabel
      Left = 32
      Top = 160
      Width = 50
      Height = 16
      Caption = 'N'#250'mero:'
      FocusControl = EdtNumero
    end
    object Label5: TLabel
      Left = 323
      Top = 160
      Width = 60
      Height = 16
      Caption = 'Mapoteca:'
      FocusControl = EdtMapoteca
    end
    object Label14: TLabel
      Left = 38
      Top = 191
      Width = 44
      Height = 16
      Caption = 'Gaveta:'
      FocusControl = EdtGaveta
    end
    object Label7: TLabel
      Left = 347
      Top = 191
      Width = 36
      Height = 16
      Caption = 'Pasta:'
    end
    object Label10: TLabel
      Left = 4
      Top = 98
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label12: TLabel
      Left = 34
      Top = 222
      Width = 48
      Height = 16
      Caption = 'Arquivo:'
    end
    object Label8: TLabel
      Left = 334
      Top = 222
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Esta'#231#227'o:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 86
      Top = 66
      Width = 97
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 184
      Top = 66
      Width = 423
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtConjunto: TDBEdit
      Left = 387
      Top = 128
      Width = 220
      Height = 24
      DataField = 'CONJUNTO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtProjeto: TDBEdit
      Left = 86
      Top = 128
      Width = 190
      Height = 24
      Color = clBtnFace
      DataField = 'PROJETO'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnProjeto: TButton
      Left = 278
      Top = 126
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BtnProjetoClick
    end
    object EdtNumero: TDBEdit
      Left = 86
      Top = 159
      Width = 220
      Height = 24
      DataField = 'NUMORIGINAL'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtMapoteca: TDBEdit
      Left = 387
      Top = 159
      Width = 220
      Height = 24
      DataField = 'MAPOTECA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtGaveta: TDBEdit
      Left = 86
      Top = 190
      Width = 220
      Height = 24
      DataField = 'GAVETA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPasta: TDBEdit
      Left = 387
      Top = 190
      Width = 220
      Height = 24
      DataField = 'PASTA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 11
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodEquipamento: TDBEdit
      Left = 86
      Top = 97
      Width = 97
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 184
      Top = 97
      Width = 394
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsArquivoTecnico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 579
      Top = 95
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 4
      OnClick = BtnEquipamentoClick
    end
    object EdtArquivo: TDBEdit
      Left = 86
      Top = 221
      Width = 220
      Height = 24
      DataField = 'ARQUIVO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 12
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEstacao: TDBEdit
      Left = 387
      Top = 221
      Width = 220
      Height = 24
      DataField = 'ESTACAO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 13
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Top = 36
  end
  object PopupMenuCons: TPopupMenu
    Left = 506
    Top = 139
    object Codigo1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Codigo1Click
    end
    object Descricao1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = Descricao1Click
    end
  end
end

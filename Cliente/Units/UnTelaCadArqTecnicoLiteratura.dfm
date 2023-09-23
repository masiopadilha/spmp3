inherited FrmTelaCadArqTecnicoLiteratura: TFrmTelaCadArqTecnicoLiteratura
  Caption = 'Literatura T'#233'cnica'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 494
    end
    inherited LAlteradoPor: TLabel
      Left = 516
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsArquivoTecnico
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsArquivoTecnico
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsArquivoTecnico
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsArquivoTecnico
    end
    inherited LCadastro: TLabel
      Left = 388
    end
    inherited LCadastroPor: TLabel
      Left = 350
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
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
      Left = 337
      Top = 98
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'Autor:'
      FocusControl = EdtDescricao
    end
    object Label6: TLabel
      Left = 24
      Top = 129
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Literatura:'
    end
    object Label2: TLabel
      Left = 335
      Top = 129
      Width = 38
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tema:'
    end
    object Label4: TLabel
      Left = 34
      Top = 160
      Width = 50
      Height = 16
      Alignment = taRightJustify
      Caption = 'Assunto:'
    end
    object Label8: TLabel
      Left = 328
      Top = 160
      Width = 45
      Height = 16
      Alignment = taRightJustify
      Caption = 'Editora:'
    end
    object Label15: TLabel
      Left = 37
      Top = 191
      Width = 47
      Height = 16
      Caption = 'Estante:'
      FocusControl = EdtEstante
    end
    object Label14: TLabel
      Left = 24
      Top = 222
      Width = 60
      Height = 16
      Caption = 'Prateleria:'
      FocusControl = EdtPrateleria
    end
    object Label5: TLabel
      Left = 329
      Top = 191
      Width = 44
      Height = 16
      Caption = 'Gaveta:'
      FocusControl = EdtGaveta
    end
    object Label7: TLabel
      Left = 337
      Top = 222
      Width = 36
      Height = 16
      Caption = 'Pasta:'
      FocusControl = Label8
    end
    object Label9: TLabel
      Left = 24
      Top = 98
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
      FocusControl = EdtCodigo
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 88
      Top = 66
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 88
      Top = 97
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtAutor: TDBEdit
      Left = 377
      Top = 97
      Width = 230
      Height = 24
      DataField = 'AUTOR'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtLiteratura: TDBEdit
      Left = 88
      Top = 128
      Width = 201
      Height = 24
      Color = clBtnFace
      DataField = 'LITERATURA'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnLiteratura: TButton
      Left = 290
      Top = 125
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnLiteraturaClick
    end
    object EdtTema: TDBEdit
      Left = 377
      Top = 128
      Width = 201
      Height = 24
      Color = clBtnFace
      DataField = 'TEMA'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnTema: TButton
      Left = 579
      Top = 125
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BtnTemaClick
    end
    object EdtAssunto: TDBEdit
      Left = 88
      Top = 159
      Width = 201
      Height = 24
      Color = clBtnFace
      DataField = 'ASSUNTO'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 7
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnAssunto: TButton
      Left = 290
      Top = 156
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BtnAssuntoClick
    end
    object EdtEditora: TDBEdit
      Left = 377
      Top = 159
      Width = 201
      Height = 24
      Color = clBtnFace
      DataField = 'EDITORA'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 9
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEditora: TButton
      Left = 579
      Top = 156
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BtnEditoraClick
    end
    object EdtEstante: TDBEdit
      Left = 88
      Top = 190
      Width = 230
      Height = 24
      DataField = 'ESTANTE'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 11
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPrateleria: TDBEdit
      Left = 88
      Top = 221
      Width = 230
      Height = 24
      DataField = 'PRATELEIRA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 13
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtGaveta: TDBEdit
      Left = 377
      Top = 190
      Width = 230
      Height = 24
      DataField = 'GAVETA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 12
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPasta: TDBEdit
      Left = 377
      Top = 221
      Width = 230
      Height = 24
      DataField = 'PASTA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 14
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
  inherited MainMenuPadrao: TMainMenu
    Top = 30
  end
end

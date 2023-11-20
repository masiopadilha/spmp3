inherited FrmTelaCadArqTecnicoLiteratura: TFrmTelaCadArqTecnicoLiteratura
  Caption = 'Literatura T'#233'cnica'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
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
  end
  inherited PCentro: TPanel
    Width = 780
    Height = 248
    object Label1: TLabel
      Left = 64
      Top = 32
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label3: TLabel
      Left = 431
      Top = 32
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'Autor:'
      FocusControl = EdtDescricao
    end
    object Label6: TLabel
      Left = 64
      Top = 79
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Literatura:'
    end
    object Label2: TLabel
      Left = 253
      Top = 80
      Width = 38
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tema:'
    end
    object Label4: TLabel
      Left = 64
      Top = 126
      Width = 50
      Height = 16
      Alignment = taRightJustify
      Caption = 'Assunto:'
    end
    object Label8: TLabel
      Left = 442
      Top = 80
      Width = 45
      Height = 16
      Alignment = taRightJustify
      Caption = 'Editora:'
    end
    object Label15: TLabel
      Left = 274
      Top = 127
      Width = 47
      Height = 16
      Caption = 'Estante:'
      FocusControl = EdtEstante
    end
    object Label14: TLabel
      Left = 64
      Top = 173
      Width = 60
      Height = 16
      Caption = 'Prateleria:'
      FocusControl = EdtPrateleria
    end
    object Label5: TLabel
      Left = 451
      Top = 127
      Width = 44
      Height = 16
      Caption = 'Gaveta:'
      FocusControl = EdtGaveta
    end
    object Label7: TLabel
      Left = 258
      Top = 173
      Width = 36
      Height = 16
      Caption = 'Pasta:'
      FocusControl = Label8
    end
    object Label9: TLabel
      Left = 195
      Top = 32
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
      FocusControl = EdtCodigo
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 50
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
      Left = 195
      Top = 50
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtAutor: TDBEdit
      Left = 431
      Top = 54
      Width = 176
      Height = 24
      DataField = 'AUTOR'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtLiteratura: TDBEdit
      Left = 64
      Top = 97
      Width = 150
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
      Left = 217
      Top = 95
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
      Left = 253
      Top = 97
      Width = 150
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
      Left = 407
      Top = 95
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
      Left = 64
      Top = 144
      Width = 173
      Height = 24
      Color = clBtnFace
      DataField = 'ASSUNTO'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 9
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnAssunto: TButton
      Left = 240
      Top = 142
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
      OnClick = BtnAssuntoClick
    end
    object EdtEditora: TDBEdit
      Left = 442
      Top = 97
      Width = 150
      Height = 24
      Color = clBtnFace
      DataField = 'EDITORA'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 7
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEditora: TButton
      Left = 596
      Top = 95
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
      OnClick = BtnEditoraClick
    end
    object EdtEstante: TDBEdit
      Left = 274
      Top = 144
      Width = 173
      Height = 24
      DataField = 'ESTANTE'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 11
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPrateleria: TDBEdit
      Left = 64
      Top = 191
      Width = 190
      Height = 24
      DataField = 'PRATELEIRA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 13
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtGaveta: TDBEdit
      Left = 451
      Top = 144
      Width = 173
      Height = 24
      DataField = 'GAVETA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 12
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPasta: TDBEdit
      Left = 258
      Top = 191
      Width = 190
      Height = 24
      DataField = 'PASTA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 14
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 352
    Width = 784
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
  end
  inherited MainMenuPadrao: TMainMenu
    Top = 30
  end
end

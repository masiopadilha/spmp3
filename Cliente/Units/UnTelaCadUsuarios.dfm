inherited FrmTelaCadUsuarios: TFrmTelaCadUsuarios
  Caption = 'Usu'#225'rios'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 510
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 502
    end
    inherited LAlteradoPor: TLabel
      Left = 532
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 524
    end
    inherited LblDataAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsUsuarios
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsUsuarios
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsUsuarios
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsUsuarios
    end
    inherited LCadastro: TLabel
      Left = 404
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 396
    end
    inherited LCadastroPor: TLabel
      Left = 366
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 358
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label1: TLabel
      Left = 172
      Top = 62
      Width = 57
      Height = 16
      Caption = 'Matr'#237'cula:'
    end
    object Label2: TLabel
      Left = 195
      Top = 89
      Width = 34
      Height = 16
      Caption = 'Perfil:'
    end
    object Label3: TLabel
      Left = 185
      Top = 116
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label6: TLabel
      Left = 188
      Top = 170
      Width = 41
      Height = 16
      Caption = 'Senha:'
    end
    object Label7: TLabel
      Left = 123
      Top = 197
      Width = 106
      Height = 16
      Caption = 'Confirme a senha:'
    end
    object Label4: TLabel
      Left = 194
      Top = 143
      Width = 35
      Height = 16
      Caption = 'Login:'
      FocusControl = EdtLogin
    end
    object Label12: TLabel
      Left = 363
      Top = 174
      Width = 53
      Height = 11
      Caption = '*Tempor'#225'ria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 190
      Top = 225
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Limite:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 234
      Top = 114
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsUsuarios
      TabOrder = 3
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtFuncionario: TDBEdit
      Left = 361
      Top = 60
      Width = 216
      Height = 24
      Color = clBtnFace
      DataField = 'FUNCIONARIO'
      DataSource = DM.dsUsuarios
      ReadOnly = True
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object DBCheckBox1: TDBCheckBox
      Left = 136
      Top = 263
      Width = 93
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Tempor'#225'rio:'
      DataField = 'TEMPORARIO'
      DataSource = DM.dsUsuarios
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtDataFim: TJvDBDateEdit
      Left = 234
      Top = 223
      Width = 125
      Height = 24
      DataField = 'DATAFIM'
      DataSource = DM.dsUsuarios
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtLogin: TDBEdit
      Left = 234
      Top = 141
      Width = 125
      Height = 24
      DataField = 'NOME'
      DataSource = DM.dsUsuarios
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtSenha: TEdit
      Left = 234
      Top = 168
      Width = 125
      Height = 24
      PasswordChar = '*'
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtConfSenha: TEdit
      Left = 234
      Top = 195
      Width = 125
      Height = 24
      PasswordChar = '*'
      TabOrder = 6
      OnKeyPress = FormKeyPress
    end
    object BtnFuncionario: TButton
      Left = 578
      Top = 57
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = BtnFuncionarioClick
    end
    object EdtNivelAcesso: TDBEdit
      Left = 234
      Top = 87
      Width = 200
      Height = 24
      Color = clBtnFace
      DataField = 'NIVELACESSO'
      DataSource = DM.dsUsuarios
      ReadOnly = True
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnNivel: TButton
      Left = 436
      Top = 85
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BtnNivelClick
    end
    object EdtMatricula: TDBEdit
      Tag = 555
      Left = 234
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'MATRICULA'
      DataSource = DM.dsUsuarios
      ReadOnly = True
      TabOrder = 0
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
  inherited PopupMenuRelat: TPopupMenu
    Top = 16
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 390
    Top = 140
  end
end

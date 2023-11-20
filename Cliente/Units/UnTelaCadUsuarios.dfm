inherited FrmTelaCadUsuarios: TFrmTelaCadUsuarios
  Caption = 'Usu'#225'rios'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 661
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
      Left = 683
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
      Left = 558
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Left = 520
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    object Label1: TLabel
      Left = 64
      Top = 73
      Width = 57
      Height = 16
      Caption = 'Matr'#237'cula:'
    end
    object Label2: TLabel
      Left = 454
      Top = 73
      Width = 34
      Height = 16
      Caption = 'Perfil:'
    end
    object Label3: TLabel
      Left = 64
      Top = 129
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label6: TLabel
      Left = 324
      Top = 129
      Width = 41
      Height = 16
      Caption = 'Senha:'
    end
    object Label7: TLabel
      Left = 454
      Top = 129
      Width = 106
      Height = 16
      Caption = 'Confirme a senha:'
    end
    object Label4: TLabel
      Left = 194
      Top = 129
      Width = 35
      Height = 16
      Caption = 'Login:'
      FocusControl = EdtLogin
    end
    object Label12: TLabel
      Left = 324
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
      Left = 584
      Top = 129
      Width = 39
      Height = 16
      Alignment = taRightJustify
      Caption = 'Limite:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 147
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsUsuarios
      TabOrder = 5
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtFuncionario: TDBEdit
      Left = 191
      Top = 90
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
      TabOrder = 10
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtDataFim: TJvDBDateEdit
      Left = 584
      Top = 147
      Width = 125
      Height = 24
      DataField = 'DATAFIM'
      DataSource = DM.dsUsuarios
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtLogin: TDBEdit
      Left = 194
      Top = 147
      Width = 125
      Height = 24
      DataField = 'NOME'
      DataSource = DM.dsUsuarios
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtSenha: TEdit
      Left = 324
      Top = 147
      Width = 125
      Height = 24
      PasswordChar = '*'
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtConfSenha: TEdit
      Left = 454
      Top = 147
      Width = 125
      Height = 24
      PasswordChar = '*'
      TabOrder = 8
      OnKeyPress = FormKeyPress
    end
    object BtnFuncionario: TButton
      Left = 410
      Top = 88
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnFuncionarioClick
    end
    object EdtNivelAcesso: TDBEdit
      Left = 454
      Top = 90
      Width = 200
      Height = 24
      Color = clBtnFace
      DataField = 'NIVELACESSO'
      DataSource = DM.dsUsuarios
      ReadOnly = True
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnNivel: TButton
      Left = 658
      Top = 88
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnNivelClick
    end
    object EdtMatricula: TDBEdit
      Tag = 555
      Left = 64
      Top = 90
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
  inherited PopupMenuRelat: TPopupMenu
    Top = 16
  end
  inherited ActionList1: TActionList
    Left = 314
    Top = 19
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 238
    Top = 20
  end
end

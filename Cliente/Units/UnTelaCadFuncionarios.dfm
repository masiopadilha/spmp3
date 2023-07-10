inherited FrmTelaCadFuncionarios: TFrmTelaCadFuncionarios
  Caption = 'Funcion'#225'rios'
  TextHeight = 16
  object ImgFotoFunc: TImage [0]
    Left = 769
    Top = 61
    Width = 235
    Height = 235
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Center = True
    Proportional = True
    Stretch = True
  end
  inherited PControle: TPanel
    inherited LCadastro: TLabel
      ExplicitLeft = 467
    end
    inherited LCadastroPor: TLabel
      ExplicitLeft = 431
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsFuncionarios
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsFuncionarios
    end
    inherited LAlteracao: TLabel
      ExplicitLeft = 626
    end
    inherited LAlteradoPor: TLabel
      ExplicitLeft = 610
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsFuncionarios
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsFuncionarios
    end
  end
  inherited PIdentificacao: TPanel
    Width = 764
    Height = 128
    Margins.Right = 240
    ExplicitWidth = 766
    ExplicitHeight = 128
    object Label4: TLabel
      Left = 67
      Top = 32
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Matr'#237'cula:'
      FocusControl = EdtMatricula
    end
    object Label5: TLabel
      Left = 86
      Top = 63
      Width = 38
      Height = 16
      Alignment = taRightJustify
      Caption = 'Nome:'
      FocusControl = EdtNome
    end
    object Label6: TLabel
      Left = 77
      Top = 94
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Apelido:'
      FocusControl = EdtApelido
    end
    object Label7: TLabel
      Left = 438
      Top = 94
      Width = 27
      Height = 16
      Alignment = taRightJustify
      Caption = 'CPF:'
      FocusControl = EdtCPF
    end
    object Label8: TLabel
      Left = 408
      Top = 32
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Admiss'#227'o:'
    end
    object Label9: TLabel
      Left = 397
      Top = 63
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Nascimento:'
    end
    object Label31: TLabel
      Left = 256
      Top = 33
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 361
      Top = 64
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtMatricula: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      DataField = 'MATRICULA'
      DataSource = DM.dsFuncionarios
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtMatriculaExit
      OnKeyPress = FormKeyPress
    end
    object EdtNome: TDBEdit
      Left = 127
      Top = 61
      Width = 230
      Height = 24
      DataField = 'NOME'
      DataSource = DM.dsFuncionarios
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtApelido: TDBEdit
      Left = 127
      Top = 92
      Width = 125
      Height = 24
      DataField = 'APELIDO'
      DataSource = DM.dsFuncionarios
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCPF: TDBEdit
      Left = 470
      Top = 92
      Width = 125
      Height = 24
      DataField = 'CPF'
      DataSource = DM.dsFuncionarios
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtAdmissao: TJvDBDateEdit
      Left = 470
      Top = 30
      Width = 125
      Height = 24
      DataField = 'DATAADMISSAO'
      DataSource = DM.dsFuncionarios
      ShowNullDate = False
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtNascimento: TJvDBDateEdit
      Left = 470
      Top = 61
      Width = 125
      Height = 24
      DataField = 'DATANASCIMENTO'
      DataSource = DM.dsFuncionarios
      ShowNullDate = False
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAutonomo: TDBCheckBox
      Left = 664
      Top = 32
      Width = 88
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aut'#244'nomo:'
      DataField = 'AUTONOMO'
      DataSource = DM.dsFuncionarios
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PProgramacao: TPanel
    Top = 183
    Width = 764
    Height = 158
    Margins.Right = 240
    ExplicitTop = 183
    ExplicitWidth = 766
    ExplicitHeight = 158
    inherited Label2: TLabel
      Width = 89
      Caption = 'ENDERE'#199'O'
      ExplicitWidth = 89
    end
    object Label10: TLabel
      Left = 66
      Top = 32
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Endere'#231'o:'
      FocusControl = EdtEndereco
    end
    object Label15: TLabel
      Left = 59
      Top = 62
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cidade:'
    end
    object Label17: TLabel
      Left = 405
      Top = 62
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cep:'
    end
    object Label18: TLabel
      Left = 59
      Top = 93
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Telefone:'
    end
    object Label14: TLabel
      Left = 405
      Top = 32
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Bairro:'
    end
    object Label11: TLabel
      Left = 59
      Top = 124
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estado:'
    end
    object Label21: TLabel
      Left = 405
      Top = 124
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Email:'
    end
    object Label20: TLabel
      Left = 405
      Top = 93
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Celular:'
    end
    object EdtEndereco: TDBEdit
      Left = 127
      Top = 30
      Width = 230
      Height = 24
      DataField = 'ENDERECO'
      DataSource = DM.dsFuncionarios
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCidade: TDBEdit
      Left = 127
      Top = 61
      Width = 229
      Height = 24
      DataField = 'CIDADE'
      DataSource = DM.dsFuncionarios
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtCEP: TJvDBMaskEdit
      Left = 470
      Top = 61
      Width = 125
      Height = 24
      DataField = 'CEP'
      DataSource = DM.dsFuncionarios
      MaxLength = 9
      TabOrder = 3
      EditMask = '!99999-999;1;_'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtTelefone: TJvDBMaskEdit
      Left = 127
      Top = 92
      Width = 125
      Height = 24
      DataField = 'TELEFONE'
      DataSource = DM.dsFuncionarios
      MaxLength = 14
      TabOrder = 4
      EditMask = '!(99) 9999-9999;1;_'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtBairro: TDBEdit
      Left = 470
      Top = 30
      Width = 200
      Height = 24
      DataField = 'BAIRRO'
      DataSource = DM.dsFuncionarios
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object CBEstado: TDBComboBox
      Left = 127
      Top = 123
      Width = 55
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ESTADO'
      DataSource = DM.dsFuncionarios
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'SC'
        'SE'
        'SP'
        'TO'
        'RO'
        'RR'
        'RS'
        'RN'
        'RJ')
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEmail: TDBEdit
      Left = 470
      Top = 123
      Width = 200
      Height = 24
      DataField = 'EMAIL'
      DataSource = DM.dsFuncionarios
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtCelular: TJvDBMaskEdit
      Left = 470
      Top = 92
      Width = 125
      Height = 24
      DataField = 'CELULAR'
      DataSource = DM.dsFuncionarios
      MaxLength = 15
      TabOrder = 5
      EditMask = '!(99) 99999-9999;1;_'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PDiversos: TPanel
    object Label12: TLabel
      Left = 335
      Top = 34
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 91
      Top = 32
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cargo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 69
      Top = 64
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Calend'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 335
      Top = 65
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 91
      Top = 96
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#233'lula:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 58
      Top = 128
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Escolaridade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 56
      Top = 161
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#227'o de Obra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 307
      Top = 129
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 307
      Top = 163
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 362
      Top = 32
      Width = 47
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sal'#225'rio:'
    end
    object Label30: TLabel
      Left = 528
      Top = 32
      Width = 118
      Height = 16
      Alignment = taRightJustify
      Caption = 'Outras Informa'#231#245'es:'
    end
    object BtnCargo: TButton
      Left = 305
      Top = 27
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnCargoClick
    end
    object EdtCargo: TDBEdit
      Left = 127
      Top = 30
      Width = 177
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CARGO'
      DataSource = DM.dsFuncionarios
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCalendario: TDBEdit
      Left = 127
      Top = 62
      Width = 177
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CALENDARIO'
      DataSource = DM.dsFuncionarios
      ParentCtl3D = False
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCalendario: TButton
      Left = 305
      Top = 59
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnCalendarioClick
    end
    object EdtCelula: TDBEdit
      Left = 127
      Top = 94
      Width = 177
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CELULA'
      DataSource = DM.dsFuncionarios
      ParentCtl3D = False
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCelula: TButton
      Left = 305
      Top = 92
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnCelulaClick
    end
    object CBEscolaridade: TDBComboBox
      Left = 127
      Top = 126
      Width = 177
      Height = 24
      DataField = 'ESCOLARIDADE'
      DataSource = DM.dsFuncionarios
      Items.Strings = (
        '3'#186' Grau Completo'
        '3'#186' Grau Incompleto'
        '2'#186' Grau Completo'
        '2'#186' Grau Incompleto'
        '1'#186' Grau Completo'
        '1'#186' Grau Incompleto')
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBMaodeObra: TDBComboBox
      Left = 127
      Top = 159
      Width = 177
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'MOBRA'
      DataSource = DM.dsFuncionarios
      Items.Strings = (
        'OPERACIONAL'
        'ADMINISTRATIVA'
        'SOLICITANTE DE TRABALHO'
        'AUT'#212'NOMA')
      TabOrder = 7
      OnChange = CBMaodeObraChange
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtSalario: TDBEdit
      Left = 412
      Top = 30
      Width = 97
      Height = 24
      DataField = 'SALARIO'
      DataSource = DM.dsFuncionarios
      MaxLength = 16
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbUsuario: TDBCheckBox
      Left = 358
      Top = 64
      Width = 71
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Usu'#225'rio:'
      DataField = 'USUARIO'
      DataSource = DM.dsFuncionarios
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAtivo: TDBCheckBox
      Left = 373
      Top = 96
      Width = 56
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsFuncionarios
      TabOrder = 10
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object MOutras: TDBMemo
      Left = 529
      Top = 51
      Width = 468
      Height = 131
      DataField = 'CURSOS'
      DataSource = DM.dsFuncionarios
      ScrollBars = ssVertical
      TabOrder = 11
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited PBase: TPanel
    inherited Button1: TButton
      Hint = 'Caixa de Ferramentas e Ferramentaria'
      DisabledImageIndex = 38
      ImageIndex = 37
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Hint = 'Aus'#234'ncias'
      DisabledImageIndex = 93
      ImageIndex = 92
      OnClick = Button2Click
    end
    inherited Button3: TButton
      Hint = 'Hist'#243'rico'
      DisabledImageIndex = 59
      ImageIndex = 58
      OnClick = Button3Click
    end
  end
  object BtnAnexar: TButton [8]
    Left = 815
    Top = 307
    Width = 78
    Height = 25
    Caption = 'Anexar'
    DisabledImageIndex = 74
    ImageIndex = 73
    TabOrder = 7
    OnClick = BtnAnexarClick
    OnExit = TabNextTab1AfterTabChange
  end
  object BtnLimpar: TButton [9]
    Left = 897
    Top = 307
    Width = 78
    Height = 25
    Caption = 'Limpar'
    DisabledImageIndex = 63
    DragCursor = 63
    ImageIndex = 62
    TabOrder = 8
    OnClick = BtnLimparClick
    OnExit = TabNextTab1AfterTabChange
  end
  object OPDFoto: TJvOpenDialog
    Filter = 'JPGl image files (*.jpg,*.jpeg)|*.JPG'
    Height = 0
    Width = 0
    Left = 672
    Top = 152
  end
  object PopupMenuFerram: TPopupMenu
    Left = 602
    Top = 396
    object MenuItem2: TMenuItem
      Caption = 'Caixa de Ferramentas'
      OnClick = MenuItem2Click
    end
    object Inventario1: TMenuItem
      Caption = 'Invent'#225'rio de Caixa de Ferramentas'
      OnClick = Inventario1Click
    end
    object Ferramentaria1: TMenuItem
      Caption = 'Ferramentaria (Empr'#233'stimo)'
      OnClick = Ferramentaria1Click
    end
  end
end

inherited FrmTelaCadLubrificantes: TFrmTelaCadLubrificantes
  Caption = 'Lubrificantes'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LblDataCad: TDBText
      DataSource = DM.dsLubrificantes
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsLubrificantes
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsLubrificantes
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsLubrificantes
    end
  end
  inherited PIdentificacao: TPanel
    object Label4: TLabel
      Left = 52
      Top = 33
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Lubrificante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 488
      Top = 35
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
    object Label6: TLabel
      Left = 537
      Top = 32
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fabricante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 990
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
    object Label7: TLabel
      Left = 532
      Top = 62
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fornecedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 990
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
    object EdtCodLubrificante: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsLubrificantes
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodLubrificanteExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsLubrificantes
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodFabricante: TDBEdit
      Tag = 555
      Left = 606
      Top = 29
      Width = 120
      Height = 24
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFABRICANTE'
      DataSource = DM.dsLubrificantes
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFabricante: TDBEdit
      Left = 728
      Top = 29
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FABRICANTE'
      DataSource = DM.dsLubrificantes
      ParentCtl3D = False
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnFabricante: TButton
      Left = 960
      Top = 27
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 57
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnFabricanteClick
    end
    object EdtCodFornecedor: TDBEdit
      Tag = 555
      Left = 606
      Top = 60
      Width = 120
      Height = 24
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFORNECEDOR'
      DataSource = DM.dsLubrificantes
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFornecedor: TDBEdit
      Left = 728
      Top = 60
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FORNECEDOR'
      DataSource = DM.dsLubrificantes
      ParentCtl3D = False
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnFornecedor: TButton
      Left = 960
      Top = 57
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 57
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BtnFornecedorClick
    end
    object ChbOleo: TDBCheckBox
      Left = 88
      Top = 62
      Width = 57
      Height = 17
      Alignment = taLeftJustify
      Caption = #211'leo:'
      DataField = 'OLEO'
      DataSource = DM.dsLubrificantes
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = ChbOleoClick
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited PProgramacao: TPanel
    object PCLubrificante: TJvPageControl
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 1000
      Height = 165
      Margins.Top = 20
      ActivePage = TSGraxa
      Align = alClient
      Images = DM.ImageListBotoes
      OwnerDraw = True
      TabOrder = 0
      OnDrawTab = PCLubrificanteDrawTab
      object TSOleo: TTabSheet
        Caption = #211'leo'
        object POleo: TPanel
          Left = 0
          Top = 0
          Width = 988
          Height = 134
          Align = alClient
          BevelOuter = bvNone
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
          object Label5: TLabel
            Left = 43
            Top = 12
            Width = 72
            Height = 16
            Alignment = taRightJustify
            Caption = 'Viscosidade:'
          end
          object Label16: TLabel
            Left = 499
            Top = 12
            Width = 95
            Height = 16
            Caption = 'Ponto de Fulgor:'
          end
          object Label8: TLabel
            Left = 279
            Top = 12
            Width = 74
            Height = 16
            Caption = 'Grau  AGMA:'
          end
          object Label21: TLabel
            Left = 792
            Top = 12
            Width = 64
            Height = 16
            Caption = 'Densidade:'
          end
          object Label9: TLabel
            Left = 58
            Top = 43
            Width = 57
            Height = 16
            Caption = 'Grau ISO:'
          end
          object Label24: TLabel
            Left = 254
            Top = 43
            Width = 99
            Height = 16
            Caption = 'Ponto de Fluidez:'
          end
          object EdtViscosidade: TDBEdit
            Left = 119
            Top = 9
            Width = 120
            Height = 24
            DataField = 'VISCOSIDADE'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 0
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtACMA: TDBEdit
            Left = 357
            Top = 9
            Width = 120
            Height = 24
            DataField = 'GRAUACMA'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 1
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtFulgor: TDBEdit
            Left = 598
            Top = 9
            Width = 120
            Height = 24
            DataField = 'PONTOFULGOR'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 2
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtDensidade: TDBEdit
            Left = 860
            Top = 9
            Width = 120
            Height = 24
            DataField = 'DENSIDADE'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 3
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtISO: TDBEdit
            Left = 119
            Top = 41
            Width = 120
            Height = 24
            DataField = 'GRAUISO'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 4
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtFluidezOleo: TDBEdit
            Left = 357
            Top = 41
            Width = 120
            Height = 24
            DataField = 'PONTOFLUIDEZ'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 5
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object DBCheckBox1: TDBCheckBox
            Left = 512
            Top = 43
            Width = 103
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Antidesgaste:'
            DataField = 'ANTIDESGASTE'
            DataSource = DM.dsLubrificantes
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox5: TDBCheckBox
            Left = 249
            Top = 73
            Width = 128
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Extrema Press'#227'o:'
            DataField = 'EXTREMAPRESSAO'
            DataSource = DM.dsLubrificantes
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox2: TDBCheckBox
            Left = 643
            Top = 43
            Width = 105
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Anticorrosivo:'
            DataField = 'ANTICORROZIVO'
            DataSource = DM.dsLubrificantes
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox6: TDBCheckBox
            Left = 522
            Top = 73
            Width = 93
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Detergente:'
            DataField = 'DETERGENTE'
            DataSource = DM.dsLubrificantes
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox3: TDBCheckBox
            Left = 776
            Top = 43
            Width = 101
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Antioxidante:'
            DataField = 'ANTIOXIDANTE'
            DataSource = DM.dsLubrificantes
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox7: TDBCheckBox
            Left = 651
            Top = 73
            Width = 97
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Dispersante:'
            DataField = 'DISPERSANTE'
            DataSource = DM.dsLubrificantes
            TabOrder = 12
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox4: TDBCheckBox
            Left = 21
            Top = 73
            Width = 116
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Antiespumante:'
            DataField = 'ANTIESPUMANTE'
            DataSource = DM.dsLubrificantes
            TabOrder = 9
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox8: TDBCheckBox
            Left = 797
            Top = 73
            Width = 80
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Sint'#233'tico:'
            DataField = 'SINTETICO'
            DataSource = DM.dsLubrificantes
            TabOrder = 13
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
        end
      end
      object TSGraxa: TTabSheet
        Caption = 'Graxa'
        ImageIndex = 1
        object PGraxa: TPanel
          Left = 0
          Top = 0
          Width = 988
          Height = 134
          Align = alClient
          BevelOuter = bvNone
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
          object Label37: TLabel
            Left = 47
            Top = 12
            Width = 68
            Height = 16
            Caption = 'Graus NLGI:'
          end
          object Label39: TLabel
            Left = 510
            Top = 12
            Width = 84
            Height = 16
            Caption = 'Penet. a 25'#186'C:'
          end
          object Label42: TLabel
            Left = 757
            Top = 12
            Width = 99
            Height = 16
            Caption = 'Ponto de Fluidez:'
          end
          object Label40: TLabel
            Left = 268
            Top = 12
            Width = 85
            Height = 16
            Caption = 'Ponto de Gota:'
          end
          object EdtNLGI: TDBEdit
            Left = 119
            Top = 9
            Width = 120
            Height = 24
            DataField = 'GRAUNLGI'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 0
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtPenetracao: TDBEdit
            Left = 598
            Top = 9
            Width = 120
            Height = 24
            DataField = 'PENETRACAO'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 1
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtGota: TDBEdit
            Left = 357
            Top = 9
            Width = 120
            Height = 24
            DataField = 'PONTOGOTA'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 2
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object EdtFluidezGraxa: TDBEdit
            Left = 860
            Top = 9
            Width = 120
            Height = 24
            DataField = 'PONTOFLUIDEZ'
            DataSource = DM.dsLubrificantes
            MaxLength = 14
            TabOrder = 3
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
            OnMouseMove = PIdentificacaoMouseMove
          end
          object DBCheckBox9: TDBCheckBox
            Left = 37
            Top = 43
            Width = 99
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Antioxidante:'
            DataField = 'ANTIOXIDANTE'
            DataSource = DM.dsLubrificantes
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox10: TDBCheckBox
            Left = 211
            Top = 43
            Width = 104
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Antiferrugem:'
            DataField = 'ANTIFERRUGEM'
            DataSource = DM.dsLubrificantes
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox11: TDBCheckBox
            Left = 398
            Top = 43
            Width = 102
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Antidesgaste:'
            DataField = 'ANTIDESGASTE'
            DataSource = DM.dsLubrificantes
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox13: TDBCheckBox
            Left = 594
            Top = 43
            Width = 125
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Extrema Press'#227'o:'
            DataField = 'EXTREMAPRESSAO'
            DataSource = DM.dsLubrificantes
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
          object DBCheckBox14: TDBCheckBox
            Left = 798
            Top = 43
            Width = 79
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Sint'#233'tico:'
            DataField = 'SINTETICO'
            DataSource = DM.dsLubrificantes
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            OnExit = TabNextTab1AfterTabChange
          end
        end
      end
    end
  end
  inherited PDiversos: TPanel
    object Label11: TLabel
      Left = 31
      Top = 99
      Width = 92
      Height = 16
      Alignment = taRightJustify
      Caption = 'Cons. m'#233'dio/m:'
    end
    object Label12: TLabel
      Left = 52
      Top = 130
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'Ressup. (d):'
    end
    object Label13: TLabel
      Left = 448
      Top = 68
      Width = 37
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pre'#231'o:'
    end
    object Label14: TLabel
      Left = 430
      Top = 38
      Width = 55
      Height = 16
      Alignment = taRightJustify
      Caption = 'Cat'#225'logo:'
    end
    object Label15: TLabel
      Left = 58
      Top = 68
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'Criticidade:'
    end
    object Label18: TLabel
      Left = 374
      Top = 130
      Width = 111
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo na unidade:'
    end
    object Label22: TLabel
      Left = 96
      Top = 38
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = #193'rea:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 432
      Top = 99
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde. (l):'
    end
    object ChbEstocado: TDBCheckBox
      Left = 808
      Top = 99
      Width = 81
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Estocado:'
      DataField = 'ESTOCADO'
      DataSource = DM.dsLubrificantes
      TabOrder = 11
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtQtde: TDBEdit
      Left = 491
      Top = 98
      Width = 189
      Height = 24
      DataField = 'QTDETOTALUTIL'
      DataSource = DM.dsLubrificantes
      MaxLength = 14
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtConsMedio: TDBEdit
      Left = 126
      Top = 98
      Width = 189
      Height = 24
      DataField = 'CONSMEDIOANUAL'
      DataSource = DM.dsLubrificantes
      MaxLength = 14
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtRessup: TDBEdit
      Left = 126
      Top = 129
      Width = 189
      Height = 24
      DataField = 'QTDEDIASRESUP'
      DataSource = DM.dsLubrificantes
      MaxLength = 14
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtPreco: TDBEdit
      Left = 491
      Top = 67
      Width = 189
      Height = 24
      DataField = 'ULTPRECO'
      DataSource = DM.dsLubrificantes
      MaxLength = 14
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtCatalogo: TDBEdit
      Left = 491
      Top = 36
      Width = 189
      Height = 24
      DataField = 'CATALOGO'
      DataSource = DM.dsLubrificantes
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object CBCriticidade: TDBComboBox
      Left = 126
      Top = 67
      Width = 189
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'CRITICIDADE'
      DataSource = DM.dsLubrificantes
      Items.Strings = (
        'Para a F'#225'brica'
        'Para o Equipamento'
        'Para a '#193'rea')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodUnidade: TDBEdit
      Left = 491
      Top = 129
      Width = 189
      Height = 24
      DataField = 'CODUNIDADE'
      DataSource = DM.dsLubrificantes
      MaxLength = 14
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object ChbAtivo: TDBCheckBox
      Left = 830
      Top = 38
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsLubrificantes
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivel: TDBCheckBox
      Left = 823
      Top = 68
      Width = 66
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsLubrificantes
      TabOrder = 10
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtArea: TDBEdit
      Left = 126
      Top = 36
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'AREA'
      DataSource = DM.dsLubrificantes
      ParentCtl3D = False
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnArea: TButton
      Left = 316
      Top = 34
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 1
      OnClick = BtnAreaClick
    end
  end
  inherited TimerAlertas: TTimer
    Top = 14
  end
  inherited PopupMenuRelat: TPopupMenu
    Top = 88
  end
end

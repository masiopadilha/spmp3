inherited FrmTelaCadPneus: TFrmTelaCadPneus
  Caption = 'Pneus'
  ClientHeight = 661
  ClientWidth = 1008
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1004
    ExplicitWidth = 1008
    inherited LblDataCad: TDBText
      DataSource = DM.dsPneus
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsPneus
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsPneus
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsPneus
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1004
    ExplicitWidth = 1008
    object Label4: TLabel
      Left = 90
      Top = 33
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pneu:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 490
      Top = 36
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
    object Label5: TLabel
      Left = 77
      Top = 62
      Width = 46
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fam'#237'lia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 516
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
    object EdtCodPneu: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsPneus
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodPneuExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsPneus
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
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFABRICANTE'
      DataSource = DM.dsPneus
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seFont, seClient]
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
      DataSource = DM.dsPneus
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
      StyleElements = [seFont, seClient]
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
      TabOrder = 7
      OnClick = BtnFabricanteClick
    end
    object EdtCodFamiliaPneu: TDBEdit
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFAMILIAPNEU'
      DataSource = DM.dsPneus
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFamiliaPneu: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FAMILIAPNEU'
      DataSource = DM.dsPneus
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnFamilia: TButton
      Left = 485
      Top = 57
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnFamiliaClick
    end
    object EdtCodFornecedor: TDBEdit
      Tag = 555
      Left = 606
      Top = 60
      Width = 120
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFORNECEDOR'
      DataSource = DM.dsPneus
      ReadOnly = True
      TabOrder = 8
      StyleElements = [seFont, seClient]
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
      DataSource = DM.dsPneus
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
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
      TabOrder = 10
      OnClick = BtnFornecedorClick
    end
  end
  inherited PProgramacao: TPanel
    Width = 1004
    ExplicitWidth = 1008
    object PCDadosTecnicos: TPageControl
      AlignWithMargins = True
      Left = 6
      Top = 26
      Width = 995
      Height = 158
      ActivePage = TSDadosTecnicos
      Style = tsFlatButtons
      TabOrder = 0
      object TSDadosTecnicos: TTabSheet
        Caption = 'Dados'
        object PFundoDadosTecnicos: TPanel
          Left = 0
          Top = 0
          Width = 987
          Height = 124
          Align = alClient
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
          object Campo1: TDBText
            Left = 0
            Top = 14
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO1'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo10: TDBText
            Left = 639
            Top = 43
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO10'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo11: TDBText
            Left = 639
            Top = 72
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO11'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo12: TDBText
            Left = 639
            Top = 101
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO12'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo2: TDBText
            Left = 0
            Top = 43
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO2'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo3: TDBText
            Left = 0
            Top = 72
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO3'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo4: TDBText
            Left = 0
            Top = 101
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO4'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo5: TDBText
            Left = 319
            Top = 14
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO5'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo6: TDBText
            Left = 319
            Top = 43
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO6'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo7: TDBText
            Left = 319
            Top = 72
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO7'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo8: TDBText
            Left = 319
            Top = 101
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO8'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo9: TDBText
            Left = 639
            Top = 14
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO9'
            DataSource = DM.dsFamPneus
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object EdtCampo2: TDBEdit
            Left = 173
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO2'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 1
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo6: TDBEdit
            Left = 492
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO6'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 5
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo10: TDBEdit
            Left = 813
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO10'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 9
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo1: TDBEdit
            Left = 173
            Top = 12
            Width = 135
            Height = 22
            DataField = 'REGISTRO1'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 0
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo5: TDBEdit
            Left = 492
            Top = 12
            Width = 135
            Height = 22
            DataField = 'REGISTRO5'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 4
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo9: TDBEdit
            Left = 813
            Top = 12
            Width = 135
            Height = 22
            DataField = 'REGISTRO9'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 8
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo4: TDBEdit
            Left = 173
            Top = 99
            Width = 135
            Height = 22
            DataField = 'REGISTRO4'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 3
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo8: TDBEdit
            Left = 492
            Top = 99
            Width = 135
            Height = 22
            DataField = 'REGISTRO8'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 7
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo12: TDBEdit
            Left = 813
            Top = 99
            Width = 135
            Height = 22
            DataField = 'REGISTRO12'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 11
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo3: TDBEdit
            Left = 173
            Top = 70
            Width = 135
            Height = 22
            DataField = 'REGISTRO3'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 2
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo7: TDBEdit
            Left = 492
            Top = 70
            Width = 135
            Height = 22
            DataField = 'REGISTRO7'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 6
            OnExit = TabNextTab1AfterTabChange
          end
          object EdtCampo11: TDBEdit
            Left = 813
            Top = 70
            Width = 135
            Height = 22
            DataField = 'REGISTRO11'
            DataSource = DM.dsPneusDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 10
            OnExit = TabNextTab1AfterTabChange
          end
        end
      end
      object TSMaisInfo: TTabSheet
        Caption = 'Mais Informa'#231#245'es'
        ImageIndex = 1
        object MInformacoes: TDBMemo
          Left = 0
          Top = 0
          Width = 984
          Height = 121
          DataField = 'INFORMACOES'
          DataSource = DM.dsPneusDados
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited PDiversos: TPanel
    Width = 1004
    Height = 176
    ExplicitHeight = 179
    object Label8: TLabel
      Left = 64
      Top = 38
      Width = 59
      Height = 16
      Alignment = taRightJustify
      Caption = 'Aquisi'#231#227'o:'
    end
    object Label9: TLabel
      Left = 86
      Top = 99
      Width = 37
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pre'#231'o:'
    end
    object Label11: TLabel
      Left = 403
      Top = 40
      Width = 59
      Height = 16
      Alignment = taRightJustify
      Caption = 'Aplica'#231#227'o:'
    end
    object Label10: TLabel
      Left = 70
      Top = 68
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Garantia:'
    end
    object Label16: TLabel
      Left = 52
      Top = 132
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Quantidade:'
    end
    object Label12: TLabel
      Left = 322
      Top = 102
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
      Left = 322
      Top = 134
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
    object Label14: TLabel
      Left = 642
      Top = 42
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
    object Label15: TLabel
      Left = 421
      Top = 71
      Width = 41
      Height = 16
      Alignment = taRightJustify
      Caption = 'Status:'
    end
    object Label21: TLabel
      Left = 642
      Top = 73
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
    object EdtAquisicao: TJvDBDateEdit
      Left = 127
      Top = 36
      Width = 190
      Height = 24
      DataField = 'DATAAQUISICAO'
      DataSource = DM.dsPneus
      ShowNullDate = False
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtPreco: TDBEdit
      Left = 128
      Top = 98
      Width = 190
      Height = 24
      DataField = 'PRECO'
      DataSource = DM.dsPneus
      MaxLength = 14
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object CBTipo: TDBComboBox
      Left = 466
      Top = 37
      Width = 171
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPO'
      DataSource = DM.dsPneus
      Items.Strings = (
        'Ve'#237'culo'
        'Equipamento')
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtGarantia: TJvDBDateEdit
      Left = 128
      Top = 67
      Width = 190
      Height = 24
      DataField = 'DATAGARANTIA'
      DataSource = DM.dsPneus
      ShowNullDate = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtQuantidade: TDBEdit
      Left = 128
      Top = 130
      Width = 190
      Height = 24
      DataField = 'QUANTIDADE'
      DataSource = DM.dsPneus
      MaxLength = 14
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object CBStatus: TDBComboBox
      Left = 466
      Top = 68
      Width = 171
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'STATUS'
      DataSource = DM.dsPneus
      Items.Strings = (
        'NOVO'
        'USADO')
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 642
    Width = 1008
    ExplicitWidth = 1012
  end
  inherited PAlertas: TPanel
    Top = 626
    Width = 1008
    ExplicitWidth = 1012
  end
  inherited PBase: TPanel
    Top = 586
    Width = 1004
    ExplicitWidth = 1008
    inherited Button1: TButton
      Hint = 'ID dos Pneus'
      DisabledImageIndex = 81
      ImageIndex = 80
      OnClick = Button1Click
    end
  end
end

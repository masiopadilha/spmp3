inherited FrmTelaCadPecasReposicao: TFrmTelaCadPecasReposicao
  Caption = 'Pe'#231'as de Reposi'#231#227'o'
  ClientHeight = 661
  ClientWidth = 1008
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1004
    inherited LCadastro: TLabel
      ExplicitLeft = 499
    end
    inherited LCadastroPor: TLabel
      ExplicitLeft = 461
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsPecasReposicao
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsPecasReposicao
    end
    inherited LAlteracao: TLabel
      ExplicitLeft = 662
    end
    inherited LAlteradoPor: TLabel
      ExplicitLeft = 640
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsPecasReposicao
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsPecasReposicao
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1004
    object Label17: TLabel
      Left = 490
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
    object Label18: TLabel
      Left = 516
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
    object Label4: TLabel
      Left = 91
      Top = 32
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pe'#231'a:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
    object EdtCodFabricante: TDBEdit
      Left = 606
      Top = 29
      Width = 120
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFABRICANTE'
      DataSource = DM.dsPecasReposicao
      TabOrder = 5
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodFamiliaPeca: TDBEdit
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFAMILIAPECAREP'
      DataSource = DM.dsPecasReposicao
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodFornecedor: TDBEdit
      Left = 606
      Top = 60
      Width = 120
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFORNECEDOR'
      DataSource = DM.dsPecasReposicao
      TabOrder = 8
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodPeca: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsPecasReposicao
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodPecaExit
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
      DataSource = DM.dsPecasReposicao
      ParentCtl3D = False
      TabOrder = 6
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFamiliaPeca: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FAMILIAPECA'
      DataSource = DM.dsPecasReposicao
      ParentCtl3D = False
      TabOrder = 3
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
      DataSource = DM.dsPecasReposicao
      ParentCtl3D = False
      TabOrder = 9
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsPecasReposicao
      ParentCtl3D = False
      TabOrder = 1
      OnExit = EdtDescricaoExit
      OnKeyPress = FormKeyPress
    end
  end
  inherited PProgramacao: TPanel
    Width = 1004
    object PCDadosTecnicos: TPageControl
      Left = 6
      Top = 26
      Width = 996
      Height = 158
      ActivePage = TSDadosTecnicos
      Style = tsFlatButtons
      TabOrder = 0
      object TSDadosTecnicos: TTabSheet
        Caption = 'Dados'
        object PFundoDadosTecnicos: TPanel
          Left = 0
          Top = 0
          Width = 988
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
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
            DataSource = DM.dsFamPecasRep
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object EdtCampo1: TDBEdit
            Left = 173
            Top = 12
            Width = 135
            Height = 22
            DataField = 'REGISTRO1'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo2: TDBEdit
            Left = 173
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO2'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo3: TDBEdit
            Left = 173
            Top = 70
            Width = 135
            Height = 22
            DataField = 'REGISTRO3'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo4: TDBEdit
            Left = 173
            Top = 99
            Width = 135
            Height = 22
            DataField = 'REGISTRO4'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo8: TDBEdit
            Left = 492
            Top = 99
            Width = 135
            Height = 22
            DataField = 'REGISTRO8'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo7: TDBEdit
            Left = 492
            Top = 70
            Width = 135
            Height = 22
            DataField = 'REGISTRO7'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo6: TDBEdit
            Left = 492
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO6'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo5: TDBEdit
            Left = 492
            Top = 12
            Width = 135
            Height = 22
            DataField = 'REGISTRO5'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo9: TDBEdit
            Left = 813
            Top = 12
            Width = 135
            Height = 22
            DataField = 'REGISTRO9'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo10: TDBEdit
            Left = 813
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO10'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo11: TDBEdit
            Left = 813
            Top = 70
            Width = 135
            Height = 22
            DataField = 'REGISTRO11'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
          object EdtCampo12: TDBEdit
            Left = 813
            Top = 99
            Width = 135
            Height = 22
            DataField = 'REGISTRO12'
            DataSource = DM.dsPecasReposicaoDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = FormKeyPress
          end
        end
      end
      object TSMaisInfo: TTabSheet
        Caption = 'Mais Informa'#231#245'es'
        ImageIndex = 1
        object MInformacoes: TDBMemo
          Left = 0
          Top = 0
          Width = 985
          Height = 121
          DataField = 'INFORMACOES'
          DataSource = DM.dsPecasReposicaoDados
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited PDiversos: TPanel
    Width = 780
    Height = 176
    Align = alLeft
    ExplicitWidth = 780
    object Label13: TLabel
      Left = 68
      Top = 38
      Width = 55
      Height = 16
      Alignment = taRightJustify
      Caption = 'Cat'#225'logo:'
    end
    object Label8: TLabel
      Left = 57
      Top = 68
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
    end
    object Label9: TLabel
      Left = 43
      Top = 99
      Width = 80
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'd. unidade:'
    end
    object Label10: TLabel
      Left = 59
      Top = 161
      Width = 62
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pre'#231'o(R$):'
    end
    object Label11: TLabel
      Left = 428
      Top = 38
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Quantidade:'
    end
    object Label12: TLabel
      Left = 417
      Top = 68
      Width = 80
      Height = 16
      Alignment = taRightJustify
      Caption = 'Unid. medida:'
    end
    object Label14: TLabel
      Left = 56
      Top = 130
      Width = 67
      Height = 16
      Alignment = taRightJustify
      Caption = 'Estocagem:'
    end
    object Label15: TLabel
      Left = 442
      Top = 99
      Width = 55
      Height = 16
      Alignment = taRightJustify
      Caption = 'Peso(kg):'
    end
    object Label16: TLabel
      Left = 321
      Top = 71
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
    object Label21: TLabel
      Left = 321
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
    object Label22: TLabel
      Left = 642
      Top = 40
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
    object EdtCatalogo: TDBEdit
      Left = 127
      Top = 36
      Width = 189
      Height = 24
      DataField = 'CATALOGO'
      DataSource = DM.dsPecasReposicao
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtReferencia: TDBEdit
      Left = 127
      Top = 67
      Width = 189
      Height = 24
      DataField = 'REFERENCIA'
      DataSource = DM.dsPecasReposicao
      TabOrder = 1
      OnExit = EdtReferenciaExit
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtCodUnid: TDBEdit
      Left = 127
      Top = 98
      Width = 189
      Height = 24
      DataField = 'CODUNIDADE'
      DataSource = DM.dsPecasReposicao
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtPreco: TDBEdit
      Left = 127
      Top = 160
      Width = 189
      Height = 24
      DataField = 'PRECO'
      DataSource = DM.dsPecasReposicao
      MaxLength = 16
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtQuantidade: TDBEdit
      Left = 502
      Top = 36
      Width = 135
      Height = 24
      DataField = 'QUANTIDADE'
      DataSource = DM.dsPecasReposicao
      MaxLength = 14
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtUnidMed: TDBEdit
      Left = 502
      Top = 66
      Width = 135
      Height = 24
      DataField = 'UNIDMEDIDA'
      DataSource = DM.dsPecasReposicao
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtLocalEst: TDBEdit
      Left = 127
      Top = 129
      Width = 189
      Height = 24
      DataField = 'LOCALESTOCAGEM'
      DataSource = DM.dsPecasReposicao
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtPeso: TDBEdit
      Left = 502
      Top = 93
      Width = 135
      Height = 24
      DataField = 'PESO'
      DataSource = DM.dsPecasReposicao
      MaxLength = 14
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object ChbEstocavel: TDBCheckBox
      Left = 436
      Top = 130
      Width = 82
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Estoc'#225'vel:'
      DataField = 'ESTOCAVEL'
      DataSource = DM.dsPecasReposicao
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbFabUnid: TDBCheckBox
      Left = 432
      Top = 161
      Width = 86
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Fab. Unid.:'
      DataField = 'FABRICADA'
      DataSource = DM.dsPecasReposicao
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 642
    Width = 1008
  end
  inherited PAlertas: TPanel
    Top = 626
    Width = 1008
  end
  inherited PBase: TPanel
    Top = 586
    Width = 1004
    inherited Button1: TButton
      Hint = 'Kit de Pe'#231'as de Reposi'#231#227'o'
      DisabledImageIndex = 81
      ImageIndex = 80
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Hint = 'Equipamento com a pe'#231'a instalada.'
      DisabledImageIndex = 99
      ImageIndex = 98
      OnClick = Button2Click
    end
    inherited Button3: TButton
      Hint = 'Hist'#243'rico da Pe'#231'a'
      DisabledImageIndex = 59
      ImageIndex = 58
      OnClick = Button3Click
    end
  end
  object PImagem: TPanel [7]
    Left = 785
    Top = 404
    Width = 223
    Height = 180
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    object ImgFotoPeca: TImage
      Left = 25
      Top = 10
      Width = 175
      Height = 145
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Center = True
      Proportional = True
      Stretch = True
    end
    object BtnAnexar: TButton
      Left = 35
      Top = 158
      Width = 75
      Height = 20
      Caption = 'Anexar'
      DisabledImageIndex = 74
      ImageIndex = 73
      TabOrder = 0
      OnClick = BtnAnexarClick
      OnExit = TabNextTab1AfterTabChange
    end
    object BtnLimpar: TButton
      Left = 115
      Top = 158
      Width = 75
      Height = 20
      Caption = 'Limpar'
      DisabledImageIndex = 63
      DragCursor = 63
      ImageIndex = 62
      TabOrder = 1
      OnClick = BtnLimparClick
      OnExit = TabNextTab1AfterTabChange
    end
  end
  object OPDFoto: TJvOpenDialog
    Filter = 'JPGl image files (*.jpg,*.jpeg)|*.JPG'
    Height = 0
    Width = 0
    Left = 672
    Top = 152
  end
end

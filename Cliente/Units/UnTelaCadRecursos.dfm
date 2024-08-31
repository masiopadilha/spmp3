inherited FrmTelaCadRecursos: TFrmTelaCadRecursos
  Caption = 'Recursos'
  ClientHeight = 624
  ClientWidth = 1012
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited BtnConsultar: TButton
      Left = 151
      ExplicitLeft = 151
    end
    inherited pAlteracao: TPanel
      inherited LCadastro: TLabel
        Height = 14
      end
      inherited LblDataAlt: TDBText
        DataSource = DM.dsRecursos
      end
      inherited LAlteradoPor: TLabel
        ExplicitLeft = 640
      end
      inherited LblDataCad: TDBText
        DataSource = DM.dsRecursos
      end
    end
    inherited pCadastro: TPanel
      inherited LCadastroPor: TLabel
        Height = 14
      end
      inherited LblUsuCad: TDBText
        DataSource = DM.dsRecursos
      end
      inherited LAlteracao: TLabel
        ExplicitLeft = 662
      end
      inherited LblUsuAlt: TDBText
        DataSource = DM.dsRecursos
      end
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    object Label4: TLabel
      Left = 72
      Top = 32
      Width = 51
      Height = 16
      Alignment = taRightJustify
      Caption = 'Recurso:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
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
    object EdtCodRecurso: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsRecursos
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodRecursoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsRecursos
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodFamiliaRecurso: TDBEdit
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFAMILIARECURSO'
      DataSource = DM.dsRecursos
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFamiliaRecurso: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FAMILIARECURSO'
      DataSource = DM.dsRecursos
      ParentCtl3D = False
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
    object EdtCodFabricante: TDBEdit
      Left = 606
      Top = 30
      Width = 120
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFABRICANTE'
      DataSource = DM.dsRecursos
      TabOrder = 5
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFabricante: TDBEdit
      Left = 728
      Top = 30
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FABRICANTE'
      DataSource = DM.dsRecursos
      ParentCtl3D = False
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
    object EdtCodFornecedor: TDBEdit
      Left = 606
      Top = 60
      Width = 120
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFORNECEDOR'
      DataSource = DM.dsRecursos
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
      DataSource = DM.dsRecursos
      ParentCtl3D = False
      TabOrder = 9
      StyleElements = [seFont, seClient]
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
      TabOrder = 10
      OnClick = BtnFornecedorClick
    end
  end
  inherited PProgramacao: TPanel
    Width = 1008
    object PCDadosTecnicos: TPageControl
      AlignWithMargins = True
      Left = 6
      Top = 26
      Width = 991
      Height = 158
      ActivePage = TSDadosTecnicos
      Style = tsFlatButtons
      TabOrder = 0
      object TSDadosTecnicos: TTabSheet
        Caption = 'Dados'
        object PFuncoDadosTecnicos: TPanel
          Left = 0
          Top = 0
          Width = 983
          Height = 124
          Align = alClient
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
          object Campo4: TDBText
            Left = 0
            Top = 101
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO4'
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo1: TDBText
            Left = 0
            Top = 14
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO1'
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
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
            DataSource = DM.dsFamRecursos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object EdtCampo4: TDBEdit
            Left = 173
            Top = 99
            Width = 135
            Height = 22
            DataField = 'REGISTRO4'
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
          object EdtCampo1: TDBEdit
            Left = 173
            Top = 12
            Width = 135
            Height = 22
            DataField = 'REGISTRO1'
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
          object EdtCampo10: TDBEdit
            Left = 813
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO10'
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
          object EdtCampo6: TDBEdit
            Left = 492
            Top = 41
            Width = 135
            Height = 22
            DataField = 'REGISTRO6'
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
            DataSource = DM.dsRecursosDados
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
        end
      end
      object TSMaisInfo: TTabSheet
        Caption = 'Mais Informa'#231#245'es'
        ImageIndex = 1
        object MInformacoes: TDBMemo
          Left = 0
          Top = 0
          Width = 978
          Height = 121
          DataField = 'INFORMACOES'
          DataSource = DM.dsRecursosDados
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited PDiversos: TPanel
    Width = 780
    Height = 216
    Align = alLeft
    ExplicitWidth = 780
    object Label15: TLabel
      Left = 97
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
    object Label9: TLabel
      Left = 89
      Top = 68
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Classe:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 349
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
    object Label10: TLabel
      Left = 41
      Top = 99
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 349
      Top = 103
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
    object Label11: TLabel
      Left = 65
      Top = 130
      Width = 59
      Height = 16
      Alignment = taRightJustify
      Caption = 'Aquisi'#231#227'o:'
    end
    object Label12: TLabel
      Left = 68
      Top = 161
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fabrica'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 374
      Top = 39
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Garantia:'
    end
    object Label8: TLabel
      Left = 390
      Top = 68
      Width = 37
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pre'#231'o:'
    end
    object Label13: TLabel
      Left = 522
      Top = 72
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
    object Label16: TLabel
      Left = 391
      Top = 99
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde.:'
    end
    object Label21: TLabel
      Left = 522
      Top = 103
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
    object Label24: TLabel
      Left = 348
      Top = 130
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Vida '#218'til (hs):'
    end
    object Label26: TLabel
      Left = 523
      Top = 133
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
      Left = 600
      Top = 39
      Width = 69
      Height = 16
      Caption = 'Custo/Hora:'
    end
    object LblCustoHora: TDBText
      Tag = -1
      Left = 675
      Top = 40
      Width = 75
      Height = 13
      AutoSize = True
      DataField = 'CUSTOHORA_CALC'
      DataSource = DM.dsRecursos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 626
      Top = 68
      Width = 43
      Height = 16
      Alignment = taRightJustify
      Caption = 'Estado:'
    end
    object Label25: TLabel
      Left = 349
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
    object EdtArea: TDBEdit
      Left = 127
      Top = 36
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'AREA'
      DataSource = DM.dsRecursos
      ParentCtl3D = False
      TabOrder = 0
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnArea: TButton
      Left = 318
      Top = 34
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnAreaClick
    end
    object EdtClasse: TDBEdit
      Left = 127
      Top = 67
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CLASSE'
      DataSource = DM.dsRecursos
      ParentCtl3D = False
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnClasse: TButton
      Left = 318
      Top = 64
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
      OnClick = BtnClasseClick
    end
    object EdtCentroCusto: TDBEdit
      Left = 127
      Top = 98
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsRecursos
      ParentCtl3D = False
      TabOrder = 4
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCentroCusto: TButton
      Left = 318
      Top = 96
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
      OnClick = BtnCentroCustoClick
    end
    object EdtAquisicao: TJvDBDateEdit
      Left = 127
      Top = 129
      Width = 189
      Height = 24
      DataField = 'DATAAQUISICAO'
      DataSource = DM.dsRecursos
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtFabricacao: TJvDBDateEdit
      Left = 127
      Top = 160
      Width = 189
      Height = 24
      DataField = 'DATAFABRICACAO'
      DataSource = DM.dsRecursos
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtGarantia: TJvDBDateEdit
      Left = 432
      Top = 36
      Width = 151
      Height = 24
      DataField = 'DATAGARANTIA'
      DataSource = DM.dsRecursos
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPreco: TDBEdit
      Left = 432
      Top = 67
      Width = 85
      Height = 24
      DataField = 'PRECO'
      DataSource = DM.dsRecursos
      MaxLength = 14
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtQtde: TDBEdit
      Left = 432
      Top = 98
      Width = 85
      Height = 24
      DataField = 'QUANTIDADE'
      DataSource = DM.dsRecursos
      MaxLength = 14
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtVidaUtil: TDBEdit
      Left = 432
      Top = 129
      Width = 85
      Height = 24
      DataField = 'AMORTIZACAO'
      DataSource = DM.dsRecursos
      MaxLength = 15
      TabOrder = 11
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBEstado: TDBComboBox
      Left = 675
      Top = 67
      Width = 85
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ESTADO'
      DataSource = DM.dsRecursos
      Items.Strings = (
        'Bom'
        'Regular'
        'Ruim')
      TabOrder = 12
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 605
    Width = 1012
  end
  inherited PAlertas: TPanel
    Top = 563
    Width = 1012
  end
  inherited PBase: TPanel
    Top = 565
    Width = 1008
    inherited Button1: TButton
      DisabledImageIndex = 38
      OnClick = Button1Click
    end
  end
  object PImagem: TPanel [7]
    Left = 789
    Top = 343
    Width = 223
    Height = 220
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    ExplicitLeft = 785
    ExplicitHeight = 217
    object ImgFotoRecurso: TImage
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
      Top = 160
      Width = 75
      Height = 22
      Caption = 'Anexar'
      DisabledImageIndex = 74
      ImageIndex = 73
      TabOrder = 0
      OnClick = BtnAnexarClick
      OnExit = TabNextTab1AfterTabChange
    end
    object BtnLimpar: TButton
      Left = 115
      Top = 160
      Width = 75
      Height = 22
      Caption = 'Limpar'
      DisabledImageIndex = 63
      DragCursor = 63
      ImageIndex = 62
      TabOrder = 1
      OnClick = BtnLimparClick
      OnExit = TabNextTab1AfterTabChange
    end
  end
  object PopupMenuFerramentas: TPopupMenu
    Left = 826
    Top = 506
    object KitdeRecursos1: TMenuItem
      Caption = 'Kit de Recursos'
      OnClick = KitdeRecursos1Click
    end
    object Ferramentaria1: TMenuItem
      Caption = 'Ferramentaria'
      OnClick = Ferramentaria1Click
    end
  end
  object OPDFoto: TJvOpenDialog
    Filter = 'JPGl image files (*.jpg,*.jpeg)|*.JPG'
    Height = 0
    Width = 0
    Left = 528
    Top = 328
  end
end

inherited FrmTelaCadEquipamentos: TFrmTelaCadEquipamentos
  Caption = 'Equipamentos'
  ClientHeight = 624
  ClientWidth = 1012
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited LCadastro: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsEquipamentos
    end
    inherited LblUsuCad: TDBText
      Width = 87
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsEquipamentos
      ExplicitWidth = 87
    end
    inherited LAlteracao: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
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
      DataSource = DM.dsEquipamentos
    end
    inherited LblUsuAlt: TDBText
      Width = 87
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsEquipamentos
      ExplicitWidth = 87
    end
    inherited BtnNovo: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnSalvar: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnCancelar: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnExcluir: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnConsultar: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnImprimir: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnAjuda: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnSair: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnImagem: TButton
      Visible = True
      OnClick = BtnImagemClick
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    object Label4: TLabel [0]
      Left = 45
      Top = 33
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel [1]
      Left = 78
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
    object Label6: TLabel [2]
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
    object Label7: TLabel [3]
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
    inherited Label1: TLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    object Label17: TLabel
      Left = 490
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
    object EdtCodEquip: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodEquipExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodFamiliaEquip: TDBEdit
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFAMILIAEQUIP'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFamiliaEquip: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'FAMILIAEQUIP'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
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
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
      TabStop = False
      Color = clBtnFace
      DataField = 'FABRICANTE'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
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
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
      TabStop = False
      Color = clBtnFace
      DataField = 'FORNECEDOR'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
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
      TabOrder = 4
      OnClick = BtnFamiliaClick
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
      TabOrder = 7
      OnClick = BtnFabricanteClick
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
      TabOrder = 10
      OnClick = BtnFornecedorClick
    end
  end
  inherited PProgramacao: TPanel
    Width = 1008
    inherited Label2: TLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    object PCDadosTecnicos: TPageControl
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
            Top = 11
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO1'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo2: TDBText
            Left = 0
            Top = 40
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO2'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo3: TDBText
            Left = 0
            Top = 69
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO3'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo4: TDBText
            Left = 0
            Top = 98
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO4'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo8: TDBText
            Left = 319
            Top = 98
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO8'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo7: TDBText
            Left = 319
            Top = 69
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO7'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo6: TDBText
            Left = 319
            Top = 40
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO6'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo5: TDBText
            Left = 319
            Top = 11
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO5'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo9: TDBText
            Left = 639
            Top = 11
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO9'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo10: TDBText
            Left = 639
            Top = 40
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO10'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo11: TDBText
            Left = 639
            Top = 69
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO11'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Campo12: TDBText
            Left = 639
            Top = 98
            Width = 169
            Height = 15
            Alignment = taRightJustify
            DataField = 'CAMPO12'
            DataSource = DM.dsFamEquipamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object EdtCampo1: TDBEdit
            Left = 173
            Top = 9
            Width = 135
            Height = 22
            DataField = 'REGISTRO1'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 0
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo1KeyPress
          end
          object EdtCampo2: TDBEdit
            Left = 173
            Top = 38
            Width = 135
            Height = 22
            DataField = 'REGISTRO2'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 1
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo2KeyPress
          end
          object EdtCampo3: TDBEdit
            Left = 173
            Top = 67
            Width = 135
            Height = 22
            DataField = 'REGISTRO3'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 2
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo3KeyPress
          end
          object EdtCampo4: TDBEdit
            Left = 173
            Top = 96
            Width = 135
            Height = 22
            DataField = 'REGISTRO4'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 3
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo4KeyPress
          end
          object EdtCampo8: TDBEdit
            Left = 492
            Top = 96
            Width = 135
            Height = 22
            DataField = 'REGISTRO8'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 7
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo8KeyPress
          end
          object EdtCampo7: TDBEdit
            Left = 492
            Top = 67
            Width = 135
            Height = 22
            DataField = 'REGISTRO7'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 6
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo7KeyPress
          end
          object EdtCampo6: TDBEdit
            Left = 492
            Top = 38
            Width = 135
            Height = 22
            DataField = 'REGISTRO6'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 5
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo6KeyPress
          end
          object EdtCampo5: TDBEdit
            Left = 492
            Top = 9
            Width = 135
            Height = 22
            DataField = 'REGISTRO5'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 4
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo5KeyPress
          end
          object EdtCampo9: TDBEdit
            Left = 813
            Top = 9
            Width = 135
            Height = 22
            DataField = 'REGISTRO9'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 8
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo9KeyPress
          end
          object EdtCampo10: TDBEdit
            Left = 813
            Top = 38
            Width = 135
            Height = 22
            DataField = 'REGISTRO10'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 9
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo10KeyPress
          end
          object EdtCampo11: TDBEdit
            Left = 813
            Top = 67
            Width = 135
            Height = 22
            DataField = 'REGISTRO11'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 10
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo11KeyPress
          end
          object EdtCampo12: TDBEdit
            Left = 813
            Top = 96
            Width = 135
            Height = 22
            DataField = 'REGISTRO12'
            DataSource = DM.dsEquipamentosDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 38
            ParentFont = False
            TabOrder = 11
            OnExit = TabNextTab1AfterTabChange
            OnKeyPress = EdtCampo11KeyPress
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
          DataSource = DM.dsEquipamentosDados
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited PDiversos: TPanel
    Width = 1008
    Height = 200
    inherited Label3: TLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    object Label8: TLabel
      Left = 58
      Top = 38
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'Calend'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 82
      Top = 68
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'Classe:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 27
      Top = 99
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 17
      Top = 130
      Width = 107
      Height = 16
      Alignment = taRightJustify
      Caption = 'Data de Aquisi'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 23
      Top = 161
      Width = 101
      Height = 16
      Alignment = taRightJustify
      Caption = 'Data de Funcion.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 397
      Top = 68
      Width = 67
      Height = 16
      Alignment = taRightJustify
      Caption = 'Nota Fiscal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 411
      Top = 99
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Garantia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 730
      Top = 38
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = #193'rea:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 722
      Top = 68
      Width = 40
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#233'lula:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
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
    object Label24: TLabel
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
    object Label25: TLabel
      Left = 990
      Top = 39
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
    object Label26: TLabel
      Left = 990
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
    object Label30: TLabel
      Left = 427
      Top = 38
      Width = 37
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblPrimario: TDBText
      Left = 670
      Top = 161
      Width = 326
      Height = 16
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label32: TLabel
      Left = 321
      Top = 165
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
    object EdtNotaFiscal: TDBEdit
      Left = 467
      Top = 67
      Width = 170
      Height = 24
      DataField = 'NOTAFISCAL'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtGarantia: TJvDBDateEdit
      Left = 467
      Top = 98
      Width = 170
      Height = 24
      DataField = 'DATAGARANTIA'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ButtonWidth = 27
      ParentFont = False
      ShowNullDate = False
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbOperando: TDBCheckBox
      Left = 399
      Top = 130
      Width = 85
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Operando:'
      DataField = 'OPERANDO'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbReserva: TDBCheckBox
      Left = 561
      Top = 130
      Width = 76
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Reserva:'
      DataField = 'RESERVA'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbSecundario: TDBCheckBox
      Left = 391
      Top = 159
      Width = 93
      Height = 18
      Alignment = taLeftJustify
      Caption = 'Secund'#225'rio:'
      DataField = 'SECUNDARIO'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = ChbSecundarioClick
      OnExit = TabNextTab1AfterTabChange
    end
    object BtnCalendario: TButton
      Left = 318
      Top = 34
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 1
      OnClick = BtnCalendarioClick
    end
    object BtnClasse: TButton
      Left = 318
      Top = 65
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 3
      OnClick = BtnClasseClick
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
      TabOrder = 5
      OnClick = BtnCentroCustoClick
    end
    object BtnPrimario: TButton
      Left = 639
      Top = 155
      Width = 25
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 15
      Visible = False
      OnClick = BtnPrimarioClick
    end
    object BtnArea: TButton
      Left = 960
      Top = 32
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 17
      OnClick = BtnAreaClick
    end
    object BtnCelula: TButton
      Left = 960
      Top = 65
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 19
      OnClick = BtnCelulaClick
    end
    object EdtCalendario: TDBEdit
      Left = 127
      Top = 36
      Width = 189
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'CALENDARIOEQUIP'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtClasse: TDBEdit
      Left = 127
      Top = 67
      Width = 189
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'CLASSE'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCentroCusto: TDBEdit
      Left = 127
      Top = 98
      Width = 189
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPrimario: TDBEdit
      Left = 487
      Top = 157
      Width = 150
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CODEQUIPAMENTOPAI'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
      Visible = False
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtArea: TDBEdit
      Left = 766
      Top = 36
      Width = 192
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir a informa'#231#227'o.'
      TabStop = False
      Color = clBtnFace
      DataField = 'AREA'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 16
      StyleElements = [seFont, seClient]
      OnDblClick = EdtAreaDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCelula: TDBEdit
      Left = 766
      Top = 67
      Width = 192
      Height = 24
      Hint = 'D'#234' duplo-clique para excluir a informa'#231#227'o.'
      TabStop = False
      Color = clBtnFace
      DataField = 'CELULA'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 18
      StyleElements = [seFont, seClient]
      OnDblClick = EdtCelulaDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPreco: TDBEdit
      Left = 467
      Top = 36
      Width = 170
      Height = 24
      DataField = 'PRECO'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object NBLocalizacao: TNotebook
      Left = 692
      Top = 95
      Width = 304
      Height = 61
      PageIndex = 1
      TabOrder = 20
      object TPage
        Left = 0
        Top = 0
        Caption = 'PrimTransf'
        object LblLinha: TLabel
          Left = 35
          Top = 8
          Width = 35
          Height = 16
          Alignment = taRightJustify
          Caption = 'Linha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 298
          Top = 7
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
        object LblSequencia: TLabel
          Left = 4
          Top = 38
          Width = 64
          Height = 16
          Alignment = taRightJustify
          Caption = 'Sequ'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 270
          Top = 38
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
        object EdtLinha: TDBEdit
          Left = 74
          Top = 4
          Width = 192
          Height = 24
          Hint = 'D'#234' duplo-clique para excluir a informa'#231#227'o.'
          TabStop = False
          Color = clBtnFace
          DataField = 'LINHA'
          DataSource = DM.dsEquipamentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnDblClick = EdtLinhaDblClick
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object BtnLinha: TButton
          Left = 268
          Top = 1
          Width = 28
          Height = 28
          Hint = 'Consultar/Cadastrar (Ctrl)'
          DisabledImageIndex = 14
          ImageAlignment = iaCenter
          ImageIndex = 14
          Images = DM.ImageListBotoes
          TabOrder = 1
          OnClick = BtnLinhaClick
        end
        object EdtSequenciaPrim: TDBEdit
          Left = 74
          Top = 34
          Width = 192
          Height = 24
          DataField = 'SEQUENCIA'
          DataSource = DM.dsEquipamentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PrimTranspSecTransf'
        object Label29: TLabel
          Left = 6
          Top = 5
          Width = 64
          Height = 16
          Caption = 'Sequ'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 271
          Top = 7
          Width = 8
          Height = 16
          Caption = '*'
        end
        object EdtSequenciaSec: TDBEdit
          Left = 74
          Top = 3
          Width = 192
          Height = 24
          DataField = 'SEQUENCIA'
          DataSource = DM.dsEquipamentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SecTransp'
        ExplicitWidth = 0
        ExplicitHeight = 64
      end
    end
    object EdtAquisicao: TJvDBDateEdit
      Left = 127
      Top = 129
      Width = 189
      Height = 24
      DataField = 'DATAAQUISICAO'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ButtonWidth = 27
      ParentFont = False
      ShowNullDate = False
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtFuncionamento: TJvDBDateEdit
      Left = 127
      Top = 160
      Width = 189
      Height = 24
      DataField = 'DATAINIFUNC'
      DataSource = DM.dsEquipamentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ButtonWidth = 27
      ParentFont = False
      ShowNullDate = False
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 605
    Width = 1012
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
  end
  inherited PAlertas: TPanel
    Top = 589
    Width = 1012
    inherited LblAlertas: TLabel
      Left = 1011
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 1011
    end
  end
  inherited PBase: TPanel
    Top = 549
    Width = 1008
    inherited BtnMais: TButton
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited PAuxiliares: TPanel
      Width = 737
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 737
    end
    inherited Button1: TButton
      Left = 826
      Hint = 'Inspe'#231#245'es Programadas do Equipamento F7'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 38
      ImageIndex = 37
      OnClick = Button1Click
      ExplicitLeft = 826
    end
    inherited Button2: TButton
      Left = 855
      Hint = 'Principais Pe'#231'as de Reposi'#231#227'o do Equipamento F8'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 81
      ImageIndex = 80
      OnClick = Button2Click
      ExplicitLeft = 855
    end
    inherited Button3: TButton
      Left = 884
      Hint = 'Especialistas do Equipamento F9'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 28
      ImageIndex = 27
      OnClick = Button3Click
      ExplicitLeft = 884
    end
    inherited Button4: TButton
      Left = 913
      Hint = 'Literaturas T'#233'cnicas do Equipamento F10'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 65
      ImageIndex = 64
      OnClick = Button4Click
      ExplicitLeft = 913
    end
    inherited Button5: TButton
      Left = 942
      Hint = 'Navega'#231#227'o Gr'#225'fica F11'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 32
      ImageIndex = 31
      OnClick = Button5Click
      ExplicitLeft = 942
    end
    inherited Button6: TButton
      Left = 971
      Hint = 'Hist'#243'rico do Equipamento F12'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 59
      ImageIndex = 58
      OnClick = Button6Click
      ExplicitLeft = 971
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 449
    Top = 64
    inherited MmExtras: TMenuItem
      inherited MmRelatorio: TMenuItem
        ShortCut = 16466
      end
    end
  end
  inherited TimerLetreiro: TTimer
    Left = 487
    Top = 64
  end
  inherited TimerAlertas: TTimer
    Left = 525
    Top = 64
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 384
    Top = 64
  end
  inherited ActionList1: TActionList
    Top = 70
  end
  object PopupMenuInspecoes: TPopupMenu
    Left = 826
    Top = 506
    object Manutencoes1: TMenuItem
      Caption = 'Manuten'#231#245'es'
      OnClick = Manutencoes1Click
    end
    object Lubrificacoes1: TMenuItem
      Caption = 'Lubrifica'#231#245'es'
      OnClick = Lubrificacoes1Click
    end
    object PontosInspecao1: TMenuItem
      Caption = 'Pontos de Inspe'#231#227'o'
      OnClick = PontosInspecao1Click
    end
    object Contadores1: TMenuItem
      Caption = 'Medidores'
      OnClick = Contadores1Click
    end
    object Confiabilidade1: TMenuItem
      Caption = 'Confiabilidade'
      OnClick = Confiabilidade1Click
    end
  end
  object PopupMenuCons: TPopupMenu
    Left = 338
    Top = 64
    object Codigo1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Codigo1Click
    end
    object Descricao1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = Descricao1Click
    end
    object Area1: TMenuItem
      Caption = #193'rea'
      OnClick = Area1Click
    end
    object Famlia1: TMenuItem
      Caption = 'Fam'#237'lia'
      OnClick = Famlia1Click
    end
  end
end

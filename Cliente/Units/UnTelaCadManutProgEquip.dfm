inherited FrmTelaCadManutProgEquip: TFrmTelaCadManutProgEquip
  Caption = 'Manuten'#231#227'o Programada do Equipamento'
  TextHeight = 16
  inherited PControle: TPanel
    DesignSize = (
      1008
      45)
    inherited LCadastro: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 754
    end
    inherited LCadastroPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 710
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsManutProgEquip
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsManutProgEquip
    end
    inherited LAlteracao: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 905
    end
    inherited LAlteradoPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 879
    end
    inherited LblDataAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsManutProgEquip
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsManutProgEquip
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
  end
  inherited PIdentificacao: TPanel
    Height = 97
    ExplicitHeight = 97
    inherited Label1: TLabel
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    object Label5: TLabel
      Left = 49
      Top = 32
      Width = 74
      Height = 16
      Alignment = taRightJustify
      Caption = 'Manuten'#231#227'o:'
    end
    object Label6: TLabel
      Left = 77
      Top = 62
      Width = 46
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fam'#237'lia:'
    end
    object Label7: TLabel
      Left = 502
      Top = 62
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'Criticidade:'
    end
    object Label16: TLabel
      Left = 820
      Top = 62
      Width = 31
      Height = 16
      Alignment = taRightJustify
      Caption = 'Rota:'
    end
    object LblRota: TDBText
      Left = 854
      Top = 62
      Width = 134
      Height = 16
      DataField = 'ROTA'
      DataSource = DM.dsManutProgEquip
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 452
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
    object Label18: TLabel
      Left = 478
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
    object Label12: TLabel
      Left = 724
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
    object Label20: TLabel
      Left = 491
      Top = 32
      Width = 76
      Height = 16
      Alignment = taRightJustify
      Caption = 'Respons'#225'vel:'
    end
    object EdtCodManutencao: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 87
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsManutProgEquip
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodManutencaoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescManutencao: TDBEdit
      Left = 216
      Top = 30
      Width = 230
      Height = 24
      CharCase = ecUpperCase
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsManutProgEquip
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodFamilia: TDBEdit
      Tag = 555
      Left = 127
      Top = 60
      Width = 87
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODMANUTPROGFAMEQUIP'
      DataSource = DM.dsManutProgEquip
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescFamilia: TDBEdit
      Left = 216
      Top = 60
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'DESCMANUTPROGFAMEQUIP'
      DataSource = DM.dsManutProgEquip
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnFamilia: TButton
      Left = 447
      Top = 57
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 57
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 4
      OnClick = BtnFamiliaClick
    end
    object CBCriticidade: TDBComboBox
      Left = 572
      Top = 60
      Width = 146
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'CRITICIDADE'
      DataSource = DM.dsManutProgEquip
      Items.Strings = (
        'Para a F'#225'brica'
        'Para a '#193'rea'
        'Para o Equipamento'
        'Outra')
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodResponsavel: TDBEdit
      Left = 572
      Top = 29
      Width = 120
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'MATRICULA'
      DataSource = DM.dsManutProgEquip
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescResponsavel: TDBEdit
      Left = 695
      Top = 29
      Width = 263
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'RESPONSAVEL'
      DataSource = DM.dsManutProgEquip
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnResponsavel: TButton
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
      OnClick = BtnResponsavelClick
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 746
      Top = 62
      Width = 58
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsManutProgEquip
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = ChbAtivoNFClick
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited PProgramacao: TPanel
    Top = 152
    Height = 122
    ExplicitTop = 152
    ExplicitHeight = 122
    inherited Label2: TLabel
      Width = 132
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'PROGRAMA'#199#195'O'
      ExplicitWidth = 132
    end
    object Label14: TLabel
      Left = 269
      Top = 94
      Width = 89
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pr'#243'x. Inspe'#231#227'o:'
    end
    object Label8: TLabel
      Left = 94
      Top = 46
      Width = 29
      Height = 16
      Alignment = taRightJustify
      Caption = 'Dias:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 283
      Top = 46
      Width = 75
      Height = 16
      Alignment = taRightJustify
      Caption = 'Programada:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 520
      Top = 46
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Reprogramar:'
    end
    object Label10: TLabel
      Left = 70
      Top = 94
      Width = 53
      Height = 16
      Alignment = taRightJustify
      Caption = 'Controle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 26
      Width = 162
      Height = 16
      Caption = 'Tempo de funcionamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 520
      Top = 94
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Reprogramar:'
    end
    object Label15: TLabel
      Left = 176
      Top = 48
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
      Left = 731
      Top = 48
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
    object LblProgramarPor: TDBText
      Left = 8
      Top = 73
      Width = 109
      Height = 16
      AutoSize = True
      DataField = 'PROGRAMACAO2'
      DataSource = DM.dsManutProgEquip
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 256
      Top = 48
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
      Left = 487
      Top = 48
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
    object EdtDias: TDBEdit
      Left = 127
      Top = 44
      Width = 125
      Height = 24
      DataField = 'FREQUENCIA1'
      DataSource = DM.dsManutProgEquip
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtInicio: TJvDBDateEdit
      Left = 360
      Top = 44
      Width = 125
      Height = 24
      DataField = 'DTAINICIO1'
      DataSource = DM.dsManutProgEquip
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
    object CBReprogramacao: TDBComboBox
      Left = 606
      Top = 44
      Width = 120
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'REPROGRAMAR1'
      DataSource = DM.dsManutProgEquip
      Items.Strings = (
        'Programa'#231#227'o'
        'Execu'#231#227'o')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtControle: TDBEdit
      Left = 127
      Top = 92
      Width = 125
      Height = 24
      DataField = 'FREQUENCIA2'
      DataSource = DM.dsManutProgEquip
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtProxInspecao: TDBEdit
      Left = 360
      Top = 92
      Width = 125
      Height = 24
      DataField = 'LEITURA'
      DataSource = DM.dsManutProgEquip
      MaxLength = 9
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBReprogramacao2: TDBComboBox
      Left = 606
      Top = 92
      Width = 120
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'REPROGRAMAR2'
      DataSource = DM.dsManutProgEquip
      Items.Strings = (
        'Programa'#231#227'o'
        'Execu'#231#227'o')
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PDiversos: TPanel
    Top = 278
    Height = 267
    ExplicitTop = 278
    ExplicitHeight = 264
    inherited Label3: TLabel
      Width = 93
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'INSPE'#199#213'ES'
      ExplicitWidth = 93
    end
    object PCInspecoes: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 26
      Width = 1000
      Height = 237
      Margins.Top = 25
      ActivePage = TSItens
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 996
      ExplicitHeight = 234
      object TSItens: TTabSheet
        Caption = 'Itens'
        object PItens: TPanel
          Left = 0
          Top = 0
          Width = 992
          Height = 206
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 988
          ExplicitHeight = 203
          object GrdItens: TDBGrid
            Left = 1
            Top = 1
            Width = 990
            Height = 204
            Align = alClient
            Color = 14671839
            DataSource = DM.dsManutProgEquipItens
            DrawingStyle = gdsClassic
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            StyleElements = [seFont, seBorder]
            OnExit = TabNextTab1AfterTabChange
            Columns = <
              item
                Expanded = False
                FieldName = 'PARTE'
                Title.Caption = 'Parte'
                Width = 136
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITEM'
                Title.Caption = 'Item'
                Width = 199
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCINSPECAO'
                Title.Caption = 'Inspe'#231#227'o'
                Width = 350
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'EQUIPPARADO'
                PickList.Strings = (
                  'S'
                  'N')
                Title.Alignment = taCenter
                Title.Caption = 'Parado'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TEMPO'
                Title.Alignment = taCenter
                Title.Caption = 'Tempo'
                Width = 69
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'EXECAUTONOMO'
                PickList.Strings = (
                  'S'
                  'N')
                ReadOnly = True
                Title.Caption = 'Auton'#244'mo'
                Visible = True
              end>
          end
        end
      end
      object TSItensEsp: TTabSheet
        Caption = 'Espec'#237'ficos'
        ImageIndex = 1
        object PEspecificos: TPanel
          Left = 0
          Top = 0
          Width = 992
          Height = 206
          Align = alClient
          TabOrder = 0
          object GrdItensEsp: TDBGrid
            Left = 1
            Top = 1
            Width = 990
            Height = 204
            Hint = 'D'#234' duplo-clique para excluir o registro.'
            Align = alClient
            Color = 14671839
            DataSource = DM.dsManutProgEquipItensEsp
            DrawingStyle = gdsClassic
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnExit = TabNextTab1AfterTabChange
            Columns = <
              item
                Expanded = False
                FieldName = 'PARTE'
                Title.Caption = 'Parte'
                Width = 136
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITEM'
                Title.Caption = 'Item'
                Width = 199
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCINSPECAO'
                Title.Caption = 'Inspe'#231#227'o'
                Width = 350
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'EQUIPPARADO'
                PickList.Strings = (
                  'N'
                  'S')
                Title.Alignment = taCenter
                Title.Caption = 'Parado'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TEMPO'
                Title.Alignment = taCenter
                Title.Caption = 'Tempo'
                Width = 69
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'EXECAUTONOMO'
                PickList.Strings = (
                  'N'
                  'S')
                Title.Alignment = taCenter
                Title.Caption = 'Aut'#244'nomo'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited PBase: TPanel
    inherited Button1: TButton
      Left = 853
      Hint = 'Itens Espec'#237'ficos a Inspecionar'
      ImageIndex = 104
      TabOrder = 3
      OnClick = Button1Click
      ExplicitLeft = 853
    end
    inherited Button2: TButton
      Left = 882
      Hint = 'Pe'#231'as da Manuten'#231#227'o.'
      DisabledImageIndex = 81
      ImageIndex = 80
      TabOrder = 4
      OnClick = Button2Click
      ExplicitLeft = 882
    end
    inherited Button3: TButton
      Left = 911
      Hint = 'Recursos da Manuten'#231#227'o.'
      DisabledImageIndex = 38
      ImageIndex = 37
      TabOrder = 5
      OnClick = Button3Click
      ExplicitLeft = 911
    end
    inherited Button4: TButton
      Left = 824
      ImageIndex = 27
      TabOrder = 2
      OnClick = Button4Click
      ExplicitLeft = 824
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 768
    Top = 158
  end
  inherited TimerLetreiro: TTimer
    Left = 768
    Top = 219
  end
  inherited TimerAlertas: TTimer
    Left = 858
    Top = 219
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 172
  end
  inherited ActionList1: TActionList
    Left = 858
    Top = 158
  end
end

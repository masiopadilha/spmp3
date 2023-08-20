inherited FrmTelaCadLubrificProgFamEquip: TFrmTelaCadLubrificProgFamEquip
  Caption = 'Lubrifica'#231#227'o Programada de Fam'#237'lia de Equipamento'
  ClientHeight = 624
  ClientWidth = 1012
  ExplicitLeft = -251
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited LCadastro: TLabel
      Left = 722
    end
    inherited LCadastroPor: TLabel
      Left = 678
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsLubrificProgFamEquip
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsLubrificProgFamEquip
    end
    inherited LAlteracao: TLabel
      Left = 873
    end
    inherited LAlteradoPor: TLabel
      Left = 847
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsLubrificProgFamEquip
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsLubrificProgFamEquip
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    Height = 123
    ExplicitWidth = 1004
    ExplicitHeight = 123
    object Label5: TLabel
      Left = 672
      Top = 62
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'Monitoramento:'
    end
    object Label6: TLabel
      Left = 50
      Top = 32
      Width = 73
      Height = 16
      Alignment = taRightJustify
      Caption = 'Lubrifica'#231#227'o:'
    end
    object Label7: TLabel
      Left = 78
      Top = 62
      Width = 46
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fam'#237'lia:'
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
    object Label18: TLabel
      Left = 516
      Top = 66
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
      Left = 80
      Top = 93
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'Oficina:'
    end
    object Label28: TLabel
      Left = 516
      Top = 96
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
      Left = 642
      Top = 32
      Width = 121
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo de Manuten'#231#227'o:'
    end
    object Label21: TLabel
      Left = 992
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
    object BtnFamilia: TButton
      Left = 485
      Top = 58
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
    object BtnMonitoramento: TButton
      Left = 960
      Top = 58
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 57
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 11
      OnClick = BtnMonitoramentoClick
    end
    object ChbAtivo: TDBCheckBox
      Left = 724
      Top = 95
      Width = 59
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsLubrificProgFamEquip
      TabOrder = 12
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbVisivel: TDBCheckBox
      Left = 799
      Top = 95
      Width = 67
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsLubrificProgFamEquip
      TabOrder = 13
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtCodFamilia: TDBEdit
      Tag = 555
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODFAMILIAEQUIP'
      DataSource = DM.dsLubrificProgFamEquip
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodLubrificacao: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsLubrificProgFamEquip
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodLubrificacaoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescFamilia: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      TabStop = False
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FAMILIAEQUIPAMENTO'
      DataSource = DM.dsLubrificProgFamEquip
      ParentCtl3D = False
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescLubrificacao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsLubrificProgFamEquip
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescMonitoramento: TDBEdit
      Left = 766
      Top = 60
      Width = 192
      Height = 24
      TabStop = False
      Color = clBtnFace
      Ctl3D = True
      DataField = 'MONITORAMENTO'
      DataSource = DM.dsLubrificProgFamEquip
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object chbClonavel: TDBCheckBox
      Left = 878
      Top = 95
      Width = 80
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Clon'#225'vel:'
      DataField = 'CLONAVEL'
      DataSource = DM.dsLubrificProgFamEquip
      TabOrder = 14
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtCodOficina: TDBEdit
      Tag = 555
      Left = 127
      Top = 91
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODOFICINA'
      DataSource = DM.dsLubrificProgFamEquip
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescOficina: TDBEdit
      Left = 254
      Top = 91
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'OFICINA'
      DataSource = DM.dsLubrificProgFamEquip
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnOficina: TButton
      Left = 485
      Top = 88
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BtnOficinaClick
    end
    object EdtManutencao: TDBEdit
      Left = 766
      Top = 30
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'MANUTENCAO'
      DataSource = DM.dsLubrificProgFamEquip
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnManutencao: TButton
      Left = 960
      Top = 26
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = BtnManutencaoClick
    end
  end
  inherited PProgramacao: TPanel
    Top = 178
    Width = 1008
    Height = 65
    ExplicitTop = 178
    ExplicitWidth = 1004
    ExplicitHeight = 65
    inherited Label2: TLabel
      Width = 132
      Caption = 'PROGRAMA'#199#195'O'
      ExplicitWidth = 132
    end
    object Label8: TLabel
      Left = 26
      Top = 32
      Width = 98
      Height = 16
      Caption = '1'#186' Programa'#231#227'o:'
    end
    object Label9: TLabel
      Left = 420
      Top = 32
      Width = 98
      Height = 16
      Caption = '2'#186' Programa'#231#227'o:'
    end
    object Label10: TLabel
      Left = 756
      Top = 32
      Width = 98
      Height = 16
      Caption = '3'#186' Programa'#231#227'o:'
    end
    object Label11: TLabel
      Left = 312
      Top = 32
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
    object EdtProgramacao1: TEdit
      Left = 127
      Top = 30
      Width = 170
      Height = 24
      TabStop = False
      Color = 14671839
      TabOrder = 0
      Text = 'Tempo de Funcionamento'
      OnKeyPress = FormKeyPress
    end
    object EdtProgramacao2: TDBEdit
      Left = 521
      Top = 30
      Width = 183
      Height = 24
      DataField = 'PROGRAMACAO2'
      DataSource = DM.dsLubrificProgFamEquip
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnProgramacao: TButton
      Left = 709
      Top = 28
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnProgramacaoClick
    end
    object EdtProgramacao3: TEdit
      Left = 857
      Top = 30
      Width = 131
      Height = 24
      TabStop = False
      Color = 14671839
      TabOrder = 4
      Text = 'Confiabilidade'
      OnKeyPress = FormKeyPress
    end
    object EdtDias: TDBEdit
      Left = 345
      Top = 30
      Width = 60
      Height = 24
      DataField = 'FREQUENCIA'
      DataSource = DM.dsLubrificProgFamEquip
      TabOrder = 1
      OnKeyPress = FormKeyPress
    end
  end
  inherited PDiversos: TPanel
    Top = 247
    Width = 1008
    Height = 113
    Align = alTop
    ExplicitTop = 247
    ExplicitWidth = 1004
    ExplicitHeight = 113
    inherited Label3: TLabel
      Width = 179
      Caption = 'PLANO DE TRABALHO'
      ExplicitWidth = 179
    end
    object GrdPlanoTrabalho: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 323
      Height = 88
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Margins.Top = 20
      Align = alLeft
      DataSource = DM.dsLubrificProgFamEquipPlanoTrab
      DrawingStyle = gdsClassic
      FixedColor = 14671839
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdPlanoTrabalhoDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = GrdPlanoTrabalhoKeyPress
      OnTitleClick = GrdPlanoTrabalhoTitleClick
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 282
          Visible = True
        end>
    end
    object REDetalhes: TJvDBRichEdit
      AlignWithMargins = True
      Left = 334
      Top = 21
      Width = 670
      Height = 88
      Margins.Top = 20
      DataField = 'DETALHES'
      DataSource = DM.dsLubrificProgFamEquipPlanoTrab
      Align = alRight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      ExplicitLeft = 330
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 605
    Width = 1012
    ExplicitTop = 602
    ExplicitWidth = 1008
  end
  inherited PAlertas: TPanel
    Top = 589
    Width = 1012
    TabOrder = 7
    ExplicitTop = 586
    ExplicitWidth = 1008
  end
  inherited PBase: TPanel
    Top = 549
    Width = 1008
    TabOrder = 5
    ExplicitTop = 546
    ExplicitWidth = 1004
    inherited Button1: TButton
      Hint = 'Partes a Inspecionar'
      DisabledImageIndex = 85
      ImageIndex = 84
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Hint = 'Itens a Inspecionar'
      DisabledImageIndex = 105
      ImageIndex = 104
      OnClick = Button2Click
    end
  end
  object Panel1: TPanel [7]
    AlignWithMargins = True
    Left = 3
    Top = 365
    Width = 1006
    Height = 171
    Align = alTop
    TabOrder = 4
    ExplicitWidth = 1002
    object Label4: TLabel
      Left = 7
      Top = 3
      Width = 68
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'INSPE'#199#213'ES'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object GrdItens: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 998
      Height = 146
      Margins.Top = 20
      Align = alClient
      Color = 14671839
      DataSource = DM.dsLubrificProgFamEquipItensTodos
      DrawingStyle = gdsClassic
      FixedColor = 14671839
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
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM'
          Title.Caption = 'Item'
          Width = 194
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCINSPECAO'
          Title.Caption = 'Inspe'#231#227'o'
          Width = 379
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPPARADO'
          PickList.Strings = (
            'S'
            'N')
          Title.Alignment = taCenter
          Title.Caption = 'Parado'
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
          Expanded = False
          FieldName = 'EXECAUTONOMO'
          PickList.Strings = (
            'S'
            'N')
          ReadOnly = True
          Title.Caption = 'Autonomo'
          Visible = True
        end>
    end
  end
  object PopupMenuProgramacao: TPopupMenu
    Left = 304
    Top = 116
    object Consultar1: TMenuItem
      Caption = 'Consultar'
      OnClick = Consultar1Click
    end
    object ExcluirCorp: TMenuItem
      Caption = 'Excluir'
      Hint = 'Excluir administrador'
      OnClick = ExcluirCorpClick
    end
  end
end

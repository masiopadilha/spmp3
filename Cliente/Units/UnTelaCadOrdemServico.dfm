inherited FrmTelaCadOrdemServico: TFrmTelaCadOrdemServico
  Caption = 'Cadastro de Ordem de Servi'#231'o'
  ClientHeight = 624
  ClientWidth = 1012
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited pAlteracao: TPanel
      Left = 650
      ExplicitLeft = 650
      inherited LCadastro: TLabel
        Height = 14
      end
      inherited LblDataAlt: TDBText
        DataSource = DM.dsOrdemServico
        ExplicitLeft = 900
      end
      inherited LAlteradoPor: TLabel
        ExplicitLeft = 836
      end
      inherited LblDataCad: TDBText
        DataSource = DM.dsOrdemServico
        ExplicitLeft = 732
      end
    end
    inherited pCadastro: TPanel
      Left = 649
      ExplicitLeft = 649
      inherited LCadastroPor: TLabel
        Height = 14
      end
      inherited LblUsuCad: TDBText
        DataSource = DM.dsOrdemServico
        ExplicitLeft = 732
      end
      inherited LAlteracao: TLabel
        ExplicitLeft = 862
      end
      inherited LblUsuAlt: TDBText
        DataSource = DM.dsOrdemServico
        ExplicitLeft = 900
      end
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    object Label4: TLabel
      Left = 91
      Top = 32
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'O.S.:'
    end
    object Label5: TLabel
      Left = 45
      Top = 62
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label15: TLabel
      Left = 715
      Top = 32
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Origem:'
    end
    object Label16: TLabel
      Left = 708
      Top = 62
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
    end
    object LblOrigem: TLabel
      Left = 766
      Top = 32
      Width = 184
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 629
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
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODIGO'
      DataSource = DM.dsOrdemServico
      ReadOnly = True
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 370
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodEquipamento: TDBEdit
      Tag = 555
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      DataSource = DM.dsOrdemServico
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 254
      Top = 60
      Width = 370
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 625
      Top = 58
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnEquipamentoClick
    end
    object PSituacao: TPanel
      Left = 766
      Top = 60
      Width = 170
      Height = 25
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      StyleElements = []
    end
  end
  inherited PProgramacao: TPanel
    Width = 1008
    Height = 160
    ExplicitHeight = 160
    inherited Label2: TLabel
      Width = 132
      Caption = 'PROGRAMA'#199#195'O'
      ExplicitWidth = 132
    end
    object Label8: TLabel
      Left = 50
      Top = 32
      Width = 74
      Height = 16
      Alignment = taRightJustify
      Caption = 'Manuten'#231#227'o:'
    end
    object Label6: TLabel
      Left = 388
      Top = 32
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'Motivo:'
    end
    object Label7: TLabel
      Left = 727
      Top = 32
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'Falha:'
    end
    object Label9: TLabel
      Left = 27
      Top = 63
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object Label10: TLabel
      Left = 366
      Top = 63
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = 'Solicitante:'
    end
    object Label11: TLabel
      Left = 61
      Top = 94
      Width = 63
      Height = 16
      Alignment = taRightJustify
      Caption = 'Prioridade:'
    end
    object Label12: TLabel
      Left = 365
      Top = 94
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'Criticidade:'
    end
    object Label13: TLabel
      Left = 719
      Top = 63
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'Oficina:'
    end
    object Label14: TLabel
      Left = 681
      Top = 94
      Width = 82
      Height = 16
      Alignment = taRightJustify
      Caption = 'O.S. Principal:'
    end
    object Label17: TLabel
      Left = 30
      Top = 125
      Width = 94
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tempo Previsto:'
    end
    object Label18: TLabel
      Left = 900
      Top = 125
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'H/H:'
    end
    object LblHomemHora: TDBText
      Left = 929
      Top = 125
      Width = 96
      Height = 16
      AutoSize = True
      DataField = 'TEMPOHOMEMHORA'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 350
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
    object Label22: TLabel
      Left = 350
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
    object Label23: TLabel
      Left = 657
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
      Visible = False
    end
    object Label25: TLabel
      Left = 322
      Top = 95
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
      Left = 632
      Top = 95
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
      Left = 991
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
      Visible = False
    end
    object Label29: TLabel
      Left = 227
      Top = 127
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
      Left = 354
      Top = 125
      Width = 76
      Height = 16
      Alignment = taRightJustify
      Caption = 'Respons'#225'vel:'
    end
    object Label28: TLabel
      Left = 991
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
    object EdtManutencao: TDBEdit
      Left = 127
      Top = 30
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'MANUTENCAO'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnManutencao: TButton
      Left = 320
      Top = 28
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnManutencaoClick
    end
    object EdtMotivo: TDBEdit
      Left = 433
      Top = 30
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'MOTIVOPARADA'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnMotivo: TButton
      Left = 626
      Top = 28
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnMotivoClick
    end
    object EdtFalha: TDBEdit
      Left = 766
      Top = 30
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'FALHA'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnFalha: TButton
      Left = 961
      Top = 28
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnFalhaClick
    end
    object EdtCentroCusto: TDBEdit
      Left = 127
      Top = 61
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCentroCusto: TButton
      Left = 320
      Top = 58
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
      OnClick = BtnCentroCustoClick
    end
    object EdtSolicitado: TDBEdit
      Left = 433
      Top = 61
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'SOLICITANTE'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 8
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnSolicitado: TButton
      Left = 626
      Top = 58
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
      OnClick = BtnSolicitadoClick
    end
    object CBPrioridade: TDBComboBox
      Left = 127
      Top = 92
      Width = 192
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'PRIORIDADEPARADA'
      DataSource = DM.dsOrdemServico
      Items.Strings = (
        'Emerg'#234'ncia'
        'At'#233' 12 hs'
        'At'#233' 72 hs'
        'At'#233' 1 Semana'
        'At'#233' 1 M'#234's'
        'Acima de um m'#234's')
      TabOrder = 12
      OnExit = TabNextTab1AfterTabChange
    end
    object CBCriticidade: TDBComboBox
      Left = 433
      Top = 92
      Width = 192
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'CRITICIDADE'
      DataSource = DM.dsOrdemServico
      Items.Strings = (
        'Para a F'#225'brica'
        'Para o Equipamento'
        'Para a '#193'rea')
      TabOrder = 13
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtOficina: TDBEdit
      Left = 766
      Top = 61
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'OFICINA'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 10
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnOficina: TButton
      Left = 961
      Top = 58
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BtnOficinaClick
    end
    object EdtOSPrincipal: TDBEdit
      Left = 766
      Top = 92
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CODOSPRINCIPAL'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 14
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnOSPrincipal: TButton
      Left = 961
      Top = 90
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = BtnOSPrincipalClick
    end
    object ChbParado: TDBCheckBox
      Left = 714
      Top = 125
      Width = 69
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Parado:'
      DataField = 'EQUIPPARADO'
      DataSource = DM.dsOrdemServico
      TabOrder = 19
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = ChbParadoClick
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtTempoPrev: TDBEdit
      Left = 127
      Top = 123
      Width = 97
      Height = 24
      Ctl3D = True
      DataField = 'TEMPOPREVISTO'
      DataSource = DM.dsOrdemServico
      MaxLength = 14
      ParentCtl3D = False
      TabOrder = 16
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object ChbAutonomo: TDBCheckBox
      Left = 797
      Top = 125
      Width = 88
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Aut'#244'nomo:'
      DataField = 'EXECAUTONOMO'
      DataSource = DM.dsOrdemServico
      TabOrder = 20
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = ChbAutonomoClick
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtResponsavel: TDBEdit
      Left = 433
      Top = 123
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'NOMERESPONSAVEL'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 17
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnResponsavel: TButton
      Left = 626
      Top = 121
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = BtnResponsavelClick
    end
  end
  inherited PDiversos: TPanel
    Top = 315
    Width = 1008
    Height = 246
    ExplicitTop = 315
    ExplicitHeight = 243
    inherited Label3: TLabel
      Top = 2
      Width = 194
      Caption = 'SERVI'#199'OS '#192' EXECUTAR'
      ExplicitTop = 2
      ExplicitWidth = 194
    end
    object DBGrid: TJvDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 26
      Width = 998
      Height = 215
      Hint = 'D'#234' duplo-clique para excluir o registro.'
      Margins.Left = 4
      Margins.Top = 25
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      DataSource = DM.dsOrdemServicoServSolic
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = GrdServicosExecDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = GrdServicosExecKeyPress
      TitleButtons = True
      BevelInner = bvNone
      BevelOuter = bvNone
      AlternateRowColor = 16055512
      SortedField = 'CODIGO'
      TitleArrow = True
      SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'PARTE'
          Title.Caption = 'Parte'
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM'
          Title.Caption = 'Item'
          Width = 252
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Servi'#231'o'
          Width = 365
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
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEMPOEXECUCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Width = 60
          Visible = True
        end>
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
      Hint = 'M'#227'o de Obra da O.S.'
      DisabledImageIndex = 28
      ImageIndex = 27
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Hint = 'Pe'#231'as e Lubrificantes da O.S.'
      DisabledImageIndex = 81
      ImageIndex = 80
      OnClick = Button2Click
    end
    inherited Button3: TButton
      Hint = 'Recursos da O.S.'
      DisabledImageIndex = 38
      DragCursor = -1
      ImageIndex = 37
      OnClick = Button3Click
    end
    inherited Button4: TButton
      Hint = 'Planos de Trabalho da O.S.'
      DisabledImageIndex = 42
      ImageIndex = 41
      OnClick = Button4Click
    end
    inherited Button5: TButton
      Hint = 'Solicita'#231#227'o de Trabalho'
      DisabledImageIndex = 118
      ImageIndex = 117
      OnClick = Button5Click
    end
    inherited Button6: TButton
      Hint = 'Programar Ordem de Servi'#231'o'
      DisabledImageIndex = 40
      ImageIndex = 39
      OnClick = Button6Click
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 504
    Top = 65534
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 236
    inherited Completo1: TMenuItem
      Visible = False
    end
  end
  inherited ActionList1: TActionList
    Left = 546
    Top = 65534
  end
  object PopupMenuPecas: TPopupMenu
    Left = 854
    Top = 498
    object PecasdeReposicao1: TMenuItem
      Caption = 'Pe'#231'as de Reposi'#231#227'o'
      OnClick = PecasdeReposicao1Click
    end
    object Lubrificantes1: TMenuItem
      Caption = 'Lubrificantes'
      OnClick = Lubrificantes1Click
    end
  end
  object PopupMenuCons: TPopupMenu
    Left = 522
    Top = 91
    object Codigo1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Codigo1Click
    end
    object Descricao1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = Descricao1Click
    end
  end
end

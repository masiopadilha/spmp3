inherited FrmTelaCadOrdemServicoFechamento: TFrmTelaCadOrdemServicoFechamento
  Caption = 'Fechamento de Ordem de Servi'#231'o'
  ClientHeight = 624
  ClientWidth = 1012
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
    inherited LCadastro: TLabel
      Left = 691
      ExplicitLeft = 691
    end
    inherited LCadastroPor: TLabel
      Left = 647
      ExplicitLeft = 647
    end
    inherited LblDataCad: TDBText
      Left = 734
      DataSource = DM.dsOrdemServico
      ExplicitLeft = 734
    end
    inherited LblUsuCad: TDBText
      Left = 734
      DataSource = DM.dsOrdemServico
      ExplicitLeft = 734
    end
    inherited LAlteracao: TLabel
      Left = 850
      ExplicitLeft = 850
    end
    inherited LAlteradoPor: TLabel
      Left = 824
      ExplicitLeft = 824
    end
    inherited LblDataAlt: TDBText
      Left = 893
      DataSource = DM.dsOrdemServico
      ExplicitLeft = 893
    end
    inherited LblUsuAlt: TDBText
      Left = 893
      DataSource = DM.dsOrdemServico
      ExplicitLeft = 893
    end
    inherited BtnExcluir: TButton
      Visible = False
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
    Height = 124
    ExplicitWidth = 1004
    ExplicitHeight = 124
    object Label5: TLabel
      Left = 235
      Top = 32
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label6: TLabel
      Left = 86
      Top = 92
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
    end
    object Label7: TLabel
      Left = 255
      Top = 92
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fim:'
    end
    object EdtOrdemServico: TDBText
      Left = 123
      Top = 32
      Width = 97
      Height = 20
      DataField = 'CODIGO'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtEquipamento: TDBText
      Left = 318
      Top = 32
      Width = 671
      Height = 20
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 715
      Top = 64
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Origem:'
    end
    object LblOrigem: TLabel
      Left = 766
      Top = 64
      Width = 192
      Height = 20
      AutoSize = False
      Caption = 'LblOrigem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 708
      Top = 92
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
    end
    object Label28: TLabel
      Left = 454
      Top = 92
      Width = 75
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fechamento:'
    end
    object LblDataFechamento: TDBText
      Left = 533
      Top = 92
      Width = 127
      Height = 16
      AutoSize = True
      DataField = 'DATAFECHAMENTO'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 61
      Top = 62
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object edtDescOrdemServico: TDBText
      Left = 123
      Top = 62
      Width = 578
      Height = 13
      DataField = 'DESCRICAO'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 91
      Top = 32
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'O.S.:'
    end
    object EdtDataInicioReal: TJvDBMaskEdit
      Left = 127
      Top = 90
      Width = 114
      Height = 24
      DataField = 'DATAINICIOREAL'
      DataSource = DM.dsOrdemServico
      MaxLength = 16
      TabOrder = 0
      EditMask = '!99/99/0000 !90:00;1;'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtDataFimReal: TJvDBMaskEdit
      Left = 287
      Top = 90
      Width = 113
      Height = 24
      DataField = 'DATAFIMREAL'
      DataSource = DM.dsOrdemServico
      MaxLength = 16
      TabOrder = 1
      EditMask = '!99/99/0000 !90:00;1;_'
      OnExit = TabNextTab1AfterTabChange
    end
    object PSituacao: TPanel
      Left = 766
      Top = 90
      Width = 155
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
      TabOrder = 2
      StyleElements = []
    end
  end
  inherited PProgramacao: TPanel
    Top = 179
    Width = 1008
    ExplicitTop = 179
    ExplicitWidth = 1004
    inherited Label2: TLabel
      Width = 132
      Caption = 'PROGRAMA'#199#195'O'
      ExplicitWidth = 132
    end
    object Label17: TLabel
      Left = 31
      Top = 94
      Width = 90
      Height = 16
      Alignment = taRightJustify
      Caption = 'Executado (hs):'
    end
    object Label18: TLabel
      Left = 266
      Top = 94
      Width = 115
      Height = 16
      Alignment = taRightJustify
      Caption = 'Homem/Hora Exec.:'
    end
    object LblHomemHora: TDBText
      Left = 385
      Top = 94
      Width = 96
      Height = 16
      AutoSize = True
      DataField = 'TEMPOHOMEMHORAEXEC'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblCustoMObra: TDBText
      Left = 123
      Top = 125
      Width = 97
      Height = 16
      AutoSize = True
      DataField = 'CUSTOMOBRA'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 42
      Top = 125
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#227'o de Obra:'
    end
    object Label16: TLabel
      Left = 289
      Top = 125
      Width = 38
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pe'#231'as:'
    end
    object LblCustoPecas: TDBText
      Left = 330
      Top = 125
      Width = 93
      Height = 16
      AutoSize = True
      DataField = 'CUSTOPECAS'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 477
      Top = 125
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'Recursos:'
    end
    object LblCustoRecursos: TDBText
      Left = 538
      Top = 125
      Width = 115
      Height = 16
      AutoSize = True
      DataField = 'CUSTORECURSOS'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 81
      Top = 156
      Width = 40
      Height = 16
      Alignment = taRightJustify
      Caption = 'Extras:'
    end
    object Label9: TLabel
      Left = 47
      Top = 32
      Width = 74
      Height = 16
      Alignment = taRightJustify
      Caption = 'Manuten'#231#227'o:'
    end
    object Label21: TLabel
      Left = 349
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
    object Label10: TLabel
      Left = 386
      Top = 32
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'Motivo:'
    end
    object Label23: TLabel
      Left = 572
      Top = 31
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
      Left = 727
      Top = 32
      Width = 36
      Height = 16
      Alignment = taRightJustify
      Caption = 'Falha:'
    end
    object Label27: TLabel
      Left = 991
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
    object Label12: TLabel
      Left = 24
      Top = 63
      Width = 97
      Height = 16
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object Label22: TLabel
      Left = 349
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
    object Label13: TLabel
      Left = 368
      Top = 63
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Solicitado:'
    end
    object Label24: TLabel
      Left = 572
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
    object Label14: TLabel
      Left = 719
      Top = 63
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'Oficina:'
    end
    object LblTempoExec: TDBText
      Left = 123
      Top = 94
      Width = 89
      Height = 16
      AutoSize = True
      DataField = 'TEMPOEXECUTADO'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 704
      Top = 125
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Auxiliares:'
    end
    object LblCustoAuxiliares: TDBText
      Left = 766
      Top = 125
      Width = 118
      Height = 16
      AutoSize = True
      DataField = 'CUSTOSECUNDARIOS'
      DataSource = DM.dsOrdemServico
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ChbParcial: TDBCheckBox
      Left = 717
      Top = 94
      Width = 68
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Parcial:'
      DataField = 'PARCIAL'
      DataSource = DM.dsOrdemServico
      TabOrder = 0
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object EdtDescCustoExtra: TDBEdit
      Left = 254
      Top = 155
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'CUSTOEXTRADESC'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCustoExtra: TDBEdit
      Left = 127
      Top = 155
      Width = 125
      Height = 24
      Ctl3D = True
      DataField = 'CUSTOEXTRA'
      DataSource = DM.dsOrdemServico
      MaxLength = 15
      ParentCtl3D = False
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtManutencao: TDBEdit
      Left = 127
      Top = 30
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'MANUTENCAO'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnManutencao: TButton
      Left = 318
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
      TabOrder = 4
      OnClick = BtnManutencaoClick
    end
    object EdtMotivo: TDBEdit
      Left = 433
      Top = 30
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'MOTIVOPARADA'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnMotivo: TButton
      Left = 626
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
      TabOrder = 6
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
      TabOrder = 7
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnFalha: TButton
      Left = 961
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
      TabOrder = 8
      OnClick = BtnFalhaClick
    end
    object EdtCentroCusto: TDBEdit
      Left = 127
      Top = 62
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnCentroCusto: TButton
      Left = 318
      Top = 60
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BtnCentroCustoClick
    end
    object EdtSolicitado: TDBEdit
      Left = 433
      Top = 62
      Width = 189
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'SOLICITANTE'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 11
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnSolicitado: TButton
      Left = 626
      Top = 60
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = BtnSolicitadoClick
    end
    object EdtOficina: TDBEdit
      Left = 766
      Top = 62
      Width = 192
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'OFICINA'
      DataSource = DM.dsOrdemServico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 13
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnOficina: TButton
      Left = 961
      Top = 60
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = BtnOficinaClick
    end
  end
  inherited PDiversos: TPanel
    Top = 373
    Width = 1008
    Height = 172
    ExplicitTop = 373
    ExplicitWidth = 1004
    ExplicitHeight = 169
    inherited Label3: TLabel
      Width = 199
      Caption = 'SERVI'#199'OS EXECUTADOS'
      ExplicitWidth = 199
    end
    object GrdServicosExec: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 26
      Width = 998
      Height = 141
      Hint = 'D'#234' duplo-clique para excluir o registro.'
      Margins.Left = 4
      Margins.Top = 25
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      DataSource = DM.dsOrdemServicoServExec
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdServicosExecDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyDown = GrdServicosExecKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'PARTE'
          Title.Caption = 'Parte'
          Width = 233
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM'
          Title.Caption = 'Item'
          Width = 279
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Servi'#231'o'
          Width = 334
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
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TEMPOEXECUCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Width = 63
          Visible = True
        end>
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
    ExplicitTop = 586
    ExplicitWidth = 1008
  end
  inherited PBase: TPanel
    Top = 549
    Width = 1008
    ExplicitTop = 546
    ExplicitWidth = 1004
    inherited Button1: TButton
      Hint = 'Fechamento da M'#227'o de Obra da O.S.'
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
      ImageIndex = 37
      OnClick = Button3Click
    end
    inherited Button4: TButton
      Hint = 'Inspe'#231#227'o da O.S.'
      ImageIndex = 116
      OnClick = Button4Click
    end
  end
  inherited TimerAlertas: TTimer
    Left = 418
    Top = 22
  end
  inherited PopupMenuRelat: TPopupMenu
    Top = 22
    inherited Completo1: TMenuItem
      Visible = False
    end
  end
  inherited ActionList1: TActionList
    Top = 3
  end
  object PopupMenuPecas: TPopupMenu
    Left = 630
    Top = 418
    object PecasdeReposicao1: TMenuItem
      Caption = 'Pe'#231'as de Reposi'#231#227'o'
      OnClick = PecasdeReposicao1Click
    end
    object Lubrificantes1: TMenuItem
      Caption = 'Lubrificantes'
      OnClick = Lubrificantes1Click
    end
  end
end

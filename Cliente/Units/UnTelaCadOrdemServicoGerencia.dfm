inherited FrmTelaCadOrdemServicoGerencia: TFrmTelaCadOrdemServicoGerencia
  Caption = 'Ordens de Servi'#231'o'
  ClientHeight = 642
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1002
    object Label9: TLabel [1]
      Left = 679
      Top = 22
      Width = 54
      Height = 13
      Caption = 'Cadastro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel [2]
      Left = 127
      Top = 35
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cadastro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 294
      Top = 35
      Width = 7
      Height = 16
      Caption = 'a'
    end
    inherited BtnAjuda: TButton
      Left = 965
      ExplicitLeft = 959
    end
    object CBPeriodo: TComboBox
      Left = 738
      Top = 19
      Width = 129
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 8
      TabOrder = 1
      TabStop = False
      Text = #218'ltimos 18 meses'
      Visible = False
      OnChange = RGConsSimplesClick
      Items.Strings = (
        'Hoje'
        #218'ltima semana'
        #218'ltima quinzena'
        #218'ltimo m'#234's'
        #218'ltimos 60 dias'
        #218'ltimos 90 dias'
        #218'ltimos 6 meses'
        #218'ltimos 9 meses'
        #218'ltimos 18 meses')
    end
    object EdtData1: TJvDateTimePicker
      Left = 185
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 2
      DropDownDate = 44778.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 306
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 3
      DropDownDate = 44771.000000000000000000
    end
    object BtnConsultar: TButton
      Left = 413
      Top = 27
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnConsultarClick
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 503
    ExplicitWidth = 1000
    ExplicitHeight = 494
    inherited RGTelas: TRadioGroup
      Top = 0
      Height = 0
      Align = alNone
      TabOrder = 4
      ExplicitTop = 0
      ExplicitHeight = 0
    end
    object PFuncoes: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 39
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 992
      object BtnCadastro: TButton
        Left = 6
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Cadastrar O.S. (Ctrl + Alt + O)'
        Caption = 'Cadastrar'
        DisabledImageIndex = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        ImageMargins.Left = 6
        ImageMargins.Right = -6
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BtnCadastroClick
      end
      object BtnProgramacao: TButton
        Left = 121
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Programar O.S. (Ctrl + Alt + P)'
        Caption = 'Programar'
        DisabledImageIndex = 59
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 58
        ImageMargins.Left = 4
        ImageMargins.Top = 1
        ImageMargins.Right = 2
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BtnProgramacaoClick
      end
      object BtnExecucao: TButton
        Left = 237
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Executar O.S. (Ctrl + Alt + E)'
        Caption = 'Executar'
        DisabledImageIndex = 61
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 60
        ImageMargins.Left = 6
        ImageMargins.Top = 1
        ImageMargins.Right = -6
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BtnExecucaoClick
      end
      object BtnLiberacao: TButton
        Left = 352
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Liberar O.S. (Ctrl + Alt + L)'
        Caption = 'Liberar'
        DisabledImageIndex = 63
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 62
        ImageMargins.Left = 6
        ImageMargins.Top = 1
        ImageMargins.Right = -6
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnLiberacaoClick
      end
      object BtnFechamento: TButton
        Left = 468
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Fechar O.S. (Ctrl + Alt + F)'
        Caption = 'Fechar'
        DisabledImageIndex = 65
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 64
        ImageMargins.Left = 6
        ImageMargins.Top = 1
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BtnFechamentoClick
      end
      object BtnParalisacao: TButton
        Left = 583
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Paralisar O.S. (Ctrl + Alt + R)'
        Caption = 'Paralisar'
        DisabledImageIndex = 67
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 66
        ImageMargins.Left = 4
        ImageMargins.Top = 1
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BtnParalisacaoClick
      end
      object BtnImpressao: TButton
        Left = 699
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Imprimir O.S. (Ctrl + Alt + I)'
        Caption = 'Imprimir'
        DisabledImageIndex = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 15
        ImageMargins.Left = 4
        ImageMargins.Right = 2
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = BtnImpressaoClick
      end
      object BtnCancelamento: TButton
        Left = 815
        Top = 7
        Width = 110
        Height = 25
        Hint = 'Cancelar O.S. (Ctrl + Alt + C)'
        Caption = 'Cancelar'
        DisabledImageIndex = 7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 6
        ImageMargins.Left = 8
        ImageMargins.Top = 1
        ImageMargins.Right = -4
        Images = DM.ImageListBotoes
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = BtnCancelamentoClick
      end
      object BtnHistorico: TButton
        Left = 959
        Top = 5
        Width = 29
        Height = 29
        Hint = 'Hist'#243'rico (Ctrl + Alt + H)'
        DisabledImageIndex = 59
        ImageIndex = 58
        ImageMargins.Left = 4
        ImageMargins.Top = 1
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = BtnHistoricoClick
      end
      object btnMObra: TButton
        Left = 928
        Top = 5
        Width = 29
        Height = 29
        Hint = 'Localizar M'#227'o de Obra (Ctrl + Alt + M)'
        DisabledImageIndex = 27
        ImageIndex = 27
        ImageMargins.Left = 4
        ImageMargins.Top = 1
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btnMObraClick
      end
    end
    object GrdOrdemServico: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 134
      Width = 998
      Height = 365
      Hint = 'D'#234' duplo-clique para visualizar as informa'#231#245'es da O.S.'
      Align = alClient
      DataSource = DM.dsOrdemServicoGerencia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = GrdOrdemServicoDrawColumnCell
      OnDblClick = GrdOrdemServicoDblClick
      OnKeyDown = GrdOrdemServicoKeyDown
      OnKeyPress = GrdOrdemServicoKeyPress
    end
    object PFiltros: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 45
      Width = 998
      Height = 27
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 992
      object chkNProg: TCheckBox
        Left = 6
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Cadastradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = chkNProgClick
      end
      object chkProg: TCheckBox
        Left = 210
        Top = 5
        Width = 100
        Height = 18
        Caption = 'Programadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = chkNProgClick
      end
      object chkExec: TCheckBox
        Left = 320
        Top = 5
        Width = 99
        Height = 18
        Caption = 'Em Execu'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkNProgClick
      end
      object chkLib: TCheckBox
        Left = 429
        Top = 5
        Width = 80
        Height = 18
        Caption = 'Liberadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = chkNProgClick
      end
      object chkFec: TCheckBox
        Left = 519
        Top = 5
        Width = 79
        Height = 18
        Caption = 'Fechadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = chkNProgClick
      end
      object chkPar: TCheckBox
        Left = 608
        Top = 5
        Width = 91
        Height = 18
        Caption = 'Paralisadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = chkNProgClick
      end
      object chkSolic: TCheckBox
        Left = 709
        Top = 5
        Width = 112
        Height = 18
        Caption = 'Solic. Trabalho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = chkNProgClick
      end
      object chkRot: TCheckBox
        Left = 831
        Top = 5
        Width = 60
        Height = 18
        Caption = 'Rotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = chkNProgClick
      end
      object chbCanc: TCheckBox
        Left = 901
        Top = 5
        Width = 89
        Height = 17
        Caption = 'Canceladas'
        TabOrder = 9
        OnClick = chkNProgClick
      end
      object chkDetalhad: TCheckBox
        Left = 111
        Top = 5
        Width = 89
        Height = 18
        Caption = 'Detalhadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = chkNProgClick
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 74
      Width = 998
      Height = 57
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitWidth = 992
      object Label6: TLabel
        Left = 6
        Top = 5
        Width = 142
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fam'#237'lia de Equipamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 260
        Top = 5
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'Oficina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 515
        Top = 5
        Width = 74
        Height = 16
        Alignment = taRightJustify
        Caption = 'Manuten'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 769
        Top = 5
        Width = 63
        Height = 16
        Alignment = taRightJustify
        Caption = 'Prioridade:'
      end
      object BtnFamiliaEquip: TButton
        Left = 217
        Top = 22
        Width = 28
        Height = 29
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BtnFamiliaEquipClick
      end
      object BtnOficina: TButton
        Left = 471
        Top = 22
        Width = 28
        Height = 29
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnOficinaClick
      end
      object edtOficina: TEdit
        Left = 260
        Top = 24
        Width = 205
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        OnDblClick = EdtOficinaDblClick
      end
      object EdtFamiliaEquip: TEdit
        Left = 7
        Top = 24
        Width = 205
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        OnDblClick = EdtFamiliaEquipDblClick
      end
      object edtManutencao: TEdit
        Left = 515
        Top = 24
        Width = 205
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        OnDblClick = edtManutencaoDblClick
      end
      object BtnManutencao: TButton
        Left = 726
        Top = 22
        Width = 28
        Height = 29
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BtnManutencaoClick
      end
      object CBPrioridade: TComboBox
        Left = 769
        Top = 24
        Width = 137
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 6
        OnChange = CBPrioridadeChange
        Items.Strings = (
          ''
          'Emerg'#234'ncia'
          'At'#233' 12 hs'
          'At'#233' 72 hs'
          'At'#233' 1 Semana'
          'At'#233' 1 M'#234's'
          'Acima de um m'#234's')
      end
      object chkParado: TCheckBox
        Left = 922
        Top = 26
        Width = 62
        Height = 17
        Caption = 'Parado'
        TabOrder = 7
        OnClick = chkNProgClick
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 575
    Width = 1008
    ExplicitTop = 566
    ExplicitWidth = 1002
    object Label2: TLabel
      Left = 919
      Top = 4
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Atualiza'#231#227'o...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited PBotoes: TPanel
    Top = 602
    Width = 1008
    ExplicitTop = 593
    ExplicitWidth = 1002
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
  object PopupMenuLiberar: TPopupMenu
    Left = 397
    Top = 65533
    object Total: TMenuItem
      Caption = 'Libera'#231#227'o total'
      OnClick = TotalClick
    end
    object Parcial: TMenuItem
      Caption = 'Entrada/Sa'#237'da  de m'#227'o de obra'
      OnClick = ParcialClick
    end
  end
  object PopupMenuRelat: TPopupMenu
    Left = 756
    Top = 16
    object Ficha1: TMenuItem
      Caption = 'Ficha'
      OnClick = Ficha1Click
    end
    object Lista1: TMenuItem
      Caption = 'Lista'
      object Simples1: TMenuItem
        Caption = 'Simples'
        OnClick = Simples1Click
      end
      object Completa1: TMenuItem
        Caption = 'Completa'
        OnClick = Completa1Click
      end
      object MaodeObra1: TMenuItem
        Caption = 'M'#227'o de Obra'
        OnClick = MaodeObra1Click
      end
      object Inspecoes1: TMenuItem
        Caption = 'Inspe'#231#245'es'
        OnClick = Inspecoes1Click
      end
    end
    object Checklist1: TMenuItem
      Caption = 'Checklist'
      OnClick = Checklist1Click
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 914
    Top = 18
  end
  object PopupMenuExecutar: TPopupMenu
    Left = 301
    Top = 65533
    object MenuItem1: TMenuItem
      Caption = 'Executar'
      OnClick = TotalClick
    end
    object MenuItem2: TMenuItem
      Caption = 'Entrada/Sa'#237'da  de m'#227'o de obra'
      OnClick = ParcialClick
    end
  end
end

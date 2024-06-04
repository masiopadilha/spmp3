inherited FrmTelaCadOrdemServicoGerencia: TFrmTelaCadOrdemServicoGerencia
  Caption = 'Ordens de Servi'#231'o'
  ClientHeight = 644
  ClientWidth = 1012
  Constraints.MaxHeight = 720
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
    ExplicitWidth = 1004
    DesignSize = (
      1008
      60)
    inherited Image1: TImage
      Left = 2
      Top = 2
      ExplicitLeft = 2
      ExplicitTop = 2
    end
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
      Left = 966
      ExplicitLeft = 962
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
    Left = 2
    Top = 66
    Width = 1008
    Height = 507
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ExplicitLeft = 2
    ExplicitTop = 66
    ExplicitWidth = 1004
    ExplicitHeight = 504
    inherited RGTelas: TRadioGroup
      Top = 0
      Height = 0
      Align = alNone
      TabOrder = 3
      ExplicitTop = 0
      ExplicitWidth = 500
      ExplicitHeight = 0
    end
    object PFuncoes: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1000
      Height = 37
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 996
      object BtnCadastro: TButton
        Left = 7
        Top = 7
        Width = 110
        Height = 23
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
        Left = 122
        Top = 7
        Width = 110
        Height = 23
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
        Height = 23
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
        Height = 23
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
        Left = 467
        Top = 7
        Width = 110
        Height = 23
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
        Left = 582
        Top = 7
        Width = 110
        Height = 23
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
        Left = 697
        Top = 7
        Width = 110
        Height = 23
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
        Left = 812
        Top = 7
        Width = 110
        Height = 23
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
        Left = 961
        Top = 5
        Width = 29
        Height = 27
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
        Left = 927
        Top = 5
        Width = 29
        Height = 27
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
    object PFiltros: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 43
      Width = 1000
      Height = 27
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 996
      object chkNProg: TCheckBox
        Left = 8
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Cadastradas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = chkNProgClick
      end
      object chkProg: TCheckBox
        Left = 233
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Programadas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = chkNProgClick
      end
      object chkExec: TCheckBox
        Left = 346
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Em Execu'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkNProgClick
      end
      object chkLib: TCheckBox
        Left = 459
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Liberadas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = chkNProgClick
      end
      object chkFec: TCheckBox
        Left = 571
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Fechadas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = chkNProgClick
      end
      object chkPar: TCheckBox
        Left = 684
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Paralisadas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = chkNProgClick
      end
      object chbCanc: TCheckBox
        Left = 797
        Top = 5
        Width = 95
        Height = 17
        Caption = 'Canceladas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = chkNProgClick
      end
      object chkDetalhad: TCheckBox
        Left = 120
        Top = 5
        Width = 95
        Height = 18
        Caption = 'Detalhadas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = chkNProgClick
      end
      object chbVenc: TCheckBox
        Left = 910
        Top = 5
        Width = 95
        Height = 17
        Caption = 'Vencidas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = chkNProgClick
      end
    end
    object PFiltros2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 72
      Width = 1000
      Height = 39
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitWidth = 996
      object Label6: TLabel
        Left = 7
        Top = 11
        Width = 116
        Height = 13
        Caption = 'Fam'#237'lia de Equipamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 390
        Top = 11
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Oficina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 690
        Top = 10
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Solicitante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BtnFamiliaEquip: TButton
        Left = 343
        Top = 7
        Width = 25
        Height = 25
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
        Left = 647
        Top = 7
        Width = 25
        Height = 25
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
        Left = 432
        Top = 9
        Width = 210
        Height = 21
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        StyleElements = [seFont, seClient]
        OnDblClick = EdtOficinaDblClick
      end
      object EdtFamiliaEquip: TEdit
        Left = 128
        Top = 9
        Width = 210
        Height = 21
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        StyleElements = [seFont, seClient]
        OnDblClick = EdtFamiliaEquipDblClick
      end
      object edtSolicitante: TEdit
        Left = 748
        Top = 8
        Width = 210
        Height = 21
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        StyleElements = [seFont, seClient]
        OnDblClick = edtSolicitanteDblClick
      end
      object BtnSolicitante: TButton
        Left = 963
        Top = 7
        Width = 25
        Height = 25
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BtnSolicitanteClick
      end
    end
    object grid: TJvStringGrid
      Left = 886
      Top = 482
      Width = 116
      Height = 73
      FixedRows = 0
      TabOrder = 4
      Visible = False
      Alignment = taLeftJustify
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -12
      FixedFont.Name = 'Segoe UI'
      FixedFont.Style = []
      RowHeights = (
        24
        21
        24
        24
        24)
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 487
      Width = 1006
      Height = 19
      Panels = <
        item
          Width = 60
        end
        item
          Width = 110
        end
        item
          Width = 297
        end
        item
          Width = 430
        end
        item
          Width = 50
        end>
      OnResize = StatusBar1Resize
      ExplicitTop = 484
      ExplicitWidth = 1002
    end
    object Panel10: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 113
      Width = 1000
      Height = 374
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 6
      ExplicitWidth = 996
      ExplicitHeight = 371
      object Label18: TLabel
        Left = 873
        Top = 88
        Width = 57
        Height = 14
        Caption = 'Prioridade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 873
        Top = 137
        Width = 117
        Height = 14
        Caption = 'Tipo de Manuten'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 890
        Top = 197
        Width = 57
        Height = 14
        Caption = 'Preventiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 890
        Top = 216
        Width = 48
        Height = 14
        Caption = 'Corretiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 890
        Top = 235
        Width = 46
        Height = 14
        Caption = 'Preditiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 890
        Top = 254
        Width = 63
        Height = 14
        Caption = 'Lubrifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 890
        Top = 273
        Width = 82
        Height = 14
        Caption = 'Novos Projetos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 890
        Top = 292
        Width = 57
        Height = 14
        Caption = 'Altera'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 890
        Top = 311
        Width = 57
        Height = 14
        Caption = 'Aut'#244'noma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 890
        Top = 330
        Width = 37
        Height = 14
        Caption = 'Outros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 890
        Top = 350
        Width = 54
        Height = 14
        Caption = 'Indefinido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid: TJvDBGrid
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 866
        Height = 370
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 130
        Margins.Bottom = 0
        Align = alClient
        DataSource = DM.dsOrdemServicoGerencia
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        PopupMenu = PopupMenuOS
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGridDrawColumnCell
        OnDblClick = DBGridDblClick
        OnKeyDown = DBGridKeyDown
        OnKeyPress = DBGridKeyPress
        OnTitleClick = DBGridTitleClick
        TitleButtons = True
        OnGetBtnParams = DBGridGetBtnParams
        BevelInner = bvNone
        BevelOuter = bvNone
        AlternateRowColor = 15727296
        SortedField = 'CODIGO'
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = 'Selecione as colunas'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'Pelo menos uma coluna deve estar vis'#237'vel'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 19
        Columns = <
          item
            Expanded = False
            FieldName = 'ORIGEM'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 8
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'OS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 53
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODEQUIPAMENTO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Equip.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EQUIPAMENTO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'Equipamento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EQUIPPARADO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = [fsBold]
            Width = 247
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATACADASTRO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Cadastro'
            Width = 96
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SITUACAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Situa'#231#227'o'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OFICINA'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Title.Caption = 'Oficina'
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOMANUTENCAO'
            Title.Caption = 'Manuten'#231#227'o'
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TEMPOHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = 'HH'
            Width = 63
            Visible = True
          end>
      end
      object chkRot: TCheckBox
        Left = 875
        Top = 34
        Width = 56
        Height = 18
        Hint = 'Somente as rotas'
        Caption = 'Rotas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = chkNProgClick
      end
      object chkParado: TCheckBox
        Left = 875
        Top = 55
        Width = 60
        Height = 18
        Hint = 'Somente equipamentos parados'
        Caption = 'Parado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkNProgClick
      end
      object CBPrioridade: TComboBox
        Left = 873
        Top = 105
        Width = 120
        Height = 22
        Style = csOwnerDrawFixed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        StyleElements = [seFont, seClient]
        OnChange = CBPrioridadeChange
        Items.Strings = (
          ''
          'Emerg'#234'ncia'
          'At'#233' 12 hs'
          'At'#233' 72 hs'
          'At'#233' 1 Semana'
          'At'#233' 1 M'#234's'
          'Acima de 1 m'#234's')
      end
      object CBTipoManutencao: TComboBox
        Left = 873
        Top = 154
        Width = 120
        Height = 22
        Style = csOwnerDrawFixed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 5
        Text = 'Todas'
        StyleElements = [seFont, seClient]
        OnChange = CBPrioridadeChange
        Items.Strings = (
          'Todas'
          'Aut'#244'noma'
          'Corretiva'
          'Preventiva'
          'Preditiva'
          'Lubrifica'#231#227'o'
          'Novos Projetos'
          'Altera'#231#245'es'
          'Outras')
      end
      object Panel2: TPanel
        Left = 875
        Top = 198
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = clBlue
        ParentBackground = False
        TabOrder = 6
        StyleElements = []
      end
      object Panel1: TPanel
        Left = 875
        Top = 217
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = clRed
        ParentBackground = False
        TabOrder = 7
        StyleElements = []
      end
      object Panel3: TPanel
        Left = 875
        Top = 236
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = 49151
        ParentBackground = False
        TabOrder = 8
        StyleElements = []
      end
      object Panel4: TPanel
        Left = 875
        Top = 255
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = 697632
        ParentBackground = False
        TabOrder = 9
        StyleElements = []
      end
      object Panel5: TPanel
        Left = 875
        Top = 274
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = 721026
        ParentBackground = False
        TabOrder = 10
        StyleElements = []
      end
      object Panel6: TPanel
        Left = 875
        Top = 293
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = 9262534
        ParentBackground = False
        TabOrder = 11
        StyleElements = []
      end
      object Panel7: TPanel
        Left = 875
        Top = 312
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = 13290186
        ParentBackground = False
        TabOrder = 12
        StyleElements = []
      end
      object Panel8: TPanel
        Left = 875
        Top = 331
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = 8026746
        ParentBackground = False
        TabOrder = 13
        StyleElements = []
      end
      object Panel9: TPanel
        Left = 875
        Top = 351
        Width = 11
        Height = 13
        BevelOuter = bvNone
        Color = 9694960
        ParentBackground = False
        TabOrder = 14
        StyleElements = []
      end
      object chkSolic: TCheckBox
        Left = 875
        Top = 13
        Width = 89
        Height = 18
        Hint = 'Somente as solicita'#231#245'es'
        Caption = 'Solicita'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = chkNProgClick
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 577
    Width = 1008
    ExplicitTop = 574
    ExplicitWidth = 1004
  end
  inherited PBotoes: TPanel
    Top = 604
    Width = 1008
    ExplicitTop = 601
    ExplicitWidth = 1004
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 467
      ExplicitLeft = 467
    end
  end
  object PopupMenuLiberar: TPopupMenu
    Left = 405
    Top = 5
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
    Left = 684
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
      object Exportar1: TMenuItem
        Caption = 'Exportar Excel (.csv)'
        OnClick = Exportar1Click
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
    Left = 285
    Top = 5
    object MenuItem1: TMenuItem
      Caption = 'Executar'
      OnClick = TotalClick
    end
    object MenuItem2: TMenuItem
      Caption = 'Entrada/Sa'#237'da  de m'#227'o de obra'
      OnClick = ParcialClick
    end
  end
  object DSOSSimplesExcel: TDataSource
    DataSet = FDMemTOSSimplesExcel
    Left = 755
    Top = 347
  end
  object FDMemTOSSimplesExcel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 675
    Top = 347
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 675
    Top = 411
    object IntegerField2: TIntegerField
      DisplayLabel = 'O.S.'
      FieldName = 'CODIGO'
      DisplayFormat = '#000000'
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object DateTimeField7: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cad.'
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy t'
    end
    object DateTimeField8: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Plan.'
      FieldName = 'PLANEJADA'
      Origin = 'PLANEJADA'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy'
    end
    object DateTimeField9: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Prog.'
      FieldName = 'DATAPROGINI'
      Origin = 'DATAPROGINI'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object DateTimeField10: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'In'#237'cio'
      FieldName = 'DATAINICIOREAL'
      Origin = 'DATAINICIOREAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy t'
    end
    object DateTimeField11: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fim'
      FieldName = 'DATAFIMREAL'
      Origin = 'DATAFIMREAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy t'
    end
    object DateTimeField12: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Fecham.'
      FieldName = 'DATAFECHAMENTO'
      Origin = 'DATAFECHAMENTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField10: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Equip.'
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODEQUIPAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object StringField11: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Centro/Custo'
      FieldName = 'CENTROCUSTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object BCDField3: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Prv. (hs)'
      FieldName = 'TEMPOPREVISTO'
      Origin = 'TEMPOPREVISTO'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 10
      Size = 2
    end
    object BCDField4: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Exc. (hs)'
      FieldName = 'TEMPOEXECUTADO'
      Origin = 'TEMPOEXECUTADO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 16
      Size = 2
    end
    object StringField12: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object StringField13: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tipo'
      FieldName = 'TIPOMANUTENCAO'
      Origin = 'TIPOMANUTENCAO'
      ProviderFlags = []
      Size = 40
    end
    object StringField14: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Oficina'
      FieldName = 'OFICINA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object StringField15: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Prioridade'
      FieldName = 'PRIORIDADEPARADA'
      Origin = 'PRIORIDADEPARADA'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object StringField16: TStringField
      DisplayLabel = 'Op.'
      FieldName = 'OPERACAO'
      Size = 2
    end
  end
  object PopupMenuOS: TPopupMenu
    Left = 675
    Top = 275
    object Vencida1: TMenuItem
      Caption = 'Definir ordem de servi'#231'o como vencida'
      OnClick = Vencida1Click
    end
    object DesafazerVencida1: TMenuItem
      Caption = 'Definir ordem de servi'#231'o como n'#227'o vencida'
      OnClick = DesafazerVencida1Click
    end
  end
  object ImageList1: TImageList
    Left = 495
    Top = 287
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      940084848400747474006C6C6C006C6C6C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400747474006C6C6C0064646400646464007C7C7C008C8C8C00000000000000
      000000000000000000000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C8C
      54003C5C24002424240024341C00646464006C6C6C007C7C7C008C8C8C000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006CD4
      04006CD40400448404001C3C0400747C74006C6C6C0074747400848484009494
      94000000000000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084FC
      0C0084FC14006CDC04002C5C040044543C006C6C6C006C6C6C007C7C7C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4C4A4007CFC040084FC
      140084FC140084FC14006CD404002C5C0400747474006C6C6C006C6C6C007474
      7400848484000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094D45C0084FC0C0094FC
      240094FC24008CFC240084FC0C00449404008C948C00747474006C6C6C006C6C
      6C00747474000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000006F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCC4B400ACFC64009CFC44009CF4
      4C00BCCCB400BCF48400A4FC4C0084FC14001C3C04007C7C7C007C7C7C007474
      74006C6C6C007C7C7C008C8C8C00000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000006F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400A4FC4C00BCC4
      B40000000000BCCCAC00B4FC6C009CFC3C004484040024341C008C8C8C007C7C
      7C00747474007474740084848400949494000000000000000000000000000000
      00000006F6000006F6000005B70000000000000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4F4740084FC140054AC04001C3C04006C6C
      6C008C8C8C007C7C7C00848484008C8C8C000000000000000000000000000006
      F6000006F6000006F6000006F60000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BCCCAC009CFC440084FC1400449404001C34
      04008C948C008C8C8C008C8C8C009494940000000000000000000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCFC7C00A4FC4C0084FC14004494
      04001C340400000000000000000000000000000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400C4FC8C00B4FC
      6C008CFC1C0054743C000000000000000000000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCC4B400C4F4
      9400B4FC6C0074F40400B4C4A40000000000000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BCCCAC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F8FFFFFF00000000E07FFFF900000000
      E03F9FF900000000E01F87E700000000E00FC7C700000000E00FF11F00000000
      8007F81F000000008007FC7F000000000001F83F000000008800F19F00000000
      FE00E18F00000000FE00C7E700000000FF0787FF00000000FF839FFF00000000
      FFC19FFF00000000FFFBFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end

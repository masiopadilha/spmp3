inherited FrmTelaInspConsulta: TFrmTelaInspConsulta
  Caption = 'Consulta de Inspe'#231#245'es'
  ClientHeight = 633
  ClientWidth = 1006
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnShow = FormShow
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1002
    ExplicitWidth = 1004
    object Label9: TLabel [1]
      Left = 133
      Top = 36
      Width = 54
      Height = 16
      Caption = 'Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited BtnAjuda: TButton
      Left = 971
      ExplicitLeft = 967
    end
    object BtnImprimir: TButton
      Left = 939
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnImprimirClick
    end
    object CBPeriodo: TComboBox
      Left = 193
      Top = 33
      Width = 125
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 2
      Text = 'Vencidas'
      OnChange = CBPeriodoChange
      Items.Strings = (
        'Vencidas'
        'Pr'#243'ximos 7 dias'
        'Pr'#243'ximos 15 dias'
        'Pr'#243'ximos 30 dias'
        'Pr'#243'ximos 60 dias'
        'Pr'#243'ximos 90 dias'
        'Pr'#243'ximos 180 dias'
        'Pr'#243'ximos 365 dias')
    end
  end
  inherited PCentro: TPanel
    Width = 1000
    Height = 494
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Top = 3
      Height = 136
      Align = alNone
      Columns = 2
      ExplicitTop = 3
      ExplicitWidth = 500
      ExplicitHeight = 136
    end
    object PCInspecoes: TPageControl
      AlignWithMargins = True
      Left = 2
      Top = 74
      Width = 1002
      Height = 429
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      ActivePage = TSManut
      Align = alClient
      TabOrder = 1
      OnChange = PCInspecoesChange
      ExplicitWidth = 998
      ExplicitHeight = 426
      object TSManut: TTabSheet
        Caption = 'Manutenc'#245'es'
        object PFundoManut: TPanel
          Left = 0
          Top = 0
          Width = 994
          Height = 398
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Color = 14671839
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          ExplicitWidth = 990
          ExplicitHeight = 395
          object Label1: TLabel
            Left = 12
            Top = 359
            Width = 32
            Height = 16
            Alignment = taRightJustify
            Caption = #193'rea:'
          end
          object LblAreaManut: TDBText
            Left = 46
            Top = 359
            Width = 79
            Height = 13
            AutoSize = True
            DataField = 'AREA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 290
            Top = 373
            Width = 46
            Height = 16
            Alignment = taRightJustify
            Caption = 'Fam'#237'lia:'
          end
          object LblFamiliaManut: TDBText
            Left = 338
            Top = 373
            Width = 92
            Height = 13
            AutoSize = True
            DataField = 'FAMILIAEQUIP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 296
            Top = 359
            Width = 40
            Height = 16
            Alignment = taRightJustify
            Caption = 'C'#233'lula:'
          end
          object LblCelulaManut: TDBText
            Left = 338
            Top = 359
            Width = 86
            Height = 13
            AutoSize = True
            DataField = 'CELULA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 9
            Top = 373
            Width = 35
            Height = 16
            Alignment = taRightJustify
            Caption = 'Linha:'
          end
          object LblLinhaManut: TDBText
            Left = 46
            Top = 373
            Width = 82
            Height = 13
            AutoSize = True
            DataField = 'LINHA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GrdManut: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 988
            Height = 392
            Align = alClient
            DataSource = DM.dsManutCons
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdManutDrawColumnCell
            OnKeyPress = GrdManutKeyPress
            OnTitleClick = GrdManutTitleClick
          end
        end
      end
      object TSLubrific: TTabSheet
        Caption = 'Lubrifica'#231#245'es'
        ImageIndex = 1
        object PFundoLubrific: TPanel
          Left = 0
          Top = 0
          Width = 994
          Height = 398
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Color = 14671839
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          object Label5: TLabel
            Left = 12
            Top = 359
            Width = 32
            Height = 16
            Alignment = taRightJustify
            Caption = #193'rea:'
          end
          object LblAreaLubrific: TDBText
            Left = 46
            Top = 359
            Width = 84
            Height = 13
            AutoSize = True
            DataField = 'AREA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 290
            Top = 373
            Width = 46
            Height = 16
            Alignment = taRightJustify
            Caption = 'Fam'#237'lia:'
          end
          object LblFamiliaLubrific: TDBText
            Left = 338
            Top = 373
            Width = 97
            Height = 13
            AutoSize = True
            DataField = 'FAMILIAEQUIP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 296
            Top = 359
            Width = 40
            Height = 16
            Alignment = taRightJustify
            Caption = 'C'#233'lula:'
          end
          object LblCelulaLubrific: TDBText
            Left = 338
            Top = 359
            Width = 91
            Height = 13
            AutoSize = True
            DataField = 'CELULA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 9
            Top = 373
            Width = 35
            Height = 16
            Alignment = taRightJustify
            Caption = 'Linha:'
          end
          object LblLinhaLubrific: TDBText
            Left = 46
            Top = 373
            Width = 87
            Height = 13
            AutoSize = True
            DataField = 'LINHA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GrdLubrific: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 988
            Height = 392
            Align = alClient
            DataSource = DM.dsLubrificCons
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdManutDrawColumnCell
            OnKeyPress = GrdLubrificKeyPress
          end
        end
      end
      object TSRotas: TTabSheet
        Caption = 'Rotas'
        ImageIndex = 2
        object PFundoRota: TPanel
          Left = 0
          Top = 0
          Width = 994
          Height = 398
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Color = 14671839
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          object GrdRota: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 538
            Height = 392
            Align = alLeft
            DataSource = DM.dsRotaCons
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdManutDrawColumnCell
          end
          object Panel2: TPanel
            Left = 544
            Top = 0
            Width = 450
            Height = 398
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGrid1: TDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 444
              Height = 240
              Align = alTop
              Color = clBtnFace
              DataSource = DM.dsRotaConsSeq
              DrawingStyle = gdsClassic
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              StyleElements = [seFont, seBorder]
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CODEQUIPATUAL'
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#243'd. Equip.'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EQUIPATUAL'
                  Title.Caption = 'Equipamento'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 283
                  Visible = True
                end>
            end
            object DBGrid2: TDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 249
              Width = 444
              Height = 449
              Align = alTop
              Color = clBtnFace
              DataSource = DM.dsRotaConsSeqManut
              DrawingStyle = gdsClassic
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              StyleElements = [seFont, seBorder]
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'CODIGO'
                  Title.Alignment = taCenter
                  Title.Caption = 'C'#243'digo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Title.Caption = 'Manuten'#231#227'o'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 172
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'DTAINICIO1'
                  Title.Alignment = taCenter
                  Title.Caption = 'Programada'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'FREQUENCIA1'
                  Title.Alignment = taCenter
                  Title.Caption = 'Dias'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 998
      Height = 70
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitWidth = 994
      object Label10: TLabel
        Left = 18
        Top = 12
        Width = 142
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fam'#237'lia de Equipamento:'
      end
      object Label13: TLabel
        Left = 293
        Top = 12
        Width = 32
        Height = 16
        Alignment = taRightJustify
        Caption = #193'rea:'
      end
      object Label11: TLabel
        Left = 838
        Top = 12
        Width = 65
        Height = 16
        Alignment = taRightJustify
        Caption = 'Criticidade:'
      end
      object Label12: TLabel
        Left = 566
        Top = 12
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
      object BtnFamiliaEquip: TButton
        Left = 242
        Top = 29
        Width = 28
        Height = 28
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
      object BtnArea: TButton
        Left = 515
        Top = 29
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
        OnClick = BtnAreaClick
      end
      object CBCriticidade: TComboBox
        Left = 838
        Top = 32
        Width = 152
        Height = 22
        Style = csOwnerDrawFixed
        Color = clBtnFace
        ItemIndex = 3
        TabOrder = 6
        Text = 'Todas'
        OnChange = CBCriticidadeChange
        Items.Strings = (
          'Para a F'#225'brica'
          'Para o Equipamento'
          'Para a '#193'rea'
          'Todas')
      end
      object edtArea: TEdit
        Left = 292
        Top = 31
        Width = 217
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        StyleElements = [seFont, seClient]
        OnDblClick = edtAreaDblClick
      end
      object EdtFamiliaEquip: TEdit
        Left = 18
        Top = 31
        Width = 217
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        StyleElements = [seFont, seClient]
        OnDblClick = EdtFamiliaEquipDblClick
      end
      object edtOficina: TEdit
        Left = 566
        Top = 31
        Width = 217
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        StyleElements = [seFont, seClient]
        OnDblClick = edtOficinaDblClick
      end
      object BtnOficina: TButton
        Left = 790
        Top = 29
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
        OnClick = BtnOficinaClick
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 566
    Width = 1002
    ExplicitTop = 574
    ExplicitWidth = 1004
    object chbTudo: TCheckBox
      AlignWithMargins = True
      Left = 899
      Top = 4
      Width = 105
      Height = 15
      Align = alRight
      Alignment = taLeftJustify
      Caption = 'Marcar todas'
      TabOrder = 0
      OnClick = chbTudoClick
      ExplicitLeft = 895
    end
  end
  inherited PBotoes: TPanel
    Top = 593
    Width = 1002
    ExplicitTop = 601
    ExplicitWidth = 1004
    inherited BtnOK: TButton
      Left = 425
      Caption = 'Executar'
      ModalResult = 0
      OnClick = BtnOKClick
      ExplicitLeft = 425
    end
    inherited BtnFechar: TButton
      Left = 508
      ExplicitLeft = 508
    end
  end
  object FDMemTManut: TFDMemTable
    OnCalcFields = FDMemTManutCalcFields
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'DTAINICIO1'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 857
    Top = 179
    object FDMemTManutCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 9
    end
    object FDMemTManutDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object FDMemTManutFREQUENCIA1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FREQUENCIA1'
      Origin = 'FREQUENCIA1'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTManutDTAINICIO1: TDateTimeField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'DTAINICIO1'
      Origin = 'DTAINICIO1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object FDMemTManutCODEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODEQUIPAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTManutEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 215
      FieldName = 'EQUIPAMENTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 200
    end
    object FDMemTManutCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 9
    end
    object FDMemTManutC_DIASATRASO: TIntegerField
      DisplayLabel = 'Dias'
      FieldKind = fkCalculated
      FieldName = 'C_DIASATRASO'
      Calculated = True
    end
    object FDMemTManutCODMANUTPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODMANUTPROGFAMEQUIP'
      Origin = 'CODMANUTPROGFAMEQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 9
    end
    object FDMemTManutCODMONITORAMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODMONITORAMENTO'
      Origin = 'CODMONITORAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object FDMemTManutCRITICIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CRITICIDADE'
      Origin = 'CRITICIDADE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 40
    end
    object FDMemTManutREPROGRAMAR1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPROGRAMAR1'
      Origin = 'REPROGRAMAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 15
    end
    object FDMemTManutFREQUENCIA2: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FREQUENCIA2'
      Origin = 'FREQUENCIA2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object FDMemTManutLEITURA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LEITURA'
      Origin = 'LEITURA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object FDMemTManutREPROGRAMAR2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPROGRAMAR2'
      Origin = 'REPROGRAMAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 15
    end
    object FDMemTManutRELATORIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RELATORIO'
      Origin = 'RELATORIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object FDMemTManutSEQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = []
      Visible = False
    end
    object FDMemTManutCODFAMILIAEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAMILIAEQUIP'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTManutDESCMANUTPROGFAMEQUIP: TStringField
      FieldName = 'DESCMANUTPROGFAMEQUIP'
      Size = 80
    end
    object FDMemTManutFAMILIAEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FAMILIAEQUIP'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTManutPROGRAMACAO2: TStringField
      FieldName = 'PROGRAMACAO2'
      Size = 80
    end
    object FDMemTManutCODAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODAREA'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTManutAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTManutCODCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCELULA'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTManutCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTManutCODLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLINHA'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTManutLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LINHA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTManutCODORDEMSERVICO: TIntegerField
      FieldName = 'CODORDEMSERVICO'
      DisplayFormat = '#000000'
    end
    object FDMemTManutPERIODO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PERIODO'
      Visible = False
      Calculated = True
    end
    object FDMemTManutC_PROXINSP: TDateTimeField
      FieldName = 'C_PROXINSP'
    end
  end
  object DSMemTManut: TDataSource
    DataSet = FDMemTManut
    Left = 857
    Top = 229
  end
  object DSMemTLubrific: TDataSource
    DataSet = FDMemTLubrific
    Left = 857
    Top = 333
  end
  object FDMemTRota: TFDMemTable
    OnCalcFields = FDMemTRotaCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 857
    Top = 387
    object FDMemTRotaCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 9
    end
    object FDMemTRotaCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      Required = True
      Size = 9
    end
    object FDMemTRotaDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTRotaDATAINICIO: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DATAINICIO'
      Origin = 'DATAINICIO'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTRotaREPROGRAMAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPROGRAMAR'
      Origin = 'REPROGRAMAR'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object FDMemTRotaFREQUENCIA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FREQUENCIA'
      Origin = 'FREQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTRotaRELATORIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RELATORIO'
      Origin = 'RELATORIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaPERIODO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PERIODO'
      Visible = False
      Calculated = True
    end
    object FDMemTRotaCODORDEMSERVICO: TIntegerField
      FieldName = 'CODORDEMSERVICO'
      DisplayFormat = '#000000'
    end
    object FDMemTRotaC_DIASATRASO: TIntegerField
      DisplayLabel = 'Dias'
      FieldKind = fkCalculated
      FieldName = 'C_DIASATRASO'
      Calculated = True
    end
    object FDMemTRotaC_PROXINSP: TDateTimeField
      FieldName = 'C_PROXINSP'
    end
  end
  object FDMemTManutItens: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODMANUTPROGFAMEQUIP'
    AggregatesActive = True
    MasterSource = DSMemTManut
    MasterFields = 'CODEMPRESA;CODMANUTPROGFAMEQUIP'
    DetailFields = 'CODEMPRESA;CODMANUTPROGFAMEQUIP'
    FetchOptions.AssignedValues = [evMode, evDetailCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.DetailCascade = True
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 876
    Top = 179
    object FDMemTManutItensCODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere]
    end
    object FDMemTManutItensCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      Required = True
      Size = 9
    end
    object FDMemTManutItensCODMANUTPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODMANUTPROGFAMEQUIP'
      Origin = 'CODMANUTPROGFAMEQUIP'
      Size = 9
    end
    object FDMemTManutItensCODPARTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPARTE'
      Origin = 'CODPARTE'
    end
    object FDMemTManutItensITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object FDMemTManutItensDESCINSPECAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCINSPECAO'
      Origin = 'DESCINSPECAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTManutItensEQUIPPARADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPPARADO'
      Origin = 'EQUIPPARADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensTEMPO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      ProviderFlags = [pfInUpdate]
      Precision = 10
      Size = 2
    end
    object FDMemTManutItensEXECAUTONOMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECAUTONOMO'
      Origin = 'EXECAUTONOMO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensPARTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARTE'
      Origin = 'PARTE'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTManutItensTotalHH: TAggregateField
      FieldName = 'TotalHH'
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TEMPO)'
    end
  end
  object DSMemTManutItens: TDataSource
    DataSet = FDMemTManutItens
    Left = 876
    Top = 229
  end
  object FDMemTLubrificItens: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODLUBRIFICPROGFAMEQUIP'
    AggregatesActive = True
    MasterSource = DSMemTLubrific
    MasterFields = 'CODEMPRESA;CODLUBRIFICPROGFAMEQUIP'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 876
    Top = 283
    object FDMemTLubrificItensCODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDMemTLubrificItensCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTLubrificItensCODLUBRIFICPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLUBRIFICPROGFAMEQUIP'
      Origin = 'CODLUBRIFICPROGFAMEQUIP'
      Size = 9
    end
    object FDMemTLubrificItensCODPARTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPARTE'
      Origin = 'CODPARTE'
    end
    object FDMemTLubrificItensITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      Size = 80
    end
    object FDMemTLubrificItensDESCINSPECAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCINSPECAO'
      Origin = 'DESCINSPECAO'
      Size = 200
    end
    object FDMemTLubrificItensEQUIPPARADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPPARADO'
      Origin = 'EQUIPPARADO'
      Size = 1
    end
    object FDMemTLubrificItensTEMPO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      Precision = 16
      Size = 2
    end
    object FDMemTLubrificItensEXECAUTONOMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECAUTONOMO'
      Origin = 'EXECAUTONOMO'
      Size = 1
    end
    object FDMemTLubrificItensPARTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARTE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTLubrificItensTotalHH: TAggregateField
      FieldName = 'TotalHH'
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TEMPO)'
    end
  end
  object DSMemTLubrificItens: TDataSource
    DataSet = FDMemTLubrificItens
    Left = 876
    Top = 333
  end
  object FDMemTManutItensEsp: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODMANUTPROGEQUIP'
    AggregatesActive = True
    MasterSource = DSMemTManut
    MasterFields = 'CODEMPRESA;CODIGO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 895
    Top = 179
    object FDMemTManutItensEspCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTManutItensEspCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTManutItensEspCODMANUTPROGEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODMANUTPROGEQUIP'
      Origin = 'CODMANUTPROGEQUIP'
      Size = 9
    end
    object FDMemTManutItensEspCODPARTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPARTE'
      Origin = 'CODPARTE'
    end
    object FDMemTManutItensEspITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object FDMemTManutItensEspDESCINSPECAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCINSPECAO'
      Origin = 'DESCINSPECAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTManutItensEspEQUIPPARADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPPARADO'
      Origin = 'EQUIPPARADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensEspTEMPO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object FDMemTManutItensEspEXECAUTONOMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECAUTONOMO'
      Origin = 'EXECAUTONOMO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensEspEXECUTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECUTADO'
      Origin = 'EXECUTADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensEspBOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOM'
      Origin = 'BOM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensEspREGULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REGULAR'
      Origin = 'REGULAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensEspRUIM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUIM'
      Origin = 'RUIM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTManutItensEspPARTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARTE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTManutItensEspTotalHH: TAggregateField
      FieldName = 'TotalHH'
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TEMPO)'
    end
  end
  object DSMemTManutItensEsp: TDataSource
    DataSet = FDMemTManutItensEsp
    Left = 895
    Top = 229
  end
  object FDMemTManutPlanoTrab: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODMANUTPROGFAMEQUIP'
    MasterSource = DSMemTManut
    MasterFields = 'CODEMPRESA;CODMANUTPROGFAMEQUIP'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 914
    Top = 179
    object FDMemTManutPlanoTrabCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTManutPlanoTrabCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTManutPlanoTrabCODMANUTPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODMANUTPROGFAMEQUIP'
      Origin = 'CODMANUTPROGFAMEQUIP'
      Size = 9
    end
    object FDMemTManutPlanoTrabCODPLANOTRABALHO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPLANOTRABALHO'
      Origin = 'CODPLANOTRABALHO'
      Size = 9
    end
    object FDMemTManutPlanoTrabPLANOTRABALHO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLANOTRABALHO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 200
    end
    object FDMemTManutPlanoTrabDETALHES: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'DETALHES'
      Origin = 'DETALHES'
      ProviderFlags = []
    end
  end
  object DSMemTManutPlanoTrab: TDataSource
    DataSet = FDMemTManutPlanoTrab
    Left = 914
    Top = 229
  end
  object FDMemTLubrificItensEsp: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODLUBRIFICPROGEQUIP'
    AggregatesActive = True
    MasterSource = DSMemTLubrific
    MasterFields = 'CODEMPRESA;CODIGO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 895
    Top = 283
    object FDMemTLubrificItensEspCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDMemTLubrificItensEspCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTLubrificItensEspCODLUBRIFICPROGEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLUBRIFICPROGEQUIP'
      Origin = 'CODLUBRIFICPROGEQUIP'
      Size = 9
    end
    object FDMemTLubrificItensEspCODPARTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPARTE'
      Origin = 'CODPARTE'
    end
    object FDMemTLubrificItensEspITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object FDMemTLubrificItensEspDESCINSPECAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCINSPECAO'
      Origin = 'DESCINSPECAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTLubrificItensEspEQUIPPARADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPPARADO'
      Origin = 'EQUIPPARADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTLubrificItensEspTEMPO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object FDMemTLubrificItensEspEXECAUTONOMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECAUTONOMO'
      Origin = 'EXECAUTONOMO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTLubrificItensEspEXECUTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECUTADO'
      Origin = 'EXECUTADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTLubrificItensEspBOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOM'
      Origin = 'BOM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTLubrificItensEspREGULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REGULAR'
      Origin = 'REGULAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTLubrificItensEspRUIM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUIM'
      Origin = 'RUIM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTLubrificItensEspPARTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARTE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTLubrificItensEspTotalHH: TAggregateField
      FieldName = 'TotalHH'
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TEMPO)'
    end
  end
  object FDMemTLubrificPlanoTrab: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODLUBRIFICPROGFAMEQUIP'
    MasterSource = DSMemTLubrific
    MasterFields = 'CODEMPRESA;CODLUBRIFICPROGFAMEQUIP'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 914
    Top = 283
    object FDMemTLubrificPlanoTrabCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTLubrificPlanoTrabCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTLubrificPlanoTrabCODLUBRIFICPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLUBRIFICPROGFAMEQUIP'
      Origin = 'CODLUBRIFICPROGFAMEQUIP'
      Size = 9
    end
    object FDMemTLubrificPlanoTrabCODPLANOTRABALHO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODPLANOTRABALHO'
      Origin = 'CODPLANOTRABALHO'
      Size = 9
    end
    object FDMemTLubrificPlanoTrabPLANOTRABALHO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLANOTRABALHO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 200
    end
    object FDMemTLubrificPlanoTrabDETALHES: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'DETALHES'
      Origin = 'DETALHES'
      ProviderFlags = []
    end
  end
  object DSMemTLubrificItensEsp: TDataSource
    DataSet = FDMemTManutItensEsp
    Left = 895
    Top = 333
  end
  object DSMemTLubrificPlanoTrab: TDataSource
    DataSet = FDMemTManutPlanoTrab
    Left = 914
    Top = 333
  end
  object DSMemTRota: TDataSource
    DataSet = FDMemTRota
    Left = 857
    Top = 436
  end
  object FDMemTRotaSeq: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODROTA'
    MasterSource = DSMemTRota
    MasterFields = 'CODEMPRESA;CODIGO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 876
    Top = 387
    object FDMemTRotaSeqCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 9
    end
    object FDMemTRotaSeqCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTRotaSeqCODROTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODROTA'
      Origin = 'CODROTA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTRotaSeqCODAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODAREA'
      Origin = 'CODAREA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTRotaSeqCODCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCELULA'
      Origin = 'CODCELULA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTRotaSeqCODLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLINHA'
      Origin = 'CODLINHA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTRotaSeqSEQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTRotaSeqCODFAMILIAEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAMILIAEQUIP'
      Origin = 'CODFAMILIAEQUIP'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTRotaSeqAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTRotaSeqCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTRotaSeqLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LINHA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTRotaSeqFAMILIAEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FAMILIAEQUIP'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTRotaSeqCODEQUIPATUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPATUAL'
      Origin = 'CODIGO'
      ProviderFlags = []
    end
    object FDMemTRotaSeqSEQEQUIPATUAL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQEQUIPATUAL'
      Origin = 'SEQUENCIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDMemTRotaSeqEQUIPATUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPATUAL'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 200
    end
    object FDMemTRotaSeqFREQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FREQUENCIA'
      Origin = 'FREQUENCIA'
      ProviderFlags = []
    end
  end
  object DSMemTRotaSeq: TDataSource
    DataSet = FDMemTRotaSeq
    Left = 876
    Top = 436
  end
  object FDMemTRotaSeqManut: TFDMemTable
    IndexFieldNames = 'CODEMPRESA'
    MasterSource = DSMemTRotaSeq
    MasterFields = 'CODEMPRESA'
    DetailFields = 'CODEMPRESA'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 895
    Top = 387
    object FDMemTRotaSeqManutCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 9
    end
    object FDMemTRotaSeqManutCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTRotaSeqManutCODMANUTPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODMANUTPROGFAMEQUIP'
      Origin = 'CODMANUTPROGFAMEQUIP'
      Size = 9
    end
    object FDMemTRotaSeqManutDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 80
    end
    object FDMemTRotaSeqManutDTAINICIO1: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DTAINICIO1'
      Origin = 'DTAINICIO1'
    end
    object FDMemTRotaSeqManutRELATORIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RELATORIO'
      Origin = 'RELATORIO'
      Size = 1
    end
    object FDMemTRotaSeqManutFREQUENCIA1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FREQUENCIA1'
      Origin = 'FREQUENCIA1'
    end
    object FDMemTRotaSeqManutCODEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODIGO'
      ProviderFlags = []
    end
  end
  object DSMemTRotaSeqManut: TDataSource
    DataSet = FDMemTRotaSeqManut
    Left = 895
    Top = 436
  end
  object FDMemTRotaSeqManutItens: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODMANUTPROGFAMEQUIP'
    AggregatesActive = True
    MasterSource = DSMemTRotaSeqManut
    MasterFields = 'CODEMPRESA;CODMANUTPROGFAMEQUIP'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 914
    Top = 387
    object FDMemTRotaSeqManutItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTRotaSeqManutItensCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTRotaSeqManutItensCODMANUTPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODMANUTPROGFAMEQUIP'
      Origin = 'CODMANUTPROGFAMEQUIP'
      Size = 9
    end
    object FDMemTRotaSeqManutItensCODPARTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPARTE'
      Origin = 'CODPARTE'
    end
    object FDMemTRotaSeqManutItensITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object FDMemTRotaSeqManutItensDESCINSPECAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCINSPECAO'
      Origin = 'DESCINSPECAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTRotaSeqManutItensEQUIPPARADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPPARADO'
      Origin = 'EQUIPPARADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensTEMPO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object FDMemTRotaSeqManutItensEXECAUTONOMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECAUTONOMO'
      Origin = 'EXECAUTONOMO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensEXECUTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECUTADO'
      Origin = 'EXECUTADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensBOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOM'
      Origin = 'BOM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensREGULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REGULAR'
      Origin = 'REGULAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensRUIM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUIM'
      Origin = 'RUIM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensPARTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARTE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTRotaSeqManutItensTotalHH: TAggregateField
      FieldName = 'TotalHH'
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TEMPO)'
    end
  end
  object DSMemTRotaSeqManutItens: TDataSource
    DataSet = FDMemTRotaSeqManutItens
    Left = 914
    Top = 436
  end
  object FDMemTRotaSeqManutItensEsp: TFDMemTable
    IndexFieldNames = 'CODEMPRESA;CODMANUTPROGEQUIP'
    AggregatesActive = True
    MasterSource = DSMemTRotaSeqManut
    MasterFields = 'CODEMPRESA;CODIGO'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 933
    Top = 387
    object FDMemTRotaSeqManutItensEspCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTRotaSeqManutItensEspCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTRotaSeqManutItensEspCODMANUTPROGEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODMANUTPROGEQUIP'
      Origin = 'CODMANUTPROGEQUIP'
      Size = 9
    end
    object FDMemTRotaSeqManutItensEspCODPARTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPARTE'
      Origin = 'CODPARTE'
    end
    object FDMemTRotaSeqManutItensEspITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object FDMemTRotaSeqManutItensEspDESCINSPECAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCINSPECAO'
      Origin = 'DESCINSPECAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTRotaSeqManutItensEspEQUIPPARADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPPARADO'
      Origin = 'EQUIPPARADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensEspTEMPO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      ProviderFlags = [pfInUpdate]
      Precision = 16
      Size = 2
    end
    object FDMemTRotaSeqManutItensEspEXECAUTONOMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECAUTONOMO'
      Origin = 'EXECAUTONOMO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensEspEXECUTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EXECUTADO'
      Origin = 'EXECUTADO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensEspBOM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOM'
      Origin = 'BOM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensEspREGULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REGULAR'
      Origin = 'REGULAR'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensEspRUIM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUIM'
      Origin = 'RUIM'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTRotaSeqManutItensEspPARTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PARTE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 80
    end
    object FDMemTRotaSeqManutItensEspTotalHH: TAggregateField
      FieldName = 'TotalHH'
      Active = True
      DisplayName = ''
      DisplayFormat = ',0.00'
      Expression = 'SUM(TEMPO)'
    end
  end
  object DSMemTRotaSeqManutItensEsp: TDataSource
    DataSet = FDMemTRotaSeqManutItensEsp
    Left = 933
    Top = 436
  end
  object FDMemTLubrific: TFDMemTable
    OnCalcFields = FDMemTLubrific1CalcFields
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 857
    Top = 283
    object FDMemTLubrificCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 9
    end
    object FDMemTLubrificDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object FDMemTLubrificFREQUENCIA1: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FREQUENCIA1'
      Origin = 'FREQUENCIA1'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTLubrificDTAINICIO1: TDateTimeField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'DTAINICIO1'
      Origin = 'DTAINICIO1'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object FDMemTLubrificCODEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTO'
      Origin = 'CODEQUIPAMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTLubrificEQUIPAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EQUIPAMENTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 200
    end
    object FDMemTLubrificCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 9
    end
    object FDMemTLubrificC_DIASATRASO: TIntegerField
      DisplayLabel = 'Dias'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'C_DIASATRASO'
      Calculated = True
    end
    object FDMemTLubrificCODLUBRIFICPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLUBRIFICPROGFAMEQUIP'
      Origin = 'CODLUBRIFICPROGFAMEQUIP'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 9
    end
    object FDMemTLubrificCODMONITORAMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODMONITORAMENTO'
      Origin = 'CODMONITORAMENTO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object FDMemTLubrificCRITICIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CRITICIDADE'
      Origin = 'CRITICIDADE'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 40
    end
    object FDMemTLubrificREPROGRAMAR1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPROGRAMAR1'
      Origin = 'REPROGRAMAR1'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 15
    end
    object FDMemTLubrificFREQUENCIA2: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'FREQUENCIA2'
      Origin = 'FREQUENCIA2'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object FDMemTLubrificLEITURA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LEITURA'
      Origin = 'LEITURA'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object FDMemTLubrificREPROGRAMAR2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REPROGRAMAR2'
      Origin = 'REPROGRAMAR2'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 15
    end
    object FDMemTLubrificRELATORIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RELATORIO'
      Origin = 'RELATORIO'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 1
    end
    object FDMemTLubrificSEQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = []
      Visible = False
    end
    object FDMemTLubrificDESCLUBRIFICPROGFAMEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCLUBRIFICPROGFAMEQUIP'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTLubrificCODFAMILIAEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODFAMILIAEQUIP'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTLubrificFAMILIAEQUIP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FAMILIAEQUIP'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTLubrificPROGRAMACAO2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROGRAMACAO2'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTLubrificCODAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODAREA'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTLubrificAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTLubrificCODCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCELULA'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTLubrificCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTLubrificCODLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLINHA'
      Origin = 'CODIGO'
      ProviderFlags = []
      Visible = False
      Size = 9
    end
    object FDMemTLubrificLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LINHA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Visible = False
      Size = 80
    end
    object FDMemTLubrificCODORDEMSERVICO: TIntegerField
      FieldName = 'CODORDEMSERVICO'
      DisplayFormat = '#000000'
    end
    object FDMemTLubrificPERIODO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PERIODO'
      Visible = False
      Calculated = True
    end
    object FDMemTLubrificC_PROXINSP: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'C_PROXINSP'
      Visible = False
      Calculated = True
    end
  end
end

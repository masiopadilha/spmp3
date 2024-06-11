inherited FrmTelaCadEquipamentosHist: TFrmTelaCadEquipamentosHist
  Caption = 'Hist'#243'rico'
  ClientHeight = 644
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1004
    object Label3: TLabel [1]
      Left = 125
      Top = 33
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [2]
      Left = 284
      Top = 33
      Width = 7
      Height = 16
      Caption = 'a'
    end
    inherited BtnAjuda: TButton
      Left = 971
      Top = 15
      TabOrder = 3
      ExplicitLeft = 967
      ExplicitTop = 15
    end
    object BtnConsultar: TButton
      Left = 403
      Top = 28
      Width = 28
      Height = 28
      Hint = 'Consultar'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnConsultarClick
    end
    object BtnImprimir: TButton
      Left = 940
      Top = 15
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnImprimirClick
    end
    object EdtData1: TJvDateTimePicker
      Left = 175
      Top = 29
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 0
      DropDownDate = 44771.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 296
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 1
      DropDownDate = 44771.000000000000000000
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 505
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Width = 1004
      Height = 503
      ExplicitWidth = 1000
      ExplicitHeight = 500
    end
    object PFundo: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 497
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 994
      ExplicitHeight = 494
      object Label8: TLabel
        Left = 427
        Top = 38
        Width = 66
        Height = 16
        Alignment = taRightJustify
        Caption = 'Parado (h):'
      end
      object Label10: TLabel
        Left = 563
        Top = 5
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Caption = 'Terceiros:'
      end
      object Label11: TLabel
        Left = 697
        Top = 5
        Width = 37
        Height = 16
        Alignment = taRightJustify
        Caption = 'Custo:'
      end
      object LblHorasParadas: TLabel
        Left = 427
        Top = 53
        Width = 28
        Height = 16
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblCustoTerc: TLabel
        Left = 563
        Top = 21
        Width = 28
        Height = 16
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotalParadas: TLabel
        Left = 427
        Top = 21
        Width = 16
        Height = 16
        Caption = '00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 427
        Top = 5
        Width = 69
        Height = 16
        Alignment = taRightJustify
        Caption = 'N'#186' Paradas:'
      end
      object Label1: TLabel
        Left = 697
        Top = 38
        Width = 108
        Height = 16
        Alignment = taRightJustify
        Caption = 'Custo + Auxiliares:'
      end
      object LblCustoTotal: TLabel
        Left = 697
        Top = 53
        Width = 49
        Height = 16
        Caption = 'R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 563
        Top = 38
        Width = 65
        Height = 16
        Alignment = taRightJustify
        Caption = 'Altera'#231#245'es:'
      end
      object LblCustoAlt: TLabel
        Left = 563
        Top = 53
        Width = 49
        Height = 16
        Caption = 'R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 11
        Top = 5
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'C'#243'digo:'
      end
      object Label4: TLabel
        Left = 11
        Top = 38
        Width = 60
        Height = 16
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o:'
      end
      object lblCodigo: TDBText
        Left = 11
        Top = 21
        Width = 57
        Height = 16
        AutoSize = True
        DataField = 'CODIGO'
        DataSource = DM.dsEquipamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDescricao: TDBText
        Left = 11
        Top = 53
        Width = 486
        Height = 15
        DataField = 'DESCRICAO'
        DataSource = DM.dsEquipamentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblCusto: TDBText
        Left = 697
        Top = 21
        Width = 55
        Height = 16
        AutoSize = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PCInspecoes: TPageControl
        AlignWithMargins = True
        Left = 5
        Top = 72
        Width = 988
        Height = 218
        Margins.Top = 70
        ActivePage = TSManutencoes
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 984
        object TSManutencoes: TTabSheet
          Caption = 'Manuten'#231#245'es'
          object lblTotalManutProg: TLabel
            Left = 324
            Top = 169
            Width = 81
            Height = 16
            Alignment = taRightJustify
            Caption = 'Programadas:'
          end
          object lblDBTotalManutProg: TLabel
            Left = 409
            Top = 169
            Width = 8
            Height = 16
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTotalManutExec: TLabel
            Left = 453
            Top = 169
            Width = 69
            Height = 16
            Alignment = taRightJustify
            Caption = 'Executadas:'
          end
          object lblDBTotalManutExec: TLabel
            Left = 526
            Top = 169
            Width = 8
            Height = 16
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GrdManutencoes: TJvDBGrid
            AlignWithMargins = True
            Left = 322
            Top = 0
            Width = 658
            Height = 167
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 20
            Align = alRight
            DataSource = DM.dsEquipamentoManutHist
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = GrdManutencoesDrawColumnCell
            OnKeyPress = GrdManutencoesKeyPress
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
            RowsHeight = 19
            TitleRowHeight = 19
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Width = 274
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODORDEMSERVICO'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FREQUENCIA1'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTAINICIO1'
                Title.Alignment = taCenter
                Title.Caption = 'Programada'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAEXECUCAO'
                Title.Alignment = taCenter
                Title.Caption = 'Executada'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAFECHAMENTO'
                Title.Alignment = taCenter
                Title.Caption = 'Fechada'
                Visible = True
              end>
          end
          object GrdTipoManutencoes: TJvDBGrid
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 320
            Height = 187
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            DataSource = DM.dsEquipamentoTipoManutHist
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = GrdTipoManutencoesDrawColumnCell
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
            RowsHeight = 19
            TitleRowHeight = 19
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Tipo'
                Width = 160
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Total'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUSTOTOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Custo'
                Width = 68
                Visible = True
              end>
          end
        end
        object TSLubrificacoes: TTabSheet
          Caption = 'Lubrifica'#231#245'es'
          ImageIndex = 1
          object lblTotalLubrificProg: TLabel
            Left = 324
            Top = 169
            Width = 81
            Height = 16
            Alignment = taRightJustify
            Caption = 'Programadas:'
          end
          object lblDBTotalLubrificProg: TLabel
            Left = 409
            Top = 169
            Width = 8
            Height = 16
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTotalLubrificExec: TLabel
            Left = 453
            Top = 169
            Width = 69
            Height = 16
            Alignment = taRightJustify
            Caption = 'Executadas:'
          end
          object lblDBTotalLubrificExec: TLabel
            Left = 526
            Top = 169
            Width = 8
            Height = 16
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GrdLubrificacoes: TJvDBGrid
            AlignWithMargins = True
            Left = 322
            Top = 0
            Width = 658
            Height = 167
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 20
            Align = alRight
            DataSource = DM.dsEquipamentoLubrificHist
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = GrdLubrificacoesDrawColumnCell
            OnKeyPress = GrdLubrificacoesKeyPress
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
            RowsHeight = 19
            TitleRowHeight = 19
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Width = 274
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODORDEMSERVICO'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FREQUENCIA1'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -12
                Title.Font.Name = 'Segoe UI'
                Title.Font.Style = [fsBold]
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTAINICIO1'
                Title.Alignment = taCenter
                Title.Caption = 'Programada'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAEXECUCAO'
                Title.Alignment = taCenter
                Title.Caption = 'Executada'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAFECHAMENTO'
                Title.Alignment = taCenter
                Title.Caption = 'Fechada'
                Visible = True
              end>
          end
          object GrdTipoManutencoes2: TJvDBGrid
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 320
            Height = 187
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            DataSource = DM.dsEquipamentoTipoManutHist
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = GrdTipoManutencoesDrawColumnCell
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
            RowsHeight = 19
            TitleRowHeight = 19
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Tipo'
                Width = 160
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Total'
                Width = 57
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUSTOTOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Custo'
                Width = 68
                Visible = True
              end>
          end
        end
      end
      object GrdServiços: TJvDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 293
        Width = 990
        Height = 200
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        DataSource = DM.dsEquipamentosHist
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
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
        RowsHeight = 19
        TitleRowHeight = 19
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ORDEMSERVICO'
            Title.Alignment = taCenter
            Title.Caption = 'OS'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERVICO'
            Title.Caption = 'Servi'#231'o'
            Width = 321
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATAINICIOREAL'
            Title.Alignment = taCenter
            Title.Caption = 'In'#237'cio'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAFIMREAL'
            Title.Alignment = taCenter
            Title.Caption = 'Fim'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOMOBRA'
            Title.Alignment = taCenter
            Title.Caption = 'M'#227'o de Obra'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOPECAS'
            Title.Alignment = taCenter
            Title.Caption = 'Pe'#231'as'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTORECURSOS'
            Title.Alignment = taCenter
            Title.Caption = 'Recursos'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOEXTRA'
            Title.Alignment = taCenter
            Title.Caption = 'Extras'
            Width = 75
            Visible = True
          end>
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
      Left = 313
      Visible = False
      ExplicitLeft = 313
    end
    inherited BtnFechar: TButton
      Left = 466
      ExplicitLeft = 466
    end
  end
  object ImageList1: TImageList
    Left = 600
    Top = 16
    Bitmap = {
      494C01010200D800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F000000
      00000000000000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFCFF00000000
      F9FFF87F00000000F0FFF07F00000000F0FFF03F00000000E07FE03F00000000
      C07FC01F00000000843F841F000000001E3F1E0F00000000FE1FFE0F00000000
      FF1FFF0700000000FF8FFF8300000000FFC7FFC100000000FFE3FFE000000000
      FFF8FFF800000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object CDTipoManut: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 247
    Top = 68
    object CDTipoManutTIPO: TStringField
      FieldName = 'TIPO'
      Size = 30
    end
    object CDTipoManutTOTAL: TIntegerField
      FieldName = 'TOTAL'
      DisplayFormat = '00'
    end
    object CDTipoManutCUSTO: TFloatField
      FieldName = 'CUSTO'
      DisplayFormat = 'R$ ,0.00'
    end
  end
  object DSTipoManut: TDataSource
    DataSet = CDTipoManut
    Left = 311
    Top = 68
  end
  object CDTipoLubrific: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 247
    Top = 124
    object CDTipoLubrificTIPO: TStringField
      FieldName = 'TIPO'
      Size = 30
    end
    object CDTipoLubrificTOTAL: TIntegerField
      FieldName = 'TOTAL'
      DisplayFormat = '00'
    end
    object CDTipoLubrificCUSTO: TFloatField
      FieldName = 'CUSTO'
      DisplayFormat = 'R$ ,0.00'
    end
  end
  object DSTipoLubrific: TDataSource
    DataSet = CDTipoLubrific
    Left = 311
    Top = 124
  end
  object CDAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 839
    Top = 98
    object CDAuxiliarCODIGO: TWideStringField
      FieldName = 'CODIGO'
    end
    object CDAuxiliarDESCRICAO: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRICAO'
      Size = 200
      Calculated = True
    end
  end
  object CDEquipEAuxiliares: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 911
    Top = 98
    object CDEquipEAuxiliaresCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object CDEquipEAuxiliaresDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
end

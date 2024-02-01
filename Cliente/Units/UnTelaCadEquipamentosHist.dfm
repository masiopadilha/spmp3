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
            Left = 326
            Top = 169
            Width = 81
            Height = 16
            Alignment = taRightJustify
            Caption = 'Programadas:'
          end
          object lblDBTotalManutProg: TLabel
            Left = 411
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
            Left = 455
            Top = 169
            Width = 69
            Height = 16
            Alignment = taRightJustify
            Caption = 'Executadas:'
          end
          object lblDBTotalManutExec: TLabel
            Left = 528
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
          object GrdManutencoes: TDBGrid
            Left = 2
            Top = 0
            Width = 320
            Height = 187
            Margins.Top = 48
            Margins.Bottom = 232
            Align = alCustom
            DataSource = DM.dsEquipamentoTipoManutHist
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdManutencoesDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Tipo'
                Width = 141
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Total'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUSTOTOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Custo'
                Width = 70
                Visible = True
              end>
          end
          object GrdInspecoes: TDBGrid
            Left = 324
            Top = 0
            Width = 651
            Height = 167
            DataSource = DM.dsEquipamentoManutHist
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdInspecoesDrawColumnCell
          end
        end
        object TSLubrificacoes: TTabSheet
          Caption = 'Lubrifica'#231#245'es'
          ImageIndex = 1
          object lblTotalLubrificProg: TLabel
            Left = 326
            Top = 169
            Width = 81
            Height = 16
            Alignment = taRightJustify
            Caption = 'Programadas:'
          end
          object lblDBTotalLubrificProg: TLabel
            Left = 411
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
            Left = 455
            Top = 169
            Width = 69
            Height = 16
            Alignment = taRightJustify
            Caption = 'Executadas:'
          end
          object lblDBTotalLubrificExec: TLabel
            Left = 528
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
          object GrdManutencoes2: TDBGrid
            Left = 2
            Top = 0
            Width = 320
            Height = 187
            Margins.Top = 48
            Margins.Bottom = 232
            Align = alCustom
            DataSource = DM.dsEquipamentoTipoManutHist
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdManutencoesDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Tipo'
                Width = 141
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Total'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUSTOTOTAL'
                Title.Alignment = taCenter
                Title.Caption = 'Custo'
                Width = 70
                Visible = True
              end>
          end
          object GrdLubrificacoes: TDBGrid
            Left = 324
            Top = 0
            Width = 651
            Height = 167
            DataSource = DM.dsEquipamentoLubrificHist
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdLubrificacoesDrawColumnCell
          end
        end
      end
      object GrdItensManut: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 293
        Width = 988
        Height = 195
        Margins.Top = 0
        Align = alTop
        DataSource = DM.dsEquipamentosHist
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ORDEMSERVICO'
            Title.Alignment = taCenter
            Title.Caption = 'OS'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERVICO'
            Title.Caption = 'Servi'#231'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 324
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIPOMANUTENCAO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo de Manuten'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATAINICIOREAL'
            Title.Alignment = taCenter
            Title.Caption = 'In'#237'cio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 120
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATAFIMREAL'
            Title.Alignment = taCenter
            Title.Caption = 'Fim'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOMOBRA'
            Title.Alignment = taCenter
            Title.Caption = 'M'#227'o de Obra'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOPECAS'
            Title.Alignment = taCenter
            Title.Caption = 'Pe'#231'as'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTORECURSOS'
            Title.Alignment = taCenter
            Title.Caption = 'Recursos'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOEXTRA'
            Title.Alignment = taCenter
            Title.Caption = 'Extras'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 74
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
      Left = 464
      ExplicitLeft = 464
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
    Left = 127
    Top = 196
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
    Left = 191
    Top = 196
  end
  object CDTipoLubrific: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 127
    Top = 252
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
    Left = 191
    Top = 252
  end
  object CDAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 519
    Top = 178
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
    Left = 591
    Top = 178
    object CDEquipEAuxiliaresCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object CDEquipEAuxiliaresDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
  end
end

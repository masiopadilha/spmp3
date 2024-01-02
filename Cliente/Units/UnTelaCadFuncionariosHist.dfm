inherited FrmTelaCadFuncionariosHist: TFrmTelaCadFuncionariosHist
  Caption = 'Hist'#243'rico do Funcion'#225'rio'
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
    Height = 62
    ExplicitWidth = 1004
    ExplicitHeight = 62
    inherited Image1: TImage
      Top = 4
      ExplicitTop = 4
    end
    object Label3: TLabel [1]
      Left = 126
      Top = 37
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
    object Label4: TLabel [2]
      Left = 289
      Top = 37
      Width = 7
      Height = 16
      Caption = 'a'
    end
    object Label2: TLabel [3]
      Left = 421
      Top = 38
      Width = 66
      Height = 13
      Caption = 'M'#227'o de Obra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited BtnAjuda: TButton
      Left = 970
      TabOrder = 3
      ExplicitLeft = 966
    end
    object BtnConsultar: TButton
      Left = 603
      Top = 31
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnConsultarClick
    end
    object EdtData1: TJvDateTimePicker
      Left = 178
      Top = 33
      Width = 104
      Height = 24
      Date = 44851.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 0
      OnChange = EdtData1Change
      DropDownDate = 44771.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 303
      Top = 33
      Width = 104
      Height = 24
      Date = 44851.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 1
      OnChange = EdtData1Change
      DropDownDate = 44771.000000000000000000
    end
    object CBConsSimples: TComboBox
      Left = 493
      Top = 34
      Width = 107
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 4
      Text = 'Geral'
      OnChange = CBConsSimplesChange
      Items.Strings = (
        'Geral'
        'Mec'#226'nica'
        'El'#233'trica'
        'Civil'
        'Apoio T'#233'cnico'
        'Produtiva'
        'Administrativa'
        'Utilidades')
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
      TabOrder = 5
      OnClick = BtnImprimirClick
    end
  end
  inherited PCentro: TPanel
    Top = 69
    Width = 1006
    Height = 503
    ExplicitTop = 69
    ExplicitWidth = 1002
    ExplicitHeight = 500
    inherited RGTelas: TRadioGroup
      Width = 1004
      Height = 501
      ExplicitWidth = 1000
      ExplicitHeight = 498
    end
    object PFundo: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 495
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 994
      ExplicitHeight = 492
      object GrdManutencoes: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 272
        Width = 348
        Height = 218
        Margins.Top = 1
        Align = alLeft
        DataSource = DM.dsFuncionariosTipoManutHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Columns = <
          item
            Expanded = False
            FieldName = 'MANUTENCAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Manuten'#231#227'o'
            Width = 199
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Total OS'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Total HH'
            Width = 52
            Visible = True
          end>
      end
      object GrdInspecoes: TDBGrid
        AlignWithMargins = True
        Left = 358
        Top = 272
        Width = 635
        Height = 218
        Margins.Top = 1
        Align = alRight
        DataSource = DM.dsFuncionariosHistServicos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GrdInspecoesDrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'O.S.'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERVICO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Servi'#231'o'
            Width = 233
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODEQUIPAMENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Equip.'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCEQUIPAMENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Equipamento'
            Width = 209
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Tempo'
            Width = 49
            Visible = True
          end>
      end
      object GrdFuncionarios: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 988
        Height = 265
        Margins.Bottom = 1
        Align = alTop
        DataSource = DM.dsFuncionariosHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyPress = GrdFuncionariosKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'MATRICULA'
            Title.Alignment = taCenter
            Title.Caption = 'Matr'#237'cula'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 186
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALENDARIO'
            Title.Caption = 'Calend'#225'rio'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARGO'
            Title.Caption = 'Cargo'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AREA'
            Title.Caption = #193'rea'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CELULA'
            Title.Caption = 'C'#233'lula'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIPOCELULA'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Width = 113
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
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
  object PopupMenuRelat: TPopupMenu
    Left = 684
    Top = 16
    object Ficha1: TMenuItem
      Caption = 'Ficha'
    end
    object Lista1: TMenuItem
      Caption = 'Lista'
      object Simples1: TMenuItem
        Caption = 'Simples'
      end
      object Completa1: TMenuItem
        Caption = 'Completa'
      end
      object MaodeObra1: TMenuItem
        Caption = 'M'#227'o de Obra'
      end
      object Inspecoes1: TMenuItem
        Caption = 'Inspe'#231#245'es'
      end
      object Exportar1: TMenuItem
        Caption = 'Exportar Excel (.csv)'
      end
    end
    object Checklist1: TMenuItem
      Caption = 'Checklist'
    end
  end
end

inherited FrmTelaImpPedidos: TFrmTelaImpPedidos
  Caption = 'Pedidos de Materiais'
  ClientWidth = 664
  Constraints.MaxWidth = 680
  Constraints.MinWidth = 680
  OnCreate = FormCreate
  ExplicitWidth = 680
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 660
    ExplicitWidth = 660
    inherited BtnAjuda: TButton
      Left = 627
      ExplicitLeft = 627
    end
    object BtnArquivo: TButton
      Left = 597
      Top = 13
      Width = 28
      Height = 28
      Hint = 'Importar dados'
      DisabledImageIndex = 113
      ImageAlignment = iaCenter
      ImageIndex = 113
      TabOrder = 1
      OnClick = BtnArquivoClick
    end
  end
  inherited PCentro: TPanel
    Width = 658
    ExplicitWidth = 658
    inherited RGTelas: TRadioGroup
      Width = 656
      ExplicitWidth = 656
    end
    object PBase: TPanel
      Left = 1
      Top = 1
      Width = 656
      Height = 160
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 14671839
      ParentBackground = False
      TabOrder = 1
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 650
        Height = 154
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        DataSource = DSPecas
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODFAMILIAPECA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Fam'#237'lia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCFAMILIAPECA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Fam'#237'lia'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 176
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Qtde.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -9
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object StringGrid1: TStringGrid
        Left = 537
        Top = 60
        Width = 86
        Height = 56
        DefaultColWidth = 200
        DrawingStyle = gdsClassic
        FixedCols = 0
        FixedRows = 0
        TabOrder = 1
        Visible = False
      end
    end
  end
  inherited PAuxiliares: TPanel
    Width = 660
    ExplicitWidth = 660
  end
  inherited PBotoes: TPanel
    Width = 660
    ExplicitWidth = 660
    inherited BtnOK: TButton
      Left = 252
      Caption = 'Atualizar'
      ModalResult = 0
      ExplicitLeft = 252
    end
    inherited BtnFechar: TButton
      Left = 333
      ExplicitLeft = 333
    end
  end
  object CDPecas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 10
    object CDPecasCODIGO: TStringField
      FieldName = 'CODIGO'
    end
    object CDPecasDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object CDPecasCODFAMILIAPECA: TStringField
      FieldName = 'CODFAMILIAPECA'
      Size = 9
    end
    object CDPecasDESCFAMILIAPECA: TStringField
      FieldName = 'DESCFAMILIAPECA'
      Size = 80
    end
    object CDPecasPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = 'R$ ,0.00'
    end
    object CDPecasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '00'
    end
  end
  object DSPecas: TDataSource
    DataSet = CDPecas
    Left = 234
    Top = 10
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.XLSX'
    Filter = 'Arquivo do Excel(*.XLSX)|*.XLSX|Arquivo do Excel(*.XLS)|*.XLS'
    Left = 553
    Top = 18
  end
end

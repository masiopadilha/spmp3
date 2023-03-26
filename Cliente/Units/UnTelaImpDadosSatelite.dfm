inherited FrmTelaImpDadosSatelite: TFrmTelaImpDadosSatelite
  Caption = 'Importar dados do sat'#233'lite'
  ClientHeight = 341
  Constraints.MaxHeight = 380
  Constraints.MinHeight = 380
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 16
  inherited PCentro: TPanel
    Height = 202
    ExplicitHeight = 202
    inherited RGTelas: TRadioGroup
      Height = 200
      ExplicitHeight = 200
    end
    object PBase: TPanel
      Left = 1
      Top = 1
      Width = 496
      Height = 200
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 14671839
      ParentBackground = False
      TabOrder = 1
      object Label5: TLabel
        Left = 11
        Top = 13
        Width = 79
        Height = 16
        Alignment = taRightJustify
        Caption = 'Equipamento:'
      end
      object BtnArquivo: TButton
        Left = 392
        Top = 7
        Width = 28
        Height = 28
        Hint = 'Importar dados'
        DisabledImageIndex = 113
        ImageAlignment = iaCenter
        ImageIndex = 113
        TabOrder = 3
        OnClick = BtnArquivoClick
      end
      object EdtCodEquipamento: TEdit
        Left = 93
        Top = 11
        Width = 97
        Height = 24
        Color = clBtnFace
        TabOrder = 0
      end
      object EdtDescEquipamento: TEdit
        Left = 191
        Top = 11
        Width = 171
        Height = 24
        Color = clBtnFace
        TabOrder = 1
      end
      object BtnEquipamento: TButton
        Left = 363
        Top = 7
        Width = 28
        Height = 28
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BtnEquipamentoClick
      end
      object GBAbastecimentos: TGroupBox
        Left = 91
        Top = 38
        Width = 139
        Height = 147
        Caption = 'Abastecimentos:'
        TabOrder = 4
        object PAbastecimentos: TPanel
          Left = 2
          Top = 18
          Width = 135
          Height = 127
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object LblPlacaAbast: TLabel
            Left = 26
            Top = 6
            Width = 35
            Height = 16
            Alignment = taRightJustify
            Caption = 'Placa:'
          end
          object LblMedidorAbast: TLabel
            Left = 10
            Top = 31
            Width = 51
            Height = 16
            Alignment = taRightJustify
            Caption = 'Medidor:'
          end
          object LblContadorAbast: TLabel
            Left = 4
            Top = 56
            Width = 57
            Height = 16
            Alignment = taRightJustify
            Caption = 'Contador:'
          end
          object LblRodadosAbast: TLabel
            Left = 7
            Top = 81
            Width = 54
            Height = 16
            Alignment = taRightJustify
            Caption = 'Rodados:'
          end
          object LblNovoValorAbast: TLabel
            Left = 30
            Top = 106
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Novo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtPlacaAbast: TDBEdit
            Left = 64
            Top = 4
            Width = 65
            Height = 24
            Color = clBtnFace
            DataField = 'PLACA'
            ReadOnly = True
            TabOrder = 0
          end
          object EdtMedidorAbast: TDBEdit
            Left = 64
            Top = 29
            Width = 65
            Height = 24
            Color = clBtnFace
            DataField = 'CONTADOR'
            ReadOnly = True
            TabOrder = 1
          end
          object EdtContadorAbast: TDBEdit
            Left = 64
            Top = 54
            Width = 65
            Height = 24
            Color = clBtnFace
            DataField = 'CONTADORATUAL'
            ReadOnly = True
            TabOrder = 2
          end
          object EdtRodadosAbast: TEdit
            Left = 64
            Top = 79
            Width = 65
            Height = 24
            ReadOnly = True
            TabOrder = 3
          end
          object EdtNovoValorAbast: TEdit
            Left = 64
            Top = 104
            Width = 65
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
      object GBPneus: TGroupBox
        Left = 227
        Top = 38
        Width = 139
        Height = 147
        Caption = 'Pneus:'
        TabOrder = 5
        object PPneus: TPanel
          Left = 2
          Top = 18
          Width = 135
          Height = 127
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object LblPlacaPneus: TLabel
            Left = 26
            Top = 6
            Width = 35
            Height = 16
            Alignment = taRightJustify
            Caption = 'Placa:'
          end
          object LblOdometro: TLabel
            Left = 39
            Top = 31
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Od'#244'metro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblContadorPneus: TLabel
            Left = 4
            Top = 56
            Width = 57
            Height = 16
            Alignment = taRightJustify
            Caption = 'Contador:'
          end
          object LblRodadosPneus: TLabel
            Left = 7
            Top = 81
            Width = 54
            Height = 16
            Alignment = taRightJustify
            Caption = 'Rodados:'
          end
          object LblNovoValorPneus: TLabel
            Left = 30
            Top = 106
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Novo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtPlacaPneus: TDBEdit
            Left = 64
            Top = 4
            Width = 65
            Height = 24
            Color = clBtnFace
            DataField = 'PLACA'
            ReadOnly = True
            TabOrder = 0
          end
          object EdtContadorPneus: TDBEdit
            Left = 64
            Top = 54
            Width = 65
            Height = 24
            Color = clBtnFace
            DataField = 'CONTADOR'
            ReadOnly = True
            TabOrder = 1
          end
          object EdtRodadosPneus: TEdit
            Left = 64
            Top = 79
            Width = 65
            Height = 24
            ReadOnly = True
            TabOrder = 2
          end
          object EdtNovoValorPneus: TEdit
            Left = 64
            Top = 105
            Width = 65
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 274
    ExplicitTop = 274
  end
  inherited PBotoes: TPanel
    Top = 301
    ExplicitTop = 301
    inherited BtnOK: TButton
      Caption = 'Atualizar'
      ModalResult = 0
      OnClick = BtnOKClick
    end
  end
  object StringGrid1: TStringGrid
    Left = 370
    Top = 140
    Width = 86
    Height = 56
    DefaultColWidth = 200
    DrawingStyle = gdsClassic
    FixedCols = 0
    FixedRows = 0
    TabOrder = 4
    Visible = False
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.XLSX'
    Filter = 'Arquivo do Excel(*.XLSX)|*.XLSX|Arquivo do Excel(*.XLS)|*.XLS'
    Left = 425
    Top = 74
  end
end

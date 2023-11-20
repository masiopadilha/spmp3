inherited FrmTelaCadAbastecimentosViagens: TFrmTelaCadAbastecimentosViagens
  Caption = 'Viagens'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    ParentFont = False
    inherited LAlteracao: TLabel
      Left = 494
    end
    inherited LAlteradoPor: TLabel
      Left = 516
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsViagens
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsViagens
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsViagens
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsViagens
    end
    inherited LCadastro: TLabel
      Left = 388
    end
    inherited LCadastroPor: TLabel
      Left = 350
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label24: TLabel
      Left = 146
      Top = 41
      Width = 31
      Height = 16
      Alignment = taRightJustify
      Caption = 'Rota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 442
      Top = 42
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
      Left = 140
      Top = 72
      Width = 37
      Height = 16
      Alignment = taRightJustify
      Caption = 'Sa'#237'da:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 311
      Top = 73
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
      Left = 115
      Top = 103
      Width = 62
      Height = 16
      Alignment = taRightJustify
      Caption = 'Od'#244'metro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 103
      Top = 134
      Width = 74
      Height = 16
      Caption = 'Tanque (%):'
    end
    object Label29: TLabel
      Left = 538
      Top = 72
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
    object Label15: TLabel
      Left = 349
      Top = 70
      Width = 55
      Height = 16
      Alignment = taRightJustify
      Caption = 'Chegada:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 342
      Top = 103
      Width = 62
      Height = 16
      Alignment = taRightJustify
      Caption = 'Od'#244'metro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 330
      Top = 134
      Width = 74
      Height = 16
      Caption = 'Tanque (%):'
    end
    object Label9: TLabel
      Left = 105
      Top = 166
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'Urbano (%):'
    end
    object Label10: TLabel
      Left = 313
      Top = 166
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'Rodovi'#225'rio (%):'
    end
    object Label13: TLabel
      Left = 86
      Top = 196
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'Carregado (%):'
    end
    object LTotal: TLabel
      Left = 339
      Top = 197
      Width = 65
      Height = 16
      Caption = 'Total (km):'
    end
    object LblTotalPercorrido: TDBText
      Left = 408
      Top = 198
      Width = 118
      Height = 16
      AutoSize = True
      DataField = 'DISTANCIA'
      DataSource = DM.dsViagens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtRota: TDBEdit
      Left = 181
      Top = 39
      Width = 230
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'ROTA'
      DataSource = DM.dsViagens
      TabOrder = 0
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnRota: TButton
      Left = 412
      Top = 36
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 1
      OnClick = BtnRotaClick
    end
    object EdtDataPartida: TJvDBDateEdit
      Left = 181
      Top = 70
      Width = 125
      Height = 24
      DataField = 'DATAPARTIDA'
      DataSource = DM.dsViagens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowNullDate = False
      TabOrder = 2
    end
    object EdtTanqueSaida: TDBEdit
      Left = 181
      Top = 132
      Width = 125
      Height = 24
      DataField = 'TANQUESAIDA'
      DataSource = DM.dsViagens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDataChegada: TJvDBDateEdit
      Left = 408
      Top = 70
      Width = 125
      Height = 24
      DataField = 'DATACHEGADA'
      DataSource = DM.dsViagens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowNullDate = False
      TabOrder = 4
    end
    object EdtChegada: TDBEdit
      Left = 408
      Top = 101
      Width = 125
      Height = 24
      DataField = 'CONTADORCHEGADA'
      DataSource = DM.dsViagens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtTanqueChegada: TDBEdit
      Left = 408
      Top = 132
      Width = 125
      Height = 24
      DataField = 'TANQUECHEGADA'
      DataSource = DM.dsViagens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtUrbano: TDBEdit
      Left = 181
      Top = 163
      Width = 125
      Height = 24
      DataField = 'URBANO'
      DataSource = DM.dsViagens
      MaxLength = 14
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtRodoviario: TDBEdit
      Left = 408
      Top = 163
      Width = 125
      Height = 24
      DataField = 'RODOVIARIO'
      DataSource = DM.dsViagens
      MaxLength = 14
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCarregado: TDBEdit
      Left = 181
      Top = 195
      Width = 125
      Height = 24
      DataField = 'CARREGADO'
      DataSource = DM.dsViagens
      MaxLength = 14
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtSaida: TDBEdit
      Left = 181
      Top = 100
      Width = 125
      Height = 24
      DataField = 'CONTADORSAIDA'
      DataSource = DM.dsViagens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object GBCombustivel: TGroupBox
      Left = 88
      Top = 230
      Width = 220
      Height = 58
      Caption = 'Combustivel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      object lblConsEspCombust: TDBText
        Left = 147
        Top = 41
        Width = 123
        Height = 16
        AutoSize = True
        DataField = 'CONSPOTCOMBUST'
        DataSource = DM.dsViagens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LConsCombust: TLabel
        Left = 40
        Top = 22
        Width = 101
        Height = 16
        Alignment = taRightJustify
        Caption = 'Consumo (km/h):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblConsCombust: TDBText
        Left = 147
        Top = 22
        Width = 101
        Height = 16
        AutoSize = True
        DataField = 'CONSUMOCOMBUST'
        DataSource = DM.dsViagens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LConsRealCombust: TLabel
        Left = 11
        Top = 41
        Width = 130
        Height = 16
        Alignment = taRightJustify
        Caption = 'Consumo Real (km/h):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object GBLubrificante: TGroupBox
      Left = 314
      Top = 230
      Width = 220
      Height = 58
      Caption = 'Lubrificante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      object LConsLubrific: TLabel
        Left = 40
        Top = 22
        Width = 97
        Height = 16
        Alignment = taRightJustify
        Caption = 'Consumo (l/km):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblConsEspLubrific: TDBText
        Left = 147
        Top = 22
        Width = 114
        Height = 16
        AutoSize = True
        DataField = 'CONSPOTLUBRIFIC'
        DataSource = DM.dsViagens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LConsRealLubrific: TLabel
        Left = 11
        Top = 41
        Width = 126
        Height = 16
        Alignment = taRightJustify
        Caption = 'Consumo Real (l/km):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblConsLubrific: TDBText
        Left = 147
        Top = 41
        Width = 92
        Height = 16
        AutoSize = True
        DataField = 'CONSUMOLUBRIFIC'
        DataSource = DM.dsViagens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 405
    Width = 628
  end
  inherited PAuxiliares: TPanel
    Top = 378
    Width = 624
  end
end

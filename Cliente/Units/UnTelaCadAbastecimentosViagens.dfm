inherited FrmTelaCadAbastecimentosViagens: TFrmTelaCadAbastecimentosViagens
  Caption = 'Viagens'
  TextHeight = 16
  inherited PControle: TPanel
    ParentFont = False
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
  end
  inherited PCentro: TPanel
    object Label24: TLabel
      Left = 64
      Top = 37
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
      Left = 328
      Top = 58
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
      Left = 64
      Top = 82
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
      Left = 192
      Top = 105
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
      Left = 213
      Top = 82
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
      Left = 344
      Top = 82
      Width = 74
      Height = 16
      Caption = 'Tanque (%):'
    end
    object Label29: TLabel
      Left = 192
      Top = 150
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
      Left = 64
      Top = 127
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
      Left = 213
      Top = 127
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
      Left = 344
      Top = 127
      Width = 74
      Height = 16
      Caption = 'Tanque (%):'
    end
    object Label9: TLabel
      Left = 64
      Top = 172
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'Urbano (%):'
    end
    object Label10: TLabel
      Left = 217
      Top = 172
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'Rodovi'#225'rio (%):'
    end
    object Label13: TLabel
      Left = 344
      Top = 172
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'Carregado (%):'
    end
    object LTotal: TLabel
      Left = 500
      Top = 197
      Width = 65
      Height = 16
      Caption = 'Total (km):'
    end
    object LblTotalPercorrido: TDBText
      Left = 569
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
      Left = 64
      Top = 54
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
      Left = 297
      Top = 51
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
      Left = 64
      Top = 99
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
      Left = 344
      Top = 99
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
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDataChegada: TJvDBDateEdit
      Left = 64
      Top = 144
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
      TabOrder = 5
    end
    object EdtChegada: TDBEdit
      Left = 213
      Top = 144
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
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtTanqueChegada: TDBEdit
      Left = 344
      Top = 144
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
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtUrbano: TDBEdit
      Left = 64
      Top = 189
      Width = 125
      Height = 24
      DataField = 'URBANO'
      DataSource = DM.dsViagens
      MaxLength = 14
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtRodoviario: TDBEdit
      Left = 213
      Top = 189
      Width = 125
      Height = 24
      DataField = 'RODOVIARIO'
      DataSource = DM.dsViagens
      MaxLength = 14
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCarregado: TDBEdit
      Left = 344
      Top = 189
      Width = 125
      Height = 24
      DataField = 'CARREGADO'
      DataSource = DM.dsViagens
      MaxLength = 14
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtSaida: TDBEdit
      Left = 213
      Top = 99
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
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object GBCombustivel: TGroupBox
      Left = 489
      Top = 51
      Width = 220
      Height = 67
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
      Left = 489
      Top = 124
      Width = 220
      Height = 67
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
end

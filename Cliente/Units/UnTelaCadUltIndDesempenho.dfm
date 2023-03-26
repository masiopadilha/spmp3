inherited FrmTelaCadIndDesempenho: TFrmTelaCadIndDesempenho
  Caption = 'Indicadores de Desempenho'
  OnClose = FormClose
  ExplicitWidth = 560
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited PCentro: TPanel
    ExplicitLeft = -3
    object LblGravAcidMenM: TDBText
      Left = 166
      Top = 188
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'GRAVACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 13
      Top = 188
      Width = 161
      Height = 13
      Caption = 'Coefic. de Grav. de Acid. Mensal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblFreqAcidMenM: TDBText
      Left = 167
      Top = 169
      Width = 83
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'FREQACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 14
      Top = 169
      Width = 160
      Height = 13
      Caption = 'Coefic. de Freq. de Acid. Mensal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblHorasExtrasM: TDBText
      Left = 170
      Top = 150
      Width = 80
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'HORAEXTRAMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 43
      Top = 150
      Width = 131
      Height = 13
      Caption = '% de Horas Extras Mensal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblDispEquip: TDBText
      Left = 411
      Top = 79
      Width = 82
      Height = 13
      DataField = 'DISPEQUIP'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 411
      Top = 60
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Disponibilidade:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 197
      Top = 136
      Width = 53
      Height = 13
      Caption = 'Mec'#226'nica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 293
      Top = 136
      Width = 42
      Height = 13
      Caption = 'El'#233'trica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 378
      Top = 136
      Width = 24
      Height = 13
      Caption = 'C'#237'vil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 445
      Top = 136
      Width = 78
      Height = 13
      Caption = 'Ap'#243'io T'#233'cnico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblHorasExtrasE: TDBText
      Left = 257
      Top = 150
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'HORAEXTRAMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblFreqAcidMenE: TDBText
      Left = 254
      Top = 169
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'FREQACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblGravAcidMenE: TDBText
      Left = 253
      Top = 188
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'GRAVACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblHorasExtrasC: TDBText
      Left = 323
      Top = 150
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'HORAEXTRAMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblHorasExtrasA: TDBText
      Left = 444
      Top = 150
      Width = 79
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'HORAEXTRAMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblFreqAcidMenC: TDBText
      Left = 320
      Top = 169
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'FREQACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblFreqAcidMenA: TDBText
      Left = 441
      Top = 169
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'FREQACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblGravAcidMenC: TDBText
      Left = 319
      Top = 188
      Width = 83
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'GRAVACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblGravAcidMenA: TDBText
      Left = 440
      Top = 188
      Width = 83
      Height = 13
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'GRAVACIDMEC'
      DataSource = CMWeb.DSCadIndDesempenho
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 360
      Top = 15
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label12: TLabel
      Left = 455
      Top = 15
      Width = 23
      Height = 13
      Caption = 'Ano:'
    end
    object GBManutencao: TGroupBox
      Left = 14
      Top = 40
      Width = 367
      Height = 78
      Caption = '% de Manuten'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label7: TLabel
        Left = 66
        Top = 20
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Corretiva:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblManutCorret: TDBText
        Left = 117
        Top = 20
        Width = 82
        Height = 13
        DataField = 'MANUTCORRET'
        DataSource = CMWeb.DSCadIndDesempenho
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 59
        Top = 39
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Preventiva:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblManutPrev: TDBText
        Left = 117
        Top = 39
        Width = 82
        Height = 13
        DataField = 'MANUTPREV'
        DataSource = CMWeb.DSCadIndDesempenho
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 69
        Top = 58
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Preditiva:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblManutPred: TDBText
        Left = 117
        Top = 58
        Width = 82
        Height = 13
        DataField = 'MANUTPRED'
        DataSource = CMWeb.DSCadIndDesempenho
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 227
        Top = 20
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Outros Servi'#231'os:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblOutros: TDBText
        Left = 309
        Top = 20
        Width = 82
        Height = 13
        DataField = 'OUTROSSERV'
        DataSource = CMWeb.DSCadIndDesempenho
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 214
        Top = 39
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#227'o Conformidade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblNaoConf: TDBText
        Left = 309
        Top = 39
        Width = 82
        Height = 13
        DataField = 'NAOCONFORM'
        DataSource = CMWeb.DSCadIndDesempenho
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object CBMes: TDBComboBox
      Left = 387
      Top = 13
      Width = 60
      Height = 21
      DataField = 'MES'
      DataSource = CMWeb.DSCadIndDesempenho
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
      TabOrder = 1
    end
    object CBAno: TDBComboBox
      Left = 482
      Top = 12
      Width = 60
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ANO'
      DataSource = CMWeb.DSCadIndDesempenho
      Items.Strings = (
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020'
        '2021'
        '2022'
        '2023'
        '2024'
        '2025'
        '2026'
        '2027'
        '2028'
        '2029'
        '2030')
      TabOrder = 2
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 414
    Top = 260
  end
  inherited TimerLetreiro: TTimer
    Left = 496
    Top = 260
  end
  inherited TimerAlertas: TTimer
    Left = 456
    Top = 260
  end
end

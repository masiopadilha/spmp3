inherited FrmTelaCadIndDesempenho: TFrmTelaCadIndDesempenho
  Caption = 'Indicadores de Desempenho'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
    inherited LAlteracao: TLabel
      Visible = False
    end
    inherited LAlteradoPor: TLabel
      Visible = False
    end
    inherited LblDataAlt: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblDataCad: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblUsuAlt: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblUsuCad: TDBText
      DataField = ''
      Visible = False
    end
    inherited LCadastro: TLabel
      Visible = False
    end
    inherited LCadastroPor: TLabel
      Visible = False
    end
  end
  inherited PCentro: TPanel
    Width = 780
    Height = 248
    object LblGravAcidMenM: TDBText
      Left = 223
      Top = 206
      Width = 114
      Height = 16
      AutoSize = True
      DataField = 'GRAVACIDMEC'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 26
      Top = 206
      Width = 190
      Height = 16
      Caption = 'Coefic. de Grav. de Acid. Mensal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblFreqAcidMenM: TDBText
      Left = 223
      Top = 187
      Width = 112
      Height = 16
      AutoSize = True
      DataField = 'FREQACIDMEC'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 26
      Top = 187
      Width = 190
      Height = 16
      Caption = 'Coefic. de Freq. de Acid. Mensal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblHorasExtrasM: TDBText
      Left = 223
      Top = 168
      Width = 108
      Height = 16
      AutoSize = True
      DataField = 'HORAEXTRAMEC'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 61
      Top = 168
      Width = 155
      Height = 16
      Caption = '% de Horas Extras Mensal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblDispEquip: TDBText
      Left = 248
      Top = 110
      Width = 82
      Height = 13
      DataField = 'DISPEQUIP'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 20
      Top = 110
      Width = 224
      Height = 16
      Alignment = taRightJustify
      Caption = 'Disponibilidade dos Equipamentos (%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 223
      Top = 146
      Width = 53
      Height = 16
      Caption = 'Mec'#226'nica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 327
      Top = 146
      Width = 42
      Height = 16
      Caption = 'El'#233'trica'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 429
      Top = 146
      Width = 23
      Height = 16
      Caption = 'C'#237'vil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 519
      Top = 146
      Width = 80
      Height = 16
      Caption = 'Ap'#243'io T'#233'cnico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblHorasExtrasE: TDBText
      Left = 327
      Top = 168
      Width = 104
      Height = 16
      AutoSize = True
      DataField = 'HORAEXTRAELE'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblFreqAcidMenE: TDBText
      Left = 327
      Top = 187
      Width = 108
      Height = 16
      AutoSize = True
      DataField = 'FREQACIDELE'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblGravAcidMenE: TDBText
      Left = 327
      Top = 206
      Width = 110
      Height = 16
      AutoSize = True
      DataField = 'GRAVACIDELE'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblHorasExtrasC: TDBText
      Left = 429
      Top = 168
      Width = 105
      Height = 16
      AutoSize = True
      DataField = 'HORAEXTRACIV'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblHorasExtrasA: TDBText
      Left = 519
      Top = 168
      Width = 107
      Height = 16
      AutoSize = True
      DataField = 'HORAEXTRAAPTEC'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblFreqAcidMenC: TDBText
      Left = 429
      Top = 187
      Width = 109
      Height = 16
      AutoSize = True
      DataField = 'FREQACIDCIV'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblFreqAcidMenA: TDBText
      Left = 519
      Top = 187
      Width = 111
      Height = 16
      AutoSize = True
      DataField = 'FREQACIDAPTEC'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblGravAcidMenC: TDBText
      Left = 429
      Top = 206
      Width = 111
      Height = 16
      AutoSize = True
      DataField = 'GRAVACIDCIV'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblGravAcidMenA: TDBText
      Left = 519
      Top = 206
      Width = 113
      Height = 16
      AutoSize = True
      DataField = 'GRAVACIDAPTEC'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 402
      Top = 11
      Width = 31
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 511
      Top = 11
      Width = 31
      Height = 16
      Caption = 'Ano:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 35
      Top = 51
      Width = 156
      Height = 16
      Alignment = taRightJustify
      Caption = 'Manuten'#231#227'o Corretiva (%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblManutCorret: TDBText
      Left = 195
      Top = 51
      Width = 101
      Height = 16
      AutoSize = True
      DataField = 'MANUTCORRET'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 28
      Top = 72
      Width = 163
      Height = 16
      Alignment = taRightJustify
      Caption = 'Manuten'#231#227'o Preventiva (%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblManutPrev: TDBText
      Left = 195
      Top = 72
      Width = 89
      Height = 16
      AutoSize = True
      DataField = 'MANUTPREV'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 311
      Top = 51
      Width = 153
      Height = 16
      Alignment = taRightJustify
      Caption = 'Manuten'#231#227'o Preditiva (%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LblManutPred: TDBText
      Left = 468
      Top = 51
      Width = 89
      Height = 16
      AutoSize = True
      DataField = 'MANUTPRED'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 343
      Top = 72
      Width = 121
      Height = 16
      Alignment = taRightJustify
      Caption = 'Outros Servi'#231'os (%):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object LblOutros: TDBText
      Left = 468
      Top = 72
      Width = 62
      Height = 16
      AutoSize = True
      DataField = 'OUTROSSERV'
      DataSource = DM.dsIndDesempenho
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CBMes: TDBComboBox
      Left = 437
      Top = 9
      Width = 60
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'MES'
      DataSource = DM.dsIndDesempenho
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
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
    end
    object CBAno: TDBComboBox
      Left = 546
      Top = 9
      Width = 60
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ANO'
      DataSource = DM.dsIndDesempenho
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
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 352
    Width = 784
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
  end
  inherited ActionList1: TActionList
    Left = 450
    Top = 99
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 414
    Top = 260
  end
end

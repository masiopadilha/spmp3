inherited FrmTelaCadInfMensalDiversas: TFrmTelaCadInfMensalDiversas
  Caption = 'Diversas'
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
    object Label44: TLabel
      Left = 64
      Top = 63
      Width = 89
      Height = 32
      Caption = 'Custo total dos estoques:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label36: TLabel
      Left = 195
      Top = 63
      Width = 118
      Height = 32
      Caption = 'Coeficiente de grav. de acidentes:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label43: TLabel
      Left = 325
      Top = 63
      Width = 108
      Height = 32
      Caption = 'Coeficiente de freq. de acidentes:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label41: TLabel
      Left = 64
      Top = 127
      Width = 90
      Height = 32
      Caption = 'Horas extras da unidade:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label42: TLabel
      Left = 195
      Top = 127
      Width = 109
      Height = 32
      Caption = 'Cota'#231#227'o mensal do dolar:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label1: TLabel
      Left = 325
      Top = 144
      Width = 28
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 381
      Top = 144
      Width = 27
      Height = 16
      Caption = 'Ano:'
    end
    object EdtCustoTotal: TDBEdit
      Left = 64
      Top = 97
      Width = 125
      Height = 24
      DataField = 'CUSTOTOTALEST'
      DataSource = DM.dsDespMensalDiversas
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCoefGrav: TDBEdit
      Left = 195
      Top = 97
      Width = 125
      Height = 24
      DataField = 'COEFGRAVACID'
      DataSource = DM.dsDespMensalDiversas
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCoefFreq: TDBEdit
      Left = 325
      Top = 97
      Width = 125
      Height = 24
      DataField = 'COEFFREQACID'
      DataSource = DM.dsDespMensalDiversas
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtHorasNormais: TDBEdit
      Left = 64
      Top = 161
      Width = 125
      Height = 24
      DataField = 'HORASNORMAISTRAB'
      DataSource = DM.dsDespMensalDiversas
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCotDolar: TDBEdit
      Left = 195
      Top = 161
      Width = 125
      Height = 24
      DataField = 'COTACAODOLAR'
      DataSource = DM.dsDespMensalDiversas
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBMes: TDBComboBox
      Left = 325
      Top = 161
      Width = 52
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'MES'
      DataSource = DM.dsDespMensalDiversas
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
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
    end
    object CBAno: TDBComboBox
      Left = 381
      Top = 161
      Width = 69
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ANO'
      DataSource = DM.dsDespMensalDiversas
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
      TabOrder = 6
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
end

inherited FrmTelaCadInfMensalDespesasMensais: TFrmTelaCadInfMensalDespesasMensais
  Caption = 'Despesas Mensais'
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
    object Label10: TLabel
      Left = 217
      Top = 173
      Width = 93
      Height = 16
      Caption = 'Horas extras: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 64
      Top = 51
      Width = 92
      Height = 32
      Caption = 'Recupera'#231#227'o de'#13#10'equipamentos:'
    end
    object Label37: TLabel
      Left = 64
      Top = 123
      Width = 125
      Height = 16
      Caption = 'M'#227'o de obra adm.: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 217
      Top = 123
      Width = 124
      Height = 16
      Caption = 'Materiais diversos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 372
      Top = 123
      Width = 147
      Height = 16
      Caption = 'Utiliza'#231#227'o de recursos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label40: TLabel
      Left = 372
      Top = 173
      Width = 110
      Height = 16
      Caption = 'DESPESA TOTAL: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 66
      Top = 173
      Width = 86
      Height = 16
      Caption = 'Treinamento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblCustoHoraExtra: TDBText
      Left = 217
      Top = 188
      Width = 104
      Height = 16
      AutoSize = True
      DataField = 'DESPCUSTOHE'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblCustoTreinam: TDBText
      Left = 66
      Top = 190
      Width = 96
      Height = 16
      AutoSize = True
      DataField = 'DESPCUSTOTREIN'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespMatDiv: TDBText
      Left = 217
      Top = 138
      Width = 82
      Height = 16
      AutoSize = True
      DataField = 'DESPMATDIVERSOS'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespMObra: TDBText
      Left = 64
      Top = 138
      Width = 82
      Height = 16
      AutoSize = True
      DataField = 'DESPMOBRAADM'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespTotal: TDBText
      Left = 372
      Top = 188
      Width = 73
      Height = 16
      AutoSize = True
      DataField = 'DESPTOTAL'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespUtilRec: TDBText
      Left = 372
      Top = 138
      Width = 83
      Height = 16
      AutoSize = True
      DataField = 'DESPUTILRECURSOS'
      DataSource = DM.dsDespMensalManutencao
    end
    object Label1: TLabel
      Left = 181
      Top = 67
      Width = 28
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 262
      Top = 67
      Width = 27
      Height = 16
      Caption = 'Ano:'
    end
    object EdtRecEquip: TDBEdit
      Left = 64
      Top = 86
      Width = 111
      Height = 24
      DataField = 'DESPRECEQUIP'
      DataSource = DM.dsDespMensalManutencao
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
    end
    object CBMes: TDBComboBox
      Left = 181
      Top = 85
      Width = 75
      Height = 24
      DataField = 'MES'
      DataSource = DM.dsDespMensalManutencao
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
      OnExit = TabNextTab1AfterTabChange
    end
    object CBAno: TDBComboBox
      Left = 262
      Top = 85
      Width = 75
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ANO'
      DataSource = DM.dsDespMensalManutencao
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
  inherited MainMenuPadrao: TMainMenu
    Left = 342
    Top = 244
  end
end

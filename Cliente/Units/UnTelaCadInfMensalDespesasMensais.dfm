inherited FrmTelaCadInfMensalDespesasMensais: TFrmTelaCadInfMensalDespesasMensais
  Caption = 'Despesas Mensais'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
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
    object Label10: TLabel
      Left = 258
      Top = 175
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
      Left = 107
      Top = 80
      Width = 92
      Height = 32
      Caption = 'Recupera'#231#227'o de'#13#10'equipamentos:'
    end
    object Label37: TLabel
      Left = 105
      Top = 125
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
      Left = 258
      Top = 125
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
      Left = 413
      Top = 125
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
      Left = 413
      Top = 175
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
      Left = 107
      Top = 175
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
      Left = 258
      Top = 190
      Width = 104
      Height = 16
      AutoSize = True
      DataField = 'DESPCUSTOHE'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblCustoTreinam: TDBText
      Left = 107
      Top = 192
      Width = 96
      Height = 16
      AutoSize = True
      DataField = 'DESPCUSTOTREIN'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespMatDiv: TDBText
      Left = 258
      Top = 140
      Width = 82
      Height = 16
      AutoSize = True
      DataField = 'DESPMATDIVERSOS'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespMObra: TDBText
      Left = 105
      Top = 140
      Width = 82
      Height = 16
      AutoSize = True
      DataField = 'DESPMOBRAADM'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespTotal: TDBText
      Left = 413
      Top = 190
      Width = 73
      Height = 16
      AutoSize = True
      DataField = 'DESPTOTAL'
      DataSource = DM.dsDespMensalManutencao
    end
    object LblDespUtilRec: TDBText
      Left = 413
      Top = 140
      Width = 83
      Height = 16
      AutoSize = True
      DataField = 'DESPUTILRECURSOS'
      DataSource = DM.dsDespMensalManutencao
    end
    object Label1: TLabel
      Left = 323
      Top = 88
      Width = 28
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 454
      Top = 88
      Width = 27
      Height = 16
      Caption = 'Ano:'
    end
    object EdtRecEquip: TDBEdit
      Left = 207
      Top = 86
      Width = 83
      Height = 24
      DataField = 'DESPRECEQUIP'
      DataSource = DM.dsDespMensalManutencao
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
    end
    object CBMes: TDBComboBox
      Left = 355
      Top = 86
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
      Left = 485
      Top = 86
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
  inherited MainMenuPadrao: TMainMenu
    Left = 342
    Top = 244
  end
end

inherited FrmTelaCadInfMensalProducaoMensal: TFrmTelaCadInfMensalProducaoMensal
  Caption = 'Produ'#231#227'o Mensal'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 494
      Visible = False
    end
    inherited LAlteradoPor: TLabel
      Left = 516
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
      Left = 388
      Visible = False
    end
    inherited LCadastroPor: TLabel
      Left = 350
      Visible = False
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label32: TLabel
      Left = 203
      Top = 60
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object Label29: TLabel
      Left = 184
      Top = 90
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Produto:'
    end
    object Label30: TLabel
      Left = 183
      Top = 121
      Width = 50
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde (t):'
    end
    object Label5: TLabel
      Left = 201
      Top = 151
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = #193'rea:'
    end
    object Label1: TLabel
      Left = 206
      Top = 182
      Width = 28
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 333
      Top = 182
      Width = 27
      Height = 16
      Caption = 'Ano:'
    end
    object CBTipo: TDBComboBox
      Left = 238
      Top = 59
      Width = 125
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPO'
      DataSource = DM.dsDespMensalProdMensal
      Items.Strings = (
        #193'rea'
        'Unidade')
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtProduto: TDBEdit
      Left = 238
      Top = 88
      Width = 230
      Height = 24
      DataField = 'PRODFABRICADO'
      DataSource = DM.dsDespMensalProdMensal
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtQtde: TDBEdit
      Left = 238
      Top = 119
      Width = 125
      Height = 24
      DataField = 'TOTAL'
      DataSource = DM.dsDespMensalProdMensal
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtArea: TDBEdit
      Left = 238
      Top = 150
      Width = 230
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'AREA'
      DataSource = DM.dsDespMensalProdMensal
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnArea: TButton
      Left = 469
      Top = 147
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 4
      OnClick = BtnAreaClick
    end
    object CBMes: TDBComboBox
      Left = 238
      Top = 181
      Width = 75
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'MES'
      DataSource = DM.dsDespMensalProdMensal
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
      Left = 364
      Top = 181
      Width = 75
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ANO'
      DataSource = DM.dsDespMensalProdMensal
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
    Top = 405
    Width = 628
  end
  inherited PAuxiliares: TPanel
    Top = 378
    Width = 624
  end
end

inherited FrmTelaCadInfMensalProducaoMensal: TFrmTelaCadInfMensalProducaoMensal
  Caption = 'Produ'#231#227'o Mensal'
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
    object Label32: TLabel
      Left = 64
      Top = 73
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object Label29: TLabel
      Left = 195
      Top = 73
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Produto:'
    end
    object Label30: TLabel
      Left = 431
      Top = 73
      Width = 50
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtde (t):'
    end
    object Label5: TLabel
      Left = 64
      Top = 119
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = #193'rea:'
    end
    object Label1: TLabel
      Left = 269
      Top = 119
      Width = 28
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 350
      Top = 119
      Width = 27
      Height = 16
      Caption = 'Ano:'
    end
    object CBTipo: TDBComboBox
      Left = 64
      Top = 91
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
      Left = 195
      Top = 91
      Width = 230
      Height = 24
      DataField = 'PRODFABRICADO'
      DataSource = DM.dsDespMensalProdMensal
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtQtde: TDBEdit
      Left = 431
      Top = 91
      Width = 125
      Height = 24
      DataField = 'TOTAL'
      DataSource = DM.dsDespMensalProdMensal
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtArea: TDBEdit
      Left = 64
      Top = 137
      Width = 166
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
      Left = 234
      Top = 135
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
      Left = 269
      Top = 138
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
      Left = 350
      Top = 138
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
    Top = 352
    Width = 784
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
  end
end

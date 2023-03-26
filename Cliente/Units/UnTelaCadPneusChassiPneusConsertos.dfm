inherited FrmTelaCadPneusChassiPneusConsertos: TFrmTelaCadPneusChassiPneusConsertos
  Caption = 'Conserto de Pneus'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LblDataAlt: TDBText
      DataSource = DM.dsPneusChassiPneusConsertos
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsPneusChassiPneusConsertos
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsPneusChassiPneusConsertos
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsPneusChassiPneusConsertos
    end
    inherited BtnNovo: TButton
      Width = 28
      ExplicitWidth = 28
    end
  end
  inherited PCentro: TPanel
    object Label2: TLabel
      Left = 134
      Top = 122
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fornecedor:'
    end
    object Label3: TLabel
      Left = 187
      Top = 61
      Width = 17
      Height = 16
      Alignment = taRightJustify
      Caption = 'ID:'
      FocusControl = EdtID
    end
    object Label4: TLabel
      Left = 171
      Top = 91
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'A'#231#227'o:'
    end
    object Label5: TLabel
      Left = 300
      Top = 91
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'Custo (R$):'
      FocusControl = EdtCusto
    end
    object Label7: TLabel
      Left = 157
      Top = 153
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Servi'#231'o:'
      FocusControl = EdtServico
    end
    object Label8: TLabel
      Left = 169
      Top = 184
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'Envio:'
    end
    object Label9: TLabel
      Left = 317
      Top = 184
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Entrega:'
    end
    object Label10: TLabel
      Left = 126
      Top = 215
      Width = 78
      Height = 16
      Alignment = taRightJustify
      Caption = 'Observacoes:'
    end
    object LblRodagem: TDBText
      Left = 333
      Top = 64
      Width = 70
      Height = 13
      AutoSize = True
      DataField = 'RODAGEM'
      DataSource = DM.dsPneusChassiPneusConsertos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 322
      Top = 63
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
      Left = 467
      Top = 93
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
    object Label12: TLabel
      Left = 467
      Top = 124
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
    object Label1: TLabel
      Left = 467
      Top = 154
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
    object Label13: TLabel
      Left = 307
      Top = 184
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
      Left = 467
      Top = 184
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
    object EdtID: TDBEdit
      Left = 207
      Top = 60
      Width = 85
      Height = 24
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DM.dsPneusChassiPneusConsertos
      ReadOnly = True
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCusto: TDBEdit
      Left = 369
      Top = 91
      Width = 95
      Height = 24
      DataField = 'CUSTO'
      DataSource = DM.dsPneusChassiPneusConsertos
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtServico: TDBEdit
      Left = 208
      Top = 151
      Width = 256
      Height = 24
      DataField = 'SERVICO'
      DataSource = DM.dsPneusChassiPneusConsertos
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtFornecedor: TDBEdit
      Left = 208
      Top = 120
      Width = 227
      Height = 24
      Color = clBtnFace
      DataField = 'FORNECEDOR'
      DataSource = DM.dsPneusChassiPneusConsertos
      ReadOnly = True
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnFornecedor: TButton
      Left = 436
      Top = 117
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnFornecedorClick
    end
    object CBAcao: TDBComboBox
      Left = 208
      Top = 91
      Width = 85
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ACAO'
      DataSource = DM.dsPneusChassiPneusConsertos
      Items.Strings = (
        'Conserto'
        'Recapagem'
        'Descarte')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEnvio: TJvDBDateEdit
      Left = 208
      Top = 182
      Width = 95
      Height = 24
      DataField = 'ENVIO'
      DataSource = DM.dsPneusChassiPneusConsertos
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEntrega: TJvDBDateEdit
      Left = 369
      Top = 182
      Width = 95
      Height = 24
      DataField = 'ENTREGA'
      DataSource = DM.dsPneusChassiPneusConsertos
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object MObservacoes: TDBMemo
      Left = 208
      Top = 213
      Width = 256
      Height = 73
      DataField = 'OBSERVACOES'
      DataSource = DM.dsPneusChassiPneusConsertos
      ScrollBars = ssVertical
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnPneu: TButton
      Left = 293
      Top = 58
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnPneuClick
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 46
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 228
    Top = 10
  end
end

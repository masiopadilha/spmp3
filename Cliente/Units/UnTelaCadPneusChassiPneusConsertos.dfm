inherited FrmTelaCadPneusChassiPneusConsertos: TFrmTelaCadPneusChassiPneusConsertos
  Caption = 'Conserto de Pneus'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 662
      ExplicitLeft = 662
    end
    inherited LAlteradoPor: TLabel
      Left = 684
      ExplicitLeft = 684
    end
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
    inherited BtnNovo1: TButton
      Width = 28
      ExplicitWidth = 28
    end
  end
  inherited PCentro: TPanel
    object Label2: TLabel
      Left = 268
      Top = 70
      Width = 70
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fornecedor:'
    end
    object Label3: TLabel
      Left = 64
      Top = 22
      Width = 17
      Height = 16
      Alignment = taRightJustify
      Caption = 'ID:'
      FocusControl = EdtID
    end
    object Label4: TLabel
      Left = 64
      Top = 69
      Width = 33
      Height = 16
      Alignment = taRightJustify
      Caption = 'A'#231#227'o:'
    end
    object Label5: TLabel
      Left = 155
      Top = 71
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'Custo (R$):'
      FocusControl = EdtCusto
    end
    object Label7: TLabel
      Left = 64
      Top = 116
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'Servi'#231'o:'
      FocusControl = EdtServico
    end
    object Label8: TLabel
      Left = 310
      Top = 116
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'Envio:'
    end
    object Label9: TLabel
      Left = 432
      Top = 116
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Entrega:'
    end
    object Label10: TLabel
      Left = 64
      Top = 162
      Width = 78
      Height = 16
      Alignment = taRightJustify
      Caption = 'Observacoes:'
    end
    object LblRodagem: TDBText
      Left = 203
      Top = 43
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
      Left = 187
      Top = 43
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
      Left = 254
      Top = 92
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
      Left = 529
      Top = 92
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
      Left = 279
      Top = 138
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
      Left = 407
      Top = 138
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
      Left = 527
      Top = 138
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
      Left = 64
      Top = 39
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
      Left = 155
      Top = 88
      Width = 95
      Height = 24
      DataField = 'CUSTO'
      DataSource = DM.dsPneusChassiPneusConsertos
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtServico: TDBEdit
      Left = 64
      Top = 135
      Width = 211
      Height = 24
      DataField = 'SERVICO'
      DataSource = DM.dsPneusChassiPneusConsertos
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtFornecedor: TDBEdit
      Left = 268
      Top = 88
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
      Left = 498
      Top = 88
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
      Left = 64
      Top = 88
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
      Left = 310
      Top = 135
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
      Left = 432
      Top = 135
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
      Left = 64
      Top = 182
      Width = 256
      Height = 53
      DataField = 'OBSERVACOES'
      DataSource = DM.dsPneusChassiPneusConsertos
      ScrollBars = ssVertical
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnPneu: TButton
      Left = 152
      Top = 37
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
  inherited PopupMenuRelat: TPopupMenu
    Left = 228
    Top = 10
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 158
    Top = 4
  end
end

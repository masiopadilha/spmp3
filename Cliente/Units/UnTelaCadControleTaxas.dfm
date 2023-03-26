inherited FrmTelaCadControleTaxas: TFrmTelaCadControleTaxas
  Caption = 'Controle de Taxas'
  ClientHeight = 549
  ClientWidth = 792
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited PControle: TPanel
    Width = 788
    ExplicitWidth = 788
    inherited LCadastro: TLabel
      Left = 499
    end
    inherited LCadastroPor: TLabel
      Left = 461
    end
    inherited LAlteracao: TLabel
      Left = 662
    end
    inherited LAlteradoPor: TLabel
      Left = 640
    end
  end
  inherited PIdentificacao: TPanel
    Width = 788
    ExplicitLeft = -3
    ExplicitWidth = 788
    object Label4: TLabel
      Left = 4
      Top = 26
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Equipamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 376
      Top = 30
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
      Left = 393
      Top = 27
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Renavam:'
    end
    object Label14: TLabel
      Left = 538
      Top = 29
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
    object Label5: TLabel
      Left = 508
      Top = 54
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Chassi:'
    end
    object Label7: TLabel
      Left = 644
      Top = 56
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
    object Label8: TLabel
      Left = 49
      Top = 54
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ano:'
    end
    object Label9: TLabel
      Left = 183
      Top = 54
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo:'
    end
    object Label10: TLabel
      Left = 333
      Top = 55
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Categoria:'
    end
    object Label11: TLabel
      Left = 556
      Top = 28
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Placa:'
    end
    object Label12: TLabel
      Left = 682
      Top = 29
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
    object EdtCodEquipamento: TDBEdit
      Tag = 555
      Left = 76
      Top = 25
      Width = 97
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 345
      Top = 20
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = CMWeb.ImageListBotoes
      TabOrder = 2
    end
    object EdtDescEquipamento: TDBEdit
      Left = 173
      Top = 25
      Width = 170
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'EQUIPAMENTO'
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = FormKeyPress
    end
    object EdtRenavam: TDBEdit
      Left = 446
      Top = 25
      Width = 90
      Height = 21
      DataField = 'NOTIFICACAO'
      TabOrder = 3
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtChassi: TDBEdit
      Left = 547
      Top = 52
      Width = 95
      Height = 21
      DataField = 'NOTIFICACAO'
      TabOrder = 4
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtAnoFab: TDBEdit
      Left = 76
      Top = 52
      Width = 85
      Height = 21
      DataField = 'NOTIFICACAO'
      TabOrder = 5
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtAnoModelo: TDBEdit
      Left = 225
      Top = 52
      Width = 85
      Height = 21
      DataField = 'NOTIFICACAO'
      TabOrder = 6
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtCategoria: TDBEdit
      Left = 388
      Top = 52
      Width = 115
      Height = 21
      DataField = 'NOTIFICACAO'
      TabOrder = 7
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtPlaca: TDBEdit
      Left = 589
      Top = 25
      Width = 90
      Height = 21
      DataField = 'NOTIFICACAO'
      TabOrder = 8
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
  end
  inherited PProgramacao: TPanel
    Width = 788
    ExplicitWidth = 788
  end
  inherited PDiversos: TPanel
    Width = 788
    Height = 188
    ExplicitWidth = 788
    ExplicitHeight = 188
  end
  inherited StatusBar1: TStatusBar
    Top = 530
    Width = 792
    ExplicitTop = 530
    ExplicitWidth = 792
  end
  inherited PAlertas: TPanel
    Top = 514
    Width = 792
    ExplicitTop = 514
    ExplicitWidth = 792
  end
  inherited PBase: TPanel
    Top = 474
    Width = 788
    ExplicitTop = 474
    ExplicitWidth = 788
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 172
    Top = 136
  end
end

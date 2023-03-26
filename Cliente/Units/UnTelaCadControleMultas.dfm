inherited FrmTelaCadControleMultas: TFrmTelaCadControleMultas
  Caption = 'Controle de Multas'
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
      ExplicitLeft = 499
    end
    inherited LCadastroPor: TLabel
      Left = 461
      ExplicitLeft = 461
    end
    inherited LblDataCad: TDBText
      Left = 531
      DataSource = CMWeb.DSCadControleMultas
      ExplicitLeft = 531
    end
    inherited LblUsuCad: TDBText
      Left = 531
      DataSource = CMWeb.DSCadControleMultas
      ExplicitLeft = 531
    end
    inherited LAlteracao: TLabel
      Left = 662
      ExplicitLeft = 662
    end
    inherited LAlteradoPor: TLabel
      Left = 640
      ExplicitLeft = 640
    end
    inherited LblDataAlt: TDBText
      Left = 694
      DataSource = CMWeb.DSCadControleMultas
      ExplicitLeft = 694
    end
    inherited LblUsuAlt: TDBText
      Left = 694
      DataSource = CMWeb.DSCadControleMultas
      ExplicitLeft = 694
    end
    inherited BtnImprimir: TButton
      Visible = False
    end
  end
  inherited PIdentificacao: TPanel
    Width = 788
    Height = 136
    ExplicitWidth = 788
    ExplicitHeight = 136
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
    object Label5: TLabel
      Left = 23
      Top = 54
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motorista:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 376
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
    object Label11: TLabel
      Left = 412
      Top = 26
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data:'
    end
    object Label7: TLabel
      Left = 562
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
    object Label12: TLabel
      Left = 412
      Top = 54
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora:'
    end
    object Label8: TLabel
      Left = 562
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
    object Label9: TLabel
      Left = 593
      Top = 26
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vencimento:'
    end
    object Label10: TLabel
      Left = 775
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
      Left = 595
      Top = 54
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notifica'#231#227'o:'
    end
    object Label14: TLabel
      Left = 775
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
    object Label15: TLabel
      Left = 44
      Top = 81
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local:'
    end
    object Label16: TLabel
      Left = 347
      Top = 83
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
    object Label22: TLabel
      Left = 381
      Top = 81
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pagamento:'
    end
    object Label17: TLabel
      Left = 36
      Top = 109
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motivo:'
    end
    object Label19: TLabel
      Left = 347
      Top = 111
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
    object Label20: TLabel
      Left = 387
      Top = 108
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor (R$):'
    end
    object Label21: TLabel
      Left = 562
      Top = 108
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
    object Label23: TLabel
      Left = 562
      Top = 83
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
    object EdtCodMotorista: TDBEdit
      Tag = 555
      Left = 76
      Top = 52
      Width = 97
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'MATRICULA'
      DataSource = CMWeb.DSCadControleMultas
      ReadOnly = True
      TabOrder = 3
      OnKeyPress = FormKeyPress
    end
    object EdtDescMatricula: TDBEdit
      Left = 173
      Top = 52
      Width = 170
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'FUNCIONARIO'
      DataSource = CMWeb.DSCadControleMultas
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = FormKeyPress
    end
    object BtnMotorista: TButton
      Left = 345
      Top = 48
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = CMWeb.ImageListBotoes
      TabOrder = 5
      OnMouseDown = BtnMotoristaMouseDown
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
      DataSource = CMWeb.DSCadControleMultas
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 173
      Top = 25
      Width = 170
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'EQUIPAMENTO'
      DataSource = CMWeb.DSCadControleMultas
      ReadOnly = True
      TabOrder = 1
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
      OnMouseDown = BtnEquipamentoMouseDown
    end
    object EdtData: TJvDBDateEdit
      Left = 443
      Top = 25
      Width = 115
      Height = 21
      DataField = 'DATANOTIFICCAO'
      DataSource = CMWeb.DSCadControleMultas
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 8
      OnKeyPress = FormKeyPress
    end
    object EdtHorario: TJvDBMaskEdit
      Left = 443
      Top = 52
      Width = 115
      Height = 21
      DataField = 'HORANOTIFICACAO'
      DataSource = CMWeb.DSCadControleMultas
      MaxLength = 8
      TabOrder = 9
      EditMask = '!90:00:00;1;_'
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtVencimento: TJvDBDateEdit
      Left = 656
      Top = 25
      Width = 115
      Height = 21
      DataField = 'DATAVENCIMENTO'
      DataSource = CMWeb.DSCadControleMultas
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 12
      OnKeyPress = FormKeyPress
    end
    object EdtNotificacao: TDBEdit
      Left = 656
      Top = 52
      Width = 115
      Height = 21
      DataField = 'NOTIFICACAO'
      DataSource = CMWeb.DSCadControleMultas
      TabOrder = 13
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtLocal: TDBEdit
      Left = 76
      Top = 79
      Width = 267
      Height = 21
      DataField = 'LOCAL'
      DataSource = CMWeb.DSCadControleMultas
      TabOrder = 6
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object EdtPagamento: TJvDBDateEdit
      Left = 443
      Top = 79
      Width = 115
      Height = 21
      DataField = 'DATAPAGAMENTO'
      DataSource = CMWeb.DSCadControleMultas
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 10
      OnKeyPress = FormKeyPress
    end
    object EdtMotivo: TDBEdit
      Left = 76
      Top = 107
      Width = 267
      Height = 21
      DataField = 'MOTIVO'
      DataSource = CMWeb.DSCadControleMultas
      TabOrder = 7
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
    object ChbResponsavel: TDBCheckBox
      Left = 588
      Top = 79
      Width = 81
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Respons'#225'vel:'
      DataField = 'REPONSAVEL'
      DataSource = CMWeb.DSCadControleMultas
      TabOrder = 14
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object EdtValor: TDBEdit
      Left = 443
      Top = 105
      Width = 115
      Height = 21
      DataField = 'VALOR'
      DataSource = CMWeb.DSCadControleMultas
      MaxLength = 15
      TabOrder = 11
      OnKeyPress = FormKeyPress
      OnMouseMove = PIdentificacaoMouseMove
    end
  end
  inherited PProgramacao: TPanel
    Top = 183
    Width = 788
    Height = 149
    ExplicitTop = 183
    ExplicitWidth = 788
    ExplicitHeight = 149
    inherited Label2: TLabel
      Width = 57
      Caption = 'VERS'#213'ES'
      ExplicitWidth = 57
    end
    object Label30: TLabel
      Left = 4
      Top = 25
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Oficial:'
    end
    object Label24: TLabel
      Left = 396
      Top = 25
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motorista:'
    end
    object MOficial: TDBMemo
      AlignWithMargins = True
      Left = 4
      Top = 41
      Width = 388
      Height = 104
      Margins.Top = 40
      Align = alLeft
      DataField = 'VERSAOOFICIAL'
      DataSource = CMWeb.DSCadControleMultas
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object MMotorista: TDBMemo
      AlignWithMargins = True
      Left = 396
      Top = 41
      Width = 388
      Height = 104
      Margins.Top = 40
      Align = alRight
      DataField = 'VERSAOMOTORISTA'
      DataSource = CMWeb.DSCadControleMultas
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited PDiversos: TPanel
    Top = 336
    Width = 788
    Height = 134
    ExplicitTop = 336
    ExplicitWidth = 788
    ExplicitHeight = 134
    inherited Label3: TLabel
      Width = 69
      Caption = 'HIST'#211'RICO'
      ExplicitWidth = 69
    end
    object GrdHistorico: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 780
      Height = 109
      Margins.Top = 20
      Align = alClient
      Color = 14671839
      DataSource = CMWeb.DSCadControleMultasHist
      DrawingStyle = gdsClassic
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODEQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Equip.'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Caption = 'Equipamento'
          Width = 196
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Alignment = taCenter
          Title.Caption = 'Matr'#237'cula'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTORISTA'
          Title.Caption = 'Motorista'
          Width = 126
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'AUTOINFRACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Notifica'#231#227'o'
          Width = 83
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAINFRACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HORA'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCAL'
          Title.Caption = 'Local'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO'
          Title.Caption = 'Motivo'
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAPAGAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Pagamento'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 70
          Visible = True
        end>
    end
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
    Left = 176
  end
end

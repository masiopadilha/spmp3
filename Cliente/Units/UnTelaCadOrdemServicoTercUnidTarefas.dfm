inherited FrmTelaCadOrdemServicoTercUnidTarefas: TFrmTelaCadOrdemServicoTercUnidTarefas
  Caption = 'Tarefas'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
    ExplicitWidth = 784
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
    ExplicitWidth = 784
    ExplicitHeight = 251
    object Label16: TLabel
      Left = 64
      Top = 76
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'Calend'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 331
      Top = 97
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
    object Label2: TLabel
      Left = 64
      Top = 124
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label4: TLabel
      Left = 351
      Top = 124
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tempo (hs):'
    end
    object Label1: TLabel
      Left = 494
      Top = 124
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
    end
    object Label3: TLabel
      Left = 502
      Top = 149
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fim:'
    end
    object Label5: TLabel
      Left = 351
      Top = 76
      Width = 82
      Height = 16
      Alignment = taRightJustify
      Caption = 'Predecessora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDataFim: TDBText
      Left = 533
      Top = 149
      Width = 65
      Height = 16
      AutoSize = True
      DataField = 'DATAPROGFIN'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtCalendario: TDBEdit
      Left = 64
      Top = 93
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'CALENDARIO'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      OnKeyPress = FormKeyPress
    end
    object BtnCalendario: TButton
      Left = 298
      Top = 91
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 1
      OnClick = BtnCalendarioClick
    end
    object EdtDescricao: TDBEdit
      Left = 64
      Top = 142
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      TabOrder = 4
      OnKeyPress = FormKeyPress
    end
    object EdtTempo: TDBEdit
      Left = 351
      Top = 142
      Width = 125
      Height = 24
      DataField = 'TEMPOPREVISTO'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      TabOrder = 5
      OnExit = EdtTempoExit
      OnKeyPress = FormKeyPress
    end
    object EdtInicio: TJvDBMaskEdit
      Left = 533
      Top = 120
      Width = 125
      Height = 24
      DataField = 'DATAPROGINI'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      MaxLength = 16
      TabOrder = 6
      EditMask = '!99/99/0000 !90:00;1;'
      OnExit = EdtTempoExit
    end
    object EdtPredecessora: TDBEdit
      Left = 351
      Top = 93
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'PREDECESSORA'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = FormKeyPress
    end
    object BtnPredecessora: TButton
      Left = 585
      Top = 91
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 3
      OnClick = BtnPredecessoraClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 352
    Width = 784
    ExplicitTop = 355
    ExplicitWidth = 788
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
    ExplicitTop = 328
    ExplicitWidth = 784
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 382
    Top = 52
  end
end

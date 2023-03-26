inherited FrmTelaCadOrdemServicoTercUnidTarefas: TFrmTelaCadOrdemServicoTercUnidTarefas
  Caption = 'Tarefas'
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
    object Label16: TLabel
      Left = 168
      Top = 62
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
      Left = 499
      Top = 64
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
      Left = 174
      Top = 124
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label4: TLabel
      Left = 162
      Top = 155
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tempo (hs):'
    end
    object Label1: TLabel
      Left = 199
      Top = 186
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
    end
    object Label3: TLabel
      Left = 207
      Top = 217
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fim:'
    end
    object Label5: TLabel
      Left = 152
      Top = 93
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
      Left = 238
      Top = 217
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
      Left = 238
      Top = 60
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
      Left = 469
      Top = 57
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
      Left = 238
      Top = 122
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      TabOrder = 4
      OnKeyPress = FormKeyPress
    end
    object EdtTempo: TDBEdit
      Left = 238
      Top = 153
      Width = 125
      Height = 24
      DataField = 'TEMPOPREVISTO'
      DataSource = DM.dsOrdemServicoTercUnidTarefas
      TabOrder = 5
      OnExit = EdtTempoExit
      OnKeyPress = FormKeyPress
    end
    object EdtInicio: TJvDBMaskEdit
      Left = 238
      Top = 184
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
      Left = 238
      Top = 91
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
      Left = 469
      Top = 89
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
  inherited MainMenuPadrao: TMainMenu
    Left = 422
    Top = 140
  end
end

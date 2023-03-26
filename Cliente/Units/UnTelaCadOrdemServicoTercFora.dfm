inherited FrmTelaCadOrdemServicoTercFora: TFrmTelaCadOrdemServicoTercFora
  Caption = 'Servi'#231'os Terceirizados fora da Unidade'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LCadastro: TLabel
      Left = 691
      ExplicitLeft = 691
    end
    inherited LCadastroPor: TLabel
      Left = 647
      ExplicitLeft = 647
    end
    inherited LblDataCad: TDBText
      Left = 733
      DataSource = DM.dsOrdemServicoTercFora
      ExplicitLeft = 733
    end
    inherited LblUsuCad: TDBText
      Left = 733
      DataSource = DM.dsOrdemServicoTercFora
      ExplicitLeft = 733
    end
    inherited LAlteracao: TLabel
      Left = 853
      ExplicitLeft = 853
    end
    inherited LAlteradoPor: TLabel
      Left = 827
      ExplicitLeft = 827
    end
    inherited LblDataAlt: TDBText
      Left = 895
      DataSource = DM.dsOrdemServicoTercFora
      ExplicitLeft = 895
    end
    inherited LblUsuAlt: TDBText
      Left = 895
      DataSource = DM.dsOrdemServicoTercFora
      ExplicitLeft = 895
    end
  end
  inherited PIdentificacao: TPanel
    object Label4: TLabel
      Left = 91
      Top = 31
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'O.S.:'
    end
    object Label19: TLabel
      Left = 490
      Top = 34
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
      Left = 45
      Top = 62
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label20: TLabel
      Left = 516
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
    object Label11: TLabel
      Left = 566
      Top = 62
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
    end
    object Label6: TLabel
      Left = 796
      Top = 62
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'Fim:'
    end
    object Label12: TLabel
      Left = 769
      Top = 62
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
      Left = 991
      Top = 62
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
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODIGO'
      DataSource = DM.dsOrdemServicoTercFora
      ReadOnly = True
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsOrdemServicoTercFora
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodEquipamento: TDBEdit
      Tag = 555
      Left = 127
      Top = 60
      Width = 125
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      DataSource = DM.dsOrdemServicoTercFora
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 254
      Top = 60
      Width = 230
      Height = 24
      Hint = 'Consultar/Cadastrar (Ctrl)'
      Color = clBtnFace
      Ctl3D = True
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsOrdemServicoTercFora
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 485
      Top = 57
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 4
      OnClick = BtnEquipamentoClick
    end
    object ChbContrato: TDBCheckBox
      Left = 542
      Top = 32
      Width = 79
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Contrato:'
      DataField = 'CONTRATO'
      DataSource = DM.dsOrdemServicoTercFora
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object ChbPedido: TDBCheckBox
      Left = 778
      Top = 32
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Pedido:'
      DataField = 'PEDIDO'
      DataSource = DM.dsOrdemServicoTercFora
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtContrato: TDBEdit
      Left = 625
      Top = 29
      Width = 140
      Height = 24
      DataField = 'NUMCONTRATO'
      DataSource = DM.dsOrdemServicoTercFora
      TabOrder = 6
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtPedido: TDBEdit
      Left = 847
      Top = 29
      Width = 140
      Height = 24
      DataField = 'NUMPEDIDO'
      DataSource = DM.dsOrdemServicoTercFora
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
    end
    object EdtDataContratoIni: TJvDBDateEdit
      Left = 606
      Top = 60
      Width = 160
      Height = 24
      DataField = 'DATACONTRATOINI'
      DataSource = DM.dsOrdemServicoTercFora
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDataContratoFin: TJvDBDateEdit
      Left = 827
      Top = 60
      Width = 160
      Height = 24
      DataField = 'DATACONTRATOFIN'
      DataSource = DM.dsOrdemServicoTercFora
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PProgramacao: TPanel
    Height = 391
    ExplicitHeight = 391
    inherited Label2: TLabel
      Width = 194
      Caption = 'SERVI'#199'OS A EXECUTAR'
      ExplicitWidth = 194
    end
    object Label8: TLabel
      Left = 17
      Top = 30
      Width = 105
      Height = 16
      Caption = 'Or'#231'amento Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LblTotalOI: TDBText
      Left = 126
      Top = 31
      Width = 64
      Height = 16
      AutoSize = True
      DataField = 'S_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 508
      Top = 30
      Width = 156
      Height = 16
      Caption = 'Or'#231'amento Complementar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LblTotalOC: TDBText
      Left = 672
      Top = 31
      Width = 67
      Height = 16
      AutoSize = True
      DataField = 'S_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 17
      Top = 208
      Width = 103
      Height = 16
      Caption = 'Outras Empresas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LblTotalOE: TDBText
      Left = 126
      Top = 208
      Width = 66
      Height = 16
      AutoSize = True
      DataField = 'S_TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 508
      Top = 212
      Width = 49
      Height = 16
      Caption = 'Aditivos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object GrdOI: TDBGrid
      Left = 17
      Top = 48
      Width = 480
      Height = 150
      DataSource = DM.dsOrdemServicoTercForaOI
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnExit = TabNextTab1AfterTabChange
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUMERO'
          Title.Alignment = taCenter
          Title.Caption = 'N'#250'mero'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Servi'#231'o'
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total (R$)'
          Width = 71
          Visible = True
        end>
    end
    object GrdAditivos: TDBGrid
      Left = 508
      Top = 231
      Width = 252
      Height = 145
      DataSource = DM.dsOrdemServicoTercForaAditivos
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnExit = TabNextTab1AfterTabChange
      Columns = <
        item
          Expanded = False
          FieldName = 'NOVADATAFIN'
          Title.Alignment = taCenter
          Title.Caption = 'Fim'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOVOVALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 61
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOVONUMPARCELAS'
          Title.Alignment = taCenter
          Title.Caption = 'Parcelas'
          Width = 49
          Visible = True
        end>
    end
    object GrdOC: TDBGrid
      Left = 508
      Top = 48
      Width = 480
      Height = 150
      DataSource = DM.dsOrdemServicoTercForaOC
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnExit = TabNextTab1AfterTabChange
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUMERO'
          Title.Alignment = taCenter
          Title.Caption = 'N'#250'mero'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Servi'#231'o'
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total (R$)'
          Width = 71
          Visible = True
        end>
    end
    object GrdOE: TDBGrid
      Left = 17
      Top = 226
      Width = 480
      Height = 150
      DataSource = DM.dsOrdemServicoTercForaOE
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnExit = TabNextTab1AfterTabChange
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUMERO'
          Title.Alignment = taCenter
          Title.Caption = 'N'#250'mero'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Servi'#231'o'
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Total (R$)'
          Width = 71
          Visible = True
        end>
    end
    object MMotivo: TDBMemo
      Left = 762
      Top = 231
      Width = 226
      Height = 144
      DataField = 'MOTIVO'
      DataSource = DM.dsOrdemServicoTercForaAditivos
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited PDiversos: TPanel
    Width = 300
    Height = 0
    Align = alNone
    ExplicitWidth = 300
    ExplicitHeight = 0
  end
  inherited TimerLetreiro: TTimer
    Left = 442
  end
  inherited TimerAlertas: TTimer
    Left = 362
  end
  inherited ActionList1: TActionList
    Left = 418
    Top = 43
  end
  object PopupMenuCons: TPopupMenu
    Left = 410
    Top = 91
    object Codigo1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Codigo1Click
    end
    object Descricao1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = Descricao1Click
    end
  end
end

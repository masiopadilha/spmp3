inherited FrmTelaCadOrdemServicoHistorico: TFrmTelaCadOrdemServicoHistorico
  Caption = 'Hist'#243'rico de Ordens de Servi'#231'o'
  ClientHeight = 644
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1004
    object Label1: TLabel [1]
      Left = 295
      Top = 36
      Width = 7
      Height = 16
      Caption = 'a'
    end
    object Label2: TLabel [2]
      Left = 202
      Top = 15
      Width = 56
      Height = 16
      Caption = 'Cadastro:'
    end
    inherited BtnAjuda: TButton
      Left = 971
      ExplicitLeft = 967
    end
    object EdtData1: TDateTimePicker
      Left = 201
      Top = 33
      Width = 90
      Height = 21
      Date = 44778.000000000000000000
      Time = 0.494387384256697300
      TabOrder = 1
    end
    object EdtData2: TDateTimePicker
      Left = 306
      Top = 33
      Width = 90
      Height = 21
      Date = 44778.000000000000000000
      Time = 0.494387384256697300
      TabOrder = 2
    end
    object BtnConsultar: TButton
      Left = 520
      Top = 30
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnConsultarClick
    end
    object BtnImprimir: TButton
      Left = 937
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnImprimirClick
    end
    object LEdtServico: TLabeledEdit
      Left = 558
      Top = 33
      Width = 200
      Height = 24
      Hint = 'Tecle ENTER para aplicar o filtro.'
      EditLabel.Width = 47
      EditLabel.Height = 16
      EditLabel.Caption = 'Servi'#231'o:'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Text = ''
      OnKeyPress = LEdtServicoKeyPress
    end
    object CBSituacao: TComboBox
      Left = 398
      Top = 33
      Width = 119
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 4
      TabOrder = 6
      Text = 'Fechadas'
      Items.Strings = (
        'N'#227'o Programadas'
        'Programadas'
        'Em Execu'#231#227'o'
        'Liberadas'
        'Fechadas'
        'Paralisadas'
        'Solic. Trabalho'
        'Rotas'
        'Todas'
        'Canceladas'
        'Vencidas')
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 505
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Width = 1004
      Height = 503
      ExplicitWidth = 1000
      ExplicitHeight = 500
    end
    object GrdConsulta: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 497
      Hint = 'D'#234' duplo-clique para visualizar a O.S.'
      Align = alClient
      Color = 14671839
      DataSource = DM.dsOrdemServicoHistorico
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdConsultaDblClick
      OnKeyPress = GrdConsultaKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATACADASTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Cadastro'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SOLICITANTE'
          Title.Caption = 'Solicitante'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 175
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Caption = 'Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 209
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AREA'
          Title.Caption = #193'rea'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANUTENCAO'
          Title.Caption = 'Manuten'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVOPARADA'
          Title.Caption = 'Parada'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CENTROCUSTO'
          Title.Caption = 'Centro de Custo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 137
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SITUACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Situa'#231#227'o'
          Width = 118
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 577
    Width = 1008
    ExplicitTop = 574
    ExplicitWidth = 1004
  end
  inherited PBotoes: TPanel
    Top = 604
    Width = 1008
    ExplicitTop = 601
    ExplicitWidth = 1004
    inherited BtnOK: TButton
      Left = 177
      Visible = False
      ExplicitLeft = 177
    end
    inherited BtnFechar: TButton
      Left = 466
      ExplicitLeft = 466
    end
  end
  object PopupMenuRelat: TPopupMenu
    Left = 922
    Top = 100
    object Relatorio: TMenuItem
      Caption = 'Relat'#243'rio'
      OnClick = RelatorioClick
    end
    object Consultar: TMenuItem
      Caption = 'Resumo'
      OnClick = ConsultarClick
    end
  end
  object CDResumoConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 659
    Top = 107
    object CDResumoConsultaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '#000000'
    end
    object CDResumoConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object CDResumoConsultaAREA: TStringField
      FieldName = 'AREA'
      Size = 80
    end
    object CDResumoConsultaCELULA: TStringField
      FieldName = 'CELULA'
      Size = 80
    end
    object CDResumoConsultaMANUTENCAO: TStringField
      FieldName = 'MANUTENCAO'
      Size = 80
    end
    object CDResumoConsultaMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 80
    end
    object CDResumoConsultaOFICINA: TStringField
      FieldName = 'OFICINA'
      Size = 80
    end
    object CDResumoConsultaCENTROCUSTO: TStringField
      FieldName = 'CENTROCUSTO'
      Size = 80
    end
    object CDResumoConsultaCODEQUIPAMENTO: TStringField
      FieldName = 'CODEQUIPAMENTO'
    end
    object CDResumoConsultaEQUIPAMENTO: TStringField
      FieldName = 'EQUIPAMENTO'
      Size = 200
    end
    object CDResumoConsultaDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object CDResumoConsultaDATAINICIOREAL: TDateTimeField
      FieldName = 'DATAINICIOREAL'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object CDResumoConsultaDATAFIMREAL: TDateTimeField
      FieldName = 'DATAFIMREAL'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object CDResumoConsultaCADASTRO: TStringField
      FieldName = 'CADASTRO'
      Size = 80
    end
    object CDResumoConsultaSITUACAO: TStringField
      FieldName = 'SITUACAO'
    end
    object CDResumoConsultaSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 200
    end
    object CDResumoConsultaTOTALOS: TIntegerField
      FieldName = 'TOTALOS'
      DisplayFormat = '00'
    end
  end
end

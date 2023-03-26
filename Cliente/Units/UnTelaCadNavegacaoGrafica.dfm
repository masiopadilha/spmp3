inherited FrmTelaCadNavegacaoGrafica: TFrmTelaCadNavegacaoGrafica
  Caption = 'Navega'#231#227'o Gr'#225'fica'
  ClientHeight = 641
  ClientWidth = 664
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 680
  Constraints.MinHeight = 680
  Constraints.MinWidth = 680
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 680
  ExplicitHeight = 680
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 660
    ExplicitWidth = 660
    inherited BtnAjuda: TButton
      Left = 625
      ExplicitLeft = 625
    end
  end
  inherited PCentro: TPanel
    Width = 658
    Height = 502
    ExplicitWidth = 658
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Width = 656
      Height = 500
      TabOrder = 3
      ExplicitWidth = 656
      ExplicitHeight = 500
    end
    object PLista: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 650
      Height = 494
      Align = alClient
      BevelInner = bvLowered
      Color = 14671839
      ParentBackground = False
      TabOrder = 4
      object TVArvore: TJvTreeView
        Left = 2
        Top = 2
        Width = 646
        Height = 490
        Align = alClient
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Indent = 19
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        OnDblClick = TVArvoreDblClick
        LineColor = clBlack
      end
    end
    object EdtConsulta: TEdit
      Left = 4
      Top = 5
      Width = 587
      Height = 24
      Hint = 'Informe a descri'#231#227'o'
      TabStop = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Visible = False
    end
    object BtnConsultar: TButton
      Left = 592
      Top = 4
      Width = 62
      Height = 0
      Caption = 'Consultar'
      TabOrder = 2
      TabStop = False
      OnClick = BtnConsultarClick
    end
    object CBTipo: TComboBox
      Left = 511
      Top = 5
      Width = 80
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 1
      Text = 'Individual'
      Visible = False
      OnChange = CBTipoChange
      Items.Strings = (
        'Individual'
        #193'rea')
    end
    object BtnConsultar1: TButton
      Left = 592
      Top = 4
      Width = 64
      Height = 25
      Caption = 'Consultar'
      TabOrder = 5
      TabStop = False
      Visible = False
      OnClick = BtnConsultar1Click
    end
  end
  inherited PAuxiliares: TPanel
    Top = 574
    Width = 660
    ExplicitTop = 574
    ExplicitWidth = 660
  end
  inherited PBotoes: TPanel
    Top = 601
    Width = 660
    ExplicitTop = 601
    ExplicitWidth = 660
    inherited BtnOK: TButton
      Left = 86
      Visible = False
      ExplicitLeft = 86
    end
    inherited BtnFechar: TButton
      Left = 294
      ExplicitLeft = 294
    end
  end
  object CDArvore: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 223
    Top = 18
    object CDArvoreCODIGO: TWideStringField
      FieldName = 'CODIGO'
    end
    object CDArvoreCODEMPRESA: TWideStringField
      FieldName = 'CODEMPRESA'
      Size = 9
    end
    object CDArvoreDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object CDArvoreCODPAI: TWideStringField
      FieldName = 'CODPAI'
    end
    object CDArvoreDESCPAI: TWideStringField
      FieldName = 'DESCPAI'
      Size = 200
    end
  end
  object FDMemTPrim: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 327
    Top = 250
    object FDMemTPrimCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDMemTPrimCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTPrimCODLOCALIZACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLOCALIZACAO'
      Origin = 'CODLOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTPrimCODCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCELULA'
      Origin = 'CODCELULA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTPrimCODLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLINHA'
      Origin = 'CODLINHA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTPrimSEQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTPrimCODEQUIPAMENTOPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTOPAI'
      Origin = 'CODEQUIPAMENTOPAI'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTPrimDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTPrimSECUNDARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SECUNDARIO'
      Origin = 'SECUNDARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTPrim
    Left = 399
    Top = 250
  end
  object FDMemTSec: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 327
    Top = 306
    object FDMemTSecCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDMemTSecCODEMPRESA: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object FDMemTSecCODLOCALIZACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLOCALIZACAO'
      Origin = 'CODLOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTSecCODCELULA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCELULA'
      Origin = 'CODCELULA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTSecCODLINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLINHA'
      Origin = 'CODLINHA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object FDMemTSecSEQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTSecDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object FDMemTSecSECUNDARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SECUNDARIO'
      Origin = 'SECUNDARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object FDMemTSecCODEQUIPAMENTOPAI: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTOPAI'
      Origin = 'CODEQUIPAMENTOPAI'
      ProviderFlags = [pfInUpdate]
    end
    object FDMemTSecDESCEQUIPAMENTOPAI: TStringField
      FieldName = 'DESCEQUIPAMENTOPAI'
      Size = 200
    end
  end
  object DataSource2: TDataSource
    DataSet = FDMemTSec
    Left = 399
    Top = 306
  end
  object FDMemTSecPrim: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 327
    Top = 370
    object StringField1: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'CODEMPRESA'
      Origin = 'CODEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 9
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLOCALIZACAO'
      Origin = 'CODLOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODCELULA'
      Origin = 'CODCELULA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODLINHA'
      Origin = 'CODLINHA'
      ProviderFlags = [pfInUpdate]
      Size = 9
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate]
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SECUNDARIO'
      Origin = 'SECUNDARIO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODEQUIPAMENTOPAI'
      Origin = 'CODEQUIPAMENTOPAI'
      ProviderFlags = [pfInUpdate]
    end
    object StringField9: TStringField
      FieldName = 'DESCEQUIPAMENTOPAI'
      Size = 200
    end
  end
  object DataSource3: TDataSource
    DataSet = FDMemTSecPrim
    Left = 399
    Top = 370
  end
end

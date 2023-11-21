inherited FrmTelaParadasDiarias: TFrmTelaParadasDiarias
  Caption = 'Paradas dos Equipamento'
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
    inherited BtnAjuda: TButton
      Left = 973
      ExplicitLeft = 973
    end
    object BtnConsultar: TButton
      Left = 942
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Exportar para planilha'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 102
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnConsultarClick
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
    object PAguarde: TPanel
      Left = 286
      Top = 168
      Width = 185
      Height = 41
      BevelOuter = bvNone
      Caption = 'Aguarde...'
      Color = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object GrdParadas: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 497
      Align = alClient
      DataSource = DSDados
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawDataCell = GrdParadasDrawDataCell
      OnDrawColumnCell = GrdParadasDrawColumnCell
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
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 464
      ExplicitLeft = 464
    end
  end
  object JvDBGridExcelExport1: TJvDBGridExcelExport
    Caption = 'Exporting to MS Excel...'
    Grid = GrdParadas
    FileName = 'C:\SPMP3\Paradas di'#225'rias.xlsx'
    AutoFit = True
    Left = 555
    Top = 291
  end
  object CDDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 323
    Top = 147
    object CDDadosCODIGO: TStringField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'CODIGO'
    end
    object CDDadosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object CDDadosField01: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '01'
      Size = 1
    end
    object CDDadosField02: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '02'
      Size = 1
    end
    object CDDadosField03: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '03'
      Size = 1
    end
    object CDDadosField04: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '04'
      Size = 1
    end
    object CDDadosField05: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '05'
      Size = 1
    end
    object CDDadosField06: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '06'
      Size = 1
    end
    object CDDadosField07: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '07'
      Size = 1
    end
    object CDDadosField08: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '08'
      Size = 1
    end
    object CDDadosField09: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '09'
      Size = 1
    end
    object CDDadosField10: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '10'
      Size = 1
    end
    object CDDadosField11: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '11'
      Size = 1
    end
    object CDDadosField12: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '12'
      Size = 1
    end
    object CDDadosField13: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '13'
      Size = 1
    end
    object CDDadosField14: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '14'
      Size = 1
    end
    object CDDadosField15: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '15'
      Size = 1
    end
    object CDDadosField16: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '16'
      Size = 1
    end
    object CDDadosField17: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '17'
      Size = 1
    end
    object CDDadosField18: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '18'
      Size = 1
    end
    object CDDadosField19: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '19'
      Size = 1
    end
    object CDDadosField20: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '20'
      Size = 1
    end
    object CDDadosField21: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '21'
      Size = 1
    end
    object CDDadosField22: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '22'
      Size = 1
    end
    object CDDadosField23: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '23'
      Size = 1
    end
    object CDDadosField24: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '24'
      Size = 1
    end
    object CDDadosField25: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '25'
      Size = 1
    end
    object CDDadosField26: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '26'
      Size = 1
    end
    object CDDadosField27: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '27'
      Size = 1
    end
    object CDDadosField28: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '28'
      Size = 1
    end
    object CDDadosField29: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '29'
      Size = 1
    end
    object CDDadosField30: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '30'
      Size = 1
    end
    object CDDadosField31: TStringField
      Alignment = taCenter
      DisplayWidth = 4
      FieldName = '31'
      Size = 1
    end
  end
  object DSDados: TDataSource
    DataSet = CDDados
    Left = 371
    Top = 147
  end
  object JvDBGridXMLExport1: TJvDBGridXMLExport
    Caption = 'Exporting to XML/Text...'
    Grid = GrdParadas
    FileName = 'C:\SPMP3\XML.xml'
    Left = 595
    Top = 211
  end
  object JvDBGridCSVExport1: TJvDBGridCSVExport
    Caption = 'Exporting to CSV/Text...'
    Grid = GrdParadas
    FileName = 'C:\SPMP3\CSV.csv'
    Left = 611
    Top = 139
  end
end

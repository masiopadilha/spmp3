inherited FrmTelaCadRotaProgEquip: TFrmTelaCadRotaProgEquip
  Caption = 'Rotas de Manuten'#231#227'o'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LblDataCad: TDBText
      DataSource = DM.dsRotas
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsRotas
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsRotas
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsRotas
    end
  end
  inherited PIdentificacao: TPanel
    Height = 65
    ExplicitHeight = 65
    object Label4: TLabel
      Left = 96
      Top = 32
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 490
      Top = 35
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
    object EdtCodRota: TDBEdit
      Tag = 555
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsRotas
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodRotaExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 254
      Top = 30
      Width = 230
      Height = 24
      Ctl3D = True
      DataField = 'DESCRICAO'
      DataSource = DM.dsRotas
      ParentCtl3D = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PProgramacao: TPanel
    Top = 120
    Height = 65
    ExplicitTop = 120
    ExplicitHeight = 65
    inherited Label2: TLabel
      Width = 132
      Caption = 'PROGRAMA'#199#195'O'
      ExplicitWidth = 132
    end
    object Label8: TLabel
      Left = 99
      Top = 32
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dias:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 257
      Top = 35
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
      Left = 287
      Top = 32
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'In'#237'cio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 508
      Top = 32
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Reprogramar:'
    end
    object Label19: TLabel
      Left = 743
      Top = 32
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
    object EdtDias: TDBEdit
      Left = 127
      Top = 30
      Width = 125
      Height = 24
      DataField = 'FREQUENCIA'
      DataSource = DM.dsRotas
      MaxLength = 5
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtInicio: TJvDBDateEdit
      Left = 320
      Top = 30
      Width = 125
      Height = 24
      DataField = 'DATAINICIO'
      DataSource = DM.dsRotas
      ButtonWidth = 27
      ShowNullDate = False
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
    object CBReprogramacao: TDBComboBox
      Left = 593
      Top = 30
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'REPROGRAMAR'
      DataSource = DM.dsRotas
      Items.Strings = (
        'Programa'#231#227'o'
        'Execu'#231#227'o')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  inherited PDiversos: TPanel
    Top = 189
    Height = 353
    ExplicitTop = 189
    ExplicitHeight = 353
    object GrdSequencia: TDBGrid
      Left = 1
      Top = 1
      Width = 1002
      Height = 192
      Align = alTop
      DataSource = DM.dsRotasSequencia
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      StyleElements = [seFont]
      OnDblClick = GrdSequenciaDblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = GrdSequenciaKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'AREA'
          ReadOnly = True
          Title.Caption = #193'rea'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 231
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULA'
          ReadOnly = True
          Title.Caption = 'C'#233'lula'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 197
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINHA'
          ReadOnly = True
          Title.Caption = 'Linha'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'EQUIPATUAL'
          ReadOnly = True
          Title.Caption = 'Equipamento Atual'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 383
          Visible = True
        end>
    end
    object GrdInspecoes: TDBGrid
      Left = 1
      Top = 194
      Width = 296
      Height = 157
      Color = 14671839
      DataSource = DM.dsRotasSequenciaInsp
      DrawingStyle = gdsClassic
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      StyleElements = [seFont]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Inspe'#231#227'o'
          Width = 189
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 299
      Top = 194
      Width = 704
      Height = 157
      Color = 14671839
      DataSource = DM.dsRotasSequenciaInspItens
      DrawingStyle = gdsClassic
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      StyleElements = [seFont]
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCPARTE'
          Title.Caption = 'Parte'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM'
          Title.Caption = 'Item'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCINSPECAO'
          Title.Caption = 'Inspe'#231#227'o'
          Width = 254
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EQUIPPARADO'
          Title.Alignment = taCenter
          Title.Caption = 'Parado'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEMPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Width = 56
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EXECAUTONOMO'
          Title.Caption = 'Aut'#244'nomo'
          Visible = True
        end>
    end
  end
  object CDValidaEquip: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 514
    Top = 245
    object CDValidaEquipID: TIntegerField
      FieldName = 'ID'
    end
    object CDValidaEquipCODAREA: TStringField
      FieldName = 'CODAREA'
      Size = 9
    end
    object CDValidaEquipCODCELULA: TStringField
      FieldName = 'CODCELULA'
      Size = 9
    end
    object CDValidaEquipCODLINHA: TStringField
      FieldName = 'CODLINHA'
      Size = 9
    end
    object CDValidaEquipSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
  end
end

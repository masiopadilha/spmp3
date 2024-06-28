inherited FrmTelaCadRotaProgEquip: TFrmTelaCadRotaProgEquip
  Caption = 'Rotas de Manuten'#231#227'o'
  ClientHeight = 624
  ClientWidth = 1012
  KeyPreview = False
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1008
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
    inherited BtnConsultar: TButton
      Width = 28
      ExplicitWidth = 28
    end
  end
  inherited PIdentificacao: TPanel
    Width = 1008
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
      CharCase = ecUpperCase
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
    Width = 1008
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
      Width = 124
      Height = 24
      DataField = 'FREQUENCIA'
      DataSource = DM.dsRotas
      MaxLength = 5
      TabOrder = 0
      OnChange = EdtDiasChange
      OnEnter = EdtDiasEnter
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
    Width = 1008
    Height = 372
    ExplicitTop = 189
    ExplicitHeight = 369
    object GrdInspecoes: TDBGrid
      Left = 3
      Top = 194
      Width = 294
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
      Width = 706
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
    object GrdSequencia: TDBGrid
      Left = 3
      Top = 28
      Width = 1002
      Height = 120
      Hint = 
        'Tecle ENTER nas colunas em negrito'#39' para incluir o equipamento n' +
        'a rota.'
      DataSource = DM.dsRotasSequencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdSequencia1DblClick
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = GrdSequencia1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'AREA'
          ReadOnly = True
          Title.Caption = #193'rea'
          Width = 158
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CELULA'
          ReadOnly = True
          Title.Caption = 'C'#233'lula'
          Width = 162
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINHA'
          ReadOnly = True
          Title.Caption = 'Linha'
          Width = 145
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODEQUIPATUAL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPATUAL'
          ReadOnly = True
          Title.Caption = 'Equipamento atual'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 352
          Visible = True
        end>
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 605
    Width = 1012
  end
  inherited PAlertas: TPanel
    Top = 563
    Width = 1012
  end
  inherited PBase: TPanel
    Top = 565
    Width = 1008
    ExplicitTop = 562
  end
  object CDValidaEquip: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 514
    Top = 141
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

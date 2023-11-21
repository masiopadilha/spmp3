inherited FrmTelaInspFechamentoHist: TFrmTelaInspFechamentoHist
  Caption = 'Hist'#243'rico de Inspe'#231#245'es'
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
      Left = 284
      Top = 33
      Width = 7
      Height = 16
      Caption = 'a'
    end
    object Label3: TLabel [2]
      Left = 125
      Top = 33
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited BtnAjuda: TButton
      Left = 969
      TabOrder = 4
      ExplicitLeft = 969
    end
    object BtnImprimir: TButton
      Left = 938
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
      TabOrder = 3
      OnClick = BtnImprimirClick
    end
    object BtnConsultar: TButton
      Left = 403
      Top = 28
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnConsultarClick
    end
    object EdtData1: TJvDateTimePicker
      Left = 175
      Top = 29
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 0
      DropDownDate = 44778.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 296
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 1
      DropDownDate = 44771.000000000000000000
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 505
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Top = 501
      Width = 1004
      Height = 3
      ExplicitTop = 501
      ExplicitWidth = 1000
      ExplicitHeight = 0
    end
    object GrdLubrificacaoHist: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 270
      Width = 998
      Height = 228
      Align = alTop
      Color = clBtnFace
      DataSource = DM.dsLubrificPeriodicasHist
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyPress = GrdLubrificacaoHistKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'DTAINICIO1'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 77
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAFECHAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Fechamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODORDEMSERVICO'
          Title.Alignment = taCenter
          Title.Caption = 'Ordem de Servi'#231'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 133
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
          Width = 338
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Lubrifica'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FREQUENCIA1'
          Title.Alignment = taCenter
          Title.Caption = 'Frequ'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end>
    end
    object GrdManutencaoHist: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 39
      Width = 998
      Height = 228
      Margins.Bottom = 0
      Align = alTop
      Color = clBtnFace
      DataSource = DM.dsManutPeriodicasHist
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
      OnKeyPress = GrdManutencaoHistKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'DTAINICIO1'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAFECHAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Fechamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODORDEMSERVICO'
          Title.Alignment = taCenter
          Title.Caption = 'Ordem de Servi'#231'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 121
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
          Width = 339
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Manuten'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 254
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FREQUENCIA1'
          Title.Alignment = taCenter
          Title.Caption = 'Frequ'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end>
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 998
      Height = 33
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      ExplicitWidth = 994
      object Label6: TLabel
        Left = 186
        Top = 7
        Width = 142
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fam'#237'lia de Equipamento:'
      end
      object Label2: TLabel
        Left = 13
        Top = 7
        Width = 54
        Height = 16
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o:'
      end
      object Button1: TButton
        Left = 542
        Top = 2
        Width = 28
        Height = 28
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = Button1Click
      end
      object EdtFamiliaEquip: TEdit
        Left = 333
        Top = 4
        Width = 205
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        StyleElements = [seFont, seClient]
        OnDblClick = EdtFamiliaEquipDblClick
      end
      object CBConsSimples: TComboBox
        Left = 72
        Top = 5
        Width = 101
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 1
        TabOrder = 0
        Text = 'Fechadas'
        OnChange = CBConsSimplesChange
        Items.Strings = (
          'Abertas'
          'Fechadas'
          'Canceladas')
      end
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
      Left = 100
      Top = 7
      Visible = False
      ExplicitLeft = 100
      ExplicitTop = 7
    end
    inherited BtnFechar: TButton
      Left = 465
      Top = 7
      ExplicitLeft = 465
      ExplicitTop = 7
    end
  end
  object PopupMenuRelat: TPopupMenu
    Left = 898
    Top = 18
    object Manutencoes1: TMenuItem
      Caption = 'Manuten'#231#245'es'
      OnClick = Manutencoes1Click
    end
    object Lubrificacoes1: TMenuItem
      Caption = 'Lubrifica'#231#245'es'
      OnClick = Lubrificacoes1Click
    end
  end
end

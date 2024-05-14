inherited FrmTelaCadOrdemServicoFechamentoMObra: TFrmTelaCadOrdemServicoFechamentoMObra
  Caption = 'Fechamento de M'#227'o de Obra'
  ClientHeight = 374
  ClientWidth = 508
  Constraints.MaxHeight = 410
  Constraints.MinHeight = 410
  OnCreate = FormCreate
  ExplicitHeight = 410
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    inherited BtnAjuda: TButton
      Left = 471
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 235
    ExplicitHeight = 232
    inherited RGTelas: TRadioGroup
      Height = 233
      ExplicitHeight = 230
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 494
      Height = 227
      Align = alClient
      Color = 14671839
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 490
      ExplicitHeight = 224
      object RadioGroup1: TRadioGroup
        Left = 166
        Top = 1
        Width = 0
        Height = 101
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        TabOrder = 3
        ExplicitHeight = 98
      end
      object GrdEquipe: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 159
        Height = 95
        Hint = 'D'#234' duplo-clique para excluir o registro.'
        Align = alLeft
        Ctl3D = False
        DataSource = DM.dsOrdemServicoEquipe
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GrdEquipeDblClick
        OnKeyDown = GrdEquipeKeyDown
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'CODEQUIPE'
            Title.Alignment = taCenter
            Title.Caption = 'Equipe'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TEMPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tempo'
            Width = 53
            Visible = True
          end>
      end
      object GrdEquipeMObraUtil: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 105
        Width = 486
        Height = 118
        Hint = 
          'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
          'ou efetue o duplo-clique para exclu'#237'-lo'
        Align = alBottom
        Ctl3D = False
        DataSource = DM.dsOrdemServicoEquipeMObraUtil
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GrdEquipeMObraUtilDblClick
        OnKeyDown = GrdEquipeKeyDown
        OnKeyPress = GrdEquipeMObraUtilKeyPress
        Columns = <
          item
            Alignment = taCenter
            Color = clBtnFace
            Expanded = False
            FieldName = 'MATRICULA'
            Title.Alignment = taCenter
            Title.Caption = 'Matr'#237'cula'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 166
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = 'H Normal'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDEHENORMAL'
            Title.Alignment = taCenter
            Title.Caption = 'HE Normal'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDEHEFERIADO'
            Title.Alignment = taCenter
            Title.Caption = 'HE Feriado'
            Width = 70
            Visible = True
          end>
      end
      object GrdEquipeMObra: TDBGrid
        AlignWithMargins = True
        Left = 168
        Top = 4
        Width = 322
        Height = 95
        Hint = 
          'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
          'ou efetue o duplo-clique para exclu'#237'-lo'
        Align = alRight
        Ctl3D = False
        DataSource = DM.dsOrdemServicoEquipeMObra
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GrdEquipeMObraDblClick
        OnKeyDown = GrdEquipeKeyDown
        OnKeyPress = GrdEquipeMObraKeyPress
        Columns = <
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'CARGO'
            Title.Caption = 'Cargo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = 'Homem/Hora'
            Width = 66
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'CALENDARIO'
            Title.Caption = 'Calend'#225'rio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 118
            Visible = True
          end>
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 307
    Width = 504
    ExplicitTop = 304
  end
  inherited PBotoes: TPanel
    Top = 334
    Width = 504
    ExplicitTop = 331
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 212
      ExplicitLeft = 212
    end
  end
end

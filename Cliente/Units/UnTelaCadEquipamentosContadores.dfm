inherited FrmTelaCadEquipamentosContadores: TFrmTelaCadEquipamentosContadores
  Caption = 'Medidores do Equipamento'
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Left = 3
    Top = 3
    Width = 482
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 478
    inherited Image1: TImage
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited BtnAjuda: TButton
      Left = 446
      ExplicitLeft = 446
    end
  end
  inherited PCentro: TPanel
    Left = 4
    Top = 70
    Width = 480
    Height = 157
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 70
    ExplicitWidth = 476
    ExplicitHeight = 154
    inherited RGTelas: TRadioGroup
      Width = 478
      Height = 155
      Margins.Left = 3
      Margins.Top = 3
      Margins.Right = 3
      Margins.Bottom = 3
      ExplicitWidth = 474
      ExplicitHeight = 152
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 472
      Height = 149
      Align = alClient
      Color = 14671839
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 468
      ExplicitHeight = 146
      object RadioGroup1: TRadioGroup
        Left = 1
        Top = 1
        Width = 470
        Height = 147
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 466
        ExplicitHeight = 144
      end
      object GrdCadastro: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 464
        Height = 141
        Hint = 
          'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
          'ou efetue o duplo-clique para exclu'#237'-lo'
        Align = alClient
        Ctl3D = False
        DataSource = DM.dsEquipamentosContadores
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
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
        OnDblClick = GrdCadastroDblClick
        OnKeyPress = GrdCadastroKeyPress
        Columns = <
          item
            Alignment = taCenter
            Color = clBtnFace
            Expanded = False
            FieldName = 'CODCONTADOR'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'CONTADOR'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 210
            Visible = True
          end
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'PROGRAMACAO'
            Title.Caption = 'Programa'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 162
            Visible = True
          end>
      end
    end
  end
  inherited PAuxiliares: TPanel
    Left = 3
    Top = 234
    Width = 482
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitLeft = 3
    ExplicitTop = 231
    ExplicitWidth = 478
  end
  inherited PBotoes: TPanel
    Left = 3
    Top = 263
    Width = 482
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitLeft = 3
    ExplicitTop = 260
    ExplicitWidth = 478
    inherited BtnOK: TButton
      Left = 100
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 212
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 212
    end
  end
end

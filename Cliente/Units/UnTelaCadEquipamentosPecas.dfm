inherited FrmTelaCadEquipamentosPecas: TFrmTelaCadEquipamentosPecas
  Caption = 'Pe'#231'as do Equipamento'
  ClientHeight = 304
  ClientWidth = 508
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Left = 3
    Top = 3
    Width = 502
    Margins.Left = 3
    Margins.Top = 3
    Margins.Right = 3
    Margins.Bottom = 3
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 498
    inherited Image1: TImage
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    Left = 4
    Top = 70
    Width = 500
    Height = 165
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 70
    ExplicitWidth = 500
    inherited RGTelas: TRadioGroup
      Width = 498
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      ExplicitWidth = 498
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 492
      Height = 157
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alClient
      Ctl3D = False
      DataSource = DM.dsEquipamentosPecas
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      OnDblClick = GrdCadastroDblClick
      OnKeyPress = GrdCadastroKeyPress
      Columns = <
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'CODPECAREP'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 47
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'REFERENCIA'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DESCRICAO'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 152
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOCALIZACAO'
          Title.Caption = 'Local no Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 126
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Left = 1
    Top = 240
    Width = 506
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ExplicitLeft = 1
    ExplicitTop = 237
    ExplicitWidth = 502
  end
  inherited PBotoes: TPanel
    Left = 1
    Top = 265
    Width = 506
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ExplicitLeft = 1
    ExplicitTop = 262
    ExplicitWidth = 502
    inherited BtnOK: TButton
      Left = 100
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Visible = False
      OnClick = BtnOKClick
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 214
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 214
    end
  end
end

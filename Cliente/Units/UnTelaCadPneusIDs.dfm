inherited FrmTelaCadPneusIDs: TFrmTelaCadPneusIDs
  Caption = 'ID dos Pneus'
  ClientWidth = 563
  Constraints.MaxWidth = 575
  Constraints.MinWidth = 575
  OnCreate = FormCreate
  ExplicitWidth = 575
  TextHeight = 16
  inherited PTop: TPanel
    Width = 559
    ExplicitWidth = 555
    inherited BtnAjuda: TButton
      Left = 523
      ExplicitLeft = 523
    end
  end
  inherited PCentro: TPanel
    Width = 557
    ExplicitWidth = 553
    inherited RGTelas: TRadioGroup
      Width = 555
      ExplicitWidth = 551
    end
    object GrdPneus: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 549
      Height = 157
      Align = alClient
      Color = 14671839
      DataSource = DM.dsPneusIDs
      DrawingStyle = gdsClassic
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      StyleElements = [seFont, seBorder]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RODADOS'
          Title.Alignment = taCenter
          Title.Caption = 'Rodagem'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'INSTALADO'
          Title.Alignment = taCenter
          Title.Caption = 'Instalado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 74
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODEQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Equip.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCEQUIPAMENTO'
          Title.Caption = 'Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 155
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'STATUS'
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 61
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Width = 559
    ExplicitWidth = 555
  end
  inherited PBotoes: TPanel
    Width = 559
    ExplicitWidth = 555
    inherited BtnOK: TButton
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 240
      ExplicitLeft = 240
    end
  end
end

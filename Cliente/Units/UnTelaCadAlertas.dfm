inherited FrmTelaCadAlertas: TFrmTelaCadAlertas
  Caption = 'Alertas'
  ClientHeight = 304
  ClientWidth = 508
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    inherited BtnAjuda: TButton
      Left = 469
      ExplicitLeft = 469
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 165
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 494
      Height = 157
      Align = alClient
      DataSource = DM.dsAlertas
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdCadastroDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 203
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VENCIMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ANTECIPAR'
          Title.Alignment = taCenter
          Title.Caption = 'Antecipar (d)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROLONGAR'
          Title.Alignment = taCenter
          Title.Caption = 'Prolongar (d)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 504
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 504
    inherited BtnOK: TButton
      OnClick = BtnOKClick
    end
  end
end

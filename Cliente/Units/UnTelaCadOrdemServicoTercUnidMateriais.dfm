inherited FrmTelaCadOrdemServicoTercUnidMateriais: TFrmTelaCadOrdemServicoTercUnidMateriais
  Caption = 'Materiais'
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    inherited BtnAjuda: TButton
      Left = 469
      ExplicitLeft = 469
    end
  end
  inherited PCentro: TPanel
    object GrdMateriais: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 494
      Height = 157
      Align = alClient
      DataSource = DM.dsOrdemServicoTercUnidMateriais
      DrawingStyle = gdsClassic
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 314
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o'
          Width = 56
          Visible = True
        end>
    end
  end
  inherited PBotoes: TPanel
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 212
      OnClick = BtnFecharClick
      ExplicitLeft = 212
    end
  end
end

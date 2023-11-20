inherited FrmTelaCadOrdemServicoTercUnidMateriais: TFrmTelaCadOrdemServicoTercUnidMateriais
  Caption = 'Materiais'
  ClientHeight = 304
  ClientWidth = 488
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Width = 484
    inherited BtnAjuda: TButton
      Left = 444
      ExplicitLeft = 444
    end
  end
  inherited PCentro: TPanel
    Width = 482
    Height = 165
    object GrdMateriais: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 474
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
          Width = 307
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
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 484
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 484
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 206
      OnClick = BtnFecharClick
      ExplicitLeft = 206
    end
  end
end

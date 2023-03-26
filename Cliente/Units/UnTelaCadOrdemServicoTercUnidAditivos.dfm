inherited FrmTelaCadOrdemServicoTercUnidAditivos: TFrmTelaCadOrdemServicoTercUnidAditivos
  Caption = 'Aditivos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  inherited PCentro: TPanel
    inherited RGTelas: TRadioGroup
      Left = 267
      Width = 0
      ExplicitLeft = 267
      ExplicitWidth = 0
    end
    object GrdAditivos: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 260
      Height = 154
      Align = alLeft
      DataSource = DM.dsOrdemServicoTercUnidAditivos
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOVADATAFIN'
          Title.Alignment = taCenter
          Title.Caption = 'Fim'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOVOVALOR'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Width = 63
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOVONUMPARCELAS'
          Title.Alignment = taCenter
          Title.Caption = 'Parcelas'
          Width = 67
          Visible = True
        end>
    end
    object MMotivo: TDBMemo
      AlignWithMargins = True
      Left = 267
      Top = 4
      Width = 227
      Height = 154
      Align = alRight
      DataField = 'MOTIVO'
      DataSource = DM.dsOrdemServicoTercUnidAditivos
      TabOrder = 2
    end
  end
  inherited PBotoes: TPanel
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 213
      OnClick = BtnFecharClick
      ExplicitLeft = 213
    end
  end
end

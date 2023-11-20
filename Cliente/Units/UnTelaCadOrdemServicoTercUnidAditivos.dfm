inherited FrmTelaCadOrdemServicoTercUnidAditivos: TFrmTelaCadOrdemServicoTercUnidAditivos
  Caption = 'Aditivos'
  ClientHeight = 304
  ClientWidth = 488
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Width = 484
    inherited BtnAjuda: TButton
      Left = 446
      ExplicitLeft = 446
    end
  end
  inherited PCentro: TPanel
    Width = 482
    Height = 165
    inherited RGTelas: TRadioGroup
      Left = 267
      Width = 1
      ExplicitLeft = 267
      ExplicitWidth = 0
    end
    object GrdAditivos: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 260
      Height = 157
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
      Left = 271
      Top = 4
      Width = 207
      Height = 157
      Align = alRight
      DataField = 'MOTIVO'
      DataSource = DM.dsOrdemServicoTercUnidAditivos
      TabOrder = 2
      ExplicitLeft = 272
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
      Left = 205
      OnClick = BtnFecharClick
      ExplicitLeft = 205
    end
  end
end

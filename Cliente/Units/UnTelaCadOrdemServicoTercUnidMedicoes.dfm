inherited FrmTelaCadOrdemServicoTercUnidMedicoes: TFrmTelaCadOrdemServicoTercUnidMedicoes
  Caption = 'Medi'#231#245'es do Servi'#231'o'
  ClientHeight = 304
  ClientWidth = 288
  Constraints.MaxWidth = 300
  Constraints.MinWidth = 300
  OnCreate = FormCreate
  ExplicitWidth = 300
  TextHeight = 16
  inherited PTop: TPanel
    Width = 284
    ExplicitWidth = 280
    inherited BtnAjuda: TButton
      Left = 244
      ExplicitLeft = 244
    end
  end
  inherited PCentro: TPanel
    Width = 282
    Height = 165
    ExplicitWidth = 278
    inherited RGTelas: TRadioGroup
      Width = 280
      ExplicitWidth = 276
    end
    object GrdMedicoes: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 274
      Height = 157
      Align = alClient
      Color = clWhite
      DataSource = DM.dsOrdemServicoTercUnidMedicoes
      DrawingStyle = gdsClassic
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdMedicoesDblClick
      OnKeyPress = GrdMedicoesKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAMEDICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 94
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'LIBERADO'
          PickList.Strings = (
            'N'
            'S')
          Title.Alignment = taCenter
          Title.Caption = 'Liberado'
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Parcela'
          Width = 77
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 284
    ExplicitWidth = 280
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 284
    ExplicitWidth = 280
    inherited BtnOK: TButton
      Left = 5
      Visible = False
      ExplicitLeft = 5
    end
    inherited BtnFechar: TButton
      Left = 105
      ExplicitLeft = 105
    end
  end
end

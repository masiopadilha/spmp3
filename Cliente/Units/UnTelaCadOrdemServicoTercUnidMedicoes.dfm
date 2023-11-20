inherited FrmTelaCadOrdemServicoTercUnidMedicoes: TFrmTelaCadOrdemServicoTercUnidMedicoes
  Caption = 'Medi'#231#245'es do Servi'#231'o'
  ClientWidth = 284
  Constraints.MaxWidth = 300
  Constraints.MinWidth = 300
  OnCreate = FormCreate
  ExplicitWidth = 300
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 280
    ExplicitWidth = 280
    inherited BtnAjuda: TButton
      Left = 247
      ExplicitLeft = 247
    end
  end
  inherited PCentro: TPanel
    Width = 278
    ExplicitWidth = 278
    inherited RGTelas: TRadioGroup
      Width = 276
      ExplicitWidth = 276
    end
    object GrdMedicoes: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 270
      Height = 154
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
    Width = 280
    ExplicitWidth = 280
  end
  inherited PBotoes: TPanel
    Width = 280
    ExplicitWidth = 280
    inherited BtnOK: TButton
      Left = 5
      Visible = False
      ExplicitLeft = 5
    end
    inherited BtnFechar: TButton
      Left = 103
      ExplicitLeft = 103
    end
  end
end

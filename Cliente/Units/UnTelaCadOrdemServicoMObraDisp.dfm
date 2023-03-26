inherited FrmTelaCadOrdemServicoMObraDisp: TFrmTelaCadOrdemServicoMObraDisp
  Caption = 'M'#227'o de Obra Dispon'#237'vel'
  ClientHeight = 281
  ClientWidth = 464
  KeyPreview = False
  ExplicitWidth = 480
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTop: TPanel
    Width = 460
  end
  inherited PCentro: TPanel
    Width = 458
    Height = 142
    inherited RGTelas: TRadioGroup
      Width = 456
      Height = 140
    end
    object GrdMObra: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 450
      Height = 134
      Align = alClient
      DataSource = CMWeb.DSCadOrdemServicoMObraDisp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdMObraDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Alignment = taCenter
          Title.Caption = 'Matr'#237'cula'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 135
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OCUPADO'
          Title.Alignment = taCenter
          Title.Caption = 'Ocupado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROGRAMADO'
          Title.Alignment = taCenter
          Title.Caption = 'Programado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPESP'
          Title.Caption = 'Especialista'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 103
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 214
    Width = 460
  end
  inherited PBotoes: TPanel
    Top = 241
    Width = 460
  end
end

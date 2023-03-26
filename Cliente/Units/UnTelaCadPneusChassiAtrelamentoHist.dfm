inherited FrmTelaCadPneusChassiAtrelamentoHist: TFrmTelaCadPneusChassiAtrelamentoHist
  Caption = 'Hist'#243'rico'
  ClientWidth = 684
  Constraints.MaxWidth = 700
  Constraints.MinWidth = 700
  OnCreate = FormCreate
  ExplicitWidth = 700
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 680
    ExplicitWidth = 680
    inherited BtnAjuda: TButton
      Left = 647
      ExplicitLeft = 647
    end
  end
  inherited PCentro: TPanel
    Width = 678
    ExplicitWidth = 678
    inherited RGTelas: TRadioGroup
      Width = 676
      ExplicitWidth = 676
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 670
      Height = 154
      Align = alClient
      DataSource = DM.dsPneusChassiAtrelamentoHist
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CAVALO'
          Title.Caption = 'Cavalo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 147
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POSICAO'
          Title.Caption = 'Posi'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARROCERIA'
          Title.Caption = 'Carroceria'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTADOR'
          Title.Alignment = taCenter
          Title.Caption = 'Contador'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RODAGEM'
          Title.Alignment = taCenter
          Title.Caption = 'Rodagem'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 62
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OPERACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Opera'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 68
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Width = 680
    ExplicitWidth = 680
  end
  inherited PBotoes: TPanel
    Width = 680
    ExplicitWidth = 680
    inherited BtnOK: TButton
      Left = 176
      Visible = False
      ExplicitLeft = 176
    end
    inherited BtnFechar: TButton
      Left = 303
      ExplicitLeft = 303
    end
  end
end

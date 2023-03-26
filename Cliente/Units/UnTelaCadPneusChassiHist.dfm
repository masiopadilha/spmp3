inherited FrmTelaCadPneusChassiHist: TFrmTelaCadPneusChassiHist
  Caption = 'Hist'#243'rico do Pneu'
  ClientWidth = 784
  Constraints.MaxWidth = 800
  Constraints.MinWidth = 800
  OnCreate = FormCreate
  ExplicitWidth = 800
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTop: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited BtnAjuda: TButton
      Left = 747
      ExplicitLeft = 747
    end
  end
  inherited PCentro: TPanel
    Width = 778
    ExplicitWidth = 778
    inherited RGTelas: TRadioGroup
      Width = 776
      ExplicitWidth = 776
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 770
      Height = 134
      Align = alClient
      DataSource = CMWeb.DSCadPneusChassiPneusHist
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 49
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
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PNEU'
          Title.Caption = 'Pneu'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POSICAO'
          Title.Caption = 'Posi'#231#227'o'
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
          FieldName = 'OPERACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Opera'#231#227'o'
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
          FieldName = 'RODAGEM'
          Title.Alignment = taCenter
          Title.Caption = 'Rodagem'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPAMENTO'
          Title.Caption = 'Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO'
          Title.Caption = 'Motivo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -9
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 97
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Width = 780
    ExplicitWidth = 780
  end
  inherited PBotoes: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited BtnOK: TButton
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 352
      ExplicitLeft = 352
    end
  end
end

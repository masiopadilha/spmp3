inherited FrmTelaCadPecasReposicaoHist: TFrmTelaCadPecasReposicaoHist
  Caption = 'Hist'#243'rico da Pe'#231'a'
  ClientHeight = 564
  ClientWidth = 788
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  OnCreate = FormCreate
  ExplicitWidth = 800
  ExplicitHeight = 600
  TextHeight = 16
  inherited PTop: TPanel
    Width = 784
    ExplicitWidth = 780
    inherited BtnAjuda: TButton
      Left = 749
      Top = 15
      ExplicitLeft = 749
      ExplicitTop = 15
    end
  end
  inherited PCentro: TPanel
    Width = 782
    Height = 425
    ExplicitWidth = 778
    ExplicitHeight = 422
    inherited RGTelas: TRadioGroup
      Width = 780
      Height = 423
      ExplicitWidth = 776
      ExplicitHeight = 420
    end
    object GrdOS: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 774
      Height = 417
      Align = alClient
      Color = clBtnFace
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
          FieldName = 'CODEQUIPAMENTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Equip.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCEQUIPAMENTO'
          Title.Caption = 'Equipamento'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 201
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PECA'
          Title.Caption = 'Pe'#231'a'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 166
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODORDEMSERVICO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. O.S.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDESOLIC'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 43
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'Entrada'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 98
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 497
    Width = 784
    ExplicitTop = 494
    ExplicitWidth = 780
  end
  inherited PBotoes: TPanel
    Top = 524
    Width = 784
    ExplicitTop = 521
    ExplicitWidth = 780
    inherited BtnOK: TButton
      Left = 202
      Visible = False
      ExplicitLeft = 202
    end
    inherited BtnFechar: TButton
      Left = 355
      ExplicitLeft = 355
    end
  end
end

inherited FrmTelaCadOrdemServicoParalisacao: TFrmTelaCadOrdemServicoParalisacao
  Caption = 'Paralisa'#231#245'es da O.S.'
  ClientHeight = 304
  ClientWidth = 528
  Constraints.MaxWidth = 540
  Constraints.MinWidth = 540
  OnCreate = FormCreate
  ExplicitWidth = 540
  TextHeight = 16
  inherited PTop: TPanel
    Width = 524
    ExplicitWidth = 520
    inherited BtnAjuda: TButton
      Left = 493
      ExplicitLeft = 489
    end
  end
  inherited PCentro: TPanel
    Width = 522
    Height = 165
    ExplicitWidth = 518
    inherited RGTelas: TRadioGroup
      Left = 252
      Width = 0
      ExplicitLeft = 252
      ExplicitWidth = 0
    end
    object GrdParalisacao: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 245
      Height = 157
      Hint = 'D'#234' duplo-clique para paralisar ou executar a O.S.'
      Align = alLeft
      DataSource = DM.dsOrdemServicoParalisacoes
      DrawingStyle = gdsClassic
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdParalisacaoDblClick
      Columns = <
        item
          Alignment = taCenter
          Color = 14671839
          Expanded = False
          FieldName = 'DATAPARALISACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Paralisa'#231#227'o'
          Width = 108
          Visible = True
        end
        item
          Alignment = taCenter
          Color = 14671839
          Expanded = False
          FieldName = 'DATARETORNO'
          Title.Alignment = taCenter
          Title.Caption = 'Retorno'
          Width = 101
          Visible = True
        end>
    end
    object MMotivo: TDBMemo
      AlignWithMargins = True
      Left = 255
      Top = 4
      Width = 263
      Height = 157
      Align = alRight
      DataField = 'MOTIVOPARALISACAO'
      DataSource = DM.dsOrdemServicoParalisacoes
      TabOrder = 2
      ExplicitLeft = 251
      ExplicitHeight = 154
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 524
    ExplicitWidth = 520
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 524
    ExplicitWidth = 520
    inherited BtnOK: TButton
      Left = 100
      Top = 7
      Visible = False
      OnClick = BtnOKClick
      ExplicitLeft = 100
      ExplicitTop = 7
    end
    inherited BtnFechar: TButton
      Left = 224
      Top = 7
      ExplicitLeft = 224
      ExplicitTop = 7
    end
  end
end

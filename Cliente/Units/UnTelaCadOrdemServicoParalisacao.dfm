inherited FrmTelaCadOrdemServicoParalisacao: TFrmTelaCadOrdemServicoParalisacao
  Caption = 'Paralisa'#231#245'es da O.S.'
  ClientWidth = 524
  Constraints.MaxWidth = 540
  Constraints.MinWidth = 540
  OnCreate = FormCreate
  ExplicitWidth = 540
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 520
    ExplicitWidth = 520
    inherited BtnAjuda: TButton
      Left = 487
      ExplicitLeft = 487
    end
  end
  inherited PCentro: TPanel
    Width = 518
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
      Height = 154
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
      Left = 251
      Top = 4
      Width = 263
      Height = 154
      Align = alRight
      DataField = 'MOTIVOPARALISACAO'
      DataSource = DM.dsOrdemServicoParalisacoes
      TabOrder = 2
    end
  end
  inherited PAuxiliares: TPanel
    Width = 520
    ExplicitWidth = 520
  end
  inherited PBotoes: TPanel
    Width = 520
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

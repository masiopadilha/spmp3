inherited FrmTelaCadOrdemServicoFechamentoPecas: TFrmTelaCadOrdemServicoFechamentoPecas
  Caption = 'Fechamento de Pe'#231'as da O.S.'
  ClientWidth = 524
  Constraints.MaxWidth = 540
  Constraints.MinWidth = 540
  OnCreate = FormCreate
  ExplicitWidth = 540
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
    ExplicitHeight = 165
    inherited RGTelas: TRadioGroup
      Width = 520
      ExplicitWidth = 516
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 514
      Height = 157
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alClient
      Ctl3D = True
      DataSource = DM.dsOrdemServicoEquipePecasUtil
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdCadastroDblClick
      OnKeyDown = GrdCadastroKeyDown
      OnKeyPress = GrdCadastroKeyPress
      Columns = <
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'CODPECASREPOSICAO'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 52
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'REFERENCIA'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'PECA'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 159
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'QTDESOLIC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Width = 33
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'PRECO'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o'
          Width = 68
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'ENTRADA'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Entrada'
          Width = 86
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Width = 520
    ExplicitTop = 237
    ExplicitWidth = 520
  end
  inherited PBotoes: TPanel
    Width = 520
    ExplicitTop = 264
    ExplicitWidth = 520
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 225
      ExplicitLeft = 225
    end
  end
end

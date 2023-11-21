inherited FrmTelaCadOrdemServicoFechamentoLubrificantes: TFrmTelaCadOrdemServicoFechamentoLubrificantes
  Caption = 'Fechamento de Lubrificantes da O.S.'
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    inherited BtnAjuda: TButton
      Left = 468
      ExplicitLeft = 468
    end
  end
  inherited PCentro: TPanel
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 494
      Height = 157
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alClient
      Ctl3D = False
      DataSource = DM.dsOrdemServicoEquipeLubrificantesUtil
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
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
          FieldName = 'CODLUBRIFICANTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 52
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'LUBRIFICANTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 208
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'QTDESOLIC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end>
    end
  end
  inherited PBotoes: TPanel
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 212
      ExplicitLeft = 212
    end
  end
end

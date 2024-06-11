inherited FrmTelaCadOrdemServicoLubrificantes: TFrmTelaCadOrdemServicoLubrificantes
  Caption = 'Lubrificantes da O.S.'
  OnCreate = FormCreate
  TextHeight = 16
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
      DataSource = DM.dsOrdemServicoEquipeLubrificantes
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
      OnKeyPress = GrdCadastroKeyPress
      Columns = <
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'CODLUBRIFICANTE'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 51
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'LUBRIFICANTE'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 359
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDESOLIC'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 45
          Visible = True
        end>
    end
  end
  inherited PBotoes: TPanel
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      OnClick = BtnOKClick
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 213
      ExplicitLeft = 213
    end
  end
end

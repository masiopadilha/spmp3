inherited FrmTelaCadOrdemServicoTercUnidRecursos: TFrmTelaCadOrdemServicoTercUnidRecursos
  Caption = 'Recursos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    inherited BtnAjuda: TButton
      Left = 467
      ExplicitLeft = 467
    end
  end
  inherited PCentro: TPanel
    object GrdRecursos: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 490
      Height = 154
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alClient
      Ctl3D = False
      DataSource = DM.dsOrdemServicoTercUnidRecurso
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
      OnDblClick = GrdRecursosDblClick
      OnKeyPress = GrdRecursosKeyPress
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'RECURSO'
          ReadOnly = True
          Title.Caption = 'Recurso'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 384
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Width = 68
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
      Left = 213
      OnClick = BtnFecharClick
      ExplicitLeft = 213
    end
  end
end

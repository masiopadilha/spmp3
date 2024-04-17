inherited FrmTelaCadOrdemServicoFechamentoRecursos: TFrmTelaCadOrdemServicoFechamentoRecursos
  Caption = 'Fechamento de Recursos da O.S.'
  ClientHeight = 304
  ClientWidth = 508
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    inherited BtnAjuda: TButton
      Left = 469
      ExplicitLeft = 469
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 165
    inherited RGTelas: TRadioGroup
      Left = 157
      Width = 3
      ExplicitLeft = 157
      ExplicitWidth = 3
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 159
      Top = 4
      Width = 339
      Height = 157
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alRight
      Ctl3D = False
      DataSource = DM.dsOrdemServicoEquipeRecursosUtil
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
      OnKeyDown = GrdEquipeKeyDown
      OnKeyPress = GrdCadastroKeyPress
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'RECURSO'
          ReadOnly = True
          Title.Caption = 'Recurso'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 148
          Visible = True
        end
        item
          Color = clBtnHighlight
          Expanded = False
          FieldName = 'QTDESOLIC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnHighlight
          Expanded = False
          FieldName = 'ENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'Entrada'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 91
          Visible = True
        end>
    end
    object GrdEquipe: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 150
      Height = 157
      Hint = 'D'#234' duplo-clique para excluir o registro.'
      Align = alLeft
      Ctl3D = False
      DataSource = DM.dsOrdemServicoEquipe
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = GrdEquipeKeyDown
      Columns = <
        item
          Alignment = taRightJustify
          Color = clBtnFace
          Expanded = False
          FieldName = 'CODEQUIPE'
          Title.Alignment = taCenter
          Title.Caption = 'Equipe'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 55
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'TEMPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 59
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 504
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 504
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 212
      OnClick = BtnFecharClick
      ExplicitLeft = 212
    end
  end
end

inherited FrmTelaCadOrdemServicoRecursos: TFrmTelaCadOrdemServicoRecursos
  Caption = 'Recursos da O.S.'
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
    inherited RGTelas: TRadioGroup
      Left = 157
      Width = 0
      ExplicitLeft = 157
      ExplicitWidth = 0
    end
    object GrdEquipe: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 150
      Height = 154
      Align = alLeft
      Color = clBtnFace
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
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = GrdEquipeKeyDown
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'CODEQUIPE'
          Title.Alignment = taCenter
          Title.Caption = 'Equipe'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEMPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Width = 58
          Visible = True
        end>
    end
    object GrdEquipeRecursos: TDBGrid
      AlignWithMargins = True
      Left = 157
      Top = 4
      Width = 337
      Height = 154
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alRight
      Ctl3D = False
      DataSource = DM.dsOrdemServicoEquipeRecursos
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
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdEquipeRecursosDblClick
      OnKeyDown = GrdEquipeKeyDown
      OnKeyPress = GrdEquipeRecursosKeyPress
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
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDESOLIC'
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
      ModalResult = 0
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

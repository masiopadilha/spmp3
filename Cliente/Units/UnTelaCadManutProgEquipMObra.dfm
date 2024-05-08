inherited FrmTelaCadManutProgEquipMObra: TFrmTelaCadManutProgEquipMObra
  Caption = 'M'#227'o de Obra'
  ClientHeight = 304
  ClientWidth = 508
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    inherited BtnAjuda: TButton
      Left = 475
      ExplicitLeft = 471
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 165
    inherited RGTelas: TRadioGroup
      Width = 496
      Height = 0
      Align = alNone
      ExplicitHeight = 0
    end
    object GrdEquipe: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 151
      Height = 157
      Hint = 'D'#234' duplo-clique para excluir o registro.'
      Align = alLeft
      Ctl3D = False
      DataSource = DM.dsManutProgEquipEquipe
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
      OnDblClick = GrdEquipeDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODEQUIPE'
          Title.Alignment = taCenter
          Title.Caption = 'Equipe'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEMPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Width = 56
          Visible = True
        end>
    end
    object GrdEquipeMObra: TDBGrid
      AlignWithMargins = True
      Left = 161
      Top = 4
      Width = 337
      Height = 157
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Align = alRight
      Ctl3D = False
      DataSource = DM.dsManutProgEquipEquipeMObra
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
      OnDblClick = GrdEquipeMObraDblClick
      OnKeyPress = GrdEquipeMObraKeyPress
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'CARGO'
          ReadOnly = True
          Title.Caption = 'Cargo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 231
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTALHOMEMHORA'
          Title.Alignment = taCenter
          Title.Caption = 'Homem/Hora'
          Width = 68
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
      Left = 213
      ExplicitLeft = 213
    end
  end
end
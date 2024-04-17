inherited FrmTelaCadManutProgFamEquipPartes: TFrmTelaCadManutProgFamEquipPartes
  Caption = 'Partes a Inspecionar'
  ClientHeight = 304
  ClientWidth = 508
  OnCreate = FormCreate
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    inherited BtnAjuda: TButton
      Left = 469
      Top = 14
      ExplicitLeft = 469
      ExplicitTop = 14
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 165
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
      DataSource = DM.dsManutProgFamEquipPartes
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
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
      OnTitleClick = GrdCadastroTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 451
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
      OnClick = BtnFecharClick
      ExplicitLeft = 213
    end
  end
end

inherited FrmTelaCadOrdemServicoMObraExec: TFrmTelaCadOrdemServicoMObraExec
  Caption = 'Entrada/Sa'#237'da de M'#227'o de Obra'
  ClientHeight = 386
  ClientWidth = 769
  Constraints.MaxHeight = 425
  Constraints.MaxWidth = 785
  Constraints.MinHeight = 425
  Constraints.MinWidth = 785
  OnCreate = FormCreate
  ExplicitWidth = 785
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 765
    ExplicitWidth = 765
    inherited BtnAjuda: TButton
      Left = 732
      ExplicitLeft = 732
    end
  end
  inherited PCentro: TPanel
    Width = 763
    Height = 247
    ExplicitWidth = 763
    ExplicitHeight = 247
    inherited RGTelas: TRadioGroup
      Width = 435
      Height = 245
      TabOrder = 4
      ExplicitWidth = 435
      ExplicitHeight = 245
    end
    object GrdEquipe: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 137
      Height = 103
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
      ShowHint = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      StyleElements = [seFont, seBorder]
      OnDblClick = GrdEquipeDblClick
      OnKeyDown = GrdEquipeKeyDown
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODEQUIPE'
          Title.Alignment = taCenter
          Title.Caption = 'Equipe'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEMPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Width = 49
          Visible = True
        end>
    end
    object GrdEquipeMObraUtil: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 108
      Width = 434
      Height = 135
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Ctl3D = False
      DataSource = DM.dsOrdemServicoEquipeMObraUtil
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
      StyleElements = [seFont, seBorder]
      OnDblClick = GrdEquipeMObraUtilDblClick
      OnKeyDown = GrdEquipeKeyDown
      OnKeyPress = GrdEquipeMObraUtilKeyPress
      Columns = <
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Alignment = taCenter
          Title.Caption = 'Matr'#237'cula'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTALHOMEMHORA'
          Title.Alignment = taCenter
          Title.Caption = 'HH'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDEHENORMAL'
          Title.Alignment = taCenter
          Title.Caption = 'HE Norm.'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDEHEFERIADO'
          Title.Alignment = taCenter
          Title.Caption = 'HE Fer.'
          Width = 57
          Visible = True
        end>
    end
    object GrdEquipeMObra: TDBGrid
      AlignWithMargins = True
      Left = 142
      Top = 4
      Width = 296
      Height = 103
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro ' +
        'ou efetue o duplo-clique para exclu'#237'-lo'
      Ctl3D = False
      DataSource = DM.dsOrdemServicoEquipeMObra
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
      StyleElements = [seFont, seBorder]
      OnDblClick = GrdEquipeMObraDblClick
      OnKeyDown = GrdEquipeKeyDown
      OnKeyPress = GrdEquipeMObraKeyPress
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'CARGO'
          Title.Caption = 'Cargo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTALHOMEMHORA'
          Title.Alignment = taCenter
          Title.Caption = 'HH'
          Width = 50
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'CALENDARIO'
          Title.Caption = 'Calend'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 111
          Visible = True
        end>
    end
    object GrdMovimen: TDBGrid
      AlignWithMargins = True
      Left = 439
      Top = 4
      Width = 320
      Height = 239
      Hint = 
        'Tecle ENTER para entrada de m'#227'o de obra ou d'#234' duplo-clique para ' +
        'libera-la.'
      Align = alRight
      Color = clBtnFace
      Ctl3D = False
      DataSource = DM.dsOrdemServicoMObraMovim
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
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      StyleElements = [seFont]
      OnDblClick = GrdMovimenDblClick
      OnKeyDown = GrdEquipeKeyDown
      OnKeyPress = GrdMovimenKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EQUIPE'
          Title.Alignment = taCenter
          Title.Caption = 'Equipe'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 65
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'Entrada'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SAIDA'
          Title.Alignment = taCenter
          Title.Caption = 'Sa'#237'da'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 319
    Width = 765
    ExplicitTop = 319
    ExplicitWidth = 765
  end
  inherited PBotoes: TPanel
    Top = 346
    Width = 765
    ExplicitTop = 346
    ExplicitWidth = 765
    inherited BtnOK: TButton
      Left = 179
      Top = 7
      Visible = False
      ExplicitLeft = 179
      ExplicitTop = 7
    end
    inherited BtnFechar: TButton
      Left = 345
      Top = 7
      ExplicitLeft = 345
      ExplicitTop = 7
    end
  end
end

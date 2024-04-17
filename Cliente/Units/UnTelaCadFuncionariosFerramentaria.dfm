inherited FrmTelaCadFuncionariosFerramentaria: TFrmTelaCadFuncionariosFerramentaria
  Caption = 'Empr'#233'stimo de Ferramentas'
  ClientHeight = 304
  ClientWidth = 793
  Constraints.MaxWidth = 805
  Constraints.MinWidth = 805
  OnCreate = FormCreate
  ExplicitWidth = 805
  TextHeight = 16
  inherited PTop: TPanel
    Width = 789
    ExplicitWidth = 785
    inherited BtnAjuda: TButton
      Left = 758
      ExplicitLeft = 754
    end
    object BtnImprimir: TButton
      Left = 722
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnImprimirClick
    end
  end
  inherited PCentro: TPanel
    Width = 787
    Height = 165
    ExplicitWidth = 787
    inherited RGTelas: TRadioGroup
      Top = 160
      Width = 785
      Height = 1
      ExplicitTop = 160
      ExplicitWidth = 781
      ExplicitHeight = 1
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 779
      Height = 153
      Hint = 
        'Tecle ENTER na(s) coluna(s) em negrito para realizar um empr'#233'sti' +
        'mo ou uma devolu'#231#227'o.'
      Align = alTop
      DataSource = DM.dsFuncionariosFerramentaria
      DrawingStyle = gdsClassic
      FixedColor = 14671839
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
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
      OnKeyPress = GrdCadastroKeyPress
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
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 63
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 180
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'FERRAMENTARIA'
          Title.Caption = 'Ferramentaria'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 134
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'ITEM'
          Title.Caption = 'Item'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 157
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 47
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'DATAEMPRESTIMO'
          Title.Alignment = taCenter
          Title.Caption = 'Empr'#233'stimo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 78
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clBtnFace
          Expanded = False
          FieldName = 'DATADEVOLUCAO'
          Title.Alignment = taCenter
          Title.Caption = 'Devolu'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 789
    ExplicitWidth = 789
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 789
    ExplicitWidth = 789
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 355
      ExplicitLeft = 355
    end
  end
  object PopupMenuInventario: TPopupMenu
    Left = 552
    Top = 15
    object Funcionario1: TMenuItem
      Caption = 'Funcion'#225'rio'
      OnClick = Funcionario1Click
    end
    object Ferramenta1: TMenuItem
      Caption = 'Ferramenta'
      OnClick = Ferramenta1Click
    end
    object odos1: TMenuItem
      Caption = 'Todos'
      OnClick = odos1Click
    end
  end
end

inherited FrmTelaCadOrdemServicoPlanoTrab: TFrmTelaCadOrdemServicoPlanoTrab
  Caption = 'Planos de Trabalho da O.S.'
  ClientHeight = 304
  ClientWidth = 508
  OnCreate = FormCreate
  ExplicitWidth = 520
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    ExplicitWidth = 500
    inherited BtnAjuda: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 165
    ExplicitWidth = 498
    inherited RGTelas: TRadioGroup
      Width = 500
      ExplicitWidth = 496
    end
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
      DataSource = DM.dsOrdemServicoEquipePlanoTrab
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
          FieldName = 'CODPLANOTRABALHO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'PLANOTRABALHO'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 349
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'IMPRIMIR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          PickList.Strings = (
            'S'
            'N')
          Title.Alignment = taCenter
          Title.Caption = 'Imprimir'
          Width = 44
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 504
    ExplicitWidth = 500
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 504
    ExplicitWidth = 500
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 216
      ExplicitLeft = 216
    end
  end
end

inherited FrmTelaCadOrdemServicoMObraProgHHDisp: TFrmTelaCadOrdemServicoMObraProgHHDisp
  Caption = 'Homem/Hora Dispon'#237'vel'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    inherited BtnAjuda: TButton
      Left = 467
      ExplicitLeft = 467
    end
  end
  inherited PCentro: TPanel
    object GrdHHDisp: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 490
      Height = 154
      Align = alClient
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Alignment = taCenter
          Title.Caption = 'Matr'#237'cula'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 187
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCCALENDARIO'
          Title.Caption = 'Calend'#225'rio'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTALHHDISP'
          Title.Alignment = taCenter
          Title.Caption = 'HH Disp.'
          Visible = True
        end>
    end
  end
  inherited PBotoes: TPanel
    inherited BtnOK: TButton
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 213
      ExplicitLeft = 213
    end
  end
end

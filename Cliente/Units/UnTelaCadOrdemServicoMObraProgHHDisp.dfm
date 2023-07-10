inherited FrmTelaCadOrdemServicoMObraProgHHDisp: TFrmTelaCadOrdemServicoMObraProgHHDisp
  Caption = 'Homem/Hora Dispon'#237'vel'
  ClientHeight = 304
  ClientWidth = 508
  ExplicitLeft = 3
  ExplicitTop = 3
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    inherited BtnAjuda: TButton
      Left = 473
      ExplicitLeft = 467
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 165
    inherited RGTelas: TRadioGroup
      Height = 163
    end
    object GrdHHDisp: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 494
      Height = 157
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
          Width = 71
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
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 213
      ExplicitLeft = 213
    end
  end
end

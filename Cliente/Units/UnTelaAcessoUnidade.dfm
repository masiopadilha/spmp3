inherited FrmTelaAcessoUnidade: TFrmTelaAcessoUnidade
  BorderIcons = []
  Caption = 'SPMP3 - Acesso - Unidade'
  ClientWidth = 434
  Constraints.MaxWidth = 450
  Constraints.MinWidth = 450
  ExplicitWidth = 450
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 430
    inherited BtnAjuda: TButton
      Left = 393
      ExplicitLeft = 393
    end
  end
  inherited PCentro: TPanel
    Width = 428
    Height = 185
    ExplicitHeight = 185
    inherited RGTelas: TRadioGroup
      Width = 426
      Height = 183
      ExplicitHeight = 183
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 420
      Height = 177
      Align = alClient
      DataSource = DM.dsUnidadesCorp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      OnDblClick = GrdCadastroDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODEMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Empresa'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 268
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TRANSFORMACAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Transf.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 257
    Width = 430
    Height = 0
    ExplicitTop = 257
    ExplicitHeight = 0
  end
  inherited PBotoes: TPanel
    Width = 430
    inherited BtnOK: TButton
      Left = 178
      OnClick = BtnOKClick
      ExplicitLeft = 178
    end
    inherited BtnFechar: TButton
      Left = 13
      Top = 7
      Visible = False
      ExplicitLeft = 13
      ExplicitTop = 7
    end
  end
end

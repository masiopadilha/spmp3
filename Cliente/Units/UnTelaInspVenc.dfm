inherited FrmTelaInspVenc: TFrmTelaInspVenc
  BorderIcons = []
  Caption = 'Inspe'#231#245'es Vencidas'
  ClientHeight = 561
  ClientWidth = 924
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 940
  Constraints.MinHeight = 600
  Constraints.MinWidth = 940
  OnCreate = FormCreate
  ExplicitWidth = 940
  ExplicitHeight = 600
  TextHeight = 16
  inherited PTop: TPanel
    Width = 920
    TabOrder = 1
    ExplicitWidth = 920
    inherited BtnAjuda: TButton
      Left = 887
      Visible = False
      ExplicitLeft = 883
    end
  end
  inherited PCentro: TPanel
    Width = 918
    Height = 422
    TabOrder = 2
    ExplicitWidth = 918
    ExplicitHeight = 422
    inherited RGTelas: TRadioGroup
      Top = 40
      Width = 920
      Height = 384
      ExplicitTop = 40
      ExplicitWidth = 916
      ExplicitHeight = 381
    end
    object PCInspecoes: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 43
      Width = 914
      Height = 378
      ActivePage = TSManut
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 910
      ExplicitHeight = 375
      object TSManut: TTabSheet
        Caption = 'Manuten'#231#245'es'
        object GrdManut: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 900
          Height = 341
          Align = alClient
          DataSource = DM.dsManutVenc
          DrawingStyle = gdsClassic
          FixedColor = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = GrdManutDrawColumnCell
          OnTitleClick = GrdManutTitleClick
        end
      end
      object TSLubrific: TTabSheet
        Caption = 'Lubrifica'#231#245'es'
        ImageIndex = 1
        object GrdLubrific: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 900
          Height = 341
          Align = alClient
          DataSource = DM.dsLubrificVenc
          DrawingStyle = gdsClassic
          FixedColor = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = GrdManutDrawColumnCell
          OnTitleClick = GrdManutTitleClick
        end
      end
      object TSRotas: TTabSheet
        Caption = 'Rotas'
        ImageIndex = 2
        object GrdRotas: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 900
          Height = 341
          Align = alClient
          DataSource = DM.dsRotaEquipVenc
          DrawingStyle = gdsClassic
          FixedColor = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = GrdManutDrawColumnCell
          OnTitleClick = GrdManutTitleClick
        end
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 914
      Height = 37
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      ExplicitWidth = 910
      object Label6: TLabel
        Left = 7
        Top = 9
        Width = 142
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fam'#237'lia de Equipamento:'
      end
      object Label13: TLabel
        Left = 442
        Top = 9
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'Oficina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BtnFamiliaEquip: TButton
        Left = 385
        Top = 4
        Width = 28
        Height = 28
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BtnFamiliaEquipClick
      end
      object EdtFamiliaEquip: TEdit
        Left = 154
        Top = 6
        Width = 225
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        OnDblClick = EdtFamiliaEquipDblClick
      end
      object edtOficina: TEdit
        Left = 492
        Top = 6
        Width = 225
        Height = 24
        Hint = 'D'#234' duplo-clique para excluir o filtro.'
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        OnDblClick = edtOficinaDblClick
      end
      object BtnOficina: TButton
        Left = 723
        Top = 4
        Width = 28
        Height = 29
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnOficinaClick
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 494
    Width = 920
    TabOrder = 3
    ExplicitTop = 494
    ExplicitWidth = 920
  end
  inherited PBotoes: TPanel
    Top = 521
    Width = 920
    TabOrder = 0
    ExplicitTop = 521
    ExplicitWidth = 920
    inherited BtnOK: TButton
      Left = 382
      Caption = 'Executar'
      ModalResult = 0
      TabOrder = 1
      OnClick = BtnOKClick
      ExplicitLeft = 382
    end
    inherited BtnFechar: TButton
      Left = 466
      TabOrder = 0
      ExplicitLeft = 466
    end
  end
end

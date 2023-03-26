inherited FrmTelaInspFechamento: TFrmTelaInspFechamento
  Caption = 'Fechamento das Inspe'#231#245'es'
  ClientHeight = 561
  ClientWidth = 784
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Height = -9
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 11
  inherited PTop: TPanel
    Width = 780
    ExplicitWidth = 780
    inherited BtnAjuda: TButton
      Left = 747
      ExplicitLeft = 747
    end
    object Button6: TButton
      Left = 718
      Top = 13
      Width = 28
      Height = 28
      Hint = 'Hist'#243'rico do Equipamento F12'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisabledImageIndex = 59
      ImageAlignment = iaCenter
      ImageIndex = 58
      Images = CMWeb.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = Button6Click
    end
  end
  inherited PCentro: TPanel
    Width = 778
    Height = 422
    ExplicitWidth = 778
    ExplicitHeight = 422
    inherited RGTelas: TRadioGroup
      Width = 776
      Height = 420
      ExplicitWidth = 776
      ExplicitHeight = 420
    end
    object PBase: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 770
      Height = 414
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label11: TLabel
        Left = 5
        Top = 11
        Width = 41
        Height = 11
        Alignment = taRightJustify
        Caption = 'Execu'#231#227'o:'
      end
      object Label2: TLabel
        Left = 145
        Top = 11
        Width = 50
        Height = 11
        Caption = 'Funcion'#225'rio:'
      end
      object RGFiltro: TRadioGroup
        Left = 555
        Top = 383
        Width = 210
        Height = 28
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Vencidas'
          'A Vencer'
          'Todas')
        TabOrder = 5
        OnClick = RGFiltroClick
      end
      object BtnLimpar: TButton
        Left = 5
        Top = 389
        Width = 60
        Height = 22
        Caption = 'Limpar'
        TabOrder = 4
      end
      object PCInspecoes: TPageControl
        AlignWithMargins = True
        Left = 5
        Top = 32
        Width = 760
        Height = 356
        Margins.Top = 30
        Margins.Bottom = 24
        ActivePage = TSManut
        Align = alClient
        TabOrder = 6
        object TSManut: TTabSheet
          Caption = 'Manuten'#231#245'es'
          object GrdManutencao: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 750
            Height = 95
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            Color = clBtnFace
            DataSource = CMWeb.DSManutPeriodicas
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdManutencaoDrawColumnCell
            OnKeyPress = GrdManutencaoKeyPress
            OnTitleClick = GrdManutencaoTitleClick
          end
          object GrdItensManut: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 98
            Width = 750
            Height = 154
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            DataSource = CMWeb.DSManutPeriodicasItens
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdItensManutCellClick
            OnDrawDataCell = GrdItensManutDrawDataCell
            OnDrawColumnCell = GrdItensManutDrawColumnCell
          end
          object GrdItensEspManut: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 254
            Width = 750
            Height = 75
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alBottom
            DataSource = CMWeb.DSManutPeriodicasItensEsp
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdItensEspManutCellClick
            OnDrawDataCell = GrdItensEspManutDrawDataCell
            OnDrawColumnCell = GrdItensEspManutDrawColumnCell
          end
        end
        object TSLubrific: TTabSheet
          Caption = 'Lubrifica'#231#245'es'
          ImageIndex = 1
          object GrdLubrificacao: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 750
            Height = 95
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            Color = clBtnFace
            DataSource = CMWeb.DSLubrificPeriodicas
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdLubrificacaoDrawColumnCell
            OnKeyPress = GrdLubrificacaoKeyPress
            OnTitleClick = GrdLubrificacaoTitleClick
          end
          object GrdItensLubrific: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 98
            Width = 750
            Height = 160
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            DataSource = CMWeb.DSLubrificPeriodicasItens
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdItensLubrificCellClick
            OnDrawDataCell = GrdItensLubrificDrawDataCell
            OnDrawColumnCell = GrdItensLubrificDrawColumnCell
          end
          object GrdItensEspLubrific: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 260
            Width = 750
            Height = 75
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            DataSource = CMWeb.DSLubrificPeriodicasItensEsp
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdItensEspLubrificCellClick
            OnDrawDataCell = GrdItensEspLubrificDrawDataCell
            OnDrawColumnCell = GrdItensEspLubrificDrawColumnCell
          end
        end
        object TSRota: TTabSheet
          Caption = 'Rotas'
          ImageIndex = 2
          object GrdRota: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 410
            Height = 95
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 240
            Color = clBtnFace
            DataSource = CMWeb.DSRotaPeriodicas
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdRotaDrawColumnCell
            OnKeyPress = GrdRotaKeyPress
            OnTitleClick = GrdManutencaoTitleClick
          end
          object GrdRotaManut: TDBGrid
            AlignWithMargins = True
            Left = 413
            Top = 1
            Width = 338
            Height = 95
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 240
            Color = clBtnFace
            DataSource = CMWeb.DSRotaPeriodicasManut
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GrdRotaManutDrawColumnCell
          end
          object GrdRotaManutItens: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 99
            Width = 750
            Height = 156
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alBottom
            DataSource = CMWeb.DSRotaPeriodicasManutItens
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdRotaManutItensCellClick
            OnDrawDataCell = GrdRotaManutItensDrawDataCell
            OnDrawColumnCell = GrdRotaManutItensDrawColumnCell
          end
          object GrdRotaManutItensEsp: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 257
            Width = 750
            Height = 72
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alBottom
            DataSource = CMWeb.DSCadRotasSequenciaInspItensEsp
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdRotaManutItensEspCellClick
            OnDrawDataCell = GrdRotaManutItensEspDrawDataCell
            OnDrawColumnCell = GrdRotaManutItensEspDrawColumnCell
          end
        end
      end
      object BtnFuncionario: TButton
        Left = 434
        Top = 6
        Width = 26
        Height = 26
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = CMWeb.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnFuncionarioClick
      end
      object EdtExecucao: TJvDateEdit
        Left = 49
        Top = 8
        Width = 89
        Height = 19
        ShowNullDate = False
        TabOrder = 0
      end
      object EdtMatricula: TEdit
        Left = 200
        Top = 9
        Width = 76
        Height = 19
        Color = 14671839
        ReadOnly = True
        TabOrder = 1
      end
      object EdtResponsavel: TEdit
        Left = 278
        Top = 9
        Width = 155
        Height = 19
        Color = 14671839
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 494
    Width = 780
    ExplicitTop = 494
    ExplicitWidth = 780
  end
  inherited PBotoes: TPanel
    Top = 521
    Width = 780
    ExplicitTop = 521
    ExplicitWidth = 780
    inherited BtnOK: TButton
      Left = 304
      Width = 83
      Caption = 'Fechamento'
      ModalResult = 0
      OnClick = BtnOKClick
      ExplicitLeft = 304
      ExplicitWidth = 83
    end
    inherited BtnFechar: TButton
      Left = 392
      Width = 83
      ExplicitLeft = 392
      ExplicitWidth = 83
    end
  end
  object ImageList1: TImageList
    Left = 527
    Top = 159
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000949494008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      940084848400747474006C6C6C006C6C6C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400747474006C6C6C0064646400646464007C7C7C008C8C8C00000000000000
      000000000000000000000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C8C
      54003C5C24002424240024341C00646464006C6C6C007C7C7C008C8C8C000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006CD4
      04006CD40400448404001C3C0400747C74006C6C6C0074747400848484009494
      94000000000000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084FC
      0C0084FC14006CDC04002C5C040044543C006C6C6C006C6C6C007C7C7C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4C4A4007CFC040084FC
      140084FC140084FC14006CD404002C5C0400747474006C6C6C006C6C6C007474
      7400848484000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094D45C0084FC0C0094FC
      240094FC24008CFC240084FC0C00449404008C948C00747474006C6C6C006C6C
      6C00747474000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000006F60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCC4B400ACFC64009CFC44009CF4
      4C00BCCCB400BCF48400A4FC4C0084FC14001C3C04007C7C7C007C7C7C007474
      74006C6C6C007C7C7C008C8C8C00000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000006F600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400A4FC4C00BCC4
      B40000000000BCCCAC00B4FC6C009CFC3C004484040024341C008C8C8C007C7C
      7C00747474007474740084848400949494000000000000000000000000000000
      00000006F6000006F6000005B70000000000000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B4F4740084FC140054AC04001C3C04006C6C
      6C008C8C8C007C7C7C00848484008C8C8C000000000000000000000000000006
      F6000006F6000006F6000006F60000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BCCCAC009CFC440084FC1400449404001C34
      04008C948C008C8C8C008C8C8C009494940000000000000000000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCFC7C00A4FC4C0084FC14004494
      04001C340400000000000000000000000000000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCCCB400C4FC8C00B4FC
      6C008CFC1C0054743C000000000000000000000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCC4B400C4F4
      9400B4FC6C0074F40400B4C4A40000000000000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BCCCAC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F8FFFFFF00000000E07FFFF900000000
      E03F9FF900000000E01F87E700000000E00FC7C700000000E00FF11F00000000
      8007F81F000000008007FC7F000000000001F83F000000008800F19F00000000
      FE00E18F00000000FE00C7E700000000FF0787FF00000000FF839FFF00000000
      FFC19FFF00000000FFFBFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object CDItensProb: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 483
    Top = 286
    object CDItensProbCODITEM: TFloatField
      FieldName = 'CODITEM'
      Visible = False
    end
    object CDItensProbCODPARTE: TFloatField
      FieldName = 'CODPARTE'
      Visible = False
    end
    object CDItensProbDESCPARTE: TWideStringField
      FieldName = 'DESCPARTE'
      Visible = False
      Size = 40
    end
    object CDItensProbITEM: TWideStringField
      DisplayLabel = 'Item'
      DisplayWidth = 23
      FieldName = 'ITEM'
      Size = 40
    end
    object CDItensProbDESCINSPECAO: TWideStringField
      DisplayLabel = 'Inspe'#231#227'o'
      DisplayWidth = 70
      FieldName = 'DESCINSPECAO'
      Size = 200
    end
    object CDItensProbTEMPO: TFloatField
      DisplayLabel = 'Tempo'
      FieldName = 'TEMPO'
    end
    object CDItensProbEQUIPPARADO: TWideStringField
      DisplayLabel = 'Parado'
      FieldName = 'EQUIPPARADO'
      Size = 4
    end
    object CDItensProbEXECUTADO: TWideStringField
      DisplayLabel = 'Executado'
      FieldName = 'EXECUTADO'
      Size = 4
    end
    object CDItensProbBOM: TWideStringField
      DisplayLabel = 'Bom'
      FieldName = 'BOM'
      Size = 4
    end
    object CDItensProbREGULAR: TWideStringField
      DisplayLabel = 'Regular'
      FieldName = 'REGULAR'
      Size = 4
    end
    object CDItensProbRUIM: TWideStringField
      DisplayLabel = 'Ruim'
      FieldName = 'RUIM'
      Size = 4
    end
    object CDItensProbCODEMPRESA: TWideStringField
      FieldName = 'CODEMPRESA'
      Visible = False
      Size = 9
    end
    object CDItensProbHISTORICO: TFloatField
      FieldName = 'HISTORICO'
      Visible = False
    end
  end
  object DSItensProb: TDataSource
    DataSet = CDItensProb
    Left = 515
    Top = 310
  end
end

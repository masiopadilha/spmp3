inherited FrmTelaInspFechamento: TFrmTelaInspFechamento
  Caption = 'Fechamento das Inspe'#231#245'es'
  ClientHeight = 644
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  Font.Height = -9
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 11
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1004
    inherited BtnAjuda: TButton
      Left = 971
      Top = 15
      ExplicitLeft = 967
      ExplicitTop = 15
    end
    object Button6: TButton
      Left = 940
      Top = 15
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
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = Button6Click
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 505
    ExplicitWidth = 1002
    ExplicitHeight = 502
    inherited RGTelas: TRadioGroup
      Width = 1004
      Height = 503
      ExplicitWidth = 1000
      ExplicitHeight = 500
    end
    object PBase: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 998
      Height = 497
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 994
      ExplicitHeight = 494
      object Label11: TLabel
        Left = 13
        Top = 8
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'Execu'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 186
        Top = 8
        Width = 71
        Height = 16
        Caption = 'Funcion'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RGFiltro: TRadioGroup
        Left = 679
        Top = 540
        Width = 246
        Height = 38
        Columns = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Vencidas'
          'A Vencer'
          'Todas')
        ParentFont = False
        TabOrder = 5
        Visible = False
        OnClick = RGFiltroClick
      end
      object BtnLimpar: TButton
        Left = 5
        Top = 389
        Width = 60
        Height = 22
        Caption = 'Limpar'
        TabOrder = 4
        Visible = False
      end
      object PCInspecoes: TPageControl
        AlignWithMargins = True
        Left = 5
        Top = 32
        Width = 988
        Height = 460
        Margins.Top = 30
        ActivePage = TSRota
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ExplicitWidth = 984
        ExplicitHeight = 457
        object TSManut: TTabSheet
          Caption = 'Manuten'#231#245'es'
          object GrdManutencao: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 978
            Height = 170
            Hint = 
              'Tecle ENTER na(s) coluna(s) em negrito para realizar uma consult' +
              'a.'
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            Color = clBtnFace
            DataSource = DM.dsManutPeriodicas
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            StyleElements = [seFont, seBorder]
            OnDrawColumnCell = GrdManutencaoDrawColumnCell
            OnKeyPress = GrdManutencaoKeyPress
            OnTitleClick = GrdManutencaoTitleClick
          end
          object GrdItensManut: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 173
            Width = 978
            Height = 153
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alClient
            DataSource = DM.dsManutPeriodicasItens
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
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
            Top = 328
            Width = 978
            Height = 100
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alBottom
            DataSource = DM.dsManutPeriodicasItensEsp
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
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
            Width = 978
            Height = 170
            Hint = 
              'Tecle ENTER na(s) coluna(s) em negrito para realizar uma consult' +
              'a.'
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            Color = clBtnFace
            DataSource = DM.dsLubrificPeriodicas
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            StyleElements = [seFont, seBorder]
            OnDrawColumnCell = GrdLubrificacaoDrawColumnCell
            OnKeyPress = GrdLubrificacaoKeyPress
            OnTitleClick = GrdLubrificacaoTitleClick
          end
          object GrdItensLubrific: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 173
            Width = 978
            Height = 150
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            DataSource = DM.dsLubrificPeriodicasItens
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdItensLubrificCellClick
            OnDrawDataCell = GrdItensLubrificDrawDataCell
            OnDrawColumnCell = GrdItensLubrificDrawColumnCell
          end
          object GrdItensEspLubrific: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 325
            Width = 978
            Height = 101
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alTop
            DataSource = DM.dsLubrificPeriodicasItensEsp
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
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
            Height = 150
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Color = clBtnFace
            DataSource = DM.dsRotaPeriodicas
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            StyleElements = [seFont, seBorder]
            OnDrawColumnCell = GrdRotaDrawColumnCell
            OnKeyPress = GrdRotaKeyPress
            OnTitleClick = GrdManutencaoTitleClick
          end
          object GrdRotaManut: TDBGrid
            AlignWithMargins = True
            Left = 413
            Top = 1
            Width = 562
            Height = 150
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Color = clBtnFace
            DataSource = DM.dsRotaPeriodicasManut
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            StyleElements = [seFont, seBorder]
            OnDrawColumnCell = GrdRotaManutDrawColumnCell
          end
          object GrdRotaManutItens: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 156
            Width = 978
            Height = 170
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alBottom
            DataSource = DM.dsRotaPeriodicasManutItens
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdRotaManutItensCellClick
            OnDrawDataCell = GrdRotaManutItensDrawDataCell
            OnDrawColumnCell = GrdRotaManutItensDrawColumnCell
          end
          object GrdRotaManutItensEsp: TDBGrid
            AlignWithMargins = True
            Left = 1
            Top = 328
            Width = 978
            Height = 100
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alBottom
            DataSource = DM.dsRotaPeriodicasManutItensEsp
            DrawingStyle = gdsClassic
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = GrdRotaManutItensEspCellClick
            OnDrawDataCell = GrdRotaManutItensEspDrawDataCell
            OnDrawColumnCell = GrdRotaManutItensEspDrawColumnCell
          end
        end
      end
      object BtnFuncionario: TButton
        Left = 526
        Top = 5
        Width = 26
        Height = 26
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnFuncionarioClick
      end
      object EdtExecucao: TJvDateEdit
        Left = 75
        Top = 5
        Width = 95
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowNullDate = False
        TabOrder = 0
      end
      object EdtMatricula: TEdit
        Left = 261
        Top = 6
        Width = 76
        Height = 24
        Color = 14671839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        StyleElements = [seFont, seClient]
        OnKeyPress = EdtMatriculaKeyPress
      end
      object EdtResponsavel: TEdit
        Left = 339
        Top = 6
        Width = 185
        Height = 24
        Color = 14671839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        StyleElements = [seFont, seClient]
      end
      object rgStatus: TRadioGroup
        Left = 817
        Top = -1
        Width = 172
        Height = 40
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Todas'
          'Fechadas')
        ParentFont = False
        TabOrder = 7
        OnClick = rgStatusClick
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 577
    Width = 1008
    ExplicitTop = 574
    ExplicitWidth = 1004
    object Label1: TLabel
      Left = 919
      Top = 4
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Atualiza'#231#227'o...'
    end
  end
  inherited PBotoes: TPanel
    Top = 604
    Width = 1008
    ExplicitTop = 601
    ExplicitWidth = 1004
    inherited BtnOK: TButton
      Left = 416
      Top = 5
      Width = 83
      Height = 27
      Caption = 'Fechar'
      ModalResult = 0
      OnClick = BtnOKClick
      ExplicitLeft = 416
      ExplicitTop = 5
      ExplicitWidth = 83
      ExplicitHeight = 27
    end
    inherited BtnFechar: TButton
      Left = 505
      Top = 5
      Width = 83
      Height = 27
      ExplicitLeft = 505
      ExplicitTop = 5
      ExplicitWidth = 83
      ExplicitHeight = 27
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
    Left = 547
    Top = 286
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 658
    Top = 10
  end
end

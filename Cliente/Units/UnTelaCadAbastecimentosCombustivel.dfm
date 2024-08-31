inherited FrmTelaCadAbastecimentosCombustivel: TFrmTelaCadAbastecimentosCombustivel
  Caption = 'Combust'#237'vel'
  ClientHeight = 384
  ClientWidth = 1012
  Constraints.MaxHeight = 420
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 420
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 420
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1004
    inherited Image1: TImage
      Height = 47
    end
    object Label3: TLabel [1]
      Left = 204
      Top = 33
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel [2]
      Left = 363
      Top = 33
      Width = 7
      Height = 16
      Caption = 'a'
    end
    inherited BtnAjuda: TButton
      Left = 971
      TabOrder = 3
      ExplicitLeft = 967
    end
    object BtnConsultar: TButton
      Left = 482
      Top = 28
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnConsultarClick
    end
    object EdtData1: TJvDateTimePicker
      Left = 254
      Top = 29
      Width = 104
      Height = 24
      Date = 44883.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 0
      DropDownDate = 44883.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 375
      Top = 30
      Width = 104
      Height = 24
      Date = 44883.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 1
      DropDownDate = 44883.000000000000000000
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 247
    Margins.Bottom = 1
    ExplicitWidth = 1002
    ExplicitHeight = 244
    inherited RGTelas: TRadioGroup
      Left = 188
      Width = 0
      Height = 147
      Align = alNone
      ExplicitLeft = 188
      ExplicitWidth = 0
      ExplicitHeight = 147
    end
    object PEsquerda: TPanel
      Left = 1
      Top = 1
      Width = 210
      Height = 245
      Margins.Right = 1
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 242
      object GrdCombustivel: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 202
        Height = 237
        Align = alClient
        DataSource = DM.dsAbastecimentosCombust
        DrawingStyle = gdsClassic
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GrdCombustivelKeyDown
        OnKeyPress = GrdCombustivelKeyPress
        Columns = <
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'TIPOCOMBUSTIVEL'
            PickList.Strings = (
              'Alcool'
              'Gasolina Comum'
              'Gasolina Aditivada'
              'D'#237'esel Comum'
              'D'#237'esel Aditivado '
              'Biod'#237'esel')
            Title.Caption = 'Combust'#237'vel'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONSPOTENCIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Cons./l'
            Width = 51
            Visible = True
          end>
      end
    end
    object PDireita: TPanel
      Left = 218
      Top = 1
      Width = 787
      Height = 245
      Margins.Left = 1
      Align = alRight
      TabOrder = 2
      ExplicitLeft = 214
      ExplicitHeight = 242
      object GrdAbastCombust: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 779
        Height = 208
        Margins.Bottom = 32
        Align = alClient
        Color = clBtnFace
        DataSource = DM.dsAbastecimentosCombustAbast
        DrawingStyle = gdsClassic
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GrdAbastCombustDrawColumnCell
        OnKeyDown = GrdCombustivelKeyDown
      end
      object BtnCombust: TButton
        Left = 751
        Top = 211
        Width = 30
        Height = 29
        Hint = 'Incluir'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 13
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = BtnCombustClick
      end
      object EdtDataCombust: TDateTimePicker
        Left = 421
        Top = 213
        Width = 105
        Height = 23
        Hint = 'Data do Abastecimento'
        Date = 42090.000000000000000000
        Time = 0.507563946761365500
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object EdtLeitorCombust: TEdit
        Left = 601
        Top = 213
        Width = 78
        Height = 24
        Hint = 'Contador'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        TextHint = 'Leitor'
      end
      object EdtMatriculaCombust: TEdit
        Left = 206
        Top = 213
        Width = 208
        Height = 24
        Hint = 'Tecle ENTER para incluir o funcion'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        Text = 'Funcion'#225'rio'
        TextHint = 'Funcion'#225'rio'
        StyleElements = [seBorder]
        OnChange = EdtMatriculaCombustChange
        OnKeyPress = EdtMatriculaCombustKeyPress
      end
      object EdtPrecoCombust: TEdit
        Left = 684
        Top = 213
        Width = 63
        Height = 24
        Hint = 'Pre'#231'o do Combust'#237'vel'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TextHint = 'Pre'#231'o'
        OnKeyPress = EdtPrecoCombustKeyPress
      end
      object EdtQtdeCombust: TEdit
        Left = 532
        Top = 213
        Width = 63
        Height = 24
        Hint = 'Quantidade Abastecida'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TextHint = 'Qtde.'
      end
      object EdtRotaCombust: TEdit
        Left = 4
        Top = 213
        Width = 196
        Height = 24
        Hint = 'Tecle ENTER para incluir a rota'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowFrame
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        Text = 'Rota'
        StyleElements = [seBorder]
        OnChange = EdtRotaCombustChange
        OnKeyPress = EdtRotaCombustKeyPress
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 317
    Width = 1008
    ExplicitTop = 314
    ExplicitWidth = 1004
    object LblCustoTotal: TDBText
      AlignWithMargins = True
      Left = 939
      Top = 4
      Width = 65
      Height = 15
      Align = alRight
      AutoSize = True
      DataField = 'CUSTOTOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 13
    end
  end
  inherited PBotoes: TPanel
    Top = 344
    Width = 1008
    ExplicitTop = 341
    ExplicitWidth = 1004
    inherited BtnOK: TButton
      Left = 0
      Visible = False
      ExplicitLeft = 0
    end
    inherited BtnFechar: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
end

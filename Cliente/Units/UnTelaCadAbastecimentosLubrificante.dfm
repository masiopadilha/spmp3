inherited FrmTelaCadAbastecimentosLubrificante: TFrmTelaCadAbastecimentosLubrificante
  Caption = 'Lubrificante'
  ClientHeight = 381
  ClientWidth = 1008
  Constraints.MaxHeight = 420
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 420
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  ExplicitWidth = 1024
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1004
    ExplicitWidth = 880
    object Label3: TLabel [1]
      Left = 125
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
      Left = 284
      Top = 33
      Width = 7
      Height = 16
      Caption = 'a'
    end
    inherited BtnAjuda: TButton
      Left = 971
      ExplicitLeft = 847
    end
    object BtnConsultar: TButton
      Left = 404
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
      TabOrder = 1
      Visible = False
      OnClick = BtnConsultarClick
    end
    object EdtData1: TJvDateTimePicker
      Left = 175
      Top = 29
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 2
      DropDownDate = 44883.000000000000000000
    end
    object EdtData2: TJvDateTimePicker
      Left = 296
      Top = 30
      Width = 105
      Height = 24
      Date = 44771.000000000000000000
      Time = 0.515031701390398700
      TabOrder = 3
      DropDownDate = 44883.000000000000000000
    end
  end
  inherited PCentro: TPanel
    Width = 1002
    Height = 244
    Margins.Bottom = 1
    ExplicitWidth = 878
    ExplicitHeight = 164
    inherited RGTelas: TRadioGroup
      Left = 211
      Width = 3
      Height = 242
      ExplicitLeft = 186
      ExplicitWidth = 0
      ExplicitHeight = 162
    end
    object PEsquerda: TPanel
      Left = 1
      Top = 1
      Width = 210
      Height = 242
      Align = alLeft
      TabOrder = 1
      object GrdLubrificante: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 202
        Height = 236
        Hint = 'Tecle ENTER na(s) coluna(s) em negrito para incluir um registro.'
        Margins.Bottom = 1
        Align = alClient
        DataSource = DM.dsAbastecimentosLubrific
        DrawingStyle = gdsClassic
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = GrdLubrificanteKeyDown
        OnKeyPress = GrdLubrificanteKeyPress
        Columns = <
          item
            Color = clBtnFace
            Expanded = False
            FieldName = 'LUBRIFICANTE'
            Title.Caption = #211'leo Lubrificante'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONSPOTENCIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Cons./l'
            Width = 49
            Visible = True
          end>
      end
    end
    object PDireita: TPanel
      Left = 214
      Top = 1
      Width = 787
      Height = 242
      Align = alRight
      TabOrder = 2
      object GrdAbastLubrific: TDBGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 779
        Height = 205
        Margins.Bottom = 32
        Align = alClient
        Color = clBtnFace
        DataSource = DM.dsAbastecimentosLubrificAbast
        DrawingStyle = gdsClassic
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GrdAbastLubrificDrawColumnCell
      end
      object BtnLubrific: TButton
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
        TabOrder = 1
        OnClick = BtnLubrificClick
      end
      object EdtDataLubrific: TDateTimePicker
        Left = 421
        Top = 213
        Width = 105
        Height = 23
        Hint = 'Data da Lubrifica'#231#227'o'
        Date = 42090.000000000000000000
        Time = 0.507563946761365500
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object EdtLeitorLubrific: TEdit
        Left = 601
        Top = 213
        Width = 78
        Height = 24
        Hint = 'Contador'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TextHint = 'Leitor'
      end
      object EdtMatriculaLubrific: TEdit
        Left = 206
        Top = 213
        Width = 208
        Height = 24
        Hint = 'Tecle ENTER para incluir o funcion'#225'rio'
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        TextHint = 'Funcion'#225'rio'
        StyleElements = [seBorder]
        OnChange = EdtMatriculaLubrificChange
        OnKeyPress = EdtMatriculaLubrificKeyPress
      end
      object EdtPrecoLubrific: TEdit
        Left = 684
        Top = 213
        Width = 63
        Height = 24
        Hint = 'Pre'#231'o do Lubrificante'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        TextHint = 'Pre'#231'o'
        OnKeyPress = EdtPrecoLubrificKeyPress
      end
      object EdtQtdeLubrific: TEdit
        Left = 532
        Top = 213
        Width = 63
        Height = 24
        Hint = 'Quantidade da Lubrifica'#231#227'o'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TextHint = 'Qtde.'
      end
      object EdtRotaLubrific: TEdit
        Left = 4
        Top = 213
        Width = 196
        Height = 24
        Hint = 'Tecle ENTER para incluir a rota'
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 7
        TextHint = 'Rota'
        StyleElements = [seBorder]
        OnChange = EdtRotaLubrificChange
        OnKeyPress = EdtRotaLubrificKeyPress
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 314
    Width = 1004
    ExplicitWidth = 880
    object LblCustoTotal: TDBText
      AlignWithMargins = True
      Left = 935
      Top = 4
      Width = 65
      Height = 15
      Align = alRight
      Alignment = taRightJustify
      AutoSize = True
      DataField = 'CUSTOTOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 811
      ExplicitHeight = 13
    end
  end
  inherited PBotoes: TPanel
    Top = 341
    Width = 1004
    ExplicitWidth = 880
    inherited BtnOK: TButton
      Left = 311
      Visible = False
      ExplicitLeft = 311
    end
    inherited BtnFechar: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
end

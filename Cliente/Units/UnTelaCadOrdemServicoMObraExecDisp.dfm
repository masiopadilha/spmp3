inherited FrmTelaCadOrdemServicoMObraDisp: TFrmTelaCadOrdemServicoMObraDisp
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'M'#227'o de Obra Dispon'#237'vel'
  ClientWidth = 624
  Constraints.MaxWidth = 640
  Constraints.MinWidth = 640
  OnCreate = FormCreate
  ExplicitWidth = 640
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 620
    ExplicitWidth = 620
    inherited BtnAjuda: TButton
      Left = 587
      ExplicitLeft = 587
    end
  end
  inherited PCentro: TPanel
    Width = 618
    ExplicitWidth = 618
    inherited RGTelas: TRadioGroup
      Left = 494
      Width = 0
      ExplicitLeft = 494
      ExplicitWidth = 0
    end
    object GrdMaodeObraDisp: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 487
      Height = 154
      Align = alLeft
      Color = 14671839
      DataSource = DM.dsOrdemServicoMObraDisp
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = GrdMaodeObraDispDblClick
      OnKeyDown = GrdMaodeObraDispKeyDown
      OnKeyPress = GrdMaodeObraDispKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MATRICULA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Matr'#237'cula'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 127
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OCUPADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Ocupado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PROGRAMADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Programado'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HHPROG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'HH Prog.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EQUIPESP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Especialista'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end>
    end
    object PImagem: TPanel
      AlignWithMargins = True
      Left = 494
      Top = 4
      Width = 120
      Height = 154
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 14671839
      ParentBackground = False
      TabOrder = 2
      object ImgFotoFunc: TImage
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 110
        Height = 110
        Align = alTop
        Center = True
        Proportional = True
        Stretch = True
        ExplicitWidth = 128
      end
      object LblApelido: TDBText
        Left = 5
        Top = 120
        Width = 110
        Height = 15
        Alignment = taCenter
        DataField = 'APELIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited PAuxiliares: TPanel
    Width = 620
    ExplicitWidth = 620
  end
  inherited PBotoes: TPanel
    Width = 620
    ExplicitWidth = 620
    inherited BtnOK: TButton
      Left = 232
      ModalResult = 0
      OnClick = BtnOKClick
      ExplicitLeft = 232
    end
    inherited BtnFechar: TButton
      Left = 313
      ExplicitLeft = 313
    end
  end
end

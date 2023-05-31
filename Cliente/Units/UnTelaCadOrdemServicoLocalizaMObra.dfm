inherited FrmTelaCadOrdemServicoLocalizaMObra: TFrmTelaCadOrdemServicoLocalizaMObra
  Caption = 'Localizar M'#227'o de Obra'
  ClientHeight = 642
  ClientWidth = 1012
  Constraints.MaxHeight = 680
  Constraints.MaxWidth = 1024
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1024
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 1024
  ExplicitHeight = 680
  TextHeight = 16
  inherited PTop: TPanel
    Width = 1008
    ExplicitWidth = 1002
    DesignSize = (
      1008
      60)
    inherited BtnAjuda: TButton
      Left = 977
      ExplicitLeft = 971
    end
    object BtnImprimir: TButton
      Left = 941
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      DisabledImageIndex = 16
      ImageAlignment = iaCenter
      ImageIndex = 15
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnImprimirClick
    end
  end
  inherited PCentro: TPanel
    Width = 1006
    Height = 503
    ExplicitWidth = 1000
    ExplicitHeight = 494
    inherited RGTelas: TRadioGroup
      Left = 307
      Width = 1
      Height = 501
      TabOrder = 1
      ExplicitLeft = 307
      ExplicitWidth = 0
      ExplicitHeight = 492
    end
    object GrdMObra: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 300
      Height = 495
      Align = alLeft
      Color = 14671839
      DataSource = DM.dsOrdemServicoLocalizaMObra
      DrawingStyle = gdsClassic
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyPress = GrdMObraKeyPress
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Alignment = taCenter
          Title.Caption = 'Matr'#237'cula'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 190
          Visible = True
        end>
    end
    object POS: TPanel
      Left = 308
      Top = 1
      Width = 697
      Height = 501
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 302
      ExplicitHeight = 492
      object GrdMObraOSProg: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 691
        Height = 246
        Align = alTop
        Color = 14671839
        DataSource = DM.dsOrdemServicoLocalizaMObraOSProg
        DrawingStyle = gdsClassic
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GrdMObraOSProgDrawColumnCell
      end
      object GrdMObraOSExec: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 255
        Width = 691
        Height = 242
        Align = alTop
        Color = 14671839
        DataSource = DM.dsOrdemServicoLocalizaMObraOSExec
        DrawingStyle = gdsClassic
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GrdMObraOSExecDrawColumnCell
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 575
    Width = 1008
    ExplicitTop = 566
    ExplicitWidth = 1002
  end
  inherited PBotoes: TPanel
    Top = 602
    Width = 1008
    ExplicitTop = 593
    ExplicitWidth = 1002
    inherited BtnOK: TButton
      Left = 100
      Visible = False
      ExplicitLeft = 100
    end
    inherited BtnFechar: TButton
      Left = 465
      ExplicitLeft = 465
    end
  end
  object PopupMenuRelat: TPopupMenu
    Left = 756
    Top = 16
    object Individual1: TMenuItem
      Caption = 'Individual'
      OnClick = Individual1Click
    end
    object Completo1: TMenuItem
      Caption = 'Completo'
      OnClick = Completo1Click
    end
  end
end

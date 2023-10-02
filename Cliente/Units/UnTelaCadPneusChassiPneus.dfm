inherited FrmTelaCadPneusChassiPneus: TFrmTelaCadPneusChassiPneus
  Caption = 'Pneus Cadastrados'
  ClientHeight = 564
  ClientWidth = 548
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 560
  Constraints.MinHeight = 600
  Constraints.MinWidth = 560
  OnCreate = FormCreate
  ExplicitWidth = 560
  ExplicitHeight = 600
  TextHeight = 16
  inherited PTop: TPanel
    Width = 544
    ExplicitWidth = 540
    inherited BtnAjuda: TButton
      Left = 510
      ExplicitLeft = 506
    end
    object Button6: TButton
      Left = 446
      Top = 17
      Width = 28
      Height = 28
      Hint = 'Hist'#243'rico do Pneu'
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
      OnClick = Button6Click
    end
    object BtnImprimir: TButton
      Left = 476
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
      TabOrder = 2
      OnClick = BtnImprimirClick
    end
  end
  inherited PCentro: TPanel
    Width = 542
    Height = 425
    ExplicitWidth = 538
    ExplicitHeight = 422
    inherited RGTelas: TRadioGroup
      Top = 31
      Width = 540
      Height = 393
      ExplicitTop = 31
      ExplicitWidth = 536
      ExplicitHeight = 390
    end
    object GrdCadastro: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 32
      Width = 534
      Height = 389
      Margins.Top = 1
      Align = alClient
      Color = 14671839
      DataSource = DM.dsPneusChassiPneus
      DrawingStyle = gdsClassic
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PNEU'
          Title.Caption = 'Pneu'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 143
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POSICAO'
          Title.Caption = 'Posi'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 168
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RODADOS'
          Title.Alignment = taCenter
          Title.Caption = 'Rodados'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Custo (R$)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 72
          Visible = True
        end>
    end
    object EdtConsulta: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 534
      Height = 24
      Hint = 
        'Informe o ID do pneu, caso n'#227'o exista ser'#225' cadastrado como um no' +
        'vo pneu.'
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = EdtConsultaChange
      OnKeyPress = EdtConsultaKeyPress
      ExplicitWidth = 530
    end
  end
  inherited PAuxiliares: TPanel
    Top = 497
    Width = 544
    ExplicitTop = 494
    ExplicitWidth = 540
  end
  inherited PBotoes: TPanel
    Top = 524
    Width = 544
    ExplicitTop = 521
    ExplicitWidth = 540
    inherited BtnOK: TButton
      Left = 191
      OnClick = BtnOKClick
      ExplicitLeft = 191
    end
    inherited BtnFechar: TButton
      Left = 272
      ExplicitLeft = 272
    end
  end
end

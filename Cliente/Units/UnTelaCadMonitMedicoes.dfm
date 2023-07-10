inherited FrmTelaCadMonitMedicoes: TFrmTelaCadMonitMedicoes
  Caption = 'Medi'#231#245'es do Equipamento'
  ClientHeight = 324
  ClientWidth = 508
  Constraints.MaxHeight = 380
  Constraints.MaxWidth = 530
  Constraints.MinHeight = 380
  Constraints.MinWidth = 530
  OnCreate = FormCreate
  ExplicitWidth = 530
  ExplicitHeight = 380
  TextHeight = 16
  inherited PTop: TPanel
    Width = 504
    ExplicitWidth = 510
    inherited BtnAjuda: TButton
      Left = 477
      ExplicitLeft = 477
    end
  end
  inherited PCentro: TPanel
    Width = 502
    Height = 185
    ExplicitWidth = 508
    ExplicitHeight = 202
    inherited RGTelas: TRadioGroup
      Width = 506
      Height = 200
      ExplicitWidth = 506
      ExplicitHeight = 200
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 506
      Height = 200
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label7: TLabel
        Left = 5
        Top = 6
        Width = 79
        Height = 16
        Alignment = taRightJustify
        Caption = 'Equipamento:'
      end
      object GrdCadastro: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 30
        Width = 500
        Height = 140
        Margins.Top = 30
        Margins.Bottom = 30
        Align = alClient
        Color = clBtnFace
        DrawingStyle = gdsClassic
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = GrdCadastroDrawColumnCell
        OnDblClick = GrdCadastroDblClick
      end
      object EdtFuncionario: TEdit
        Left = 5
        Top = 173
        Width = 258
        Height = 24
        Color = clBtnFace
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
      end
      object EdtData: TDateTimePicker
        Left = 296
        Top = 175
        Width = 89
        Height = 21
        Date = 44816.000000000000000000
        Time = 0.460756608787050900
        TabOrder = 2
      end
      object BtnCadastrar: TButton
        Left = 481
        Top = 173
        Width = 22
        Height = 23
        Hint = 'Cadastrar'
        DisabledImageIndex = 13
        ImageAlignment = iaCenter
        ImageIndex = 13
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BtnCadastrarClick
      end
      object BtnEquipamento: TButton
        Left = 265
        Top = 173
        Width = 25
        Height = 24
        Hint = 'Consultar'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BtnEquipamentoClick
      end
      object EdtMedicao: TEdit
        Left = 392
        Top = 173
        Width = 84
        Height = 24
        TabOrder = 5
        OnKeyPress = EdtMedicaoKeyPress
      end
      object edtCodEquip: TEdit
        Left = 90
        Top = 3
        Width = 98
        Height = 24
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
      end
      object edtDescEquip: TEdit
        Left = 189
        Top = 3
        Width = 287
        Height = 24
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 7
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 257
    Width = 504
    ExplicitTop = 274
    ExplicitWidth = 510
  end
  inherited PBotoes: TPanel
    Top = 284
    Width = 504
    ExplicitTop = 301
    ExplicitWidth = 510
    inherited BtnOK: TButton
      Left = 35
      Visible = False
      ExplicitLeft = 35
    end
    inherited BtnFechar: TButton
      Left = 218
      ExplicitLeft = 218
    end
  end
end

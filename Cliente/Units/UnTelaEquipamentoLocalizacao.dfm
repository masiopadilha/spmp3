inherited FrmTelaEquipamentoLocalizacao: TFrmTelaEquipamentoLocalizacao
  Caption = 'Localiza'#231#227'o do Equipamento'
  ClientHeight = 221
  ClientWidth = 684
  Constraints.MaxHeight = 260
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 260
  Constraints.MinWidth = 700
  OnCreate = FormCreate
  ExplicitWidth = 700
  ExplicitHeight = 260
  PixelsPerInch = 96
  TextHeight = 13
  inherited PTop: TPanel
    Width = 680
    ExplicitWidth = 680
    inherited BtnAjuda: TButton
      Left = 646
      ExplicitLeft = 646
    end
  end
  inherited PCentro: TPanel
    Width = 678
    Height = 82
    ExplicitWidth = 678
    ExplicitHeight = 82
    inherited RGTelas: TRadioGroup
      Width = 676
      Height = 80
      ExplicitWidth = 676
      ExplicitHeight = 80
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 676
      Height = 80
      Align = alClient
      BevelOuter = bvNone
      Color = 14671839
      ParentBackground = False
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 7
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = #193'rea:'
      end
      object Label2: TLabel
        Left = 355
        Top = 7
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#233'lula:'
      end
      object Label3: TLabel
        Left = 6
        Top = 35
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Linha:'
      end
      object Label4: TLabel
        Left = 335
        Top = 35
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sequ'#234'ncia:'
      end
      object LblCodigo: TDBText
        Left = 39
        Top = 60
        Width = 97
        Height = 13
        Alignment = taCenter
        DataField = 'CODIGO'
        DataSource = CMWeb.DSEquipamentoLocal
      end
      object LblDescricao: TDBText
        Left = 137
        Top = 60
        Width = 59
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = CMWeb.DSEquipamentoLocal
      end
      object EdtCodArea: TEdit
        Left = 39
        Top = 5
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object EdtArea: TEdit
        Left = 137
        Top = 5
        Width = 155
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object EdtCodCelula: TEdit
        Left = 392
        Top = 5
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object EdtCelula: TEdit
        Left = 490
        Top = 5
        Width = 155
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object BtnArea: TButton
        Left = 293
        Top = 1
        Width = 28
        Height = 28
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = CMWeb.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BtnAreaClick
      end
      object BtnCelula: TButton
        Left = 645
        Top = 1
        Width = 28
        Height = 28
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = CMWeb.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BtnCelulaClick
      end
      object EdtCodLinha: TEdit
        Left = 39
        Top = 33
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 6
      end
      object EdtLinha: TEdit
        Left = 137
        Top = 33
        Width = 155
        Height = 21
        ReadOnly = True
        TabOrder = 7
      end
      object BtnLinha: TButton
        Left = 293
        Top = 29
        Width = 28
        Height = 28
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = CMWeb.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BtnLinhaClick
      end
      object EdtCodSequencia: TEdit
        Left = 392
        Top = 33
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 9
      end
      object EdtSequencia: TEdit
        Left = 490
        Top = 33
        Width = 155
        Height = 21
        ReadOnly = True
        TabOrder = 10
      end
      object BtnSequencia: TButton
        Left = 645
        Top = 29
        Width = 28
        Height = 28
        Hint = 'Consultar'
        DisabledImageIndex = 111114
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = CMWeb.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = BtnSequenciaClick
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 154
    Width = 680
    ExplicitTop = 154
    ExplicitWidth = 680
  end
  inherited PBotoes: TPanel
    Top = 181
    Width = 680
    ExplicitTop = 181
    ExplicitWidth = 680
    inherited BtnOK: TButton
      Left = 261
      ExplicitLeft = 261
    end
    inherited BtnFechar: TButton
      Left = 342
      OnClick = BtnFecharClick
      ExplicitLeft = 342
    end
  end
end

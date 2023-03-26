inherited FrmTelaOpcoes: TFrmTelaOpcoes
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es'
  ClientHeight = 379
  ClientWidth = 394
  Constraints.MaxHeight = 408
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 408
  Constraints.MinWidth = 400
  OnCreate = FormCreate
  ExplicitWidth = 400
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 390
    ExplicitWidth = 390
    inherited BtnAjuda: TButton
      Left = 357
      ExplicitLeft = 357
    end
  end
  inherited PCentro: TPanel
    Width = 388
    Height = 240
    ExplicitWidth = 388
    ExplicitHeight = 240
    inherited RGTelas: TRadioGroup
      Width = 386
      Height = 238
      ExplicitWidth = 386
      ExplicitHeight = 238
    end
    object PFundo: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 380
      Height = 232
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 10
        Width = 122
        Height = 32
        Caption = 'Buscar novas ordens de servi'#231'os (min):'
        WordWrap = True
      end
      object Label2: TLabel
        Left = 11
        Top = 82
        Width = 123
        Height = 32
        Caption = 'Validade da senha do usu'#225'rio (d):'
        WordWrap = True
      end
      object Label3: TLabel
        Left = 188
        Top = 11
        Width = 133
        Height = 32
        Caption = 'Quantidade m'#237'nima de caracteres da senha:'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 188
        Top = 82
        Width = 163
        Height = 32
        Caption = 'Quantidade m'#225'xima de tentivas incorretas  de login:'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 11
        Top = 150
        Width = 129
        Height = 32
        Caption = 'Tempo m'#225'ximo ocioso do usu'#225'rio (min):'
        WordWrap = True
      end
      object edttempoconsos: TDBEdit
        Left = 11
        Top = 48
        Width = 75
        Height = 24
        DataField = 'tempoconsos'
        DataSource = DM.dsConfigs
        TabOrder = 0
      end
      object edttemposenhausu: TDBEdit
        Left = 11
        Top = 118
        Width = 75
        Height = 24
        DataField = 'temposenhausu'
        DataSource = DM.dsConfigs
        TabOrder = 1
      end
      object edtqtdeminsenha: TDBEdit
        Left = 188
        Top = 48
        Width = 75
        Height = 24
        DataField = 'qtdeminsenha'
        DataSource = DM.dsConfigs
        TabOrder = 2
      end
      object edtqtdelogintent: TDBEdit
        Left = 188
        Top = 118
        Width = 75
        Height = 24
        DataField = 'qtdelogintent'
        DataSource = DM.dsConfigs
        TabOrder = 3
      end
      object edttempoocioso: TDBEdit
        Left = 11
        Top = 188
        Width = 75
        Height = 24
        DataField = 'tempomaxocioso'
        DataSource = DM.dsConfigs
        TabOrder = 4
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 312
    Width = 390
    ExplicitTop = 312
    ExplicitWidth = 390
  end
  inherited PBotoes: TPanel
    Top = 339
    Width = 390
    ExplicitTop = 339
    ExplicitWidth = 390
    inherited BtnOK: TButton
      Left = 116
      OnClick = BtnOKClick
      ExplicitLeft = 116
    end
    inherited BtnFechar: TButton
      Left = 198
      OnClick = BtnFecharClick
      ExplicitLeft = 198
    end
  end
end

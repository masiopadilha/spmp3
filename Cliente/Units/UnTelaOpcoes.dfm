inherited FrmTelaOpcoes: TFrmTelaOpcoes
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es'
  ClientHeight = 372
  ClientWidth = 388
  Constraints.MaxHeight = 408
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 408
  Constraints.MinWidth = 400
  OnCreate = FormCreate
  ExplicitWidth = 400
  ExplicitHeight = 408
  TextHeight = 16
  inherited PTop: TPanel
    Width = 384
    ExplicitWidth = 380
    inherited BtnAjuda: TButton
      Left = 351
      ExplicitLeft = 351
    end
  end
  inherited PCentro: TPanel
    Width = 382
    Height = 233
    ExplicitWidth = 378
    ExplicitHeight = 230
    inherited RGTelas: TRadioGroup
      Width = 380
      Height = 231
      ExplicitWidth = 376
      ExplicitHeight = 228
    end
    object PFundo: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 374
      Height = 225
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 370
      ExplicitHeight = 222
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
      object DBCheckBox1: TDBCheckBox
        Left = 188
        Top = 151
        Width = 164
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Atualiza'#231#227'o Autom'#225'tica:'
        DataField = 'autoupdate'
        DataSource = DM.dsConfigs
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 305
    Width = 384
    ExplicitTop = 302
    ExplicitWidth = 380
  end
  inherited PBotoes: TPanel
    Top = 332
    Width = 384
    ExplicitTop = 329
    ExplicitWidth = 380
    inherited BtnOK: TButton
      Left = 114
      OnClick = BtnOKClick
      ExplicitLeft = 114
    end
    inherited BtnFechar: TButton
      Left = 195
      OnClick = BtnFecharClick
      ExplicitLeft = 195
    end
  end
end

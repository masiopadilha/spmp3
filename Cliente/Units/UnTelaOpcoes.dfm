inherited FrmTelaOpcoes: TFrmTelaOpcoes
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es'
  ClientHeight = 469
  ClientWidth = 573
  Constraints.MaxHeight = 505
  Constraints.MaxWidth = 585
  Constraints.MinHeight = 450
  Constraints.MinWidth = 585
  OnCreate = FormCreate
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 585
  ExplicitHeight = 505
  TextHeight = 16
  inherited PTop: TPanel
    Width = 569
    ExplicitWidth = 563
    inherited Image1: TImage
      Height = 47
    end
    inherited BtnAjuda: TButton
      Left = 532
      ExplicitLeft = 526
    end
  end
  inherited PCentro: TPanel
    Width = 567
    Height = 330
    ExplicitWidth = 561
    ExplicitHeight = 264
    inherited RGTelas: TRadioGroup
      Width = 565
      Height = 328
      ExplicitWidth = 559
      ExplicitHeight = 262
    end
    object PFundo: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 559
      Height = 322
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 553
      ExplicitHeight = 256
      object Label1: TLabel
        Left = 12
        Top = 10
        Width = 226
        Height = 16
        Caption = 'Buscar novas ordens de servi'#231'os (min):'
        WordWrap = True
      end
      object Label2: TLabel
        Left = 11
        Top = 62
        Width = 195
        Height = 16
        Caption = 'Validade da senha do usu'#225'rio (d):'
        WordWrap = True
      end
      object Label3: TLabel
        Left = 295
        Top = 11
        Width = 254
        Height = 16
        Caption = 'Quantidade m'#237'nima de caracteres da senha:'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 295
        Top = 62
        Width = 250
        Height = 16
        Caption = 'Quantidade de tentivas incorretas  de login:'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 11
        Top = 112
        Width = 132
        Height = 16
        Caption = 'Tempo ocioso A (min):'
        WordWrap = True
      end
      object Label6: TLabel
        Left = 295
        Top = 112
        Width = 131
        Height = 16
        Caption = 'Tempo ocioso B (min):'
        WordWrap = True
      end
      object Label7: TLabel
        Left = 12
        Top = 264
        Width = 36
        Height = 16
        Caption = 'Email:'
        WordWrap = True
      end
      object Label8: TLabel
        Left = 223
        Top = 264
        Width = 41
        Height = 16
        Caption = 'Senha:'
        WordWrap = True
      end
      object Label9: TLabel
        Left = 363
        Top = 264
        Width = 35
        Height = 16
        Caption = 'Porta:'
        WordWrap = True
      end
      object Label10: TLabel
        Left = 418
        Top = 264
        Width = 38
        Height = 16
        Caption = 'SMTP:'
        WordWrap = True
      end
      object edttempoconsos: TDBEdit
        Left = 11
        Top = 30
        Width = 75
        Height = 24
        DataField = 'tempoconsos'
        DataSource = DM.dsConfigs
        TabOrder = 0
      end
      object edttemposenhausu: TDBEdit
        Left = 11
        Top = 81
        Width = 75
        Height = 24
        DataField = 'temposenhausu'
        DataSource = DM.dsConfigs
        TabOrder = 1
      end
      object edtqtdeminsenha: TDBEdit
        Left = 295
        Top = 30
        Width = 75
        Height = 24
        DataField = 'qtdeminsenha'
        DataSource = DM.dsConfigs
        TabOrder = 3
      end
      object edtqtdelogintent: TDBEdit
        Left = 295
        Top = 81
        Width = 75
        Height = 24
        DataField = 'qtdelogintent'
        DataSource = DM.dsConfigs
        TabOrder = 4
      end
      object edttempoociosoA: TDBEdit
        Left = 11
        Top = 131
        Width = 75
        Height = 24
        DataField = 'tempomaxocioso'
        DataSource = DM.dsConfigs
        TabOrder = 2
      end
      object edttempoociosoB: TDBEdit
        Left = 295
        Top = 131
        Width = 75
        Height = 24
        DataField = 'tempomaxociosoB'
        DataSource = DM.dsConfigs
        TabOrder = 5
      end
      object GBDashboard: TGroupBox
        Left = 12
        Top = 161
        Width = 537
        Height = 97
        Caption = 'Dashboard:'
        TabOrder = 6
        object chbSolicTrab: TDBCheckBox
          Left = 8
          Top = 24
          Width = 166
          Height = 17
          Caption = 'Solicita'#231#245'es de trabalho'
          DataField = 'dbsolictrab'
          DataSource = DM.dsConfigs
          TabOrder = 0
        end
        object chbOficinas: TDBCheckBox
          Left = 8
          Top = 45
          Width = 75
          Height = 17
          Caption = 'Oficinas'
          DataField = 'dboficinas'
          DataSource = DM.dsConfigs
          TabOrder = 1
        end
        object chbSituacaoOS: TDBCheckBox
          Left = 8
          Top = 66
          Width = 205
          Height = 17
          Caption = 'Situa'#231#227'o das ordens de servi'#231'o'
          DataField = 'dbsituacaoos'
          DataSource = DM.dsConfigs
          TabOrder = 2
        end
        object chbOSTipoManut: TDBCheckBox
          Left = 283
          Top = 22
          Width = 270
          Height = 17
          Caption = 'Ordens de Servi'#231'o por manuten'#231#227'o'
          DataField = 'dbtipomanutos'
          DataSource = DM.dsConfigs
          TabOrder = 3
        end
        object chbMTBF: TDBCheckBox
          Left = 283
          Top = 45
          Width = 206
          Height = 17
          Caption = 'MTBF, MTTR e Disponibilidade'
          DataField = 'dbmtbf'
          DataSource = DM.dsConfigs
          TabOrder = 4
        end
      end
      object edtEmail: TDBEdit
        Left = 12
        Top = 283
        Width = 205
        Height = 24
        DataField = 'email'
        DataSource = DM.dsConfigs
        TabOrder = 7
      end
      object edtSenhaEmail: TDBEdit
        Left = 223
        Top = 283
        Width = 134
        Height = 24
        DataField = 'senhaemail'
        DataSource = DM.dsConfigs
        PasswordChar = '*'
        TabOrder = 8
      end
      object edtPortaEmail: TDBEdit
        Left = 363
        Top = 283
        Width = 48
        Height = 24
        DataField = 'portaemail'
        DataSource = DM.dsConfigs
        TabOrder = 9
      end
      object edtSMTP: TDBEdit
        Left = 418
        Top = 283
        Width = 127
        Height = 24
        DataField = 'smtp'
        DataSource = DM.dsConfigs
        TabOrder = 10
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 402
    Width = 569
    ExplicitTop = 336
    ExplicitWidth = 563
  end
  inherited PBotoes: TPanel
    Top = 429
    Width = 569
    ExplicitTop = 363
    ExplicitWidth = 563
    inherited BtnOK: TButton
      Left = 206
      OnClick = BtnOKClick
      ExplicitLeft = 206
    end
    inherited BtnFechar: TButton
      Left = 287
      OnClick = BtnFecharClick
      ExplicitLeft = 287
    end
  end
end

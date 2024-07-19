inherited FrmTelaOpcoes: TFrmTelaOpcoes
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es'
  ClientHeight = 414
  ClientWidth = 573
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 585
  Constraints.MinHeight = 445
  Constraints.MinWidth = 585
  OnCreate = FormCreate
  ExplicitWidth = 585
  ExplicitHeight = 450
  TextHeight = 16
  inherited PTop: TPanel
    Width = 569
    ExplicitWidth = 565
    inherited BtnAjuda: TButton
      Left = 532
      ExplicitLeft = 528
    end
  end
  inherited PCentro: TPanel
    Width = 567
    Height = 275
    ExplicitWidth = 563
    ExplicitHeight = 272
    inherited RGTelas: TRadioGroup
      Width = 565
      Height = 273
      ExplicitWidth = 561
      ExplicitHeight = 270
    end
    object PFundo: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 559
      Height = 267
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 555
      ExplicitHeight = 264
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
        TabOrder = 2
      end
      object edtqtdelogintent: TDBEdit
        Left = 295
        Top = 81
        Width = 75
        Height = 24
        DataField = 'qtdelogintent'
        DataSource = DM.dsConfigs
        TabOrder = 3
      end
      object edttempoociosoA: TDBEdit
        Left = 11
        Top = 131
        Width = 75
        Height = 24
        DataField = 'tempomaxocioso'
        DataSource = DM.dsConfigs
        TabOrder = 4
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
    end
  end
  inherited PAuxiliares: TPanel
    Top = 347
    Width = 569
    ExplicitTop = 344
    ExplicitWidth = 565
  end
  inherited PBotoes: TPanel
    Top = 374
    Width = 569
    ExplicitTop = 371
    ExplicitWidth = 565
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

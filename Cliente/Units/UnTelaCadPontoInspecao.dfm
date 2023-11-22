inherited FrmTelaCadPontoInspecao: TFrmTelaCadPontoInspecao
  Caption = 'Pontos de Inspe'#231#227'o'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 506
      ExplicitLeft = 502
    end
    inherited LAlteradoPor: TLabel
      Left = 528
      ExplicitLeft = 524
    end
    inherited LblDataAlt: TDBText
      Left = 560
      DataSource = DM.dsPontosInspecao
      ExplicitLeft = 560
    end
    inherited LblDataCad: TDBText
      Left = 432
      DataSource = DM.dsPontosInspecao
      ExplicitLeft = 432
    end
    inherited LblUsuAlt: TDBText
      Left = 560
      DataSource = DM.dsPontosInspecao
      ExplicitLeft = 560
    end
    inherited LblUsuCad: TDBText
      Left = 432
      DataSource = DM.dsPontosInspecao
      ExplicitLeft = 432
    end
    inherited LCadastro: TLabel
      Left = 400
      ExplicitLeft = 396
    end
    inherited LCadastroPor: TLabel
      Left = 362
      ExplicitLeft = 358
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object PCPontos: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 616
      Height = 315
      ActivePage = TSPontos
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PCPontosChange
      ExplicitWidth = 612
      ExplicitHeight = 312
      object TSPontos: TTabSheet
        Caption = 'Pontos de Inspe'#231#227'o'
        object Label1: TLabel
          Left = 187
          Top = 73
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'C'#243'digo:'
          FocusControl = EdtCodigo
        end
        object Label2: TLabel
          Left = 171
          Top = 103
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label6: TLabel
          Left = 89
          Top = 133
          Width = 142
          Height = 16
          Alignment = taRightJustify
          Caption = 'Fam'#237'lia de Equipamento:'
        end
        object BtnFamiliaEquip: TButton
          Left = 433
          Top = 130
          Width = 28
          Height = 28
          Hint = 'Consultar'
          DisabledImageIndex = 111114
          ImageAlignment = iaCenter
          ImageIndex = 14
          Images = DM.ImageListBotoes
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BtnFamiliaEquipClick
        end
        object EdtCodigo: TDBEdit
          Tag = 555
          Left = 234
          Top = 70
          Width = 131
          Height = 24
          CharCase = ecUpperCase
          DataField = 'CODIGO'
          DataSource = DM.dsPontosInspecao
          TabOrder = 0
          OnExit = EdtCodigoExit
          OnKeyPress = FormKeyPress
        end
        object EdtDescricao: TDBEdit
          Left = 234
          Top = 101
          Width = 227
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsPontosInspecao
          TabOrder = 1
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtFamiliaEquip: TDBEdit
          Left = 234
          Top = 132
          Width = 197
          Height = 24
          Color = clBtnFace
          DataField = 'FAMILIAEQUIP'
          DataSource = DM.dsPontosInspecao
          ReadOnly = True
          TabOrder = 2
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
      end
      object TSLocais: TTabSheet
        Caption = 'Locais de Medi'#231#227'o'
        ImageIndex = 1
        object Label3: TLabel
          Left = 170
          Top = 53
          Width = 60
          Height = 16
          Caption = 'Descri'#231#227'o:'
          FocusControl = EdtDescLocal
        end
        object Label4: TLabel
          Left = 149
          Top = 83
          Width = 81
          Height = 16
          Alignment = taRightJustify
          Caption = 'Programa'#231#227'o:'
        end
        object Label5: TLabel
          Left = 186
          Top = 114
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'Leitura:'
        end
        object Label15: TLabel
          Left = 340
          Top = 114
          Width = 51
          Height = 16
          Alignment = taRightJustify
          Caption = 'Unidade:'
        end
        object Label16: TLabel
          Left = 147
          Top = 144
          Width = 83
          Height = 16
          Caption = 'Lim. Inf. M'#225'x.:'
        end
        object Label17: TLabel
          Left = 309
          Top = 144
          Width = 82
          Height = 16
          Caption = 'Lim. Inf. Seg.:'
        end
        object Label18: TLabel
          Left = 141
          Top = 175
          Width = 89
          Height = 16
          Caption = 'Lim. Sup. Seg.:'
        end
        object Label19: TLabel
          Left = 301
          Top = 175
          Width = 90
          Height = 16
          Caption = 'Lim. Sup. M'#225'x.:'
        end
        object EdtDescLocal: TDBEdit
          Left = 234
          Top = 50
          Width = 227
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsPontosInspecaoLoc
          TabOrder = 0
          OnExit = TabNextTab1AfterTabChange
        end
        object EdtProgramacao: TDBEdit
          Left = 234
          Top = 81
          Width = 197
          Height = 24
          Color = clBtnFace
          DataField = 'TIPOPROGRAMACAO'
          DataSource = DM.dsPontosInspecaoLoc
          ReadOnly = True
          TabOrder = 1
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object BtnProgramacao: TButton
          Left = 433
          Top = 79
          Width = 28
          Height = 28
          Hint = 'Consultar'
          DisabledImageIndex = 111114
          ImageAlignment = iaCenter
          ImageIndex = 14
          Images = DM.ImageListBotoes
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BtnProgramacaoClick
        end
        object CBLeitura: TDBComboBox
          Left = 234
          Top = 112
          Width = 93
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'EMISSAOOS'
          DataSource = DM.dsPontosInspecaoLoc
          Items.Strings = (
            'Medi'#231#227'o'
            'Diferen'#231'a')
          TabOrder = 3
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtUnidade: TDBEdit
          Left = 395
          Top = 112
          Width = 65
          Height = 24
          DataField = 'UNIDMEDIDA'
          DataSource = DM.dsPontosInspecaoLoc
          TabOrder = 4
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtLimInfMax: TDBEdit
          Left = 234
          Top = 141
          Width = 65
          Height = 24
          DataField = 'LIMINFMAX'
          DataSource = DM.dsPontosInspecaoLoc
          MaxLength = 16
          TabOrder = 5
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtLimInfSeg: TDBEdit
          Left = 395
          Top = 141
          Width = 65
          Height = 24
          DataField = 'LIMINFSEG'
          DataSource = DM.dsPontosInspecaoLoc
          MaxLength = 16
          TabOrder = 6
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtLimSupSeg: TDBEdit
          Left = 234
          Top = 172
          Width = 65
          Height = 24
          DataField = 'LIMSUPSEG'
          DataSource = DM.dsPontosInspecaoLoc
          MaxLength = 16
          TabOrder = 7
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtLimSupMax: TDBEdit
          Left = 395
          Top = 172
          Width = 65
          Height = 24
          DataField = 'LIMSUPMAX'
          DataSource = DM.dsPontosInspecaoLoc
          MaxLength = 16
          TabOrder = 8
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 405
    Width = 628
  end
  inherited PAuxiliares: TPanel
    Top = 378
    Width = 624
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 414
    Top = 260
  end
end

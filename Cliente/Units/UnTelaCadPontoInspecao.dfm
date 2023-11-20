inherited FrmTelaCadPontoInspecao: TFrmTelaCadPontoInspecao
  Caption = 'Pontos de Inspe'#231#227'o'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 661
    end
    inherited LAlteradoPor: TLabel
      Left = 683
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsPontosInspecao
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsPontosInspecao
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsPontosInspecao
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsPontosInspecao
    end
    inherited LCadastro: TLabel
      Left = 558
    end
    inherited LCadastroPor: TLabel
      Left = 520
    end
  end
  inherited PCentro: TPanel
    object PCPontos: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 776
      Height = 243
      ActivePage = TSPontos
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PCPontosChange
      ExplicitWidth = 772
      ExplicitHeight = 240
      object TSPontos: TTabSheet
        Caption = 'Pontos de Inspe'#231#227'o'
        object Label1: TLabel
          Left = 65
          Top = 73
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'C'#243'digo:'
          FocusControl = EdtCodigo
        end
        object Label2: TLabel
          Left = 202
          Top = 73
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label6: TLabel
          Left = 435
          Top = 73
          Width = 142
          Height = 16
          Alignment = taRightJustify
          Caption = 'Fam'#237'lia de Equipamento:'
        end
        object BtnFamiliaEquip: TButton
          Left = 637
          Top = 91
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
          Left = 65
          Top = 91
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
          Left = 202
          Top = 91
          Width = 227
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsPontosInspecao
          TabOrder = 1
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtFamiliaEquip: TDBEdit
          Left = 435
          Top = 91
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
          Left = 65
          Top = 53
          Width = 60
          Height = 16
          Caption = 'Descri'#231#227'o:'
          FocusControl = EdtDescLocal
        end
        object Label4: TLabel
          Left = 298
          Top = 53
          Width = 81
          Height = 16
          Alignment = taRightJustify
          Caption = 'Programa'#231#227'o:'
        end
        object Label5: TLabel
          Left = 535
          Top = 53
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'Leitura:'
        end
        object Label15: TLabel
          Left = 633
          Top = 53
          Width = 51
          Height = 16
          Alignment = taRightJustify
          Caption = 'Unidade:'
        end
        object Label16: TLabel
          Left = 65
          Top = 101
          Width = 83
          Height = 16
          Caption = 'Lim. Inf. M'#225'x.:'
        end
        object Label17: TLabel
          Left = 160
          Top = 101
          Width = 82
          Height = 16
          Caption = 'Lim. Inf. Seg.:'
        end
        object Label18: TLabel
          Left = 256
          Top = 101
          Width = 89
          Height = 16
          Caption = 'Lim. Sup. Seg.:'
        end
        object Label19: TLabel
          Left = 359
          Top = 101
          Width = 90
          Height = 16
          Caption = 'Lim. Sup. M'#225'x.:'
        end
        object EdtDescLocal: TDBEdit
          Left = 65
          Top = 71
          Width = 227
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsPontosInspecaoLoc
          TabOrder = 0
          OnExit = TabNextTab1AfterTabChange
        end
        object EdtProgramacao: TDBEdit
          Left = 298
          Top = 71
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
          Left = 498
          Top = 69
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
          Left = 534
          Top = 72
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
          Left = 633
          Top = 71
          Width = 65
          Height = 24
          DataField = 'UNIDMEDIDA'
          DataSource = DM.dsPontosInspecaoLoc
          TabOrder = 4
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtLimInfMax: TDBEdit
          Left = 65
          Top = 123
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
          Left = 160
          Top = 123
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
          Left = 256
          Top = 123
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
          Left = 359
          Top = 123
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
  inherited PopupMenuRelat: TPopupMenu
    Left = 156
    Top = 16
  end
  inherited ActionList1: TActionList
    Left = 402
    Top = 11
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 278
    Top = 20
  end
end

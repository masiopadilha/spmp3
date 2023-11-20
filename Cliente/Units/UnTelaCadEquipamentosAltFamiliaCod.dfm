inherited FrmTelaCadEquipamentosAltFamiliaCod: TFrmTelaCadEquipamentosAltFamiliaCod
  Caption = 'Altera'#231#227'o de C'#243'digo da Fam'#237'lia do Equipamento'
  ClientHeight = 304
  ClientWidth = 488
  OnShow = FormShow
  TextHeight = 16
  inherited PTop: TPanel
    Width = 484
    inherited BtnAjuda: TButton
      Left = 506
      ExplicitLeft = 502
    end
  end
  inherited PCentro: TPanel
    Width = 482
    Height = 165
    object pBase: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 474
      Height = 157
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 470
      ExplicitHeight = 154
      object Label1: TLabel
        Left = 13
        Top = 64
        Width = 83
        Height = 16
        Caption = 'C'#243'digo antigo:'
      end
      object Label2: TLabel
        Left = 13
        Top = 95
        Width = 83
        Height = 16
        Caption = 'Novo c'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 17
        Top = 33
        Width = 79
        Height = 16
        Alignment = taRightJustify
        Caption = 'Equipamento:'
      end
      object edtCodAntigo: TMaskEdit
        Left = 101
        Top = 62
        Width = 125
        Height = 24
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 0
        Text = ''
        StyleElements = [seFont, seClient]
        OnKeyPress = edtCodAntigoKeyPress
      end
      object edtNovoAntigo: TMaskEdit
        Left = 101
        Top = 94
        Width = 125
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 1
        Text = ''
      end
      object EdtCodEquipamento: TDBEdit
        Tag = 555
        Left = 101
        Top = 31
        Width = 125
        Height = 24
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'CODEQUIPAMENTO'
        DataSource = DM.dsOrdemServico
        ReadOnly = True
        TabOrder = 2
        StyleElements = [seFont, seClient]
      end
      object EdtDescEquipamento: TDBEdit
        Left = 229
        Top = 31
        Width = 204
        Height = 24
        Color = clBtnFace
        Ctl3D = True
        DataField = 'EQUIPAMENTO'
        DataSource = DM.dsOrdemServico
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        StyleElements = [seFont, seClient]
      end
      object BtnEquipamento: TButton
        Left = 438
        Top = 29
        Width = 28
        Height = 28
        Hint = 'Consultar/Cadastrar (Ctrl'
        DisabledImageIndex = 14
        ImageAlignment = iaCenter
        ImageIndex = 14
        Images = DM.ImageListBotoes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BtnEquipamentoClick
      end
      object MaskEdit1: TMaskEdit
        Left = 229
        Top = 62
        Width = 121
        Height = 24
        TabOrder = 5
        Text = ''
        Visible = False
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 237
    Width = 484
  end
  inherited PBotoes: TPanel
    Top = 264
    Width = 484
    inherited BtnOK: TButton
      Left = 164
      OnClick = BtnOKClick
      ExplicitLeft = 164
    end
    inherited BtnFechar: TButton
      Left = 246
      ExplicitLeft = 246
    end
  end
end

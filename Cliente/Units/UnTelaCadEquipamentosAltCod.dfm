inherited FrmTelaCadEquipamentosAltCod: TFrmTelaCadEquipamentosAltCod
  Caption = 'Altera'#231#227'o de C'#243'digo do Equipamento'
  OnShow = FormShow
  TextHeight = 16
  inherited PTop: TPanel
    inherited BtnAjuda: TButton
      Left = 469
      ExplicitLeft = 469
    end
  end
  inherited PCentro: TPanel
    object pBase: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 494
      Height = 157
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 490
      ExplicitHeight = 154
      object Label1: TLabel
        Left = 125
        Top = 51
        Width = 83
        Height = 16
        Caption = 'C'#243'digo antigo:'
      end
      object Label2: TLabel
        Left = 125
        Top = 82
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
      object edtCodAntigo: TMaskEdit
        Left = 212
        Top = 49
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 0
        Text = ''
        OnKeyPress = edtCodAntigoKeyPress
      end
      object edtNovoAntigo: TMaskEdit
        Left = 212
        Top = 81
        Width = 121
        Height = 24
        CharCase = ecUpperCase
        TabOrder = 1
        Text = ''
        OnKeyPress = edtCodAntigoKeyPress
      end
      object MaskEdit1: TMaskEdit
        Left = 339
        Top = 19
        Width = 121
        Height = 24
        TabOrder = 2
        Text = ''
        Visible = False
      end
    end
  end
  inherited PBotoes: TPanel
    inherited BtnOK: TButton
      Caption = 'Gravar'
      ModalResult = 0
      OnClick = BtnOKClick
    end
  end
end

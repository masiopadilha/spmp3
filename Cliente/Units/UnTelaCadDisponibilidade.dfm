inherited FrmTelaCadDisponibilidade: TFrmTelaCadDisponibilidade
  Caption = 'Disponibilidades Admiss'#237'veis'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 661
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
      Left = 683
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LblDataAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsDispAdmissiveis
    end
    inherited LblDataCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsDispAdmissiveis
    end
    inherited LblUsuAlt: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsDispAdmissiveis
    end
    inherited LblUsuCad: TDBText
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsDispAdmissiveis
    end
    inherited LCadastro: TLabel
      Left = 558
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Left = 520
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PCentro: TPanel
    object Label6: TLabel
      Left = 71
      Top = 104
      Width = 31
      Height = 16
      Alignment = taRightJustify
      Caption = #205'tem:'
    end
    object Label5: TLabel
      Left = 71
      Top = 153
      Width = 35
      Height = 16
      Alignment = taRightJustify
      Caption = 'Valor:'
    end
    object EdtItem: TDBEdit
      Left = 71
      Top = 123
      Width = 230
      Height = 24
      Color = clBtnFace
      DataField = 'AREA'
      DataSource = DM.dsDispAdmissiveis
      ReadOnly = True
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnItem: TButton
      Left = 305
      Top = 121
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnItemClick
    end
    object EdtValor: TDBEdit
      Left = 71
      Top = 171
      Width = 125
      Height = 24
      DataField = 'VALITEM'
      DataSource = DM.dsDispAdmissiveis
      MaxLength = 14
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
  object RGTipo: TDBRadioGroup [4]
    Left = 64
    Top = 125
    Width = 303
    Height = 46
    Caption = 'Tipo:'
    Columns = 3
    DataField = 'TIPOITEM'
    DataSource = DM.dsDispAdmissiveis
    Items.Strings = (
      #193'rea'
      'C'#233'lula'
      'Equipamento')
    TabOrder = 4
    OnChange = RGTipoChange
    OnExit = TabNextTab1AfterTabChange
  end
end

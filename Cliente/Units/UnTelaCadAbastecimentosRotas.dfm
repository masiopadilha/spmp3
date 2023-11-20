inherited FrmTelaCadAbastecimentosRotas: TFrmTelaCadAbastecimentosRotas
  Caption = 'Rotas'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Visible = False
    end
    inherited LAlteradoPor: TLabel
      Visible = False
    end
    inherited LblDataAlt: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblDataCad: TDBText
      DataField = ''
      DataSource = DM.dsAbastecimentosRotas
      Visible = False
    end
    inherited LblUsuAlt: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblUsuCad: TDBText
      DataField = ''
      Visible = False
    end
    inherited LCadastro: TLabel
      Visible = False
    end
    inherited LCadastroPor: TLabel
      Visible = False
    end
  end
  inherited PCentro: TPanel
    object Label2: TLabel
      Left = 174
      Top = 60
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label4: TLabel
      Left = 378
      Top = 90
      Width = 17
      Height = 16
      Alignment = taRightJustify
      Caption = '%:'
    end
    object Label5: TLabel
      Left = 146
      Top = 120
      Width = 88
      Height = 16
      Alignment = taRightJustify
      Caption = 'Dist'#226'ncia (Km):'
    end
    object Label6: TLabel
      Left = 156
      Top = 151
      Width = 78
      Height = 16
      Alignment = taRightJustify
      Caption = 'Observa'#231#245'es:'
    end
    object Label1: TLabel
      Left = 204
      Top = 90
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object EdtDescricao: TDBEdit
      Left = 238
      Top = 58
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsAbastecimentosRotas
      TabOrder = 0
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPercentual: TDBEdit
      Left = 399
      Top = 89
      Width = 69
      Height = 24
      DataField = 'PORCENTAGEM'
      DataSource = DM.dsAbastecimentosRotas
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDistancia: TDBEdit
      Left = 238
      Top = 118
      Width = 125
      Height = 24
      DataField = 'DISTANCIA'
      DataSource = DM.dsAbastecimentosRotas
      TabOrder = 3
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object CBTipo: TDBComboBox
      Left = 238
      Top = 89
      Width = 125
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'TIPO'
      DataSource = DM.dsAbastecimentosRotas
      Items.Strings = (
        'Asfaltada'
        'N'#227'o Asfaltada')
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
    object MObservacoes: TDBMemo
      Left = 238
      Top = 149
      Width = 230
      Height = 89
      DataField = 'OBSERVACOES'
      DataSource = DM.dsAbastecimentosRotas
      TabOrder = 4
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Top = 44
  end
end

inherited FrmTelaCadAreas: TFrmTelaCadAreas
  Caption = #193'reas'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
    inherited LblDataAlt: TDBText
      DataSource = DM.dsAreas
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsAreas
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsAreas
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsAreas
    end
    inherited LCadastro: TLabel
      Left = 553
      ExplicitLeft = 553
    end
    inherited LCadastroPor: TLabel
      Left = 515
      ExplicitLeft = 515
    end
  end
  inherited PCentro: TPanel
    Left = 4
    Top = 75
    Width = 776
    Height = 244
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 75
    ExplicitWidth = 784
    ExplicitHeight = 244
    object PCAreas: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 768
      Height = 236
      ActivePage = TSAreas
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PCAreasChange
      object TSAreas: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #193'reas'
        object Label1: TLabel
          Left = 432
          Top = 80
          Width = 71
          Height = 16
          Alignment = taRightJustify
          Caption = 'Ftr. Marcha:'
        end
        object Label4: TLabel
          Left = 195
          Top = 80
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label2: TLabel
          Left = 64
          Top = 80
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object EdtFtrMarcha: TDBEdit
          Left = 432
          Top = 97
          Width = 91
          Height = 24
          DataField = 'FATORMARCHADM'
          DataSource = DM.dsAreas
          MaxLength = 14
          TabOrder = 2
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtDescricao: TDBEdit
          Left = 195
          Top = 97
          Width = 230
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsAreas
          TabOrder = 1
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object ChbVisivelNF: TDBCheckBox
          Left = 605
          Top = 101
          Width = 71
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Vis'#237'vel:'
          DataField = 'VISIVEL'
          DataSource = DM.dsAreas
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnExit = TabNextTab1AfterTabChange
        end
        object ChbAtivoNF: TDBCheckBox
          Left = 530
          Top = 101
          Width = 63
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Ativo:'
          DataField = 'ATIVO'
          DataSource = DM.dsAreas
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnExit = TabNextTab1AfterTabChange
        end
        object EdtCodigo: TDBEdit
          Tag = 555
          Left = 64
          Top = 97
          Width = 125
          Height = 24
          CharCase = ecUpperCase
          DataField = 'CODIGO'
          DataSource = DM.dsAreas
          ReadOnly = True
          TabOrder = 0
          OnExit = EdtCodigoExit
          OnKeyPress = FormKeyPress
        end
      end
      object TSCelulas: TTabSheet
        Caption = 'C'#233'lulas'
        ImageIndex = 1
        object Label6: TLabel
          Left = 431
          Top = 80
          Width = 30
          Height = 16
          Alignment = taRightJustify
          Caption = 'Tipo:'
        end
        object Label7: TLabel
          Left = 562
          Top = 80
          Width = 71
          Height = 16
          Alignment = taRightJustify
          Caption = 'Ftr. Marcha:'
        end
        object Label3: TLabel
          Left = 64
          Top = 80
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object Label5: TLabel
          Left = 195
          Top = 80
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object EdtFtrMarchaCel: TDBEdit
          Left = 562
          Top = 97
          Width = 125
          Height = 24
          DataField = 'FATORMARCHADM'
          DataSource = DM.dsCelulas
          MaxLength = 14
          TabOrder = 3
          OnKeyPress = FormKeyPress
        end
        object CBTipo: TDBComboBox
          Left = 431
          Top = 98
          Width = 125
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'TIPO'
          DataSource = DM.dsCelulas
          Items.Strings = (
            'Administrativa'
            'Apoio T'#233'cnico'
            'Civil'
            'El'#233'trica'
            'Mec'#226'nica'
            'Produtiva'
            'Utilidades')
          TabOrder = 2
          OnKeyPress = FormKeyPress
        end
        object EdtCodCelula: TDBEdit
          Tag = 555
          Left = 64
          Top = 97
          Width = 125
          Height = 24
          CharCase = ecUpperCase
          DataField = 'CODIGO'
          DataSource = DM.dsCelulas
          ReadOnly = True
          TabOrder = 0
          OnExit = EdtCodigoExit
          OnKeyPress = FormKeyPress
        end
        object EdtDescCelula: TDBEdit
          Left = 195
          Top = 97
          Width = 230
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsCargos
          TabOrder = 1
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
      end
      object TSLinhas: TTabSheet
        Caption = 'Linhas'
        ImageIndex = 2
        object Label8: TLabel
          Left = 195
          Top = 80
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label9: TLabel
          Left = 64
          Top = 80
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object EdtDescLinha: TDBEdit
          Left = 195
          Top = 97
          Width = 230
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsLinhas
          TabOrder = 0
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object EdtCodLinha: TDBEdit
          Tag = 555
          Left = 64
          Top = 97
          Width = 125
          Height = 24
          CharCase = ecUpperCase
          DataField = 'CODIGO'
          DataSource = DM.dsLinhas
          ReadOnly = True
          TabOrder = 1
          OnExit = EdtCodigoExit
          OnKeyPress = FormKeyPress
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 352
    Width = 784
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 212
    Top = 32
  end
  inherited ActionList1: TActionList
    Left = 378
    Top = 27
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 294
    Top = 28
  end
end

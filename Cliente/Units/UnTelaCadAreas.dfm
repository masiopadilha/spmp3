inherited FrmTelaCadAreas: TFrmTelaCadAreas
  Caption = #193'reas'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
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
  end
  inherited PCentro: TPanel
    Left = 4
    Top = 53
    Width = 616
    Height = 316
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 53
    ExplicitWidth = 616
    ExplicitHeight = 316
    object PCAreas: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 608
      Height = 308
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
        object Label2: TLabel
          Left = 190
          Top = 60
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object Label4: TLabel
          Left = 174
          Top = 90
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label1: TLabel
          Left = 163
          Top = 122
          Width = 71
          Height = 16
          Alignment = taRightJustify
          Caption = 'Ftr. Marcha:'
        end
        object EdtCodigo: TDBEdit
          Tag = 555
          Left = 238
          Top = 58
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
        object EdtDescricao: TDBEdit
          Left = 238
          Top = 89
          Width = 230
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsAreas
          TabOrder = 1
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object ChbAtivoNF: TDBCheckBox
          Left = 198
          Top = 149
          Width = 58
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
        object ChbVisivelNF: TDBCheckBox
          Left = 298
          Top = 149
          Width = 65
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
        object EdtFtrMarcha: TDBEdit
          Left = 238
          Top = 120
          Width = 125
          Height = 24
          DataField = 'FATORMARCHADM'
          DataSource = DM.dsAreas
          MaxLength = 14
          TabOrder = 2
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
      end
      object TSCelulas: TTabSheet
        Caption = 'C'#233'lulas'
        ImageIndex = 1
        object Label3: TLabel
          Left = 190
          Top = 60
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object Label5: TLabel
          Left = 174
          Top = 90
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label6: TLabel
          Left = 204
          Top = 120
          Width = 30
          Height = 16
          Alignment = taRightJustify
          Caption = 'Tipo:'
        end
        object Label7: TLabel
          Left = 163
          Top = 150
          Width = 71
          Height = 16
          Alignment = taRightJustify
          Caption = 'Ftr. Marcha:'
        end
        object EdtCodCelula: TDBEdit
          Tag = 555
          Left = 238
          Top = 58
          Width = 125
          Height = 24
          CharCase = ecUpperCase
          DataField = 'CODIGO'
          DataSource = DM.dsCelulas
          ReadOnly = True
          TabOrder = 0
          OnExit = EdtCodCelulaExit
          OnKeyPress = FormKeyPress
        end
        object EdtDescCelula: TDBEdit
          Left = 238
          Top = 89
          Width = 230
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsCelulas
          TabOrder = 1
          OnKeyPress = FormKeyPress
        end
        object EdtFtrMarchaCel: TDBEdit
          Left = 238
          Top = 149
          Width = 125
          Height = 24
          DataField = 'FATORMARCHADM'
          DataSource = DM.dsCelulas
          MaxLength = 14
          TabOrder = 3
          OnKeyPress = FormKeyPress
        end
        object CBTipo: TDBComboBox
          Left = 238
          Top = 120
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
      end
      object TSLinhas: TTabSheet
        Caption = 'Linhas'
        ImageIndex = 2
        object Label9: TLabel
          Left = 174
          Top = 90
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label8: TLabel
          Left = 190
          Top = 60
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object EdtCodLinha: TDBEdit
          Tag = 555
          Left = 238
          Top = 58
          Width = 125
          Height = 24
          CharCase = ecUpperCase
          DataField = 'CODIGO'
          DataSource = DM.dsLinhas
          ReadOnly = True
          TabOrder = 0
          OnExit = EdtCodLinhaExit
          OnKeyPress = FormKeyPress
        end
        object EdtDescLinha: TDBEdit
          Left = 238
          Top = 89
          Width = 230
          Height = 24
          DataField = 'DESCRICAO'
          DataSource = DM.dsLinhas
          TabOrder = 1
          OnKeyPress = FormKeyPress
        end
      end
    end
  end
end

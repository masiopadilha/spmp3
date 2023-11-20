inherited FrmTelaCadFamiliaEquipamento: TFrmTelaCadFamiliaEquipamento
  Caption = 'Fam'#237'lias de Equipamentos'
  ClientHeight = 609
  ClientWidth = 1117
  Constraints.MinWidth = 700
  ExplicitWidth = 1129
  ExplicitHeight = 665
  TextHeight = 16
  inherited PControle: TPanel
    Width = 1113
    ExplicitWidth = 776
  end
  inherited PCentro: TPanel
    Width = 1113
    Height = 486
    ExplicitWidth = 776
    inherited PageControlCRUD: TPageControl
      Width = 1108
      Height = 478
      ExplicitWidth = 771
      inherited TabSheetLista: TTabSheet
        ExplicitWidth = 1096
        ExplicitHeight = 438
        inherited PanelCor: TPanel
          Width = 1096
          Height = 438
          ExplicitWidth = 759
          inherited pJvDBGridLista: TPanel
            Width = 1096
            Height = 438
            ExplicitWidth = 759
            inherited pSearchBox: TPanel
              Width = 1090
              ExplicitWidth = 753
              inherited ChbAtivoCons: TCheckBox
                Left = 938
                ExplicitLeft = 601
              end
              inherited chbVisivelCons: TCheckBox
                Left = 1012
                ExplicitLeft = 675
              end
            end
            inherited JvDBGridLista: TJvDBGrid
              Width = 1092
              Height = 390
            end
          end
        end
      end
      inherited TabSheetCadastra: TTabSheet
        ExplicitWidth = 1094
        ExplicitHeight = 438
        inherited ScrollBox1: TScrollBox
          Width = 1094
          Height = 438
          ExplicitWidth = 1094
          ExplicitHeight = 438
          inherited PanelColor: TPanel
            Width = 1094
            Height = 438
            ExplicitWidth = 1094
            ExplicitHeight = 438
            inherited LCadastroPor: TLabel
              Left = 849
              Top = 20
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblUsuCad: TDBText
              Left = 921
              Top = 20
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataSource = DM.dsFamEquipamento
              ExplicitLeft = 921
              ExplicitTop = 20
            end
            inherited LAlteracao: TLabel
              Left = 990
              Top = 20
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblUsuAlt: TDBText
              Left = 1046
              Top = 20
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataSource = DM.dsFamEquipamento
              ExplicitLeft = 1046
              ExplicitTop = 20
            end
            inherited LCadastro: TLabel
              Left = 887
              Top = 73
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblDataAlt: TDBText
              Left = 921
              Top = 73
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataSource = DM.dsFamEquipamento
              ExplicitLeft = 921
              ExplicitTop = 73
            end
            inherited LAlteradoPor: TLabel
              Left = 1012
              Top = 73
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblDataCad: TDBText
              Left = 1040
              Top = 73
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataSource = DM.dsFamEquipamento
              ExplicitLeft = 1040
              ExplicitTop = 73
            end
            object Label1: TLabel
              Left = 541
              Top = 56
              Width = 52
              Height = 16
              Caption = 'Campo3:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 541
              Top = 103
              Width = 52
              Height = 16
              Caption = 'Campo6:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 301
              Top = 150
              Width = 52
              Height = 16
              Caption = 'Campo8:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 64
              Top = 197
              Width = 59
              Height = 16
              Caption = 'Campo10:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 541
              Top = 197
              Width = 59
              Height = 16
              Caption = 'Campo12:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 64
              Top = 9
              Width = 44
              Height = 16
              Caption = 'C'#243'digo:'
            end
            object Label3: TLabel
              Left = 301
              Top = 103
              Width = 52
              Height = 16
              Caption = 'Campo5:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 64
              Top = 56
              Width = 52
              Height = 16
              Caption = 'Campo1:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 195
              Top = 9
              Width = 60
              Height = 16
              Alignment = taRightJustify
              Caption = 'Descri'#231#227'o:'
            end
            object Label5: TLabel
              Left = 64
              Top = 150
              Width = 52
              Height = 16
              Caption = 'Campo7:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 541
              Top = 150
              Width = 52
              Height = 16
              Caption = 'Campo9:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 301
              Top = 197
              Width = 59
              Height = 16
              Caption = 'Campo11:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 301
              Top = 56
              Width = 52
              Height = 16
              Caption = 'Campo2:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 64
              Top = 103
              Width = 52
              Height = 16
              Caption = 'Campo4:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object ChbAtivoNF: TDBCheckBox
              Left = 539
              Top = 31
              Width = 63
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Ativo:'
              DataField = 'ATIVO'
              DataSource = DM.dsFamEquipamento
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo1: TDBCheckBox
              Left = 275
              Top = 78
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N1'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo10: TDBCheckBox
              Left = 275
              Top = 219
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N10'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo11: TDBCheckBox
              Left = 512
              Top = 219
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N11'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo12: TDBCheckBox
              Left = 751
              Top = 219
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N12'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo2: TDBCheckBox
              Left = 512
              Top = 78
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N2'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo3: TDBCheckBox
              Left = 751
              Top = 78
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N3'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo4: TDBCheckBox
              Left = 275
              Top = 125
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N4'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object ChbCampo5: TDBCheckBox
              Left = 512
              Top = 125
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N5'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo6: TDBCheckBox
              Left = 751
              Top = 125
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N6'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo7: TDBCheckBox
              Left = 275
              Top = 172
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N7'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo8: TDBCheckBox
              Left = 512
              Top = 172
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N8'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbCampo9: TDBCheckBox
              Left = 751
              Top = 172
              Width = 16
              Height = 17
              Hint = 'Campo num'#233'rico?'
              DataField = 'N9'
              DataSource = DM.dsFamEquipamento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 12
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object ChbVisivelNF: TDBCheckBox
              Left = 608
              Top = 31
              Width = 71
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Vis'#237'vel:'
              DataField = 'VISIVEL'
              DataSource = DM.dsFamEquipamento
              TabOrder = 13
              ValueChecked = 'S'
              ValueUnchecked = 'N'
              OnExit = TabNextTab1AfterTabChange
            end
            object EdtCampo1: TDBEdit
              Left = 64
              Top = 74
              Width = 205
              Height = 24
              DataField = 'CAMPO1'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 14
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo10: TDBEdit
              Left = 64
              Top = 215
              Width = 205
              Height = 24
              DataField = 'CAMPO10'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 15
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo11: TDBEdit
              Left = 301
              Top = 215
              Width = 205
              Height = 24
              DataField = 'CAMPO11'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 16
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo12: TDBEdit
              Left = 541
              Top = 215
              Width = 205
              Height = 24
              DataField = 'CAMPO12'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 17
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo2: TDBEdit
              Left = 301
              Top = 74
              Width = 205
              Height = 24
              DataField = 'CAMPO2'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 18
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo3: TDBEdit
              Left = 541
              Top = 74
              Width = 205
              Height = 24
              DataField = 'CAMPO3'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 19
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo4: TDBEdit
              Left = 64
              Top = 121
              Width = 205
              Height = 24
              DataField = 'CAMPO4'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 20
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo5: TDBEdit
              Left = 301
              Top = 121
              Width = 205
              Height = 24
              DataField = 'CAMPO5'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 21
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo6: TDBEdit
              Left = 541
              Top = 121
              Width = 205
              Height = 24
              DataField = 'CAMPO6'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 22
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo7: TDBEdit
              Left = 64
              Top = 168
              Width = 205
              Height = 24
              DataField = 'CAMPO7'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 23
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo8: TDBEdit
              Left = 301
              Top = 168
              Width = 205
              Height = 24
              DataField = 'CAMPO8'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 24
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCampo9: TDBEdit
              Left = 541
              Top = 168
              Width = 205
              Height = 24
              DataField = 'CAMPO9'
              DataSource = DM.dsFamEquipamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 25
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCodigo: TDBEdit
              Tag = 555
              Left = 64
              Top = 27
              Width = 125
              Height = 24
              CharCase = ecUpperCase
              DataField = 'CODIGO'
              DataSource = DM.dsFamEquipamento
              ReadOnly = True
              TabOrder = 26
              OnExit = EdtCodigoExit
              OnKeyPress = FormKeyPress
            end
            object EdtDescricao: TDBEdit
              Left = 195
              Top = 27
              Width = 333
              Height = 24
              DataField = 'DESCRICAO'
              DataSource = DM.dsFamEquipamento
              TabOrder = 27
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 590
    Width = 1117
    ExplicitWidth = 780
  end
  inherited PAuxiliares: TPanel
    Top = 563
    Width = 1113
    ExplicitWidth = 776
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 356
    Top = 24
  end
  inherited ActionList1: TActionList
    Left = 426
    Top = 27
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 270
    Top = 28
  end
end

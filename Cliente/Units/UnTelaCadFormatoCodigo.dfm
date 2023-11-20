inherited FrmTelaCadFormatoCodigo: TFrmTelaCadFormatoCodigo
  Caption = 'Formato de C'#243'digo'
  ClientHeight = 795
  ClientWidth = 948
  Constraints.MinWidth = 960
  ExplicitWidth = 960
  ExplicitHeight = 851
  TextHeight = 16
  inherited PControle: TPanel
    Width = 944
    ExplicitWidth = 1101
    inherited BtnAjuda1: TButton
      Left = 103
      Width = 40
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '(F1)'
      Font.Charset = ANSI_CHARSET
      Font.Height = -9
      Font.Name = 'Open Sans Semibold'
      Font.Style = [fsBold]
      ImageAlignment = iaTop
      ImageMargins.Top = 3
      ParentFont = False
      ExplicitLeft = 103
      ExplicitWidth = 40
      ExplicitHeight = 38
    end
    inherited BtnCancelar1: TButton
      Left = 54
      Width = 40
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '(Ctrl + D)'
      Font.Charset = ANSI_CHARSET
      Font.Height = -9
      Font.Name = 'Open Sans Semibold'
      Font.Style = [fsBold]
      ImageAlignment = iaTop
      ImageMargins.Top = 3
      ParentFont = False
      ExplicitLeft = 54
      ExplicitWidth = 40
      ExplicitHeight = 38
    end
    inherited BtnConsultar1: TButton
      Left = 76
      Width = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 76
      ExplicitWidth = 0
    end
    inherited BtnExcluir1: TButton
      Left = 60
      Width = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 60
      ExplicitWidth = 0
    end
    inherited BtnImagem1: TButton
      Left = 201
      Width = 40
      Height = 38
      Font.Charset = ANSI_CHARSET
      Font.Height = -9
      Font.Name = 'Open Sans Semibold'
      Font.Style = [fsBold]
      ImageMargins.Top = 3
      ParentFont = False
      ExplicitLeft = 201
      ExplicitWidth = 40
      ExplicitHeight = 38
    end
    inherited BtnImprimir1: TButton
      Left = 105
      Width = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 105
      ExplicitWidth = 0
    end
    inherited BtnNovo1: TButton
      Width = 0
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 0
    end
    inherited BtnSair1: TButton
      Left = 152
      Width = 40
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '(ESC)'
      Font.Charset = ANSI_CHARSET
      Font.Height = -9
      Font.Name = 'Open Sans Semibold'
      Font.Style = [fsBold]
      ImageAlignment = iaTop
      ImageMargins.Top = 3
      ParentFont = False
      ExplicitLeft = 152
      ExplicitWidth = 40
      ExplicitHeight = 38
    end
    inherited BtnSalvar1: TButton
      Left = 6
      Width = 40
      Height = 38
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '(Ctrl + S)'
      Font.Charset = ANSI_CHARSET
      Font.Height = -9
      Font.Name = 'Open Sans Semibold'
      Font.Style = [fsBold]
      ImageAlignment = iaTop
      ImageMargins.Top = 3
      ParentFont = False
      ExplicitLeft = 6
      ExplicitWidth = 40
      ExplicitHeight = 38
    end
    inherited btnNovo: TBitBtn
      Top = -65
      TabStop = False
      Visible = False
      ExplicitTop = -65
    end
    inherited btnSalvar: TBitBtn
      Left = 8
      ExplicitLeft = 8
    end
    inherited btnCancelar: TBitBtn
      Left = 64
      ExplicitLeft = 64
    end
    inherited btnExcluir: TBitBtn
      Top = -65
      TabStop = False
      Visible = False
      ExplicitTop = -65
    end
    inherited btnConsultar: TBitBtn
      Left = 120
      Visible = False
      ExplicitLeft = 120
    end
    inherited btnImprimir: TBitBtn
      Top = -65
      TabStop = False
      Visible = False
      ExplicitTop = -65
    end
    inherited btnAjuda: TBitBtn
      Top = -65
      ExplicitTop = -65
    end
    inherited btnSair: TBitBtn
      Left = 265
      ExplicitLeft = 265
    end
  end
  inherited PCentro: TPanel
    Width = 944
    Height = 672
    ExplicitWidth = 1101
    ExplicitHeight = 669
    inherited PageControlCRUD: TPageControl
      Width = 939
      Height = 664
      ActivePage = TabSheetCadastra
      ExplicitWidth = 1096
      ExplicitHeight = 661
      inherited TabSheetLista: TTabSheet
        ExplicitWidth = 927
        ExplicitHeight = 624
        inherited PanelCor: TPanel
          Width = 927
          Height = 624
          ExplicitWidth = 1093
          ExplicitHeight = 624
          inherited pJvDBGridLista: TPanel
            Width = 927
            Height = 624
            ExplicitWidth = 1093
            ExplicitHeight = 624
            inherited pSearchBox: TPanel
              Width = 921
              ExplicitWidth = 1087
              inherited ChbAtivoCons: TCheckBox
                Left = 769
                ExplicitLeft = 935
              end
              inherited chbVisivelCons: TCheckBox
                Left = 843
                ExplicitLeft = 1009
              end
            end
            inherited JvDBGridLista: TJvDBGrid
              Width = 923
              Height = 576
            end
          end
        end
      end
      inherited TabSheetCadastra: TTabSheet
        ExplicitWidth = 925
        ExplicitHeight = 624
        inherited ScrollBox1: TScrollBox
          Width = 925
          Height = 624
          ExplicitWidth = 1082
          ExplicitHeight = 621
          inherited PanelColor: TPanel
            Width = 925
            Height = 624
            ExplicitWidth = 1082
            ExplicitHeight = 621
            inherited LCadastroPor: TLabel
              Left = 766
              Top = 10
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Visible = False
              ExplicitLeft = 927
              ExplicitTop = 10
            end
            inherited LblUsuCad: TDBText
              Left = 837
              Top = 10
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataField = ''
              Visible = False
              ExplicitLeft = 1003
              ExplicitTop = 10
            end
            inherited LAlteracao: TLabel
              Left = 782
              Top = 23
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Visible = False
              ExplicitLeft = 948
              ExplicitTop = 23
            end
            inherited LblUsuAlt: TDBText
              Left = 837
              Top = 23
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataField = ''
              DataSource = DM.dsFormatoCodigo
              Visible = False
              ExplicitLeft = 1003
              ExplicitTop = 23
            end
            inherited LCadastro: TLabel
              Left = 804
              Top = 36
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Visible = False
              ExplicitLeft = 970
              ExplicitTop = 36
            end
            inherited LblDataAlt: TDBText
              Left = 837
              Top = 49
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataField = ''
              Visible = False
              ExplicitLeft = 1003
              ExplicitTop = 49
            end
            inherited LAlteradoPor: TLabel
              Left = 804
              Top = 49
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Visible = False
              ExplicitLeft = 970
              ExplicitTop = 49
            end
            inherited LblDataCad: TDBText
              Left = 837
              Top = 36
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akRight]
              DataField = ''
              Visible = False
              ExplicitLeft = 1003
              ExplicitTop = 36
            end
            object Label1: TLabel
              Left = 141
              Top = 11
              Width = 61
              Height = 16
              Caption = 'Empresas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 534
              Top = 152
              Width = 116
              Height = 16
              Caption = 'Motivos de Paradas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 534
              Top = 199
              Width = 134
              Height = 16
              Caption = 'Tipos de Programa'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 675
              Top = 11
              Width = 45
              Height = 16
              Caption = 'Cargos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 809
              Top = 152
              Width = 50
              Height = 16
              Caption = 'Oficinas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 6
              Top = 199
              Width = 123
              Height = 16
              Caption = 'Lubrific. Prog. Equip.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 141
              Top = 58
              Width = 38
              Height = 16
              Caption = #193'reas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 398
              Top = 105
              Width = 54
              Height = 16
              Caption = 'Feriados:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 534
              Top = 11
              Width = 112
              Height = 16
              Caption = 'Calend'#225'rio MObra.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 398
              Top = 11
              Width = 105
              Height = 16
              Caption = 'Calend'#225'rio Equip.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 265
              Top = 105
              Width = 83
              Height = 16
              Caption = 'Fornecedores:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 6
              Top = 11
              Width = 54
              Height = 16
              Caption = 'Usu'#225'rios:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 141
              Top = 152
              Width = 71
              Height = 16
              Caption = 'Fabricantes:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 265
              Top = 58
              Width = 85
              Height = 16
              Caption = 'Equipamentos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 265
              Top = 152
              Width = 116
              Height = 16
              Caption = 'Manut. Fam. Equip.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 809
              Top = 105
              Width = 122
              Height = 16
              Caption = 'Lubrific. Fam. Equip.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 398
              Top = 152
              Width = 117
              Height = 16
              Caption = 'Manut. Prog. Equip.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 265
              Top = 11
              Width = 108
              Height = 16
              Caption = 'Arquivos T'#233'cnicos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 809
              Top = 199
              Width = 115
              Height = 16
              Caption = 'Planos de Trabalho:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label27: TLabel
              Left = 675
              Top = 199
              Width = 118
              Height = 16
              Caption = 'Pe'#231'as de Reposi'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label28: TLabel
              Left = 398
              Top = 199
              Width = 57
              Height = 16
              Caption = 'Recursos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 534
              Top = 105
              Width = 74
              Height = 16
              Caption = 'Kit de Pe'#231'as:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 6
              Top = 152
              Width = 109
              Height = 16
              Caption = 'Centros de Custos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Left = 675
              Top = 105
              Width = 93
              Height = 16
              Caption = 'Kit de Recursos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Left = 265
              Top = 199
              Width = 116
              Height = 16
              Caption = 'Pontos de Inspe'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 675
              Top = 58
              Width = 108
              Height = 16
              Caption = 'Fam'#237'lias de Pneus:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label33: TLabel
              Left = 141
              Top = 105
              Width = 109
              Height = 16
              Caption = 'Controle de Pneus:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 6
              Top = 58
              Width = 86
              Height = 16
              Caption = 'Almoxarifados:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 141
              Top = 199
              Width = 77
              Height = 16
              Caption = 'Lubrificantes:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Left = 6
              Top = 105
              Width = 105
              Height = 16
              Caption = 'Classes de Equip.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 398
              Top = 58
              Width = 109
              Height = 16
              Caption = 'Fam'#237'lias de Equip.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 534
              Top = 58
              Width = 107
              Height = 16
              Caption = 'Fam'#237'lias de Pe'#231'as:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 809
              Top = 58
              Width = 120
              Height = 16
              Caption = 'Fam'#237'lia de Recursos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 809
              Top = 11
              Width = 105
              Height = 16
              Caption = 'Causas de Falhas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 675
              Top = 152
              Width = 80
              Height = 16
              Caption = 'Manuten'#231#245'es:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object EdtAlmoxarifado: TDBEdit
              Left = 5
              Top = 76
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'ALMOXARIFADO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtArea: TDBEdit
              Left = 141
              Top = 76
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'AREAS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtArquivoTec: TDBEdit
              Left = 265
              Top = 29
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'ARQUIVOTECNICO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCalendarioEquip: TDBEdit
              Left = 398
              Top = 29
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'CALENDARIOEQUIP'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCalendarioMObra: TDBEdit
              Left = 534
              Top = 29
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'CALENDARIO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCargo: TDBEdit
              Left = 675
              Top = 29
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'CARGOS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCausaFalha: TDBEdit
              Left = 809
              Top = 29
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'CAUSASFALHA'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtCentroCusto: TDBEdit
              Left = 5
              Top = 170
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'CENTROCUSTO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 21
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtClasse: TDBEdit
              Left = 5
              Top = 123
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'CLASSES'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 14
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtContPneu: TDBEdit
              Left = 141
              Top = 123
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'PNEUS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 15
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtEmpresa: TDBEdit
              Left = 141
              Top = 29
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'EMPRESA'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtEquipamento: TDBEdit
              Left = 265
              Top = 76
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'EQUIPAMENTOS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtFabricante: TDBEdit
              Left = 141
              Top = 170
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'FABRICANTE'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 22
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtFamiliaEquip: TDBEdit
              Left = 398
              Top = 76
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'FAMILIAEQUIPAMENTO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtFamiliaPecas: TDBEdit
              Left = 534
              Top = 76
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'FAMILIAPECASREPOSICAO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtFamiliaPneu: TDBEdit
              Left = 675
              Top = 76
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'FAMILIAPNEUS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 12
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtFamiliaRec: TDBEdit
              Left = 809
              Top = 76
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'FAMILIARECURSOS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 13
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtFeriado: TDBEdit
              Left = 398
              Top = 123
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'FERIADOS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 17
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtFornecedor: TDBEdit
              Left = 265
              Top = 123
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'FORNECEDOR'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 16
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtKitPeca: TDBEdit
              Left = 534
              Top = 123
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'PECASREPOSICAOKIT'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 18
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtKitRecurso: TDBEdit
              Left = 675
              Top = 123
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'RECURSOSKIT'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 19
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtLubrificante: TDBEdit
              Left = 141
              Top = 217
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'LUBRIFICANTES'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 29
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtLubrificFamEquip: TDBEdit
              Left = 809
              Top = 123
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'LUBRIFICPROGFAMEQUIPAMENTO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 20
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtLubrificProgEquip: TDBEdit
              Left = 5
              Top = 217
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'LUBRIFICPROGEQUIPAMENTO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 28
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtManutFamEquip: TDBEdit
              Left = 265
              Top = 170
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'MANUTPROGFAMEQUIPAMENTO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 23
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtManutProgEquip: TDBEdit
              Left = 398
              Top = 170
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'MANUTPROGEQUIPAMENTO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 24
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtMotivoParada: TDBEdit
              Left = 534
              Top = 170
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'MOTIVOPARADA'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 25
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtOficina: TDBEdit
              Left = 809
              Top = 170
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'OFICINAS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 27
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtPecaReposicao: TDBEdit
              Left = 675
              Top = 217
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'PECASREPOSICAO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 33
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtPlanoTrabalho: TDBEdit
              Left = 809
              Top = 217
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'PLANOTRABALHO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 34
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtPontoInspecao: TDBEdit
              Left = 265
              Top = 217
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'PONTOSINSPECAO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 30
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtRecurso: TDBEdit
              Left = 398
              Top = 217
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'RECURSOS'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 31
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtTipoManutencao: TDBEdit
              Left = 675
              Top = 170
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'TIPOMANUTENCAO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 26
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtTipoProgramacao: TDBEdit
              Left = 534
              Top = 217
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'TIPOPROGRAMACAO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 32
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
            object EdtUsuario: TDBEdit
              Left = 5
              Top = 29
              Width = 105
              Height = 24
              CharCase = ecUpperCase
              DataField = 'USUARIO'
              DataSource = DM.dsFormatoCodigo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnExit = TabNextTab1AfterTabChange
              OnKeyPress = FormKeyPress
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 776
    Width = 948
    ExplicitTop = 773
    ExplicitWidth = 1105
  end
  inherited PAuxiliares: TPanel
    Top = 749
    Width = 944
    ExplicitTop = 746
    ExplicitWidth = 1101
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 582
    Top = 12
  end
  inherited ActionList1: TActionList
    Left = 468
    Top = 7
    inherited TabNextTab1: TNextTab
      AfterTabChange = nil
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 368
    Top = 16
    inherited Arquivo1: TMenuItem
      inherited MmNovo: TMenuItem
        Visible = False
      end
    end
  end
end

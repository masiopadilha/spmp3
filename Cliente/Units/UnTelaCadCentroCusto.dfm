inherited FrmTelaCadCentroCusto: TFrmTelaCadCentroCusto
  Caption = 'Centro de Custo'
  ClientHeight = 374
  ClientWidth = 909
  Font.Height = -15
  OnCreate = FormCreate
  ExplicitWidth = 921
  ExplicitHeight = 410
  TextHeight = 20
  inherited PanelFundo: TPanel
    Width = 909
    Height = 374
    ExplicitWidth = 909
    ExplicitHeight = 374
    inherited PageControlCRUD: TPageControl
      Top = 3
      Width = 906
      Height = 368
      Align = alClient
      ExplicitTop = 3
      ExplicitWidth = 906
      ExplicitHeight = 368
      inherited TabSheetLista: TTabSheet
        ExplicitTop = 37
        ExplicitWidth = 894
        ExplicitHeight = 324
        inherited PanelCor: TPanel
          Width = 894
          Height = 324
          ExplicitWidth = 894
          ExplicitHeight = 324
          inherited pJvDBGridLista: TPanel
            Width = 894
            Height = 324
            ExplicitWidth = 894
            ExplicitHeight = 324
            inherited pSearchBox: TPanel
              Width = 888
              ExplicitWidth = 888
              inherited ChbAtivoCons: TCheckBox
                Left = 735
                ExplicitLeft = 735
              end
              inherited chbVisivelCons: TCheckBox
                Left = 809
                ExplicitLeft = 809
              end
            end
            inherited JvDBGridLista: TJvDBGrid
              Width = 890
              Height = 276
            end
          end
        end
      end
      inherited TabSheetCadastra: TTabSheet
        ExplicitTop = 37
        ExplicitWidth = 892
        ExplicitHeight = 324
        inherited PControle: TPanel
          Width = 892
          ExplicitWidth = 892
          inherited lblCadastro: TLabel
            ParentShowHint = False
          end
          inherited lblDBCadastro: TDBText
            DataSource = DM.dsCentroCusto
            ShowHint = False
          end
          inherited lblCadastroPor: TLabel
            ParentShowHint = False
          end
          inherited lblDBCadastroPor: TDBText
            DataSource = DM.dsCentroCusto
          end
          inherited lblAlteracao: TLabel
            ParentShowHint = False
          end
          inherited LblDBAlteracao: TDBText
            DataSource = DM.dsCentroCusto
            ParentShowHint = False
          end
          inherited lblAlteracaoPor: TLabel
            ParentShowHint = False
          end
          inherited lblDBAlteracaoPor: TDBText
            DataSource = DM.dsCentroCusto
            ParentShowHint = False
            ShowHint = True
          end
        end
        inherited ScrollBox1: TScrollBox
          Width = 892
          Height = 207
          ExplicitWidth = 892
          ExplicitHeight = 207
          inherited PanelColor: TPanel
            Width = 892
            Height = 207
            Color = 16053480
            Ctl3D = False
            ExplicitWidth = 892
            ExplicitHeight = 207
            object Label2: TLabel
              Left = 38
              Top = 26
              Width = 52
              Height = 20
              Caption = 'C'#243'digo:'
            end
            object Label4: TLabel
              Left = 14
              Top = 56
              Width = 68
              Height = 20
              Alignment = taRightJustify
              Caption = 'Descri'#231#227'o:'
            end
            object EdtCodigo: TDBEdit
              Tag = 555
              Left = 97
              Top = 24
              Width = 125
              Height = 26
              CharCase = ecUpperCase
              DataField = 'CODIGO'
              DataSource = DM.dsCentroCusto
              ReadOnly = True
              TabOrder = 0
              OnKeyPress = FormKeyPress
            end
            object EdtDescricao: TDBEdit
              Left = 97
              Top = 55
              Width = 230
              Height = 26
              DataField = 'DESCRICAO'
              DataSource = DM.dsCentroCusto
              TabOrder = 1
              OnKeyPress = FormKeyPress
            end
            object ChbAtivoNF: TDBCheckBox
              Left = 46
              Top = 86
              Width = 57
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Ativo:'
              DataField = 'ATIVO'
              DataSource = DM.dsCentroCusto
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object ChbVisivelNF: TDBCheckBox
              Left = 147
              Top = 86
              Width = 65
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Vis'#237'vel:'
              DataField = 'VISIVEL'
              DataSource = DM.dsCentroCusto
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
        inherited PAuxiliares: TPanel
          Top = 280
          Width = 892
          ExplicitTop = 280
          ExplicitWidth = 892
        end
        inherited StatusBar1: TStatusBar
          Top = 305
          Width = 892
          ExplicitTop = 305
          ExplicitWidth = 892
        end
      end
    end
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 308
  end
end

inherited FrmTelaCadGrupoIndustrial: TFrmTelaCadGrupoIndustrial
  Caption = 'Grupo Industrial'
  TextHeight = 16
  inherited PCentro: TPanel
    Left = 4
    Top = 75
    Width = 780
    Height = 247
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 4
    ExplicitTop = 75
    ExplicitWidth = 776
    ExplicitHeight = 244
    inherited PageControlCRUD: TPageControl
      Width = 775
      Height = 239
      ExplicitWidth = 771
      ExplicitHeight = 236
      inherited TabSheetLista: TTabSheet
        ExplicitWidth = 763
        ExplicitHeight = 199
        inherited PanelCor: TPanel
          Width = 763
          Height = 199
          ExplicitWidth = 759
          ExplicitHeight = 196
          inherited pJvDBGridLista: TPanel
            Width = 763
            Height = 199
            ExplicitWidth = 759
            ExplicitHeight = 196
            inherited pSearchBox: TPanel
              Width = 757
              ExplicitWidth = 753
              inherited ChbAtivoCons: TCheckBox
                Left = 605
                ExplicitLeft = 601
              end
              inherited chbVisivelCons: TCheckBox
                Left = 679
                ExplicitLeft = 675
              end
            end
            inherited JvDBGridLista: TJvDBGrid
              Width = 759
              Height = 151
            end
          end
        end
      end
      inherited TabSheetCadastra: TTabSheet
        ExplicitWidth = 761
        ExplicitHeight = 199
        inherited ScrollBox1: TScrollBox
          Width = 761
          Height = 199
          ExplicitWidth = 761
          ExplicitHeight = 199
          inherited PanelColor: TPanel
            Width = 761
            Height = 199
            ExplicitWidth = 761
            ExplicitHeight = 199
            inherited LCadastroPor: TLabel
              Left = 516
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblUsuCad: TDBText
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataSource = DM.dsGrupos
            end
            inherited LAlteracao: TLabel
              Left = 657
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblUsuAlt: TDBText
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataSource = DM.dsGrupos
            end
            inherited LCadastro: TLabel
              Left = 554
              Top = 30
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblDataAlt: TDBText
              Top = 30
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataSource = DM.dsGrupos
            end
            inherited LAlteradoPor: TLabel
              Left = 679
              Top = 30
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited LblDataCad: TDBText
              Top = 30
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataSource = DM.dsGrupos
            end
            object PCGrupoIndustrial: TPageControl
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 755
              Height = 191
              ActivePage = TSGrupo
              Align = alClient
              Style = tsFlatButtons
              TabOrder = 0
              OnChange = PCGrupoIndustrialChange
              ExplicitLeft = 6
              ExplicitTop = 6
              object TSGrupo: TTabSheet
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = 'Grupos'
                object Label4: TLabel
                  Left = 46
                  Top = 78
                  Width = 60
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o:'
                end
                object EdtDescGrupo: TDBEdit
                  Left = 110
                  Top = 75
                  Width = 369
                  Height = 24
                  DataField = 'DESCRICAO'
                  DataSource = DM.dsGrupos
                  TabOrder = 0
                  OnExit = TabNextTab1AfterTabChange
                  OnKeyPress = FormKeyPress
                end
              end
              object TSUnidade: TTabSheet
                Caption = 'Unidades'
                ImageIndex = 1
                object Label2: TLabel
                  Left = 62
                  Top = 47
                  Width = 44
                  Height = 16
                  Caption = 'C'#243'digo:'
                end
                object Label1: TLabel
                  Left = 46
                  Top = 78
                  Width = 60
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o:'
                end
                object LblGrupo: TDBText
                  Left = 0
                  Top = 0
                  Width = 50
                  Height = 13
                  AutoSize = True
                  DataField = 'GRUPO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object EdtCodUnidade: TDBEdit
                  Tag = 555
                  Left = 110
                  Top = 45
                  Width = 125
                  Height = 24
                  CharCase = ecUpperCase
                  DataField = 'CODIGO'
                  DataSource = DM.dsUnidades
                  ReadOnly = True
                  TabOrder = 0
                  OnExit = EdtCodUnidadeExit
                  OnKeyPress = FormKeyPress
                end
                object EdtDescUnidade: TDBEdit
                  Left = 110
                  Top = 76
                  Width = 230
                  Height = 24
                  DataField = 'NOME'
                  DataSource = DM.dsUnidades
                  TabOrder = 1
                  OnExit = TabNextTab1AfterTabChange
                  OnKeyPress = FormKeyPress
                end
                object ChbAtivoNF: TDBCheckBox
                  Left = 70
                  Top = 107
                  Width = 57
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Ativo:'
                  DataField = 'ATIVO'
                  DataSource = DM.dsUnidades
                  TabOrder = 2
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                  OnExit = TabNextTab1AfterTabChange
                end
                object ChbVisivelNF: TDBCheckBox
                  Left = 142
                  Top = 107
                  Width = 65
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Vis'#237'vel:'
                  DataField = 'VISIVEL'
                  DataSource = DM.dsUnidades
                  TabOrder = 3
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                  OnExit = TabNextTab1AfterTabChange
                end
                object ChbTransf: TDBCheckBox
                  Left = 224
                  Top = 106
                  Width = 116
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Transforma'#231#227'o:'
                  DataField = 'TRANSFORMACAO'
                  DataSource = DM.dsUnidades
                  TabOrder = 4
                  ValueChecked = 'S'
                  ValueUnchecked = 'N'
                  OnExit = TabNextTab1AfterTabChange
                end
              end
              object TSAdmCorp: TTabSheet
                Caption = 'Adm. Corporativo'
                ImageIndex = 2
                object Label3: TLabel
                  Left = 46
                  Top = 76
                  Width = 60
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o:'
                end
                object Label5: TLabel
                  Left = 62
                  Top = 45
                  Width = 44
                  Height = 16
                  Caption = 'C'#243'digo:'
                end
                object Label6: TLabel
                  Left = 65
                  Top = 107
                  Width = 41
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Senha:'
                end
                object Label7: TLabel
                  Left = 4
                  Top = 138
                  Width = 102
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Confirmar Senha:'
                end
                object LblGrupoAdmCorp: TDBText
                  Left = 0
                  Top = 0
                  Width = 102
                  Height = 13
                  AutoSize = True
                  DataField = 'GRUPO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object LblUnidAdmCorp: TDBText
                  Left = 0
                  Top = 15
                  Width = 93
                  Height = 13
                  AutoSize = True
                  DataField = 'EMPRESA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label13: TLabel
                  Left = 239
                  Top = 109
                  Width = 63
                  Height = 13
                  Caption = '* Tempor'#225'ria'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object EdtCodAdmCorp: TDBEdit
                  Tag = 555
                  Left = 110
                  Top = 44
                  Width = 125
                  Height = 24
                  CharCase = ecUpperCase
                  DataField = 'CODIGO'
                  DataSource = DM.dsAdmCorp
                  ReadOnly = True
                  TabOrder = 0
                  OnExit = EdtCodAdmCorpExit
                  OnKeyPress = FormKeyPress
                end
                object EdtDescAdmCorp: TDBEdit
                  Left = 110
                  Top = 75
                  Width = 230
                  Height = 24
                  CharCase = ecLowerCase
                  DataField = 'NOME'
                  DataSource = DM.dsAdmCorp
                  TabOrder = 1
                  OnExit = TabNextTab1AfterTabChange
                  OnKeyPress = EdtDescAdmCorpKeyPress
                end
                object EdtSenhaAdmCorp: TEdit
                  Left = 110
                  Top = 106
                  Width = 125
                  Height = 24
                  PasswordChar = '*'
                  TabOrder = 2
                  OnKeyPress = FormKeyPress
                end
                object EdtConfSenhaAdmCorp: TEdit
                  Left = 110
                  Top = 137
                  Width = 125
                  Height = 24
                  PasswordChar = '*'
                  TabOrder = 3
                  OnKeyPress = FormKeyPress
                end
              end
              object TSAdmUnid: TTabSheet
                Caption = 'Adm. Unidade'
                ImageIndex = 3
                object Label8: TLabel
                  Left = 62
                  Top = 45
                  Width = 44
                  Height = 16
                  Caption = 'C'#243'digo:'
                end
                object Label9: TLabel
                  Left = 46
                  Top = 76
                  Width = 60
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o:'
                end
                object Label10: TLabel
                  Left = 65
                  Top = 107
                  Width = 41
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Senha:'
                end
                object Label11: TLabel
                  Left = 4
                  Top = 138
                  Width = 102
                  Height = 16
                  Alignment = taRightJustify
                  Caption = 'Confirmar Senha:'
                end
                object LblGrupoAdmUnid: TDBText
                  Left = 0
                  Top = 0
                  Width = 101
                  Height = 13
                  AutoSize = True
                  DataField = 'GRUPO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object LblUnidAdmUnid: TDBText
                  Left = 0
                  Top = 15
                  Width = 92
                  Height = 13
                  AutoSize = True
                  DataField = 'EMPRESA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label12: TLabel
                  Left = 239
                  Top = 109
                  Width = 63
                  Height = 13
                  Caption = '* Tempor'#225'ria'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object EdtCodAdmUnid: TDBEdit
                  Tag = 555
                  Left = 110
                  Top = 44
                  Width = 125
                  Height = 24
                  CharCase = ecUpperCase
                  DataField = 'CODIGO'
                  DataSource = DM.dsAdmUnid
                  ReadOnly = True
                  TabOrder = 0
                  OnExit = EdtCodAdmUnidExit
                  OnKeyPress = FormKeyPress
                end
                object EdtDescAdmUnid: TDBEdit
                  Left = 110
                  Top = 75
                  Width = 230
                  Height = 24
                  CharCase = ecLowerCase
                  DataField = 'NOME'
                  DataSource = DM.dsAdmUnid
                  TabOrder = 1
                  OnExit = TabNextTab1AfterTabChange
                  OnKeyPress = EdtDescAdmCorpKeyPress
                end
                object EdtSenhaAdmUnid: TEdit
                  Left = 110
                  Top = 106
                  Width = 125
                  Height = 24
                  PasswordChar = '*'
                  TabOrder = 2
                  OnKeyPress = FormKeyPress
                end
                object EdtConfSenhaAdmUnid: TEdit
                  Left = 110
                  Top = 137
                  Width = 125
                  Height = 24
                  PasswordChar = '*'
                  TabOrder = 3
                  OnKeyPress = FormKeyPress
                end
              end
            end
          end
        end
      end
    end
  end
end

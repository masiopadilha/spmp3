inherited FrmTelaCadGrupoIndustrial: TFrmTelaCadGrupoIndustrial
  Caption = 'Grupo Industrial'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LAlteradoPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LblDataAlt: TDBText
      Width = 67
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsGrupos
      ExplicitWidth = 67
    end
    inherited LblDataCad: TDBText
      Width = 67
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsGrupos
      ExplicitWidth = 67
    end
    inherited LblUsuAlt: TDBText
      Width = 67
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsGrupos
      ExplicitWidth = 67
    end
    inherited LblUsuCad: TDBText
      Width = 67
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsGrupos
      ExplicitWidth = 67
    end
    inherited LCadastro: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited LCadastroPor: TLabel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
    object PCGrupoIndustrial: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 608
      Height = 308
      ActivePage = TSGrupo
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      OnChange = PCGrupoIndustrialChange
      object TSGrupo: TTabSheet
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Grupos'
        object Label4: TLabel
          Left = 92
          Top = 106
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object EdtDescGrupo: TDBEdit
          Left = 155
          Top = 103
          Width = 300
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
          Left = 137
          Top = 60
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object Label1: TLabel
          Left = 121
          Top = 91
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
          Left = 185
          Top = 58
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
          Left = 185
          Top = 89
          Width = 230
          Height = 24
          DataField = 'NOME'
          DataSource = DM.dsUnidades
          TabOrder = 1
          OnExit = TabNextTab1AfterTabChange
          OnKeyPress = FormKeyPress
        end
        object ChbAtivoNF: TDBCheckBox
          Left = 145
          Top = 120
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
          Left = 217
          Top = 120
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
          Left = 299
          Top = 119
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
          Left = 121
          Top = 85
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label5: TLabel
          Left = 137
          Top = 54
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object Label6: TLabel
          Left = 140
          Top = 116
          Width = 41
          Height = 16
          Alignment = taRightJustify
          Caption = 'Senha:'
        end
        object Label7: TLabel
          Left = 79
          Top = 147
          Width = 102
          Height = 16
          Alignment = taRightJustify
          Caption = 'Confirmar Senha:'
        end
        object LblGrupoAdmCorp: TDBText
          Left = 0
          Top = 0
          Width = 115
          Height = 16
          AutoSize = True
          DataField = 'GRUPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblUnidAdmCorp: TDBText
          Left = 0
          Top = 18
          Width = 104
          Height = 16
          AutoSize = True
          DataField = 'EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 314
          Top = 118
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
          Left = 185
          Top = 53
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
          Left = 185
          Top = 84
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
          Left = 185
          Top = 115
          Width = 125
          Height = 24
          PasswordChar = '*'
          TabOrder = 2
          OnKeyPress = FormKeyPress
        end
        object EdtConfSenhaAdmCorp: TEdit
          Left = 185
          Top = 146
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
          Left = 137
          Top = 54
          Width = 44
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object Label9: TLabel
          Left = 121
          Top = 85
          Width = 60
          Height = 16
          Alignment = taRightJustify
          Caption = 'Descri'#231#227'o:'
        end
        object Label10: TLabel
          Left = 140
          Top = 116
          Width = 41
          Height = 16
          Alignment = taRightJustify
          Caption = 'Senha:'
        end
        object Label11: TLabel
          Left = 79
          Top = 147
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
          Top = 13
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
          Left = 314
          Top = 118
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
          Left = 185
          Top = 53
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
          Left = 185
          Top = 84
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
          Left = 185
          Top = 115
          Width = 125
          Height = 24
          PasswordChar = '*'
          TabOrder = 2
          OnKeyPress = FormKeyPress
        end
        object EdtConfSenhaAdmUnid: TEdit
          Left = 185
          Top = 146
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

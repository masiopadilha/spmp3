inherited FrmTelaCadContadores: TFrmTelaCadContadores
  Caption = 'Contadores'
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 660
      ExplicitLeft = 656
    end
    inherited LAlteradoPor: TLabel
      Left = 682
      ExplicitLeft = 678
    end
    inherited LblDataAlt: TDBText
      DataSource = DM.dsContadores
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsContadores
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsContadores
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsContadores
    end
    inherited LCadastro: TLabel
      Left = 558
    end
    inherited LCadastroPor: TLabel
      Left = 520
    end
  end
  inherited PCentro: TPanel
    object Label6: TLabel
      Left = 431
      Top = 96
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Programa'#231#227'o:'
    end
    object Label2: TLabel
      Left = 64
      Top = 96
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 195
      Top = 96
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object EdtProgramacao: TDBEdit
      Left = 431
      Top = 113
      Width = 197
      Height = 24
      Color = clBtnFace
      DataField = 'PROGRAMACAO'
      DataSource = DM.dsContadores
      ReadOnly = True
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnProgramacao: TButton
      Left = 632
      Top = 111
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnProgramacaoClick
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 113
      Width = 125
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsContadores
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 195
      Top = 113
      Width = 230
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsContadores
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
  end
end

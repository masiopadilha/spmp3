inherited FrmTelaCadContadores: TFrmTelaCadContadores
  Caption = 'Contadores'
  ClientHeight = 424
  ClientWidth = 628
  TextHeight = 16
  inherited PControle: TPanel
    Width = 624
    inherited LAlteracao: TLabel
      Left = 502
    end
    inherited LAlteradoPor: TLabel
      Left = 524
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
      Left = 396
    end
    inherited LCadastroPor: TLabel
      Left = 358
    end
  end
  inherited PCentro: TPanel
    Width = 624
    Height = 323
    object Label2: TLabel
      Left = 190
      Top = 90
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 174
      Top = 120
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object Label6: TLabel
      Left = 153
      Top = 151
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'Programa'#231#227'o:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 238
      Top = 88
      Width = 131
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
      Left = 238
      Top = 119
      Width = 227
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsContadores
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtProgramacao: TDBEdit
      Left = 238
      Top = 150
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
      Left = 437
      Top = 148
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
  end
  inherited StatusBar1: TStatusBar
    Top = 405
    Width = 628
  end
  inherited PAuxiliares: TPanel
    Top = 378
    Width = 624
  end
end

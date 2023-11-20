inherited FrmTelaCadArqTecnicoDesenho: TFrmTelaCadArqTecnicoDesenho
  Caption = 'Desenho T'#233'cnico'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
    inherited LblDataAlt: TDBText
      DataSource = DM.dsArquivoTecnico
    end
    inherited LblDataCad: TDBText
      DataSource = DM.dsArquivoTecnico
    end
    inherited LblUsuAlt: TDBText
      DataSource = DM.dsArquivoTecnico
    end
    inherited LblUsuCad: TDBText
      DataSource = DM.dsArquivoTecnico
    end
  end
  inherited PCentro: TPanel
    Width = 780
    Height = 248
    object Label1: TLabel
      Left = 64
      Top = 38
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
      FocusControl = EdtCodigo
    end
    object Label3: TLabel
      Left = 252
      Top = 128
      Width = 56
      Height = 16
      Alignment = taRightJustify
      Caption = 'Conjunto:'
      FocusControl = EdtDescricao
    end
    object Label6: TLabel
      Left = 64
      Top = 128
      Width = 46
      Height = 16
      Alignment = taRightJustify
      Caption = 'Projeto:'
    end
    object Label15: TLabel
      Left = 405
      Top = 128
      Width = 50
      Height = 16
      Caption = 'N'#250'mero:'
      FocusControl = EdtNumero
    end
    object Label5: TLabel
      Left = 560
      Top = 128
      Width = 60
      Height = 16
      Caption = 'Mapoteca:'
      FocusControl = EdtMapoteca
    end
    object Label14: TLabel
      Left = 64
      Top = 173
      Width = 44
      Height = 16
      Caption = 'Gaveta:'
      FocusControl = EdtGaveta
    end
    object Label7: TLabel
      Left = 252
      Top = 173
      Width = 36
      Height = 16
      Caption = 'Pasta:'
    end
    object Label10: TLabel
      Left = 64
      Top = 83
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'Equipamento:'
    end
    object Label12: TLabel
      Left = 405
      Top = 173
      Width = 48
      Height = 16
      Caption = 'Arquivo:'
    end
    object Label8: TLabel
      Left = 560
      Top = 173
      Width = 49
      Height = 16
      Alignment = taRightJustify
      Caption = 'Esta'#231#227'o:'
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 56
      Width = 97
      Height = 24
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 166
      Top = 56
      Width = 544
      Height = 24
      DataField = 'DESCRICAO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtConjunto: TDBEdit
      Left = 252
      Top = 144
      Width = 150
      Height = 24
      DataField = 'CONJUNTO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 7
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtProjeto: TDBEdit
      Left = 64
      Top = 146
      Width = 150
      Height = 24
      Color = clBtnFace
      DataField = 'PROJETO'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 5
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnProjeto: TButton
      Left = 218
      Top = 142
      Width = 28
      Height = 28
      Hint = 'Consultar'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BtnProjetoClick
    end
    object EdtNumero: TDBEdit
      Left = 405
      Top = 144
      Width = 150
      Height = 24
      DataField = 'NUMORIGINAL'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 8
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtMapoteca: TDBEdit
      Left = 560
      Top = 144
      Width = 150
      Height = 24
      DataField = 'MAPOTECA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 9
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtGaveta: TDBEdit
      Left = 64
      Top = 191
      Width = 182
      Height = 24
      DataField = 'GAVETA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 10
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtPasta: TDBEdit
      Left = 252
      Top = 191
      Width = 150
      Height = 24
      DataField = 'PASTA'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 11
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtCodEquipamento: TDBEdit
      Left = 64
      Top = 101
      Width = 97
      Height = 24
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'CODEQUIPAMENTO'
      DataSource = DM.dsArquivoTecnico
      ReadOnly = True
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtDescEquipamento: TDBEdit
      Left = 166
      Top = 100
      Width = 510
      Height = 24
      Color = clBtnFace
      Ctl3D = True
      DataField = 'EQUIPAMENTO'
      DataSource = DM.dsArquivoTecnico
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seClient]
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object BtnEquipamento: TButton
      Left = 682
      Top = 98
      Width = 28
      Height = 28
      DisabledImageIndex = 14
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      TabOrder = 4
      OnClick = BtnEquipamentoClick
    end
    object EdtArquivo: TDBEdit
      Left = 405
      Top = 191
      Width = 150
      Height = 24
      DataField = 'ARQUIVO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 12
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
    end
    object EdtEstacao: TDBEdit
      Left = 560
      Top = 191
      Width = 150
      Height = 24
      DataField = 'ESTACAO'
      DataSource = DM.dsArquivoTecnico
      TabOrder = 13
      OnExit = TabNextTab1AfterTabChange
      OnKeyPress = FormKeyPress
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
  inherited MainMenuPadrao: TMainMenu
    Top = 36
  end
  object PopupMenuCons: TPopupMenu
    Left = 402
    Top = 83
    object Codigo1: TMenuItem
      Caption = 'C'#243'digo'
      OnClick = Codigo1Click
    end
    object Descricao1: TMenuItem
      Caption = 'Descri'#231#227'o'
      OnClick = Descricao1Click
    end
  end
end

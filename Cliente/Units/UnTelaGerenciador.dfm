inherited FrmTelaGerenciador: TFrmTelaGerenciador
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerenciador'
  ClientHeight = 319
  ClientWidth = 438
  Constraints.MaxHeight = 355
  Constraints.MaxWidth = 450
  Constraints.MinHeight = 305
  Constraints.MinWidth = 407
  Font.Charset = ANSI_CHARSET
  Font.Height = -12
  Font.Name = 'Segoe UI'
  OnShow = FormShow
  ExplicitWidth = 450
  ExplicitHeight = 355
  TextHeight = 15
  inherited PTop: TPanel
    Width = 434
    ExplicitWidth = 387
    inherited BtnAjuda: TButton
      Left = 397
      Visible = False
      ExplicitLeft = 354
    end
  end
  inherited PCentro: TPanel
    Width = 432
    Height = 201
    ExplicitWidth = 385
    ExplicitHeight = 191
    inherited RGTelas: TRadioGroup
      Width = 430
      Height = 199
      ExplicitWidth = 383
      ExplicitHeight = 189
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 424
      Height = 193
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 377
      ExplicitHeight = 183
      object Label1: TLabel
        Left = 352
        Top = 6
        Width = 66
        Height = 13
        Caption = 'Porta MySQL:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 263
        Top = 93
        Width = 32
        Height = 15
        Caption = 'In'#237'cio:'
      end
      object Label2: TLabel
        Left = 9
        Top = 93
        Width = 31
        Height = 15
        Caption = 'Local:'
      end
      object Label3: TLabel
        Left = 282
        Top = 51
        Width = 61
        Height = 15
        Caption = 'Frequ'#234'ncia:'
      end
      object Label4: TLabel
        Left = 145
        Top = 51
        Width = 42
        Height = 15
        Caption = 'Backup:'
      end
      object Label5: TLabel
        Left = 9
        Top = 7
        Width = 79
        Height = 13
        Caption = 'Database name:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 9
        Top = 50
        Width = 34
        Height = 13
        Caption = 'Senha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 145
        Top = 6
        Width = 66
        Height = 13
        Caption = 'Hostname/IP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object CBBackup: TComboBox
        Left = 145
        Top = 68
        Width = 134
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 4
        Items.Strings = (
          ''
          'Autom'#225'tico'
          'Manual')
      end
      object CBFrequencia: TComboBox
        Left = 282
        Top = 68
        Width = 133
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 5
        Items.Strings = (
          ''
          '01 dias'
          '07 dias'
          '30 dias')
      end
      object EdtBackupMySQL: TJvDirectoryEdit
        Left = 9
        Top = 112
        Width = 251
        Height = 23
        ReadOnly = True
        TabOrder = 6
        Text = 'C:\SPMP3\Backup'
      end
      object edtDatabaseName: TEdit
        Left = 9
        Top = 25
        Width = 133
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'spmpma_spmp'
      end
      object EdtHorario: TLabeledEdit
        Left = 365
        Top = 112
        Width = 50
        Height = 23
        EditLabel.Width = 43
        EditLabel.Height = 15
        EditLabel.Caption = 'Hor'#225'rio:'
        TabOrder = 8
        Text = ''
      end
      object EdtHostName: TEdit
        Left = 145
        Top = 25
        Width = 204
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = 'localhost'
      end
      object EdtInicio: TJvDateEdit
        Left = 263
        Top = 112
        Width = 99
        Height = 23
        DialogTitle = 'Selecione a data'
        ShowNullDate = False
        TabOrder = 7
      end
      object EdtPorta: TEdit
        Left = 352
        Top = 24
        Width = 63
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '3306'
      end
      object EdtSenha: TEdit
        Left = 9
        Top = 68
        Width = 133
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 3
      end
      object edtHostFTP: TLabeledEdit
        Left = 9
        Top = 160
        Width = 140
        Height = 23
        EditLabel.Width = 58
        EditLabel.Height = 15
        EditLabel.Caption = 'Host (FTP):'
        TabOrder = 9
        Text = ''
      end
      object edtSenhaFTP: TLabeledEdit
        Left = 152
        Top = 160
        Width = 95
        Height = 23
        EditLabel.Width = 65
        EditLabel.Height = 15
        EditLabel.Caption = 'Senha (FTP):'
        PasswordChar = '*'
        TabOrder = 10
        Text = ''
      end
      object edtUsernamFTP: TLabeledEdit
        Left = 250
        Top = 160
        Width = 165
        Height = 23
        EditLabel.Width = 56
        EditLabel.Height = 15
        EditLabel.Caption = 'User (FTP):'
        TabOrder = 11
        Text = ''
      end
    end
  end
  inherited PAuxiliares: TPanel
    AlignWithMargins = False
    Left = 0
    Top = 271
    Width = 438
    Height = 0
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 261
    ExplicitWidth = 391
    ExplicitHeight = 0
  end
  inherited PBotoes: TPanel
    Top = 273
    Width = 434
    Height = 44
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ExplicitTop = 267
    ExplicitWidth = 391
    ExplicitHeight = 44
    inherited BtnOK: TButton
      Left = 0
      Width = 0
      Height = 0
      Visible = False
      ExplicitLeft = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    inherited BtnFechar: TButton
      Left = 0
      Width = 0
      Height = 0
      Visible = False
      ExplicitLeft = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object BtnGravar: TBitBtn
      Left = 8
      Top = 9
      Width = 98
      Height = 25
      Hint = 'Grava dados de conex'#227'o.'
      Caption = 'Gravar'
      Default = True
      DisabledImageIndex = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      Images = DM.ImageListBotoes
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnGravarClick
    end
    object BtnBanco: TBitBtn
      Left = 112
      Top = 9
      Width = 98
      Height = 25
      Hint = 'Testar conex'#227'o com banco de dados.'
      Caption = 'Banco'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 128
      Images = DM.ImageListBotoes
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnBancoClick
    end
    object BtnBackup: TBitBtn
      Left = 217
      Top = 9
      Width = 98
      Height = 25
      Hint = 'Criar arquivo de backup.'
      Caption = 'Backup'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 129
      Images = DM.ImageListBotoes
      ModalResult = 1
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnBackupClick
    end
    object BtnExtrair: TBitBtn
      Left = 322
      Top = 9
      Width = 98
      Height = 25
      Hint = 'Descompactar arquivo de backup.'
      Caption = 'Extrair'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 130
      Images = DM.ImageListBotoes
      ModalResult = 1
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
end

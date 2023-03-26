inherited FrmTelaGerenciador: TFrmTelaGerenciador
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerenciador'
  ClientHeight = 271
  ClientWidth = 401
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 407
  Constraints.MinHeight = 300
  Constraints.MinWidth = 407
  OnShow = FormShow
  ExplicitWidth = 407
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 397
    ExplicitWidth = 397
    inherited BtnAjuda: TButton
      Left = 348
      Visible = False
      ExplicitLeft = 348
    end
  end
  inherited PCentro: TPanel
    Width = 395
    Height = 201
    ExplicitWidth = 395
    ExplicitHeight = 201
    inherited RGTelas: TRadioGroup
      Width = 393
      Height = 199
      ExplicitWidth = 393
      ExplicitHeight = 199
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 387
      Height = 193
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 274
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
        Left = 224
        Top = 93
        Width = 35
        Height = 16
        Caption = 'In'#237'cio:'
      end
      object Label2: TLabel
        Left = 10
        Top = 93
        Width = 34
        Height = 16
        Caption = 'Local:'
      end
      object Label3: TLabel
        Left = 274
        Top = 51
        Width = 68
        Height = 16
        Caption = 'Frequ'#234'ncia:'
      end
      object Label4: TLabel
        Left = 141
        Top = 51
        Width = 45
        Height = 16
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
        Left = 141
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
      object BtnBackup: TBitBtn
        Left = 217
        Top = 147
        Width = 75
        Height = 25
        Hint = 'Criar arquivo de backup.'
        Caption = 'Backup'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          55555555FFFFFFFFFF5555500000000005555557777777777F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557F555555557F55550BFBFBFBFB
          0555557F555555557F55550FBFBFBFBF0555557FFFFFFFFF7555550000000000
          555555777777777755555550FBFB0555555555575FFF75555555555700007555
          5555555577775555555555555555555555555555555555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        ModalResult = 1
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = BtnBackupClick
      end
      object BtnBanco: TBitBtn
        Left = 112
        Top = 147
        Width = 100
        Height = 25
        Hint = 'Testar conex'#227'o com banco de dados.'
        Caption = 'Banco'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = BtnBancoClick
      end
      object BtnExtrair: TBitBtn
        Left = 296
        Top = 147
        Width = 75
        Height = 25
        Hint = 'Descompactar arquivo de backup.'
        Caption = 'Extrair'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        ModalResult = 1
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
      end
      object BtnGravar: TBitBtn
        Left = 8
        Top = 147
        Width = 100
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
        TabOrder = 9
        OnClick = BtnGravarClick
      end
      object CBBackup: TComboBox
        Left = 141
        Top = 68
        Width = 130
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 4
        Items.Strings = (
          ''
          'Autom'#225'tico'
          'Manual')
      end
      object CBFrequencia: TComboBox
        Left = 274
        Top = 68
        Width = 97
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
        Left = 10
        Top = 112
        Width = 211
        Height = 24
        ReadOnly = True
        TabOrder = 6
        Text = 'C:\SPMP3\Backup'
      end
      object edtDatabaseName: TEdit
        Left = 9
        Top = 25
        Width = 130
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
        Left = 326
        Top = 112
        Width = 45
        Height = 24
        EditLabel.Width = 47
        EditLabel.Height = 16
        EditLabel.Caption = 'Hor'#225'rio:'
        TabOrder = 8
      end
      object EdtHostName: TEdit
        Left = 141
        Top = 25
        Width = 130
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
        Left = 224
        Top = 112
        Width = 99
        Height = 24
        DialogTitle = 'Selecione a data'
        ShowNullDate = False
        TabOrder = 7
      end
      object EdtPorta: TEdit
        Left = 274
        Top = 24
        Width = 97
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
        Width = 130
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
    end
  end
  inherited PAuxiliares: TPanel
    AlignWithMargins = False
    Left = 0
    Top = 271
    Width = 401
    Height = 0
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 271
    ExplicitWidth = 401
    ExplicitHeight = 0
  end
  inherited PBotoes: TPanel
    AlignWithMargins = False
    Left = 0
    Top = 271
    Width = 401
    Height = 0
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 271
    ExplicitWidth = 401
    ExplicitHeight = 0
    inherited BtnOK: TButton
      Left = 117
      ExplicitLeft = 117
    end
    inherited BtnFechar: TButton
      Left = 199
      ExplicitLeft = 199
    end
  end
end

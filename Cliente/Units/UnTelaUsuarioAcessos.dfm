inherited FrmTelaUsuarioAcessos: TFrmTelaUsuarioAcessos
  Caption = 'Acessos do Usu'#225'rio'
  ClientWidth = 494
  Constraints.MaxWidth = 510
  Constraints.MinWidth = 510
  OnCreate = FormCreate
  ExplicitWidth = 510
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 490
    ExplicitWidth = 490
    object Label9: TLabel [1]
      Left = 123
      Top = 36
      Width = 48
      Height = 16
      Alignment = taRightJustify
      Caption = 'Per'#237'odo:'
    end
    inherited BtnAjuda: TButton
      Left = 457
      Top = 15
      Visible = False
      ExplicitLeft = 457
      ExplicitTop = 15
    end
    object CBPeriodo: TComboBox
      Left = 175
      Top = 33
      Width = 113
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 1
      Text = 'Hoje'
      OnSelect = CBPeriodoSelect
      Items.Strings = (
        'Hoje'
        #218'ltimos 07 dias'
        #218'ltimos 15 dias'
        #218'ltimos 30 dias'
        #218'ltimos 60 dias')
    end
  end
  inherited PCentro: TPanel
    Width = 488
    ExplicitWidth = 488
    inherited RGTelas: TRadioGroup
      Width = 486
      ExplicitWidth = 486
    end
    object DBGrid1: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 480
      Height = 154
      Align = alClient
      DataSource = DM.dsUsuarioAcessos
      DrawingStyle = gdsClassic
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'USUARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Usu'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MODULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'M'#243'dulo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 104
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAACESSO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Acesso'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 87
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATASAIDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Sa'#237'da'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTACAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Caption = 'Esta'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 83
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Width = 490
    ExplicitWidth = 490
  end
  inherited PBotoes: TPanel
    Width = 490
    ExplicitWidth = 490
    inherited BtnOK: TButton
      Left = 8
      Visible = False
      ExplicitLeft = 8
    end
    inherited BtnFechar: TButton
      Left = 208
      ExplicitLeft = 208
    end
  end
end

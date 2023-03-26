inherited FrmTelaUsuariosAtivos: TFrmTelaUsuariosAtivos
  Caption = 'Usu'#225'rios Atvos'
  ClientHeight = 261
  ClientWidth = 334
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 350
  Constraints.MinHeight = 300
  Constraints.MinWidth = 350
  OnCreate = FormCreate
  ExplicitWidth = 350
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 330
    ExplicitWidth = 330
    inherited Image1: TImage
      Left = 2
      Top = 2
      ExplicitLeft = 2
      ExplicitTop = 2
    end
    object lblHoraServidor: TLabel [1]
      AlignWithMargins = True
      Left = 236
      Top = 37
      Width = 88
      Height = 19
      Margins.Top = 36
      Margins.Right = 5
      Align = alRight
      Alignment = taRightJustify
      Caption = 'lblHoraServidor'
      Visible = False
      ExplicitHeight = 16
    end
    object Label1: TLabel [2]
      AlignWithMargins = True
      Left = 178
      Top = 39
      Width = 51
      Height = 17
      Margins.Top = 38
      Margins.Right = 4
      Align = alRight
      Alignment = taRightJustify
      Caption = 'Servidor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitHeight = 13
    end
    inherited BtnAjuda: TButton
      Left = 295
      Visible = False
      ExplicitLeft = 295
    end
  end
  inherited PCentro: TPanel
    Width = 328
    Height = 122
    ExplicitWidth = 328
    ExplicitHeight = 122
    inherited RGTelas: TRadioGroup
      Width = 326
      Height = 120
      ExplicitWidth = 326
      ExplicitHeight = 120
    end
    object GrdCadastro: TDBGrid
      Left = 1
      Top = 1
      Width = 326
      Height = 120
      Align = alClient
      DataSource = DM.dsUsuariosAtivos
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'HOST'
          Title.Caption = 'Esta'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 280
          Visible = True
        end>
    end
  end
  inherited PAuxiliares: TPanel
    Top = 194
    Width = 330
    ExplicitTop = 194
    ExplicitWidth = 330
  end
  inherited PBotoes: TPanel
    Top = 221
    Width = 330
    ExplicitTop = 221
    ExplicitWidth = 330
    inherited BtnOK: TButton
      Left = 14
      Visible = False
      ExplicitLeft = 14
    end
    inherited BtnFechar: TButton
      Left = 128
      ExplicitLeft = 128
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 74
    Top = 18
  end
end

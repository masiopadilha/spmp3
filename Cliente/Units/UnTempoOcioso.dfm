object frmSistemaOcioso: TfrmSistemaOcioso
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 61
  ClientWidth = 440
  Color = 14737632
  TransparentColor = True
  TransparentColorValue = 14737632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblTempoRegressivo: TLabel
    AlignWithMargins = True
    Left = 13
    Top = 3
    Width = 413
    Height = 29
    Alignment = taCenter
    Caption = 'O sistema ser'#225' desligado em 30 segundos.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 74
    Top = 31
    Width = 294
    Height = 21
    Alignment = taCenter
    Caption = 'Passe o mouse para evitar o desligamento.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
end

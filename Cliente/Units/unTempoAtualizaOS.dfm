object frmTempoAtualizaOS: TfrmTempoAtualizaOS
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 66
  ClientWidth = 550
  Color = 14737632
  TransparentColor = True
  TransparentColorValue = 14737632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblTempoRegressivo: TLabel
    AlignWithMargins = True
    Left = 13
    Top = 3
    Width = 517
    Height = 30
    Alignment = taCenter
    Caption = 'Buscando novas ordens de servi'#231'os em 05 segundos.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object SpeedButton1: TSpeedButton
    Left = 189
    Top = 35
    Width = 185
    Height = 22
    Caption = 'Clique aqui para adiar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
end

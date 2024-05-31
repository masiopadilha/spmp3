object frmSistemaOcioso: TfrmSistemaOcioso
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 83
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblTempoRegressivo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 344
    Height = 77
    Align = alClient
    Alignment = taCenter
    Caption = 'O sistema ser'#225' desligado em 30 segundos.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    StyleElements = [seClient, seBorder]
    ExplicitLeft = 10
    ExplicitTop = 15
    ExplicitWidth = 319
    ExplicitHeight = 21
  end
end

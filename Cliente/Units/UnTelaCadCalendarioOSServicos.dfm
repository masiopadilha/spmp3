inherited FrmTelaCadCalendarioOSServicos: TFrmTelaCadCalendarioOSServicos
  Caption = 'Ordens de Servi'#231'os '
  ClientHeight = 626
  ClientWidth = 869
  Constraints.MaxHeight = 665
  Constraints.MaxWidth = 885
  Constraints.MinHeight = 665
  Constraints.MinWidth = 885
  OnCreate = FormCreate
  ExplicitWidth = 885
  ExplicitHeight = 665
  PixelsPerInch = 96
  TextHeight = 16
  inherited PTop: TPanel
    Width = 865
    ExplicitWidth = 865
    inherited BtnAjuda: TButton
      Left = 827
      ExplicitLeft = 827
    end
  end
  inherited PCentro: TPanel
    Width = 863
    Height = 487
    ExplicitWidth = 863
    ExplicitHeight = 487
    inherited RGTelas: TRadioGroup
      Width = 626
      Height = 0
      Align = alNone
      ExplicitWidth = 626
      ExplicitHeight = 0
    end
    object GBProgramadas: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 855
      Height = 235
      Align = alTop
      Caption = 'Ordens de Servi'#231'os Programadas:'
      TabOrder = 1
      object GrdOrdemServicoProgMObra: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 152
        Width = 845
        Height = 83
        Align = alTop
        Color = 14671839
        DataSource = DM.dsCalendarioOSProgramadasMObra
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyPress = GrdOrdemServicoProgMObraKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODEQUIPE'
            Title.Alignment = taCenter
            Title.Caption = 'Equipe'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARGO'
            Title.Caption = 'Cargo'
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALENDARIO'
            Title.Caption = 'Calend'#225'rio'
            Width = 147
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'MATRICULA'
            Title.Alignment = taCenter
            Title.Caption = 'Matr'#237'cula'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = ' H/H'
            Width = 45
            Visible = True
          end>
      end
      object GrdOrdemServicoProgramadas: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 845
        Height = 125
        Align = alTop
        Color = 14671839
        DataSource = DM.dsCalendarioOSProgramadas
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        OnKeyPress = GrdOrdemServicoProgramadasKeyPress
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 205
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATAPROGINI'
            Title.Alignment = taCenter
            Title.Caption = 'Programada'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TEMPOHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = 'H/H'
            Width = 49
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODEQUIPAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Equipamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCEQUIPAMENTO'
            Title.Caption = 'Equipamento'
            Width = 277
            Visible = True
          end>
      end
    end
    object GBExecução: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 245
      Width = 855
      Height = 235
      Align = alTop
      Caption = 'Ordens de Servi'#231'os em Execu'#231#227'o:'
      TabOrder = 2
      object GrdOrdemServicoExecucao: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 21
        Width = 845
        Height = 125
        Align = alTop
        Color = 14671839
        DataSource = DM.dsCalendarioOSExecucao
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODIGO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 209
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATAINICIOREAL'
            Title.Alignment = taCenter
            Title.Caption = 'Execu'#231#227'o'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TEMPOHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = 'H/H'
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODEQUIPAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Equipamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCEQUIPAMENTO'
            Title.Caption = 'Equipamento'
            Width = 281
            Visible = True
          end>
      end
      object GrdOrdemServicoExecMObra: TDBGrid
        AlignWithMargins = True
        Left = 5
        Top = 152
        Width = 845
        Height = 83
        Align = alTop
        Color = 14671839
        DataSource = DM.dsCalendarioOSExecucaoMObra
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'CODEQUIPE'
            Title.Alignment = taCenter
            Title.Caption = 'Equipe'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARGO'
            Title.Caption = 'Cargo'
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALENDARIO'
            Title.Caption = 'Calend'#225'rio'
            Width = 148
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'MATRICULA'
            Title.Alignment = taCenter
            Title.Caption = 'Matr'#237'cula'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 186
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALHOMEMHORA'
            Title.Alignment = taCenter
            Title.Caption = ' H/H'
            Width = 45
            Visible = True
          end>
      end
    end
  end
  inherited PAuxiliares: TPanel
    Top = 559
    Width = 865
    ExplicitTop = 559
    ExplicitWidth = 865
  end
  inherited PBotoes: TPanel
    Top = 586
    Width = 865
    ExplicitTop = 586
    ExplicitWidth = 865
    inherited BtnOK: TButton
      Visible = False
    end
    inherited BtnFechar: TButton
      Left = 396
      ExplicitLeft = 396
    end
  end
end

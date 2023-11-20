inherited FrmTelaCadInfMensalTaxas: TFrmTelaCadInfMensalTaxas
  Caption = 'Taxas do M'#234's'
  PixelsPerInch = 96
  TextHeight = 16
  inherited PControle: TPanel
    inherited LAlteracao: TLabel
      Left = 478
      Visible = False
      ExplicitLeft = 478
    end
    inherited LAlteradoPor: TLabel
      Left = 499
      Visible = False
      ExplicitLeft = 499
    end
    inherited LblDataAlt: TDBText
      Left = 536
      DataField = ''
      Visible = False
      ExplicitLeft = 536
    end
    inherited LblDataCad: TDBText
      Left = 418
      DataField = ''
      Visible = False
      ExplicitLeft = 418
    end
    inherited LblUsuAlt: TDBText
      Left = 536
      DataField = ''
      Visible = False
      ExplicitLeft = 536
    end
    inherited LblUsuCad: TDBText
      Left = 418
      DataField = ''
      Visible = False
      ExplicitLeft = 418
    end
    inherited LCadastro: TLabel
      Left = 382
      Visible = False
      ExplicitLeft = 382
    end
    inherited LCadastroPor: TLabel
      Visible = False
    end
  end
  inherited PCentro: TPanel
    object Label1: TLabel
      Left = 8
      Top = 291
      Width = 28
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 141
      Top = 291
      Width = 27
      Height = 16
      Caption = 'Ano:'
    end
    object GBFuncionario: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 612
      Height = 281
      Align = alTop
      Caption = 'TAXAS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object GrdTaxas: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 606
        Height = 262
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        DataSource = DM.dsDespMensalTaxas
        DrawingStyle = gdsClassic
        FixedColor = 14671839
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnExit = TabNextTab1AfterTabChange
        OnKeyDown = GrdFuncionariosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 472
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Title.Caption = 'Valor (R$)'
            Width = 91
            Visible = True
          end>
      end
    end
    object CBMes: TDBComboBox
      Left = 40
      Top = 289
      Width = 75
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'MES'
      DataSource = DM.dsDespMensalTaxasPer
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
      TabOrder = 1
      OnExit = TabNextTab1AfterTabChange
    end
    object CBAno: TDBComboBox
      Left = 172
      Top = 289
      Width = 75
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ANO'
      DataSource = DM.dsDespMensalTaxasPer
      Items.Strings = (
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020'
        '2021'
        '2022'
        '2023'
        '2024'
        '2025'
        '2026'
        '2027'
        '2028'
        '2029'
        '2030')
      TabOrder = 2
      OnExit = TabNextTab1AfterTabChange
    end
  end
  inherited MainMenuPadrao: TMainMenu
    Top = 4
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 228
    Top = 0
  end
end

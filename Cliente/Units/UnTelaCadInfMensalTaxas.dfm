inherited FrmTelaCadInfMensalTaxas: TFrmTelaCadInfMensalTaxas
  Caption = 'Taxas do M'#234's'
  ClientHeight = 371
  ClientWidth = 784
  TextHeight = 16
  inherited PControle: TPanel
    Width = 780
    inherited LAlteracao: TLabel
      Visible = False
    end
    inherited LAlteradoPor: TLabel
      Visible = False
    end
    inherited LblDataAlt: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblDataCad: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblUsuAlt: TDBText
      DataField = ''
      Visible = False
    end
    inherited LblUsuCad: TDBText
      DataField = ''
      Visible = False
    end
    inherited LCadastro: TLabel
      Visible = False
    end
    inherited LCadastroPor: TLabel
      Visible = False
    end
  end
  inherited PCentro: TPanel
    Width = 780
    Height = 248
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
      Width = 776
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
      ExplicitWidth = 772
      object GrdTaxas: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 770
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
  inherited StatusBar1: TStatusBar
    Top = 352
    Width = 784
  end
  inherited PAuxiliares: TPanel
    Top = 325
    Width = 780
  end
  inherited PopupMenuRelat: TPopupMenu
    Left = 212
    Top = 112
  end
  inherited ActionList1: TActionList
    Left = 394
    Top = 115
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 310
    Top = 116
  end
end

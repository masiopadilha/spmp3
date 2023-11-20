inherited FrmTelaCadInfMensalFuncionarios: TFrmTelaCadInfMensalFuncionarios
  Caption = 'Informa'#231#245'es Mensais de Funcion'#225'rios'
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
      Left = 2
      Top = 293
      Width = 28
      Height = 16
      Alignment = taRightJustify
      Caption = 'M'#234's:'
    end
    object Label2: TLabel
      Left = 104
      Top = 293
      Width = 27
      Height = 16
      Caption = 'Ano:'
    end
    object GBFuncionario: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 776
      Height = 283
      Align = alTop
      Caption = 'FUNCION'#193'RIOS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 772
      object GrdFuncionarios: TDBGrid
        Left = 2
        Top = 15
        Width = 772
        Height = 266
        Align = alClient
        DataSource = DM.dsDespMensalFunc
        DrawingStyle = gdsClassic
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
            Color = 16250871
            Expanded = False
            FieldName = 'MATRICULA'
            ReadOnly = True
            Title.Caption = 'Matr'#237'cula'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Visible = True
          end
          item
            Color = 16250871
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Funcion'#225'rio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HENOREXEC'
            Title.Alignment = taCenter
            Title.Caption = 'HE Nor. Exec.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HEFEREXEC'
            Title.Alignment = taCenter
            Title.Caption = 'HE Fer. Exec.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HENORPAGAS'
            Title.Alignment = taCenter
            Title.Caption = 'HE Nor. Pagas'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HEFERPAGAS'
            Title.Alignment = taCenter
            Title.Caption = 'HE Fer. Pagas'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORASFOLGAS'
            Title.Alignment = taCenter
            Title.Caption = 'Folgas'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACIDSEMPT'
            Title.Alignment = taCenter
            Title.Caption = 'Acid. sem P.T.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACIDCOMPT'
            Title.Alignment = taCenter
            Title.Caption = 'Acid. com P.T.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIASPERDTOT'
            Title.Alignment = taCenter
            Title.Caption = 'Dias Perd.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUSTOTREIN'
            Title.Alignment = taCenter
            Title.Caption = 'Treinam.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 54
            Visible = True
          end>
      end
    end
    object CBMes: TDBComboBox
      Left = 34
      Top = 291
      Width = 60
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'MES'
      DataSource = DM.dsDespMensalFuncPer
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
      Left = 135
      Top = 291
      Width = 60
      Height = 22
      Style = csOwnerDrawFixed
      DataField = 'ANO'
      DataSource = DM.dsDespMensalFuncPer
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
    Left = 140
    Top = 112
  end
  inherited MainMenuPadrao: TMainMenu
    Left = 294
    Top = 188
  end
end

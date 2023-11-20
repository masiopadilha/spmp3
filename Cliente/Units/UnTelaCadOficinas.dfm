inherited FrmTelaCadOficinas: TFrmTelaCadOficinas
  Caption = 'Oficinas'
  ClientHeight = 441
  ClientWidth = 891
  ExplicitWidth = 903
  ExplicitHeight = 477
  TextHeight = 15
  inherited pntBoxFundo: TPaintBox
    Width = 891
    Height = 441
    ExplicitWidth = 891
    ExplicitHeight = 441
  end
  inherited PanelFundo: TPanel
    Width = 891
    Height = 441
    object Label1: TLabel [0]
      Left = 72
      Top = 136
      Width = 89
      Height = 15
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object Label2: TLabel [1]
      Left = 64
      Top = 89
      Width = 42
      Height = 15
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel [2]
      Left = 201
      Top = 89
      Width = 54
      Height = 15
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    inherited PanelConteudo: TPanel
      Width = 891
      Height = 441
      TabOrder = 6
      inherited PageControlCRUD: TPageControl
        Width = 888
        Height = 435
        inherited TabSheetLista: TTabSheet
          ExplicitWidth = 876
          ExplicitHeight = 396
          inherited PanelCor: TPanel
            Width = 876
            Height = 396
            inherited pJvDBGridLista: TPanel
              Width = 876
              Height = 396
              inherited pSearchBox: TPanel
                Width = 870
              end
              inherited JvDBGridLista: TJvDBGrid
                Width = 872
                Height = 348
              end
            end
          end
        end
        inherited TabSheetCadastra: TTabSheet
          ExplicitWidth = 874
          ExplicitHeight = 396
          inherited PControle: TPanel
            Width = 874
          end
          inherited ScrollBox1: TScrollBox
            Width = 874
            Height = 279
            inherited PanelColor: TPanel
              Width = 874
              Height = 279
              ExplicitHeight = 282
            end
          end
          inherited PAuxiliares: TPanel
            Top = 352
            Width = 874
          end
          inherited StatusBar1: TStatusBar
            Top = 377
            Width = 874
          end
        end
      end
    end
    object EdtCentroCusto: TDBEdit
      Left = 64
      Top = 152
      Width = 230
      Height = 23
      Color = clBtnFace
      DataField = 'CENTROCUSTO'
      DataSource = DM.dsOficinas
      ReadOnly = True
      TabOrder = 4
      OnKeyPress = FormKeyPress
    end
    object BtnCentroCusto: TButton
      Left = 299
      Top = 151
      Width = 28
      Height = 28
      Hint = 'Consultar/Cadastrar (Ctrl)'
      DisabledImageIndex = 111114
      ImageAlignment = iaCenter
      ImageIndex = 14
      Images = DM.ImageListBotoes
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnCentroCustoClick
    end
    object EdtCodigo: TDBEdit
      Tag = 555
      Left = 64
      Top = 106
      Width = 125
      Height = 23
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DM.dsOficinas
      ReadOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
      OnKeyPress = FormKeyPress
    end
    object EdtDescricao: TDBEdit
      Left = 195
      Top = 106
      Width = 230
      Height = 23
      DataField = 'DESCRICAO'
      DataSource = DM.dsOficinas
      TabOrder = 1
      OnKeyPress = FormKeyPress
    end
    object ChbAtivoNF: TDBCheckBox
      Left = 434
      Top = 110
      Width = 63
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ativo:'
      DataField = 'ATIVO'
      DataSource = DM.dsOficinas
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object ChbVisivelNF: TDBCheckBox
      Left = 510
      Top = 110
      Width = 71
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Vis'#237'vel:'
      DataField = 'VISIVEL'
      DataSource = DM.dsOficinas
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited PopupMenuRelat: TPopupMenu
    Top = 32
  end
  inherited ActionList1: TActionList
    Left = 306
    Top = 35
  end
end

inherited FrmTelaPneusRelatorios: TFrmTelaPneusRelatorios
  Caption = 'Relat'#243'rio de Pneus'
  ExplicitWidth = 480
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited PCentro: TPanel
    object PCPneus: TPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 450
      Height = 134
      ActivePage = TSID
      Align = alClient
      TabOrder = 1
      object TSID: TTabSheet
        Caption = 'ID'
        object PID: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 442
          Height = 106
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
        end
      end
      object TSEquipamento: TTabSheet
        Caption = 'Equipamento'
        ImageIndex = 1
        object PEquipamento: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 442
          Height = 106
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
        end
      end
      object TSPosicao: TTabSheet
        Caption = 'Posi'#231#227'o'
        ImageIndex = 2
        object PPosicao: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 442
          Height = 106
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
        end
      end
      object TSFabricante: TTabSheet
        Caption = 'Fabricante'
        ImageIndex = 3
        object PFabricante: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 442
          Height = 106
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
        end
      end
      object TSFornecedor: TTabSheet
        Caption = 'Fornecedor'
        ImageIndex = 4
        object PFornecedor: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 442
          Height = 106
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 14671839
          ParentBackground = False
          TabOrder = 0
        end
      end
    end
  end
end

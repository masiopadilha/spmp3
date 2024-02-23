inherited frmTelaInspecoesVencidas: TfrmTelaInspecoesVencidas
  Caption = 'Inspe'#231#245'es Vencidas'
  TextHeight = 18
  inherited PCentro: TPanel
    inherited PageControlCRUD: TPageControl
      inherited TabSheetLista: TTabSheet
        inherited PanelCor: TPanel
          inherited pJvDBGridLista: TPanel
            inherited JvDBGridLista: TJvDBGrid
              OnDrawColumnCell = JvDBGridListaDrawColumnCell
            end
          end
        end
      end
    end
  end
end

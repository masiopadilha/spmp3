unit UnTelaCadFuncionariosCxaFerramInv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Data.DB, FireDAC.Stan.Param;

type
  TFrmTelaCadFuncionariosCxaFerramInv = class(TFrmTelaPaiOkCancel)
    GrdEquipe: TDBGrid;
    GrdEquipeRecursos: TDBGrid;
    PopupMenuInventario: TPopupMenu;
    Abrir1: TMenuItem;
    Fechar1: TMenuItem;
    Excluir1: TMenuItem;
    BtnImprimir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure GrdEquipeDblClick(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure GrdEquipeRecursosKeyPress(Sender: TObject; var Key: Char);
    procedure GrdEquipeRecursosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Fechar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Excluir1Click(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFuncionariosCxaFerramInv: TFrmTelaCadFuncionariosCxaFerramInv;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnTelaConsulta, UnDM;

procedure TFrmTelaCadFuncionariosCxaFerramInv.Abrir1Click(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption    := EmptyStr;
if DM.qryFuncionariosCxaFerram.IsEmpty then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'FUNCIONÁRIO NÃO POSSUI FERRAMENTA!';
    Exit;
  end
else
if DM.qryFuncionariosCxaFerramInv.IsEmpty = False then
  begin
    if DM.qryFuncionariosCxaFerramInv.Locate('MATRICULA;DATAFECHAMENTO', VarArrayOf([DM.FParamAuxiliar[0], null]), []) = True then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'EXISTE UM INVENTÁRIO EM ABERTO!';
        Exit;
      end
    else
      begin
        DM.qryFuncionariosCxaFerramInv.Append;
        //DM.qryFuncionariosCxaFerramInvCODIGO.AsInteger        := DM.RetornaProximoIndice('funcionariosinventario');
        DM.qryFuncionariosCxaFerramInvCODEMPRESA.AsString     := DM.FCodEmpresa;
        DM.qryFuncionariosCxaFerramInvMATRICULA.AsString      := DM.FParamAuxiliar[0];
        DM.qryFuncionariosCxaFerramInvDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
        DM.qryFuncionariosCxaFerramInvFUNCIONARIO.AsString    := DM.qryFuncionariosCxaFerramFUNCIONARIO.AsString;
        DM.qryFuncionariosCxaFerramInv.Post;
        DM.qryFuncionariosCxaFerramInv.First;

        DM.qryFuncionariosCxaFerram.First;
        while not DM.qryFuncionariosCxaFerram.Eof = True do
          begin
            DM.qryFuncionariosCxaFerramInvItens.Append;
//            DM.qryFuncionariosCxaFerramInvItensCODIGO.AsInteger        := DM.qryFuncionariosCxaFerramInvItens.RecordCount + 1;
            DM.qryFuncionariosCxaFerramInvItensCODEMPRESA.AsString     := DM.FCodEmpresa;
            DM.qryFuncionariosCxaFerramInvItensCODINVENTARIO.AsInteger := DM.qryFuncionariosCxaFerramInvCODIGO.AsInteger;
            DM.qryFuncionariosCxaFerramInvItensMATRICULA.AsString      := DM.FParamAuxiliar[0];
            DM.qryFuncionariosCxaFerramInvItensKIT.AsString            := DM.qryFuncionariosCxaFerramKIT.AsString;
            DM.qryFuncionariosCxaFerramInvItensCODITEM.AsString        := DM.qryFuncionariosCxaFerramCODITEM.AsString;
            DM.qryFuncionariosCxaFerramInvItensDESCRICAO.AsString      := DM.qryFuncionariosCxaFerramDESCRICAO.AsString;
            DM.qryFuncionariosCxaFerramInvItensQUANTIDADE.AsInteger    := 0;
            DM.qryFuncionariosCxaFerramInvItensENTREGUE.AsInteger      := DM.qryFuncionariosCxaFerramQUANTIDADE.AsInteger;
            DM.qryFuncionariosCxaFerramInvItens.Post;

            DM.qryFuncionariosCxaFerram.Next;
          end;

         //DM.qryFuncionariosCxaFerramInvItens.Close;
         //DM.qryFuncionariosCxaFerramInvItens.Open;
         DM.qryFuncionariosCxaFerramInvItens.Edit;
      end;
  end
else
  begin
    DM.qryFuncionariosCxaFerramInv.Edit;
    //DM.qryFuncionariosCxaFerramInvCODIGO.AsInteger        := DM.RetornaProximoIndice('funcionariosinventario');
    DM.qryFuncionariosCxaFerramInvCODEMPRESA.AsString     := DM.FCodEmpresa;
    DM.qryFuncionariosCxaFerramInvMATRICULA.AsString      := DM.FParamAuxiliar[0];
    DM.qryFuncionariosCxaFerramInvDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
    DM.qryFuncionariosCxaFerramInv.Post;

    DM.qryFuncionariosCxaFerram.First;
    while not DM.qryFuncionariosCxaFerram.Eof = True do
      begin
        DM.qryFuncionariosCxaFerramInvItens.Append;
//        DM.qryFuncionariosCxaFerramInvItensCODIGO.AsInteger        := DM.qryFuncionariosCxaFerramInvItens.RecordCount + 1;
        DM.qryFuncionariosCxaFerramInvItensCODEMPRESA.AsString     := DM.FCodEmpresa;
        DM.qryFuncionariosCxaFerramInvItensCODINVENTARIO.AsInteger := DM.qryFuncionariosCxaFerramInvCODIGO.AsInteger;
        DM.qryFuncionariosCxaFerramInvItensMATRICULA.AsString      := DM.FParamAuxiliar[0];
        DM.qryFuncionariosCxaFerramInvItensKIT.AsString            := DM.qryFuncionariosCxaFerramKIT.AsString;
        DM.qryFuncionariosCxaFerramInvItensCODITEM.AsString        := DM.qryFuncionariosCxaFerramCODITEM.AsString;
        DM.qryFuncionariosCxaFerramInvItensDESCRICAO.AsString      := DM.qryFuncionariosCxaFerramDESCRICAO.AsString;
        DM.qryFuncionariosCxaFerramInvItensQUANTIDADE.AsInteger    := 0;
        DM.qryFuncionariosCxaFerramInvItensENTREGUE.AsInteger      := DM.qryFuncionariosCxaFerramQUANTIDADE.AsInteger;
        DM.qryFuncionariosCxaFerramInvItens.Post;

        DM.qryFuncionariosCxaFerram.Next;
      end;

     //DM.qryFuncionariosCxaFerramInvItens.Close;
     //DM.qryFuncionariosCxaFerramInvItens.Open;
     DM.qryFuncionariosCxaFerramInvItens.Edit;
  end;
end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.BtnImprimirClick(Sender: TObject);
begin
  inherited;
if not Assigned(DmRelatorios) then
  Application.CreateForm(TDmRelatorios, DmRelatorios);
DmRelatorios.frxRFuncionariosCxaFerramInv.ShowReport();
end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.Excluir1Click(Sender: TObject);
begin
  inherited;
if (DM.qryUsuarioPExclusao.FieldByName(DM.FTela).AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'SEM PERMISSÃO PARA EXCLUSÃO!';
    Exit;
  end;
DM.qryFuncionariosCxaFerramInv.Delete;
end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.Fechar1Click(Sender: TObject);
begin
  inherited;
PAuxiliares.Font.Color := clGray;
PAuxiliares.Caption    := EmptyStr;

DM.qryDataHoraServidor.Refresh;
DM.FDataHoraServidor := DM.qryDataHoraServidordatahoraservidor.AsDateTime;

if DM.qryFuncionariosCxaFerramInv.IsEmpty = True then Exit;
if DM.qryFuncionariosCxaFerramInvDATAFECHAMENTO.IsNull then
  begin
    DM.qryFuncionariosCxaFerramInv.Edit;
    DM.qryFuncionariosCxaFerramInvDATAFECHAMENTO.AsDateTime := DM.FDataHoraServidor;
    DM.qryFuncionariosCxaFerramInv.Post;
  end;
end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryFuncionariosCxaFerram.Close;
DM.qryFuncionariosCxaFerramInv.Close;
DM.qryFuncionariosCxaFerramInvItens.Close;
end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.FormCreate(Sender: TObject);
begin
  inherited;
DM.FTela := 'CADFUNCIONARIOS';

DM.qryFuncionariosCxaFerram.Close;
//DM.qryFuncionariosCxaFerram.Params[0].AsString := DM.FParamAuxiliar[0];
//DM.qryFuncionariosCxaFerram.Params[1].AsString := DM.FCodEmpresa;
DM.qryFuncionariosCxaFerram.Open;

DM.qryFuncionariosCxaFerramInv.Close;
//DM.qryFuncionariosCxaFerramInv.Params[0].AsString := DM.FCodEmpresa;
//DM.qryFuncionariosCxaFerramInv.Params[1].AsString := DM.FParamAuxiliar[0];
DM.qryFuncionariosCxaFerramInv.Open;

DM.qryFuncionariosCxaFerramInvItens.Close;
//DM.qryFuncionariosCxaFerramInvItens.Params[0].AsInteger := DM.qryFuncionariosCxaFerramInvCODIGO.AsInteger;
DM.qryFuncionariosCxaFerramInvItens.Open;
DM.qryFuncionariosCxaFerramInvItens.Edit;
end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.GrdEquipeDblClick(
  Sender: TObject);
begin
  inherited;
PopupMenuInventario.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.GrdEquipeRecursosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
if Key = 40 then
  begin
    if DM.qryFuncionariosCxaFerramInvItens.RecNo = DM.qryFuncionariosCxaFerramInvItens.RecordCount then
      begin
        Key := 0;
        Exit;
      end;
  end;

end;

procedure TFrmTelaCadFuncionariosCxaFerramInv.GrdEquipeRecursosKeyPress(
  Sender: TObject; var Key: Char);
var
LCampo : String;
begin
  inherited;
if DM.qryFuncionariosCxaFerramInv.IsEmpty = True then
  begin
    Key := #0;
    Exit;
  end;

if not DM.qryFuncionariosCxaFerramInvDATAFECHAMENTO.IsNull = True then
  begin
    Key := #0;
    Exit;
  end;

if (Key = #13) then
  begin
    DM.FTabela_auxiliar := 460;

    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally
      FreeAndNil(FrmTelaAuxiliar);
    End;
    if DM.FCodCombo <> EmptyStr then
      begin
        if DM.qryFuncionariosCxaFerramInvItens.Locate('CODITEM', DM.FCodCombo, []) = False then
          begin
            LCampo := DM.CampoInputBox('SPMP', 'Informe a quantidade do recurso:');
            if LCampo <> EmptyStr then
              begin
                try
                  StrToInt(LCampo)
                except
                  PAuxiliares.Font.Color := clRed;
                  PAuxiliares.Caption := 'VALOR INVÁLIDO!';
                  Exit;
                end;

                DM.qryRecursos.Close;
                DM.qryRecursos.Params[0].AsString := DM.FCodCombo;
                DM.qryRecursos.Params[1].AsString := DM.FCodEmpresa;
                DM.qryRecursos.Open;
                if DM.qryRecursosQUANTIDADE.AsInteger >= StrToInt(LCampo) then
                  begin
                    DM.qryRecursos.Edit;
                    DM.qryRecursosQUANTIDADE.AsInteger := DM.qryRecursosQUANTIDADE.AsInteger - StrToInt(LCampo);
                    DM.qryRecursos.Post;
                  end
                else
                  begin
                    PAuxiliares.Font.Color := clRed;
                    PAuxiliares.Caption := 'QUANTIDADE NÃO DISPONÍVEL!';
                    Exit;
                  end;
              end
            else Exit;

            DM.qryFuncionariosCxaFerramInvItens.Append;
            //DM.qryFuncionariosCxaFerramInvItensCODIGO.AsInteger     := DM.qryRecursoKitItens.RecordCount + 1;
            DM.qryFuncionariosCxaFerramInvItensCODEMPRESA.AsString    := DM.FCodEmpresa;
            DM.qryFuncionariosCxaFerramInvItensCODINVENTARIO.AsString := DM.qryFuncionariosCxaFerramInvCODIGO.AsString;
            DM.qryFuncionariosCxaFerramInvItensCODITEM.AsString       := DM.FCodCombo;
            DM.qryFuncionariosCxaFerramInvItensQUANTIDADE.AsInteger   := StrToInt(LCampo);
            DM.qryFuncionariosCxaFerramInvItensDESCRICAO.AsString     := DM.FValorCombo;
            DM.qryFuncionariosCxaFerramInvItens.Post;
          end;
      end;
  end;
end;

end.

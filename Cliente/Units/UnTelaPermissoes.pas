unit UnTelaPermissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.DBCtrls, JvExControls,
  JvButton, JvTransparentButton, Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.ImgList,
  Datasnap.DBClient, System.ImageList, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TFrmTelaPermissoes = class(TFrmTelaPaiOkCancel)
    PBase: TPanel;
    GBTelas: TGroupBox;
    TVTelas: TTreeView;
    ImageList1: TImageList;
    CDPermissoesUsu: TClientDataSet;
    CDPermissoesUsuMATRICULA: TStringField;
    CDPermissoesUsuNOME: TStringField;
    CDPermissoesUsuPESSOAL: TStringField;
    CDPermissoesUsuACESSO: TStringField;
    CDPermissoesUsuALTERACAO: TStringField;
    CDPermissoesUsuEXCLUSAO: TStringField;
    CDPermissoesUsuINCLUSAO: TStringField;
    DSPermissoesUsu: TDataSource;
    CDPermissoesUsuCODIGO: TIntegerField;
    CDPermissoesUsuNIVELACESSO: TStringField;
    CDPermissoesUsuCODNIVELACESSO: TStringField;
    CDPermissoesUsuCODUSUARIO: TStringField;
    pBaseDireito: TPanel;
    rgNivelAcesso: TRadioGroup;
    GBPermissoes: TGroupBox;
    GrdPermissoes: TDBGrid;
    PBotes: TPanel;
    btnAtualizar: TButton;
    BtnPadrao: TButton;
    BtnGrupo: TButton;
    function ValidaTelaEscolhida(Texto:String):String;
    procedure FormCreate(Sender: TObject);
    procedure GrdPermissoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdPermissoesCellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGrupoClick(Sender: TObject);
    procedure BtnPadraoClick(Sender: TObject);
    procedure TVTelasClick(Sender: TObject);
    procedure GrdPermissoesKeyPress(Sender: TObject; var Key: Char);
    procedure rgNivelAcessoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaPermissoes: TFrmTelaPermissoes;
  LTela :String;
  LPermissoes : array[0..65] of String;

implementation

{$R *.dfm}

uses UnDM, UnTelaConsulta;

procedure TFrmTelaPermissoes.GrdPermissoesCellClick(Column: TColumn);
begin
  inherited;
PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;

if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  Exit;

if ((Column.Field = CDPermissoesUsuACESSO) or (Column.Field = CDPermissoesUsuALTERACAO)
  or (Column.Field = CDPermissoesUsuEXCLUSAO) or (Column.Field = CDPermissoesUsuINCLUSAO)) then
    begin
      //if CDPermissoesUsuPESSOAL.AsString = 'S' then
        begin
          case GrdPermissoes.SelectedIndex of
           4://Acessar
             begin
               CDPermissoesUsu.Edit;
               if (Column.Field.AsString = EmptyStr ) or (Column.Field.AsString = 'N') then
                 begin
                   Column.Field.AsString := 'S';
                   if DM.qryPermissoesAcesso.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesAcesso.Edit;
                       DM.qryPermissoesAcesso.FieldByName(LTela).AsString := 'S';
                       DM.qryPermissoesAcesso.Post;
                       DM.qryPermissoesAcesso.Refresh;
                     end;
                 end
               else
                 begin
                   Column.Field.AsString := 'N';
                   if DM.qryPermissoesAcesso.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesAcesso.Edit;
                       DM.qryPermissoesAcesso.FieldByName(LTela).AsString := 'N';
                       DM.qryPermissoesAcesso.Post;
                       DM.qryPermissoesAcesso.Refresh;
                     end;
                 end;
               CDPermissoesUsu.Post;
             end;
           5://Alterar
             begin
               CDPermissoesUsu.Edit;
               if (Column.Field.AsString = EmptyStr) or (Column.Field.AsString = 'N') then
                 begin
                   Column.Field.AsString := 'S';
                   if DM.qryPermissoesAlteracao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesAlteracao.Edit;
                       DM.qryPermissoesAlteracao.FieldByName(LTela).AsString := 'S';
                       DM.qryPermissoesAlteracao.Post;
                       DM.qryPermissoesAlteracao.Refresh;
                     end;
                 end
               else
                 begin
                   Column.Field.AsString := 'N';
                   if DM.qryPermissoesAlteracao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesAlteracao.Edit;
                       DM.qryPermissoesAlteracao.FieldByName(LTela).AsString := 'N';
                       DM.qryPermissoesAlteracao.Post;
                       DM.qryPermissoesAlteracao.Refresh;
                     end;
                 end;
               CDPermissoesUsu.Post;
             end;
           6://Exclusao
             begin
               CDPermissoesUsu.Edit;
               if (Column.Field.AsString = EmptyStr) or (Column.Field.AsString = 'N') then
                 begin
                   Column.Field.AsString := 'S';
                   if DM.qryPermissoesExclusao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesExclusao.Edit;
                       DM.qryPermissoesExclusao.FieldByName(LTela).AsString := 'S';
                       DM.qryPermissoesExclusao.Post;
                       DM.qryPermissoesExclusao.Refresh;
                     end;
                 end
               else
                 begin
                   Column.Field.AsString := 'N';
                   if DM.qryPermissoesExclusao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesExclusao.Edit;
                       DM.qryPermissoesExclusao.FieldByName(LTela).AsString := 'N';
                       DM.qryPermissoesExclusao.Post;
                       DM.qryPermissoesExclusao.Refresh;
                     end;
                 end;
               CDPermissoesUsu.Post;
             end;
           7://Inclusão
             begin
               CDPermissoesUsu.Edit;
               if (Column.Field.AsString = EmptyStr) or (Column.Field.AsString = 'N') then
                 begin
                   Column.Field.AsString := 'S';
                   if DM.qryPermissoesInclusao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesInclusao.Edit;
                       DM.qryPermissoesInclusao.FieldByName(LTela).AsString := 'S';
                       DM.qryPermissoesInclusao.Post;
                       DM.qryPermissoesInclusao.Refresh;
                     end;
                 end
               else
                 begin
                   Column.Field.AsString := 'N';
                   if DM.qryPermissoesInclusao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
                     begin
                       DM.qryPermissoesInclusao.Edit;
                       DM.qryPermissoesInclusao.FieldByName(LTela).AsString := 'N';
                       DM.qryPermissoesInclusao.Post;
                       DM.qryPermissoesInclusao.Refresh;
                     end;
                 end;
               CDPermissoesUsu.Post;
             end;
          end;
        end
      //else
      //if (CDPermissoesUsuPESSOAL.AsString = 'N') then
        //begin
          //case GrdPermissoes.SelectedIndex of
            //4,5,6,7:
              //begin
                //PAuxiliares.Font.Color := clRed;
                //PAuxiliares.Caption := 'O GRUPO DE PERMISSÕES DO USUÁRIO NÃO É PESSOAL';
              //end;
          //end;
        //end;
    end;
end;

procedure TFrmTelaPermissoes.GrdPermissoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  Exit;

GrdPermissoes.Columns[0].Title.Font.Size := 8; GrdPermissoes.Columns[1].Title.Font.Size := 8; GrdPermissoes.Columns[2].Title.Font.Size := 8;
GrdPermissoes.Columns[3].Title.Font.Size := 8; GrdPermissoes.Columns[4].Title.Font.Size := 8; GrdPermissoes.Columns[5].Title.Font.Size := 8;
GrdPermissoes.Columns[6].Title.Font.Size := 8; GrdPermissoes.Columns[7].Title.Font.Size := 8;

GrdPermissoes.Columns[0].Title.Font.Style := []; GrdPermissoes.Columns[1].Title.Font.Style := [fsBold]; GrdPermissoes.Columns[2].Title.Font.Style := [];
GrdPermissoes.Columns[3].Title.Font.Style := []; GrdPermissoes.Columns[4].Title.Font.Style := []; GrdPermissoes.Columns[5].Title.Font.Style := [];
GrdPermissoes.Columns[6].Title.Font.Style := []; GrdPermissoes.Columns[7].Title.Font.Style := [];

GrdPermissoes.Columns[0].Title.Alignment := taCenter; GrdPermissoes.Columns[3].Title.Alignment := taCenter;
GrdPermissoes.Columns[4].Title.Alignment := taCenter; GrdPermissoes.Columns[5].Title.Alignment := taCenter;
GrdPermissoes.Columns[6].Title.Alignment := taCenter; GrdPermissoes.Columns[7].Title.Alignment := taCenter;

GrdPermissoes.Columns[4].Font.Color := clWhite; GrdPermissoes.Columns[5].Font.Color := clWhite;
GrdPermissoes.Columns[6].Font.Color := clWhite; GrdPermissoes.Columns[7].Font.Color := clWhite;

if CDPermissoesUsuPESSOAL.AsString = 'N' then
  begin
    GrdPermissoes.Canvas.Font.Color := clGray;
    GrdPermissoes.Canvas.FillRect(Rect);
    GrdPermissoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

if (Column.Field = CDPermissoesUsuPESSOAL) then
  begin
    if (Column.Field.AsString = 'S') then
      begin
        GrdPermissoes.Canvas.Font.Color := clRed;
        GrdPermissoes.Canvas.Font.Style :=[fsBold];
      end
    else
    if (Column.Field.AsString = 'N') then
      begin
        GrdPermissoes.Canvas.Font.Color := clBlue;
        GrdPermissoes.Canvas.Font.Style := [fsbold];
      end;
    GrdPermissoes.Canvas.FillRect(Rect);
    GrdPermissoes.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

if ((Column.Field = CDPermissoesUsuACESSO) or (Column.Field = CDPermissoesUsuALTERACAO)
  or (Column.Field = CDPermissoesUsuEXCLUSAO) or (Column.Field = CDPermissoesUsuINCLUSAO)) then
  begin
    GrdPermissoes.Canvas.FillRect(Rect);
    GrdPermissoes.DefaultDrawDataCell(Rect, Column.Field, State);
    if (Column.Field.AsString = 'S') {and (CDPermissoesUsuPESSOAL.AsString = 'S')} then
      ImageList1.Draw(GrdPermissoes.Canvas, Rect.Left + 15, Rect.Top + 1, 0)
    else
    if (Column.Field.AsString = 'N') or (Column.Field.AsString = EmptyStr) then
      ImageList1.Draw(GrdPermissoes.Canvas, Rect.Left + 15, Rect.Top + 1, 1)
    else
    if (CDPermissoesUsuPESSOAL.AsString = 'N') then
      ImageList1.Draw(GrdPermissoes.Canvas, Rect.Left + 15, Rect.Top + 1, 2)
  end;
end;

procedure TFrmTelaPermissoes.GrdPermissoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if (Key = #13) and (GrdPermissoes.SelectedIndex = 1) then
  begin
    DM.FTabela_auxiliar := 2900;
    Try
      Application.CreateForm(TFrmTelaAuxiliar, FrmTelaAuxiliar);
      FrmTelaAuxiliar.ShowModal;
    Finally

      if DM.FCodCombo <> '' then
        CDPermissoesUsu.Locate('NOME', DM.FValorCombo, []);

      FreeAndNil(FrmTelaAuxiliar);
    End;
  end;
end;

procedure TFrmTelaPermissoes.rgNivelAcessoClick(Sender: TObject);
begin
  inherited;
  case rgNivelAcesso.ItemIndex of
    0:
      begin
        CDPermissoesUsu.Filtered := False;
      end;
    1:
      begin
        CDPermissoesUsu.Filter := 'CODNIVELACESSO = ''CTM-00001''';
        CDPermissoesUsu.Filtered := True;
      end;
    2:
      begin
        CDPermissoesUsu.Filter := 'CODNIVELACESSO = ''ECT-00001''';
        CDPermissoesUsu.Filtered := True;
      end;
    3:
      begin
        CDPermissoesUsu.Filter := 'CODNIVELACESSO = ''ECT-00002''';
        CDPermissoesUsu.Filtered := True;
      end;
    4:
      begin
        CDPermissoesUsu.Filter := 'CODNIVELACESSO = ''STB-00001''';
        CDPermissoesUsu.Filtered := True;
      end;
  end;
end;

procedure TFrmTelaPermissoes.TVTelasClick(Sender: TObject);
var
I : SmallInt;
begin
  inherited;
if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    Application.MessageBox('Apenas Administrador de Unidade pode alterar permissões.', 'SPMP3', MB_OK + MB_ICONSTOP);
    Exit;
  end;

PAuxiliares.Font.Color := clGreen;
PAuxiliares.Caption := EmptyStr;
GBPermissoes.Caption := 'Permissões:';

if ValidaTelaEscolhida(TVTelas.Selected.Text) <> EmptyStr then
  begin
    GBPermissoes.Caption := 'Permissões: '+ TVTelas.Selected.Text;
    DM.qryPermissoesAcesso.First;
    DM.qryPermissoesAlteracao.First;
    DM.qryPermissoesExclusao.First;
    DM.qryPermissoesInclusao.First;

    CDPermissoesUsu.Close;
    CDPermissoesUsu.CreateDataSet;
    for I := 0 to DM.qryPermissoesAcesso.RecordCount - 1 do
      begin
        CDPermissoesUsu.Append;
        CDPermissoesUsuCODUSUARIO.AsString     := DM.qryPermissoesAcessoCODUSUARIO.AsString;
        CDPermissoesUsuMATRICULA.AsString      := DM.qryPermissoesAcessoMATRICULA.AsString;
        CDPermissoesUsuNOME.AsString           := DM.qryPermissoesAcessoNOME.AsString;
        CDPermissoesUsuCODNIVELACESSO.AsString := DM.qryPermissoesAcessoCODNIVELACESSO.AsString;
        CDPermissoesUsuNIVELACESSO.AsString    := DM.qryPermissoesAcessoNIVELACESSO.AsString;
        CDPermissoesUsuPESSOAL.AsString        := DM.qryPermissoesAcessoPESSOAL.AsString;
        CDPermissoesUsuACESSO.AsString         := DM.qryPermissoesAcesso.FieldByName(LTela).AsString;
        CDPermissoesUsuALTERACAO.AsString      := DM.qryPermissoesAlteracao.FieldByName(LTela).AsString;
        CDPermissoesUsuEXCLUSAO.AsString       := DM.qryPermissoesExclusao.FieldByName(LTela).AsString;
        CDPermissoesUsuINCLUSAO.AsString       := DM.qryPermissoesInclusao.FieldByName(LTela).AsString;
        CDPermissoesUsuCODIGO.AsString         := DM.qryPermissoesAcessoCODIGO.AsString;
        CDPermissoesUsu.Post;

        DM.qryPermissoesAcesso.Next;
        DM.qryPermissoesAlteracao.Next;
        DM.qryPermissoesExclusao.Next;
        DM.qryPermissoesInclusao.Next;
      end;
    CDPermissoesUsu.First;
  end;
end;

procedure TFrmTelaPermissoes.BtnGrupoClick(Sender: TObject);
var
LTexto : PChar;
LDataSet : TFDQuery;
LNovoCodigo, I : SmallInt;
begin
  inherited;
if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  Exit;

//LNovoCodigo := 0;
LDataSet := DM.qryPermissoesAcesso;
if CDPermissoesUsuPESSOAL.AsString = 'S' then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'JÁ EXISTE UM GRUPO DE PERMISSÕES PESSOAL PARA O USUÁRIO!';
    Exit;
  end
else
if CDPermissoesUsuPESSOAL.AsString = 'N' then
  begin
    LTexto := PChar('Deseja realmente criar um grupo de permissões individual para o usuário: '+CDPermissoesUsuNOME.AsString+' ?');
    if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
      begin
        DM.qryAuxiliar.Close;
        DM.qryAuxiliar.SQL.Clear;
        DM.qryAuxiliar.SQL.Add('SELECT (MAX(CODIGO) + 1) NOVOID FROM permissoes_acesso');
        DM.qryAuxiliar.Open;
        LNovoCodigo := DM.qryAuxiliar.FieldByName('NOVOID').AsInteger;
        DM.qryAuxiliar.Close;

        for I := 0 to 3 do
          begin
            case I of
              0: LDataSet := DM.qryPermissoesAcesso;
              1: LDataSet := DM.qryPermissoesAlteracao;
              2: LDataSet := DM.qryPermissoesInclusao;
              3: LDataSet := DM.qryPermissoesExclusao;
            end;
            if LDataSet.Locate('CODIGO', CDPermissoesUsuCODIGO.AsString, []) = True then
              begin
                LPermissoes[0] := LDataSet.FieldByName('CADALMOXARIFADO').AsString;              LPermissoes[1] := LDataSet.FieldByName('CADAREAS').AsString;                  LPermissoes[2] := LDataSet.FieldByName('CADARQUIVOTECNICO').AsString;            LPermissoes[3] := LDataSet.FieldByName('CADCALENDARIOOS').AsString;
                LPermissoes[4] := LDataSet.FieldByName('CADCALENDEQUIP').AsString;               LPermissoes[5] := LDataSet.FieldByName('CADCALENDMOBRA').AsString;            LPermissoes[6] := LDataSet.FieldByName('CADCARGOS').AsString;                    LPermissoes[7] := LDataSet.FieldByName('CADCAUSASFALHA').AsString;
                LPermissoes[8] := LDataSet.FieldByName('CADCENTROCUSTO').AsString;               LPermissoes[9] := LDataSet.FieldByName('CADCLASSES').AsString;                LPermissoes[10] := LDataSet.FieldByName('CADCONFIABILIDADE').AsString;           LPermissoes[11] := LDataSet.FieldByName('CADCONSULTAS').AsString;
                LPermissoes[12] := LDataSet.FieldByName('CADCONTROLEPNEUS').AsString;            LPermissoes[13] := LDataSet.FieldByName('CADDISPONIBILIDADE').AsString;       LPermissoes[14] := LDataSet.FieldByName('CADEQUIPAMENTOS').AsString;             LPermissoes[15] := LDataSet.FieldByName('CADFABRICANTES').AsString;
                LPermissoes[16] := LDataSet.FieldByName('CADFAMILIAEQUIP').AsString;             LPermissoes[17] := LDataSet.FieldByName('CADFAMILIAPECASREP').AsString;       LPermissoes[18] := LDataSet.FieldByName('CADFAMILIARECURSOS').AsString;          LPermissoes[19] := LDataSet.FieldByName('CADFECHAMANUT').AsString;
                LPermissoes[20] := LDataSet.FieldByName('CADFERIADOS').AsString;                 LPermissoes[21] := LDataSet.FieldByName('CADFORMATOCODIGO').AsString;         LPermissoes[22] := LDataSet.FieldByName('CADFORNECEDORES').AsString;             LPermissoes[23] := LDataSet.FieldByName('CADFUNCIONARIOS').AsString;
                LPermissoes[24] := LDataSet.FieldByName('CADGRUPOINDUSTRIAL').AsString;          LPermissoes[25] := LDataSet.FieldByName('CADHISTORICOEQUIP').AsString;        LPermissoes[26] := LDataSet.FieldByName('CADIMANGENS').AsString;                 LPermissoes[27] := LDataSet.FieldByName('CADINDDESEMPENHO').AsString;
                LPermissoes[28] := LDataSet.FieldByName('CADINFMENSAIS').AsString;               LPermissoes[29] := LDataSet.FieldByName('CADLUBRIFICANTES').AsString;         LPermissoes[30] := LDataSet.FieldByName('CADLUBRIFICPROG').AsString;             LPermissoes[31] := LDataSet.FieldByName('CADLUBRIFICPROGEQUIP').AsString;
                LPermissoes[32] := LDataSet.FieldByName('CADMANUTENCAO').AsString;               LPermissoes[33] := LDataSet.FieldByName('CADMANUTPROG').AsString;             LPermissoes[34] := LDataSet.FieldByName('CADMANUTPROGEQUIP').AsString;           LPermissoes[35] := LDataSet.FieldByName('CADMAODEOBRAESP').AsString;
                LPermissoes[36] := LDataSet.FieldByName('CADMONITORAMENTO').AsString;            LPermissoes[37] := LDataSet.FieldByName('CADMOTIVOPARADA').AsString;          LPermissoes[38] := LDataSet.FieldByName('CADNAVEGACAO').AsString;                LPermissoes[39] := LDataSet.FieldByName('CADOFICINAS').AsString;
                LPermissoes[40] := LDataSet.FieldByName('CADORDEMSERVICO').AsString;             LPermissoes[41] := LDataSet.FieldByName('CADORDEMSERVICOHIST').AsString;      LPermissoes[42] := LDataSet.FieldByName('CADORDEMSERVICOMAODEOBRA').AsString;    LPermissoes[43] := LDataSet.FieldByName('CADPECASREP').AsString;
                LPermissoes[44] := LDataSet.FieldByName('CADPECASREPINST').AsString;             LPermissoes[45] := LDataSet.FieldByName('CADPECASREPKIT').AsString;           LPermissoes[46] := LDataSet.FieldByName('CADPECASREPOSICAOEQUIP').AsString;      LPermissoes[47] := LDataSet.FieldByName('CADPERMISSOES').AsString;
                LPermissoes[48] := LDataSet.FieldByName('CADPLANOTRAB').AsString;                LPermissoes[49] := LDataSet.FieldByName('CADPONTOSINSPECAO').AsString;        LPermissoes[50] := LDataSet.FieldByName('CADRECURSOS').AsString;                 LPermissoes[51] := LDataSet.FieldByName('CADRECURSOSKIT').AsString;
                LPermissoes[52] := LDataSet.FieldByName('CADRELATINSP').AsString;                LPermissoes[53] := LDataSet.FieldByName('CADRELATORIOS').AsString;            LPermissoes[54] := LDataSet.FieldByName('CADRESERVA').AsString;                  LPermissoes[55] := LDataSet.FieldByName('CADSOLICITACAOTRAB').AsString;
                LPermissoes[56] := LDataSet.FieldByName('CADTERCEIRIZADAS').AsString;            LPermissoes[57] := LDataSet.FieldByName('CADTIPOPROGRAMACAO').AsString;       LPermissoes[58] := LDataSet.FieldByName('CADUSUARIOS').AsString;                 LPermissoes[59] := LDataSet.FieldByName('CADORDEMSERVICOFECHAR').AsString;
                LPermissoes[60] := LDataSet.FieldByName('CADFERRAMENTARIA').AsString;            LPermissoes[61] := LDataSet.FieldByName('CADORDEMSERVICOPROGRAMAR').AsString; LPermissoes[62] := LDataSet.FieldByName('CADORDEMSERVICODESPROGRAMAR').AsString; LPermissoes[63] := LDataSet.FieldByName('CADORDEMSERVICOEXECUTAR').AsString;
                LPermissoes[64] := LDataSet.FieldByName('CADORDEMSERVICOPARALISAR').AsString;    LPermissoes[65] := LDataSet.FieldByName('CADORDEMSERVICOLIBERAR').AsString;

                LDataSet.Append;
//                LDataSet.FieldByName('CODIGO').AsInteger        := LNovoCodigo;
                LDataSet.FieldByName('CODNIVELACESSO').AsString := CDPermissoesUsuCODNIVELACESSO.AsString;
                LDataSet.FieldByName('PESSOAL').AsString        := 'S';

                LDataSet.FieldByName('CADALMOXARIFADO').AsString          := LPermissoes[0];     LDataSet.FieldByName('CADAREAS').AsString                  := LPermissoes[1];     LDataSet.FieldByName('CADARQUIVOTECNICO').AsString           := LPermissoes[2];   LDataSet.FieldByName('CADCALENDARIOOS').AsString         := LPermissoes[3];
                LDataSet.FieldByName('CADCALENDEQUIP').AsString           := LPermissoes[4];     LDataSet.FieldByName('CADCALENDMOBRA').AsString            := LPermissoes[5];     LDataSet.FieldByName('CADCARGOS').AsString                   := LPermissoes[6];   LDataSet.FieldByName('CADCAUSASFALHA').AsString          := LPermissoes[7];
                LDataSet.FieldByName('CADCENTROCUSTO').AsString           := LPermissoes[8];     LDataSet.FieldByName('CADCLASSES').AsString                := LPermissoes[9];     LDataSet.FieldByName('CADCONFIABILIDADE').AsString           := LPermissoes[10];  LDataSet.FieldByName('CADCONSULTAS').AsString            := LPermissoes[11];
                LDataSet.FieldByName('CADCONTROLEPNEUS').AsString         := LPermissoes[12];    LDataSet.FieldByName('CADDISPONIBILIDADE').AsString        := LPermissoes[13];    LDataSet.FieldByName('CADEQUIPAMENTOS').AsString             := LPermissoes[14];  LDataSet.FieldByName('CADFABRICANTES').AsString          := LPermissoes[15];
                LDataSet.FieldByName('CADFAMILIAEQUIP').AsString          := LPermissoes[16];    LDataSet.FieldByName('CADFAMILIAPECASREP').AsString        := LPermissoes[17];    LDataSet.FieldByName('CADFAMILIARECURSOS').AsString          := LPermissoes[18];  LDataSet.FieldByName('CADFECHAMANUT').AsString           := LPermissoes[19];
                LDataSet.FieldByName('CADFERIADOS').AsString              := LPermissoes[20];    LDataSet.FieldByName('CADFORMATOCODIGO').AsString          := LPermissoes[21];    LDataSet.FieldByName('CADFORNECEDORES').AsString             := LPermissoes[22];  LDataSet.FieldByName('CADFUNCIONARIOS').AsString         := LPermissoes[23];
                LDataSet.FieldByName('CADGRUPOINDUSTRIAL').AsString       := LPermissoes[24];    LDataSet.FieldByName('CADHISTORICOEQUIP').AsString         := LPermissoes[25];    LDataSet.FieldByName('CADIMANGENS').AsString                 := LPermissoes[26];  LDataSet.FieldByName('CADINDDESEMPENHO').AsString        := LPermissoes[27];
                LDataSet.FieldByName('CADINFMENSAIS').AsString            := LPermissoes[28];    LDataSet.FieldByName('CADLUBRIFICANTES').AsString          := LPermissoes[29];    LDataSet.FieldByName('CADLUBRIFICPROG').AsString             := LPermissoes[30];  LDataSet.FieldByName('CADLUBRIFICPROGEQUIP').AsString    := LPermissoes[31];
                LDataSet.FieldByName('CADMANUTENCAO').AsString            := LPermissoes[32];    LDataSet.FieldByName('CADMANUTPROG').AsString              := LPermissoes[33];    LDataSet.FieldByName('CADMANUTPROGEQUIP').AsString           := LPermissoes[34];  LDataSet.FieldByName('CADMAODEOBRAESP').AsString         := LPermissoes[35];
                LDataSet.FieldByName('CADMONITORAMENTO').AsString         := LPermissoes[36];    LDataSet.FieldByName('CADMOTIVOPARADA').AsString           := LPermissoes[37];    LDataSet.FieldByName('CADNAVEGACAO').AsString                := LPermissoes[38];  LDataSet.FieldByName('CADOFICINAS').AsString             := LPermissoes[39];
                LDataSet.FieldByName('CADORDEMSERVICO').AsString          := LPermissoes[40];    LDataSet.FieldByName('CADORDEMSERVICOHIST').AsString       := LPermissoes[41];    LDataSet.FieldByName('CADORDEMSERVICOMAODEOBRA').AsString    := LPermissoes[42];  LDataSet.FieldByName('CADPECASREP').AsString             := LPermissoes[43];
                LDataSet.FieldByName('CADPECASREPINST').AsString          := LPermissoes[44];    LDataSet.FieldByName('CADPECASREPKIT').AsString            := LPermissoes[45];    LDataSet.FieldByName('CADPECASREPOSICAOEQUIP').AsString      := LPermissoes[46];  LDataSet.FieldByName('CADPERMISSOES').AsString           := LPermissoes[47];
                LDataSet.FieldByName('CADPLANOTRAB').AsString             := LPermissoes[48];    LDataSet.FieldByName('CADPONTOSINSPECAO').AsString         := LPermissoes[49];    LDataSet.FieldByName('CADRECURSOS').AsString                 := LPermissoes[50];  LDataSet.FieldByName('CADRECURSOSKIT').AsString          := LPermissoes[51];
                LDataSet.FieldByName('CADRELATINSP').AsString             := LPermissoes[52];    LDataSet.FieldByName('CADRELATORIOS').AsString             := LPermissoes[53];    LDataSet.FieldByName('CADRESERVA').AsString                  := LPermissoes[54];  LDataSet.FieldByName('CADSOLICITACAOTRAB').AsString      := LPermissoes[55];
                LDataSet.FieldByName('CADTERCEIRIZADAS').AsString         := LPermissoes[56];    LDataSet.FieldByName('CADTIPOPROGRAMACAO').AsString        := LPermissoes[57];    LDataSet.FieldByName('CADUSUARIOS').AsString                 := LPermissoes[58];  LDataSet.FieldByName('CADORDEMSERVICOFECHAR').AsString   := LPermissoes[59];
                LDataSet.FieldByName('CADFERRAMENTARIA').AsString         := LPermissoes[60];    LDataSet.FieldByName('CADORDEMSERVICOPROGRAMAR').AsString  := LPermissoes[61];    LDataSet.FieldByName('CADORDEMSERVICODESPROGRAMAR').AsString := LPermissoes[62];  LDataSet.FieldByName('CADORDEMSERVICOEXECUTAR').AsString := LPermissoes[63];
                LDataSet.FieldByName('CADORDEMSERVICOPARALISAR').AsString := LPermissoes[64];    LDataSet.FieldByName('CADORDEMSERVICOLIBERAR').AsString    := LPermissoes[65];

                LDataSet.Post;
              end;
          end;

        DM.qryUsuarios.Close;
        DM.qryUsuarios.Params[0].AsString := CDPermissoesUsuCODUSUARIO.AsString;
        DM.qryUsuarios.Params[1].AsString := DM.FCodEmpresa;
        DM.qryUsuarios.Open;

        if DM.qryUsuarios.IsEmpty = False then
          begin
            DM.qryUsuarios.Edit;
            DM.qryUsuariosCODPERMISSAOACESSO.AsInteger :=  LNovoCodigo;
            DM.qryUsuariosCODPERMISSAOALTERACAO.AsInteger := LNovoCodigo;
            DM.qryUsuariosCODPERMISSAOINCLUSAO.AsInteger := LNovoCodigo;
            DM.qryUsuariosCODPERMISSAOEXCLUSAO.AsInteger := LNovoCodigo;
            DM.qryUsuarios.Post;
          end;

        CDPermissoesUsu.Edit;
        CDPermissoesUsuCODIGO.AsInteger := LNovoCodigo;
        CDPermissoesUsuPESSOAL.AsString := 'S';
        CDPermissoesUsu.Post;

        DM.qryPermissoesAcesso.Close;
        DM.qryPermissoesAlteracao.Close;
        DM.qryPermissoesExclusao.Close;
        DM.qryPermissoesInclusao.Close;

        DM.qryPermissoesAcesso.Params[0].AsString := DM.FCodEmpresa;
        DM.qryPermissoesAlteracao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryPermissoesExclusao.Params[0].AsString := DM.FCodEmpresa;
        DM.qryPermissoesInclusao.Params[0].AsString := DM.FCodEmpresa;

        DM.qryPermissoesAcesso.Open;
        DM.qryPermissoesAlteracao.Open;
        DM.qryPermissoesExclusao.Open;
        DM.qryPermissoesInclusao.Open;

        PAuxiliares.Font.Color := clGreen;
        PAuxiliares.Caption := 'PERSONALIZAÇÃO REALIZADA COM SUCESSO!'
      end;
  end;
end;

procedure TFrmTelaPermissoes.BtnPadraoClick(Sender: TObject);
var
LTexto : PChar;
begin
  inherited;
if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  Exit;

if CDPermissoesUsuPESSOAL.AsString <> 'S' then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'O USUÁRIO JÁ POSSUI O NÍVEL DE PERMISSÕES PADRÃO!';
    Exit;
  end
else
if CDPermissoesUsuPESSOAL.AsString = 'S' then
  begin
    Try
      LTexto := PChar('Deseja realmente atribuir o nível de permissões padrão para o usuário: '+CDPermissoesUsuNOME.AsString+' ?');
      if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONWARNING) = IDYes then
        begin
          DM.qryNivelAcesso.Open;
          if DM.qryNivelAcesso.Locate('CODIGO', CDPermissoesUsuCODNIVELACESSO.AsString, []) = True then
            begin
              DM.qryUsuarios.Close;
              DM.qryUsuarios.Params[0].AsString := CDPermissoesUsuCODUSUARIO.AsString;
              DM.qryUsuarios.Params[1].AsString := DM.FCodEmpresa;
              DM.qryUsuarios.Open;

              if DM.qryUsuarios.IsEmpty = False then
                begin
                  DM.qryPermissoesAcessoPadrao.Close;
                  DM.qryPermissoesAcessoPadrao.Params[0].AsString := DM.qryNivelAcessoCODIGO.AsString;
                  DM.qryPermissoesAcessoPadrao.Open;

                  DM.qryPermissoesAlteracaoPadrao.Close;
                  DM.qryPermissoesAlteracaoPadrao.Params[0].AsString := DM.qryNivelAcessoCODIGO.AsString;
                  DM.qryPermissoesAlteracaoPadrao.Open;

                  DM.qryPermissoesInclusaoPadrao.Close;
                  DM.qryPermissoesInclusaoPadrao.Params[0].AsString := DM.qryNivelAcessoCODIGO.AsString;
                  DM.qryPermissoesInclusaoPadrao.Open;

                  DM.qryPermissoesExclusaoPadrao.Close;
                  DM.qryPermissoesExclusaoPadrao.Params[0].AsString := DM.qryNivelAcessoCODIGO.AsString;
                  DM.qryPermissoesExclusaoPadrao.Open;

                  DM.qryUsuarios.Edit;
                  DM.qryUsuariosCODPERMISSAOACESSO.AsInteger    := DM.qryPermissoesAcessoPadraoCODIGO.AsInteger;
                  DM.qryUsuariosCODPERMISSAOALTERACAO.AsInteger := DM.qryPermissoesAlteracaoPadraoCODIGO.AsInteger;
                  DM.qryUsuariosCODPERMISSAOINCLUSAO.AsInteger  := DM.qryPermissoesInclusaoPadraoCODIGO.AsInteger;
                  DM.qryUsuariosCODPERMISSAOEXCLUSAO.AsInteger  := DM.qryPermissoesExclusaoPadraoCODIGO.AsInteger;
                  DM.qryUsuarios.Post;

                  DM.qryPermissoesAcessoPadrao.Close;
                  DM.qryPermissoesAlteracaoPadrao.Close;
                  DM.qryPermissoesInclusaoPadrao.Close;
                  DM.qryPermissoesExclusaoPadrao.Close;

                  DM.qryUsuarios.Close;
                  DM.qryNivelAcesso.Close;

                  if DM.qryPermissoesAcesso.Locate('CODIGO', CDPermissoesUsuCODIGO.AsInteger, []) = True then
                    begin
                      DM.qryPermissoesAcesso.Delete;
                    end;

                  if DM.qryPermissoesAlteracao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsInteger, []) = True then
                    begin
                      DM.qryPermissoesAlteracao.Delete;
                    end;

                  if DM.qryPermissoesInclusao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsInteger, []) = True then
                    begin
                      DM.qryPermissoesInclusao.Delete;
                    end;

                  if DM.qryPermissoesExclusao.Locate('CODIGO', CDPermissoesUsuCODIGO.AsInteger, []) = True then
                    begin
                      DM.qryPermissoesExclusao.Delete;
                    end;

                  DM.qryPermissoesAcesso.Close;
                  DM.qryPermissoesAlteracao.Close;
                  DM.qryPermissoesExclusao.Close;
                  DM.qryPermissoesInclusao.Close;

                  DM.qryPermissoesAcesso.Params[0].AsString := DM.FCodEmpresa;
                  DM.qryPermissoesAlteracao.Params[0].AsString := DM.FCodEmpresa;
                  DM.qryPermissoesExclusao.Params[0].AsString := DM.FCodEmpresa;
                  DM.qryPermissoesInclusao.Params[0].AsString := DM.FCodEmpresa;

                  DM.qryPermissoesAcesso.Open;
                  DM.qryPermissoesAlteracao.Open;
                  DM.qryPermissoesExclusao.Open;
                  DM.qryPermissoesInclusao.Open;

                  PAuxiliares.Font.Color := clGreen;
                  PAuxiliares.Caption := 'ALTERAÇÃO REALIZADA COM SUCESSO!';
                end;
            end;
        end;
    Except
      on E: Exception do
      begin
        DM.GravaLog('Falha ao alterar a permissão. FrmTelaPermissoes Linha: 537', E.ClassName, E.Message);
        Application.MessageBox('Falha ao alterar permissão!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
      end;
    End;
  end;
end;

procedure TFrmTelaPermissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qryPermissoesAcesso.Close;
DM.qryPermissoesAlteracao.Close;
DM.qryPermissoesExclusao.Close;
DM.qryPermissoesInclusao.Close;
end;

procedure TFrmTelaPermissoes.FormCreate(Sender: TObject);
begin
  inherited;
DM.qryPermissoesAcesso.Close;
DM.qryPermissoesAlteracao.Close;
DM.qryPermissoesExclusao.Close;
DM.qryPermissoesInclusao.Close;

DM.qryPermissoesAcesso.Params[0].AsString := DM.FCodEmpresa;
DM.qryPermissoesAlteracao.Params[0].AsString := DM.FCodEmpresa;
DM.qryPermissoesExclusao.Params[0].AsString := DM.FCodEmpresa;
DM.qryPermissoesInclusao.Params[0].AsString := DM.FCodEmpresa;

DM.qryPermissoesAcesso.Open;
DM.qryPermissoesAlteracao.Open;
DM.qryPermissoesExclusao.Open;
DM.qryPermissoesInclusao.Open;

DM.qryPermissoesAcesso.Last;
DM.qryPermissoesAlteracao.Last;
DM.qryPermissoesExclusao.Last;
DM.qryPermissoesInclusao.Last;

//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------

end;

function TFrmTelaPermissoes.ValidaTelaEscolhida(Texto:String):String;
begin
LTela := EmptyStr;
  with FrmTelaPermissoes do
    Begin
      if Texto = 'Formato de Códigos.'                                    then LTela := 'CADFORMATOCODIGO';
      if Texto = 'Grupo Industrial.'                                      then LTela := 'CADGRUPOINDUSTRIAL';
      if Texto = 'Centros de Custos.'                                     then LTela := 'CADCENTROCUSTO';
      if Texto = 'Classes de Equipamentos.'                               then LTela := 'CADCLASSES';
      if Texto = 'Família de Equipamentos.'                               then LTela := 'CADFAMILIAEQUIP';
      if Texto = 'Família de Peças de Reposição.'                         then LTela := 'CADFAMILIAPECASREP';
      if Texto = 'Família de Recursos.'                                   then LTela := 'CADFAMILIARECURSOS';
      if Texto = 'Causas de Falha.'                                       then LTela := 'CADCAUSASFALHA';
      if Texto = 'Tipos de Manutenções.'                                  then LTela := 'CADMANUTENCAO';
      if Texto = 'Motivos de Paradas.'                                    then LTela := 'CADMOTIVOPARADA';
      if Texto = 'Tipos de Programação.'                                  then LTela := 'CADTIPOPROGRAMACAO';
      if Texto = 'Cargos.'                                                then LTela := 'CADCARGOS';

      if Texto = 'Permissões.'                                            then LTela := 'CADPERMISSOES';
      if Texto = 'Usuários.'                                              then LTela := 'CADUSUARIOS';
      if Texto = 'Oficinas.'                                              then LTela := 'CADOFICINAS';
      if Texto = 'Almoxarifados.'                                         then LTela := 'CADALMOXARIFADO';
      if Texto = 'Áreas.'                                                 then LTela := 'CADAREAS';
      if Texto = 'Feriados.'                                              then LTela := 'CADFERIADOS';
      if Texto = 'Calendário de Mão de Obra.'                             then LTela := 'CADCALENDMOBRA';
      if Texto = 'Calendário de Equipamentos.'                            then LTela := 'CADCALENDEQUIP';
      if Texto = 'Imagens.'                                               then LTela := 'CADIMANGENS';
      if Texto = 'Fornecedores.'                                          then LTela := 'CADFORNECEDORES';
      if Texto = 'Fabricantes.'                                           then LTela := 'CADFABRICANTES';
      if Texto = 'Disponibilidades Admissíveis.'                          then LTela := 'CADDISPONIBILIDADE';

      if Texto = 'Cadastro de Equipamentos.'                              then LTela := 'CADEQUIPAMENTOS';
      if Texto = 'Manutenção Programada do Equipamento.'                  then LTela := 'CADMANUTPROGEQUIP';
      if Texto = 'Lubrificação Programada do Equipamento.'                then LTela := 'CADLUBRIFICPROGEQUIP';
      if Texto = 'Peças de Reposição do Equipamento.'                     then LTela := 'CADPECASREPOSICAOEQUIP';
      if Texto = 'Mão de Obra Especializada.'                             then LTela := 'CADMAODEOBRAESP';
      if Texto = 'Literaturas Técnicas.'                                     then LTela := 'CADARQUIVOTECNICO';
      if Texto = 'Navegação Gráfica.'                                     then LTela := 'CADNAVEGACAO';
      if Texto = 'Histórico do Equipamento.'                              then LTela := 'CADHISTORICOEQUIP';

      if Texto = 'Manutenção Programada.'                                 then LTela := 'CADMANUTPROG';
      if Texto = 'Lubrificação Programada.'                               then LTela := 'CADLUBRIFICPROG';
      if Texto = 'Relatório de Insp. de Manut./Lubrific. Periódicas.'     then LTela := 'CADRELATINSP';
      if Texto = 'Fechamento de Manut./Lubrific. Periódicas.'             then LTela := 'CADFECHAMANUT';
      if Texto = 'Inspeções Diárias dos Equipamentos.'                    then LTela := 'CADCONFIABILIDADE';//Coluna usada apenas para não alterar o banco
      if Texto = 'Pontos de Inspeção.'                                    then LTela := 'CADPONTOSINSPECAO';
      if Texto = 'Monitoramento de Condições Operacionais.'               then LTela := 'CADMONITORAMENTO';
      if Texto = 'Substituição de Equipamentos por Reserva.'              then LTela := 'CADRESERVA';
      if Texto = 'Cadastro de Rotas.'                                     then LTela := 'CADCONSULTAS';//Coluna usada apenas para não alterar o banco

      if Texto = 'Solicitação de Trabalho.'                               then LTela := 'CADSOLICITACAOTRAB';
      if Texto = 'Plano de Trabalho.'                                     then LTela := 'CADPLANOTRAB';
      if Texto = 'Mão de Obra.'                                           then LTela := 'CADFUNCIONARIOS';

      if Texto = 'Cadastro de Recursos.'                                  then LTela := 'CADRECURSOS';
      if Texto = 'Kit de Recursos.'                                       then LTela := 'CADRECURSOSKIT';
      if Texto = 'Cadastro de Peças.'                                     then LTela := 'CADPECASREP';
      if Texto = 'Kit de Peças de Reposição.'                             then LTela := 'CADPECASREPKIT';
      if Texto = 'Peças Instaladas.'                                      then LTela := 'CADPECASREPINST';
      if Texto = 'Lubrificantes.'                                         then LTela := 'CADLUBRIFICANTES';

      if Texto = 'Cadastro de Ordem de Serviço.'                          then LTela := 'CADORDEMSERVICO';
      if Texto = 'Programação de Ordem de Serviço.'                       then LTela := 'CADORDEMSERVICOPROGRAMAR';
      if Texto = 'Reprogramação de Ordem de Serviço.'                     then LTela := 'CADORDEMSERVICODESPROGRAMAR';
      if Texto = 'Execução de Ordem de Serviço.'                          then LTela := 'CADORDEMSERVICOEXECUTAR';
      if Texto = 'Liberação de Ordem de Serviço.'                         then LTela := 'CADORDEMSERVICOLIBERAR';
      if Texto = 'Fechamento de Ordem de Serviço.'                        then LTela := 'CADORDEMSERVICOFECHAR';
      if Texto = 'Paralisação de Ordem de Serviço.'                       then LTela := 'CADORDEMSERVICOPARALISAR';
      if Texto = 'Cancelamento de Ordem de Serviço.'                      then LTela := 'CADORDEMSERVICOMAODEOBRA';//Coluna usada apenas para não alterar o banco
      if Texto = 'Histórico de Ordem de Serviço.'                         then LTela := 'CADORDEMSERVICOHIST';
      if Texto = 'Serviços Executados por Terceirizadas.'                 then LTela := 'CADTERCEIRIZADAS';

      if Texto = 'Calendário de Ordem de Serviço.'                        then LTela := 'CADCALENDARIOOS';

      if Texto = 'Arquivos Técnicos.'                                     then LTela := 'CADARQUIVOTECNICO';
      if Texto = 'Informações Mensais.'                                   then LTela := 'CADINFMENSAIS';
      if Texto = 'Indicadores de Desempenho.'                             then LTela := 'CADINDDESEMPENHO';
      if Texto = 'Ferramentaria.'                                         then LTela := 'CADFERRAMENTARIA';
      if Texto = 'Controle de Frota.'                                     then LTela := 'CADCONTROLEPNEUS';
      if Texto = 'Relatórios.'                                            then LTela := 'CADRELATORIOS';


      {if Texto = 'Assunto'                                  then LTela := 'CADASSUNTO';
      if Texto = 'Autônoma'                                 then LTela := 'CADAUTONOMO';
      if Texto = 'Controle de Combustível'                  then LTela := 'CADCONTROLECOMBUST';
      if Texto = 'Controle de Compras'                      then LTela := 'CADCONTROLECOMPRAS';
      if Texto = 'Controle de Documentos'                   then LTela := 'CADCONTROLEDOCUM';
      if Texto = 'Controle de Multas'                       then LTela := 'CADCONTROLEMULTAS';
      if Texto = 'Controle de Pneus'                        then LTela := 'CADCONTROLEPNEUS';
      if Texto = 'Editora'                                  then LTela := 'CADEDITORA';
      if Texto = 'Família de Pneus'                         then LTela := 'CADCONTROLEPNEUS';
      if Texto = 'Mão de Obra Utilizada'                    then LTela := 'CADFECHAMMAODEOBRA';
      if Texto = 'Peças de Rep. Utilizadas'                 then LTela := 'CADFECHAMPECASREP';
      if Texto = 'Planos de Trab. Utilizados'               then LTela := 'CADFECHAMPLANOTRAB';
      if Texto = 'Rec. Utilizados'                          then LTela := 'CADFECHAMRECURSOS';
      if Texto = 'Controle de Filtros de Mangas'            then LTela := 'CADFILTROMANGA';
      if Texto = 'Histórico da Lubrificação'                then LTela := 'CADHISTORICOLUBRIFIC';
      if Texto = 'Histórico da Manutenção'                  then LTela := 'CADHISTORICOMANUT';
      if Texto = 'Lubrificantes do Equipamento'             then LTela := 'CADLUBRIFICANTESEQUIP';
      if Texto = 'Lubrificação Program. do Equipamento'     then LTela := 'CADLUBRIFICPROGEQUIP';
      if Texto = 'Peças de Rep. da Ordem de Serviço'        then LTela := 'CADORDEMSERVICOPECASREP';
      if Texto = 'Planos de Trabalho da Ordem de Serviço'   then LTela := 'CADORDEMSERVICOPLANOTRAB';
      if Texto = 'Recurso da Ordem de Serviço'              then LTela := 'CADORDEMSERVICORECURSO';
      if Texto = 'Mão de Obra Utilizada'                    then LTela := 'CADORDEMSERVICOMAODEOBRAUTIL';
      if Texto = 'Peças de Rep. Utilizadas'                 then LTela := 'CADORDEMSERVICOPECASUTIL';
      if Texto = 'Rec. Utilizados'                          then LTela := 'CADORDEMSERVICORECURSOSUTIL';
      if Texto = 'Planos de Trab. Utilizados'               then LTela := 'CADORDEMSERVICOPLANOTRABUTIL';
      if Texto = 'Alertas'                                  then LTela := 'CADALERTAS';
      if Texto = 'Peças de Reposição da Manutenção'         then LTela := 'CADPECASREPOSICAOMANUT';
      if Texto = 'Recursos da Lubrificação'                 then LTela := 'CADRECURSOSLUBRIFIC';
      if Texto = 'Recursos da Manutenção'                   then LTela := 'CADRECURSOSMANUT';
      if Texto = 'Tema'                                     then LTela := 'CADTEMA';
      if Texto = 'Tipo de Literatura'                       then LTela := 'CADTIPOLITERATURA';}
    End;
 Result := LTela;
end;

end.

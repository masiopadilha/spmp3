unit UnTelaCadGrupoIndustrial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadGrupoIndustrial = class(TFrmTelaPaiParametros)
    PCGrupoIndustrial: TPageControl;
    TSGrupo: TTabSheet;
    TSUnidade: TTabSheet;
    TSAdmCorp: TTabSheet;
    TSAdmUnid: TTabSheet;
    Label4: TLabel;
    EdtDescGrupo: TDBEdit;
    Label2: TLabel;
    EdtCodUnidade: TDBEdit;
    Label1: TLabel;
    EdtDescUnidade: TDBEdit;
    ChbAtivoNF: TDBCheckBox;
    ChbVisivelNF: TDBCheckBox;
    ChbTransf: TDBCheckBox;
    Label3: TLabel;
    Label5: TLabel;
    EdtCodAdmCorp: TDBEdit;
    EdtDescAdmCorp: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtCodAdmUnid: TDBEdit;
    Label9: TLabel;
    EdtDescAdmUnid: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    LblGrupo: TDBText;
    LblGrupoAdmCorp: TDBText;
    LblUnidAdmCorp: TDBText;
    LblGrupoAdmUnid: TDBText;
    LblUnidAdmUnid: TDBText;
    EdtSenhaAdmCorp: TEdit;
    EdtConfSenhaAdmCorp: TEdit;
    EdtSenhaAdmUnid: TEdit;
    EdtConfSenhaAdmUnid: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    procedure PCGrupoIndustrialChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodUnidadeExit(Sender: TObject);
    procedure EdtDescAdmCorpKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodAdmCorpExit(Sender: TObject);
    procedure EdtCodAdmUnidExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadGrupoIndustrial: TFrmTelaCadGrupoIndustrial;
  LNovoUsuario : Boolean;

implementation

{$R *.dfm}

uses UnDM;


procedure TFrmTelaCadGrupoIndustrial.BtnCancelarClick(Sender: TObject);
begin
  inherited;
case  PCGrupoIndustrial.TabIndex of
  0:
    begin

    end;
  1:
    begin

    end;
  2:
    begin
      EdtCodAdmCorp.ReadOnly := True;
      EdtSenhaAdmCorp.Clear;
      EdtConfSenhaAdmCorp.Clear;
      LNovoUsuario := False;
    end;
  3:
    begin
      EdtCodAdmUnid.ReadOnly := True;
      EdtSenhaAdmUnid.Clear;
      EdtConfSenhaAdmUnid.Clear;
      LNovoUsuario := False;
    end;
end;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadGrupoIndustrial.BtnConsultarClick(Sender: TObject);
begin
LNovoUsuario := False;
case PCGrupoIndustrial.TabIndex of
  0: DM.FTabela_auxiliar := 0;
  1:
    begin
      if DM.qryGruposCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUM GRUPO SELECIONADO!!!';
          Exit;
        end;
      DM.FParamAuxiliar[0] := DM.qryGruposCODIGO.AsString;
      DM.FTabela_auxiliar := 1;
    end;
  2:
    begin
      if DM.qryGruposCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUM GRUPO SELECIONADO!!!';
          Exit;
        end;
      if DM.qryUnidadesCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA UNIDADE SELECIONADA!!!';
          Exit;
        end;
      DM.FParamAuxiliar[0] := DM.qryUnidadesCODIGO.AsString;
      DM.FTabela_auxiliar := 2;
    end;
  3:
    begin
      if DM.qryGruposCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUM GRUPO SELECIONADO!!!';
          Exit;
        end;
      if DM.qryUnidadesCODIGO.AsString = EmptyStr then
        begin
          PAuxiliares.Font.Color := clBlack;
          PAuxiliares.Caption := 'NENHUMA UNIDADE SELECIONADA!!!';
          Exit;
        end;
      DM.FParamAuxiliar[0] := DM.qryUnidadesCODIGO.AsString;
      DM.FTabela_auxiliar := 3;
    end;
end;
  inherited;
end;

procedure TFrmTelaCadGrupoIndustrial.BtnExcluirClick(Sender: TObject);
begin
  inherited;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadGrupoIndustrial.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

PAuxiliares.Font.Color := clBlack;
PAuxiliares.Caption := EmptyStr;

  case  PCGrupoIndustrial.TabIndex of
    0:
      begin
        DM.FTabela_auxiliar := 0;
        DM.qryGruposCODFORMATOCODIGO.AsInteger := DM.qryFormatoCodigoCODIGO.AsInteger;
        DM.qryGruposDATACADASTRO.AsDateTime    := DM.FDataHoraServidor;
        DM.qryGruposCODUSUARIOCAD.AsString     := DM.FCodUsuario;
        DM.qryGruposCODNIVELACESSO.AsString    := 'ADC-00001';
        DM.qryGruposDATACADASTRO.AsDateTime    := DM.FDataHoraServidor;
        DM.qryGruposCODUSUARIOCAD.AsString     := DM.FCodUsuario;
        LblUsuCad.Caption                           := DM.FNomeUsuario;

        EdtDescGrupo.SetFocus;
      end;
    1:
      begin
        if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
          begin
            Application.MessageBox('Apenas Administrador de Unidade pode criar grupos.', 'SPMP3', MB_OK + MB_ICONSTOP);
            Exit;
          end;

        DM.FTabela_auxiliar := 1;
        {if DM.SMWebClient.VerificaTabelaVazia('GRUPOS', 'CODIGO', EmptyStr) = 0 then
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'NENHUM GRUPO CADASTRADO!';
            Exit;
          end;}

        if DM.qryGrupos.Active = False then
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'ESCOLHA O GRUPO!';
            Exit;
          end;

        DM.qryUnidadesCODGRUPO.AsInteger      := DM.qryGruposCODIGO.AsInteger;
        DM.qryUnidadesDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
        DM.qryUnidadesCODUSUARIOCAD.AsString  := DM.FCodUsuario;
        LblUsuCad.Caption                          := DM.FNomeUsuario;
        DM.qryUnidadesATIVO.AsString          := 'S';
        DM.qryUnidadesVISIVEL.AsString        := 'S';
        DM.qryUnidadesTRANSFORMACAO.AsString  := 'S';

        EdtCodUnidade.ReadOnly := False;
        EdtCodUnidade.SetFocus;
      end;
    2:
      begin
        if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
          begin
            Application.MessageBox('Apenas Administrador de Unidade pode criar unidades.', 'SPMP3', MB_OK + MB_ICONSTOP);
            Exit;
          end;

        DM.FTabela_auxiliar := 2;
        if DM.qryUnidades.Active = False then
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'ESCOLHA A UNIDADE!';
            Exit;
          end;

        DM.qryAdmCorpSENHAALTERADA.AsString         := 'N';
        DM.qryAdmCorpLOGADO.AsString                := 'N';
        DM.qryAdmCorpTEMPORARIO.AsString            := 'N';
        DM.qryAdmCorpCODNIVELACESSO.AsString        := 'ADC-00001';
        DM.qryAdmCorpCODPERMISSAOACESSO.AsString    := '1';
        DM.qryAdmCorpCODPERMISSAOINCLUSAO.AsString  := '1';
        DM.qryAdmCorpCODPERMISSAOALTERACAO.AsString := '1';
        DM.qryAdmCorpCODPERMISSAOEXCLUSAO.AsString  := '1';
        DM.qryAdmCorpMATRICULA.AsString             := '0';

        LNovoUsuario := True;
        EdtCodAdmCorp.ReadOnly := False;
        EdtCodAdmCorp.SetFocus;
      end;
    3:
      begin
        if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
          begin
            Application.MessageBox('Apenas Administrador de Unidade pode criar usuários administradores.', 'SPMP3', MB_OK + MB_ICONSTOP);
            Exit;
          end;

        DM.FTabela_auxiliar := 3;
        if DM.qryUnidades.Active = False then
          begin
            PAuxiliares.Font.Color := clRed;
            PAuxiliares.Caption := 'ESCOLHA A UNIDADE!';
            Exit;
          end;

        DM.qryAdmUnidSENHAALTERADA.AsString         := 'N';
        DM.qryAdmUnidLOGADO.AsString                := 'N';
        DM.qryAdmUnidTEMPORARIO.AsString            := 'N';
        DM.qryAdmUnidCODNIVELACESSO.AsString        := 'ADU-00001';
        DM.qryAdmUnidCODPERMISSAOACESSO.AsString    := '2';
        DM.qryAdmUnidCODPERMISSAOINCLUSAO.AsString  := '2';
        DM.qryAdmUnidCODPERMISSAOALTERACAO.AsString := '2';
        DM.qryAdmUnidCODPERMISSAOEXCLUSAO.AsString  := '2';
        DM.qryAdmUnidMATRICULA.AsString             := '0';

        LNovoUsuario := True;
        EdtCodAdmUnid.ReadOnly := False;
        EdtCodAdmUnid.SetFocus;
      end;
  end;
BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadGrupoIndustrial.BtnSalvarClick(Sender: TObject);
var
LSenhaAtual: String;
begin
  //inherited;
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if (DM.qryUsuarioNIVELACESSO.AsString <> 'Administrador de Unidade') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
  begin
    Application.MessageBox('Apenas Administrador de Unidade pode alterar registros.', 'SPMP3', MB_OK + MB_ICONSTOP);
    Exit;
  end;

if DM.RetornaDataHoraServidor = True then
  begin
    case  PCGrupoIndustrial.TabIndex of
      0:
        begin
          with DM.qryGrupos do
            begin
              if DM.qryGrupos.IsEmpty = True then Exit;
              if DM.qryGruposDESCRICAO.AsString = EmptyStr then
                begin
                  EdtDescGrupo.SetFocus;
                  Exit;
                end;

              if DM.qryGruposDATACADASTRO.IsNull = True then DM.qryGruposDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
              DM.qryGruposDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
              DM.qryGruposCODUSUARIOALT.AsString  := DM.FCodUsuario;
              DM.qryGruposUSUARIOALT.AsString     := DM.FNomeEmpresa;
    //          if DM.qryGruposCODIGO.IsNull = True then
    //            DM.qryGrupos.Params[0].AsInteger := DM.RetornaProximoIndice('grupos');
              DM.qryGrupos.Post;
              DM.qryGrupos.Edit;
            end;
          PAuxiliares.Font.Color := clGreen;
          PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
          ControleBotoes(2);
          BtnSalvar.ImageIndex := 2;
        end;
      1:
        begin
          with DM.qryUnidades do
            begin
              if DM.qryUnidades.IsEmpty = True then Exit;
              if DM.qryUnidadesCODIGO.AsString = EmptyStr then
                begin
                  EdtCodUnidade.SetFocus;
                  Exit;
                end;
              if DM.qryUnidadesNOME.AsString = EmptyStr then
                begin
                  EdtDescUnidade.SetFocus;
                  Exit;
                end;

              DM.qryUnidades.Params[0].AsString := DM.qryUnidadesCODIGO.AsString;
              DM.qryUnidades.Params[1].AsString := DM.qryGrupos.Params[0].AsString;

              if DM.qryUnidadesDATACADASTRO.IsNull = True  then DM.qryUnidadesDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
              DM.qryUnidadesDATAULTALT.AsDateTime  := DM.FDataHoraServidor;
              DM.qryUnidadesCODUSUARIOALT.AsString := DM.FCodUsuario;
              DM.qryUnidadesUSUARIOALT.AsString    := DM.FNomeUsuario;

              DM.qryUnidades.Post;
              DM.qryUnidades.Edit;

              if DM.FAlterando = False then
                begin
                  DM.qryAuxiliar.Close;
                  DM.qryAuxiliar.SQL.Clear;
                  DM.qryAuxiliar.SQL.Add('select codigo, nome, codempresas, codnivelacesso from usuario where codnivelacesso = ''ADC-00001'' OR codnivelacesso = ''USC-00001'' and codempresa = '+QuotedStr(DM.qryUnidadesCODIGO.AsString) + '  order by nome');
                  DM.qryAuxiliar.Open;

                  DM.qryUsuarioUnidades.Open;
                  while not DM.qryAuxiliar.Eof = True do
                    begin
                      DM.qryUsuarioUnidades.Append;
                      //DM.qryUsuariosEmpresasCODIGO.AsInteger        := DM.SMWebClient.GerarSequencia('USUARIOEMPRESASCAD_S');
                      DM.qryUsuarioUnidadesCODEMPRESAS.AsInteger   := DM.qryAuxiliar.FieldByName('CODEMPRESAS').AsInteger;
                      DM.qryUsuarioUnidadesCODEMPRESA.AsString     := DM.qryUnidadesCODIGO.AsString;
                      DM.qryUsuarioUnidadesCODNIVELACESSO.AsString := DM.qryAuxiliar.FieldByName('CODNIVELACESSO').AsString;
                      DM.qryUsuarioUnidades.Post;

                      DM.qryAuxiliar.Next;
                    end;
                end;
              DM.qryUsuarioUnidades.Close;
            end;
          PAuxiliares.Font.Color := clGreen;
          PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
          ControleBotoes(2);
          BtnSalvar.ImageIndex := 2;
        end;
      2:
        begin
          with DM.qryAdmCorp do
            begin
              if DM.qryAdmCorp.IsEmpty = True then Exit;
              if DM.qryAdmCorpCODIGO.AsString = EmptyStr then
                begin
                  EdtCodAdmCorp.SetFocus;
                  Exit;
                end;
              if DM.qryAdmCorpNOME.AsString = EmptyStr then
                begin
                  EdtDescAdmCorp.SetFocus;
                  Exit;
                end;
              DM.FParamAuxiliar[0] := DM.qryUnidadesCODIGO.AsString;
              DM.FTabela_auxiliar := 2;
              if (DM.VerificaDuplo(EdtCodAdmCorp.Text) = True) and (DM.FAlterando = False) then
                begin
                  EdtCodAdmCorp.SetFocus;
                  PAuxiliares.Font.Color := clBlack;
                  PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
                  Exit;
                end;
              DM.FTabela_auxiliar := 222;
              if (DM.VerificaDuplo('NOME') = True) and (DM.FAlterando = False) then
                begin
                  EdtDescAdmCorp.SetFocus;
                  PAuxiliares.Font.Color := clBlack;
                  PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
                  Exit;
                end;
              if (DM.FAlterando = False) then
                begin
                  if EdtSenhaAdmCorp.Text = EmptyStr then
                    begin
                      EdtSenhaAdmCorp.SetFocus;
                      PAuxiliares.Font.Color := clBlack;
                      PAuxiliares.Caption := 'INFORME A SENHA DO USUÁRIO!!!';
                      Exit;
                    end;
                  if EdtConfSenhaAdmCorp.Text = EmptyStr then
                    begin
                      EdtConfSenhaAdmCorp.SetFocus;
                      PAuxiliares.Font.Color := clBlack;
                      PAuxiliares.Caption := 'CONFIRME A SENHA DO USUÁRIO!!!';
                      Exit;
                    end;
                  if (EdtSenhaAdmCorp.Text <> EdtConfSenhaAdmCorp.Text) then
                    begin
                      EdtSenhaAdmCorp.SetFocus;
                      PAuxiliares.Font.Color := clBlack;
                      PAuxiliares.Caption := 'SENHAS NÃO CONFEREM!!!';
                      Exit;
                    end;

                  DM.qryAdmCorpSENHA.AsString := DM.Crypt('C', EdtSenhaAdmCorp.Text);
                  DM.qryAdmCorpBLOQUEIO.AsInteger := 0;
                end
              else
                begin
                  if (EdtSenhaAdmCorp.Text <> EmptyStr) and (EdtConfSenhaAdmCorp.Text <> EmptyStr)then
                    begin
                      if (EdtSenhaAdmCorp.Text <> EdtConfSenhaAdmCorp.Text) then
                        begin
                          EdtSenhaAdmCorp.SetFocus;
                          PAuxiliares.Font.Color := clBlack;
                          PAuxiliares.Caption := 'SENHAS NÃO CONFEREM!!!';
                          Exit;
                        end;

    //                  LSenhaAtual := DM.CampoInputBox('SPMP', 'Informe a senha atual');
    //
    //                  if LSenhaAtual = EmptyStr then Exit;
    //
    //                  if LSenhaAtual <> DM.Crypt('D', DM.qryAdmCorpSENHA.AsString) then
    //                    begin
    //                      EdtSenhaAdmCorp.SetFocus;
    //                      PAuxiliares.Font.Color := clBlack;
    //                      PAuxiliares.Caption := 'SENHA INCORRENTA!!!';
    //                      Exit;
    //                    end;

                      DM.qryAdmCorpSENHA.AsString := DM.Crypt('C', EdtSenhaAdmCorp.Text);
                      DM.qryAdmCorpSENHAALTERADA.AsString := 'N';
                      DM.qryAdmCorpBLOQUEIO.AsInteger := 0;
                    end;
                end;

              DM.qryAdmCorpCODEMPRESA.AsString     := DM.qryUnidadesCODIGO.AsString;
              DM.qryAdmCorpCODGRUPO.AsInteger      := DM.qryGruposCODIGO.AsInteger;
              DM.qryAdmCorpSENHA.AsString          := DM.Crypt('C', EdtSenhaAdmCorp.Text);
              if DM.qryAdmCorpDATACADASTRO.IsNull = True  then DM.qryAdmCorpDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
              DM.qryAdmCorpDATAULTALT.AsDateTime   := DM.FDataHoraServidor;
              DM.qryAdmCorpCODUSUARIOALT.AsString  := DM.FCodUsuario;
              DM.qryAdmCorpUSUARIOALT.AsString     := DM.FNomeUsuario;

              DM.qryAdmCorp.Params[0].AsString := DM.qryAdmCorpCODIGO.AsString;

              DM.qryAdmCorp.Post;
              DM.qryAdmCorp.Edit;

              DM.qryAuxiliar.Close;
              DM.qryAuxiliar.SQL.Clear;
              DM.qryAuxiliar.SQL.Add('select codigo, nome from empresa where codgrupo = '+QuotedStr(DM.qryGruposCODIGO.AsString) + ' order by nome');
              DM.qryAuxiliar.Open;

              DM.qryUsuarioUnidades.Params[0].AsString := DM.qryAdmCorpCODEMPRESAS.AsString;
              DM.qryUsuarioUnidades.Open;
              while not DM.qryAuxiliar.Eof = True do
                begin
                  DM.qryUsuarioUnidades.Append;
    //              DM.qryUsuarioUnidadesCODIGO.AsInteger        := DM.qryUsuarioUnidades.RecordCount + 1;
                  DM.qryUsuarioUnidadesCODEMPRESAS.AsInteger   := DM.qryAdmCorpCODEMPRESAS.AsInteger;
                  DM.qryUsuarioUnidadesCODEMPRESA.AsString     := DM.qryAuxiliar.FieldByName('CODIGO').AsString;
                  DM.qryUsuarioUnidadesCODNIVELACESSO.AsString := 'ADC-00001';
                  DM.qryUsuarioUnidades.Post;

                  DM.qryAuxiliar.Next;
                end;
              DM.qryUsuarioUnidades.Close;

              EdtSenhaAdmCorp.Clear;
              EdtConfSenhaAdmCorp.Clear;
            end;

          PAuxiliares.Font.Color := clGreen;
          PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
          ControleBotoes(2);
          BtnSalvar.ImageIndex := 2;

          EdtSenhaAdmCorp.Clear;
          EdtConfSenhaAdmCorp.Clear;
          LNovoUsuario := False;
        end;
      3:
        begin
          with DM.qryAdmUnid do
            begin
              if DM.qryAdmUnid.IsEmpty = True then Exit;
              if DM.qryAdmUnidCODIGO.AsString = EmptyStr then
                begin
                  EdtCodAdmUnid.SetFocus;
                  Exit;
                end;
              if DM.qryAdmUnidNOME.AsString = EmptyStr then
                begin
                  EdtDescAdmUnid.SetFocus;
                  Exit;
                end;
              DM.FParamAuxiliar[0] := DM.qryUnidadesCODIGO.AsString;
              DM.FTabela_auxiliar := 3;
              if (DM.VerificaDuplo(EdtCodAdmUnid.Text) = True) and (DM.FAlterando = False) then
                begin
                  EdtCodAdmUnid.SetFocus;
                  PAuxiliares.Font.Color := clBlack;
                  PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
                  Exit;
                end;
              DM.FTabela_auxiliar := 333;
              if (DM.VerificaDuplo(EdtDescAdmUnid.Text) = True) and (DM.FAlterando = False) then
                begin
                  EdtDescAdmUnid.SetFocus;
                  PAuxiliares.Font.Color := clBlack;
                  PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
                  Exit;
                end;
              if (DM.FAlterando = False) then
                begin
                  if EdtSenhaAdmUnid.Text = EmptyStr then
                    begin
                      EdtSenhaAdmUnid.SetFocus;
                      PAuxiliares.Font.Color := clBlack;
                      PAuxiliares.Caption := 'INFORME A SENHA DO USUÁRIO!!!';
                      Exit;
                    end;
                  if EdtConfSenhaAdmUnid.Text = EmptyStr then
                    begin
                      EdtConfSenhaAdmUnid.SetFocus;
                      PAuxiliares.Font.Color := clBlack;
                      PAuxiliares.Caption := 'CONFIRME A SENHA DO USUÁRIO!!!';
                      Exit;
                    end;
                  if (EdtSenhaAdmUnid.Text <> EdtConfSenhaAdmUnid.Text) then
                    begin
                      EdtSenhaAdmUnid.SetFocus;
                      PAuxiliares.Font.Color := clBlack;
                      PAuxiliares.Caption := 'SENHAS NÃO CONFEREM!!!';
                      Exit;
                    end;

                  DM.qryAdmUnidSENHA.AsString := DM.Crypt('C', EdtSenhaAdmUnid.Text);
                  DM.qryAdmUnidBLOQUEIO.AsInteger := 0;
                end
              else
                begin
                  if (EdtSenhaAdmUnid.Text <> EmptyStr) and (EdtConfSenhaAdmUnid.Text <> EmptyStr)then
                    begin
                      if (EdtSenhaAdmUnid.Text <> EdtConfSenhaAdmUnid.Text) then
                        begin
                          EdtSenhaAdmUnid.SetFocus;
                          PAuxiliares.Font.Color := clBlack;
                          PAuxiliares.Caption := 'SENHAS NÃO CONFEREM!!!';
                          Exit;
                        end;

    //                  LSenhaAtual := DM.CampoInputBox('SPMP', 'Informe a senha atual');
    //
    //                  if LSenhaAtual = EmptyStr then Exit;
    //
    //                  if LSenhaAtual <> DM.Crypt('D', DM.qryAdmUnidSENHA.AsString) then
    //                    begin
    //                      EdtSenhaAdmUnid.SetFocus;
    //                      PAuxiliares.Font.Color := clBlack;
    //                      PAuxiliares.Caption := 'SENHA INCORRENTA!!!';
    //                      Exit;
    //                    end;

                      DM.qryAdmUnidSENHA.AsString := DM.Crypt('C', EdtSenhaAdmUnid.Text);
                      DM.qryAdmUnidSENHAALTERADA.AsString := 'N';
                      DM.qryAdmUnidBLOQUEIO.AsInteger := 0;
                    end;
                end;

              DM.qryAdmUnidCODEMPRESA.AsString    := DM.qryUnidadesCODIGO.AsString;
              DM.qryAdmUnidCODGRUPO.AsInteger     := DM.qryGruposCODIGO.AsInteger;
              DM.qryAdmUnidSENHA.AsString         := DM.Crypt('C', EdtSenhaAdmUnid.Text);
              if DM.qryAdmUnidDATACADASTRO.IsNull = True  then DM.qryAdmUnidDATACADASTRO.AsDateTime := DM.FDataHoraServidor;
              DM.qryAdmUnidDATAULTALT.AsDateTime  := DM.FDataHoraServidor;
              DM.qryAdmUnidCODUSUARIOALT.AsString := DM.FCodUsuario;
              DM.qryAdmUnidUSUARIOALT.AsString    := DM.FNomeUsuario;

              DM.qryAdmUnid.Params[0].AsString := DM.qryAdmUnidCODIGO.AsString;
              DM.qryAdmUnid.Params[1].AsString := DM.qryUnidadesCODIGO.AsString;

              DM.qryAdmUnid.Post;
              DM.qryAdmUnid.Edit;

              DM.qryUsuarioUnidades.Params[0].AsString := DM.qryAdmUnidCODEMPRESAS.AsString;
              DM.qryUsuarioUnidades.Open;
              if DM.qryUsuarioUnidades.IsEmpty = True then
                begin
                  DM.qryUsuarioUnidades.Append;
    //              DM.qryUsuarioUnidadesCODIGO.AsInteger        := DM.qryUsuarioUnidades.RecordCount + 1;
                  DM.qryUsuarioUnidadesCODEMPRESAS.AsInteger   := DM.qryAdmUnidCODEMPRESAS.AsInteger;
                  DM.qryUsuarioUnidadesCODEMPRESA.AsString     := DM.qryUnidadesCODIGO.AsString;
                  DM.qryUsuarioUnidadesCODNIVELACESSO.AsString := 'ADU-00001';
                  DM.qryUsuarioUnidades.Post;
                  DM.qryUsuarioUnidades.Close;
                end;

              EdtSenhaAdmCorp.Clear;
              EdtConfSenhaAdmCorp.Clear;
            end;

          PAuxiliares.Font.Color := clGreen;
          PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
          ControleBotoes(2);
          BtnSalvar.ImageIndex := 2;

          EdtSenhaAdmUnid.Clear;
          EdtConfSenhaAdmUnid.Clear;
          LNovoUsuario := False;
        end;
    end;
  end;
DM.FAlterando := True;
BtnNovo.Enabled := True;
BtnExcluir.Enabled := True;
BtnSair.Enabled := True;
BtnConsultar.Enabled := True;
BtnImprimir.Enabled := True;
BtnConsultar.Enabled := True;
BtnImprimir.Enabled := True;
end;

procedure TFrmTelaCadGrupoIndustrial.EdtCodAdmCorpExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadGrupoIndustrial.EdtCodAdmUnidExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadGrupoIndustrial.EdtCodUnidadeExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
if (DM.VerificaDuplo(EdtCodUnidade.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtCodUnidade.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Abort;
  end;
end;

procedure TFrmTelaCadGrupoIndustrial.EdtDescAdmCorpKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if key = #32 then key := #0;
If Key = #13 Then
  Begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  End;
end;

procedure TFrmTelaCadGrupoIndustrial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);

if DM.FCodEmpresa = '' then
  begin
    DM.FCodGrupo := DM.qryGruposCODIGO.AsString;
    DM.FCodEmpresa := DM.qryUnidadesCODIGO.AsString;
    if DM.qryUnidadesTRANSFORMACAO.AsString = 'S' then DM.FEmpTransf := True
    else DM.FEmpTransf := False;
  end;

DM.qryUnidades.Close;
DM.qryAdmCorp.Close;
DM.qryAdmUnid.Close;
DM.qryGrupos.Close;
DM.qryAuxiliar.Close;
end;

procedure TFrmTelaCadGrupoIndustrial.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryGrupos;
DM.FTela := 'CADGRUPOINDUSTRIAL';
LNovoUsuario := False;
end;

procedure TFrmTelaCadGrupoIndustrial.PCGrupoIndustrialChange(Sender: TObject);
begin
  inherited;
case PCGrupoIndustrial.TabIndex of
  0:
    begin
      DM.FDataSetParam := DM.qryGrupos;
      LblDataCad.DataSource := DM.dsGrupos;
      LblUsuCad.DataSource := DM.dsGrupos;
      LblDataAlt.DataSource := DM.dsGrupos;
      LblUsuAlt.DataSource := DM.dsGrupos;
      if DM.qryGrupos.IsEmpty = False then
        DM.FAlterando := True
      else
        DM.FAlterando := False;
    end;
  1:
    begin
      DM.FDataSetParam := DM.qryUnidades;
      LblDataCad.DataSource := DM.dsUnidades;
      LblUsuCad.DataSource := DM.dsUnidades;
      LblDataAlt.DataSource := DM.dsUnidades;
      LblUsuAlt.DataSource := DM.dsUnidades;
      if DM.qryUnidades.IsEmpty = False then
        DM.FAlterando := True
      else
        DM.FAlterando := False;
    end;
  2:
    begin
      DM.FDataSetParam := DM.qryAdmCorp;
      LblDataCad.DataSource := DM.dsAdmCorp;
      LblUsuCad.DataSource := DM.dsAdmCorp;
      LblDataAlt.DataSource := DM.dsAdmCorp;
      LblUsuAlt.DataSource := DM.dsAdmCorp;
      if DM.qryAdmCorp.IsEmpty = False then
        DM.FAlterando := True
      else
        DM.FAlterando := False;
    end;
  3:
    begin
      DM.FDataSetParam := DM.qryAdmUnid;
      LblDataCad.DataSource := DM.dsAdmUnid;
      LblUsuCad.DataSource := DM.dsAdmUnid;
      LblDataAlt.DataSource := DM.dsAdmUnid;
      LblUsuAlt.DataSource := DM.dsAdmUnid;
      if DM.qryAdmUnid.IsEmpty = False then
        DM.FAlterando := True
      else
        DM.FAlterando := False;
    end;
end;
end;

end.

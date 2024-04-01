unit UnTelaCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiCadastros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls, JvMaskEdit, JvDialogs, Vcl.Imaging.Jpeg, Vcl.Clipbrd,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param, Vcl.Buttons;

Type
 TRGBArray = array[Word] of TRGBTriple;
 pRGBArray = ^TRGBArray;

type
  TFrmTelaCadFuncionarios = class(TFrmTelaPaiCadastros)
    Label4: TLabel;
    EdtMatricula: TDBEdit;
    Label5: TLabel;
    EdtNome: TDBEdit;
    Label6: TLabel;
    EdtApelido: TDBEdit;
    Label7: TLabel;
    EdtCPF: TDBEdit;
    Label8: TLabel;
    EdtAdmissao: TJvDBDateEdit;
    Label9: TLabel;
    EdtNascimento: TJvDBDateEdit;
    Label10: TLabel;
    EdtEndereco: TDBEdit;
    Label15: TLabel;
    EdtCidade: TDBEdit;
    Label17: TLabel;
    EdtCEP: TJvDBMaskEdit;
    Label18: TLabel;
    EdtTelefone: TJvDBMaskEdit;
    Label14: TLabel;
    EdtBairro: TDBEdit;
    Label11: TLabel;
    CBEstado: TDBComboBox;
    Label21: TLabel;
    EdtEmail: TDBEdit;
    Label20: TLabel;
    EdtCelular: TJvDBMaskEdit;
    Label12: TLabel;
    BtnCargo: TButton;
    EdtCargo: TDBEdit;
    Label13: TLabel;
    Label16: TLabel;
    EdtCalendario: TDBEdit;
    BtnCalendario: TButton;
    Label19: TLabel;
    Label22: TLabel;
    EdtCelula: TDBEdit;
    BtnCelula: TButton;
    CBEscolaridade: TDBComboBox;
    Label24: TLabel;
    Label25: TLabel;
    CBMaodeObra: TDBComboBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    EdtSalario: TDBEdit;
    ChbUsuario: TDBCheckBox;
    ChbAtivo: TDBCheckBox;
    MOutras: TDBMemo;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    BtnAnexar: TButton;
    BtnLimpar: TButton;
    OPDFoto: TJvOpenDialog;
    PopupMenuFerram: TPopupMenu;
    MenuItem2: TMenuItem;
    Inventario1: TMenuItem;
    ChbAutonomo: TDBCheckBox;
    Ferramentaria1: TMenuItem;
    ImgFotoFunc: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure SmoothResize(Src, Dst: TBitmap);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Ferramentaria1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Completo1Click(Sender: TObject);
    procedure BtnAnexarClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtMatriculaExit(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCargoClick(Sender: TObject);
    procedure BtnCalendarioClick(Sender: TObject);
    procedure BtnCelulaClick(Sender: TObject);
    procedure TabNextTab1AfterTabChange(Sender: TObject);
    procedure CBMaodeObraChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadFuncionarios: TFrmTelaCadFuncionarios;

implementation

{$R *.dfm}

uses UnTelaCadManutProgEquip, UnTelaCadFuncionariosCxaFerramentas,
  UnTelaCadFuncionariosCxaFerramInv, UnTelaCadFuncionariosAusencias,
  UnTelaCadFuncionariosHist, UnTelaCadFuncionariosFerramentaria,
  UnTelaCadCargos, UnTelaCadCalendMObra, UnTelaCadAreas,
  UnDmRelatorios, UnDM;

procedure TFrmTelaCadFuncionarios.BtnAnexarClick(Sender: TObject);
var
 jpg: TJPEGImage;
 imgfile: String;
begin
PAuxiliares.Caption := EmptyStr;
if OPDFoto.Execute then
  begin
    if OPDFoto.FileName <> EmptyStr then
      begin
        imgfile := ExtractFilePath(Application.ExeName) + 'img_red_temp.jpg';
        DM.SetJPGCompression(40, OPDFoto.FileName, imgfile);

        jpg := TJpegImage.Create;
        jpg.LoadFromFile(OPDFoto.FileName);
        DM.qryFuncionariosIMAGEM.Assign(jpg);
        DM.ExibeFoto(DM.qryFuncionarios, 'IMAGEM', FrmTelaCadFuncionarios.ImgFotoFunc);
        jpg.Free;
      end
    else
      begin
        DM.qryFuncionariosIMAGEM.Clear;
      end;
  end;
end;

procedure TFrmTelaCadFuncionarios.BtnCalendarioClick(Sender: TObject);
begin
  inherited;
if DM.qryFuncionarios.Active = False then Exit;
if DM.qryFuncionarios.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 230;
    DM.FNomeConsulta := 'Calendários de Mão de Obra';
    DM.qryFuncionarios.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryFuncionariosCODCALENDARIO.AsString := DM.FCodCombo;
        DM.qryFuncionariosCALENDARIO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCALENDMOBRA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryCalendMObraCODIGO, DM.qryFormatoCodigoCALENDARIO, FrmTelaCadCalendMObra) = False then exit;
      Application.CreateForm(TFrmTelaCadCalendMObra, FrmTelaCadCalendMObra);
      FrmTelaCadCalendMObra.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCalendMObra);
    End;
  end;
DM.FDataSetParam     := DM.qryFuncionarios;
DM.FDataSourceParam  := DM.dsFuncionarios;
DM.FTela             := 'CADFUNCIONARIOS';
DM.FParamAuxiliar[1] := 'NOME';
DM.FTabela_auxiliar  := 30;
end;

procedure TFrmTelaCadFuncionarios.BtnCancelarClick(Sender: TObject);
begin
  inherited;
EdtMatricula.ReadOnly := True;
DM.ExibeFoto(DM.qryFuncionarios, 'IMAGEM', FrmTelaCadFuncionarios.ImgFotoFunc);
end;

procedure TFrmTelaCadFuncionarios.BtnCargoClick(Sender: TObject);
begin
  inherited;
if DM.qryFuncionarios.Active = False then Exit;
if DM.qryFuncionarios.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 130;
    DM.FNomeConsulta := 'Cargos';
    DM.qryFuncionarios.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryFuncionariosCODCARGO.AsString := DM.FCodCombo;
        DM.qryFuncionariosCARGO.AsString    := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADCARGOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryCargosCODIGO, DM.qryFormatoCodigoCARGOS, FrmTelaCadCargos) = False then exit;
      Application.CreateForm(TFrmTelaCadCargos, FrmTelaCadCargos);
      FrmTelaCadCargos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadCargos);
    End;
  end;
DM.FDataSetParam     := DM.qryFuncionarios;
DM.FDataSourceParam  := DM.dsFuncionarios;
DM.FTela             := 'CADFUNCIONARIOS';
DM.FParamAuxiliar[1] := 'NOME';
DM.FTabela_auxiliar  := 30;
end;

procedure TFrmTelaCadFuncionarios.BtnCelulaClick(Sender: TObject);
begin
  inherited;
if DM.qryFuncionarios.Active = False then Exit;
if DM.qryFuncionarios.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 49;
    DM.FNomeConsulta := 'Células';
    DM.qryFuncionarios.Edit;
    if DM.ConsultarCombo <> EmptyStr then
      begin
        DM.qryFuncionariosCODCELULA.AsString := DM.FCodCombo;
        DM.qryFuncionariosCELULA.AsString    := DM.FValorCombo;
        DM.qryFuncionariosCODAREA.AsString   := DM.FParamAuxiliar[1];
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADAREAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryAreasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.AplicarMascara(DM.qryCelulasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      if DM.AplicarMascara(DM.qryLinhasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
      Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
      FrmTelaCadAreas.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadAreas);
    End;
  end;
DM.FDataSetParam     := DM.qryFuncionarios;
DM.FDataSourceParam  := DM.dsFuncionarios;
DM.FTela             := 'CADFUNCIONARIOS';
DM.FParamAuxiliar[1] := 'NOME';
DM.FTabela_auxiliar  := 30;
end;

procedure TFrmTelaCadFuncionarios.BtnConsultarClick(Sender: TObject);
begin
DM.FDataSetParam := DM.qryFuncionarios;
DM.FDataSourceParam := DM.dsFuncionarios;
DM.FTela := 'CADFUNCIONARIOS';
DM.FParamAuxiliar[1] := 'NOME';
DM.FTabela_auxiliar  := 30;
  inherited;
DM.ExibeFoto(DM.qryFuncionarios, 'IMAGEM', FrmTelaCadFuncionarios.ImgFotoFunc);
end;

procedure TFrmTelaCadFuncionarios.BtnExcluirClick(Sender: TObject);
begin
  inherited;
DM.ExibeFoto(DM.qryFuncionarios, 'IMAGEM', FrmTelaCadFuncionarios.ImgFotoFunc);
end;

procedure TFrmTelaCadFuncionarios.BtnLimparClick(Sender: TObject);
begin
  inherited;
ImgFotoFunc.Picture.Assign(nil);
DM.qryFuncionariosTIPOIMAGEM.Clear;
DM.qryFuncionariosIMAGEM.Clear;
end;

procedure TFrmTelaCadFuncionarios.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryFuncionariosUSUARIO.AsString         := 'N';
DM.qryFuncionariosATIVO.AsString           := 'S';
DM.qryFuncionariosTERCEIRO.AsString        := 'N';
DM.qryFuncionariosAUTONOMO.AsString        := 'N';
DM.qryFuncionariosOCUPADO.AsString         := 'N';
DM.qryFuncionariosPROGRAMADO.AsString      := 'N';
DM.qryFuncionariosCODEMPRESA.AsString      := DM.FCodEmpresa;
DM.qryFuncionariosDATACADASTRO.AsDateTime  := DM.FDataHoraServidor;
DM.qryFuncionariosDATAULTALT.AsDateTime    := DM.FDataHoraServidor;
DM.qryFuncionariosCODUSUARIOCAD.AsString   := DM.FCodUsuario;
DM.qryFuncionariosCODUSUARIOALT.AsString   := DM.FCodUsuario;

ImgFotoFunc.Picture.Assign(nil);
EdtMatricula.SetFocus;
end;

procedure TFrmTelaCadFuncionarios.BtnSalvarClick(Sender: TObject);
begin
if DM.qryFuncionariosMATRICULA.AsString = EmptyStr then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A MATRÍCULA DO FUNCIONÁRIO!';
    EdtMatricula.SetFocus;
    Exit;
  end;
DM.FTabela_auxiliar  := 30;
if (DM.VerificaDuplo(EdtMatricula.Text) = True) and (DM.FAlterando = False) then
  begin
    EdtMatricula.SetFocus;
    PAuxiliares.Font.Color := clBlack;
    PAuxiliares.Caption := 'VALOR JÁ CADASTRADO!!!';
    Exit;
  end;
if DM.qryFuncionariosNOME.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O NOME DO FUNCIONÁRIO!';
    EdtNome.SetFocus;
    Exit;
  end;
if DM.qryFuncionariosCODCARGO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CARGO DO FUNCIONÁRIO!';
    EdtCargo.SetFocus;
    Exit;
  end;
if DM.qryFuncionariosCODCALENDARIO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O CALENDÁRIO DO FUNCIONÁRIO!';
    EdtCalendario.SetFocus;
    Exit;
  end;
{if DM.qryFuncionariosCODCELULA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A CÉLULA DO FUNCIONÁRIO!';
    EdtCelula.SetFocus;
    Exit;
  end;}
if DM.qryFuncionariosMOBRA.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O TIPO DE MÃO DE OBRA!';
    CBMaodeObra.SetFocus;
    Exit;
  end;
if DM.qryFuncionariosSALARIO.IsNull = True then
  begin
    DM.qryFuncionarios.Edit;
    DM.qryFuncionariosSALARIO.AsFloat := 0;
  end;

DM.MSGAguarde('');

EdtMatricula.ReadOnly := True;
DeleteFile('C:\SPMP3\Temp.jpg');

DM.qryFuncionarios.Params[0].AsString := EdtMatricula.Text;
DM.qryFuncionarios.Params[1].AsString := DM.FCodEmpresa;
  inherited;
if PAuxiliares.Caption <> 'REGISTRO GRAVADO COM SUCESSO!!!' then Exit;

DM.MSGAguarde('', False);
end;

procedure TFrmTelaCadFuncionarios.Button1Click(Sender: TObject);
begin
  inherited;
PopupMenuFerram.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmTelaCadFuncionarios.Button2Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryFuncionariosMATRICULA.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosAusencias, FrmTelaCadFuncionariosAusencias);
    //FrmTelaCadFuncionariosAusencias.Caption := 'Ausências de: '+ DM.qryFuncionariosNOME.AsString;
    FrmTelaCadFuncionariosAusencias.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosAusencias);
  End;

end;

procedure TFrmTelaCadFuncionarios.Button3Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryFuncionariosMATRICULA.AsString;
    DM.FParamAuxiliar[2] := DM.qryFuncionariosNOME.AsString;
//    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
//    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosHist, FrmTelaCadFuncionariosHist);
    //FrmTelaCadFuncionariosHist.Caption := 'Histórico de: '+ DM.qryFuncionariosNOME.AsString;
    FrmTelaCadFuncionariosHist.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosHist);
  End;
end;

procedure TFrmTelaCadFuncionarios.CBMaodeObraChange(Sender: TObject);
begin
  inherited;
  if (CBMaodeObra.Text <> 'AUTÔNOMA') and (ChbAutonomo.Checked = True) then
    begin
      DM.qryFuncionarios.Edit;
      DM.qryFuncionariosAUTONOMO.AsString := 'N';
      ChbAutonomo.Checked := False;
    end;
end;

procedure TFrmTelaCadFuncionarios.Completo1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBFuncionariosGeral;
DM.FTabela_auxiliar := 30;
  inherited;

end;

procedure TFrmTelaCadFuncionarios.EdtMatriculaExit(Sender: TObject);
begin
  inherited;
if DM.FDataSetParam.Modified = True then BtnSalvar.ImageIndex := 115
else BtnSalvar.ImageIndex := 2;
end;

procedure TFrmTelaCadFuncionarios.Ferramentaria1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryFuncionariosMATRICULA.AsString;
    DM.FParamAuxiliar[1] := DM.qryFuncionariosNOME.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosFerramentaria, FrmTelaCadFuncionariosFerramentaria);
    FrmTelaCadFuncionariosFerramentaria.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosFerramentaria);
  End;
end;

procedure TFrmTelaCadFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryFuncionarios.Close;
end;

procedure TFrmTelaCadFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam := DM.qryFuncionarios;
DM.FDataSourceParam := DM.dsFuncionarios;
DM.FTela := 'CADFUNCIONARIOS';
DM.FParamAuxiliar[1] := 'NOME';
DM.FTabela_auxiliar  := 30;
end;

procedure TFrmTelaCadFuncionarios.Individual1Click(Sender: TObject);
begin
DM.FDataSetRelat    := DmRelatorios.frxDBFuncionariosIndividual;
DM.FTabela_auxiliar := 301;
  inherited;

end;

procedure TFrmTelaCadFuncionarios.Inventario1Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryFuncionariosMATRICULA.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosCxaFerramInv, FrmTelaCadFuncionariosCxaFerramInv);
    //FrmTelaCadFuncionariosCxaFerramInv.Caption := 'Inventário da Caixa de Ferramentas de: '+ DM.qryFuncionariosNOME.AsString;
    FrmTelaCadFuncionariosCxaFerramInv.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosCxaFerramInv);
  End;
end;

procedure TFrmTelaCadFuncionarios.MenuItem2Click(Sender: TObject);
begin
  inherited;
  Try
    DM.FParamAuxiliar[0] := DM.qryFuncionariosMATRICULA.AsString;
    if DM.FParamAuxiliar[0] = EmptyStr then BtnConsultar.OnClick(Sender);
    if DM.FParamAuxiliar[0] = EmptyStr then Exit;

    if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    Application.CreateForm(TFrmTelaCadFuncionariosCxaFerramentas, FrmTelaCadFuncionariosCxaFerramentas);
    //FrmTelaCadFuncionariosCxaFerramentas.Caption := 'Caixa de Ferramentas de: '+ DM.qryFuncionariosNOME.AsString;
    FrmTelaCadFuncionariosCxaFerramentas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFuncionariosCxaFerramentas);
  End;
end;

{LoadJPEGPictureFile}

procedure TFrmTelaCadFuncionarios.SmoothResize(Src, Dst: TBitmap);
var
  x, y: Integer;
  xP, yP: Integer;
  xP2, yP2: Integer;
  SrcLine1, SrcLine2: pRGBArray;
  t3: Integer;
  z, z2, iz2: Integer;
  DstLine: pRGBArray;
  DstGap: Integer;
  w1, w2, w3, w4: Integer;
begin
  Src.PixelFormat := pf24bit;
  Dst.PixelFormat := pf24bit;

  if (Src.Width = Dst.Width) and (Src.Height = Dst.Height) then
    Dst.Assign(Src)
  else
  begin
    DstLine := Dst.ScanLine[0];
    DstGap  := Integer(Dst.ScanLine[1]) - Integer(DstLine);

    xP2 := MulDiv(pred(Src.Width), $10000, Dst.Width);
    yP2 := MulDiv(pred(Src.Height), $10000, Dst.Height);
    yP  := 0;

    for y := 0 to pred(Dst.Height) do
    begin
      xP := 0;

      SrcLine1 := Src.ScanLine[yP shr 16];

      if (yP shr 16 < pred(Src.Height)) then
        SrcLine2 := Src.ScanLine[succ(yP shr 16)]
      else
        SrcLine2 := Src.ScanLine[yP shr 16];

      z2  := succ(yP and $FFFF);
      iz2 := succ((not yp) and $FFFF);
      for x := 0 to pred(Dst.Width) do
      begin
        t3 := xP shr 16;
        z  := xP and $FFFF;
        w2 := MulDiv(z, iz2, $10000);
        w1 := iz2 - w2;
        w4 := MulDiv(z, z2, $10000);
        w3 := z2 - w4;
        DstLine[x].rgbtRed := (SrcLine1[t3].rgbtRed * w1 +
          SrcLine1[t3 + 1].rgbtRed * w2 +
          SrcLine2[t3].rgbtRed * w3 + SrcLine2[t3 + 1].rgbtRed * w4) shr 16;
        DstLine[x].rgbtGreen :=
          (SrcLine1[t3].rgbtGreen * w1 + SrcLine1[t3 + 1].rgbtGreen * w2 +

          SrcLine2[t3].rgbtGreen * w3 + SrcLine2[t3 + 1].rgbtGreen * w4) shr 16;
        DstLine[x].rgbtBlue := (SrcLine1[t3].rgbtBlue * w1 +
          SrcLine1[t3 + 1].rgbtBlue * w2 +
          SrcLine2[t3].rgbtBlue * w3 +
          SrcLine2[t3 + 1].rgbtBlue * w4) shr 16;
        Inc(xP, xP2);
      end; {for}
      Inc(yP, yP2);
      DstLine := pRGBArray(Integer(DstLine) + DstGap);
    end; {for}
  end; {if}
end; procedure TFrmTelaCadFuncionarios.TabNextTab1AfterTabChange(Sender: TObject);
begin
  inherited;

end;

{SmoothResize}

end.



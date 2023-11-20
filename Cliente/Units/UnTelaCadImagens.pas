unit UnTelaCadImagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiParametros, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Clipbrd,
  JvDialogs, Data.DB, Datasnap.DBClient, Vcl.imaging.Jpeg, Vcl.ExtDlgs,
  System.Actions, Vcl.ActnList, Vcl.ExtActns, FireDAC.Stan.Param;

type
  TFrmTelaCadImagens = class(TFrmTelaPaiParametros)
    Label2: TLabel;
    EdtDescricao: TDBEdit;
    Label6: TLabel;
    EdtEquipamento: TDBEdit;
    BtnEquipamento: TButton;
    EdtPontoInspecao: TDBEdit;
    BtnPontoInspecao: TButton;
    PProgramacao: TPanel;
    Label3: TLabel;
    ChbTipo: TDBCheckBox;
    BtnProcurar: TBitBtn;
    BtnLimparEquip: TBitBtn;
    SPDFoto: TSavePictureDialog;
    ImgFotoEquip: TImage;
    PopupMenuCons: TPopupMenu;
    Codigo1: TMenuItem;
    Descricao1: TMenuItem;
    PopupMenuCons2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    OPDFoto: TJvOpenDialog;
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnLimparEquipClick(Sender: TObject);
    procedure BtnProcurarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEquipamentoClick(Sender: TObject);
    procedure BtnPontoInspecaoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Codigo1Click(Sender: TObject);
    procedure Descricao1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadImagens: TFrmTelaCadImagens;

implementation

{$R *.dfm}

uses UnDmRelatorios, UnTelaCadEquipamentos,
  UnTelaCadPontoInspecao, UnDM;


procedure TFrmTelaCadImagens.BtnCancelarClick(Sender: TObject);
begin
  inherited;
if DM.qryImagens.Active = True then
  if DM.qryImagens.IsEmpty = True then
    begin
      ImgFotoEquip.Picture.Assign(nil);
      DM.qryImagensTIPO.Clear;
      DM.qryImagensFOTO.Clear;
    end;
end;

procedure TFrmTelaCadImagens.BtnConsultarClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 26;
  inherited;
DM.ExibeFoto(DM.qryImagens, 'FOTO', FrmTelaCadImagens.ImgFotoEquip);
end;

procedure TFrmTelaCadImagens.BtnEquipamentoClick(Sender: TObject);
begin
  inherited;
if DM.qryImagens.Active = False then Exit;
if DM.qryImagens.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 250;
    if DM.FParamAuxiliar[1] = '' then
      begin
        PopupMenuCons.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        Exit;
      end
    else
      begin
        DM.FNomeConsulta := 'Equipamentos';
        DM.qryImagens.Edit;
        if DM.ConsultarCombo <> EmptyStr then
          begin
            DM.qryImagensCODEQUIPAMENTO.AsString := DM.FCodCombo;
            DM.qryImagensEQUIPAMENTO.AsString    := DM.FValorCombo;
          end;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADEQUIPAMENTOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if DM.AplicarMascara(DM.qryEquipamentosCODIGO, DM.qryFormatoCodigoEQUIPAMENTOS, FrmTelaCadEquipamentos) = False then exit;
      Application.CreateForm(TFrmTelaCadEquipamentos, FrmTelaCadEquipamentos);
      FrmTelaCadEquipamentos.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadEquipamentos);
    End;
  end;
DM.FParamAuxiliar[1] := '';
DM.FDataSetParam    := DM.qryImagens;
DM.FDataSourceParam := DM.dsImagens;
DM.FTela            := 'CADIMANGENS';
DM.FTabela_auxiliar := 26;
end;

procedure TFrmTelaCadImagens.BtnExcluirClick(Sender: TObject);
begin
  inherited;
if DM.qryImagensCODIGO.IsNull then
  ImgFotoEquip.Picture.Assign(nil);
end;

procedure TFrmTelaCadImagens.BtnImprimirClick(Sender: TObject);
begin
DM.FTabela_auxiliar := 26;
  inherited;
DM.FDataSetRelat    := DmRelatorios.frxDBImagens;
end;

procedure TFrmTelaCadImagens.BtnLimparEquipClick(Sender: TObject);
begin
  inherited;
if DM.qryImagens.Active = True then
  begin
    ImgFotoEquip.Picture.Assign(nil);
    DM.qryImagensTIPO.Clear;
    DM.qryImagensFOTO.Clear;
  end;
end;

procedure TFrmTelaCadImagens.BtnNovoClick(Sender: TObject);
begin
  inherited;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;

DM.qryImagensTIPO.AsString       := 'Equip';
DM.qryImagensCODEMPRESA.AsString := DM.FCodEmpresa;

EdtDescricao.SetFocus;
end;

procedure TFrmTelaCadImagens.BtnPontoInspecaoClick(Sender: TObject);
begin
  inherited;
if DM.qryImagens.Active = False then Exit;
if DM.qryImagens.IsEmpty = True then Exit;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 380;
    DM.FNomeConsulta := 'Pontos de Inspeção';
    DM.qryImagens.Edit;
    if DM.FParamAuxiliar[1] = '' then
      begin
        PopupMenuCons2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
        Exit;
      end
    else
      begin
        if DM.ConsultarCombo <> EmptyStr then
          begin
            DM.qryImagensCODITEMSECUNDARIO.AsString := DM.FCodCombo;
            DM.qryImagensPONTO.AsString             := DM.FValorCombo;
          end;
      end;
  end
else
  begin
    Try
     if (DM.qryUsuarioPAcessoCADPONTOSINSPECAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
     if DM.AplicarMascara(DM.qryPontosInspecaoCODIGO, DM.qryFormatoCodigoPONTOSINSPECAO, FrmTelaCadPontoInspecao) = False then exit;
     Application.CreateForm(TFrmTelaCadPontoInspecao, FrmTelaCadPontoInspecao);
     FrmTelaCadPontoInspecao.ShowModal;
   Finally
     FreeAndNil(FrmTelaCadPontoInspecao);
   End;
  end;
DM.FParamAuxiliar[1] := '';
DM.FDataSetParam    := DM.qryImagens;
DM.FDataSourceParam := DM.dsImagens;
DM.FTela            := 'CADIMANGENS';
DM.FTabela_auxiliar := 26;
end;

procedure TFrmTelaCadImagens.BtnProcurarClick(Sender: TObject);
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
        DM.qryImagensFOTO.Assign(jpg);
        DM.ExibeFoto(DM.qryImagens, 'FOTO', FrmTelaCadImagens.ImgFotoEquip);
        jpg.Free;
      end
    else
      begin
        DM.qryImagensFOTO.Clear;
      end;
  end;
end;

procedure TFrmTelaCadImagens.BtnSalvarClick(Sender: TObject);
begin
PControle.SetFocus;
if not (DM.FDataSetParam.State in [dsInsert, dsEdit]) then Exit;
if DM.FDataSetParam.IsEmpty = True then Exit;
if DM.qryImagensDESCRICAO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME A DESCRIÇÃO DO REGISTRO!';
    EdtDescricao.SetFocus;
    Exit;
  end;

if DM.qryImagensCODEQUIPAMENTO.IsNull = True then
  begin
    PAuxiliares.Font.Color := clRed;
    PAuxiliares.Caption := 'INFORME O EQUIPAMENTO DO REGISTRO!';
    EdtEquipamento.SetFocus;
    Exit;
  end;

if DM.qryImagensTIPO.AsString = 'Ponto' then
  begin
    if DM.qryImagensCODITEMSECUNDARIO.AsString = EmptyStr then
      begin
        PAuxiliares.Font.Color := clRed;
        PAuxiliares.Caption := 'INFORME O PONTO DO REGISTRO!';
        EdtPontoInspecao.SetFocus;
        Exit;
      end;
  end;

  inherited;

// DM.qryImagens.Params[0].AsInteger := DM.RetornaProximoIndice('imagens');
DM.qryImagens.Params[0].AsInteger := DM.qryImagensCODIGO.AsInteger;
DM.qryImagens.Params[1].AsString  := DM.FCodEmpresa;
end;

procedure TFrmTelaCadImagens.Codigo1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadImagens.Descricao1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnEquipamento.OnClick(Sender);
end;

procedure TFrmTelaCadImagens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
FillChar(DM.FParamAuxiliar, SizeOf(DM.FParamAuxiliar), #0);
DM.qryImagens.Close;
end;

procedure TFrmTelaCadImagens.FormCreate(Sender: TObject);
begin
  inherited;
DM.FDataSetParam    := DM.qryImagens;
DM.FDataSourceParam := DM.dsImagens;
DM.FTela := 'CADIMANGENS';
end;

procedure TFrmTelaCadImagens.MenuItem1Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'CODIGO';
BtnPontoInspecao.OnClick(Sender);
end;

procedure TFrmTelaCadImagens.MenuItem2Click(Sender: TObject);
begin
  inherited;
DM.FParamAuxiliar[1] := 'DESCRICAO';
BtnPontoInspecao.OnClick(Sender);
end;

end.

unit UnTelaMenuParametros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg;

type
  TFrmTelaMenuParametros = class(TForm)
    Image1: TImage;
    MainMenuPrincipal: TMainMenu;
    Ajuda1: TMenuItem;
    Contedoendice2: TMenuItem;
    Sair1: TMenuItem;
    PAlertas: TPanel;
    LblAlertas: TLabel;
    StatusBar1: TStatusBar;
    Corporativo1: TMenuItem;
    Unidade1: TMenuItem;
    FormatodeCdigos2: TMenuItem;
    GrupoIndustrial2: TMenuItem;
    CentrosdeCustos2: TMenuItem;
    ClassesdeEquipamentos2: TMenuItem;
    Famlias2: TMenuItem;
    Recursos5: TMenuItem;
    PeasdeReposio1: TMenuItem;
    Equipamentos3: TMenuItem;
    CausasdeFalhas2: TMenuItem;
    iposdeManuteno2: TMenuItem;
    MotivosdeParadas1: TMenuItem;
    iposdeProgramao2: TMenuItem;
    Cargos1: TMenuItem;
    PermissodeUsurios2: TMenuItem;
    CadastrodeUsurios2: TMenuItem;
    Oficinas1: TMenuItem;
    Almoxarifados2: TMenuItem;
    reas2: TMenuItem;
    Feriados2: TMenuItem;
    CalendriodeModeObra2: TMenuItem;
    CalendriodeEquipamentos2: TMenuItem;
    Imagens1: TMenuItem;
    Fornecedores2: TMenuItem;
    Fabricantes2: TMenuItem;
    DisponibilidadesAdmissveis2: TMenuItem;
    TimerLetreiro: TTimer;
    TimerAlertas: TTimer;
    procedure CentrosdeCustos2Click(Sender: TObject);
    procedure TimerLetreiroTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PAlertasDblClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormatodeCdigos2Click(Sender: TObject);
    procedure GrupoIndustrial2Click(Sender: TObject);
    procedure ClassesdeEquipamentos2Click(Sender: TObject);
    procedure Equipamentos3Click(Sender: TObject);
    procedure PeasdeReposio1Click(Sender: TObject);
    procedure Recursos5Click(Sender: TObject);
    procedure CausasdeFalhas2Click(Sender: TObject);
    procedure iposdeManuteno2Click(Sender: TObject);
    procedure MotivosdeParadas1Click(Sender: TObject);
    procedure iposdeProgramao2Click(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure Almoxarifados2Click(Sender: TObject);
    procedure Oficinas1Click(Sender: TObject);
    procedure CadastrodeUsurios2Click(Sender: TObject);
    procedure reas2Click(Sender: TObject);
    procedure Feriados2Click(Sender: TObject);
    procedure CalendriodeModeObra2Click(Sender: TObject);
    procedure CalendriodeEquipamentos2Click(Sender: TObject);
    procedure Imagens1Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure Fabricantes2Click(Sender: TObject);
    procedure DisponibilidadesAdmissveis2Click(Sender: TObject);
    procedure PermissodeUsurios2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaMenuParametros: TFrmTelaMenuParametros;

implementation

{$R *.dfm}

uses UnTelaCadCentroCusto, UnTelaCadFormatoCodigo,
  UnTelaCadGrupoIndustrial, UnTelaCadClasses, UnTelaCadCargos,
  UnTelaCadCausaFalha, UnTelaCadEquipamentos, UnTelaCadFamiliaEquipamento,
  UnTelaCadFamiliaPecasRep, UnTelaCadFamiliaRecursos, UnTelaCadMotivoParada,
  UnTelaCadTipoManutencao, UnTelaCadTipoProgramacao, UnTelaCadAlmoxarifados,
  UnTelaCadAreas, UnTelaCadCalendEquip, UnTelaCadCalendMObra,
  UnTelaCadDisponibilidade, UnTelaCadFabricantes, UnTelaCadFeriados,
  UnTelaCadFornecedores, UnTelaCadImagens, UnTelaCadOficinas, UnTelaCadUsuarios,
  UnTelaPermissoes, UnDM;

procedure TFrmTelaMenuParametros.Almoxarifados2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADALMOXARIFADO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryAlmoxarifadoCODIGO, DM.qryFormatoCodigoALMOXARIFADO, FrmTelaCadAlmoxarifados) = False then exit;
    Application.CreateForm(TFrmTelaCadAlmoxarifados, FrmTelaCadAlmoxarifados);
    FrmTelaCadAlmoxarifados.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAlmoxarifados);
  End;
end;

procedure TFrmTelaMenuParametros.CadastrodeUsurios2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADUSUARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryUsuariosCODIGO, DM.qryFormatoCodigoUSUARIO, FrmTelaCadUsuarios) = False then exit;
    Application.CreateForm(TFrmTelaCadUsuarios, FrmTelaCadUsuarios);
    FrmTelaCadUsuarios.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadUsuarios);
  End;
end;

procedure TFrmTelaMenuParametros.CalendriodeEquipamentos2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCALENDEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryCalendEquipCODIGO, DM.qryFormatoCodigoCALENDARIOEQUIP, FrmTelaCadCalendEquip) = False then exit;
    Application.CreateForm(TFrmTelaCadCalendEquip, FrmTelaCadCalendEquip);
    FrmTelaCadCalendEquip.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCalendEquip);
  End;
end;

procedure TFrmTelaMenuParametros.CalendriodeModeObra2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCALENDMOBRA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryCalendMObraCODIGO, DM.qryFormatoCodigoCALENDARIO, FrmTelaCadCalendMObra) = False then exit;
    Application.CreateForm(TFrmTelaCadCalendMObra, FrmTelaCadCalendMObra);
    FrmTelaCadCalendMObra.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCalendMObra);
  End;
end;

procedure TFrmTelaMenuParametros.Cargos1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCARGOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryCargosCODIGO, DM.qryFormatoCodigoCARGOS, FrmTelaCadCargos) = False then exit;
    Application.CreateForm(TFrmTelaCadCargos, FrmTelaCadCargos);
    FrmTelaCadCargos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCargos);
  End;
end;

procedure TFrmTelaMenuParametros.CausasdeFalhas2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCAUSASFALHA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryCausaFalhaCODIGO, DM.qryFormatoCodigoCAUSASFALHA, FrmTelaCadCausaFalha) = False then exit;
    Application.CreateForm(TFrmTelaCadCausaFalha, FrmTelaCadCausaFalha);
    FrmTelaCadCausaFalha.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCausaFalha);
  End;
end;

procedure TFrmTelaMenuParametros.CentrosdeCustos2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCENTROCUSTO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoCENTROCUSTO, FrmTelaCadCentroCusto) = False then exit;
    //if DM.AplicarMascara(DM.qryCentroCustoCODIGO, DM.qryFormatoCodigoNATUREZAFINANCEIRA, FrmTelaCadCentroCusto) = False then exit;
    Application.CreateForm(TFrmTelaCadCentroCusto, FrmTelaCadCentroCusto);
    FrmTelaCadCentroCusto.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadCentroCusto);
  End;
end;

procedure TFrmTelaMenuParametros.ClassesdeEquipamentos2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADCLASSES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryClassesCODIGO, DM.qryFormatoCodigoCLASSES, FrmTelaCadClasses) = False then exit;
    Application.CreateForm(TFrmTelaCadClasses, FrmTelaCadClasses);
    FrmTelaCadClasses.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadClasses);
  End;
end;

procedure TFrmTelaMenuParametros.DisponibilidadesAdmissveis2Click(
  Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADDISPONIBILIDADE.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadDisponibilidade, FrmTelaCadDisponibilidade);
    FrmTelaCadDisponibilidade.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadDisponibilidade);
  End;
end;

procedure TFrmTelaMenuParametros.Equipamentos3Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFAMILIAEQUIP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryFamEquipamentoCODIGO, DM.qryFormatoCodigoFAMILIAEQUIPAMENTO, FrmTelaCadFamiliaEquipamento) = False then exit;
    Application.CreateForm(TFrmTelaCadFamiliaEquipamento, FrmTelaCadFamiliaEquipamento);
    FrmTelaCadFamiliaEquipamento.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFamiliaEquipamento);
  End;
end;

procedure TFrmTelaMenuParametros.Fabricantes2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFABRICANTES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryFabricantesCODIGO, DM.qryFormatoCodigoFABRICANTE, FrmTelaCadFabricantes) = False then exit;
    Application.CreateForm(TFrmTelaCadFabricantes, FrmTelaCadFabricantes);
    FrmTelaCadFabricantes.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFabricantes);
  End;
end;

procedure TFrmTelaMenuParametros.Feriados2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFERIADOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryFeriadosCODIGO, DM.qryFormatoCodigoFERIADOS, FrmTelaCadFeriados) = False then exit;
    Application.CreateForm(TFrmTelaCadFeriados, FrmTelaCadFeriados);
    FrmTelaCadFeriados.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFeriados);
  End;
end;

procedure TFrmTelaMenuParametros.FormatodeCdigos2Click(Sender: TObject);
begin
  Try
    Application.CreateForm(TFrmTelaCadFormatoCodigo, FrmTelaCadFormatoCodigo);
    FrmTelaCadFormatoCodigo.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFormatoCodigo);
  End;
end;

procedure TFrmTelaMenuParametros.FormCreate(Sender: TObject);
begin
StatusBar1.Font.Size := 7;
StatusBar1.Panels[0].Text := DM.FNomeUsuario;
StatusBar1.Panels[1].Text := DM.FNomeEmpresa;
StatusBar1.Panels[2].Text := DM.FNomeGrupo;
LblAlertas.Caption := DM.FAlerta;
TimerAlertas.Enabled  := True;
TimerLetreiro.Enabled := True;
end;

procedure TFrmTelaMenuParametros.Fornecedores2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFORNECEDORES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryFornecedoresCODIGO, DM.qryFormatoCodigoFORNECEDOR, FrmTelaCadFornecedores) = False then exit;
    Application.CreateForm(TFrmTelaCadFornecedores, FrmTelaCadFornecedores);
    FrmTelaCadFornecedores.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFornecedores);
  End;
end;

procedure TFrmTelaMenuParametros.GrupoIndustrial2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADGRUPOINDUSTRIAL.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryUnidadesCODIGO, DM.qryFormatoCodigoEMPRESA, FrmTelaCadGrupoIndustrial) = False then exit;
    if DM.AplicarMascara(DM.qryAdmCorpCODIGO, DM.qryFormatoCodigoUSUARIO, FrmTelaCadGrupoIndustrial) = False then exit;
    if DM.AplicarMascara(DM.qryAdmUnidCODIGO, DM.qryFormatoCodigoUSUARIO, FrmTelaCadGrupoIndustrial) = False then exit;
    Application.CreateForm(TFrmTelaCadGrupoIndustrial, FrmTelaCadGrupoIndustrial);
    FrmTelaCadGrupoIndustrial.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadGrupoIndustrial);
  End;end;

procedure TFrmTelaMenuParametros.Imagens1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADIMANGENS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaCadImagens, FrmTelaCadImagens);
    FrmTelaCadImagens.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadImagens);
  End;
end;

procedure TFrmTelaMenuParametros.iposdeManuteno2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMANUTENCAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryTipoManutencaoCODIGO, DM.qryFormatoCodigoTIPOMANUTENCAO, FrmTelaCadTipoManutencao) = False then exit;
    Application.CreateForm(TFrmTelaCadTipoManutencao, FrmTelaCadTipoManutencao);
    FrmTelaCadTipoManutencao.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadTipoManutencao);
  End;
end;

procedure TFrmTelaMenuParametros.iposdeProgramao2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADTIPOPROGRAMACAO.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryTipoProgramacaoCODIGO, DM.qryFormatoCodigoTIPOPROGRAMACAO, FrmTelaCadTipoProgramacao) = False then exit;
    Application.CreateForm(TFrmTelaCadTipoProgramacao, FrmTelaCadTipoProgramacao);
    FrmTelaCadTipoProgramacao.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadTipoProgramacao);
  End;
end;

procedure TFrmTelaMenuParametros.MotivosdeParadas1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADMOTIVOPARADA.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryMotivoParadaCODIGO, DM.qryFormatoCodigoMOTIVOPARADA, FrmTelaCadMotivoParada) = False then exit;
    Application.CreateForm(TFrmTelaCadMotivoParada, FrmTelaCadMotivoParada);
    FrmTelaCadMotivoParada.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadMotivoParada);
  End;
end;

procedure TFrmTelaMenuParametros.Oficinas1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADOFICINAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryOficinasCODIGO, DM.qryFormatoCodigoOFICINAS, FrmTelaCadOficinas) = False then exit;
    Application.CreateForm(TFrmTelaCadOficinas, FrmTelaCadOficinas);
    FrmTelaCadOficinas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadOficinas);
  End;
end;

procedure TFrmTelaMenuParametros.PAlertasDblClick(Sender: TObject);
begin
LblAlertas.Left := PAlertas.Width;
if TimerLetreiro.Enabled = True then
  begin
    TimerLetreiro.Enabled := False;
    TimerAlertas.Enabled  := False;
  end
else
  begin
    TimerLetreiro.Enabled := True;
    TimerAlertas.Enabled  := True;
  end;
end;

procedure TFrmTelaMenuParametros.PeasdeReposio1Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFAMILIAPECASREP.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryFamPecasRepCODIGO, DM.qryFormatoCodigoFAMILIAPECASREPOSICAO, FrmTelaCadFamiliaPecasRep) = False then exit;
    Application.CreateForm(TFrmTelaCadFamiliaPecasRep, FrmTelaCadFamiliaPecasRep);
    FrmTelaCadFamiliaPecasRep.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFamiliaPecasRep);
  End;
end;

procedure TFrmTelaMenuParametros.PermissodeUsurios2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADPERMISSOES.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    Application.CreateForm(TFrmTelaPermissoes, FrmTelaPermissoes);
    FrmTelaPermissoes.ShowModal;
  Finally
    FreeAndNil(FrmTelaPermissoes);
  End;
end;

procedure TFrmTelaMenuParametros.reas2Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADAREAS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryAreasCODIGO, DM.qryFormatoCodigoAREAS, FrmTelaCadAreas) = False then exit;
    Application.CreateForm(TFrmTelaCadAreas, FrmTelaCadAreas);
    FrmTelaCadAreas.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadAreas);
  End;
end;

procedure TFrmTelaMenuParametros.Recursos5Click(Sender: TObject);
begin
  Try
    if (DM.qryUsuarioPAcessoCADFAMILIARECURSOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then Exit;
    if DM.AplicarMascara(DM.qryFamRecursosCODIGO, DM.qryFormatoCodigoFAMILIARECURSOS, FrmTelaCadFamiliaRecursos) = False then exit;
    Application.CreateForm(TFrmTelaCadFamiliaRecursos, FrmTelaCadFamiliaRecursos);
    FrmTelaCadFamiliaRecursos.ShowModal;
  Finally
    FreeAndNil(FrmTelaCadFamiliaRecursos);
  End;
end;

procedure TFrmTelaMenuParametros.Sair1Click(Sender: TObject);
begin
Close;
end;

procedure TFrmTelaMenuParametros.TimerLetreiroTimer(Sender: TObject);
begin
if LblAlertas.left >= -(LblAlertas.Width) then
  LblAlertas.left := LblAlertas.left-1
else
  LblAlertas.left := PAlertas.width;
end;

end.

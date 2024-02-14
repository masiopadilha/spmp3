unit UnTelaCadManutProgFamEquipClonagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, UnDM, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrmTelaCadManutProgFamEquipClonagem = class(TFrmTelaPaiOKCancel)
    qryEquipamentos: TFDQuery;
    dsEquipamentos: TDataSource;
    gbEquipamentosFamilia: TGroupBox;
    gridEquip: TDBGrid;
    qryEquipamentosCODIGO: TStringField;
    qryEquipamentosDESCRICAO: TStringField;
    qryEquipamentosOPERANDO: TStringField;
    qryEquipamentoscentrocusto: TStringField;
    qryEquipamentosAREA: TStringField;
    qryEquipamentoscelula: TStringField;
    qryEquipamentoslinha: TStringField;
    BitBtn2: TBitBtn;
    chbTodos: TCheckBox;
    Label9: TLabel;
    Label7: TLabel;
    cbCriticidade: TComboBox;
    cbReprogramacao: TComboBox;
    Label2: TLabel;
    EdtMatricula: TEdit;
    EdtResponsavel: TEdit;
    BtnFuncionario: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure chbTodosClick(Sender: TObject);
    procedure EdtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFuncionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaCadManutProgFamEquipClonagem: TFrmTelaCadManutProgFamEquipClonagem;

implementation

{$R *.dfm}

uses UnTelaCadFuncionarios;

procedure TFrmTelaCadManutProgFamEquipClonagem.BitBtn2Click(Sender: TObject);
var
  I: SmallInt;
  LInsp: String;
  LTexto: PChar;
  randomNum: Integer;
begin
  inherited;
  PAuxiliares.Font.Color := clGray;
  PAuxiliares.Caption := EmptyStr;

  try
    if qryEquipamentos.IsEmpty = True then Exit;

    for I := 0 to gridEquip.SelectedRows.Count - 1 do
    begin
      qryEquipamentos.GotoBookmark(gridEquip.SelectedRows.Items[I]);
      LInsp := LInsp + IntToStr(qryEquipamentos.RecNo) + 'º - ' + qryEquipamentos.FieldByName('DESCRICAO').AsString + #13;
    end;

    if gridEquip.SelectedRows.Count = 0 then
    begin
      LTexto := PChar('Escolha o(s) equipamento(s) para cadastrar o plano de manutenção.');
      Application.MessageBox(LTexto, 'SPMP3', MB_OK + MB_ICONSTOP);
      qryEquipamentos.RecNo := 1;
      gridEquip.SelectedRows.CurrentRowSelected := True;
      Exit;
    end;

    LTexto := PChar('Deseja realmente criar o plano de manutenção para o(s) equipamento(s) selecionado(s)?' + #13 + LInsp);
    if Application.MessageBox(LTexto, 'SPMP3', MB_YESNO + MB_ICONQUESTION) = IDYes then
    begin
      if EdtResponsavel.Text = '' then
        EdtMatricula.Text := '';

      DM.qryAuxiliar2.Close;
      DM.qryAuxiliar2.SQL.Clear;
      DM.qryAuxiliar2.SQL.Text := 'SELECT * FROM manutprogequipamento WHERE codigo = -1';
      DM.qryAuxiliar2.Open;

      DM.MSGAguarde('');
      for I := 0 to gridEquip.SelectedRows.Count - 1 do
      begin
        qryEquipamentos.GotoBookmark(gridEquip.SelectedRows.Items[I]);

        Randomize;
        randomNum := Random(9000) + 1000;

        DM.FTabela_auxiliar  := 32;
        while DM.VerificaDuplo('MPC.' + IntToStr(randomNum)) = True do
          begin
            Randomize;
            randomNum := Random(9000) + 1000;
          end;

        DM.qryAuxiliar2.Append;
        DM.qryAuxiliar2.FieldByName('CODIGO').AsString               := 'MPC.' + IntToStr(randomNum);
        DM.qryAuxiliar2.FieldByName('CODEMPRESA').AsString           := DM.FCodEmpresa;
        DM.qryAuxiliar2.FieldByName('CODEQUIPAMENTO').AsString       := qryEquipamentosCODIGO.AsString;
        DM.qryAuxiliar2.FieldByName('CODMANUTPROGFAMEQUIP').AsString := DM.qryManutProgFamEquipCODIGO.AsString;
        DM.qryAuxiliar2.FieldByName('MATRICULA').AsString            := EdtMatricula.Text;
        DM.qryAuxiliar2.FieldByName('DESCRICAO').AsString            := DM.qryManutProgFamEquipDESCRICAO.AsString + ' (Auto)';
        DM.qryAuxiliar2.FieldByName('CRITICIDADE').AsString          := cbCriticidade.Text;
        DM.qryAuxiliar2.FieldByName('FREQUENCIA1').AsString          := DM.qryManutProgFamEquipFREQUENCIA.AsString;
        DM.qryAuxiliar2.FieldByName('REPROGRAMAR1').AsString         := cbReprogramacao.Text;
        DM.qryAuxiliar2.FieldByName('RELATORIO').AsString            := 'N';
        DM.qryAuxiliar2.FieldByName('GRUPOINSP').AsString            := 'N';
        DM.qryAuxiliar2.FieldByName('DATACADASTRO').AsDateTime       := DM.FDataHoraServidor;
        DM.qryAuxiliar2.FieldByName('CODUSUARIOCAD').AsString        := DM.FCodUsuario;
        DM.qryAuxiliar2.FieldByName('DATAULTALT').AsDateTime         := DM.FDataHoraServidor;
        DM.qryAuxiliar2.FieldByName('CODUSUARIOALT').AsString        := DM.FCodUsuario;
        DM.qryAuxiliar2.Post;
      end;

      DM.qryAuxiliar2.Close;
      DM.MSGAguarde('', False);
      PAuxiliares.Font.Color := clGreen;
      PAuxiliares.Caption := 'REGISTRO GRAVADO COM SUCESSO!!!';
      qryEquipamentos.Refresh;
    end;
  except
    on E: Exception do
    begin
      DM.GravaLog('Falha ao clonar o plano de manutenção.' + Screen.ActiveForm.Name + ' ', E.ClassName, E.Message);
      Application.MessageBox('Falha ao clonar o plano de manutenção!, entre em contato com o suporte.', 'SPMP3', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipClonagem.BtnFuncionarioClick(
  Sender: TObject);
begin
  inherited;
if (GetKeyState(VK_CONTROL) and 128 > 0) = False then
  begin
    DM.FTabela_auxiliar := 300;
    DM.FNomeConsulta := 'Funcionários';
    DM.FParamAuxiliar[1] := 'NOME';
    if DM.ConsultarCombo <> EmptyStr then
      begin
        EdtMatricula.Text   := DM.FCodCombo;
        EdtResponsavel.Text := DM.FValorCombo;
      end;
  end
else
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFUNCIONARIOS.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
      begin
        Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      Application.CreateForm(TFrmTelaCadFuncionarios,FrmTelaCadFuncionarios);
      FrmTelaCadFuncionarios.ShowModal;
    Finally
      FreeAndNil(FrmTelaCadFuncionarios);
    End;
  end;
DM.FParamAuxiliar[1] := EmptyStr;

end;

procedure TFrmTelaCadManutProgFamEquipClonagem.chbTodosClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if Assigned(gridEquip) and Assigned(gridEquip.DataSource) and Assigned(gridEquip.DataSource.Dataset) then
  begin
    gridEquip.DataSource.Dataset.DisableControls;
    try
      for i := 0 to gridEquip.DataSource.Dataset.RecordCount - 1 do
      begin
        gridEquip.DataSource.Dataset.RecNo := i + 1;
        gridEquip.SelectedRows.CurrentRowSelected := chbTodos.Checked;
      end;
    finally
      gridEquip.DataSource.Dataset.EnableControls;
    end;
  end;
end;

procedure TFrmTelaCadManutProgFamEquipClonagem.EdtMatriculaKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
if Key = #13 then
  begin
    if EdtMatricula.Text <> '' then
      begin
        DM.qryAuxiliar.Close;
        DM.qryAuxiliar.SQL.Clear;
        DM.qryAuxiliar.SQL.Add('SELECT `funcionarios`.`MATRICULA`, `funcionarios`.`NOME`, `cargos`.`DESCRICAO` AS `CARGO` FROM funcionarios '
                               + 'INNER JOIN `cargos` ON (`funcionarios`.`CODCARGO` = `cargos`.`CODIGO`) WHERE (`funcionarios`.`MATRICULA` = :matricula AND `funcionarios`.`CODEMPRESA` = '+QuotedStr(DM.FCodEmpresa) + ') order by `funcionarios`.nome');
        DM.qryAuxiliar.Params[0].AsString := EdtMatricula.Text;
        DM.qryAuxiliar.Open;

        EdtMatricula.Text   := DM.qryAuxiliar.FieldByName('MATRICULA').AsString;
        EdtResponsavel.Text := DM.qryAuxiliar.FieldByName('NOME').AsString;

        DM.qryAuxiliar.Close;
        DM.qryAuxiliar.SQL.Clear;
      end;
  end;

end;

procedure TFrmTelaCadManutProgFamEquipClonagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryEquipamentos.Close;
end;

procedure TFrmTelaCadManutProgFamEquipClonagem.FormCreate(Sender: TObject);
begin
  inherited;
  qryEquipamentos.Close;
  qryEquipamentos.Params[0].AsString := DM.qryManutProgFamEquipCODIGO.AsString;
  qryEquipamentos.Params[1].AsString := DM.FCodEmpresa;
  qryEquipamentos.Params[2].AsString := DM.qryManutProgFamEquipCODFAMILIAEQUIP.AsString;
  qryEquipamentos.Open;

  gbEquipamentosFamilia.Caption := 'Equipamentos da Família: ' + DM.qryManutProgFamEquipFAMILIAEQUIPAMENTO.AsString;
end;

end.

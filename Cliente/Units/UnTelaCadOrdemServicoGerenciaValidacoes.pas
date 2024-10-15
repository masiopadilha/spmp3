unit UnTelaCadOrdemServicoGerenciaValidacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnTelaPaiOkCancel, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList, Vcl.BaseImageCollection, Vcl.ImageCollection,
  JvExComCtrls, JvDateTimePicker, System.DateUtils, Vcl.Menus,
  Winapi.WinCred, Vcl.DBCtrls;

type
  TFrmTelaCadOrdemServicoGerenciaValidacoes = class(TFrmTelaPaiOKCancel)
    PCOrdensServico: TPageControl;
    TSCorretivas: TTabSheet;
    TSPreventivas: TTabSheet;
    TSSolicitacoes: TTabSheet;
    DBGridCorret: TJvDBGrid;
    TSOutras: TTabSheet;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    Label3: TLabel;
    EdtData1: TJvDateTimePicker;
    Label4: TLabel;
    EdtData2: TJvDateTimePicker;
    BtnConsultar: TButton;
    PopupMenu: TPopupMenu;
    Aprovar1: TMenuItem;
    Reprovar1: TMenuItem;
    DBGridPrev: TJvDBGrid;
    DBGridOutras: TJvDBGrid;
    DBGridSolic: TJvDBGrid;
    procedure DBGridCorretDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Aprovar1Click(Sender: TObject);
    procedure Reprovar1Click(Sender: TObject);
    procedure DBGridCorretCellClick(Column: TColumn);
    procedure BtnFecharClick(Sender: TObject);
    procedure DBGridPrevCellClick(Column: TColumn);
    procedure DBGridSolicCellClick(Column: TColumn);
    procedure DBGridOutrasCellClick(Column: TColumn);
    procedure DBGridPrevDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridSolicDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridOutrasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PCOrdensServicoChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGridCorretKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridPrevKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridSolicKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridOutrasKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridPrevDblClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmTelaCadOrdemServicoGerenciaValidacoes: TFrmTelaCadOrdemServicoGerenciaValidacoes;

implementation

{$R *.dfm}

uses UnDM, UnTelaInspFechamento;


procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.Aprovar1Click(
  Sender: TObject);
var
  LUsuario, LPassword: String;
begin
  inherited;
  if PopupMenu.Tag = 1 then
  begin
    LPassword := '';

    case PCOrdensServico.ActivePageIndex of
      0: LUsuario :=  DBGridCorret.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
      1: LUsuario :=  DBGridPrev.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
      2: LUsuario :=  DBGridSolic.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
      3: LUsuario :=  DBGridOutras.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
    end;
    if LUsuario = '' then
    begin
      Application.MessageBox('Usuário não identificado!', 'SPMP3', MB_OK);
      Exit;
    end;

    LPassword := DM.PasswordInputBox('SPMP3','Digite sua senha:');
    if LPassword = '' then
    begin
      Application.MessageBox('Senha não informada!', 'SPMP3', MB_OK);
      Exit;
    end;

    DM.qryLogin.Close;
    DM.qryLogin.Params[0].AsString := LUsuario;
    DM.qryLogin.Open;
    if DM.qryLogin.IsEmpty = True then
    begin
      Application.MessageBox('Usuário não identificado!', 'SPMP3', MB_OK);
      Exit;
    end else
    if (DM.Crypt('D', DM.qryLoginSENHA.AsString)) <> LPassword then
    begin
      Application.MessageBox('Senha incorreta!', 'SPMP3', MB_OK);
      Exit;
    end else
    begin
      DM.qryOrdemServicoGerencia.Edit;
      DM.qryOrdemServicoGerenciaSTATUS1.AsInteger := 2;
      DM.qryOrdemServicoGerencia.Post;
    end;
  end else
  if PopupMenu.Tag = 2 then
  begin
    LPassword := '';

    case PCOrdensServico.ActivePageIndex of
      0: LUsuario :=  DBGridCorret.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
      1: LUsuario :=  DBGridPrev.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
      2: LUsuario :=  DBGridSolic.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
      3: LUsuario :=  DBGridOutras.DataSource.DataSet.FieldByName('LOGINRESP').AsString;
    end;
    if LUsuario = '' then
    begin
      Application.MessageBox('Usuário não identificado!', 'SPMP3', MB_OK);
      Exit;
    end;

    LPassword := DM.PasswordInputBox('SPMP3','Digite sua senha:');
    if LPassword = '' then
    begin
      Application.MessageBox('Senha não informada!', 'SPMP3', MB_OK);
      Exit;
    end;

    DM.qryLogin.Close;
    DM.qryLogin.Params[0].AsString := LUsuario;
    DM.qryLogin.Open;
    if DM.qryLogin.IsEmpty = True then
    begin
      Application.MessageBox('Usuário não identificado!', 'SPMP3', MB_OK);
      Exit;
    end else
    if (DM.Crypt('D', DM.qryLoginSENHA.AsString)) <> LPassword then
    begin
      Application.MessageBox('Senha incorreta!', 'SPMP3', MB_OK);
      Exit;
    end else
    begin
      DM.qryOrdemServicoGerencia.Edit;
      DM.qryOrdemServicoGerenciaSTATUS2.AsInteger := 2;
      DM.qryOrdemServicoGerencia.Post;
    end;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.BtnConsultarClick(
  Sender: TObject);
begin
  inherited;
if EdtData1.Date > EdtData2.Date then
  EdtData2.Date := EdtData1.Date;
DM.qryOrdemServicoGerencia.Close;
DM.qryOrdemServicoGerencia.Params[0].AsString := DM.FCodEmpresa;
DM.qryOrdemServicoGerencia.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
DM.qryOrdemServicoGerencia.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
DM.qryOrdemServicoGerencia.Open;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.BtnFecharClick(
  Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridCorretCellClick(
  Column: TColumn);
begin
  inherited;
  if (Column.FieldName = 'STATUS1') then
  begin
    PopupMenu.Tag := 1;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end else
  if (Column.FieldName = 'STATUS2') then
  begin
    PopupMenu.Tag := 2;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridCorretDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'ORIGEM') then
  begin
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Autônoma' then
    begin
      DBGridCorret.Canvas.Brush.Color := $00CACACA;
      DBGridCorret.Canvas.Font.Color := $00CACACA;
    end else
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Corretiva' then
    begin
      DBGridCorret.Canvas.Brush.Color := clRed;
      DBGridCorret.Canvas.Font.Color := clRed;
    end else
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preventiva' then
    begin
      DBGridCorret.Canvas.Brush.Color := clBlue;
      DBGridCorret.Canvas.Font.Color := clBlue;
    end else
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preditiva' then
    begin
      DBGridCorret.Canvas.Brush.Color := $00BFFF;
      DBGridCorret.Canvas.Font.Color := $00BFFF;
    end else
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Lubrificação' then
    begin
      DBGridCorret.Canvas.Brush.Color := $AA520;
      DBGridCorret.Canvas.Font.Color := $AA520;
    end else
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Novos Projetos' then
    begin
      DBGridCorret.Canvas.Brush.Color := $B0082;
      DBGridCorret.Canvas.Font.Color := $B0082;
    end else
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Alterações de Projetos' then
    begin
      DBGridCorret.Canvas.Brush.Color := $008D55C6;
      DBGridCorret.Canvas.Font.Color := $008D55C6;
    end else
    if DBGridCorret.DataSource.DataSet.FieldByName('TIPO').AsString = 'Outros Serviços' then
    begin
      DBGridCorret.Canvas.Brush.Color := $007A7A7A;
      DBGridCorret.Canvas.Font.Color := $007A7A7A;
    end else
    begin
      DBGridCorret.Canvas.Brush.Color := $0093EEF0;
      DBGridCorret.Canvas.Font.Color := $0093EEF0;
    end;
  end;

  DBGridCorret.Canvas.FillRect(Rect);
  DBGridCorret.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridCorret.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridCorret.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridCorret.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;

  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridCorret.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridCorret.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridCorret.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridCorretKeyPress(
  Sender: TObject; var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (DBGridCorret.SelectedIndex = 1) then
    begin
      LCampo := DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
      if LCampo <> EmptyStr then
        begin
          if DBGridCorret.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
            Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
        end;
    end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridOutrasCellClick(
  Column: TColumn);
begin
  inherited;
  if (Column.FieldName = 'STATUS1') then
  begin
    PopupMenu.Tag := 1;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end else
  if (Column.FieldName = 'STATUS2') then
  begin
    PopupMenu.Tag := 2;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridOutrasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'ORIGEM') then
  begin
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Autônoma' then
    begin
      DBGridOutras.Canvas.Brush.Color := $00CACACA;
      DBGridOutras.Canvas.Font.Color := $00CACACA;
    end else
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Corretiva' then
    begin
      DBGridOutras.Canvas.Brush.Color := clRed;
      DBGridOutras.Canvas.Font.Color := clRed;
    end else
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preventiva' then
    begin
      DBGridOutras.Canvas.Brush.Color := clBlue;
      DBGridOutras.Canvas.Font.Color := clBlue;
    end else
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preditiva' then
    begin
      DBGridOutras.Canvas.Brush.Color := $00BFFF;
      DBGridOutras.Canvas.Font.Color := $00BFFF;
    end else
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Lubrificação' then
    begin
      DBGridOutras.Canvas.Brush.Color := $AA520;
      DBGridOutras.Canvas.Font.Color := $AA520;
    end else
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Novos Projetos' then
    begin
      DBGridOutras.Canvas.Brush.Color := $B0082;
      DBGridOutras.Canvas.Font.Color := $B0082;
    end else
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Alterações de Projetos' then
    begin
      DBGridOutras.Canvas.Brush.Color := $008D55C6;
      DBGridOutras.Canvas.Font.Color := $008D55C6;
    end else
    if DBGridOutras.DataSource.DataSet.FieldByName('TIPO').AsString = 'Outros Serviços' then
    begin
      DBGridOutras.Canvas.Brush.Color := $007A7A7A;
      DBGridOutras.Canvas.Font.Color := $007A7A7A;
    end else
    begin
      DBGridOutras.Canvas.Brush.Color := $0093EEF0;
      DBGridOutras.Canvas.Font.Color := $0093EEF0;
    end;
  end;

  DBGridOutras.Canvas.FillRect(Rect);
  DBGridOutras.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridOutras.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridOutras.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridOutras.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;

  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridOutras.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridOutras.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridOutras.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;

end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridOutrasKeyPress(
  Sender: TObject; var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (DBGridOutras.SelectedIndex = 1) then
    begin
      LCampo := DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
      if LCampo <> EmptyStr then
        begin
          if DBGridOutras.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
            Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
        end;
    end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridPrevCellClick(
  Column: TColumn);
begin
  inherited;
  if (Column.FieldName = 'STATUS1') then
  begin
    PopupMenu.Tag := 1;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end else
  if (Column.FieldName = 'STATUS2') then
  begin
    PopupMenu.Tag := 2;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridPrevDblClick(
  Sender: TObject);
begin
  inherited;
  if DBGridPrev.DataSource.DataSet.FieldByName('CODMANUTPROGEQUIP').AsString <> '' then
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFECHAMANUT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
        begin
          Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;
      Application.CreateForm(TFrmTelaInspFechamento, FrmTelaInspFechamento);
      if DM.qryManutPeriodicas.Active = True then
      begin
        if DM.qryManutPeriodicas.IsEmpty = False then
        begin
          DM.qryManutPeriodicas.Locate('CODORDEMSERVICO', DBGridPrev.DataSource.DataSet.FieldByName('CODIGO').AsString, []);
        end;
      end;
      FrmTelaInspFechamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaInspFechamento);
    End;
  end else
  if DBGridPrev.DataSource.DataSet.FieldByName('CODLUBRIFICPROGEQUIP').AsString <> '' then
  begin
    Try
      if (DM.qryUsuarioPAcessoCADFECHAMANUT.AsString <> 'S') and (LowerCase(DM.FNomeUsuario) <> 'sam_spmp') then
        begin
          Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;
      Application.CreateForm(TFrmTelaInspFechamento, FrmTelaInspFechamento);
      if DM.qryLubrificPeriodicas.Active = True then
      begin
        if DM.qryLubrificPeriodicas.IsEmpty = False then
        begin
          DM.qryLubrificPeriodicas.Locate('CODORDEMSERVICO', DBGridPrev.DataSource.DataSet.FieldByName('CODIGO').AsString, []);
        end;
      end;
      FrmTelaInspFechamento.PCInspecoes.ActivePageIndex := 1;
      FrmTelaInspFechamento.ShowModal;
    Finally
      FreeAndNil(FrmTelaInspFechamento);
    End;
  end else
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridPrevDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'ORIGEM') then
  begin
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Autônoma' then
    begin
      DBGridPrev.Canvas.Brush.Color := $00CACACA;
      DBGridPrev.Canvas.Font.Color := $00CACACA;
    end else
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Corretiva' then
    begin
      DBGridPrev.Canvas.Brush.Color := clRed;
      DBGridPrev.Canvas.Font.Color := clRed;
    end else
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preventiva' then
    begin
      DBGridPrev.Canvas.Brush.Color := clBlue;
      DBGridPrev.Canvas.Font.Color := clBlue;
    end else
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preditiva' then
    begin
      DBGridPrev.Canvas.Brush.Color := $00BFFF;
      DBGridPrev.Canvas.Font.Color := $00BFFF;
    end else
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Lubrificação' then
    begin
      DBGridPrev.Canvas.Brush.Color := $AA520;
      DBGridPrev.Canvas.Font.Color := $AA520;
    end else
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Novos Projetos' then
    begin
      DBGridPrev.Canvas.Brush.Color := $B0082;
      DBGridPrev.Canvas.Font.Color := $B0082;
    end else
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Alterações de Projetos' then
    begin
      DBGridPrev.Canvas.Brush.Color := $008D55C6;
      DBGridPrev.Canvas.Font.Color := $008D55C6;
    end else
    if DBGridPrev.DataSource.DataSet.FieldByName('TIPO').AsString = 'Outros Serviços' then
    begin
      DBGridPrev.Canvas.Brush.Color := $007A7A7A;
      DBGridPrev.Canvas.Font.Color := $007A7A7A;
    end else
    begin
      DBGridPrev.Canvas.Brush.Color := $0093EEF0;
      DBGridPrev.Canvas.Font.Color := $0093EEF0;
    end;
  end;

  DBGridPrev.Canvas.FillRect(Rect);
  DBGridPrev.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridPrev.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridPrev.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridPrev.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;

  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridPrev.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridPrev.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridPrev.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;

end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridPrevKeyPress(
  Sender: TObject; var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (DBGridPrev.SelectedIndex = 1) then
    begin
      LCampo := DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
      if LCampo <> EmptyStr then
        begin
          if DBGridPrev.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
            Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
        end;
    end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridSolicCellClick(
  Column: TColumn);
begin
  inherited;
  if (Column.FieldName = 'STATUS1') then
  begin
    PopupMenu.Tag := 1;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end else
  if (Column.FieldName = 'STATUS2') then
  begin
    PopupMenu.Tag := 2;
    PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridSolicDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Column.Field.FieldName = 'ORIGEM') then
  begin
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Autônoma' then
    begin
      DBGridSolic.Canvas.Brush.Color := $00CACACA;
      DBGridSolic.Canvas.Font.Color := $00CACACA;
    end else
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Corretiva' then
    begin
      DBGridSolic.Canvas.Brush.Color := clRed;
      DBGridSolic.Canvas.Font.Color := clRed;
    end else
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preventiva' then
    begin
      DBGridSolic.Canvas.Brush.Color := clBlue;
      DBGridSolic.Canvas.Font.Color := clBlue;
    end else
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Manutenção Preditiva' then
    begin
      DBGridSolic.Canvas.Brush.Color := $00BFFF;
      DBGridSolic.Canvas.Font.Color := $00BFFF;
    end else
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Lubrificação' then
    begin
      DBGridSolic.Canvas.Brush.Color := $AA520;
      DBGridSolic.Canvas.Font.Color := $AA520;
    end else
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Novos Projetos' then
    begin
      DBGridSolic.Canvas.Brush.Color := $B0082;
      DBGridSolic.Canvas.Font.Color := $B0082;
    end else
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Alterações de Projetos' then
    begin
      DBGridSolic.Canvas.Brush.Color := $008D55C6;
      DBGridSolic.Canvas.Font.Color := $008D55C6;
    end else
    if DBGridSolic.DataSource.DataSet.FieldByName('TIPO').AsString = 'Outros Serviços' then
    begin
      DBGridSolic.Canvas.Brush.Color := $007A7A7A;
      DBGridSolic.Canvas.Font.Color := $007A7A7A;
    end else
    begin
      DBGridSolic.Canvas.Brush.Color := $0093EEF0;
      DBGridSolic.Canvas.Font.Color := $0093EEF0;
    end;
  end;

  DBGridSolic.Canvas.FillRect(Rect);
  DBGridSolic.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridSolic.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridSolic.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS1') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridSolic.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;

  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '0') then
  begin
    DBGridSolic.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 0, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '1') then
  begin
    DBGridSolic.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 1, True);
  end;
  if (Trim(Column.Field.FieldName) = 'STATUS2') and (Trim(Column.Field.AsString) = '2') then
  begin
    DBGridSolic.Canvas.FillRect(Rect);
    VirtualImageList1.Draw(TDBGrid(Sender).Canvas, (Rect.Left + Round(Rect.Width/2)) - 10, Rect.Top, 2, True);
  end;

end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.DBGridSolicKeyPress(
  Sender: TObject; var Key: Char);
var
  LCampo : String;
begin
  inherited;
  if (Key = #13) and (DBGridSolic.SelectedIndex = 1) then
    begin
      LCampo := DM.CampoInputBox('SPMP3', 'Informe o código da ordem de serviço:');
      if LCampo <> EmptyStr then
        begin
          if DBGridSolic.DataSource.DataSet.Locate('CODIGO', LCampo, [loPartialKey, loCaseInsensitive]) = False then
            Application.MessageBox('Ordem de serviço não localizada.','SPMP', MB_OK + MB_ICONINFORMATION);
        end;
    end;

end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DM.qryOrdemServicoGerencia.Close;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.FormResize(Sender: TObject);
begin
  inherited;
  BtnFechar.Left := (PBotoes.Width - BtnFechar.Width) div 2;
  BtnFechar.Top := ((PBotoes.Height - BtnFechar.Height) div 2);
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.FormShow(Sender: TObject);
begin
  inherited;
  if (DM.qryUsuarioPAcessoCADORDEMSERVICO.AsString = 'S') or (DM.FNomeUsuario = 'sam_spmp') then
    begin
      EdtData1.Date := IncMonth(DateOf(DM.FDataHoraServidor), -1);
      EdtData2.Date := DateOf(DM.FDataHoraServidor);

      DM.qryOrdemServicoGerencia.Close;
      DM.qryOrdemServicoGerencia.Params[0].AsString := DM.FCodEmpresa;
      DM.qryOrdemServicoGerencia.Params[1].AsString := FormatDateTime('yyyy/mm/dd', EdtData1.Date) + ' 00:00:00';
      DM.qryOrdemServicoGerencia.Params[2].AsString := FormatDateTime('yyyy/mm/dd', EdtData2.Date) + ' 23:59:59';
      DM.qryOrdemServicoGerencia.Open;

      DM.qryOrdemServicoGerencia.Filter := 'SITUACAO = ''LIBERADA'' AND TIPO = ''Manutenção Corretiva''';
      DM.qryOrdemServicoGerencia.Filtered := True;
    end
  else
    begin
      Application.MessageBox('Acesso não permitido, contacte o setor responsável para solicitar a liberação', 'SPMP3', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.PCOrdensServicoChange(
  Sender: TObject);
begin
  inherited;
  case PCOrdensServico.ActivePageIndex of
    0:
      begin
        DM.qryOrdemServicoGerencia.Filter := 'SITUACAO = ''LIBERADA'' AND TIPO = ''Manutenção Corretiva''';
        DM.qryOrdemServicoGerencia.Filtered := True;
      end;
    1:
      begin
        DM.qryOrdemServicoGerencia.Filter := 'SITUACAO = ''LIBERADA'' AND TIPO = ''Manutenção Preventiva''';
        DM.qryOrdemServicoGerencia.Filtered := True;
      end;
    2:
      begin
        DM.qryOrdemServicoGerencia.Filter := 'SITUACAO = ''LIBERADA'' AND SOLICTRAB = ''S''';
        DM.qryOrdemServicoGerencia.Filtered := True;
      end;
    3:
      begin
        DM.qryOrdemServicoGerencia.Filter := 'SITUACAO = ''LIBERADA'' AND TIPO <> ''Manutenção Corretiva'' AND TIPO <> ''Manutenção Preventiva'' AND SOLICTRAB <> ''S''';
        DM.qryOrdemServicoGerencia.Filtered := True;
      end;
  end;
end;

procedure TFrmTelaCadOrdemServicoGerenciaValidacoes.Reprovar1Click(
  Sender: TObject);
var
  LUsuario, LPassword: String;
begin
  inherited;
  if PopupMenu.Tag = 1 then
  begin
    LUsuario  := '';
    LPassword := '';
    LUsuario := DM.qryOrdemServicoGerenciaLOGINRESP.AsString;
    LPassword := DM.PasswordInputBox('SPMP3','Digite sua senha:');

    if LUsuario = '' then Exit;
    if LPassword = '' then Exit;

    DM.qryLogin.Close;
    DM.qryLogin.Params[0].AsString := LUsuario;
    DM.qryLogin.Open;
    if DM.qryLogin.IsEmpty = True then
    begin
      Application.MessageBox('Usuário não identificado!', 'SPMP3', MB_OK);
      Exit;
    end else
    if (DM.Crypt('D', DM.qryLoginSENHA.AsString)) <> DM.FPassword then
    begin
      Application.MessageBox('Senha incorreta!', 'SPMP3', MB_OK);
      Exit;
    end else
    begin
      DM.qryOrdemServicoGerencia.Edit;
      DM.qryOrdemServicoGerenciaSTATUS1.AsInteger := 1;
      DM.qryOrdemServicoGerencia.Post;
    end
  end else
  if PopupMenu.Tag = 2 then
  begin
    LUsuario  := '';
    LPassword := '';
    LUsuario := DM.qryOrdemServicoGerenciaLOGINSOLIC.AsString;
    LPassword := DM.PasswordInputBox('SPMP3','Digite sua senha:');

    if LUsuario = '' then Exit;
    if LPassword = '' then Exit;

    DM.qryLogin.Close;
    DM.qryLogin.Params[0].AsString := LUsuario;
    DM.qryLogin.Open;
    if DM.qryLogin.IsEmpty = True then
    begin
      Application.MessageBox('Usuário não identificado!', 'SPMP3', MB_OK);
      Exit;
    end else
    if (DM.Crypt('D', DM.qryLoginSENHA.AsString)) = DM.FPassword then
    begin
      Application.MessageBox('Senha incorreta!', 'SPMP3', MB_OK);
      Exit;
    end else
    begin
      DM.qryOrdemServicoGerencia.Edit;
      DM.qryOrdemServicoGerenciaSTATUS2.AsInteger := 1;
      DM.qryOrdemServicoGerencia.Post;
    end;
  end;
end;

end.

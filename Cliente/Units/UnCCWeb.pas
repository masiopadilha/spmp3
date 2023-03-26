//
// Created by the DataSnap proxy generator.
// 10/12/2021 13:46:28
//

unit UnCCWeb;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type
  TSMClient = class(TDSAdminClient)
  private
    FFDConnSPMP3BeforeConnectCommand: TDBXCommand;
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FCryptCommand: TDBXCommand;
    FDataHoraServidorCommand: TDBXCommand;
    FLoginUsuarioCommand: TDBXCommand;
    FRetornaProximoIndiceCommand: TDBXCommand;
    FGerarOSCommand: TDBXCommand;
    FRegistrarMovimentacaoCommand: TDBXCommand;
    FHistoricoInspecoesCommand: TDBXCommand;
    FGetDadosTabelaCommand: TDBXCommand;
    FApplyUpdatesTabelaCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure FDConnSPMP3BeforeConnect(Sender: TObject);
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Crypt(Action: string; Src: string): string;
    function DataHoraServidor: TDateTime;
    function LoginUsuario(login: string; password: string): SmallInt;
    function RetornaProximoIndice(Tabela: string): Integer;
    function GerarOS(CodUsuario: string; CodEmpresa: string; Descricao: string; CodEquip: string; Manutencao: string; Lubrificacao: string; Rota: string; SolicTrab: string; Matricula: string; Prioridade: string; Criticidade: string): Integer;
    procedure RegistrarMovimentacao(Operacao: string; CodEmpresa: string; CodUsuario: string; Modulo: string; Estacao: string);
    procedure HistoricoInspecoes(Tipo: SmallInt; CodEmpresa: string; CodEquip: string; Codigo: string; CodOrdemServico: Integer);
    function GetDadosTabela(ATabela: string; ASQL: string; AParam1: string; AParam2: string; AParam3: string; AParam4: string; AParam5: string): TFDJSONDataSets;
    function ApplyUpdatesTabela(ATabela: string; ADeltaList: TFDJSONDeltas): Boolean;
  end;

implementation

procedure TSMClient.FDConnSPMP3BeforeConnect(Sender: TObject);
begin
  if FFDConnSPMP3BeforeConnectCommand = nil then
  begin
    FFDConnSPMP3BeforeConnectCommand := FDBXConnection.CreateCommand;
    FFDConnSPMP3BeforeConnectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFDConnSPMP3BeforeConnectCommand.Text := 'TSM.FDConnSPMP3BeforeConnect';
    FFDConnSPMP3BeforeConnectCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FFDConnSPMP3BeforeConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FFDConnSPMP3BeforeConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnSPMP3BeforeConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FFDConnSPMP3BeforeConnectCommand.ExecuteUpdate;
end;

function TSMClient.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TSM.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TSM.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.Crypt(Action: string; Src: string): string;
begin
  if FCryptCommand = nil then
  begin
    FCryptCommand := FDBXConnection.CreateCommand;
    FCryptCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCryptCommand.Text := 'TSM.Crypt';
    FCryptCommand.Prepare;
  end;
  FCryptCommand.Parameters[0].Value.SetWideString(Action);
  FCryptCommand.Parameters[1].Value.SetWideString(Src);
  FCryptCommand.ExecuteUpdate;
  Result := FCryptCommand.Parameters[2].Value.GetWideString;
end;

function TSMClient.DataHoraServidor: TDateTime;
begin
  if FDataHoraServidorCommand = nil then
  begin
    FDataHoraServidorCommand := FDBXConnection.CreateCommand;
    FDataHoraServidorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDataHoraServidorCommand.Text := 'TSM.DataHoraServidor';
    FDataHoraServidorCommand.Prepare;
  end;
  FDataHoraServidorCommand.ExecuteUpdate;
  Result := FDataHoraServidorCommand.Parameters[0].Value.AsDateTime;
end;

function TSMClient.LoginUsuario(login: string; password: string): SmallInt;
begin
  if FLoginUsuarioCommand = nil then
  begin
    FLoginUsuarioCommand := FDBXConnection.CreateCommand;
    FLoginUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLoginUsuarioCommand.Text := 'TSM.LoginUsuario';
    FLoginUsuarioCommand.Prepare;
  end;
  FLoginUsuarioCommand.Parameters[0].Value.SetWideString(login);
  FLoginUsuarioCommand.Parameters[1].Value.SetWideString(password);
  FLoginUsuarioCommand.ExecuteUpdate;
  Result := FLoginUsuarioCommand.Parameters[2].Value.GetInt16;
end;

function TSMClient.RetornaProximoIndice(Tabela: string): Integer;
begin
  if FRetornaProximoIndiceCommand = nil then
  begin
    FRetornaProximoIndiceCommand := FDBXConnection.CreateCommand;
    FRetornaProximoIndiceCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaProximoIndiceCommand.Text := 'TSM.RetornaProximoIndice';
    FRetornaProximoIndiceCommand.Prepare;
  end;
  FRetornaProximoIndiceCommand.Parameters[0].Value.SetWideString(Tabela);
  FRetornaProximoIndiceCommand.ExecuteUpdate;
  Result := FRetornaProximoIndiceCommand.Parameters[1].Value.GetInt32;
end;

function TSMClient.GerarOS(CodUsuario: string; CodEmpresa: string; Descricao: string; CodEquip: string; Manutencao: string; Lubrificacao: string; Rota: string; SolicTrab: string; Matricula: string; Prioridade: string; Criticidade: string): Integer;
begin
  if FGerarOSCommand = nil then
  begin
    FGerarOSCommand := FDBXConnection.CreateCommand;
    FGerarOSCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGerarOSCommand.Text := 'TSM.GerarOS';
    FGerarOSCommand.Prepare;
  end;
  FGerarOSCommand.Parameters[0].Value.SetWideString(CodUsuario);
  FGerarOSCommand.Parameters[1].Value.SetWideString(CodEmpresa);
  FGerarOSCommand.Parameters[2].Value.SetWideString(Descricao);
  FGerarOSCommand.Parameters[3].Value.SetWideString(CodEquip);
  FGerarOSCommand.Parameters[4].Value.SetWideString(Manutencao);
  FGerarOSCommand.Parameters[5].Value.SetWideString(Lubrificacao);
  FGerarOSCommand.Parameters[6].Value.SetWideString(Rota);
  FGerarOSCommand.Parameters[7].Value.SetWideString(SolicTrab);
  FGerarOSCommand.Parameters[8].Value.SetWideString(Matricula);
  FGerarOSCommand.Parameters[9].Value.SetWideString(Prioridade);
  FGerarOSCommand.Parameters[10].Value.SetWideString(Criticidade);
  FGerarOSCommand.ExecuteUpdate;
  Result := FGerarOSCommand.Parameters[11].Value.GetInt32;
end;

procedure TSMClient.RegistrarMovimentacao(Operacao: string; CodEmpresa: string; CodUsuario: string; Modulo: string; Estacao: string);
begin
  if FRegistrarMovimentacaoCommand = nil then
  begin
    FRegistrarMovimentacaoCommand := FDBXConnection.CreateCommand;
    FRegistrarMovimentacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRegistrarMovimentacaoCommand.Text := 'TSM.RegistrarMovimentacao';
    FRegistrarMovimentacaoCommand.Prepare;
  end;
  FRegistrarMovimentacaoCommand.Parameters[0].Value.SetWideString(Operacao);
  FRegistrarMovimentacaoCommand.Parameters[1].Value.SetWideString(CodEmpresa);
  FRegistrarMovimentacaoCommand.Parameters[2].Value.SetWideString(CodUsuario);
  FRegistrarMovimentacaoCommand.Parameters[3].Value.SetWideString(Modulo);
  FRegistrarMovimentacaoCommand.Parameters[4].Value.SetWideString(Estacao);
  FRegistrarMovimentacaoCommand.ExecuteUpdate;
end;

procedure TSMClient.HistoricoInspecoes(Tipo: SmallInt; CodEmpresa: string; CodEquip: string; Codigo: string; CodOrdemServico: Integer);
begin
  if FHistoricoInspecoesCommand = nil then
  begin
    FHistoricoInspecoesCommand := FDBXConnection.CreateCommand;
    FHistoricoInspecoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FHistoricoInspecoesCommand.Text := 'TSM.HistoricoInspecoes';
    FHistoricoInspecoesCommand.Prepare;
  end;
  FHistoricoInspecoesCommand.Parameters[0].Value.SetInt16(Tipo);
  FHistoricoInspecoesCommand.Parameters[1].Value.SetWideString(CodEmpresa);
  FHistoricoInspecoesCommand.Parameters[2].Value.SetWideString(CodEquip);
  FHistoricoInspecoesCommand.Parameters[3].Value.SetWideString(Codigo);
  FHistoricoInspecoesCommand.Parameters[4].Value.SetInt32(CodOrdemServico);
  FHistoricoInspecoesCommand.ExecuteUpdate;
end;

function TSMClient.GetDadosTabela(ATabela: string; ASQL: string; AParam1: string; AParam2: string; AParam3: string; AParam4: string; AParam5: string): TFDJSONDataSets;
begin
  if FGetDadosTabelaCommand = nil then
  begin
    FGetDadosTabelaCommand := FDBXConnection.CreateCommand;
    FGetDadosTabelaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDadosTabelaCommand.Text := 'TSM.GetDadosTabela';
    FGetDadosTabelaCommand.Prepare;
  end;
  FGetDadosTabelaCommand.Parameters[0].Value.SetWideString(ATabela);
  FGetDadosTabelaCommand.Parameters[1].Value.SetWideString(ASQL);
  FGetDadosTabelaCommand.Parameters[2].Value.SetWideString(AParam1);
  FGetDadosTabelaCommand.Parameters[3].Value.SetWideString(AParam2);
  FGetDadosTabelaCommand.Parameters[4].Value.SetWideString(AParam3);
  FGetDadosTabelaCommand.Parameters[5].Value.SetWideString(AParam4);
  FGetDadosTabelaCommand.Parameters[6].Value.SetWideString(AParam5);
  FGetDadosTabelaCommand.ExecuteUpdate;
  if not FGetDadosTabelaCommand.Parameters[7].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FGetDadosTabelaCommand.Parameters[7].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetDadosTabelaCommand.Parameters[7].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetDadosTabelaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.ApplyUpdatesTabela(ATabela: string; ADeltaList: TFDJSONDeltas): Boolean;
begin
  if FApplyUpdatesTabelaCommand = nil then
  begin
    FApplyUpdatesTabelaCommand := FDBXConnection.CreateCommand;
    FApplyUpdatesTabelaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FApplyUpdatesTabelaCommand.Text := 'TSM.ApplyUpdatesTabela';
    FApplyUpdatesTabelaCommand.Prepare;
  end;
  FApplyUpdatesTabelaCommand.Parameters[0].Value.SetWideString(ATabela);
  if not Assigned(ADeltaList) then
    FApplyUpdatesTabelaCommand.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FApplyUpdatesTabelaCommand.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyUpdatesTabelaCommand.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FApplyUpdatesTabelaCommand.ExecuteUpdate;
  Result := FApplyUpdatesTabelaCommand.Parameters[2].Value.GetBoolean;
end;

constructor TSMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMClient.Destroy;
begin
  FFDConnSPMP3BeforeConnectCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FCryptCommand.DisposeOf;
  FDataHoraServidorCommand.DisposeOf;
  FLoginUsuarioCommand.DisposeOf;
  FRetornaProximoIndiceCommand.DisposeOf;
  FGerarOSCommand.DisposeOf;
  FRegistrarMovimentacaoCommand.DisposeOf;
  FHistoricoInspecoesCommand.DisposeOf;
  FGetDadosTabelaCommand.DisposeOf;
  FApplyUpdatesTabelaCommand.DisposeOf;
  inherited;
end;

end.


unit uEndereco;

interface

uses
  System.JSON, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client, System.Classes,
  REST.Client, IPPeerClient, System.SysUtils, uUtils;

  type
  TEndereco = class
    private
      FCEP        : String;
      FLogradouro : String;
      FBairro     : String;
      FCidade     : String;
      FEstado     : String;
      FPais       : String;

      procedure SetBairro(const Value: String);
      procedure SetCEP(const Value: String);
      procedure SetCidade(const Value: String);
      procedure SetEstado(const Value: String);
      procedure SetLogradouro(const Value: String);
      procedure SetPais(const Value: String);

    public
      property CEP        : String read FCEP write SetCEP;
      property Logradouro : String read FLogradouro write SetLogradouro;
      property Bairro     : String read FBairro write SetBairro;
      property Cidade     : String read FCidade write SetCidade;
      property Estado     : String read FEstado write SetEstado;
      property Pais       : String read FPais write SetPais;

      constructor Create;
      function GetCEP : Boolean;
  end;

implementation

{ TEndereco }

function TEndereco.GetCEP : Boolean;
var
  LJSON         : TJSONObject;
  LRESTClient   : TRESTClient;
  LRESTRequest  : TRESTRequest;
  LRESTResponse : TRESTResponse;
           LCEP : String;
            LSO : TSO;
           LMSG : TMSG;
           LVLD : TValid;
begin
  Result := False;
  LSO    := TSO.Create;
  LMSG   := TMSG.Create;
  LVLD   := TValid.Create;
  try
    if LVLD.ValidField(LVLD.CEP(FCEP), 'CEP inválido') = False then Exit;
    if LVLD.ValidField(LSO.InternetConnected, 'SEM CONEXÃO COM INTERNET!') = False then Exit;
  finally
    LSO.Free;
    LVLD.Free;
  end;

  try
    LRESTClient := TRESTClient.Create(nil);
    LRESTRequest := TRESTRequest.Create(nil);
    LRESTResponse := TRESTResponse.Create(nil);
    LRESTRequest.Client := LRESTClient;
    LRESTRequest.Response := LRESTResponse;
    LCEP := StringReplace(FCEP, '-', '', [rfReplaceAll]);
    LRESTClient.BaseURL := 'https://viacep.com.br/ws/' + LCEP + '/json';
    LRESTRequest.Execute;
    LJSON := LRESTResponse.JSONValue as TJSONObject;

    try
      if Assigned(LJSON) then
      begin
        FLogradouro := LJSON.Values['logradouro'].Value;
        FBairro     := LJSON.Values['bairro'].Value;
        FEstado     := LJSON.Values['uf'].Value;
        FCidade     := LJSON.Values['localidade'].Value;
        FPais       := 'BRASIL'; //A consulta não retorna o pais
      end;
    finally
      FreeAndNil(LJSON);
      FreeAndNil(LMSG);
    end;
  except
    LMSG.MsgBoxAlert('CEP inválido ou não encontrado');
  end;
  Result := True;
end;

constructor TEndereco.Create;
begin
  FCEP        := '';
  FLogradouro := '';
  FBairro     := '';
  FCidade     := '';
  FEstado     := '';
  FPais       := '';
end;

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TEndereco.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TEndereco.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetPais(const Value: String);
begin
  FPais := Value;
end;

end.

unit uConsultaCep;

interface

uses
  System.JSON, uConsultaCep.Interfaces;

type
  TViaCepService = class(TInterfacedObject, ICepService)
  public
    function GetCepInfo(const pCEP: string): TJSONObject;
  end;

  TApiCepService  = class(TInterfacedObject, ICepService)
  public
    function GetCepInfo(const pCEP: string): TJSONObject;
  end;

  TAwesomeApiService  = class(TInterfacedObject, ICepService)
  public
    function GetCepInfo(const pCEP: string): TJSONObject;
  end;

implementation

uses
  IdHTTP, IdSSLOpenSSL, SysUtils;

{ TViaCepService }

function TViaCepService.GetCepInfo(const pCEP: string): TJSONObject;
var
  lHTTP: TIdHTTP;
  lSSL: TIdSSLIOHandlerSocketOpenSSL;
  lResponse: string;
begin
  lHTTP := TIdHTTP.Create(nil);
  lSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    lHTTP.IOHandler := lSSL;
    lResponse := lHTTP.Get('https://viacep.com.br/ws/' + pCEP + '/json/');
    Result := TJSONObject.ParseJSONValue(lResponse) as TJSONObject;
  finally
    lSSL.Free;
    lHTTP.Free;
  end;

end;

{ TApiCepService }

function TApiCepService.GetCepInfo(const pCEP: string): TJSONObject;
var
  lHTTP: TIdHTTP;
  lSSL: TIdSSLIOHandlerSocketOpenSSL;
  lResponse: string;
begin
  lHTTP := TIdHTTP.Create(nil);
  lSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    lHTTP.IOHandler := lSSL;
    lResponse := lHTTP.Get('https://apicep.com/api/cep/' + pCEP + '/json/');
    Result := TJSONObject.ParseJSONValue(lResponse) as TJSONObject;
  finally
    lSSL.Free;
    lHTTP.Free;
  end;

end;

{ TAwesomeApiService }

function TAwesomeApiService.GetCepInfo(const pCEP: string): TJSONObject;
var
  lHTTP: TIdHTTP;
  lSSL: TIdSSLIOHandlerSocketOpenSSL;
  lResponse: string;
begin
  lHTTP := TIdHTTP.Create(nil);
  lSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    lHTTP.IOHandler := lSSL;
    lResponse := lHTTP.Get('https://cep.awesomeapi.com.br/json/' + pCEP );
    Result := TJSONObject.ParseJSONValue(lResponse) as TJSONObject;
  finally
    lSSL.Free;
    lHTTP.Free;
  end;

end;

end.

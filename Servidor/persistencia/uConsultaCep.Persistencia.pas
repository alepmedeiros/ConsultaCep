unit uConsultaCep.Persistencia;

interface

uses
  FireDAC.Comp.Client, System.JSON;

type
  TCepRepository = class
  constructor Create(pConnection: TFDConnection);
  private
    FConnection: TFDConnection;
  public
    procedure SaveCepInfo(const pCepData: TJSONObject);
  end;

implementation

constructor TCepRepository.Create(pConnection: TFDConnection);
begin
  FConnection := pConnection;
end;

procedure TCepRepository.SaveCepInfo(const pCepData: TJSONObject);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FConnection;
    lQuery.SQL.Text := 'INSERT INTO cep_info (cep, logradouro, complemento, bairro, localidade, uf, ibge, gia, ddd, siafi) ' +
                      'VALUES (:cep, :logradouro, :complemento, :bairro, :localidade, :uf, :ibge, :gia, :ddd, :siafi)';
    lQuery.ParamByName('cep').AsString         := pCepData.GetValue('cep').Value;
    lQuery.ParamByName('logradouro').AsString  := pCepData.GetValue('logradouro').Value;
    lQuery.ParamByName('complemento').AsString := pCepData.GetValue('complemento').Value;
    lQuery.ParamByName('bairro').AsString      := pCepData.GetValue('bairro').Value;
    lQuery.ParamByName('localidade').AsString  := pCepData.GetValue('localidade').Value;
    lQuery.ParamByName('uf').AsString          := pCepData.GetValue('uf').Value;
    lQuery.ParamByName('ibge').AsString        := pCepData.GetValue('ibge').Value;
    lQuery.ParamByName('gia').AsString         := pCepData.GetValue('gia').Value;
    lQuery.ParamByName('ddd').AsString         := pCepData.GetValue('ddd').Value;
    lQuery.ParamByName('siafi').AsString       := pCepData.GetValue('siafi').Value;
    lQuery.ExecSQL;
  finally
    lQuery.Free;
  end;
end;

end.

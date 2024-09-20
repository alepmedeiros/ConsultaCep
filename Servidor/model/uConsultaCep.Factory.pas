unit uConsultaCep.Factory;

interface

uses
  ICepService;

type
  TCepServiceFactory = class
  public
    class function CreatePrimaryService   : ICepService;
    class function CreateSecondaryService : ICepService;
    class function CreateTertiaryService  : ICepService;
  end;

implementation

uses
  ViaCepService, ApiCepService, AwesomeApiService;

class function TCepServiceFactory.CreatePrimaryService: ICepService;
begin
  Result := TViaCepService.Create;
end;

class function TCepServiceFactory.CreateSecondaryService: ICepService;
begin
  Result := TApiCepService.Create;
end;

class function TCepServiceFactory.CreateTertiaryService: ICepService;
begin
  Result := TAwesomeApiService.Create;
end;


end.

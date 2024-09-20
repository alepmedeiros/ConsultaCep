unit uConsultaCep.FallBack;

interface

uses
  SysUtils,
  System.JSON, uConsultaCep.Interfaces;

type
  TCepService = class(TInterfacedObject, ICepService)
  constructor Create(pPrimary, pSecondary, pTertiary: ICepService);
  private
    FPrimaryService: ICepService;
    FSecondaryService: ICepService;
    FTertiaryService: ICepService;
  public
    function GetCepInfo(const pCEP: string): TJSONObject;
  end;

implementation


constructor TCepService.Create(pPrimary, pSecondary, pTertiary: ICepService);
begin
  FPrimaryService   := pPrimary;
  FSecondaryService := pSecondary;
  FTertiaryService  := pTertiary;
end;

function TCepService.GetCepInfo(const pCEP: string): TJSONObject;
begin
  try
    Result := FPrimaryService.GetCepInfo(pCEP);
  except
    try
      Result := FSecondaryService.GetCepInfo(pCEP);
    except
      try
        Result := FTertiaryService.GetCepInfo(pCEP);
      except
        raise Exception.Create('Erro: não foi possível consultar nenhum serviço de CEP.');
      end;
    end;
  end;

end;

end.

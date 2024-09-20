unit uConsultaCep.Interfaces;

interface

uses
  System.JSON;

type
  iCepService = interface
    ['{F8E39E9B-D349-49F2-9291-CEB8B5B31C90}']
    function GetCepInfo(const pCEP: string): TJSONObject;
  end;


implementation

end.

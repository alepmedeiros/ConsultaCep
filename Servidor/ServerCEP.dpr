program ServerCEP;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uConsultaCep.Interfaces in 'model\uConsultaCep.Interfaces.pas',
  uConsultaCep in 'model\uConsultaCep.pas',
  uConsultaCep.FallBack in 'model\uConsultaCep.FallBack.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

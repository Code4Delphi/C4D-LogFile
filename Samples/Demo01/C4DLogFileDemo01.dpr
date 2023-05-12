program C4DLogFileDemo01;

uses
  Vcl.Forms,
  C4D.LogFileDemo01.View.Main in 'Src\View\C4D.LogFileDemo01.View.Main.pas' {C4DLogFileDemo01ViewMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TC4DLogFileDemo01ViewMain, C4DLogFileDemo01ViewMain);
  Application.Run;
end.

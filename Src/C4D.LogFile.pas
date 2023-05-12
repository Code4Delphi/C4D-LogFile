unit C4D.LogFile;

interface

uses
  System.SysUtils,
  System.IOUtils;

type
  TC4DLogFile = class
  private
    FDir: String;
    constructor Create;
  public
    function SetDir(const ADir: String): TC4DLogFile;
    function GetDir: String;
    function AddLog(const AStrLog: String): TC4DLogFile;
  end;

function C4DLogFile: TC4DLogFile;

implementation

uses
  C4D.LogFile.Utils;

var
  FInstance: TC4DLogFile;

function C4DLogFile: TC4DLogFile;
begin
   if(not Assigned(FInstance))then
     FInstance := TC4DLogFile.Create;
   Result := FInstance;
end;

constructor TC4DLogFile.Create;
begin
   FDir := ''; //ExtractFileDir(ParamStr(0)) + '\Log\';
end;

function TC4DLogFile.SetDir(const ADir: String): TC4DLogFile;
begin
   Result := Self;
   if not DirectoryExists(ADir)then
     CreateDir(ADir);
   FDir := ADir;
end;
function TC4DLogFile.GetDir: String;
begin
   Result := FDir;
end;

function TC4DLogFile.AddLog(const AStrLog: String): TC4DLogFile;
var
 LFilename: String;
 LTextFile: TextFile;
 LStrLog: String;
begin
   Result := Self;
   if(FDir.Trim.IsEmpty)then
     raise Exception.Create('Diretório para geração do log não informado');

   LFilename := TPath.Combine(FDir, 'log_' + FormatDateTime('yyyy-mm-dd', Now()) + '.log');
   LStrLog   := '[' + DateTimeToStr(Now) + '] ' + AStrLog;
   LStrLog   := TC4DLogFileUtils.RemoveAcentoTrocaSimbolos(LStrLog);
   AssignFile(LTextFile, LFilename);
   if(FileExists(LFilename))then
     Append(LTextFile)
   else
     Rewrite(LTextFile);
   try
     WriteLn(LTextFile, LStrLog);
   finally
     CloseFile(LTextFile);
   end;
end;

initialization


finalization
  if(Assigned(FInstance))then
    FreeAndNil(FInstance);

end.

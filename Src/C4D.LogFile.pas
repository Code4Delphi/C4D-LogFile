unit C4D.LogFile;

interface

uses
  System.SysUtils,
  System.IOUtils;

type
  TC4DLogFile = class
  private
    FDir: string;
    constructor Create;
  public
    class function GetInstance: TC4DLogFile;
    function SetDir(const ADir: string): TC4DLogFile;
    function GetDir: string;
    function AddLog(const AStrLog: string): TC4DLogFile;
  end;

implementation

uses
  C4D.LogFile.Utils;

var
  Instance: TC4DLogFile;

class function TC4DLogFile.GetInstance: TC4DLogFile;
begin
  if(not Assigned(Instance))then
    Instance := Self.Create;
  Result := Instance;
end;

constructor TC4DLogFile.Create;
begin
  FDir := ''; //ExtractFileDir(ParamStr(0)) + '\Log\';
end;

function TC4DLogFile.SetDir(const ADir: string): TC4DLogFile;
begin
  Result := Self;
  if not DirectoryExists(ADir)then
    ForceDirectories(ADir);
  FDir := ADir;
end;

function TC4DLogFile.GetDir: string;
begin
  Result := FDir;
end;

function TC4DLogFile.AddLog(const AStrLog: string): TC4DLogFile;
var
  LFilename: string;
  LTextFile: TextFile;
  LStrLog: string;
begin
  Result := Self;
  if(FDir.Trim.IsEmpty)then
    raise Exception.Create('Diretório para geração do log não informado');

  LFilename := TPath.Combine(FDir, 'log_' + FormatDateTime('yyyy-mm-dd', Now()) + '.log');
  LStrLog := '[' + DateTimeToStr(Now) + '] ' + AStrLog;
  LStrLog := TC4DLogFileUtils.RemoveAcentoTrocaSimbolos(LStrLog);
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
  if(Assigned(Instance))then
    FreeAndNil(Instance);

end.

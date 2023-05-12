unit C4D.LogFile.Utils;

interface

uses
  System.SysUtils;

type
  TC4DLogFileUtils = class
  public
    class function RemoveAcento(AStr: String): String;
    class function RemoveAcentoTrocaSimbolos(AStr: String): String;
    class function TrocaSimbolos(AStr: String): String;
  end;

implementation

class function TC4DLogFileUtils.RemoveAcentoTrocaSimbolos(AStr: String): String;
begin
   Result := TrocaSimbolos(RemoveAcento(AStr));
end;

class function TC4DLogFileUtils.RemoveAcento(AStr: String): String;
const
 C_COM_ACENTOS = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
 C_SEM_ACENTOS = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
 i: Integer;
begin
   for i := 1 to Length(AStr) do
     if(Pos(AStr[i], C_COM_ACENTOS) <> 0)then
       AStr[i] := C_SEM_ACENTOS[Pos(AStr[i], C_COM_ACENTOS)];

   Result := AStr;
end;

class function TC4DLogFileUtils.TrocaSimbolos(AStr: String): String;
const
 C_SIMBOLOS_OLD = '∫™&ÆΩºﬂµ˛˝›®Ê∆¯£ÿÉ™ø|~^¥`';
 C_SIMBOLOS_NEW = 'oae   BupyY   o 0faw     ';
var
 i: Integer;
begin
   for i := 1 to Length(AStr)do
     if(Pos(AStr[i], C_SIMBOLOS_OLD) <> 0)then
       AStr[i] := C_SIMBOLOS_NEW[Pos(AStr[i], C_SIMBOLOS_OLD)];

   Result := AStr;
end;

end.

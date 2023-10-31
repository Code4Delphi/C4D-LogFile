unit C4D.LogFile.Utils;

interface

uses
  System.SysUtils;

type
  TC4DLogFileUtils = class
  public
    class function RemoveAcento(AValue: string): string;
    class function RemoveAcentoTrocaSimbolos(const AValue: string): string;
    class function TrocaSimbolos(AValue: string): string;
  end;

implementation

class function TC4DLogFileUtils.RemoveAcentoTrocaSimbolos(const AValue: string): string;
begin
  Result := TrocaSimbolos(RemoveAcento(AValue));
end;

class function TC4DLogFileUtils.RemoveAcento(AValue: string): string;
const
  C_COM_ACENTOS = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  C_SEM_ACENTOS = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  i: Integer;
begin
  for i := 1 to AValue.Length do
    if(Pos(AValue[i], C_COM_ACENTOS) <> 0)then
      AValue[i] := C_SEM_ACENTOS[Pos(AValue[i], C_COM_ACENTOS)];

  Result := AValue;
end;

class function TC4DLogFileUtils.TrocaSimbolos(AValue: string): string;
const
  C_SIMBOLOS_OLD = '∫™&ÆΩºﬂµ˛˝›®Ê∆¯£ÿÉ™ø|~^¥`';
  C_SIMBOLOS_NEW = 'oae   BupyY   o 0faw     ';
var
  i: Integer;
begin
  for i := 1 to AValue.Length do
    if(Pos(AValue[i], C_SIMBOLOS_OLD) <> 0)then
      AValue[i] := C_SIMBOLOS_NEW[Pos(AValue[i], C_SIMBOLOS_OLD)];

  Result := AValue;
end;

end.

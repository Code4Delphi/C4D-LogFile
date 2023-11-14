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
  COM_ACENTOS = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SEM_ACENTOS = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  i: Integer;
begin
  for i := 1 to AValue.Length do
    if(Pos(AValue[i], COM_ACENTOS) <> 0)then
      AValue[i] := SEM_ACENTOS[Pos(AValue[i], COM_ACENTOS)];

  Result := AValue;
end;

class function TC4DLogFileUtils.TrocaSimbolos(AValue: string): string;
const
  SIMBOLOS_OLD = '∫™&ÆΩºﬂµ˛˝›®Ê∆¯£ÿÉ™ø|~^¥`';
  SIMBOLOS_NEW = 'oae   BupyY   o 0faw     ';
var
  i: Integer;
begin
  for i := 1 to AValue.Length do
    if(Pos(AValue[i], SIMBOLOS_OLD) <> 0)then
      AValue[i] := SIMBOLOS_NEW[Pos(AValue[i], SIMBOLOS_OLD)];

  Result := AValue;
end;

end.

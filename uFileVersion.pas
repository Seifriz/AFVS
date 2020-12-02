unit uFileVersion;

interface

uses Windows, SysUtils, Classes;

type
  TVerRec = record
    dwHigh, dwLow: DWORD;
  end;

  TFileVersion = class
  strict private
    FVersion: TVerRec;
    procedure SetMajor(Value: word);
    procedure SetMinor(Value: word);
    procedure SetRelease(Value: word);
    procedure SetBuild(Value: word);
    procedure SetVersion(const aVersion: TVerRec);
    procedure StringToVersion(const VerStr: string);
    function GetVersionString: string;
    function GetRelease: word;
    function GetMajor: word;
    function GetMinor: word;
    function GetBuild: word;
  public
    constructor Create;
    function CompareVersion(Other: TFileVersion): integer;
    procedure ReadFromResources(const Filename: string);
    property Version: TVerRec read FVersion write SetVersion;
    property Major: word read GetMajor write SetMajor;
    property Minor: word read GetMinor write SetMinor;
    property Release: word read GetRelease write SetRelease;
    property Build: word read GetBuild write SetBuild;
    property AsString: string read GetVersionString write StringToVersion;
  end;

implementation

function TFileVersion.CompareVersion(Other: TFileVersion): integer;
begin
  Result := 0;
  Assert(Assigned(Other));
  if (Other.Major = Major) and (Other.Minor = Minor) then
    begin
      Result := Other.Release - Release;
      if Result = 0 then
        Result := Other.Build - Build;
    end;
end;

constructor TFileVersion.Create;
begin
  FVersion.dwHigh := MAXDWORD;
  FVersion.dwLow := MAXDWORD;
end;

function TFileVersion.GetBuild: word;
begin
  Result := word(FVersion.dwLow and $0000FFFF);
end;

function TFileVersion.GetMajor: word;
begin
  Result := word(FVersion.dwHigh shr 16);
end;

function TFileVersion.GetMinor: word;
begin
  Result := word(FVersion.dwHigh and $0000FFFF);
end;

function TFileVersion.GetRelease: word;
begin
  Result := word(FVersion.dwLow shr 16);
end;

function TFileVersion.GetVersionString: string;
begin
  Result := Format('%d.%d.%d.%d', [Major, Minor, Release, Build]);
end;

procedure TFileVersion.ReadFromResources(const Filename: string);
var
  lpVerInfo: Pointer;
  rVerValue: PVSFixedFileInfo;
  dwInfoSize: Cardinal;
  dwValueSize: Cardinal;
  dwDummy: Cardinal;
  lpstrPath: PChar;
begin
  lpstrPath := PChar(Filename);
  dwInfoSize := GetFileVersionInfoSize(lpstrPath, dwDummy);
  if dwInfoSize <> 0 then
    begin
      GetMem(lpVerInfo, dwInfoSize);
      try
        GetFileVersionInfo(lpstrPath, 0, dwInfoSize, lpVerInfo);
        VerQueryValue(lpVerInfo, '\', Pointer(rVerValue), dwValueSize);
        FVersion.dwHigh := rVerValue^.dwFileVersionMS;
        FVersion.dwLow := rVerValue^.dwFileVersionLS;
      finally
        FreeMem(lpVerInfo, dwInfoSize);
      end;
    end;
end;

procedure TFileVersion.SetRelease(Value: word);
begin
  FVersion.dwLow := FVersion.dwLow and $0000FFFF or (DWORD(Value) shl 16);
end;

procedure TFileVersion.SetMajor(Value: word);
begin
  FVersion.dwHigh := FVersion.dwHigh and $0000FFFF or (DWORD(Value) shl 16);
end;

procedure TFileVersion.SetMinor(Value: word);
begin
  FVersion.dwHigh := FVersion.dwHigh and $FFFF0000 or DWORD(Value);
end;

procedure TFileVersion.SetBuild(Value: word);
begin
  FVersion.dwLow := FVersion.dwLow and $FFFF0000 or DWORD(Value);
end;

procedure TFileVersion.SetVersion(const aVersion: TVerRec);
begin
  FVersion := aVersion;
end;

procedure TFileVersion.StringToVersion(const VerStr: string);
const
  INVALID_NUMBER = '"%s" ist keine gültige Versionsnummer';
var
  s: string;
  sl: TStringList;
  i, dummy: integer;
begin
  s := trim(VerStr);
  sl := TStringList.Create;
  try
    sl.StrictDelimiter := true;
    sl.Delimiter := '.';
    sl.DelimitedText := s;
    if sl.Count <> 4 then
      raise Exception.CreateFmt(INVALID_NUMBER, [s]);
    for i := 0 to sl.Count - 1 do
      if not TryStrToInt(sl[i], dummy) then
        raise Exception.CreateFmt(INVALID_NUMBER, [s]);
    Major := StrToInt(trim(sl[0]));
    Minor := StrToInt(trim(sl[1]));
    Release := StrToInt(trim(sl[2]));
    Build := StrToInt(trim(sl[3]));
  finally
    sl.Free;
  end;
end;


end.

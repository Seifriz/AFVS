unit Tools;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Math;

procedure SetLBHScrollbar(aValue: TListBox);
procedure GetFilesInDirectory(Directory: String; Const Mask: String;
                              List: TStrings;
                              WithSubDirs, ClearList: Boolean);
procedure Shuffle(var Z: Array of Integer; Anzahl: Integer);
procedure ShuffleArray(var Z: Array of Integer);
function CompareInt(List: TStringList; Index1, Index2: Integer): Integer;
procedure Delay(msek: Longword);
procedure DelayQPC(t: Cardinal);
procedure DelayQPCms(t: Cardinal);
procedure StartZeit;
function StoppZeit: Extended;
function AfterFirstStr(Src, S: String): String;
function IsInString(const Src, S: String): Boolean;
function BetweenStr(Src, S1, S2: String): String;

implementation

var f: TLargeInteger;
    t1,t2: TLargeInteger;

procedure SetLBHScrollbar(aValue: TListBox);
var ndx: Integer;
    MaxWidth: Integer;
begin
  MaxWidth:=0;
  for ndx:=0 to aValue.Items.Count - 1 do  MaxWidth:=Max(MaxWidth, aValue.Canvas.TextWidth(aValue.Items.Strings[ndx]));
  SendMessage(aValue.Handle, LB_SETHORIZONTALEXTENT, MaxWidth + 10, 0);
end;

procedure GetFilesInDirectory(Directory: String; Const Mask: String;
                              List: TStrings;
                              WithSubDirs, ClearList: Boolean);

procedure ScanDir(const Directory: String);
var SR: TSearchRec;
begin
  if FindFirst(Directory + Mask, faAnyFile and not faDirectory, SR) = 0 then
  try
    repeat
      List.Add(Directory + SR.Name)
    until FindNext(SR) <> 0;
  finally
    FindClose(SR);
  end;

  if WithSubDirs then
  begin
    if FindFirst(Directory + '*.*', faAnyFile, SR) = 0 then
    try
      repeat
        if ((SR.attr and faDirectory) = faDirectory) and (SR.Name <> '.') and (SR.Name <> '..') then
          ScanDir(Directory + SR.Name + '\');
      until FindNext(SR) <> 0;
    finally
      FindClose(SR);
    end;
  end;
end;

begin
  List.BeginUpdate;
  try
    if ClearList then List.Clear;
    if Directory = '' then Exit;
    if Directory[Length(Directory)] <> '\' then Directory := Directory + '\';
    ScanDir(Directory);
  finally
    List.EndUpdate;
  end;
end;

function CompareInt(List: TStringList; Index1, Index2: Integer): Integer;
var d1, d2: Integer;
    r1, r2: Boolean;

  function IsInt(AString : string; var AInteger : Integer): Boolean;
  var Code: Integer;
  begin
    Val(AString, AInteger, Code);
    Result:=(Code = 0);
  end;

begin
  r1:= IsInt(List[Index1], d1);
  r2:= IsInt(List[Index2], d2);
  Result := ord(r1 or r2);
  if Result <> 0 then
  begin
    if d1 < d2 then Result:=-1
    else if d1 > d2 then Result:=1
    else Result:=0;
  end
  else Result:=lstrcmp(PChar(List[Index1]), PChar(List[Index2]));
end;

procedure Shuffle(var Z: Array of Integer; Anzahl: Integer);
var i: Integer;
    Zufall: Integer;
    iTemp: Integer;
begin
  for i:=Low(Z) to High(Z) do Z[i]:=i;

  for i:=Low(Z) to High(Z) do
  begin
    Zufall:=Random(Anzahl);
    iTemp:=Z[Zufall];
    Z[Zufall]:=Z[i];
    Z[i]:=iTemp;
  end;
end;

procedure ShuffleArray(var Z: Array of Integer);
var i: Integer;
    Zufall: Integer;
    iTemp: Integer;
begin
  for i:=Low(Z) to High(Z) do
  begin
    Zufall:=Random(Length(Z));
    iTemp:=Z[Zufall];
    Z[Zufall]:=Z[i];
    Z[i]:=iTemp;
  end;
end;

procedure Delay(msek: Longword);
var x: Longword;
begin
  x:=GetTickCount;
  while (GetTickCount - x) < msek do Application.ProcessMessages;
end;

procedure DelayQPC(t: Cardinal);
var  a, b: Int64;
Begin
    QueryPerformanceFrequency(b);
    QueryPerformanceCounter(a);
    b := a + (b * t) div 100000;   // 100000 = 0.01ms
    While a < b do QueryPerformanceCounter(a);
end;

procedure DelayQPCms(t: Cardinal);
var  a, b: Int64;
Begin
    QueryPerformanceFrequency(b);
    QueryPerformanceCounter(a);
    b := a + (b * t) div 1000;   // 1000 = 1ms
    While a < b do QueryPerformanceCounter(a);
end;

procedure StartZeit;
begin
  QueryPerformanceFrequency(f);
  QueryPerformanceCounter(t1);
end;

function StoppZeit: Extended;
begin
  if f <> 0 then
  begin
    QueryPerformanceCounter(t2);
    StoppZeit:=(t2 - t1) / f;
  end
  else StoppZeit:=0;
end;

function AfterFirstStr(Src, S: String): String;
var F: Integer;
begin
  F:=AnsiPos(S, Src);
  if F = 0 then AfterFirstStr:=''
  else AfterFirstStr:=Copy(Src, F + 1, Length(Src) - F);
end;

function IsInString(const Src, S: String): Boolean;
begin
  IsInString:=AnsiPos(S, Src) > 0;
end;

function BetweenStr(Src, S1, S2: String): String;
var P1, P2: Integer;
begin
  P1:=Pos(S1, Src);
  P2:=Pos(S2, Src, P1 + 1);
  if ((P1 > 0) AND (P2 > 0)) then BetweenStr:=Copy(Src, P1, P2 - P1)
  else BetweenStr:='';
end;

end.


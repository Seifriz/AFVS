unit DlgFormView0;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, PasLibVlcPlayerUnit, Vcl.StdCtrls, Vcl.ComCtrls,
  IniFiles, AdvTrackBar, Vcl.Menus, RzStatus, RzPanel;

type
  TfrmView0 = class(TForm)
    PasLibVlcPlayerView0: TPasLibVlcPlayer;
    tbView0: TAdvTrackBar;
    tbOffsetView0: TAdvTrackBar;
    pmView0: TPopupMenu;
    SetMarker1: TMenuItem;
    ReleaseMarker1: TMenuItem;
    StatusBar1: TRzStatusBar;
    StatusPane1: TRzStatusPane;
    StatusPane2: TRzStatusPane;
    StatusPane3: TRzStatusPane;
    procedure PasLibVlcPlayerView0MediaPlayerTimeChanged(Sender: TObject; time: Int64);
    procedure FormResize(Sender: TObject);
    procedure PasLibVlcPlayerView0MediaPlayerLengthChanged(Sender: TObject; time: Int64);
    procedure tbView0Change(Sender: TObject);
    procedure SetMarker1Click(Sender: TObject);
    procedure ReleaseMarker1Click(Sender: TObject);
  private
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
  public
    { Public-Deklarationen }
  end;

var
  frmView0: TfrmView0;

implementation

{$R *.dfm}

uses DlgFormMain, DlgFormEigenschaften;

procedure TfrmView0.WMMove(var Msg: TWMMove);
begin
  inherited;
  frmEigenschaften.vlView0.Values['Top']:=IntToStr(frmView0.Top);
  frmEigenschaften.vlView0.Values['Left']:=IntToStr(frmView0.Left);
  frmEigenschaften.vlView0.Values['Height']:=IntToStr(frmView0.Height);
  frmEigenschaften.vlView0.Values['Width']:=IntToStr(frmView0.Width);
end;

procedure TfrmView0.FormResize(Sender: TObject);
begin
  frmEigenschaften.vlView0.Values['Top']:=IntToStr(frmView0.Top);
  frmEigenschaften.vlView0.Values['Left']:=IntToStr(frmView0.Left);
  frmEigenschaften.vlView0.Values['Height']:=IntToStr(frmView0.Height);
  frmEigenschaften.vlView0.Values['Width']:=IntToStr(frmView0.Width);
end;

procedure TfrmView0.PasLibVlcPlayerView0MediaPlayerLengthChanged(Sender: TObject; time: Int64);
begin
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPlayerView0.GetVideoPosStr('hh:mm:ss.ms');
  StatusPane2.Caption:='Dauer: ' + PasLibVlcPlayerView0.GetVideoLenStr('hh:mm:ss.ms');

  tbView0.Max:=PasLibVlcPlayerView0.GetVideoLenInMs;
  tbOffsetView0.Max:=PasLibVlcPlayerView0.GetVideoLenInMs;
end;

procedure TfrmView0.PasLibVlcPlayerView0MediaPlayerTimeChanged(Sender: TObject; time: Int64);
begin
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPLayerView0.GetVideoPosStr('hh:mm:ss.ms');
  if frmEigenschaften.cbTimecodeShow.Checked then PasLibVlcPlayerView0.MarqueeShowText(PasLibVlcPlayerView0.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);

  tbView0.Position:=time;
  if prjOffsetVideo[0] = -1 then tbOffsetView0.Position:=time;
end;

procedure TfrmView0.ReleaseMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[0]:=-1;
  StatusPane3.Caption:='Offset: ';
  frmEigenschaften.eOffsetView0.Value:=prjOffsetVideo[0];

  tbOffsetView0.Thumb.BorderColorDisabled:=clGreen;
  tbOffsetView0.Thumb.ColorDisabled:=clGreen;
  tbOffsetView0.Thumb.ColorMirrorDisabled:=clGreen;
  tbOffsetView0.Thumb.ColorDisabledTo:=$0000AA00;
  tbOffsetView0.Thumb.ColorMirrorDisabledTo:=$0000AA00;
  tbOffsetView0.Slider.BorderColorDisabled:=clGreen;

  tbOffsetView0.Position:=tbView0.Position;
end;

procedure TfrmView0.SetMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[0]:=PasLibVlcPlayerView0.GetVideoPosInMs;
  StatusPane3.Caption:='Offset: ' + IntToStr(prjOffsetVideo[0]);
  frmEigenschaften.eOffsetView0.Value:=prjOffsetVideo[0];

  tbOffsetView0.Thumb.BorderColorDisabled:=clRed;
  tbOffsetView0.Thumb.ColorDisabled:=clRed;
  tbOffsetView0.Thumb.ColorMirrorDisabled:=clRed;
  tbOffsetView0.Thumb.ColorDisabledTo:=$007777FF;
  tbOffsetView0.Thumb.ColorMirrorDisabledTo:=$007777FF;
  tbOffsetView0.Slider.BorderColorDisabled:=clRed;
end;

procedure TfrmView0.tbView0Change(Sender: TObject);
begin
  if PasLibVlcPlayerView0.CanSeek() then
  begin
    PasLibVlcPlayerView0.SetVideoPosInMs(tbView0.Position);
  end;
end;

end.

unit DlgFormView1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, PasLibVlcPlayerUnit, Vcl.StdCtrls, Vcl.ComCtrls, AdvTrackBar, Vcl.Menus,
  RzStatus, RzPanel;

type
  TfrmView1 = class(TForm)
    PasLibVlcPlayerView1: TPasLibVlcPlayer;
    tbView1: TAdvTrackBar;
    tbOffsetView1: TAdvTrackBar;
    pmView1: TPopupMenu;
    SetMarker1: TMenuItem;
    ReleaseMarker1: TMenuItem;
    StatusBar1: TRzStatusBar;
    StatusPane1: TRzStatusPane;
    StatusPane2: TRzStatusPane;
    StatusPane3: TRzStatusPane;
    procedure PasLibVlcPlayerView1MediaPlayerTimeChanged(Sender: TObject; time: Int64);
    procedure FormResize(Sender: TObject);
    procedure PasLibVlcPlayerView1MediaPlayerLengthChanged(Sender: TObject; time: Int64);
    procedure tbView1Change(Sender: TObject);
    procedure SetMarker1Click(Sender: TObject);
    procedure ReleaseMarker1Click(Sender: TObject);
  private
    // OnMoveForm Event
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
  public
    { Public-Deklarationen }
  end;

var
  frmView1: TfrmView1;

implementation

{$R *.dfm}

uses DlgFormMain, DlgFormEigenschaften;

procedure TfrmView1.WMMove(var Msg: TWMMove);
begin
  inherited;
  frmEigenschaften.vlView1.Values['Top']:=IntToStr(frmView1.Top);
  frmEigenschaften.vlView1.Values['Left']:=IntToStr(frmView1.Left);
  frmEigenschaften.vlView1.Values['Height']:=IntToStr(frmView1.Height);
  frmEigenschaften.vlView1.Values['Width']:=IntToStr(frmView1.Width);
end;

procedure TfrmView1.FormResize(Sender: TObject);
begin
  frmEigenschaften.vlView1.Values['Top']:=IntToStr(frmView1.Top);
  frmEigenschaften.vlView1.Values['Left']:=IntToStr(frmView1.Left);
  frmEigenschaften.vlView1.Values['Height']:=IntToStr(frmView1.Height);
  frmEigenschaften.vlView1.Values['Width']:=IntToStr(frmView1.Width);
end;

procedure TfrmView1.PasLibVlcPlayerView1MediaPlayerLengthChanged(Sender: TObject; time: Int64);
// LengthChanged: ...erst nach: Play
begin
  // LengthChanged
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPlayerView1.GetVideoPosStr('hh:mm:ss.ms');
  StatusPane2.Caption:='Dauer: ' + PasLibVlcPlayerView1.GetVideoLenStr('hh:mm:ss.ms');

  tbView1.Max:=PasLibVlcPlayerView1.GetVideoLenInMs;
  tbOffsetView1.Max:=PasLibVlcPlayerView1.GetVideoLenInMs;
end;

procedure TfrmView1.PasLibVlcPlayerView1MediaPlayerTimeChanged(Sender: TObject; time: Int64);
begin
  // TimeChanged
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPLayerView1.GetVideoPosStr('hh:mm:ss.ms');
  if frmEigenschaften.cbTimecodeShow.Checked then PasLibVlcPlayerView1.MarqueeShowText(PasLibVlcPlayerView1.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);

  tbView1.Position:=time;
  if prjOffsetVideo[1] = -1 then tbOffsetView1.Position:=time;
end;

procedure TfrmView1.ReleaseMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[1]:=-1;
  StatusPane3.Caption:='Offset: ';
  frmEigenschaften.eOffsetView0.Value:=prjOffsetVideo[1];

  // Farbwechsel
  tbOffsetView1.Thumb.BorderColorDisabled:=clGreen;
  tbOffsetView1.Thumb.ColorDisabled:=clGreen;
  tbOffsetView1.Thumb.ColorMirrorDisabled:=clGreen;
  tbOffsetView1.Thumb.ColorDisabledTo:=$0000AA00;
  tbOffsetView1.Thumb.ColorMirrorDisabledTo:=$0000AA00;
  tbOffsetView1.Slider.BorderColorDisabled:=clGreen;

  tbOffsetView1.Position:=tbView1.Position;
end;

procedure TfrmView1.SetMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[1]:=PasLibVlcPlayerView1.GetVideoPosInMs;
  StatusPane3.Caption:='Marker: ' + IntToStr(prjOffsetVideo[1]);
  frmEigenschaften.eOffsetView1.Value:=prjOffsetVideo[1];

  // Farbwechsel
  tbOffsetView1.Thumb.BorderColorDisabled:=clRed;
  tbOffsetView1.Thumb.ColorDisabled:=clRed;
  tbOffsetView1.Thumb.ColorMirrorDisabled:=clRed;
  tbOffsetView1.Thumb.ColorDisabledTo:=$007777FF;
  tbOffsetView1.Thumb.ColorMirrorDisabledTo:=$007777FF;
  tbOffsetView1.Slider.BorderColorDisabled:=clRed;
end;

procedure TfrmView1.tbView1Change(Sender: TObject);
begin
  if PasLibVlcPlayerView1.CanSeek() then
  begin
    PasLibVlcPlayerView1.SetVideoPosInMs(tbView1.Position);
  end;
end;

end.

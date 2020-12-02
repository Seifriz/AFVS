unit DlgFormView2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, PasLibVlcPlayerUnit, Vcl.StdCtrls, Vcl.ComCtrls, AdvTrackBar, Vcl.Menus,
  RzStatus, RzPanel;

type
  TfrmView2 = class(TForm)
    PasLibVlcPlayerView2: TPasLibVlcPlayer;
    tbView2: TAdvTrackBar;
    tbOffsetView2: TAdvTrackBar;
    pmView2: TPopupMenu;
    SetMarker1: TMenuItem;
    ReleaseMarker1: TMenuItem;
    StatusBar1: TRzStatusBar;
    StatusPane1: TRzStatusPane;
    StatusPane2: TRzStatusPane;
    StatusPane3: TRzStatusPane;
    procedure PasLibVlcPlayerView2MediaPlayerTimeChanged(Sender: TObject; time: Int64);
    procedure FormResize(Sender: TObject);
    procedure PasLibVlcPlayerView2MediaPlayerLengthChanged(Sender: TObject; time: Int64);
    procedure tbView2Change(Sender: TObject);
    procedure SetMarker1Click(Sender: TObject);
    procedure ReleaseMarker1Click(Sender: TObject);
  private
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
  public
    { Public-Deklarationen }
  end;

var
  frmView2: TfrmView2;

implementation

{$R *.dfm}

uses DlgFormMain, DlgFormEigenschaften;

procedure TfrmView2.WMMove(var Msg: TWMMove);
begin
  inherited;
  frmEigenschaften.vlView2.Values['Top']:=IntToStr(frmView2.Top);
  frmEigenschaften.vlView2.Values['Left']:=IntToStr(frmView2.Left);
  frmEigenschaften.vlView2.Values['Height']:=IntToStr(frmView2.Height);
  frmEigenschaften.vlView2.Values['Width']:=IntToStr(frmView2.Width);
end;

procedure TfrmView2.FormResize(Sender: TObject);
begin
  frmEigenschaften.vlView2.Values['Top']:=IntToStr(frmView2.Top);
  frmEigenschaften.vlView2.Values['Left']:=IntToStr(frmView2.Left);
  frmEigenschaften.vlView2.Values['Height']:=IntToStr(frmView2.Height);
  frmEigenschaften.vlView2.Values['Width']:=IntToStr(frmView2.Width);
end;

procedure TfrmView2.PasLibVlcPlayerView2MediaPlayerLengthChanged(Sender: TObject; time: Int64);
begin
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPlayerView2.GetVideoPosStr('hh:mm:ss.ms');
  StatusPane2.Caption:='Dauer: ' + PasLibVlcPlayerView2.GetVideoLenStr('hh:mm:ss.ms');

  tbView2.Max:=PasLibVlcPlayerView2.GetVideoLenInMs;
  tbOffsetView2.Max:=PasLibVlcPlayerView2.GetVideoLenInMs;
end;

procedure TfrmView2.PasLibVlcPlayerView2MediaPlayerTimeChanged(Sender: TObject; time: Int64);
begin
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPLayerView2.GetVideoPosStr('hh:mm:ss.ms');
  if frmEigenschaften.cbTimecodeShow.Checked then PasLibVlcPlayerView2.MarqueeShowText(PasLibVlcPlayerView2.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);

  tbView2.Position:=time;
  if prjOffsetVideo[2] = -1 then tbOffsetView2.Position:=time;
end;

procedure TfrmView2.ReleaseMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[2]:=-1;
  StatusPane3.Caption:='Offset: ';
  frmEigenschaften.eOffsetView0.Value:=prjOffsetVideo[2];

  tbOffsetView2.Thumb.BorderColorDisabled:=clGreen;
  tbOffsetView2.Thumb.ColorDisabled:=clGreen;
  tbOffsetView2.Thumb.ColorMirrorDisabled:=clGreen;
  tbOffsetView2.Thumb.ColorDisabledTo:=$0000AA00;
  tbOffsetView2.Thumb.ColorMirrorDisabledTo:=$0000AA00;
  tbOffsetView2.Slider.BorderColorDisabled:=clGreen;

  tbOffsetView2.Position:=tbView2.Position;
end;

procedure TfrmView2.SetMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[2]:=PasLibVlcPlayerView2.GetVideoPosInMs;
  StatusPane3.Caption:='Offset: ' + IntToStr(prjOffsetVideo[2]);
  frmEigenschaften.eOffsetView2.Value:=prjOffsetVideo[2];

  tbOffsetView2.Thumb.BorderColorDisabled:=clRed;
  tbOffsetView2.Thumb.ColorDisabled:=clRed;
  tbOffsetView2.Thumb.ColorMirrorDisabled:=clRed;
  tbOffsetView2.Thumb.ColorDisabledTo:=$007777FF;
  tbOffsetView2.Thumb.ColorMirrorDisabledTo:=$007777FF;
  tbOffsetView2.Slider.BorderColorDisabled:=clRed;
end;

procedure TfrmView2.tbView2Change(Sender: TObject);
begin
  if PasLibVlcPlayerView2.CanSeek() then
  begin
    PasLibVlcPlayerView2.SetVideoPosInMs(tbView2.Position);
  end;
end;

end.

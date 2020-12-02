unit DlgFormView3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, PasLibVlcPlayerUnit, Vcl.StdCtrls, Vcl.ComCtrls, AdvTrackBar, Vcl.Menus,
  RzStatus, RzPanel;

type
  TfrmView3 = class(TForm)
    PasLibVlcPlayerView3: TPasLibVlcPlayer;
    tbView3: TAdvTrackBar;
    tbOffsetView3: TAdvTrackBar;
    pmView3: TPopupMenu;
    SetMarker1: TMenuItem;
    ReleaseMarker1: TMenuItem;
    StatusBar1: TRzStatusBar;
    StatusPane1: TRzStatusPane;
    StatusPane2: TRzStatusPane;
    StatusPane3: TRzStatusPane;
    procedure PasLibVlcPlayerView3MediaPlayerTimeChanged(Sender: TObject; time: Int64);
    procedure FormResize(Sender: TObject);
    procedure PasLibVlcPlayerView3MediaPlayerLengthChanged(Sender: TObject; time: Int64);
    procedure tbView3Change(Sender: TObject);
    procedure SetMarker1Click(Sender: TObject);
    procedure ReleaseMarker1Click(Sender: TObject);
  private
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
  public
    { Public-Deklarationen }
  end;

var
  frmView3: TfrmView3;

implementation

{$R *.dfm}

uses DlgFormMain, DlgFormEigenschaften;

procedure TfrmView3.WMMove(var Msg: TWMMove);
begin
  inherited;
  frmEigenschaften.vlView3.Values['Top']:=IntToStr(frmView3.Top);
  frmEigenschaften.vlView3.Values['Left']:=IntToStr(frmView3.Left);
  frmEigenschaften.vlView3.Values['Height']:=IntToStr(frmView3.Height);
  frmEigenschaften.vlView3.Values['Width']:=IntToStr(frmView3.Width);
end;

procedure TfrmView3.FormResize(Sender: TObject);
begin
  frmEigenschaften.vlView3.Values['Top']:=IntToStr(frmView3.Top);
  frmEigenschaften.vlView3.Values['Left']:=IntToStr(frmView3.Left);
  frmEigenschaften.vlView3.Values['Height']:=IntToStr(frmView3.Height);
  frmEigenschaften.vlView3.Values['Width']:=IntToStr(frmView3.Width);
end;

procedure TfrmView3.PasLibVlcPlayerView3MediaPlayerLengthChanged(Sender: TObject; time: Int64);
begin
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPlayerView3.GetVideoPosStr('hh:mm:ss.ms');
  StatusPane2.Caption:='Dauer: ' + PasLibVlcPlayerView3.GetVideoLenStr('hh:mm:ss.ms');

  tbView3.Max:=PasLibVlcPlayerView3.GetVideoLenInMs;
  tbOffsetView3.Max:=PasLibVlcPlayerView3.GetVideoLenInMs;
end;

procedure TfrmView3.PasLibVlcPlayerView3MediaPlayerTimeChanged(Sender: TObject; time: Int64);
begin
  StatusPane1.Caption:='Zeit: ' + PasLibVlcPLayerView3.GetVideoPosStr('hh:mm:ss.ms');
  if frmEigenschaften.cbTimecodeShow.Checked then PasLibVlcPlayerView3.MarqueeShowText(PasLibVlcPlayerView3.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);

  tbView3.Position:=time;
  if prjOffsetVideo[3] = -1 then tbOffsetView3.Position:=time;
end;

procedure TfrmView3.ReleaseMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[3]:=-1;
  StatusPane3.Caption:='Offset: ';
  frmEigenschaften.eOffsetView0.Value:=prjOffsetVideo[3];

  tbOffsetView3.Thumb.BorderColorDisabled:=clGreen;
  tbOffsetView3.Thumb.ColorDisabled:=clGreen;
  tbOffsetView3.Thumb.ColorMirrorDisabled:=clGreen;
  tbOffsetView3.Thumb.ColorDisabledTo:=$0000AA00;
  tbOffsetView3.Thumb.ColorMirrorDisabledTo:=$0000AA00;
  tbOffsetView3.Slider.BorderColorDisabled:=clGreen;

  tbOffsetView3.Position:=tbView3.Position;
end;

procedure TfrmView3.SetMarker1Click(Sender: TObject);
begin
  prjOffsetVideo[3]:=PasLibVlcPlayerView3.GetVideoPosInMs;
  StatusPane3.Caption:='Offset: ' + IntToStr(prjOffsetVideo[3]);
  frmEigenschaften.eOffsetView3.Value:=prjOffsetVideo[3];

  tbOffsetView3.Thumb.BorderColorDisabled:=clRed;
  tbOffsetView3.Thumb.ColorDisabled:=clRed;
  tbOffsetView3.Thumb.ColorMirrorDisabled:=clRed;
  tbOffsetView3.Thumb.ColorDisabledTo:=$007777FF;
  tbOffsetView3.Thumb.ColorMirrorDisabledTo:=$007777FF;
  tbOffsetView3.Slider.BorderColorDisabled:=clRed;
end;

procedure TfrmView3.tbView3Change(Sender: TObject);
begin
  if PasLibVlcPlayerView3.CanSeek() then
  begin
    PasLibVlcPlayerView3.SetVideoPosInMs(tbView3.Position);
  end;
end;

end.

unit DlgFormEigenschaften;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvTrackBar, Vcl.StdCtrls, AdvGroupBox, AdvEdit, AdvEdBtn, AdvFileNameEdit, Vcl.Buttons,
  IniFiles, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit, Vcl.Mask, AdvSpin;

type
  TfrmEigenschaften = class(TForm)
    gbAudio: TAdvGroupBox;
    tbAudio: TAdvTrackBar;
    gbVideo: TAdvGroupBox;
    eFileView0: TAdvFileNameEdit;
    eFileView1: TAdvFileNameEdit;
    eFileView2: TAdvFileNameEdit;
    eFileView3: TAdvFileNameEdit;
    gbViews: TAdvGroupBox;
    Panel1: TPanel;
    cbTitleShow: TCheckBox;
    btnOK: TButton;
    lProjectName: TLabel;
    cbTimecodeShow: TCheckBox;
    btnAbbruch: TButton;
    vlView0: TValueListEditor;
    vlView1: TValueListEditor;
    vlView2: TValueListEditor;
    vlView3: TValueListEditor;
    btnViewsDefault: TButton;
    eOffsetView3: TAdvSpinEdit;
    eOffsetView2: TAdvSpinEdit;
    eOffsetView1: TAdvSpinEdit;
    eOffsetView0: TAdvSpinEdit;
    eStepSize: TAdvSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure btnViewsDefaultClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmEigenschaften: TfrmEigenschaften;

implementation

{$R *.dfm}

uses DlgFormMain, DlgFormView0;

procedure TfrmEigenschaften.btnViewsDefaultClick(Sender: TObject);
begin
  vlView0.Values['Top']:=IntToStr(10);
  vlView0.Values['Left']:=IntToStr(10);
  vlView0.Values['Height']:=IntToStr(300);
  vlView0.Values['Width']:=IntToStr(300);

  vlView1.Values['Top']:=IntToStr(40);
  vlView1.Values['Left']:=IntToStr(40);
  vlView1.Values['Height']:=IntToStr(300);
  vlView1.Values['Width']:=IntToStr(300);

  vlView2.Values['Top']:=IntToStr(70);
  vlView2.Values['Left']:=IntToStr(70);
  vlView2.Values['Height']:=IntToStr(300);
  vlView2.Values['Width']:=IntToStr(300);

  vlView3.Values['Top']:=IntToStr(100);
  vlView3.Values['Left']:=IntToStr(100);
  vlView3.Values['Height']:=IntToStr(300);
  vlView3.Values['Width']:=IntToStr(300);
end;

procedure TfrmEigenschaften.FormShow(Sender: TObject);
begin
  lProjectName.Caption:=frmMain.cbProjectFiles.Items[frmMain.cbProjectFiles.ItemIndex]
end;

end.

unit DlgFormInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, GR32_Image;

type
  TfrmInfo = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Image321: TImage32;
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

uses
  DlgFormMain;

procedure TfrmInfo.FormShow(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(frmMain.Caption);
end;

end.

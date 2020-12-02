program MultiView;



uses
  Vcl.Forms,
  DlgFormMain in 'DlgFormMain.pas' {frmMain},
  DlgFormView0 in 'DlgFormView0.pas' {frmView0},
  DlgFormView1 in 'DlgFormView1.pas' {frmView1},
  DlgFormView2 in 'DlgFormView2.pas' {frmView2},
  DlgFormEigenschaften in 'DlgFormEigenschaften.pas' {frmEigenschaften},
  DlgFormView3 in 'DlgFormView3.pas' {frmView3},
  DlgFormInfo in 'DlgFormInfo.pas' {frmInfo};

{$R *.res}

begin
  Application.Initialize;
  // Wegen StayOnTop von MainForm:
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmEigenschaften, frmEigenschaften);
  Application.CreateForm(TfrmView0, frmView0);
  Application.CreateForm(TfrmView1, frmView1);
  Application.CreateForm(TfrmView2, frmView2);
  Application.CreateForm(TfrmView3, frmView3);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.Run;
end.

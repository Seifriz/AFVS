unit DlgFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, IniFiles, Vcl.Buttons, Vcl.ImgList, Vcl.Mask,
  KDialogs, Vcl.Grids, Vcl.ValEdit, AdvTrackBar, TypInfo, uFileVersion,
  AdvCombo, AdvGroupBox, AdvEdit, AdvObj, BaseGrid, AdvGrid, Vcl.Menus,
  tmsAdvGridExcel, AdvSpin;

type TFormPos = record
        Top: Integer;
        Left: Integer;
        Height: Integer;
        Width: Integer;
     end;

type
  TfrmMain = class(TForm)
    pSteuerung: TPanel;
    pProjekt: TPanel;
    sbProjectSaveUnder: TSpeedButton;
    sbPlay: TSpeedButton;
    sbFrameDec: TSpeedButton;
    sbFrameInc: TSpeedButton;
    sbStop: TSpeedButton;
    sbProjectProperties: TSpeedButton;
    Label1: TLabel;
    cbPlayRate: TComboBox;
    sbProjectFolder: TSpeedButton;
    cbProjectFiles: TComboBox;
    sbProjectNew: TSpeedButton;
    pStep: TPanel;
    pLog: TPanel;
    mLog: TMemo;
    sbStepStart: TSpeedButton;
    lSchritt: TLabel;
    pEvent: TPanel;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Projektordnerffnen1: TMenuItem;
    NeuesProjekterstellen1: TMenuItem;
    Projektspeichern1: TMenuItem;
    Projektspeichernunter1: TMenuItem;
    N3: TMenuItem;
    Beenden1: TMenuItem;
    Optionen1: TMenuItem;
    Projekteigenschaften1: TMenuItem;
    Hilfe1: TMenuItem;
    Info1: TMenuItem;
    N4: TMenuItem;
    Loggin1: TMenuItem;
    pEventgrid: TPanel;
    gEvent: TAdvStringGrid;
    KBrowseFolderDialog1: TKBrowseFolderDialog;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    imglStep: TImageList;
    imglPlay: TImageList;
    imglStop: TImageList;
    imglFrame: TImageList;
    sbSchrittSpeichern: TBitBtn;
    AdvGroupBox4: TAdvGroupBox;
    AdvGroupBox1: TAdvGroupBox;
    cbView1Aufgabe: TAdvComboBox;
    cbView1Aufgeingehalten: TCheckBox;
    rbView1Angreifer: TRadioButton;
    rbView1Verteidiger: TRadioButton;
    eView1Spieler: TAdvEdit;
    cbView1AOI: TAdvComboBox;
    eView1Kommentar: TEdit;
    AdvGroupBox2: TAdvGroupBox;
    cbView2Aufgabe: TAdvComboBox;
    cbView2Aufgeingehalten: TCheckBox;
    rbView2Angreifer: TRadioButton;
    rbView2Verteidiger: TRadioButton;
    eView2Spieler: TAdvEdit;
    cbView2AOI: TAdvComboBox;
    eView2Kommentar: TEdit;
    AdvGroupBox3: TAdvGroupBox;
    cbView3Aufgabe: TAdvComboBox;
    cbView3Aufgeingehalten: TCheckBox;
    rbView3Angreifer: TRadioButton;
    rbView3Verteidiger: TRadioButton;
    eView3Spieler: TAdvEdit;
    cbView3AOI: TAdvComboBox;
    eView3Kommentar: TEdit;
    View01: TMenuItem;
    View11: TMenuItem;
    View31: TMenuItem;
    View21: TMenuItem;
    N5: TMenuItem;
    imglMenu: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    sbProjectSave: TSpeedButton;
    N6: TMenuItem;
    EventsexportierenCSV1: TMenuItem;
    EventsexportierenExcel1: TMenuItem;
    AdvGridExcelIO1: TAdvGridExcelIO;
    seGotoStep: TAdvSpinEdit;
    sbGotoStep: TBitBtn;
    cbView1Ball: TAdvComboBox;
    cbView2Ball: TAdvComboBox;
    cbView3Ball: TAdvComboBox;
    sbSchrittSprung: TBitBtn;
    cbSprungFaktor: TComboBox;
    lSprungFaktor: TLabel;
    procedure FormShow(Sender: TObject);

    procedure sbPlayClick(Sender: TObject);
    procedure sbStopClick(Sender: TObject);
    procedure sbFrameDecClick(Sender: TObject);
    procedure sbFrameIncClick(Sender: TObject);

    procedure sbProjectNewClick(Sender: TObject);
    procedure sbProjectFolderClick(Sender: TObject);
    procedure cbProjectFilesChange(Sender: TObject);
    procedure sbProjectSaveUnderClick(Sender: TObject);
    procedure sbProjectPropertiesClick(Sender: TObject);

    procedure cbPlayRateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mLogChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbStepStartClick(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure Loggin1Click(Sender: TObject);
    procedure sbSchrittSpeichernClick(Sender: TObject);
    procedure View01Click(Sender: TObject);
    procedure View11Click(Sender: TObject);
    procedure View21Click(Sender: TObject);
    procedure View31Click(Sender: TObject);
    procedure sbProjectSaveClick(Sender: TObject);
    procedure EventsexportierenCSV1Click(Sender: TObject);
    procedure EventsexportierenExcel1Click(Sender: TObject);
    procedure sbGotoStepClick(Sender: TObject);
    procedure sbSchrittX10SpeichernClick(Sender: TObject);
  private
    procedure ProjectPropertiesLoad(PrjName: String);
    procedure SetPrjFormPos(MyPrjFormPos: TFormPos; MyValueListEd: TValueListEditor);
    procedure SetViewPos(MyViewForm: TForm; MyValueListEd: TValueListEditor);
    procedure ResetgEvent;
    procedure FrameIncClick(Anzahl: Integer);
  public
    { Public-Deklarationen }
  end;



type
    TVideoStatus = (vsNoVideo, vsBeforePlaying, vsPlaying, vsPause, vsResume, vsStopped, vsEndReached);

var
  frmMain: TfrmMain;
  FileVersion: TFileVersion;

  prjFolder: String;
  prjEvent: String;
  prjEventCSV: String;
  prjVideo: Array[0..3] of String;
  prjOffsetVideo: Array[0..3] of Int64; // -1 = Inaktiv; 0 >= Aktiv = Pos in ms
  prjTitleShow: Integer;
  prjTimecodeShow: Integer;
  prjAudio: Integer;
  prjFormPos: Array[0..3] of TFormPos;
  prjStepSize: Integer; // Schrittweite in ms

  VideoStatus: TVideoStatus;
  bLogOn: Boolean;
  xPosTC, yPosTC: Integer;
  clTC: TColor;
  fsTC: Integer;
  iSchritt: Int64;
  bCountSchritt: Boolean; // Flag, ob Schritte gezählt werden. True = Click sbStepStart; False = Click sbPlay oder sbStop


implementation

{$R *.dfm}

uses DlgFormView0, DlgFormView1, DlgFormView2, DlgFormView3, DlgFormEigenschaften, Tools,
  DlgFormInfo;

{
//Main-Form allways OnTop..
  In .dpr: Application.MainFormOnTaskbar := True; auskommentieren und FormStyle:=fsStayOnTop;
}


//=======================================================================================================================
procedure TfrmMain.FormCreate(Sender: TObject);
//=======================================================================================================================
begin
  // Dateiversion auslesen
  FileVersion:=TFileVersion.Create;
  FileVersion.ReadFromResources(Application.ExeName);
  frmMain.Caption:='MultiView ' +
                 ' (Version ' + IntToStr(FileVersion.Major) + '.' +
                                IntToStr(FileVersion.Minor) + '.' +
                                IntToStr(FileVersion.Release) +
                  ', Build ' + IntToStr(FileVersion.Build) + ') 06/2019 - 2019 Seifriz';

  // Tastendruck landet auf Formular
  KeyPreview:=True;

  // Button einstellen
  sbProjectFolder.Enabled:=True;
  sbProjectNew.Enabled:=False;
  sbProjectSave.Enabled:=False;
  sbProjectSaveUnder.Enabled:=False;
  sbProjectProperties.Enabled:=False;

  cbProjectFiles.Enabled:=False;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.FormShow(Sender: TObject);
//=======================================================================================================================
var i: Integer;
begin
  // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
  sbPlay.Glyph:=nil;
  imglPlay.GetBitmap(1, sbPlay.Glyph);
  sbPlay.Caption:='';
  VideoStatus:=vsNoVideo;

  // Frame: 0=DecBlue, 1=DecGray, 2=IncBlue, 3=IncGray
  sbFrameDec.Glyph:=nil;
  imglFrame.GetBitmap(1, sbFrameDec.Glyph);
  sbFrameInc.Caption:='';

  sbFrameInc.Glyph:=nil;
  imglFrame.GetBitmap(3, sbFrameInc.Glyph);
  sbFrameDec.Caption:='';

  // Stop: 0=StopBlue, 1=StopGray
  sbStop.Glyph:=nil;
  imglStop.GetBitmap(1, sbStop.Glyph);
  sbStop.Caption:='';

  // Step: 0=StepBlue, 1=StepGray, 2=StepGreen
  sbStepStart.Glyph:=nil;
  imglStep.GetBitmap(1, sbStepStart.Glyph);
  sbStepStart.Caption:='';

  // TimeCode-Eigenschaften  ==============================================> in Eigenschaften aufnehmen
  xPosTC:=10;
  yPosTC:=10;
  clTC:=clWhite;
  fsTC:=56;

  // Log
  Loggin1.Checked:=False;

  // Schrittzähler abbrechen
  bCountSchritt:=False;
  sbSchrittSpeichern.Enabled:=False;
  sbSchrittSprung.Enabled:=False;
  lSprungFaktor.Enabled:=False;
  cbSprungFaktor.Enabled:=False;
  iSchritt:=0;
  lSchritt.Caption:='Schritt: ???';
  pEvent.Enabled:=False;
  pEventGrid.Enabled:=False;

   // Default Views zeigen
  frmView0.Top:=10;
  frmView0.Left:=10;
  frmView0.Height:=300;
  frmView0.Width:=300;

  frmView1.Top:=40;
  frmView1.Left:=40;
  frmView1.Height:=300;
  frmView1.Width:=300;

  frmView2.Top:=70;
  frmView2.Left:=70;
  frmView2.Height:=300;
  frmView2.Width:=300;

  frmView3.Top:=100;
  frmView3.Left:=100;
  frmView3.Height:=300;
  frmView3.Width:=300;

  frmView0.Show;
  frmView1.Show;
  frmView2.Show;
  frmView3.Show;

  // Event-Grid
  gEvent.ColCount:=25;

  // Header First
  gEvent.Cells[0,0]:='Events';

  gEvent.Cells[1,0]:='View1 (Schiri 1)';
  gEvent.MergeCells(1,0,8,1);
  gEvent.FontColors[1,0]:=clRed;

  gEvent.Cells[9,0]:='View2 (Schiri 2)';
  gEvent.MergeCells(9,0,8,1);
  gEvent.FontColors[9,0]:=clGreen;

  gEvent.Cells[17,0]:='View3 (Schiri 3)';
  gEvent.MergeCells(17,0,8,1);
  gEvent.FontColors[17,0]:=clBlue;

  // Header Second
  gEvent.Cells[0,1]:='Schritt';

  gEvent.Cells[1,1]:='Zeit [ms]';
  gEvent.Cells[2,1]:='Aufgabe';
  gEvent.Cells[3,1]:='Eingehalten';
  gEvent.Cells[4,1]:='AOI';
  gEvent.Cells[5,1]:='Spieler-Nr.';
  gEvent.Cells[6,1]:='Spieler-Typ';
  gEvent.Cells[7,1]:='Ball';
  gEvent.Cells[8,1]:='Kommentar';
  for i:=1 to 8 do gEvent.FontColors[i,1]:=clRed;

  gEvent.Cells[9,1]:='Zeit [ms]';
  gEvent.Cells[10,1]:='Aufgabe';
  gEvent.Cells[11,1]:='Eingehalten';
  gEvent.Cells[12,1]:='AOI';
  gEvent.Cells[13,1]:='Spieler-Nr.';
  gEvent.Cells[14,1]:='Spieler-Typ';
  gEvent.Cells[15,1]:='Ball';
  gEvent.Cells[16,1]:='Kommentar';
  for i:=9 to 16 do gEvent.FontColors[i,1]:=clGreen;

  gEvent.Cells[17,1]:='Zeit [ms]';
  gEvent.Cells[18,1]:='Aufgabe';
  gEvent.Cells[19,1]:='Eingehalten';
  gEvent.Cells[20,1]:='AOI';
  gEvent.Cells[21,1]:='Spieler-Nr.';
  gEvent.Cells[22,1]:='Spieler-Typ';
  gEvent.Cells[23,1]:='Ball';
  gEvent.Cells[24,1]:='Kommentar';
  for i:=17 to 24 do gEvent.FontColors[i,1]:=clBlue;

  gEvent.AutoSize:=True;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.Beenden1Click(Sender: TObject);
//=======================================================================================================================
begin
  Close;
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.Info1Click(Sender: TObject);
//=======================================================================================================================
begin
  frmInfo.ShowModal;
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.View01Click(Sender: TObject);
//=======================================================================================================================
begin
  View01.Checked:= not View01.Checked;
  frmView0.Visible:=View01.Checked;
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.View11Click(Sender: TObject);
//=======================================================================================================================
begin
  View11.Checked:= not View11.Checked;
  frmView1.Visible:=View11.Checked;
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.View21Click(Sender: TObject);
//=======================================================================================================================
begin
  View21.Checked:= not View21.Checked;
  frmView2.Visible:=View21.Checked;
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.View31Click(Sender: TObject);
//=======================================================================================================================
begin
  View31.Checked:= not View31.Checked;
  frmView3.Visible:=View31.Checked;
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.Loggin1Click(Sender: TObject);
//=======================================================================================================================
begin
  Loggin1.Checked:= not Loggin1.Checked;

  if Loggin1.Checked then
  begin
    // Log
    bLogOn:=True;
    pLog.Visible:=True;
  end
  else
  begin
    // Log
    bLogOn:=False;
    pLog.Visible:=False;
  end;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//=======================================================================================================================
begin
  // Check ob mind. ein Video da ist...
  if cbProjectFiles.Items.Count > 0 then
  begin
    case Key of
    VK_SPACE: begin
                if ((frmMain.ActiveControl.Name <> 'eView1Kommentar') AND
                    (frmMain.ActiveControl.Name <> 'eView2Kommentar') AND
                    (frmMain.ActiveControl.Name <> 'eView3Kommentar')) then sbPlayClick(Self);
                Key:=0;
              end;
    VK_LEFT: begin
               if ((frmMain.ActiveControl.Name <> 'eView1Kommentar') AND
                   (frmMain.ActiveControl.Name <> 'eView2Kommentar') AND
                   (frmMain.ActiveControl.Name <> 'eView3Kommentar')) then sbFrameDecClick(Self);
               Key:=0;
             end;
    VK_RIGHT: begin
                if ((frmMain.ActiveControl.Name <> 'eView1Kommentar') AND
                    (frmMain.ActiveControl.Name <> 'eView2Kommentar') AND
                    (frmMain.ActiveControl.Name <> 'eView3Kommentar')) then sbFrameIncClick(Self);
                Key:=0;
              end;
    VK_ESCAPE: begin
                 if ((frmMain.ActiveControl.Name <> 'eView1Kommentar') AND
                     (frmMain.ActiveControl.Name <> 'eView2Kommentar') AND
                     (frmMain.ActiveControl.Name <> 'eView3Kommentar')) then sbStopClick(Self);
                 Key:=0;
               end;
    end;
  end;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.sbPlayClick(Sender: TObject);
//=======================================================================================================================
begin
  case VideoStatus of
    vsBeforePlaying, vsStopped, vsEndReached:
    begin
      // Logging
      if bLogOn then mLog.Lines.Add('Goto: Start without Offset');

      // Play -> Pause -> Seek
      frmView0.PasLibVlcPlayerView0.Play(frmEigenschaften.eFileView0.FileName);
      frmView0.PasLibVlcPlayerView0.Pause;
      if prjOffsetVideo[0] <> -1 then
      begin
        if frmView0.PasLibVlcPlayerView0.CanSeek() then
        begin
          frmView0.PasLibVlcPlayerView0.SetVideoPosInMs(prjOffsetVideo[0]);
          // Logging
          if bLogOn then mLog.Lines.Add('View0: offset = ' + IntToStr(prjOffsetVideo[0]));
          if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView0.PasLibVlcPlayerView0.GetVideoPosInMs));
        end;
      end;
      frmView0.PasLibVlcPlayerView0.Resume;

      frmView1.PasLibVlcPlayerView1.Play(frmEigenschaften.eFileView1.FileName);
      frmView1.PasLibVlcPlayerView1.Pause;
      if prjOffsetVideo[1] <> -1 then
      begin
        if frmView1.PasLibVlcPlayerView1.CanSeek() then
        begin
          frmView1.PasLibVlcPlayerView1.SetVideoPosInMs(prjOffsetVideo[1]);
          // Logging
          if bLogOn then mLog.Lines.Add('View1: offset = ' + IntToStr(prjOffsetVideo[1]));
          if bLogOn then mLog.Lines.Add('View1: seek to => ' + IntToStr(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs));
        end;
      end;
      frmView1.PasLibVlcPlayerView1.Resume;

      frmView2.PasLibVlcPlayerView2.Play(frmEigenschaften.eFileView2.FileName);
      frmView2.PasLibVlcPlayerView2.Pause;
      if prjOffsetVideo[2] <> -1 then
      begin
        if frmView2.PasLibVlcPlayerView2.CanSeek() then
        begin
          frmView2.PasLibVlcPlayerView2.SetVideoPosInMs(prjOffsetVideo[2]);
          // Logging
          if bLogOn then mLog.Lines.Add('View2: offset = ' + IntToStr(prjOffsetVideo[2]));
          if bLogOn then mLog.Lines.Add('View2: seek to => ' + IntToStr(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs));
        end;
      end;
      frmView2.PasLibVlcPlayerView2.Resume;

      frmView3.PasLibVlcPlayerView3.Play(frmEigenschaften.eFileView3.FileName);
      frmView3.PasLibVlcPlayerView3.Pause;
      if prjOffsetVideo[3] <> -1 then
      begin
        if frmView3.PasLibVlcPlayerView3.CanSeek() then
        begin
          frmView3.PasLibVlcPlayerView3.SetVideoPosInMs(prjOffsetVideo[3]);
          // Logging
          if bLogOn then mLog.Lines.Add('View3: offset = ' + IntToStr(prjOffsetVideo[3]));
          if bLogOn then mLog.Lines.Add('View3: seek to => ' + IntToStr(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs));
        end;
      end;
      frmView3.PasLibVlcPlayerView3.Resume;

      frmView0.tbView0.OnChange:=nil;
      frmView1.tbView1.OnChange:=nil;
      frmView2.tbView2.OnChange:=nil;
      frmView3.tbView3.OnChange:=nil;

      // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
      sbPlay.Glyph:=nil;
      imglPlay.GetBitmap(3, sbPlay.Glyph);

      // Frame: 0=DecBlue, 1=DecGray, 2=IncBlue, 3=IncGray
      sbFrameDec.Glyph:=nil;
      imglFrame.GetBitmap(1, sbFrameDec.Glyph);

      sbFrameInc.Glyph:=nil;
      imglFrame.GetBitmap(3, sbFrameInc.Glyph);

      // Stop: 0=StopBlue, 1=StopGray
      sbStop.Glyph:=nil;
      imglStop.GetBitmap(0, sbStop.Glyph);

      // Schrittzähler abbrechen
      bCountSchritt:=False;
      sbSchrittSpeichern.Enabled:=False;
      sbSchrittSprung.Enabled:=False;
      lSprungFaktor.Enabled:=False;
      cbSprungFaktor.Enabled:=False;
      iSchritt:=0;
      lSchritt.Caption:='Schritt: ???';
      pEvent.Enabled:=False;
      pEventGrid.Enabled:=False;

      // GotoStep
      sbGotoStep.Enabled:=False;
      seGotoStep.Enabled:=False;
      seGotoStep.MaxValue:=1;
      seGotoStep.Value:=0;

      // VideoStatus
      VideoStatus:=vsPlaying;

      // Logging
      if bLogOn then mLog.Lines.Add('VideoStatus: ' + GetEnumName(TypeInfo(TVideoStatus), Ord(VideoStatus)));

      frmMain.SetFocus;
    end;

    vsPause:
    begin
      // Resume
      frmView0.PasLibVlcPlayerView0.Resume;
      frmView1.PasLibVlcPlayerView1.Resume;
      frmView2.PasLibVlcPlayerView2.Resume;
      frmView3.PasLibVlcPlayerView3.Resume;

      frmView0.tbView0.OnChange:=nil;
      frmView1.tbView1.OnChange:=nil;
      frmView2.tbView2.OnChange:=nil;
      frmView3.tbView3.OnChange:=nil;

      // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
      sbPlay.Glyph:=nil;
      imglPlay.GetBitmap(3, sbPlay.Glyph);

      // Frame: 0=DecBlue, 1=DecGray, 2=IncBlue, 3=IncGray
      sbFrameDec.Glyph:=nil;
      imglFrame.GetBitmap(1, sbFrameDec.Glyph);

      sbFrameInc.Glyph:=nil;
      imglFrame.GetBitmap(3, sbFrameInc.Glyph);

      // Stop: 0=StopBlue, 1=StopGray
      sbStop.Glyph:=nil;
      imglStop.GetBitmap(0, sbStop.Glyph);

      // Schrittzähler abbrechen
      bCountSchritt:=False;
      sbSchrittSpeichern.Enabled:=False;
      sbSchrittSprung.Enabled:=False;
      lSprungFaktor.Enabled:=False;
      cbSprungFaktor.Enabled:=False;
      iSchritt:=0;
      lSchritt.Caption:='Schritt: ???';
      pEvent.Enabled:=False;
      pEventGrid.Enabled:=False;

      // GotoStep
      sbGotoStep.Enabled:=False;
      seGotoStep.Enabled:=False;
      seGotoStep.MaxValue:=1;
      seGotoStep.Value:=0;

      // VideoStatus
      VideoStatus:=vsPlaying;

      // Logging
      if bLogOn then mLog.Lines.Add('VideoStatus: ' + GetEnumName(TypeInfo(TVideoStatus), Ord(VideoStatus)));

      frmMain.SetFocus;
    end;

    vsPlaying, vsResume:
    begin
      // Pause
      frmView0.PasLibVlcPlayerView0.Pause;
      frmView1.PasLibVlcPlayerView1.Pause;
      frmView2.PasLibVlcPlayerView2.Pause;
      frmView3.PasLibVlcPlayerView3.Pause;

      frmView0.tbView0.OnChange:=frmView0.tbView0Change;
      frmView1.tbView1.OnChange:=frmView1.tbView1Change;
      frmView2.tbView2.OnChange:=frmView2.tbView2Change;
      frmView3.tbView3.OnChange:=frmView3.tbView3Change;

      // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
      sbPlay.Glyph:=nil;
      imglPlay.GetBitmap(2, sbPlay.Glyph);

      // Frame: 0=DecBlue, 1=DecGray, 2=IncBlue, 3=IncGray
      sbFrameDec.Glyph:=nil;
      imglFrame.GetBitmap(0, sbFrameDec.Glyph);

      sbFrameInc.Glyph:=nil;
      imglFrame.GetBitmap(2, sbFrameInc.Glyph);

      // Stop: 0=StopBlue, 1=StopGray
      sbStop.Glyph:=nil;
      imglStop.GetBitmap(0, sbStop.Glyph);
      sbStop.Caption:='';

      // Step: 0=StepBlue, 1=StepGray, 2=StepGreen
      sbStepStart.Glyph:=nil;
      imglStep.GetBitmap(2, sbStepStart.Glyph);
      sbStepStart.Caption:='';

      // VideoStatus
      VideoStatus:=vsPause;

      // Logging
      if bLogOn then mLog.Lines.Add('VideoStatus: ' + GetEnumName(TypeInfo(TVideoStatus), Ord(VideoStatus)));

      frmMain.SetFocus;
    end;
  end; //case
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.sbStopClick(Sender: TObject);
//=======================================================================================================================
begin
  case VideoStatus of
    vsPlaying, vsResume, vsPause:
    begin
      // Stop
      frmView0.PasLibVlcPlayerView0.Stop;
      frmView1.PasLibVlcPlayerView1.Stop;
      frmView2.PasLibVlcPlayerView2.Stop;
      frmView3.PasLibVlcPlayerView3.Stop;

      frmView0.PasLibVlcPlayerView0.SetVideoPosInMs(0);
      frmView0.PasLibVlcPlayerView0.Refresh;
      frmView1.PasLibVlcPlayerView1.SetVideoPosInMs(0);
      frmView1.PasLibVlcPlayerView1.Refresh;
      frmView2.PasLibVlcPlayerView2.SetVideoPosInMs(0);
      frmView2.PasLibVlcPlayerView2.Refresh;
      frmView3.PasLibVlcPlayerView3.SetVideoPosInMs(0);
       frmView3.PasLibVlcPlayerView3.Refresh;

      // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
      sbPlay.Glyph:=nil;
      imglPlay.GetBitmap(0, sbPlay.Glyph);

      // Frame: 0=DecBlue, 1=DecGray, 2=IncBlue, 3=IncGray
      sbFrameDec.Glyph:=nil;
      imglFrame.GetBitmap(1, sbFrameDec.Glyph);

      sbFrameInc.Glyph:=nil;
      imglFrame.GetBitmap(3, sbFrameInc.Glyph);

      // Stop: 0=StopBlue, 1=StopGray
      sbStop.Glyph:=nil;
      imglStop.GetBitmap(1, sbStop.Glyph);

      // Step: 0=StepBlue, 1=StepGray, 2=StepGreen
      sbStepStart.Glyph:=nil;
      imglStep.GetBitmap(1, sbStepStart.Glyph);
      sbStepStart.Caption:='';

      // Schrittzähler abbrechen
      bCountSchritt:=False;
      sbSchrittSpeichern.Enabled:=False;
      sbSchrittSprung.Enabled:=False;
      lSprungFaktor.Enabled:=False;
      cbSprungFaktor.Enabled:=False;
      iSchritt:=0;
      lSchritt.Caption:='Schritt: ???';
      pEvent.Enabled:=False;
      pEventGrid.Enabled:=False;

      // GotoStep
      sbGotoStep.Enabled:=False;
      seGotoStep.Enabled:=False;
      seGotoStep.MaxValue:=1;
      seGotoStep.Value:=0;

      // VideoStatus
      VideoStatus:=vsStopped;

      // Logging
      if bLogOn then mLog.Lines.Add('VideoStatus: ' + GetEnumName(TypeInfo(TVideoStatus), Ord(VideoStatus)));

      frmMain.SetFocus;
    end;
  end; //case
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.sbFrameDecClick(Sender: TObject);
//=======================================================================================================================
begin
  case VideoStatus of
    vsPause:
    begin
      if iSchritt > 0 then dec(iSchritt);
      lSchritt.Caption:='Schritt: ' + IntTostr(iSchritt);

      // Selected auf den aktuellen Eintrag
      gEvent.ClearRowSelect;
      gEvent.SelectRows(2 + iSchritt, 1);

      // Logging
      if bLogOn then mLog.Lines.Add('StepForward');
      if bLogOn then mLog.Lines.Add('Step #: ' + IntToStr(iSchritt));

      // BackFrame
      // Pos -40: 1ms = 0,001s <=> 25Hz = 0,04s <=> 40ms = 1 Frame
      if frmView0.PasLibVlcPlayerView0.CanSeek() then
      begin
        frmView0.PasLibVlcPlayerView0.SetVideoPosInMs(frmView0.PasLibVlcPlayerView0.GetVideoPosInMs - prjStepSize);
        frmView0.StatusPane1.Caption:=frmView0.PasLibVlcPLayerView0.GetVideoPosStr('hh:mm:ss.ms');
        frmView0.tbView0.Position:=frmView0.PasLibVlcPlayerView0.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView0.PasLibVlcPlayerView0.GetVideoPosInMs));
      end;

      if frmView1.PasLibVlcPlayerView1.CanSeek() then
      begin
        frmView1.PasLibVlcPlayerView1.SetVideoPosInMs(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs - prjStepSize);
        frmView1.StatusPane1.Caption:=frmView1.PasLibVlcPLayerView1.GetVideoPosStr('hh:mm:ss.ms');
        frmView1.tbView1.Position:=frmView1.PasLibVlcPlayerView1.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View1: seek to => ' + IntToStr(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs));
      end;

      if frmView2.PasLibVlcPlayerView2.CanSeek() then
      begin
        frmView2.PasLibVlcPlayerView2.SetVideoPosInMs(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs - prjStepSize);
        frmView2.StatusPane1.Caption:=frmView2.PasLibVlcPLayerView2.GetVideoPosStr('hh:mm:ss.ms');
        frmView2.tbView2.Position:=frmView2.PasLibVlcPlayerView2.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View2: seek to => ' + IntToStr(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs));
      end;

      if frmView3.PasLibVlcPlayerView3.CanSeek() then
      begin
        frmView3.PasLibVlcPlayerView3.SetVideoPosInMs(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs - prjStepSize);
        frmView3.StatusPane1.Caption:=frmView3.PasLibVlcPLayerView3.GetVideoPosStr('hh:mm:ss.ms');
        frmView3.tbView3.Position:=frmView3.PasLibVlcPlayerView3.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View3: seek to => ' + IntToStr(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs));
      end;
      if prjTimecodeShow = 1 then
      begin
        frmView0.PasLibVlcPlayerView0.MarqueeShowText(frmView0.PasLibVlcPlayerView0.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
        frmView1.PasLibVlcPlayerView1.MarqueeShowText(frmView1.PasLibVlcPlayerView1.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
        frmView2.PasLibVlcPlayerView2.MarqueeShowText(frmView2.PasLibVlcPlayerView2.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
        frmView3.PasLibVlcPlayerView3.MarqueeShowText(frmView3.PasLibVlcPlayerView3.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
      end;

      if prjOffsetVideo[0] <> -1 then frmView0.tbOffsetView0.Position:=frmView0.tbOffsetView0.Position;
      if prjOffsetVideo[1] <> -1 then frmView1.tbOffsetView1.Position:=frmView1.tbOffsetView1.Position;
      if prjOffsetVideo[2] <> -1 then frmView2.tbOffsetView2.Position:=frmView2.tbOffsetView2.Position;
      if prjOffsetVideo[3] <> -1 then frmView3.tbOffsetView3.Position:=frmView3.tbOffsetView3.Position;
    end;
  end; //case
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.sbFrameIncClick(Sender: TObject);
//=======================================================================================================================
begin
  FrameIncClick(1);
end;

//=======================================================================================================================
procedure TfrmMain.FrameIncClick(Anzahl: Integer);
//=======================================================================================================================
begin
  case VideoStatus of
  vsPause:
    begin
      inc(iSchritt);
      lSchritt.Caption:='Schritt: ' + IntTostr(iSchritt);

      // Selected auf den aktuellen Eintrag
      gEvent.ClearRowSelect;
      gEvent.SelectRows(2 + iSchritt, 1);

      // Logging
      if bLogOn then mLog.Lines.Add('StepForward');
      if bLogOn then mLog.Lines.Add('Step #: ' + IntToStr(iSchritt));

      // NextFrame
      // Bin mir nicht sicher, ob das prüfen auf seek notwendig; im Demo ist es nicht drin.....
      if frmView0.PasLibVlcPlayerView0.CanSeek() then
      begin
        ///frmView0.PasLibVlcPlayerView0.NextFrame;
        frmView0.PasLibVlcPlayerView0.SetVideoPosInMs(frmView0.PasLibVlcPlayerView0.GetVideoPosInMs + (prjStepSize * Anzahl));
        frmView0.StatusPane1.Caption:=frmView0.PasLibVlcPLayerView0.GetVideoPosStr('hh:mm:ss.ms');
        frmView0.tbView0.Position:=frmView0.PasLibVlcPlayerView0.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView0.PasLibVlcPlayerView0.GetVideoPosInMs));
      end;

      if frmView1.PasLibVlcPlayerView1.CanSeek() then
      begin
        ///frmView1.PasLibVlcPlayerView1.NextFrame;
        frmView1.PasLibVlcPlayerView1.SetVideoPosInMs(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs + (prjStepSize * Anzahl));
        frmView1.StatusPane1.Caption:=frmView1.PasLibVlcPLayerView1.GetVideoPosStr('hh:mm:ss.ms');
        frmView1.tbView1.Position:=frmView1.PasLibVlcPlayerView1.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View1: seek to => ' + IntToStr(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs));
      end;

      if frmView2.PasLibVlcPlayerView2.CanSeek() then
      begin
        ///frmView2.PasLibVlcPlayerView2.NextFrame;
        frmView2.PasLibVlcPlayerView2.SetVideoPosInMs(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs + (prjStepSize * Anzahl));
        frmView2.StatusPane1.Caption:=frmView2.PasLibVlcPLayerView2.GetVideoPosStr('hh:mm:ss.ms');
        frmView2.tbView2.Position:=frmView2.PasLibVlcPlayerView2.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View2: seek to => ' + IntToStr(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs));
      end;

      if frmView3.PasLibVlcPlayerView3.CanSeek() then
      begin
        ///frmView3.PasLibVlcPlayerView3.NextFrame;
        frmView3.PasLibVlcPlayerView3.SetVideoPosInMs(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs + (prjStepSize * Anzahl));
        frmView3.StatusPane1.Caption:=frmView3.PasLibVlcPLayerView3.GetVideoPosStr('hh:mm:ss.ms');
        frmView3.tbView3.Position:=frmView3.PasLibVlcPlayerView3.GetVideoPosInMs;
        // Logging
        if bLogOn then mLog.Lines.Add('View3: seek to => ' + IntToStr(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs));
      end;

      if prjTimecodeShow = 1 then
      begin
        frmView0.PasLibVlcPlayerView0.MarqueeShowText(frmView0.PasLibVlcPlayerView0.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
        frmView1.PasLibVlcPlayerView1.MarqueeShowText(frmView1.PasLibVlcPlayerView1.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
        frmView2.PasLibVlcPlayerView2.MarqueeShowText(frmView2.PasLibVlcPlayerView2.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
        frmView3.PasLibVlcPlayerView3.MarqueeShowText(frmView3.PasLibVlcPlayerView3.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
      end;

      if prjOffsetVideo[0] <> -1 then frmView0.tbOffsetView0.Position:=frmView0.tbOffsetView0.Position;
      if prjOffsetVideo[1] <> -1 then frmView1.tbOffsetView1.Position:=frmView1.tbOffsetView1.Position;
      if prjOffsetVideo[2] <> -1 then frmView2.tbOffsetView2.Position:=frmView2.tbOffsetView2.Position;
      if prjOffsetVideo[3] <> -1 then frmView3.tbOffsetView3.Position:=frmView3.tbOffsetView3.Position;
    end;
  end; //case
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.sbStepStartClick(Sender: TObject);
//=======================================================================================================================
begin
  case VideoStatus of
    vsPause:
    begin
      // Logging
      if bLogOn then mLog.Lines.Add('Goto: Start with Offset');

      // Videos auf Offset synchronisieren
      frmView0.PasLibVlcPlayerView0.Pause;
      frmView0.tbView0.OnChange:=frmView0.tbView0Change;
      if frmView0.PasLibVlcPlayerView0.CanSeek() then
      begin
        if prjOffsetVideo[0] = -1 then frmView0.PasLibVlcPlayerView0.SetVideoPosInMs(0)
        else frmView0.PasLibVlcPlayerView0.SetVideoPosInMs(prjOffsetVideo[0]);
        // Logging
        if bLogOn then mLog.Lines.Add('View0: offset = ' + IntToStr(prjOffsetVideo[0]));
        if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView0.PasLibVlcPlayerView0.GetVideoPosInMs));
      end;

      frmView1.PasLibVlcPlayerView1.Pause;
      frmView1.tbView1.OnChange:=frmView1.tbView1Change;
      if frmView1.PasLibVlcPlayerView1.CanSeek() then
      begin
        if prjOffsetVideo[1] = -1 then frmView1.PasLibVlcPlayerView1.SetVideoPosInMs(0)
        else frmView1.PasLibVlcPlayerView1.SetVideoPosInMs(prjOffsetVideo[1]);
        // Logging
        if bLogOn then mLog.Lines.Add('View0: offset = ' + IntToStr(prjOffsetVideo[1]));
        if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs));
      end;

      frmView2.PasLibVlcPlayerView2.Pause;
      frmView2.tbView2.OnChange:=frmView2.tbView2Change;
      if frmView2.PasLibVlcPlayerView2.CanSeek() then
      begin
        if prjOffsetVideo[2] = -1 then frmView2.PasLibVlcPlayerView2.SetVideoPosInMs(0)
        else frmView2.PasLibVlcPlayerView2.SetVideoPosInMs(prjOffsetVideo[2]);
        // Logging
        if bLogOn then mLog.Lines.Add('View0: offset = ' + IntToStr(prjOffsetVideo[2]));
        if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs));
      end;

      frmView3.PasLibVlcPlayerView3.Pause;
      frmView3.tbView3.OnChange:=frmView3.tbView3Change;
      if frmView3.PasLibVlcPlayerView3.CanSeek() then
      begin
        if prjOffsetVideo[3] = -1 then frmView3.PasLibVlcPlayerView3.SetVideoPosInMs(0)
        else frmView3.PasLibVlcPlayerView3.SetVideoPosInMs(prjOffsetVideo[3]);
        // Logging
        if bLogOn then mLog.Lines.Add('View0: offset = ' + IntToStr(prjOffsetVideo[3]));
        if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs));
      end;

      // Schrittzähler neu starten
      bCountSchritt:=True;
      sbSchrittSpeichern.Enabled:=True;
      sbSchrittSprung.Enabled:=True;
      lSprungFaktor.Enabled:=True;
      cbSprungFaktor.Enabled:=True;
      iSchritt:=0;
      lSchritt.Caption:='Schritt: ' + IntTostr(iSchritt);
      pEvent.Enabled:=True;
      pEventGrid.Enabled:=True;

      // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
      sbPlay.Glyph:=nil;
      imglPlay.GetBitmap(2, sbPlay.Glyph);
      sbPlay.Caption:='';
      VideoStatus:=vsBeforePlaying;

      // Frame: 0=DecBlue, 1=DecGray, 2=IncBlue, 3=IncGray
      sbFrameDec.Glyph:=nil;
      imglFrame.GetBitmap(0, sbFrameDec.Glyph);

      sbFrameInc.Glyph:=nil;
      imglFrame.GetBitmap(2, sbFrameInc.Glyph);

      // GotoStep
      sbGotoStep.Enabled:=True;
      seGotoStep.Enabled:=True;
      seGotoStep.MaxValue:=gEvent.RowCount - 3;
      seGotoStep.Value:=seGotoStep.MaxValue;

      // Selected auf den aktuellen Eintrag
      gEvent.ClearRowSelect;
      gEvent.SelectRows(2 + iSchritt, 1);

      // VideoStatus
      VideoStatus:=vsPause;

      // Logging
      if bLogOn then mLog.Lines.Add('VideoStatus: ' + GetEnumName(TypeInfo(TVideoStatus), Ord(VideoStatus)));
    end;
  end;
end;
//=======================================================================================================================


//-----------------------------------------------------------------------------------------------------------------------
procedure CreateTextFile(FileName: String);
//-----------------------------------------------------------------------------------------------------------------------
var f: Text;
begin
  // Projektdatei erstellen
  AssignFile(f, FileName);
  Rewrite(f);
  Writeln(f, '[Allgemein]');
  Writeln(f, 'TitleShow=1');
  Writeln(f, 'TimecodeShow=1');
  Writeln(f, 'StepSize=40');
  Writeln(f, 'Audio=5');
  Writeln(f, '[View0]');
  Writeln(f, 'Video=');
  Writeln(f, 'Offset=-1');
  Writeln(f, 'Top=10');
  Writeln(f, 'Left=10');
  Writeln(f, 'Height=300');
  Writeln(f, 'Width=300');
  Writeln(f, '[View1]');
  Writeln(f, 'Video=');
  Writeln(f, 'Offset=-1');
  Writeln(f, 'Top=40');
  Writeln(f, 'Left=40');
  Writeln(f, 'Height=300');
  Writeln(f, 'Width=300');
  Writeln(f, '[View2]');
  Writeln(f, 'Video=');
  Writeln(f, 'Offset=-1');
  Writeln(f, 'Top=70');
  Writeln(f, 'Left=70');
  Writeln(f, 'Height=300');
  Writeln(f, 'Width=300');
  Writeln(f, '[View3]');
  Writeln(f, 'Video=');
  Writeln(f, 'Offset=-1');
  Writeln(f, 'Top=100');
  Writeln(f, 'Left=100');
  Writeln(f, 'Height=300');
  Writeln(f, 'Width=300');
  CloseFile(f);
end;
//-----------------------------------------------------------------------------------------------------------------------

//=======================================================================================================================
procedure TfrmMain.sbProjectNewClick(Sender: TObject);
//=======================================================================================================================
var tmpFolderPath: String;
begin
  SaveDialog1.Title:='Neues Projekt erstellen';
  SaveDialog1.InitialDir:=prjFolder;
  if SaveDialog1.Execute then
  begin
    CreateTextFile(SaveDialog1.Filename);

    // Projektliste aktualisieren
    tmpFolderPath:=ExtractFilePath(SaveDialog1.Filename);
    cbProjectFiles.Items.Clear;
    GetFilesInDirectory(tmpFolderPath, '*.prj', cbProjectFiles.Items, False, True);
    cbProjectFiles.ItemIndex:=cbProjectFiles.Items.IndexOf(SaveDialog1.Filename);
    cbProjectFiles.Enabled:=True;

    // Button einstellen
    sbProjectFolder.Enabled:=True;
    sbProjectNew.Enabled:=True;
    sbProjectSave.Enabled:=True;
    sbProjectSaveUnder.Enabled:=True;
    sbProjectProperties.Enabled:=True;

    // Projekt-Eigenschaften aus prj-Datei laden
    ProjectPropertiesLoad(cbProjectFiles.Items[cbProjectFiles.ItemIndex]);

    // Eigenschaftsdialog
    sbProjectPropertiesClick(Self);

    // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
    sbPlay.Glyph:=nil;
    imglPlay.GetBitmap(0, sbPlay.Glyph);
    sbPlay.Caption:='';
    VideoStatus:=vsBeforePlaying;

    // Step: 0=StepBlue, 1=StepGray, 2=StepGreen
    sbStepStart.Glyph:=nil;
    imglStep.GetBitmap(1, sbStepStart.Glyph);
    sbStepStart.Caption:='';
  end;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.sbProjectFolderClick(Sender: TObject);
//=======================================================================================================================
begin
  KBrowseFolderDialog1.LabelText:='Projektordner auswählen';
  KBrowseFolderDialog1.Folder:=ExtractFilePath(ParamStr(0));
  if KBrowseFolderDialog1.Execute then
  begin
    prjFolder:=KBrowseFolderDialog1.Folder;

    // Logging löschen
    mLog.Clear;

    GetFilesInDirectory(KBrowseFolderDialog1.Folder, '*.prj', cbProjectFiles.Items, False, True);

    // Logging
    if bLogOn then mLog.Lines.Add('Projektordner gewählt: ' + prjFolder);

    // Button einstellen
    sbProjectFolder.Enabled:=True;
    sbProjectNew.Enabled:=True;

    // Projektdateien wurden gefunden
    if cbProjectFiles.Items.Count > 0 then
    begin
      cbProjectFiles.Enabled:=True;
      cbProjectFiles.ItemIndex:=0;

      // Button einstellen
      sbProjectFolder.Enabled:=True;
      sbProjectNew.Enabled:=True;
      sbProjectSave.Enabled:=True;
      sbProjectSaveUnder.Enabled:=True;
      sbProjectProperties.Enabled:=True;

      // Eigenschaften laden
      ProjectPropertiesLoad(cbProjectFiles.Items[cbProjectFiles.ItemIndex]);

      // Play: 0=PlayBlau, 1=PlayGray, 2=PlayGreen, 3=PauseBlue, 4=PauseGray
      sbPlay.Glyph:=nil;
      imglPlay.GetBitmap(0, sbPlay.Glyph);
      sbPlay.Caption:='';
      VideoStatus:=vsBeforePlaying;

      // Step: 0=StepBlue, 1=StepGray, 2=StepGreen
      sbStepStart.Glyph:=nil;
      imglStep.GetBitmap(1, sbStepStart.Glyph);
      sbStepStart.Caption:='';

      // Logging
      if bLogOn then mLog.Lines.Add('VideoStatus: ' + GetEnumName(TypeInfo(TVideoStatus), Ord(VideoStatus)));
    end;
  end;
end;
//=======================================================================================================================


//-----------------------------------------------------------------------------------------------------------------------
procedure TfrmMain.ProjectPropertiesLoad(PrjName: String);
//-----------------------------------------------------------------------------------------------------------------------
// prj-Datei ==> prj*-Variable
// prj*-Variable ==> frmEigenschaften
// prj*Variable ==> frmView
//-----------------------------------------------------------------------------------------------------------------------
var iniTemp: TIniFile;
begin
  // Grid leeren
  ResetgEvent;

  // Events laden (BIN Format)
  prjEvent:=ChangeFileExt(cbProjectFiles.Items[cbProjectFiles.ItemIndex], '.bin');
  if FileExists(prjEvent) then gEvent.LoadFromBINFile(prjEvent)
  else MessageDlg('Es wurden keine Eventeinträge gefunden!' + #10#13 +
                  'Datei: "' + prjEvent +  '" konnte nicht gefunden werden.' , mtInformation, [mbOK], 0);

  // prj-Datei ==> prj*-Variable
  iniTemp:=TIniFile.Create(PrjName);
  try
    // Allgemein
    prjTitleShow:=iniTemp.ReadInteger('Allgemein', 'TitleShow', 1);
    prjTimecodeShow:=iniTemp.ReadInteger('Allgemein', 'TimecodeShow', 1);
    prjStepSize:=iniTemp.ReadInteger('Allgemein', 'StepSize', 40);
    prjAudio:=iniTemp.ReadInteger('Allgemein', 'Audio', 0);

    // Sektion: View0
    prjVideo[0]:=iniTemp.ReadString('View0', 'Video', 'C:\');
    prjOffsetVideo[0]:=iniTemp.ReadInteger('View0', 'Offset', -1);
    prjFormPos[0].Top:=iniTemp.ReadInteger('View0', 'Top', 0);
    prjFormPos[0].Left:=iniTemp.ReadInteger('View0', 'Left', 0);
    prjFormPos[0].Height:=iniTemp.ReadInteger('View0', 'Height', 300);
    prjFormPos[0].Width:=iniTemp.ReadInteger('View0', 'Width', 300);

    // Sektion: View1
    prjVideo[1]:=iniTemp.ReadString('View1', 'Video', 'C:\');
    prjOffsetVideo[1]:=iniTemp.ReadInteger('View1', 'Offset', -1);
    prjFormPos[1].Top:=iniTemp.ReadInteger('View1', 'Top', 10);
    prjFormPos[1].Left:=iniTemp.ReadInteger('View1', 'Left', 10);
    prjFormPos[1].Height:=iniTemp.ReadInteger('View1', 'Height', 300);
    prjFormPos[1].Width:=iniTemp.ReadInteger('View1', 'Width', 300);

    // Sektion: View2
    prjVideo[2]:=iniTemp.ReadString('View2', 'Video', 'C:\');
    prjOffsetVideo[2]:=iniTemp.ReadInteger('View2', 'Offset', -1);
    prjFormPos[2].Top:=iniTemp.ReadInteger('View2', 'Top', 20);
    prjFormPos[2].Left:=iniTemp.ReadInteger('View2', 'Left', 20);
    prjFormPos[2].Height:=iniTemp.ReadInteger('View2', 'Height', 300);
    prjFormPos[2].Width:=iniTemp.ReadInteger('View2', 'Width', 300);

    // Sektion: View3
    prjVideo[3]:=iniTemp.ReadString('View3', 'Video', 'C:\');
    prjOffsetVideo[3]:=iniTemp.ReadInteger('View3', 'Offset', -1);
    prjFormPos[3].Top:=iniTemp.ReadInteger('View3', 'Top', 30);
    prjFormPos[3].Left:=iniTemp.ReadInteger('View3', 'Left', 30);
    prjFormPos[3].Height:=iniTemp.ReadInteger('View3', 'Height', 300);
    prjFormPos[3].Width:=iniTemp.ReadInteger('View3', 'Width', 300);


    // prj*-Variable ==> frmEigenschaften
    // Views
    frmEigenschaften.eFileView0.FileName:=prjVideo[0];
    frmEigenschaften.eOffsetView0.Value:=prjOffsetVideo[0];
    frmEigenschaften.eFileView1.FileName:=prjVideo[1];
    frmEigenschaften.eOffsetView1.Value:=prjOffsetVideo[1];
    frmEigenschaften.eFileView2.FileName:=prjVideo[2];
    frmEigenschaften.eOffsetView2.Value:=prjOffsetVideo[2];
    frmEigenschaften.eFileView3.FileName:=prjVideo[3];
    frmEigenschaften.eOffsetView3.Value:=prjOffsetVideo[3];

    frmEigenschaften.vlView0.Values['Top']:=IntToStr(prjFormPos[0].Top);
    frmEigenschaften.vlView0.Values['Left']:=IntToStr(prjFormPos[0].Left);
    frmEigenschaften.vlView0.Values['Height']:=IntToStr(prjFormPos[0].Height);
    frmEigenschaften.vlView0.Values['Width']:=IntToStr(prjFormPos[0].Width);

    frmEigenschaften.vlView1.Values['Top']:=IntToStr(prjFormPos[1].Top);
    frmEigenschaften.vlView1.Values['Left']:=IntToStr(prjFormPos[1].Left);
    frmEigenschaften.vlView1.Values['Height']:=IntToStr(prjFormPos[1].Height);
    frmEigenschaften.vlView1.Values['Width']:=IntToStr(prjFormPos[1].Width);

    frmEigenschaften.vlView2.Values['Top']:=IntToStr(prjFormPos[2].Top);
    frmEigenschaften.vlView2.Values['Left']:=IntToStr(prjFormPos[2].Left);
    frmEigenschaften.vlView2.Values['Height']:=IntToStr(prjFormPos[2].Height);
    frmEigenschaften.vlView2.Values['Width']:=IntToStr(prjFormPos[2].Width);

    frmEigenschaften.vlView3.Values['Top']:=IntToStr(prjFormPos[3].Top);
    frmEigenschaften.vlView3.Values['Left']:=IntToStr(prjFormPos[3].Left);
    frmEigenschaften.vlView3.Values['Height']:=IntToStr(prjFormPos[3].Height);
    frmEigenschaften.vlView3.Values['Width']:=IntToStr(prjFormPos[3].Width);

    if prjTitleShow = 1 then frmEigenschaften.cbTitleShow.Checked:=True
    else frmEigenschaften.cbTitleShow.Checked:=False;

    if prjTimecodeShow = 1 then frmEigenschaften.cbTimecodeShow.Checked:=True
    else frmEigenschaften.cbTimecodeShow.Checked:=False;

    frmEigenschaften.eStepSize.Value:=prjStepSize;

    // Audio
    if prjAudio > 0 then
    begin
      frmEigenschaften.gbAudio.CheckBox.State:=cbChecked;
      frmEigenschaften.tbAudio.Position:=prjAudio;
    end;

    // prj*Variable ==> frmView
    frmView0.Top:=prjFormPos[0].Top;
    frmView0.Left:=prjFormPos[0].Left;
    frmView0.Height:=prjFormPos[0].Height;
    frmView0.Width:=prjFormPos[0].Width;

    frmView1.Top:=prjFormPos[1].Top;
    frmView1.Left:=prjFormPos[1].Left;
    frmView1.Height:=prjFormPos[1].Height;
    frmView1.Width:=prjFormPos[1].Width;

    frmView2.Top:=prjFormPos[2].Top;
    frmView2.Left:=prjFormPos[2].Left;
    frmView2.Height:=prjFormPos[2].Height;
    frmView2.Width:=prjFormPos[2].Width;

    frmView3.Top:=prjFormPos[3].Top;
    frmView3.Left:=prjFormPos[3].Left;
    frmView3.Height:=prjFormPos[3].Height;
    frmView3.Width:=prjFormPos[3].Width;

    // Marker
    if prjOffsetVideo[0] <> -1 then
    begin
      frmView0.tbView0.Position:=prjOffsetVideo[0];
      frmView0.tbOffsetView0.Position:=prjOffsetVideo[0];
      frmView0.StatusPane3.Caption:='Offset: ' + IntToStr(prjOffsetVideo[0]);
      // Farbwechsel
      frmView0.tbOffsetView0.Thumb.BorderColorDisabled:=clRed;
      frmView0.tbOffsetView0.Thumb.ColorDisabled:=clRed;
      frmView0.tbOffsetView0.Thumb.ColorMirrorDisabled:=clRed;
      frmView0.tbOffsetView0.Thumb.ColorDisabledTo:=$007777FF;
      frmView0.tbOffsetView0.Thumb.ColorMirrorDisabledTo:=$007777FF;
      frmView0.tbOffsetView0.Slider.BorderColorDisabled:=clRed;
    end else
    begin
      frmView0.tbView0.Position:=prjOffsetVideo[0];
      frmView0.tbOffsetView0.Position:=prjOffsetVideo[0];
      frmView0.StatusPane3.Caption:='Offset: ---';
      // Farbwechsel
      frmView0.tbOffsetView0.Thumb.BorderColorDisabled:=clGreen;
      frmView0.tbOffsetView0.Thumb.ColorDisabled:=clGreen;
      frmView0.tbOffsetView0.Thumb.ColorMirrorDisabled:=clGreen;
      frmView0.tbOffsetView0.Thumb.ColorDisabledTo:=$0000AA00;
      frmView0.tbOffsetView0.Thumb.ColorMirrorDisabledTo:=$0000AA00;
      frmView0.tbOffsetView0.Slider.BorderColorDisabled:=clGreen;
    end;

    if prjOffsetVideo[1] <> -1 then
    begin
      frmView1.tbView1.Position:=prjOffsetVideo[1];
      frmView1.tbOffsetView1.Position:=prjOffsetVideo[1];
      frmView1.StatusPane3.Caption:='Offset: ' + IntToStr(prjOffsetVideo[1]);
      // Farbwechsel
      frmView1.tbOffsetView1.Thumb.BorderColorDisabled:=clRed;
      frmView1.tbOffsetView1.Thumb.ColorDisabled:=clRed;
      frmView1.tbOffsetView1.Thumb.ColorMirrorDisabled:=clRed;
      frmView1.tbOffsetView1.Thumb.ColorDisabledTo:=$007777FF;
      frmView1.tbOffsetView1.Thumb.ColorMirrorDisabledTo:=$007777FF;
      frmView1.tbOffsetView1.Slider.BorderColorDisabled:=clRed;
    end else
    begin
      frmView1.tbView1.Position:=prjOffsetVideo[1];
      frmView1.tbOffsetView1.Position:=prjOffsetVideo[1];
      frmView1.StatusPane3.Caption:='Offset: ---';
      // Farbwechsel
      frmView1.tbOffsetView1.Thumb.BorderColorDisabled:=clGreen;
      frmView1.tbOffsetView1.Thumb.ColorDisabled:=clGreen;
      frmView1.tbOffsetView1.Thumb.ColorMirrorDisabled:=clGreen;
      frmView1.tbOffsetView1.Thumb.ColorDisabledTo:=$0000AA00;
      frmView1.tbOffsetView1.Thumb.ColorMirrorDisabledTo:=$0000AA00;
      frmView1.tbOffsetView1.Slider.BorderColorDisabled:=clGreen;
    end;

    if prjOffsetVideo[2] <> -1 then
    begin
      frmView2.tbView2.Position:=prjOffsetVideo[2];
      frmView2.tbOffsetView2.Position:=prjOffsetVideo[2];
      frmView2.StatusPane3.Caption:='Offset: ' + IntToStr(prjOffsetVideo[2]);
      // Farbwechsel
      frmView2.tbOffsetView2.Thumb.BorderColorDisabled:=clRed;
      frmView2.tbOffsetView2.Thumb.ColorDisabled:=clRed;
      frmView2.tbOffsetView2.Thumb.ColorMirrorDisabled:=clRed;
      frmView2.tbOffsetView2.Thumb.ColorDisabledTo:=$007777FF;
      frmView2.tbOffsetView2.Thumb.ColorMirrorDisabledTo:=$007777FF;
      frmView2.tbOffsetView2.Slider.BorderColorDisabled:=clRed;
    end else
    begin
      frmView2.tbView2.Position:=prjOffsetVideo[2];
      frmView2.tbOffsetView2.Position:=prjOffsetVideo[2];
      frmView2.StatusPane3.Caption:='Offset: ---';
      // Farbwechsel
      frmView2.tbOffsetView2.Thumb.BorderColorDisabled:=clGreen;
      frmView2.tbOffsetView2.Thumb.ColorDisabled:=clGreen;
      frmView2.tbOffsetView2.Thumb.ColorMirrorDisabled:=clGreen;
      frmView2.tbOffsetView2.Thumb.ColorDisabledTo:=$0000AA00;
      frmView2.tbOffsetView2.Thumb.ColorMirrorDisabledTo:=$0000AA00;
      frmView2.tbOffsetView2.Slider.BorderColorDisabled:=clGreen;
    end;

    if prjOffsetVideo[3] <> -1 then
    begin
      frmView3.tbView3.Position:=prjOffsetVideo[3];
      frmView3.tbOffsetView3.Position:=prjOffsetVideo[3];
      frmView3.StatusPane3.Caption:='Offset: ' + IntToStr(prjOffsetVideo[3]);
      // Farbwechsel
      frmView3.tbOffsetView3.Thumb.BorderColorDisabled:=clRed;
      frmView3.tbOffsetView3.Thumb.ColorDisabled:=clRed;
      frmView3.tbOffsetView3.Thumb.ColorMirrorDisabled:=clRed;
      frmView3.tbOffsetView3.Thumb.ColorDisabledTo:=$007777FF;
      frmView3.tbOffsetView3.Thumb.ColorMirrorDisabledTo:=$007777FF;
      frmView3.tbOffsetView3.Slider.BorderColorDisabled:=clRed;
    end else
    begin
      frmView3.tbView3.Position:=prjOffsetVideo[3];
      frmView3.tbOffsetView3.Position:=prjOffsetVideo[3];
      frmView3.StatusPane3.Caption:='Offset: ---';
      // Farbwechsel
      frmView3.tbOffsetView3.Thumb.BorderColorDisabled:=clGreen;
      frmView3.tbOffsetView3.Thumb.ColorDisabled:=clGreen;
      frmView3.tbOffsetView3.Thumb.ColorMirrorDisabled:=clGreen;
      frmView3.tbOffsetView3.Thumb.ColorDisabledTo:=$0000AA00;
      frmView3.tbOffsetView3.Thumb.ColorMirrorDisabledTo:=$0000AA00;
      frmView3.tbOffsetView3.Slider.BorderColorDisabled:=clGreen;
    end;

    // Hin und Her damit Keysteuerung funktioniert...????
    frmView0.SetFocus;
    frmView1.SetFocus;
    frmView2.SetFocus;
    frmView3.SetFocus;
    frmMain.SetFocus;
 finally
    FreeAndNil(iniTemp);
 end;
end;
//-----------------------------------------------------------------------------------------------------------------------


//=======================================================================================================================
procedure TfrmMain.cbProjectFilesChange(Sender: TObject);
//=======================================================================================================================
begin
  // Projekt-Eigenschaften aus prj-Datei laden
  ProjectPropertiesLoad(cbProjectFiles.Items[cbProjectFiles.ItemIndex]);
end;
//=======================================================================================================================

//=======================================================================================================================
procedure TfrmMain.sbProjectSaveClick(Sender: TObject);
//=======================================================================================================================
var iniTemp: TIniFile;
begin
  // Events speichern (Bin Format)
  prjEvent:=ChangeFileExt(cbProjectFiles.Items[cbProjectFiles.ItemIndex], '.bin');
  gEvent.SaveToBINFile(prjEvent);

  // Views-Properties/frmEigenschaften ==> prj-Datei
  iniTemp:=TIniFile.Create(cbProjectFiles.Items[cbProjectFiles.ItemIndex]);
  try
    // Allgemein
    if frmEigenschaften.cbTitleShow.Checked then iniTemp.WriteInteger('Allgemein', 'TitleShow', 1)
    else iniTemp.WriteInteger('Allgemein', 'TitleShow', 0);
    if frmEigenschaften.cbTimecodeShow.Checked then iniTemp.WriteInteger('Allgemein', 'TimecodeShow', 1)
    else iniTemp.WriteInteger('Allgemein', 'TimecodeShow', 0);
    iniTemp.WriteInteger('Allgemein', 'StepSize', frmEigenschaften.eStepSize.Value);
    if frmEigenschaften.gbAudio.CheckBox.State = cbUnchecked then iniTemp.WriteInteger('Allgemein', 'Audio', 0)
    else iniTemp.WriteInteger('Allgemein', 'Audio', frmEigenschaften.tbAudio.Position);
    // Sektion: View1
    iniTemp.WriteString('View0', 'Video', frmEigenschaften.eFileView0.FileName);
    iniTemp.WriteInteger('View0', 'Offset', frmEigenschaften.eOffsetView0.Value);
    iniTemp.WriteString('View0', 'Top', frmEigenschaften.vlView0.Values['Top']);
    iniTemp.WriteString('View0', 'Left', frmEigenschaften.vlView0.Values['Left']);
    iniTemp.WriteString('View0', 'Height', frmEigenschaften.vlView0.Values['Height']);
    iniTemp.WriteString('View0', 'Width',frmEigenschaften.vlView0.Values['Width']);
    // Sektion: View2
    iniTemp.WriteString('View1', 'Video', frmEigenschaften.eFileView1.FileName);
    iniTemp.WriteInteger('View1', 'Offset', frmEigenschaften.eOffsetView1.Value);
    iniTemp.WriteString('View1', 'Top', frmEigenschaften.vlView1.Values['Top']);
    iniTemp.WriteString('View1', 'Left', frmEigenschaften.vlView1.Values['Left']);
    iniTemp.WriteString('View1', 'Height', frmEigenschaften.vlView1.Values['Height']);
    iniTemp.WriteString('View1', 'Width',frmEigenschaften.vlView1.Values['Width']);
    // Sektion: View3
    iniTemp.WriteString('View2', 'Video', frmEigenschaften.eFileView2.FileName);
    iniTemp.WriteInteger('View2', 'Offset', frmEigenschaften.eOffsetView2.Value);
    iniTemp.WriteString('View2', 'Top', frmEigenschaften.vlView2.Values['Top']);
    iniTemp.WriteString('View2', 'Left', frmEigenschaften.vlView2.Values['Left']);
    iniTemp.WriteString('View2', 'Height', frmEigenschaften.vlView2.Values['Height']);
    iniTemp.WriteString('View2', 'Width',frmEigenschaften.vlView2.Values['Width']);
    // Sektion: View4
    iniTemp.WriteString('View3', 'Video', frmEigenschaften.eFileView3.FileName);
    iniTemp.WriteInteger('View3', 'Offset', frmEigenschaften.eOffsetView3.Value);
    iniTemp.WriteString('View3', 'Top', frmEigenschaften.vlView3.Values['Top']);
    iniTemp.WriteString('View3', 'Left', frmEigenschaften.vlView3.Values['Left']);
    iniTemp.WriteString('View3', 'Height', frmEigenschaften.vlView3.Values['Height']);
    iniTemp.WriteString('View3', 'Width',frmEigenschaften.vlView3.Values['Width']);
  finally
    FreeAndNil(iniTemp);
  end;

  // Views-Properties/frmEigenschaften ==> prj*-Variablen
  // Video
  prjVideo[0]:=frmEigenschaften.eFileView0.FileName;
  prjOffsetVideo[0]:=frmEigenschaften.eOffsetView0.Value;
  prjVideo[1]:=frmEigenschaften.eFileView1.FileName;
  prjOffsetVideo[1]:=frmEigenschaften.eOffsetView1.Value;
  prjVideo[2]:=frmEigenschaften.eFileView2.FileName;
  prjOffsetVideo[2]:=frmEigenschaften.eOffsetView2.Value;
  prjVideo[3]:=frmEigenschaften.eFileView3.FileName;
  prjOffsetVideo[3]:=frmEigenschaften.eOffsetView3.Value;

  // TitleShow
  if frmEigenschaften.cbTitleShow.Checked then prjTitleShow:=1
  else prjTitleShow:=0;

  // TimeCodeShow
  if frmEigenschaften.cbTimeCodeShow.Checked then prjTimecodeShow:=1
  else prjTimecodeShow:=0;

  prjStepSize:=frmEigenschaften.eStepSize.Value;

  // Audio
  prjAudio:=frmEigenschaften.tbAudio.Position;

  // Views
  SetPrjFormPos(prjFormPos[0], frmEigenschaften.vlView0);
  SetPrjFormPos(prjFormPos[1], frmEigenschaften.vlView1);
  SetPrjFormPos(prjFormPos[2], frmEigenschaften.vlView2);
  SetPrjFormPos(prjFormPos[3], frmEigenschaften.vlView3);

  // Marker
end;
//=======================================================================================================================



//=======================================================================================================================
procedure TfrmMain.sbProjectSaveUnderClick(Sender: TObject);
//=======================================================================================================================
// Views-Properties/frmEigenschaften ==> prj-Datei
// Views-Properties/frmEigenschaften ==> prj*-Variablen
//=======================================================================================================================
var iniTemp: TIniFile;
begin
  SaveDialog1.Title:='Projekt speichern';
  SaveDialog1.FileName:=cbProjectFiles.Items[cbProjectFiles.ItemIndex];
  if SaveDialog1.Execute then
  begin
    // Views-Properties/frmEigenschaften ==> prj-Datei
    iniTemp:=TIniFile.Create(cbProjectFiles.Items[cbProjectFiles.ItemIndex]);
    try
      // Allgemein
      if frmEigenschaften.cbTitleShow.Checked then iniTemp.WriteInteger('Allgemein', 'TitleShow', 1)
      else iniTemp.WriteInteger('Allgemein', 'TitleShow', 0);
      if frmEigenschaften.cbTimecodeShow.Checked then iniTemp.WriteInteger('Allgemein', 'TimecodeShow', 1)
      else iniTemp.WriteInteger('Allgemein', 'TimecodeShow', 0);
      iniTemp.WriteInteger('Allgemein', 'StepSize', frmEigenschaften.eStepSize.Value);
      if frmEigenschaften.gbAudio.CheckBox.State = cbUnchecked then iniTemp.WriteInteger('Allgemein', 'Audio', 0)
      else iniTemp.WriteInteger('Allgemein', 'Audio', frmEigenschaften.tbAudio.Position);
      // Sektion: View1
      iniTemp.WriteString('View0', 'Video', frmEigenschaften.eFileView0.FileName);
      iniTemp.WriteInteger('View0', 'Offset', frmEigenschaften.eOffsetView0.Value);
      iniTemp.WriteString('View0', 'Top', frmEigenschaften.vlView0.Values['Top']);
      iniTemp.WriteString('View0', 'Left', frmEigenschaften.vlView0.Values['Left']);
      iniTemp.WriteString('View0', 'Height', frmEigenschaften.vlView0.Values['Height']);
      iniTemp.WriteString('View0', 'Width',frmEigenschaften.vlView0.Values['Width']);
      // Sektion: View2
      iniTemp.WriteString('View1', 'Video', frmEigenschaften.eFileView1.FileName);
      iniTemp.WriteInteger('View1', 'Offset', frmEigenschaften.eOffsetView1.Value);
      iniTemp.WriteString('View1', 'Top', frmEigenschaften.vlView1.Values['Top']);
      iniTemp.WriteString('View1', 'Left', frmEigenschaften.vlView1.Values['Left']);
      iniTemp.WriteString('View1', 'Height', frmEigenschaften.vlView1.Values['Height']);
      iniTemp.WriteString('View1', 'Width',frmEigenschaften.vlView1.Values['Width']);
      // Sektion: View3
      iniTemp.WriteString('View2', 'Video', frmEigenschaften.eFileView2.FileName);
      iniTemp.WriteInteger('View2', 'Offset', frmEigenschaften.eOffsetView2.Value);
      iniTemp.WriteString('View2', 'Top', frmEigenschaften.vlView2.Values['Top']);
      iniTemp.WriteString('View2', 'Left', frmEigenschaften.vlView2.Values['Left']);
      iniTemp.WriteString('View2', 'Height', frmEigenschaften.vlView2.Values['Height']);
      iniTemp.WriteString('View2', 'Width',frmEigenschaften.vlView2.Values['Width']);
      // Sektion: View4
      iniTemp.WriteString('View3', 'Video', frmEigenschaften.eFileView3.FileName);
      iniTemp.WriteInteger('View3', 'Offset', frmEigenschaften.eOffsetView3.Value);
      iniTemp.WriteString('View3', 'Top', frmEigenschaften.vlView3.Values['Top']);
      iniTemp.WriteString('View3', 'Left', frmEigenschaften.vlView3.Values['Left']);
      iniTemp.WriteString('View3', 'Height', frmEigenschaften.vlView3.Values['Height']);
      iniTemp.WriteString('View3', 'Width',frmEigenschaften.vlView3.Values['Width']);
    finally
      FreeAndNil(iniTemp);
    end;

    // Views-Properties/frmEigenschaften ==> prj*-Variablen
    // Video
    prjVideo[0]:=frmEigenschaften.eFileView0.FileName;
    prjOffsetVideo[0]:=frmEigenschaften.eOffsetView0.Value;
    prjVideo[1]:=frmEigenschaften.eFileView1.FileName;
    prjOffsetVideo[1]:=frmEigenschaften.eOffsetView1.Value;
    prjVideo[2]:=frmEigenschaften.eFileView2.FileName;
    prjOffsetVideo[2]:=frmEigenschaften.eOffsetView2.Value;
    prjVideo[3]:=frmEigenschaften.eFileView3.FileName;
    prjOffsetVideo[3]:=frmEigenschaften.eOffsetView3.Value;

    // TitleShow
    if frmEigenschaften.cbTitleShow.Checked then prjTitleShow:=1
    else prjTitleShow:=0;

    // TimeCodeShow
    if frmEigenschaften.cbTimeCodeShow.Checked then prjTimecodeShow:=1
    else prjTimecodeShow:=0;

    prjStepSize:=frmEigenschaften.eStepSize.Value;

    // Audio
    prjAudio:=frmEigenschaften.tbAudio.Position;

    // Views
    SetPrjFormPos(prjFormPos[0], frmEigenschaften.vlView0);
    SetPrjFormPos(prjFormPos[1], frmEigenschaften.vlView1);
    SetPrjFormPos(prjFormPos[2], frmEigenschaften.vlView2);
    SetPrjFormPos(prjFormPos[3], frmEigenschaften.vlView3);

    // Marker
  end;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.EventsexportierenCSV1Click(Sender: TObject);
//=======================================================================================================================
begin
  SaveDialog1.Title:='Events exportieren (CSV)';
  SaveDialog1.DefaultExt:='csv';
  SaveDialog1.Filter:='CSV-Datei (*.csv)|*.csv|Alle Dateien (*.*)|*.*';
  SaveDialog1.FileName:=ChangeFileExt(cbProjectFiles.Items[cbProjectFiles.ItemIndex], '.csv');
  if SaveDialog1.Execute then
  begin
    // Events speichern (CSV)
    gEvent.Delimiter:=';';
    gEvent.QuoteEmptyCells:=False;
    gEvent.SaveToCSV(SaveDialog1.FileName);
  end;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.EventsexportierenExcel1Click(Sender: TObject);
//=======================================================================================================================
begin
  SaveDialog1.Title:='Events exportieren (Excel 2013)';
  SaveDialog1.DefaultExt:='xls';
  SaveDialog1.Filter:='Excel-Datei (*.xls)|*.xls|Alle Dateien (*.*)|*.*';
  SaveDialog1.FileName:=ChangeFileExt(cbProjectFiles.Items[cbProjectFiles.ItemIndex], '.xls');
  if SaveDialog1.Execute then
  begin
    // Events speichern (XLS)
    /// gEvent.SaveToXLS(SaveDialog1.FileName);
    AdvGridExcelIO1.XLSExport(SaveDialog1.FileName);
  end;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.SetPrjFormPos(MyPrjFormPos: TFormPos; MyValueListEd: TValueListEditor);
//=======================================================================================================================
begin
  MyPrjFormPos.Top:=StrToInt(MyValueListEd.Values['Top']);
  MyPrjFormPos.Left:=StrToInt(MyValueListEd.Values['Left']);
  MyPrjFormPos.Height:=StrToInt(MyValueListEd.Values['Height']);
  MyPrjFormPos.Width:=StrToInt(MyValueListEd.Values['Width']);
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.sbProjectPropertiesClick(Sender: TObject);
//=======================================================================================================================
// frmEigenschaften ==> Views
//=======================================================================================================================
begin
  if frmEigenschaften.ShowModal = mrOK then
  begin
    // Reset
    frmView0.PasLibVlcPlayerView0.Stop;
    frmView1.PasLibVlcPlayerView1.Stop;
    frmView2.PasLibVlcPlayerView2.Stop;
    frmView3.PasLibVlcPlayerView3.Stop;

    // Video
    // Videodateien bei PasLibVlcPlayer.Play

    // Marker
    prjOffsetVideo[0]:=frmEigenschaften.eOffsetView0.Value;
    frmView0.tbOffsetView0.Position:=prjOffsetVideo[0];
    prjOffsetVideo[1]:=frmEigenschaften.eOffsetView1.Value;
    frmView1.tbOffsetView1.Position:=prjOffsetVideo[1];
    prjOffsetVideo[2]:=frmEigenschaften.eOffsetView2.Value;
    frmView2.tbOffsetView2.Position:=prjOffsetVideo[2];
    prjOffsetVideo[3]:=frmEigenschaften.eOffsetView3.Value;
    frmView3.tbOffsetView3.Position:=prjOffsetVideo[3];

    // TitleShow
    frmView0.PasLibVlcPlayerView0.TitleShow:=frmEigenschaften.cbTitleShow.Checked;
    frmView1.PasLibVlcPlayerView1.TitleShow:=frmEigenschaften.cbTitleShow.Checked;
    frmView2.PasLibVlcPlayerView2.TitleShow:=frmEigenschaften.cbTitleShow.Checked;
    frmView3.PasLibVlcPlayerView3.TitleShow:=frmEigenschaften.cbTitleShow.Checked;

    // TimeCodeShow
    // TimeCodeShow auf ViewForm

    // StepSize
    prjStepSize:=frmEigenschaften.eStepSize.Value;

    // Audio
    frmView0.PasLibVlcPlayerView0.SetAudioMute(not frmEigenschaften.gbAudio.CheckBox.Checked);
    frmView0.PasLibVlcPlayerView0.SetAudioVolume(frmEigenschaften.tbAudio.Position);
    frmView1.PasLibVlcPlayerView1.SetAudioMute(True);
    frmView2.PasLibVlcPlayerView2.SetAudioMute(True);
    frmView3.PasLibVlcPlayerView3.SetAudioMute(True);

    // Views
    SetViewPos(frmView0, frmEigenschaften.vlView0);
    SetViewPos(frmView1, frmEigenschaften.vlView1);
    SetViewPos(frmView2, frmEigenschaften.vlView2);
    SetViewPos(frmView3, frmEigenschaften.vlView3);
  end;
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.SetViewPos(MyViewForm: TForm; MyValueListEd: TValueListEditor);
//=======================================================================================================================
begin
  MyViewForm.Top:=StrToInt(MyValueListEd.Values['Top']);
  MyViewForm.Left:=StrToInt(MyValueListEd.Values['Left']);
  MyViewForm.Height:=StrToInt(MyValueListEd.Values['Height']);
  MyViewForm.Width:=StrToInt(MyValueListEd.Values['Width']);
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.cbPlayRateChange(Sender: TObject);
//=======================================================================================================================
begin
  frmView0.PasLibVlcPlayerView0.SetPlayRate(StrToInt(cbPlayRate.Items[cbPlayRate.Itemindex]));
  frmView1.PasLibVlcPlayerView1.SetPlayRate(StrToInt(cbPlayRate.Items[cbPlayRate.Itemindex]));
  frmView2.PasLibVlcPlayerView2.SetPlayRate(StrToInt(cbPlayRate.Items[cbPlayRate.Itemindex]));
  frmView3.PasLibVlcPlayerView3.SetPlayRate(StrToInt(cbPlayRate.Items[cbPlayRate.Itemindex]));
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.mLogChange(Sender: TObject);
//=======================================================================================================================
begin
  // Autoscroll
  SendMessage(mLog.Handle, EM_LINESCROLL, 0, mLog.Lines.Count);
end;
//=======================================================================================================================



//=======================================================================================================================
procedure TfrmMain.sbSchrittSpeichernClick(Sender: TObject);
//=======================================================================================================================
begin
  // RowCount anpassen
  if gEvent.RowCount < iSchritt + 3 then gEvent.RowCount:=iSchritt + 3;

  // Schritt #
  gEvent.Cells[0,2 + iSchritt]:=IntToStr(iSchritt);

  // Event View1
  gEvent.Cells[1,2 + iSchritt]:=IntToStr(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs);
  gEvent.FontColors[1,2 + iSchritt]:=clRed;

  gEvent.Cells[2,2 + iSchritt]:=cbView1Aufgabe.Items[cbView1Aufgabe.ItemIndex];
  gEvent.FontColors[2,2 + iSchritt]:=clRed;

  if cbView1Aufgeingehalten.Checked then gEvent.Cells[3,2 + iSchritt]:='1'
  else gEvent.Cells[3,2 + iSchritt]:='0';
  gEvent.FontColors[3,2 + iSchritt]:=clRed;

  gEvent.Cells[4,2 + iSchritt]:=cbView1AOI.Items[cbView1AOI.ItemIndex];
  gEvent.FontColors[4,2 + iSchritt]:=clRed;

  gEvent.Cells[5,2 + iSchritt]:=eView1Spieler.Text;
  gEvent.FontColors[5,2 + iSchritt]:=clRed;

  if rbView1Angreifer.Checked then gEvent.Cells[6,2 + iSchritt]:='A';
  if rbView1Verteidiger.Checked then gEvent.Cells[6,2 + iSchritt]:='V';
  gEvent.FontColors[6,2 + iSchritt]:=clRed;

  gEvent.Cells[7,2 + iSchritt]:=cbView1Ball.Items[cbView1Ball.ItemIndex];
  gEvent.FontColors[7,2 + iSchritt]:=clRed;

  gEvent.Cells[8,2 + iSchritt]:=eView1Kommentar.Text;
  gEvent.FontColors[8,2 + iSchritt]:=clRed;


  // Event View2
  gEvent.Cells[9,2 + iSchritt]:=IntToStr(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs);
  gEvent.FontColors[9,2 + iSchritt]:=clGreen;

  gEvent.Cells[10,2 + iSchritt]:=cbView2Aufgabe.Items[cbView2Aufgabe.ItemIndex];
  gEvent.FontColors[10,2 + iSchritt]:=clGreen;

  if cbView2Aufgeingehalten.Checked then gEvent.Cells[11,2 + iSchritt]:='1'
  else gEvent.Cells[11,2 + iSchritt]:='0';
  gEvent.FontColors[11,2 + iSchritt]:=clGreen;

  gEvent.Cells[12,2 + iSchritt]:=cbView2AOI.Items[cbView2AOI.ItemIndex];
  gEvent.FontColors[12,2 + iSchritt]:=clGreen;

  gEvent.Cells[13,2 + iSchritt]:=eView2Spieler.Text;
  gEvent.FontColors[13,2 + iSchritt]:=clGreen;

  if rbView2Angreifer.Checked then gEvent.Cells[14,2 + iSchritt]:='A';
  if rbView2Verteidiger.Checked then gEvent.Cells[14,2 + iSchritt]:='V';
  gEvent.FontColors[14,2 + iSchritt]:=clGreen;

  gEvent.Cells[15,2 + iSchritt]:=cbView2Ball.Items[cbView2Ball.ItemIndex];
  gEvent.FontColors[15,2 + iSchritt]:=clGreen;

  gEvent.Cells[16,2 + iSchritt]:=eView2Kommentar.Text;
  gEvent.FontColors[16,2 + iSchritt]:=clGreen;

  // Event View3
  gEvent.Cells[17,2 + iSchritt]:=IntToStr(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs);
  gEvent.FontColors[17,2 + iSchritt]:=clBlue;

  gEvent.Cells[18,2 + iSchritt]:=cbView3Aufgabe.Items[cbView3Aufgabe.ItemIndex];
  gEvent.FontColors[18,2 + iSchritt]:=clBlue;

  if cbView3Aufgeingehalten.Checked then gEvent.Cells[19,2 + iSchritt]:='1'
  else gEvent.Cells[19,2 + iSchritt]:='0';
  gEvent.FontColors[19,2 + iSchritt]:=clBlue;

  gEvent.Cells[20,2 + iSchritt]:=cbView1AOI.Items[cbView3AOI.ItemIndex];
  gEvent.FontColors[20,2 + iSchritt]:=clBlue;

  gEvent.Cells[21,2 + iSchritt]:=eView3Spieler.Text;
  gEvent.FontColors[21,2 + iSchritt]:=clBlue;

  if rbView3Angreifer.Checked then gEvent.Cells[22,2 + iSchritt]:='A';
  if rbView3Verteidiger.Checked then gEvent.Cells[22,2 + iSchritt]:='V';
  gEvent.FontColors[22,2 + iSchritt]:=clBlue;

  gEvent.Cells[23,2 + iSchritt]:=cbView1Ball.Items[cbView3Ball.ItemIndex];
  gEvent.FontColors[23,2 + iSchritt]:=clBlue;

  gEvent.Cells[24,2 + iSchritt]:=eView3Kommentar.Text;
  gEvent.FontColors[24,2 + iSchritt]:=clBlue;

  // Selected auf den aktuellen Eintrag
  gEvent.ClearRowSelect;
  gEvent.SelectRows(2 + iSchritt, 1);

  // Ein Schritt vor
  sbFrameIncClick(Self);

  // AutoSize
  gEvent.AutoSize:=True;

  // GotoStep
  seGotoStep.MaxValue:=gEvent.RowCount - 3;
  seGotoStep.Value:=seGotoStep.MaxValue;

  // Events speichern (Bin Format)
  prjEvent:=ChangeFileExt(cbProjectFiles.Items[cbProjectFiles.ItemIndex], '.bin');
  gEvent.SaveToBINFile(prjEvent);
end;
//=======================================================================================================================


//=======================================================================================================================
procedure TfrmMain.sbSchrittX10SpeichernClick(Sender: TObject);
//=======================================================================================================================
var i: Integer;
    Faktor: Integer;
    Offset: Integer;
begin
  Faktor:=StrToInt(cbSprungFaktor.Items[cbSprungFaktor.ItemIndex]);
  Offset:=iSchritt * prjStepSize;

  for i:=0 to Faktor - 1 do
  begin
    // RowCount anpassen
    if gEvent.RowCount < iSchritt + 3 then gEvent.RowCount:=iSchritt + 3;

    // Schritt #
    gEvent.Cells[0,2 + iSchritt]:=IntToStr(iSchritt);

    // Event View1
    gEvent.Cells[1,2 + iSchritt]:=IntToStr(prjOffsetVideo[1] + Offset + prjStepSize * i);
    gEvent.FontColors[1,2 + iSchritt]:=clRed;

    gEvent.Cells[2,2 + iSchritt]:='---';
    gEvent.FontColors[2,2 + iSchritt]:=clRed;

    if cbView1Aufgeingehalten.Checked then gEvent.Cells[3,2 + iSchritt]:='1'
    else gEvent.Cells[3,2 + iSchritt]:='0';
    gEvent.FontColors[3,2 + iSchritt]:=clRed;

    gEvent.Cells[4,2 + iSchritt]:=cbView1AOI.Items[cbView1AOI.ItemIndex];
    gEvent.FontColors[4,2 + iSchritt]:=clRed;

    gEvent.Cells[5,2 + iSchritt]:=eView1Spieler.Text;
    gEvent.FontColors[5,2 + iSchritt]:=clRed;

    if rbView1Angreifer.Checked then gEvent.Cells[6,2 + iSchritt]:='A';
    if rbView1Verteidiger.Checked then gEvent.Cells[6,2 + iSchritt]:='V';
    gEvent.FontColors[6,2 + iSchritt]:=clRed;

    gEvent.Cells[7,2 + iSchritt]:=cbView1Ball.Items[cbView1Ball.ItemIndex];
    gEvent.FontColors[7,2 + iSchritt]:=clRed;

    gEvent.Cells[8,2 + iSchritt]:='Sprung [' + IntToStr(i + 1) + '] von [' + IntToStr(Faktor) + ']';
    gEvent.FontColors[8,2 + iSchritt]:=clRed;

    // Event View2
    gEvent.Cells[9,2 + iSchritt]:=IntToStr(prjOffsetVideo[2] + Offset + prjStepSize * i);
    gEvent.FontColors[9,2 + iSchritt]:=clGreen;

    gEvent.Cells[10,2 + iSchritt]:='---';
    gEvent.FontColors[10,2 + iSchritt]:=clGreen;

    if cbView2Aufgeingehalten.Checked then gEvent.Cells[11,2 + iSchritt]:='1'
    else gEvent.Cells[11,2 + iSchritt]:='0';
    gEvent.FontColors[11,2 + iSchritt]:=clGreen;

    gEvent.Cells[12,2 + iSchritt]:=cbView2AOI.Items[cbView2AOI.ItemIndex];
    gEvent.FontColors[12,2 + iSchritt]:=clGreen;

    gEvent.Cells[13,2 + iSchritt]:=eView2Spieler.Text;
    gEvent.FontColors[13,2 + iSchritt]:=clGreen;

    if rbView2Angreifer.Checked then gEvent.Cells[14,2 + iSchritt]:='A';
    if rbView2Verteidiger.Checked then gEvent.Cells[14,2 + iSchritt]:='V';
    gEvent.FontColors[14,2 + iSchritt]:=clGreen;

    gEvent.Cells[15,2 + iSchritt]:=cbView2Ball.Items[cbView2Ball.ItemIndex];
    gEvent.FontColors[15,2 + iSchritt]:=clGreen;

    gEvent.Cells[16,2 + iSchritt]:='Sprung [' + IntToStr(i + 1) + '] von [' + IntToStr(Faktor) + ']';
    gEvent.FontColors[16,2 + iSchritt]:=clGreen;

    // Event View3
    gEvent.Cells[17,2 + iSchritt]:=IntToStr(prjOffsetVideo[3] + Offset + prjStepSize * i);
    gEvent.FontColors[17,2 + iSchritt]:=clBlue;

    gEvent.Cells[18,2 + iSchritt]:='---';
    gEvent.FontColors[18,2 + iSchritt]:=clBlue;

    if cbView3Aufgeingehalten.Checked then gEvent.Cells[19,2 + iSchritt]:='1'
    else gEvent.Cells[19,2 + iSchritt]:='0';
    gEvent.FontColors[19,2 + iSchritt]:=clBlue;

    gEvent.Cells[20,2 + iSchritt]:=cbView1AOI.Items[cbView3AOI.ItemIndex];
    gEvent.FontColors[20,2 + iSchritt]:=clBlue;

    gEvent.Cells[21,2 + iSchritt]:=eView3Spieler.Text;
    gEvent.FontColors[21,2 + iSchritt]:=clBlue;

    if rbView3Angreifer.Checked then gEvent.Cells[22,2 + iSchritt]:='A';
    if rbView3Verteidiger.Checked then gEvent.Cells[22,2 + iSchritt]:='V';
    gEvent.FontColors[22,2 + iSchritt]:=clBlue;

    gEvent.Cells[23,2 + iSchritt]:=cbView1Ball.Items[cbView3Ball.ItemIndex];
    gEvent.FontColors[23,2 + iSchritt]:=clBlue;

    gEvent.Cells[24,2 + iSchritt]:='Sprung [' + IntToStr(i + 1) + '] von [' + IntToStr(Faktor) + ']';
    gEvent.FontColors[24,2 + iSchritt]:=clBlue;

    // Selected auf den aktuellen Eintrag
    gEvent.ClearRowSelect;
    gEvent.SelectRows(2 + iSchritt, 1);

    inc(iSchritt);
    lSchritt.Caption:='Schritt: ' + IntTostr(iSchritt);

    // Selected auf den aktuellen Eintrag
    gEvent.ClearRowSelect;
    gEvent.SelectRows(2 + iSchritt, 1);

    // AutoSize
    gEvent.AutoSize:=True;

    // GotoStep
    seGotoStep.MaxValue:=gEvent.RowCount - 3;
    seGotoStep.Value:=seGotoStep.MaxValue;

    // Events speichern (Bin Format)
    prjEvent:=ChangeFileExt(cbProjectFiles.Items[cbProjectFiles.ItemIndex], '.bin');
    gEvent.SaveToBINFile(prjEvent);
  end;

  // Korrektur, da letztes inc weg muß
  dec(iSchritt);

  // Video weiter schalten
  FrameIncClick(Faktor);
end;
//=======================================================================================================================



//=======================================================================================================================
procedure TfrmMain.ResetgEvent;
//=======================================================================================================================
begin
  // Grid leeren
  gEvent.Clear;
  gEvent.RowCount:=3;


  // Grid aufbauen
  gEvent.ColCount:=25;

  // Header First
  gEvent.Cells[0,0]:='';

  gEvent.Cells[1,0]:='Schiri 1';
  gEvent.MergeCells(1,0,8,1);

  gEvent.Cells[9,0]:='Schiri 2';
  gEvent.MergeCells(9,0,8,1);

  gEvent.Cells[17,0]:='Schiri 3';
  gEvent.MergeCells(17,0,8,1);

  // Header Second
  gEvent.Cells[0,1]:='Schritt';

  gEvent.Cells[1,1]:='Zeit [ms]';
  gEvent.Cells[2,1]:='Aufgabe';
  gEvent.Cells[3,1]:='Eingehalten';
  gEvent.Cells[4,1]:='AOI';
  gEvent.Cells[5,1]:='Spieler-Nr.';
  gEvent.Cells[6,1]:='Spieler-Typ';
  gEvent.Cells[7,1]:='Ball';
  gEvent.Cells[8,1]:='Kommentar';

  gEvent.Cells[9,1]:='Zeit [ms]';
  gEvent.Cells[10,1]:='Aufgabe';
  gEvent.Cells[11,1]:='Eingehalten';
  gEvent.Cells[12,1]:='AOI';
  gEvent.Cells[13,1]:='Spieler-Nr.';
  gEvent.Cells[14,1]:='Spieler-Typ';
  gEvent.Cells[15,1]:='Ball';
  gEvent.Cells[16,1]:='Kommentar';

  gEvent.Cells[17,1]:='Zeit [ms]';
  gEvent.Cells[18,1]:='Aufgabe';
  gEvent.Cells[19,1]:='Eingehalten';
  gEvent.Cells[20,1]:='AOI';
  gEvent.Cells[21,1]:='Spieler-Nr.';
  gEvent.Cells[22,1]:='Spieler-Typ';
  gEvent.Cells[23,1]:='Kommentar';
  gEvent.Cells[24,1]:='Kommentar';

  gEvent.AutoSize:=True;
end;




procedure TfrmMain.sbGotoStepClick(Sender: TObject);
begin
  if 2 + seGotoStep.Value <= gEvent.RowCount then
  begin
    // zu Schritt gehen
    case VideoStatus of
      vsPause:
      begin
        lSchritt.Caption:='Schritt: ' + IntTostr(seGotoStep.Value);
        iSchritt:=seGotoStep.Value;

        // Selected auf den aktuellen Eintrag
        gEvent.ClearRowSelect;
        gEvent.SelectRows(2 + seGotoStep.Value, 1);

        // Logging
        if bLogOn then mLog.Lines.Add('StepGoto');
        if bLogOn then mLog.Lines.Add('Step #: ' + IntToStr(seGotoStep.Value));

        // Pos -40: 1ms = 0,001s <=> 25Hz = 0,04s <=> 40ms = 1 Frame
        if frmView0.PasLibVlcPlayerView0.CanSeek() then
        begin
          frmView0.PasLibVlcPlayerView0.SetVideoPosInMs(prjOffsetVideo[0] + (seGotoStep.Value) * prjStepSize);
          frmView0.StatusPane1.Caption:=frmView0.PasLibVlcPLayerView0.GetVideoPosStr('hh:mm:ss.ms');
          frmView0.tbView0.Position:=frmView0.PasLibVlcPlayerView0.GetVideoPosInMs;
          // Logging
          if bLogOn then mLog.Lines.Add('View0: seek to => ' + IntToStr(frmView0.PasLibVlcPlayerView0.GetVideoPosInMs));
        end;

        if frmView1.PasLibVlcPlayerView1.CanSeek() then
        begin
          frmView1.PasLibVlcPlayerView1.SetVideoPosInMs(prjOffsetVideo[1] + (seGotoStep.Value) * prjStepSize);
          frmView1.StatusPane1.Caption:=frmView1.PasLibVlcPLayerView1.GetVideoPosStr('hh:mm:ss.ms');
          frmView1.tbView1.Position:=frmView1.PasLibVlcPlayerView1.GetVideoPosInMs;
          // Logging
          if bLogOn then mLog.Lines.Add('View1: seek to => ' + IntToStr(frmView1.PasLibVlcPlayerView1.GetVideoPosInMs));
        end;

        if frmView2.PasLibVlcPlayerView2.CanSeek() then
        begin
          frmView2.PasLibVlcPlayerView2.SetVideoPosInMs(prjOffsetVideo[2] + (seGotoStep.Value) * prjStepSize);
          frmView2.StatusPane1.Caption:=frmView2.PasLibVlcPLayerView2.GetVideoPosStr('hh:mm:ss.ms');
          frmView2.tbView2.Position:=frmView2.PasLibVlcPlayerView2.GetVideoPosInMs;
          // Logging
          if bLogOn then mLog.Lines.Add('View2: seek to => ' + IntToStr(frmView2.PasLibVlcPlayerView2.GetVideoPosInMs));
        end;

        if frmView3.PasLibVlcPlayerView3.CanSeek() then
        begin
          frmView3.PasLibVlcPlayerView3.SetVideoPosInMs(prjOffsetVideo[3] + (seGotoStep.Value) * prjStepSize);
          frmView3.StatusPane1.Caption:=frmView3.PasLibVlcPLayerView3.GetVideoPosStr('hh:mm:ss.ms');
          frmView3.tbView3.Position:=frmView3.PasLibVlcPlayerView3.GetVideoPosInMs;
          // Logging
          if bLogOn then mLog.Lines.Add('View3: seek to => ' + IntToStr(frmView3.PasLibVlcPlayerView3.GetVideoPosInMs));
        end;

        if prjTimecodeShow = 1 then
        begin
          frmView0.PasLibVlcPlayerView0.MarqueeShowText(frmView0.PasLibVlcPlayerView0.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
          frmView1.PasLibVlcPlayerView1.MarqueeShowText(frmView1.PasLibVlcPlayerView1.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
          frmView2.PasLibVlcPlayerView2.MarqueeShowText(frmView2.PasLibVlcPlayerView2.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
          frmView3.PasLibVlcPlayerView3.MarqueeShowText(frmView3.PasLibVlcPlayerView3.GetVideoPosStr('hh:mm:ss.ms'), xPosTC, yPosTC, clTC, fsTC);
        end;

        if prjOffsetVideo[0] <> -1 then frmView0.tbOffsetView0.Position:=frmView0.tbOffsetView0.Position;
        if prjOffsetVideo[1] <> -1 then frmView1.tbOffsetView1.Position:=frmView1.tbOffsetView1.Position;
        if prjOffsetVideo[2] <> -1 then frmView2.tbOffsetView2.Position:=frmView2.tbOffsetView2.Position;
        if prjOffsetVideo[3] <> -1 then frmView3.tbOffsetView3.Position:=frmView3.tbOffsetView3.Position;
      end;
    end; //case
  end
  else ShowMessage('Schritt noch nicht eingtragen!');

end;


end.

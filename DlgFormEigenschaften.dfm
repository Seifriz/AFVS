object frmEigenschaften: TfrmEigenschaften
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Projekt Eigenschaften'
  ClientHeight = 539
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbAudio: TAdvGroupBox
    Left = 8
    Top = 395
    Width = 633
    Height = 94
    CheckBox.Checked = True
    CheckBox.State = cbChecked
    CheckBox.Visible = True
    Caption = 'Audio'
    TabOrder = 1
    object tbAudio: TAdvTrackBar
      Left = 16
      Top = 27
      Width = 600
      Height = 51
      BorderColor = clNone
      BorderColorDisabled = clNone
      Buttons.BorderColor = 9262895
      Buttons.BorderColorHot = 10079963
      Buttons.BorderColorDown = 4548219
      Buttons.Color = 15653832
      Buttons.ColorTo = 16178633
      Buttons.ColorHot = 15465983
      Buttons.ColorHotTo = 11332863
      Buttons.ColorDown = 7778289
      Buttons.ColorDownTo = 4296947
      Buttons.ColorMirror = 15586496
      Buttons.ColorMirrorTo = 16245200
      Buttons.ColorMirrorHot = 5888767
      Buttons.ColorMirrorHotTo = 10807807
      Buttons.ColorMirrorDown = 946929
      Buttons.ColorMirrorDownTo = 5021693
      Buttons.GradientMirror = ggVertical
      ColorTo = clNone
      ColorDisabled = clNone
      ColorDisabledTo = clNone
      Direction = gdHorizontal
      Color = clNone
      Max = 200
      Min = 1
      Position = 100
      Slider.BorderColor = 12752500
      Slider.BorderColorDisabled = clGray
      Slider.Color = clWhite
      Slider.ColorTo = clBlack
      Slider.ColorDisabled = clGray
      Slider.ColorDisabledTo = clBlack
      Slider.ColorCompleted = clNone
      Slider.ColorCompletedTo = clNone
      Slider.ColorCompletedDisabled = clBlack
      Slider.ColorCompletedDisabledTo = clBlack
      Slider.Direction = gdHorizontal
      TabOrder = 0
      Thumb.BorderColor = 10317632
      Thumb.BorderColorHot = 10079963
      Thumb.BorderColorDown = 4548219
      Thumb.BorderColorDisabled = clGray
      Thumb.Color = 15653832
      Thumb.ColorTo = 16178633
      Thumb.ColorDown = 7778289
      Thumb.ColorDownTo = 4296947
      Thumb.ColorHot = 15465983
      Thumb.ColorHotTo = 11332863
      Thumb.ColorDisabled = clBtnShadow
      Thumb.ColorDisabledTo = clBtnShadow
      Thumb.ColorMirror = 15586496
      Thumb.ColorMirrorTo = 16245200
      Thumb.ColorMirrorHot = 5888767
      Thumb.ColorMirrorHotTo = 10807807
      Thumb.ColorMirrorDown = 946929
      Thumb.ColorMirrorDownTo = 5021693
      Thumb.ColorMirrorDisabled = clBtnShadow
      Thumb.ColorMirrorDisabledTo = clBtnShadow
      Thumb.Gradient = ggVertical
      Thumb.GradientMirror = ggRadial
      Thumb.Size = 25
      Thumb.Width = 16
      Thumb.Shape = tsPointer
      TickMark.Color = clBlack
      TickMark.ColorDisabled = clBlack
      TickMark.Font.Charset = DEFAULT_CHARSET
      TickMark.Font.Color = clWindowText
      TickMark.Font.Height = -11
      TickMark.Font.Name = 'Tahoma'
      TickMark.Font.Style = []
      TickMark.ShowImageAtSteps = 5
      TickMark.Spacing = 16
      TrackHint = False
      TrackLabel.Visible = True
      TrackLabel.Position = lpBottomCenter
      TrackLabel.Font.Charset = DEFAULT_CHARSET
      TrackLabel.Font.Color = clWindowText
      TrackLabel.Font.Height = -11
      TrackLabel.Font.Name = 'Tahoma'
      TrackLabel.Font.Style = []
      TrackLabel.Format = '%d'
      Version = '1.6.3.5'
    end
  end
  object gbVideo: TAdvGroupBox
    Left = 8
    Top = 8
    Width = 633
    Height = 381
    Caption = 'Video'
    TabOrder = 0
    object eFileView0: TAdvFileNameEdit
      Left = 16
      Top = 36
      Width = 600
      Height = 19
      EmptyTextStyle = []
      Flat = False
      LabelCaption = 'View 0'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clBlue
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = False
      TabOrder = 0
      Text = ''
      Visible = True
      Version = '1.3.3.4'
      ButtonStyle = bsButton
      ButtonWidth = 22
      Etched = False
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        0000ADB5BB6894B1698FA4668DA4678DA4678DA4678DA4678DA4678DA4678DA4
        678DA4678DA4678DA4688FA5678FA9D3D5D7FFFFFFFFFFFF0000839AAD79E8FF
        A9FFFF96FFFF98FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF96FF
        FFA0FFFF9FFFFF87A3B8FFFFFFFFFFFF000094A6B272D3FF8FDFF992F1FF88E7
        FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF86E7FFA5FFFF6E
        A5C7FEFEFEFFFFFF000096A8B377DBFF80CCEE95EEFF7BDFFC81E1FC81E1FC80
        E1FC80E1FC80E1FC80E1FC80E1FC81E1FC7BDFFC96F1FF86D7FEC7CCD0FFFFFF
        000093A5B08AEFFF72C0E897E5FD6EDAFB76DCFB75DCFB79DDFB7BDEFB7ADDFB
        7ADDFB7ADDFB7ADDFB7ADDFB82E6FFA0F2FF9CABB6FFFFFF000092A3AF99FBFF
        5EBAE69FDFF795F0FF89E8FF8EEAFF7FE2FF72D9FA75D9FA76DAFA76DAFA76DA
        FA76DAFA6FD9FBA7FCFF82A8C2FFFFFF000093A3B09EFBFF67D1F56DB5E087C6
        E67EC2E782C1E56BC2EB6CD9FD62D2F95FCFF860D0F860D0F860D0F856CCF781
        EBFF89C4E6DEDFE0000094A4B09BF5FF7EE7FF63CAF15AC1EC5EC4ED60C7EE56
        B4E35AB7E792E2FC94E2FB91E0FB91E0FB90DFFA8DE1FDA3F1FFC4FFFF96A9B7
        000095A4B09CF3FF74DEFE7AE0FE7AE1FF7AE0FF7CE2FF7AE3FF5FBCE771B1DC
        78B7DF76B7E076B7E077B8E175B4DD83C0E886CBF0B4BEC5000095A4B09FF4FF
        6FDBFD71D6F972D6F96BD4F860D2F963D5FB65D8FC4EC6F34CC4F44DC5F44AC4
        F461D6FA6FB8DFBBCBD8FFFFFFFFFFFF000096A4AF9DF3FF57D3FC5CCFF854CC
        F768D2F9A1EAFFA2EDFF9BE0F79FE6FC9FE6FC9FE6FC9CE5FCB7F2FF9BD8F6C8
        C9CDFFFFFFFFFFFF00008B9CA9BAFCFF9CEAFF98E4FD8FE2FDB8F0FF76A0BF8E
        B4D19DCBEC9BC5E59BC6E59BC6E59BC6E59DC7E699CAEBEEEFF0FFFFFFFFFFFF
        0000BFCAD18DCEF693C2E28EC0E390C1E395CDF399B1C1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      FilterIndex = 0
      DialogOptions = []
      DialogKind = fdOpen
    end
    object eFileView1: TAdvFileNameEdit
      Left = 16
      Top = 110
      Width = 600
      Height = 19
      EmptyTextStyle = []
      Flat = False
      LabelCaption = 'View 1'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clBlue
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = False
      TabOrder = 2
      Text = ''
      Visible = True
      Version = '1.3.3.4'
      ButtonStyle = bsButton
      ButtonWidth = 22
      Etched = False
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        0000ADB5BB6894B1698FA4668DA4678DA4678DA4678DA4678DA4678DA4678DA4
        678DA4678DA4678DA4688FA5678FA9D3D5D7FFFFFFFFFFFF0000839AAD79E8FF
        A9FFFF96FFFF98FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF96FF
        FFA0FFFF9FFFFF87A3B8FFFFFFFFFFFF000094A6B272D3FF8FDFF992F1FF88E7
        FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF86E7FFA5FFFF6E
        A5C7FEFEFEFFFFFF000096A8B377DBFF80CCEE95EEFF7BDFFC81E1FC81E1FC80
        E1FC80E1FC80E1FC80E1FC80E1FC81E1FC7BDFFC96F1FF86D7FEC7CCD0FFFFFF
        000093A5B08AEFFF72C0E897E5FD6EDAFB76DCFB75DCFB79DDFB7BDEFB7ADDFB
        7ADDFB7ADDFB7ADDFB7ADDFB82E6FFA0F2FF9CABB6FFFFFF000092A3AF99FBFF
        5EBAE69FDFF795F0FF89E8FF8EEAFF7FE2FF72D9FA75D9FA76DAFA76DAFA76DA
        FA76DAFA6FD9FBA7FCFF82A8C2FFFFFF000093A3B09EFBFF67D1F56DB5E087C6
        E67EC2E782C1E56BC2EB6CD9FD62D2F95FCFF860D0F860D0F860D0F856CCF781
        EBFF89C4E6DEDFE0000094A4B09BF5FF7EE7FF63CAF15AC1EC5EC4ED60C7EE56
        B4E35AB7E792E2FC94E2FB91E0FB91E0FB90DFFA8DE1FDA3F1FFC4FFFF96A9B7
        000095A4B09CF3FF74DEFE7AE0FE7AE1FF7AE0FF7CE2FF7AE3FF5FBCE771B1DC
        78B7DF76B7E076B7E077B8E175B4DD83C0E886CBF0B4BEC5000095A4B09FF4FF
        6FDBFD71D6F972D6F96BD4F860D2F963D5FB65D8FC4EC6F34CC4F44DC5F44AC4
        F461D6FA6FB8DFBBCBD8FFFFFFFFFFFF000096A4AF9DF3FF57D3FC5CCFF854CC
        F768D2F9A1EAFFA2EDFF9BE0F79FE6FC9FE6FC9FE6FC9CE5FCB7F2FF9BD8F6C8
        C9CDFFFFFFFFFFFF00008B9CA9BAFCFF9CEAFF98E4FD8FE2FDB8F0FF76A0BF8E
        B4D19DCBEC9BC5E59BC6E59BC6E59BC6E59DC7E699CAEBEEEFF0FFFFFFFFFFFF
        0000BFCAD18DCEF693C2E28EC0E390C1E395CDF399B1C1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      FilterIndex = 0
      DialogOptions = []
      DialogKind = fdOpen
    end
    object eFileView2: TAdvFileNameEdit
      Left = 16
      Top = 192
      Width = 600
      Height = 19
      EmptyTextStyle = []
      Flat = False
      LabelCaption = 'View 2'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clBlue
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = False
      TabOrder = 4
      Text = ''
      Visible = True
      Version = '1.3.3.4'
      ButtonStyle = bsButton
      ButtonWidth = 22
      Etched = False
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        0000ADB5BB6894B1698FA4668DA4678DA4678DA4678DA4678DA4678DA4678DA4
        678DA4678DA4678DA4688FA5678FA9D3D5D7FFFFFFFFFFFF0000839AAD79E8FF
        A9FFFF96FFFF98FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF96FF
        FFA0FFFF9FFFFF87A3B8FFFFFFFFFFFF000094A6B272D3FF8FDFF992F1FF88E7
        FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF86E7FFA5FFFF6E
        A5C7FEFEFEFFFFFF000096A8B377DBFF80CCEE95EEFF7BDFFC81E1FC81E1FC80
        E1FC80E1FC80E1FC80E1FC80E1FC81E1FC7BDFFC96F1FF86D7FEC7CCD0FFFFFF
        000093A5B08AEFFF72C0E897E5FD6EDAFB76DCFB75DCFB79DDFB7BDEFB7ADDFB
        7ADDFB7ADDFB7ADDFB7ADDFB82E6FFA0F2FF9CABB6FFFFFF000092A3AF99FBFF
        5EBAE69FDFF795F0FF89E8FF8EEAFF7FE2FF72D9FA75D9FA76DAFA76DAFA76DA
        FA76DAFA6FD9FBA7FCFF82A8C2FFFFFF000093A3B09EFBFF67D1F56DB5E087C6
        E67EC2E782C1E56BC2EB6CD9FD62D2F95FCFF860D0F860D0F860D0F856CCF781
        EBFF89C4E6DEDFE0000094A4B09BF5FF7EE7FF63CAF15AC1EC5EC4ED60C7EE56
        B4E35AB7E792E2FC94E2FB91E0FB91E0FB90DFFA8DE1FDA3F1FFC4FFFF96A9B7
        000095A4B09CF3FF74DEFE7AE0FE7AE1FF7AE0FF7CE2FF7AE3FF5FBCE771B1DC
        78B7DF76B7E076B7E077B8E175B4DD83C0E886CBF0B4BEC5000095A4B09FF4FF
        6FDBFD71D6F972D6F96BD4F860D2F963D5FB65D8FC4EC6F34CC4F44DC5F44AC4
        F461D6FA6FB8DFBBCBD8FFFFFFFFFFFF000096A4AF9DF3FF57D3FC5CCFF854CC
        F768D2F9A1EAFFA2EDFF9BE0F79FE6FC9FE6FC9FE6FC9CE5FCB7F2FF9BD8F6C8
        C9CDFFFFFFFFFFFF00008B9CA9BAFCFF9CEAFF98E4FD8FE2FDB8F0FF76A0BF8E
        B4D19DCBEC9BC5E59BC6E59BC6E59BC6E59DC7E699CAEBEEEFF0FFFFFFFFFFFF
        0000BFCAD18DCEF693C2E28EC0E390C1E395CDF399B1C1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      FilterIndex = 0
      DialogOptions = []
      DialogKind = fdOpen
    end
    object eFileView3: TAdvFileNameEdit
      Left = 16
      Top = 270
      Width = 600
      Height = 19
      EmptyTextStyle = []
      Flat = False
      LabelCaption = 'View 3'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clBlue
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = False
      TabOrder = 6
      Text = ''
      Visible = True
      Version = '1.3.3.4'
      ButtonStyle = bsButton
      ButtonWidth = 22
      Etched = False
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F0030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        0000ADB5BB6894B1698FA4668DA4678DA4678DA4678DA4678DA4678DA4678DA4
        678DA4678DA4678DA4688FA5678FA9D3D5D7FFFFFFFFFFFF0000839AAD79E8FF
        A9FFFF96FFFF98FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF97FFFF96FF
        FFA0FFFF9FFFFF87A3B8FFFFFFFFFFFF000094A6B272D3FF8FDFF992F1FF88E7
        FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF89E7FF86E7FFA5FFFF6E
        A5C7FEFEFEFFFFFF000096A8B377DBFF80CCEE95EEFF7BDFFC81E1FC81E1FC80
        E1FC80E1FC80E1FC80E1FC80E1FC81E1FC7BDFFC96F1FF86D7FEC7CCD0FFFFFF
        000093A5B08AEFFF72C0E897E5FD6EDAFB76DCFB75DCFB79DDFB7BDEFB7ADDFB
        7ADDFB7ADDFB7ADDFB7ADDFB82E6FFA0F2FF9CABB6FFFFFF000092A3AF99FBFF
        5EBAE69FDFF795F0FF89E8FF8EEAFF7FE2FF72D9FA75D9FA76DAFA76DAFA76DA
        FA76DAFA6FD9FBA7FCFF82A8C2FFFFFF000093A3B09EFBFF67D1F56DB5E087C6
        E67EC2E782C1E56BC2EB6CD9FD62D2F95FCFF860D0F860D0F860D0F856CCF781
        EBFF89C4E6DEDFE0000094A4B09BF5FF7EE7FF63CAF15AC1EC5EC4ED60C7EE56
        B4E35AB7E792E2FC94E2FB91E0FB91E0FB90DFFA8DE1FDA3F1FFC4FFFF96A9B7
        000095A4B09CF3FF74DEFE7AE0FE7AE1FF7AE0FF7CE2FF7AE3FF5FBCE771B1DC
        78B7DF76B7E076B7E077B8E175B4DD83C0E886CBF0B4BEC5000095A4B09FF4FF
        6FDBFD71D6F972D6F96BD4F860D2F963D5FB65D8FC4EC6F34CC4F44DC5F44AC4
        F461D6FA6FB8DFBBCBD8FFFFFFFFFFFF000096A4AF9DF3FF57D3FC5CCFF854CC
        F768D2F9A1EAFFA2EDFF9BE0F79FE6FC9FE6FC9FE6FC9CE5FCB7F2FF9BD8F6C8
        C9CDFFFFFFFFFFFF00008B9CA9BAFCFF9CEAFF98E4FD8FE2FDB8F0FF76A0BF8E
        B4D19DCBEC9BC5E59BC6E59BC6E59BC6E59DC7E699CAEBEEEFF0FFFFFFFFFFFF
        0000BFCAD18DCEF693C2E28EC0E390C1E395CDF399B1C1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000}
      FilterIndex = 0
      DialogOptions = []
      DialogKind = fdOpen
    end
    object cbTitleShow: TCheckBox
      Left = 16
      Top = 331
      Width = 177
      Height = 17
      Caption = 'Dateinamen im Video anzeigen'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cbTimecodeShow: TCheckBox
      Left = 16
      Top = 354
      Width = 161
      Height = 17
      Caption = 'Timecode im Video anzeigen'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object eOffsetView3: TAdvSpinEdit
      Left = 56
      Top = 295
      Width = 73
      Height = 22
      Value = 0
      DateValue = 43510.640918750000000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelCaption = 'Offset'
      LabelPosition = lpLeftCenter
      LabelMargin = 8
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = -1
      MinValue = -1
      TabOrder = 7
      Visible = True
      Version = '1.5.2.1'
    end
    object eOffsetView2: TAdvSpinEdit
      Left = 56
      Top = 217
      Width = 73
      Height = 22
      Value = 0
      DateValue = 43510.640918750000000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelCaption = 'Offset'
      LabelPosition = lpLeftCenter
      LabelMargin = 8
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = -1
      MinValue = -1
      TabOrder = 5
      Visible = True
      Version = '1.5.2.1'
    end
    object eOffsetView1: TAdvSpinEdit
      Left = 56
      Top = 135
      Width = 73
      Height = 22
      Value = 0
      DateValue = 43510.640918750000000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelCaption = 'Offset'
      LabelPosition = lpLeftCenter
      LabelMargin = 8
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = -1
      MinValue = -1
      TabOrder = 3
      Visible = True
      Version = '1.5.2.1'
    end
    object eOffsetView0: TAdvSpinEdit
      Left = 56
      Top = 61
      Width = 73
      Height = 22
      Value = 0
      DateValue = 43510.640918750000000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelCaption = 'Offset'
      LabelPosition = lpLeftCenter
      LabelMargin = 8
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = -1
      MinValue = -1
      TabOrder = 1
      Visible = True
      Version = '1.5.2.1'
    end
    object eStepSize: TAdvSpinEdit
      Left = 216
      Top = 351
      Width = 159
      Height = 22
      Value = 40
      FloatValue = 40.000000000000000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelCaption = 'Schrittweite [ms] (25Hz -> 40ms)'
      LabelPosition = lpTopLeft
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 1000
      MinValue = 1
      TabOrder = 10
      Visible = True
      Version = '1.5.2.1'
    end
  end
  object gbViews: TAdvGroupBox
    Left = 647
    Top = 8
    Width = 138
    Height = 481
    Caption = 'Views'
    TabOrder = 2
    object vlView0: TValueListEditor
      Left = 16
      Top = 24
      Width = 106
      Height = 100
      FixedCols = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
      ParentFont = False
      Strings.Strings = (
        'Top='
        'Left='
        'Height='
        'Width=')
      TabOrder = 0
      TitleCaptions.Strings = (
        'View 0')
      ColWidths = (
        57
        45)
    end
    object vlView1: TValueListEditor
      Left = 16
      Top = 130
      Width = 106
      Height = 100
      FixedCols = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
      ParentFont = False
      Strings.Strings = (
        'Top='
        'Left='
        'Height='
        'Width=')
      TabOrder = 1
      TitleCaptions.Strings = (
        'View 1')
      ColWidths = (
        57
        45)
      RowHeights = (
        18
        18
        18
        18
        18)
    end
    object vlView2: TValueListEditor
      Left = 16
      Top = 236
      Width = 106
      Height = 100
      FixedCols = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
      ParentFont = False
      Strings.Strings = (
        'Top='
        'Left='
        'Height='
        'Width=')
      TabOrder = 2
      TitleCaptions.Strings = (
        'View 2')
      ColWidths = (
        57
        45)
      RowHeights = (
        18
        18
        18
        18
        18)
    end
    object vlView3: TValueListEditor
      Left = 16
      Top = 342
      Width = 106
      Height = 100
      FixedCols = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
      ParentFont = False
      Strings.Strings = (
        'Top='
        'Left='
        'Height='
        'Width=')
      TabOrder = 3
      TitleCaptions.Strings = (
        'View 3')
      ColWidths = (
        57
        45)
      RowHeights = (
        18
        18
        18
        18
        18)
    end
    object btnViewsDefault: TButton
      Left = 16
      Top = 448
      Width = 106
      Height = 25
      Caption = 'Views zur'#252'cksetzen'
      TabOrder = 4
      OnClick = btnViewsDefaultClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 498
    Width = 794
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object lProjectName: TLabel
      Left = 8
      Top = 8
      Width = 27
      Height = 19
      Caption = '???'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TButton
      Left = 617
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object btnAbbruch: TButton
      Left = 711
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Abbruch'
      ModalResult = 2
      TabOrder = 1
    end
  end
end

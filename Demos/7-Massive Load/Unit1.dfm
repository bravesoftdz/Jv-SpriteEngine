object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'JvSpriteEngine - Massive Load'
  ClientHeight = 722
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 609
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 520
    Top = 607
    Width = 105
    Height = 25
    Caption = 'build random Path'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 409
    Top = 606
    Width = 105
    Height = 25
    Caption = 'Add labels'
    TabOrder = 1
    OnClick = Button2Click
  end
  object CheckBox6: TCheckBox
    Left = 48
    Top = 609
    Width = 97
    Height = 17
    Caption = 'Show MovePath'
    TabOrder = 2
  end
  object JvTheater1: TJvTheater
    Left = 0
    Top = 0
    Width = 1024
    Height = 600
    AnimationInterval = 20
    CollisionDelay = 0
    ShowPerformance = False
    OnBeforeRender = JvTheater1BeforeRender
    OnSpriteMouseMove = JvTheater1SpriteMouseMove
    ClickSprites = True
    ClickSpritesPrecise = True
    CollisionPrecisePixel = False
    OnSpriteDestinationReached = JvTheater1SpriteDestinationReached
    TabOrder = 3
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 296
    Top = 664
  end
end

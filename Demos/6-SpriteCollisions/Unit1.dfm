object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SE-SpriteCollisions'
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
  object Button1: TButton
    Left = 520
    Top = 607
    Width = 105
    Height = 25
    Caption = 'DoCollision'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 32
    Top = 606
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object CheckBox5: TCheckBox
    Left = 232
    Top = 608
    Width = 113
    Height = 17
    Caption = 'PixelCollision'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = CheckBox5Click
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
    ClickSprites = False
    ClickSpritesPrecise = False
    CollisionPrecisePixel = False
    OnCollision = JvTheater1Collision
    OnSpriteDestinationReached = JvTheater1SpriteDestinationReached
    TabOrder = 3
  end
end

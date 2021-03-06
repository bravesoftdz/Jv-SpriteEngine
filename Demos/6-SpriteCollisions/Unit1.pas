unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Generics.Collections ,Generics.Defaults,
  JvSpriteEngine;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    CheckBox5: TCheckBox;
    JvTheater1: TJvTheater;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure JvTheater1SpriteDestinationReached(Sender: TObject; ASprite: TJvSprite);
    procedure JvTheater1Collision(Sender: TObject; Sprite1, Sprite2: TJvSprite);
    procedure JvTheater1BeforeRender(Sender: TObject; VirtualBitmap: TBitmap);
    procedure CheckBox5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TotalCollision: Integer;
implementation

{$R *.dfm}

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  JvTheater1.CollisionPrecisePixel := CheckBox5.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Background,SpriteGabriel,SpriteShahira, SpriteTree: TJvSprite;
  gabriel,Shahira: TBitmap;
begin
  TotalCollision:=0;

  Background:= JvTheater1.CreateSprite('..\..\..\!media\back1.bmp','background',{framesX}1,{framesY}1,{Delay}0,{X}0,{Y}0,{transparent}false,{Priority}0);
  Background.Position := Point( Background.FrameWidth div 2 , Background.FrameHeight div 2 );


  JvTheater1.CollisionPrecisePixel := CheckBox5.Checked;
  JvTheater1.CollisionDelay := 400;
  JvTheater1.Active := True;

  gabriel := TBitmap.Create;
  gabriel.LoadFromFile( '..\..\..\!media\gabriel_WALK.bmp');

  shahira := TBitmap.Create;
  shahira.LoadFromFile( '..\..\..\!media\shahira_WALK.bmp');

  SpriteGabriel:= JvTheater1.CreateSprite(gabriel ,'gabriel',{framesX}15,{framesY}6,{Delay}7,{X}100,{Y}100,{transparent}true,{Priority}1);
  SpriteGabriel.Collision := True;
  SpriteShahira := JvTheater1.CreateSprite(shahira,'shahira',{framesX}15,{framesY}6,{Delay}7,{X}500,{Y}100,{transparent}true,{Priority}1);
  SpriteShahira.Collision := True;


  SpriteTree := JvTheater1.CreateSprite('..\..\..\!media\tree.bmp','tree',{framesX}2,{framesY}1,{Delay}5,{X}250,{Y}250,{transparent}true,{Priority}2);

  gabriel.Free;
  shahira.Free;

  Randomize;

end;

procedure TForm1.JvTheater1BeforeRender(Sender: TObject; VirtualBitmap: TBitmap);
var
  SpriteGabriel,SpriteShahira,SpriteTree: Tjvsprite;
begin
  // ISO Priority
  SpriteGabriel:= JvTheater1.FindSprite('gabriel');
  SpriteShahira:= JvTheater1.FindSprite('shahira');
  SpriteTree:= JvTheater1.FindSprite('tree');

  if SpriteGabriel <> nil then
    SpriteGabriel.Priority := SpriteGabriel.Position.Y;
  if SpriteShahira <> nil then
    SpriteShahira.Priority := SpriteShahira.Position.Y;

    SpriteTree.Priority := SpriteTree.Position.Y + 170;

end;

procedure TForm1.JvTheater1Collision(Sender: TObject; Sprite1, Sprite2: TJvSprite);
begin
  inc (TotalCollision) ;
  memo1.Lines.Add( 'Collision ' + Sprite1.Guid + ' ' + Sprite2.guid  + ' ' + IntToStr(TotalCollision)    );
  if ((Sprite1.guid= 'spell') and (Sprite2.guid = 'shahira' )) or ((Sprite1.guid= 'shahira') and (Sprite2.guid = 'spell' )) then begin

      if (Sprite1.LifeSpan = 0) and (Sprite1.Guid='spell') then Sprite1.LifeSpan := 10;
      if (Sprite2.LifeSpan = 0) and (Sprite2.Guid='spell') then Sprite2.LifeSpan := 10;
      if Sprite1.Guid = 'shahira' then Sprite1.DieAtEndX := True;
      if Sprite2.Guid = 'shahira' then Sprite2.DieAtEndX := True;
      if (Pos( 'shahira' , Sprite1.SpriteFileName, 1)  <> 0)  and (Pos( 'dead' , Sprite1.SpriteFileName, 1)  = 0) then
        Sprite1.ChangeBitmap('..\..\..\!media\shahira_dead.bmp', {framesX}15,{framesY}6,{Delay}5);
      if (Pos( 'shahira' , Sprite2.SpriteFileName, 1)  <> 0)  and (Pos( 'dead' , Sprite2.SpriteFileName, 1)  = 0) then
        Sprite2.ChangeBitmap('..\..\..\!media\shahira_dead.bmp', {framesX}15,{framesY}6,{Delay}5);
  end;

end;

procedure TForm1.JvTheater1SpriteDestinationReached(Sender: TObject; ASprite: TJvSprite);
begin
  if aSprite.guid= 'spell' then
      if aSprite.LifeSpan = 0 then aSprite.LifeSpan := 10;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  SpriteGabriel, SpriteShahira, SpriteSpell: Tjvsprite;
begin
   SpriteShahira := JvTheater1.FindSprite('shahira');
   if SpriteShahira = nil then begin
     SpriteShahira:= JvTheater1.CreateSprite('..\..\..\!media\shahira_WALK.bmp','shahira',{framesX}15,{framesY}6,{Delay}7,{X}500,{Y}100,{transparent}true,{Priority}1);
     SpriteShahira.Collision := True;
   end;
   SpriteGabriel:= JvTheater1.FindSprite('gabriel');

   SpriteGabriel.ChangeBitmap('..\..\..\!media\gabriel_attack.bmp' ,{framesX}8,{framesY}6,{Delay}5);
   SpriteGabriel.StopAtEndX := True;
   SpriteGabriel.FrameY := 3;
   SpriteGabriel.FrameX := 1;

   SpriteSpell := JvTheater1.CreateSprite('..\..\..\!media\spell.bmp' ,'spell',{framesX}9,{framesY}1,{Delay}5,
   {X}SpriteGabriel.Position.X ,{Y}SpriteGabriel.Position.Y,{transparent}true,{Priority}1);

   SpriteSpell.Collision := true;
   SpriteSpell.MoverData.Speed := 4.0;
   SpriteSpell.MoverData.Destination := SpriteShahira.Position ;
   SpriteSpell.NotifyDestinationReached := true;
end;


end.

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Generics.Collections ,Generics.Defaults,
  JvSpriteEngine;

type
  TForm1 = class(TForm)
    JvTheater1: TJvTheater;
    procedure FormCreate(Sender: TObject);
    procedure JvTheater1SpriteMouseDown(Sender: TObject; lstSprite: TObjectList<JvSpriteEngine.TJvSprite>; Button: TMouseButton;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure PreLoadMemoryBitmaps;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gabriel,shahira: TBitmap;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  Background: TjvSprite;
begin

  Background:= JvTheater1.CreateSprite('..\..\..\!media\back1.bmp','background',{framesX}1,{framesY}1,{Delay}0,{X}0,{Y}0,{transparent}false,{Priority}0);
  Background.Position := Point( Background.FrameWidth div 2 , Background.FrameHeight div 2 );

  JvTheater1.Active := True;

  JvTheater1.CreateSprite('..\..\..\!media\arrow1.bmp','arrow1',{framesX}1,{framesY}1,{Delay}0,{X}100,{Y}560,{transparent}false,{Priority}1);
  JvTheater1.CreateSprite('..\..\..\!media\arrow2.bmp','arrow2',{framesX}1,{framesY}1,{Delay}0,{X}134,{Y}560,{transparent}false,{Priority}1);
  JvTheater1.CreateSprite('..\..\..\!media\arrow3.bmp','arrow3',{framesX}1,{framesY}1,{Delay}0,{X}134,{Y}524,{transparent}false,{Priority}1);
  JvTheater1.CreateSprite('..\..\..\!media\arrow4.bmp','arrow4',{framesX}1,{framesY}1,{Delay}0,{X}100,{Y}524,{transparent}false,{Priority}1);
  JvTheater1.CreateSprite('..\..\..\!media\arrow5.bmp','arrow5',{framesX}1,{framesY}1,{Delay}0,{X}66,{Y}524,{transparent}false,{Priority}1);
  JvTheater1.CreateSprite('..\..\..\!media\arrow6.bmp','arrow6',{framesX}1,{framesY}1,{Delay}0,{X}66,{Y}560,{transparent}false,{Priority}1);


  PreLoadMemoryBitmaps;

  JvTheater1.CreateSprite(gabriel ,'gabriel',{framesX}15,{framesY}6,{Delay}5,{X}100,{Y}100,{transparent}true,{Priority}1);
  JvTheater1.CreateSprite(shahira ,'shahira',{framesX}15,{framesY}6,{Delay}5,{X}200,{Y}100,{transparent}true,{Priority}1);
  gabriel.Free;
  shahira.Free;



end;
procedure TForm1.JvTheater1SpriteMouseDown(Sender: TObject; lstSprite: TObjectList<JvSpriteEngine.TJvSprite>; Button: TMouseButton;
  Shift: TShiftState);
var
  SpriteGabriel, SpriteShahira: TJvSprite;
begin
   SpriteGabriel:= JvTheater1.FindSprite('gabriel');
   SpriteShahira:= JvTheater1.FindSprite('shahira');

    if lstSprite[0].Guid = 'arrow1' then begin
      SpriteGabriel.FrameY := 1;
      SpriteShahira.FrameY := 1;
    end
    else if lstSprite[0].Guid = 'arrow2' then begin
      SpriteGabriel.FrameY := 2;
      SpriteShahira.FrameY := 2;
    end
    else if lstSprite[0].Guid = 'arrow3' then begin
      SpriteGabriel.FrameY := 3;
      SpriteShahira.FrameY := 3;
    end
    else if lstSprite[0].Guid = 'arrow4' then begin
      SpriteGabriel.FrameY := 4;
      SpriteShahira.FrameY := 4;
    end
    else if lstSprite[0].Guid = 'arrow5' then begin
      SpriteGabriel.FrameY := 5;
      SpriteShahira.FrameY := 5;
    end
    else if lstSprite[0].Guid = 'arrow6' then begin
      SpriteGabriel.FrameY := 6;
      SpriteShahira.FrameY := 6;
    end

end;

procedure TForm1.PreLoadMemoryBitmaps;
var
  i: Integer;
  tmp: TBitmap;
begin

  gabriel :=  TBitmap.Create;
  gabriel.Width := 1920;
  gabriel.height := 128 * 6;
  gabriel.PixelFormat := pf24bit;

  tmp :=  TBitmap.Create;
  tmp.LoadFromFile ( '..\..\..\!media\gabriel_IDLE.1.bmp');
  CopyRectTo(tmp, gabriel,0,0,0,0,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\gabriel_IDLE.2.bmp');
  CopyRectTo(tmp,gabriel,0,0,0,128,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\gabriel_IDLE.3.bmp');
  CopyRectTo(tmp,gabriel,0,0,0,256,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\gabriel_IDLE.4.bmp');
  CopyRectTo(tmp,gabriel,0,0,0,384,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\gabriel_IDLE.5.bmp');
  CopyRectTo(tmp,gabriel,0,0,0,512,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\gabriel_IDLE.6.bmp');
  CopyRectTo(tmp,gabriel,0,0,0,640,1920,128, false ,0 ) ;
  tmp.Free;

  shahira :=  TBitmap.Create;
  shahira.Width := 1920;
  shahira.height := 128 * 6;
  shahira.PixelFormat := pf24bit;

  tmp :=  TBitmap.Create;
  tmp.LoadFromFile ( '..\..\..\!media\shahira_IDLE.1.bmp');
  CopyRectTo(tmp, shahira,0,0,0,0,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\shahira_IDLE.2.bmp');
  CopyRectTo(tmp,shahira,0,0,0,128,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\shahira_IDLE.3.bmp');
  CopyRectTo(tmp,shahira,0,0,0,256,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\shahira_IDLE.4.bmp');
  CopyRectTo(tmp,shahira,0,0,0,384,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\shahira_IDLE.5.bmp');
  CopyRectTo(tmp,shahira,0,0,0,512,1920,128, false ,0 ) ;
  tmp.LoadFromFile ( '..\..\..\!media\shahira_IDLE.6.bmp');
  CopyRectTo(tmp,shahira,0,0,0,640,1920,128, false ,0 ) ;
  tmp.Free;


end;

end.

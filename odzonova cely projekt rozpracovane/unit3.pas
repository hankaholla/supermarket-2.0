unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam=record
     kod:string;
     nazov:string;
end;
const N=15;

var
  Form3: TForm3;
  zoznam:array[1..N]of zaznam;
  pole:array[1..N]of zaznam;
  mrazaky:array[1..N]of zaznam;
  pecivo:array[1..N]of zaznam;
  ovocie:array[1..N]of zaznam;
  zelenina:array[1..N]of zaznam;
  drogeria:array[1..N]of zaznam;
  maso:array[1..N]of zaznam;
  subor1:textfile;
  l,x,y,o,z,p,m,d:integer;

implementation
uses
  Unit2,Unit1,Unit4;



{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);  //mraz
begin
x:=20;
y:=20;
  Image1.Canvas.Fillrect(Clientrect);
  For l:=1 to N do
      Image1.Canvas.Textout(x,y*l,mrazaky[l].nazov);
end;

procedure TForm3.Button2Click(Sender: TObject);  //pecivko
begin
x:=20;
y:=20;
  Image1.Canvas.Fillrect(Clientrect);
  For l:=1 to N do
      Image1.Canvas.Textout(x,y*l,pecivo[l].nazov);

end;

procedure TForm3.Button3Click(Sender: TObject); //ovocie
begin
  x:=20;
  y:=20;
    Image1.Canvas.Fillrect(Clientrect);
    For l:=1 to N do
        Image1.Canvas.Textout(x,y*l,ovocie[l].nazov);
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
 Form2.Show;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
x:=20;
 y:=20;
   Image1.Canvas.Fillrect(Clientrect);
   For l:=1 to N do
       Image1.Canvas.Textout(x,y*l,zelenina[l].nazov);
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
   x:=20;
  y:=20;
    Image1.Canvas.Fillrect(Clientrect);
    For l:=1 to N do
        Image1.Canvas.Textout(x,y*l,drogeria[l].nazov);
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  Form1.Show;
//Form1.edit1.clear;
Form1.edit2.clear;
Form1.label7.visible:=False;
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
x:=20;
y:=20;
Image1.Canvas.Fillrect(Clientrect);
For l:=1 to N do
    Image1.Canvas.Textout(x,y*l,maso[l].nazov);
end;

procedure TForm3.FormCreate(Sender: TObject);
var i,j:integer;
  cislo:char;
begin
assignfile(subor1,'TOVAR.txt');
reset(subor1);
j:=0;

while not eof(subor1) do
      begin
        inc(j);

        read(subor,cislo);
         repeat
            pole[j].kod:=pole[j].kod+cislo;
            read(subor,cislo);
         until cislo=';';

         read(subor,znak);
         repeat
            pole[j].nazov:=pole[j].nazov+znak;
            read(subor,znak);
         until eoln(subor);
         readln(subor);
      end;

o:=0;
z:=0;
p:=0;
m:=0;
d:=0;

For j:=1 to N do
        begin
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='1') then begin
                                                          inc(o);
                                                          ovocie[o].nazov:=pole[j].nazov;
                                                          ovocie[o].kod:=pole[j].kod;

                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='2') then begin
                                                          inc(z);
                                                          zelenina[z].nazov:=pole[j].nazov;
                                                          zelenina[z].kod:=pole[j].kod;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='3') then begin
                                                          inc(p);
                                                          pecivo[p].nazov:=pole[j].nazov;
                                                          pecivo[p].kod:=pole[j].kod;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='4') then begin
                                                          inc(m);
                                                          mrazaky[m].nazov:=pole[j].nazov;
                                                          mrazaky[m].kod:=pole[j].kod;
                                                          end;

        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='5') then begin
                                                          inc(d);
                                                          drogeria[d].nazov:=pole[j].nazov;
                                                          drogeria[d].kod:=pole[j].kod;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='6') then begin
                                                          inc(d);
                                                          maso[d].nazov:=pole[j].nazov;
                                                          maso[d].kod:=pole[j].kod;
                                                          end;
        end;

end;

procedure TForm3.Image1Click(Sender: TObject);
begin

end;

end.


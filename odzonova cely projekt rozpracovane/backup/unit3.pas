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
    Image1: TImage;
    Label1: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam=record
     nazov:string;
     kod:string;
end;
const N=15;

var
  Form3: TForm3;
  pole:array[1..N]of zaznam;
  mrazaky:array[1..N]of zaznam;
  pecivo:array[1..N]of zaznam;
  ovocie:array[1..N]of zaznam;

  subor:textfile;
  l,x,y:integer;

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

procedure TForm3.Button2Click(Sender: TObject);
begin
x:=20;
y:=20;
  Image1.Canvas.Fillrect(Clientrect);
  For l:=1 to N do
      Image1.Canvas.Textout(x,y*l,pecivo[l].nazov);

end;

procedure TForm3.Button3Click(Sender: TObject);
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

procedure TForm3.FormCreate(Sender: TObject);
var i,j:integer;
begin
assignfile(subor,'zoznam.txt');
reset(subor);

i:=0;

while not eof (subor) do
        begin
            inc(i);
            readln(subor,pole[i].nazov);
            readln(subor,pole[i].kod);
        end;
i:=0;

For j:=1 to N do
        begin
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='1') then begin
                                                          inc(i);
                                                          mrazaky[j].nazov:=pole[i].nazov;
                                                          mrazaky[j].kod:=pole[i].kod;
                                                          end;
        if ((pole[j].kod[1])='2') and ((pole[j].kod[2])='2') then begin
                                                          inc(i);
                                                          pecivo[j].nazov:=pole[i].nazov;
                                                          pecivo[j].kod:=pole[i].kod;
                                                          end;
        if ((pole[j].kod[1])='3') and ((pole[j].kod[2])='3') then begin
                                                          inc(i);
                                                          ovocie[j].nazov:=pole[i].nazov;
                                                          ovocie[j].kod:=pole[i].kod;
                                                          end;
        end;



end;

procedure TForm3.Image1Click(Sender: TObject);
begin

end;

end.


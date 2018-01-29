unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls;

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
    Label1: TLabel;
    Label9: TLabel;
    ListView1: TListView;
    Memo2: TMemo;
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
    procedure Memo2Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam=record
     kod:string;
     nazov:string;
end;
const N=30;
  m=5 ;

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
  subor1,subor199:textfile;
  i,l,x,y,o,z,p,s,d,k:integer;

implementation
uses
  Unit2,Unit1,Unit4;



{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);  //mraz
begin
ListView1.Items.clear;
For i:=1 to m do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=mrazaky[i].nazov;
             //SubItems.Add(floattostr(cennik[i].cenap)+'€');
            end;
end;

end;

procedure TForm3.Button2Click(Sender: TObject);  //pecivko
begin
ListView1.Items.clear;
For i:=1 to m do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=pecivo[i].nazov;
             //SubItems.Add(floattostr(cennik[i].cenap)+'€');
            end;

end;

end;

procedure TForm3.Button3Click(Sender: TObject); //ovocie
begin
ListView1.Items.clear;
For i:=1 to m do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=ovocie[i].nazov;
             //SubItems.Add(floattostr(cennik[i].cenap)+'€');
end;

    end;

end;

procedure TForm3.Button4Click(Sender: TObject);
begin
 Form2.Show;
end;

procedure TForm3.Button5Click(Sender: TObject);    //zelenina
begin
ListView1.Items.clear;
For i:=1 to m do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=zelenina[i].nazov;
             //SubItems.Add(floattostr(cennik[i].cenap)+'€');
            end;
end;

end;

procedure TForm3.Button6Click(Sender: TObject);   //drogeria
begin
ListView1.Items.clear;
  For i:=1 to m do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=drogeria[i].nazov;
             //SubItems.Add(floattostr(cennik[i].cenap)+'€');
            end;
end;

end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  Form1.Show;
//Form1.edit1.clear;
Form1.edit2.clear;
Form1.label7.visible:=False;
end;

procedure TForm3.Button8Click(Sender: TObject);    //maso
begin
ListView1.Items.clear;
For i:=1 to m do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=maso[i].nazov;
             //SubItems.Add(floattostr(cennik[i].cenap)+'€');
            end;
end;

end;

procedure TForm3.FormCreate(Sender: TObject);
var i,j,www:integer;
  cislo,bc:char;
begin
memo2.Clear;
memo2.append('Váš účet');

assignfile(subor1,'TOVAR.txt');
reset(subor1);

j:=0;
www:=0;
readln(subor1);
while not eof(subor1) do

      begin
        inc(j);

         for i:=1 to 6 do
             begin
                 read(subor1,cislo);
                 pole[j].kod:=pole[j].kod+cislo;
             end;
         read(subor1,bc); //cita ;


         repeat
            read(subor1,znak);
            pole[j].nazov:=pole[j].nazov+znak;
         until eoln(subor1);

         readln(subor1);
      end;

o:=0;
z:=0;
p:=0;
k:=0;
d:=0;
s:=0;

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
                                                          inc(k);
                                                          mrazaky[k].nazov:=pole[j].nazov;
                                                          mrazaky[k].kod:=pole[j].kod;
                                                          end;

        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='5') then begin
                                                          inc(d);
                                                          drogeria[d].nazov:=pole[j].nazov;
                                                          drogeria[d].kod:=pole[j].kod;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='6') then begin
                                                          inc(s);
                                                          maso[s].nazov:=pole[j].nazov;
                                                          maso[s].kod:=pole[j].kod;
                                                          end;
        end;

end;

procedure TForm3.Image1Click(Sender: TObject);
begin

end;

procedure TForm3.Memo2Change(Sender: TObject);
begin

end;

end.


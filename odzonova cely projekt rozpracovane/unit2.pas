unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam1=record
      nazov: string;
      kod: integer;
 end;
 type zaznam2=record
       nazov: string;
       kod: integer;
       mnozstvo: integer;
 end;

const n=100;
var zoznam: array[1..n] of zaznam1;
    najpredavanejsie: array[1..n] of zaznam1;
    kupovane: array[1..n] of zaznam2;
  subor,subor1: textfile;
  kod_tovaru,mnozstvo,spolu: integer;
  Form2: TForm2;

implementation
uses
  Unit1,Unit3,Unit4;


{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);      //potvrdit
var l,k,h,nasiel_som: integer;
begin
  nasiel_som:=0;
  mnozstvo:=strtoint(edit2.text);
  kod_tovaru:=strtoint(edit1.text);
  k:=0;                                      //NEFUNGUJE = krevety

  for k:= 1 to n do
      begin
        if (kod_tovaru=zoznam[k].kod) then begin
                                         kupovane[k].kod:=kod_tovaru;
                                         kupovane[k].mnozstvo:=mnozstvo;
                                         kupovane[k].nazov:=zoznam[k].nazov;
                                         nasiel_som:=1;

                                         Memo2.Append(kupovane[k].nazov+' '+inttostr(kupovane[k].mnozstvo));
                                         end;
        if nasiel_som=0 then begin
                             label6.caption:='Chyba!';
                             end;

        //treba vyhodit vynimku
        end;





end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form1.Show;
Form1.edit1.clear;
Form1.edit2.clear;
Form1.label7.visible:=False;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin

end;

procedure TForm2.Button5Click(Sender: TObject);
begin
 Form4.Show;
end;

procedure TForm2.Button6Click(Sender: TObject);  //storno
var k,h: integer;
begin

  for k:= 1 to n do
      begin
        if (kod_tovaru=kupovane[k].kod) then begin
                                         kupovane[k].kod:=0;
                                         kupovane[k].mnozstvo:=0;
                                         kupovane[k].nazov:='0';
                                         memo2.clear;
                                         end
        //else begin ;//memo2.append( kupovane[k].nazov + ' ' + inttostr(kupovane[k].mnozstvo));
      end;

 for h:= 1 to spolu do
     memo2.append(kupovane[h].nazov + ' ' + inttostr(kupovane[h].mnozstvo))
end;
procedure TForm2.Edit1Click(Sender: TObject);
begin
  Edit1.Clear;
  inc(spolu);

end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
  edit2.clear;
end;

procedure TForm2.FormCreate(Sender: TObject);
var x,y,i,j: integer;
begin
 assignfile(subor,'najpredavanejsie.txt');
 reset(subor);
 i:=0;
 x:=20;
 y:=20;
spolu:=0;
 memo2.clear;



 Image1.Canvas.FillRect(clientrect);
 Memo2.Append('ÚČTENKA');

 while not eof (subor) do
       begin
         inc(i);

         readln(subor,najpredavanejsie[i].nazov);
         readln(subor,najpredavanejsie[i].kod);

         Image1.Canvas.textout(x,y*i,najpredavanejsie[i].nazov);
         end;

assignfile(subor1,'zoznam.txt');
reset(subor1);
j:=0;

Image1.Canvas.FillRect(clientrect);

while not eof (subor1) do
      begin
        inc(j);

        readln(subor1,zoznam[j].nazov);
        readln(subor1,zoznam[j].kod);

       memo1.append(zoznam[j].nazov +' ' + inttostr(zoznam[j].kod));
      end;

 label6.visible:=false;

end;

procedure TForm2.Label5Click(Sender: TObject);
begin

end;

end.


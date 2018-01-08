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
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam1=record       //zoznam+najpredavanejsie
      kod: string;
      nazov: string;
 end;
 type zaznam2=record     //nakupene
       nazov: string;
       kod: string;
       mnozstvo: integer;
       cena:real;
 end;
type zaznam3=record  //cennik
      kod:string;
      bc1:char;
      cenan:real;
      bc2:char;
      cenap:real;
      end;
const n=100;

var zoznam: array[1..n] of zaznam1;
    najpredavanejsie: array[1..n] of zaznam1;
    kupovane: array[1..n] of zaznam2;
    cennik:array[1..n] of zaznam3;

    subor,subor1,subor2,subor3: textfile;
    mnozstvo,spolu,nakupujem: integer;
    kod_tovaru:string;

    Form2: TForm2;

implementation
uses
  Unit1,Unit3,Unit4;


{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);      //potvrdit
var l,k,h: integer;
    cena:real;
begin

mnozstvo:=strtoint(edit2.text);
kod_tovaru:=edit1.text;
k:=0;
cena:=0;

for k:= 1 to n do
    begin
      if (kod_tovaru=zoznam[k].kod) then begin    //ak sa zadany kod nachadza zapisuj
                                           if (kod_tovaru=cennik[k].kod) then begin
                                                                                 kupovane[k].kod:=kod_tovaru;
                                                                                 kupovane[k].mnozstvo:=mnozstvo;
                                                                                 kupovane[k].nazov:=zoznam[k].nazov;
                                                                                 cena:=(mnozstvo*cennik[k].cenap);
                                                                                 kupovane[k].cena:=cena;
                                                                                 Memo2.Append(kupovane[k].nazov+' x '+inttostr(kupovane[k].mnozstvo)+'   '+floattostr(cena))
                                                                               end
                                         end
                                    else begin
                                           label6.caption:='Chybný kód, skúste ešte raz!';
                                         end;

      //treba vyhodit vynimku
      end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form1.Show;
Form1.edit2.clear;
Form1.label7.visible:=False;


end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm2.Button5Click(Sender: TObject);
var cislonakupu:integer;
begin
 Form4.Show;
 {assignfile(subor3,'KUPENE.txt');
 rewrite(subor);

 writeln(kupovane[1].kod

end;}

{procedure TForm2.Button6Click(Sender: TObject);  //storno
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
end; }

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
var x,y,i,j,pocetriadkov,pocetriadkov2: integer;
    znak,cislo,cislo2:char;
    line:string;
begin
memo2.clear;
Memo2.Append('Váš účet');
Memo2.Lines.Add(' ');


assignfile(subor,'STATISTIKA.txt');    //nacitava 10 najpredavanejsich
reset(subor);
i:=0;
x:=20;
y:=20;
spolu:=0;


 while not eof (subor) do   //subor statistika - 10
       begin
         inc(i);

          for i:=1 to 6 do
              begin
                read(subor,cislo);
                najpredavanejsie[i].kod:=najpredavanejsie[i].kod+cislo;
              end;
            read(subor,cislo);


         //read(subor,najpredavanejsie[i].kod);

         read(subor,znak);
         repeat
            najpredavanejsie[i].nazov:=najpredavanejsie[i].nazov+znak;
            read(subor,znak);
         until eoln(subor);


         Image1.Canvas.textout(x,y*i,najpredavanejsie[i].nazov);  //nahradit listboxom
         end;

assignfile(subor1,'TOVAR.txt');      //nacitava cely zoznam
reset(subor1);
j:=0;
read(subor1,pocetriadkov);

while not eof(subor1) do
      begin
        inc(j);
          For i:=1 to 6 do
             begin
               read(subor1,cislo);
               zoznam[j].kod:=zoznam[j].kod+cislo;
              end;
            read(subor1,cislo);

         //until cislo=';';

         //read(subor,najpredavanejsie[i].kod);

         read(subor1,znak);
         repeat
            zoznam[j].nazov:=zoznam[j].nazov+znak;
            read(subor1,znak);

         until eoln(subor1);



         //readln(subor1);

       memo1.append(zoznam[j].nazov +' ' +zoznam[j].kod);   //pomocne, potom vymazat
      end;
 label6.visible:=false;

  assignfile(subor2,'CENNIK.txt');
  reset(subor2);
  read(subor2,pocetriadkov2);
  i:=0;

  while not eof(subor2) do
        begin
          inc(i);
          ReadLn(subor2,line);
          SScanf(line,'%d %c %f %c %f',[@cennik[i].kod,@cennik[i].bc1,@cennik[i].cenan,@cennik[i].bc2,@cennik[i].cenap]);


        end;
  {For i:=1 to pocetriadkov2 do
      begin
      Memo1.Append(inttostr(cennik[i].kod));
      Memo1.Append(floattostr(cennik[i].cenan));
      Memo1.Append(floattostr(cennik[i].cenap));
      end; }

end;

procedure TForm2.Label5Click(Sender: TObject);
begin

end;

end.


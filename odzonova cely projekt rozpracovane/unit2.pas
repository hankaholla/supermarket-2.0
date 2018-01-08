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
<<<<<<< HEAD
<<<<<<< HEAD
type zaznam1=record       //zoznam+najpredavanejsie
      kod: string;
=======
type zaznam1=record
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
=======
type zaznam1=record
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
      nazov: string;
      kod: integer;
 end;
 type zaznam2=record     //nakupene
       nazov: string;
       kod: integer;
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
<<<<<<< HEAD
    cennik:array[1..n] of zaznam3;

    subor,subor1,subor2: textfile;
    mnozstvo,spolu,nakupujem: integer;
    kod_tovaru:string;

    Form2: TForm2;
=======
  subor,subor1: textfile;
  kod_tovaru,mnozstvo,spolu: integer;
  Form2: TForm2;
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy

implementation
uses
  Unit1,Unit3,Unit4;


{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);      //potvrdit
var l,k,h,nasiel_som: integer;
    cena:real;
begin
<<<<<<< HEAD
nasiel_som:=0;    //wtf?
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
=======
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





<<<<<<< HEAD
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
=======
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Form1.Show;
<<<<<<< HEAD
<<<<<<< HEAD
=======
Form1.edit1.clear;
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
=======
Form1.edit1.clear;
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
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
 assignfile(subor3,'KUPENE.txt');
 rewrite(subor);

 writeln(kupovane[1].kod

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
<<<<<<< HEAD
var x,y,i,j,pocetriadkov,pocetriadkov2: integer;
    znak,cislo,cislo2:char;
    line:string;
begin
memo2.clear;
Memo2.Append('Váš účet');
Memo2.Lines.Add(' ');
=======
var x,y,i,j: integer;
begin
 assignfile(subor,'najpredavanejsie.txt');
 reset(subor);
 i:=0;
 x:=20;
 y:=20;
spolu:=0;
 memo2.clear;
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy


assignfile(subor,'STATISTIKA.txt');    //nacitava 10 najpredavanejsich
reset(subor);
i:=0;
x:=20;
y:=20;
spolu:=0;


 while not eof (subor) do   //subor statistika - 10
       begin
         inc(i);

         readln(subor,najpredavanejsie[i].nazov);
         readln(subor,najpredavanejsie[i].kod);

<<<<<<< HEAD
         Image1.Canvas.textout(x,y*i,najpredavanejsie[i].nazov);  //nahradit listboxom
         end;

<<<<<<< HEAD
assignfile(subor1,'TOVAR.txt');      //nacitava cely zoznam
=======
assignfile(subor1,'zoznam.txt');
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
=======
         Image1.Canvas.textout(x,y*i,najpredavanejsie[i].nazov);
         end;

assignfile(subor1,'zoznam.txt');
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
reset(subor1);
j:=0;
read(subor,pocetriadkov);

Image1.Canvas.FillRect(clientrect);

<<<<<<< HEAD
=======
Image1.Canvas.FillRect(clientrect);

>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
while not eof (subor1) do
      begin
        inc(j);

        readln(subor1,zoznam[j].nazov);
        readln(subor1,zoznam[j].kod);
<<<<<<< HEAD

<<<<<<< HEAD
       memo1.append(zoznam[j].nazov +' ' +zoznam[j].kod);   //pomocne, potom vymazat
=======
       memo1.append(zoznam[j].nazov +' ' + inttostr(zoznam[j].kod));
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy
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
=======

       memo1.append(zoznam[j].nazov +' ' + inttostr(zoznam[j].kod));
      end;
>>>>>>> parent of 868e913... Upraveny pokladnici+Form2 robi problemy


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


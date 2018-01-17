unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DateUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListView1: TListView;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
type zaznam1=record       //zoznam
      kod: string;
      nazov: string;
 end;
  type zaznam=record       //najpredavanejsie
      kod: string;
      nazov: string;
      cena:real;
 end;
 type zaznam2=record     //nakupene
       nazov: string;
       kod: string;
       mnozstvo: integer;
       cena:real;
 end;
type zaznam3=record  //cennik
      kod:string;
      cenan:real;
      cenap:real;
      end;
const n=30;
      m=10;
      w=100;
      desatinna='.';

var zoznam: array[1..n] of zaznam1;
    najpredavanejsie: array[1..m] of zaznam;
    kupovane: array[1..w] of zaznam2;
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
k:=1;
cena:=0;

repeat
   if (kod_tovaru=zoznam[k].kod) then
         begin                    //ak sa zadany kod nachadza zapisuj
              if (kod_tovaru=cennik[k].kod) then
                    begin
                       kupovane[k].kod:=kod_tovaru;
                       kupovane[k].mnozstvo:=mnozstvo;
                       kupovane[k].nazov:=zoznam[k].nazov;
                       cena:=(mnozstvo*cennik[k].cenap);
                       kupovane[k].cena:=cena;
                       Memo2.Append(kupovane[k].nazov+' x '+inttostr(kupovane[k].mnozstvo)+'   '+floattostr(cena))
                     end
         end
  else begin
            inc(k);
       end;
until (k>n) or (kod_tovaru=zoznam[k].kod);

if (kod_tovaru<>zoznam[k].kod) then  label6.caption:='Chybný kód, skúste ešte raz!';

      //treba vyhodit vynimku
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

procedure TForm2.Button4Click(Sender: TObject);
var k,h:integer;
begin
  for k:= 1 to n do
      begin
        if (kod_tovaru=kupovane[k].kod) then begin
                                         kupovane[k].kod:='0';
                                         kupovane[k].mnozstvo:=0;
                                         kupovane[k].nazov:='0';
                                         memo2.clear;
                                         end
        //else begin ;//memo2.append( kupovane[k].nazov + ' ' + inttostr(kupovane[k].mnozstvo));
      end;

 for h:= 1 to spolu do
     memo2.append(kupovane[h].nazov + ' ' + inttostr(kupovane[h].mnozstvo))
end;
procedure TForm2.Button5Click(Sender: TObject);     //vyuctuj
var cislonakupu,pokl:integer;
begin
 Form4.Show;
 Form4.Memo1.clear;
 Form4.Memo1.append('');
 Form4.Memo1.append('Dátum nákupu: '+DateToStr(today));     //+'  '+TimeToStr(today)); //ShowMessage('Today     = '+DateToStr(date));
 Form4.Memo1.append('');


 //form4.memo1.append(
 {assignfile(subor3,'KUPENE.txt');
 rewrite(subor);

 writeln(kupovane[1].kod   }

end;
procedure TForm2.Label5Click(Sender: TObject);
var k,h:integer;
begin
for k:= 1 to n do
      begin
        if (kod_tovaru=kupovane[k].kod) then begin
                                         kupovane[k].kod:='0';
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
var x,y,i,j,pocetriadkov,pocetriadkov2,k: integer;
    znak,cislo,cislo2,bc,ch,s:char;
    line,nakup,predaj,predajkoniec,riadok,a:string;
    debil,skuska:real;
    today:TDateTime;
begin
today:= Now;
 DefaultFormatSettings.DecimalSeparator:='.';

 debil:=11.22;
memo2.clear;
Memo2.Append('Váš účet');
Memo2.Lines.Add(' ');




assignfile(subor1,'TOVAR.txt');      //nacitava cely zoznam
reset(subor1);
j:=0;
readln(subor1,pocetriadkov);

while not eof(subor1) do
      begin
        inc(j);
          For i:=1 to 6 do
             begin
               read(subor1,cislo);
               zoznam[j].kod:=zoznam[j].kod+cislo;
              end;
          read(subor1,bc); //cita ;

         repeat
            read(subor1,znak);
            zoznam[j].nazov:=zoznam[j].nazov+znak;
         until eoln(subor1);
         readln(subor1);

         //memo1.append(zoznam[j].nazov +' ' +zoznam[j].kod);   //pomocne, potom vymazat
      end;

 label6.visible:=false;



assignfile(subor,'STATISTIKA.txt');    //nacitava 10 najpredavanejsich
reset(subor);
i:=0;
x:=20;
y:=20;
spolu:=0;
 while not eof (subor) do   //subor statistika - 10
       begin
         inc(i);

          for j:=1 to 6 do
              begin
                read(subor,cislo);
                najpredavanejsie[i].kod:=najpredavanejsie[i].kod+cislo;
              end;
            read(subor,bc);

         repeat
            read(subor,znak);
            najpredavanejsie[i].nazov:=najpredavanejsie[i].nazov+znak;
         until eoln(subor);
         readln(subor);
        // memo1.append(najpredavanejsie[i].nazov);
    end;



  assignfile(subor2,'CENNIK.txt');
  reset(subor2);
  readln(subor2,pocetriadkov2);
  i:=0;

  For i:=1 to pocetriadkov2 do
        begin
          nakup:='';
          predaj:='';
          read(subor2,s);

          read(subor2,s);
         repeat
            cennik[i].kod:=cennik[i].kod+s;
            read(subor2,s);
         until s=';';
          //Memo1.append(cennik[i].kod);

          read(subor2,s);
          repeat
            nakup:=nakup+s;
            read(subor2,s);
          until s='.';
          nakup:=nakup+desatinna;

          read(subor2,s);
          while s<>';' do
              begin
                   nakup:=nakup+s;
                   read(subor2,s);
              end;
          cennik[i].cenan:=strtofloat(nakup);
          //memo1.append(floattostr(cennik[i].cenan));

           read(subor2,s);
          repeat
            predaj:=predaj+s;
            read(subor2,s);
          until s='.';
            predaj:=predaj+desatinna;

          For k:=1 to 2 do
              begin
                  read(subor2,s);
                  predaj:=predaj+s;
              end;

          cennik[i].cenap:=strtofloat(predaj);
          //memo1.append(floattostr(cennik[i].cenap));
          readln(subor);

          end;
  j:=1;
  {For i:=1 to m do
      begin
        j:=1;

      repeat
      if najpredavanejsie[i].kod=cennik[j].kod then
                                               begin
                                                  najpredavanejsie[i].cena:=cennik[j].cenap;
                                                  inc(j);
                                               end
       else inc(j);
       until najpredavanejsie[i].kod=cennik[j].kod;
       end; }

 { For k:=1 to 10 do
          begin
            For j:=1 to 30 do
                begin
                  if (najpredavanejsie[k].kod=cennik[j].kod) then najpredavanejsie[k].cena:=cennik[j].cenap
                end;
            memo1.append(floattostr(najpredavanejsie[k].cena));

            end;}
k:=0;

{repeat
  inc(k); //k=1
  j:=1;
  a:='';
  while a<>'ano' do
      begin
        if (najpredavanejsie[k].kod=cennik[j].kod) then begin
                                                          a:='ano';
                                                          najpredavanejsie[k].cena:=cennik[j].cenap;
                                                      end
        else inc(j);
     end;
  memo1.append(floattostr(najpredavanejsie[k].cena));
until k=10; }


                     {
                         repeat
                            inc(k);
                            j:=1;
                            while j<>0 do
                                begin
                                    if (najpredavanejsie[k].kod=cennik[j].kod) then
                                         begin
                                           with ListView1.Items.Add do
                                              begin
                                                j:=0;
                                               Caption:=najpredavanejsie[k].nazov;
                                               SubItems.Add(floattostr(cennik[j].cenap)+'€');
                                              end;
                                         end
                                    else inc(j);
                                end;

                         until k=10;}

 {with ListView1.Items.Add do
      begin
       Caption:=najpredavanejsie[k].nazov;
       SubItems.Add(floattostr(cennik[j].cenap)+'€');
      end;   }



  {Item1 := ListView1.Items.Add;
  Item1.Caption := inttostr(c);
  Item1.SubItems.Add('subitem1');

  Item2 := ListView1.Items.Add;
  Item2.Caption := 'item2';
  Item2.SubItems.Add('subitem2');}


end;

end.


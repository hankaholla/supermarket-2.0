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
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListView1: TListView;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemChecked(Sender: TObject; Item: TListItem);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;
  const w=100;

type zaznam1=record       //zoznam
      kod: string;
      nazov: string;
 end;
  type zaznam=record       //najpredavanejsie
      kod: string;
      nazov: string;
      cena:real;
 end;
type zaznam3=record  //cennik
      kod:string;
      cenan:real;
      cenap:real;
      end;
type zaznam4=record      //chcem kupit
      kod:string;
      nazov:string;
      mnozstvo:integer;
      cost:real;
      price:real;
      id:string;
      end;
   type zaznam2=record     //nakupene
       id: string;
       want:array[1..w] of zaznam4;
 end;
const n=30;
      m=10;
      path='\\commenius\public\market\tima';
      desatinna='.';

var zoznam: array[1..n] of zaznam1;
    najpredavanejsie: array[1..m] of zaznam;
    kupovane: array[1..w] of zaznam2;
    cennik:array[1..n] of zaznam3;
    want:array[1..w] of zaznam4;

    subor,subor1,subor2,subor3: textfile;
    spolu,nakupujem: integer;
    kod_tovaru:string;
    pocetriadkov,pocetriadkov2,done:integer;
    ucet:real;
    checked:boolean;
    //t:integer;


    Form2: TForm2;

implementation
uses
  Unit1,Unit3,Unit4;


{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);      //potvrdit
var mnozstvo,l,k,h,jupi,c,error,ops: integer;
    cena:real;
    strmnozstvo:string;
begin
ops:=0;
strmnozstvo:=edit2.text;
if strmnozstvo='' then  begin
                             ops:=1;
                             showmessage('Pole množstvo nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                             end;

if ops<>1 then  mnozstvo:=strtoint(edit2.text);
If ops<>1 then
   if (mnozstvo=0) then begin
                          showmessage('Pole množstvo nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                          ops:=1;
                          end;

kod_tovaru:=edit1.text;
error:=0;
if kod_tovaru='' then begin
                 showmessage('Pole kód tovaru nemôže byť prázdne. Zadajte prosím kód tovaru.');
                 error:=1;
                 end;
if kod_tovaru='000000' then begin
                             showmessage('Pole kód tovaru nemôže byť prázdne. Zadajte prosím kód tovaru.');
                             error:=1;
                             end;

//memo1.append(inttostr(poz));
cena:=0;
jupi:=0;

If (error<>1) then
   if (ops<>1) then
        For k:=1 to pocetriadkov do
         begin
           if (kod_tovaru=zoznam[k].kod) then     //ak sa zadany kod nachadza zapisuj
                 For c:=1 to pocetriadkov2 do
                       if (kod_tovaru=cennik[c].kod) then
                                  begin
                                     jupi:=1;
                                     cena:=(mnozstvo*cennik[c].cenap);
                                     inc(poz);
                                     memo1.append(inttostr(poz));
                                      kupovane[purchase].want[poz].nazov:=zoznam[k].nazov;
                                      kupovane[purchase].want[poz].kod:=zoznam[k].kod;
                                      kupovane[purchase].want[poz].mnozstvo:=mnozstvo;
                                      kupovane[purchase].want[poz].cost:=cennik[c].cenap;
                                      kupovane[purchase].want[poz].price:=cena;
                                     Memo2.Append(zoznam[k].nazov+'   '+inttostr(mnozstvo)+' x '+floattostr(cennik[c].cenap)+'  '+floattostr(cena));
                                     Form3.Memo2.Append(zoznam[k].nazov+'   '+inttostr(mnozstvo)+' x '+floattostr(cennik[c].cenap)+'  '+floattostr(cena));
                                   end;

           end;

If error<>1 then
   if ops<>1 then
      if (jupi=0) then showmessage('Chybný kód, skúste ešte raz!');
//memo2.append(inttostr(jupi));

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
  //Form3.memo1.append('zfomu'+inttostr(poz));
  //poz:=t;
end;

procedure TForm2.Button4Click(Sender: TObject);
var k,h:integer;
begin
  {for k:= 1 to n do
      begin
        if (kod_tovaru=kupovane[k].kod) then begin
                                         kupovane[k].kod:='0';
                                         kupovane[k].mnozstvo:=0;
                                         kupovane[k].id:='0';
                                         memo2.clear;
                                         end
        //else begin ;//memo2.append( kupovane[k].nazov + ' ' + inttostr(kupovane[k].mnozstvo));
      end;

 for h:= 1 to spolu do  }
    // memo2.append(kupovane[h].nazov + ' ' + inttostr(kupovane[h].mnozstvo))
end;
procedure TForm2.Button5Click(Sender: TObject);     //vyuctuj
var cislonakupu,pokl,i,number,tt:integer;
    id_transakcie:string;
begin
 Form4.Show;
 Form4.memo1.clear;
 Form4.Memo1.append('Pokladnik: '+pokladnik);
 Form4.Memo1.append('');
 Form4.Memo1.append('Dátum nákupu: '+DateToStr(today));     //+'  '+TimeToStr(today)); //ShowMessage('Today     = '+DateToStr(date));

 number:=0;
 randomize;
 id_transakcie:='P';
 For i:=2 to 11 do
     begin
       number:=random(10);
       id_transakcie:=id_transakcie+inttostr(number);
     end;

  Form4.Memo1.Append('ID transakcie: '+id_transakcie);

  Form4.Memo1.append('');
  Form4.Memo1.append('');

  For tt:=1 to poz do
      begin
         ucet:=ucet+kupovane[purchase].want[tt].price;
         Form4.Memo1.append(kupovane[purchase].want[tt].nazov+' '
             +inttostr(kupovane[purchase].want[tt].mnozstvo)+' x '
             +floattostr(kupovane[purchase].want[tt].cost)+'€'+'   '
             +floattostr(kupovane[purchase].want[tt].price)+'€');
         end;

  Form4.Memo1.append('');
  Form4.Memo1.append('Spolu: '+floattostr(ucet)+'€');;


 assignfile(subor3,'STATISTIKA.txt');
 rewrite(subor3);
 writeln(subor3,want[1].kod,';',want[1].mnozstvo,';',want[1].cost,';');
 closefile(subor3);

end;

procedure TForm2.Button6Click(Sender: TObject); //potvrdit listview
var mnozstvo,ops:integer;
    selected,strmnozstvo:string;
    price,cost:real;
    final:string;
begin
//inc(skuska);
//memo1.append('skuska'+inttostr(skuska));
ops:=0;
strmnozstvo:=edit3.text;
if strmnozstvo='' then  begin
                             ops:=1;
                             showmessage('Pole množstvo nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                             end;
if edit3.text='mnozstvo' then begin
                                ops:=1;
                                showmessage('Pole množstvo nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                                end;

If ops<>1 then begin
                 mnozstvo:=strtoint(edit3.text);
                 if mnozstvo=0 then
                               begin
                               showmessage('Pole množstvo nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                               ops:=1;
                               end;
                 end;

if checked=true then
   selected:=(ListView1.Selected.Caption)
else showmessage('Nevybrali ste žiadnu položku. Prosím vyberte zo zoznamu');

If ops<>1 then
      For i:=1 to 10 do
          if (selected=najpredavanejsie[i].nazov) then
             begin
              cost:=najpredavanejsie[i].cena;
              final:=najpredavanejsie[i].nazov;
              price:=mnozstvo*cost;
              inc(poz);
              //memo1.append(inttostr(poz));
              kupovane[purchase].want[poz].nazov:=final;
              kupovane[purchase].want[poz].kod:=najpredavanejsie[i].kod;
              kupovane[purchase].want[poz].mnozstvo:=mnozstvo;
              kupovane[purchase].want[poz].cost:=cost;
              kupovane[purchase].want[poz].price:=price;
             end;

If ops<>1 then
   begin
Memo2.append(final+' '+inttostr(mnozstvo)+' x '+floattostr(cost)+'€'+'          '+floattostr(price)+'€');
Form3.Memo2.append(final+' '+inttostr(mnozstvo)+' x '+floattostr(cost)+'€'+'    '+floattostr(price)+'€');

end;

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

procedure TForm2.Edit3Click(Sender: TObject);
begin
edit3.clear;
end;

procedure TForm2.FormCreate(Sender: TObject);
var x,y,i,j,k,ano: integer;
    znak,cislo,cislo2,bc,ch,s:char;
    line,nakup,predaj,predajkoniec,riadok,a:string;
    skuska:real;
    today:TDateTime;

    success:array[1..10]of integer;
begin
done:=0;
today:= Now;
DefaultFormatSettings.DecimalSeparator:='.';

memo2.clear;
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

 //label6.visible:=false;



assignfile(subor,'najpredavanejsie.txt');    //nacitava 10 najpredavanejsich
reset(subor);
i:=0;
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
           // memo1.append(najpredavanejsie[i].kod);

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
         repeat
            cennik[i].kod:=cennik[i].kod+s;
            read(subor2,s);
         until s=';';
          //Memo3.append(cennik[i].kod);

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

          readln(subor2);
        end;


  //         KONIEC NACITANI SUBOROV          //
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
//k:=0;

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



{For k:=1 to 10 do
    begin
      success[k]:=0;
    repeat
     For j:=1 to 30 do
         begin
             if (najpredavanejsie[k].kod=cennik[j].kod) then
                   begin
                   najpredavanejsie[k].cena:=cennik[j].cenap;
                   memo1.append(najpredavanejsie[k].nazov+floattostr(najpredavanejsie[k].cena));
                   success[k]:=1;
                   end
         end;
     until (success[k]=1);
     end;    }

For k:=1 to 10 do
    For j:=1 to 30 do
        begin
            if (najpredavanejsie[k].kod=cennik[j].kod) then
                  begin
                   if cennik[j].cenap<>0 then
                      begin
                        najpredavanejsie[k].cena:=cennik[j].cenap;
                        //memo1.append(najpredavanejsie[k].nazov+floattostr(najpredavanejsie[j].cena));
                       end;

                  end;
        end;

For k:=1 to 10 do
 with ListView1.Items.Add do
     begin
       Caption:=najpredavanejsie[k].nazov;
       SubItems.Add(floattostr(najpredavanejsie[k].cena)+'€');
     end;


{j:=0;       //POVODNE TAKMER FUNGUJUCE
k:=0;
repeat
  inc(k);
  j:=1;
  ano:=0;
  repeat
      if (najpredavanejsie[k].kod=cennik[j].kod) then
                     with ListView1.Items.Add do
                        begin
                         Memo1.append(najpredavanejsie[k].nazov+' '+floattostr(cennik[j].cenap));
                         Caption:=najpredavanejsie[k].nazov;
                         SubItems.Add(floattostr(cennik[j].cenap)+'€');
                         ano:=1;;
                        end
      else inc(j);
  until (ano=1);

until (k=10); }

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

procedure TForm2.ListView1ItemChecked(Sender: TObject; Item: TListItem);
var li: TListItem;
    selected:string;
begin
for li in listView1.Items do
   begin
     if li.Checked then
     begin
      //selected:=li;
      //memo1.apend(selected);
     end;
end;

end;

procedure TForm2.ListView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
begin
Item := ListView1.GetItemAt(X, Y);
 if Item <> nil then
   if ListView1.Selected <> Item then
     ListView1.Selected := Item;

checked:=true;
end;

end.


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
    Button9: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    ListView1: TListView;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure ListView1ItemChecked(Sender: TObject; Item: TListItem);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
  public
    { public declarations }
  end;
  const w=100;

type zaznam=record    //sekcie
     kod:string;
     nazov:string;
     cena:real;
end;
  type zaznam1=record    //zoznam
     kod:string;
     nazov:string;
     cena:real;
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
const N=30;
  M=5 ;

var
  Form3: TForm3;
  zoznam:array[1..N]of zaznam1;
  pole:array[1..N]of zaznam1;
  mrazaky:array[1..N]of zaznam;
  pecivo:array[1..N]of zaznam;
  ovocie:array[1..N]of zaznam;
  zelenina:array[1..N]of zaznam;
  drogeria:array[1..N]of zaznam;
  maso:array[1..N]of zaznam;
  kupovane: array[1..w] of zaznam2;
  want:array[1..w] of zaznam4;

  subor1:textfile;
  i,l,x,y,o,z,p,s,d,k,r,done:integer;

implementation
uses
  Unit2,Unit1,Unit4;



{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);  //mraz
begin
ListView1.Items.clear;
For i:=1 to M do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=mrazaky[i].nazov;
             SubItems.Add(floattostr(mrazaky[i].cena)+'€');
            end;
end;

end;

procedure TForm3.Button2Click(Sender: TObject);  //pecivko
begin
ListView1.Items.clear;
For i:=1 to M do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=pecivo[i].nazov;
             SubItems.Add(floattostr(pecivo[i].cena)+'€');
            end;

end;

end;

procedure TForm3.Button3Click(Sender: TObject); //ovocie
begin
ListView1.Items.clear;
For i:=1 to M do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=ovocie[i].nazov;
             SubItems.Add(floattostr(ovocie[i].cena)+'€');
end;

    end;

end;

procedure TForm3.Button4Click(Sender: TObject); //sipka spat
begin
 Form2.Show;
end;

procedure TForm3.Button5Click(Sender: TObject);    //zelenina
begin
ListView1.Items.clear;
For i:=1 to M do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=zelenina[i].nazov;
             SubItems.Add(floattostr(zelenina[i].cena)+'€');
            end;
end;

end;

procedure TForm3.Button6Click(Sender: TObject);   //drogeria
begin
ListView1.Items.clear;
  For i:=1 to M do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=drogeria[i].nazov;
             SubItems.Add(floattostr(drogeria[i].cena)+'€');
            end;
end;

end;

procedure TForm3.Button7Click(Sender: TObject);   //odhlasenie
begin
Form1.Show;
//Form1.edit1.clear;
Form1.edit2.clear;
Form1.label7.visible:=False;
end;

procedure TForm3.Button8Click(Sender: TObject);    //maso
begin
ListView1.Items.clear;
For i:=1 to M do
    begin
       with ListView1.Items.Add do
            begin
             Caption:=maso[i].nazov;
             SubItems.Add(floattostr(maso[i].cena)+'€');
            end;
end;

end;

procedure TForm3.Button9Click(Sender: TObject);
var ops,mnozstvo:integer;
  strmnozstvo,selected,final:string;
  cost,price:real;

begin
//inc(skuska);
//memo1.append('skuska'+inttostr(skuska));

ops:=0;
strmnozstvo:=edit3.text;
if strmnozstvo='' then  begin
                             ops:=1;
                             showmessage('Pole nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                             end;
if strmnozstvo='mnozstvo' then begin
                                ops:=1;
                                showmessage('Pole nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                               end;

if ops<>1 then begin
                 mnozstvo:=strtoint(edit3.text);
                 if mnozstvo=0 then
                               begin
                               showmessage('Pole nemôže byť prázdne. Zadajte prosím požadované množstvo.');
                               ops:=1;
                               end;
                 end;

selected:=(ListView1.Selected.Caption);

If ops<>1 then
      For i:=1 to pocetriadkov do
          if (selected=pole[i].nazov) then
             begin
             final:=pole[i].nazov;
             cost:=pole[i].cena;
             price:=mnozstvo*cost;

             inc(poz);
             memo1.append(inttostr(poz));
              kupovane[purchase].want[poz].nazov:=final;
              kupovane[purchase].want[poz].kod:=pole[i].kod;
              kupovane[purchase].want[poz].mnozstvo:=mnozstvo;
              kupovane[purchase].want[poz].cost:=cost;
              kupovane[purchase].want[poz].price:=price;
             end;

If ops<>1 then
   begin
Memo2.append(final+' '+inttostr(mnozstvo)+' x '+floattostr(cost)+'€'+'          '+floattostr(price)+'€');
Form2.Memo2.append(final+' '+inttostr(mnozstvo)+' x '+floattostr(cost)+'€'+'    '+floattostr(price)+'€');
end;

end;

procedure TForm3.Edit3Click(Sender: TObject);
begin
  edit3.clear;
  //if t=0 then memo1.append('edit'+inttostr(t));
end;

procedure TForm3.FormCreate(Sender: TObject);
var i,j:integer;
  cislo,bc:char;
begin
memo2.Clear;

assignfile(subor1,'TOVAR.txt');
reset(subor1);

j:=0;
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
r:=0;
d:=0;
s:=0;

For j:=1 to N do
        begin
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='1') then begin
                                                          inc(o);
                                                          ovocie[o].nazov:=pole[j].nazov;
                                                          ovocie[o].kod:=pole[j].kod;
                                                          For k:=1 to 30 do
                                                              if ovocie[o].kod=cennik[k].kod then
                                                                begin
                                                                  if cennik[k].cenap<>0 then
                                                                    begin
                                                                  ovocie[o].cena:=cennik[k].cenap;
                                                                  pole[j].cena:=cennik[k].cenap;
                                                                    end;
                                                                end;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='2') then begin
                                                          inc(z);
                                                          zelenina[z].nazov:=pole[j].nazov;
                                                          zelenina[z].kod:=pole[j].kod;
                                                          For k:=1 to 30 do
                                                              if  zelenina[z].kod= cennik[k].kod then
                                                               begin
                                                                  if cennik[k].cenap<>0 then
                                                                   begin
                                                                   zelenina[z].cena:= cennik[k].cenap;
                                                                   pole[j].cena:=cennik[k].cenap;
                                                                end;

                                                               end;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='3') then begin
                                                          inc(p);
                                                          pecivo[p].nazov:=pole[j].nazov;
                                                          pecivo[p].kod:=pole[j].kod;
                                                          For k:=1 to 30 do
                                                              if  pecivo[p].kod= cennik[k].kod then
                                                                begin
                                                                  if cennik[k].cenap<>0 then
                                                                    begin
                                                                   pecivo[p].cena:= cennik[k].cenap;
                                                                   pole[j].cena:=cennik[k].cenap;
                                                                end;

                                                                end;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='4') then begin
                                                          inc(r);
                                                          mrazaky[r].nazov:=pole[j].nazov;
                                                          mrazaky[r].kod:=pole[j].kod;
                                                          For k:=1 to 30 do
                                                              if  mrazaky[r].kod= cennik[k].kod then
                                                                begin
                                                                  if cennik[k].cenap<>0 then
                                                                begin
                                                                   mrazaky[r].cena:= cennik[k].cenap;
                                                                   pole[j].cena:=cennik[k].cenap;
                                                                end;

                                                                end;
                                                          end;

        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='5') then begin
                                                          inc(d);
                                                          drogeria[d].nazov:=pole[j].nazov;
                                                          drogeria[d].kod:=pole[j].kod;
                                                          For k:=1 to 30 do
                                                              if  drogeria[d].kod= cennik[k].kod then
                                                                  begin
                                                                      if cennik[k].cenap<>0 then
                                                                          begin
                                                                             drogeria[d].cena:= cennik[k].cenap;
                                                                             pole[j].cena:=cennik[k].cenap;
                                                                          end;
                                                                  end;
                                                          end;
        if ((pole[j].kod[1])='1') and ((pole[j].kod[2])='6') then
                                                        begin
                                                          inc(s);
                                                          maso[s].nazov:=pole[j].nazov;
                                                          maso[s].kod:=pole[j].kod;
                                                           For k:=1 to 30 do
                                                              if  maso[s].kod= cennik[k].kod then
                                                                begin
                                                                  if cennik[k].cenap<>0 then
                                                                      begin
                                                                         maso[s].cena:= cennik[k].cenap;
                                                                         pole[j].cena:=cennik[k].cenap;
                                                                      end;

                                                                end;
                                                          end;
        end;

Button3.Click;
//t:=t;
//if t=0 then memo1.append('form'+inttostr(t));

end;

procedure TForm3.Image1Click(Sender: TObject);
begin

end;

procedure TForm3.ListView1Click(Sender: TObject);
begin
  //memo1.append('list'+inttostr(poz));
end;

procedure TForm3.ListView1ItemChecked(Sender: TObject; Item: TListItem);
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

//if t=0 then memo1.append('list'+inttostr(t));
end;

procedure TForm3.ListView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
begin
Item := ListView1.GetItemAt(X, Y);
 if Item <> nil then
   if ListView1.Selected <> Item then
     ListView1.Selected := Item;

end;

end.


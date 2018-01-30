unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button7: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
    const n=1000;
    w=100;
    type zaznam4=record      //chcem kupit
      kod:string;
      nazov:string;
      mnozstvo:integer;
      cost:real;
      price:real;
      end;
type zaznam=record
     id:string;
     want:array[1..w] of zaznam4;
     end;

var
  Form4: TForm4;
  t:integer;
  kupovane:array[1..n]of zaznam;
  want:array[1..w] of zaznam4;
implementation
uses
  Unit1,Unit2,Unit3;

{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
  //nacitanie uctenky
//Memo1.append
end;

procedure TForm4.Memo1Change(Sender: TObject);
begin

end;

procedure TForm4.Button7Click(Sender: TObject);    //vypiname pokladnu
var i,j: integer;
begin
Form1.Show;
Form1.edit2.clear;
Form1.label7.visible:=False;

  if purchase=1 then
       begin
        kupovane[purchase].id:='';
        For j:=1 to t do               //vyprazdni rekord pri zamykani pokladne
              begin
                kupovane[purchase].want[j].nazov:='';
                kupovane[purchase].want[j].kod:='';
                kupovane[purchase].want[j].mnozstvo:=0;
                kupovane[purchase].want[j].cost:=0;
                kupovane[purchase].want[j].price:=0;
              end;
       end
  else begin
    For i:=1 to purchase do
        begin
        kupovane[purchase].id:='';
        For j:=1 to t do               //vyprazdni rekord aby sa mohlo znovu nakupovat
              begin
                kupovane[purchase].want[j].nazov:='';
                kupovane[purchase].want[j].kod:='';
                kupovane[purchase].want[j].mnozstvo:=0;
                kupovane[purchase].want[j].cost:=0;
                kupovane[purchase].want[j].price:=0;
              end;

        end;
    end;

purchase:=0; //vypiname pokladnu

end;

procedure TForm4.Button1Click(Sender: TObject);   //novy nakup od formu2
var i,j:integer;
begin
Form2.Show;
Form2.memo2.clear;
Form3.memo2.clear;
Form4.memo1.clear;
Form2.memo1.clear;
Form2.edit3.clear;
Form2.edit2.clear;
Form3.edit3.clear;

inc(purchase);
poz:=0;
form2.memo1.append(inttostr(t));
form2.memo1.append(inttostr(purchase));

end;

end.


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

        For j:=1 to poz do               //vyprazdni rekord pri zamykani pokladne
              begin
                want[j].nazov:='';
                want[j].kod:='';
                want[j].mnozstvo:=0;
                want[j].cost:=0;
                want[j].price:=0;
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
form2.memo1.append(inttostr(purchase));
{For j:=1 to poz do               //vyprazdni rekord pri zamykani pokladne
             begin
               want[j].nazov:='';
               want[j].kod:='';
               want[j].mnozstvo:=0;
               want[j].cost:=0;
               want[j].price:=0;
             end; }

//inc(purchase);
poz:=0;

form2.memo1.append(inttostr(poz));

end;

end.


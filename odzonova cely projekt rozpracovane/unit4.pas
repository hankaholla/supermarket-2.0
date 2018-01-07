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
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam=record
     kod:integer;
     nazov:string;
     mnozstvo: integer;
     cena:real;
     end;
  const n=100;
var
  Form4: TForm4;
  kupovane:array[1..n]of zaznam;
implementation
uses
  Unit1,Unit2;

{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
  //nacitanie uctenky
//Memo1.append
end;

procedure TForm4.Button7Click(Sender: TObject);
var i: integer;
begin
Form1.Show;
Form1.edit2.clear;
Form1.label7.visible:=False;
For i:=1 to n do               //vyprazdni rekord aby sa mohlo znovu nakupovat
    begin
      kupovane[i].kod:=0;
      kupovane[i].nazov:=inttostr(0);
      kupovane[i].mnozstvo:=0;
      kupovane[i].cena:=0;
    end;
end;

procedure TForm4.Button1Click(Sender: TObject);
var i:integer;
begin
  Form2.Show; //+nakodit vycistenie kosika, vycistit record nakupenych
  For i:=1 to n do               //vyprazdni rekord aby sa mohlo znovu nakupovat
    begin
      kupovane[i].kod:=0;
      kupovane[i].nazov:=inttostr(0);
      kupovane[i].cena:=0;
    end;
end;

end.


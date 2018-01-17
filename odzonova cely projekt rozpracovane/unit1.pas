unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
type zaznam=record       //pokladnici.txt
     meno:string;
     heslo:string;
end;
const n=4;
var zamestnanci: array [1..n] of zaznam;
    subor: textfile;
    znak: char;
    heslo:string;
    meno: string;
    Form1: TForm1;

implementation
uses
  Unit2,Unit3,Unit4;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin
  label7.visible:=False;
 { assignfile(subor99,'koktina.txt');
  rewrite(subor99);
  writeln(subor99,'blabla');
  closefile(subor99); }
    For i:=1 to n do  begin
      zamestnanci[i].heslo:='placeholder';
      zamestnanci[i].meno:='placeholder';
  end;

  assignfile(subor,'pokladnici.txt');
  reset(subor);
  i:=0;
  while not eof (subor) do
        begin
          inc(i);
          readln(subor,zamestnanci[i].meno);
          readln(subor,zamestnanci[i].heslo);
        end;
  label7.visible:=False;

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.Label4Click(Sender: TObject);
begin

end;
procedure TForm1.Button1Click(Sender: TObject);
var pokl: integer;
begin
heslo:=edit2.text;
if heslo='' then
   showmessage('Heslo nemoze byt prazdne! Zadajte heslo.');

label7.visible:=False;

for pokl:= 1 to n do
    begin
      if (heslo=zamestnanci[pokl].heslo) then begin
                                             Form1.Visible:=False;
                                             Form2.Show;
                                             Form2.label5.caption:='Pokladnik:  '+ zamestnanci[pokl].meno;
                                             Form3.label1.caption:='Pokladnik:  '+ zamestnanci[pokl].meno;
                                             Form4.Memo1.clear;
                                             Form4.Memo1.append('Pokladnik: '+zamestnanci[pokl].meno);
                                           end
      else begin
           label7.visible:=True;
           //label7.caption:='CHYBNE PRIHLASOVACIE UDAJE!SKUSTE ZNOVU';
           end;
    end;

end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
  edit2.clear;
end;

end.


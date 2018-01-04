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
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;

implementation
uses
  Unit1,Unit2;

{$R *.lfm}

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
  //nacitanie uctenkz
  //Memo1.append
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
    Form1.Show;
//Form1.edit1.clear;
Form1.edit2.clear;
Form1.label7.visible:=False;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  Form2.Show; //+nakodit vycistenie kosika, vycistit record nakupenych
end;

end.


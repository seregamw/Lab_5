unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit4;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
try
    Data.ADOQuery1.SQL.Clear;
    Data.ADOQuery1.SQL.Add('INSERT INTO Users (Login, Pass) values("'+Edit1.Text+'", "'+Edit2.Text+'")');
    //Data.ADOQuery1.Active:=True;
    Data.ADOQuery1.ExecSQL;
   except
    on e:Exception do
   end;
       ShowMessage('User Add');
       Close;
end;

end.

unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Unit4;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure refresh_table;

var
  Form5: TForm5;
  user_selected:string;

implementation

{$R *.dfm}

procedure refresh_table;
var
 i,count:integer;
begin
   try
    Data.ADOQuery1.SQL.Clear;
    Data.ADOQuery1.SQL.Add('SELECT * FROM Users');
    Data.ADOQuery1.Active:=True;
   except
    on e:Exception do
   end;

   //Width
    i:=0;
    count:=Form5.DBGrid1.Columns.Count;
    while i<count do
    begin
   Form5.DBGrid1.Columns[i].Width:=60;
    i:=i+1;
    end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
   try
    Data.ADOQuery1.SQL.Clear;
    Data.ADOQuery1.SQL.Add('INSERT INTO Users (Login, Pass) values("'+Edit1.Text+'", "'+Edit2.Text+'")');
    //Data.ADOQuery1.Active:=True;
    //Data.ADOQuery1.Open;
    Data.ADOQuery1.ExecSQL;
   except
    on e:Exception do
   end;
    refresh_table;

Form5.Label3.Caption:='Count of Users: '+IntToStr(Form5.DBGrid1.DataSource.DataSet.RecordCount);
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  try
    Data.ADOQuery1.SQL.Clear;
    Data.ADOQuery1.SQL.Add('DELETE FROM Users WHERE Login="'+user_selected+'"');
    //Data.ADOQuery1.Active:=True;
    Data.ADOQuery1.ExecSQL;
   except
    on e:Exception do
   end;
    refresh_table;

Form5.Label3.Caption:='Count of Users: '+IntToStr(Form5.DBGrid1.DataSource.DataSet.RecordCount);
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
setfileattributes(pchar('Users.dat'),2); //2- скрытый , 1 простой
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
setfileattributes(pchar('Users.dat'),1); //2- скрытый , 1 простой
end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
begin
   user_selected:=DBGrid1.DataSource.DataSet.FieldByname(dbgrid1.Columns[0].Title.caption).Value;
end;

end.

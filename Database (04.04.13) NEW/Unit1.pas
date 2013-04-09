unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, DBTables, Menus, Unit2, Unit3,
  ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo1: TMemo;
    Button5: TButton;
    Label1: TLabel;
    Button6: TButton;
    Button7: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Button8: TButton;
    Button9: TButton;
    PopupMenu1: TPopupMenu;
    Createtable1: TMenuItem;
    Deletetable1: TMenuItem;
    Select1: TMenuItem;
    Insertdate1: TMenuItem;
    Update1: TMenuItem;
    Delete1: TMenuItem;
    emplates1: TMenuItem;
    MainMenu1: TMainMenu;
    Options1: TMenuItem;
    AccountsManager1: TMenuItem;
    StatusBar1: TStatusBar;
    Exit1: TMenuItem;
    Button11: TButton;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    PopupMenu2: TPopupMenu;
    Exit2: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ListBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Createtable1Click(Sender: TObject);
    procedure Deletetable1Click(Sender: TObject);
    procedure Select1Click(Sender: TObject);
    procedure Insertdate1Click(Sender: TObject);
    procedure Update1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure AccountsManager1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Exit2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    { procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer); }
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  procedure show_table;

var
  Form1: TForm1;
  table_name,user2_selected:string;

  type
  TCrackDBGrid = class(TCustomDBGrid)
  end;



implementation

uses Unit5;


{$R *.dfm}


procedure show_table;
var
 i,count:integer;
begin
   try
    Form1.ADOQuery1.SQL.Clear;
    Form1.ADOQuery1.SQL.Add('SELECT * FROM '+table_name);
    Form1.ADOQuery1.Active:=True;
   except
    on e:Exception do
   end;

   //Width
    i:=0;
    count:=Form1.DBGrid1.Columns.Count;
    while i<count do
    begin
   Form1.DBGrid1.Columns[i].Width:=60;
    i:=i+1;
    end;
end;



procedure TForm1.AccountsManager1Click(Sender: TObject);
var
a:integer;
begin
refresh_table;
Form5.Show;

Form5.Label3.Caption:='Count of Users: '+IntToStr(Form5.DBGrid1.DataSource.DataSet.RecordCount);
end;


procedure TForm1.Button11Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
first,second,third,four:string;
begin
first:=dbgrid1.Columns[0].Title.caption;
second:=dbgrid1.Columns[1].Title.caption;
third:=dbgrid1.Columns[2].Title.caption;
four:=dbgrid1.Columns[3].Title.caption;

   try
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('INSERT INTO '+table_name+' ('+first+', '+second+', '+third+', '+four+') values("'+Edit1.Text+'", "'+Edit2.Text+'", "'+Edit3.Text+'", "'+Edit4.Text+'")');
    //Data.ADOQuery1.Active:=True;
    //Data.ADOQuery1.Open;
    ADOQuery1.ExecSQL;
   except
    on e:Exception do Form1.StatusBar1.Panels[1].Text:='ERROR: Fill all edits!!!';
   end;
    show_table;













  { try
    if (Trim(Edit1.Text)='') or (Trim(Edit2.Text)='') then
     begin
      exit;
     end;
    ADOQuery1.Insert;

    ADOQuery1.FieldByName('fio').AsString:=Edit1.Text;
    ADOQuery1.FieldByName('rate').AsString:=Edit2.Text;
    ADOQuery1.FieldByName(dbgrid1.Columns[0].Title.caption).AsInteger:=StrToInt(Edit1.Text);
    ADOQuery1.FieldByName(dbgrid1.Columns[1].Title.caption).AsString:=Edit2.Text;
    ADOQuery1.FieldByName(dbgrid1.Columns[2].Title.caption).AsString:=Edit3.Text;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
   except
    on e:Exception do
   end;    }
end;

procedure TForm1.Button2Click(Sender: TObject);
var
first:string;
begin
first:=dbgrid1.Columns[0].Title.caption;
  try
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('DELETE FROM '+table_name+' WHERE '+first+'='+user2_selected+'');
    //Data.ADOQuery1.Active:=True;
    ADOQuery1.ExecSQL;
   except
    on e:Exception do
   end;
    show_table;
  { try
    if Application.MessageBox('Delete?','ADO',MB_YESNO)=IDYES then
     begin
      ADOQuery1.Delete;
     end;
   except
    on e:Exception do
   end; }
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Button1.Enabled:=False;
Button2.Enabled:=False;
Button3.Enabled:=False;
Button4.Enabled:=False;
Button5.Enabled:=False;
Button6.Enabled:=False;
Button7.Enabled:=False;
Button8.Enabled:=False;
Button9.Enabled:=False;


 //TDrawGrid(DBGrid1).ScrollBars:=ssNone;
 //EnableScrollBar(DBGrid1.Handle,SB_BOTH,ESB_DISABLE_BOTH);

    ADOConnection1.GetTableNames(ListBox1.Items);
    //ADOConnection1.GetFieldNames('Student',ListBox1.Items);
    ListBox1.Selected[0]:= True;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then
    begin
      Form1.TrayIcon1.Visible := True;
      Form1.Hide;
    end;
end;

procedure TForm1.Insertdate1Click(Sender: TObject);
begin
memo1.Lines.Text:='INSERT INTO Tablename (snum, sname, scity, scounty) values("25", "Ezio", "Rome", "Italy")';
end;

procedure TForm1.ListBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

  var
  Point : TPoint;
  Nomer : Integer;
  s:string;

  a:string;
  i,count:integer;
begin
Button1.Enabled:=True;
Button2.Enabled:=True;
Button3.Enabled:=True;
Button4.Enabled:=True;
Button5.Enabled:=True;
Button6.Enabled:=True;
Button7.Enabled:=True;
Button8.Enabled:=True;
Button9.Enabled:=True;

  Point.X := X;
  Point.Y := Y;
  Nomer := ListBox1.ItemAtPos(Point, True);
  //edit2.text := IntToStr(Nomer);
  s:=ListBox1.Items[Nomer];
  table_name:=s;

  begin
   try
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM '+s);
    //ADOQuery1.Active:=True;
    ADOQuery1.Open;
   except
    on e:Exception do
   end;


    i:=0;
    count:=DBGrid1.Columns.Count;
    while i<count do
    begin
    DBGrid1.Columns[i].Width:=60;
    i:=i+1;
    end;
  end;

end;

procedure TForm1.Select1Click(Sender: TObject);
begin
memo1.Lines.Text:='SELECT * FROM Tablename where snum=25';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Form1.Caption:='Database |Date:  '+DateToStr(Date)+' | Time: '+TimeToStr(Time);
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Form1.Show;
end;

procedure TForm1.Update1Click(Sender: TObject);
begin
memo1.Lines.Text:='UPDATE Tablename SET sname = "Altair", scity="Acra" WHERE snum=25';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   ADOQuery1.Refresh;
end;

procedure TForm1.Button5Click(Sender: TObject);

var
i,count:integer;
begin
   try
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add(Memo1.Lines.Text);
    //ADOQuery1.Active:=True;
    ADOQuery1.ExecSQL;

    i:=0;
    count:=DBGrid1.Columns.Count;

    while i<count do
    begin
    DBGrid1.Columns[i].Width:=60;

    i:=i+1;
    end;
   except
    on e:Exception do Form1.StatusBar1.Panels[1].Text:='ERROR: Invalid Syntax!!!';
   end;

   show_table;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
i,count:integer;
field_name:string;
begin
field_name:=dbgrid1.Columns[0].Title.caption;
  begin
   try
   //ShowMessage(dbgrid1.Columns[0].Title.caption);
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM '+table_name+' ORDER BY '+field_name+' DESC');
    ADOQuery1.Active:=True;

          i:=0;
          count:=DBGrid1.Columns.Count;
          while i<count do
          begin
          DBGrid1.Columns[i].Width:=60;
          i:=i+1;
          end;

   except
    on e:Exception do
   end;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
i,count:integer;
field_name:string;
begin
field_name:=dbgrid1.Columns[0].Title.caption;
  begin
   try
   //ShowMessage(dbgrid1.Columns[0].Title.caption);
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM '+table_name+' ORDER BY '+field_name+' ASC');
    ADOQuery1.Active:=True;

          i:=0;
          count:=DBGrid1.Columns.Count;
          while i<count do
          begin
          DBGrid1.Columns[i].Width:=60;
          i:=i+1;
          end;

   except
    on e:Exception do
   end;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
  begin
   try
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('DROP TABLE '+table_name);
    ADOQuery1.Active:=True;
   except
    on e:Exception do
   end;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
   try
    ADOConnection1.GetTableNames(ListBox1.Items);
    ListBox1.Selected[0]:= True;
   except
    on e:Exception do
   end;
end;

procedure TForm1.Createtable1Click(Sender: TObject);
begin
memo1.Lines.Text:='CREATE TABLE Tablename ( snum integer, sname char (255), scity char (255), scounty char (255))';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   try
    ADOQuery1.Edit;
    ADOQuery1.FieldByName(dbgrid1.Columns[0].Title.caption).AsInteger:=StrToInt(Edit1.Text);
    ADOQuery1.FieldByName(dbgrid1.Columns[1].Title.caption).AsString:=Edit2.Text;
    ADOQuery1.FieldByName(dbgrid1.Columns[2].Title.caption).AsString:=Edit3.Text;
    ADOQuery1.FieldByName(dbgrid1.Columns[3].Title.caption).AsString:=Edit4.Text;
   except
    on e:Exception do
   end;
end;

//********************************************************************

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
user2_selected:=DBGrid1.DataSource.DataSet.FieldByname(dbgrid1.Columns[0].Title.caption).Value;

   try
    Edit1.Text:=IntToStr(ADOQuery1.FieldByName(dbgrid1.Columns[0].Title.caption).AsInteger);
    Edit2.Text:=ADOQuery1.FieldByName(dbgrid1.Columns[1].Title.caption).AsString;
    Edit3.Text:=ADOQuery1.FieldByName(dbgrid1.Columns[2].Title.caption).AsString;
    Edit4.Text:=ADOQuery1.FieldByName(dbgrid1.Columns[3].Title.caption).AsString;

   except
    on e:Exception do
   end;

{var
  i,n,count,q:integer;
  a:string;
begin
   for i := 0 to Form1.ComponentCount-1 do
     if Form1.Components[i] is TEdit then
       TEdit(Form1.Components[i]).Text := '';

   count := DBGrid1.Columns.Count;
   n := count;

   for i := 0 to Form1.ComponentCount-1 do
     if Form1.Components[i] is TEdit
      then
        begin
           if n = 0 then
              break
           else
             begin
                TEdit(Form1.Components[i]).Text := ADOQuery1.FieldByName(dbgrid1.Columns[count-n].Title.caption).AsString;
                dec(n);
             end;
        end;   }

end;

procedure TForm1.Delete1Click(Sender: TObject);
begin
memo1.Lines.Text:='DELETE FROM Tablename WHERE snum=25';
end;

procedure TForm1.Deletetable1Click(Sender: TObject);
begin
memo1.Lines.Text:='DROP TABLE Tablename';
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Exit2Click(Sender: TObject);
begin
Application.Terminate;
end;

end.

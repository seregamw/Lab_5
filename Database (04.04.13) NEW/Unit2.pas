unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit3, Unit4, Unit5;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Data.ADOQuery1.SQL.Clear;
  Data.ADOQuery1.SQL.Add('SELECT * FROM Users WHERE Login="'+Edit1.Text+'"');
  Data.ADOQuery1.Open;
   {
  if  (Edit1.text='admin') and (Edit2.text='admin') //<>�������
	then
        begin
              ShowMessage('�� ����� ��� �����');
              //Form1.Show;
              Form1.AccountsManager1.Enabled:=true;
              Form1.StatusBar1.SimpleText:='Login: ['+Edit1.Text+']';
        end
  else }
        if Data.ADOQuery1.IsEmpty
          then
            ShowMessage('User '+Edit1.Text+' not found!')
          else
            if Data.ADOQuery1.FieldByName('Pass').Value <> Edit2.Text
              then
                ShowMessage('Wrong Pass!')
                  else
                    //Admin CHECK
                      if  (Data.ADOQuery1.FieldByName('Login').Value='admin') and (Data.ADOQuery1.FieldByName('Pass').Value='admin')
	                        then
                            begin
                                  ShowMessage('You are Log-in as [ADMIN]');
                                  Form1.AccountsManager1.Enabled:=true;
                                  //Form1.StatusBar1.SimpleText:='Login: ['+Edit1.Text+']';
                                  Form1.StatusBar1.Panels[0].Text:='Login: ['+Edit1.Text+']';
                                  Form2.Hide;
                                  Form1.Show;
                            end
                      else
                      begin
                      //Form1.StatusBar1.SimpleText:='Login: '+Edit1.Text;
                      Form1.StatusBar1.Panels[0].Text:='Login: '+Edit1.Text;
                      //ShowMessage('�� ����� ��� ������������=)');
                      Form2.Hide;
                      Form1.Show;
                      end;
end;


procedure TForm2.Button2Click(Sender: TObject);
begin
Form3.Show;
end;


end.

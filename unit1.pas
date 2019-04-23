unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, mysql50conn, mysql56conn, sqldb, FileUtil, Forms,
  Controls, Graphics, Dialogs, DBGrids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    MySQL56Connection1: TMySQL56Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
str_sql : string;
begin
try
SQLQuery1.Active := false;
SQLQuery1.SQL.Clear;
str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
SQLQuery1.sql.add(str_sql);
SQLQuery1.ExecSQL;
SQLQuery1.SQL.Clear;
SQLQuery1.sql.add('SELECT * FROM informaciyaoknigax;');
SQLQuery1.Open;
except
ShowMessage('SQL-запрос: ОШИБКА!');
exit;
end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   SQLQuery1.Insert;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SQLQuery1.ApplyUpdates;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SQLQuery1.Edit;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  SQLQuery1.Delete;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

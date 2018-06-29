unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DBDateTimePicker;

type
  TForm5 = class(TForm)
    GroupBox4: TGroupBox;
    DBGrid4: TDBGrid;
    DBDateTimePicker1: TDBDateTimePicker;
    btnfiltre: TBitBtn;
    btncik: TBitBtn;
    DBDateTimePicker2: TDBDateTimePicker;
    Label3: TLabel;
    Label1: TLabel;
    btnsatisraporla: TBitBtn;
    procedure btnfiltreClick(Sender: TObject);
    procedure btncikClick(Sender: TObject);
    procedure btnsatisraporlaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}
uses unit1, Unit8;

procedure TForm5.btnfiltreClick(Sender: TObject);
begin
if(DBDateTimePicker1.Date>DBDateTimePicker2.Date)then
begin
ShowMessage('Ýlk Tarih Son Tarihten Sonra Olamaz...');
end
else
begin
Form1.tablesatislar.Filter := 'Tarih >=' +#39+DateToStr(DBDateTimePicker1.Date)+#39+' AND Tarih<=' +#39+DateToStr(DBDateTimePicker2.Date)+#39;
Form1.tablesatislar.Filtered:=true;
Form1.Querysatislar.SQL.Clear;
Form1.Querysatislar.SQL.Add('select * from satis where Tarih Between '+#39+DateToStr(DBDateTimePicker1.Date)+#39+' and '+#39+DateToStr(DBDateTimePicker2.Date)+#39);
Form1.Querysatislar.ExecSQL;
Form1.Querysatislar.Active:=true;

if(Form1.Querysatislar.RecordCount<=0)then
begin
ShowMessage('Satýþ Kaydý Yoktur...');
end
else
begin
ShowMessage(IntToStr(Form1.Querysatislar.RecordCount)+' Tane Satýþ Kaydý Listelendi...');
end;

end;
end;
procedure TForm5.btncikClick(Sender: TObject);
begin
Form5.Close;
Form1.tablesatislar.Filtered:=false;
end;

procedure TForm5.btnsatisraporlaClick(Sender: TObject);
begin
SatislarRapor.QuickRep1.Preview;
end;

end.

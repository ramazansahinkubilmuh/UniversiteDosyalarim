unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    tbtcno: TEdit;
    tbadi: TEdit;
    tbsoyadi: TEdit;
    tbtelefon: TEdit;
    tbadres: TEdit;
    btnkaydet: TBitBtn;
    btncik: TBitBtn;
    tbmno: TEdit;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnkaydetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncikClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tutnumara:String;
    hangisi:Boolean;
  end;

var
  Form2: TForm2;

implementation
uses unit1;
{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
if(hangisi=true)then
begin
tbmno.Clear;
tbtcno.Clear;
tbadi.Clear;
tbsoyadi.Clear;
tbtelefon.Clear;
tbadres.Clear;
end;
end;

procedure TForm2.btnkaydetClick(Sender: TObject);
begin
Form1.Querymusteri.SQL.Clear;
Form1.Querymusteri.SQL.Add('select * from musteriler where Mno='+#39+tbmno.Text+#39);
Form1.Querymusteri.ExecSQL;
Form1.Querymusteri.Active:=true;
if(tbmno.Text='')or(tbadi.Text='')or(tbsoyadi.Text='')then
begin
ShowMessage('Zorunlu Alanlarý Doldurunuz....');
end
else
begin
if(hangisi=true)then
begin
if(Form1.Querymusteri.RecordCount<=0)then
begin
Form1.tablemusteri.Insert;
Form1.tablemusteri['Mno']:=tbmno.Text;
Form1.tablemusteri['Tcno']:=tbtcno.Text;
Form1.tablemusteri['Adi']:=tbadi.Text;
Form1.tablemusteri['Soyadi']:=tbsoyadi.Text;
Form1.tablemusteri['Telefon']:=tbtelefon.Text;
Form1.tablemusteri['Adres']:=tbadres.Text;
Form1.tablemusteri.Post;
ShowMessage('Müþteri Kaydedildi...');
Form2.Close;
end
else
begin
ShowMessage(tbmno.Text+' Numaralý Müþteri Var!');
end;
end
else
begin
if(Form1.Querymusteri.RecordCount<=0)or(tutnumara=tbmno.Text)then
begin
Form1.tablemusteri.Edit;
Form1.tablemusteri['Mno']:=tbmno.Text;
Form1.tablemusteri['Tcno']:=tbtcno.Text;
Form1.tablemusteri['Adi']:=tbadi.Text;
Form1.tablemusteri['Soyadi']:=tbsoyadi.Text;
Form1.tablemusteri['Telefon']:=tbtelefon.Text;
Form1.tablemusteri['Adres']:=tbadres.Text;
Form1.tablemusteri.Post;
ShowMessage('Müþteri Kaydedildi...');
Form2.Close;
end
else
begin
ShowMessage(tbmno.Text+' Numaralý Kayýt Var!');
end;
end;
end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.tablemusteri.Refresh;
end;

procedure TForm2.btncikClick(Sender: TObject);
begin
Form2.Close;
end;

end.

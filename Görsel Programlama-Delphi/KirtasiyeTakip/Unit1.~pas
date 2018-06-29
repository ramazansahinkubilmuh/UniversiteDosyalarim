unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, StdCtrls, Grids, DBGrids, Buttons, DBSearch, Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    btnmusterikayit: TBitBtn;
    btnmusteriduzenle: TBitBtn;
    btnmusterisil: TBitBtn;
    btnkasa: TBitBtn;
    btncikis: TBitBtn;
    btnurunekle: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    btnsepeteekle: TBitBtn;
    btnsepettencikar: TBitBtn;
    btnsatisyap: TBitBtn;
    datasourceurun: TDataSource;
    datasourcesatislar: TDataSource;
    datasourcesepet: TDataSource;
    tableurun: TTable;
    tablesatislar: TTable;
    tablesepet: TTable;
    Queryurun: TQuery;
    Querysatislar: TQuery;
    Querysepet: TQuery;
    btnstok: TBitBtn;
    datasourceurunlistele: TDataSource;
    Queryurunlistele: TQuery;
    SearchEdit1: TSearchEdit;
    SearchEdit2: TSearchEdit;
    SearchEdit3: TSearchEdit;
    SearchEdit4: TSearchEdit;
    SearchEdit7: TSearchEdit;
    SearchEdit8: TSearchEdit;
    datasourcecikis: TDataSource;
    tablecikis: TTable;
    Querycikis: TQuery;
    MainMenu1: TMainMenu;
    MteriKayt1: TMenuItem;
    MteriDzenle1: TMenuItem;
    MteriSil1: TMenuItem;
    rnler1: TMenuItem;
    Stok1: TMenuItem;
    Kasa1: TMenuItem;
    k1: TMenuItem;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    rnler2: TMenuItem;
    StokEkle1: TMenuItem;
    Kasa2: TMenuItem;
    SepeteEkle1: TMenuItem;
    Sepettenkar1: TMenuItem;
    SatOnayla1: TMenuItem;
    Mteriler1: TMenuItem;
    rnEkle1: TMenuItem;
    StokEkle2: TMenuItem;
    SatlarListele1: TMenuItem;
    Querymusteri: TQuery;
    tablemusteri: TTable;
    PopupMenu1: TPopupMenu;
    YeniMteri1: TMenuItem;
    MteriDzenle2: TMenuItem;
    MteriSil2: TMenuItem;
    datasourcemusteri: TDataSource;

    procedure btnsepeteekleClick(Sender: TObject);
    procedure goster();
    procedure btnmusterikayitClick(Sender: TObject);
    procedure btnmusteriduzenleClick(Sender: TObject);
    procedure btnmusterisilClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnsepettencikarClick(Sender: TObject);
    procedure btnsatisyapClick(Sender: TObject);
    procedure btncikisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnurunekleClick(Sender: TObject);
    procedure btnstokClick(Sender: TObject);
    procedure btnkasaClick(Sender: TObject);
    procedure MteriKayt1Click(Sender: TObject);
    procedure MteriDzenle1Click(Sender: TObject);
    procedure MteriSil1Click(Sender: TObject);
    procedure k1Click(Sender: TObject);
    procedure YeniMteri1Click(Sender: TObject);
    procedure MteriDzenle2Click(Sender: TObject);
    procedure MteriSil2Click(Sender: TObject);
    procedure rnler2Click(Sender: TObject);
    procedure StokEkle1Click(Sender: TObject);
    procedure Kasa2Click(Sender: TObject);
    procedure SepeteEkle1Click(Sender: TObject);
    procedure Sepettenkar1Click(Sender: TObject);
    procedure SatOnayla1Click(Sender: TObject);
    procedure rnEkle1Click(Sender: TObject);
    procedure StokEkle2Click(Sender: TObject);
    procedure SatlarListele1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Unit2, Unit3, Unit4, Unit5;
{$R *.dfm}

procedure TForm1.goster();
begin
  Querysepet.Close;
  Querysepet.SQL.Clear;
  Querysepet.SQL.Add('SELECT SUM(Fiyat) from sepet');
  Querysepet.ExecSQL;
  Querysepet.Open;
  if(tablesepet.RecordCount>0)then
  begin
  Label10.Caption :='Toplam Tutar : '+ Querysepet.Fields[0].AsString+' TL';
  Label9.Caption:=IntToStr(tablesepet.RecordCount)+' Tane Ürün Sepete Eklendi...';
  end
  else
  begin
  Label10.Caption :='Toplam Tutar : 0 TL';
  Label9.Caption:='0 Tane Ürün Sepete Eklendi...';
  end;

end;

procedure TForm1.btnmusterikayitClick(Sender: TObject);
begin
Form2.Caption:='Yeni Müþteri Kaydet';
Form2.hangisi:=true;
Form2.ShowModal;
end;

procedure TForm1.btnmusteriduzenleClick(Sender: TObject);
begin
if(tablemusteri.RecordCount<=0)then
begin
ShowMessage('Müþteri Seçilmemiþtir...');
end
else
begin
Form2.Caption:=Form1.tablemusteri['Mno']+' Numaralý Müþteriyi Düzenle';
Form2.hangisi:=false;
Form2.tutnumara:=Form1.tablemusteri['Mno'];
Form2.tbmno.Text:=Form1.tablemusteri['Mno'];
Form2.tbtcno.Text:=tablemusteri['Tcno'];
Form2.tbadi.Text:=tablemusteri['Adi'];
Form2.tbsoyadi.Text:=tablemusteri['Soyadi'];
Form2.tbtelefon.Text:=tablemusteri['Telefon'];
Form2.tbadres.Text:=tablemusteri['Adres'];
Form2.ShowModal;
end;
end;

procedure TForm1.btnmusterisilClick(Sender: TObject);
var
cevap:Integer;
numara:String;
begin
if(tablemusteri.RecordCount>0)then
begin
cevap:=Application.MessageBox('Silmek Ýstiyor Musunuz ? ','Müþteri Sil',MB_YESNO);
if(cevap=IDYES)then
begin
numara:=tablemusteri['Mno'];
tablemusteri.Delete;
ShowMessage(numara+' Numaralý Müþteri Kaydý Silindi...');
tablemusteri.Refresh;
end;
end
else
begin
ShowMessage('Müþteri Seçilmemiþtir...');
end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
Label10.Caption :='Toplam Tutar : 0 TL';
Label9.Caption:='0 Tane Ürün Sepete Eklendi...';

tablemusteri.Active:=true;
tableurun.Active:=true;
tablesatislar.Active:=true;
tablesepet.Active:=true;
tablecikis.Active:=true;
Queryurunlistele.Active:=true;

if(tablesepet.RecordCount>0)then
goster();
end;

procedure TForm1.btnsepeteekleClick(Sender: TObject);
var
cevap:Integer;
begin
cevap:=Application.MessageBox('Sepete Eklemek Ýstiyor Musunuz?','Sepete Ürün Ekle',MB_YESNO);
if(cevap=IDYES) then
begin
if(tablemusteri.RecordCount>0)and(tableurun.RecordCount>0)then
begin
tablesepet.Insert;
tablesepet['Mno']:=DBGrid1.Fields[0].Text;
tablesepet['Barkodno']:=DBGrid2.Fields[0].Text;
tablesepet['Fiyat']:=DBGrid2.Fields[2].Text;
tablesepet.Post;
tablesepet.Refresh;
ShowMessage(DBGrid2.Fields[0].Text+ ' Barkod Numaralý Ürün Sepete Eklendi...');
tableurun.Refresh;
end
else
begin
ShowMessage('Müþteri veya Ürün Seçilmemiþtir...');
end;
end;
goster();
end;

procedure TForm1.btnsepettencikarClick(Sender: TObject);
var
cevap:Integer;
numara:String;
begin
cevap:=Application.MessageBox('Sepetten Çýkarmak Ýstiyor Musunuz?','Sepetten Ürün Çýkar',MB_YESNO);
if(cevap=IDYES) then
begin
if(tablesepet.RecordCount>0)then
begin
numara:=tablesepet['Barkodno'];
tablesepet.Delete;
ShowMessage(numara+ ' Barkod Numaralý Ürün Sepetten Çýkarýldý...');
tablesepet.Refresh;
end
else
begin
ShowMessage('Sepetten Ürün Bulunmamaktadýr...');
end;
end;
goster();
end;

procedure TForm1.btnsatisyapClick(Sender: TObject);
var
tarih,saat:String;
sayi:Integer;
cevap:Integer;
stokadet:String;
begin
cevap:=Application.MessageBox('Satýþý Onaylýyor Musunuz?','Satýþ Yap',MB_YESNO);
if(cevap=IDYES) then
begin
if(tablesepet.RecordCount>0)then
begin
sayi:=0;
tablesepet.First;
stokadet:=IntToStr(tablesepet.RecordCount);
while(sayi<tablesepet.RecordCount)do
begin
sayi:=sayi+1;
tablesatislar.Insert;
tablesatislar['Mno']:=tablesepet['Mno'];
tablesatislar['Barkodno']:=tablesepet['Barkodno'];
tablesatislar['Fiyat']:=tablesepet['Fiyat'];
tablesatislar['Tarih']:=DateToStr(Date);
tablesatislar.Post;
tablesatislar.Refresh;
tablesepet.Next;

tablecikis.Insert;
tablecikis['Barkodno']:=DBGrid2.Fields[0].Text;
tablecikis['StokAdet']:='1';
tablecikis['Tarih']:=DateToStr(Date);
tablecikis.Post;
tablecikis.Refresh;
end;
ShowMessage(stokadet+ ' Tane Ürün Ýçin '+Label10.Caption+' Tutarýndaki Satýþ Onaylandý...');
Label10.Caption :='Toplam Tutar : 0 TL';
Label9.Caption:='0 Tane Ürün Sepete Eklendi...';
sayi:=0;
tablesepet.First;
while(sayi<=tablesepet.RecordCount)do
begin
sayi:=sayi+1;
tablesepet.Next;
tablesepet.Delete;
end;
end
else
begin
ShowMessage('Sepette Ürün Bulunmamaktadýr...');
end;
end;
end;

procedure TForm1.btncikisClick(Sender: TObject);
var
cevap:Integer;
begin
cevap:=Application.MessageBox('Çýkmak Ýstediðinize Emin Misiniz?','Çýkýþ Yap',MB_YESNO);
if(cevap=IDYES) then
begin
ShowMessage('Çýkýþ Yaptýnýz...');
Form1.Close;
end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
tablemusteri.Active:=false;
tableurun.Active:=false;
tablesatislar.Active:=false;

tablecikis.Active:=true;

SearchEdit1.Clear;
SearchEdit2.Clear;
SearchEdit3.Clear;
SearchEdit4.Clear;
SearchEdit7.Clear;
SearchEdit8.Clear;

end;

procedure TForm1.btnurunekleClick(Sender: TObject);
begin
Form3.ShowModal;
end;

procedure TForm1.btnstokClick(Sender: TObject);
begin
form4.ShowModal;
end;

procedure TForm1.btnkasaClick(Sender: TObject);
begin
form5.ShowModal;
end;


procedure TForm1.MteriKayt1Click(Sender: TObject);
begin
btnmusterikayit.Click;
end;

procedure TForm1.MteriDzenle1Click(Sender: TObject);
begin
btnmusteriduzenle.Click;
end;

procedure TForm1.MteriSil1Click(Sender: TObject);
begin
btnmusterisil.Click;
end;


procedure TForm1.k1Click(Sender: TObject);
begin
btncikis.Click;
end;

procedure TForm1.YeniMteri1Click(Sender: TObject);
begin
btnmusterikayit.Click;
end;

procedure TForm1.MteriDzenle2Click(Sender: TObject);
begin
btnmusteriduzenle.Click;
end;

procedure TForm1.MteriSil2Click(Sender: TObject);
begin
btnmusterisil.Click;
end;

procedure TForm1.rnler2Click(Sender: TObject);
begin
btnurunekle.Click;
end;

procedure TForm1.StokEkle1Click(Sender: TObject);
begin
btnstok.Click;
end;

procedure TForm1.Kasa2Click(Sender: TObject);
begin
btnkasa.Click;
end;

procedure TForm1.SepeteEkle1Click(Sender: TObject);
begin
btnsepeteekle.Click;
end;

procedure TForm1.Sepettenkar1Click(Sender: TObject);
begin
btnsepettencikar.Click;
end;

procedure TForm1.SatOnayla1Click(Sender: TObject);
begin
btnsatisyap.Click;
end;

procedure TForm1.rnEkle1Click(Sender: TObject);
begin
btnurunekle.Click;
end;

procedure TForm1.StokEkle2Click(Sender: TObject);
begin
btnstok.Click;
end;

procedure TForm1.SatlarListele1Click(Sender: TObject);
begin
btnkasa.Click;
end;

end.

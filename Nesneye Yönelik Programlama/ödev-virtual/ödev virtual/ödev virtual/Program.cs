using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ödev_virtual
{
    class Program
    {
        static void Main(string[] args)
        {
         yerli yerli_hesap = new yerli(15000, 15, "Abdulkadir Karacı", 20);
         doviz doviz_hesap = new doviz(3000, 20, "Mehmet Kara", 1.67, "euro");
         hesap[] hesaplar = new hesap[40];
         hesaplar[0] = yerli_hesap;
         hesaplar[0].kredi_ver(100);
         hesaplar[1] = doviz_hesap;
         hesaplar[2] = new yerli(1000, 25, "Mustafa Erdemir", 15);
         hesaplar[2].kredi_ver(100);
         hesaplar[2].kredi_ver(500);
         hesaplar[2].hesap_bilgisi();
         hesaplar[1].kredi_ver(100);
         hesaplar[1].para_yatir(100);
         hesaplar[1].hesap_bilgisi();
         Console.ReadKey();

        }
    }
    public class hesap
    {
        protected long miktar; protected int hesap_no;
        protected String sahip; protected bool bloke;
        protected Int64 verilen_kredi;
        public hesap(Int64 miktar, int hesap_no, String sahip)
        {
            bloke = false;
            this.miktar = miktar;
            this.hesap_no = hesap_no;
            this.sahip = sahip;
        }
        public void para_yatir(Int64 ek_miktar) { if (!bloke) miktar += ek_miktar; }
        public void para_cek(Int64 ek_miktar) { if (!bloke) miktar -= ek_miktar; }
        public virtual void hesap_bilgisi()
        {
            Console.WriteLine("*********************");
            Console.WriteLine("Hesap no:" + hesap_no);
            Console.WriteLine("Hesap Sahibi:" + sahip);
            Console.WriteLine("Para miktari:" + miktar);
        }
        public virtual void kredi_ver(Int64 verilen_kredi)
        {
            //if (this.verilen_kredi + miktar > 10000) bloke = true;
            //else this.verilen_kredi += verilen_kredi;
            Console.WriteLine("123345677890**");
        }
    }
    public class yerli : hesap
    {
        private int faiz_orani; 

        public yerli(Int64 miktar, int hesap_no, String sahip, int faiz_orani)
            : base(miktar, hesap_no, sahip)
        { this.faiz_orani = faiz_orani; }

        public override void kredi_ver(Int64 verilen_kredi)
        {
            if (this.verilen_kredi + verilen_kredi > 10000) bloke = true;
            else this.verilen_kredi += verilen_kredi;
        }

        public void faiz_islet() { miktar = miktar * (faiz_orani + 100) / 100; }

        public override void hesap_bilgisi()
        {
            base.hesap_bilgisi();
            Console.WriteLine("YTL");
            Console.WriteLine("Verilen kredi miktari:" + verilen_kredi);
            Console.WriteLine("*********************");
        }
    }
    public class doviz : hesap
    {
        private double endeks; private String doviz_turu;
        public doviz(Int64 miktar, int hesap_no, String sahip, double endeks, String doviz_turu)
            : base(miktar, hesap_no, sahip)
        {
            this.endeks = endeks;
            this.doviz_turu = doviz_turu;
        }
        public double yerliye_cevir() { return miktar * endeks; }
        public void setEndeks(int endeks) { this.endeks = endeks; }
        public override void hesap_bilgisi()
        {
            base.hesap_bilgisi();
            Console.WriteLine(" " + doviz_turu);
            Console.WriteLine("Yerli para karsiligi:" + yerliye_cevir() + " YTL");
            Console.WriteLine("Verilen Kredi======"+verilen_kredi);
            Console.WriteLine("*********************");
        }
        public override void kredi_ver(Int64 kredi)
        {
            if (verilen_kredi + (kredi * endeks) > 5000)
                bloke = true;
            else verilen_kredi += (long)(kredi * endeks);
        }

    }



}

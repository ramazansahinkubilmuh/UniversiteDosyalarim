using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication3
{
    class Program
    {
        static void Main(string[] args)
        {
            Futbolcu f = new Futbolcu();
            f.Ad = "Hami";
            f.Soyad = "Mandıralı";
            f.Cinsiyet = true;
            f.Dogumtarihi = DateTime.Parse("12..12.1980");
            f.oynadigitakim.Add("Trabzon");
            f.oynadigitakim.Add("Galatasaray");
            Console.WriteLine(f.NefesAl());
            Console.WriteLine(f.sut_cek());
            f.TakimYaz();
            Console.WriteLine("****************");
            HucumOyuncusu ho = new HucumOyuncusu();
            ho.Ad = "xxxx";
            ho.Soyad = "yyy";
            Console.WriteLine(ho.NefesAl());
            Console.WriteLine(ho.sut_cek());
            Console.WriteLine("****************");
            SavunmaOyuncusu so = new SavunmaOyuncusu();
            so.Ad = "x123x";
            so.Soyad="y123y";
            Console.WriteLine(so.NefesAl());
            Console.WriteLine(so.sut_cek());
            Console.WriteLine("****************");
            
            
            Console.ReadKey();
        }
    }
    class insan {
        private string ad, soyad;
        private DateTime dogumtarihi;
        private bool cinsiyet;

        public bool Cinsiyet
        {
            get { return cinsiyet; }
            set { cinsiyet = value; }
        }

        public DateTime Dogumtarihi
        {
            get { return dogumtarihi; }
            set { dogumtarihi = value; }
        }
        
        public string Soyad
        {
            get { return soyad; }
            set { soyad = value; }
        }

        public string Ad
        {
            get { return ad; }
            set { ad = value; }
        }
        public virtual string NefesAl()
        {
            return "nefes alabilirim";
        }

    }
    class Futbolcu : insan
    { 
    public List<string> oynadigitakim =new List<string>();
    public virtual string sut_cek()
    {
        return "ortalama bir şut çekerim";
    }
    public void TakimYaz()
    {
        Console.WriteLine("*****Oynadığı Takımlar*****");
        foreach (string takim in oynadigitakim) Console.WriteLine(takim);
    }
    public override string NefesAl()
    {
        return "Orta Nefes Alabilirim.";
    }
    }
    class SavunmaOyuncusu : Futbolcu
    {
        public override string sut_cek()
        {
            return "Zayıf şut çekerim";
        }
        public override string NefesAl()
        {
            return "Yavaş Nefes Alırım.";
        }
    }
    class HucumOyuncusu : Futbolcu
    {
        public override string sut_cek()
        {
            return "Etkili şut çekerim";
        }
        public override string NefesAl()
        {
            return "Hızlı Nefes Alırım.";
        }
    }
}

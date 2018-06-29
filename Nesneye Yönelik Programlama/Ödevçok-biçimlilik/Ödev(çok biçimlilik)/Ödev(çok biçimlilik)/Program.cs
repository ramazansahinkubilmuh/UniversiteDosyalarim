using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ödev_çok_biçimlilik_
{
    class Program
    {
        static void Main(string[] args)
        {
            canli i1 = new canli();
            i1.konus(2,2,"İnsan");

            canli k1 = new canli();
            k1.konus(4,"Köpek");

            Console.ReadKey();
        }
    }
    public class canli
    {
        public int ayak, el;//field
        public string tur;
        public void konus(int el,int ayak,string tur)
        {
            Console.WriteLine("Benim {0} adet el, {1} adet ayağım var.", el, ayak);
            Console.WriteLine("Tür olarak {0} sınıfındayım", tur);
        }
        public void konus(int ayak,string tur)
        {
            Console.WriteLine("Benim {0} adet ayağım var.",ayak);
            Console.WriteLine("Tür olarak {0} sınıfındayım", tur);
        }
    }

    //public class insan : canli
    //{
    //    public void konus()
    //    {
    //        Console.WriteLine("Benim {0} adet el, {1} adet ayağım var.", el, ayak);
    //        Console.WriteLine("Tür olarak {0} sınıfındayım", tur);
    //    }
    //}
    //public class kopek : canli
    //{
    //    public void havla()
    //    {
    //        Console.WriteLine("Benim {0} adet el, {1} adet ayağım var.", el, ayak);
    //        Console.WriteLine("Tür olarak {0} sınıfındayım", tur);
    //    }
    //}

}

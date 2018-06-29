using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication2
{
    class insan {
        private string isim;//kapsülleme
        public insan()
        {
            this.isim = "Abdulkadir Karacı".ToUpper();//bu komutun sayesinde kullanıcının giridiği isimin büyük küçüklüğüne müdahale ediyor
        }
        //public insan(string ad)
        //{
        //    this.isim = ad;
        //}
        public insan(string isim)
        {
            this.isim = isim.ToUpper();
        }
        public string getisim()
        {
            return this.isim;
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            insan insan1 = new insan();
            Console.WriteLine(insan1.getisim());
            insan insan2 = new insan("Mehmet Kara");
            Console.WriteLine(insan2.getisim());
            Console.ReadLine();
        }
    }
}

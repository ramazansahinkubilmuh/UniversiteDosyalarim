using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace kripto
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
            bool kontrol = true;
            char ilkkarakter = ' ';
            int tut = 0, sayac = 0, say = 0;
            string düzmetin;
            düzmetin = textBox1.Text.ToLower();
            string anahtar;
            anahtar=textBox3.Text.ToLower();
            textBox2.Text="";
            int mkarakter = 0,akarakter=0;
            mkarakter = düzmetin.Length;
            akarakter=anahtar.Length;
            char []harfler=new char[29];
            string [,]harf=new string[29,akarakter];
            string[,] harf2 = new string[29, akarakter];

            harfler[0] = 'a';
            harfler[1] = 'b';
            harfler[2] = 'c';
            harfler[3] = 'ç';
            harfler[4] = 'd';
            harfler[5] = 'e';
            harfler[6] = 'f';
            harfler[7] = 'g';
            harfler[8] = 'ğ';
            harfler[9] = 'h';
            harfler[10] = 'ı';
            harfler[11] = 'i';
            harfler[12] = 'j';
            harfler[13] = 'k';
            harfler[14] = 'l';
            harfler[15] = 'm';
            harfler[16] = 'n';
            harfler[17] = 'o';
            harfler[18] = 'ö';
            harfler[19] = 'p';
            harfler[20] = 'r';
            harfler[21] = 's';
            harfler[22] = 'ş';
            harfler[23] = 't';
            harfler[24] = 'u';
            harfler[25] = 'ü';
            harfler[26] = 'v';
            harfler[27] = 'y';
            harfler[28] = 'z';


            if (textBox3.Text != null)
            {
                for (int i = 0; i < akarakter; i++)
                {
                    kontrol = true;
                    ilkkarakter = anahtar[i];
                    tut = 0; sayac = 0; say = 0;
                    while (kontrol)
                    {
                        for (int a = 0; a < 29; a++)
                        {
                            if (harfler[a] == ilkkarakter)
                            {
                                tut = a;
                                break;
                            }
                        }
                        while (true)
                        {
                            harf2[sayac, i] = harfler[sayac].ToString() + harfler[tut].ToString();
                            tut++;
                            sayac++;
                            say++;
                            if (tut == 29)
                            {
                                tut = 0;
                            }
                            if (say == 29)
                            {
                                kontrol = false;
                                break;

                            }

                        }
                    }

                }
                int kacinci = 0;
                for (int i = 0; i < mkarakter; i++)
                {
                    for (int j = 0; j < 29; j++)
                    {
                        if (düzmetin[i] == harfler[j])
                        {
                            kacinci = i % akarakter;
                            textBox2.Text += (harf2[j, kacinci].Substring(1, 1));
                            break;
                        }
                    }
                }
                label3.Visible = label4.Visible = true;
                label3.Text = textBox1.Text.Length.ToString();
                label4.Text = textBox2.Text.Length.ToString();
            }
            

            //for (int i = 0; i < 29; i++)
            //{
            //    for(int j=0;j<akarakter;j++)
            //    {
            //        listBox1.Items.Add("("+i+","+j+")"+harf2[i,j]);
            //    }
            //}


            //harf[0, 0] = "ar";
            //harf[0, 1] = "aa";
            //harf[0, 2] = "am";
            //harf[0, 3] = "aa";
            //harf[0, 4] = "az";
            //harf[0, 5] = "aa";
            //harf[0, 6] = "an";

            //harf[1, 0] = "bs";
            //harf[1, 1] = "bb";
            //harf[1, 2] = "bn";
            //harf[1, 3] = "bb";
            //harf[1, 4] = "ba";
            //harf[1, 5] = "bb";
            //harf[1, 6] = "bo";

            //harf[2, 0] = "cş";
            //harf[2, 1] = "cc";
            //harf[2, 2] = "co";
            //harf[2, 3] = "cc";
            //harf[2, 4] = "cb";
            //harf[2, 5] = "cc";
            //harf[2, 6] = "cö";

            //harf[3, 0] = "çt";
            //harf[3, 1] = "çç";
            //harf[3, 2] = "çö";
            //harf[3, 3] = "çç";
            //harf[3, 4] = "çc";
            //harf[3, 5] = "çç";
            //harf[3, 6] = "çp";

            //harf[4, 0] = "du";
            //harf[4, 1] = "dd";
            //harf[4, 2] = "dp";
            //harf[4, 3] = "dd";
            //harf[4, 4] = "dç";
            //harf[4, 5] = "dd";
            //harf[4, 6] = "dr";

            //harf[5, 0] = "eü";
            //harf[5, 1] = "ee";
            //harf[5, 2] = "er";
            //harf[5, 3] = "ee";
            //harf[5, 4] = "ed";
            //harf[5, 5] = "ee";
            //harf[5, 6] = "es";

            //harf[6, 0] = "fv";
            //harf[6, 1] = "ff";
            //harf[6, 2] = "fs";
            //harf[6, 3] = "ff";
            //harf[6, 4] = "fe";
            //harf[6, 5] = "ff";
            //harf[6, 6] = "fş";

            //harf[7, 0] = "gy";
            //harf[7, 1] = "gg";
            //harf[7, 2] = "gş";
            //harf[7, 3] = "gg";
            //harf[7, 4] = "gf";
            //harf[7, 5] = "gg";
            //harf[7, 6] = "gt";

            //harf[8, 0] = "ğz";
            //harf[8, 1] = "ğğ";
            //harf[8, 2] = "ğt";
            //harf[8, 3] = "ğğ";
            //harf[8, 4] = "ğg";
            //harf[8, 5] = "ğğ";
            //harf[8, 6] = "ğu";

            //harf[9, 0] = "ha";
            //harf[9, 1] = "hh";
            //harf[9, 2] = "hu";
            //harf[9, 3] = "hh";
            //harf[9, 4] = "hğ";
            //harf[9, 5] = "hh";
            //harf[9, 6] = "hü";

            //harf[10, 0] = "ıb";
            //harf[10, 1] = "ıı";
            //harf[10, 2] = "ıü";
            //harf[10, 3] = "ıı";
            //harf[10, 4] = "ıh";
            //harf[10, 5] = "ıı";
            //harf[10, 6] = "ıv";

            //harf[11, 0] = "ic";
            //harf[11, 1] = "ii";
            //harf[11, 2] = "iv";
            //harf[11, 3] = "ii";
            //harf[11, 4] = "iı";
            //harf[11, 5] = "ii";
            //harf[11, 6] = "iy";

            //harf[12, 0] = "jç";
            //harf[12, 1] = "jj";
            //harf[12, 2] = "jy";
            //harf[12, 3] = "jj";
            //harf[12, 4] = "ji";
            //harf[12, 5] = "jj";
            //harf[12, 6] = "jz";

            //harf[13, 0] = "kd";
            //harf[13, 1] = "kk";
            //harf[13, 2] = "kz";
            //harf[13, 3] = "kk";
            //harf[13, 4] = "kj";
            //harf[13, 5] = "kk";
            //harf[13, 6] = "ka";

            //harf[14, 0] = "le";
            //harf[14, 1] = "ll";
            //harf[14, 2] = "la";
            //harf[14, 3] = "ll";
            //harf[14, 4] = "lk";
            //harf[14, 5] = "ll";
            //harf[14, 6] = "lb";

            //harf[15, 0] = "mf";
            //harf[15, 1] = "mm";
            //harf[15, 2] = "mb";
            //harf[15, 3] = "mm";
            //harf[15, 4] = "ml";
            //harf[15, 5] = "mm";
            //harf[15, 6] = "mc";

            //harf[16, 0] = "ng";
            //harf[16, 1] = "nn";
            //harf[16, 2] = "nc";
            //harf[16, 3] = "nn";
            //harf[16, 4] = "nm";
            //harf[16, 5] = "nn";
            //harf[16, 6] = "nç";

            //harf[17, 0] = "oğ";
            //harf[17, 1] = "oo";
            //harf[17, 2] = "oç";
            //harf[17, 3] = "oo";
            //harf[17, 4] = "on";
            //harf[17, 5] = "oo";
            //harf[17, 6] = "od";

            //harf[18, 0] = "öh";
            //harf[18, 1] = "öö";
            //harf[18, 2] = "öd";
            //harf[18, 3] = "öö";
            //harf[18, 4] = "öo";
            //harf[18, 5] = "öö";
            //harf[18, 6] = "öe";

            //harf[19, 0] = "pı";
            //harf[19, 1] = "pp";
            //harf[19, 2] = "pe";
            //harf[19, 3] = "pp";
            //harf[19, 4] = "pö";
            //harf[19, 5] = "pp";
            //harf[19, 6] = "pf";

            //harf[20, 0] = "ri";
            //harf[20, 1] = "rr";
            //harf[20, 2] = "rf";
            //harf[20, 3] = "rr";
            //harf[20, 4] = "rp";
            //harf[20, 5] = "rr";
            //harf[20, 6] = "rg";

            //harf[21, 0] = "sj";
            //harf[21, 1] = "ss";
            //harf[21, 2] = "sg";
            //harf[21, 3] = "ss";
            //harf[21, 4] = "sr";
            //harf[21, 5] = "ss";
            //harf[21, 6] = "sğ";

            //harf[22, 0] = "şk";
            //harf[22, 1] = "şş";
            //harf[22, 2] = "şğ";
            //harf[22, 3] = "şş";
            //harf[22, 4] = "şs";
            //harf[22, 5] = "şş";
            //harf[22, 6] = "şh";

            //harf[23, 0] = "tl";
            //harf[23, 1] = "tt";
            //harf[23, 2] = "th";
            //harf[23, 3] = "tt";
            //harf[23, 4] = "tş";
            //harf[23, 5] = "tt";
            //harf[23, 6] = "tı";

            //harf[24, 0] = "um";
            //harf[24, 1] = "uu";
            //harf[24, 2] = "uı";
            //harf[24, 3] = "uu";
            //harf[24, 4] = "ut";
            //harf[24, 5] = "uu";
            //harf[24, 6] = "ui";

            //harf[25, 0] = "ün";
            //harf[25, 1] = "üü";
            //harf[25, 2] = "üi";
            //harf[25, 3] = "üü";
            //harf[25, 4] = "üv";
            //harf[25, 5] = "üü";
            //harf[25, 6] = "üj";

            //harf[26, 0] = "vo";
            //harf[26, 1] = "vv";
            //harf[26, 2] = "vj";
            //harf[26, 3] = "vv";
            //harf[26, 4] = "vü";
            //harf[26, 5] = "vv";
            //harf[26, 6] = "vk";

            //harf[27, 0] = "yö";
            //harf[27, 1] = "yy";
            //harf[27, 2] = "yk";
            //harf[27, 3] = "yy";
            //harf[27, 4] = "yv";
            //harf[27, 5] = "yy";
            //harf[27, 6] = "yl";

            //harf[28, 0] = "zp";
            //harf[28, 1] = "zz";
            //harf[28, 2] = "zl";
            //harf[28, 3] = "zz";
            //harf[28, 4] = "zy";
            //harf[28, 5] = "zz";
            //harf[28, 6] = "zm";

            
            }
            catch
            {

            }
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            label3.Visible = label4.Visible = false;
        }
    }
}

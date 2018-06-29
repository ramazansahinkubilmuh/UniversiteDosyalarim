using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.VisualBasic;

namespace Adeline
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        float ogrkatsayi, esikdeger, net, cikti,hata;
        float kacornek = 0, kacgirdili = 0;
        float[] sorulangiris = new float[100];
        float[,] giris1 = new float[100, 100];
        float[] cikis1 = new float[100];
        float[] agirlik = new float[100];

        private void button1_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
            listBox2.Items.Clear();
            listBox3.Items.Clear();
            listBox4.Items.Clear();
            listBox5.Items.Clear();
            listBox6.Items.Clear();

            kacornek = float.Parse(comboBox1.SelectedItem.ToString());
            kacgirdili = float.Parse(comboBox2.SelectedItem.ToString());

            ogrkatsayi = float.Parse(textBox2.Text);
            //esikdeger = float.Parse(rnd.NextDouble().ToString().Substring(0, 3));
            
            bool kontrol1;
            kontrol1 = false;
            Random rnd = new Random();
            esikdeger = float.Parse(rnd.NextDouble().ToString().Substring(0,3));
            if (esikdeger == 0)
                esikdeger = 0.1f;
            listBox6.Items.Add("İlk Eşik Değeri : "+esikdeger);
            for (int i = 0; i < kacgirdili; i++)
            {
                agirlik[i] = float.Parse(rnd.NextDouble().ToString().Substring(0, 3));
                if (agirlik[i] == 0)
                    agirlik[i] = 0.1f;
                listBox4.Items.Add(i + 1 + ". Ağırlık Değeri = " + agirlik[i] + "");
                listBox4.Items.Add(" ");
            }

            for (int i = 0; i < kacornek; i++)
            {
                for (int j = 0; j < kacgirdili; j++)
                {
                    giris1[i, j] = int.Parse(Interaction.InputBox(i + 1 + ".Örneğin " + (j + 1) + ".girdisini girin : "));
                    listBox1.Items.Add(i + 1 + ". Örneğin" + (j + 1) + ". Girişi= " + giris1[i, j] + "");
                }
                listBox1.Items.Add(" ");
                cikis1[i] = int.Parse(Interaction.InputBox(i + 1 + ".Örneğin çıktı değerini girin : "));
                listBox2.Items.Add(i + 1 + ". Örneğin Çıkışı= " + cikis1[i] + "");
                listBox2.Items.Add(" ");
            }

            int a = 0;
            do
            {
                net = 0;
                a = 0;

                for (int i = 0; i < kacornek; i++)
                {
                    net = 0;


                    for (int j = 0; j < kacgirdili; j++)
                    {
                        net += giris1[i, j] * agirlik[j];
                    }
                    net += esikdeger;

                    if (net >=0)
                        cikti = 1;
                    else
                        cikti = -1;

                    if (cikis1[i] == cikti)
                    {
                        a++;
                    }
                    else
                    {
                        hata = cikis1[i]-cikti;

                        for (int ii = 0; ii < kacgirdili; ii++)
                        {
                            agirlik[ii] =agirlik[ii]+(ogrkatsayi * hata * giris1[i, ii]);

                            listBox3.Items.Add("Yeni Ağırlık " + (ii + 1) + "= " + agirlik[ii] + "");
                        }
                        listBox3.Items.Add(" ");

                        esikdeger = esikdeger+(ogrkatsayi*hata);
                        listBox5.Items.Add("Yeni Eşik " + esikdeger);
                        listBox5.Items.Add(" ");

                    }
                    if (a == kacornek)
                        kontrol1 = true;

                }//for kacornek end

            } while (kontrol1 == false);

        }

        private void button2_Click(object sender, EventArgs e)
        {
            for (int j = 0; j < kacgirdili; j++)
            {
                sorulangiris[j] = int.Parse(Interaction.InputBox(j + 1 + ".girdiyi girin : "));
            }

            int cikti = 0;
            net = 0;
            for (int i = 0; i < kacgirdili; i++)
            {
                net += sorulangiris[i] * agirlik[i];
            }
            net += esikdeger;



            if (net >= 0)
                cikti = 1;
            else
                cikti = -1;

            MessageBox.Show("Çıktı : " + cikti);
        }
    }
}

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

namespace PerseptronEND
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        float ogrkatsayi, esikdeger, net, cikti;
        float kacornek=0, kacgirdili=0;
        private void Form1_Load(object sender, EventArgs e)
        {
            
        }


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

            //float [,]giris1=new float[kacornek,kacgirdili];
            //float []cikis1=new float[kacornek];
            //float []agirlik=new float[kacgirdili];

            kacornek = float.Parse(comboBox1.SelectedItem.ToString());
            kacgirdili = float.Parse(comboBox2.SelectedItem.ToString());

            ogrkatsayi = float.Parse(textBox2.Text);
            esikdeger = float.Parse(textBox1.Text);
            bool kontrol1,kontrol2;
            kontrol1 =kontrol2= false;


            for (int i = 0; i < kacgirdili;i++ )
            {
                agirlik[i] = int.Parse(Interaction.InputBox(i+1+".ağırlık değerini girin : "));
                listBox4.Items.Add(i + 1 + ". Ağırlık Değeri = " + agirlik[i] + "");
            }

            for (int i = 0; i < kacornek; i++)
            {
                for (int j = 0; j < kacgirdili; j++)
                {
                    giris1[i, j] = int.Parse(Interaction.InputBox(i + 1 + ".Örneğin " + (j + 1) + ".girdisini girin : "));
                    listBox1.Items.Add(i+1+". Örneğin" + (j+1) + ". Girişi= " + giris1[i,j] + "");
                }
                cikis1[i] = int.Parse(Interaction.InputBox(i + 1 + ".Örneğin çıktı değerini girin : "));
                listBox2.Items.Add(i + 1 + ". Örneğin Çıkışı= " + cikis1[i] + "");
            }

            int a = 0;
            do
            {
                net = 0;
                a = 0;

                for (int i = 0; i < kacornek;i++ )
                {
                    net = 0;
                    

                    for (int j = 0; j < kacgirdili; j++)
                    {
                        net += giris1[i,j] * agirlik[j];
                    }
                    if (net > esikdeger)
                        cikti = 1;
                    else
                        cikti = 0;

                    if (cikis1[i] == cikti)
                    {
                        a++;
                    }  
                    else
                    {
                        if (cikti == 0 && cikis1[i] == 1)//beklenen 1 iken 0 gelmişse
                        {
                            for (int ii = 0; ii < kacgirdili; ii++)
                            {
                                agirlik[ii] = agirlik[ii] + (giris1[i, ii] * ogrkatsayi);
                                listBox3.Items.Add("Yeni Ağırlık" + ii + "= " + agirlik[ii] + "");
                            }
                        }
                        else if (cikti == 1 && cikis1[i] == 0)//beklenen 0 iken 1 gelmişse
                        {
                            for (int ii = 0; ii < kacgirdili; ii++)
                            {
                                agirlik[ii] = agirlik[ii] - (giris1[i, ii] * ogrkatsayi);
                                listBox3.Items.Add("Yeni Ağırlık" + ii + "= " + agirlik[ii] + "");
                            }
                        }
                    }
                    if (a == kacornek)
                        kontrol1 = true;

                }//for kacornek end
                
            } while (kontrol1==false);

            //int sayi = listBox3.Items.Count;
            //for (int i = 0; i < kacgirdili;i++ )
            //{
            //    listBox3.SelectedIndex = sayi - 1;
            //    sayi--;
            //}
                
        }

        private void button2_Click(object sender, EventArgs e)
        {
            for (int j = 0; j < kacgirdili; j++)
            {
                sorulangiris[j] = int.Parse(Interaction.InputBox(j + 1 + ".girdiyi girin : "));
            }


            int beklenen=int.Parse(Interaction.InputBox("Beklenen çıkış değerini girin : "));
            int cikti = 0;
            net = 0;
            for (int i = 0; i < kacgirdili;i++ )
            {
                net += sorulangiris[i] * agirlik[i];
            }

                

            if (net > esikdeger)
                cikti = 1;
            else
                cikti = 0;

            if (beklenen == net)
                MessageBox.Show("Ağ Eğitilmiş");
            else
                MessageBox.Show("Ağ Eğitilmemiş");
        }
    }
}

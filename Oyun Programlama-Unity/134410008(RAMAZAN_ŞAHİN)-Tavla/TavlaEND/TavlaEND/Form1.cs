using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TavlaEND
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        int x = 0;
        Random rastgele = new Random();
        public int sayi1;
        public int sayi2;

        private void Form1_Load(object sender, EventArgs e)
        {
            pictureBox31.Enabled = false;
            pictureBox32.Enabled = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            x = 0;
            sayi1 = rastgele.Next(1, 6);
            sayi2 = rastgele.Next(1, 6);
            timer1.Start();
            pictureBox31.Enabled = true;
            pictureBox32.Enabled = true;


            if (sayi1 == 1)
            {
                pictureBox6.Location = new Point(97, 70);
            }
            else if (sayi1 == 2)
            {
                pictureBox6.Location = new Point(156, 70);
            }
            else if (sayi1 == 3)
            {
                pictureBox6.Location = new Point(216, 70);
            }
            else if (sayi1 == 4)
            {
                pictureBox6.Location = new Point(275, 70);
            }
            else if (sayi1 == 5)
            {
                pictureBox6.Location = new Point(333, 70);
            }
            else if (sayi1 == 6)
            {
                pictureBox6.Location = new Point(438, 70);
            }


            if (sayi2 == 1)
            {
                pictureBox7.Location = new Point(97, 21);
            }
            else if (sayi2 == 2)
            {
                pictureBox7.Location = new Point(156, 21);
            }
            else if (sayi2 == 3)
            {
                pictureBox7.Location = new Point(216, 21);
            }
            else if (sayi2 == 4)
            {
                pictureBox7.Location = new Point(275, 21);
            }
            else if (sayi2 == 5)
            {
                pictureBox7.Location = new Point(333, 21);
            }
            else if (sayi2 == 6)
            {
                pictureBox7.Location = new Point(438, 21);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (x == 3)
            {
                timer1.Stop();
            }

            else
            {
                pictureBox31.Image = Image.FromFile("C:\\res\\" + sayi1 + ".png");
                pictureBox32.Image = Image.FromFile("C:\\res\\" + sayi2 + ".png");
            }
            x++;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            pictureBox7.Location = new Point(448, 21);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int x = pictureBox7.Location.X;
            int y = pictureBox7.Location.Y;
            x += 58;
            pictureBox7.Location = new Point(x, y);
        }

    }
}

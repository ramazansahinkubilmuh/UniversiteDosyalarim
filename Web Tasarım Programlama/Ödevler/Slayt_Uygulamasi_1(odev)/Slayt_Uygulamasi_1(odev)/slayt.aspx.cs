using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Slayt_Uygulamasi_1_odev_
{
    public partial class slayt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["sayac"] = -1;
                Label1.Visible = false;
            }
            else
                Label1.Visible = true;
        }

        protected void baslat_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = true;
        }

        protected void durdur_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
        }

        protected void ileri_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            string[] klasordekiler = Directory.GetFiles(Server.MapPath("resimler"));
            int sayac = int.Parse(Session["sayac"].ToString());
            if (sayac == klasordekiler.Count() - 1)
            {
                sayac = 0;
                Session["sayac"] = sayac;
                resimleri_goster();
            }
            else
            {
                sayac = sayac + 1;
                Session["sayac"] = sayac;
                resimleri_goster();
            }
        }

        protected void geri_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            string[] klasordekiler = Directory.GetFiles(Server.MapPath("resimler"));
            int sayac = int.Parse(Session["sayac"].ToString());
            if (sayac == 0)
            {
                sayac = klasordekiler.Count() - 1;
                Session["sayac"] = sayac;
                resimleri_goster();
            }
            else
            {
                sayac = sayac - 1;
                Session["sayac"] = sayac;
                resimleri_goster();
            }
        }

        void resimleri_goster()
        {
            int sayac = int.Parse(Session["sayac"].ToString());
            string[] klasordekiler = Directory.GetFiles(Server.MapPath("resimler"));
            string[] resimler = new string[klasordekiler.Count()];
            for (int i = 0; i < klasordekiler.Count(); i++)
                resimler[i] = ("resimler/" + Path.GetFileName(klasordekiler[i]));
            Image1.ImageUrl = resimler[sayac];
            Label1.Text = Path.GetFileName(klasordekiler[sayac]).ToString() + " İsimli Resim Görüntülenmektedir...";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int sayac = int.Parse(Session["sayac"].ToString());
            string[] klasordekiler = Directory.GetFiles(Server.MapPath("resimler"));
            sayac++;
            if (sayac > klasordekiler.Count() - 1)
                sayac = 0;
            if (sayac < 0)
                sayac = klasordekiler.Count() - 1;
            Session["sayac"] = sayac;
            resimleri_goster();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("odev.aspx");
        }
    }
}
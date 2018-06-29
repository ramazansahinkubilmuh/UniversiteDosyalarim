using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Slayt_Uygulamasi_1_odev_
{
    public partial class resim_yukle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                resimleri_goster();
        }

        protected void btnekle_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string uzanti = FileUpload1.FileName.Substring(FileUpload1.FileName.Length - 3, 3);
                string dosyaadi = (Directory.GetFiles(Server.MapPath("resimler")).Count() + 1).ToString() + "." + uzanti;
                FileUpload1.SaveAs(Server.MapPath("/resimler/") + dosyaadi);
                Label1.Text = "Dosya Eklendi";
                resimleri_goster();
            }
        }

        void resimleri_goster()
        {
            string[] klasordekiler = Directory.GetFiles(Server.MapPath("resimler"));//resim klasorundeki dosyaları klasordekiler dizisine aktarıyor
            string[] resimler = new string[klasordekiler.Count()];
            for (int i = 0; i < klasordekiler.Count(); i++)
                resimler[i] = ("resimler/" + Path.GetFileName(klasordekiler[i]));//Path.GetFileName sadece dosya ismini alıyor
            DataList1.DataSource = resimler;
            DataList1.DataBind();
            Label1.Text = klasordekiler.Count().ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("odev.aspx");
        }
    }
}
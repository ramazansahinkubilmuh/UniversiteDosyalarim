using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//datayı kullanmak için kullanıyoruz
using System.Data.OleDb;//dataset kullanmak için kullanıyoruz

namespace Odev_1
{
    public partial class xmlgiris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /* Açıklama satırındaki kodlar xml dosyasındaki kayıtları ekrana yazdırıyor
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("users.xml"));//sunucunun anaklasöründe arama yapmak için server.mappath kullandık
            for (byte i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Response.Write("<br>"+ds.Tables[0].Rows[i]["ka"].ToString());
                Response.Write("<br>"+ds.Tables[0].Rows[i]["sf"].ToString());
                Response.Write("<br>"+ds.Tables[0].Rows[i]["adi"].ToString());
                Response.Write("<br>"+ds.Tables[0].Rows[i]["soyadi"].ToString());
                Response.Write("<p>");
            }
            */
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("//users.xml")); //sunucunun anaklasöründeki users.xml dosyasını açıyoruz
            bool kontrolka, kontrolsf;
            kontrolka = kontrolsf = false;
            for (byte i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (TextBox1.Text == ds.Tables[0].Rows[i]["ka"].ToString() && TextBox2.Text == ds.Tables[0].Rows[i]["sf"].ToString())
                {
                    Session["adsoyad"] = ds.Tables[0].Rows[i]["adi"].ToString() + ds.Tables[0].Rows[i]["soyadi"].ToString();
                    Response.Redirect("index.aspx?nerden=1&sayfa=xmlgiris");
                }//if end

                if (TextBox1.Text == ds.Tables[0].Rows[i]["ka"].ToString())
                    kontrolka = true;
                if (TextBox2.Text == ds.Tables[0].Rows[i]["sf"].ToString())
                    kontrolsf = true;
            }//for end

            if (kontrolka && !kontrolsf)
                Label1.Text = "Şifre Yanlış Girildi";
            else if (!kontrolka && kontrolsf)
                Label1.Text = "Kullanıcı Adı Yanlış Girildi";
            else if (!kontrolka && !kontrolsf)
                Label1.Text = "Kullanıcı Adı Ve Şifre Yanlış Girildi";
            else
                Label1.Text = "Kullanıcı Adı veya Şifre Yanlış Girildi";
            
        }
    }
}
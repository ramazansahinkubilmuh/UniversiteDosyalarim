using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Odev_1
{
    public partial class giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "admin" && TextBox2.Text == "password")
            {
                Session["adsoyad"] = "Admin";
                Response.Redirect("index.aspx?nerden=2&sayfa=giris");
            }
            else if (TextBox1.Text != "admin")
                Label1.Text = "Kullanıcı Adı Yanlış Girildi";
            else if (TextBox2.Text != "password")
                Label1.Text = "Şifre Yanlış Girildi";
        }
    }
}
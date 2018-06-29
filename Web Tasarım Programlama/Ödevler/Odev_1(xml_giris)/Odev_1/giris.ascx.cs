using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Odev_1
{
    public partial class giris1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "admin" && TextBox2.Text == "password")
            {
                Session["adsoyad"] = "Admin";
                Response.Redirect("index.aspx");
            }
            else if (TextBox1.Text != "admin")
                Label1.Text = "Kullanıcı Adı Yanlış Girildi";
            else if (TextBox2.Text != "password")
                Label1.Text = "Şifre Yanlış Girildi";
        }
    }
}
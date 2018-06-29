using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Odev_1
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//sayfanın ilk defa açılıp açılmadığını kontrol ediyoruz
            {
                if (Session["adsoyad"] != null)
                    Label1.Text = Session["adsoyad"].ToString();
                else
                    Response.Redirect("giris.aspx");
            }
            Response.Write(Request.QueryString["sayfa"].ToString());

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();//Çıkış Yapılmadan Geri Dönülmeyi Engellemek İçin Kullanıyoruz

            string nerdengeldin = Request.QueryString["nerden"].ToString();
            if (nerdengeldin == "1")
                Response.Redirect("xmlgiris.aspx");
            else if (nerdengeldin == "2")
                Response.Redirect("giris.aspx");
        }
    }
}
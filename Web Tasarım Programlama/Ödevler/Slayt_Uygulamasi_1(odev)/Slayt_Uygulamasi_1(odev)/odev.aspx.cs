using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Slayt_Uygulamasi_1_odev_
{
    public partial class odev : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void yukle_Click(object sender, EventArgs e)
        {
            Response.Redirect("resim_yukle.aspx");
        }

        protected void slayt_Click(object sender, EventArgs e)
        {
            Response.Redirect("slayt.aspx");
        }
    }
}
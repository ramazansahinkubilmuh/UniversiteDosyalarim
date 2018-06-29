using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Menu_odev_
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public StringBuilder menutut = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("menu.xml"));
            menutut.Append("<ul class='menu'>");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                menutut.Append("<li>");
                menutut.Append("<a href=\"?menu=" + ds.Tables[0].Rows[i]["id"] + "\">" + ds.Tables[0].Rows[i]["Ad"] + "</a>");
                menutut.Append("</li>");
            }
            menutut.Append("</ul>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu_ekle_sil_duzelt.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace Kayan_Duyurular_odev_
{
    public partial class duyuru_goster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection baglanti = new OleDbConnection();
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("duyuru.mdb");
            baglanti.Open();
            DataSet ds = new DataSet();
            string seckomutu = "select * from duyuru where duyuruid=" + Request.QueryString["duyuruid"];
            OleDbDataAdapter da = new OleDbDataAdapter(seckomutu, baglanti);
            da.Fill(ds);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            baglanti.Close();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("duyuru.aspx");
        }

    }
}
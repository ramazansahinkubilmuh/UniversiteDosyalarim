using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Text;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
       public StringBuilder menutut=new StringBuilder();
       public StringBuilder iceriktut = new StringBuilder();
       string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("menu.xml"));
            menutut.Append("<ul class='menu'>");//String builder daha fazla veriyi tuttuğu için satır satır string builder e ekliyor/sırasız liste oluşturuyoruz ul ile
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                menutut.Append("<li>");//menutut a list aktarıyoruz
                menutut.Append("<a href='WebForm3.aspx?id=" + ds.Tables[0].Rows[i]["id"] + "'>");//aktardığımız list in linkini belirliyoruz
                menutut.Append(ds.Tables[0].Rows[i]["Ad"]);//menu isimlerinin görünmesini sağlıyor
                menutut.Append("</a></li>");
            }
            menutut.Append("</ul>");
            //Literal1.Text = menutut.ToString();//menuleri ekleyeceğimiz yere bir tane literal ekleyerek bu kodlada menuleri ekleyebiliriz
            if (Request.QueryString.Count > 0) 
                id = Request.QueryString[0]; 
            else 
                id = "1";

            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~/sayfalar.mdb");
            conn.Open();
            string sec = "select * from sayfa where id='" + id + "'";
            OleDbDataAdapter da = new OleDbDataAdapter(sec, conn);//dataadapter seçme işlemini yapıyor
            da.Fill(ds, "sayfa");//fill sayfa tablosuna doldurma işlemi yapıyor
            if (ds.Tables["sayfa"].Rows.Count > 0)//seçilen kayıt varsa aşağıdaki işlemi yapar
                iceriktut.Append(ds.Tables["sayfa"].Rows[0]["icerik"].ToString());//aynı id den tek satır olduğu için rows[0] yapıyoruz
            else//eğer içerik boş ise boş göster
                iceriktut.Clear();
            conn.Close();
        }
    }
}
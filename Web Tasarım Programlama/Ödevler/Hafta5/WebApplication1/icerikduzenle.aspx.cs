using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class icerik_duzenle : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        OleDbConnection conn = new OleDbConnection();
        void oku()
        {
            ds.Clear();
            ds.ReadXml(Server.MapPath("menu.xml"));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            oku();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~/sayfalar.mdb");
            conn.Open();
            ad.Text = ds.Tables[0].Rows[GridView1.SelectedIndex]["Ad"].ToString();//Türkçe karakter sorunundan dolayı böyle yaptık
            id.Text = ds.Tables[0].Rows[GridView1.SelectedIndex]["id"].ToString();
            string sec = "select * from sayfa where id='"+id.Text+"'";
            OleDbDataAdapter da = new OleDbDataAdapter(sec,conn);//dataadapter seçme işlemini yapıyor
            da.Fill(ds,"sayfa");//fill sayfa tablosuna doldurma işlemi yapıyor
            if (ds.Tables["sayfa"].Rows.Count > 0)//seçilen kayıt varsa aşağıdaki işlemi yapar
                icerik.Text = ds.Tables["sayfa"].Rows[0]["icerik"].ToString();//aynı id den tek satır olduğu için rows[0] yapıyoruz
            else//eğer içerik boş ise boş göster
                icerik.Text = "";
            conn.Close();
            
        }

        protected void ekle_Click(object sender, EventArgs e)
        {
            if (ad.Text == "")
                Response.Write("<script lang='JavaScript'> alert('Lutfen Kayıt Seçin');</script>");
            else
            {
                DataRow dr = ds.Tables[0].NewRow();
                dr["Ad"] = ad.Text;
                if (id.Text == "")
                    dr["id"] = (Convert.ToInt32(ds.Tables[0].Rows.Count.ToString())) + 1;
                else
                    dr["id"] = id.Text;
                ds.Tables[0].Rows.Add(dr);
                ds.WriteXml(Server.MapPath("menu.xml"));
            }
            oku();
        }

        protected void sil_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                ds.Tables[0].Rows[GridView1.SelectedIndex].Delete();
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();
                ad.Text = "";
                id.Text = "";
            }
            else
                Response.Write("<script lang='JavaScript'> alert('Lutfen Kayıt Seçin');</script>");
        }

        protected void duzelt_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                ds.Tables[0].Rows[GridView1.SelectedIndex]["Ad"] = ad.Text;
                ds.Tables[0].Rows[GridView1.SelectedIndex]["id"] = id.Text;
                ds.WriteXml(Server.MapPath("menu.xml"));
                oku();
            }
            else
                Response.Write("<script lang='JavaScript'>alert('Lutfen Kayıt Seçin');</script>");
        }

        protected void kaydet_Click(object sender, EventArgs e)
        {
            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~/sayfalar.mdb");
            conn.Open();
            OleDbCommand komutekle = new OleDbCommand();
            komutekle.Connection = conn;
            if (GridView1.SelectedIndex >= 0)
            {//daha önceden kayıt varsa sil
                komutekle.CommandText = "delete from sayfa where id='" + ds.Tables[0].Rows[GridView1.SelectedIndex]["id"].ToString() + "'";
                komutekle.ExecuteNonQuery();
                //yeni içeriği tabloya yaz
                komutekle.CommandText = "insert into sayfa(id,icerik) values(@id,@icerik)";
                komutekle.Parameters.AddWithValue("@id", ds.Tables[0].Rows[GridView1.SelectedIndex]["id"].ToString());
                komutekle.Parameters.AddWithValue("@icerik", icerik.Text);
                komutekle.ExecuteNonQuery();
                if (icerik.Text == "")
                    Response.Write("<script lang='JavaScript'>alert('Boş Geçemezsiniz');</script>");
                else
                {
                    Response.Write("<script lang='JavaScript'>alert('Kayıt Eklenmiştir');</script>");
                    ad.Text = "";
                    id.Text = "";
                    icerik.Text = "";
                }
            }
            else
                Response.Write("<script lang='JavaScript'>alert('Lutfen Listeden Bir Kayıt Seçin');</script>");
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm3.aspx?id="+id.Text);
        }
    }
}
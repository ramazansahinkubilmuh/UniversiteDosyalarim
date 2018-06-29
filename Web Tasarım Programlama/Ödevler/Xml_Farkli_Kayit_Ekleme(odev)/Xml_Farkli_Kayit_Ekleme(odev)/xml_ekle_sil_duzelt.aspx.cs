using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace Xml_Farkli_Kayit_Ekleme_odev_
{
    public partial class xml_ekle_sil_duzelt : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        void kayitlari_goster()
        {
            ds.Clear();
            ds.ReadXml(Server.MapPath("sehirler.xml"));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();//verilerin gösterilmesini sağlıyor
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            kayitlari_goster();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secilikayit = GridView1.SelectedIndex;
            tbiladi.Text = ds.Tables[0].Rows[secilikayit]["ad"].ToString();//Türkçe karakter sorunundan dolayı böyle yaptık
            tbplaka.Text = ds.Tables[0].Rows[secilikayit]["plaka"].ToString();
        }

        protected void btnekle_Click(object sender, EventArgs e)
        {
            bool a = true;
            if (tbiladi.Text.Trim() == "" || tbplaka.Text.Trim() == "")//sağdan soldan tüm boşlukları atıyoruz
            {
                Response.Write("<script lang='JavaScript'>alert('Bos Gecemezsiniz');</script>");
            }

            else
            {
                int i;
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    if (tbiladi.Text.ToLower() == ds.Tables[0].Rows[i]["ad"].ToString().ToLower() || tbplaka.Text.ToLower() == ds.Tables[0].Rows[i]["plaka"].ToString().ToLower())
                    {
                        Response.Write("<script lang='JavaScript'>alert('Bu Kayıt Vardır Tekrar Deneyin');</script>");
                        tbiladi.Text = "";
                        tbplaka.Text = "";
                        a = false;
                    }
                }
                if (a == true)
                {
                    DataRow dr = ds.Tables[0].NewRow();
                    dr["ad"] = tbiladi.Text;
                    dr["plaka"] = tbplaka.Text;
                    ds.Tables[0].Rows.Add(dr);
                    ds.Tables[0].WriteXml(Server.MapPath("sehirler.xml"));
                    kayitlari_goster();
                    tbiladi.Text = "";
                    tbplaka.Text = "";
                }
            }
        }

        protected void btnsil_Click(object sender, EventArgs e)
        {
            int secilikayit = GridView1.SelectedIndex;
            if (secilikayit < 0)
            {
                Response.Write("<script lang='JavaScript'>alert('Lutfen Kayıt Secin');</script>");
            }
            else
            {
                if (secilikayit >= 0)
                {
                    ds.Tables[0].Rows[secilikayit].Delete();
                    ds.Tables[0].WriteXml(Server.MapPath("sehirler.xml"));
                    kayitlari_goster();

                }
                else
                    Response.Write("<script lang='JavaScript'>alert('Lutfen Kayıt Secin');</script>");
            }
        }

        protected void btnduzelt_Click(object sender, EventArgs e)
        {
            int secilikayit = GridView1.SelectedIndex;
            if (secilikayit >= 0)
            {
                ds.Tables[0].Rows[secilikayit]["ad"] = tbiladi.Text;
                ds.Tables[0].Rows[secilikayit]["plaka"] = tbplaka.Text;
                ds.Tables[0].WriteXml(Server.MapPath("sehirler.xml"));
                kayitlari_goster();
            }
            else
                Response.Write("<script lang='JavaScript'>alert('Lutfen Kayıt Secin');</script>");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ds.Tables[0].Rows[e.RowIndex].Delete();
            ds.WriteXml(Server.MapPath("sehirler.xml"));
            kayitlari_goster();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            kayitlari_goster();
        }   
    }
}
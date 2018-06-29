using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace Menu_odev_
{
    public partial class menu_ekle_sil_duzelt : System.Web.UI.Page
    {
        DataSet ds = new DataSet();
        void kayitlari_goster()
        {
            ds.Clear();
            ds.ReadXml(Server.MapPath("menu.xml"));
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
            tbad.Text = ds.Tables[0].Rows[secilikayit]["Ad"].ToString();//Türkçe karakter sorunundan dolayı böyle yaptık
            tbid.Text = ds.Tables[0].Rows[secilikayit]["id"].ToString();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int secilikayit = GridView1.SelectedIndex;
            tbad.Text = ds.Tables[0].Rows[secilikayit]["Ad"].ToString();//Türkçe karakter sorunundan dolayı böyle yaptık
            tbid.Text = ds.Tables[0].Rows[secilikayit]["id"].ToString();
        }

        protected void btnekle_Click(object sender, EventArgs e)
        {
            bool a = true;
            if (tbad.Text.Trim() == "" || tbid.Text.Trim() == "")//sağdan soldan tüm boşlukları atıyoruz
            {
                Response.Write("<script lang='JavaScript'>alert('Bos Gecemezsiniz');</script>");
            }

            else
            {
                int i;
                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    if (tbad.Text.ToLower() == ds.Tables[0].Rows[i]["Ad"].ToString().ToLower() || tbid.Text.ToLower() == ds.Tables[0].Rows[i]["id"].ToString().ToLower())
                    {
                        Response.Write("<script lang='JavaScript'>alert('Bu Kayıt Vardır Tekrar Deneyin');</script>");
                        tbad.Text = "";
                        tbid.Text = "";
                        a = false;
                    }
                }
                if (a == true)
                {
                    DataRow dr = ds.Tables[0].NewRow();
                    dr["Ad"] = tbad.Text;
                    dr["id"] = tbid.Text;
                    ds.Tables[0].Rows.Add(dr);
                    ds.Tables[0].WriteXml(Server.MapPath("menu.xml"));
                    kayitlari_goster();
                    tbad.Text = "";
                    tbid.Text = "";
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
                    ds.Tables[0].WriteXml(Server.MapPath("menu.xml"));
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
                ds.Tables[0].Rows[secilikayit]["Ad"] = tbad.Text;
                ds.Tables[0].Rows[secilikayit]["id"] = tbid.Text;
                ds.Tables[0].WriteXml(Server.MapPath("menu.xml"));
                kayitlari_goster();
            }
            else
                Response.Write("<script lang='JavaScript'>alert('Lutfen Kayıt Secin');</script>");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ds.Tables[0].Rows[e.RowIndex].Delete();
            ds.WriteXml(Server.MapPath("menu.xml"));
            kayitlari_goster();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            kayitlari_goster();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
        
    }
}
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xml_ekle_sil_duzelt.aspx.cs" Inherits="Xml_Farkli_Kayit_Ekleme_odev_.xml_ekle_sil_duzelt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 119px;
        }
        .auto-style3 {
            width: 19px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">İl Adı</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="tbiladi" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Plaka</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="tbplaka" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="btnekle" runat="server" OnClick="btnekle_Click" Text="Ekle" />
                    <asp:Button ID="btnsil" runat="server" OnClick="btnsil_Click" Text="Sil" />
                    <asp:Button ID="btnduzelt" runat="server" OnClick="btnduzelt_Click" Text="Duzelt" />
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ad" HeaderText="İl Adı" />
                <asp:BoundField DataField="plaka" HeaderText="Plaka" />
                <asp:CommandField SelectText="Seç" ShowSelectButton="True" />
                <asp:CommandField DeleteText="Sil" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>

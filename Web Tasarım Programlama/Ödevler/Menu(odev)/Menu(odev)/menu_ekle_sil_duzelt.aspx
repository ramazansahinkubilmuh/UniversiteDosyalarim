<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_ekle_sil_duzelt.aspx.cs" Inherits="Menu_odev_.menu_ekle_sil_duzelt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 100px;
        }
        .auto-style3 {
            width: 21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Ad</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="tbad" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">ID</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="tbid" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="btnekle" runat="server" OnClick="btnekle_Click" Text="Ekle" />
                    <asp:Button ID="btnsil" runat="server" OnClick="btnsil_Click" Text="Sil" />
                    <asp:Button ID="btnduzelt" runat="server" OnClick="btnduzelt_Click" Text="Düzelt" />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sayfa Önizleme-1" />
                    <asp:Button ID="Button2" runat="server" Text="Sayfa Önizleme-2" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Ad" HeaderText="Ad" />
                <asp:BoundField DataField="id" HeaderText="ID" />
                <asp:CommandField SelectText="Seç" ShowSelectButton="True" />
                <asp:CommandField DeleteText="Sil" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>

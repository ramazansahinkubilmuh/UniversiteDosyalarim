<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="icerikduzenle.aspx.cs" Inherits="WebApplication1.icerik_duzenle" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var editor = CKEDITOR.replace('<%=icerik.ClientID%>');
            CKFinder.setupCKEditor(editor, '../ckfinder/');//CKFinder Resim yüklerken sürücüyü gezmeyi sağlıyor
        };
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 139px;
        }
        .auto-style3 {
            width: 19px;
        }
        .auto-style4 {
            width: 139px;
            height: 34px;
        }
        .auto-style5 {
            width: 19px;
            height: 34px;
        }
        .auto-style6 {
            height: 34px;
        }
        .auto-style7 {
            width: 139px;
            height: 23px;
        }
        .auto-style8 {
            width: 19px;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Sayfa Adı</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="ad" runat="server" Width="154px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Id</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="id" runat="server" Width="153px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    <asp:Button ID="ekle" runat="server" Text="Ekle" OnClick="ekle_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="sil" runat="server" Text="Sil" OnClick="sil_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="duzelt" runat="server" Text="Düzelt" OnClick="duzelt_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Önizleme" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField SelectText="Seç" ShowSelectButton="True" />
                            <asp:BoundField DataField="Ad" HeaderText="Sayfa Adı" />
                            <asp:BoundField DataField="id" HeaderText="Sayfa ID" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Sayfa İçeriği</td>
                <td class="auto-style8">:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="icerik" runat="server" TextMode="MultiLine" Width="152px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="kaydet" runat="server" Text="Kaydet" OnClick="kaydet_Click" />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

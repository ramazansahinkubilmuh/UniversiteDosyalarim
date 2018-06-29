<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="duyuru_goster.aspx.cs" Inherits="Kayan_Duyurular_odev_.duyuru_goster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Anasayfa</asp:LinkButton>
        <br />
        <br />
    
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <%#Eval("baslik1") %><br />
                <%#Eval("aciklama") %><br />
                <%#Eval("tarih") %><br />
                <%#Eval("yayinda") %><br />
            </ItemTemplate>
        </asp:Repeater>
        <br />
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="odev.aspx.cs" Inherits="Slayt_Uygulamasi_1_odev_.odev" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <asp:LinkButton ID="yukle" runat="server" OnClick="yukle_Click">Resim Yükle</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="slayt" runat="server" OnClick="slayt_Click">Resim Slayt</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>

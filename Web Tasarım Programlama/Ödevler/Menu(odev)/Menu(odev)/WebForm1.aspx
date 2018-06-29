<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Menu_odev_.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
}

ul.menu {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

ul.menu a {
    display: block;
    color: #1B1B1B;
    background-color: #E2E2E2;
    width:8em;
    padding: .2em .8em;
    text-decoration: none;
}

ul.menu a:hover
{
	background-color: #999;
}

ul.menu li {
	margin: 0 0 .2em 0;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: left; margin-left: 320px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Geri" />
        </p>
    <div>
    <% Response.Write(menutut); %>
    </div>
    </form>
</body>
</html>

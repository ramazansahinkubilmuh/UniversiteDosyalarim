<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Odev_1.WebForm1" %>

<%@ Register src="giris.ascx" tagname="giris" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 17px;
            text-align: left;
        }
    </style>
</head>
<body style="height: 446px; width: 982px;">
    <form id="form1" runat="server">
    <div style="width: 978px; text-align: left;">
    
        <table class="auto-style4">
            <tr>
                <td class="auto-style5">
                        <uc1:giris ID="giris3" runat="server" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>
                        <uc1:giris ID="giris2" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>

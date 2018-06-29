<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xmlgiris.aspx.cs" Inherits="Odev_1.xmlgiris" %>

<%@ Register src="giris.ascx" tagname="giris" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style4 {
        width: 112px;
        height: 26px;
    }
    .auto-style5 {
        width: 165px;
        text-align: center;
        height: 26px;
    }
    .auto-style6 {
        width: 128px;
        height: 26px;
    }
        
        .auto-style2 {
            width: 112px;
        }
        .auto-style3 {
            width: 165px;
            text-align: center;
        }
        .auto-style1 {
            width: 128px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table border="0" style="width: 346px">
            <tr>
                <td class="auto-style4">Kullanıcı Adı </td>
                <td class="auto-style5">:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox1" runat="server" Width="131px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Şifre</td>
                <td class="auto-style3">:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 0px" TextMode="Password" Width="131px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Giriş" Width="75px" />
                </td>
                <td class="auto-style1" style="text-align: center"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
                <td></td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>

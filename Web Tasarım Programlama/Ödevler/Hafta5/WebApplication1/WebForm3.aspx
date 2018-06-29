<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 251px;
        }
        .auto-style3 {
            width: 251px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>

    
     <link href="menu.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top"><%Response.Write(menutut); %></td>
                <td><%Response.Write(iceriktut); %></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

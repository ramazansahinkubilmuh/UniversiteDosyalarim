<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="duyuru.aspx.cs" Inherits="Kayan_Duyurular_odev_.duyuru" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <marquee onmouseover=this.stop() onmouseout=this.start() align="left" scrollamount="2" direction="up"scrolldelay="1" style="width: 296px; heigth=224px;">;
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <a id="A1" href='<%#Eval("duyuruid","~/duyuru_goster.aspx?duyuruid={0}")%>' runat="server">
                    <p style="text-align:center"><%#Eval("baslik1") %>
                </a>
                <p>----------------------------------------------</p>

            </ItemTemplate>
        </asp:Repeater>
    </marquee>
    </div>
    </form>
</body>
</html>

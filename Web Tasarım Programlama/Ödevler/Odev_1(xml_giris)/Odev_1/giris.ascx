<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="giris.ascx.cs" Inherits="Odev_1.giris1" %>
<style type="text/css">

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
        .auto-style7 {
        width: 165px;
    }
        </style>
        <table border="0" style="width: 346px">
            <tr>
                <td class="auto-style4">Kullanıcı Adı </td>
                <td class="auto-style5">:</td>
                <td class="auto-style6"><asp:TextBox ID="TextBox1" runat="server" Width="131px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2">Şifre</td>
                <td class="auto-style3">:</td>
                <td class="auto-style1"><asp:TextBox ID="TextBox2" runat="server" style="margin-left: 0px" TextMode="Password" Width="131px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" Text="Giriş" Width="75px" OnClick="Button1_Click" />
                </td>
                <td style="text-align: center" class="auto-style1">
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
                <td>

                </td>
            </tr>
        </table>
        <br />
        
    

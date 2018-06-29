<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#flip").click(function () {
            $("#panel").slideToggle("slow");
        });
    });
</script>

<style> 
#panel, #flip {
    padding: 5px;
    text-align: center;
    background-color: #e5eecc;
    border: solid 1px #c3c3c3;
}

#panel {
    padding: 50px;
    display: none;
}
</style>

    </head>
<body>
    
    <form runat="server">  
<div id="flip">Tıkla hayatın anlamını gör.</div>
<div id="panel">Hayatın anlamı burda</div>

   </form> 
    
</body>
</html>

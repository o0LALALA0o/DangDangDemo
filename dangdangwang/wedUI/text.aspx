<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="text.aspx.cs" Inherits="wedUI.text" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server"> 
    <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">HyperLink</asp:HyperLink>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="img/header.jpg" 
            onclick="ImageButton1_Click"/>
    </div>
    </form>
</body>
</html>

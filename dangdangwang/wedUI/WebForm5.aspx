﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="wedUI.WebForm5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate><%# Eval("wname") %></ItemTemplate>
        </asp:Repeater>

        <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate><%# Eval("wname") %></ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>

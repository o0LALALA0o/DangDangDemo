<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="wedUI.WebForm3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="用户管理" onclick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 筛选<asp:DropDownList 
            ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="查询" />
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="查询全部" />
        <asp:GridView ID="GridView1" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="BookId" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="BookId" HeaderText="图书id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="BookId" />
                <asp:BoundField DataField="TypeId" HeaderText="类型Id" 
                    SortExpression="TypeId" />
                <asp:TemplateField HeaderText="BookName" SortExpression="BookName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BookName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BookName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="图书价格" SortExpression="BookPrice">
                    <EditItemTemplate>
                        单位为人民币：<br /> 
                        <asp:TextBox ID="TextBox1" Text='<%# Bind("BookPrice") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BookPrice") %>'></asp:Label>
                        元                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BookDisCount" HeaderText="BookDisCount" 
                    SortExpression="BookDisCount" />
                <asp:BoundField DataField="BookAuthor" HeaderText="BookAuthor" 
                    SortExpression="BookAuthor" />
                <asp:BoundField DataField="BookPress" HeaderText="BookPress" 
                    SortExpression="BookPress" />
                <asp:BoundField DataField="PressTime" HeaderText="PressTime" 
                    SortExpression="PressTime" />
                <asp:BoundField DataField="PicPath" HeaderText="PicPath" 
                    SortExpression="PicPath" />
                <asp:BoundField DataField="SellCount" HeaderText="SellCount" 
                    SortExpression="SellCount" />
                <asp:ImageField DataImageUrlField="PicPath" 
                    DataImageUrlFormatString="img/books/{0}" HeaderText="图片">
                    <ControlStyle Width="100px" />
                </asp:ImageField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BookDBConnectionString %>" 
            DeleteCommand="DELETE FROM [BookInfo] WHERE [BookId] = @BookId" 
            InsertCommand="INSERT INTO [BookInfo] ([TypeId], [BookName], [BookPrice], [BookDisCount], [BookAuthor], [BookPress], [PressTime], [PicPath], [SellCount]) VALUES (@TypeId, @BookName, @BookPrice, @BookDisCount, @BookAuthor, @BookPress, @PressTime, @PicPath, @SellCount)" 
            SelectCommand="SELECT * FROM [BookInfo]" 
            UpdateCommand="UPDATE [BookInfo] SET [TypeId] = @TypeId, [BookName] = @BookName, [BookPrice] = @BookPrice, [BookDisCount] = @BookDisCount, [BookAuthor] = @BookAuthor, [BookPress] = @BookPress, [PressTime] = @PressTime, [PicPath] = @PicPath, [SellCount] = @SellCount WHERE [BookId] = @BookId">
            <DeleteParameters>
                <asp:Parameter Name="BookId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TypeId" Type="Int32" />
                <asp:Parameter Name="BookName" Type="String" />
                <asp:Parameter Name="BookPrice" Type="Decimal" />
                <asp:Parameter Name="BookDisCount" Type="Decimal" />
                <asp:Parameter Name="BookAuthor" Type="String" />
                <asp:Parameter Name="BookPress" Type="String" />
                <asp:Parameter Name="PressTime" Type="DateTime" />
                <asp:Parameter Name="PicPath" Type="String" />
                <asp:Parameter Name="SellCount" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TypeId" Type="Int32" />
                <asp:Parameter Name="BookName" Type="String" />
                <asp:Parameter Name="BookPrice" Type="Decimal" />
                <asp:Parameter Name="BookDisCount" Type="Decimal" />
                <asp:Parameter Name="BookAuthor" Type="String" />
                <asp:Parameter Name="BookPress" Type="String" />
                <asp:Parameter Name="PressTime" Type="DateTime" />
                <asp:Parameter Name="PicPath" Type="String" />
                <asp:Parameter Name="SellCount" Type="Int32" />
                <asp:Parameter Name="BookId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <asp:Label ID="Label3" runat="server" Text="类型ID："></asp:Label>
    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList3_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList4" runat="server">
    </asp:DropDownList><br />
    <asp:Label ID="Label4" runat="server" Text="图书名称："></asp:Label>
    <asp:TextBox ID="txtBookName" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label7" runat="server" Text="图书价格："></asp:Label>
    <asp:TextBox ID="txtBookPress" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label5" runat="server" Text="图书折扣："></asp:Label>
    <asp:TextBox ID="txtBookDisCount" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label6" runat="server" Text="图书作者："></asp:Label>
    <asp:TextBox ID="txtBookAuthor" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label8" runat="server" Text="出版时间："></asp:Label>
    <asp:TextBox ID="txtPressTime" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label9" runat="server" Text="图片："></asp:Label>
    <asp:FileUpload ID="FPicPath" runat="server" /><br />
    <asp:Label ID="Label10" runat="server" Text="销售数量："></asp:Label>
    <asp:TextBox ID="txtSellCount" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button4" runat="server" Text="添加" onclick="Button4_Click" />
    </form>
</body>
</html>

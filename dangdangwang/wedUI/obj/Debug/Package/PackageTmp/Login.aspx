<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="wedUI.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登陆</title>
    <style type="text/css">
			
			div{
				margin: auto;
				width: 100%;
				height: 100%;
				text-align: center;
			}
			img{
				width: auto;
				height: auto;
				max-height: 100%;
				max-width: 100%;	
			}
			#i1{
				float: left;
			}
			#d2{
				float: left;
				position: relative;
			}
			#d3{
				float: left;
				left: 25%;
				position: absolute;
			}
			#d4{
				top: 35%;
				float: left;
				left: 25%;
				position: absolute;
			}
		</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="d1">
				<img src="img/header.jpg"/>
			</div>
			<div id="d2">
				<img id="i1" src="img/login_Center.jpg"/>

			</div>
			
				<div id="d3">
					<img id="i2" src="img/loginForm.jpg"/>
						
				</div>
			<div id="d4">
							<label>用户名：</label>
							<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br /><br />
							<label>密 码：</label>
							<asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password"></asp:TextBox><br />
                            <br /><asp:Button ID="btnRegister" runat="server" Text="注册" 
                                onclick="btnRegister_Click" />
                            <asp:Button ID="btnLogin" runat="server" Text="登陆" onclick="btnLogin_Click" />
                            <br /><asp:Label ID="lblHint" runat="server" Text="" ForeColor="Red"></asp:Label>
						</div>
			<div id="d5">
				<img src="img/footer.jpg"/>
			</div>
    </form>
</body>
</html>

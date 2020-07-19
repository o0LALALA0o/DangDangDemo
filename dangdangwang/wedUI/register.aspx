<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="wedUI.register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>注册</title>
    <style type="text/css">
			#box{
				margin: auto;
				width: 100%;
				height: 100%;
				text-align: center;
				margin-top:-8px;
			}
			
			#d1{
				float: left;
				position: relative;
			}
			#login{
				float: left;
				position: absolute;
				left:75%;
				top: 1.555%;
				font-size: 14px;
				z-index:3;
			}
			
			#d2{
				float: left;
				left: 23%;
				position: relative;
				
			}
			#d3{     
				float: left;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
				position: absolute;
				left: 35%;
				top: 35%;
				width: 50%;
				text-align: left;
			}
			#btn{
				left:25% ;
			}
			input
			{
			    border-radius: 5px;
                border: 1px solid #ccc;    
			}
			#btnSubmit
			{
			    background-color: red;
                color: white;
                width: 150px;
                height: 30px;
                font-size: 14px;
                border-radius: 15px;    
			}
			
		</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
			<div id="header">
				<div id="d1">
					<img src="img/reg_hearder.jpg"/>
					<img src="img/regheader.jpg"/>
				</div>
				
				<div id="login">
					<a href="Login.aspx">登录</a>&nbsp;&nbsp;<a href="#">免费注册</a>
				</div>
				
			</div>
			<div id="centre">
				<div id="d2">
					<img src="img/reg_center.jpg"/>
				</div>
				<div id="d3">
					<label>书城账号：</label><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><span>书城登陆账号，并用于找回密码</span><br /><br />
					<label>登陆密码：</label><asp:TextBox ID="txtUserPwd" runat="server" 
                        TextMode="Password"></asp:TextBox><span>密码为6-20个字符，可由英文、数字和符号组成</span><br /><br />
					<label>登陆密码：</label><asp:TextBox ID="txtUserPwd1" runat="server" 
                        TextMode="Password"></asp:TextBox><span>请再次输入密码，两次密码必须一致</span><br /><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label style="float:left">性别：</label>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"  style="float:left">
                        <asp:ListItem Value="男" Selected="True">男</asp:ListItem>
                        <asp:ListItem Value="女">女</asp:ListItem>
                    </asp:RadioButtonList>
                    <br /><br />
					<label>出生日期：</label><asp:TextBox ID="txtBirthday" runat="server"></asp:TextBox><span>日期格式为：1990-9-19</span><br /><br />
					<label>电子邮箱：</label><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><span>电子邮箱，用于给您发送电子邮件</span><br /><br />
                    <asp:CheckBox ID="chkConsent" runat="server" Text="我已阅读并同意《交易条款》和《社区条款》" 
                        AutoPostBack="True" oncheckedchanged="chkConsent_CheckedChanged" /><br /><br />					
					<span id="btn">
                        <asp:Button ID="btnSubmit" runat="server" Text="立即注册" Enabled="False" 
                        onclick="btnSubmit_Click" />
                        <br /><asp:Label ID="lblHint" runat="server" ForeColor="Red"></asp:Label>
					</span>
				</div>
			</div>
			<div id="bottom">
				<img src="img/reg_footer.jpg"/>
			</div>
		</div>
    </form>
</body>
</html>

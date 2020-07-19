
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="wedUI.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
			#box{
				width: 1250px;
				height: 1675px;
				margin: auto;
				font-family:微软雅黑;
			}
			#header #userinfo{
				float: right;
				font-family: "微软雅黑";
				color: #FF0000;
			}
			
			#header #h{
				width: 1250px;
				height: 50px;
				background-color: #FF0000;							
			}
			
			
			#header #h ul a{
				list-style: none;
				float: left;
				padding-top: 10px;
				font-family: "微软雅黑";
				font-size: 20px;
				color: azure;
				width: 167px;
				height: 40px;
				text-align: center;
				text-decoration: none;
				
			}
			
			#header{
				width: 1250px;
				height: 215px;				
			}
			
			 #sinfo{
			 	float: left;
				margin-top: 8px;	
			}
			
			#header #h ul a:hover
			{
				text-decoration: none;
				background-color: crimson;
			}
			
			#centre{
				width: 1250px;
				height: 1065px;
			}
			#centre .d{
				width: 1250px;
				height: 348px;
				border: 1.5px aqua dashed;
				margin-top: 5px;
			}
			
			.bookinfo{				
				width: 400px;
				height: 300px;
				margin: 5px;
				padding-left: 4px;
				border: 1px red solid;
				float: left;
			}
			
			.bookinfo div{				
				float:right;
				padding-top:23px;
				padding-right:10px;
				font-size:14px;
				line-height:35px;
				font-family:微软雅黑;
			}
			
			.bookinfo img
			{
			    width: 190px;
                height: 280px;
                padding-top:10px;
                padding-left:10px;
                float:left;
            }
            
            .bookinfo #BookName
            {
                font-size:20px;  
                font-weight:bold;
                font-family:黑体;
                color:Blue;
            }
            
            .bookinfo #BookPrice1
            {
                 text-decoration: line-through;
                 color:darkgray;
            }
			
			.bookinfo #BookPrice2
            {
                 color:Red;
            }
			
			.fenlei{
				float: left;
				width: 1250px;
				height: 30px;
				font-size: 20px;
			}
			.fenlei span{
				float: right;
				font-size: 14px;
				padding-right: 10px;
				
			}
			
			.Scar{
                color:Red;
            }
			
			@keyframes donghua
			{
			    0%{margin-left:-40px}
			    20%{margin-left:-836px}
			    40%{margin-left:-1632px}
			    60%{margin-left:-2428px}
			    80%{margin-left:-3224px}    
			    100%{margin-left:-40px}
			}
			
			#lunbo
			{
			    width:795px;
			    height:380px;
			    border: 1px red solid;
			    margin:auto;
			    overflow:hidden;
			}
			
			#lunbo #uimg
			{
			    width:4020px;
			    margin-left:-40px;
			    margin-top:0px;   
			    -webkit-animation:donghua 10s;
			    -webkit-animation-iteration-count:10;
			}
			
			#lunbo li 
			{
			    float:left;
			    list-style:none;
			}
			
			#lunbo #uimg:hover
			{
			    -webkit-animation-play-state:paused ;
			}   
			
			#lunbo #uselect
			{
			    margin-left:-40px;
			    margin-top:-2px;
			}
			
			#lunbo #uselect li
			{
			    border: 1px red solid;
			    width:157px;
			    height:48px;
			    text-align:center;
			    line-height:45px;
			}
			
		</style>

</head>
<body>
    <form id="form1" runat="server">
    <div id="box">
			<div id="header">
				<span id="userinfo">hi  user<a href="#">[退出]</a></span>
				<img src="img/Head2.bmp"/>
				<div id="h">
						<ul>
							<a href="#"><li>首页</li></a>
							<a href="#"><li>热门图书</li></a>
							<a href="#"><li>新书上架</li></a>
							<a href="SellCount.aspx"><li>销售排行榜</li></a>
							<a href="#"><li>读者推荐</li></a>
							<a href="#"><li>计算机编程</li></a>
							<a href="ShopCarInfo.aspx"><li>购物车</li></a>
						</ul>	                        
				</div>
                <div id="lunbo">
                    <ul id="uimg">
                        <li><img src="img/1.jpg"/></li>
                        <li><img src="img/2.jpg"/></li>
                        <li><img src="img/3.jpg"/></li>
                        <li><img src="img/2.jpg"/></li>
                        <li><img src="img/3.jpg"/></li>
                    </ul>
                    <ul id="uselect">
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                        <li>5</li>
                    </ul>	
                </div>
				<span id="sinfo">当前位置：<a href="#">首页</a>->计算机编程</span>
			</div>
			
			<div id="centre">                           
                <asp:Repeater ID="Repeater4" runat="server" 
                    onitemdatabound="Repeater4_ItemDataBound">
                    <ItemTemplate>
                        <div class="d">
						    <div class="fenlei">
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("wid") %>'/>
						    <%#Eval("wname") %>
                            相关
						    <span><a href="#">更多</a></span>
						    </div>
                            <asp:Repeater ID="Repeater1" runat="server" 
                                onitemcommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                            <div class="bookinfo">
                                <img src="\img\Books\<%# Eval("PicPath") %>" />
                                <div>
                                    <span id="BookName"><%#Eval("BookName")%></span><br />
                                    作者：<span id="BookAuthor"><%#Eval("BookAuthor")%></span><br />原价：<span id="BookPrice1"><%#Eval("BookPrice")%></span><br />现价：<span id="BookPrice2">￥<%# string.Format("{0:F}", Convert.ToDouble(Eval("BookPrice")) * Convert.ToDouble(Eval("BookDisCount")))%>（<%#Convert.ToDouble(Eval("BookDisCount"))*10%>折）</span><br />
                                    出版日期：<%#string.Format("{0:d}",Eval("PressTime"))%><br />出版社：<%#Eval("BookPress")%><br /><a href="#">详情  </a>| 
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="Scar" CommandArgument='<%#Eval("BookID") %>' CommandName="AddScar">加入购物车</asp:LinkButton> 
                                </div>
                          </div>
                        </ItemTemplate>
                 </asp:Repeater>
						
					</div>
                    </ItemTemplate>
                </asp:Repeater>

					
					
					
					
			</div>
			
			<div id="bottom">
				<img src="img/Foot2.jpg"/>
			</div>
		</div>

    </form>
</body>
</html>

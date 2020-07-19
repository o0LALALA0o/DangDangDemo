<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellCount.aspx.cs" Inherits="wedUI.SellCount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
			#box{
				width: 1250px;
				height: 1500px;
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
				height: 2930px;
			}
			#centre .d{
				width: 1250px;
				height: 970px;
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
			    width: 170px;
                height: 270px;
                padding-top:15px;
                padding-left:5px;
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
							<a href="Main.aspx"><li>首页</li></a>
							<a href="#"><li>热门图书</li></a>
							<a href="#"><li>新书上架</li></a>
							<a href="#"><li>销售排行榜</li></a>
							<a href="#"><li>读者推荐</li></a>
							<a href="#"><li>计算机编程</li></a>
							<a href="ShopCarInfo.aspx"><li>购物车</li></a>
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
                            销量排行榜
						    <span><a href="#">更多</a></span>
						    </div>
                            <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                            <div class="bookinfo">
                                <img src="\img\Books\<%# Eval("PicPath") %>" />
                                <div>
                                    <span id="BookName"><%#Eval("BookName")%></span><br />
                                    作者：<span id="BookAuthor"><%#Eval("BookAuthor")%></span><br />原价：<span id="BookPrice1"><%#Eval("BookPrice")%></span><br />现价：<span id="BookPrice2">￥<%# string.Format("{0:F}", Convert.ToDouble(Eval("BookPrice")) * Convert.ToDouble(Eval("BookDisCount")))%>（<%#Convert.ToDouble(Eval("BookDisCount"))*10%>折）</span><br />
                                    出版日期：<%#string.Format("{0:d}",Eval("PressTime"))%><br />出版社：<%#Eval("BookPress")%><br /><a href="#">详情  </a>|<a href="#" style="color:Red;">  加入购物车</a>
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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace wedUI
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Repeater4.DataSource = BLL.webBookType_BLL.getWebType() ;
            this.Repeater4.DataBind();
            
            
        }

        protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater r = e.Item.FindControl("Repeater1") as Repeater;
            //DataRowView dv = e.Item.DataItem as DataRowView;            
            //r.DataSource = BLL.BookInfo_BLL.getBookInfo(dv["wid"].ToString());    

            HiddenField hf = e.Item.FindControl("HiddenField1") as HiddenField;
            r.DataSource = BLL.BookInfo_BLL.getBookInfo(hf.Value);

            r.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["UserID"]==null)
            {
                Response.Write("<script>alert('请登录！');window.location.href='Login.aspx';</script>");
                return;
                
            }

            if (e.CommandName=="AddScar")
            {
                string UserID=Session["UserID"].ToString();
                string BookID=e.CommandArgument.ToString();

                Entity.ShopCarInfo ShopCarInfo = new Entity.ShopCarInfo();
                ShopCarInfo.UserID = UserID;
                ShopCarInfo.GoodsID = BookID;
                if (BLL.ShopCarInfo_BLL.AddScar(ShopCarInfo))
                    Response.Write("<script>alert('添加成功!')</script>");
                
            }
        }
    }
}
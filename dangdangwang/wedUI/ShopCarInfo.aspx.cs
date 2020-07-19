using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedUI
{
    public partial class ShopCarInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //自动登录
            BLL.UserInfo_BLL.zidonfLogin();

            if (Session["UserID"] == null)
            {
                Response.Write("<script>alert('请登录！');window.location.href='Login.aspx';</script>");
                return;
            }
            else
            {
                this.Repeater1.DataSource = BLL.ShopCarInfo_BLL.uShopCarInfo(Session["UserID"].ToString());
                Repeater1.DataBind();
            }
        }

        

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                if (DBHelper.ExecuteNonQuery("delete ShopCarInfo where CarID = " + e.CommandArgument.ToString()) > 0)
                    Response.Write("<script>alert('删除成功！')</script>");
                Page_Load(source, e);
            } 
             if (e.CommandName == "AddNum")
            {               
                if (DBHelper.ExecuteNonQuery("update ShopCarInfo set Num=Num+1 where CarID = " + e.CommandArgument.ToString()) > 0)
                {
                    Page_Load(source, e);
                }


            }

            else if (e.CommandName == "DelNum")
            {
                if (DBHelper.ExecuteNonQuery("update ShopCarInfo set Num=Num-1 where CarID = " + e.CommandArgument.ToString()) > 0)
                {
                    Page_Load(source, e);
                }
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image img = e.Item.FindControl("Image2") as Image;
            HiddenField h = e.Item.FindControl("HiddenField1") as HiddenField;
            img.ImageUrl = "/img/Books/" + h.Value;
        }

       

        
    }
}
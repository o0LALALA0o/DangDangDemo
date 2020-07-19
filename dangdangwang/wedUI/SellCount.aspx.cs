using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedUI
{
    public partial class SellCount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Repeater4.DataSource = BLL.webBookType_BLL.getWebType();
            this.Repeater4.DataBind();
        }

        protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater r = e.Item.FindControl("Repeater1") as Repeater;
            HiddenField h = e.Item.FindControl("HiddenField1") as HiddenField;
            r.DataSource = BLL.BookInfo_BLL.getSellCount(h.Value);
            r.DataBind();
        }
    }
}
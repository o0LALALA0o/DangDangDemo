using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedUI
{
    public partial class text : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.HyperLink1.NavigateUrl = "http://www.baidu.com";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
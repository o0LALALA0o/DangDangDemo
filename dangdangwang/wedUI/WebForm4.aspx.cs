using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedUI
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Repeater1.DataSource = DBHelper.getTable("select * from BookInfo");
            this.Repeater1.DataBind();
        }
    }
}
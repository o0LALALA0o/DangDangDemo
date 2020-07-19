using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wedUI
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Repeater1.DataSource = BLL.webBookType_BLL.getWebType();
            this.Repeater1.DataBind();

            this.DataList1.DataSource = BLL.webBookType_BLL.getWebType();
            this.DataList1.DataBind();
        }
    }
}
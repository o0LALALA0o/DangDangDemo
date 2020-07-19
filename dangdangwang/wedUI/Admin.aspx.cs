using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace wedUI
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"]!="admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                this.DropDownList1.DataSource = BLL.webBookType_BLL.getWebType();
                this.DropDownList1.DataTextField = "wname";
                this.DropDownList1.DataValueField = "wid";
                this.DropDownList1.DataBind();

                this.DropDownList3.DataSource = BLL.webBookType_BLL.getWebType();
                this.DropDownList3.DataTextField = "wname";
                this.DropDownList3.DataValueField = "wid";
                this.DropDownList3.DataBind();

                DropDownList1_SelectedIndexChanged(sender, e);
                DropDownList3_SelectedIndexChanged(sender, e);
            }
            
        }

        public int f()
        {
            return 4;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("user.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string wid = this.DropDownList1.SelectedValue;
            this.DropDownList2.DataSource = BLL.BookType_BLL.getBookType(wid);
            this.DropDownList2.DataTextField = "TypeName";
            this.DropDownList2.DataValueField = "TypeId";
            this.DropDownList2.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.SqlDataSource1.SelectCommand = "select * from BookInfo where TypeId=" + this.DropDownList2.SelectedValue;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.SqlDataSource1.SelectCommand = "select * from BookInfo";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string TypeId = this.DropDownList4.SelectedValue;
	        string BookName =this.txtBookName.Text;
	        string BookPrice=this.txtBookPress.Text;
	        string BookDisCount =this.txtBookDisCount.Text;
	        string BookAuthor =this.txtBookAuthor.Text;
	        string BookPress =this.txtBookPress.Text;
	        string PressTime =this.txtPressTime.Text;
            string PicPath =this.FPicPath.FileName;
            string SellCount = this.txtSellCount.Text;
            
            if (TypeId == "" || BookName == "" || BookPrice == "" || BookDisCount == "" || BookAuthor == "" || BookPress == "" || PressTime == "" || PicPath == "" || SellCount == "")
            {
                Response.Write("<script>alert('请将信息填写完整！')</script>");
            }
            else
            {
                try
                {
                    Convert.ToDouble(BookPrice);
                }
                catch 
                {

                    Response.Write("<script>alert('价格格式不正确！')</script>");
                    return;
                }

                try
                {
                    Convert.ToDouble(BookDisCount);
                }
                catch 
                {
                    Response.Write("<script>alert('折扣格式不正确！')</script>");
                    return;
                }

                try
                {
                    Convert.ToDateTime(PressTime);
                }
                catch
                {
                    Response.Write("<script>alert('出版日期格式不正确！')</script>");
                    return;                   
                }

                if (!(PicPath.EndsWith(".jpg")||PicPath.EndsWith(".png")))
                {
                    Response.Write("<script>alert('上传图片格式不正确！')</script>");
                    return;
                }

                try
                {
                    Convert.ToInt16(SellCount);
                }
                catch
                {
                    Response.Write("<script>alert('销售数量格式不正确！')</script>");
                    return;
                }

                Entity.BookInfo bookinfo = new Entity.BookInfo();
                bookinfo.TypeId = TypeId;
                bookinfo.BookName = BookName;
                bookinfo.BookPrice = BookPrice;
                bookinfo.BookDisCount = BookDisCount;
                bookinfo.BookAuthor = BookAuthor;
                bookinfo.BookPress = BookPress;
                bookinfo.PressTime = PressTime;
                bookinfo.PicPath = PicPath;
                bookinfo.SellCount = SellCount;



                if (BLL.BookInfo_BLL.uBookInfo(bookinfo))
                {
                    string strPath = Server.MapPath(@"\img\Books\" + PicPath);
                    this.FPicPath.SaveAs(strPath);
                    Response.Write("<script>alert('添加成功！')</script>");

                }
            }
            
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string wid = this.DropDownList3.SelectedValue;
            this.DropDownList4.DataSource = BLL.BookType_BLL.getBookType(wid);
            this.DropDownList4.DataTextField = "TypeName";
            this.DropDownList4.DataValueField = "TypeId";
            this.DropDownList4.DataBind();
        }

    }
}
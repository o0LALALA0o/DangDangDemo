using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace wedUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack&&Request.Cookies["info"]!=null)
            {
                this.txtUserName.Text = Request.Cookies["info"]["uname"];
                this.txtUserPwd.Attributes["value"] = Request.Cookies["info"]["upwd"];
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            this.lblHint.Text = "";
            string UserName = this.txtUserName.Text;
            string UserPwd = this.txtUserPwd.Text;

            if (UserName==""||UserPwd=="")
            {
                this.lblHint.Text = "请将信息填写完整";
            }
            else
            {
                Entity.UserInfo userinfo = new Entity.UserInfo();
                userinfo.UserName = UserName;
                userinfo.UserPwd = UserPwd;

                DataTable dt = BLL.UserInfo_BLL.uLogin(userinfo);
                if (dt.Rows.Count>0)
                {
                    if (this.CheckBox1.Checked==true)
                    {
                        HttpCookie uinfo = new HttpCookie("info");
                        uinfo.Values["uname"] = UserName;
                        uinfo.Values["upwd"] = UserPwd;
                        uinfo.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(uinfo);
                    }
                    Application.Lock();
                    Application["auname"] = UserName;

                    if (UserName == "admin")
                    {
                        Session["admin"] = "admin";
                        Response.Redirect("admin.aspx");
                    }
                    Session["UserID"] = dt.Rows[0][0].ToString();
                    this.lblHint.Text = "登陆成功！";
                    Response.Redirect("Main.aspx");
                }
                else
                {
                    this.lblHint.Text = "用户名或密码有误！登录失败！";
                }
            }
        }
    }
}
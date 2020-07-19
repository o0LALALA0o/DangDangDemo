 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace wedUI
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void chkConsent_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkConsent.Checked == true)
            {
                this.btnSubmit.Enabled = true;
            }
            else
            {
                this.btnSubmit.Enabled = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.lblHint.Text = "";
            string UserName = this.txtUserName.Text;
            string UserPwd = this.txtUserPwd.Text;
            string UserSex = this.RadioButtonList1.SelectedValue;
            
            string Birthday = this.txtBirthday.Text;
            string Email = this.txtEmail.Text;

            if (UserName==""||UserPwd==""||UserSex==""||Birthday==""||Email=="")
            {
                this.lblHint.Text = "请将信息填写完整！";
            }
            else if(UserPwd.Length<6||UserPwd.Length>20)
            {
                this.lblHint.Text = "密码长度不得小于6位数或大于20位数！";
            }
            else if (UserPwd!=this.txtUserPwd1.Text)
            {
                this.lblHint.Text = "第二次输入的密码与第一次不相同！";
            }
            else if (Regex.IsMatch(Birthday, "^[0-9]{4}-[0-9]{0,1}[1-9]{1}-[0-9]{0,1}[1-9]{1}$")==false)
            {
                this.lblHint.Text = "出生日期格式不正确！";
            }
            else if (Regex.IsMatch(Email,"^[a-zA-Z0-9]+@[a-zA-Z0-9]+[\'.']com$")==false)
            {
                this.lblHint.Text = "电子邮箱格式不正确！";
            }
            else
            {
                Entity.UserInfo userinfo = new Entity.UserInfo();
                userinfo.UserName = UserName;
                userinfo.UserPwd = UserPwd;
                userinfo.UserSex = UserSex;
                userinfo.Birthday = Birthday;
                userinfo.Email = Email;

                if (BLL.UserInfo_BLL.uRegister(userinfo))
                {
                    Response.Write("<script>alert('注册成功！');window.location.href='Login.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('注册失败！')</script>");
                }
            }
        }
    }
}
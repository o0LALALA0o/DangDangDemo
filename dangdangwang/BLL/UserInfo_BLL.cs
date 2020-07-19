using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using System.Web;

namespace BLL
{
    public class UserInfo_BLL
    {
        public static DataTable uLogin(Entity.UserInfo userinfo)
        {
            return DAL.UserInfo_DAL.uLogin(userinfo);
        }

        public static bool uRegister(Entity.UserInfo userinfo)
        {
            bool isNo = false;
            if (DAL.UserInfo_DAL.uRegister(userinfo)>0)
            {
                isNo = true;
            }

            return isNo;
        }

        /// <summary>
        /// 自动登录
        /// </summary>
        public static void zidonfLogin() 
        {
            if (HttpContext.Current.Request.Cookies["info"] == null)
            {
                return;
            }   

            string uname = HttpContext.Current.Request.Cookies["info"]["uname"];
            string upwd = HttpContext.Current.Request.Cookies["info"]["upwd"];

            Entity.UserInfo UserInfo = new Entity.UserInfo();
            UserInfo.UserName = uname;
            UserInfo.UserPwd = upwd;

            DataTable dt = uLogin(UserInfo);
            if (dt.Rows.Count>0)
            {
                HttpContext.Current.Session["UserID"] = dt.Rows[0][0].ToString();
            }
        }

    }
}

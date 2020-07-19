using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class UserInfo_DAL
    {
        public static DataTable uLogin(Entity.UserInfo userinfo)
        {
            string sql = string.Format("select UserID from UserInfo where UserName='{0}' and UserPwd='{1}'", userinfo.UserName, userinfo.UserPwd);
            return DBHelper.getTable(sql);
        }

        public static int uRegister(Entity.UserInfo userinfo) 
        {
            string sql = string.Format("insert into UserInfo values('{0}','{1}','{2}','{3}','{4}')", userinfo.UserName, userinfo.UserPwd, userinfo.UserSex, userinfo.Birthday, userinfo.Email);
            return DBHelper.ExecuteNonQuery(sql);
        }
    }
}

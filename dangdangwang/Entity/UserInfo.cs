using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class UserInfo
    {
        //用户ID
        public int UserID { get; set; }
        
        //用户名称
        public string UserName { get; set; }

        //用户密码
        public string UserPwd { get; set; }

        //用户性别
        public string UserSex { get; set; }

        //出生日期
        public string Birthday { get; set; }

        //电子邮箱
        public string Email { get; set; }
        
    }
}

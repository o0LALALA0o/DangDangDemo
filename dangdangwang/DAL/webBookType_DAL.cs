using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class webBookType_DAL
    {
        public static DataTable getWebType()
        {
            return DBHelper.getTable("select * from webBookType");
        }
    }
}

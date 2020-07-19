using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class BookType_DAL
    {
        public static DataTable getBookType(string wid)
        {
            return DBHelper.getTable("select * from BookType where wid =" + wid);
        }
    }
}

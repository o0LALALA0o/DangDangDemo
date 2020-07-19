using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class BookInfo_BLL
    {
        public static bool uBookInfo(Entity.BookInfo bookinfo)
        {
            int i = DAL.BookInfo_DAL.uBookInfo(bookinfo);
            if (i > 0)
                return true;
            else
                return false;  
            
        }

        public static DataTable getBookInfo(string wid)
        {
            return DAL.BookInfo_DAL.getBookInfo(wid);
        }

        public static DataTable getSellCount(string wid)
        {
            return DAL.BookInfo_DAL.getSellCount(wid);
        }
    }
}

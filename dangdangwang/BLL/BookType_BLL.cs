using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class BookType_BLL
    {
        public static DataTable getBookType(string wid)
        {
            return DAL.BookType_DAL.getBookType(wid);
        }
    }
}

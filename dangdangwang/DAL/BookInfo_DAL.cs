using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class BookInfo_DAL
    {
        public static int uBookInfo(Entity.BookInfo bookinfo) 
        {
            string sql = string.Format("insert into BookInfo values({0},'{1}',{2},{3},'{4}','{5}','{6}','{7}',{8})", bookinfo.TypeId, bookinfo.BookName, bookinfo.BookPrice, bookinfo.BookDisCount, bookinfo.BookAuthor, bookinfo.BookPress, bookinfo.PressTime, bookinfo.PicPath, bookinfo.SellCount);
            return DBHelper.ExecuteNonQuery(sql);
        }

        public static DataTable getBookInfo(string wid) 
        {
            string sql = string.Format("select top 3 * from BookInfo inner join BookType on BookInfo.TypeId = BookType.TypeId where wid = {0}",wid);
            return DBHelper.getTable(sql);
        }

        public static DataTable getSellCount(string wid) 
        {
            string sql = string.Format("select top 9 * from BookInfo inner join BookType on BookInfo.TypeId = BookType.TypeId where wid = {0} order by SellCount desc ",wid);
            return DBHelper.getTable(sql);
        }
    }
}

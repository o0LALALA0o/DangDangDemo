using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class ShopCarInfo_DAL
    {
        public static int AddScar(Entity.ShopCarInfo ShopCarInfo)
        {
            string selectSql = string.Format("select CarID from ShopCarInfo where UserID ={0} and GoodsID = {1}", ShopCarInfo.UserID, ShopCarInfo.GoodsID);
            string sql = "";

            DataTable dt = DBHelper.getTable(selectSql);
            if (dt.Rows.Count>0)
                sql = string.Format("update ShopCarInfo set Num = Num+1 where CarID={0}",dt.Rows[0][0].ToString());
            else
                sql = string.Format("insert into ShopCarInfo values(1,{0},{1})", ShopCarInfo.UserID, ShopCarInfo.GoodsID);
            
            return DBHelper.ExecuteNonQuery(sql);
        }

        public static DataTable uShopCarInfo(string UserID)
        {
            string sql = string.Format("select * from ShopCarInfo inner join BookInfo on ShopCarInfo.GoodsID = BookInfo.BookId where UserID = {0}", UserID);
            return DBHelper.getTable(sql);
        }
    }
}

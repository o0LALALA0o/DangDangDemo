using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class ShopCarInfo_BLL
    {
        public static Boolean AddScar(Entity.ShopCarInfo ShopCarInfo)
        {
            if (DAL.ShopCarInfo_DAL.AddScar(ShopCarInfo) > 0)
                return true;
            else
                return false;
        }

        public static DataTable uShopCarInfo(string UserID)
        {
            return DAL.ShopCarInfo_DAL.uShopCarInfo(UserID);
        }
    }
}

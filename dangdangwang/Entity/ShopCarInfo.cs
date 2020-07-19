using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class ShopCarInfo
    {
        /// <summary>
        /// 购物车商品的ID       
        /// </summary>
        public string CarID { get; set; }
        
        /// <summary>
        /// 数量
        /// </summary>
        public string Num { get; set; }

        /// <summary>
        /// 用户表ID
        /// </summary>
        public string UserID { get; set; }

        /// <summary>
        /// 书籍ID
        /// </summary>
        public string GoodsID { get; set; }

    }
}

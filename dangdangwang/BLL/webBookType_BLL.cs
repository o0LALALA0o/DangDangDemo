using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BLL
{
    public class webBookType_BLL
    {
        public static DataTable getWebType()
        {
            return DAL.webBookType_DAL.getWebType();
        }
    }
}

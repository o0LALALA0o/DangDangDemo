using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    class DBHelper
    {
        public static string str = "Data Source=.;Initial Catalog=BookDB;Integrated Security=True";

        public static int ExecuteNonQuery(string sql)
        {
            int count = 0;
            SqlConnection sqlCon = new SqlConnection(str);
            sqlCon.Open();
            SqlCommand sqlCom = new SqlCommand(sql, sqlCon);
            count = sqlCom.ExecuteNonQuery();
            sqlCon.Close();
            return count;
        }

        public static DataTable getTable(string sql) 
        {
            SqlConnection sqlCon = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter(sql, sqlCon);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ShoppingStore.BussinesLayer
{
    public class ShoppingCart
    {
        public string CategoryName;
        public int CategoryID;

        public String ProductName;
        public String ProductImage;
        public String ProductPrice;
        public String ProductDescription;

        public void AddCategroy()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataLayer.DataAccess.AddParameter("@CategoryName", CategoryName, System.Data.SqlDbType.VarChar, 200);
            DataTable dt = DataLayer.DataAccess.ExecuteDTBByProcedure("SP_AddNewCategory", parameters);
        }

        public DataTable GetCategories()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataLayer.DataAccess.ExecuteDTBByProcedure("SP_GetAllCategories", parameters);
            return dt;
        }

        public void AddNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[5];
            parameters[0] = DataLayer.DataAccess.AddParameter("@ProductName", ProductName, System.Data.SqlDbType.VarChar, 300);
            parameters[1] = DataLayer.DataAccess.AddParameter("@ProductPrice", ProductPrice, System.Data.SqlDbType.Int, 100);
            parameters[2] = DataLayer.DataAccess.AddParameter("@ProductImage", ProductImage, System.Data.SqlDbType.VarChar, 500);
            parameters[3] = DataLayer.DataAccess.AddParameter("@ProductDescription", ProductDescription, System.Data.SqlDbType.VarChar, 1000);
            parameters[4] = DataLayer.DataAccess.AddParameter("@CategoryId", CategoryID, System.Data.SqlDbType.Int, 100);

            DataTable dt = DataLayer.DataAccess.ExecuteDTBByProcedure("SP_AddNewProduct", parameters);



        }

    }
}



using ShoppingStore.BussinesLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingStore.Admin
{
    public partial class CustomerOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetOrderList();
            }
        }

        private void GetOrderList()
        {
            ShoppingCart k = new ShoppingCart()
            {
                Flag=0
            };
            DataTable dt=k.GetOrderList();

            gvAvailableProducts.DataSource = dt;
            gvAvailableProducts.DataBind();
            
        }
    }
}
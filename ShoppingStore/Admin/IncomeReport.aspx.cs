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
    public partial class IncomeReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetIncomeReport();
            }
        }

        protected void rblProductStock_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetIncomeReport();
        }

        private void GetIncomeReport()
        {
            ShoppingCart k = new ShoppingCart()
            {
                Flag=Convert.ToInt32(rblIncomeFilter.SelectedValue)
            };
            DataTable dt=k.GetIncomeReport();

            if(dt.Rows.Count>0)
            {
                gvIncomeReport.Visible=true;
                gvIncomeReport.DataSource=dt;
                gvIncomeReport.DataBind();

                object ProductSold;
                ProductSold=dt.Compute("Sum(TotalProducts)" , "" );

                object TotalIncome;
                TotalIncome=dt.Compute("Sum(TotalPrice)" , "" );
            }else {
                gvIncomeReport.Visible = false;
                lblIncome.Text = "No Products Income";
            }
        }
    }
}
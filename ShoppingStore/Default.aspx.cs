using ShoppingStore.BussinesLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingStore
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblCategoryName.Text = "Popular Products at ShoppingHeart";
                GetCategory();
                GetProducts(0);
            }
            lblAvailableStockAlert.Text = String.Empty;
        }

        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID
            };
            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts();
            dlProducts.DataBind();
        }

        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();
        }

        protected void lbLogo_Click(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Popular Products at ShoppingHeart";
            lblProducts.Text = "Products";

            plnCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false;
            pnlCheckOut.Visible = false;
            pnlEmptyCart.Visible = false;
            pnlOrderPlacedSuccesfully.Visible = false;

            GetProducts(0);
        }

        protected void lbntCategory_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID=Convert.ToInt16(((LinkButton)sender).CommandArgument);
            GetProducts(CategoryID);
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }

        protected void txtProductQuantity_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {

        }

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {

        }

 

    }
}
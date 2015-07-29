using ShoppingStore.BussinesLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
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

            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false;
            pnlCheckOut.Visible = false;
            pnlEmptyCart.Visible = false;
            pnlOrderPlacedSuccesfully.Visible = false;

            GetProducts(0);
            HighlightCartProducts();
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
            TextBox txtQuantity = (sender as TextBox);

            DataListItem currentItem = (sender as TextBox).NamingContainer as DataListItem;
            HiddenField ProductID = currentItem.FindControl("hfProductID") as HiddenField;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if(txtQuantity.Text == string.Empty || txtQuantity.Text=="0" || txtQuantity.Text=="1")
            {
                txtQuantity.Text = "1";
            }else
            {
                if(Session["MyCart"]!=null)
                {
                    if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblAvailableStock.Text))
                    {
                        DataTable dt = (DataTable)Session["MyCart"];

                        DataRow[] rows = dt.Select("ProductID='" + ProductID.Value + "'");

                        int index = dt.Rows.IndexOf(rows[0]);

                        dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;

                        Session["MyCart"] = dt;
                    }else
                    {
                        lblAvailableStockAlert.Text = "Alert: Product buyout should not be more than AvailableStock!";
                        txtQuantity.Text = "1";
                    }
                }
            }

            UpdateTotalBill();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {

            string productids = string.Empty;
            DataTable dt;
            if (Session["MyCart"] != null)
            {
                dt = (DataTable)Session["MyCart"];

                ShoppingCart k = new ShoppingCart()
                {
                    CustomerName = txtCustomerName.Text,
                    CustomerEmailID = txtCustomerEmailID.Text,
                    CustomerAddres = txtCustomerAddress.Text,
                    CustomerPhoneNo = txtCustomerPhoneNo.Text,
                    TotalProducts = Convert.ToInt32(txtTotalProducts.Text),
                    TotalPrice = Convert.ToInt32(txtTotalPrice.Text),
                    PaymenMethod = rdlPaymentMethod.SelectedItem.Text
                };

                DataTable dtReult = k.SaveCustomerDetails();

                for(int i=0; i<dt.Rows.Count;i++)
                {
                    ShoppingCart SaveProducts = new ShoppingCart()
                    {
                        CustomerID = Convert.ToInt32(dtReult.Rows[0][0]),
                        ProductID = Convert.ToInt32(dt.Rows[i]["ProductID"]),
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"])
                    };
                    SaveProducts.SaveCustomerProducts();
                }

                 Session.Clear();
                 GetMyCart();

                 lblTransactionNo.Text = "Your Transaction No: " + dtReult.Rows[0][0];

                 pnlOrderPlacedSuccesfully.Visible = true;
                 pnlCheckOut.Visible = false;
                 pnlCategories.Visible = false;
                 pnlMyCart.Visible = false;
                 pnlEmptyCart.Visible = false;
                 pnlProducts.Visible = false;

                 txtCustomerAddress.Text = string.Empty;
                 txtCustomerEmailID.Text = string.Empty;
                 txtCustomerName.Text = string.Empty;
                 txtCustomerPhoneNo.Text = string.Empty;
                 txtTotalPrice.Text = "0";
                 txtTotalProducts.Text = "0";
            }


        }

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            String ProductID = Convert.ToInt16(((Button)sender).CommandArgument).ToString();

            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];

                DataRow drr = dt.Select("ProductID=" + ProductID + " ").FirstOrDefault();

                if (drr != null)
                {
                    dt.Rows.Remove(drr);
                }
            }

            GetMyCart();
        }



        private DataTable GetData(String Query)
        {
            DataTable dt = new DataTable();
            String conn = WebConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
            SqlConnection con = new SqlConnection(conn);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(Query, con);
            da.Fill(dt);
            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
            String ProductQuantity = "1";

            DataListItem currentItem = (sender as Button).NamingContainer as DataListItem;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                var checkProduct = dt.AsEnumerable().Where(r => r.Field<string>("ProductID") == ProductID);
                if(checkProduct.Count()==0)
                {
                    String query= "select * from products where ProductID='" + ProductID + "'";
                    DataTable dtProducts = GetData(query);

                    DataRow dr = dt.NewRow();

                    dr["ProductID"]=ProductID;
                    dr["Name"]=Convert.ToString(dtProducts.Rows[0]["Name"]);
                    dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                    dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                    dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                    dr["ProductQuantity"] = ProductQuantity;
                    dr["AvailableStock"] = lblAvailableStock.Text;
                    dt.Rows.Add(dr);

                    Session["MyCart"] = dt;
                    btnShoppingHeart.Text = dt.Rows.Count.ToString();
                }
            }
            else
            {
                string query = "select * from products where ProductID='" + ProductID + "'";
                DataTable dtProducts = GetData(query);

                DataTable dt = new DataTable();

                dt.Columns.Add("ProductID", typeof(string));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Description", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("ProductQuantity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));

                DataRow dr=dt.NewRow();
                dr["ProductID"] = ProductID;
                dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                dr["ProductQuantity"] = ProductQuantity;
                dr["AvailableStock"] = lblAvailableStock.Text;

                dt.Rows.Add(dr);
                Session["MyCart"] = dt;
                btnShoppingHeart.Text = dt.Rows.Count.ToString();
            }

            HighlightCartProducts();
        }

        private void HighlightCartProducts()
        {
            if(Session["MyCart"]!=null)
            {
                DataTable dtProductsAddCart = (DataTable)Session["MyCart"];
                if(dtProductsAddCart.Rows.Count>0)
                {
                    foreach(DataListItem item in dlProducts.Items)
                    {
                        HiddenField hfProductID = item.FindControl("hfProductID") as HiddenField;
                        if (dtProductsAddCart.AsEnumerable().Any(row => hfProductID.Value == row.Field<string>("ProductID")))
                        {
                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button;
                            btnAddToCart.BackColor = System.Drawing.Color.Green;
                            btnAddToCart.Text = "Added to Card";

                            /*Image imgGreenStar = item.FindControl("imgProductPhoto") as Image;
                            imgGreenStar.Visible = true;*/
                        }
                    }
                }
            }
        }

        protected void btnShoppingHeart_Click(object sender, EventArgs e)
        {
            GetMyCart();
            lblCategoryName.Text = "Products in your shopping Cart";
            lblProducts.Text = "Customer Details";

        }

        private void GetMyCart()
        {
            DataTable dtProducts;
            if(Session["MyCart"]!=null)
            {
                dtProducts = (DataTable)Session["MyCart"];
            }else
            {
                dtProducts = new DataTable();
            }

            if(dtProducts.Rows.Count>0)
            {
                txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
                btnShoppingHeart.Text = dtProducts.Rows.Count.ToString();
                dlCartProducts.DataSource = dtProducts;
                dlCartProducts.DataBind();
                UpdateTotalBill();

                pnlMyCart.Visible = true;
                pnlCheckOut.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccesfully.Visible = false;

            }
            else
            {
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false;
                pnlEmptyCart.Visible = true;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccesfully.Visible = false;

                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();
                txtTotalProducts.Text = "0";
                txtTotalPrice.Text = "0";
                btnShoppingHeart.Text="0";
            }
        }

        public void UpdateTotalBill()
        {
            
            long TotalPrice = 0;
            long TotalProducts = 0;
            foreach(DataListItem item in dlCartProducts.Items)
            {
                Label PriceLabel = item.FindControl("lblPrice") as Label;
                TextBox ProductQuantity = item.FindControl("txtProductQuantity") as TextBox;
                long ProductPrice = Convert.ToInt64(PriceLabel.Text) * Convert.ToInt64(ProductQuantity.Text);
                TotalPrice = TotalPrice + ProductPrice;
                TotalProducts = TotalProducts + Convert.ToInt32(ProductQuantity.Text);
            }
            txtTotalPrice.Text = Convert.ToString(TotalPrice);
            txtTotalProducts.Text = Convert.ToString(TotalProducts);
        }

    }
}
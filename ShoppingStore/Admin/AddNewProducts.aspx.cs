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
    public partial class AddNewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetCategories();

                addSubmitEvent();

                if(Request.QueryString["alert"] == "success")
                {
                    Response.Write("<script>alert('Record Saved Succesfully');</script>");
                }
            }

        }

        public void addSubmitEvent()
        {
            UpdatePanel updatePanel = Page.Master.FindControl("AdminUpdatePanel") as UpdatePanel;
            UpdatePanelControlTrigger trigger = new PostBackTrigger();
            trigger.ControlID = btnSubmit.UniqueID;

            updatePanel.Triggers.Add(trigger);
        }

        private void GetCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
            if(dt.Rows.Count>0)
            {
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();

            }
        }


        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            if(uploadProductPhoto.PostedFile!=null)
            {
                SaveProductPhoto();
                ShoppingCart k = new ShoppingCart()
                {
                    ProductName = txtProductName.Text,
                    ProductImage = "~/ProductImages/" + uploadProductPhoto.FileName,
                    ProductPrice = txtProductPrice.Text,
                    ProductDescription = txtProductDescription.Text,
                    CategoryID = Convert.ToInt32(ddlCategory.SelectedValue),
                    TotalProducts = Convert.ToInt32(txtProductQuantity.Text)

                };
                if(k!=null)
                k.AddNewProduct();
                k = null;
                ClearText();
            }
        }

        private void ClearText()
        {
            txtProductName.Text = "";
            txtProductDescription.Text = "";
            txtProductPrice.Text="";
            uploadProductPhoto = null;
            ddlCategory.SelectedIndex = 0;
            txtProductQuantity.Text = "";

        }
        private void SaveProductPhoto()
        {
            if(uploadProductPhoto.PostedFile!=null)
            {
                string filename = uploadProductPhoto.FileName.ToString();
                string fileExt = System.IO.Path.GetExtension(uploadProductPhoto.FileName);

                if(filename.Length>96)
                {
                  //Alert.Show("image should not exceed 96 characters!";
                }
                else if(fileExt !=".jpeg" && fileExt!=".jpg" && fileExt!=".png" && fileExt!=".bmp")
                {
                    //Alert.Show("Only jpeg, jpg, bmp & png images are allowed!";
                }
                else
                {
                    uploadProductPhoto.SaveAs(Server.MapPath("~/ProductImages/" + filename));
                }
            }

            
        }
    }
}
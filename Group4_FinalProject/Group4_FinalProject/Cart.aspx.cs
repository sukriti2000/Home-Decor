using Group4_FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Group4_FinalProject
{
    public partial class Cart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdatePage();


            }
        }
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            LinkButton lnkDelete = (LinkButton)sender;
            string productId = lnkDelete.CommandArgument;

            // Remove the item from the cart based on the product ID
            CartItems cart = CartItems.GetCartOrCreateIt();
            cart.RemoveByProductId(productId);
            UpdatePage();
            
        }

        protected void UpdatePage() {
            CartItems cart = CartItems.GetCartOrCreateIt();
            // Refresh the cart by re-binding the repeater
            cartRepeater.DataSource = cart;
            cartRepeater.DataBind();

            // Recalculate and update the total price
            txtTotalPrice.Text = cart.GetTotalPrice().ToString("C");

        }




        protected void EmptyCart(object sender, EventArgs e)
        {
            CartItems cart = CartItems.GetCartOrCreateIt();
            // if cart has items, clear  cart and update page
          
            if (cart.Count > 0)
            {
                cart.Clear();
                UpdatePage();

            }

        }
    }

}
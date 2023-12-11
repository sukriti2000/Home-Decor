using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_FinalProject
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater1.DataBind();
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void DetailsButton_Click(object sender, EventArgs e)
        {
            // Retrieve the product ID from the CommandArgument
            Button detailsButton = (Button)sender;
            int productId = Convert.ToInt32(detailsButton.CommandArgument);

            // Redirect to the DetailsPage with the product ID
            Response.Redirect($"~/Details.aspx?productId={productId}");
        }

    }
}
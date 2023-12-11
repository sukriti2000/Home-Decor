using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_FinalProject
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie userCookie = Request.Cookies["user"];

                if (userCookie != null && userCookie["isLoggedIn"] != null && userCookie["isLoggedIn"] == "true")
                {
                    btnLogin.Text = "Logout";
                }
                else
                {
                    btnLogin.Text = "Login";
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            HttpCookie userCookie = Request.Cookies["user"];

            if (userCookie != null && userCookie["isLoggedIn"] == "true")
            {
                userCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(userCookie);
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

    }
}
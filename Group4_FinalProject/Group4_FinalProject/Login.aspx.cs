using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            userDataSource.SelectCommand = "SELECT [Id], [first_name], [last_name], [email], [password], [userType] FROM [User] WHERE [email] = @Email";
            userDataSource.SelectParameters.Clear();
            userDataSource.SelectParameters.Add("email", email.Text);

            var data = userDataSource.Select(DataSourceSelectArguments.Empty);

            if (data != null && data is System.Data.DataView)
            {
                System.Data.DataView view = (System.Data.DataView)data;

                if (view.Count > 0)
                {
                    string userPassword = view[0]["password"].ToString();

                    if (password.Text.Equals(userPassword))
                    {
                        HttpCookie userCookie = new HttpCookie("user");
                        userCookie["email"] = email.Text;
                        userCookie["isLoggedIn"] = "true";
                        userCookie.Expires = DateTime.Now.AddMinutes(60);
                        Response.Cookies.Add(userCookie);

                        feedbackLabel.CssClass = "text-success text-center";
                        feedbackLabel.Text = "Login successfully! Redirecting to home page...";

                        ScriptManager.RegisterStartupScript(this, GetType(), "RedirectToDefault", "setTimeout(function(){ window.location.href = 'Default.aspx'; }, 3000);", true);

                    }
                    else
                    {

                        feedbackLabel.Text = "Incorrect password...";
                    }
                }
                else
                {
                    feedbackLabel.Text = "User not found! please create a new account.";
                }
            }
            else
            {
                feedbackLabel.Text = "Error retrieving user data.";
            }
        }

    }
}
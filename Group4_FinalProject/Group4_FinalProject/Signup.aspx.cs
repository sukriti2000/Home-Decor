using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_FinalProject
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Random random = new Random();
                int min = 10000;
                int max = 99999;

                int id = random.Next(min, max + 1);
                string userEmail = email.Text;
                string userFirstName = firstName.Text;
                string userLastName = lastName.Text;
                string userPassword = password.Text;
                string userReenterPassword = reenterPassword.Text;
                try
                {

                    userDataSource.InsertCommand =
                        "INSERT INTO [dbo].[User] " +
                        "([Id], [first_name], [last_name], [email], [password], [userType]) " +
                        "VALUES (@id, @firstName, @lastName, @email, @password, @userType)";
                    userDataSource.InsertParameters.Clear();
                    userDataSource.InsertParameters.Add("email", userEmail);
                    userDataSource.InsertParameters.Add("id", id.ToString());
                    userDataSource.InsertParameters.Add("firstName", userFirstName);
                    userDataSource.InsertParameters.Add("lastName", userLastName);
                    userDataSource.InsertParameters.Add("password", userPassword);
                    userDataSource.InsertParameters.Add("userType", "Customer");

                    userDataSource.Insert();
                    feedbackLabel.Text = "Account created successfully! Redirecting to login...";

                    ScriptManager.RegisterStartupScript(this, GetType(), "RedirectToLogin", "setTimeout(function(){ window.location.href = 'Login.aspx'; }, 3000);", true);
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 2627 || ex.Number == 2601) {
                        feedbackLabel.Text = "Error: This email is already registered. Please use a different email.";
                        feedbackLabel.CssClass = "text-danger text-center";
                    }
                }

            }
        }
    }
}
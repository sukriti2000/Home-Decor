using Group4_FinalProject.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_FinalProject
{
    public partial class Details : System.Web.UI.Page
    {
        public string productName { get; set; }
        public decimal price { get; set; }
        public decimal salePrice { get; set; }
        public string description { get; set; }
        public string image { get; set; }

        public int id { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["productId"]))
                {
                    int productId = Convert.ToInt32(Request.QueryString["productId"]);

                    id = productId;
                    PId.Text=id.ToString();
                    // Add debugging statements
                    System.Diagnostics.Debug.WriteLine($"productId: {productId}");

                    LoadProductDetails(productId);
                    DataBind();
                }
            }
        }

        private void LoadProductDetails(int productId)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Group4_FinalProject_DecorStore.mdf;Integrated Security=True"; // Replace with your actual connection string
            string query = "SELECT * FROM Product WHERE Id = @productId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@productId", productId);

                try
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Retrieve details and store in variables
                            productName = reader["Name"].ToString();
                            price = Convert.ToDecimal(reader["Price"]);
                            salePrice = Convert.ToDecimal(reader["Sale_Price"]);
                            description = reader["Description"].ToString();
                            image = reader["Image"].ToString();


                            Pimage.Text = image;
                            Pprice.Text = price.ToString();
                            PsalePrice.Text = salePrice.ToString(); 
                            Pdescription.Text = description;
                            Pimage.Text = image;
                            PproductName.Text=productName;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle or log the exception
                    System.Diagnostics.Debug.WriteLine($"Error loading product details: {ex.Message}");
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Product seletcedProduct = new Product();

                //  parsing the ID, SalePrice, and Price values
                if (int.TryParse(PId.Text, out int productId) &&
                    decimal.TryParse(PsalePrice.Text, out decimal salePrice) &&
                    decimal.TryParse(Pprice.Text, out decimal price))
                {
                    seletcedProduct.ID = productId;
                    seletcedProduct.Name = PproductName.Text;
                    seletcedProduct.Description = Pdescription.Text;
                    seletcedProduct.SalePrice = salePrice;
                    seletcedProduct.Price = price;
                    seletcedProduct.Image = Pimage.Text;

                    CartItems cart = CartItems.GetCartOrCreateIt();

                    Item cartItem = cart[seletcedProduct.ID.ToString()];
                    if (cartItem == null)
                    {
                        System.Diagnostics.Debug.WriteLine($"Adding item to cart: {seletcedProduct.Name}, Quantity: {quantity.Text}");
                        cart.AddItem(seletcedProduct, Convert.ToInt32(quantity.Text));
                        System.Diagnostics.Debug.WriteLine($"Product added to cart: {seletcedProduct.Name}, Quantity: {quantity.Text}");
                    }
                    else
                    {
                        cartItem.AddQuantity(Convert.ToInt32(quantity.Text));
                    }
                }
                else
                {
                    // Handle the case where parsing fails (invalid input)
                    System.Diagnostics.Debug.WriteLine("Invalid input for ID, SalePrice, or Price.");
                }
            }
        }




    }

}
    



using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group4_FinalProject.Model
{
    public class Item
    {
        public Item() { }
        public Item(Product product, int quantity)
        {
            this.Product = product;
            this.Quantity = quantity;
        }

        public Product Product { get; set; }
        public int Quantity { get; set; }
        public void AddQuantity(int quantity)
        {
            this.Quantity += quantity;
        }

        public string Display()
        {
            string displayString = string.Format("{0} ({1} at {2})",
                Product.Name,
                Quantity.ToString(),
                Product.SalePrice.ToString()
            );
            return displayString;
        }
    }
}
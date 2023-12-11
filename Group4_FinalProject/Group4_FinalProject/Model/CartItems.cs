using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;

namespace Group4_FinalProject.Model
{
    public class CartItems : IEnumerable<Item>
    {
        private List<Item> items;

        public CartItems()
        {
            items = new List<Item>();
        }

        public int Count
        {
            get { return items.Count; }
        }

        public Item this[int index]
        {
            get { return items[index]; }
            set { items[index] = value; }
        }

        public Item this[string id]
        {
            get
            {
                foreach (Item item in items)
                    if (item.Product.ID.ToString() == id) return item;
                return null;
            }
        }

        public static CartItems GetCartOrCreateIt()
        {
            CartItems cart = (CartItems)HttpContext.Current.Session["Cart"];
            if (cart == null)
                HttpContext.Current.Session["Cart"] = new CartItems();
            return (CartItems)HttpContext.Current.Session["Cart"];
        }

        public void AddItem(Product product, int quantity)
        {
            Item cartItem = new Item(product, quantity);
            items.Add(cartItem);
        }

        public void RemoveByProductId(string productId)
        {
            Item itemToRemove = this[productId];
            if (itemToRemove != null)
            {
                items.Remove(itemToRemove);
            }
        }

        public void RemoveAt(int index)
        {
            items.RemoveAt(index);
        }

        public void Clear()
        {
            items.Clear();
        }

        public decimal GetTotalPrice()
        {
            decimal totalPrice = 0;

            foreach (Item item in items)
            {
                // Calculate the total price for each item (considering sale price if available)
                decimal itemTotal = item.Product.SalePrice > 0
                    ? item.Product.SalePrice * item.Quantity
                    : item.Product.Price * item.Quantity;

                totalPrice += itemTotal;
            }

            return totalPrice;
        }

        public IEnumerator<Item> GetEnumerator()
        {
            return items.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Group4_FinalProject.Model
{
    public class Product
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public decimal SalePrice { get; set; }
        public string Description { get; set; }

        public string Image { get; set; }
    }
}
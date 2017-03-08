using AspNetODataSample.Models;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.OData;

namespace AspNetODataSample.Controllers
{
    public class ProductsController : ODataController
    {
        private List<Product> products = new List<Product>()
        {
            new Product()
            {
                ID = 1,
                Name = "Bread",
            }
        };

        public List<Product> Get()
        {
            return products;
        }
    }
}

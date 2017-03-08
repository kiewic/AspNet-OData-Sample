using AspNetODataSample.Models;
using System.Web.Http;
using System.Web.OData.Builder;
using System.Web.OData.Extensions;

namespace AspNetODataSample
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //
            // Convention model builder
            //
            var builder = new ODataConventionModelBuilder();

            builder.EntitySet<Product>("Products");

            config.MapODataServiceRoute("ODataRoute", null, builder.GetEdmModel());
        }
    }
}

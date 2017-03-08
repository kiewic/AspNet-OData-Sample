namespace AspNetODataSample.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Quality Quality { get; set; }
        public Quality? NullableQuality { get; set; }
    }
}

namespace AspNetODataSample.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddProductNullableQuality : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "NullableQuality", c => c.Int());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Products", "NullableQuality");
        }
    }
}

namespace AspNetODataSample.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddProductQuality : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "Quality", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Products", "Quality");
        }
    }
}

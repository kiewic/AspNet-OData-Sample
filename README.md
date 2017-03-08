# AspNet-OData-Sample
ASP.NET OData web application sample.

### Troubleshooting

To solve:

> A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SQL Network Interfaces, error: 26 - Error Locating Server/Instance Specified)

Replace:

    connectionString="Data Source=(localdb)\v11.0; ...

With:

    connectionString="Data Source=(localdb)\MSSQLLocalDB; ...

The instance name can be obtained and started with:

    cmd> sqllocaldb.exe i
    cmd> sqllocaldb.exe s "MSSQLLocalDB"

### References

1. [Create an OData v4 Endpoint with EntityFramework][create-an-odata-v4-endpoint]

[create-an-odata-v4-endpoint]: https://docs.microsoft.com/en-us/aspnet/web-api/overview/odata-support-in-aspnet-web-api/odata-v4/create-an-odata-v4-endpoint

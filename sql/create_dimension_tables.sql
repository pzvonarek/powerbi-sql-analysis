/*
DIMENSION TABLES
Data Warehouse – Sales Analysis
*/

--Customer_location
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'customer_location')
BEGIN
    CREATE TABLE dbo.customer_location (
        ID_location INT IDENTITY(1,1) PRIMARY KEY,
        Customer_location NVARCHAR(100),
        Region NVARCHAR(100)
    );
END;
GO

--Date
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'date')
BEGIN
    CREATE TABLE dbo.[date] (
        ID_date INT IDENTITY(1,1) PRIMARY KEY,
        Dispatch_date DATE,
        Inward_date DATE
    );
END;
GO

--Customer
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'customer')
BEGIN
    CREATE TABLE dbo.customer (
        ID_customer INT IDENTITY(1,1) PRIMARY KEY,
        Customer_name NVARCHAR(100),
        Customer_surname NVARCHAR(100)
    );
END;
GO

--Product
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'product')
BEGIN
    CREATE TABLE dbo.product (
        ID_product INT IDENTITY(1,1) PRIMARY KEY,
        Product_type NVARCHAR(50),
        Brand NVARCHAR(100),
        Product_code NVARCHAR(50),
        Product_specification NVARCHAR(MAX),
        Core_specification NVARCHAR(100),
        Processor_specification NVARCHAR(100),
        RAM NVARCHAR(50),
        ROM NVARCHAR(50),
        SSD NVARCHAR(50)
    );
END;
GO
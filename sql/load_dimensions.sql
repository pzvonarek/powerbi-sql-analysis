/*
--Loads data into dimension tables from the staging sales dataset.
*/

--Customer_location
INSERT INTO dbo.customer_location (Customer_location, Region)
SELECT DISTINCT [Customer Location], [Region]
FROM dbo.mobile_sales_data
WHERE [Customer Location] IS NOT NULL
  AND [Region] IS NOT NULL;
GO

--Date
INSERT INTO dbo.[date] (Dispatch_date, Inward_date)
SELECT DISTINCT [Dispatch Date], [Inward Date]
FROM dbo.mobile_sales_data
WHERE [Dispatch Date] IS NOT NULL
  AND [Inward Date] IS NOT NULL;
GO

--Customer
INSERT INTO dbo.customer (Customer_name, Customer_surname)
SELECT DISTINCT
    LEFT([Customer Name], CHARINDEX(' ', [Customer Name]) - 1) AS Customer_name,
    LTRIM(RIGHT([Customer Name], LEN([Customer Name]) - CHARINDEX(' ', [Customer Name]))) AS Customer_surname
FROM dbo.mobile_sales_data
WHERE [Customer Name] IS NOT NULL;
GO

--Product
INSERT INTO dbo.product
(
    Product_type,
    Brand,
    Product_code,
    Product_specification,
    Core_specification,
    Processor_specification,
    RAM,
    ROM,
    SSD
)
SELECT DISTINCT
    [Product],
    [Brand],
    [Product Code],
    [Product Specification],
    [Core Specification],
    [Processor Specification],
    [RAM],
    [ROM],
    [SSD]
FROM dbo.mobile_sales_data;
GO
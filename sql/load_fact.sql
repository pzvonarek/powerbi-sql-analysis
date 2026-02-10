/*
Loads data into the sales fact table using dimension table references
*/

INSERT INTO dbo.sale
(
    ID_location,
    ID_date,
    ID_customer,
    ID_product,
    Price,
    Quantity_sold
)
SELECT
    cl.ID_location,
    d.ID_date,
    c.ID_customer,
    p.ID_product,
    msd.Price,
    msd.[Quantity Sold]
FROM dbo.mobile_sales_data msd

--Join Customer Location dimension
JOIN dbo.customer_location cl
    ON msd.[Customer Location] = cl.Customer_location
   AND msd.[Region] = cl.Region

--Join Date dimension
JOIN dbo.[date] d
    ON msd.[Dispatch Date] = d.Dispatch_date
   AND msd.[Inward Date] = d.Inward_date

--Join Customer dimension
JOIN dbo.customer c
    ON LEFT(msd.[Customer Name], CHARINDEX(' ', msd.[Customer Name]) - 1) = c.Customer_name
   AND LTRIM(RIGHT(msd.[Customer Name],
        LEN(msd.[Customer Name]) - CHARINDEX(' ', msd.[Customer Name]))) = c.Customer_surname

--Join Product dimension
JOIN dbo.product p
    ON msd.[Product] = p.Product_type
   AND msd.[Brand] = p.Brand
   AND msd.[Product Code] = p.Product_code
   AND msd.[Product Specification] = p.Product_specification
   AND msd.[Core Specification] = p.Core_specification
   AND msd.[Processor Specification] = p.Processor_specification
   AND msd.[RAM] = p.RAM
   AND msd.[ROM] = p.ROM
   AND msd.[SSD] = p.SSD

WHERE msd.Price IS NOT NULL
  AND msd.[Quantity Sold] IS NOT NULL;
GO
/*
Data Cleaning – Update missing values
*/

UPDATE dbo.mobile_sales_data
SET [Core Specification] = 'Unknown'
WHERE [Core Specification] IS NULL OR [Core Specification] = '';

UPDATE dbo.mobile_sales_data
SET SSD = 'Unknown'
WHERE SSD IS NULL OR SSD = '';
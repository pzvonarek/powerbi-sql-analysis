/*
Creates the fact table for sales transactions.
*/

-- Fact table: Sale
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'sale')
BEGIN
    CREATE TABLE dbo.sale (
        ID_location INT NOT NULL,
        ID_date INT NOT NULL,
        ID_customer INT NOT NULL,
        ID_product INT NOT NULL,
        Price DECIMAL(10,2),
        Quantity_sold INT,

        CONSTRAINT FK_sale_location
            FOREIGN KEY (ID_location)
            REFERENCES dbo.customer_location(ID_location),

        CONSTRAINT FK_sale_date
            FOREIGN KEY (ID_date)
            REFERENCES dbo.[date](ID_date),

        CONSTRAINT FK_sale_customer
            FOREIGN KEY (ID_customer)
            REFERENCES dbo.customer(ID_customer),

        CONSTRAINT FK_sale_product
            FOREIGN KEY (ID_product)
            REFERENCES dbo.product(ID_product)
    );
END;
GO
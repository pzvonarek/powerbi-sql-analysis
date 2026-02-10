# Power BI SQL Analysis
This project demonstrates the design and implementation of a SQL Server data warehouse using a star schema, followed by sales analysis and visualization in Power BI.

## Project Overview
The project includes:
- Creation of dimension and fact tables
- ETL process for data cleaning and loading
- Sales analysis using a Power BI dashboard

The data warehouse is built on Microsoft SQL Server, while Power BI is used to visualize sales performance across different dimensions.

## SQL Scripts Execution Order
1. create_dimension_tables.sql  
2. data_cleaning.sql  
3. load_dimensions.sql  
4. create_fact_table.sql  
5. load_fact.sql  
6. sale_preview.sql (optional)

## Power BI Dashboard
The Power BI report file is available in the `powerbi` folder.
It visualizes sales data by brand, region, time, customers, product types, and revenue.

## Note
The Power BI report requires access to a local SQL Server instance with the same database schema and data structure as defined in the provided SQL scripts.

## Technologies Used
- Microsoft SQL Server (SSMS)
- T-SQL
- Power BI

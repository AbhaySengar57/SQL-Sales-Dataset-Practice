#Create Database
Create Database analytics_db;
USE analytics_db;

#Create Table
Create table sales_data(
order_id INT PRIMARY KEY ,
region varchar(50),
category VARCHAR(50),
    segment VARCHAR(50),
    sales DECIMAL(10,2),
    profit DECIMAL(10,2)
    );
select * from sales_data;
INSERT INTO sales_data (order_id, region, category, segment, sales, profit) VALUES
(101, 'East', 'Furniture', 'Consumer', 500.00, 100.00),
(102, 'West', 'Technology', 'Corporate', 1200.00, 200.00),
(103, 'South', 'Office Supplies', 'Home Office', 300.00, -50.00),
(104, 'North', 'Furniture', 'Corporate', 750.00, 180.00),
(105, 'East', 'Technology', 'Consumer', 950.00, 220.00),
(106, 'West', 'Office Supplies', 'Home Office', 400.00, -20.00),
(107, 'North', 'Furniture', 'Consumer', 650.00, 90.00),
(108, 'South', 'Technology', 'Corporate', 1150.00, 300.00),
(109, 'East', 'Office Supplies', 'Consumer', 250.00, -10.00),
(110, 'West', 'Furniture', 'Home Office', 800.00, 150.00); 
#QUERIES
select region, SUM(sales) AS total_sales, SUM(profit) AS total_profit from sales_data group by region;
select order_id from sales_data where profit < 0;    
select segment , avg(sales) AS Average_sales from sales_data group by segment; 
select * from sales_data
ORDER BY profit DESC Limit 3;
select category, Count(*) As total_orders from sales_data group by category;

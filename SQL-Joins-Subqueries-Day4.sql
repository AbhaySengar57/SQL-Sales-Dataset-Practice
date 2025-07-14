#SQL JOINS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    sales DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1, 'Ravi Kumar', 'East'),
(2, 'Sneha Sharma', 'North'),
(3, 'Amit Roy', 'West'),
(4, 'Neha Singh', 'South');
INSERT INTO orders VALUES
(101, 1, 500.00, '2024-06-15'),
(102, 2, 900.00, '2024-06-20'),
(103, 1, 1200.00, '2024-06-22'),
(104, 3, 650.00, '2024-06-25'),
(105, 4, 300.00, '2024-06-28');

#JOINS
#INNER JOIN
select o.order_id , c.customer_name , o.sales 
from orders o
inner join customers c
ON c.customer_id = o.customer_id;
#LEFT JOIN
select o.order_id , c.customer_name , o.sales
from customers c
LEFT JOIN orders o
on c.customer_id= o.customer_id;
#RIGHT JOIN
SELECT c.customer_name, o.order_id, o.sales
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

#SUBQUERIES
#Getting the sum of sales of individual customer using subqueries.
Select customer_name,
(select SUM(sales) from orders where orders.customer_id = customers.customer_id) AS total_sales
from customers;

#Getting the name of customers where sales of individual is more then 800 using where subqueries.
select customer_name
from customers
Where customer_id IN(
	select customer_id
    from orders
    where sales > 800)

#Getting the customer_id with total_sales gretaer then 1000.
select * from(
	select customer_id , sum(sales) AS total_sales
	from orders
	Group by customer_id)
	As sales_summary
	where total_sales > 1000;    

#PRACTICE QUERY
#Customers from EAST region.    
select o.order_id , c.region , c.customer_name
from orders o
Join customers c
on c.customer_id = o.customer_id
where c.region = "East";

#Getting customer names with no orders
select c.customer_name , c.region , c.customer_id
from customers c
left join orders o
on c.customer_id= o.customer_id
where order_id is null;

#total sales made by each customer
select c.customer_name , c.customer_id ,sum(o.sales) As total_sales
from customers c
join orders o
on c.customer_id = o.customer_id
group by customer_name , customer_id;

#Most recent order and the customer who placed it
select c.customer_id , c.customer_name , o.order_id , o.order_date
from orders o
join customers c
on c.customer_id = o.customer_id
order by order_date desc
limit 2;

#customers whose average order value is greater than ₹500.

select c.customer_name , c.customer_id ,AVG(o.sales) As avg_sales
from orders o
join customers c
on c.customer_id = o.customer_id
group by customer_name , customer_id
having avg_sales > 500;




    
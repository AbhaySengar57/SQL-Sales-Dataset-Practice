#Challenge 1:Find regions where total sales > ₹1000
select c.region, sum(o.sales) as total_sales
from customers c
join orders o on c.customer_id = o.customer_id
group by  c.region
having total_sales>1000;

#Challenge 2: List customers whose lowest order was below ₹500
select c.customer_name , MIN(o.sales) as lowest_sales
from customers c
join orders o on c.customer_id= o.customer_id
Group by c.customer_name
having lowest_sales <500;

#Challenge 3:Show average sales per customer, but only if they have more than 1 order
select c.customer_name , Avg(o.sales) as Avg_sales , count(o.order_id) as count_order
from customers c
join orders o
on c.customer_id = o.customer_id
Group by c.customer_name
having count_order >1;

#Challenge 5: Find the highest single order amount per customer
select c.customer_name , MAX(o.sales) as Highest_sales
from customers c
join orders o on c.customer_id= o.customer_id
Group by c.customer_name;
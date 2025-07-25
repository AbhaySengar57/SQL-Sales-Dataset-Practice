# 📊 SQL Practice – Sales Dataset (MySQL Workbench)

This project is a hands-on SQL practice exercise built around a fictional **sales dataset**, designed to simulate common business analysis queries using **MySQL Workbench**.

## 📌 Objective

To understand and apply fundamental SQL concepts such as:
- Data retrieval (`SELECT`)
- Filtering (`WHERE`)
- Sorting (`ORDER BY`)
- Aggregation (`SUM`, `AVG`, `COUNT`)
- Grouping (`GROUP BY`)
- Ranking (`LIMIT`)

---

## 🧱 Table Structure

**Table:** `sales_data`

| Column     | Type           | Description                        |
|------------|----------------|------------------------------------|
| order_id   | INT            | Unique order ID (Primary Key)      |
| region     | VARCHAR(50)    | Region of the order                |
| category   | VARCHAR(50)    | Product category                   |
| segment    | VARCHAR(50)    | Customer segment                   |
| sales      | DECIMAL(10,2)  | Total sales amount                 |
| profit     | DECIMAL(10,2)  | Profit made on the order           |

---

## 🔍 Sample Queries

```sql
-- 1. View all records
SELECT * FROM sales_data;

-- 2. Total sales and profit by region
SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM sales_data
GROUP BY region;

-- 3. Orders with negative profit
SELECT * FROM sales_data
WHERE profit < 0;

-- 4. Average sales by customer segment
SELECT segment, AVG(sales) AS avg_sales
FROM sales_data
GROUP BY segment;

-- 5. Top 3 most profitable orders
SELECT * FROM sales_data
ORDER BY profit DESC
LIMIT 3;

-- 6. Number of orders by product category
SELECT category, COUNT(*) AS total_orders
FROM sales_data
GROUP BY category;

Tools Used
MySQL Workbench

SQL (Standard syntax for SELECT, WHERE, GROUP BY, ORDER BY)

Sample dataset manually inserted

# 📊 SQL Project – Joins & Subqueries (Day 4)

This project covers **SQL joins and subqueries** using a fictional customer-orders dataset. It's part of my 30-day roadmap to becoming a Data Analyst.

---

## 📁 Tables Used

### 🧑 Customers
| Column        | Type         |
|---------------|--------------|
| customer_id   | INT (PK)     |
| customer_name | VARCHAR      |
| region        | VARCHAR      |

### 📦 Orders
| Column        | Type         |
|---------------|--------------|
| order_id      | INT (PK)     |
| customer_id   | INT (FK)     |
| sales         | DECIMAL      |
| order_date    | DATE         |

---

## 🔧 Topics Practiced

- ✅ `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- ✅ Subqueries: `SELECT`, `WHERE`, `FROM`
- ✅ `GROUP BY`, `HAVING`, `LIMIT`
- ✅ Filtering unmatched data using joins
- ✅ Real-world query practice

---

## 🧪 Practice Challenges Solved

1. Orders from East region customers  
2. Customers with no orders  
3. Total sales per customer  
4. Most recent order and customer  
5. Customers with avg order value > ₹500

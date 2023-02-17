SELECT '' AS 'Chad Strachan';
SELECT '' AS 'PROG2220: Section 3';
SELECT '' AS 'Assignment 2: Task 1';
SELECT SYSDATE() AS 'Current System Date';

SELECT '';
SELECT '' AS '*** Task #, Q1. MGS Exercise 4-1 [5 points]
***';
SELECT '' AS '*** Write a SELECT statement that joins the Categories table to the Products table and
returns these columns: category_name, product_name, list_price. Sort the result set by
category_name and then by product_name in ascending sequence..
***';

USE my_guitar_shop;

SELECT  c.category_name, p.product_name, p.list_price
FROM categories c
JOIN products p ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name ASC;

SELECT '';
SELECT '' AS '*** Task 1, Q2. MGS Exercise 4-2 [5 points] ***';
SELECT '' AS '*** Write a SELECT statement that joins the Customers table to the Addresses table and
returns these columns: first_name, last_name, line1, city, state, zip_code. Return one
row for each address for the customer with an email address of
allan.sherwood@yahoo.com ***';

USE my_guitar_shop;

SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers c
JOIN addresses a ON c.email_address = 'allan.sherwood@yahoo.com';

SELECT '';
SELECT '' AS '*** Task 1, Q3. MGS Exercise 4-4 [5 points]
***';
SELECT '' AS '*** Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products
tables. This statement should return these columns: last_name, first_name, order_date,
product_name, item_price, discount_amount, and quantity. Use aliases for the tables.
Sort the final result set by last_name, order_date, and product_name.
***';

USE my_guitar_shop;

SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, 
oi.discount_amount, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
ORDER BY c.last_name, o.order_date, p.product_name;

SELECT '';
SELECT '' AS '*** Task 1, Q4. MGS Exercise 4-5 [5 points]
***';
SELECT '' AS '*** Write a SELECT statement that returns the product_id, product_name and list_price
columns from the Products table. Return one row for each product that has the same list
price as another product.
***';

USE my_guitar_shop;

SELECT product_id, product_name, list_price
FROM products
WHERE list_price = list_price;

SELECT '';
SELECT '' AS '*** Task 1, Q5. MGS Exercise 4-7 [5 points]
***';
SELECT '' AS '*** Use the union operator to generate a result set consisting of three columns from the
				Orders table:
				ship_status: A calculated column that contains a value of SHIPPED or NOT SHIPPED
				order_id: The order_id column
				order_date: The order_date column
				If the order has a value in the ship_date column, the ship_status column should contain
				a value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED. Sort the
				final result set by order_date.
***';

USE my_guitar_shop;

SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date;


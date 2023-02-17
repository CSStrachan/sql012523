SELECT '' AS 'Chad Strachan';
SELECT '' AS 'PROG2220: Section 3';
SELECT '' AS 'Assignment 1: Task 2';

SELECT SYSDATE() AS 'Current System Date';

SELECT '';
SELECT '' AS '*** Task 2, Q1. MGS Exercise 3-1 [2 points] ***';
SELECT '' AS '*** Write a SELECT statement that returns four columns: product_code, 
				product_name, list_price and discount_percent in descending order of list price ***';

USE my_guitar_shop;

SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY list_price DESC;

SELECT '';
SELECT '' AS '*** Task 2, Q2. MGS Exercise 3-3 [5 points] ***';
SELECT '' AS '*** Write a SELECT statement that returns these columns from the Products table: 
				product_name, list_price, and date_added. 
				Return only the rows with a list price that is greater than 500 and less than 2000. 
				Sort the result set in descending sequence by the date_added column. ***';

USE my_guitar_shop;

SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 and list_price < 2000
ORDER BY date_added DESC;

SELECT '';
SELECT '' AS '*** Task 2, Q3.  MGS Exercise 3-5 [5 points] ***';
SELECT '' AS '*** Write a SELECT statement that returns these column names from the Order_Items table: 
				item_id, item_price, discount_amount, quantity, price_total (i.e., multiply the item price by the quantity), 
				discount_total (i.e., multiply the discount amount by the quantity), item_total (i.e., subtract the discount amount from the item price and then multiply by the quantity). 
				Only return rows where the item_total is greater than 500. Sort the result set by item total in descending sequence. ***';

USE my_guitar_shop;

SELECT item_id, 
item_price, 
discount_amount, 
quantity, 
(item_price*quantity) AS price_total,
(discount_amount*quantity) AS discount_total,
((item_price - discount_amount) * quantity) AS item_total
FROM order_items
WHERE ((item_price - discount_amount) * quantity) > 500
ORDER BY ((item_price - discount_amount) * quantity) DESC;

SELECT '';
SELECT '' AS '*** Task 2, Q4. MGS Exercise 3-6 [5 points]***';
SELECT '' AS '*** Write a SELECT statement that returns these columns from the Orders table: 
				order_id, order_date, ship_date. Return only the rows where the ship_date column contains a null value. ***';

USE my_guitar_shop;

SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS NULL;

SELECT '';
SELECT '' AS '*** Task 2, Q5. MGS Exercise 3-8 [3 points] ***';
SELECT '' AS '*** Write a SELECT statement without a FROM clause that creates a row with these columns:
				price: 100 (dollars)
				tax_rate: .07 (7 percent)
				tax_amount: price multiplied by the tax rate
				total: price plus the tax amount
				To calculate the fourth column, add the expressions you used for the first and third columns. ***';

SELECT 100 AS price, 
0.07 AS tax_rate, 
(100*0.07) AS tax_amount,
( 100 +(100*0.07)) AS total
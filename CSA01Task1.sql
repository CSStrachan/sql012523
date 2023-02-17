SELECT '' AS 'Chad Strachan';
SELECT '' AS 'PROG2220: Section 3';
SELECT '' AS 'Assignment 1: Task 1';

SELECT SYSDATE() AS 'Current System Date';

SELECT '';
SELECT '' AS '*** Task 1, Q1. Textbook Exercise 3-06 (page 111) [2 points]***';
SELECT '' AS '*** This task is to fetch all data from the list of vendors.
				Important: Append "LIMIT 10" to your solution. ***';

USE ap;
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name, vendor_contact_first_name ASC
Limit 10;

SELECT '';
SELECT '' AS '*** Task 1, Q2. Textbook Exercise 3-07 (page 111) [1 point] ***';
SELECT '' AS '*** This task is to fetch all vendor names from the list of vendors. 
				Only names beginning with the letters A, B, C and E should be in the returned column
				Replace the word "join" to "concatenates". ***';

USE ap;
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
WHERE vendor_contact_last_name < 'D' OR vendor_contact_last_name LIKE 'E%'
ORDER BY vendor_contact_last_name, vendor_contact_first_name;


SELECT '';
SELECT '' AS '*** Task #, Q3. Textbook Exercise 3-08 (page 111) [1 point] ***';
SELECT '' AS '*** This task is to write a SELECT statement that returns these columns names and data from the Invoices table:
				Due Date The invoice_due_date_column
				Invoice Total The invoice_total column
				10% of the value of invoice_total
				Plus 10% The value of the invoice_total plus 10%. ***';

USE ap;
SELECT invoice_due_date, invoice_total, 0.1 * invoice_total AS '10%', 1.1 * invoice_total AS 'Plus 10%'
FROM invoices
WHERE invoice_total >= 500 AND invoice_total < 1000
ORDER BY invoice_due_date DESC;

SELECT '';
SELECT '' AS '*** Task #, Q4. Textbook Exercise 3-09 (page 111) [2 points] ***';
SELECT '' AS '*** Write a SELECT statement that returns these columns from the Invoices table:
				invoice_number
				invoice_total
				payment_credit_total - Sum of the payment_total and credit_total columns
				balance_due - The invoice_total column minus the payment_total and credit_total columns. 
				Return only invoices that have a balance due thats greater than $50.
                Sort the result set balance due in descending sequence.
                Use the Limit clause so the result set contains only the rows with the 5 largest balances.***';

USE ap;
SELECT invoice_number, 
invoice_total, 
payment_total + credit_total AS payment_credit_total, 
invoice_total - payment_total - credit_total AS balance_due
FROM invoices
WHERE payment_total + credit_total > 50
LIMIT 5;

SELECT '';
SELECT '' AS '*** Task #, Q5. Textbook Exercise 3-10 (page 112) [2 points] ***';
SELECT '' AS '*** Write a SELECT statement that returns these columns from the Invoices table:
				invoice_number
                invoice_date
                balance_due - The invoice_total minus the payment_total and credit_total columns
                payment_date - The payment_date column***';

USE ap;
SELECT invoice_number,
invoice_date,
invoice_total - payment_total - credit_total AS balance_due,
payment_date
FROM invoices
WHERE payment_date IS NULL;


SELECT '';
SELECT '' AS '*** Task 1, Q6. Textbook Exercise 3-11 (page 112) [1 point] ***';
SELECT '' AS '*** Write a SELECT statement without a FROM clause that uses the CURRRENT_DATE function to return
				the current date in this format:
				mm-dd-yyyy
                This displays the month, day and four-digit year of the current date
                Give this column an alias of CURRENT_DATE ***';

USE ap;
SELECT date_format(CURRENT_DATE, "%m %d %Y") AS 'CURRENT_DATE';

SELECT '';
SELECT '' AS '*** Task 1, Q7. Textbook Exercise 3-12 (page 112) [1 point] ***';
SELECT '' AS '*** Write a SELECT statement without a FROM clause that creates a row with these columns:
				starting_principal - Starting principal of $50,000
                interest - 6.5% of the principal
                principal_plus_interest - The principal plus the interest ***';

USE ap;
SELECT 50000 AS starting_principal,
50000*0.065 AS interest,
50000 + (50000*0.065) AS principal_plus_interest
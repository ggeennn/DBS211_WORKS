-- ***********************
-- Name: Yicheng Wang
-- ID: 150868206
-- Name: Ivy Nicole Dioso
-- ID: 190130237
-- Name: Sanjil Amgain
-- ID: 166534230
-- Date: 2025/02/06
-- Purpose: Lab 05 DBS211
-- ***********************

-- Q1.a
SELECT e.employeenumber, e.firstname, e.lastname, o.city, o.phone, o.postalcode
FROM employees e, offices o
WHERE e.officecode = o.officecode 
AND o.country = 'France';

-- Q1.b
SELECT e.employeenumber, e.firstname, e.lastname, o.city, o.phone, o.postalcode
FROM employees e
JOIN offices o USING (officecode)
WHERE o.country = 'France';

-- Q2.
SELECT customernumber, c.customername, TO_CHAR(p.paymentdate, 'Mon DD, YYYY') paymentdate, p.amount
FROM customers c
JOIN payments p USING (customernumber)
WHERE c.country = 'Canada'
ORDER BY customernumber;

-- Q3. 
SELECT c.customernumber, c.customername
FROM customers c
LEFT JOIN payments p ON c.customernumber = p.customernumber
WHERE c.country = 'USA'
AND p.checknumber IS NULL
ORDER BY c.customernumber;

-- Q4.a
CREATE VIEW vwCustomerOrder AS
SELECT o.customernumber, ordernumber, o.orderdate, p.productname, od.quantityordered, od.priceeach
FROM orders o
JOIN orderdetails od USING (ordernumber)
JOIN products p USING (productcode);
-- Q4.b
SELECT * 
FROM vwCustomerOrder;

-- Q5
SELECT *
FROM vwCustomerOrder
WHERE customernumber = 124
ORDER BY ordernumber, orderlinenumber;
--ORA-00904: "ORDERLINENUMBER": invalid identifier

SELECT v.*, od.orderlinenumber  
FROM vwCustomerOrder v
JOIN orderdetails od USING (ordernumber)
WHERE customernumber = 124
ORDER BY ordernumber, od.orderlinenumber;

-- Q6
SELECT customernumber, contactfirstname, contactlastname, phone, creditlimit
FROM customers
LEFT JOIN orders o USING (customernumber)
WHERE o.ordernumber IS NULL;

-- Q7
CREATE VIEW vwEmployeeManager AS
SELECT e.*, 
       m.firstname managerfirstname, 
       m.lastname managerlastname
FROM employees e
LEFT JOIN employees m ON e.reportsto = m.employeenumber;

-- Q8
RENAME vwEmployeeManager TO employee_manager;
CREATE OR REPLACE VIEW employee_manager AS
SELECT e.*, 
       m.firstname managerfirstname, 
       m.lastname managerlastname
FROM employees e
LEFT JOIN employees m ON e.reportsto = m.employeenumber
WHERE m.employeenumber IS NOT NULL;

-- Q9
RENAME vwCustomerOrder TO customer_order;
DROP VIEW customer_order;
DROP VIEW employee_manager;

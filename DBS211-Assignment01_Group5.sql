-- *********************** 
-- Name: Yicheng Wang   
-- ID: 150868206
-- Date: 2025-01-16
-- Purpose: Assignment 01 DBS211 
-- *********************** 
 
-- Q1 SOLUTION -- 
SELECT
   e.employeenumber "Employee Number",
   e.lastname || ', ' || e.firstname "Employee Name",
   o.phone "Phone",
   e.extension "Extension",
   o.city "City",
   COALESCE(TO_CHAR(e.reportsto), 'Unknown') "Manager ID",
   COALESCE(m.lastname || m.firstname, 'Unknown') "Manager Name"
FROM
   employees e
INNER JOIN offices o ON e.officecode = o.officecode
LEFT JOIN employees m ON e.reportsTo = m.employeeNumber
WHERE
   e.reportsto IS NULL 
ORDER BY
   o.city,
   e.employeenumber;
   
-- Q2 SOLUTION
SELECT e.employeeNumber, 
       e.firstName || ' ' || e.lastName "Employee Name", 
       o.phone "Phone", 
       e.extension "Extension", 
       o.city "City"
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode 
WHERE o.city IN ('NYC', 'Tokyo', 'Paris') 
ORDER BY o.city, e.employeeNumber;
 
-- Q3 SOLUTION
SELECT e.employeeNumber "Employee Number", 
       e.lastName || ', ' || e.firstName "Employee Name", 
       o.phone "Phone", 
       e.extension "Extension", 
       o.city "City", 
       e.reportsTo "Manager ID", 
       m.firstName || ' ' || m.lastName "Manager Name"
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode 
LEFT JOIN employees m ON e.reportsTo = m.employeeNumber
WHERE o.city IN ('NYC', 'Tokyo', 'Paris') 
ORDER BY o.city, e.employeeNumber;
 
-- Q4 SOLUTION
SELECT e.employeeNumber "Manager ID", 
       e.firstName || ' ' || e.lastName "Manager Name", 
       o.country, 
       CASE 
           WHEN e.reportsTo IS NOT NULL THEN 
               'Reports to ' || m.firstName || ' ' || m.lastName || '(' || m.jobTitle || ')' 
           ELSE 
               'Does not report to anyone' 
       END "Reports to"
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode
LEFT JOIN employees m ON e.reportsTo = m.employeeNumber
WHERE m.jobTitle = 'VP Sales' OR e.jobTitle ='VP Sales' OR e.reportsTo IS NULL
ORDER BY "Manager ID";
 
-- Q5 SOLUTION
SELECT c.customerNumber, 
       c.customerName, 
       p.productCode, 
       p.msrp AS "OLD Price",
       ROUND(p.msrp * 0.9, 2) AS "New Price"
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE p.productVendor = 'Exoto Designs'
  AND od.quantityOrdered > 55
ORDER BY c.customerNumber;

-- Q6a SOLUTION
SELECT DISTINCT c.customerNumber, 
                c.customerName
FROM customers c
JOIN orders o1 ON c.customerNumber = o1.customerNumber
JOIN orders o2 ON c.customerNumber = o2.customerNumber 
                AND o1.orderNumber != o2.orderNumber  
ORDER BY c.customerNumber; 

-- Q6b SOLUTION
SELECT c.customerNumber, 
       c.customerName
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber, c.customerName 
HAVING COUNT(o.orderNumber) = 1 
ORDER BY c.customerNumber, c.customerName;











































































--unfinished

-- Q7 SOLUTION
CREATE VIEW emp_vu_off_1 AS
SELECT employeeNumber AS EMPNO, 
       firstName || ' ' || lastName AS EMPLOYEE,
       officeCode AS OFFNO
FROM employees
WHERE officeCode = '1';

-- Q8 SOLUTION
SELECT 
    INITCAP(lastName) AS Name,  
    LENGTH(lastName) AS Length   
FROM 
    employees
WHERE 
    lastName LIKE 'J%' OR 
    lastName LIKE 'A%' OR 
    lastName LIKE 'M%'  
ORDER BY 
    lastName;  
 
-- Q9 SOLUTION
SELECT 
    c.customerName, 
    p.paymentDate, 
    p.amount, 
    od.productCode, 
    od.quantityOrdered
FROM 
    payments p
JOIN 
    orders o ON p.customerNumber = o.customerNumber
JOIN 
    orderdetails od ON o.orderNumber = od.orderNumber
JOIN 
    customers c ON p.customerNumber = c.customerNumber
ORDER BY 
    c.customerName, p.paymentDate;

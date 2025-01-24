-- *********************** 
-- Name: Yicheng Wang   
-- ID: 150868206
-- Date: 2025-01-16
-- Purpose: Assignment 01 DBS211 
-- *********************** 
 
-- Q1 SOLUTION -- 
SELECT
   e.employeenumber,
   e.lastname || ' ' || e.firstname "Employee Name",
   o.phone,
   e.extension,
   o.city,
   e.reportsto AS managerid,
   (
      SELECT
         lastname || ' ' || firstname 
      FROM
         employees 
      WHERE
         employeenumber = e.reportsto
   )
   AS managername 
FROM
   employees e,
   offices o 
WHERE
   e.officecode = o.officecode 
   AND e.reportsto IS NULL 
ORDER BY
   o.city,
   e.employeenumber;
   
-- Q2 SOLUTION
SELECT e.employeeNumber, 
       e.firstName || ' ' || e.lastName AS employeeName, 
       o.phone, 
       e.extension, 
       o.city
FROM employees e, offices o 
WHERE e.officeCode = o.officeCode 
AND o.city IN ('NYC', 'Tokyo', 'Paris') 
ORDER BY o.city, e.employeeNumber;
 
-- Q3 SOLUTION
SELECT e.employeeNumber AS "Employee Number", 
       e.lastName || ' ' || e.firstName AS "Employee Name", 
       o.phone AS "Phone", 
       e.extension AS "Extension", 
       o.city AS "City", 
       e.reportsTo AS "Manager ID", 
       (SELECT firstName || ' ' || lastName FROM employees WHERE employeeNumber = e.reportsTo) AS "Manager Name"
FROM employees e, offices o 
WHERE e.officeCode = o.officeCode 
AND o.city IN ('NYC', 'Tokyo', 'Paris') 
ORDER BY o.city, e.employeeNumber;
 
-- Q4 SOLUTION
SELECT e.employeeNumber AS "Manager ID", 
       e.firstName || ' ' || e.lastName AS "Manager Name", 
       o.country, 
       CASE 
           WHEN e.reportsTo IS NOT NULL THEN 
               'Reports to ' || 
               (SELECT m.firstName || ' ' || m.lastName || ' (' || m.jobTitle || ')' 
                FROM employees m 
                WHERE m.employeeNumber = e.reportsTo)
           ELSE 
               'Does not report to anyone' 
       END AS "Reports to"
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
WHERE (e.reportsTo=1056 OR e.reportsTo IS NULL) OR e.jobTitle ='VP Sales'
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

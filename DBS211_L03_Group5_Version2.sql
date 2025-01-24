-- ***********************
-- Name: Yicheng Wang
-- ID: 150868206
-- Name: Ivy Nicole Dioso
-- ID: 190130237
-- Name: Sanjil Amgain
-- ID: 166534230
-- Date: 2025/1/23
-- Purpose: Lab 03 DBS211
-- ***********************
-- Q1 
SELECT
   officecode,
   city,
   state,
   country,
   phone 
FROM
   offices;
-- Q2
SELECT
   employeenumber,
   firstname,
   lastname,
   extension 
FROM
   employees 
WHERE
   officecode = 1 
ORDER BY
   employeenumber;
-- Q3
SELECT
   customernumber,
   customername,
   contactfirstname,
   contactlastname,
   phone 
FROM
   customers 
WHERE
   city = 'Paris' 
ORDER BY
   customernumber;
-- Q4
SELECT
   customernumber "Customer Number",
   customername "Customer Name",
   contactlastname || ', ' || contactfirstname "Contact Name",
   phone "Phone" 
FROM
   customers 
WHERE
   country = 'Canada' 
ORDER BY
   customername;
-- Q5
SELECT DISTINCT
   customernumber 
FROM
   payments 
ORDER BY
   customernumber
FETCH FIRST 10 ROWS ONLY;
-- Q6
SELECT
   customernumber,
   checknumber,
   amount 
FROM
   payments 
WHERE
   amount NOT BETWEEN 1500 AND 120000 
ORDER BY
   amount DESC;
-- Q7
SELECT
   ordernumber,
   orderdate,
   status,
   customernumber 
FROM
   orders 
WHERE
   status = 'Cancelled' 
ORDER BY
   orderdate;
-- Q8
SELECT
   productcode,
   productname,
   buyprice,
   msrp,
   (
      msrp - buyprice
   )
   markup,
   ROUND((100 * (msrp - buyprice) / buyprice), 1) percmarkup 
FROM
   products 
WHERE
   (
      100 * (msrp - buyprice) / buyprice
   )
   > 140 
ORDER BY
   percmarkup;
-- Q9
SELECT
   productcode,
   productname,
   quantityinstock 
FROM
   products 
WHERE
   LOWER(productname) LIKE '%co%' 
ORDER BY
   quantityinstock;
-- Q10
SELECT
   customernumber,
   contactfirstname,
   contactlastname 
FROM
   customers 
WHERE
   LOWER(contactfirstname) LIKE 's%e%' 
ORDER BY
   customernumber;